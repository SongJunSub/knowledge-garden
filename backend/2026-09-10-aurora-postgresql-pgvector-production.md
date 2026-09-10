---
title: "Amazon Aurora PostgreSQL에서 pgvector 프로덕션 운영하기 (AWS Database Blog) — 별도 벡터DB 없이 HNSW·양자화·파티셔닝으로 확장하되, 비용은 인덱스 재구축과 메모리로 옮겨갈 뿐이다"
source_title: "Running pgvector in production on Amazon Aurora PostgreSQL"
source_url: "https://aws.amazon.com/blogs/database/running-pgvector-in-production-on-amazon-aurora-postgresql/"
source_name: "AWS Database Blog, Slack TechArticles 경유"
referrer_url: "https://aws.amazon.com/blogs/database/running-pgvector-in-production-on-amazon-aurora-postgresql/"
published_at: "2026-06-25"
summarized_at: "2026-09-10"
category: "backend"
tags: ["pgvector", "postgresql", "aurora", "vector-search", "hnsw", "rag", "database-scaling"]
---

# Amazon Aurora PostgreSQL에서 pgvector 프로덕션 운영하기

> 출처: [Running pgvector in production on Amazon Aurora PostgreSQL](https://aws.amazon.com/blogs/database/running-pgvector-in-production-on-amazon-aurora-postgresql/) (AWS Database Blog) · Slack TechArticles 봇 경유 · 정리일 2026-09-10

> **출처 한계**: `aws.amazon.com`(ko 도메인 포함)이 이 세션에서 egress 차단이라 원문을 직접 열지 못했다. WebSearch로 실제 영문 원문 URL(`.ko` 아닌 `.com` 경로, `blogs/database/`)과 발행일(2026-06-25)을 확인했고, 검색 스니펫과 관련 후속 글("Scale pgvector with binary quantization on Amazon Aurora PostgreSQL", "The Case Against pgvector" 등) 2~3건을 교차 확인해 핵심 내용을 재구성했다. 원문 전체 문장을 직접 대조하지 못했으므로 아래 인용은 검증된 직접 인용이 아니라 Slack 발췌 또는 검색 스니펫 기반 재구성임을 밝힌다. 또한 이 글은 AWS가 자사 제품(Aurora)을 홍보하는 벤더 콘텐츠라는 이해관계가 명백하다.

## 한 줄 요약

**AWS Database Blog는 이미 쓰고 있는 PostgreSQL(Aurora)에 pgvector를 얹어 별도 벡터 DB 없이도 프로덕션급 RAG 벡터 스토어를 운영할 수 있다고 주장한다.** 핵심은 인덱스·거리 함수 선택, 양자화·파티셔닝을 통한 확장, HNSW 인덱스의 "churn"(변경 누적에 따른 성능 저하) 관리, 메모리 상주 운영을 위한 인스턴스 사이징, 그리고 문제를 조기에 잡는 관측성 지표까지 다섯 가지 운영 축이다. 다만 "수억~수십억 벡터까지 확장 가능"이라는 주장은 벤더 자신의 블로그이며, 독립적인 부하 재현 벤치마크로 뒷받침됐는지는 확인되지 않는다.

## 핵심 포인트

- **인덱스·거리 함수 선택** — 대부분의 프로덕션 RAG 워크로드에는 HNSW 인덱스를 기본으로 권장하고, 데이터셋이 작거나 파티션된 스키마에서 100% recall이 필요하면 인덱스를 아예 생략하라고 조언한다. 텍스트 임베딩에는 코사인 거리(`<=>`), Amazon Titan처럼 정규화된 벡터에는 내적(`<#>`)을 쓰라고 구분한다.
- **양자화로 규모 확장** — 이진 양자화(binary quantization) + 재순위화(HNSW+BQ) 조합으로 수억~수십억 벡터까지 확장할 수 있다고 주장한다. 이진 양자화로 후보군을 거칠게 추린 뒤 원본 정밀도로 코사인 재순위화하는 2단계(coarse-to-fine) 검색 구조다.
- **10억+ 규모에서는 파티셔닝 필수** — 단일 PostgreSQL 테이블의 물리적 한계(32TB, TOAST OID 한계) 때문에 그 규모에서는 파티셔닝이 사실상 필수라고 언급한다.
- **메모리가 곧 성능** — HNSW 그래프가 메모리에 상주해야 하므로 메모리 최적화 r-계열 인스턴스를 권장한다. 인덱스 빌드 시 그래프가 `maintenance_work_mem`에 안 들어가면 훨씬 느린 디스크 기반 경로로 폴백하므로, `maintenance_work_mem`을 크게(예시로 8GB 수준) 잡고 `max_parallel_maintenance_workers`로 병렬 빌드를 활용하라고 조언한다.
- **HNSW 인덱스 churn 관리** — 삽입·삭제가 누적되면 그래프 품질이 저하되는 문제를, 예약된 `REINDEX CONCURRENTLY`, 파티션 단위 재구축, 또는 append-only + 컴팩션 패턴으로 관리하라고 제시한다.
- **관측성** — `BufferCacheHitRatio`, `aurora_stat_statements`의 쿼리 레벨 통계, 그리고 recall·latency 커스텀 지표를 함께 모니터링해 인덱스 드리프트를 조기에 잡으라고 권한다.
- **필터 결합 검색의 함정** — `WHERE` 절과 벡터 검색을 함께 쓸 때 생기는 과필터링(overfiltering) 문제를, iterative scan의 `relaxed_order` 모드로 보완할 수 있다고 언급한다(pgvector 0.8.0 이후 기능으로 추정, 원문 대조는 못함).

## 인상 깊은 문장

> "HNSW 인덱스 선택, 양자화, 파티셔닝 등 데이터셋 규모에 맞춘 확장 전략과 관측성 확보 방법을 다룸" (Slack 요약 발췌)

원문에서 직접 대조 확인한 인용문은 확보하지 못해, 조작 방지 원칙에 따라 Slack 발췌 문장만 인용문으로 남긴다.

## 댓글

이 글은 GeekNews가 아니라 Slack TechArticles 봇 경유라 hada 댓글 수 자체가 존재하지 않는다. WebSearch로 이 특정 게시물에 대한 HN·Reddit 논쟁을 찾아봤지만 별도 토론 스레드는 확인되지 않았다(대부분 AWS 공식 채널·뉴스 애그리게이터 재게시만 검색됨). 다만 "수억~수십억 벡터까지 확장 가능"이라는 낙관적 주장에는 정직하게 균형을 잡을 필요가 있다 — 같은 시기 화제가 된 별도 글 "The Case Against pgvector"(Alex Jacobs, HN 스레드 존재 확인)는 실무자 입장에서 "인덱스 빌드는 메모리 집약적 작업인데 Postgres엔 이를 제대로 조절할 방법이 없다", "데모에서 되는 것과 프로덕션에서 확장되는 것 사이 간극이 크다", 프리필터링/포스트필터링 트레이드오프가 실제로는 까다롭다고 지적한다. 이 AWS 글이 제시하는 해법(REINDEX CONCURRENTLY, r-계열 인스턴스, 양자화)이 바로 그 실무적 고통을 다루려는 대응이라는 점에서 두 글은 서로 모순된다기보다 "벤더의 이상적 가이드"와 "실무자의 체감 고통"이라는 서로 다른 각도로 읽는 게 정확하다. 이해관계는 명백히 밝힌다: 원문은 AWS가 자사 Aurora 제품을 홍보하는 콘텐츠이고, 이 노트가 인용한 확장성 수치("수억~수십억")는 독립 검증된 벤치마크가 아니라 벤더 주장이다.

## 내 생각 · 적용점

### 핵심 전이 1 — Booking.com과 정반대 결론, 관건은 "어느 규모에서 경계선이 그어지는가"

[[2026-08-31-booking-com-weaviate-vector-db-migration]]은 1억 개 임베딩 + 필터 검색 + 쓰기 20% 부하를 자체 재현 벤치마크로 검증한 뒤, 범용 엔진(OpenSearch)에 벡터 기능을 얹은 접근을 버리고 전용 벡터 DB(Weaviate)로 이탈해 약 40% 비용을 절감했다. 이 AWS 글은 정확히 반대 방향을 주장한다 — 범용 RDBMS(Postgres/Aurora)에 벡터 확장(pgvector)을 얹은 채로도 양자화·파티셔닝만 있으면 "수억~수십억" 규모까지 버틸 수 있다는 것. 두 주장이 동시에 맞을 수는 없다기보다, Booking.com의 결론은 자체 부하 재현 벤치마크라는 증거가 있고, AWS의 주장은 벤더 블로그로서 증거 공개가 없다는 비대칭이 핵심이다. 실제 선택 기준은 "pgvector가 이론적으로 얼마까지 되는가"가 아니라, Booking.com이 했던 것처럼 자신의 필터 비율·쓰기 비율·동시성을 재현한 자체 벤치마크로 경계선을 직접 찾는 것이어야 한다.

### 핵심 전이 2 — "비용은 사라지지 않고 옮겨간다"는 원칙의 벡터 인덱스판

[[2026-08-10-postgresql-mvcc-tradeoffs]]는 PostgreSQL MVCC의 쓰기 증폭·테이블 팽창·VACUUM 부담을 "결함이 아니라 비용이 옮겨간 결과"로 설명했다. 이 글의 "HNSW 인덱스 churn 관리"(REINDEX CONCURRENTLY, 파티션 재구축, append-only+compaction)는 정확히 같은 패턴을 벡터 인덱스 레이어에서 반복한다 — 삽입·삭제가 누적되면 그래프 품질이 저하되고, 그 비용은 사라지는 게 아니라 주기적 재구축 작업으로 미뤄질 뿐이다. "recall·latency를 모니터링해 인덱스 드리프트를 조기에 잡으라"는 관측성 조언도, MVCC 노트가 강조한 "비용은 숨겨져 있을 뿐이니 정기 점검하라"는 원칙의 벡터 검색 버전이다.

### 핵심 전이 3 — [[2026-08-27-rag-is-simpler-than-you-think]]가 도달한 지점 다음의 운영 매뉴얼

그 노트는 "검색이 없다면 BM25부터, 복잡도는 필요성이 데이터로 입증된 뒤에만 올리라"며 BM25로 50~100개 후보를 추린 뒤 임베딩으로 상위 10개만 재순위화하는 2단계 구조를 권했다. 이 AWS 글은 그 판단이 이미 끝나 "임베딩·벡터 검색이 필요하다"고 결론 낸 다음 단계의 운영 가이드다 — 그리고 흥미롭게도 이진 양자화로 후보를 거칠게 추린 뒤 코사인으로 재순위화하는 2단계 구조는, 벡터 인덱스 내부에서 같은 "조대(粗大)→정밀" 패턴을 그대로 반복한 것이다. 서로 다른 계층(검색 아키텍처 선택 vs 인덱스 내부 알고리즘)에서 같은 모양의 원칙이 반복된다는 게 흥미로운 지점이다.

## 호스피탈리티 / CRS 적용 포인트

이번 글은 이번 배치 중 가장 직접적이고 구체적으로 적용 가능한 인프라 시나리오다. 온다의 CRS가 이미 PostgreSQL(혹은 Aurora) 기반이라면 — 이 가정 자체는 이 노트에서 확인된 사실이 아니라 과제에서 주어진 전제이며, 실제 온다의 DB 스택은 확인하지 못했다 — 별도 벡터 DB(Weaviate·Pinecone 등)를 새로 도입하지 않고도 기존 DB 위에 시맨틱 검색(예: 객실·상품 설명 유사도 검색, 고객 문의 유사 사례 매칭)을 얹을 수 있다는 건 인프라 단순화 관점에서 구체적인 참고 가치가 있다. 실제로 가져다 쓸 수 있는 체크리스트는: ① HNSW+이진 양자화로 스케일 여지 확보 ② 그래프가 메모리에 상주하도록 메모리 최적화 인스턴스로 사이징 ③ REINDEX CONCURRENTLY·파티션 재구축으로 인덱스 churn을 정기 유지보수 항목에 포함 ④ recall/latency 커스텀 지표로 관측성 확보. 다만 이 채택 여부를 실제로 결정하기 전에는, [[2026-08-31-booking-com-weaviate-vector-db-migration]]이 보여준 것처럼 온다의 실제 필터·쓰기 부하를 재현한 자체 벤치마크 없이 벤더 블로그의 확장성 주장만 믿고 결정해서는 안 된다는 점이 이 노트의 가장 정직한 결론이다.

## 연관 자료

- [[2026-08-31-booking-com-weaviate-vector-db-migration]] — 정반대 결론(범용 DB+벡터 플러그인을 버리고 전용 벡터 DB로 이탈)에 도달한 대조 사례, 규모 경계가 어디인지가 관건
- [[2026-08-10-postgresql-mvcc-tradeoffs]] — "비용은 사라지지 않고 옮겨간다"는 원칙이 HNSW 인덱스 churn 관리에서 그대로 반복됨
- [[2026-08-27-rag-is-simpler-than-you-think]] — 벡터 검색 도입이 데이터로 정당화된 다음 단계의 운영 가이드, 조대→정밀 2단계 검색 패턴의 재현

## 한 달 뒤 회고

*(2026-10-10 즈음 — ①원문 접근이 가능해지면 "수억~수십억 벡터까지 확장"이라는 주장이 실제 벤치마크 수치에 근거하는지 대조. ②온다의 실제 DB 스택(PostgreSQL/Aurora 여부)과 시맨틱 검색 니즈 존재 여부를 확인. ③"The Case Against pgvector" 류 실무 비판과 이 벤더 글 사이 간극이, 실제 온다 검토 시점엔 어느 쪽에 더 가까운지 재평가.)*
