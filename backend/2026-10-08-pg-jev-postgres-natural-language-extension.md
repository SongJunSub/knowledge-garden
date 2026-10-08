---
title: "pg-jev (Mahmoud Zachi) — SQL WHERE절에 자연어 조건을 그대로 넣는 PostgreSQL 확장, 인덱스도 임베딩도 없이 TypeSafe의 Jev가 행마다 판단한다"
source_title: "pg-jev"
source_url: "https://github.com/realZachi/pg-jev"
source_name: "GitHub (realZachi/pg-jev)"
referrer_url: "https://news.hada.io/topic?id=34981"
published_at: "2026-09-17"
summarized_at: "2026-10-08"
category: "backend"
tags: ["postgresql", "pg-jev", "jev", "natural-language-query", "plpython3u", "typesafe-ai", "decision-model"]
---

# pg-jev (Mahmoud Zachi)

> 출처: [pg-jev (GitHub)](https://github.com/realZachi/pg-jev) (저자 Mahmoud Zachi, @iam_zachi) · GeekNews([news.hada.io/topic?id=34981](https://news.hada.io/topic?id=34981)) 경유 · 정리일 2026-10-08

> **출처 한계**: news.hada.io 원문은 egress 차단으로 접근하지 못했지만, GitHub 저장소 README는 직접 확보(1차 출처)해 함수 목록·설치 요구사항·사용 예시·비용·프라이버시 경고까지 전문을 확인했다. 2026-09-17 발표 이후 저자가 Actian(엔터프라이즈 AI 기업)에 영입됐다는 보도가 있어(WebSearch 교차확인), 프로젝트의 향후 유지보수 주체가 바뀔 가능성을 감안해야 한다. hada 댓글 수·HN/Lobsters 큐레이션 유무는 확인 불가. 스타·포크 수는 WebSearch 스니펫 기준 137~267스타·14포크 선으로 보도마다 달라 정확한 현재 수치는 특정하지 못했다.

## 한 줄 요약

**pg-jev는 PostgreSQL `WHERE`절에 "고객이 화가 났는가" 같은 자연어 조건을 그대로 넣어 행을 필터링·순위·분류하는 확장으로, 자연어를 SQL로 번역하는 게 아니라 TypeSafe의 Jev 모델이 행마다 직접 판단한 확률값을 SQL이 쓰는 구조다 — 인덱스·임베딩·벡터 컬럼이 전혀 필요 없다.**

## 핵심 포인트

- `jev(row, condition)`은 **boolean**을 반환해 `WHERE`에 바로 쓰는 술어다. `jev_prob()`는 0~1 확률, `jev_choice()`는 주어진 선택지 중 하나, `jev_score()`는 순서가 있는 단계(levels) 위의 확률가중 위치를 반환한다 — ***텍스트를 생성하는 게 아니라 보정된 확률값을 직접 돌려주는*** TypeSafe Jev의 SQL 바인딩이다.
- ***일반 불리언 함수처럼 조합 가능*** — `AND age > 40`, 조인, `GROUP BY`, `ORDER BY jev_prob(...) DESC`, `LIMIT`과 자유롭게 섞이고, 저렴한 일반 조건을 앞에 두면 그 조건에서 걸러진 행은 API로 보내지 않는다.
- ***설치 조건이 꽤 무겁다*** — PostgreSQL 14~17, `plpython3u`(untrusted 언어), ***슈퍼유저 권한***, TypeSafe API 키가 필요하다. 이 때문에 ***Supabase·Neon·RDS 같은 관리형 Postgres 호스트는 슈퍼유저나 plpython3u를 제공하지 않아 애초에 쓸 수 없다*** — 자체 호스팅 Postgres에서만 쓸 수 있는 확장이라는 뜻이다.
- ***배치·캐시 설계*** — 기본 20행을 하나의 API 요청으로 묶고(배치가 커지면 정확도가 떨어진다고 README가 직접 밝힌다: 20행 100% vs 80행 77~94%), 행 내용과 질문 쌍별로 세션 내 캐시한다. 2,000행 테이블 첫 실행이 약 296k 입력 토큰·$0.012였고, 같은 질문 재실행은 캐시로 약 50ms에 끝난다는 수치를 README가 예시로 든다.
- ***프라이버시·비용 경고를 README가 직접 명시*** — 판단 대상 행 내용이 TypeSafe API로 전송되므로 공유가 허용되지 않은 데이터에는 쓰지 말라고 경고하고, 전체 스캔 방식이라 필요한 컬럼만 담은 뷰로 노출을 줄이라고 권한다. `jev.max_rows_per_statement`·`jev.max_chars_per_statement`로 비용 상한선을 걸 수 있다.

## 인상 깊은 문장

> "Jev is not a calculator. It does not count reliably... reads dates as text, not as ordered quantities." (TypeSafe 공식 한계 문서, pg-jev README가 재인용)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다. README 자체가 정직하게 경고하는 지점이 많다 — 전체 행이 제3자 API로 나간다는 점, plpython3u라는 untrusted 언어가 서버 OS 권한으로 실행된다는 점, 배치 크기가 커지면 정확도가 실측으로 떨어진다는 점을 숫자로 밝혀둔다. 이 가든에 이미 쌓인 Jev 계열 노트들([[2026-09-21-jev-field-guide-system-one-model]])이 짚었듯, ***Jev 모델 자체의 정확도 순위(워크플로별로 1~8위까지 갈린다)와 pg-jev라는 SQL 래퍼의 안정성은 분리해서 봐야 한다*** — 이 노트는 pg-jev라는 통합 계층을 다뤘을 뿐, Jev 모델 자체의 정확도는 검증하지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — pg-jev는 이 가든의 "Jev 계보"가 SQL까지 내려온 가장 구체적인 형태다

[[2026-09-16-typesafe-ai-jev-typed-judgments]]가 처음 정리한 TypeSafe의 Jev("문장 대신 판단과 확률을 반환하는 모델")가, pg-jev에서는 SQL 함수 하나로 호출하는 수준까지 내려왔다. [[2026-09-21-jev-field-guide-system-one-model]]이 벤더 평가표를 직접 계산해 내린 결론 — ***"금액·날짜·수량이 본문인 판단(청구서 처리)은 9개 중 8위로 무너지고, 고객 의도 분류 같은 판단은 1위와 2.3점 차"*** — 이 그대로 pg-jev 사용 설계에 적용된다. pg-jev의 예시 쿼리들(고객 문의 팀 분류, 제품 고급스러움 점수화)이 정확히 그 "맡겨도 되는 칸"에 속하고, 금액·날짜 비교는 README도 "계산기가 아니다"라고 명시해 pg-jev 레이어에서도 피해야 할 질문으로 남는다.

### 핵심 전이 2 — "SQL이 LLM을 부른다"는 패턴은 Quail이 최적화하려는 바로 그 워크로드다

[[2026-10-06-quail-ai-sql-inference-engine]]은 "AI-SQL"(행마다 LLM 호출을 거는 분석 쿼리)이 범용 추론 엔진(vLLM)에서 느린 이유를 "쿼리 플래너가 미리 알려주지 않아 KV 캐시가 뭘 재사용할지 모른다"고 진단하고, 플래너와 추론 엔진을 결합해 10배 이상 처리량을 끌어올렸다. pg-jev는 바로 그 "행마다 LLM 호출"을 SQL 함수 하나로 가장 직접적으로 구현한 사례다 — pg-jev가 기본으로 쓰는 "20행 배치"는 그 자체로 작은 수동 쿼리 플래닝이고, pg-jev가 대규모 테이블에 걸리면 Quail류 추론 엔진이 해결하려는 바로 그 비효율(개별 요청마다 호스트 오버헤드, 캐시 재사용 실패)을 그대로 겪게 될 것이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 있다.** 예약·문의·리뷰 테이블에 자연어 조건으로 바로 필터링·분류를 거는 아이디어는 CRS의 반복 업무와 정확히 맞는다.

- `SELECT * FROM inquiries WHERE jev(inquiries, '고객이 화가 나 있고 즉시 대응이 필요하다')` 같은 쿼리로, 티켓 분류 코드를 별도로 만들지 않고 운영 대시보드에서 바로 우선순위 큐를 뽑아낼 수 있다.
- `jev_choice()`로 "이 문의는 어느 팀 소관인가"(예약변경/결제/시설/컴플레인)를 분류해 `GROUP BY`로 집계하면, 지금 수동으로 태깅하거나 별도 분류 파이프라인을 짜는 작업을 SQL 레이어에서 바로 끝낼 수 있다.
- `jev_score()`로 리뷰를 "불만 강도" 같은 순서형 등급으로 점수화해 정렬하면, 리뷰 모니터링에서 수작업으로 훑던 우선순위를 자동화할 수 있다.

**다만 CRS 도입 전 반드시 걸리는 제약이 있다.** ①**관리형 DB 제약** — 온다의 Postgres가 RDS·Supabase 같은 관리형 서비스라면 슈퍼유저·plpython3u가 없어 ***애초에 설치할 수 없다***. 자체 호스팅 인스턴스에서만 검토 가능하다. ②**데이터 외부 전송** — 예약자 이름·연락처·결제 관련 문의가 포함된 행이 TypeSafe API로 그대로 전송된다는 README의 경고는 호스피탈리티 PII 취급 기준과 정면으로 충돌한다. 필요한 컬럼만 담은 뷰로 범위를 좁히거나, README가 언급한 로컬 호환 서버(`jev.api_url`)로 바꿔야 실무 도입이 가능하다. ③**질문 설계** — [[2026-09-21-jev-field-guide-system-one-model]]의 원칙대로 "취소가 가능한가"(계산)가 아니라 "취소를 요청하는가"(의도 판단)로 질문을 좁혀야 하고, 요금 규정·예약 상태 조회는 그대로 SQL의 다른 조건으로 남겨야 한다.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — pg-jev가 SQL 함수로 감싼 TypeSafe Jev 모델 자체의 출시 정리.
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev의 벤더 평가표를 직접 계산해 "맡겨도 되는 질문/피해야 할 질문"을 수치로 정리한 가이드, pg-jev의 질문 설계 원칙으로 그대로 쓸 수 있다.
- [[2026-10-06-quail-ai-sql-inference-engine]] — pg-jev가 구현하는 "SQL이 행마다 LLM을 부르는" 워크로드를 대규모로 최적화하는 추론 엔진, 규모가 커지면 다음 단계로 참고할 만하다.

## 한 달 뒤 회고

*(2026-11-08 즈음) 저자의 Actian 영입이 pg-jev 자체 유지보수에 영향을 줬는지(커밋 빈도, 이슈 응답), 그리고 로컬 호환 서버(`jev.api_url`)로 PII 우려 없이 운영하는 실사용 사례가 커뮤니티에 나왔는지 확인한다.*
