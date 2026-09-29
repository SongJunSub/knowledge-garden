---
title: "SageMaker Studio에서 TIP와 S3 Access Grants를 활용한 Athena 쿼리 실행하기 (AWS 한국 기술 블로그) — 공유 컴퓨팅 세션 뒤에서도 '누가' 쿼리했는지가 CloudTrail onBehalfOf 한 필드로 드러난다"
source_title: "SageMaker Studio에서 TIP와 S3 Access Grants를 활용한 Athena 쿼리 실행하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/sagemakerstudio-tip-accessgrants-athena/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (원문 접근 차단으로 미확인)"
summarized_at: "2026-09-29"
category: "backend"
tags: ["aws", "sagemaker", "trusted-identity-propagation", "s3-access-grants", "lake-formation", "athena", "cloudtrail", "access-control", "audit"]
---

# SageMaker Studio에서 TIP와 S3 Access Grants를 활용한 Athena 쿼리 실행하기 (AWS 한국 기술 블로그)

> 출처: [SageMaker Studio에서 TIP와 S3 Access Grants를 활용한 Athena 쿼리 실행하기](https://aws.amazon.com/ko/blogs/tech/sagemakerstudio-tip-accessgrants-athena/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유(GeekNews 아님) · 정리일 2026-09-29

> **출처 한계(큼)**: `aws.amazon.com`이 이번 세션에서 egress 프록시로 전면 차단(`EGRESS_BLOCKED`)돼 원문을 직접 열람하지 못했다. 대신 **AWS 공식 문서(docs.aws.amazon.com)와 2025-08-13 AWS What's New 발표, 그리고 이를 재게시한 HKU/Dataforcee 등 3자 사이트**를 WebSearch로 교차확인해 TIP(Trusted Identity Propagation)·S3 Access Grants·CloudTrail `onBehalfOf` 필드가 **실재하는 AWS 공식 기능**임을 확인했다. 다만 이 특정 한국어 블로그 글이 실제로 다룬 아키텍처 다이어그램, 코드/CLI 예제, 실습 순서, 저자, 발행일은 원문 없이 확인하지 못했다 — 아래는 **공식 기능 설명(깊고 검증됨)**과 **Slack 발췌(이 글 고유이지만 얕음)**를 구분해서 담는다.

## 한 줄 요약

**Amazon SageMaker Studio는 2025년 8월부터 IAM Identity Center의 Trusted Identity Propagation(TIP)을 지원해, Studio 안에서 실행되는 세션(JupyterLab·CodeEditor 등)의 동작을 실제 사람 사용자 신원까지 추적할 수 있게 됐다. 이 글은 그 TIP을 S3 Access Grants·Lake Formation과 엮어 Athena 쿼리 실행 시점까지 사용자별 세밀한 권한 제어와 CloudTrail `onBehalfOf` 필드 기반 감사 추적을 실제로 구성하는 실습형 글로 추정된다. 핵심은 "공유된 컴퓨팅 환경(Studio 도메인) 뒤에 숨어 있던 개별 사용자의 행위를, 서비스 간 호출 체인 전체에 걸쳐 사람 단위로 드러낸다"는 것.**

## 핵심 포인트

**(AWS 공식 문서로 검증 — 이 글의 배경이 되는 실재 기능)**
- **TIP(Trusted Identity Propagation)**: 2025-08-13 GA. 관리자가 SageMaker Studio 안에서 벌어진 동작을 ***IAM Identity Center의 실제 사람 사용자***까지 거슬러 추적할 수 있게 한다. Lake Formation·S3·EMR·EMR Serverless·Redshift·Athena까지 TIP이 전파된다.
- **S3 Access Grants**: ID 기반으로 S3 버킷·데이터 위치에 ***세밀한 접근 제어***를 건다. Lake Formation이나 Redshift Data API를 조합해 쓸 수도 있다 — 즉 이 글의 "세밀한 데이터 접근 제어"는 Access Grants만이 아니라 **Lake Formation과의 병행 조합**일 가능성이 높다(Slack 발췌도 둘 다 언급).
- **CloudTrail `onBehalfOf` 필드**: TIP이 활성화된 SageMaker Studio 도메인에서 호출되는 서비스는 CloudTrail 이벤트에 ***`onBehalfOf` 필드로 실제 사용자 신원***을 남긴다. 관리자는 Studio 앱(JupyterLab·CodeEditor)의 대화형/백그라운드 세션 생성까지 CloudTrail로 추적 가능하다.
- **왜 필요한가**: SageMaker Studio는 본질적으로 ***공유 컴퓨팅 환경***이다. 여러 데이터 분석가가 같은 도메인·같은 실행 역할을 쓰면, 기본 IAM만으로는 "이 Athena 쿼리를 누가 던졌는가"가 실행 역할(공용)에 가려 안 보인다. TIP+`onBehalfOf`가 그 가림을 걷어낸다.

**(Slack 발췌 확정 — 이 글 고유 정보, 마지막 문장 절단)**
- IAM Identity Center의 TIP을 통해 **SageMaker 사용자를 식별하고 권한을 관리**함.
- S3 Access Grants와 **Lake Formation을 연동**해 사용자별로 세밀한 데이터 접근 제어를 구현함.
- CloudTrail의 `onBehalfOf` 필드를 활용해 개별 사용자의 데이터 쿼리 이력을 **감사 추적**함(마지막 문장 절단 — "완벽하게"라는 수식어는 이 글의 주장이지 이 노트가 검증한 사실이 아니다).

## 인상 깊은 문장

> "onBehalfOf 필드를 활용해 개별 사용자의 데이터 쿼리 이력을 완벽하게 감사 추적함"
> (Slack TechArticles 봇 발췌, 원문 대조 불가) — **"완벽하게"라는 표현은 경계해서 읽어야 한다.** AWS 공식 문서 확인 범위에서는 `onBehalfOf`가 **TIP이 지원하는 서비스 경로**(Lake Formation·S3·EMR·EMR Serverless·Redshift·Athena)에서만 남는다. TIP 밖에서 실행 역할을 직접 assume하는 우회 경로가 있다면 그 경로의 행위는 이 필드에 잡히지 않을 가능성이 있다 — 이 글이 그 한계를 언급했는지는 확인 못했다.

## 댓글

AWS 자사 한국어 기술 블로그라 hada 댓글·HN/Lobsters 큐레이션이 원천적으로 없다(GeekNews 경유가 아니라 Slack TechArticles 봇 직링크). **검증 못한 부분**: 이 글이 실제 구축 사례(고객사·규모)를 다뤘는지 순수 기능 가이드인지, 세밀한 접근 제어의 구체 예시(어떤 컬럼/행 단위 정책), TIP 우회 경로에 대한 경고 유무, Access Grants와 Lake Formation을 함께 쓸 때의 우선순위·충돌 처리 방식은 전부 원문 없이는 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "공유 게이트웨이 뒤 개인 신원 복원"은 GS리테일 AI Gateway와 같은 문제의식, 다른 해법

**[[2026-09-08-gsretail-ai-gateway-part1-auth-routing]]**이 다룬 문제는 이것과 구조적으로 동일하다 — ***여러 팀이 공유하는 게이트웨이(당시는 Bedrock AI Gateway, 이번은 SageMaker Studio 공유 도메인)를 통과할 때, 실행 역할은 공용인데 실제 행위자는 개인이라는 간극***. GS리테일 사례는 **Virtual Key**로 팀·계정 단위 라우팅과 쿼터를 통제했고, 이 AWS 공식 기능은 **TIP+`onBehalfOf`**로 서비스 호출 체인 끝까지 사람 단위 신원을 전파한다. **전자는 "누구의 예산으로"를, 후자는 "누가 실제로"를 묻는다** — 비용 통제와 행위 감사는 같이 가지만 다른 질문이라는 걸 이 대비가 보여준다.

### 핵심 전이 2 — Com2uS Hive의 "조직 단위 접근"과 정반대 극단의 세밀도 선택

**[[2026-09-18-com2us-hive-project-access-organization]]**은 개별 사용자 권한 대신 ***조직 단위로 프로젝트·멤버를 묶어*** 관리 부담을 줄이는 설계였다. 이 AWS 사례는 정확히 반대 극단이다 — **S3 Access Grants는 ID(개인) 단위** 세밀 제어를 지향한다. 둘 다 "누가 무엇을 볼 수 있는가"를 다루지만, **Com2uS는 관리 편의를 위해 세밀도를 일부러 낮췄고, AWS TIP은 감사 요구 때문에 세밀도를 최대로 높인다.** 선택 기준은 결국 **"조직 개편이 잦은가"(그러면 조직 단위가 유리) vs "개인별 규제 책임 추적이 필요한가"(그러면 ID 단위가 필수)**로 갈린다 — 이 둘을 나란히 두니 그 갈림축이 선명해진다.

### 핵심 전이 3 — SageMaker Unified Studio 생태계 노트와의 인접

**[[2026-08-27-quicksight-segregated-network-deployment]]**도 같은 SageMaker Unified Studio(SMUS) 생태계를 다룬다 — 그쪽은 **SMUS 제한 폴더**(프로젝트 멤버 외 접근 자체를 거부)라는, 이번 TIP+Access Grants와는 다른 층위의 접근 제어였다. 두 노트를 합치면 AWS의 분석 플랫폼이 **"프로젝트 경계"(SMUS 제한 폴더)와 "개인 신원 경계"(TIP)를 이중으로 겹쳐 쓰는 방향**으로 가고 있다는 그림이 보인다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용 가능성이 높다.** 온다처럼 다수 호텔 파트너의 예약·고객 데이터를 한 분석 플랫폼에서 다루는 B2B CRS는, **"이 파티션/파트너 데이터를 누가 조회했는가"**가 계약상·규제상(개인정보보호법, 파트너 SLA) 실질적으로 요구되는 질문이다. SageMaker Studio 같은 공유 분석 환경을 쓴다면 TIP+`onBehalfOf` 패턴이 바로 참고할 아키텍처다.
- **파트너별 S3 Access Grants 적용을 검토할 만하다** — 파트너 데이터가 파티션된 S3 버킷/프리픽스에 있다면, 분석가 개인 신원 기반으로 "이 분석가는 어느 파트너의 데이터까지 볼 수 있는가"를 세밀하게 걸 수 있다.
- **경계는 "완벽한 감사"라는 표현에 대한 회의**다. TIP 경로 밖의 우회(직접 실행 역할 assume 등)가 감사에서 빠질 수 있다는 점은 이 글이 검증 못한 만큼, 도입 시 **TIP 우회 경로 자체를 차단하는 IAM 정책**을 별도로 확인해야 한다.

## 연관 자료
- [[2026-09-08-gsretail-ai-gateway-part1-auth-routing]]: *공유 게이트웨이 뒤 개인 신원 복원이라는 같은 문제, Virtual Key vs TIP*
- [[2026-09-18-com2us-hive-project-access-organization]]: *세밀도의 정반대 극단 — 조직 단위 묶음 vs 개인 ID 단위 세밀 제어*
- [[2026-08-27-quicksight-segregated-network-deployment]]: *같은 SageMaker Unified Studio 생태계, 다른 층위의 접근 경계(SMUS 제한 폴더)*

## 한 달 뒤 회고
*(2026-10-29 즈음: ①`aws.amazon.com`이 접근 가능해져 원문의 아키텍처 다이어그램·실습 코드를 확인할 수 있는지 ②TIP 우회 경로에 대한 이 글의 언급 여부 ③온다 자체 분석 플랫폼에 TIP류 개인 신원 감사 추적이 필요한지, 필요하다면 현재 어떤 방식으로 대체하고 있는지)*
