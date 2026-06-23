---
title: "Slack 에이전틱 테스팅 (200+ 실험) — '테스트는 여정을 강제하고, 에이전트는 목표를 검증한다', 결정론 테스트를 대체가 아니라 피라미드 꼭대기에 추가 (AI 도구 설계 라인)"
source_title: "Agentic Testing: Where Agents Fit in the E2E Testing Stack"
source_url: "https://slack.engineering/agentic-testing-where-agents-fit-in-the-e2e-testing-stack/"
source_name: "Slack Engineering (Sergii Gorbachov) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30744"
published_at: "2026-06-23"
summarized_at: "2026-06-08"
category: "ai"
tags: ["agentic-testing", "e2e-testing", "playwright", "mcp", "test-pyramid", "back-pressure", "agent-design", "cost"]
---

# Slack 에이전틱 테스팅 (200+ 실험) — '테스트는 여정을 강제하고, 에이전트는 목표를 검증한다', 결정론 테스트를 대체가 아니라 피라미드 꼭대기에 추가 (AI 도구 설계 라인)

> 출처: [Agentic Testing: Where Agents Fit in the E2E Testing Stack](https://slack.engineering/agentic-testing-where-agents-fit-in-the-e2e-testing-stack/) (Slack Engineering, Sergii Gorbachov · GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**Slack이 *200건 이상의 에이전틱 워크플로 실험*으로 내린 결론: ***에이전트 기반 E2E 테스트는 결정론적 테스트를 "대체"하지 않고, 테스트 피라미드 "최상단"에 탐색·디버깅·복잡 동작 검증 계층으로 "추가"된다.*** 차이의 본질은 ***"Tests enforce journeys. Agents verify goals(테스트는 여정을 강제하고, 에이전트는 목표를 검증한다)"*** — 전통 E2E는 *클릭→입력→단언*의 정해진 경로를 강제하지만, 에이전트는 *목표 달성 여부*를 보고 ***"실행의 약 20%만 정확히 같은 동작 순서"***. 단, 대가가 크다: *회당 $15–30·10분+*, 복잡 흐름 실패율(MCP 0~12% < CLI 12~20% < 생성 테스트 8~48%). 결정적 통찰 둘 — ①***"비용은 모델 출력(미미)이 아니라 컨텍스트가 얼마나 빨리 쌓이고 턴이 몇 번이냐로 결정된다"*** (60~70%가 이전 브라우저 스냅샷 재전송 → 프롬프트 캐싱·컨텍스트 압축으로 개선) ②***"인프라가 중요하다(MCP vs CLI)" — 실행 환경 안정성이 모델 자체만큼 신뢰성을 좌우.*** 미래: *결정론(CI 토대) + 에이전트(꼭대기 탐색/디버깅) 혼합*.**

## 핵심 포인트

- **목표 기반 vs 여정 강제** — ***"Tests enforce journeys. Agents verify goals."*** 전통 E2E=*사전 스크립트(click→type→assert) 강제, 빠르고 싸고 반복 가능*. 에이전트=*목표 상태 도달 검증, 매 실행 다른 경로(20%만 동일 순서), 메뉴 순서/대체 UI/대체 내비 흐름 유연 탐색*. → **회귀 검사엔 결정론, 탐색·디버깅엔 에이전트**.
- **신뢰성: 단순하면 비등, 복잡하면 갈림** — *Thread Reply(단순): MCP 0%·생성 8%·CLI 12% 실패. Search Discovery(복잡): MCP ~12%·CLI ~20%·**생성 테스트 ~48%** 급락*. 생성 테스트는 *추상화 미스매치·UI 가변성으로 70~80% 진행 후 마지막 단언에서 실패*.
- **인프라가 모델만큼 중요(MCP > CLI)** — ***"Infrastructure Matters."*** MCP=*구조화된 브라우저 프리미티브·상태 관리 안정·병렬 쉬움·토큰 낮음(~3.5–3.8M)*. CLI=*매 단계 상태 재구성·인증/세션 문제·턴 많음(~85)·실패율 높음*. → [[2026-06-08-harness-engineering-jaehong]] *"하네스(실행 환경)가 성능을 좌우"*·[[2026-05-29-mcp-is-dead-cli-skills]] *MCP vs CLI 논쟁*의 실측 데이터.
- **비용의 정체 = 컨텍스트 누적, 모델 출력 아님** — ***"Cost is not driven by model output, which is negligible, but by how quickly context accumulates and how many turns the agent takes."*** 60~70%가 *이전 브라우저 스냅샷 재전송*. **모델 선택보다 실행 모델·턴 수가 토큰을 좌우 — Haiku가 Sonnet보다 더 씀(5.7M vs 3.5M, 턴이 많아서)**. 처방: 프롬프트 캐싱·컨텍스트 압축. [[2026-06-08-dont-trust-large-context-windows]] *컨텍스트 부패*와 정합.
- **테스트 피라미드 꼭대기에 "추가"** — ***"Rather than replacing existing approaches, it adds a new capability on top of them."*** Unit→Integration→E2E(결정론)→**Agentic(신규)**. 에이전트 계층 = *탐색 테스팅·flaky 워크플로 디버깅·프로덕션 버그 재현*.
- **경계(정직한 한계)** — *단일 세션 UI 워크플로에 국한*. 크로스 워크스페이스·다중 브라우저 창은 별도 난제. **만능 아님, 적용 범위를 분명히 밝힘.**

## 인상 깊은 문장

> "Tests enforce journeys. Agents verify goals."
> (테스트는 여정을 강제하고, 에이전트는 목표를 검증한다.)

> "Cost is not driven by model output, which is negligible, but by how quickly context accumulates and how many turns the agent takes."
> (비용은 (미미한) 모델 출력이 아니라, 컨텍스트가 얼마나 빨리 쌓이고 에이전트가 몇 턴을 도느냐로 결정된다.)

> "The most effective testing strategies of the future will combine both. Deterministic tests provide a stable foundation for CI, while agentic testing adds a distinct layer at the top of the testing pyramid for exploration, debugging, and validating complex behaviors."
> (미래의 가장 효과적인 테스트 전략은 둘을 결합한다. 결정론 테스트는 CI의 안정적 토대를, 에이전틱 테스팅은 피라미드 꼭대기에서 탐색·디버깅·복잡 동작 검증의 별도 계층을 더한다.)

## 댓글 (전수 확인)

> GeekNews 제출 1시간 경과 신규 토픽 — **본문+댓글 2패스 확인, 댓글 0개**(GN⁺ HN 큐레이션 미부착). 추후 보강.

## 내 생각 · 적용점

### AI 도구 설계 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *에이전트를 테스트 스택 어디에·어떻게 끼우나*라는 도구 설계·실무. 바로 앞 [[2026-06-08-harness-engineering-jaehong]](백프레셔·E2E)·[[2026-06-08-anthropic-skills-building-guide]](검증)과 같은 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — "결정론 토대 + 에이전트 꼭대기"는 그대로 내 테스트 전략

가장 전이력 높은 결론: ***대체가 아니라 추가*** — *CI 회귀는 빠르고 싼 결정론 테스트로 깔고, 비싸고 느린 에이전트는 탐색·디버깅·flaky 재현 같은 "여정이 다양해도 목표만 맞으면 되는" 곳에만*. [[2026-06-08-anthropic-skills-building-guide]] *"중요 검증은 결정적 코드로"*·[[2026-06-08-harness-engineering-jaehong]] *"백프레셔=자기검증"*과 한 줄기 — **확률적(에이전트) vs 결정적(스크립트)의 경계를 비용·신뢰성으로 긋는다**. CRS·stock-autotrader: *핵심 회귀는 JUnit/Kotest 결정론으로, 복잡 UI 흐름·재현 어려운 버그만 에이전트로*.

### 핵심 전이 2 — "비용은 컨텍스트 누적이다"가 에이전트 비용 관리의 핵심

***"비용은 모델 출력이 아니라 컨텍스트 누적·턴 수"*** + *60~70%가 스냅샷 재전송* + *Haiku가 턴이 많아 Sonnet보다 더 씀* — **싼 모델이 싸지 않을 수 있다(턴이 늘면)**. 처방이 명확: *프롬프트 캐싱·컨텍스트 압축·턴 수 줄이기*. 이건 [[2026-06-08-dont-trust-large-context-windows]] *컨텍스트 부패*·[[2026-06-08-kakaopay-clickstack-log-platform]] *"필요한 신호만"*과 같은 원리 — 내가 에이전트/LLM 비용을 볼 때 *모델 단가가 아니라 "턴·컨텍스트 증가율"을 먼저* 본다.

### 핵심 전이 3 — "인프라가 모델만큼 중요" + 만능 아님을 정직히

*MCP 0~12% vs CLI 12~20%* 는 **같은 모델이라도 실행 환경(하네스)이 신뢰성을 가른다**는 실측 — [[2026-06-08-harness-engineering-jaehong]] *"기본 하네스가 최선 아닐 수 있다"*의 데이터 확증. 그리고 저자가 *비용·실패율·적용 범위(단일 세션)를 숫자로 정직히* 밝힌 태도가 인상적 — **"AI로 다 된다"가 아니라 "여기까지, 이 비용으로, 이 신뢰성으로"** 라고 경계를 긋는 게 신뢰의 근거. 도구 도입 판단 시 *과장 없는 측정·경계 명시*를 모범으로 삼는다.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건(저자의 피라미드·실험 표는 *글의 내용*). *AI 도구 설계 라인* — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Slack Engineering (원문) · [GeekNews — 30744](https://news.hada.io/topic?id=30744)
- [[2026-06-08-harness-engineering-jaehong]] — *"백프레셔(자기검증)·인프라가 모델만큼 중요·MCP vs CLI"*
- [[2026-06-08-anthropic-skills-building-guide]]·[[2026-06-08-ai-demands-more-engineering-discipline]] — *"검증은 결정적 코드로·엄밀함의 재배치"*
- [[2026-06-08-agentic-code-review]] — *"에이전트가 검토/검증하는 패턴"*
- [[2026-05-29-mcp-is-dead-cli-skills]] — *"MCP vs CLI 도구 선택 논쟁"*
- [[2026-06-08-dont-trust-large-context-windows]]·[[2026-06-08-kakaopay-clickstack-log-platform]] — *"컨텍스트 누적이 비용/성능을 좌우"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — "결정론 토대+에이전트 꼭대기" 분리를 CRS/개인 테스트에 적용했는지, 에이전트/LLM 비용을 "턴·컨텍스트 증가율"로 봤는지, 도구 도입 시 경계를 숫자로 정직히 그었는지 기록.)*
