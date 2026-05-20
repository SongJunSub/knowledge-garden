---
title: "M4 24GB 메모리에서 로컬 모델 실행하기"
source_title: "Running Local Models on an M4 with 24GB Memory"
source_url: "https://jola.dev/posts/running-local-models-on-m4"
source_name: "Johanna Larsson (jola.dev)"
referrer_url: "https://news.hada.io/topic?id=29385"
published_at: "2026-05-10"
summarized_at: "2026-05-12"
category: "ai"
tags: ["로컬AI", "M4-Mac", "Qwen3.5", "LM-Studio", "실측", "양자화", "워크플로우"]
---

# M4 24GB 메모리에서 로컬 모델 실행하기

> 출처: [Johanna Larsson — Running Local Models on M4](https://jola.dev/posts/running-local-models-on-m4) · 레퍼러: [GeekNews 29385](https://news.hada.io/topic?id=29385) · 정리일 2026-05-12

## 한 줄 요약
**M4 MacBook Pro 24GB 실측 경험기** — Qwen 3.5-9B Q4 양자화, LM Studio, *40 tok/s + 128K 컨텍스트*. **무엇이 가능하고 무엇이 안 되는지** 명확. 가든 *로컬 AI 3부작* 완성.

## 핵심 셋업

| 항목 | 값 |
|---|---|
| **하드웨어** | M4 MacBook Pro **24GB** |
| **모델** | Qwen 3.5-9B (4비트 양자화) |
| **도구** | LM Studio |
| **속도** | **~40 tok/s** |
| **컨텍스트** | **128K** |

### Qwen 선택 기준
*"메모리에 들어가면서 다른 앱 여유공간 남기고, 최소 64K 컨텍스트"* — **이 기준 충족하는 유일한 실용적 옵션**.

## 가능 vs 불가능

| 가능 | 불가능 |
|---|---|
| 코드 린팅 제안 | 복잡한 다중단계 문제 *독립* 해결 |
| 단계적 디버깅 | 장시간 자율 작업 |
| 참고자료 조사 | 광범위한 추론 |
| 단계별 인터랙티브 워크플로우 | 프런티어 모델 수준 추론 |

## 핵심 워크플로우 철학
> "더 인터랙티브한 워크플로우에서 단계별로 명확하게 소통하고 *광범위한 지도*가 필수."

**프런티어 모델**: *알아서 해줘*
**로컬 모델**: *내가 단계별로 끌고 가야 함*

## 프런티어 모델과의 격차 (정직한 인정)
- 주의 산만 (focus drift)
- 루프 반복 (loop)
- 오해석 경향

그러나 **"도구 사용, 합리적 속도로 실행되는 모델 중 최고"**.

## 내 생각 · 적용점

### 가든 *로컬 AI 3부작* 완성

| # | 글 | 위치 |
|---|---|---|
| 1 | [로컬 AI가 표준이 되어야 한다](2026-05-11-local-ai-needs-to-be-the-norm.md) | **이론** — 왜 |
| 2 | [Rapid-MLX](2026-05-12-rapid-mlx-apple-silicon-local-ai.md) | **도구** — 무엇으로 |
| **3** | **이 글** | **실측 — *진짜 어떤가*** |

이론 → 도구 → 실측의 자연스러운 시리즈. 가든이 *완전한 사이클*을 한 주제로 닫은 첫 사례.

### *24GB도 작동한다*는 증거
- 어제 Rapid-MLX 정리에서 *32GB Mac Mini = Nemotron-Nano 30B @ 141 tok/s* 메모
- 이 글: *24GB도 9B 모델로 *유용한* 워크플로 가능*
- → **메모리 24GB 이상 모든 Apple Silicon Mac에서 *실용 가능*** 검증

내 *M3 Pro 32GB* → 9B 양자화 *여유 있게* 가동 + 더 큰 모델 가능.

### *가능 vs 불가능 표*가 가장 가치 있다
가든 *로컬 AI* 시리즈에 *환상* 없이 들어갈 수 있게 해주는 표. **단계별 인터랙티브 워크플로우는 OK, 자율 다중단계 X**. 이게 정확히 [Ding의 Camry/Ferrari](2026-05-07-claude-code-not-making-your-product-better.md)·[Brian 결정적 영역](2026-05-09-agents-need-control-flow.md) 정신:
- Camry 라인 = 로컬 OK
- Ferrari 라인 = 클라우드 (Sonnet·Opus)
- 자율 에이전트 = 클라우드 (현재)

### *광범위한 지도가 필수*는 [확률적 창업자 Agent-Default Posture](../career/2026-05-05-rise-of-the-probabilistic-founder.md)와 결합
- 클라우드 = *알아서 해줘*가 가능 → *Agent-Default Posture*가 느슨해질 수 있음
- 로컬 = *내가 단계별로* → *Agent-Default Posture* 자연 강제
- → **로컬 모델이 사람의 *명세·검토·오케스트레이션* 책임을 *기본값*으로 만듦** — 의외의 보너스

### MangoLove 적용 후보 정제
어제 메모한 *MangoLove `/strict` 로컬 우선 라우팅*이 이 글로 더 구체화:

| 작업 | 라우팅 |
|---|---|
| Spec 작성 보조 (요약·정리) | **로컬** (Qwen 3.5-9B 충분) |
| 코드 린팅·디버깅 단계 도움 | **로컬** |
| 다중파일 리팩토링 (자율) | **클라우드** (Opus/Sonnet) |
| 페르소나 리뷰 (보안·성능·비즈니스) | **클라우드** (깊은 추론) |
| commit 메시지·PR 설명 | **로컬** 가능 |

→ MangoLove `/strict`에 **태스크별 권장 라우팅 매트릭스** 명시 후보.

### *내 환경에서 즉시 시도 가능한 셋업*
- **하드웨어**: M3 Pro 32GB
- **도구**: LM Studio 또는 Rapid-MLX (둘 다 시도 가치)
- **모델 후보**: Qwen 3.5-9B Q4 (검증된 베이스) → Qwen 3.5-14B Q4 (한 단계 위)
- **첫 시도**: Commit 메시지 생성·코드 린팅·문서 요약

→ **이번 주말 실험 슬롯에 적용**. [Lord 3 제약](../engineering/2026-04-28-three-constraints-before-i-build-anything.md)으로 보면:
- one-pager: *Qwen 9B로 commit 메시지 + 린팅이 평소만큼 쓸 만한가?*
- core tech: LM Studio/Rapid-MLX 셋업 자체가 분리 가능 자산
- defining constraint: *오프라인·프라이버시* 검증

### 호스피탈리티 적용 — 실측 보강
어제 메모한 *PoC 5개*에 *실측 보장* 더해짐:
- PickMe 사용자 검색 히스토리 *기기 내 분석* → **확실히 작동** (9B 양자화 수준 충분)
- 여권 OCR + 정규화 → **확실히 작동**
- 리뷰 분류 → **확실히 작동**
- 운영 자동 의사결정·복잡 추론 → 여전히 클라우드 필요

### *온라인 과장* 경고
> *"실제 성능 비교 시 온라인 과장이 많다"* (댓글)

가든의 [No One's Happy 산출물-역량 분리](2026-05-07-appearing-productive-in-the-workplace.md)·[Willison 외형 동일](2026-05-07-vibe-coding-agentic-engineering-converging.md)의 정확한 변형 — *로컬 모델 데모*도 마찬가지로 *외형이 능력과 분리될 수 있다*.

→ **이 글이 *실측 정직성*을 갖춘 좋은 사례**. 격차를 인정하면서도 가치 있는 영역을 명확히 식별.

### 반론·균형점
- *9B Q4*는 일부 작업에서 *6B 풀 정밀도*보다 못함 — 모델 선택의 미묘함
- *128K 컨텍스트*는 *기술적 한계*이지 *실용적 활용 영역*과 다름 — 긴 코드베이스 분석은 여전히 한계
- *오프라인이 진짜 가치인가*는 사용자별 — *비행기·해외·민감 데이터* 영역이 명확하지 않으면 그냥 *느린 클라우드*

## 즉시 시도할 액션 3가지
1. **주말 실험 슬롯 — LM Studio + Qwen 3.5-9B Q4 셋업** (M3 Pro 32GB)
2. **첫 PoC: commit 메시지 자동 생성** — 평소 Claude 호출 비용 대비 실측
3. **MangoLove `/strict`에 *태스크별 권장 라우팅 매트릭스* 명시** — 5개 작업별 로컬/클라우드 분류

## 연관 자료
- [`ai/2026-05-11-local-ai-needs-to-be-the-norm.md`](2026-05-11-local-ai-needs-to-be-the-norm.md) — 이론 (왜)
- [`ai/2026-05-12-rapid-mlx-apple-silicon-local-ai.md`](2026-05-12-rapid-mlx-apple-silicon-local-ai.md) — 대안 도구
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](2026-05-07-claude-code-not-making-your-product-better.md) — Camry/Ferrari 라인 = 로컬/클라우드 분류
- [`ai/2026-05-09-agents-need-control-flow.md`](2026-05-09-agents-need-control-flow.md) — 결정적 영역 = 로컬에서도 명확히
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — Agent-Default Posture 자연 강제
- [`engineering/2026-05-08-lean-analytics-reconsidered.md`](../engineering/2026-05-08-lean-analytics-reconsidered.md) — 성공 태스크당 비용 변동 → 고정

## 한 달 뒤 회고
- [ ] LM Studio + Qwen 3.5-9B 셋업했는가
- [ ] Commit 메시지 자동 생성 PoC 실측했는가
- [ ] MangoLove에 *태스크별 권장 라우팅 매트릭스*가 들어갔는가
- [ ] *광범위한 지도 필수* 워크플로우가 실제 더 좋은 결과를 냈는가
