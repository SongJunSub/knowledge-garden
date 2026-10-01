---
title: "SQL 쿼리 빌더의 두 가지 유형 (FunSQL.jl 문서) — 순서에 민감한 '파이프라인형'과 순서에 둔감한 '절 채우기형'은 서로 다른 질문에 답한다"
source_title: "Two Kinds of SQL Query Builders"
source_url: "https://mechanicalrabbit.github.io/FunSQL.jl/stable/two-kinds-of-sql-query-builders/"
source_name: "FunSQL.jl 공식 문서"
referrer_url: "https://news.hada.io/topic?id=34562"
published_at: "2026-09-29 (추정)"
summarized_at: "2026-10-01"
category: "backend"
tags: ["sql", "query-builder", "orm", "funsql", "linq", "dbplyr", "active-record", "api-design"]
---

# SQL 쿼리 빌더의 두 가지 유형 (FunSQL.jl 문서) — 순서에 민감한 '파이프라인형'과 순서에 둔감한 '절 채우기형'은 서로 다른 질문에 답한다

> 출처: [Two Kinds of SQL Query Builders](https://mechanicalrabbit.github.io/FunSQL.jl/stable/two-kinds-of-sql-query-builders/) (FunSQL.jl 공식 문서) · 정리일 2026-10-01

## 한 줄 요약

**같은 메서드 체이닝 문법을 써도, 쿼리 빌더는 "호출한 순서대로 데이터를 처리하는 파이프라인형"과 "SQL 절(WHERE, ORDER BY 등)의 슬롯을 채우는 절 채우기형"으로 근본적으로 다르게 동작한다. FunSQL·EF/LINQ·dbplyr는 순서를 그대로 의미로 반영해 호출 순서를 바꾸면 결과가 달라지고, Active Record·Laravel은 SQL 문법에 맞춰 슬롯을 채우기 때문에 호출 순서를 바꿔도 결과가 같다 — 편의성과 표현력 사이의 트레이드오프다.**

## 핵심 포인트

- **같은 체이닝 문법, 다른 의미론** — `.filter().sort().limit()` 같은 메서드 체이닝은 모든 쿼리 빌더에서 비슷해 보이지만, 내부적으로 ***"순서가 곧 연산 순서"인 빌더***와 ***"순서와 무관하게 SQL 절에 매핑되는" 빌더***로 나뉜다. 겉모습이 같아서 착각하기 쉬운 함정이다.
- **대표 예제 — "가장 나이 많은 남성 환자 100명"** — 정렬·개수 제한(limit)을 필터링보다 먼저 호출하면, 파이프라인형에서는 ***"가장 나이 많은 환자 100명 중에서 남성만 거른 결과"***(남성이 100명보다 적게 나올 수 있음)가 되고, 절 채우기형에서는 호출 순서와 무관하게 늘 ***"남성 환자 중 가장 나이 많은 100명"***이 된다. 같은 코드가 두 가지 완전히 다른 비즈니스 질문에 답하는 셈이다.
- **파이프라인형(순서 의존)** — FunSQL(Julia), Entity Framework/LINQ(.NET), dbplyr(R)가 이 부류다. 각 호출이 "이전 단계의 결과 위에 쌓이는 연산"으로 해석되어, SQL의 서브쿼리/CTE 중첩으로 컴파일된다. ***쿼리를 구성하는 사고방식이 함수형 데이터 파이프라인과 동일***하다.
- **절 채우기형(순서 무관)** — Active Record(Rails)와 Laravel의 쿼리 빌더가 이 부류다. 내부적으로 WHERE·ORDER BY·LIMIT 같은 SQL 절의 "슬롯"을 하나씩 채워나가는 방식이라, 어떤 순서로 메서드를 불러도 최종 SQL의 모양(= 의미)이 같다. **구현이 단순하고 SQL 자체의 기능을 그대로 노출하기 쉽지만, SQL 문법의 구조적 제약(절의 순서·중첩 제한)도 그대로 이어받는다.**
- **트레이드오프는 "표현력 vs 예측가능성/단순성"이다** — 파이프라인형은 서브쿼리·윈도우 함수·복잡한 중첩 질의를 자연스럽게 표현할 수 있지만, 호출 순서를 잘못 짜면 조용히 다른 질문에 답하는 버그가 생긴다. 절 채우기형은 직관적이고 순서 실수에 안전하지만, SQL 절의 조합 규칙을 넘어서는 질의(예: 정렬 전 필터와 정렬 후 필터를 모두 표현하려면 서브쿼리를 직접 써야 함)는 표현하기 어렵다.

## 인상 깊은 문장

> Slack 발췌: "필터링 전에 정렬과 개수 제한을 수행하면 '가장 나이 많은 남성 환자 100명'이 아니라 '가장 나이 많은 환자 100명 중 남성'을 구함."

> WebSearch 교차 확인(FunSQL.jl 문서 요약): "syntax-oriented builders (like Active Record and Laravel) are insensitive to the order of pipeline operations, [while] data-oriented builders (like FunSQL, EF/LINQ, and dbplyr) are sensitive to operation order."

## 댓글

이 글은 Lobsters에서도 [별도로 큐레이션됐다](https://lobste.rs/s/zknqct/two_kinds_sql_query_builders)는 것을 WebSearch로 확인했다 — 다만 **원문(mechanicalrabbit.github.io)과 Lobsters 토론 페이지 모두 egress 프록시에 차단**되어 직접 열람·댓글 수 확인은 못 했고, GeekNews(news.hada.io) 원문도 동일하게 차단됐다. 이 노트는 WebSearch 검색 스니펫(FunSQL.jl 문서 요약)과 Slack 발췌를 결합해 작성했으며, 예제의 세부 SQL 코드나 FunSQL 특유의 문법은 직접 확인하지 못해 생략했다. **hada 댓글 수는 확인 불가**하지만, Lobsters 큐레이션이 존재한다는 사실 자체는 이 글이 엔지니어링 커뮤니티에서 실질적으로 논의할 가치가 있다고 판단됐음을 보여준다. 내용 자체는 특정 벤더의 주장이 아니라 ORM/쿼리 빌더 설계에 대한 기술적 관찰이라 이해관계 편향은 낮다고 본다.

## 내 생각 · 적용점

### 핵심 전이 1 — "같은 API 모양, 다른 의미론"은 숨은 버그의 전형적 원천

메서드 체이닝이 똑같이 생겼다는 이유로 두 라이브러리의 동작이 같다고 가정하는 것은 위험하다. 이건 일반적인 API 설계 원칙 — **문법적 유사성(syntax)과 의미론적 동일성(semantics)을 혼동하면 안 된다**는 교훈으로, 다른 언어·프레임워크 간 마이그레이션(예: Rails ActiveRecord 경험을 가진 개발자가 EF/LINQ를 처음 쓸 때)에서 조용한 버그를 만드는 전형적 패턴이다.

### 핵심 전이 2 — "순서 의존성"은 명시적으로 드러날수록 안전하다

파이프라인형이 "위험"한 게 아니라, **연산 순서가 결과에 영향을 준다는 사실 자체를 사용자가 명확히 인지하고 있어야 안전**하다는 게 핵심이다. 이 원칙은 쿼리 빌더뿐 아니라 함수형 데이터 처리 파이프라인(판다스 체이닝, dplyr, Spark 등) 전반에 적용된다 — **체이닝 API를 설계/사용할 때는 "이 연산이 순서에 의존하는가"를 문서에 1급 시민으로 명시해야 한다.**

## 호스피탈리티 / CRS 적용 포인트

CRS는 예약·재고·요금 데이터를 다루는 복잡한 쿼리(예: "특정 기간 가용 재고 중 최저 요금 상위 N개 룸타입")를 ORM이나 쿼리 빌더로 짜는 일이 일상적이라 **직접 적용 가능한 교훈**이다. 예를 들어 "가장 저렴한 요금 100개 중 조식 포함 상품만"과 "조식 포함 상품 중 가장 저렴한 요금 100개"는 이 글의 "나이 많은 남성 환자 100명" 예제와 정확히 같은 함정이다. 사내에서 ActiveRecord 계열(절 채우기형) ORM을 쓴다면 순서 실수로부터 비교적 안전하지만, 만약 LINQ나 파이프라인형 쿼리 빌더를 쓰는 서비스가 있다면 **필터·정렬·제한의 호출 순서가 비즈니스 요구사항과 정확히 일치하는지 코드 리뷰 체크리스트에 명시적으로 넣을 가치**가 있다.

## 연관 자료

(이 가든에 ORM/쿼리 빌더의 순서 의존성을 다룬 기존 노트는 찾지 못했다 — 억지로 연결하기보다 새로운 축으로 남겨둔다. backend 카테고리의 Postgres/MySQL 생존 가이드류는 인덱스·운영 관점이라 이 글의 "쿼리 빌더 의미론" 주제와는 결이 달라 연결하지 않았다.)

## 한 달 뒤 회고
*(2026-11-01 즈음 — 온다 CRS 코드베이스에서 실제로 쓰는 쿼리 빌더/ORM이 파이프라인형인지 절 채우기형인지 확인하고, 순서 의존성 버그가 날 수 있는 쿼리(필터+정렬+제한이 섞인 쿼리)를 한 번 점검했는지 기록.)*
