---
title: "ClickHouse 입문 — 컬럼 지향 OLAP DB의 개념·SQL·사용 사례"
source_title: "ClickHouse Documentation"
source_url: "https://clickhouse.com/docs"
source_name: "ClickHouse Docs + 학습 노트"
referrer_url: ""
published_at: ""
summarized_at: "2026-05-11"
category: "backend"
tags: ["ClickHouse", "OLAP", "컬럼지향DB", "데이터분석", "MergeTree", "SQL", "호스피탈리티"]
---

# ClickHouse 입문 — 컬럼 지향 OLAP DB의 개념·SQL·사용 사례

> 출처: [ClickHouse Docs](https://clickhouse.com/docs) · 정리일 2026-05-11

## 한 줄 요약
ClickHouse는 **컬럼 지향 OLAP 데이터베이스**로, 수십억 row를 초 단위로 집계하는 분석 워크로드에 특화되어 있다 — **SQL은 익숙하게 쓰되, 테이블 설계(엔진·정렬 키·파티션)와 데이터 변경(append-only) 방식이 RDBMS와 결정적으로 다르다**.

## 핵심 개념

### 1. 왜 빠른가 — 컬럼 지향 + 벡터화

| 항목 | 설명 |
|------|------|
| **컬럼 저장** | 같은 컬럼 값을 연속 저장 → 압축률 높고, 분석 쿼리에서 필요한 컬럼만 읽음 |
| **벡터화 실행** | SIMD 명령어로 컬럼 단위 일괄 처리 |
| **압축** | LZ4/ZSTD 기본 지원, 보통 원본의 10~20% |
| **확장성** | Shard(수평 분산) + Replica(복제) |

### 2. OLTP DB와의 결정적 차이

| | RDBMS (MySQL/Postgres) | ClickHouse |
|---|---|---|
| 저장 단위 | row | column |
| 주 워크로드 | 트랜잭션, 단건 read/write | 대규모 분석 집계 |
| UPDATE/DELETE | 즉시 반영 | `ALTER TABLE ... UPDATE/DELETE` (비동기 Mutation, 무거움) |
| 트랜잭션 | 완전 지원 | 없음 (실험적) |
| JOIN | 효율적 | 가능하지만 비정규화·Dictionary 권장 |
| INSERT | 단건도 OK | **배치(수천~수만 row) 필수**, 단건은 매우 비효율 |

### 3. SQL은 표준 그대로

`SELECT`, `FROM`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `JOIN`, `UNION`, `WITH`(CTE), 서브쿼리, 윈도우 함수 모두 지원.

```sql
SELECT user_id, COUNT(*) AS cnt
FROM events
WHERE event_date >= '2026-05-01'
 AND event_type = 'click'
GROUP BY user_id
HAVING cnt > 10
ORDER BY cnt DESC
LIMIT 100;
```

### 4. 자체 분석 함수가 풍부

```sql
-- 배열 펼치기 (한 row → 여러 row)
SELECT arrayJoin([1, 2, 3]);

-- 시계열 — 이전 row와의 차이
SELECT runningDifference(value) FROM metrics;

-- 근사 집계 (HyperLogLog, t-digest 등)
SELECT uniq(user_id), quantile(0.95)(response_time) FROM logs;

-- Funnel 분석 (1시간 윈도우 내 순서)
SELECT windowFunnel(3600)(timestamp,
 event = 'view',
 event = 'cart',
 event = 'buy'
) FROM events GROUP BY user_id;
```

### 5. 테이블 엔진이 필수 선택지

```sql
CREATE TABLE events (
 user_id UInt64,
 event_type String,
 event_time DateTime
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(event_time)
ORDER BY (user_id, event_time);
```

| 엔진 | 용도 |
|------|------|
| **MergeTree** | 기본. data part 단위로 저장, 백그라운드 병합 |
| **ReplacingMergeTree** | 같은 PK row 중복 제거(최신 유지) |
| **SummingMergeTree** | 같은 PK row 자동 합산 |
| **AggregatingMergeTree** | 사전 집계 상태(state) 저장 |
| **ReplicatedMergeTree** | ZooKeeper 통한 복제 |
| **Kafka** | Kafka 토픽을 테이블처럼 consume |
| **Distributed** | Shard 위에 가상 테이블로 분산 쿼리 |

### 6. 설계 핵심 — `ORDER BY`와 `PARTITION BY`

- **ORDER BY**: primary key 겸 정렬 키. **쿼리 WHERE 절에서 자주 쓰는 컬럼**을 카디널리티 낮은 순으로 배치.
- **PARTITION BY**: 보통 시간 단위(예: `toYYYYMM(timestamp)`). 파티션 단위 DROP·읽기 최적화.
- **Materialized View**: INSERT 시점에 자동 집계 테이블로 반영 → 대시보드 쿼리 가속.

## 인상 깊은 포인트

> "ClickHouse는 한 번 들어온 데이터가 거의 변하지 않는 워크로드에 최적화되어 있다. UPDATE는 가능하지만, 그것을 자주 한다면 ClickHouse를 잘못 쓰고 있는 것이다."

## 내 생각 · 적용점

### 호스피탈리티/CRS 관점에서의 후보

| 도메인 | 현재 (RDBMS/ES) | ClickHouse 적용 후보 |
|--------|----------------|---------------------|
| 예약 이력 분석 | MySQL 집계 쿼리 → 느림 | 예약 이벤트 stream을 ClickHouse에 적재, 월별/지점별/채널별 매출 대시보드 |
| API 호출 로그 | 일반 RDBMS/파일 | 응답 시간 percentile, 채널별 에러율, OTA Connectivity 트래픽 분석 |
| 사용자 행동 추적 | 없음/제한적 | PickMe 등 B2C 클릭스트림, funnel 분석 |
| 결제/정산 분석 | RDBMS JOIN | 비정규화된 fact 테이블로 PG별 승인율·실패 사유 집계 |
| ElasticSearch 대체 | 로그 검색 + 집계 모두 ES | **집계 위주는 ClickHouse**로 옮겨 비용·자원 절감 (검색은 ES 유지) |

### Spring Boot 연동 시 주의

- **JDBC 드라이버**: `clickhouse-jdbc` (공식). R2DBC도 있지만 JDBC가 성숙도 높음.
- **JPA 비권장**: 트랜잭션 모델이 안 맞음. `JdbcTemplate` 또는 jOOQ.
- **단건 INSERT 금지**: 반드시 배치 — Kafka 컨슈머에서 수천 row 모아서 bulk insert가 표준 패턴.
- **타입 매핑**: `UInt8/16/32/64`, `Int8/16/32/64`, `String`, `FixedString(N)`, `Array(T)`, `Tuple`, `Map`, `Nullable(T)`. 암묵적 형변환이 적어 엄격함.

### 도입 전 체크리스트

- [ ] 워크로드가 **append-only에 가까운가?** (UPDATE/DELETE 빈도 낮은가)
- [ ] 데이터 양이 **수억 row 이상**으로 향하는가? (수백만이면 PostgreSQL로 충분)
- [ ] **배치 INSERT 파이프라인**을 구축할 수 있는가? (Kafka 등)
- [ ] JOIN보다 **비정규화/Dictionary**로 풀 수 있는 모델인가?
- [ ] **트랜잭션이 필요 없는가?**

다섯 개 모두 YES면 강력한 후보. 한두 개라도 NO면 PostgreSQL/TimescaleDB가 더 안전할 수 있다.

## 연관 자료

- [ClickHouse Documentation](https://clickhouse.com/docs)
- [Altinity Knowledge Base](https://kb.altinity.com/) — 운영·튜닝 노하우
- [ClickHouse vs Snowflake/Druid/Pinot](https://clickhouse.com/docs/en/about-us/distinctive-features) — 경쟁 OLAP 비교
- 비교 후보: TimescaleDB(Postgres 확장 시계열), DuckDB(임베디드 OLAP), Apache Doris

## 한 달 뒤 회고
<!-- 호스피탈리티 도메인에 PoC로 적용해본다면 어떤 도메인이 가장 효과적이었는지, 도입의 ROI는 어느 정도였는지 회고. -->
