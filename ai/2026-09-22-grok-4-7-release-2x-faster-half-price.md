---
title: "Grok 4.7 공개, 동급 모델 대비 2배 빠르고 가격은 절반 — 사실은 4.6과 같은 가격, 경쟁 모델 대비 저렴하다는 뜻 (xAI)"
source_title: "Introducing Grok 4.7"
source_url: "https://x.ai/news/grok-4-7"
source_name: "xAI 공식 발표, WebSearch(VentureBeat·MarkTechPost) 교차확인, GeekNews(id=34077) 경유"
referrer_url: "https://news.hada.io/topic?id=34077"
published_at: "2026-09-21(WebSearch 확인)"
summarized_at: "2026-09-22"
category: "ai"
tags: ["grok", "xai", "cursorbench", "coding-model", "reinforcement-learning", "pricing"]
---

# Grok 4.7 공개, 동급 모델 대비 2배 빠르고 가격은 절반

> 출처: [xAI 공식 발표](https://x.ai/news/grok-4-7) · GeekNews(id=34077) 경유 · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io`와 `x.ai` egress 차단으로 원문 직접 접근 불가. Slack GN⁺ 발췌 + WebSearch(VentureBeat, MarkTechPost, llm-stats.com)로 재구성했다. **제목의 "가격은 절반"은 오해하기 쉬운 표현이다** — WebSearch로 확인한 결과 이는 Grok 4.6 대비 가격 인하가 아니라, xAI가 자체 비교한 GPT-5.6 Sol($4/$20)·Fable 5.1($10/$50) 같은 경쟁 프런티어 모델 대비 저렴하다는 뜻이며, Grok 4.7 자체는 Grok 4.6과 ***동일한 가격($2/$6, 백만 토�큰당 입력/출력)과 속도***로 제공된다.

## 한 줄 요약

**Grok 4.7은 더 큰 기반 모델에 어려운 과제 중심의 강화학습을 더 오래 적용해 CursorBench 4.0 점수를 40.4%에서 46.3%로 끌어올렸지만, 가격·속도는 Grok 4.6과 동일하게 유지했다 — "2배 빠르고 절반 가격"이라는 마케팅 문구는 Grok 4.6 대비가 아니라 GPT-5.6 Sol·Fable 5.1 같은 경쟁 모델 대비라는 점을 놓치면 안 된다.**

## 핵심 포인트

- **어려운 작업을 더 오래 수행, 가격·속도는 동결** — 코딩과 지식 업무용 Grok 4.7은 ***어려운 작업을 더 오래 수행하고, 자체 검증과 긴 컨텍스트 관리를 개선***했으며 Grok 4.6과 같은 가격과 속도로 제공된다.
- **더 큰 기반 모델 + 어려운 과제 중심 강화학습** — 더 큰 기반 모델에 ***수 시간이 걸리는 어려운 과제 중심의 강화학습을 더 오래 적용***하고, Grok Bot의 실행 환경에 맞춰 대화·일반 업무 수행 능력을 높였다.
- **CursorBench 4.0에서 40.4% → 46.3%로 향상** — 장시간 코딩 과제를 평가하는 ***CursorBench 4.0에서 46.3%***로 이전 모델의 40.4%보다 향상됐으며, 문서·프레젠테이션 작성 등 전문 업무 성능도 개선됐다.
- **새 안전장치로 악의적 요청·탈옥 대응 강화** — 새로운 안전장치를 적용해 ***악의적인 요청과 탈…*** (발췌 절단, 탈옥 시도 대응으로 추정)에 대한 방어를 높였다.
- **"2배 빠르고 절반 가격"의 진짜 의미(WebSearch 보강)** — xAI 자체 비교표 기준 GPT-5.6 Sol($4/$20), Fable 5.1($10/$50) 같은 ***경쟁 프런티어 모델 대비 저렴***하다는 뜻이며, Grok 4.6 대비 가격 인하는 아니다. 다만 더 빠른 출력이 필요하면 2배 속도에 2배 가격인 옵션도 별도 제공된다.

## 인상 깊은 문장

> "Grok 4.7 is served at the same price and speed as Grok 4.6."
> (llm-stats.com, WebSearch 발췌)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. VentureBeat는 코딩 성능 향상에도 불구하고 ***높은 토큰 소비량이 실제 ROI를 위협***한다고 지적했다(WebSearch) — 벤치마크 점수 향상이 곧 실사용 비용 효율 향상을 의미하지 않는다는 점에 유의해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 Grok 계열 노트에 "벤치마크 향상 vs 실사용 토큰 비용"이라는 익숙한 긴장을 다시 확인

가든에는 [[2026-08-14-grok-4-6-cost-efficiency-frontier]], [[2026-08-13-grok-4-6-post-training-over-parameters]] 등 이전 Grok 버전의 가격 경쟁력을 다룬 노트가 있다. 이번 4.7은 "가격은 동결, 성능은 향상"이라는 패턴을 반복하면서도, VentureBeat가 지적한 "토큰 소비 증가로 인한 ROI 위협"이라는 그림자를 함께 드리운다. 이는 가든의 [[2026-09-22-fable-5-reasoning-tokens-decreased-analysis]](같은 배치)가 다루는 "추론 토큰 소비가 벤치마크 점수와 별개로 실사용 비용을 좌우한다"는 문제의식과 정확히 같은 축이다 — 모델 비교 시 벤치마크 점수만이 아니라 실제 과제당 토큰 소비량을 함께 봐야 한다는 원칙이 여러 벤더에서 반복 확인되고 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS 내부 코딩 에이전트나 문서 자동화에 Grok 4.7 같은 모델 도입을 검토한다면, 벤치마크 점수(CursorBench 46.3%)만 보지 말고 실제 업무 과제 기준 토큰 소비량을 별도로 측정해야 한다 — "가격은 동일한데 성능은 올랐다"는 발표와 "실사용 비용도 그대로다"는 서로 다른 명제라는 점을 팀 내 모델 선택 기준에 명시해두면 좋다.

## 연관 자료

- [[2026-08-14-grok-4-6-cost-efficiency-frontier]] — 이전 버전의 가격 경쟁력 분석
- [[2026-08-13-grok-4-6-post-training-over-parameters]] — Grok 4.6의 사후학습 전략
- [[2026-09-22-fable-5-reasoning-tokens-decreased-analysis]] — 같은 배치, "벤치마크 점수와 실사용 토큰 비용은 다른 축"이라는 동일한 문제의식

## 한 달 뒤 회고

*(2026-10-22 즈음 — Grok 4.7의 실사용 토큰 소비량이 실제로 4.6 대비 얼마나 늘었는지, VentureBeat가 지적한 ROI 우려가 현실화됐는지 확인.)*
