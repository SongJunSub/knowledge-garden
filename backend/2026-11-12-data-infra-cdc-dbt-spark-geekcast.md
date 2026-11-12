---
title: "데이터 수집과 변환: CDC, dbt, Spark로 변경 반영하기 (GeekNews geekcast, 부분 확인) — 변경을 어디 층에서 반영하느냐가 CDC·dbt·Spark를 가른다"
source_title: "데이터 수집과 변환: CDC, dbt, Spark로 변경 반영하기 | 최신 데이터 인프라 이해하기 시즌2 EP05"
source_url: "https://news.hada.io/geekcast/data-infra-s2-ep05"
source_name: "GeekNews geekcast"
referrer_url: "https://news.hada.io/geekcast/data-infra-s2-ep05"
summarized_at: "2026-11-12"
category: "backend"
tags: ["cdc", "dbt", "spark", "data-pipeline", "airflow", "zero-etl", "fivetran"]
---

# 데이터 수집과 변환: CDC, dbt, Spark로 변경 반영하기 (GeekNews geekcast)

> 출처: [데이터 수집과 변환: CDC, dbt, Spark로 변경 반영하기 | 최신 데이터 인프라 이해하기 시즌2 EP05](https://news.hada.io/geekcast/data-infra-s2-ep05) (GeekNews geekcast) · 정리일 2026-11-12
>
> **출처 한계**: `news.hada.io` egress 차단으로 팟캐스트 원문을 듣지 못했다. WebSearch로 dbt 공식 문서("Change data capture in dbt")와 Databricks AUTO CDC 문서를 교차확인해 CDC·dbt·Spark가 각각 어떤 층을 맡는지의 일반 사실은 확인했지만, 이 geekcast 에피소드의 구체적 발언·사례(서비스 DB 변경을 레이크에 반영한 뒤 광고 분석까지 갱신하는 과정, Zero-ETL·Fivetran·Databricks Lakeflow·Amazon EMR Serverless의 운영 분담)는 Slack 발췌문에만 의존했다.

## 한 줄 요약

**CDC는 원천 DB의 변경을 포착하는 수집 계층, dbt는 그 변경을 증분·스냅샷으로 다루는 변환 계층, Spark는 변경 피드를 대규모로 적용하는 처리 계층으로 서로 다른 층을 맡으며, Zero-ETL·Fivetran·Databricks Lakeflow 같은 관리형 도구들이 그 사이의 운영 부담을 대신 떠안는다.**

## 핵심 포인트

- **CDC와 CDF의 차이**: CDC(Change Data Capture)는 원천 DB의 변경 이벤트를 포착하는 수집 메커니즘이고, CDF(Change Data Feed)는 그 변경을 하류 시스템이 소비할 수 있는 피드 형태로 노출하는 것이라는 구분이 다뤄진다.
- **dbt의 두 가지 CDC 처리 방식**: dbt 공식 문서 기준으로 ***증분 모델(incremental model)***은 unique_key로 기존 행을 교체해 테이블을 최신 상태로만 유지하고, ***스냅샷***은 dbt_valid_from/dbt_valid_to로 이력을 보존한다(WebSearch 교차확인).
- **Spark의 역할**: Databricks의 AUTO CDC API처럼 Spark 계열은 변경 피드를 선언적으로 적용하고 SCD Type 1/2 처리, 순서가 뒤바뀐(out-of-order) 변경까지 다루는 대규모 처리 계층을 맡는다.
- **오케스트레이션 삼총사**: Airflow, Dagster, Prefect의 실행 관리, 재시도와 백필을 하나의 쇼핑몰 사례로 엮어 설명했다고 전해진다(Slack 발췌, 미확인).
- **관리형 서비스의 위치**: Zero-ETL과 Fivetran, Databricks Lakeflow, Amazon EMR Serverless가 이 수집-변환-적용 체인에서 어디까지 운영을 대신 맡아주는지를 다뤘다고 전해진다.

## 인상 깊은 문장

> "레이크의 주문 하나가 취소됐는데, 분석 결과는 왜 그대로일까요?" (Slack 발췌, 에피소드 도입부 질문으로 추정)

## 댓글

GeekNews geekcast 에피소드로 자체 재생 UI 외 별도 댓글 집계를 확인하지 못했다. 시즌2 연속 시리즈의 EP05로, 이전 에피소드들과의 연속성을 전제로 한 설명이 많아 단독으로 볼 때 맥락이 일부 생략될 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — "어느 층이 변경을 반영하느냐"는 질문은 데이터 품질 사다리의 "개별 → 집합" 전이와 겹친다

[[2026-07-14-on-data-quality-basics]]의 4단계 사다리에서 "개별(unit-level) 정확성·최신성"이 CDC가 맡는 영역이고, "집합(corpus-level) 드리프트"가 dbt/Spark가 다루는 영역이다. 변경이 전파되는 동안 어느 단에서 멈추느냈에 따라 "최신 데이터인데 왜 분석은 그대로냐"는 질문이 생긴다 — 이 에피소드의 도입부 질문 자체가 그 사다리 단 혼동의 실제 사례로 읽힌다.

### 핵심 전이 2 — 같은 CDC 마이그레이션을 실전에서 겪은 사내 사례와 연결된다

[[2026-11-03-kakao-commerce-claim-search-cdc-migration]]은 카카오커머스가 실제로 CDC 기반 마이그레이션을 수행한 사례이고, [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]은 Oozie/Sqoop에서 Airflow/Spark로 전환한 사례다. 이 geekcast가 다루는 "CDC → dbt/Spark → 오케스트레이션" 체인을 실제로 겪은 두 조직의 노트와 나란히 놓고 보면, 이론과 실전 사례의 간극(재시도·백필의 현실적 어려움)이 더 뚜렷해진다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS의 예약 상태 변경(취소, 변경, 재확정)이 하류 분석·리포팅에 반영되는 지연은 실제로 자주 겪는 문제다. "CDC(수집) → dbt(증분/스냅샷 변환) → Spark 또는 관리형 ETL(대규모 적용)"이라는 3단 구조를 명시적으로 그려두면, 예약 취소가 분석 대시보드에 반영 안 되는 문제를 어느 층에서 고쳐야 하는지 진단하는 틀로 쓸 수 있다.

## 연관 자료

- [[2026-07-14-on-data-quality-basics]] — 데이터 품질 4단계 사다리, 개별/집합 단의 구분
- [[2026-11-03-kakao-commerce-claim-search-cdc-migration]] — 실제 CDC 마이그레이션 사내 사례
- [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]] — Airflow/Spark로의 오케스트레이션 전환 사례

## 한 달 뒤 회고

*(2026-12-12 즈음 — 시즌2 EP06이 나왔는지, CRS 예약 상태 변경 전파 지연 문제를 3단 구조로 진단해봤는지 확인한다.)*
