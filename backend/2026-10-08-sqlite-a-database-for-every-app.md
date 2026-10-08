---
title: "SQLite의 확장은 더 큰 DB가 아니라 더 많은 DB (GeekNews) — 앱 하나당 DB 하나씩, Postgres가 못 채우는 틈"
source_title: "SQLite: A Database for Every App"
source_url: "https://news.hada.io/article/sqlite-a-database-for-every-app"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/article/sqlite-a-database-for-every-app"
published_at: "확인 불가"
summarized_at: "2026-10-08"
category: "backend"
tags: ["sqlite", "postgres", "database-per-tenant", "embedded-database", "single-file-database", "geeknews"]
---

# SQLite의 확장은 더 큰 DB가 아니라 더 많은 DB

> 출처: [SQLite: A Database for Every App](https://news.hada.io/article/sqlite-a-database-for-every-app) (GeekNews) · 정리일 2026-10-08

> **출처 한계**: `news.hada.io`는 이번 세션에서도 `EGRESS_BLOCKED`로 전면 차단됐다. 이 URL은 GeekNews의 토픽(topic?id=)이 아니라 article 경로라 "GeekNews 자체가 쓴 글이거나, GeekNews가 원문을 번역·재게시한 글"로 보이는데, WebSearch로 "a database for every app sqlite blog", "Postgres SQLite database for every app" 등을 여러 조합으로 시도했지만 **1차 원문(영문이든 한글이든)을 특정하지 못했다.** 가장 근접한 선행 사례로 Turso의 "Give each of your users their own SQLite database"(DHH의 테넌트당 DB 주장에서 영감받은 글)를 찾았지만, 이 글과 동일 원문인지는 확인할 수 없다 — 제목·논지가 비슷한 장르일 뿐 같은 글이라고 단정하지 않는다. **이 노트의 실질적 근거는 Slack 발췌 한 단락(마지막이 "SQLite는 오랫동안 모바일 앱, 데스..."에서 끊김)이 전부다.**

## 한 줄 요약

**"Postgres 하나면 대부분의 앱을 만들 수 있다"는 전제를 인정하면서도, 사용자마다 작은 데이터를 따로 보관하거나 잠깐 쓰고 버릴 프로그램까지 같은 중앙 Postgres 구성을 쓸 필요는 없다고 반박하는 글 — SQLite가 답하는 확장 방향은 "하나의 DB를 더 크게"가 아니라 "작은 DB를 앱/사용자 단위로 더 많이" 두는 쪽이라는 주장으로 보인다.**

## 핵심 포인트

- **Postgres를 깎아내리지 않는다.** Slack 발췌는 "여러 사용자가 동시에 데이터를 수정하고, 여러 서버와 도구가 하나의 상태를 공유하는 데 이미 검증된 선택"이라며 Postgres의 강점을 먼저 인정한다 — "특별한 이유가 없다면 Postgres로 시작하는 게 자연스럽다"는 저자(또는 GeekNews 편집자)의 톤.
- **논지의 전환점**: "대부분의 일을 잘한다"와 "모든 상황에서 가장 간단한 선택"은 다르다는 구분 — 사용자마다 작은 데이터를 따로 보관하거나, 잠깐 쓰고 말 프로그램에도 중앙 DB 서버 구성이 필요한지를 되묻는다.
- **제목이 핵심 논지를 직접 요약한다**: SQLite의 확장 전략은 "더 큰 하나의 DB"가 아니라 "더 많은 개별 DB"라는 것 — 즉 수직 확장(한 인스턴스를 키우기)이 아니라 수평 분할을 DB 단위 자체로 밀어붙이는 접근.
- 발췌 마지막 불릿이 "SQLite는 오랫동안 모바일 앱, 데스..."에서 끊겨, 모바일 앱·데스크톱 앱 임베딩이라는 SQLite의 전통적 강점을 이 논지의 근거로 이어서 들었을 것으로 추정되나 **그 이후 내용은 확인 불가.**

## 인상 깊은 문장

> "사실 Postgres 하나면 대부분의 애플리케이션을 만들 수 있습니다. 여러 사용자가 동시에 데이터를 수정하고, 여러 서버와 도구가 하나의 상태를 공유하는 데 이미 검증된 선택입니다. (...) 그런데 대부분의 일을 잘한다는 것과, 모든 상황에서 가장 간단한 선택이라는 것은 조금 다릅니다."
> (Slack 발췌 원문 그대로 — 원문 대조는 못했지만 발췌 자체가 번역·재구성 없이 인용 가능한 수준으로 보인다.)

## 댓글

`news.hada.io` 접근 차단으로 hada 댓글 수·논조를 확인하지 못했다. HN/Lobsters 큐레이션 여부도 확인 불가. 원문 저자·매체가 특정되지 않은 상태라, 이 주장이 개인 블로그의 옹호 논증(advocacy)인지 SQLite 공식 자료인지도 가늠할 수 없다는 점이 가장 큰 정직성 한계다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-26-turso-db-per-ai-generated-site]]가 이미 이 논지를 실물 아키텍처로 보여줬다

Turso/Poke 사례 노트는 "AI가 생성한 웹사이트마다 전용 SQLite DB를 하나씩 프로비저닝"하는 설계였고, 그 핵심 이유가 바로 "공유 DB에서 CPU를 잡아먹는 쿼리 하나가 플랫폼 전체를 느리게 만든다"는 것이었다. 이번 글의 "더 큰 DB가 아니라 더 많은 DB"라는 제목이 가리키는 게 정확히 이 패턴이다 — 중앙 집중형 인스턴스를 수직으로 키우는 대신, 격리 단위를 테넌트/앱 하나로 쪼개 DB 개수를 늘리는 쪽으로 확장한다. 다만 Turso 노트의 사례는 "AI가 만든 신뢰할 수 없는 SQL"이라는 구체적 동기가 있었던 반면, 이 글은 그보다 일반적인 "앱마다"라는 더 넓은 주장으로 보인다.

### 핵심 전이 2 — [[2026-08-25-sqlite-for-everything]]과는 "역할 통합"이라는 축에서, 이 글은 "개수 분할"이라는 축에서 SQLite를 민다

그 노트는 SQLite 하나가 검색·캐시·벡터 인덱스·문서 저장소까지 흡수해 "한 프로세스 안에서 여러 서버 역할을 대체"하는 방향이었다. 이 글은 반대로 "역할은 단순한 관계형 DB 하나로 유지한 채, 그 DB를 사용자/앱 수만큼 늘린다"는 쪼개기 방향이다. 두 글을 합치면 SQLite가 "한 애플리케이션 안에서 깊어지는" 전략과 "여러 애플리케이션으로 넓어지는" 전략을 동시에 갖고 있다는 그림이 완성된다.

### 핵심 전이 3 — [[2026-05-08-sqlite-loc-recommended-storage-format]]의 "파일 포맷"이라는 성질이 이 분할 전략의 물리적 전제다

의회도서관 노트가 짚은 "복사 가능한 단일 파일"이라는 SQLite의 성질이 없었다면, "앱마다 DB를 하나씩 둔다"는 전략 자체가 성립하기 어렵다 — 서버 프로세스 하나를 앱마다 띄워야 한다면 그 비용이 수평 분할의 장점을 다 깎아먹기 때문이다. 세 노트를 겹치면 "단일 파일"이라는 하나의 물리적 성질이 보존(의회도서관)·역할 통합(sqlite-for-everything)·개수 분할(이 글) 세 가지 서로 다른 전략을 동시에 가능하게 하는 공통 기반이라는 게 보인다.

## 호스피탈리티 / CRS 적용 포인트

- **파트너 호텔/채널별 소규모 데이터는 "더 큰 공유 DB"보다 "파트너당 작은 DB"가 맞을 수 있다.** CRS가 파트너사별 설정·로컬 캐시·오프라인 큐처럼 격리가 자연스러운 작은 데이터 단위를 Postgres의 스키마/테이블 분할로 처리하고 있다면, 그 일부(특히 트래픽이 적고 격리 가치가 큰 영역)는 SQLite 파일 단위 분할로 바꿔볼 후보다 — [[2026-08-26-turso-db-per-ai-generated-site]]가 보여준 "CPU를 잡아먹는 쿼리 하나가 전체를 느리게 만드는 걸 막는다"는 동기가 멀티테넌트 B2B SaaS인 온다에도 그대로 적용된다.
- **다만 CRS의 핵심 도메인(요금·재고·정산)은 여러 서버·도구가 하나의 상태를 공유해야 하는 영역이라, 이 글이 먼저 인정한 "Postgres가 맞는 경우"에 정확히 해당한다.** 분할 전략은 코어 트랜잭션 데이터가 아니라 파트너별 부가 데이터·캐시·실험적 기능에 한정해 검토하는 게 순서상 맞다.

## 연관 자료

- [[2026-08-26-turso-db-per-ai-generated-site]] — "앱/아티팩트 단위로 DB를 쪼갠다"는 이 글의 논지를 구체적 동기·수치까지 갖춰 보여준 실물 사례
- [[2026-08-25-sqlite-for-everything]] — SQLite를 민다는 점은 같지만 "역할 통합"(깊어지기)이라는 반대 축의 전략
- [[2026-05-08-sqlite-loc-recommended-storage-format]] — "단일 파일"이라는 이 분할 전략의 물리적 전제가 되는 SQLite의 성질
- [[2026-08-29-syncular-offline-first-sqlite-sync-engine]] — 오프라인/로컬 환경에서 SQLite를 단위별로 쓰는 또 다른 사례, 느슨하게 같은 흐름

## 한 달 뒤 회고

*(2026-11-08 즈음 — news.hada.io 접근이 풀리면 원문 저자·매체를 특정해 이 글이 Turso 사례와 동일 원문인지, 아니면 별개의 더 일반적인 주장인지 확인하고, CRS 파트너별 데이터 중 SQLite 분할 후보를 실제로 식별해봤는지 점검.)*
