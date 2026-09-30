---
title: "LatticeDB - 그래프, 벡터, 전문 검색을 한 파일에 담는 임베디드 DB — SQLite가 관계형을 파일 하나로 옮겼듯, 이번엔 그래프+HNSW+BM25를 옮긴다"
source_title: "LatticeDB - Embedded single-file knowledge graph database with vector search and full-text search for AI/RAG apps"
source_url: "https://github.com/Kineviz/latticedb"
source_name: "GitHub (Kineviz/latticedb), GeekNews(id=34517) 경유"
referrer_url: "https://news.hada.io/topic?id=34517"
published_at: "확인 불가"
summarized_at: "2026-09-30"
category: "backend"
tags: ["latticedb", "embedded-database", "graph-database", "vector-search", "hnsw", "bm25", "cypher", "zig", "rag"]
---

# LatticeDB - 그래프, 벡터, 전문 검색을 한 파일에 담는 임베디드 DB

> 출처: [LatticeDB](https://github.com/Kineviz/latticedb) (GitHub, Kineviz/latticedb) · GeekNews(id=34517) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단됐지만, `github.com`은 예외적으로 접근 가능해 README를 직접 확인했다. **다만 LatticeDB의 "정본" 저장소가 어디인지는 이번 조사로 확정하지 못했다** — `Kineviz/latticedb`, `jeffhajewski/latticedb`, `freakynit/latticedb` 세 개의 동일 이름 저장소가 검색됐고, npm 패키지명이 `@hajewski/latticedb`인 걸 보면 `jeffhajewski`가 원저자에 가까워 보이지만, `Kineviz`와의 관계(포크인지 공동 개발인지 조직 이관인지)는 README만으로 확정할 수 없었다. 이 노트는 실제 열람한 `Kineviz/latticedb` README 기준으로 작성했다. **GitHub 스타 1개·포크 0개**로, 커밋 수(516개)에 비해 외부 인지도·채택은 극히 낮은 초기 단계 프로젝트다.

## 한 줄 요약

**LatticeDB는 Zig로 작성된 의존성 없는 단일 파일 임베디드 그래프 데이터베이스로, 그래프 순회·HNSW 벡터 검색·BM25 전문 검색을 하나의 Cypher 기반 질의 언어로 통합 지원한다 — 서버·설정 없이 애플리케이션 프로세스 안에서 관계 탐색과 의미 검색과 키워드 검색을 한 질의로 섞어 쓸 수 있다는 게 핵심 제안이다.**

## 핵심 포인트

- **단일 파일, 단일 프로세스, 의존성 없음** — 데이터베이스 전체가 ***이동 가능한 단일 파일***로 저장되며, 별도 서버 프로세스 없이 애플리케이션 안에서 실행된다. 다만 ***단일 쓰기 모델(한 프로세스만 DB를 소유)***이라는 제약이 있어, 여러 프로세스가 동시에 쓰기를 할 수는 없다.
- **그래프 + 벡터 + 전문 검색을 한 질의 언어로** — Cypher 스타일 질의 언어에 ***벡터 거리 연산자(`<=>`)와 전문 검색 연산자(`@@`)가 확장 문법으로 통합***돼 있어, `MATCH`로 관계를 따라가면서 벡터 유사도·키워드 조건을 같은 쿼리 안에 섞을 수 있다. 다만 ***`OPTIONAL MATCH`, 프로시저 호출(`CALL`) 등 완전한 openCypher 스펙은 아직 지원하지 않는다*** — README 스스로 밝힌 한계다.
- **성능 수치(자체 벤치마크)** — 노드 조회 0.13μs, 2-홉 그래프 순회 39μs(SQLite 대비 약 14배), 전문 검색(100 문서) 19μs, ***벡터 검색(100만 개) 0.83ms에 재현율(recall@10) 100%***를 자체 보고한다. FAISS 단일 스레드 HNSW보다 빠르고 Weaviate·Qdrant 같은 서버형 시스템과 경쟁력 있다고 주장하지만, ***전부 자체 벤치마크이며 제3자 재현은 확인되지 않는다.***
- **바인딩과 임베딩 옵션** — Python(`pip install latticedb`), TypeScript/Node.js(`npm install @hajewski/latticedb`), Go, Java, CLI를 지원한다. 벡터 임베딩은 기본 해시 임베딩을 쓰거나 Ollama·OpenAI HTTP 클라이언트로 외부 임베딩 모델을 붙일 수 있다.
- **ACID·durable stream·changefeed** — WAL(write-ahead log) 기반 ACID 트랜잭션, 속성 인덱스, durable stream, 그래프 changefeed를 지원한다고 밝힌다 — 단순 조회용 임베디드 DB가 아니라 실시간 변경 추적까지 노리는 설계다.
- **용도로 제시된 것: RAG·에이전트 메모리** — README가 제시하는 사용 사례는 ***연결된 로컬 데이터(문서·카탈로그·인용 그래프), 에이전트 메모리, RAG 파이프라인, 로컬 프로토타이핑***이다. 문서 단위 검색이 아니라 ***관계(누가 무엇을 인용했는지, 어떤 엔티티가 어떤 엔티티와 연결되는지)가 중심인 데이터***에 최적화됐다는 포지셔닝이다.

## 인상 깊은 문장

> "Embedded single-file knowledge graph database with vector search and full-text search for AI/RAG apps" (GitHub 저장소 설명, 원문 그대로)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인 불가**(`news.hada.io` 차단). GitHub 정황만 보면 ***스타 1개·포크 0개***로 외부에 거의 알려지지 않은 초기 프로젝트다 — 516개 커밋이라는 개발 이력은 상당하지만, 이는 "개발자가 오래 공들였다"는 신호이지 "검증된 프로덕션 도구"라는 신호는 아니다. WebSearch로 찾은 `blog.compendialabs.org`의 리뷰 글 제목("A Fast Graph Database That Can't Search What You Import")은 이 세션에서 egress 차단으로 직접 읽지 못했지만, ***제목 자체가 "가져온 데이터를 검색하지 못하는" 어떤 한계(인덱싱 범위나 임포트 파이프라인 관련으로 추정)를 지적하는 것으로 보인다*** — 원문을 확인하지 못해 정확한 내용은 밝히지 못하며, 이 서드파티 비판이 존재한다는 사실만 정직하게 남겨둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "단일 파일에 여러 워크로드를 흡수한다"는 흐름의 최신 지점

가든에는 이미 [[2026-09-29-why-duckdb-2-0-is-faster]](분석 엔진을 단일 파일·인메모리로), [[2026-08-25-sqlite-for-everything]]("SQLite 하나로 검색엔진까지"), [[2026-09-23-fluree-graph-database]](그래프+이력+검증을 한 엔진에) 같은 "단일 임베디드 엔진이 여러 워크로드를 흡수한다"는 계열의 글이 쌓여 있다. LatticeDB는 여기에 ***그래프 + 벡터(HNSW) + 전문검색(BM25)을 한 파일·한 질의 언어로 묶는다***는 조합을 더한다 — 이 계열의 흐름을 통틀어 보면, "서버를 세우지 않고 프로세스 안에서 끝낸다"는 임베디드 DB 철학이 관계형(SQLite)에서 분석(DuckDB)을 거쳐 이제 그래프+검색까지 번져가는 순서로 읽힌다.

### 핵심 전이 2 — RAG 아키텍처 논쟁에서 LatticeDB는 정반대 극단에 선다

[[2026-08-27-rag-is-simpler-than-you-think]]는 ***"검색이 없다면 BM25부터 먼저 구축하라, 복잡도는 필요성이 입증될 때만 높여라"***는 처방을 남겼다 — BM25 단독에서 시작해 필요할 때만 벡터·하이브리드로 승격하라는 점진적 접근이다. LatticeDB는 반대로 ***처음부터 그래프+벡터+전문검색을 한 엔진에 다 넣고 시작***하라고 제안한다. 다만 이 둘이 실제로 충돌하는 건 아닐 수 있다 — **"복잡한 기능을 다 갖춘 엔진을 쓰는 것"과 "그 기능을 전부 즉시 활성화해서 쓰는 것"은 다른 문제**다. LatticeDB를 쓰더라도 처음엔 BM25 질의만 쓰다가 필요할 때 벡터·그래프 질의를 얹는 식으로, RAG-단순화 원칙과 LatticeDB의 "올인원 엔진"이 공존할 여지는 있다 — 다만 이건 이 노트의 추정이며 실제 도입 시 검증이 필요하다.

## 호스피탈리티 / CRS 적용 포인트

- **그래프+벡터+전문검색 통합은 CRS의 "연결된 파트너 데이터" 워크로드와 개념적으로 접점이 있다** — 호텔-체인-OTA-요금규칙처럼 관계가 중심인 데이터에 "이 요금 규칙과 비슷한 다른 요금 규칙을 찾아줘" 같은 의미 검색을 얹는 시나리오를 상상할 수 있다.
- **다만 프로덕션 도입은 시기상조다.** GitHub 스타 1개·제3자 벤치마크 부재·단일 쓰기 모델이라는 제약을 보면, 이건 "검증된 인프라 선택지"가 아니라 "지켜볼 신생 프로젝트" 단계다. `[[2026-09-23-fluree-graph-database]]`에서 남긴 판단과 같은 이유로, CRS의 핵심 워크로드(RDBMS 트랜잭션 처리)를 그래프 DB로 옮길 근거는 아직 없다.
- **전이 가능한 원칙만 남긴다면**: "관계 탐색 + 의미 검색 + 키워드 필터를 한 질의로 처리한다"는 통합 질의 설계 아이디어 자체는, 향후 CRS 내부 검색 기능을 설계할 때 참고할 만한 패턴이다.

## 연관 자료

- [[2026-09-29-why-duckdb-2-0-is-faster]] — 단일 임베디드 엔진이 여러 최적화를 흡수하는 같은 계열, 분석 워크로드 축
- [[2026-09-23-fluree-graph-database]] — 같은 배치에서 정리한 다른 그래프 DB, "그래프에 검증·이력"을 더한 것과 "그래프에 벡터·전문검색"을 더한 것의 대조
- [[2026-08-27-rag-is-simpler-than-you-think]] — "복잡도는 필요성이 입증될 때만" 원칙과 LatticeDB의 "올인원" 설계가 만드는 긴장

## 한 달 뒤 회고

*(2026-10-30 즈음 — GitHub 스타·포크 수가 늘었는지, `blog.compendialabs.org`의 비판("검색하지 못하는 것을 가져올 수 없다")을 직접 확인해 구체적 한계를 파악했는지, 실제 프로덕션 도입 사례가 나왔는지 확인.)*
