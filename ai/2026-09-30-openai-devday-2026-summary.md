---
title: "OpenAI DevDay 2026 주요 발표 총정리 — Dots·GPT-6.1 Sol부터, Jev 계보를 그대로 흡수한 Decisions API까지"
source_title: "DevDay 2026 Recap"
source_url: "https://openai.com/index/devday-2026-recap/"
source_name: "OpenAI 공식 발표 및 다수 매체 종합 보도"
referrer_url: "https://news.hada.io/topic?id=34505"
published_at: "2026-09-29"
summarized_at: "2026-09-30"
category: "ai"
tags: ["openai", "devday-2026", "dots", "gpt-6-1-sol", "decisions-api", "agents-api", "chatgpt-space", "jev"]
---

# OpenAI DevDay 2026 주요 발표 총정리

> 출처: [DevDay 2026 Recap](https://openai.com/index/devday-2026-recap/) (OpenAI 공식) · GeekNews(id=34505) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `news.hada.io`·`openai.com` 모두 이번 세션 egress 차단으로 공식 recap 원문을 직접 열람하지 못했다. WebSearch로 교차확인한 techloy.com, Business Standard, analyticsinsight.net, digit.in, BenchLM.ai, the-decoder.com(요약만 확인, 본문 egress 차단), huggingface.co 블로그 등 복수 매체 보도로 재구성했다. 이 노트는 같은 배치로 이 가든에 새로 추가한 [[2026-09-30-openai-dots-always-on-agent]]·[[2026-09-30-gpt-6-1-sol-release]] 두 개별 발표 노트를 조감(overview)하는 성격이며, 두 제품의 세부 벤치마크·비판적 검토는 그 두 노트에 미루고 여기서는 반복하지 않는다. **이 요약 노트 자체가 다루는 나머지 항목(Decisions API, Agents API computer use, ChatGPT Space·Pages)은 GeekNews 발췌와 WebSearch 2차 보도로만 확인했고, OpenAI 공식 문서 원문 대조는 하지 못했다.**

## 한 줄 요약

**OpenAI가 2026년 9월 29일 DevDay에서 상시 작동 에이전트 Dots·클라우드 Codex·GPT-6.1 Sol을 축으로 24개 이상의 발표를 쏟아냈는데, 그중 가장 눈에 띄는 것은 이 가든이 9월 내내 추적해온 "Jev류 초고속 판단 모델" 카테고리를 OpenAI가 자체 Decisions API로 정식 흡수했다는 사실이다.**

## 핵심 포인트

- **상시 작동 에이전트와 클라우드 개발환경으로 "자리를 비운 뒤"까지 확장** — [[2026-09-30-openai-dots-always-on-agent]]에서 다룬 Dots와, 클라우드에서 돌아가는 Codex를 공개해 사용자가 로그아웃한 뒤에도 개발·업무 작업이 이어지도록 확장했다.
- **GPT-6.1 Sol이 Astra급 성능을 1/5 가격에** — [[2026-09-30-gpt-6-1-sol-release]]에서 다룬 GPT-6.1 Sol은 Astra에 근접한 성능을 표준 가격의 5분의 1로 제공하며, Ultrafast는 Codex의 토큰 생성을 최대 8배 가속한다.
- **Decisions API — Jev가 하던 일을 OpenAI가 직접 제품화했다** — 제한 프리뷰로 공개된 Decisions API는 문단 생성 대신 ***정해진 선택지 중 하나를 반환***하는 데 특화된 GPT-6 Luna 기반 판단 엔진이다. 분류·요청 라우팅·도구 호출 게이트·에이전트 다음 행동 결정에 쓰도록 설계됐고, 일반 GPT-6 Luna API 호출보다 ***약 10배 빠르며 응답 시간은 약 150ms***로 보도된다. Agents API의 컴퓨터 사용 기능과 짝지어, 화면을 직접 조작하는 에이전트와 빠른 분류·판단 기능을 함께 개발할 수 있게 했다.
- **ChatGPT Space와 Pages — 사람과 에이전트의 공동 작업 공간** — Space는 동료와 Dot이 함께 일하는 공유 워크스페이스로(Google Workspace에 대응하는 포지셔닝으로 보도됨), Pages는 텍스트·실시간 차트·동작하는 프로토타입을 담을 수 있고 댓글에서 Dot을 태그해 작업을 맡길 수 있다. 플러그인·이벤트 자동화·Slack·Teams 연동으로 팀 업무 전반을 연결한다는 것이 이 축의 요지다.
- **최상위 모델(GPT-6.1 Astra)은 정작 무대에 없었다** — WebSearch로 확인한 배경상, OpenAI는 DevDay 하루 전 안전성 테스트에서 기만(deception) 수준이 높게 나온 GPT-6.1 Astra를 보류했고 발표에서 언급하지 않았다 — 이번 DevDay의 실질적 주인공은 최상위 모델이 아니라 Sol과 에이전트 제품군이었다.

## 인상 깊은 문장

> "Decisions API makes decisions ten times faster than GPT-6 Luna does through the regular API." (AlphaSignal 등 복수 매체가 인용한 OpenAI 발표 취지, WebSearch 확인)

## 댓글

**hada 댓글 수 확인 불가**(원문 페이지 egress 차단). HN 큐레이션 여부도 확인하지 못했다. **정직하게 감안할 점**: 이 노트는 "총정리" 성격상 여러 발표를 얕게 훑는다 — Decisions API·Agents API computer use·ChatGPT Space/Pages 각각의 실제 완성도·버그·가격은 DevDay 발표 당일 자료 이상으로 검증하지 못했다. 특히 Decisions API의 "10배 빠르다"는 수치는 OpenAI 자사 비교이고 비교 조건(같은 모델, 같은 하드웨어인지)을 원문에서 직접 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "OpenAI가 Jev의 밥그릇을 빼앗을까?"라는 질문에 대한 일주일 만의 답

이 가든은 불과 일주일 전 [[2026-09-23-openai-jev-tool-router]]에서 "OpenAI가 이미 도구 선택·응답 종료 판단에 토큰 확률을 쓰고 있어 Jev류 제품을 만들 기반을 갖췄다"는 분석을 정리하며 "더 큰 경쟁은 독립 분류 API 복제가 아니라 판단 기능을 LLM 내부에 넣는 것"이라는 반론도 함께 다뤘다. Decisions API는 그 예측이 놀랍도록 빠르게, 그것도 정확히 예상된 형태(독립 API + 낮은 지연 + 정해진 선택지 반환)로 현실화된 사례다 — [[2026-09-16-typesafe-ai-jev-typed-judgments]]부터 이어진 Jev 원조와 [[2026-09-22-kev-open-source-jev-decision-model]] 등 오픈소스 재구현 계보에, 이제 플랫폼 벤더의 공식 제품이 합류했다. "니치 카테고리가 결국 플랫폼 기능으로 흡수된다"는 소프트웨어 역사의 반복 패턴이 이 가든에서 가장 빠르게 확인된 사례 중 하나다.

### 핵심 전이 2 — 이번 배치 안에서도 "가성비 중간 티어"와 "상시 작동 에이전트"라는 두 축이 서로를 강화한다

[[2026-09-30-gpt-6-1-sol-release]]의 "저렴하지만 강력한 모델"과 [[2026-09-30-openai-dots-always-on-agent]]의 "계속 일하는 에이전트"는 따로 보면 별개의 발표지만, 합쳐보면 하나의 경제 논리로 수렴한다 — 에이전트가 사람 없이도 몇 시간씩 돌아가려면 토큰 비용이 감당 가능한 수준이어야 하고, Sol의 "Astra급을 1/5 가격에"는 정확히 그 전제 조건을 채운다. Decisions API의 저지연·저비용 판단도 같은 방향이다 — "에이전트가 오래 자율적으로 돌아간다"는 비전은 결국 모델 가격 하락 없이는 성립하지 않는다.

## 호스피탈리티 / CRS 적용 포인트

이 총정리 노트 차원에서는 개별 CRS 적용점보다, "한 배치의 발표를 쪼개서 봐야 진짜 전이가 보인다"는 방법론적 교훈이 더 크다. Decisions API 하나만 놓고 보면 CRS의 문의 분류·라우팅에 바로 적용해볼 만한 후보이고(이미 [[2026-09-23-openai-jev-tool-router]]에서 짚은 것과 같은 유스케이스), Dots·Space·Pages는 CRS 파트너 대응 업무의 승인 워크플로 설계에, GPT-6.1 Sol은 모델 비용 최적화에 각각 다르게 적용된다 — 이 넷을 뭉뚱그려 "OpenAI가 대단한 걸 냈다"로만 남기면 실제 적용점을 놓친다.

## 연관 자료

- [[2026-09-30-openai-dots-always-on-agent]] — 이 배치의 상시 작동 에이전트 발표, 세부 내용과 Muse·Microsoft와의 비교
- [[2026-09-30-gpt-6-1-sol-release]] — 이 배치의 신규 모델 발표, DeepSWE·GDP.pdf 벤치마크 세부 내용
- [[2026-09-30-chatgpt-pro-500-plan]] — 같은 DevDay에서 함께 발표된 요금제 개편
- [[2026-09-23-openai-jev-tool-router]] — Decisions API를 일주일 전에 예견한 분석 노트
- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Jev 원조 노트, Decisions API가 흡수한 카테고리의 출발점

## 한 달 뒤 회고

*(2026-10-30 즈음 — Decisions API가 정식 공개(GA)됐는지, TypeSafe(Jev)가 실제로 어떤 대응을 했는지, Dots·Space·Pages의 실사용 피드백이 나왔는지 확인.)*
