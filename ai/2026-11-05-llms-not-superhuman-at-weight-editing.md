---
title: "LLM은 신경망 가중치를 읽고 쓰는 데 초인적이지 않다 (Sean Goedecke) — GPT-6 Astra의 '학습 없이 가중치를 고친다'는 결과는 숙련된 인간 ML 연구자도 할 수 있는 일이라는 반박"
source_title: "LLMs are not superhuman at reading and writing neural network weights"
source_url: "https://seangoedecke.com/llms-are-not-superhuman-at-reading-and-writing-neural-network-weights/"
source_name: "seangoedecke.com"
referrer_url: "https://news.hada.io/topic?id=36609"
published_at: "2026-11-05"
summarized_at: "2026-11-05"
category: "ai"
tags: ["llm", "weight-editing", "ai-research", "self-improvement", "critique"]
---

# LLM은 신경망 가중치를 읽고 쓰는 데 초인적이지 않다

> 출처: [LLMs are not superhuman at reading and writing neural network weights](https://seangoedecke.com/llms-are-not-superhuman-at-reading-and-writing-neural-network-weights/) (Sean Goedecke) · 정리일 2026-11-05

## 한 줄 요약

**GPT-6 Astra가 신경망 가중치를 직접 읽고 수정해 0.8B Qwen의 수학 성능을 개선했다는 "Sparks of Weight-Space Programming" 논문 결과에 대한 반박. Goedecke는 이 결과가 유능한 인간 ML 연구자도 수행할 수 있는 작업이며, "초인적인 AI 연구"가 아니라 "초인적인 정신적 암산" 수준이라고 주장한다. 그는 모델 가중치를 개선하는 가장 좋은 방법은 여전히 평범한 학습(training)이며, LLM이 AI 연구에 기여하는 방식도 결국 "더 나은 학습 방법"을 통해서일 것이라고 결론짓는다.**

## 핵심 포인트

- ***"작은 게임 신경망은 입력 채널에 격자 위치와 의미가 드러나 있어"*** — 첫 번째 층 가중치의 크기를 분석하면 어떤 게임을 학습했는지 알아낼 단서를 얻을 수 있다는 원 논문의 주장에 대해, Goedecke는 이것이 "가중치를 읽는 초인적 능력"이 아니라 **구조적으로 뻔히 드러나는 단서를 짚어낸 것**뿐이라고 반박한다.
- ***"0.8B Qwen의 수학 성능 향상은 새로운 수학 능력을 심은 게 아니다"*** — 32k 토큰 이후 반복(루프)에 빠지는 특정 문제를 고쳐, 모델이 더 오래 문제를 풀 수 있게 만든 결과라는 것. 원 논문 자체도 **전체 가중치의 0.016%만 편집**해 Qwen3.5-0.8B의 추론 반복 문제를 고쳤다고 밝혔다 — 즉 "새 능력 창조"가 아니라 "버그 수정".
- **스티어링 계열 접근** — Astra는 반복하는 추론과 그렇지 않은 추론을 비교해 관련 가중치를 찾아 줄이는 방식을 썼는데, 이는 기존 activation steering/concept ablation 기법과 본질적으로 다르지 않다는 게 반박의 핵심.
- Goedecke의 결론: **가중치를 업데이트하는 가장 좋은 방법은 평범한 학습(training)** 이며, LLM이 AI 연구에 유용하게 기여할 길은 "가중치를 직접 손으로 만지는 것"이 아니라 **"더 나은 학습 방법을 설계하는 것"**이다.

## 인상 깊은 문장

> "The best way to update the weights of a model is to train it normally." (요약, 원문: Goedecke's post)

> "...intelligent LLMs help with AI research by improving training, not by magically tweaking model weights directly." (WebSearch 요약 발췌)

## 댓글

news.hada.io 원문은 차단됐지만, 이 글의 핵심 주장은 WebSearch로 직접 블로그 원문 요약을 확인해 교차검증했다 — Slack 발췌의 세부 수치(0.8B Qwen, 32k 토큰 이후 반복)와 WebSearch 요약(Qwen3.5-0.8B, 0.016% 가중치 편집, 반복 루프 수정)이 **정확히 같은 사건을 가리킨다**는 걸 확인했다. 다만 hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다. 이 글 자체가 "반박/비평" 글이라는 점에서 Goedecke 개인의 관점이 강하게 들어간 글이며, 원 논문 저자의 재반박은 찾지 못했다 — **일방의 비평만 반영된 요약**이라는 점을 밝힌다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-03-gpt6-astra-weight-editing-qwen]]에 대한 직접 반증(mirror)

11월 3일 정리한 [[2026-11-03-gpt6-astra-weight-editing-qwen]] 노트는 "학습 없이 가중치를 고친다는 주장은 아직 사례 하나뿐이다"라며 신중한 태도를 취했는데, 이 글은 바로 그 신중함이 정당했음을 보여주는 **정면 반박**이다. 같은 사건(GPT-6 Astra의 가중치 편집)을 "놀라운 돌파구"로 보도한 흐름과 "사실은 평범한 디버깅"으로 깎아내리는 흐름이 동시에 존재한다는 걸 두 노트를 나란히 두면 알 수 있다 — **AI 연구 보도를 접할 때 "놀라운 결과"와 "그 결과에 대한 전문가 반박"을 항상 짝으로 찾아야 한다**는 원칙을 이번에도 확인.

### 핵심 전이 2 — [[2026-11-04-qwen-3-8-27b-interprets-raw-model-weights]]와의 계열화

바로 전날 정리한 [[2026-11-04-qwen-3-8-27b-interprets-raw-model-weights]]("내 노트북의 Qwen 3.8 27B도 모델 가중치를 해석할 수 있다")는 "가중치를 읽고 학습한 게임을 맞히는" 능력이 거대 모델만의 전유물이 아니라 로컬 모델에서도 재현된다는 걸 보여줬다. Goedecke의 반박과 합쳐보면, **"가중치를 읽어내는 것" 자체는 신기하지만 특별히 초인적이지 않고, 입력 데이터의 구조적 단서를 패턴 매칭하는 일반적인 LLM 능력의 연장선**이라는 그림이 완성된다. 이 세 편(Astra 발표 → 로컬 재현 → 반박)을 묶으면 "하나의 AI 연구 클레임이 주간 단위로 검증·재현·반박을 거치는" 실제 사례 연구가 된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 신경망 가중치 편집이라는 주제 자체가 CRS 도메인과 접점이 없다. 다만 전이 가능한 원칙: **"놀라운 AI 연구 결과를 접했을 때 과장 여부를 바로 의심하고 반박을 찾아보는 태도"**는, CRS에 AI 기능(수요예측·가격최적화 등)을 도입할 때 벤더의 성과 주장을 검증하는 데도 그대로 적용된다 — 벤더가 "AI가 매출을 X% 올렸다"고 할 때 Goedecke처럼 "그게 정말 새로운 능력인가, 아니면 기존 방법으로도 가능했던 개선인가"를 따져보는 습관.

## 연관 자료

- [[2026-11-03-gpt6-astra-weight-editing-qwen]] — 이 글이 직접 반박하는 원래의 "놀라운 결과" 보도
- [[2026-11-04-qwen-3-8-27b-interprets-raw-model-weights]] — 같은 능력이 로컬 소형 모델에서도 재현된다는 계열 사례

## 한 달 뒤 회고

*(2026-12-05 즈음 — 원 논문("Sparks of Weight-Space Programming") 저자 측의 재반박이 나왔는지, 이 Goedecke 비평에 대한 커뮤니티 반응이 어땠는지 확인.)*
