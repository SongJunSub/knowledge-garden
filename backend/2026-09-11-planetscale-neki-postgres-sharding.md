---
title: "Neki - Postgres를 여러 서버로 확장하는 PlanetScale의 새 서비스 (PlanetScale) — 각 샤드에 호환 엔진이 아니라 진짜 Postgres를 그대로 심어, 드라이버·ORM은 그대로 두고 서버 수만 늘리는 설계"
source_title: "Announcing Neki"
source_url: "https://planetscale.com/blog/announcing-neki"
source_name: "PlanetScale 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33501"
published_at: "2026-09-10"
summarized_at: "2026-09-11"
category: "backend"
tags: ["postgres", "sharding", "planetscale", "vitess", "database-scaling", "distributed-systems"]
---

# Neki - Postgres를 여러 서버로 확장하는 PlanetScale의 새 서비스

> 출처: [Announcing Neki](https://planetscale.com/blog/announcing-neki) (PlanetScale 공식 블로그) · GeekNews(id=33501) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`와 `planetscale.com`은 이번 세션에서 egress 차단으로 원문·hada 댓글 모두 직접 열람하지 못했다. WebSearch로 PlanetScale 공식 블로그·changelog(`planetscale.com/changelog/neki`)·daily.dev 요약을 교차 확인했고, 제공된 Slack 발췌(원문 스크래핑)와 대체로 일치한다. 다만 "스키마 변경, 버전 업그레이드, 장애 전환과 데이..."로 끊긴 Slack 문장의 마지막 단어(추정: 데이터 재분산/resharding)는 WebSearch 요약("routing, resharding, online schema changes, and version upgrades, all with a single connection string")으로 짜맞춘 재구성이지, 원문을 직접 대조한 인용은 아니다.

## 한 줄 요약

**PlanetScale이 Postgres를 여러 서버로 수평 확장하는 새 서비스 Neki를 공개했다 — 핵심은 각 샤드에서 호환 엔진이 아니라 ***진짜 Postgres***를 그대로 실행하고, 애플리케이션은 기존 드라이버·ORM으로 단일 연결 문자열에 접속하면 라우터가 쿼리를 필요한 샤드로 보내고 결과를 합쳐 돌려준다는 것이다.** Vitess로 8년간 세계 최대급 MySQL 샤딩 클러스터(수백만 QPS)를 운영한 팀이 만들었지만, Postgres는 아키텍처·복제 모델이 근본적으로 달라 Vitess를 포크한 게 아니라 처음부터 새로 설계했다고 밝힌다. 현재는 "플랫폼 프리뷰" 단계이며 오픈소스화는 "준비되면" 나중에 하겠다는 입장이라, 지금 시점에는 PlanetScale의 관리형 서비스로만 쓸 수 있는 것으로 보인다(이 부분은 WebSearch 요약 기반이며 원문 자체의 정확한 문구는 대조하지 못했다).

## 핵심 포인트

- **진짜 Postgres, 호환 엔진 아님** — 각 샤드가 별도의 Postgres 호환 데이터베이스가 아니라 ***실제 PostgreSQL 그 자체***를 실행한다. 확장성 때문에 SQL 방언이나 트랜잭션 보장이 달라지는 위험을 피하려는 설계로 읽힌다.
- **애플리케이션 코드는 그대로** — 기존 Postgres 드라이버·ORM으로 ***단일 접속점(연결 문자열 하나)***에 연결하고, Neki 라우터가 쿼리를 필요한 샤드로 라우팅해 결과를 병합해 돌려준다. 마이그레이션 비용을 낮추는 게 핵심 세일즈 포인트다.
- **샤드 키·테이블 배치를 사용자가 직접 지정** — 자동 샤딩 전략에만 의존하지 않고, 어떤 컬럼을 샤드 키로 쓸지·어떤 테이블을 어디에 둘지 사용자가 결정할 수 있다.
- **무샤딩 → 샤딩으로 점진적 확장** — 처음엔 샤딩 없이 단일 클러스터로 운영하다가, 데이터가 커지면 ***기존 클러스터에서 그대로 분산 구성을 확장***할 수 있다고 홍보한다 — 즉 "나중에 필요해지면 마이그레이션"이 아니라 "같은 클러스터가 커진다"는 주장.
- **운영 부담까지 흡수하려는 범위** — 스키마 변경, 버전 업그레이드, 장애 전환(failover), 데이터 재분산(resharding으로 추정)까지 단일 연결 문자열 아래에서 관리하겠다고 밝힌다(Slack 발췌는 이 지점에서 절단됨).
- **8년치 Vitess 운영 경험이 배경** — MySQL을 세계 최대 규모로 샤딩해온 Vitess 팀의 노하우를 Postgres에 이식하되, "Vitess의 포크가 아니라 Postgres 고유의 아키텍처·복제 모델에 맞춰 처음부터 다시 만들었다"고 명시한다.

## 인상 깊은 문장

> "Neki is not a fork of Vitess. Postgres is a fundamentally different database with its own architecture, replication model, and operational characteristics." (WebSearch로 확인한 PlanetScale 공식 요약 — 원문 전체 대조는 못했다)

## 댓글

`news.hada.io`(id=33501) 접근이 egress 차단으로 막혀 hada 댓글 수·논조를 확인하지 못했다. WebSearch에서 별도 Hacker News 스레드(`news.ycombinator.com/item?id=44867374`, "Neki – Sharded Postgres by the team behind Vitess")가 검색되지만, 이 세션에서 직접 열람하지 못해 점수·댓글 수는 확인 불가하다. 이해관계도 밝혀둔다 — 원문은 PlanetScale이 자사 신규 유료 서비스(Neki)를 발표하는 공식 블로그이고, "8년 Vitess 경험" 같은 신뢰도 근거도 회사 자신의 서사다. 또한 이번 배치에서 같은 날 GeekNews에 함께 오른 Multigres(Supabase, 아래 핵심 전이 참고)와 정확히 같은 문제를 겨냥한 경쟁 관계라, "두 프로젝트가 진짜 같은 날 발표됐는지"까지는 이번 조사로 확정하지 못했다(WebSearch 결과들이 "한 달 차이"와 "같은 시기"를 섞어 말해 서로 모순됐다) — 확실한 건 오늘(2026-09-11) 같은 배치로 나란히 다뤄질 만큼 GeekNews에 동시에 올라왔다는 점뿐이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 회사, 같은 "샤드 단위로 쪼개 운영한다"는 철학의 반복

[[2026-08-10-planetscale-parallel-backups]]에서 다룬 PlanetScale의 백업 설계는 "각 샤드마다 독립적인 임시 노드를 띄워 백업·복원·WAL 재생을 병렬로 처리"하는 구조였고, 그 결과 100샤드 100TB가 단일 샤드 1TB와 비슷한 속도로 백업됐다. Neki의 샤딩 철학도 정확히 같은 패턴이다 — 샤드마다 독립된 실제 Postgres 인스턴스를 두고, 운영(백업·장애 전환·리사이징)을 샤드 단위로 병렬화한다는 것. 두 발표를 겹쳐보면 PlanetScale이 "샤드는 독립적으로 운영 가능한 단위"라는 원칙을 백업 파이프라인에서 먼저 증명한 뒤, 그 인프라 철학을 Postgres 샤딩 제품 자체로 확장한 흐름으로 읽힌다.

### 핵심 전이 2 — Aurora pgvector 글과는 "확장 전략의 층위"가 다르다

[[2026-09-10-aurora-postgresql-pgvector-production]]은 "단일 Postgres 클러스터 안에서" 양자화·파티셔닝으로 수억~수십억 벡터까지 버틸 수 있다고 주장했다 — 즉 ***수직/논리적 확장***의 한계를 최대한 늦추는 접근이다. Neki는 그 한계에 실제로 도달했을 때(단일 클러스터로는 더 이상 안 될 때) 쓰는 ***수평 확장*** 카드다. 두 글을 나란히 보면 "언제 파티셔닝으로 버티고 언제 진짜 샤딩으로 넘어가야 하는가"라는 하나의 연속된 의사결정 곡선이 보인다 — Aurora 글이 그 곡선의 앞부분(버티는 법)을, Neki가 뒷부분(넘어가는 법)을 각각 담당하는 셈이다. 다만 두 글 모두 벤더 자신의 주장이라, 실제 경계선이 어디인지는 여전히 자체 벤치마크로 확인해야 한다는 원칙은 동일하게 적용된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 아직 멀다 — 온다 CRS의 데이터 규모가 단일 Postgres 클러스터의 한계(수십 TB, 수억~수십억 행)에 근접했다는 근거는 이번 조사에서 전혀 확인되지 않았고, 오히려 B2B 호텔 예약 데이터 규모상 그 한계에 도달할 가능성은 낮아 보인다. 다만 설계 원칙 하나는 미리 참고할 만하다 — "샤딩을 도입해도 애플리케이션의 드라이버·ORM·연결 문자열은 그대로 둔다"는 목표는, 훗날 온다가 정말 수평 확장이 필요해지는 시점이 오더라도 애플리케이션 레이어를 다시 쓰지 않고 인프라만 교체할 수 있는 방향을 미리 가리켜준다는 점에서 아키텍처 선택 시 참고 기준이 될 수 있다. 지금 시점에 실제로 검토할 필요는 낮다는 게 정직한 결론이다.

## 연관 자료

- [[2026-08-10-planetscale-parallel-backups]] — 같은 회사(PlanetScale)가 샤드 단위 독립 운영이라는 같은 철학을 백업 파이프라인에 먼저 적용한 사례
- [[2026-09-10-aurora-postgresql-pgvector-production]] — "단일 클러스터로 얼마나 버틸 수 있는가"라는 앞선 층위를 다룬 대조 사례, 확장 전략 곡선의 앞뒤 관계

## 한 달 뒤 회고

*(2026-10-11 즈음 — Neki가 플랫폼 프리뷰를 벗어나 GA·오픈소스화됐는지, HN 스레드 반응(점수·비판 논지)을 실제로 확인, Multigres와의 경쟁 구도에서 실제 채택 사례가 나왔는지 점검.)*
