---
title: "AI로 만든 웹사이트마다 전용 DB를 하나씩 제공하는 이유 (Turso × Poke) — 나쁜 SQL 한 줄이 CPU를 잡아먹어도, 그 사이트 하나만 죽는다"
source_title: "How Poke Gives Every User Their Own Database, Without Them Ever Knowing"
source_url: "https://turso.tech/blog/how-poke-gives-every-user-their-own-database"
source_name: "Turso 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=32891"
summarized_at: "2026-08-26"
category: "ai"
tags: ["agentic-ai", "database-per-tenant", "sqlite", "turso", "ai-generated-code", "blast-radius", "isolation"]
---

# AI로 만든 웹사이트마다 전용 DB를 하나씩 제공하는 이유 (Turso × Poke)

> 출처: [How Poke Gives Every User Their Own Database, Without Them Ever Knowing](https://turso.tech/blog/how-poke-gives-every-user-their-own-database) (Turso 공식 블로그) · 정리일 2026-08-26
> **출처 한계**: `turso.tech`·`news.hada.io` 둘 다 이번 세션 egress 정책으로 직접 열지 못했다. 아래 내용은 **WebSearch가 반환한 이 글의 스니펫**(따옴표로 감싸인 부분은 원문 인용일 가능성이 높다)과 **Slack `#개발-뉴스-dev-news` 채널 발췌**(뒷부분 잘림)를 교차 종합한 것이다. `web.archive.org` 경유 재시도도 이 세션에서는 지원되지 않아 원문 전체 대조는 하지 못했다.

## 한 줄 요약

**iMessage 기반 개인 비서 Poke가 사용자 문자 한 줄로 웹사이트를 만들어 Vercel에 배포할 때, 생성된 사이트마다 Turso(SQLite 호환 서버리스) 데이터베이스를 하나씩 자동 프로비저닝한다 — AI 에이전트가 만드는 SQL은 최적이 아닐 수 있다는 전제를 깔고, 사고의 반경(blast radius)을 사이트 하나로 미리 좁혀두는 아키텍처 선택이다.**

## 핵심 포인트

- **역할 분리** — 사용자 계정·에이전트 상태·내부 운영 데이터는 기존 PlanetScale(중앙 집중형)에 그대로 두고, ***AI가 생성한 웹사이트의 데이터만*** 사이트별 Turso DB로 분리했다. 코어 시스템과 "에이전트가 즉흥적으로 만든 산출물"을 같은 신뢰 등급으로 두지 않은 것.
- **왜 PlanetScale로는 안 됐나** — 검색 스니펫에 따르면 "사용자별로 스코프된 테이블 + 커넥션 풀링을 쓰는 중앙 인스턴스는 (이 용도에) 처음부터 성립하지 않았다"는 취지의 서술이 있다. 이미 스택에 있고 신뢰하던 PlanetScale의 **중앙 집중 모델이 격리 요구사항과 맞지 않았다**는 것.
- **AI 생성 SQL은 신뢰하지 않는다는 전제** — ***"Poke의 사용자는 AI 에이전트를 통해 웹사이트를 만들고, 에이전트는 항상 최적의 SQL을 만들어내지는 않는다"***는 문제의식이 출발점. 잘못된 쿼리 한 줄이 커넥션 풀을 포화시킬 수 있다는 리스크를 감수할 수 없었다고 밝힌다.
- **격리의 이유 — "한 사이트가 아니라 플랫폼 전체가 느려진다"** — 공유 DB에서 CPU를 잡아먹는 쿼리는 ***그 사이트 하나만 느리게 만드는 게 아니라, 플랫폼 위 모든 사용자의 경험을 저하시킨다***는 게 이들이 명시한 근거. 그래서 격리 단위를 "사용자"가 아니라 "생성된 아티팩트(사이트) 하나하나"로 잡았다.
- **후보 비교 후 Turso 채택** — Neon·Supabase·Cloudflare·PlanetScale을 검토했고, **서버리스·DB당 프로비저닝 모델**이 이 용도에 가장 맞다고 판단해 Turso를 골랐다.
- **프로비저닝 시점** — AI 에이전트가 사이트를 빌드하기 시작하는 순간 DB가 생성되고, Vercel에 배포되기 전에 환경변수로 연결된다 — 사용자는 "DB를 만든다"는 결정을 내린 적도 인지한 적도 없다(제목의 "Without Them Ever Knowing").
- **비용 구조** — 트래픽이 거의 없는 대다수 사이트에 대해 유휴 비용이 0에 가깝게 유지되도록 설계했다는 취지(작은 SQLite 호환 DB를 프로그래밍 방식으로 대량 생성·사용량 기반 운영).

## 인상 깊은 문장

> "Poke's users generate websites through an AI agent, and agents are not always going to produce optimal SQL. One badly-written query can saturate the connection pool... A query that hammers CPU on a shared database doesn't just slow down one website. It degrades the experience for everyone on the platform."
> (WebSearch가 따옴표로 반환한 스니펫 — 원문 그대로일 가능성이 높으나 전문 대조는 못했다.)

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 hada 댓글 수·논조 확인 불가.
- **HN/Lobsters**: 이번 세션에서 별도 스레드 존재 여부를 확인하지 못했다 — WebSearch 결과에 해당 큐레이션 신호가 잡히지 않았다. 큐레이션 유무를 "확인 불가"로 남긴다.
- **이해관계 명시**: 이 글은 **Turso 자사 블로그**가 자사 고객 사례(Poke)를 소개하는 세일즈성 콘텐츠다. "격리 덕분에 문제가 없었다"는 서술이 있다면 그 자체가 Turso의 셀링포인트와 정확히 일치하는 방향이라, 실패 사례나 비용 증가 같은 반대급부는 이 글(혹은 이 글의 스니펫)에 나오지 않는다는 점을 감안해야 한다. n=1 고객 사례.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-04-27-ai-agent-deleted-production-database]]가 보여준 사고의 정확히 반대편 설계

가든에 이미 있는 "AI 에이전트가 프로덕션 DB를 9초 만에 삭제한" 사고 노트는 **에이전트가 공유된 프로덕션 자원에 직접 닿을 수 있었고, 백업조차 같은 볼륨에 묶여 있었다**는 게 사고의 핵심 구조였다. 이번 Turso/Poke 사례는 그 실패를 사전에 설계로 차단한 형태로 읽을 수 있다 — "에이전트가 실수할 수 있다"는 같은 전제에서 출발하지만, 한쪽은 사후에 사고로 배운 교훈이고 다른 한쪽은 **처음부터 blast radius를 아티팩트 단위로 미리 좁혀둔 사전 설계**다. 두 노트를 나란히 두면 "에이전트가 만든 코드/쿼리를 신뢰하지 않는다"는 원칙이 실무에서 두 가지 다른 시점(사후 대응 vs 사전 격리)으로 나타난다는 게 보인다.

### 핵심 전이 2 — "SQLite를 가벼운 격리 단위로 쓴다"는 점에서 [[2026-08-25-sqlite-for-everything]]과 결이 겹치지만 방향은 다르다

그 노트의 SQLite는 **한 애플리케이션 프로세스 안에서** 여러 역할(검색·캐시·벡터 인덱스)을 흡수해 서버를 없애는 쪽이었다. Turso의 SQLite 호환 DB는 반대로 **테넌트(사이트)마다 하나씩 클라우드에 흩뿌리는** 용도로 쓰인다 — "가볍고 프로그래밍 방식으로 빠르게 만들 수 있다"는 SQLite의 같은 성질이, 한쪽에서는 "서버를 없애는" 방향으로, 다른 한쪽에서는 "격리 단위를 잘게 쪼개는" 방향으로 쓰인다는 대비가 흥미롭다. 억지로 같은 결론으로 묶지는 않는다 — 공유하는 건 "SQLite의 가벼움을 building block으로 쓴다"는 재료뿐이고, 그 재료로 짓는 아키텍처의 목적은 서로 다르다.

## 호스피탈리티 / CRS 적용 포인트

- **파트너 호텔·채널별 샌드박스 격리에 원칙적으로 참고할 만하다.** CRS가 파트너사 커스텀 스크립트나 AI가 생성한 요금 규칙 초안을 실행/검증하는 실험적 영역을 둔다면, "코어(재고·정산·PMS 연동)는 기존 안정 DB에, 실험적/생성된 로직의 데이터만 파트너별 경량 DB로 격리"하는 이 패턴을 그대로 참고할 수 있다 — **핵심은 "무엇을 신뢰하지 않는가에 따라 격리 단위를 나눈다"는 설계 원칙**이지, Turso라는 제품 자체가 아니다.
- **다만 CRS의 핵심 도메인(요금·재고·정산)은 애초에 AI가 자유롭게 생성한 SQL을 실행하는 영역이 아니다.** 이 글의 시나리오("AI가 즉흥적으로 만든 웹사이트")는 온다의 정산·재고처럼 정합성이 생명인 시스템과는 리스크 등급이 다르다 — 직접적인 도입보다는 "새로운 실험적 기능을 만들 때 코어와 격리한다"는 원칙 수준의 전이로 남겨둔다.

## 연관 자료

- [[2026-04-27-ai-agent-deleted-production-database]] — 에이전트가 공유 자원에 직접 접근해 낸 사고의 실제 사례. 이번 글의 사전 격리 설계가 정확히 이 사고 유형을 막는 방향.
- [[2026-08-25-sqlite-for-everything]] — SQLite(호환 DB)의 가벼움을 building block으로 쓴다는 재료는 같지만, "서버를 없앤다"(그 글) vs "격리 단위를 쪼갠다"(이 글)로 방향이 갈린다.

## 한 달 뒤 회고

*(2026-09-26 즈음: ①`turso.tech`·`news.hada.io` 접근이 풀리면 원문 전체와 hada 댓글 논조를 재대조할 것. ②"DB당 유휴 비용 0에 가깝다"는 주장이 실제 대량 테넌트 상황에서도 유지되는지 후속 보도가 있었는지. ③온다 내부에서 파트너별/실험 기능별 데이터 격리 원칙을 실제로 검토했는지.)*
