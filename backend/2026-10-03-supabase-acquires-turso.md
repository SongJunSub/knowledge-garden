---
title: "Supabase, Turso 인수 발표 — '초당 데이터베이스 하나' 시대, 에이전트가 테넌트 단위로 만들고 버리는 DB에 올라타다"
source_title: "Supabase raises $150M and acquires Turso"
source_url: "https://www.tipranks.com/news/private-companies/supabase-raises-150-million-and-acquires-turso-to-scale-agentic-database-infrastructure"
source_name: "복수 매체(TipRanks·SiliconANGLE·KuCoin News 등) 종합"
referrer_url: "https://news.hada.io/topic?id=34676"
published_at: "2026-10-02"
summarized_at: "2026-10-03"
category: "backend"
tags: ["supabase", "turso", "sqlite", "postgres", "database-per-tenant", "agentic-infrastructure", "acquisition", "libsql"]
---

# Supabase, Turso 인수 발표

> 출처: [Supabase raises $150M and acquires Turso](https://www.tipranks.com/news/private-companies/supabase-raises-150-million-and-acquires-turso-to-scale-agentic-database-infrastructure) (TipRanks 등 복수 매체 종합) · GeekNews(id=34676) 경유 · 정리일 2026-10-03

> **출처 한계**: `news.hada.io`·Supabase/Turso 공식 블로그 모두 이 세션 egress 정책으로 직접 열람하지 못했다. 아래는 TipRanks·SiliconANGLE·KuCoin News·mezha.net·ventureburn 등 복수 2차 보도와 GitHub에 미러된 Hacker News 일일 다이제스트(`meixger/hackernews-daily` 이슈)를 교차 확인해 재구성했다 — 핵심 수치(매주 100만+ DB, 신규 DB 70%가 에이전트 생성)는 여러 매체에서 일관되게 반복돼 신뢰도가 상대적으로 높다고 판단하지만, 전부 같은 Supabase 보도자료를 인용한 것이라 **독립 검증은 아니다**.

## 한 줄 요약

**Supabase가 1억 5천만 달러 투자(GIC 주도)를 받으며 동시에 Turso(SQLite 기반 libSQL 서버리스 DB)를 인수했다 — AI 에이전트가 매주 만들어내는 수많은 앱·프로토타입마다 전용 데이터베이스를 파일처럼 가볍게 찍어내고 버리는 수요를 Postgres(Supabase)와 SQLite(Turso) 두 축으로 함께 감당하겠다는 선언이다.**

## 핵심 포인트

- **규모** — Supabase는 매주 100만 명 이상의 신규 사용자와 400만 개 이상의 데이터베이스를 만들어내고 있으며, 그중 ***약 70%는 에이전트나 AI 도구가 생성***한다고 밝혔다. "작은 작업마다 전용 서버를 두는 대신 파일처럼 쉽고 저렴하게 DB를 만든다"는 지향이 이번 인수의 명분이다.
- **역할 분리는 유지** — Supabase는 계속 Postgres를 중심에 두고, Turso는 계속 SQLite(libSQL)에 집중한다. 기존 데이터베이스·API·워크플로는 그대로 유지되며, Turso Database는 오픈소스 상태를 유지한다고 공지됐다.
- **리더십** — Turso 창업자 Glauber Costa가 Supabase의 Head of Agentic Services로 합류한다.
- **투자 맥락** — 이번 1.5억 달러는 4개월 전 있었던 5억 달러 Series F에 이어지는 라운드로, GIC가 주도하고 CapitalG·IronArc·SquarePeg가 참여했으며 직원 지분 유동화(secondary)도 포함된다고 보도됐다.
- **작은 작업은 SQLite, 성장하면 Postgres** — Slack 발췌와 보도 모두에서 반복되는 그림은 "가볍게 시작할 땐 테넌트별 SQLite, 트래픽이 커지면 Postgres로 이전"하는 단계적 아키텍처다.
- **HN 반응 규모** — GitHub에 미러된 Hacker News 일일 다이제스트에서 "Supabase acquiring Turso" 항목이 ***197점·103댓글***로 집계됐다(다이제스트 저장소 경유 확인, hada 자체 댓글 수는 별도 미확인).

## 인상 깊은 문장

> "roughly 70% of new databases created by agents or AI-driven tools"
> (KuCoin News 등 복수 매체 재인용 — Supabase 측 발표 인용이지 1차 원문 대조는 아니다.)

## 댓글

**hada 댓글 수·논조는 확인 불가**(`news.hada.io` 접근 차단). HN에서는 ***197점·103댓글*** 규모의 토론이 있었던 것으로 확인됐고, WebSearch로 잡힌 논조는 다음과 같다.

- **기존 Turso 고객의 불확실성** — "이게 기존 Turso 사용자에게 뭘 의미하는지 모르겠다"는 반응.
- **시장 집중 우려** — Supabase·Neon이 Postgres를 독점하는 건 아니지만(AWS·Google·Azure가 더 많이 호스팅), 소규모 프로젝트의 "기본 DB"를 쥔 업체가 줄어드는 데 대한 불편함.
- **가격 리스크** — 높은 밸류에이션은 투자자에게 미래 수익에 대한 약속이고, 성장이 목표일 땐 무료 티어가 자본으로 유지되지만 ***목표가 마진으로 바뀌면 무료 티어·최저가 유료 플랜이 스프레드시트에서 가장 먼저 방어선을 잃는 항목***이라는 지적.
- **기술 통합 리스크** — SQLite 기반 아키텍처를 Postgres 중심 플랫폼에 통합하는 데 실제 기술적 리스크가 있다 — 일관성·지연시간·스키마 유연성에서 서로 다른 트레이드오프를 택한 두 DB가 같은 캡 테이블에 들어갔다고 그 차이가 사라지지는 않는다는 지적.
- **"70%" 통계의 품질 의문** — 그 수치 중 **실제 과금되는 사용**과 **코딩 에이전트 데모가 만드는 무료 티어 잡음**의 비율이 얼마인지에 대한 분석가들의 의문.
- **읽을 때 감안** — 보도 대부분이 같은 Supabase 보도자료를 인용하는 구조라, "70% 에이전트 생성"·"매주 100만 사용자" 같은 핵심 수치는 자사 발표 그대로이고 독립 집계가 아니다.

## 내 생각 · 적용점

### 핵심 전이 1 — 인수 대상이 이미 가든에 있던 "테넌트당 DB 하나" 사례의 당사자다

[[2026-08-26-turso-db-per-ai-generated-site]]에서 다뤘던 "Poke가 AI로 만든 사이트마다 Turso DB를 하나씩 프로비저닝한다"는 사례는, Turso 자신이 "AI 에이전트가 만드는 SQL은 믿을 수 없으니 블라스트 레이디어스를 아티팩트 단위로 좁힌다"는 설계 철학을 입증하려던 **자사 고객 사례 소개**였다. 이번 인수 보도의 "매주 400만 DB, 70%가 에이전트 생성"이라는 숫자는 그 사례가 **n=1 고객이 아니라 업계 전체 패턴이라는 주장**으로 확장된 것이다. 다만 둘 다 결국 Turso/Supabase 자사 발표에서 나온 숫자라는 점은 같다 — 검증 수준이 올라간 건 아니다.

### 핵심 전이 2 — [[2026-08-25-sqlite-for-everything]]의 "가벼움"이 이번엔 "비즈니스 모델"로 흡수된다

그 노트에서 SQLite의 가벼움은 "서버를 없앤다"는 엔지니어링 선택이었다. 이번 인수는 같은 가벼움을 **"초당 DB 하나를 찍어내는 과금 단위"로 제품화**한 것이다 — 가벼움이 기술적 미덕에서 비즈니스 스케일의 재료로 넘어가는 지점을 보여준다.

### 핵심 전이 3 — [[2026-07-20-supabase-state-of-startups-2026]]가 그린 "Anthropic·Supabase가 도구층을 장악한다"는 그림의 다음 수순

그 설문에서 Supabase는 이미 창업자 스택의 중심(Auth 72%, 호스팅 65%)이었고, "에이전트 배포는 늘지만 운영 인프라는 미성숙"이라는 격차가 지적됐다. 이번 Turso 인수는 정확히 그 격차 중 하나(에이전트별 격리 DB 인프라)를 Supabase가 **인수로 직접 메우겠다는 선언**으로 읽힌다 — 자체 개발이 아니라 이미 그 문제를 풀어본 회사를 사는 길을 택했다.

## 호스피탈리티 / CRS 적용 포인트

- **"테넌트별 경량 DB 격리"는 여전히 CRS 핵심 도메인(요금·재고·정산)과는 거리가 멀다.** [[2026-08-26-turso-db-per-ai-generated-site]]에서 남긴 원칙(코어는 안정 DB에, 실험적/생성 로직의 데이터만 격리)이 그대로 유지된다 — 이번 인수는 그 원칙의 시장 확산을 보여줄 뿐, 새로운 CRS 적용점을 추가하지는 않는다.
- **벤더 선택 시 참고할 신호**: "무료 티어는 성장기 자본으로 유지되고 마진 전환 시 가장 먼저 깎인다"는 HN 비판은, 파트너사가 저가 서버리스 DB/BaaS에 핵심 연동을 올릴 때 **가격 정책이 투자 라운드에 종속될 수 있다**는 걸 벤더 리스크 평가에 반영할 만한 일반 원칙이다.

## 연관 자료

- [[2026-08-26-turso-db-per-ai-generated-site]] — 이번에 인수된 Turso가 "AI가 만든 사이트마다 DB 하나"를 설계 철학으로 소개한 선행 사례, n=1 고객 사례가 업계 패턴 주장으로 확장됨
- [[2026-08-25-sqlite-for-everything]] — SQLite의 "가벼움"이 엔지니어링 선택에서 과금 단위(비즈니스 모델)로 넘어가는 대비
- [[2026-07-20-supabase-state-of-startups-2026]] — Supabase가 이미 창업자 스택을 장악했다는 설문, "에이전트는 배포되나 운영 인프라는 미성숙"이라는 격차를 이번 인수가 메우려는 수순

## 한 달 뒤 회고

*(2026-11-03 즈음 — ①Supabase/Turso 공식 블로그 원문을 직접 대조했는지, ②"70% 에이전트 생성" 수치 중 실제 과금 비중이 후속 보도로 밝혀졌는지, ③기존 Turso 고객 이관·가격 변경이 실제로 발생했는지, ④SQLite-Postgres 통합의 기술적 리스크(일관성·지연시간)가 구체적 장애로 드러났는지 점검.)*
