---
title: "Mistral Large 4 'Le Chonk' 발표 (Mistral AI) - 1.05조 파라미터 중 활성은 4.7%뿐인데, 유럽 자체 데이터센터가 스펙보다 더 강조된 모델"
source_title: "Introducing Mistral Large 4"
source_url: "https://mistral.ai/news/mistral-large-4/ (egress 차단, WebSearch로 교차확인한 재구성)"
source_name: "Mistral AI, 2차: MarkTechPost, VKTR, Yahoo Finance, Il Sole 24 ORE 등 복수 매체"
referrer_url: "https://news.hada.io/topic?id=34890"
published_at: "2026-10-06"
summarized_at: "2026-10-07"
category: "ai"
tags: ["mistral", "open-weight", "moe", "multimodal", "coding-agent", "cybersecurity", "sovereign-ai", "europe"]
---

# Mistral Large 4 'Le Chonk' 발표 (Mistral AI)

> 출처: [Introducing Mistral Large 4](https://mistral.ai/news/mistral-large-4/) (Mistral AI 공식 발표 추정 · GeekNews 경유) · 정리일 2026-10-07

> **출처 한계**: news.hada.io와 mistral.ai 원문 모두 이번 세션에서 egress 차단으로 직접 열지 못했다. MarkTechPost, VKTR, Yahoo Finance, Il Sole 24 ORE, kingy.ai, cellcog.ai 등 6곳 이상의 2차 매체가 파라미터 수(1.05조, 활성 490억)·GPU 인프라(3,800장 Grace Blackwell)·가격·공개 일정을 거의 일치해서 보도해 교차확인된 사실로 다뤘지만, 원문 문장 단위 대조는 못 했다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**Mistral의 가장 큰 멀티모달 모델 Large 4("Le Chonk")는 총 1.05조 파라미터 중 490억(약 4.7%)만 활성화하는 MoE 구조로 코딩·보안·금융·법률에 특화했는데, 가중치는 10월 말에야 공개되고 지금은 API 프리뷰만 열려 있다.**

## 핵심 포인트

- 총 1.05조 파라미터, 토큰당 활성 490억 파라미터의 세분화된 MoE 구조. 비전 인코더만 16억 파라미터이고, 텍스트·이미지 입력과 100만 토큰 컨텍스트를 지원한다.
- 유럽 자체 데이터센터에서 ***NVIDIA Grace Blackwell GPU 3,800장***으로 처음부터(from scratch) 학습했다는 점이 스펙 수치보다 더 강조되는 포지셔닝 요소다 - "미국·중국 오픈웨이트에 맞서는 유럽산 주권 AI"라는 메시지.
- 코딩 에이전트 종합 평가(Coding Agent Index)에서 49.8%로 DeepSeek V4 Pro와 Qwen3.8 Max를 앞섰고, 사이버보안 영역에서는 ***실제 취약점을 재현하고 패치하는 테스트에서 82%***로 비교 대상 중 최고치를 기록했다고 보도됐다.
- 법률·금융 평가에서 제3자 평가자가 GPT-6 Astra를 넘어섰다고 보고했고, Harvey의 법률 에이전트 벤치마크에서는 다른 오픈소스 모델을 전부 앞섰다는 주장이다. 시각 이해(Dense 200, 대상 위치 찾기)에서는 42% vs GPT-6 Astra 41%로 근소하게 앞섰다.
- API는 입력 100만 토큰당 $1.36·출력 $4.18로 이미 공개됐지만, ***가중치 자체는 10월 말에야 오픈웨이트로 풀린다*** - 지금은 "오픈웨이트 모델"이라는 수식어가 붙었지만 실제로는 아직 닫혀 있는 프리뷰 단계다.

## 인상 깊은 문장

> "집계 벤치마크 기준으로, Mistral Large 4는 미국이나 유럽에서 나온 최고의 오픈웨이트 모델이다." (Mistral 발표문 요약, 2차 보도 재인용. 원문 전체 문장 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 - "오픈웨이트"라는 말이 지금은 아직 닫혀 있는 상태를 가리킨다

[[2026-08-13-qwen38-2-4t-a95b-open-weights]] 노트는 "오픈웨이트가 로컬 실행 가능을 뜻하지 않는다"는 교훈을 짚었다. Mistral Large 4는 그보다 한 단계 더 - ***발표 시점에 "오픈웨이트"라고 불리지만 실제 가중치는 아직 공개되지 않은 상태***다. 오픈웨이트라는 라벨이 붙는 시점과 실제로 받아서 쓸 수 있는 시점 사이의 간극이 또 한 번 드러난다.

### 핵심 전이 2 - CEO의 "AI는 통제 가능한 소프트웨어다" 발언과의 연속선

[[2026-09-28-mistral-ceo-ai-is-controllable-software]]에서 Mistral CEO 아르튀르 멘슈는 미국 AI 랩들의 종말론적 수사를 "규제 포획"으로 비판했다. Large 4가 코딩·보안·금융·법률처럼 ***구체적이고 통제 가능한 업무 영역에 집중***한 건, 그 철학적 입장(AI는 추상적 위험이 아니라 구체적 도구)을 제품 스펙으로 실제 구현한 사례로 읽을 수 있다.

### 핵심 전이 3 - 미국·중국 다음 축으로서의 "유럽산 오픈 프론티어" 포지셔닝

[[2026-10-06-beam-reflection-ai-501b-open-weight-model]]가 "서방 오픈 프론티어"라는 포지셔닝으로 중국 오픈웨이트(GLM·Kimi)를 겨냥했다면, Mistral Large 4는 그 안에서도 ***미국이 아닌 유럽***이라는 세 번째 축을 분명히 세운다. 같은 주 가든에 쌓인 두 개의 오픈웨이트 발표가, "오픈 vs 클로즈드"를 넘어 "오픈 진영 내부의 지역 경쟁"으로 서사가 세분화되고 있음을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

문서·차트·기술 도면·위성 이미지 분석 능력은 B2B 호스피탈리티 CRS에 느슨하게나마 접점이 있다 - 계약서·요율표·평면도 같은 문서를 멀티모달로 분석하는 쓰임새를 상상할 수 있다. 다만 "유럽 자체 데이터센터" 포지셔닝은 유럽 고객사의 데이터 주권 요구(예: GDPR 맥락에서 미국 클라우드 의존을 꺼리는 호텔 체인)에 응답할 때, 모델 제공사의 데이터 소재지가 영업 논거가 될 수 있다는 원칙 정도로만 참고할 만하다. 직접 적용은 아직 멀다.

## 연관 자료

- [[2026-08-13-qwen38-2-4t-a95b-open-weights]] - "오픈웨이트"라는 말이 로컬 실행 가능·완전한 모델을 뜻하지 않는다는 선행 교훈.
- [[2026-09-28-mistral-ceo-ai-is-controllable-software]] - Mistral CEO의 "AI는 통제 가능한 소프트웨어" 철학과 Large 4의 구체적 업무 특화가 맞물리는 지점.
- [[2026-10-06-beam-reflection-ai-501b-open-weight-model]] - 같은 주에 나온 또 다른 "서방 오픈 프론티어" 포지셔닝, 유럽 대 미국 축으로 세분화.

## 한 달 뒤 회고

*(2026-11-07 즈음) 예고된 가중치 공개가 실제로 10월 말에 이뤄졌는지, 그리고 공개판이 API 프리뷰와 동일한 성능인지(다른 오픈웨이트 모델들이 겪은 "공개판은 축소판" 패턴 반복 여부) 확인한다.*
