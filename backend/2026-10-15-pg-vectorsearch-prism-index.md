---
title: "pg_vectorsearch (Tiger Data/Timescale) — '95% 재현율'은 벤치마크 결과가 아니라 기본 설정값이었다, PRISM은 HNSW의 메모리 비용을 계층형 양자화로 되받아친다"
source_title: "pg_vectorsearch (timescale/pg_vectorsearch)"
source_url: "https://github.com/timescale/pg_vectorsearch"
source_name: "GitHub(timescale/pg_vectorsearch) README 직접 확인, 벤치마크 수치는 tigerdata.com 발표(WebSearch 2차확인, 원문 직접대조 못함)"
referrer_url: "https://news.hada.io/topic?id=35359"
published_at: "2026-10-13 (tigerdata.com 발표일, WebSearch 교차확인)"
summarized_at: "2026-10-15"
category: "backend"
tags: ["pg_vectorsearch", "postgresql", "vector-search", "ann", "prism-index", "rabitq", "pgvector", "timescale", "alpha"]
---

# pg_vectorsearch - pgvector의 IVFFlat과 HNSW보다 빠른 인덱스

> 출처: [timescale/pg_vectorsearch (GitHub)](https://github.com/timescale/pg_vectorsearch) · GeekNews(id=35359) 경유 · 정리일 2026-10-15

> **출처 한계**: `news.hada.io`와 `tigerdata.com`(발표 블로그) 모두 이 세션에서 `getaddrinfo ENOTFOUND`로 열지 못했다. **1차로 확인한 것은 `github.com/timescale/pg_vectorsearch` 저장소 README뿐**이다 — WebFetch로 직접 확보했고, 이 노트의 아키텍처·호환성 서술은 전부 이 README에 근거한다. 반면 **구체적인 지연시간·메모리·재현율 수치(1억 벡터, 6ms, 128GiB 등)는 README 본문에 없고 "자세한 내용은 블로그 참고"라고만 적혀 있다** — 이 수치들은 WebSearch로 교차확인한 tigerdata.com의 2026-10-13 발표(벤더 자체 보고)에서 나온 것이며, 독립 제3자 재현 검증은 찾지 못했다. 회사명은 Timescale에서 Tiger Data로 리브랜딩된 것으로 WebSearch에서 확인했다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**pg_vectorsearch는 Tiger Data(구 Timescale)가 공개한 PostgreSQL 네이티브 확장으로, C로 구현한 PRISM 인덱스(계층형 중심점 트리 + RaBitQ 양자화)를 통해 1억 벡터 규모에서 HNSW보다 훨씬 적은 메모리로 비슷하거나 더 빠른 ANN 검색을 제공한다고 주장한다 — 다만 Slack 발췌가 인용한 "95% 재현율" 수치는 실제로는 벤치마크 결과가 아니라 `prism.nprobe=0`(자동)일 때의 기본 목표값이라는 점을 README에서 확인했다. 기존 pgvector의 `vector`·`halfvec` 칼럼과 테이블·쿼리를 전혀 바꾸지 않고 인덱스만 교체할 수 있다는 게 가장 실용적인 설계 포인트지만, 현재는 "프로덕션에 적합하지 않다"고 명시된 알파 단계다.**

## 핵심 포인트

- **PRISM 인덱스의 정체 — "최신화된 IVFFlat"** — README는 PRISM을 "개념적으로 pgvector의 IVFFlat과 비슷하지만 더 최신의 양자화·라우팅·파티셔닝 기법을 쓰는 PostgreSQL 네이티브 인덱스 액세스 메서드"로 설명한다. HNSW 같은 그래프 기반이 아니라 ***클러스터링+양자화 기반***이라는 점이 설계의 핵심 축이다. C로 구현됐고, 1억 개 이상의 벡터를 타깃으로 설계됐다.
- **질의 흐름 — 중심점 트리 → RaBitQ 필터링 → 정밀 재정렬** — 계층형 중심점 트리로 벡터를 클러스터로 나누고 이 트리를 ***PostgreSQL 버퍼 캐시에 올려 메모리에 유지***한다. 벡터는 RaBitQ로 양자화돼 SIMD 거리 계산에 맞춘 페이지 레이아웃의 포스팅 리스트에 저장되고, ***RaBitQ의 오차 한계로 가능성이 없는 후보를 먼저 걸러내 원본 정밀도 벡터로 재정렬해야 할 후보 수를 줄인다***. 질의는 중심점 트리 탐색 → 포스팅 리스트 스캔 → RaBitQ 2단계 필터링 → 힙에서의 정밀 재정렬 → top-k 반환 순서로 진행된다.
- **"95% 재현율"의 정체 — 벤치마크 결과가 아니라 기본 목표값** — Slack 발췌는 "재현율 95% 기준"이라는 표현을 벤치마크 조건처럼 인용했는데, 실제 README를 보면 **95%는 `prism.nprobe`를 0(자동)으로 뒀을 때의 ***기본 재현율 목표***를 설명하는 주석 값**이고, 벤치마크 보고서가 측정한 결과값이 아니다. 작은 차이지만, "벤더가 재현율 95%에서 측정했다"와 "재현율 95%를 기본 목표로 자동 튜닝한다"는 서로 다른 주장이다 — 이 노트는 후자가 정확한 서술이라고 정정한다.
- **벤치마크 — 1억 벡터, 벤더 자체 보고** — WebSearch로 확인한 tigerdata.com의 2026-10-13 발표에 따르면, PRISM은 1억 벡터에서 HNSW 대비 ***약 4분의 1 메모리를 쓰는 인스턴스에서 6ms 중앙값 질의 지연***을 기록했고, 인덱스 빌드는 ***20배 이상 빠르다***고 주장한다. HNSW가 1억 벡터에서 빌드를 완료할 수 있었던 가장 작은 인스턴스는 512GB RAM이 필요했다고 전한다(Slack 발췌의 "128GiB vs 512GiB·6ms vs 8ms"와 방향·규모 모두 일치하나, 정확한 수치는 블로그 원문 직접대조는 못했다). **이 수치는 전부 벤더 자체 측정이며, 독립 제3자의 재현 검증은 이번 리서치에서 찾지 못했다.**
- **기존 pgvector와의 호환성 — 테이블·쿼리 불변** — 기존 `vector`·`halfvec` 칼럼을 바꾸거나 복사하지 않고 그 위에 PRISM 인덱스를 바로 만들 수 있다. 신규 타입 `vec32`·`vec16`은 pgvector 타입과 ***바이너리 호환***되지만 이름이 달라 두 확장을 같은 스키마에 공존시킬 수 있다. 거리 메트릭별 연산자 클래스(L2·내적·코사인)도 그대로 대응되므로, HNSW에서 옮길 때는 `vector_*_ops`→`vec32_*_ops`처럼 이름만 바꾸면 된다.
- **상태 — 알파, 프로덕션 부적합** — README는 "현재 알파 버전이며 테스트용"이라고 명시하고, "프로덕션에는 적합하지 않다"고 경고한다. 프리릴리스 버전 사이 업그레이드가 안 될 수 있어 확장·인덱스를 삭제 후 재생성할 계획을 세우라고 안내한다. PostgreSQL License.

## 인상 깊은 문장

> (README 직접 인용 요지, WebFetch로 확보) "95%는 벤치마크 결과가 아니라, `prism.nprobe`를 자동(0)으로 설정했을 때의 기본 재현율 목표다."

## 댓글

**확인 불가.** hada 댓글 수·HN/Lobsters 큐레이션 여부 모두 egress 차단으로 확인하지 못했다. **정직하게 감안할 점**: (1) 핵심 벤치마크 수치는 전부 벤더(Tiger Data) 자신의 발표이고 독립 검증을 찾지 못했다. (2) Slack 발췌가 인용한 "재현율 95%"는 위에서 짚었듯 벤치마크 조건이 아니라 기본 설정값을 벤치마크 조건처럼 서술한 것으로 보여, 발췌 자체에 미세한 왜곡이 있었다. (3) 현재 알파 단계로 "프로덕션 부적합"이 README에 명시돼 있어, 이 노트의 벤치마크 수치를 "지금 당장 pgvector를 교체할 근거"로 읽어서는 안 된다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-02-turbopuffer-vector-database-farewell]]와 정반대 방향에서 같은 결론("벡터 검색 전용 아키텍처가 전제일 필요는 없다")에 닿는다

turbopuffer 노트는 "벡터 유사도가 DB 전체를 조직하는 원리여야 한다"는 전제를 버리고 벡터 인덱스를 ***2차 구조***로 끌어내렸다. pg_vectorsearch는 반대 방향에서 같은 교훈에 도달한다 — 애초에 벡터 검색을 위한 별도 DB를 만드는 대신, ***범용 OLTP 엔진(Postgres) 안에 더 빠른 ANN 인덱스를 끼워 넣는다***. 하나는 "벡터를 전용 1급 구조에서 끌어내렸고", 다른 하나는 "벡터를 범용 DB 안의 더 나은 인덱스 하나로 남겨뒀다" — 접근은 반대지만 "벡터 유사도 검색 자체가 DB를 통째로 재설계할 이유는 아니다"라는 방향성은 같다.

### 핵심 전이 2 — [[2026-09-29-why-duckdb-2-0-is-faster]]와 같은 전략: 인터페이스는 안 바꾸고 내부 알고리즘만 교체해 속도를 낸다

DuckDB 2.0 노트에서 재귀 CTE 개선은 "쿼리를 하나도 바꾸지 않고" 2만 개 커밋 조상 탐색을 16초에서 0.1초로 줄인 사례였다. pg_vectorsearch의 "기존 `vector`·`halfvec` 칼럼과 쿼리를 그대로 두고 인덱스만 교체"하는 설계도 정확히 같은 전략이다 — ***애플리케이션 코드·쿼리는 그대로, 내부 알고리즘(인덱스 구조)만 바꿔서 성능을 낸다***는 패턴이 백엔드 성능 개선 글에서 반복적으로 관찰된다.

## 호스피탈리티 / CRS 적용 포인트

**원칙은 매력적이나, 알파 단계라는 점이 지금 당장의 적용을 가로막는다.** 만약 온다 CRS 내부에 호텔 리뷰·상품 설명 임베딩 검색에 pgvector를 이미 쓰고 있다면, "테이블·쿼리를 안 바꾸고 인덱스만 드롭인 교체"할 수 있다는 설계는 마이그레이션 비용이 거의 0이라는 점에서 눈여겨볼 만하다. 다만 ①README가 명시한 "프로덕션 부적합" 경고, ②벤치마크 수치가 전부 벤더 자체 발표라는 점, ③프리릴리스 간 호환성이 보장되지 않는다는 점을 감안하면, 지금은 "다음에 pgvector 인덱스 전략을 재검토할 때 체크리스트에 올려둘 후보" 정도로 다루는 게 정직하다. GA(정식 출시) 이후 독립 벤치마크가 나오면 재평가할 가치는 충분하다.

## 연관 자료

- [[2026-10-02-turbopuffer-vector-database-farewell]] — 벡터 인덱스를 1차/2차 구조 중 어디에 둘지에 대한 반대 방향의 설계 선택, 같은 결론으로 수렴
- [[2026-09-29-why-duckdb-2-0-is-faster]] — "쿼리는 안 바꾸고 내부 알고리즘만 교체해 속도를 낸다"는 같은 전략의 평행 사례
- [[2026-09-30-latticedb-embedded-graph-vector-fulltext]] — 벡터 검색을 "범용 DB에 끼워 넣기"(pg_vectorsearch) 대신 "그래프+벡터+전문검색을 아우르는 신규 임베디드 DB로 통합"하는 반대 극단의 설계

## 한 달 뒤 회고

*(2026-11-15 즈음 — tigerdata.com 접근이 가능해지면 벤치마크 원문·하드웨어 구성을 직접 대조했는지, 독립 제3자 재현 벤치마크가 나왔는지, pg_vectorsearch가 알파를 벗어나 프로덕션 권장 단계로 승격했는지 점검.)*
