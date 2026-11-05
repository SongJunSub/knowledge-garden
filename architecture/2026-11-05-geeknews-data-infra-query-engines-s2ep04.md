---
title: "쿼리 엔진은 어떻게 동작할까, Trino와 DuckDB 이해하기 (GeekNews GeekCast) — 시즌2 EP04: SQL 한 줄이 실행 계획이 되는 과정, '클러스터로 연합하기'와 '한 프로세스 안에서 직접 읽기'라는 두 갈래 선택"
source_title: "쿼리 엔진은 어떻게 동작할까? Trino와 DuckDB 이해하기 | 최신 데이터 인프라 이해하기 시즌2 EP04"
source_url: "https://news.hada.io/geekcast/data-infra-s2-ep04"
source_name: "news.hada.io (GeekNews GeekCast)"
referrer_url: "https://news.hada.io/geekcast/data-infra-s2-ep04"
published_at: "2026-11-05"
summarized_at: "2026-11-05"
category: "architecture"
tags: ["data-infra", "query-engine", "trino", "duckdb", "dremio", "apache-drill", "apache-impala", "geekcast"]
---

# 쿼리 엔진은 어떻게 동작할까, Trino와 DuckDB 이해하기 (GeekNews GeekCast)

> 출처: [쿼리 엔진은 어떻게 동작할까? Trino와 DuckDB 이해하기 | 최신 데이터 인프라 이해하기 시즌2 EP04](https://news.hada.io/geekcast/data-infra-s2-ep04) (GeekNews GeekCast) · 정리일 2026-11-05

## 한 줄 요약

**"SQL 한 줄이 분석 결과가 되려면 쿼리 엔진이 실행 계획을 세워야 한다"는 질문 하나를 들고, 레이크에 쌓인 파일에서 고객 번호로 방문 기록과 주문을 연결해 상품별로 집계하는 흐름을 추적한다. 그 흐름 위에서 Trino·Dremio·Apache Drill·Apache Impala·DuckDB가 "연합 질의"와 "단일 프로세스 임베딩"이라는 전혀 다른 설계 축을 따라 갈라진다.**

## 핵심 포인트

- **쿠키 광고 → 방문 → 주문, 레이크 파일 위에서 SQL로 연결** — 쇼노트의 예시는 키워드 광고를 보고 방문한 고객이 실제로 무엇을 샀는지, 레이크에 저장된 로그와 주문 파일을 고객 번호로 조인해 추적하는 과정이다. "SQL 한 줄 뒤의 실행 계획"(02:29)이 이 흐름의 핵심 챕터로 잡혀 있다.
- **Trino = 클러스터 코디네이터 + 워커 병렬 실행.** 코디네이터가 쿼리를 파싱·계획하고, 여러 워커가 데이터를 메모리로 스트리밍하며 병렬 처리한다. 여러 원격 소스(Hive, Iceberg, RDBMS 등)를 하나의 SQL로 ***연합 질의(federated query)*** 하도록 설계된 구조다.
- **DuckDB = 애플리케이션 안에서 도는 인프로세스 라이브러리.** 별도 클러스터·코디네이터 없이 로컬이나 원격 파일을 직접 읽는다. 단일 머신에 들어가는 분석이라면 Trino가 요구하는 클러스터 오버헤드 자체가 없다는 게 장점이다.
- **Dremio·Drill·Impala는 또 다른 트레이드오프 축.** Drill은 스키마를 미리 정의하지 않고 JSON 파일을 바로 질의할 수 있는 반면 Trino는 카탈로그·스키마 정의를 요구한다. Dremio는 "가상 데이터셋"으로 더 DB에 가까운 사용자 경험을 제공하고, Impala는 Hadoop 생태계에 깊이 통합된 성숙한 엔진으로 소개되는 편이다.
- **"저장-계산 분리" 큰 그림의 연속편.** 이 에피소드는 "최신 데이터 인프라 이해하기" 시즌2의 4번째 편으로, 앞선 EP01(인프라 지도)·EP02(웨어하우스/레이크)·EP03(레이크하우스/테이블 포맷) 다음에 "그 파일/테이블을 실제로 누가, 어떻게 읽어서 계산하는가"라는 질문을 맡는다.

## 인상 깊은 문장

> "레이크에 저장한 파일에서, SQL 한 줄은 어떻게 분석 결과가 될까요?"

> "키보드 광고를 보고 방문한 고객이 실제로 어떤 상품을 사는지 알아봅니다."

## 댓글

이 글은 일반 GeekNews 토픽이 아니라 **GeekNews 자체 제작 팟캐스트/영상 쇼(GeekCast)의 쇼노트 페이지**다. news.hada.io 전체가 이 세션 egress 정책상 차단되어(`getaddrinfo ENOTFOUND`) 쇼노트 원문·영상 본편·일반 토픽형 댓글 수를 전혀 확인할 수 없었다. HN·Lobsters 같은 외부 큐레이션 대상도 아니다(자사 오리지널 콘텐츠라 외부에 2차 보도될 유인이 적음). WebSearch로 Trino/DuckDB/Dremio/Drill/Impala의 아키텍처 차이를 보강했지만 결과 상단은 MotherDuck 용어집·db-engines.com 같은 **벤더/디렉터리 성격의 2차 자료**라 서술에 편향이 있을 수 있다(특히 DuckDB 쪽 설명은 DuckDB/MotherDuck 생태계 자료 의존도가 높음). Slack 발췌 자체도 "6개월 밖의 기록과…"에서 말미가 끊겨 있어 챕터 구성 전체를 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "저장 형식 지도"가 이번에 "실행 엔진 지도"로 완성된다

이 가든은 이미 [[2026-10-15-geeknews-data-infra-map-s2ep01]](인프라 전체 지도) → [[2026-10-22-geeknews-data-infra-warehouse-lake-s2ep02]](웨어하우스 vs 레이크) → [[2026-10-29-geeknews-data-infra-lakehouse-s2ep03]](파일 형식·테이블 형식·카탈로그)로 "데이터가 어디에 어떤 형태로 쌓이는가"를 다뤄왔다. 이번 EP04는 "쌓인 데이터를 누가 읽어서 계산하는가"로 한 단 더 내려간다 — 저장 계층 지도가 완성되면 반드시 실행 계층 질문이 따라온다는 자연스러운 수순이다.

### 핵심 전이 2 — "클러스터로 연합"과 "프로세스 안에서 직접"은 DuckLake·DuckDB 논의의 반복 패턴

[[2026-10-10-ducklake-sql-parquet-lakehouse-format]]에서 이미 "메타데이터를 평범한 SQL DB로 카탈로그화" 하는 DuckDB 생태계의 선택을 다뤘고, [[2026-09-29-why-duckdb-2-0-is-faster]]·[[2026-08-27-aws-acquires-ducklabs-duckdb]]로 DuckDB가 임베디드 엔진으로서 세를 넓히는 흐름을 추적해왔다. 이번 에피소드는 그 DuckDB를 Trino라는 **반대 축의 대표주자**와 나란히 놓아 "왜 모든 걸 클러스터로 돌리지 않는가"라는 질문에 구체적 이름(코디네이터·워커 vs 인프로세스 라이브러리)을 붙여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 다소 멀다 — 에피소드 자체가 일반적인 쿼리 엔진 선택 개념을 다루지 CRS 데이터 스택을 다루지는 않는다. 다만 원칙은 전이 가능하다: CRS의 예약·재고·요금 데이터가 "여러 시스템(PMS, 채널매니저, 결제)에 흩어진 상태에서 하나의 SQL로 분석"해야 하는 상황이라면 Trino류의 연합 질의 구조가 맞고, "온다 내부의 단일 분석 저장소 안에서 빠르게 반복 질의"하는 상황이라면 DuckDB류의 인프로세스 구조가 더 가볍다 — 이 둘을 섞어 쓰는 선택 기준으로 참고할 만하다.

## 연관 자료

- [[2026-10-15-geeknews-data-infra-map-s2ep01]] — 같은 시리즈 EP01, 인프라 전체 지도
- [[2026-10-22-geeknews-data-infra-warehouse-lake-s2ep02]] — 같은 시리즈 EP02, 웨어하우스 vs 레이크
- [[2026-10-29-geeknews-data-infra-lakehouse-s2ep03]] — 같은 시리즈 EP03, 직속 전편(테이블 포맷·카탈로그)
- [[2026-10-10-ducklake-sql-parquet-lakehouse-format]] — DuckDB 생태계의 카탈로그 설계 선택, 같은 "어디까지 클러스터화하는가" 질문

## 한 달 뒤 회고

*(2026-12-05 즈음 — 시즌2 EP05가 올라왔다면 이어서 정리했는지, CRS 분석 스택에서 "연합 질의 vs 인프로세스 직접 읽기" 선택을 실제로 고민한 사례가 생겼는지 점검.)*
