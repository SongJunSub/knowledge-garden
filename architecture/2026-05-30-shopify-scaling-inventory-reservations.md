---
title: "Shopify, 재고 예약을 Redis에서 MySQL로 교체하고도 스케일했다 — 단위당 한 행 + SKIP LOCKED + 상한 풀"
source_title: "We replaced Redis with MySQL for inventory reservations—and it scaled"
source_url: "https://shopify.engineering/scaling-inventory-reservations"
source_name: "Shopify Engineering"
referrer_url: "https://shopify.engineering/scaling-inventory-reservations"
published_at: "2026"
summarized_at: "2026-05-30"
category: "architecture"
tags: ["scaling", "distributed-systems", "mysql", "redis", "skip-locked", "contention", "flash-sale", "data-modeling", "isolation-level", "shopify", "high-write-throughput", "reservation-pattern"]
---

# Shopify, 재고 예약을 Redis에서 MySQL로 교체하고도 스케일했다 — 단위당 한 행 + SKIP LOCKED + 상한 풀

> 출처: [We replaced Redis with MySQL for inventory reservations—and it scaled](https://shopify.engineering/scaling-inventory-reservations) · 정리일 2026-05-30

## 한 줄 요약
**Shopify는 모든 결제가 거쳐가는 *오버셀 방지(재고 예약)* 시스템을 Redis에서 MySQL로 옮기면서, "수량 1행" 대신 *단위당 1행 + `SKIP LOCKED`*로 경합을 분산하고, *아이템/지역당 1,000행 상한 풀 + 보충(replenishment)*으로 행 폭발을 막고, *복합 PK·READ COMMITTED*로 락을 최소화하여 — 세계 최대 규모 플래시 세일에서도 Writer CPU < 50% / Reader CPU < 16%의 여유로 처리해냈다.**

## 핵심 포인트

- **문제 = 단일 자원에 대한 극한 경합**: 모든 거래가 결제 중 재고를 *예약*해 오버셀을 막는다. 2025 BFCM 피크 *분당 약 510만 달러*, 그리고 플래시 세일에서는 수많은 구매자가 *동일 SKU*에 동시 몰린다 → 하나의 재고 행에 락이 집중되는 *hot row* 문제.
- **왜 옮겼나**: 재고 예약은 수년간 Redis 위에서 돌았다. Shopify가 *데이터스토어를 MySQL로 통합*하는 전략을 밀면서 "MySQL이 같은 규모를 감당하는가"를 검증해야 했다.
- **핵심 설계 전환 — "수량 1행" → "단위당 1행 + SKIP LOCKED"**: `quantity` 컬럼이 든 단일 행에 모두가 락을 걸면 경합이 폭발한다. 대신 *재고 단위마다 한 행*을 두고 `SELECT ... FOR UPDATE SKIP LOCKED`로 가져온다. 다른 트랜잭션이 잠근 행은 *건너뛰고* 다른 가용 행을 반환 → **같은 행 대기 제거**. (37signals의 DB 기반 부하 분산 방식에서 영감.)
- **행 폭발 → Bounded Pool(상한 풀)**: 단위당 1행을 그대로 두면 폭발한다(아이템 1개 × 10지역 × 5만 단위 = 50만 행). 대신 *아이템/지역 조합당 최대 1,000행*으로 상한을 둔 *가용 행 풀*을 유지하고, 예약이 행을 소비하면 *보충 프로세스*가 inventory ledger(재고 원장)에서 풀을 다시 채운다.
- **왜 1,000인가**: 버스트를 흡수할 만큼 크고, `SKIP LOCKED` 스캔을 빠르게 유지할 만큼 작아야 한다. 플래시 세일 중 *아이템/지역별 관측 피크 예약률*을 근거로 산정.
- **복합 PK로 락 최소화**: `(shop_id, inventory_item_id, inventory_group_id, id)` 복합 기본키. 필터 컬럼이 PK에 포함돼, 초당 다수 예약 시 *행당 락 1개*로 수렴.
- **격리 수준 REPEATABLE READ → READ COMMITTED**: 갭 락(gap lock)을 피해, 보충 트랜잭션의 신규 행 INSERT가 차단되지 않게 함.
- **풀 고갈 시 thundering herd 방지**: 극단적 세일로 풀이 비면 예약 경로가 *인라인 보충*을 트리거하되, *락으로 단 하나의 트랜잭션만 보충*하게 해 떼몰림을 막는다.
- **마이그레이션 = Shadow Mode**: 모든 예약을 Redis·MySQL 양쪽에 *이중 기록*하되 *Redis를 source of truth로 유지*. 실제 프로덕션 트래픽에서 두 시스템을 나란히 비교해 정합성을 검증한 뒤 전환.
- **결과**: 고부하 플래시 세일에도 *Writer CPU < 50%, Reader CPU < 16%* — 여유(headroom)를 남기고 목표 처리량 달성. MySQL이 Redis를 대체하면서도 규모를 감당함을 입증.

## 인상 깊은 문장

> "We replaced Redis with MySQL for inventory reservations—and it scaled."
> (재고 예약을 Redis에서 MySQL로 교체했고 — 그래도 스케일했다)

> "One row per inventory unit instead of one row per item." (SKIP LOCKED 설계의 본질)
> (아이템당 한 행이 아니라, 재고 단위당 한 행)

> "If another transaction has locked some rows, MySQL skips them and returns other available rows."
> (다른 트랜잭션이 일부 행을 잠그면, MySQL은 그것들을 건너뛰고 다른 가용 행을 돌려준다)

*(원문 shopify.engineering가 직접 fetch 시 403을 반환해, 검색 인덱스에 노출된 본문 기반으로 정리. 구체 수치 — 1,000 상한, CPU %, 복합 PK 컬럼 — 는 원문 재확인 권장.)*

## 내 생각 · 적용점

### "RDB는 못 버틴다"는 통념을 뒤집은 데이터 모델링의 승리
이 글의 핵심은 *기술 교체(Redis→MySQL)*가 아니라 ***경합을 데이터 모델로 분산***했다는 점이다. 같은 MySQL이라도 "수량 1행"이면 못 버티고, "단위당 1행 + SKIP LOCKED + 상한 풀"이면 버틴다. **병목은 엔진이 아니라 *스키마와 락 단위*였다**. 이는 [[2026-05-13-redis-and-cost-of-ambition]]·[[2026-05-05-redis-array-antirez-4-months-with-ai]]가 다룬 *Redis의 야망·자료구조 사고*와 정확히 대구를 이룬다 — Redis가 잘하던 *카운터/원자 연산*을 RDB에서 재현하려면 *문제를 행 수준 병렬성으로 재모델링*해야 한다.

### `SKIP LOCKED` = "큐/풀" 패턴의 표준 도구
`SELECT ... FOR UPDATE SKIP LOCKED`는 작업 큐, 좌석/재고 같은 *경합 자원 분배*의 표준 무기다. 단일 행 카운터(hot row)를 *N개 가용 행 풀*로 쪼개 워커들이 서로 다른 행을 집게 만드는 것. PostgreSQL에도 동일 기능이 있어, *Redis 없이도 RDB 한 대로 상당한 동시성*을 낼 수 있다는 실증 사례로 가치가 크다. [[2026-05-08-sqlite-loc-recommended-storage-format]]·[[2026-05-11-clickhouse-overview]]와 함께 *"적합한 DB를 적합한 모델링으로"* 라인에 묶인다.

### 상한 풀 + 보충 = "정확성"과 "성능"의 분리
재고의 진실(truth)은 *ledger*에 두고, *핫패스(예약)*는 작은 풀에서만 경합시키는 분리가 우아하다. 정확성(원장)과 처리량(풀)을 다른 계층으로 떼어놓는 패턴은 [[2026-05-05-openai-low-latency-voice-ai-at-scale]]의 *stateless/stateful 분리*와 같은 결의 사고다 — *느린·정확한 코어*를 *빠른·근사한 가장자리*로 감싼다.

### thundering herd를 "락 하나"로 막는 단순함
풀 고갈 시 모두가 보충에 달려드는 대신 *단 하나만 보충*시키는 건, 분산 캐시의 *cache stampede 방지(single-flight)*와 동일한 원리다. 화려한 조정 없이 *임계 구역 + 단일 실행*으로 떼몰림을 죽이는 검증된 수법.

## 호스피탈리티 / CRS 적용 포인트

호스피탈리티 예약(CRS)은 ***재고 = 객실/요금 재고(allotment)***라는 점에서 이 글과 **거의 1:1로 매핑**된다. 오버부킹 방지 = 오버셀 방지.

1. **오버부킹 방지 = 오버셀 방지의 동형 문제**: 인기 날짜·인기 룸타입에 예약이 몰리는 *hot row* 문제가 그대로 발생. *날짜×룸타입×레이트플랜 재고를 단일 카운터*로 두면 성수기/플래시 프로모션에 락 경합으로 무너진다. → *가용 객실 단위를 행으로 쪼갠 SKIP LOCKED 풀* 검토 후보.
2. **상한 풀 + 보충 = CRS 핫패스 분리**: 채널/OTA에서 들어오는 *순간 예약 폭주*는 작은 가용 풀에서만 경합시키고, *진짜 allotment 원장*은 별도 계층으로. 정합성은 원장, 처리량은 풀.
3. **Shadow Mode = 무중단 마이그레이션 의례**: CRS 재고 엔진을 교체할 때 *이중 기록 + 기존 시스템을 진실로 유지하며 프로덕션 트래픽 대조*는 *재고 정합성이 생명인 도메인*에 그대로 채택할 수 있는 안전한 컷오버 패턴. MangoLove/온다 CRS 마이그레이션 표준 절차 후보.
4. **단일 보충자(single-flight) = 채널 매니저 동기화 떼몰림 방지**: 재고 소진/리프레시 순간 모든 채널이 동시에 동기화로 달려드는 패턴을 *락 하나*로 직렬화.

## 연관 자료
- [원문 — Shopify Engineering](https://shopify.engineering/scaling-inventory-reservations)
- [[2026-05-13-redis-and-cost-of-ambition]]·[[2026-05-05-redis-array-antirez-4-months-with-ai]] — Redis 야망·자료구조 사고 *(이 글은 그 반대편: RDB로의 회귀를 데이터 모델링으로 정당화)*
- [[2026-05-05-openai-low-latency-voice-ai-at-scale]] — `architecture/` 자매 글 *(stateless/stateful 분리 = 정확성/처리량 분리와 동형)*
- [[2026-05-11-clickhouse-overview]]·[[2026-05-08-sqlite-loc-recommended-storage-format]] — *"적합한 DB·적합한 모델링"* 라인
- 참고: [InfoQ — Shopify's Architecture to Handle the World's Biggest Flash Sales](https://www.infoq.com/presentations/shopify-architecture-flash-sale/) *(pods 아키텍처 배경)*
- 키워드: `SELECT ... FOR UPDATE SKIP LOCKED`, bounded pool, replenishment, gap lock, READ COMMITTED, single-flight, cache stampede

## 한 달 뒤 회고
*(2026-06-30 즈음 — CRS 재고 엔진에서 *날짜×룸타입 hot row* 경합을 실제 측정해봤는지, SKIP LOCKED 풀 PoC를 한 번이라도 돌렸는지, Shadow Mode 컷오버 절차를 마이그레이션 표준으로 문서화했는지 기록.)*
