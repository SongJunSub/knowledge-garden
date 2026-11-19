---
title: "Reticle, AI 코딩 에이전트가 앱을 직접 검증하는 SDK 계측 도구(GeekNews, UI 직접조작 묘사는 미확인)"
source_title: "Reticle - AI 코딩 에이전트가 웹/데스크톱 앱을 직접 조작해 검증하는 도구"
source_url: "https://devpost.com/software/reticle"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37440"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "ai"
tags: ["ai-agent", "verification", "testing", "mcp", "reticle", "source-limitation"]
---

# Reticle, AI 코딩 에이전트가 앱을 직접 검증하는 SDK 계측 도구

> 출처: [Reticle](https://news.hada.io/topic?id=37440) (GeekNews) · 정리일 2026-11-19

## 한 줄 요약

**Reticle은 코딩 에이전트가 수정한 기능을 스크린샷이 아니라 앱에 심은 개발용 SDK로 계측해, API 요청·콘솔 오류·앱 상태까지 같이 확인하고 통과/실패/판단불가를 근거와 함께 반환하는 오픈소스 검증 레이어다.**

## 핵심 포인트

- Reticle은 MCP로 호출되는 오픈소스 "코딩 에이전트용 검증 레이어"로, 앱에 심은 개발 전용 SDK가 런타임에서 네트워크 요청·콘솔 에러·앱 상태·라우팅·퍼시스턴스를 수집한다.
- 결제 버튼을 한 번 눌렀을 때 주문 요청이 두 번 나가는 문제처럼, 클릭 이후 연쇄적으로 발생하는 부작용을 잡을 수 있다고 소개된다.
- 각 검증 항목은 통과/실패/판단불가 중 하나를 반환하고, 실패 시 근거가 된 요청·조건을 남기며 소스 위치가 연결되면 파일·줄 번호까지 표시한다.
- 검증한 작업을 플로우로 저장해 이후에는 AI 모델 호출 없이 재실행할 수 있다.
- ***Slack 발췌의 "버튼을 누르고 값을 입력해" 같은 직접 UI 조작 묘사는 Reticle 자체 1차 소스(AGENTS.md)에서 재확인되지 않는다*** — SDK 계측 방식과, 유사 범주의 다른 도구(화면을 직접 클릭하는 방식)가 섞여 서술됐을 가능성이 있다.

## 인상 깊은 문장

> "The app embeds a development-only SDK" — Reticle AGENTS.md. 화면을 찍어 보는 대신 앱 내부에 계측을 심는다는 설계 차별점이다.

## 댓글

GeekNews 댓글 수는 확인하지 못했다(원문 미확인). **news.hada.io가 이 세션에서 접속 차단**되어 원문 토론은 못 봤고, WebSearch로 Reticle 자체의 Devpost·AGENTS.md는 교차확인했다. 다만 Slack 발췌가 서술한 "직접 클릭·입력" 표현이 실제 메커니즘(SDK 계측)과 정확히 일치하는지는 확인하지 못해, 이 부분은 과장되거나 다른 도구와 혼동됐을 가능성을 열어둔다.

## 내 생각 · 적용점

### 핵심 전이 — "실행 결과를 보고 판단"이 코드 리뷰에서 런타임 검증으로 한 단계 더 내려왔다

[[2026-11-18-claude-code-team-verification-approach]]가 "신뢰는 AI가 맞게 짰다는 가정이 아니라 실행해서 확인했다는 절차에서 나온다"고 짚었던 원칙을, Reticle은 코드 리뷰 단계가 아니라 **실제로 돌아가는 앱 내부**에서 구현한다. [[2026-10-16-addy-osmani-agentic-verification-e2e-property-tests]]의 E2E 검증 흐름과 같은 축이지만, 스크린샷 대신 SDK 계측이라는 더 구조화된 증거를 쓴다는 점이 다르다.

### 적용점

통과/실패/판단불가 3분류와 "실패 근거를 파일·줄 번호로 남긴다"는 설계는, AI 에이전트의 검증 결과를 사람이 다시 검증하는 비용을 줄이는 실용적 패턴이다. 다만 아직 초기 도구라 프로덕션 신뢰도는 별도로 검증해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 예약·결제 플로우에서 "버튼 한 번에 요청이 중복 발생"하는 유형의 버그는 CRS에서도 치명적이다. SDK 계측으로 API 요청 중복까지 잡아내는 검증 레이어 개념은 참고할 만하지만, 도구 자체의 성숙도와 UI 조작 메커니즘의 정확한 동작은 더 확인이 필요하다.

## 연관 자료

- [[2026-10-16-addy-osmani-agentic-verification-e2e-property-tests]] — 코딩 에이전트 출력을 E2E·속성 테스트로 검증하는 같은 축
- [[2026-11-18-claude-code-team-verification-approach]] — "실행해서 확인"이라는 같은 원칙의 상위 버전

## 한 달 뒤 회고

2026-12-19 즈음 — Reticle의 UI 조작 메커니즘(SDK 계측 vs 직접 클릭)이 실제로 어느 쪽인지, 프로덕션 도입 사례가 나왔는지 확인.
