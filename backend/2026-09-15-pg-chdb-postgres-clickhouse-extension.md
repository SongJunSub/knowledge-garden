---
title: "pg_chdb (ClickHouse) — Postgres 안에 분석 엔진을 통째로 심는 대신, 별도 프로세스로 격리해 OOM 위험을 백엔드 밖으로 밀어낸다"
source_title: "pg_chdb: Execute chDB queries in Postgres"
source_url: "https://github.com/ClickHouse/pg_chdb"
source_name: "GitHub (ClickHouse)"
referrer_url: "https://news.hada.io/topic?id=33716"
published_at: "2026-09 (추정)"
summarized_at: "2026-09-15"
category: "backend"
tags: ["postgresql", "clickhouse", "chdb", "fdw", "olap", "extension-architecture", "s3", "duckdb-comparison"]
---

# pg_chdb (ClickHouse)

> 출처: [pg_chdb](https://github.com/ClickHouse/pg_chdb) (GitHub, ClickHouse 조직) · GeekNews(id=33716) 경유 · 정리일 2026-09-15

## 한 줄 요약
**ClickHouse가 만든 pg_chdb는 임베디드 ClickHouse 엔진 chDB를 Postgres에서 함수(`chdb_query()`) 하나로 호출해 S3·GCS·Azure Blob·HDFS의 외부 데이터를 조회·수집(COPY 확장)하는 확장이다. 핵심은 성능 수치가 아니라 아키텍처 선택이다 — chDB 라이브러리를 Postgres 백엔드 프로세스 안에 직접 얹는 대신 ***별도 helper 프로세스로 띄우고 파일 디스크립터로 통신***해, chDB가 죽거나 메모리를 과하게 먹어도 Postgres 클러스터 본체가 함께 죽지 않게 격리한다 — 같은 문제를 정면으로 embed하는 경쟁 확장 pg_duckdb와 정확히 반대 방향의 선택이다.**

## 핵심 포인트
- **아키텍처의 핵심 차이 — embed가 아니라 helper 프로세스** — pg_duckdb는 ***Postgres 백엔드 프로세스 하나당 DuckDB 인스턴스 하나를 인프로세스로 직접 얹는다.*** pg_chdb는 반대로 chDB 라이브러리를 ***별도 helper 애플리케이션에 담아 필요할 때만 띄우고***, STDIN/STDOUT/STDERR와 설정용 파일 디스크립터로 통신한다. ***"이 설계는 chDB 라이브러리가 단일 커맨드 실행에 필요한 것 이상으로 리소스를 소비하지 못하게 막고, 공유 메모리를 쓰는 백그라운드 워커 방식이었다면 겪었을 OOM 위험으로부터 Postgres 클러스터 자체를 격리한다."*** — 즉 chDB가 크래시해도 그 helper 프로세스 하나만 죽지, Postgres 백엔드나 클러스터 전체가 함께 죽지 않는다.
- **두 가지 인터페이스** — `chdb_query()` 함수로 임의 쿼리를 즉석 실행해 결과를 테이블 형태로 받거나, `chdb_hook` 모듈로 ***`COPY`와 `CREATE TABLE` 명령 자체를 확장***해 클라우드 스토리지에서 대량 데이터를 직접 로드한다. glob 패턴으로 여러 파일을 한 번에 처리할 수 있다.
- **지원 포맷의 폭** — CSV, TSV, JSON, Parquet, Avro, ORC, Protobuf 등 다수 포맷과 압축 알고리즘을 지원한다고 소개되며, 이 포맷 다양성이 pg_duckdb·pg_lake·aws_s3 대비 강조되는 차별점 중 하나다.
- **자체 벤치마크(NYC Taxi ~100만 행)** — pg_duckdb·pg_lake·aws_s3와 비교해 ***CSV·JSON·Parquet 포맷에서 2~3배 빠르다***고 주장하며, "aws_s3·pg_duckdb·pg_lake 대비 가장 일관된 성능"이라는 표현을 쓴다.
- **요구사항과 성숙도 신호** — PostgreSQL 15 이상, chDB 라이브러리 v26.7.0 이상(Linux·macOS만), Apache-2.0 라이선스. GitHub 기준 ***Star 16개·Fork 0개·커밋 84개·오픈 이슈 4개*** — ClickHouse 조직이 만든 신생 프로젝트로, 실사용 검증은 아직 두텁지 않다.

## 인상 깊은 문장
> "This design prevents the chDB library from consuming any more resources than necessary to carry out a single command. It also isolates the PostgreSQL cluster itself from out-of-memory issues that using shared memory with a background worker would suffer." (GitHub README, WebFetch로 직접 확인)

## 댓글
`news.hada.io`(id=33716)는 이 세션에서 egress 전면 차단돼 hada 댓글 수·논조는 확인하지 못했다. 다만 `github.com/ClickHouse/pg_chdb`는 이번 세션에서 직접 WebFetch로 열람이 가능해, README에 적힌 아키텍처 설명·벤치마크 조건·저장소 통계(Star 16, 커밋 84)는 재인용이 아니라 원문 그대로 확인한 내용이다. HN·Lobsters 등 별도 큐레이션 스레드가 존재하는지는 이번 조사에서 특정하지 못했다. **정직하게 짚을 한계**: 벤치마크가 ClickHouse 자체 발표 수치이자 NYC Taxi라는 단일 데이터셋·단일 규모(~100만 행)에서 나온 결과라 일반 워크로드로 확대 해석할 수 없고, Star 16·Fork 0이라는 저장소 활동 지표는 이 확장이 아직 커뮤니티 검증을 충분히 거치지 않은 이른 단계 프로젝트임을 보여준다 — "ClickHouse가 만들었다"는 브랜드와 "실사용에서 안정적으로 검증됐다"는 것은 다른 질문이다.

## 내 생각 · 적용점

### 핵심 전이 1 — DuckDB v2.0의 반대 방향 선택, 같은 딜레마의 두 해법
[[2026-08-18-duckdb-2-0-cyanoptera-preview]]에서 정리한 pg_duckdb·Quack 프로토콜은 ***분석 엔진을 프로세스 안으로 더 깊이 끌어들이는 방향***이었고, 그 노트의 핵심 전이 1이 "Quack을 켜는 것은 새 서비스를 배포하는 것으로 취급하라"는 경고였다 — 인프로세스 임베딩이 주는 속도의 대가로 운영 부담·보안 표면·크래시 전파 위험이 함께 커진다는 것. pg_chdb는 정확히 그 대가를 피하려고 ***의도적으로 별도 프로세스를 선택***한 사례다. 같은 "임베디드 분석 엔진을 Postgres에 붙인다"는 문제에 두 프로젝트가 정반대 아키텍처로 답한 셈이라, 두 노트를 나란히 두면 "속도(인프로세스) vs 격리(별도 프로세스)"라는 트레이드오프 축이 뚜렷해진다.

### 핵심 전이 2 — ClickHouse 계열 노트에 "확장 형태로 Postgres에 붙는다"는 네 번째 각도가 더해짐
가든에는 이미 [[2026-05-11-clickhouse-overview]](개념 입문), [[2026-07-03-clickhouse-winning-observability-wars]](Observability 시장 비용 우위), [[2026-09-03-clickhouse-miracle-database-technology]](ChartMogul의 도입 계기: 관계형 DB와 데이터 웨어하우스 사이의 빈틈)까지 세 편의 ClickHouse 노트가 있다. pg_chdb는 이 계열에 "***별도 클러스터를 두지 않고 Postgres 확장으로 ClickHouse 엔진을 끌어온다***"는 배포 형태의 각도를 더한다 — [[2026-09-03-clickhouse-miracle-database-technology]]가 짚은 "관계형 DB도 데이터 웨어하우스도 아닌 자리"를, 이번엔 별도 인프라 없이 기존 Postgres 위에서 메워보려는 시도로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트
온다 CRS가 이미 운영 DB로 PostgreSQL을 쓰고 있다면, 파트너 채널 로그·요금 히스토리 같은 대용량 원본을 S3에 Parquet/CSV로 쌓아두고 ***별도 ClickHouse 클러스터 구축 없이 pg_chdb의 `chdb_query()`로 임시 분석***을 시도해볼 만하다 — 특히 helper 프로세스 격리 설계 덕분에 "이 쿼리 하나가 실수로 무겁더라도 운영 Postgres 클러스터 전체가 죽지는 않는다"는 안전판이 있다는 점이 실무적으로 유의미하다. 다만 Star 16·이른 단계 프로젝트라는 성숙도를 감안하면, 운영 크리티컬 경로(예약·결제)에 바로 붙이기보다는 ***읽기 전용 분석·리포팅용 별도 replica에서 먼저 검증***하는 것이 순서다. pg_duckdb·pg_lake와 나란히 PoC를 돌려 "우리 채널 데이터 포맷·규모에서 2~3배 수치가 재현되는지"부터 확인해야 한다 — README의 벤치마크는 NYC Taxi 데이터셋 기준이지 온다 데이터 기준이 아니다.

## 연관 자료
- [[2026-08-18-duckdb-2-0-cyanoptera-preview]] — 같은 문제(분석 엔진을 Postgres/애플리케이션에 붙이기)에 정반대 아키텍처(인프로세스 임베딩)로 답한 대칭 사례
- [[2026-05-11-clickhouse-overview]] — ClickHouse 개념·SQL 입문
- [[2026-07-03-clickhouse-winning-observability-wars]] — ClickHouse의 Observability 시장 비용 우위
- [[2026-09-03-clickhouse-miracle-database-technology]] — 관계형 DB와 데이터 웨어하우스 사이 빈틈을 메운다는 ClickHouse 선택 이유, pg_chdb가 그 빈틈을 배포 형태 측면에서 다시 메우는 시도

## 한 달 뒤 회고
*(2026-10-15 즈음 — pg_chdb의 GitHub Star·이슈 활동이 늘었는지, 실사용 후기(HN·Lobsters·블로그)가 나왔는지, 그리고 helper 프로세스 격리 설계가 실제 장애 상황에서 주장대로 작동했다는 보고가 있는지 확인.)*
