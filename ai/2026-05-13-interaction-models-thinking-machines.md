---
title: "Interaction Models — 인간-AI 협업을 위한 확장 가능한 접근법"
source_title: "Interaction Models: A Scalable Approach to Human-AI Collaboration"
source_url: "https://thinkingmachines.ai/blog/interaction-models/"
source_name: "Thinking Machines Lab"
referrer_url: "https://news.hada.io/topic?id=29441"
published_at: "2026-05-12"
summarized_at: "2026-05-13"
category: "ai"
tags: ["멀티모달", "실시간", "마이크로턴", "full-duplex", "음성AI", "Thinking-Machines"]
---

# Interaction Models — 인간-AI 협업을 위한 확장 가능한 접근법

> 출처: [Thinking Machines Lab — Interaction Models](https://thinkingmachines.ai/blog/interaction-models/) · 레퍼러: [GeekNews 29441](https://news.hada.io/topic?id=29441) · 정리일 2026-05-13

## 🔖 한 줄 요약
**Thinking Machines Lab (Mira Murati 창업)** 의 첫 큰 발표 — 모델이 *직접* 오디오·비디오·텍스트를 **200ms 마이크로턴**으로 실시간 처리. 기존 *턴 기반 AI*의 협업 병목을 **full-duplex 모델 차원**에서 해결.

## 🧩 핵심 주장

### 1. 협업의 본질 — *사람과 사람처럼*
> "사람들은 서로와 협업하는 방식으로 AI와 협업할 때 가장 효과적 — 메시징, 대화, 청취, 시각적 공유, 필요에 따라 개입하고 모델도 동일하게 대응."

- 인간 협업 = *비동기 + 동기·시각·음성 혼합*
- 현재 AI = *완전 동기 턴 기반* → 부자연스러움

### 2. 협업 병목 — *대역폭 제약*
> "사용자가 입력을 마칠 때까지 모델은 대기하며, 모델이 생성할 때까지 사용자 인식이 멈춘다."

- 한쪽이 *말하는 동안 다른 쪽은 멈춤*
- 인간 협업 = *겹치는 발화 + 비언어적 신호 동시 처리*

### 3. 200ms 마이크로턴
> "200ms 마이크로턴으로 입력/출력을 처리하면 *인공적 턴 경계 없이* 실시간 동시성 가능."

- 입력·출력을 *연속 스트림*으로 다룸
- 모델이 듣고 말하고 *동시에* 보는 것 가능

### 4. *모델의 핵심*에 통합되어야 한다
> "상호작용이 지능과 함께 확장되려면 *모델의 핵심 부분*이어야 한다."

- 외부 구성 요소(음성 인식·TTS·VAD)를 *바깥*에 두면 *확장 불가*
- 첫 모델: **TML-Interaction-Small** — full-duplex + 지능 균형

## 💭 내 생각 · 적용점

### 가든 *AI 채택 새 방향*의 자연 확장
가든이 누적한 *AI 비판 11개*는 *현재 모델의 한계* 비판. 이 글은 *모델 자체가 바뀌면* 어떤 가능성이 열리는지 — **비판의 *문제 정의*에 대한 *대안 답*** 형태.

| 가든 비판 | 이 글이 시사하는 답 |
|---|---|
| [Trap 디버깅 47%](2026-05-05-agentic-coding-is-a-trap.md) | 인간이 *실시간 개입*하면 위축 줄어들 수 있음 |
| [Willison 검증 어려움](2026-05-07-vibe-coding-agentic-engineering-converging.md) | *겹치는 발화*로 *즉시 수정* 가능 |
| [Brian MANDATORY 한계](2026-05-09-agents-need-control-flow.md) | 모델이 *말하는 중에* 사람이 개입 가능 |

→ **턴 기반 AI 비판이 *근본 한계*가 아니라 *현재 모델 한계*였을 수도 있음**.

### [OpenAI Realtime 인프라](../architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md)와의 짝
- OpenAI Realtime: *외부 인프라*로 저지연 실현 (relay + transceiver 분리)
- 이 글 (TML): ***모델 자체*가 full-duplex로 실현
- → **인프라 차원 vs 모델 차원** 두 접근의 비교 사례

### 호스피탈리티 적용 — *Ferrari 라인의 새 가능성*

[Ding Camry vs Ferrari](2026-05-07-claude-code-not-making-your-product-better.md)에서 *Ferrari 라인*은 *AI가 못 만든다*고 했는데, Interaction Models이 새 가능성:

| 영역 | 활용 |
|---|---|
| **호텔 컨시어지 음성 인터페이스** | 게스트가 *말하는 중간*에 호텔이 *시각 자료 동시 제공* (예: "강남에 있는 한식당" → 말 중간에 카드 자동 표시) |
| **실시간 다국어 통역 안내** | 프런트 데스크에서 게스트-직원 *겹치는 대화* 자동 통역 |
| **객실 내 음성 어시스턴트** | "조명 어둡게... 아니 더..." 같은 *수정 중 대응* |
| **B2B 영업 미팅 보조** | 시니어 영업이 미팅 중 실시간 정보 제공 (가격·재고·정책) |

→ ***다크 마켓플레이스의 음성·시각 인터페이스 시대*** 의 모델 인프라가 될 가능성.

### [다크 마켓플레이스](../engineering/2026-05-08-the-dark-marketplace.md)와의 결합
- 다크 마켓플레이스 = *사용자 화면 사라지는* 시대
- 화면이 사라지면 → *음성·시각 실시간 인터페이스*가 새 채널
- 호텔이 *AI 에이전트의 *음성 호출*에도 응답해야* 하는 미래

### 한계·반론
- *데모 영상의 현실성* — 댓글 회의론 인정
- *경제 모델* 미공개 — 학습 비용·운영 비용 불명
- *프로덕션 적용*까지 거리 — 실험 단계
- **결정적 한계**: *Brian의 결정적 영역*([Agents need control flow](2026-05-09-agents-need-control-flow.md))이 *더 어려워질 수 있다* — full-duplex는 *언제 멈출지* 결정이 더 복잡

### *모델 차원 vs 인프라 차원* 트레이드오프

| 접근 | 장점 | 단점 |
|---|---|---|
| **OpenAI Realtime** (인프라 차원) | 어떤 모델도 wrap 가능, 빠른 진화 | latency·정확성 한계 |
| **TML Interaction Model** (모델 차원) | full-duplex 자연스러움 | 모델 학습 비용·교체 어려움 |

→ **현재는 둘 다 시도해볼 가치**. 호스피탈리티는 *인프라 차원*이 시작하기 쉽고, *모델 차원*은 *상용 안정화 후* 도입.

### MangoLove 적용 — *음성 컨시어지 시범*은 아직
- TML-Interaction-Small이 *상용 안정*까진 거리
- 그러나 *생각의 지평*은 확장 가능 — *AI 인터페이스 = 채팅창*이라는 기본 가정을 의식적으로 깨기
- MangoLove에 *음성·시각 자료 동시 출력* 옵션 검토는 [HTML 효율성 글](2026-05-10-claude-code-html-effectiveness.md)과 결합 가능

### 가든 *행동 후보* 결 평가
- 이 글: 우선순위 ★★ (아직 상용 안정 X)
- 비교: [Rapid-MLX](2026-05-12-rapid-mlx-apple-silicon-local-ai.md) ★★★★ (즉시 사용 가능)
- → ***인지만, 시도는 보류***. 분기마다 상용화 상태 점검 후보.

### 가든 메타 — *비판 시리즈에 대한 모델 차원 답변* 추가
가든의 11개 비판 시리즈가 *현재 모델 한계*를 다뤘다면, 이 글은 *모델 자체가 진화하는 방향*을 보여줌. **가든 시리즈의 지속 검증을 위해 *기술 발전 추적*이 필요**.

→ *분기마다 *비판이 여전히 유효한지* 모델 발전 vs 가든 진단 비교* 후보. 이게 [Willison 자기 고백](2026-05-07-vibe-coding-agentic-engineering-converging.md)에서 메모한 *시간이 흐르며 검증*이 가능한 형태.

## 🎯 즉시 시도할 액션 3가지
1. **TML-Interaction-Small *공개 시 시범* 일정 등록** — 분기마다 상용화 상태 점검
2. **MangoLove에 *AI 인터페이스 = 채팅창* 가정 의식적 점검** — 가능한 영역에서 음성·시각 자료 동시 출력 후보 식별
3. **호스피탈리티 *음성 컨시어지 PoC* 후보 식별** — OpenAI Realtime 차원에서 시작 가능 영역

## 🔗 연관 자료
- [`architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md`](../architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md) — 인프라 차원의 짝
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](2026-05-07-claude-code-not-making-your-product-better.md) — Ferrari 라인의 새 가능성
- [`engineering/2026-05-08-the-dark-marketplace.md`](../engineering/2026-05-08-the-dark-marketplace.md) — 화면 사라진 후 음성·시각 인터페이스 시대
- [`ai/2026-05-09-agents-need-control-flow.md`](2026-05-09-agents-need-control-flow.md) — full-duplex는 결정적 영역을 더 어렵게
- [`ai/2026-05-10-claude-code-html-effectiveness.md`](2026-05-10-claude-code-html-effectiveness.md) — 음성 + 시각 자료 동시 출력 후보
- 비교: OpenAI gpt-realtime-2, Google Gemini Live 3.1

## 📝 한 달 뒤 회고
- [ ] TML 상용화 상태 점검 일정이 등록됐는가
- [ ] *AI 인터페이스 = 채팅창* 가정을 의식적으로 깨는 사례가 있었는가
- [ ] 호스피탈리티 음성 컨시어지 PoC 후보를 식별했는가
- [ ] 가든 비판 시리즈가 *모델 발전*과 함께 *어떻게 변해야 할지* 점검했는가
