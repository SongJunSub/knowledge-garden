---
title: "ClickHouse 오픈소스 10년 — '처음부터 자체 구현'과 'Level 3 오픈소스'의 10년 인내 (장인·오픈소스·통제권 라인)"
source_title: "10 Years of ClickHouse Open Source"
source_url: "https://clickhouse.com/blog/open-source-10"
source_name: "ClickHouse · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30671"
published_at: "2026-06-16"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["clickhouse", "open-source", "from-scratch", "level-3-open-source", "long-term", "control", "craft-line"]
---

# ClickHouse 오픈소스 10년 — '처음부터 자체 구현'과 'Level 3 오픈소스'의 10년 인내 (장인·오픈소스·통제권 라인)

> 출처: ClickHouse (GeekNews 경유) · 정리일 2026-06-08
> ※ DB 기술 스펙은 가볍게, *오픈소스 철학·자체 구현·통제권·10년 인내* 전이 주제 중심.

## 한 줄 요약

**ClickHouse(2016-06 공개, *2,000명+ 기여*)의 오픈소스 10년 회고. 핵심: ***단순 코드 공개를 넘어 "기여 가이드·코드 리뷰·로드맵·CI·릴리스·문서"까지 공개하는 "Level 3 오픈소스"***를 지향. ***기존 DB 기반이 아니라 2009년부터 처음부터 독립 구축*** — *웹 분석 시스템의 MySQL 한계 → OLAPServer·Metrage → MergeTree 설계*로 진화. *SQL 파서·압축·서버·클라이언트 모두 자체 구현*. *2014년 프로덕션에서 매일 수천억 레코드 처리*로 안정성 입증, *CERN LHCb 실험에도 배포*.**

## 핵심 포인트 (전이 주제 중심)

- **처음부터 자체 구현** — *기존 DB가 아니라 2009년부터 독립 구축, SQL 파서·압축·서버까지*. **[[2026-06-08-sqlite-richard-hipp-interview]] *"도구를 직접 만드는 자유"*·[[2026-06-08-reuse-less-software]] *"의존성 최소화"*와 정합** — *통제권을 위한 자체 구현*.
- **"Level 3 오픈소스"** — *코드뿐 아니라 가이드·리뷰·로드맵·CI·릴리스·문서까지 공개*. **[[2026-06-08-open-source-ai-must-win]] *"진짜 오픈소스 = 재현·감사 가능"*의 실천** — *투명성의 단계*.
- **10년 인내·점진 진화** — *프로토타입(OLAPServer)→Metrage→MergeTree*. **[[2026-06-08-project-valhalla-jdk28]] *"큰 변화는 10년"*·SQLite 26년과 같은 줄기**.

## 인상 깊은 문장

> "Level 3 open source: we publish not just code, but contribution guides, reviews, roadmap, CI, releases, and docs."
> (Level 3 오픈소스: 우리는 코드뿐 아니라 기여 가이드·리뷰·로드맵·CI·릴리스·문서까지 공개한다.)

## HN 토론 (댓글 전수 확인 — 전이 논점)

> GN⁺가 HN을 큐레이션 + kaydash 직댓글. **확인:**
- *kaydash: "PostgreSQL 만한 게 없지 않나"*.
- ***"2017년 발견·Elasticsearch 대체 PoC가 몇 주 만에 5배 좋아짐·관리자가 '러시아인이 만든 DB'라 거절"*** → *"ClickHouse로 운영 60%↓·질의 300~500ms→75ms·월 수백만$ 저장이 수천$로"*.
- *TimescaleDB·Druid+Postgres+Trino를 ClickHouse 하나로 대체·"훨씬 빠르고 유지보수 적음"*.
- ***"DuckDB를 뺀 게 흥미"·"MergeTree가 ClickHouse의 핵심 장점(색인 없는 열도 10배 빠름)"***.
- ***"'웹 분석 시스템'이 실제로는 Yandex였다는 걸 말하기 꺼리는 점이 아쉬움"***·*"풀 CI가 커밋당 ~400시간"(테스트 규율)*.

→ **무게중심**: *(1) **실전 성능·비용 절감 사례 압도적**(5배·60%↓). (2) **"러시아/Yandex 출신"이라는 지정학적 거부감**(관리자 거절·Yandex 회피). (3) **MergeTree·자체 구현이 핵심 장점**. (4) **커밋당 400시간 CI**의 테스트 규율.*

## 내 생각 · 적용점

### 5번째 라인업 *장인·오픈소스·통제권 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *오픈소스 철학·장인정신*. 라인 자산(카운팅 무관). [[2026-06-08-sqlite-richard-hipp-interview]]·[[2026-06-08-carmack-admires-bellard]]와 *장인 클러스터*. 부채 *−1 유지* (53:42 ≈ 1.27:1).

### 핵심 전이 1 — "처음부터 자체 구현 = 통제권"

가장 전이력 높은 철학: ***기존 기반에 얹지 않고 처음부터 자체 구현하면, 설계·성능·방향을 완전히 통제***. 이는 [[2026-06-08-sqlite-richard-hipp-interview]] *"도구를 직접 만드는 자유"*·[[2026-06-01-my-software-north-star]] *통제권*과 정합 — **의존을 줄이고 핵심을 직접 소유하는 것이 장기 자유**. 단 *모든 걸 자체 구현하라는 게 아니라(reinvent 비용), "핵심 차별점은 직접 통제"*([[2026-06-08-reuse-less-software]] 균형).

### 핵심 전이 2 — "Level 3 오픈소스" = 투명성의 단계

*코드뿐 아니라 로드맵·CI·리뷰까지 공개*는 [[2026-06-08-open-source-ai-must-win]] *"진짜 오픈소스 = 재현·감사 가능"*의 모범 — **"오픈"에도 단계가 있고, 거버넌스·과정까지 투명한 게 진짜**. 사용자의 knowledge-garden·개인 프로젝트도 *"과정(큐레이션 로직·연결)까지 공개"*가 Level 3.

### 핵심 전이 3 — "10년 인내 + 테스트 규율"

*MergeTree까지 점진 진화·커밋당 400시간 CI*는 [[2026-06-08-project-valhalla-jdk28]] *"큰 변화는 10년"*·[[2026-06-08-sqlite-richard-hipp-interview]] *DO-178B 테스트*와 같은 줄기 — **신뢰받는 인프라는 "10년 인내 + 철저한 테스트"에서**. stock-autotrader·CRS 같은 신뢰 중요 시스템에 직접 적용.

### 지정학 메모

*"러시아/Yandex 출신 거부감"*은 [[2026-06-08-skt-at-center-of-fable-controversy]] *AI 지정학*과 같은 시대 신호 — *기술의 출신이 채택을 좌우*. 통제권·오픈소스가 그 리스크의 헤지.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *장인·오픈소스·통제권 라인* 사례(장인 클러스터). 부채 *−1 유지* (53:42).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- ClickHouse (원문) · [GeekNews — 30671](https://news.hada.io/topic?id=30671)
- [[2026-06-08-sqlite-richard-hipp-interview]]·[[2026-06-08-carmack-admires-bellard]] — *"자체 구현·장인정신"(장인 클러스터)*
- [[2026-06-08-open-source-ai-must-win]] — *"Level 3 = 재현·감사 가능"(진짜 오픈소스)*
- [[2026-06-08-project-valhalla-jdk28]] — *"10년 인내·점진 진화"*
- [[2026-06-01-my-software-north-star]]·[[2026-06-08-reuse-less-software]] — *"통제권·의존성 최소화"*
- [[2026-06-08-skt-at-center-of-fable-controversy]] — *"기술 출신의 지정학(채택 거부감)"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "처음부터 자체 구현=통제권"·"10년 인내+테스트"를 장기 프로젝트에 적용했는지, knowledge-garden을 "Level 3(과정까지 공개)"로 운영했는지 기록.)*
