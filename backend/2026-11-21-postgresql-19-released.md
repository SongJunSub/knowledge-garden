---
title: "PostgreSQL 19 출시 — 평소보다 두 달 늦은 출시 뒤에, 플래너를 직접 제어하는 pg_plan_advice와 리플리카 읽기 일관성을 보장하는 WAIT 커맨드"
source_title: "PostgreSQL 19 Released"
source_url: "https://www.postgresql.org/about/news/postgresql-19-released-3168/"
source_name: "PostgreSQL Global Development Group"
referrer_url: "https://news.hada.io/topic?id=37510"
published_at: "2026-11-19"
summarized_at: "2026-11-21"
category: "backend"
tags: ["postgresql", "query-planner", "read-your-writes", "replication", "release"]
---

# PostgreSQL 19 출시 — 평소보다 두 달 늦은 출시 뒤에, 플래너를 직접 제어하는 pg_plan_advice와 리플리카 읽기 일관성을 보장하는 WAIT 커맨드

> 출처: [PostgreSQL 19 Released](https://www.postgresql.org/about/news/postgresql-19-released-3168/) (PostgreSQL Global Development Group) · 정리일 2026-11-21

## 한 줄 요약

**2026-11-19 공식 출시된 PostgreSQL 19는 쿼리 플래너의 결정을 사람이 직접 기술·저장·재적용할 수 있게 하는 `pg_plan_advice`/`pg_stash_advice`와, 스탠바이가 특정 LSN까지 재생할 때까지 블록해 "read-your-writes" 일관성을 보장하는 `WAIT` 커맨드를 새로 들였다 — 두 기능 모두 "평소엔 알 필요 없지만 필요할 때 확실한 통제권을 쥐여준다"는 같은 철학을 공유한다.**

## 핵심 포인트

- **공식 출시일 2026-11-19**, Simon Willison 등 복수 소스가 "올해는 평소보다 약 2달 늦은 출시"라고 언급함 — 이 지연은 같은 가든의 [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]]·[[2026-11-03-postgresql-19-ai-review-bugs-confirmed]]에서 "LLM 보조 리뷰가 버그 발견을 수정 속도보다 앞질렀다"고 짚은 바로 그 지연이 실제 출시로 이어진 결과다.
- **`pg_plan_advice` 확장**: 플래너의 쿼리 플랜 결정을 기술·재현·조정하는 "플랜 어드바이스 언어". 공식 문서는 "플래너 선택을 제약하는 위험보다 이득이 명확히 클 때만 쓰라"고 경고하고, Snowflake 블로그는 "플래너는 보통 맞다"며 "You Will Probably Never Need" 톤으로 회의적으로 평가 — **평가가 소스 간 엇갈린다.**
- **`pg_stash_advice`**: 쿼리 식별자 기준으로 어드바이스를 저장해 자동 적용, 애플리케이션 코드를 건드리지 않고도 느린 플랜을 교정할 수 있게 함.
- **`WAIT` 커맨드**: 프라이머리에서 LSN을 받아 스탠바이가 그 지점까지 재생할 때까지 블록 — 리플리카에서 읽어도 자신이 방금 쓴 내용을 보게 하는 "read-your-writes" 일관성 기능. 단 DO 블록·함수·프로시저 내부에서는 실행할 수 없고, Franck Pachot 등은 "추가 네트워크 왕복이 필요해 프라이머리에서 바로 읽는 게 더 간단할 수 있다"고 반론한다.
- Slack 발췌의 "get-or-create가 네트워크 왕복을 줄인다"는 설명은 **교차검증에 실패**했다 — WAIT 커맨드 관련 공식·2차 자료 어디에도 해당 패턴 언급이 없어, 이 부분은 미확인으로 남긴다.
- Slack 댓글에서 추가 정리된 **온라인 테이블 재구성 `REPACK`**(`CONCURRENTLY` 옵션으로 읽기/쓰기 대부분을 막지 않고 인덱스 순서로 재배치)도 19의 신규 기능으로 언급됨.

## 인상 깊은 문장

> "A new WAIT command that waits until a standby has replayed changes up to a chosen point."

> "A New Postgres Feature You Will Probably Never Need" — Snowflake 블로그의 `pg_plan_advice` 평가.

## 댓글

GeekNews(news.hada.io)가 이 세션에서 전면 차단되어 원문 페이지의 한국어 댓글 수·논조는 확인할 수 없었다. 공식 발표문은 postgresql.org 역시 직접 접근은 막혔으나, Simon Willison 블로그 등 복수 소스로 출시일·핵심 기능 방향을 교차확인했다. `WAIT` 커맨드에 대한 반론(Pachot)이 있다는 것은 "신기능=항상 이득"이 아니라는 균형 잡힌 시각이 외부에 존재함을 보여준다.

## 내 생각 · 적용점

### 핵심 전이 1 — "루머였던 지연 원인이 실제 출시로 입증됐다"

8월~11월 사이 이 가든에 쌓인 세 개의 노트([[2026-06-30-postgresql-19-beta-deep-dive]] → [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]] → [[2026-11-03-postgresql-19-ai-review-bugs-confirmed]])가 "AI 리뷰 도입이 버그 발견 속도를 높여 역설적으로 출시를 늦춘다"는 가설을 추적해왔는데, 오늘 실제 출시일이 "평소보다 2달 늦다"는 사실로 그 가설에 간접 증거가 더해졌다. **AI 리뷰 도입 초기엔 "버그가 늘었다"가 아니라 "발견 시점이 당겨졌다"는 해석이 다시 한번 맞아떨어진 사례**다.

### 핵심 전이 2 — "평소엔 숨어있다가 필요할 때만 꺼내 쓰는 통제권"이라는 공통 설계 철학

`pg_plan_advice`(플래너를 평소엔 믿고 맡기되 틀렸을 때만 교정)와 `WAIT`(평소엔 비동기 복제를 믿고 맡기되 일관성이 필요할 때만 블록)는 같은 설계 원칙을 공유한다 — **기본값은 신뢰, 예외 상황에만 수동 개입 레버를 노출한다.** 이건 [[2026-10-17-postgresql-zero-downtime-schema-migration-guide]]의 "확장-전환-축소 단계에서만 짧은 lock_timeout을 쓴다"는 최소 개입 원칙과 같은 결이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS에서 "예약 생성 직후 같은 예약을 리플리카에서 조회"하는 흐름(예: 결제 완료 직후 확인 화면, 콜센터가 방금 접수한 예약을 바로 재조회)은 전형적인 read-your-writes 문제다. 지금까지는 "방금 쓴 데이터는 프라이머리에서만 읽는다"는 수동 규칙으로 처리했을 가능성이 높은데, `WAIT` 커맨드는 이 규칙을 DB 레벨에서 강제할 수 있는 옵션을 제공한다 — 단, Pachot의 반론처럼 추가 왕복 비용과 "그냥 프라이머리에서 읽는" 대안을 먼저 비교해야 한다.

## 연관 자료

- [[2026-11-03-postgresql-19-ai-review-bugs-confirmed]] — *이 지연의 원인으로 지목된 AI 리뷰발 버그 발견 증가, 커미터 본인이 확인한 버전*
- [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]] — *같은 지연을 처음 "소문" 단계에서 다룬 노트*
- [[2026-10-17-postgresql-zero-downtime-schema-migration-guide]] — *"평소엔 숨기고 예외에만 수동 레버" 원칙의 마이그레이션 버전*
- [[2026-06-30-postgresql-19-beta-deep-dive]] — *베타 단계에서 이미 다룬 신기능 미리보기*

## 한 달 뒤 회고

*(2026-12-21 즈음 — PostgreSQL 19로 실제 업그레이드 계획이 잡혔는지, `WAIT` 커맨드를 예약 확인 플로우의 read-your-writes 문제에 검토했는지, `pg_plan_advice`를 느린 쿼리 교정에 실제로 써볼지 기록.)*
