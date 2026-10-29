---
title: "파일에서 테이블로: Parquet, Iceberg, Delta Lake와 데이터 레이크하우스 (GeekNews GeekCast, 영상) — 시즌2 EP03: 레이크에는 파일이 쌓여 있는데, 분석가는 어떻게 주문 테이블 이름으로 데이터를 조회할까"
source_title: "파일에서 테이블로: Parquet, Iceberg, Delta Lake와 데이터 레이크하우스 | 최신 데이터 인프라 이해하기 시즌2 EP03"
source_url: "https://news.hada.io/geekcast/data-infra-s2-ep03"
source_name: "GeekNews GeekCast (영상), 전편 [[2026-10-22-geeknews-data-infra-warehouse-lake-s2ep02]]의 직속 후속편"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-29"
category: "architecture"
tags: ["data-lakehouse", "parquet", "iceberg", "delta-lake", "geekcast", "metastore", "glue-data-catalog", "ducklake"]
---

# 파일에서 테이블로: Parquet, Iceberg, Delta Lake와 데이터 레이크하우스 (GeekNews GeekCast)

> 출처: GeekNews GeekCast "[파일에서 테이블로: Parquet, Iceberg, Delta Lake와 데이터 레이크하우스 | 최신 데이터 인프라 이해하기 시즌2 EP03](https://news.hada.io/geekcast/data-infra-s2-ep03)" (영상) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-29

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). 영상이라 WebFetch로도 본문 전체를 얻기 어렵다. Slack 발췌(본문 3단락, 중간에 끊김)만으로 작성했다.

## 한 줄 요약

**레이크에 파일이 쌓여 있는데 분석가는 어떻게 주문 테이블 이름으로 데이터를 조회하는지 묻는 질문에서 출발해, Parquet·ORC·Avro(데이터를 담는 형식)와 Iceberg·Delta Lake(여러 파일을 테이블로 관리하는 형식), 카탈로그(이름으로 테이블 정보를 찾는 연결)를 구분하고, 객체 저장소와 버킷부터 Hive ACID·Hive Metastore·AWS Glue Data Catalog·DuckLake까지 이어지는 지도를 그린다.**

## 핵심 포인트

- **"파일이 쌓여 있는데 테이블 이름으로 조회한다"는 질문** — 지난 6개월간의 키보드 광고 캠페인과 쇼핑몰 주문을 예로, 레이크에는 파일이 쌓여 있을 뿐인데 분석가가 ***주문 테이블 이름***으로 데이터를 조회할 수 있는 이유를 데이터 레이크의 세 가지 역할로 구분해 설명한다.
- **형식의 3단 구분** — Parquet, ORC, Avro는 ***데이터를 담는 형식***이고, Iceberg와 Delta Lake는 ***여러 파일을 테이블로 관리하는 형식***이며, 카탈로그는 ***이름에서 테이블 정보를 찾아가는 연결***이라는 3단 구분을 제시한다. 이 구분이 이번 에피소드의 핵심 프레임이다.
- **객체 저장소부터 DuckLake까지** — 객체 저장소와 버킷부터 시작해 Hive ACID, Hive Metastore와 AWS Glue Data Catalog, DuckLake까지 같은 지도에서 살펴본다. 타임 트래블, 스키마 변경, 파티셔닝까지 다룰 것을 예고하지만 Slack 발췌는 여기서 끊긴다.

## 인상 깊은 문장

> "Parquet, ORC, Avro는 데이터를 담는 형식, Iceberg와 Delta Lake는 여러 파일을 테이블로 관리하는 형식, 카탈로그는 이름에서 테이블 정보를 찾아가는 연결입니다." (Slack GeekNews 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단). Slack 발췌가 "타임 트래블, 스키마 변경, 파티셔닝과…"에서 끊겨 DuckLake가 Hive Metastore·Glue Data Catalog와 정확히 어떻게 다른지(발췌에 이름만 등장)까지는 확인하지 못했다.

## 내 생각 · 적용점

**핵심 전이 — [[2026-10-22-geeknews-data-infra-warehouse-lake-s2ep02]]가 "웨어하우스 대 레이크"를 저장-계산 분리라는 큰 틀에서 구분했다면, 이번 EP03은 그 "레이크" 쪽을 한 단계 더 열어 "파일 형식 대 테이블 형식 대 카탈로그"라는 3단 구조로 쪼갠다.** 이 시리즈는 매 편마다 "왜 이렇게 복잡해 보이는 레이어가 필요한가"라는 실무자의 가장 기본적인 질문에서 시작해 점점 세분화된 지도를 그려가는 방식을 취하고 있다 — EP01이 전체 지형을, EP02가 웨어하우스/레이크 구분을, EP03이 레이크 내부의 형식 계층을 다루는 식으로 단계적으로 좁혀온다. 이 반복되는 "질문에서 시작해 지도로 가는" 구성 자체가, 복잡한 데이터 인프라 생태계를 설명하는 효과적인 교육 패턴으로 읽힌다. [[2026-10-23-why-parquet-dominates-data-engineering]]이 Parquet 자체를 깊게 판 것과 비교하면, 이번 EP03은 Parquet을 "형식 3단 구분"이라는 더 넓은 틀 안의 한 조각으로 재배치한다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 예약·결제·재고 데이터를 분석 목적으로 데이터 레이크에 쌓고 있다면(S3 등 객체 저장소에 원천 로그를 적재하는 패턴), 이 3단 구분(파일 형식/테이블 형식/카탈로그)은 "지금 우리가 쓰는 도구가 이 중 어떤 레이어를 담당하는지" 점검하는 유용한 체크리스트가 된다. 다만 직접적인 구현 결정이라기보다는 개념 지도 수준의 적용이라, 실제 레이크하우스 구축은 각 레이어별 도구 선택을 별도로 검토해야 한다.

## 연관 자료

- [[2026-10-22-geeknews-data-infra-warehouse-lake-s2ep02]] — 바로 전편. 웨어하우스/레이크의 저장-계산 분리를 다뤘고, 이번 EP03이 레이크 내부를 더 세분화한다.
- [[2026-10-15-geeknews-data-infra-map-s2ep01]] — 시즌2 전체 지형을 그린 1편.
- [[2026-10-23-why-parquet-dominates-data-engineering]] — Parquet 자체를 더 깊게 판 노트, 이번 에피소드의 "데이터를 담는 형식" 범주에 해당.

## 한 달 뒤 회고

2026-11-29 즈음, `news.hada.io` 접근이 풀렸다면 Slack 발췌에서 끊긴 타임 트래블·스키마 변경·파티셔닝 부분과 DuckLake가 Hive Metastore·Glue Data Catalog와 정확히 어떻게 다른지 확인하고, 시즌2 EP04가 올라왔는지도 함께 점검한다.
