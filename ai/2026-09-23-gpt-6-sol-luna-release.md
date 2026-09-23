---
title: "GPT-6 Sol과 Luna 출시 — Astra의 개선을 절반 가격 티어로 내려보냈다 (OpenAI)"
source_title: "GPT-6 Sol과 Luna 출시"
source_url: "https://openai.com/index/introducing-gpt-6-sol-and-luna/"
source_name: "OpenAI 공식 발표, GeekNews(id=34138) 경유"
referrer_url: "https://news.hada.io/topic?id=34138"
published_at: "2026-09-22"
summarized_at: "2026-09-23"
category: "ai"
tags: ["gpt-6", "openai", "model-release", "pricing", "sol", "luna"]
---

# GPT-6 Sol과 Luna 출시

> 출처: [GPT-6 Sol과 Luna 출시](https://news.hada.io/topic?id=34138) (OpenAI, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`openai.com` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장 잘림)와 WebSearch(TechCrunch, VentureBeat, gHacks, GitHub Changelog)로 교차확인했다.

## 한 줄 요약

**GPT-6 Astra의 코딩·전문 업무·컴퓨터 사용 능력을 더 빠르고 저렴한 Sol(추론 강화형)·Luna(초저가 고속형) 두 모델로 확장했고, API 가격은 이전 GPT-5.6 프로모션 가격 대비 절반 수준으로 낮췄다.**

## 핵심 포인트

- **Astra의 능력을 하위 티어로 확장** — GPT-6 Astra의 ***코딩, 전문 업무, 컴퓨터 사용 능력을 더 빠르고 저렴한 모델로 확장***했으며, 사실 정확성과 사용자 지시를 따르는 능력도 개선했다.
- **가격은 이전 대비 절반 수준** — API 가격은 이전 GPT-5.6 프로모션 가격보다 ***절반 수준으로 낮아졌다***. 100만 토큰당 입력/출력 가격은 Sol이 ***2달러/10달러***, Luna가 ***0.10달러/0.50달러***다(WebSearch 확인: Luna는 이전 0.20달러/1.20달러에서 인하, 영구 가격이며 프로모션이 아님).
- **업무 자동화 평가에서 Sol이 Opus 5 상회** — 업무 자동화 평가에서 Sol은 ***Claude Opus 5보다 높은 점수를 작업당 비용의 9%로 달성***했으며, 내부 사실 정확성 평가에서는 이전 Sol보다 오류가 약 절반으로 줄었다.
- **추론 강도·도구 구성을 바꿔도 이전 문제는 유지** — GeekNews 발췌는 "추론 강도나 도구 구성을 바꿔도 이전 문..."에서 끊겼다. WebSearch 확인으로는 Sol이 업무용 추론에, Luna가 빠른 응답·고빈도 사용에 최적화됐고, GPT-5.6 Sol 대비 오류를 절반가량 줄였다는 내용으로 보인다.
- **배포 범위** — ChatGPT Work·Codex 대부분 유료 계정과 API에서 즉시 사용 가능하며, Luna는 데스크톱 앱과 Free·Go 사용자에게도 제공된다.

## 인상 깊은 문장

> "업무 자동화 평가에서 Sol은 Claude Opus 5보다 높은 점수를 작업당 비용의 9%로 달성했으며, 내부 사실 정확성 평가에서는 이전 Sol보다 오류가 약 절반으로 줄었다."
> (GeekNews 발췌 원문)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). "Opus 5보다 높은 점수를 비용의 9%로"는 OpenAI 자체 벤치마크·자사 선정 비교 대상(Opus 5, Opus 5.5 아님)이라는 점에서 액면 그대로 받아들이기보다 제3자 벤치마크(Artificial Analysis 등)로 교차 검증이 필요하다.

## 내 생각 · 적용점

### 핵심 전이 — GPT-6 Astra 계열과 Claude 5.5 계열이 같은 날 같은 전략(저가 티어 확장)을 폈다

같은 날 GeekNews에 올라온 [[2026-09-23-claude-opus-5-5-release]]와 이 글은 정확히 같은 전략을 취하고 있다 — 최상위 모델(Astra/Fable 5.1)의 능력을 더 저렴한 하위 모델로 "낙수"시키는 방식이다. 가든에는 이미 [[2026-09-04-openai-gpt-6-astra-release]], [[2026-09-07-gpt-6-astra-harness-is-the-product]] 등 Astra 계열 기록이 쌓여 있는데, Sol/Luna는 그 계열의 "가격 경쟁 축"을 담당한다. 경쟁사(Anthropic)가 같은 날 같은 방향(저비용화)으로 움직인 것은 프론티어 모델 경쟁이 이제 "최고 성능"이 아니라 "그 성능을 얼마나 싸게 내리느냐"로 무게중심이 옮겨갔음을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

CRS의 대량·반복적인 AI 작업(문의 분류, 로그 요약, 간단한 응답 초안)은 Astra급 모델이 아니라 Luna급 초저가 모델로도 충분할 가능성이 크다. 모델 선택을 "가장 똑똑한 모델 하나"가 아니라 작업 난이도별로 Sol/Luna 같은 티어를 나누는 라우팅 전략으로 재설계하면 비용을 크게 줄일 수 있다 — 다음 모델 선택 검토 시 작업을 난이도별로 분류하는 것부터 시작.

## 연관 자료

- [[2026-09-04-openai-gpt-6-astra-release]] — GPT-6 최상위 모델 Astra 출시
- [[2026-09-07-gpt-6-astra-harness-is-the-product]] — Astra의 하네스 중심 전략
- [[2026-09-23-claude-opus-5-5-release]] — 같은 날 나온 Anthropic의 저비용화 대응

## 한 달 뒤 회고

*(2026-10-23 즈음 — Sol/Luna 실제 API 응답 품질을 GeekNews·Reddit 후기로 재확인, CRS 내부 작업 난이도별 모델 라우팅 검토 진행 여부 점검.)*
