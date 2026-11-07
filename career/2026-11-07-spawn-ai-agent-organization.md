---
title: "세계에서 가장 AI에 진심인 회사를 만든 방법 (Jacob Sansbury, Spawn) — 직원 10명이 인건비의 30배를 토큰에 쓰며, PR 없이 에이전트들이 같은 코드와 제품으로 직접 협업한다"
source_title: "How I Built the Most AI-Pilled Company in the World (추정)"
source_url: "https://news.hada.io/topic?id=36728"
source_name: "Jacob Sansbury (Spawn 창업자 에세이, 2차 요약: Simon Willison · explainx.ai)"
referrer_url: "https://news.hada.io/topic?id=36728"
published_at: "확인 불가"
summarized_at: "2026-11-07"
category: "career"
tags: ["ai-agent", "startup", "spawn", "agentic-organization", "autonomy", "token-cost", "no-pr-workflow"]
---

# 세계에서 가장 AI에 진심인 회사를 만든 방법 (Jacob Sansbury, Spawn)

> 출처: [How I Built the Most AI-Pilled Company in the World (추정)](https://news.hada.io/topic?id=36728) (Jacob Sansbury · Spawn 창업자 에세이 · GeekNews) · 정리일 2026-11-07

## 한 줄 요약
**직원 10명의 게임 스타트업 Spawn은 인건비의 30배에 달하는 AI 토큰 비용을 지출하며 이름과 기억, 실제 시스템 권한을 가진 상시 에이전트 조직이 PR 없이 같은 코드와 제품을 통해 직접 협업하게 함으로써, 30일간 7만 7,000건의 코드 변경을 배포했다고 주장한다 — 단 이 수치들은 전부 창업자 자신의 자기보고다.**

## 핵심 포인트
- 직원 10명인 Spawn은 ***인건비의 30배를 AI 토큰에 지출***하며 제품을 개발, 최근 30일 동안 토큰 비용으로 310만 달러를 사용
- 개발·운영·재무를 맡는 ***상시 AI 에이전트 조직***을 운영 — 각 에이전트는 이름과 기억, 실제 시스템 권한을 갖고 담당 영역을 관리하며 하루 수천 개의 보조 에이전트를 생성해 작업
- ***PR을 없애고*** 에이전트들이 같은 코드와 실제 제품을 통해 협업 — 15분마다 전체 테스트 실행, 매시간 배포, 문제 발생 시 새 에이전트가 감지·수정하는 순환 유지
- 창업자는 이 비용 구조를 "인건비의 30배(30x payroll)"라 부르며, 무료 크레딧 없이도 Anthropic의 최상위 고객 중 하나일 것이라 주장(WebSearch 교차확인)
- "7만 7,000건의 실질적 코드 변경"에서 ***'실질적(substantial)'의 정의는 회사가 자체적으로 내린 것*** — 독립적인 검증 기준이 없음(WebSearch 교차확인)
- 비용 대비 효과를 보여주는 데이터는 없으며, 에세이의 타임라인상 모델 접근이 일시 중단됐을 때 산출물이 급감한 것으로 보여 ***단일 벤더(Anthropic) 의존 위험***을 시사(WebSearch 교차확인, Simon Willison 블로그 논평 기준)

## 인상 깊은 문장

> "직원 10명인 Spawn은 인건비의 30배를 AI 토큰에 지출하며 제품을 개발함." (Slack 발췌)

## 댓글

GeekNews 댓글 수는 `news.hada.io` egress 차단으로 확인 불가. 창업자 에세이 원문도 직접 열람하지 못해(블로그 도메인 미상, 동일 차단 가능성) WebSearch 2차 자료(Simon Willison의 논평, explainx.ai의 "claimed vs verified" 분석)로만 교차확인했다. 두 2차 자료 모두 **수치 전부가 자기보고(self-reported)이며 독립 검증이 없다는 점, "실질적 변경"의 정의가 회사 자체 기준이라는 점**을 명시적으로 지적하고 있어 — 이 노트도 같은 톤의 회의를 유지한다. "Spawn"이라는 이름을 쓰는 무관한 프로젝트(Solana 트레이딩 에이전트 플랫폼 등)가 다수 검색되어 혼동 주의가 필요했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-06-software-engineering-two-eras]]의 "PR 병목"을 아예 없애버린 극단 사례
어제 정리한 글이 "월간 PR이 11배 늘면서 병목이 코드 작성에서 협업·승인 대기로 옮겨갔다"고 진단했는데, Spawn은 그 병목 자체(PR이라는 승인 게이트)를 제거해버린 사례다. 두 노트를 나란히 읽으면 스펙트럼이 보인다 — 한쪽 끝은 "에이전트 PR이 너무 많아 사람이 못 따라간다"는 과부하, 다른 쪽 끝은 "그럼 사람의 승인 단계를 아예 빼자"는 극단. 후자의 위험(통화 계산 오류, 중복 지급 등)을 전자의 사례가 이미 경고하고 있다.

### 핵심 전이 2 — [[2026-07-24-replit-self-driving-company]]의 "방향 설정자" 담론의 더 급진적인 버전
Replit 사례는 "사람이 목적지를 정하고 에이전트가 실행한다"는 비교적 절제된 자동화였다면, Spawn은 에이전트가 이름·기억·시스템 권한을 갖고 서로 협업까지 하는 훨씬 급진적인 형태다. Replit 노트가 지적한 "자사 제품을 파는 낙관 서사"라는 한계가 Spawn에는 더 강하게 적용된다 — 창업자 자신의 에세이라는 점에서 이해관계가 명확하다.

## 호스피탈리티 / CRS 적용 포인트

적용은 멀다. CRS/PMS 연동처럼 예약 오류가 곧 초과예약·환불 분쟁으로 이어지는 도메인에서 "PR 없이 에이전트가 실제 제품으로 직접 협업"하는 구조는 위험이 너무 크다 — [[2026-11-06-software-engineering-two-eras]]가 경고한 통화 계산 오류·중복 지급 사례가 그대로 재현될 수 있는 영역이다. 다만 "에이전트별 담당 영역과 권한을 명시적으로 분리한다"는 조직 설계 아이디어 자체는 사내 백오피스 자동화에서 참고할 만한 원칙 수준으로만 남긴다.

## 연관 자료
- [[2026-11-06-software-engineering-two-eras]] — 같은 "PR 병목" 현상의 반대편 극단 사례
- [[2026-07-24-replit-self-driving-company]] — 더 절제된 형태의 "자율주행 조직" 비교
- [[2026-10-15-your-moat-is-dead-rebuild-anything]] — 재구현 비용 하락이라는 배경 위에서 "그래도 버티는 회사"를 만들려는 시도로 교차 참고 가능

## 한 달 뒤 회고
- 2026-12-07 즈음 점검: Spawn의 독립적인 외부 검증(투자자 실사, 고객 수 등)이 나왔는지, "30x payroll" 구조가 지속 가능했는지 후속 보도 확인.
