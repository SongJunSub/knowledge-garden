---
title: "Agents에는 더 많은 프롬프트가 아니라 제어 흐름이 필요하다"
source_title: "Agents need control flow, not more prompts"
source_url: "https://bsuh.bearblog.dev/agents-need-control-flow/"
source_name: "Brian (bsuh.bearblog.dev)"
referrer_url: "https://news.hada.io/topic?id=29296"
published_at: "2026-05-07"
summarized_at: "2026-05-09"
category: "ai"
tags: ["AI에이전트", "제어흐름", "결정성", "하네스", "오케스트레이션", "신뢰성"]
---

# Agents에는 더 많은 프롬프트가 아니라 제어 흐름이 필요하다

> 출처: [Brian — Agents need control flow, not more prompts](https://bsuh.bearblog.dev/agents-need-control-flow/) · 레퍼러: [GeekNews 29296](https://news.hada.io/topic?id=29296) · 정리일 2026-05-09

## 🔖 한 줄 요약
프롬프트에 *"반드시(MANDATORY) / 건너뛰지 말 것(DO NOT SKIP)"* 같은 표현을 쓰는 순간 **프롬프팅의 한계에 도달한 신호** — 신뢰성은 *프롬프트 정교화*가 아니라 **소프트웨어에 인코딩된 결정적 제어 흐름**으로만 만들어진다.

## 🧩 핵심 주장

### 1. 프롬프트 한계의 신호
> "If you've ever resorted to MANDATORY or DO NOT SKIP, you've hit the ceiling of prompting."

이 한 줄이 글의 전체 진단. *프롬프트 표현의 강도를 올리는 건* 신뢰성 향상이 아니라 *한계에 부딪힌 증거*.

### 2. 신뢰성 = 로직을 *런타임으로* 이동
> "Reliability requires moving logic out of prose and into runtime."

- *프롬프트(prose)*에 로직이 있으면 → 비결정적·검증 불가
- *코드(runtime)*에 로직이 있으면 → 결정적·테스트 가능
- 에이전트 = *프롬프트 체인*이 아니라 ***결정적 코드 + LLM 컴포넌트***

### 3. 3층 구조
| 층 | 역할 | 결정성 |
|---|------|--------|
| **결정적 스캐폴딩** | 제어 흐름·상태 전이·검증 체크포인트 | ✅ |
| **LLM 의사결정** | 비결정적 *컴포넌트*로 취급 | ❌ |
| **결정적 도구** | 부수 효과·외부 호출 | ✅ |

→ 비결정성을 *가운데 좁은 구간*에 가둔다. 들어가는 입력과 나오는 출력은 *결정적 게이트*가 검증.

### 4. 잘못된 오류 처리 3가지 (모두 불충분)
- **Babysitter** — 인간이 옆에 붙어 감독
- **Auditor** — 사후 검증
- **Prayer** — *잘 되겠지* 낙관주의

> "An agent without aggressive error detection is just a fast way to reach the wrong conclusion."

### 5. 댓글의 사례
- *"200개 파일을 처리하는 QA 에이전트가 30개 넘기면서부터 무너졌다"* — 프롬프트 체인의 *조합 불가능성*(non-composability) 사례
- 해법: **"결정적 하네스 + 비결정적 의사결정 + 결정적 도구"** 다층 구조

## 💭 내 생각 · 적용점

### 가든 *방법론 시리즈*의 가장 압축된 한 줄
지금까지 가든의 AI 방법론 글들이 다양한 각도에서 같은 결론에 도착했는데, 이 글이 가장 **선명한 한 줄**:

| 글 | 같은 결론의 다른 표현 |
|---|---|
| [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md) | "Agent = Model + Harness" |
| [Long-running agents](2026-05-04-long-running-agents.md) | "Brain / Hands / Session 분리" |
| [mattpocock skills](2026-04-29-mattpocock-skills-vs-mangolove.md) | "Skill = 결정적 절차" |
| [OpenAI Realtime](../architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md) | "stateless relay + stateful transceiver" |
| **이 글** | **"MANDATORY 쓰면 한계 도달"** |

이 한 줄이 *가장 액션 가능한 진단 도구* — 내 프롬프트에 *MANDATORY·DO NOT* 같은 표현이 있으면 *즉시 코드로 옮겨야 할 신호*.

### MangoLove `/strict` 자가 점검
[MangoLove strict.md](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md)를 *이 진단 기준*으로 점검해보면:
- *"반드시"·"필수"·"건너뛸 수 없음"* 표현이 다수 존재
- 이 글의 진단대로면 → *대부분이 코드(hook·skill·tool)로 옮겨야 할 후보*
- **MangoLove의 다음 진화 단계**: 프롬프트의 강제 표현을 *훅·검증 스크립트·결정적 게이트*로 대체

### *조합 불가능성*이 가장 무서운 한계
- 200 파일 → 30개에서 무너진다는 사례
- *프롬프트 체인은 길이가 늘면 신뢰성이 *기하급수적*으로 감소*
- [Long-running agents](2026-05-04-long-running-agents.md)의 *checkpoint-and-resume*이 정확히 이 문제 해결책
- → ***결정적 진행 체크포인트***가 없는 에이전트는 *길이에서 자동 실패*

### 호스피탈리티/CRS 적용
호스피탈리티 워크플로 중 *프롬프트만으로 의지*하면 안 되는 결정적(critical) 영역:

| 영역 | 결정적 코드로 옮겨야 할 부분 |
|---|---|
| **결제 처리** | 금액 계산·환불 정책·세금 *코드*. LLM은 *설명 생성*만 |
| **재고 관리** | 객실 가용성·중복 예약 방지 *DB 트랜잭션*. LLM은 *추천*만 |
| **권한 체크** | 인증·인가 *미들웨어*. LLM은 *UX 설명*만 |
| **OTA 컨트랙트** | 정산 룰·요율 적용 *결정 트리*. LLM은 *분쟁 응대 초안*만 |

→ [Willison의 *경계 조건/보안 5영역* 강제 라인 리뷰](2026-05-07-vibe-coding-agentic-engineering-converging.md)와 정확히 같은 영역이 *처음부터 결정적 코드*에 있어야 한다는 강한 형태.

### 가든 PR 헤더 스키마와 결합
[Lean Analytics 글](../engineering/2026-05-08-lean-analytics-reconsidered.md)에서 도출한 PR 헤더 스키마에 추가 후보:
- *추가/제거 줄* (Ding)
- *AI 강도* vibe/hybrid/agentic (Willison)
- *측정 가능 가치 변화* (Lean Analytics)
- ***결정적 vs 비결정적 영역 분리*** (이 글) ← 새 항목

PR이 *비결정적 영역*에 결정적 보장을 요구하면 *경고 신호*.

### *Babysitter·Auditor·Prayer가 모두 불충분*은 한국 IT의 흔한 함정
- *코드 리뷰만으로 잡는다* (Auditor) — 양 늘면 무너짐
- *시니어가 옆에서 본다* (Babysitter) — 확장 불가
- *대충 잘 되겠지* (Prayer) — 가장 흔하고 가장 위험
- → ***결정적 코드 + 결정적 검증***만이 답

이건 [Diallo의 *왜 그런 API가 존재하는가*](2026-05-07-ai-didnt-delete-your-database-you-did.md)와 정확히 같은 정신 — *위험을 코드 차원에서 *불가능*하게 만드는 게 답*.

### 반론·균형점
- *모든 로직을 코드로 옮기면 LLM의 유연성이 사라짐* — 트레이드오프 인정 필요
- *프롬프트로 충분한 영역*도 분명 존재 (creative·brainstorming·summarization)
- 핵심: ***critical path*는 코드 / *exploration*은 프롬프트* 명확한 분리

## 🎯 즉시 시도할 액션 3가지
1. **MangoLove `strict.md` *MANDATORY·반드시·건너뛸 수 없음* 표현 식별** — 코드(hook·skill·검증 스크립트)로 옮길 후보 매핑
2. **CRS 결제·재고·권한·OTA 정산 4영역 *결정적 코드 vs 프롬프트* 분리도 작성** — 이미 분리된 곳·미분리 위험 영역 식별
3. **PR 헤더 스키마에 *결정적/비결정적 영역 분리* 항목 추가 검토** — 가든 PR 메타데이터 5번째 항목

## 🔗 연관 자료
- [`ai/2026-04-28-agent-harness-engineering.md`](2026-04-28-agent-harness-engineering.md) — Agent = Model + Harness, 같은 정신의 더 큰 프레임
- [`ai/2026-05-04-long-running-agents.md`](2026-05-04-long-running-agents.md) — Brain/Hands/Session 3분리 + checkpoint
- [`ai/2026-04-29-mattpocock-skills-vs-mangolove.md`](2026-04-29-mattpocock-skills-vs-mangolove.md) — Skill = 결정적 절차
- [`architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md`](../architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md) — stateless 라우팅 + stateful 처리 분리
- [`ai/2026-05-07-vibe-coding-agentic-engineering-converging.md`](2026-05-07-vibe-coding-agentic-engineering-converging.md) — 경계 조건/보안 5영역 강제 라인 리뷰
- [`ai/2026-05-07-ai-didnt-delete-your-database-you-did.md`](2026-05-07-ai-didnt-delete-your-database-you-did.md) — 위험을 코드 차원에서 불가능하게
- [`engineering/2026-05-08-lean-analytics-reconsidered.md`](../engineering/2026-05-08-lean-analytics-reconsidered.md) — PR 헤더 스키마

## 📝 한 달 뒤 회고
- [ ] MangoLove의 *MANDATORY 표현 식별 + 코드 이전 후보* 매핑을 시작했는가
- [ ] CRS 4영역 결정적/비결정적 분리도를 작성했는가
- [ ] PR에 *결정적/비결정적 영역 분리* 메타데이터를 한 번이라도 적용했는가
- [ ] *조합 불가능성* 위험(긴 체인)을 인지하고 checkpoint를 도입한 사례가 있는가
