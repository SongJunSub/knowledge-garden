---
title: "CJ대한통운 해외 IDC의 AWS 전환기 2편: 컷오버와 안정화 (AWS 기술 블로그) — 기술적 난이도보다 운영 영향을 최소화하는 표준 절차가 핵심이었다"
source_title: "CJ대한통운 해외 IDC의 AWS 전환기 2편: 컷오버와 안정화"
source_url: "https://aws.amazon.com/ko/blogs/tech/cj-logistics-aws-migration-cutover-stabilization-2/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-30"
category: "architecture"
tags: ["aws", "cj-logistics", "migration", "cutover", "ads", "rds", "sql-server"]
---

# CJ대한통운 해외 IDC의 AWS 전환기 2편: 컷오버와 안정화 (AWS 기술 블로그)

> 출처: [AWS 한국 기술 블로그](https://aws.amazon.com/ko/blogs/tech/cj-logistics-aws-migration-cutover-stabilization-2/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 원글 불릿 4개 + 스레드 상세 답변 1개(끊김 있는 문단, "…안정적인 운영 환경을 확보했습니다…"에서 끊김)를 1차 자료로 썼다. hada 댓글·HN 반응은 확인 불가(AWS 자체 발표 자료, 벤더 편향 감안).

## 한 줄 요약

**CJ대한통운이 해외 IDC 인프라를 AWS로 전환하는 과정 중 실제 서버 이전과 안정화 단계를 다룬 2편이다 — 핵심은 기술적 난이도보다 운영 영향을 최소화하는 표준 절차 수립에 있었고, AWS ADS로 숨겨진 의존성을 사전에 찾아내 접속 정보 변경으로 인한 장애를 예방했다.**

## 핵심 포인트

- **운영 영향 최소화가 핵심 목표** — 온프레미스 Windows 서버와 SQL Server를 AWS로 이전하며, 기술적 난이도보다 ***운영 영향을 최소화하는 표준 절차 수립***에 중점을 뒀다.
- **ADS로 숨겨진 의존성 발견** — 복잡한 의존성 문제는 ***AWS ADS(Application Discovery Service)***를 활용해 해결했다. 기존 문서에 누락된 연계 시스템까지 파악해 접속 정보 변경으로 인한 장애를 ***사전에 방지***했다.
- **실사용량 기반 재설계로 비용 효율화** — RDS와 EC2 구성을 면밀히 비교 검토해 최적의 환경을 구축했고, 클라우드의 유연성을 활용해 ***실사용량 기반으로 자원을 재설계***함으로써 불필요한 유휴 자원을 제거하고 비용 효율성을 높였다.
- **전환 후 즉각 대응 체계** — 전환 후에는 인스턴스 유형 변경 등으로 성능 이슈에 ***즉각 대응***했으며, 실행 계획 변화에 따른 쿼리 튜닝으로 안정적인 운영 환경을 확보했다.

## 인상 깊은 문장

> "이번 프로젝트는 클라우드 전환이 단순한 인프라 이전을 넘어, 운영 효율화와 성능 최적화를 동시에 달성할 수 있는 기회임을 보여줍니다." (Slack TechArticles 스레드 답변 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단, AWS 블로그는 애초에 그런 댓글 시스템이 없음). AWS 자체 고객 사례 글이므로 벤더 편향을 감안해야 한다 — ADS가 "기존 문서에 누락된 연계 시스템까지" 얼마나 정확히 찾아내는지, 구체적 탐지율이나 실패 사례는 발췌에 없다.

## 내 생각 · 적용점

**핵심 전이 — "문서화된 의존성"과 "실제 의존성"의 간극을 도구(ADS)로 메운다는 접근은, 마이그레이션에서 가장 흔하고 위험한 실패 지점을 정확히 겨냥한다.** [[2026-10-30-cj-logistics-aws-migration-part1-landing-zone]]에서 다룬 "사전 검증"(AWS Transform MGN으로 워크로드·보안 정책 검증)이 1부의 설계 단계 리스크 관리였다면, 이 2편의 ADS 활용은 실행 단계의 리스크 관리다 — 두 편을 이어 읽으면 "설계 전 사전 검증 → 실행 전 의존성 발견"이라는 일관된 패턴(문서가 아니라 도구로 실제 상태를 확인한다)이 드러난다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성 있다. CRS/PMS 같은 레거시 시스템은 수년에 걸쳐 쌓인 연계 시스템(채널매니저, 결제 게이트웨이, 리포팅 배치 등)이 문서에 다 기록되지 않는 경우가 흔하다. 클라우드 전환이나 대규모 아키텍처 변경을 계획할 때, "문서를 믿지 말고 ADS 같은 자동 탐지 도구로 실제 연계 관계를 먼저 확인한다"는 원칙은 그대로 적용할 수 있다.

## 연관 자료

- [[2026-10-30-cj-logistics-aws-migration-part1-landing-zone]] — 같은 시리즈 1편. 의존성 분석·랜딩존 설계라는 사전 단계, 이 글은 그 설계를 실행하는 컷오버·안정화 단계.

## 한 달 뒤 회고

*(2026-11-30 즈음, `aws.amazon.com` 접근이 풀렸다면 AWS ADS의 실제 탐지 범위와 한계, 그리고 이번 사례의 구체적 비용 절감 수치를 원문으로 확인한다.)*
