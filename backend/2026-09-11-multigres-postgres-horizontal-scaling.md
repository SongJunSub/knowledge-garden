---
title: "Multigres - Postgres의 수평 확장을 위한 오픈소스 (Supabase, Sugu Sougoumarane) — Vitess 원저자가 Postgres 앞에 라우팅·풀링 계층을 세우는데, 정작 v0.1 알파에는 샤딩 자체가 아직 없다"
source_title: "Announcing Multigres: Vitess for Postgres"
source_url: "https://supabase.com/blog/multigres-vitess-for-postgres"
source_name: "Supabase 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33505"
summarized_at: "2026-09-11"
category: "backend"
tags: ["postgres", "vitess", "supabase", "sharding", "connection-pooling", "database-scaling", "open-source"]
---

# Multigres - Postgres의 수평 확장을 위한 오픈소스

> 출처: [Announcing Multigres: Vitess for Postgres](https://supabase.com/blog/multigres-vitess-for-postgres) (Supabase 공식 블로그, Sugu Sougoumarane) · GeekNews(id=33505) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`와 `supabase.com`은 이번 세션에서 egress 차단으로 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 Supabase 공식 블로그·Lobsters 스레드(`lobste.rs/s/l2d9cb`)·CMU DB 그룹 세미나 페이지를 교차 확인했다. 발행일은 명시하지 못한다 — WebSearch 결과가 "프로젝트 최초 발표"와 "v0.1 알파 공개(2026-06-04, Supabase Series F 발표와 동시)"를 서로 다른 시점으로 가리키면서도 정확한 선후 관계를 일관되게 정리해주지 못했다. GeekNews(id=33505)가 오늘(2026-09-11) 이 주제를 다룬 것이 최초 발표 시점과 같은 날인지, 아니면 그사이 나온 후속 소식(예: v0.1 알파 이후 진행 상황) 때문인지는 이번 조사로 확정하지 못했다.

## 한 줄 요약

**Vitess 공동 창업자 Sugu Sougoumarane이 Supabase에 합류해, MySQL을 여러 서버로 확장한 Vitess의 접근을 Postgres에 그대로 적용하는 오픈소스 프로젝트 Multigres를 만들었다.** 별도의 호환 데이터베이스로 갈아타는 대신 실제 Postgres 앞에 쿼리 라우팅·연결 풀링·복제·장애 전환을 관리하는 운영 계층을 두는 구조다. 다만 정직하게 짚어야 할 게 있다 — WebSearch로 확인한 v0.1 알파는 "단일 샤드 고가용성 클러스터"만 지원하며, 이 프로젝트의 간판 기능인 ***샤딩 자체는 아직 포함되지 않았다*** — 이름값(Vitess for Postgres)과 현재 구현 사이에는 아직 간극이 있다.

## 핵심 포인트

- **Vitess의 접근을 Postgres에 이식** — MySQL을 여러 서버로 확장하며 샤딩·연결 풀링·복제·장애 전환을 함께 관리해온 Vitess의 방식론을, 엔진 자체는 건드리지 않고 Postgres 앞단에 그대로 적용한다.
- **별도 DB가 아니라 라우팅·운영 계층** — 데이터를 다른 엔진으로 옮기는 게 아니라, 실제 Postgres 앞에 쿼리 라우팅 계층을 얹는 구조라는 점에서 방향성은 Neki와 같다(핵심 전이 참고).
- **Multigateway** — 애플리케이션은 표준 Postgres 와이어 프로토콜로 Multigateway에 접속하고, 게이트웨이가 쿼리를 전달하며 ***읽기 요청을 복제본으로 분산***할 수 있다.
- **Multipooler** — 각 Postgres 인스턴스 앞에 있는 Multipooler가 연결을 재사용하고 세션·트랜잭션 상태를 관리해, 많은 클라이언트가 동시에 접속해도 데이터베이스가 과부하 없이 안정적으로 작동하게 한다(Slack 발췌는 이 지점에서 절단됨 — WebSearch로 "modeless connection pooling"이라는 표현을 확인해 재구성).
- **Apache 2.0, BSL·상업 티어 없음** — Neki가 "플랫폼 프리뷰"로 시작해 "준비되면" 오픈소스화하겠다는 것과 달리, Multigres는 처음부터 완전한 오픈소스(Apache 2.0)로 공개됐다.
- **아직 프로덕션 준비 단계 아님** — v0.1 알파는 실험·피드백용 단일 샤드 HA 클러스터이며, 프로젝트가 약속한 Vitess급 수평 샤딩은 "향후 릴리스"로 예고돼 있다 — 지금 시점에 실제로 쓸 수 있는 건 고가용성·풀링이지, 샤딩 자체가 아니다.

## 인상 깊은 문장

> "Multigres is a scalable operating system for Postgres that provides high availability and operational simplicity. In a future release it will provide Vitess-grade horizontal scaling." (Supabase 공식 X 계정 발표, WebSearch로 확인 — "향후 릴리스"라는 단서가 핵심)

## 댓글

`news.hada.io`(id=33505) 접근이 egress 차단으로 막혀 hada 댓글 수·논조를 확인하지 못했다. WebSearch로 Lobsters 스레드(`lobste.rs/s/l2d9cb`)가 존재하는 것은 확인했지만 이 세션에서 직접 열람하지 못해 논쟁 내용·점수는 파악하지 못한다. 이해관계를 밝힌다 — 원문은 Supabase가 자사에 합류한 Vitess 원저자의 신규 오픈소스 프로젝트를 홍보하는 공식 블로그다. 또한 "샤딩이 아직 없다"는 정직한 한계는 이번 노트가 원문 자체보다 WebSearch로 찾은 별도 기술 리뷰(dev.to)에서 더 명확히 드러난 내용이라, 원문이 이 점을 얼마나 전면에 내세웠는지는 대조하지 못했다 — 발표 자료가 흔히 그렇듯 "향후 릴리스"라는 단서가 부제나 각주 수준으로 처리됐을 가능성을 배제할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 Vitess 혈통이 두 회사로 갈라진, 흥미로운 대조

같은 배치에서 정리한 PlanetScale의 Neki(파일 없음, 이 배치에서 별도로 다룸)도 "Vitess 원저자 팀이 만든 Postgres 샤딩 솔루션"이라는 점에서 출발점이 완전히 같다. 그런데 둘의 노선은 정반대다 — Neki는 PlanetScale이라는 기존 Vitess 상업화 회사 안에서 "플랫폼 프리뷰 → 준비되면 오픈소스"라는 폐쇄적 경로를 택했고, Multigres는 Vitess 공동 창업자 본인이 경쟁 BaaS 플랫폼(Supabase)으로 옮겨 처음부터 완전 오픈소스(Apache 2.0, BSL 없음)로 공개했다. 같은 문제의식(Postgres에 Vitess급 수평 확장을)을 가진 같은 계보의 인력이, 라이선스 전략과 조직 소속에서는 정확히 다른 선택을 했다는 게 이 배치를 함께 보는 재미다. 다만 "Sugu Sougoumarane이 정확히 언제 어떤 경위로 PlanetScale을 떠나 Supabase에 합류했는지"의 구체적 이력은 이번 조사로 확인하지 못했다 — WebSearch 요약에 의존한 추정임을 밝힌다.

### 핵심 전이 2 — [[2026-07-23-postgres-survival-guide-startups]]가 멈춘 지점 다음 단계, 그러나 아직 도착하지 않았다

그 노트는 성장하는 스타트업의 Postgres 병목을 스키마 → 인덱스 → autovacuum → 파티셔닝 순서로 정리했는데, 파티셔닝조차 어디까지나 ***단일 서버 안에서의*** 해법이었다. Multigres(그리고 Neki)가 겨냥하는 지점은 그 다음 단계 — 파티셔닝으로도 부족해 여러 서버로 넘어가야 하는 순간이다. 다만 이번 조사에서 확인한 정직한 사실은, Multigres는 아직 그 "다음 단계"의 간판 기능(샤딩)을 실제로 제공하지 못하는 알파 단계라는 것 — 생존 가이드가 다룬 파티셔닝은 이미 실전에서 쓸 수 있는 기법인 반면, Multigres가 약속하는 수평 샤딩은 아직 로드맵상의 미래형이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — v0.1 알파 자체가 프로덕션 준비 단계가 아니라고 프로젝트 스스로 밝히고 있어, 온다가 지금 도입을 검토할 대상은 아니다. 다만 개념 하나는 참고할 만하다 — [[2026-07-23-postgres-survival-guide-startups]]에서도 강조된 "연결 풀링 필수"(pgbouncer 등)라는 원칙을, Multipooler는 한 단계 더 밀어붙여 "세션·트랜잭션 상태까지 인식하는 풀링"으로 제시한다. 온다 CRS가 이미 어떤 형태로든 연결 풀러를 쓰고 있다면(이 역시 확인된 사실은 아니다), 단순 연결 재사용을 넘어 세션 상태 인식까지 필요한 시점이 언제일지 정도는 개념적으로 담아둘 만하다. 그 이상의 구체적 적용은 이 프로젝트가 실제로 샤딩 기능을 갖추고 안정화된 이후에나 재검토할 문제다.

## 연관 자료

- [[2026-07-23-postgres-survival-guide-startups]] — 단일 서버 안에서의 확장 한계(파티셔닝까지)를 다룬 선행 단계, Multigres가 겨냥하는 다음 층위와의 경계
- [[2026-09-10-aurora-postgresql-pgvector-production]] — 같은 배치 시기, "언제까지 단일 클러스터로 버틸 수 있는가"라는 같은 질문을 벡터 검색 관점에서 다룬 사례

## 한 달 뒤 회고

*(2026-10-11 즈음 — Multigres가 실제 샤딩 기능을 포함한 다음 버전을 냈는지, Lobsters·HN 논쟁에서 "아직 샤딩이 없다"는 점이 얼마나 비판받았는지, Neki와의 채택률·생태계 반응 비교를 확인.)*
