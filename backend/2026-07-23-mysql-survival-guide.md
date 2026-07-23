---
title: "스타트업의 MySQL(InnoDB) 생존 가이드 — Postgres 가이드를 기계 번역하지 않고 MySQL/InnoDB 구조에 맞춰 재구성. 핵심 차이 5가지: autovacuum·txid wraparound가 없고(대신 undo/purge), PK가 클러스터드 인덱스라 UUID PK가 치명적이며, timestamptz가 없고, CONCURRENTLY 대신 온라인 DDL·gh-ost, 스레드-per-연결이라 커넥션 폭주가 덜 치명적이되 메타데이터 락이 새 함정이다"
source_title: "MySQL survival guide (derived from Hatchet's Postgres guide + HN)"
source_url: "https://hatchet.run/blog/postgres-survival-guide"
source_name: "파생 저술 (원본: Hatchet Postgres 가이드 + HN 큐레이션, MySQL/InnoDB로 재구성)"
referrer_url: "https://news.hada.io/topic?id=31706"
published_at: "2026-07-23"
summarized_at: "2026-07-23"
category: "backend"
tags: ["mysql", "innodb", "database", "clustered-index", "undo-log", "online-ddl", "metadata-lock", "connection-pool", "reference", "ops"]
---

# 스타트업의 MySQL(InnoDB) 생존 가이드 — Postgres 가이드를 MySQL 구조로 재구성

> 파생 저술 · 원본: [Hatchet, A Postgres survival guide for startups](https://hatchet.run/blog/postgres-survival-guide) + HN 댓글을 **MySQL 8.x / InnoDB**에 맞게 번역·재구성 · 정리일 2026-07-23 · 관련: [[2026-07-23-postgres-survival-guide-startups]]

## 왜 기계 번역하면 안 되나 (Postgres와 결정적으로 다른 5가지)

Postgres 조언을 그대로 "Postgres→MySQL" 치환하면 **틀리거나 위험**하다. InnoDB는 구조가 다르다. 먼저 이 5가지를 이해해야 나머지가 맞다.

| # | Postgres | MySQL/InnoDB | 실무 함의 |
|---|----------|--------------|-----------|
| **1** | dead tuple + **autovacuum** + **Transaction ID wraparound**(방치 시 대형 다운타임) | **undo log + purge 스레드**, wraparound 위기는 **없음** | 무서운 wraparound는 잊어도 됨. 대신 **긴 트랜잭션이 오래된 read view를 붙잡으면 undo가 안 지워져(purge lag) 부풀고 느려진다**. 지표는 **History list length** |
| **2** | 테이블과 PK 인덱스가 분리(heap) | **테이블 자체가 PK 클러스터드 인덱스**(행이 PK 순으로 저장), 모든 **보조 인덱스는 PK 값을 품음** | **PK 선택이 훨씬 치명적**. 랜덤 UUIDv4 PK = 페이지 분할·단편화 재앙 + 넓은 PK가 모든 보조 인덱스를 부풀림 |
| **3** | `timestamptz`(타임존 인식) | `timestamptz` **없음** — `TIMESTAMP`(UTC 저장, 세션 tz 변환, 2038·범위 제약) vs `DATETIME`(tz 없음) | "항상 timestamptz"는 못 씀. **UTC로 저장 + 세션/서버 tz를 UTC로 고정**이 안전, 컬럼은 보통 `DATETIME(6)` |
| **4** | `CREATE INDEX CONCURRENTLY` | 온라인 DDL `ALGORITHM=INPLACE, LOCK=NONE`(연산마다 다름) + 대형은 **gh-ost / pt-online-schema-change** | 인덱스 추가는 대개 온라인. 단 일부 DDL은 여전히 복사, 그리고 **메타데이터 락(MDL)** 함정이 새로 생김(아래) |
| **5** | 연결마다 **프로세스**(커넥션 폭주가 특히 치명적) | 연결마다 **스레드**(더 관대) | 커넥션 폭주는 덜 치명적이나 풀링은 여전히 필요. 대신 **REPEATABLE READ 기본 + 갭/넥스트키 락**이 Postgres 사용자를 놀래키는 데드락 원천 |

## 스키마 설계 (배포 후 변경이 가장 어려움 → 초기 투자)

- **PK는 `BIGINT AUTO_INCREMENT`(순차) 기본.** 클러스터드 인덱스라(#2) **순차 증가가 append-friendly**(페이지 끝에만 삽입). 외부 노출이 필요하면 **PK는 순차로 두고, `UUID`(가급적 UUIDv7·시간순)를 보조 유니크 컬럼**으로 추가 — HN 합의와 동일. **UUIDv4를 PK로 쓰지 말 것**(랜덤 삽입 → 페이지 분할·단편화, 모든 보조 인덱스에 16바이트 PK가 실려 비대). UUID를 굳이 PK로 쓴다면 최소 **`BINARY(16)` + 시간순(UUIDv7)**.
- **시간은 UTC로(#3).** 컬럼은 `DATETIME(6)`(범위 넓음, tz 없음) 또는 `TIMESTAMP`(UTC 저장·자동 변환이나 2038 한계). **서버·세션 `time_zone`을 UTC로 고정**하고 앱에서 UTC로 다룬다. `TIMESTAMP`의 자동 `ON UPDATE CURRENT_TIMESTAMP`는 편하되 함정도 됨.
- **문자셋은 `utf8mb4`(3바이트 `utf8` 아님).** 이모지·전체 유니코드. 단 문자당 4바이트라 **인덱스 프리픽스 길이 제약**(예전 767바이트, 8.0 `innodb_large_prefix` 기본 3072)이 `VARCHAR(255)` 인덱스에 영향 — 긴 문자열 인덱스는 prefix index 고려.
- **정규화는 쿼리 효율과 균형.** 때론 `JSON` 컬럼이 실용적(단 MySQL JSON은 인덱싱에 generated column + 인덱스 필요, Postgres jsonb보다 도구가 약함).
- **FK는 저용량엔 정합성으로 OK, 고용량·파티셔닝엔 주의.** **파티셔닝 테이블엔 FK 불가**(#고급). cascading delete는 편하되 장기 유지보수엔 명시적 삭제가 낫다(HN).

## 읽기 최적화

- **멘탈 모델(동일)**: 인덱스로 소수 행을 빨리 찾거나, **풀 테이블 스캔**으로 전부 읽거나. 작은 테이블은 풀스캔이 즉시.
- **복합 인덱스는 leftmost prefix + WHERE→ORDER BY 순 + 방향.** 예: `WHERE user_id=? ORDER BY created_at DESC LIMIT 10` → `INDEX (user_id, created_at DESC)`(MySQL 8은 **DESC 인덱스 실제 지원**). **커버링 인덱스**(SELECT 컬럼까지 인덱스에 포함 → 테이블 접근 0, `Using index`)를 적극 활용 — 클러스터드 구조라 커버링 이득이 큼.
- **`EXPLAIN`으로 검증.** `EXPLAIN ANALYZE`(8.0.18+, 실제 실행), `EXPLAIN FORMAT=TREE`(읽기 쉬움), `EXPLAIN FORMAT=JSON`(비용). `rows`(추정) vs 실제, `type`(`const`/`ref`/`range` 좋음, `ALL`=풀스캔 나쁨), `Extra`(`Using filesort`·`Using temporary` 경계). 옵티마이저가 헤매면 **`ANALYZE TABLE`로 통계 갱신**(플래너 정확도 = 통계 신선도, 동일 원칙).
- **옵티마이저가 풀스캔을 고르는 건 합리적일 수 있음**(보조 인덱스는 PK 조회가 뒤따라 랜덤 I/O). 해결: 쿼리 재구조화·커버링 인덱스·파티셔닝.
- **평균 vs 최악(HN·중요)**: 옵티마이저는 통계 **평균**을 최적화하지만 앱은 **최악**을 막아야 할 때가 있다. MySQL은 **`FORCE INDEX`/`USE INDEX`·옵티마이저 힌트**(`/*+ ... */`)로 인덱스 경로를 강제 — "평균 10ms인데 헤비 유저는 1초+" 같은 경우 다른 인덱스를 강제해 평균은 조금 느려도 **최악을 100ms 미만·타임아웃 방지**. 회사엔 평균 절약보다 타임아웃 방지가 중요.

## 쓰기 성능

- **트랜잭션 짧게, 트랜잭션 중 외부(HTTP·큐) 호출 금지, 필요한 행만 잠금.** InnoDB는 **REPEATABLE READ 기본**이라 긴 트랜잭션이 오래된 read view를 붙잡으면 **purge가 막혀 undo가 부푼다(#1)** — 짧은 트랜잭션이 성능이자 위생.
- **배치로 ≈10배.** 다중행 `INSERT ... VALUES (),(),()`. **Java/JDBC라면 `rewriteBatchedStatements=true`**(안 켜면 배치가 사실상 단건 반복 — ONDA 필수 확인) + `addBatch()/executeBatch()`. 왕복·잠금·파싱 오버헤드를 묶는다.
- **인덱스 추가는 온라인 DDL(#4).** `ALTER TABLE ... ADD INDEX ..., ALGORITHM=INPLACE, LOCK=NONE`(대개 온라인). **컬럼 추가는 `ALGORITHM=INSTANT`**(8.0.12+, 메타데이터만). 단 일부 변경(컬럼 타입 변경 등)은 여전히 테이블 복사 → 대형 테이블·복제 지연이 걱정이면 **gh-ost 또는 pt-online-schema-change**(트리거·섀도 테이블로 무중단·복제 부하 제어).

## 운영 위험 (여기가 Postgres와 가장 다르다)

- **wraparound 대신 undo/purge lag(#1).** 지표는 **History list length**(`SHOW ENGINE INNODB STATUS`의 "History list length", 또는 `information_schema`/`performance_schema`). 이 값이 수백만으로 치솟으면 **긴 트랜잭션이 purge를 막고 undo가 부푸는 중** — `information_schema.INNODB_TRX`에서 오래된 `trx_started`를 찾아 죽인다. `innodb_purge_threads` 조정.
- **메타데이터 락(MDL) — MySQL 고유 함정.** 모든 DDL은 **MDL이 필요**한데, 열린 트랜잭션(심지어 `SELECT`)이 그 테이블의 MDL을 붙잡고 있으면 `ALTER`가 대기하고, **그 뒤의 모든 쿼리가 그 ALTER 뒤에 줄줄이 막힌다**(연쇄 정체). 방어: **`lock_wait_timeout`**(MDL 대기 상한)을 마이그레이션 세션에 짧게, 그리고 긴 트랜잭션을 먼저 없앤다.
- **데드락·갭 락.** REPEATABLE READ + 넥스트키 락이라 **범위 조건 잠금이 갭까지 잠가** Postgres보다 데드락이 잘 난다. `SHOW ENGINE INNODB STATUS`의 LATEST DETECTED DEADLOCK을 읽어 잠금 순서를 통일. `innodb_lock_wait_timeout`(행 락 대기).
- **연결/스레드 풀(#5).** MySQL은 스레드-per-연결이라 Postgres만큼 치명적이진 않지만, **`max_connections` 초과·스레드 폭주는 여전히 성능 붕괴**. 앱 풀(Java면 **HikariCP** — 풀 크기는 `연결 = ((코어수 × 2) + 유효스핀들)` 근사, 과대 설정 금물), 규모 크면 **ProxySQL**. `wait_timeout`/`interactive_timeout`으로 유휴 연결 정리.
- **타임아웃을 코드로 강제.** `max_execution_time`(8.0, SELECT 문 타임아웃), `innodb_lock_wait_timeout`, `lock_wait_timeout`(MDL), `idle transaction`은 앱 풀에서 방어. "조심하자"가 아니라 설정으로.

## 고급 기법

- **`SELECT ... FOR UPDATE SKIP LOCKED` 작업 큐(8.0+).** MySQL 8.0.1부터 **SKIP LOCKED·NOWAIT 지원** → Postgres와 동일하게 대기 작업을 잠그고 다른 워커는 스킵. 단 **고성능이면 트랜잭션-잠금 큐를 피하고 즉시 `status='processing'` 갱신 + 멱등성**(HN: 확장 환경에선 멱등성이 원자성보다 유리)이 낫다.
- **파티셔닝(RANGE by 날짜).** 시계열에 `PARTITION BY RANGE (TO_DAYS(created_at))`, **옛 파티션 DROP은 즉시**(대량 DELETE 대신). **제약: 파티션 키가 모든 유니크 키(PK 포함)에 들어가야 하고, FK 불가.** 프루닝으로 최근 파티션만 스캔.
- **대형 테이블 마이그레이션.** gh-ost/pt-osc(권장) 또는 직접: 트리거로 신규 쓰기를 새 테이블로 → 트랜잭션 밖 batched backfill → PK/유니크로 중복 방지. 단일 트랜잭션 복사 금지(purge 차단·undo 폭증).
- **단편화·bloat.** InnoDB는 삭제/갱신으로 페이지가 비어 단편화 → **`OPTIMIZE TABLE`**(8.0은 대개 온라인이나 복제 부하 큼) 또는 **pt-online-schema-change의 no-op 재구축**. undo 부풀림은 purge로 회수.
- **애플리케이션 조인.** 복잡한 다중 JOIN 한 방보다 단순 쿼리 여러 개 + 앱에서 조합이 플랜이 예측 가능할 때가 있음(HN) — 단 선택적 조인이 결과를 크게 줄이면 전부 가져와 로컬 교집합은 오히려 비싸다.

## 백업·모니터링 (원본 가이드의 두 공백 — 여기가 진짜 생존)

Postgres 원본이 빠뜨렸다고 HN이 짚은 두 가지. **MySQL에서 이게 "생존"의 핵심**이다.

- **백업·복구 + PITR.**
  - **물리(권장, 대형·핫)**: **Percona XtraBackup**(무중단 물리 백업) 또는 MySQL Enterprise Backup.
  - **논리(소형·이식)**: `mysqldump`(정합성 위해 `--single-transaction`) 또는 `mysqlpump`/`mydumper`(병렬).
  - **PITR**: **binlog(`binlog_format=ROW`) 보관** → 전체 백업 + binlog로 특정 시점 복구. 관리형이면 **RDS/Aurora가 binlog 기반 PITR 제공**(HN "관리형이 절약보다 안전" 논리 동일).
  - **백업은 다른 위치/다른 계정에**(같은 인스턴스 스냅샷은 백업으로 인정 안 함 — 방법론 Dry-run 게이트).
- **모니터링·경보(이메일 아니라 호출기/Slack).**
  - **핵심 신호**: History list length 급증(#1), 복제 지연(`Seconds_Behind_Master`/`Seconds_Behind_Source`), 오래된 트랜잭션(`INNODB_TRX`), MDL 대기(`performance_schema`), 데드락 빈도, 커넥션/스레드 포화, 슬로 쿼리.
  - **도구**: `performance_schema` + `sys` 스키마, **슬로 쿼리 로그**(`long_query_time`), PMM(Percona Monitoring)·Datadog.
  - HN의 교훈: "AWS가 위험 이메일 보내도 박싱데이엔 놓친다 → **호출기에 연결**." 복제 지연·History list length·디스크 여유는 반드시 경보.

## ORM (ONDA 스택: Spring Boot + JPA/Hibernate + QueryDSL)

- **Hibernate N+1이 최대 함정.** 지연 로딩이 반복 쿼리를 낳음 — `fetch join`·`@EntityGraph`·`@BatchSize`로 방어. 목록 조회는 특히 주의.
- **규모가 커지면 추상화를 벗어나라(원본·HN 동일).** JPA로 표현 안 되는 최적화는 **QueryDSL·네이티브 쿼리**로 인덱스 힌트(`FORCE INDEX`)·커버링·배치까지 직접 제어. "개발자 급여가 최대 비용이면 초기엔 ORM으로 빨리, N+1만 이해하면 방어 가능"(HN)도 맞다 — **초기 속도 vs 장기 최적화 트레이드오프를 의식적으로.**
- **`rewriteBatchedStatements=true`**(JDBC URL)를 꼭 확인 — 안 켜면 배치 이득이 사라진다.

## 이 가이드에서 취할 원칙 (원본과 공유하되 MySQL 강조)

1. **바이너리 사고**: 인덱스 or 풀스캔.
2. **PK를 순차로**(클러스터드라 UUID PK가 특히 위험 — MySQL 고유 강조).
3. **긴 트랜잭션이 만악의 근원**(undo/purge·MDL·데드락 전부 여기서) — 짧게.
4. **마이그레이션은 온라인 DDL·gh-ost·하위호환**, 대량 변경은 dry-run.
5. **백업·모니터링을 코드/경보로 외부화**(원본이 빠뜨린 진짜 생존).
6. **LLM이 쓴 쿼리도 이 멘탈 모델 가진 사람이 리뷰**(원본 저자의 "LLM이 쓰면 최적화 불가"경고 — 탈숙련 방어).

## 온다 / CRS 적용 체크리스트

- [ ] **PK 감사**: 예약·정산 테이블 PK가 순차(BIGINT AUTO_INCREMENT)인가, 어딘가 UUIDv4를 PK로 쓰고 있지 않은가(클러스터드 단편화·보조 인덱스 비대).
- [ ] **시간 UTC 고정**: 서버·세션 `time_zone`=UTC, 컬럼 `DATETIME(6)`, 앱 UTC 처리 — 예약 시각의 tz 버그는 CRS에 치명적.
- [ ] **긴 트랜잭션 사냥**: `INNODB_TRX`·History list length 경보를 호출기에. 정산 배치가 트랜잭션을 오래 붙잡지 않는가.
- [ ] **마이그레이션 무중단**: 운영 테이블 스키마 변경은 온라인 DDL/gh-ost, MDL 대비 `lock_wait_timeout`, 대량 UPDATE/DELETE는 방법론 dry-run 게이트 후 batched.
- [ ] **JDBC 배치**: `rewriteBatchedStatements=true` 켜져 있는가.
- [ ] **N+1 감사**: 예약 목록·정산 리포트에 Hibernate N+1이 없는가(fetch join/@EntityGraph), 무거운 조회는 **헤비 사업자 최악 경우로** 튜닝(FORCE INDEX).
- [ ] **백업·PITR**: XtraBackup + binlog PITR, 다른 위치/계정. 복구 리허설을 실제로 해봤는가.
- [ ] **작업 큐**: 정산·발송 큐가 `FOR UPDATE SKIP LOCKED`(대화형) or 즉시 상태 갱신+멱등성(고성능) 중 맞는 걸 쓰는가.
- [ ] **LLM 쿼리 리뷰**: AI로 뽑은 쿼리를 인덱스·EXPLAIN 이해하는 사람이 리뷰하는가.

## 연관 자료
- [[2026-07-23-postgres-survival-guide-startups]] — *원본 Postgres 가이드(이 문서의 출발점, 구조 차이 5가지가 핵심)*
- [[2026-07-22-data-management-in-the-age-of-ai-inmon]] — *백업·추가전용 = believable data의 최후 방어선*
- [[2026-07-22-who-will-thrive-in-the-age-of-ai]] · [[2026-07-14-why-write-code-in-2026]] — *"LLM이 쿼리 쓰면 최적화 불가" = 탈숙련, 멘탈 모델을 유지해야 검증 가능*
- [[2026-07-22-taste-cannot-be-delegated]] · [[2026-07-17-wes-mckinney-ai-arrow-future-of-software]] — *옵티마이저=평균 최적화, 판단=최악(FORCE INDEX) — 평균 vs 판단 축의 DB판*
- [[2026-06-30-postgresql-19-beta-deep-dive]] — *비교 참고(Postgres 계열 최신)*

## 한 달 뒤 회고
*(2026-08-23 즈음 — 온다 MySQL에 PK 감사·UTC 고정·긴 트랜잭션 경보·XtraBackup PITR·rewriteBatchedStatements·N+1 감사를 실제로 적용했는지, 마이그레이션을 온라인 DDL/gh-ost로 했는지, "wraparound 걱정 대신 undo/purge·MDL"이라는 MySQL 고유 위험을 팀이 이해했는지 기록.)*
