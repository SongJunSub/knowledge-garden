---
title: "PostgreSQL 캐싱: 기본 동작과 추가 캐시의 선택 기준 (Readyset/PgCache 비교) — 캐시 적중률이 높아도 CPU는 포화될 수 있다"
source_title: "A Practical Guide to Caching: What to Cache and When / PostgreSQL Caching: What It Does and What to Add"
source_url: "https://readyset.io/blog/a-practical-guide-to-caching-what-to-cache-and-when"
source_name: "Readyset / PgCache 블로그"
referrer_url: "https://news.hada.io/topic?id=34016"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "backend"
tags: ["postgresql", "caching", "readyset", "pgcache", "materialized-view", "redis", "query-performance"]
---

# PostgreSQL 캐싱: 기본 동작과 추가 캐시의 선택 기준

> 출처: [A Practical Guide to Caching: What to Cache and When](https://readyset.io/blog/a-practical-guide-to-caching-what-to-cache-and-when) (Readyset) 외 PgCache 블로그 교차 확인 · GeekNews(id=34016) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "Readyset과 PgCache는 DB의 변경…"에서 잘림)와 WebSearch로 확보한 Readyset·PgCache·Severalnines 블로그 스니펫을 교차해 재구성했다. 원문이 정확히 어느 매체의 글인지(Readyset 자사 블로그인지 제3자 비교 글인지)는 특정하지 못했다.

## 한 줄 요약

**PostgreSQL은 데이터 페이지와 실행 계획만 캐싱할 뿐 쿼리 "결과"는 저장하지 않아 같은 조회를 반복하면 계산을 다시 수행하며, 캐시 적중률이 높아도 CPU가 포화될 수 있다는 게 추가 캐시(구체화 뷰, Redis, Readyset/PgCache 같은 쿼리 캐시)를 고려해야 하는 출발점이다.**

## 핵심 포인트

- **PostgreSQL의 캐싱 범위는 결과가 아니라 페이지·계획까지** — ***데이터 페이지와 실행 계획은 캐싱하지만 쿼리 결과는 저장하지 않는다.*** 데이터가 메모리(shared buffer)에 있어도 같은 조회를 반복하면 ***결과를 만드는 계산은 다시 수행***한다. WebSearch로 확인한 바로는 이게 key-value 캐시(Redis)와의 근본적 차이다.
- **캐시 적중률이 높아도 CPU는 포화될 수 있다** — 디스크에서 느리게 읽는 게 문제인지, ***같은 쿼리를 너무 많이 실행하는지가 캐시 선택의 출발점***이다. 전자는 인덱스·버퍼 튜닝, 후자는 쿼리 결과 캐싱이 해법이라는 구분.
- **용도별 캐시 선택지** — 반복되는 집계에는 ***구체화 뷰(materialized view)***, 자주 조회하는 결과에는 ***Redis 같은 애플리케이션 캐시나 프록시 캐시***를 활용할 수 있으며, ***갱신 비용과 관리 방식이 서로 다르다.*** 구체화 뷰는 수동/주기적 REFRESH가 필요하고 애플리케이션 캐시는 TTL이나 무효화 로직이 필요하다.
- **Readyset·PgCache — 복제 스트림 기반 자동 무효화(일부 발췌 확인)** — Slack 발췌가 여기서 끊겼지만, WebSearch로 보강하면 Readyset은 `CREATE CACHE`로 캐시할 쿼리를 명시적으로 선언하는 방식이고, PgCache는 선언 없이 실시간 트래픽이 캐시 대상을 결정하는 drop-in 방식이다. 둘 다 ***PostgreSQL의 논리적 복제(logical replication) 스트림을 캐시 무효화에 활용***해 타이머 기반 TTL보다 최신성을 유지한다는 공통점이 있다.

## 인상 깊은 문장

> "Postgres does not cache query results like a key-value store."
> (WebSearch로 확보한 PgCache 블로그 취지의 재구성)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: Readyset·PgCache 둘 다 자사 제품을 파는 벤더 블로그일 가능성이 높아, "타이머 기반 TTL보다 복제 스트림 방식이 우월하다"는 주장은 벤더 입장이 섞여 있을 수 있다. 제3자 벤치마크 비교는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "캐시 적중률만으로 병목을 판단하면 안 된다"는 원칙이 가든의 캐싱 노트들과 겹침

[[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]]는 캐시 적중률이 아니라 "서버당 해시 개수"라는 다른 축이 실제 절감 요인이었다는 사례였고, 이번 글의 "캐시 적중률이 높아도 CPU는 포화될 수 있다"는 지적과 같은 방향이다 — **캐시 지표(적중률)와 실제 병목(CPU/디스크)이 서로 다른 축일 수 있으니 지표 하나만 보고 캐시 전략을 정하면 안 된다**는 원칙이 두 노트에서 반복된다. [[2026-08-10-postgresql-mvcc-tradeoffs]]가 다룬 PostgreSQL의 MVCC 트레이드오프와도 인접하다 — 둘 다 "PostgreSQL 기본 동작을 먼저 이해하고 나서 확장 도구를 붙여라"는 순서를 공유한다.

## 호스피탈리티 / CRS 적용 포인트

CRS의 예약 조회·가용 재고 조회처럼 같은 쿼리가 반복 실행되는 엔드포인트에 직접 적용 후보다. 특히 "적중률이 높아도 CPU가 포화될 수 있다"는 지적은, CRS가 캐시를 도입한 뒤에도 성능 문제가 재발하면 캐시 자체가 아니라 캐시되지 않는 나머지 쿼리 패턴을 의심해야 한다는 실용적 체크리스트가 된다. 다만 Readyset·PgCache 같은 서드파티 도구 도입은 데이터 정합성(복제 지연) 리스크가 있어, 구체화 뷰나 애플리케이션 레벨 캐시부터 검토하는 게 안전하다.

## 연관 자료

- [[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]] — 캐시 적중률과 실제 절감 요인이 다른 축이었던 선행 사례
- [[2026-08-10-postgresql-mvcc-tradeoffs]] — PostgreSQL 기본 동작(MVCC)의 트레이드오프를 다룬 인접 노트

## 한 달 뒤 회고

*(2026-10-21 즈음 — Slack 발췌가 끊긴 "Readyset과 PgCache는 DB의 변경…" 이후 문장이 정확히 어떤 차이를 설명했는지, 제3자 벤치마크가 나왔는지 확인.)*
