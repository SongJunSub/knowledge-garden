---
title: "Google 검색, 처음으로 Alphabet 매출의 절반 아래로 (GeekNews) — 검색은 12% 성장했는데 비중은 줄었다, 숫자가 내려갔다는 뜻이 아니다"
source_title: "Google 검색, 처음으로 Alphabet 매출의 절반 아래로 내려감"
source_url: "https://news.hada.io/topic?id=36242"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-10-28 (Alphabet 2026년 3분기 실적 발표 기준 추정)"
summarized_at: "2026-10-30"
category: "career"
tags: ["alphabet", "google-search", "google-cloud", "earnings", "revenue-mix", "quarterly-results"]
---

# Google 검색, 처음으로 Alphabet 매출의 절반 아래로 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36242) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). 다만 WebSearch로 Alphabet의 2026년 3분기(9월 30일 마감) 실적 발표 자체(SEC 8-K, Alphabet 공식 실적 PDF 등)를 찾아 Slack 발췌의 핵심 수치를 교차확인했다 — Search 매출 634억 달러(전년 대비 +12%), 전체 매출 1,276억 달러(+25%), Cloud 매출 307억 달러(+103%) 모두 일치. Search 비중 49.7%는 Alphabet이 직접 공시한 숫자가 아니라 이 두 수치를 나눈 계산값(Slack 발췌와 WebSearch 모두 동일한 계산 방식).

## 한 줄 요약

**Alphabet이 검색 매출을 별도 공시한 이후 처음으로 Google 검색 매출 비중이 49.7%로 전체 매출의 절반 아래로 내려갔다 — 그런데 검색 매출 자체는 전년 대비 12% 증가했다. 비중이 줄어든 건 검색이 둔화돼서가 아니라 Cloud(+103%)를 비롯한 나머지 사업이 그보다 훨씬 빠르게 커졌기 때문이다.**

## 핵심 포인트

- **절대 성장 속 상대적 감소** — 검색 매출 634억 달러는 ***전년 동기 대비 12% 증가***했지만, 나머지 사업 매출이 ***40% 증가***하면서 전체 매출(1,276억 달러, +25%)에서 차지하는 비중이 52.8~62.0%대였던 직전 31개 분기보다 낮은 ***49.7%***로 내려갔다.
- **Cloud가 주도한 비중 변화** — Google Cloud 매출은 ***103% 증가한 307억 달러***로 전체의 24.1%를 차지한다. 같은 기간(31개 분기) Cloud 비중은 4.4%에서 24.1%로 커졌다 — 검색이 약해진 게 아니라 Cloud가 강해진 결과다.
- **검색 쿼리 자체도 호조** — WebSearch로 교차확인한 바로는 Alphabet이 이번 분기 검색 쿼리 증가율이 ***최근 5년 중 가장 높았다***고 밝혔다. "비중 50% 붕괴"라는 제목과 달리 검색 사업 자체의 건강도는 오히려 긍정적 신호로 보인다.

## 인상 깊은 문장

> "Search query growth was strong. Alphabet said the year-over-year Search query growth rate the highest it has been in the last five years." (WebSearch 교차확인, Alphabet 2026 3분기 실적 발표 기반)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가(원문 접근 차단). GeekNews 제목("처음으로 절반 아래로")은 사실이지만, "검색이 약해지고 있다"는 인상을 주기 쉬운 프레이밍이라는 점은 짚어둘 만하다 — 실제로는 검색 매출도, 검색 쿼리량도 모두 늘었고 단지 분모(Cloud 포함 전체 매출)가 더 빨리 커졌을 뿐이다.

## 내 생각 · 적용점

**핵심 전이 — "비중 지표"는 분자(검색)가 줄어도, 분모(전체)가 늘어도 똑같이 떨어진다. 숫자가 내려갔다고 바로 원인을 분자 쪽(검색 약화)으로 단정하면 틀린다.** 이건 [[2026-08-11-arr-doesnt-mean-what-it-used-to]]에서 다룬 "이상적 조건에서 만든 숫자를 정상 상태처럼 외삽하지 말라"는 경고와 같은 결이다 — 거기서는 ARR·NRR 같은 절대 지표가 맥락 없이 부풀려지는 문제를, 여기서는 "매출 비중"이라는 비율 지표가 맥락 없이 "쇠퇴"로 오독되는 문제를 보여준다. 둘 다 숫자 자체보다 **"이 숫자를 만든 구조가 무엇인가"**를 먼저 물어야 한다는 원칙으로 수렴한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 CRS/온다 내부에서도 "A 부서 매출 비중이 줄었다"는 보고가 나올 때, 그게 A의 침체가 아니라 B·C의 빠른 성장 때문일 수 있다는 걸 이번 사례로 참고할 만하다 — 비중 지표를 볼 때 분자·분모를 분리해서 보는 습관.

## 연관 자료

- [[2026-08-11-arr-doesnt-mean-what-it-used-to]] — "맥락 없는 숫자를 그대로 믿지 말라"는 같은 원칙, 대상은 ARR 같은 절대 지표.

## 한 달 뒤 회고

*(2026-11-30 즈음 — Alphabet 4분기 실적에서 검색 비중이 계속 내려가는지, Cloud 비중 확대가 지속되는지, 그리고 "검색 쇠퇴" 프레이밍이 다른 매체에서도 반복됐는지 확인한다.)*
