---
title: "카카오페이증권 ClickStack 로그 플랫폼 (일 41TB·200억 건) — '실제 조회 패턴(시간범위+필드 90%)으로 도구 선택', 수집~조회 전체 재설계로 85.6% 비용절감 (인프라 설계 라인)"
source_title: "일 41TB, 200억 건의 로그를 ClickStack으로 실시간 처리하기 - 호그와트 도서관 프로젝트"
source_url: "https://tech.kakaopay.com/post/pallas-v2-log-platform/"
source_name: "카카오페이 기술블로그 (Sean.baek·Lina.a)"
referrer_url: "https://tech.kakaopay.com/post/pallas-v2-log-platform/"
published_at: "2026-02-23"
summarized_at: "2026-06-08"
category: "architecture"
tags: ["clickhouse", "opentelemetry", "kafka", "observability", "log-platform", "olap", "cost-optimization", "rearchitecture"]
---

# 카카오페이증권 ClickStack 로그 플랫폼 (일 41TB·200억 건) — '실제 조회 패턴(시간범위+필드 90%)으로 도구 선택', 수집~조회 전체 재설계로 85.6% 비용절감 (인프라 설계 라인)

> 출처: [일 41TB, 200억 건의 로그를 ClickStack으로 실시간 처리하기](https://tech.kakaopay.com/post/pallas-v2-log-platform/) (카카오페이 기술블로그, Sean.baek·Lina.a) · 정리일 2026-06-08

## 한 줄 요약

**카카오페이증권 DevOps 두 명이 *3년 만에 410배 증가(100GB/일 → 41TB·200억 건/일)* 한 로그를 감당하려고 ***수집부터 조회까지 파이프라인 전체를 재설계*** 한 기록. 핵심 도구 선택 근거가 압권: ***"우리의 로그 조회 패턴을 분석해보니 전문 검색보다 시간 범위 + 필드 조건 검색이 90% 이상"*** → 전문 검색에 강한 *OpenSearch/Elasticsearch*가 아니라 **컬럼형 OLAP인 ClickHouse**를 택함(역인덱스 대신 컬럼 저장+ZSTD 압축+벡터화 실행). 스택은 ***ClickStack(OpenTelemetry + ClickHouse + HyperDX)*** + 자체 아카이버 ssak3. *IDC(실시간 9일)와 AWS(S3 장기·필요 시만 ClickHouse 기동)* 를 S3 중심 단방향으로 연결. 제약은 ***"클라우드처럼 무한 확장이 아니라 IDC 물리 제약 안에서 최선"***. 결과: **전체 비용 85.6%↓(100%→14.4%), 로그 지연 수 분~수 시간 → 20초 이내, 처리 성능 26배·배치 18배·단일 Topic consume 6배, Kafka Topic 300→18, 처리 Pod 1,000+→150.**

## 핵심 포인트

- **도구는 "실제 워크플로"로 고른다 (안티 카고컬트)** — ***시간 범위+필드 조건 검색이 90%*** 라는 *측정*이 ClickHouse 선택의 근거. *Elasticsearch(전문검색 강·집계 느림·비쌈)·Loki(저비용·집계 약·고카디널리티 취약)* 를 표로 비교 후 탈락. **"남들이 쓰니까"가 아니라 "내 쿼리가 뭘 요구하나"**. [[2026-05-29-choose-boring-technology-2015]] *기술 선택 규율*·[[2026-05-11-clickhouse-overview]]·[[2026-06-08-clickhouse-10-years]] 와 직접 연결.
- **점진적 7단계 재설계(점 수정이 아니라 파이프라인 전체)** — ①수집 *Filebeat→OpenTelemetry*(OTLP Proto 인코딩 40~60%↓ + 배치 전송 18배, Kafka CPU 2배↓) ②*Kafka Topic 300→18 통합*(파티션 150·컨슈머 가변) ③처리 *Fluentd→OTel Collector*(Pod 1,000+→150, 1코어당 150건/s→4,000건/s = **26배**) ④저장 *OpenSearch→ClickHouse* ⑤아카이빙 *ssak3(ClickHouse→S3 Parquet)* ⑥장기조회 *Athena→ClickHouse S3 Engine* ⑦UI *HyperDX*.
- **컬럼형 OLAP의 본질** — *Row 스캔 vs Column 읽기*: `SELECT service`면 service 컬럼만 읽음(I/O 최소). ***컬럼 저장 + ZSTD 압축 → 원본 대비 ~90% 절감***, *벡터화 실행(SIMD)으로 수십억 건 집계도 수 초*. OpenSearch 역인덱스(원본보다 인덱스가 큰 경우도)와 대비 → **저장소 78% 절감**.
- **ClickHouse 설계 디테일(그대로 실무 체크리스트)** — *6샤드×2레플리카(12노드)*, *시간 단위 파티션 `YYYYMMDDHH`*(시간범위 쿼리 시 스캔 파티션 최소+TTL drop 단위), *ORDER BY(Timestamp, ServiceName, …)* 거의 모든 쿼리에 시간조건, *`LowCardinality`*(SeverityText·ServiceName 딕셔너리 치환), *`MATERIALIZED` 컬럼*(JSON 자주 쓰는 필드 INSERT 시 추출), *`CODEC`*(Timestamp=DoubleDelta+LZ4, Body=ZSTD), *Buffer 엔진*(평시 30s flush·피크 1GB flush로 Part 적정화).
- **핫/콜드 티어링으로 비용 분리** — *IDC ClickHouse=최근 9일 상시*, *AWS ClickHouse=9일 이후 장기, S3 Parquet 직접 조회, 이슈 시에만 기동*. ***"장기 조회는 자주 안 일어나니 필요할 때만 띄운다"*** — 사용한 만큼 과금. 개발자는 *날짜 범위만 바꾸면* 동일 인터페이스(학습비용 0).
- **"내 설계 레버리지를 블랙박스로 만드는 도구는 거절"** — UI로 Signoz 대신 HyperDX 선택. ***"Signoz를 쓰면 ClickHouse를 블랙박스처럼 써야 했다. 우리가 설계한 테이블 구조의 장점을 전혀 살릴 수 없었다."*** (LowCardinality·Materialized Column 못 씀) → ClickHouse 네이티브 직쿼리하는 HyperDX(컬럼 검색이 LIKE보다 20배).
- **제약이 설계를 낳는다 + 소수 정예 레버리지** — ***"IDC 물리 제약 안에서 최선"*** 이 효율 극대화의 동인. 그리고 ***"가장 데이터 많은 플랫폼을 단 두 명이 전환"*** — 좋은 추상화·자동화의 레버리지.

## 인상 깊은 문장

> "우리의 로그 조회 패턴을 분석해보니 전문 검색보다 시간 범위 + 필드 조건 검색이 90% 이상이었거든요."

> "Signoz를 쓰면 ClickHouse를 블랙박스처럼 써야 했어요. 우리가 설계한 테이블 구조의 장점을 전혀 살릴 수 없었죠."

> "한정된 자원을 최대한 효율적으로 활용하는 것이었어요. 클라우드처럼 무한히 확장할 수 있는 환경이 아니라, IDC라는 물리적 제약 안에서 최선의 결과를 내야 했거든요."

> "하루 41TB, 200억 건의 로그를 20초 이내에 처리하면서 비용을 85% 절감하기까지, 쉽지 않은 여정이었어요."

## 댓글 (전수 확인)

> 카카오페이 기술블로그 직접 글 — **공개 댓글 섹션 없음**(아카이브용 메타로만 남김).

## 내 생각 · 적용점

### 인프라 설계 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *대규모 로그 파이프라인 재설계·도구 선택 규율*. [[2026-06-08-java-to-kotlin-woowahan]](전환 방법론)·[[2026-05-30-shopify-scaling-inventory-reservations]](스케일 설계)와 같은 비AI 실무 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — "내 실제 워크플로를 측정하고 도구를 고른다"가 가장 강한 교훈

가장 전이력 높은 통찰: ***도구를 평판(전문검색=Elasticsearch)이 아니라 "내 쿼리 패턴 90%가 시간범위+필드"라는 측정으로 골랐다***. 이건 [[2026-05-29-choose-boring-technology-2015]] *복잡성 예산*·[[2026-05-13-redis-and-cost-of-ambition]] *야망의 비용*의 정확한 실천 — **남이 쓰는 스택이 아니라 내 부하의 형태가 결정**. CRS·stock-autotrader에 그대로: *로그/검색/집계를 붙이기 전에 "내 조회의 90%가 무엇인지"부터 측정* → OLAP(ClickHouse)인지 전문검색(OpenSearch)인지가 갈린다. [[2026-05-17-amazon-token-burning-goodharts-law]] *"엉뚱한 지표 최적화 경계"*와도 정합.

### 핵심 전이 2 — 점 수정이 아니라 파이프라인 전체를 본다 + 핫/콜드 티어링

*수집·큐·처리·저장·아카이빙·조회·UI를 7단계로 통째 재설계*한 게 85.6% 절감의 근원 — **병목 하나만 손보면 옆이 터진다(Fluentd만 바꿔도 OpenSearch 비용은 그대로)**. 그리고 **비용은 티어링으로 분리**: *뜨거운 9일(IDC 상시) + 차가운 장기(S3 Parquet, 필요 시만 ClickHouse 기동)*. 내 작업에: *전체 흐름을 그린 뒤 가장 비싼 구간(저장·집계)을 먼저, 그리고 "자주 안 쓰는 데이터는 싸게 재워두고 필요할 때만 깨우는" 패턴*. ZSTD·Parquet·LowCardinality·Materialized Column 같은 *저장 최적화 기본기*는 어떤 백엔드에도 전이.

### 핵심 전이 3 — "내 설계 레버리지를 블랙박스로 만드는 도구는 거절하라"

***"Signoz를 쓰면 ClickHouse를 블랙박스처럼 써야 했다"*** → 편하지만 *내가 설계한 장점(LowCardinality·Materialized Column)을 못 살리는 도구*는 거절하고, 더 손이 가도 *기반을 직접 다루는(HyperDX) 쪽*을 택함. 이건 [[2026-06-08-anthropic-skills-building-guide]] *"검증은 결정적 코드로(추상화가 핵심을 가리면 안 됨)"*·[[2026-06-01-domain-expertise-is-the-real-moat]] *도메인 통제권*과 같은 결 — **추상화의 편의 vs 통제권의 트레이드오프를 의식적으로 판단**. CRS에서 매니지드 솔루션을 고를 때도: *우리 도메인 설계를 못 살리고 블랙박스로 가두면 장기적으로 손해*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건(저자의 7단계·As-Is/To-Be 표는 *글의 내용*). *인프라 설계 라인* — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- 카카오페이 기술블로그 (원문) · [tech.kakaopay.com](https://tech.kakaopay.com/post/pallas-v2-log-platform/)
- [[2026-05-11-clickhouse-overview]]·[[2026-06-08-clickhouse-10-years]] — *"컬럼형 OLAP·ClickHouse 본질"*
- [[2026-05-29-choose-boring-technology-2015]]·[[2026-05-13-redis-and-cost-of-ambition]] — *"내 부하로 도구 고르기·야망의 비용"*
- [[2026-05-30-shopify-scaling-inventory-reservations]]·[[2026-06-08-java-to-kotlin-woowahan]] — *"스케일 설계·점진적 전환 방법론"*
- [[2026-05-17-amazon-token-burning-goodharts-law]] — *"엉뚱한 지표 최적화 경계(측정의 함정)"*
- [[2026-06-08-anthropic-skills-building-guide]]·[[2026-06-01-domain-expertise-is-the-real-moat]] — *"블랙박스 vs 통제권 트레이드오프"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — CRS/개인 프로젝트에서 로그·검색·집계 도구를 "내 조회 패턴 측정"으로 골랐는지, 핫/콜드 티어링으로 비용을 분리했는지, 저장 최적화 기본기(압축·컬럼·파티션)를 적용했는지, "블랙박스 vs 통제권" 판단을 의식했는지 기록.)*
