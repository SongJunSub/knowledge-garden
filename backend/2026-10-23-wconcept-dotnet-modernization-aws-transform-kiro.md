---
title: "W컨셥, AWS Transform과 Kiro로 .NET 10까지 대규모 현대화 여정 (AWS Korea) — 160만 라인을 7주, 숫자가 맞다면 사람이 끝없이 반복 설득해야 했던 COM+ 분리를 미리 끝낸 덕"
source_title: "W컨셥, AWS Transform과 Kiro로 .NET 10까지 대규모 현대화 여정"
source_url: "https://aws.amazon.com/ko/blogs/tech/wconcept-dotnet-modernization-aws-transform-kiro/"
source_name: "AWS Korea Tech Blog"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/wconcept-dotnet-modernization-aws-transform-kiro/"
published_at: "확인 불가"
summarized_at: "2026-10-23"
category: "backend"
tags: ["dotnet", "legacy-modernization", "aws-transform", "kiro", "linux-migration", "com-plus", "aws-korea"]
---

# W컨셥, AWS Transform과 Kiro로 .NET 10까지 대규모 현대화 여정

> 출처: [W컨셥, AWS Transform과 Kiro로 .NET 10까지 대규모 현대화 여정](https://aws.amazon.com/ko/blogs/tech/wconcept-dotnet-modernization-aws-transform-kiro/) (AWS Korea Tech Blog) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-23
>
> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(`ENOTFOUND`)되어 원문을 직접 열람하지 못했다. WebSearch로 "W컨셥"(또는 "W컨셉") 고유의 .NET 현대화 사례를 찾지 못했다 — AWS의 2026년 4월 공지("AWS Transform이 Kiro·VS Code에서 사용 가능")는 교차확인됐지만, 그 공지가 예로 든 공통 변환 패턴은 ***Java, Python, Node.js 버전 업그레이드와 AWS SDK 마이그레이션***이었고 **.NET 전환을 직접 언급한 자료는 찾지 못했다.** 즉 "AWS Transform + Kiro"라는 조합 자체는 실재하고 날짜도 맞지만, 이 글이 서술하는 ***.NET 10·Linux 전환이라는 구체적 워크로드***와 ***160만 라인·7주·W컨셥이라는 고유명사·수치***는 Slack 발췌 세 줄이 유일한 근거다. 저자·발행일·GeekNews 경유 여부(이 글은 GeekNews가 아니라 TechArticles 직접 공유다)도 확인 불가.

## 한 줄 요약

**패션 커머스 W컨셥이 160만 라인 규모의 레거시 .NET 애플리케이션을 .NET 10·Linux 기반으로 전환하면서, AWS Transform과 AI 코딩 도구 Kiro를 투입해 코드 변환부터 컨테이너 배포까지 7주 만에 끝냈다고 주장한다 — 핵심은 AI 도구 자체가 아니라, 전환 작업을 시작하기 전에 COM+ 모듈을 API로 먼저 떼어내고 라이브러리를 표준화해 Linux 전환의 "기술적 지뢰"를 사전에 제거해둔 준비 작업이다.**

## 핵심 포인트

- **AI 도구보다 먼저 온 건 "분리" 작업** — Slack 발췌가 명시하듯, ***사전에 COM+ 모듈을 API로 분리하고 라이브러리를 표준화***한 게 먼저다. COM+는 Windows 전용 컴포넌트 기술이라 Linux로 못 간다 — 그걸 API 경계 뒤로 숨겨두지 않았다면, AWS Transform이나 Kiro가 아무리 코드를 잘 변환해도 "Windows에 묶인 핵심 하나" 때문에 전체 전환이 막혔을 것이다. ***자동화 도구가 효과를 내려면, 그 전에 사람이 아키텍처 경계를 먼저 그려줘야 한다***는 패턴이다.
- **AWS Transform + Kiro — IDE와 콘솔을 넘나드는 전환 작업** — 교차확인한 AWS 공지에 따르면 AWS Transform은 2026년 4월부터 Kiro·VS Code에서 직접 쓸 수 있게 됐고, ***개발자가 IDE에서 작업을 시작하고 웹 콘솔에서 진행 상황을 확인하며, 작업 상태와 컨텍스트를 모든 인터페이스에서 공유***하는 구조다. 다만 같은 공지가 예로 든 지원 패턴은 Java·Python·Node.js 버전 업그레이드·SDK 마이그레이션이라, W컨셥의 .NET 워크로드가 그 공식 지원 범위에 명시적으로 들어있는지는 확인하지 못했다.
- **7주라는 기간, 분모를 모른다** — "7주 만에 코드 변환부터 컨테이너 배포까지 완료"라는 수치는 Slack 발췌 유일 근거다. 160만 라인 전체가 한 번에 자동 변환됐는지, COM+ 분리 같은 사전 작업 기간이 이 7주에 포함되는지 제외되는지 구분하지 못한다.
- **S3·CloudFront 도입으로 파일 업로드 방식 개선** — 운영 효율·비용 절감을 동시에 달성했다고 서술하지만, 구체적 비용 절감 수치는 확인하지 못했다.

## 인상 깊은 문장

> "사전에 COM+ 모듈을 API로 분리하고 라이브러리를 표준화하여 Linux 전환의 기술적 난관을 미리 제거함" (Slack 발췌 요지)

## 댓글

**이 글은 GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글 수·HN/Lobsters 큐레이션 개념이 적용되지 않는다.** 정직하게 짚을 점: AWS 자사 기술 블로그이자 AWS Transform·Kiro라는 AWS 자체 제품을 홍보하는 고객 사례(customer story) 형식이라, "7주"·"160만 라인" 같은 수치는 AWS와 고객사 양쪽의 이해관계(제품 성공 사례로 포장할 동기)가 있을 수 있다는 걸 감안해야 한다. 실패하거나 지연된 세부 과정이 얼마나 생략됐는지는 원문 미대조라 알 수 없다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-08-26-eve-online-python3-migration]]이 보여준 "기계가 못 푸는 건 사람이 한 줄씩 본다"는 접근과, 이 글이 주장하는 "AI 도구로 7주 만에 끝냈다"는 속도감이 정면으로 대비된다.** EVE Online은 240만 줄 중 95.9%는 양쪽 버전에서 그냥 컴파일됐지만, 결과가 달라지는 약 2만 줄은 ***사람의 판단이 필요해 자동화가 아예 손대지 않는다***고 명시했다. W컨셥 사례는 그 "사람이 판단해야 하는 잔여분"이 얼마나 되는지, AI가 정말 그 영역까지 들어갔는지 밝히지 않은 채 "7주 완료"라는 총괄 수치만 제시한다 — 두 글을 나란히 놓으면, "AI 도구가 빨랐다"는 주장을 평가할 때 EVE Online이 공개한 것 같은 ***잔여 수작업 비율***을 먼저 물어봐야 한다는 교훈이 선명해진다.

**핵심 전이 2 — [[2026-10-08-netmarble-nexus-kiro-adoption-journey]]와 같은 AWS Korea 블로그의 Kiro 도입 사례 시리즈다.** 그 노트 역시 "넷마블넥서스 고유의 구체 수치(생산성 변화·투입 인원·프로젝트 규모)는 확인 불가"라고 정직하게 밝혔는데, 이번 W컨셥 글도 같은 패턴을 반복한다 — ***AWS Korea 블로그가 Kiro 도입 성공 사례를 연속으로 publish하는 시리즈***라는 정황이 쌓일수록, 개별 사례의 수치보다는 "AWS가 Kiro를 어떤 업종·워크로드에 공격적으로 밀고 있는가"라는 패턴 자체를 더 신뢰 있게 읽을 수 있다(게임 개발팀 도입기 다음은 레거시 .NET 마이그레이션).

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성 있음 — 레거시 현대화 순서 원칙은 온다에도 그대로 적용된다.** CRS·PMS 연동 레거시 컴포넌트가 있다면, ***AI 코딩 도구를 투입하기 전에 먼저 사람이 할 일은 "플랫폼에 묶인 부분을 API 경계로 분리하는 것"***이라는 이 글의 핵심 순서(COM+ → API 분리 → 자동 변환)는 그대로 참고할 만하다. 다만 "7주"라는 속도 주장은 검증되지 않았으므로, 실제 일정 추정의 근거로는 쓰지 않는다.

## 연관 자료

- [[2026-08-26-eve-online-python3-migration]] — 같은 "대규모 레거시 전환"이지만 잔여 수작업 비율을 정직하게 공개한 대조 사례
- [[2026-10-08-netmarble-nexus-kiro-adoption-journey]] — 같은 AWS Korea Kiro 사례 시리즈, 수치 미확인이라는 같은 한계

## 한 달 뒤 회고

2026-11-23 즈음, `aws.amazon.com` egress가 풀리면 원문을 직접 대조해 "7주"의 범위(사전 분리 작업 포함 여부)와 실제 변환 자동화 비율(몇 %가 Kiro/AWS Transform이 자동 처리했는지)을 확인한다.
