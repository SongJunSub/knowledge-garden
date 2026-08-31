---
title: "Booking.com이 OpenSearch 대신 Weaviate를 벡터 DB로 선택한 과정 — 공개 벤치마크 대신 1억 임베딩 재현 평가로 검증한 뒤 전용 벡터DB로 40% 비용을 줄였다"
source_title: "Booking: Vector Database Selection and Migration for Production ML and GenAI Systems"
source_url: "https://www.zenml.io/llmops-database/vector-database-selection-and-migration-for-production-ml-and-genai-systems"
source_name: "ZenML LLMOps Database (Booking.com 사례, 원문 자체는 미확인)"
referrer_url: "https://news.hada.io/topic?id=33061"
published_at: "2026 (미상, 최선 추정)"
summarized_at: "2026-08-31"
category: "architecture"
tags: ["vector-database", "weaviate", "opensearch", "search-infrastructure", "benchmarking", "recall", "latency", "scaling-decision"]
---

# Booking.com이 OpenSearch 대신 Weaviate를 벡터 DB로 선택한 과정

> 출처: [Booking: Vector Database Selection and Migration for Production ML and GenAI Systems](https://www.zenml.io/llmops-database/vector-database-selection-and-migration-for-production-ml-and-genai-systems) (ZenML LLMOps Database, Booking.com 사례) · 정리일 2026-08-31
> **출처 한계**: Booking.com이 직접 쓴 원문 블로그를 특정·확인하지 못했다. `news.hada.io`가 이 세션에서 egress 차단이라 GeekNews 원문 링크를 확인할 수 없었고, WebSearch로 여러 차례 다른 조합("booking.ai Weaviate", "medium.com/booking-com vector database" 등)을 시도했지만 Booking.com 공식 채널(booking.ai, Medium)에 실린 1차 글을 찾지 못했다. 대신 **ZenML LLMOps Database의 케이스 스터디 페이지**(WebFetch 접근도 차단돼 WebSearch 스니펫으로만 확인)와 Weaviate 뉴스레터의 언급이 거의 동일한 수치·서술을 반복해 신뢰도 있는 2차 재구성으로 판단했다. **정확한 원문 저자·게시일은 확인하지 못했다** — `published_at`은 최선 추정이다.

## 한 줄 요약

**Booking.com은 수억 개 임베딩·필터 검색·높은 동시 요청을 처리하던 기존 OpenSearch 기반 벡터 검색의 클러스터 규모와 운영 비용이 계속 커지자, "공개 벤치마크는 데이터가 작고 부하가 단순해 실제 환경을 반영 못한다"고 보고 ***1억 개 임베딩과 실제 운영 부하(전체 검색+메타데이터 필터 검색+쓰기 20%)를 그대로 재현한 자체 평가***를 진행했다. 검색 품질을 약 99% Recall로 고정한 뒤 P99 지연시간·처리량·자원 사용량·안정성을 비교한 결과, 전용 벡터 DB가 OpenSearch보다 ***낮은 꼬리 지연시간과 더 예측 가능한 확장성***을 보였고, 그중 Weaviate를 새 백엔드로 채택해 ***약 40%의 비용 절감***을 달성했다.**

## 핵심 포인트

- **문제의 성격**: 기존 OpenSearch 기반 벡터 검색이 ***수억 개 임베딩, 메타데이터 필터 검색, 높은 동시 요청***을 처리하며 서비스가 커질수록 클러스터 규모와 운영 비용이 계속 커지는 구조적 문제에 부딪혔다.
- **공개 벤치마크를 신뢰하지 않은 이유** — 일반적인 벡터 DB 벤치마크(ANN-benchmarks류)는 데이터셋이 작고 부하 패턴이 단순해 ***실제 프로덕션 환경(대규모·고동시성·필터+쓰기 혼합)을 반영하지 못한다***고 판단, 자체 재현 평가를 설계했다.
- **평가 설계**: ***1억(100M) 개 임베딩***과 실제 운영 형태를 재현한 뒤, 검색 품질을 ***약 99% Recall***로 맞추고 세 가지 부하 시나리오 — 전체 검색(full search), 메타데이터 필터가 섞인 검색(filtered search), ***쓰기 20%가 섞인 부하(20% write)*** — 에서 P99 지연시간, 처리량, 자원 사용량, 안정성을 비교했다.
- **결과의 일관된 패턴**: 여러 후보 전용 벡터 DB가 공통적으로 OpenSearch보다 ***더 낮은 꼬리 지연시간(P99)***, ***더 나은 동시성 하 처리량***, ***더 적은 자원으로 더 예측 가능한 확장***을 보였다 — 범용 검색 엔진에 벡터 기능을 얹은 것과, 벡터 검색을 위해 처음부터 설계된 시스템은 부하가 커질수록 다르게 행동한다는 것을 재확인.
- **최종 채택: Weaviate, 비용 약 40% 절감** — 여러 벡터 DB 중 프로덕션 시나리오 전반에서 ***가장 일관된 성능***을 보인 Weaviate를 새 Embedding Service의 백엔드로 채택, 비교 가능한 Recall(~99%)을 유지하면서 ***약 40%의 비용 절감***과 더 예측 가능한 성능을 확보했다.
- **아키텍처 결정의 부수 이점**: 내부 서비스 레이어로 DB 접근을 추상화해둔 덕에 마이그레이션 자체의 난이도가 낮아졌다는 언급이 반복 확인된다(단, 구체적 구현 세부는 원문 미확인으로 이 노트에 재현하지 못함).

## 인상 깊은 문장

> "Their journey from OpenSearch to Weaviate represents a mature approach to LLMOps infrastructure decision-making, emphasizing production-realistic evaluation over generic benchmarks and treating vector databases with the same rigor as other critical datastores."

*(원문 Booking.com 저자의 직접 인용은 확보하지 못해, 위는 이 사례를 다룬 2차 자료의 평가를 인용한 것임을 밝힌다.)*

## 댓글

**hada.io 자체가 이 세션에서 차단**돼 정확한 댓글 수를 확인하지 못했다. HN·Lobsters 큐레이션 여부도 WebSearch로 특정하지 못했다. **출처 한계는 위 인용구 상단에 명시한 대로** — 이번 배치 3건 중 원출처 확보가 가장 부실한 글이다. 수치(1억 임베딩, 99% Recall, 40% 비용 절감, P99·처리량·쓰기 20% 부하 구성)는 3회 이상의 독립적 WebSearch 쿼리에서 반복적으로 동일하게 나와 신뢰도는 있다고 판단하지만, 원문을 직접 대조하지 못한 재구성이라는 한계는 분명히 남는다.

## 내 생각 · 적용점

### 핵심 전이 1 — "복잡도는 증명 후에"라는 같은 방법론, 정반대 결론

[[2026-08-27-rag-is-simpler-than-you-think]]는 "검색 없음 → 곧바로 벡터 DB로 건너뛰지 말라, BM25부터 데이터로 증명하며 단계를 올리라"고 처방한다. Booking.com이 한 일이 정확히 그 방법론이다 — ***공개 벤치마크를 그대로 믿지 않고, 자기 부하를 재현해 증명한 뒤에야 결정했다.*** 다만 결론은 대조적이다: 한쪽은 "벡터 DB 없이도 대부분 풀린다"는 절제의 결론, 다른 쪽은 "1억 규모·고동시성에서는 전용 벡터 DB가 명확히 이긴다"는 확장의 결론. **같은 방법론이 규모에 따라 정반대 처방으로 갈린다는 게 두 글을 겹쳐 읽을 때의 진짜 교훈**이다.

### 핵심 전이 2 — "하나로 통합" 철학의 거울상

[[2026-08-25-sqlite-for-everything]]는 "서버·벡터인덱스·검색엔진을 별도로 두지 말고 SQLite 하나(+`sqlite-vec`)로 합치라"는 통합의 철학이다. Booking.com의 결정은 정확히 반대 방향 — ***범용 엔진(OpenSearch) 안에 얹은 벡터 기능을 떼어내 전용 시스템으로 분리***했다. 두 글을 나란히 놓으면 경계선이 보인다: 통합이 이기는 지점과 전용화가 이기는 지점을 가르는 건 철학이 아니라 ***규모와 동시성***이다.

### 핵심 전이 3 — 저장소 선택 프레임이 벡터 DB 선택에도 그대로 적용된다

[[2026-08-02-data-landscape-guide-for-developers]]가 정리한 웨어하우스/레이크/레이크하우스 트레이드오프 프레임은, "범용 검색엔진+벡터 플러그인 vs 전용 벡터 DB"라는 이번 결정에도 같은 구조로 적용된다 — 범용 도구는 유연하지만 특화된 부하에서 비용을 지불하고, 전용 도구는 그 부하에 최적화된 대신 범용성을 포기한다는 동일한 트레이드오프.

## 호스피탈리티 / CRS 적용 포인트

이번 배치 중 CRS 검색·재고 시스템과 가장 직결되는 글이다. 온다의 CRS도 구조적으로 Booking.com이 겪은 문제와 같은 축 위에 있다 — 객실·요금·프로모션 설명에 대한 시맨틱 검색(게스트 문의 매칭, 유사 상품 추천)이 임베딩 규모로 커지면, 메타데이터 필터(날짜·지역·가격대·등급)가 섞인 검색과 재고 갱신(쓰기)이 동시에 몰리는 부하 패턴은 이 사례의 "전체 검색+필터 검색+쓰기 20%" 구성과 거의 그대로 겹친다. 구체적으로 옮길 수 있는 건: (1) **공개 벤치마크를 그대로 믿지 말고 자체 부하(필터 비율·쓰기 비율·동시성)를 재현해 검증**한다는 방법론 — [[2026-08-27-rag-is-simpler-than-you-think]]의 "필요성을 데이터로 증명한 뒤에만 복잡도를 올리라"는 원칙과 합쳐서 CRS 검색 스택 결정의 체크리스트로 쓸 수 있다. (2) 다만 온다의 현재 규모가 OpenSearch의 한계선(1억 이상, 높은 동시성)에 닿아 있는지는 이 노트만으로 판단할 수 없다 — **규모가 그 경계에 닿기 전까지는 [[2026-08-25-sqlite-for-everything]]·[[2026-08-27-rag-is-simpler-than-you-think]] 쪽(통합·경량화)이 더 맞는 처방일 가능성이 높다**는 점을 함께 밝혀둔다.

## 연관 자료
- [[2026-08-27-rag-is-simpler-than-you-think]] — 같은 "증명 후 확장" 방법론을 규모가 다른 문제에 적용해 정반대 결론에 도달한 대조 사례
- [[2026-08-25-sqlite-for-everything]] — "하나로 통합" 철학의 거울상, 통합과 전용화를 가르는 경계선이 규모라는 것을 보여주는 짝
- [[2026-08-02-data-landscape-guide-for-developers]] — 범용 vs 전용 저장소 트레이드오프 프레임을 벡터 DB 선택에도 재사용 가능

## 한 달 뒤 회고
*(2026-09-30 즈음 — Booking.com 원문을 직접 확인할 수 있게 되면 저자·정확한 게시일·마이그레이션 세부를 보강. CRS 검색 스택의 현재 임베딩 규모·동시 요청 수준을 실제로 파악해, 이 글의 "전용 벡터 DB로 넘어가는 경계선"에 근접했는지 재평가.)*
