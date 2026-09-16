---
title: "dbt Charts - AI와 대화로 만들고 Git으로 관리하는 대시보드 (dbt Labs) — 대시보드를 텍스트 파일로 만들어 버전관리·diff·PR 리뷰가 가능해진다는 게 핵심이지, AI 생성 자체는 부차적이다"
source_title: "Charts built for Chat"
source_url: "https://dbtcharts.com/"
source_name: "dbt Labs (GitHub: dbt-labs/dbt-charts)"
referrer_url: "https://news.hada.io/topic?id=33723"
published_at: "2026-09-14"
summarized_at: "2026-09-16"
category: "backend"
tags: ["대시보드as코드", "dbt", "데이터도구", "GeekNews"]
---

# dbt Charts - AI와 대화로 만들고 Git으로 관리하는 대시보드

> 출처: [Charts built for Chat](https://dbtcharts.com/) (dbt Labs) · 정리일 2026-09-16

## 한 줄 요약
**dbt Labs가 SQL로 데이터를 조회하고 선언적 YAML로 차트를 감싸는 오픈소스 대시보드 도구 dbt Charts를 공개했다 — 대시보드가 텍스트 파일이라 버전관리·diff·PR 리뷰가 가능해진다는 게 핵심이고, AI가 그 YAML을 대신 써준다는 건 부차적인 편의 기능이다.**

## 핵심 포인트
- ***2026-09-14 Apache-2.0으로 오픈소스 공개***, 호스팅 플랫폼 dbtCharts.com 퍼블릭 베타 동시 출시
- 핵심 설계: SQL로 "무엇을 볼지" 정의하고, 선언적 YAML로 "어떻게 보여줄지"만 감싸는 구조 — 대시보드가 텍스트 파일이라 ***버전관리·diff·PR 리뷰가 가능***
- AI 친화성: "YAML은 JS나 독점 BI 설정, 손으로 짠 SQL보다 AI가 정확히 쓰기 훨씬 쉽다"는 설계 철학 — 토큰을 적게 쓰면서 거버넌스 가능한 대시보드를 AI가 작성하게 하는 게 목표
- 기능 범위: ***16개 기본 차트 + 13개 시맨틱 차트***(롤리팝, 불릿, 퍼널, 스몰멀티플 등), HTML/PDF/PNG/SVG/JSON/터미널 등 다중 출력, `dct serve` 실시간 프리뷰 서버
- 기술 스택: Pydantic, Jinja2, Vega-Lite, FastAPI. DuckDB/SQLite 기본 지원 + Postgres/Snowflake/BigQuery/Redshift/Databricks/Spark/Trino 확장

## 인상 깊은 문장
> "Charts built for Chat" — 제품명 자체가 AI 대화 인터페이스를 1급 시민으로 취급한다는 선언.

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 게시됨(item id=49704246)에서 ***154 포인트, 47 댓글*** 확인 — GitHub README는 직접 접근해 기능 목록은 신뢰도 높게 확인했다. dbt Labs 자체 발표(벤더 홍보성 콘텐츠)이며, "narrow bars/off-screen elements 감지" 같은 AI 편집 세부 기능은 1차 블로그 접근 불가로 GeekNews 제목 문구 외 구체적으로 검증하지 못했다.

## 내 생각 · 적용점
BI 도구 시장의 오랜 문제(대시보드가 GUI에 갇혀 버전관리·리뷰가 안 됨)를 "대시보드도 코드다"라는 IaC식 발상으로 푸는 접근이다. AI가 YAML을 쓴다는 건 마케팅 포인트지만, 진짜 가치는 리뷰 가능한 텍스트 포맷 자체에 있다 — AI 생성 여부와 무관하게 **[[2026-09-13-dreeve-self-hosted-fitness-dashboard]]**류의 셀프호스팅 대시보드 도구들이 공통으로 추구하는 방향(운영 데이터를 코드처럼 다루기)과 같은 축이다.

## 호스피탈리티 / CRS 적용 포인트
점유율·매출 대시보드를 BI 툴 GUI에 가두지 않고 Git 저장소의 YAML로 관리하면, 대시보드 변경 이력을 PR로 리뷰하고 롤백할 수 있다는 점에서 온다 내부 운영 대시보드에 실험해볼 가치가 있다 — 단, 아직 퍼블릭 베타 단계라 프로덕션 채택은 이르다.

## 연관 자료
- [[2026-09-13-dreeve-self-hosted-fitness-dashboard]] — 같은 "대시보드를 코드/셀프호스팅으로 되찾는다"는 방향의 다른 도구

## 한 달 뒤 회고
2026-10-16 즈음, dbt Charts의 퍼블릭 베타가 정식 출시로 전환됐는지, 실사용 후기(특히 AI가 생성한 YAML의 오류율)가 나왔는지 점검.
