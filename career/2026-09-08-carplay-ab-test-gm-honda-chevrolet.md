---
title: "CarPlay 탑재·미탑재 차량 판매의 우연한 A/B 테스트 (Matt Haughey) — 같은 차인데 스마트폰 연동만 뺐더니 판매 격차가 해마다 벌어졌다"
source_title: "The car industry A/B tested selling the same car with and without CarPlay and the results are not shocking"
source_url: "https://a.wholelottanothing.org/the-car-industry-a-b-tested-selling-the-same-car-with-and-without-carplay-and-the-results-are-not-shocking/"
source_name: "A Whole Lotta Nothing (a.wholelottanothing.org, Matt Haughey) · GeekNews(id=33340) 경유"
referrer_url: "https://news.hada.io/topic?id=33340"
published_at: "2026-09 (정확한 게시일 미확인 — Daring Fireball가 2026-09-06에 인용한 것으로 미루어 그 직전으로 추정)"
summarized_at: "2026-09-08"
category: "career"
tags: ["product-decisions", "ux", "consumer-behavior", "automotive", "vendor-lock-in", "natural-experiment"]
---

# CarPlay 탑재·미탑재 차량 판매의 우연한 A/B 테스트

> 출처: [The car industry A/B tested selling the same car with and without CarPlay and the results are not shocking](https://a.wholelottanothing.org/the-car-industry-a-b-tested-selling-the-same-car-with-and-without-carplay-and-the-results-are-not-shocking/) (Matt Haughey · A Whole Lotta Nothing) · GeekNews(id=33340) 경유 · 정리일 2026-09-08

> **출처 한계(큼)**: 이번 세션은 egress 정책상 `news.hada.io`, `a.wholelottanothing.org`, `daringfireball.net`을 포함해 이번 배치의 원문 도메인 전부에 WebFetch가 완전히 차단됐다(도메인별 차단이 아니라 세션 전체의 정책 차단으로 보인다). 이 노트는 WebSearch 스니펫(AppleInsider, PowerPage, iPhonote, Archyde 등 복수 매체가 인용한 동일 수치)과 제공된 Slack 발췌를 교차 확인해 재구성했다. hada 댓글 수·논조는 확인하지 못했다.

## 한 줄 요약

**GM이 자사 전기차 라인업에서 Apple CarPlay·Android Auto를 걷어내는 동안, 같은 GM Ultium 플랫폼을 배지만 바꿔 쓰는 Honda Prologue는 두 기능을 그대로 남겨둬 — 사실상 통제된 조건의 우연한 'A/B 테스트'가 만들어졌고, Prologue는 매년 Blazer EV와의 판매 격차를 벌리며 앞섰다.**

## 핵심 포인트

- **거의 같은 차, 소프트웨어 한 가지만 다르다** — Honda Prologue와 Chevrolet Blazer EV는 GM의 동일 EV 플랫폼(배터리·구동계 공유)을 쓰는 배지 엔지니어링 차량이다. 겉모습·가격대는 비슷한데, ***Prologue는 CarPlay·Android Auto를 지원하고 Blazer EV는 지원하지 않는다***는 것이 두드러진 차이다.
- **격차가 해마다 벌어졌다** — 미국 판매량 기준 Prologue는 Blazer EV보다 2024년 42.8%, 2025년 73.1% 더 팔렸고, 2026년 상반기에는 8,407대 대 3,166대로 ***약 2.66배(전년 대비 166% 이상 격차)***까지 벌어졌다.
- **가격 변수로는 설명이 안 된다** — 2026년형 기준 Honda Prologue EX(MSRP $39,900)가 오히려 Chevy Blazer EV LT($44,700)보다 ***더 저렴***하다. 즉 "Prologue가 더 비싸서 고급으로 보여 잘 팔렸다"는 설명은 성립하지 않고, 남는 가장 뚜렷한 차이는 스마트폰 연동 지원 여부다.
- **GM은 자체 소프트웨어 통합을 원해서 뺐다** — GM은 자체 인포테인먼트·구독 서비스 생태계(자체 OS·데이터 수익화)를 밀기 위해 신형 EV에서 CarPlay·Android Auto를 제거하는 전략을 택한 것으로 알려져 있다. 이 사례는 그 선택의 시장 반응을 사실상 실증한 자연실험이 됐다.

## 인상 깊은 문장

원문 미열람으로 직접 인용은 생략한다. WebSearch로 확인된 논지는 "소비자는 매번 선택지를 원하고, 결과적으로 CarPlay가 포함된 '혼다 배지를 단 쉐보레'를 사고 있다"는 요지였다 — 정확한 원문 표현은 확인하지 못했다.

## 댓글

hada(GeekNews) 댓글 수·논조는 이번 세션에서 확인하지 못했다(접근 차단). 원문은 Daring Fireball(John Gruber)이 2026-09-06에 링크해 소개하며 확산됐고, 여러 매체(AppleInsider, O'Grady's PowerPage, Archyde 등)가 같은 판매 수치를 인용해 교차 보도했다는 점에서 핵심 수치 자체의 신뢰도는 준수한 편이다.

## 내 생각 · 적용점

### 핵심 전이 1 — "우연한 자연실험"이 설문보다 강력한 증거가 되는 경우

의도적으로 설계된 A/B 테스트가 아니라 ***같은 회사가 같은 플랫폼으로 다른 소프트웨어 결정을 우연히 병행***했기 때문에, 이 사례는 "사람들이 CarPlay를 좋아한다고 답한다"는 설문 결과보다 훨씬 강한 증거력을 갖는다 — 실제 지갑을 여는 행동 데이터이기 때문이다. 익숙한 서드파티 통합을 걷어내고 자체 생태계로 유도하려는 시도가 실제 구매 결정에서 얼마나 큰 저항에 부딪히는지 보여주는 드문 사례다.

### 핵심 전이 2 — 이 배치의 다른 노트와 직접적인 연결은 약함

이번 배치(2026-09-08 정리분)나 기존 가든 노트 중 이 주제(소비자 대상 UX 선택과 판매 실적의 직접 연결)와 정확히 겹치는 글은 찾지 못했다. 억지로 연결 짓기보다 독립된 사례로 남긴다.

## 호스피탈리티 / CRS 적용 포인트

**원칙 차원에서 직접 적용 가능하다.** 이 사례의 구조 — *"검증된 익숙한 외부 통합을 자체 통합으로 대체하려다 사용자 이탈을 자초한다"* — 는 CRS/PMS가 OTA·채널 매니저와의 연동을 다룰 때 겪는 선택과 정확히 같은 축이다. 호텔사가 이미 익숙하게 쓰는 표준 채널 연동(예: 특정 OTA의 표준 API·확장·워크플로)을 자체 UI·자체 프로토콜로 대체하려 할 때, 이 사례는 ***"기능적으로 동등해 보여도 사용자가 이미 신뢰하고 훈련된 인터페이스를 걷어내는 순간 채택률이 떨어질 수 있다"***는 경고로 읽힌다. 자체 통합으로의 전환은 가격·기능 우위만으로는 부족하고, 전환 비용(재학습·재훈련)을 상쇄할 만큼 명확한 이득을 제시해야 한다는 원칙을 가져올 수 있다.

## 한 달 뒤 회고

*(2026-10-08 즈음 — GM이 2026년 하반기~2027년형 라인업에서 CarPlay 정책을 재검토했는지, Prologue-Blazer EV 판매 격차가 계속 벌어졌는지 확인.)*
