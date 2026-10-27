---
title: "GPT-6.1 Terra 공개 (OpenAI) — Sol의 절반 가격에, 자체 평가에서 3배 빠른 작업 완료"
source_title: "GPT-6.1 Terra - 시각적 추론과 컴퓨터 사용을 결합한 고속 모델"
source_url: "https://news.hada.io/topic?id=36059"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-10-27 추정"
summarized_at: "2026-10-27"
category: "ai"
tags: ["openai", "gpt-6-1-terra", "visual-reasoning", "computer-use", "llm-pricing", "agents-last-exam", "chatgpt-work", "codex"]
---

# GPT-6.1 Terra 공개 (OpenAI)

> 출처: [GPT-6.1 Terra - 시각적 추론과 컴퓨터 사용을 결합한 고속 모델](https://news.hada.io/topic?id=36059) (GeekNews) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-10-27
>
> **출처 한계**: `news.hada.io`가 이 세션에서 DNS 레벨로 막혀 원문·hada 댓글을 전혀 열람하지 못했다(`getaddrinfo ENOTFOUND`). WebSearch로 교차검증한 결과, ***GPT-6.1 Terra의 공식 발표 자체는 아직 WebSearch 색인에 잡히지 않았지만, 그 직전 신호는 여러 매체가 일치시켜 보도***하고 있었다 — Microsoft의 평가 설정 코드에서 10월 16일경 18개 평가 구성이 "GPT-5.6 Terra"에서 "GPT-6.1 Terra" 문자열로 바뀐 흔적이 포착됐고(testingcatalog.com), The Information이 "새 Terra 모델이 GPT-6.1 Sol보다 낮은 가격에 더 나은 성능을 낼 것"이라고 보도했다는 2차 보도도 확인했다(일부 매체는 출시가 11월로 밀릴 수 있다는 전망도 함께 전했다). 즉 ***이 발표가 실제로 2026-10-27에 이뤄졌다면 WebSearch가 색인하기엔 너무 최근이라서 못 잡았을 가능성이 높다*** — Slack 발췌의 구체 수치(가격, Agents' Last Exam 점수)는 WebSearch로 독립 검증하지 못했고 전적으로 Slack 발췌에 의존한다. **"Agents' Last Exam"은 OpenAI 자체 평가 명칭으로, 독립 재현 검증이 없는 자사 벤치마크라는 점을 명시한다.** 모델명·버전명은 Slack 발췌 그대로 사용한다.

## 한 줄 요약

**OpenAI가 세밀한 시각적 추론, 정밀한 컴퓨터 사용, 더 자연스러운 글쓰기를 결합한 GPT-6.1 Terra를 공개했다 — 표준 API 가격이 선행 모델 GPT-6.1 Sol의 절반(100만 토큰당 입력 1달러·캐시 입력 0.05달러·출력 5달러)이면서도, OpenAI 자체 평가 Agents' Last Exam에서 중간 추론 설정으로 GPT-5.6 Terra보다 15%p 높은 점수를 약 3분의 1 비용에, GPT-6 Astra·GPT-6.1 Sol보다 3배 이상 빠른 작업 완료 속도로 기록했다고 주장한다.**

## 핵심 포인트

- **세 가지 역량의 결합** — 세밀한 시각적 추론, 정밀한 컴퓨터 사용, 더 자연스러운 글쓰기를 결합해 다양한 업무를 지원한다는 포지셔닝이다. "시각적 추론 + 컴퓨터 사용"의 조합은 화면을 보고 직접 조작하는 에이전틱 작업(웹 자동화, UI 테스트 등)을 겨냥한 것으로 읽힌다.
- **Sol의 절반 가격** — 표준 API 가격이 100만 토큰당 ***입력 1달러, 캐시 입력 0.05달러, 출력 5달러***로, 바로 앞선 GPT-6.1 Sol의 절반이다. [[2026-09-30-gpt-6-1-sol-release]]가 "Astra급 성능을 5분의 1 가격"이라고 자리매김했던 가격 인하 추세가 Terra에서도 반복된다.
- **구독 사용자에게도 체감 혜택** — ChatGPT Work와 Codex에서도 같은 사용 한도로 더 많은 작업을 처리할 수 있다 — API 단가 인하가 구독형 한도 체감으로도 이어지는 패턴이다.
- **자체 평가 수치** — Agents' Last Exam에서 중간 추론 설정으로 ***GPT-5.6 Terra보다 15%p 높은 점수를 약 3분의 1 비용***에 기록했고, 작업 완료 속도는 ***GPT-6 Astra와 GPT-6.1 Sol보다 3배 이상 빨랐다***. 모두 OpenAI 자체 평가명(Agents' Last Exam)에서 나온 수치로, 독립 재현 검증은 없다(이하 생략, 원문 미확보로 추가 세부 확인 못함).

## 인상 깊은 문장

> "GPT-6.1 Sol의 절반이며, ChatGPT Work와 Codex에서도 같은 사용 한도로 더 많은 작업을 처리할 수 있음" (Slack 발췌)

가격표의 숫자(절반)보다 이 문장의 두 번째 절이 실제 사용자에게는 더 중요하다 — "같은 한도로 더 많은 작업"이라는 서술은, [[2026-10-26-openai-anthropic-llm-price-cuts-cache-read-economics]]가 지적했던 "단가 인하가 코딩 에이전트의 체감 비용에 실제로 어떻게 반영되는지가 입출력 단가보다 더 중요하다"는 논지와 정확히 맞물린다.

## 댓글

GeekNews 토픽 ID 36059, 댓글 수는 원문 차단으로 확인하지 못했다. **정직성 측면에서 강조할 점**: Agents' Last Exam 점수·속도 비교는 모두 OpenAI가 직접 설계·발표한 벤치마크이며, 제3자가 독립적으로 재현한 결과가 아니다. [[2026-10-26-openai-anthropic-llm-price-cuts-cache-read-economics]] 노트에서 이미 짚었듯, "모델 품질을 떨어뜨리지 않고 가격만 내렸다"는 벤더 주장은 그 자체로 검증하기 어려운 영역이고, 이번 Terra의 "3배 빠르다"는 주장도 같은 구조의 자사 벤치마크 수사라는 점을 감안해야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-30-gpt-6-1-sol-release]]와의 직접 계열.** 그 노트가 다룬 Sol은 "Astra급 성능을 5분의 1 가격"이라는 공식으로 등장했다. 이번 Terra는 그 Sol보다 다시 절반 가격이면서 더 빠르다고 주장한다 — OpenAI의 최근 라인업이 "신모델 = 이전 최상위급 성능을 매번 더 싸게"라는 동일한 공식을 반복하고 있다는 패턴이 두 노트를 나란히 놓으면 뚜렷해진다. 이 반복 자체가 곧 [[2026-10-26-openai-anthropic-llm-price-cuts-cache-read-economics]]가 정리한 "모델 벤더 간 가격 경쟁이 지속되는 압력"이라는 결론의 또 하나의 사례다.

**핵심 전이 2 — [[2026-10-26-openai-anthropic-llm-price-cuts-cache-read-economics]]와의 정면 연결, 단가 인하와 체감 비용의 관계.** 그 노트의 핵심은 "입출력 단가보다 캐시 읽기 단가가 코딩 에이전트의 체감 비용을 더 크게 좌우한다"는 것이었다. Terra의 가격표에도 캐시 입력가(0.05달러)가 별도로 명시돼 있는데, 이는 입력가(1달러)의 20분의 1 수준이다 — 캐시 적중률이 높은 반복적 에이전트 작업(코딩, 컴퓨터 사용 자동화)일수록 체감 비용이 표면 단가보다 훨씬 더 떨어질 수 있다는 그 노트의 논지가 Terra에도 그대로 적용된다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성이 있다.** "시각적 추론 + 컴퓨터 사용" 조합은 화면 기반 레거시 시스템(구형 PMS·GDS 화면)을 사람 대신 조작하는 RPA형 에이전트 작업에 쓸 수 있는 역량이다 — 온다의 CRS가 연동하는 호텔 측 레거시 시스템 중 API가 없는 화면 조작 의존 시스템이 있다면, 이런 모델이 비용 효율적인 자동화 옵션이 될 수 있다. 다만 이는 구체적 연동 니즈가 확인된 가정이 아니라 ***역량 매칭 수준의 가능성***이며, 가격·속도 수치는 OpenAI 자체 평가라는 한계를 감안해 실제 도입 전 자체 벤치마크가 필요하다.

## 연관 자료

- [[2026-09-30-gpt-6-1-sol-release]] — Terra의 바로 앞선 모델, "이전 최상위급 성능을 매번 더 싸게"라는 같은 가격 공식을 보여준 글.
- [[2026-10-26-openai-anthropic-llm-price-cuts-cache-read-economics]] — LLM 가격 인하가 캐시 읽기 단가를 통해 체감 비용에 반영되는 구조를 분석한 글, Terra의 가격표가 그 구조를 다시 한번 보여주는 사례.

## 한 달 뒤 회고

2026-11-27 즈음, OpenAI 공식 가격 페이지와 `news.hada.io` 접근이 풀렸다면 (1) GPT-6.1 Terra가 실제로 10월 27일에 출시됐는지 아니면 11월로 밀렸는지, (2) Agents' Last Exam 점수가 제3자 벤치마크(예: SWE-bench 류)로도 교차확인되는지, (3) 캐시 읽기 단가가 실제 코딩 에이전트 하네스(Codex 등)에서 체감 비용을 얼마나 낮췄는지 점검한다.
