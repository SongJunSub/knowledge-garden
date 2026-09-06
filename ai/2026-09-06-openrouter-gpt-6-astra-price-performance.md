---
title: "OpenRouter에서 GPT-6 Astra 사용하기: 가격과 성능 비교 — 같은 모델을 부르는데 경로마다 가격이 최대 4배, 속도·정확도 우선순위에 따라 고를 모드가 다르다"
source_title: "GPT-6 Astra on OpenRouter — Price and Performance Comparison"
source_url: "https://openrouter.ai/openai/gpt-6-astra"
source_name: "OpenRouter"
referrer_url: "https://news.hada.io/topic?id=33265"
published_at: "2026-09-05"
summarized_at: "2026-09-06"
category: "ai"
tags: ["gpt-6-astra", "openrouter", "openai", "model-pricing", "model-routing", "llm-cost"]
---

# OpenRouter에서 GPT-6 Astra 사용하기: 가격과 성능 비교 — 같은 모델을 부르는데 경로마다 가격이 최대 4배, 속도·정확도 우선순위에 따라 고를 모드가 다르다

> 출처: [GPT-6 Astra — API Pricing & Benchmarks](https://openrouter.ai/openai/gpt-6-astra) (OpenRouter) · GeekNews(id=33265) 경유 · 정리일 2026-09-06

> **출처 한계**: `openrouter.ai`·`news.hada.io` 모두 이번 세션 egress 차단으로 원문 직접 열람 불가. Slack 발췌 요약과 WebSearch로 확인한 OpenRouter 공개 가격표·모델 비교 페이지 스니펫을 교차 확인해 재구성했다. 실제 이 글이 OpenRouter 공식 블로그의 별도 비교 포스트인지, 모델 페이지 자체를 가리키는지는 확정하지 못했다.

## 한 줄 요약

**같은 GPT-6 Astra 모델을 OpenRouter를 통해 여러 공급 경로로 호출할 수 있으며, 경로별로 가격·응답 속도·오류율이 달라진다. 100만 토큰당 입력/출력 가격은 OpenAI Flex $5/$25, 일반 OpenAI $10/$50, OpenAI Fast $20/$100로 경로에 따라 최대 4배 차이가 나며, 가격·속도를 함께 고려하는 기본 모드 외에 빠른 응답(Nitro)이나 도구 호출 정확도(Exacto)를 우선하는 요청 분배 모드를 별도로 제공한다.**

## 핵심 포인트

- **동일 모델, 경로별 가격 차이** — 100만 토큰당 입력/출력 가격이 OpenAI Flex $5/$25, 일반 OpenAI $10/$50, OpenAI Fast $20/$100로, 가장 싼 경로와 가장 비싼 경로 사이에 4배 차이가 난다. Fast 경로는 EU 데이터 상주 옵션과 함께 쓸 수 없다는 제약도 있다(WebSearch로 확인).
- **캐시 가격 별도** — 캐시 읽기 $1/M 토큰, 캐시 쓰기 $12.5/M 토큰으로, 표준 입력 단가($10)보다 캐시 쓰기가 더 비싸다는 점을 유의해야 한다.
- **272,000 토큰 임계값** — 요청이 27만 2천 입력 토큰을 넘으면, 해당 요청 전체에 대해 입력·캐시 단가가 2배, 출력 단가가 1.5배로 뛴다. 긴 컨텍스트 요청의 비용을 과소평가하기 쉬운 함정.
- **세 가지 요청 분배 모드** — 가격과 속도를 함께 고려하는 Balanced(기본), 응답 속도를 최우선하는 Nitro, 도구 호출 정확도를 최우선하는 Exacto 세 모드를 제공한다. GPT-6 Astra의 강점이 장시간 에이전틱 작업(컴퓨터·브라우저 사용)이라는 점에서, 에이전트 워크로드에서는 Exacto가 특히 의미 있는 선택지가 될 수 있다.
- **공급자별 성능 지표 공개** — 처리량(토큰/초), 지연시간(총 왕복 시간), TTFT(첫 토큰까지 걸리는 시간) 등을 공급자별로 공개하며, 이 수치는 실제 요청 기반으로 계속 갱신된다.

## 인상 깊은 문장

> (Slack 발췌 재인용) "100만 토큰당 입력/출력 가격은 OpenAI Flex $5/$25, 일반 OpenAI $10/$50, OpenAI Fast $20/$100으로 경로에 따라 차이가 큼"

## 댓글

hada 댓글 수, HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. WebSearch에서 GPT-6 Astra의 OpenRouter 등재 자체가 별도 HN 스레드로 논의된 흔적을 확인했으나(news.ycombinator.com 접근 차단으로 내용은 미확인), 초기 반응이 가격·지연시간·기존 모델 대비 전환 가치에 집중됐다는 정황만 확인했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 주에 정리한 GPT-6 Astra 두 노트와 삼각 구도를 이룬다

[[2026-09-04-openai-gpt-6-astra-release]](공식 발표: OSWorld·Mind2Web 벤치마크)와 [[2026-09-04-gpt-6-astra-arc-agi-3]](같은 모델이 하네스에 따라 62.7%~99.9%까지 벤치마크 점수가 갈린 사례)에 이 노트를 더하면, **"같은 모델"이라는 말이 실제로는 벤치마크 하네스·요청 분배 경로에 따라 전혀 다른 실체를 가리킬 수 있다**는 하나의 명제가 세 각도에서 확인된다. GPT-6 Astra ARC-AGI-3 노트가 "하네스가 다르면 벤치마크도 다른 걸 잰다"고 정리했다면, 이 노트는 "경로가 다르면 가격도, 속도도, 오류율도 다른 걸 산다"는 실무 버전이다.

### 핵심 전이 2 — [[2026-08-04-speed-over-intelligence-model-choice]]의 "속도가 병목" 논지에 대한 구체적 반증 자료

Martin Alderson의 글이 "모델 속도를 5배 올려도 도구 호출·사람 검토 시간이 그대로면 전체 턴은 2배만 빨라진다"고 지적했던 병목 구조를, OpenRouter의 Nitro(속도)와 Exacto(도구 호출 정확도) 분리 자체가 실무적으로 인정하는 셈이다 — **속도만 올리는 것과 도구 호출 정확도를 올리는 것은 다른 최적화 축**이라는 걸, OpenRouter가 아예 별도 라우팅 모드로 만들어 놓았다는 점이 흥미롭다.

## 호스피탈리티 / CRS 적용 포인트

바로 적용 가능한 실무 원칙이다. **CRS가 GPT-6 Astra 같은 모델을 OpenRouter 경유로 쓴다면, 워크로드 특성에 따라 라우팅 모드를 분리해야 한다** — 예를 들어 야간 배치로 돌리는 리뷰 요약·컨텐츠 생성은 Flex(저렴)로, 실시간 채널 매니저 연동처럼 도구 호출(API 연동) 정확도가 중요한 워크로드는 Exacto로, 고객 응대 챗봇처럼 응답 지연이 체감되는 워크로드는 Nitro로 나누는 식이다. 특히 272,000 토큰 임계값을 넘으면 비용이 급증한다는 점은, 긴 대화 컨텍스트를 그대로 누적시키는 CRS 챗봇 설계에서 반드시 확인해야 할 비용 함정이다.

## 연관 자료
- [[2026-09-04-openai-gpt-6-astra-release]] — GPT-6 Astra 공식 발표, 벤치마크·사이버보안 등급
- [[2026-09-04-gpt-6-astra-arc-agi-3]] — 같은 모델이 하네스에 따라 벤치마크 점수가 극단적으로 갈린 사례, 이 노트의 "경로별 가격·속도 차이"와 같은 축
- [[2026-08-04-speed-over-intelligence-model-choice]] — 속도 최적화만으로는 전체 턴 시간이 크게 줄지 않는다는 병목 구조, Nitro/Exacto 분리와 맞닿음

## 한 달 뒤 회고
*(2026-10-06 즈음 — GPT-6 Astra의 경로별 가격이 변동됐는지, 실제로 CRS 워크로드에 라우팅 모드를 분리 적용해봤다면 그 결과를 기록.)*
