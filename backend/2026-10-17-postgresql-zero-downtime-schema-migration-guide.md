---
title: "PostgreSQL 무중단 스키마 변경 실무 가이드 — '확장-축소' 패턴과 lock_timeout으로 배포와 데이터 이전을 분리한다"
source_title: "확인 불가 (GeekNews 원문 외부 링크 이번 세션에서 미확인)"
source_url: "https://news.hada.io/topic?id=35501"
source_name: "GeekNews (원문 외부 링크 이번 세션에서 미확인)"
referrer_url: "https://news.hada.io/topic?id=35501"
published_at: "확인 불가"
summarized_at: "2026-10-17"
category: "backend"
tags: ["postgresql", "database", "schema-migration", "zero-downtime", "expand-contract", "lock-timeout", "devops"]
---

# PostgreSQL 무중단 스키마 변경 실무 가이드 — '확장-축소' 패턴과 lock_timeout으로 배포와 데이터 이전을 분리한다

> 출처: GeekNews 토픽 [id=35501](https://news.hada.io/topic?id=35501) (원문 외부 링크 이번 세션에서 미확인) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-10-17

> **출처 한계**: `news.hada.io` 전면 차단으로 원문을 열지 못했다. "PostgreSQL zero-downtime schema migration expand-contract" 계열 글은 여러 벤더(Shopify, GitLab, PlanetScale 등)가 비슷한 내용을 반복해서 다루는 매우 일반적인 베스트프랙티스 주제라, WebSearch로 "이 글 고유의" 원문을 특정하지 못했다. 아래는 Slack 발췌(5문장, 말줄임으로 끊김)를 1차 근거로 삼고, 업계 공통 지식으로 보강 가능한 부분만 일반론으로 덧붙인다.

## 한 줄 요약

**PostgreSQL 스키마 변경을 "무중단"으로 만드는 핵심은 DDL 한 줄의 속도가 아니라, 구버전과 신버전 애플리케이션이 동시에 떠 있는 배포 기간 동안 데이터베이스가 양쪽 모두를 지원하도록 확장(새 구조 추가) → 전환(이중 쓰기·읽기 전환) → 축소(기존 구조 제거)로 단계를 쪼개고, 짧은 `lock_timeout`과 동시 인덱스 생성으로 락 대기 시간을 최소화하는 것이다.**

## 핵심 포인트

- ***"무중단"의 기준을 재정의*** — 데이터베이스 자체가 거대해도 요청 지연·오류·쓰기 중단이 발생하면 "무중단 배포"라고 부를 수 없다. 사용자가 체감하는 지연이 기준이라는 당연하지만 자주 잊히는 전제를 명시했다.
- ***확장-축소(expand-contract) 패턴*** — ①새 구조 추가 ②기존 데이터 이전 ③읽기/쓰기 전환 ④검증 ⑤기존 구조 제거, 이 5단계를 분리해서 "한 번의 배포로 스키마와 애플리케이션을 동시에 바꾸는" 위험한 빅뱅 배포를 피한다. 구버전 코드가 떠 있는 동안에도 데이터베이스는 신버전까지 함께 지원해야 한다.
- ***컬럼 이름 변경도 여러 릴리스에 걸쳐 진행*** — 이름 하나 바꾸는 것도 즉시가 아니라 "새 컬럼 추가 → 이중 쓰기 → 트래픽 전환 → 구컬럼 제거"를 여러 배포 사이클로 나눈다. 가장 간단해 보이는 변경에도 같은 원칙을 일관되게 적용한다.
- ***락 대기가 전염된다*** — 스키마 변경 DDL이 락을 기다리는 동안, 그 DDL 뒤에 들어온 평범한 쿼리들까지 줄줄이 막힐 수 있다(락 큐잉). 짧은 `lock_timeout`으로 DDL의 대기 시간 자체를 제한해, 락을 못 잡으면 바로 재시도하도록 만들어 이 전염을 끊는다.
- ***동시 인덱스 생성·제약조건 추가-검증 분리*** — `CREATE INDEX CONCURRENTLY`처럼 동시(non-blocking) 생성을 쓰고, 제약조건(예: `NOT NULL`, `FOREIGN KEY`)도 "추가"와 "검증(VALIDATE)"을 분리해 각각의 락 점유 시간을 줄인다(여기서 Slack 발췌 끊김, 더 구체적인 코드 예시는 확인 못함).

## 인상 깊은 문장

> "데이터베이스가 커져 있어도 요청 지연과 오류, 쓰기 중단이 발생하면 무중단으로 볼 수 없다." (Slack 요약 인용)

## 댓글

GeekNews 원문 미확보로 hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다. 이 글이 PostgreSQL 특유의 함정(예: 긴 트랜잭션 중 DDL이 어떻게 락을 쌓는지, `ALTER TABLE ... ADD COLUMN DEFAULT`가 PG 11+ 에서 더 이상 테이블 전체를 재작성하지 않는다는 변경 등)까지 다루는지, 아니면 일반론 수준에 머무는지는 Slack 발췌만으로는 판단하기 어렵다.

## 내 생각 · 적용점

이 글의 "확장-축소"는 [[2026-06-30-postgresql-19-beta-deep-dive]]가 다룬 PostgreSQL 19의 `REPACK CONCURRENTLY`(락 없는 테이블 재구성)와 같은 방향의 설계 철학이다 — PostgreSQL 생태계 전체가 "큰 변경을 한 번에 하지 말고, 락을 쪼개서 점진적으로 하라"는 원칙을 DB 엔진 레벨(REPACK)과 애플리케이션 레벨(확장-축소 패턴) 양쪽에서 동시에 밀고 있다는 정황으로 읽힌다. 또 [[2026-10-13-postgres-storage-not-slow]]가 "PostgreSQL 자체는 느리지 않다, 운영 방식이 문제다"는 논지를 폈던 것과 같은 결의 메시지 — 즉 PostgreSQL의 한계보다 "어떻게 운영하느냐"가 무중단 여부를 가른다는 반복되는 주제다.

## 호스피탈리티 / CRS 적용 포인트

이건 CRS에 **직접** 적용된다. 예약·재고·요금 테이블의 스키마 변경은 호텔이 실시간으로 예약을 받는 와중에 이뤄져야 하므로, "확장-축소" 패턴 — 새 컬럼 추가 후 이중 쓰기 → 신규 코드로 전환 → 검증 후 구컬럼 제거 — 를 CRS의 핵심 테이블(예약, 요금, 재고) 마이그레이션 표준 절차로 그대로 채택할 수 있다. 짧은 `lock_timeout` + `CREATE INDEX CONCURRENTLY`는 피크 예약 시간대(성수기 오픈 등)에 스키마 변경을 강행해야 할 때 실제 장애를 막는 구체적인 체크리스트 항목이 될 수 있다.

## 연관 자료

- [[2026-06-30-postgresql-19-beta-deep-dive]] — PostgreSQL 19의 `REPACK CONCURRENTLY` 등 "락을 쪼개는" DB 엔진 레벨 개선과 같은 철학
- [[2026-10-13-postgres-storage-not-slow]] — "PostgreSQL은 느리지 않다, 운영이 문제다"는 같은 결의 반복 주제
- [[2026-09-21-postgresql-caching-basics-and-extras]] — PostgreSQL 운영 실무를 다룬 인접 기초 자료

## 한 달 뒤 회고

2026-11-17 즈음, 이 가이드의 원문을 특정해 구체적인 SQL 예시(특히 제약조건 추가-검증 분리 문법)를 확인하고, 온다 CRS의 실제 스키마 마이그레이션 절차 문서에 "확장-축소" 체크리스트를 반영했는지 점검한다.
