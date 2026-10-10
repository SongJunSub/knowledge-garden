---
title: "DuckLake (DuckDB팀, Mark Raasveldt·Hannes Mühleisen) — 레이크하우스의 메타데이터 문제는 애초에 '파일 문제'가 아니라 '데이터베이스 문제'였다"
source_title: "DuckLake: SQL as a Lakehouse Format"
source_url: "https://ducklake.select/2025/05/27/ducklake-01/"
source_name: "ducklake.select / duckdb.org (DuckDB팀 공식 발표)"
referrer_url: "https://news.hada.io/topic?id=35046"
published_at: "2025-05-27"
summarized_at: "2026-10-10"
category: "backend"
tags: ["ducklake", "duckdb", "lakehouse", "parquet", "iceberg", "delta-lake", "data-catalog", "sql"]
---

# DuckLake (DuckDB팀) — SQL과 Parquet 기반의 데이터 레이크하우스 형식

> 출처: [DuckLake: SQL as a Lakehouse Format](https://ducklake.select/2025/05/27/ducklake-01/) (DuckDB팀, Mark Raasveldt·Hannes Mühleisen) · GeekNews(id=35046) 경유 · 정리일 2026-10-10

## 한 줄 요약

**DuckLake는 Iceberg·Delta Lake가 "데이터베이스 없이도 되게" 설계하면서 결국 메타데이터를 블롭스토리지 위 수많은 파일(매니페스트·스냅샷 JSON 등)로 흩뿌리게 된 것을 뒤집는다. 스키마·파일 포인터·트랜잭션 로그 같은 메타데이터는 그냥 평범한 SQL 데이터베이스(Postgres·MySQL·SQLite·DuckDB 중 선택)에 담고, 스토리지에는 Parquet 데이터 파일만 남긴다. "메타데이터 문제는 이미 데이터베이스가 풀어놓은 문제였다"는 재인식이 핵심이다.**

## 핵심 포인트

- ***Iceberg·Delta Lake의 설계 전제 자체를 문제삼는다*** — 두 포맷은 "데이터베이스를 요구하지 않도록" 모든 정보를 블롭스토리지의 파일에 인코딩하는 데 공을 들였다. 그 결과 Iceberg는 루트 파일마다 기존 스냅샷 전체와 스키마 정보를 통째로 담고, 변경이 있을 때마다 전체 히스토리를 포함한 새 파일을 쓴다.
- ***카탈로그에 SQL 질의 한 번*** — Iceberg/Delta는 쿼리를 날리기 전 메타데이터 파일 → 매니페스트 리스트 → 매니페스트 파일을 순차적으로 읽어야 한다(모더덕 측 추정으로 객체스토리지 요청당 ~100ms, 쿼리 시작 전 약 0.5초 추가 — 벤더 주장, 독립 벤치마크 아님). DuckLake는 이 과정을 카탈로그 DB에 대한 SQL 질의 하나로 대체해 파일 목록과 통계를 한 번에 받는다.
- ***데이터는 Parquet만*** — 스토리지에 남는 건 Parquet 파일뿐이고, 로컬 디스크든 S3·GCS 같은 오브젝트 스토리지든 가능하다. 카탈로그 DB는 Postgres·MySQL·SQLite·DuckDB 중 선택.
- ***기능은 Iceberg급*** — 스냅샷, 타임트래블 쿼리, 스키마 진화, 파티셔닝을 지원하고 멀티테이블 연산에 ACID 트랜잭션을 보장한다.
- ***한계도 명확*** — Thoughtworks Technology Radar(2026-04)는 "Assess" 등급을 매기며 인덱스, 기본키/외래키가 없다는 점을 지적했다. v1.0 스펙은 2026년 4월경 발표(Pedro Holanda·Mark Raasveldt 개발자 디스커션에서 Iceberg 호환성·v2.0 논의도 함께 다뤄짐).

## 인상 깊은 문장

> (원문 블로그 duckdb.org/ducklake.select 직접 열람이 막혀, WebSearch로 교차확인된 2차 서술을 종합한 paraphrase임을 명시) "Iceberg와 Delta Lake는 데이터베이스를 요구하지 않도록 설계되었지만, 사실 그 두 포맷도 일관성 보장을 위해 이미 데이터베이스와 비슷한 것을 필요로 하고 있었다."

## 댓글

**GeekNews(hada) 토픽 페이지(id=35046) 자체가 이번 세션에서 전면 차단되어 댓글 수·의견 클러스터를 확인하지 못했다.** HN·Lobsters에 이 블로그 포스트(2025-05-27)에 대한 토론이 있었을 가능성이 높지만, 이번 검색에서 구체적인 스레드를 특정하지 못했다(없다고 단정하는 것이 아니라 "못 찾음"). duckdb.org·ducklake.select 원문도 직접 열람이 막혀, motherduck.com·thoughtworks.com 등 2차 서술과 WebSearch 요약으로 내용을 재구성했다 — 모더덕은 DuckDB 상업 파트너라 성능 비교(0.5초 지연 등)에는 벤더 편향이 있을 수 있음을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "메타데이터는 원래부터 데이터베이스가 풀던 문제였다"

Iceberg·Delta의 "파일로 모든 걸 인코딩하자"는 설계는 그 자체로 하나의 미니 데이터베이스(트랜잭션 로그, 인덱스 역할의 매니페스트)를 파일 시스템 위에 재발명한 것이었다. DuckLake는 "왜 이미 수십 년간 이 문제를 풀어온 SQL DB를 안 쓰는가"라고 되묻는다. 이건 바퀴를 파일 포맷으로 재발명하지 말고 검증된 레이어에 위임하라는 보편적 엔지니어링 원리이고, 같은 배치에서 정리한 [[2026-10-10-vgpu-webgpu-browser-node-library]]가 "브라우저/Node/테스트용 WebGPU 레이어를 각각 새로 만들지 말고 공통 레이어 하나로" 접근하는 것과 같은 결이다.

### 핵심 전이 2 — DuckDB 생태계 타임라인 속에서 본 DuckLake

DuckLake는 DuckDB팀이 만든 "두 번째 축"이다. [[2026-08-27-aws-acquires-ducklabs-duckdb]]에서 정리했듯 DuckLabs는 자력 성장 30여 명 팀이 "우리가 병목이 될 것"을 이유로 AWS 인수를 택했는데, DuckLake 같은 야심찬 포맷 설계·표준화 작업이 그 "우리가 감당 못 할 범위"의 실체였을 가능성이 있다. [[2026-08-18-duckdb-2-0-cyanoptera-preview]]·[[2026-09-29-why-duckdb-2-0-is-faster]]가 엔진 자체의 성능 개선이라면, DuckLake는 그 엔진이 다루는 "포맷·카탈로그" 층위의 야심이다.

### 핵심 전이 3 — "저장보다 의미·계약이 중요하다"는 아키텍처 조류와 일치

[[2026-08-31-ai-era-data-architecture-meaning-over-storage]]는 "여섯 패턴은 대안이 아니라 처리·소유권·의미를 각각 결정하는 조합 가능한 축"이라고 했고, 이 글에 "lakehouse" 태그가 이미 붙어 있다. DuckLake는 그 축 중 "메타데이터 카탈로그"를 어디에 둘 것인가라는 결정을 "파일이 아니라 평범한 SQL DB"로 명확히 내린 사례다. 그리고 [[2026-08-25-sqlite-for-everything]]의 "서버가 사라지면 그걸 둘러싼 아키텍처 결정 자체가 사라진다"는 명제는 DuckLake가 카탈로그로 SQLite도 선택할 수 있게 한 설계와 바로 연결된다 — **거대한 분산 레이크하우스조차 카탈로그 층위에서는 "작은 임베디드 DB 하나"로 충분할 수 있다.**

## 호스피탈리티 / CRS 적용 포인트

CRS가 다루는 예약·요금·재고·로그 데이터는 아직 Iceberg·Delta급 "레이크하우스"가 필요한 규모는 아니지만, 원칙은 전이 가능하다. **분석/리포팅용 데이터 파이프라인을 구축할 때 "메타데이터(스키마·파티션·버전)를 어디에 둘 것인가"를 파일 기반 매니페스트로 직접 설계하기보다, 이미 운영 중인 Postgres 같은 관계형 DB를 카탈로그로 재사용하는 쪽이 운영 복잡도를 줄인다**는 DuckLake의 메시지는 직접 참고할 만하다. 다만 지금 당장 Parquet 레이크하우스 전환이 필요한 데이터 볼륨은 아니라, 전면 도입보다는 "카탈로그를 파일로 흩뿌리지 말라"는 설계 원칙만 가져가는 수준이 현실적이다.

## 연관 자료
- [[2026-08-27-aws-acquires-ducklabs-duckdb]] — *DuckLake를 만든 DuckDB팀 자체의 조직적 선택(인수)*
- [[2026-08-18-duckdb-2-0-cyanoptera-preview]] — *DuckDB 엔진 층위의 동시대 개선*
- [[2026-09-29-why-duckdb-2-0-is-faster]] — *같은 DuckDB 2.0 성능 개선의 다른 측면*
- [[2026-08-25-sqlite-for-everything]] — *"서버가 사라지면 아키텍처 결정도 사라진다" — DuckLake의 SQLite 카탈로그 옵션과 직결*
- [[2026-08-31-ai-era-data-architecture-meaning-over-storage]] — *저장보다 의미·계약이 중요하다는 동시대 아키텍처 조류, lakehouse 태그 공유*

## 한 달 뒤 회고
*(2026-11-10 즈음 — DuckLake를 원문(duckdb.org/ducklake.select)에서 직접 확인했는지, GeekNews 토픽(id=35046)이 어떤 구체적 계기(v1.0 안정화·신규 커넥터 등)로 올라온 글이었는지 파악했는지, CRS 리포팅 파이프라인에 "카탈로그를 어디에 둘 것인가" 결정을 실제로 적용해봤는지 기록.)*
