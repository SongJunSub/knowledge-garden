---
title: "Simon Willison — 지난 6개월의 LLM을 5분 만에 보기"
source_title: "Six months of LLMs in 5 minutes"
source_url: "https://simonwillison.net/2026/may/19/six-months-of-llms/"
source_name: "simonwillison.net · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29682"
published_at: "2026-05-19"
summarized_at: "2026-05-20"
category: "ai"
tags: ["llm-landscape", "frontier-models", "rlvr", "coding-agents", "harness", "local-ai", "temporal-checkpoint", "simon-willison"]
---

# Simon Willison — 지난 6개월의 LLM을 5분 만에 보기

> 출처: [Six months of LLMs in 5 minutes](https://simonwillison.net/2026/may/19/six-months-of-llms/) · simonwillison.net · 정리일 2026-05-20

## 한 줄 요약
**2025년 11월이 분수령** — 프런티어 모델 4종(Claude Sonnet 4.5 / GPT-5.1 / Gemini 3 / **Claude Opus 4.5 선두**)이 *RLVR(Reinforcement Learning from Verifiable Rewards)* 투자로 *코딩 에이전트가 종종 작동 → 대체로 작동*으로 한 계단 올라섰고, *오픈 가중치 모델*(Gemma 4·GLM-5.1·Qwen3.6-35B-A3B)이 노트북에서 기대 초과, **체감 변곡점은 *모델 그 자체가 아니라 하네스 안정성 + RLVR의 결합***이라는 댓글 분석.

## 핵심 포인트

- **2025-11 = 변곡점** — 코딩 에이전트가 *"often works" → "mostly works"*로 한 계단 상승. *일상 도구 수준*에 도달. *consistently works*는 아직 아님 — *완료 환각이 잔존*하는 영역으로 남음.
- **프런티어 4종 경합 — Opus 4.5 선두** — Claude Sonnet 4.5 → GPT-5.1 → Gemini 3 → Claude Opus 4.5. *6개월에 4 차례 1위 교체* 후 현재 Opus 4.5가 선두. **공급자 록인이 부질없는 시기**.
- **RLVR (Reinforcement Learning from Verifiable Rewards)이 동력** — OpenAI·Anthropic이 *검증 가능한 보상*에 집중 투자. Codex·Claude Code 같은 에이전트의 코드 품질이 *비약적으로* 상승. **모델이 자기 검증을 학습하는 방향**.
- **오픈 가중치 모델 기대 초과** — Gemma 4·GLM-5.1·Qwen3.6-35B-A3B 등이 *프런티어보다 약하지만 예상을 크게 뛰어넘는 결과*. *노트북·로컬*에서 *실용 임계점*에 진입.
- **OpenClaw 열풍 — Mac Mini 품절** — *개인 AI 비서*로서의 새 사용 트렌드. *하드웨어 가용성 자체가 병목*이 되는 현상.
- **벤치마크의 한계** — *자전거 타는 펠리컨* 테스트가 차별성 상실. 새 비공식 과제(*전동 킥보드 타는 주머니쥐*) 필요. *벤치마크 자체가 훈련 표적*이 되는 현상에 댓글이 *Jeff Dean 고퀄 애니메이션*을 증거로 들음.
- **댓글의 변곡점 진단 — *하네스 안정성 + RLVR* 결합** — *모델만으로*는 변곡점 설명 부족. *에이전트 루프가 깊어질수록 개선이 극적으로 체감*. **댓글이 가든의 *Agent = Model + Harness* 명제를 그대로 진술**.

## 인상 깊은 문장

> "Coding agents went from 'often works' to 'mostly works' over the past six months."  
> (코딩 에이전트가 지난 6개월에 *종종 작동*에서 *대체로 작동*으로 넘어갔다)

> "Laptop-runnable models are much weaker than frontier — but began exceeding expectations significantly."  
> (노트북에서 돌아가는 모델들은 프런티어보다 훨씬 약하지만, 기대치를 크게 웃돌기 시작했다)

> "The felt inflection point isn't the models themselves — it's harness stability + RLVR training combined." (댓글 인용)  
> (체감 변곡점은 *모델 자체*가 아니라 *하네스 안정성과 RLVR 훈련의 결합*이다)

## 내 생각 · 적용점

### 가든의 *시간 핀(Temporal Index Pin)* — 한 달치 정리본의 *외부 권위 검증 자리*

Simon Willison은 *LLM 영역의 사실상 기록자(de facto chronicler)*다. 그의 *6개월 종합*이 *나오는 시점에 가든이 같은 6개월을 정리해 둔 상태*라는 게 결정적 — **가든의 *시간 핀*으로 박는다**:
- 가든의 *2025-11 ~ 2026-05* 정리본을 *Simon의 6개월 프레임에 한 줄로 줄세우는 외부 인덱스*
- 가든이 *놓친 사건*과 *과적합한 사건*을 동시에 식별하는 *교차 검증*
- *3개월·6개월·12개월 회고*의 *분기 기준점*

이 *시간 핀* 운용은 **13번째 가든 자가 진단 = *외부 인덱스 정렬 시험***:
- *Simon Willison·State of AI·Anthropic·OpenAI 공식 회고가 발표될 때마다 가든의 같은 기간 정리본을 옆에 놓고 줄세운다.*
- *과적합한 사건*(가든은 큰 자산인데 외부는 무시)과 *과소 정리한 사건*(외부는 큰 사건인데 가든은 없음)을 *분기 1회 식별*.

### *하네스 안정성 + RLVR* — 가든 *Agent = Model + Harness* 명제의 **3번째 외부 확증**

가든의 [[2026-05-18-musinsa-query-engineer-harness]] *Agent = Model + Harness* 명제는 이미 두 단계의 외부 확증을 거쳤다:
1. **무신사 (실무)**: 4관점×2공급자 정찰조로 *조직 차원*에서 시연
2. **[[2026-05-19-openai-codex-goals-persistent-objectives]] (공급자)**: OpenAI가 *Goals 프로토콜*로 표준화

**이번이 3번째 확증** — *영역 전체의 기록자가 같은 한 줄로 진단*:
- *모델만으로는 변곡점이 설명되지 않는다*
- *하네스 + 훈련 방식의 결합*이 체감 변곡점

→ **가든 명제가 *가설 → 사실*로 굳어지는 단계 완료**.

### RLVR — *완료 환각 5자 짝*의 *훈련 차원 답*

가든의 *완료 환각 5자 짝* (어제 정리한 [[2026-05-19-openai-codex-goals-persistent-objectives]]에서 완성):

| 차원 | 처방 |
|---|---|
| 모델 | [[2026-05-17-claude-to-codex-migration-reddit]] (Codex 회귀 감지) |
| 조직 | [[2026-05-16-hashimoto-ai-mass-psychosis]] (광기 진단) |
| 제도 | [[2026-05-17-amazon-token-burning-goodharts-law]] (KPI 설계) |
| 하네스 | [[2026-05-18-musinsa-query-engineer-harness]] (정합성 게이트) |
| 프로토콜 | [[2026-05-19-openai-codex-goals-persistent-objectives]] (Goals 6요소) |

**이번에 *6번째 차원 = 훈련(RLVR)* 추가**:
- *Codex Goals*는 *추론 시 사용자가 완료를 강제*
- *RLVR*는 *훈련 시 모델이 검증 가능한 보상으로 완료를 학습*
- **둘이 짝**: *훈련에서 학습된 완료 감각* + *추론에서 강제되는 완료 정의*

→ **완료 환각 6자 짝 완성**: 모델·조직·제도·하네스·프로토콜·**훈련**.

이건 [[2026-05-14-teaching-claude-why-alignment-training.md]] *Why 정렬*과 같은 가족 — *훈련 차원이 추론 차원보다 *비용 대비 효과*가 압도적*이라는 패턴.

### Opus 4.5 선두 → [[2026-05-17-claude-to-codex-migration-reddit]] *이전 질문 v4*

지난 5월 17일 Reddit 사용자가 *Claude → Codex 이전*을 보고했다. 가든의 v3 답변은 *Goal 6요소가 정의 가능한 작업만 옮기라*였다.

**v4 (모델 순위) 보강**: *Opus 4.5가 현재 선두* — Reddit 사용자의 *Codex 이전 시점*은 *Opus 4.5 출시 전*이었을 가능성. **현 시점 추천**:
- *프로파일링·벤치마킹·재현 검증*: Codex Goals (프로토콜 친화)
- *복잡 추론·아키텍처 결정*: Opus 4.5 (현재 선두)
- *인터랙티브 탐색·디자인 결정*: 어느 쪽이든 (둘 다 충분)

**6개월에 1위가 4번 바뀐 사실**이 *공급자 록인의 부질없음*을 시연 — [[2026-05-18-ai-subscription-pricing-truth.md]] *AI 보조금 종료* 시대의 *교차 사용 정당화*. 6번째 자가 진단 *복리 시험*은 *공급자 다중화로 RLVR 차이를 흡수*하는 게 정답.

### 노트북 로컬 + OpenClaw 열풍 — [[2026-05-11-local-ai-needs-to-be-the-norm.md]]·[[2026-05-12-rapid-mlx-apple-silicon-local-ai.md]]·[[2026-05-12-running-local-models-on-m4-24gb.md]] *3 자산 시간 핀*

가든이 5월 11~12일에 *로컬 AI 자산 3개*를 한꺼번에 정리한 게 *Simon이 5월 19일에 같은 흐름을 정점으로 진단*한 결과로 *시점적 합리성*이 확인됨. **8번째 자가 진단 *시점적 합리성 시험* 통과** — 가든이 *Mac Mini 품절을 일으킬 흐름*을 *2주 먼저* 우연히 정리했음.

다만 **[[2026-05-19-mediocre-data-scientist-ten-years.md]] *FAANG 편향*과 짝**: *Simon Willison·simonwillison.net 자체*가 *대형 테크 출신 + 영미권 영향력자*. *12번째 자가 진단 = 조직 규모 다양성*은 *Simon-류 기록자의 가치*와 *작은 회사 실무 큐레이션*의 **두 측면을 모두 박는다**.

### 펠리컨 → 주머니쥐 — *벤치마크의 자기 부패*

*자전거 타는 펠리컨*이 *무작위 농담 벤치마크*에서 *모델 훈련 표적*으로 바뀜. 댓글이 *Jeff Dean 고퀄 애니메이션*을 증거로 듦. **Goodhart's Law의 *모델 훈련 차원***:
- [[2026-05-17-amazon-token-burning-goodharts-law.md]] = *KPI 차원* Goodhart
- [[2026-05-16-hashimoto-ai-mass-psychosis.md]] = *조직 차원* Goodhart
- **펠리컨 → 주머니쥐 = *모델 훈련 차원* Goodhart**

→ *Goodhart 자가 짝*에 *훈련 차원* 추가. 가든의 *지표 왜곡 라인*이 *5자 → 6자 → 훈련 차원 Goodhart*로 다층화.

### CRS / 사이드 프로젝트 즉시 적용 후보 3건

1. **CRS 공급자 록인 점검 의례 — *분기 1회 모델 순위 재검토*** — 6개월에 4번 1위 교체. *공급자 단독 의존 결정*은 *분기 1회 재검토 의례*로 박는다. [[2026-05-18-ai-subscription-pricing-truth.md]] *AI 보조금 종료 적응*과 짝.
2. **MangoLove *RLVR 인식 자문 항목*** — 클라이언트의 AI 활용을 평가할 때 *모델 단독 평가*가 아니라 *모델 × 하네스 × 검증 가능한 보상 설계*를 *3축으로 동시 평가*. Simon의 한 줄을 자문 도구화.
3. **BugSip *주머니쥐 사고 시험*** — 사용자가 풀어가는 코드 리딩 *과제 자체가 훈련 표적*이 되지 않도록 *랜덤 변형*. 학습 효과가 *벤치마크 게이밍*으로 부패하지 않는지 *2주 1회* 정직 점검.

### 가든 운영 — *시간 핀 인덱스* 추가 후보

이 글을 *가든의 *외부 인덱스 자리*로 박는다*:
- README에 *시간 핀 라인* 별도 섹션 추가 후보 (예: *외부 회고 인덱스 — Simon Willison 2026-05-19 / Anthropic Code w/ Claude 2026-05-14 / a16z SoI 2026-05-18 / GeekNews Weekly 2026-W20*)
- *분기 회고* 시 이 시간 핀을 *기준 격자*로 사용
- *놓친 사건 식별 의례* — Simon이 묶은 6개월 사건 중 가든이 안 다룬 것 식별

## 연관 자료
- [Six months of LLMs in 5 minutes](https://simonwillison.net/2026/may/19/six-months-of-llms/)
- [GeekNews — 29682](https://news.hada.io/topic?id=29682)
- [[2026-05-18-musinsa-query-engineer-harness]] — Agent=Model+Harness *(3번째 외부 확증)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(완료 환각 프로토콜 차원 짝)*
- [[2026-05-14-teaching-claude-why-alignment-training]] — Why 정렬 *(RLVR과 같은 훈련 가족)*
- [[2026-05-17-claude-to-codex-migration-reddit]] — Codex 이전 *(v4 답변 — Opus 4.5 출시 후 변화)*
- [[2026-05-11-local-ai-needs-to-be-the-norm]]·[[2026-05-12-rapid-mlx-apple-silicon-local-ai]]·[[2026-05-12-running-local-models-on-m4-24gb]] — 로컬 AI *(시점적 합리성 통과)*
- [[2026-05-18-ai-subscription-pricing-truth]] — AI 보조금 종료 *(공급자 록인 부질없음)*
- [[2026-05-19-mediocre-data-scientist-ten-years]] — FAANG 편향 *(Simon-류 기록자 가치 vs 작은 회사 실무)*
- [[2026-05-17-amazon-token-burning-goodharts-law]]·[[2026-05-16-hashimoto-ai-mass-psychosis]] — Goodhart *(훈련 차원 추가)*

## 한 달 뒤 회고
*(2026-06-20 즈음 — 이 글을 가든 *시간 핀 인덱스*로 실제 운용했는지, *외부 인덱스 정렬 시험* 의례가 분기에 한 번 돌아갔는지, RLVR 자가 짝이 다음 6개월 정리에서도 유효한지, Opus 4.5 선두가 유지되었는지 정직히 기록.)*
