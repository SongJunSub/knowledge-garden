---
title: "OpenAI, 미공개 모델이 도출한 수학 연구 원고 722편 공개 (OpenAI) - '풀었다'와 '검증됐다'는 여전히 다른 질문"
source_title: "OpenAI releases 722 math manuscripts from an unreleased model"
source_url: "https://openai.com (GeekNews·openai.com 모두 접근 차단, WebSearch로 교차확인한 재구성)"
source_name: "OpenAI, 2차: Unite.ai, Interesting Engineering, Latent Space, Startup Fortune 등 복수 매체"
referrer_url: "https://news.hada.io/topic?id=34910"
published_at: "2026-10-06"
summarized_at: "2026-10-07"
category: "ai"
tags: ["openai", "ai-for-math", "lean", "formal-verification", "research-ethics", "multi-agent"]
---

# OpenAI, 미공개 모델이 도출한 수학 연구 원고 722편 공개 (OpenAI)

> 출처: [OpenAI releases 722 math manuscripts from an unreleased model](https://openai.com) (OpenAI 공식 발표 추정 · GeekNews 경유) · 정리일 2026-10-07

> **출처 한계**: GeekNews 토픽 페이지(news.hada.io)와 openai.com 원문 모두 이번 세션의 네트워크 egress 차단으로 직접 접근하지 못했다. Slack 발췌와 WebSearch로 확인한 Unite.ai, Interesting Engineering, Startup Fortune, Latent Space, 알파시그널 등 5곳 이상의 2차 매체가 핵심 수치(722편, 372개 결과 묶음, 약 4,000개 연구 문제 시도)를 일치해서 보도하고 있어 교차확인된 사실로 다루지만, 원문 문장 단위 대조는 하지 못했다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**OpenAI가 미공개 내부 모델로 약 4,000개 연구 문제를 시도해 나온 결과를 722편의 원고(372개 결과 묶음)로 한꺼번에 공개했지만, 공개 트리에서 기계 검증 가능한 Lean 증명이 붙은 것은 전체의 5분의 1 정도라, "풀었다"는 발표와 "검증됐다"는 사실 사이의 간극이 또 한 번 그대로 드러났다.**

## 핵심 포인트

- 미공개 내부 모델에 약 4,000개 연구 문제를 제시했고, 결과 하나당 평균 연산량은 같은 모델로 ChatGPT Pro가 약 3시간 생각하는 데 쓰는 연산량에 해당한다고 밝혔다.
- 722편의 원고를 ***372개 결과 묶음***(관련 결과·대안 증명·후속 논문 포함)으로 구성해 GitHub 저장소에 공개했고, preprints 디렉터리에는 PDF·소스·인용/빌드 안내가 함께 들어 있다.
- 다수의 증명을 Lean 4로 형식화해 컴퓨터로 검사할 수 있게 공개했지만, 2차 보도에 따르면 ***공개 트리에서 기계 검증 가능한 증명이 붙은 건 722편 중 대략 5분의 1 수준***이고, README 자체가 "형식화되지 않은 결과 중 일부는 문제가 있을 수 있다"고 경고한다.
- 모델의 추론 요약 10건(연구 과정 정보 포함)을 함께 공개했는데, 논문을 수정할 때 이전 추론 단계를 어떻게 다뤘는지까지 포함된 것으로 보이나 이 부분은 Slack 발췌가 절단되어 세부는 확인 못 했다.
- 반응은 둘로 갈렸다. 수학계 일각은 "100년 만에 가장 중요한 순간"이라는 호평을 냈고, 다른 축은 ***"attribution and process issues"***, 즉 이번에도 다른 연구자에게 접촉해 질문하는 방식이 "스쿠핑(선점)처럼 보인다"는 불만과, 바로 두 달 전 나비에-스토크스 발표 때 터진 저자권 압박 논란([[2026-09-09-navier-stokes-proof-controversy]])이 다시 거론됐다고 보도됐다.
- "Quasi-Riemann Hypothesis(유사 리만 가설)"류의 자극적 제목으로 보도된 매체도 있었는데, 실제로는 500대 미해결 문제 중 일부를 다룬 것이라 보도 수위와 실제 검증 수위 사이에 또 간극이 있다.

## 인상 깊은 문장

> "Some of the unformalized results could have issues. We will endeavor to fix any such issues quickly." (OpenAI 저장소 README, 2차 보도 인용. 원문 직접 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. Hacker News 쪽은 복수 스레드로 갈렸다는 보도가 있는데, 수 이론·복잡도 이론 전공자들이 개별 결과를 놓고 다투는 양상이었고 "empathy is the new cope"류의 날선 반응과 "검증 가능한 저가 하드웨어에서 실행 가능해지는 게 진짜 상인데 지금은 그게 아니다"는 신중론이 함께 보도됐다(2차 소스, 원문 스레드 대조는 못 함).

## 내 생각 · 적용점

### 핵심 전이 1 - 같은 회사, 두 달 간격, 같은 저자권 갈등의 재발

[[2026-09-09-navier-stokes-proof-controversy]]에서 OpenAI(Bubeck)가 Anthropic 소속 연구자 Alpöge를 저자에서 빼려 했다는 성명이 터진 지 두 달도 안 돼, 이번에도 "타 연구자에게 접촉해 질문하는 방식이 선점처럼 느껴진다"는 비슷한 불만이 또 나왔다. [[2026-09-12-fields-medalists-ai-math-misalignment]]에서 필즈상 수상자 25인이 "문제 풀이는 목적이 아니라 이해로 가는 도구"라고 경고한 바로 그 우려가, 이번 대규모 공개로도 해소되지 않고 패턴으로 반복된다는 뜻이다. 대규모 공개(722편)가 투명성의 증거로 제시됐지만, 공개량과 검증 비율은 서로 다른 축이다.

### 핵심 전이 2 - Anthropic의 Lean 형식화와 접근 방식 대조

[[2026-09-05-anthropic-fermat-last-theorem-lean]]은 "페르마의 마지막 정리" 하나를 11일간 공유 그래프 기반 멀티에이전트로 형식화하는 데 집중한 사례였다. 이번 OpenAI 공개는 반대로 ***폭(722편)을 밀어붙이고 검증(Lean 형식화)은 뒤따라오는 방식***이라, "깊이 하나를 완전히 검증" vs "넓이를 먼저 던지고 검증을 나중에 채운다"는 두 회사의 전략 차이가 선명하게 대비된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 "발표된 수치(722, 372)가 곧 완결·검증을 뜻하지 않는다"는 원칙은, CRS에서 AI가 생성한 대량의 분석·리포트(예: 수백 건의 요금 추천이나 이상 탐지 결과)를 받을 때도 "건수"와 "검증된 건수"를 분리해서 보는 습관으로 전이할 수 있다.

## 연관 자료

- [[2026-09-09-navier-stokes-proof-controversy]] - 두 달 전 같은 회사에서 터진 저자권 압박 논란이 이번에도 비슷한 형태로 재발했다는 직접 대구.
- [[2026-09-12-fields-medalists-ai-math-misalignment]] - "풀었다"와 "이해했다"를 혼동하지 말라는 경고가 이번 대규모 공개로도 해소되지 않았음을 보여주는 배경.
- [[2026-09-05-anthropic-fermat-last-theorem-lean]] - 같은 Lean 형식화 도구를 쓰면서도 "깊이 우선"과 "폭 우선"으로 정반대 전략을 취한 대조 사례.

## 한 달 뒤 회고

*(2026-11-07 즈음) 722편 중 형식화 비율이 실제로 늘었는지, 그리고 저자권 관련 불만이 공식 대응으로 이어졌는지 후속 보도를 확인한다.*
