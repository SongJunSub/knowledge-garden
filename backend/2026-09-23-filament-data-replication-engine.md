---
title: "Filament — 데이터베이스와 SaaS 데이터를 옮기고 동기화하는 오픈소스 도구"
source_title: "Filament - 데이터베이스와 SaaS 데이터를 옮기고 동기화하는 오픈소스 도구"
source_url: "https://filament.getgalaxy.io/pages/guides/get-started/introduction"
source_name: "Galaxy(getgalaxy.io), GeekNews(id=34152) 경유"
referrer_url: "https://news.hada.io/topic?id=34152"
published_at: "2026-09-23 (정확한 게시일 미확인)"
summarized_at: "2026-09-23"
category: "backend"
tags: ["filament", "data-replication", "cdc", "go", "etl"]
---

# Filament — 데이터베이스와 SaaS 데이터를 옮기고 동기화하는 오픈소스 도구

> 출처: [Filament - 데이터베이스와 SaaS 데이터를 옮기고 동기화하는 오픈소스 도구](https://news.hada.io/topic?id=34152) (Galaxy, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`filament.getgalaxy.io` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장 잘림)와 WebSearch(GitHub, Hacker News Show HN, DeepWiki)로 교차확인했다.

## 한 줄 요약

**Filament는 서로 다른 DB·데이터 웨어하우스·SaaS 사이의 데이터를 전체 복사·증분 갱신·변경 데이터 캡처(CDC) 방식으로 옮기고 동기화하는 Go 기반 데이터 복제 엔진으로, 배치 단위로 체크섬을 검증하며 안전하게 체크포인트를 진행한다.**

## 핵심 포인트

- **DB·데이터 웨어하우스·SaaS 사이를 옮기는 Go 기반 엔진** — 데이터베이스와 업무 서비스의 데이터를 다른 DB, 데이터 웨어하우스, 객체 스토리지로 옮기는 ***Go 기반 데이터 복제 엔진***이다.
- **전체 복사 / 증분 갱신 / CDC 세 방식 모두 지원** — 전체 데이터를 한 번에 복사하거나, 변경된 데이터만 가져오거나, ***변경 데이터 캡처(CDC)***로 추가/수정/삭제를 반영하는 방식을 지원한다.
- **DB뿐 아니라 GitHub·Slack·Notion·Stripe 등 SaaS 커넥터** — PostgreSQL/MySQL뿐 아니라 GitHub, Slack, Notion, Stripe, HubSpot 등에서 데이터를 가져와 ***여러 서비스에 흩어진 정보를 한곳에 모으는 데*** 활용한다.
- **배치 단위 체크섬 검증 + 안전한 체크포인트** — WebSearch 확인으로는 실행 중 레코드를 정해진 크기의 배치로 나눠 추출하고, 각 배치를 쓰고 검증한 뒤 성공한 작업에 대해서만 durable 체크포인트를 전진시킨다 — 중간에 실패해도 마지막 검증된 지점부터 재개할 수 있는 구조다.
- **저장 대상은 PostgreSQL/MySQL, ClickHouse, Snowflake, BigQuery, Redshift, Iceberg, S3/GCS 등** — 읽기... [GeekNews 발췌 문장 잘림]. Apache 2.0 라이선스, 아직 1.0 이전 버전(pre-1.0)이다.

## 인상 깊은 문장

> "전체 데이터를 한 번에 복사하거나, 변경된 데이터만 가져오거나, 변경 데이터 캡처(CDC)로 추가/수정/삭제를 반영하는 방식 지원"
> (GeekNews 발췌 원문)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). pre-1.0 상태라는 점, 그리고 이미 Airbyte·Fivetran·Debezium 같은 성숙한 CDC/ETL 도구가 있는 영역이라는 점에서 "왜 또 하나의 데이터 이동 도구인가"에 대한 답(임베딩 가능한 Go 라이브러리 형태, 교체 가능한 인터페이스 설계 등 차별점)은 원문에서 직접 확인이 필요하다.

## 내 생각 · 적용점

### 핵심 전이 — "임베딩 가능한 단일 바이너리" 계열의 데이터 인프라 도구가 계속 등장한다

가든의 [[2026-08-29-syncular-offline-first-sqlite-sync-engine]](오프라인 우선 SQLite 동기화 엔진), [[2026-08-27-aws-acquires-ducklabs-duckdb]](단일 바이너리 분석 엔진)와 같은 계열이다 — "무거운 클러스터·별도 서비스 없이 단일 바이너리·임베딩 가능한 라이브러리로 데이터 이동·동기화 문제를 푼다"는 패턴이 CDC/복제 영역에도 반복해서 나타난다. Sources·sinks·상태 저장소·이벤트 전송을 교체 가능한 인터페이스로 분리한 설계도, 가든이 반복해서 좋게 평가해온 "작은 조각을 조합 가능하게" 원칙과 맞닿아 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS는 PMS·OTA·결제 게이트웨이 등 다수의 외부 SaaS/DB와 데이터를 주고받는데, 이런 연동은 대개 개별 배치 스크립트나 커스텀 웹훅으로 산발적으로 구현되기 쉽다. Filament 같은 "체크포인트 + 배치 검증"을 내장한 범용 복제 엔진을 연동 레이어로 표준화하면, 중간 실패 시 처음부터 재시도하지 않고 마지막 검증 지점부터 재개할 수 있어 성수기 대량 동기화(재고·요금 일괄 갱신) 안정성을 높일 수 있다.

## 연관 자료

- [[2026-08-29-syncular-offline-first-sqlite-sync-engine]] — 오프라인 우선 동기화 엔진, 같은 "가벼운 데이터 이동 도구" 계열
- [[2026-08-27-aws-acquires-ducklabs-duckdb]] — 단일 바이너리 데이터 엔진 트렌드
- [[2026-09-23-fluree-graph-database]] — 같은 배치, 데이터 이력·이동 관점의 또 다른 오픈소스 DB 도구

## 한 달 뒤 회고

*(2026-10-23 즈음 — 1.0 릴리스 여부, 실제 프로덕션 도입 사례·기존 CDC 도구 대비 벤치마크 확인.)*
