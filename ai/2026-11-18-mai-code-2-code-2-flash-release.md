---
title: "MAI Code 2와 Code 2 Flash (Microsoft AI) — 자사 발표 벤치마크 수치는 'MAI Code 2'라는 이름 자체부터 외부에서 확인되지 않는다"
source_title: "MAI Code 2와 Code 2 Flash 발표 (제목 미확인)"
source_url: "https://news.hada.io/topic?id=37368"
source_name: "GeekNews (news.hada.io)"
referrer_url: "https://news.hada.io/topic?id=37368"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "ai"
tags: ["microsoft", "mai-code", "coding-agent", "price-performance", "benchmark", "github-copilot"]
---

# MAI Code 2와 Code 2 Flash (Microsoft AI)

> 출처: [MAI Code 2와 Code 2 Flash - 일상적인 기업 코딩의 가격 대비 성능에 초점을 맞춘 모델](https://news.hada.io/topic?id=37368) (GeekNews) · 정리일 2026-11-18
>
> **출처 한계**: news.hada.io는 이 세션에서 WebFetch가 차단되어 Slack TechArticles 발췌 3줄(중간 절단)만 근거로 작성했다. 더 심각한 문제는 WebSearch로도 "MAI Code 2"·"Code 2 Flash"라는 모델명을 찾지 못했다는 점이다 — 확인되는 것은 Microsoft의 MAI-Code-1-Flash(2026-06, SWE-Bench Pro 51.2% vs Haiku 35.2%)와 그 후속 MAI-Code-1.1-Flash(2026-08, SWE-bench Verified 72.6%)뿐이다. "Code 2"라는 메이저 버전업이 실제로 나왔는지, 혹은 Slack 발췌/GeekNews가 버전을 오기했는지 이 노트 작성 시점에는 확정하지 못했다.

## 한 줄 요약

**Microsoft AI가 심층 디버깅용 'Code 2'와 대량 반복작업용 'Code 2 Flash'를 냈다고 전해지나, 외부에서 독립 확인되는 건 한 세대 전 모델(MAI-Code-1.1-Flash)까지이며, 비교 대상 모델(Claude Haiku 5.5)을 자사에 유리하게 고른 선택적 비교일 가능성까지 포함해 다중으로 의심하고 읽어야 하는 발표다.**

## 핵심 포인트

- **역할 분리** — Code 2는 심층 디버깅·다중 파일 구현, Flash는 코드 설명·간단한 수정 같은 대량 반복 작업에 최적화했다고 주장.
- **Code 2: GPT-6.1 Sol 대비 98% 성능/40% 비용** — 4개 코딩 벤치마크 평균 기준, 단 이 "40% 비용"에는 ***50% 프로모션 가격이 반영***돼 있어 정상가 기준 수치는 따로 확인이 필요하다.
- **Code 2 Flash: 3개 벤치마크 평균 61.0%** — GPT-6 Luna(55.1%)·Claude Haiku 5.5(53.9%)보다 높다고 주장, 작업당 비용 $0.052. ***경쟁사 중 가장 작은/저렴한 모델군만 비교 대상으로 고른 선택적 비교*** — Sonnet·Opus급이나 동급 Flash 경쟁 모델(Gemini Flash 등)과의 비교는 발췌에 없다.
- **버전 명칭 자체가 미확인** — WebSearch로 확인되는 가장 최신 공식 모델은 MAI-Code-1.1-Flash(2026-08)이며, "Code 2"로의 메이저 버전업 발표를 독립적으로 찾지 못했다.

## 인상 깊은 문장

> (Slack 발췌는 기능·수치 설명 위주라 저자의 표현을 그대로 인용할 대목이 없다 — 원문 미열람으로 인용 생략.)

## 댓글

GeekNews(hada) 경유로 TechArticles 채널에 직접 공유된 것으로 보이나 원문 URL이 news.hada.io 토픽 페이지라 hada 자체 댓글 수·논조는 이 세션에서 확인 불가(getaddrinfo ENOTFOUND). HN/Lobsters 큐레이션 여부도 확인 못함. **"PASS" 아님을 명시**: (1) "Code 2"라는 모델명 자체가 외부 교차검증에 실패했고, (2) Flash 비교 대상(Luna, Haiku 5.5)이 경쟁사 라인업 중 하위 모델만 고른 선택적 비교일 가능성이 있으며, (3) Code 2의 "40% 비용" 수치는 프로모션가 기준이라 정상가 비용 절감폭은 과장일 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 벤더 발표 벤치마크는 "비교 대상 선택" 자체를 감사해야 한다

[[2026-09-30-gpt-6-1-sol-release]]는 OpenAI가 자사 신모델을 자사 구모델과 비교한 사례였다. 이번엔 Microsoft가 경쟁사(OpenAI·Anthropic) 모델 중에서도 상대적으로 작은 모델(Luna, Haiku)만 비교 대상으로 삼았다 — 같은 "선택적 비교" 패턴이 벤더를 가리지 않고 반복된다. 벤치마크 수치를 볼 때 "누구와 비교했는가"를 항상 먼저 확인해야 한다.

### 핵심 전이 2 — 모델명·버전조차 확정되지 않은 소식은 레포에 남길 때 더 보수적으로 써야 한다

이 글처럼 모델명 자체가 외부 확인에 실패하는 경우, 한 달 뒤 회고에서 "이름이 틀렸는지, 발표가 아직 비공개였는지"를 반드시 재확인해야 한다 — 다른 노트들의 "출처 한계"는 대부분 접속 차단이었지만, 이번엔 접속이 됐어도 존재 자체가 불확실한 더 근본적인 한계다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 코딩 에이전트 모델 선택 자체는 온다 내부 개발팀의 도구 선택 문제이지 CRS 제품 기능은 아니다. 다만 "가격 대비 성능"을 내세운 벤더 수치를 볼 때 비교 대상을 감사하는 습관은, PMS/CRS 벤더가 자사 솔루션을 경쟁사와 비교한 자료를 검토할 때도 그대로 적용되는 원칙이다.

## 연관 자료

- [[2026-09-30-gpt-6-1-sol-release]] — Code 2가 비교 기준으로 삼은 GPT-6.1 Sol의 원 출시 노트, 같은 "선택적 비교" 패턴.
- [[2026-11-18-frontierharness-eval-v1-1-best-harness-per-model]] — 같은 날 배치의 하네스 비교 글과 함께, "코딩 에이전트 비용·성능 비교는 항상 조건을 의심하라"는 결을 공유.
- [[2026-11-18-gpt-6-2-astra-sol-unconfirmed-release]] — 같은 배치, 모델명 자체가 외부 미확인인 같은 축의 또 다른 사례.

## 한 달 뒤 회고

*(2026-12-18 즈음 — "MAI Code 2"라는 모델명이 실제로 출시 확정됐는지, Microsoft 공식 블로그/모델 카드로 직접 확인했는지, 정상가 기준 비용 절감폭이 얼마였는지 점검.)*
