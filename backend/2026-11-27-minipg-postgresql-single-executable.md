---
title: "minipg: PostgreSQL을 단일 실행 파일로 실행하기 (GeekNews) — SQLite처럼 쓰는 PostgreSQL, 서버 설치와 Docker 없이 .pgdb 폴더 하나로"
source_title: "minipg: Run PostgreSQL as a single executable"
source_url: "https://news.hada.io/topic?id=37897"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37897&utm_source=slack&utm_medium=bot&utm_campaign=T02M82VMZ"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "backend"
tags: ["postgresql", "sqlite-pattern", "developer-tools", "local-development", "self-hosting"]
---

# minipg: PostgreSQL을 단일 실행 파일로 실행하기 (GeekNews)

> 출처: [minipg](https://news.hada.io/topic?id=37897) (GeekNews) · 정리일 2026-11-27

> **출처 한계**: `news.hada.io`가 egress 차단되어 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 `progrium/minipg` GitHub 저장소를 찾아 "PostgreSQL을 단일 실행 파일로 실행"한다는 공식 설명과 `.pgdb` 폴더, `minipg run app.pgdb -- npm start` 같은 사용법을 교차확인했다 — Slack 발췌와 일치한다. 단, PyPI에 동명의 전혀 다른 Python 드라이버 패키지("minipg")도 존재해 혼동하지 않도록 주의가 필요하다.

## 한 줄 요약

**minipg는 명령어 하나로 PostgreSQL을 켜고 끄는 단일 실행 파일로, SQLite를 쓰는 것과 똑같은 경험으로 실제 PostgreSQL 서버·클라이언트를 로컬에서 Docker 없이 실행하게 해준다.**

## 핵심 포인트

- **명령으로 시작·자동 종료** — 서버가 필요하면 명령으로 자동 시작하고, ***유휴 상태가 되면 종료***되는 온디맨드 방식.
- **`.pgdb` 디렉터리 하나에 전부 보관** — 데이터, 설정, 인증 정보, Postgres 버전까지 한 디렉터리에 함께 보관하며, 그 디렉터리를 열어 `psql` 셸을 바로 쓸 수 있다. SQLite 파일 하나로 DB를 다루는 멘탈 모델을 PostgreSQL에 그대로 가져온 것.
- **실제 PostgreSQL 서버·클라이언트를 실행 파일에 내장** — Docker 없이 사용하며, `minipg run app.pgdb -- npm start`처럼 앱을 실행하면 DB 접속 정보도 자동 설정된다는 것이 WebSearch로 확인됨(최신 릴리스는 Postgres 18을 기본값으로 쓰고, 플래그로 다른 메이저 버전도 받아올 수 있다).
- **타깃 사용처**: 로컬 개발, 자동화 테스트, PostgreSQL이 필요한 셀프호스팅 앱 — Docker 설치나 별도 서버 설정 없이 "진짜 Postgres"가 필요한 상황을 노린다.
- **유사 프로젝트군 존재** — WebSearch 결과 `pg0`(vectorize-io, 다운로드·관리형 단일 바이너리), `pgdb`(onetonfoot, 테스트용 단일 바이너리) 등 같은 발상의 경쟁 도구가 여러 개 있다 — "PostgreSQL을 SQLite처럼 쓰고 싶다"는 수요가 한 팀만의 아이디어가 아니라는 뜻.

## 인상 깊은 문장

> "No server setup, no Docker." — progrium/minipg GitHub 릴리스 설명 (WebSearch로 확인).

## 댓글

GeekNews 댓글 수·반응 확인 불가(egress 차단). HN/Lobsters 등 외부 큐레이션 존재 여부도 미확인.

## 내 생각 · 적용점

### 핵심 전이 — "단일 실행 파일화"라는 이번 배치의 반복 축

같은 배치의 [[2026-11-27-tidy-rust-prettier-formatter]](Node.js 없는 단일 실행 파일 포매터)와 같은 축이다. 둘 다 "무거운 런타임 의존성(Node.js, Docker/서버 설치)을 없애고 단일 바이너리로 압축한다"는 같은 설계 철학을 다른 도구 범주에서 반복한다. 이 레포에는 이미 `backend/2026-08-25-self-sqlite-executable-file-format.md`, `backend/2026-08-27-self-httpd-queryable-executable.md` 같은 "단일 실행 파일 패턴" 계열 노트가 쌓여 있어, minipg는 이 패턴을 SQLite가 아닌 PostgreSQL까지 확장한 사례로 자리매김한다.

### 적용점

로컬 개발 환경이나 CI에서 "진짜 PostgreSQL 기능(예: JSONB, 확장 기능)이 필요하지만 Docker는 과하다"고 느끼는 경우 바로 시도해볼 수 있는 대체재다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** CRS 통합 테스트나 로컬 개발 환경에서 실제 Postgres 기능 호환성을 빠르게 검증하고 싶을 때 Docker 설치 부담 없이 쓸 수 있는 보조 도구로 참고할 만하다. 프로덕션 환경과는 무관.

## 연관 자료

- [[2026-11-27-tidy-rust-prettier-formatter]] — 같은 배치, 같은 "무거운 런타임 제거" 철학의 다른 도구

## 한 달 뒤 회고

2026-12-27 즈음 — 실제 설치해 로컬 개발에 써보고, Docker 기반 Postgres 대비 체감 속도·안정성을 비교한다.
