---
title: "Actually Queryable Executables — SELF의 웹서버 예제 self-httpd (Farid Zakaria) — 페이지·방문 기록·버튼 클릭이 전부 한 SQLite 실행 파일의 행이다"
source_title: "Actually Queryable Executables"
source_url: "https://fzakaria.com/2026/08/24/actually-queryable-executables"
source_name: "fzakaria.com (Farid Zakaria)"
referrer_url: "https://news.hada.io/topic?id=32922"
published_at: "2026-08-24"
summarized_at: "2026-08-27"
category: "engineering"
tags: ["sqlite", "self-format", "binfmt-misc", "prototype", "systems-programming", "web-server"]
---

# Actually Queryable Executables — SELF의 웹서버 예제 self-httpd (Farid Zakaria)

> 출처: [Actually Queryable Executables](https://fzakaria.com/2026/08/24/actually-queryable-executables) (fzakaria.com · Farid Zakaria) · 정리일 2026-08-27
> **출처 한계**: `fzakaria.com`·`news.hada.io` 모두 이 세션에서 egress 차단으로 직접 접근 불가(web.archive.org 경유도 이 세션에서 불가). WebSearch 스니펫으로 재구성했으며 `self-httpd`가 `routes`·`visits`·`presses` 세 테이블을 쓴다는 것, `selfdb.exe.xyz`에 라이브 데모가 있다는 것은 여러 스니펫에서 교차 확인했지만 저자의 원문 서술(동기·톤)은 그대로 인용하지 못했다. **GeekNews 원문(id=32922)이 이 특정 후속 글을 가리키는지도 URL 직접 대조는 못 했다** — Slack 발췌의 "routes, visits, presses 테이블" 세부 묘사가 [[2026-08-25-self-sqlite-executable-file-format]]이 다룬 원글(2026-08-23자 "Your executable is a SQLite database")에는 없고 이 후속 글(2026-08-24자)에만 있다는 정황 근거로 이 URL을 골랐다. 이 대응이 틀렸을 가능성을 열어둔다.

## 한 줄 요약

**같은 SELF(SQLite를 실행 파일로 쓰는 포맷) 프로젝트의 저자가 후속 글에서, 그 아이디어를 실제로 돌아가는 미니 웹서버 `self-httpd`로 밀어붙인다. `self-httpd`는 자기 자신(`argv[0]`)을 SQLite DB로 열어, `routes` 테이블에서 페이지 콘텐츠를 읽어 서빙하고, `visits` 테이블에 방문 기록을, `presses` 테이블에 버튼 클릭 결과를 기록한다. ***콘텐츠를 고치는 것도 배포하는 것도 별도 빌드·재시작이 아니라 그 실행 파일 자체에 대한 `UPDATE` SQL 문 한 줄***이다 — 프로그램과 웹사이트와 방문 로그와 애플리케이션 상태가 전부 같은 한 파일 안의 서로 다른 테이블일 뿐이다.**

## 핵심 포인트

- **전제** — [[2026-08-25-self-sqlite-executable-file-format]]이 다룬 SELF 포맷: SQLite 헤더의 `application_id`에 매직 값을 심으면 Linux `binfmt_misc`가 감지해 전용 인터프리터를 실행하고, 그 인터프리터가 `segments` 테이블을 메모리에 매핑해 진입점으로 점프한다.
- **`self-httpd`의 확장** — 이 실행 가능한 DB 파일 안에 애플리케이션 고유 테이블(`routes`·`visits`·`presses`)을 추가로 두어, 실행 코드뿐 아니라 **서빙할 콘텐츠와 그 콘텐츠가 만들어낸 상태(방문·클릭)까지 같은 파일에 저장**한다.
- **`routes` 테이블** — 요청 경로별로 서빙할 콘텐츠를 저장. 라이브 사이트 수정이 파일 교체·재배포가 아니라 이 테이블에 대한 `UPDATE` 쿼리.
- **`visits` 테이블** — 페이지 요청 기록. WebSearch로 확인된 예시 쿼리 형태로 `SELECT count(*) AS n, path FROM visits GROUP BY path`처럼 방문 통계를 SQL로 바로 뽑을 수 있다.
- **`presses` 테이블** — 버튼 클릭 등 인터랙션 결과 기록(id·시각·버튼 식별자 컬럼 구조로 추정).
- **라이브 데모** — `selfdb.exe.xyz`에서 실제로 이 서버가 돌아가는 것으로 확인됨(WebSearch 스니펫 기준). "한 파일이 곧 웹사이트·프로그램·방문 로그·상태"라는 문구가 이 데모를 설명하는 표현으로 등장한다.

## 인상 깊은 문장

> "self-httpd is a webserver whose pages, program and visitor log are one file... it opens argv[0] as a database and serves out of its own routes table; editing the live site is an UPDATE."
> (WebSearch 스니펫에서 확인 — 원문 그대로인지 재구성인지 완전히 단정하기는 어렵지만 여러 검색 결과에 동일 문구로 반복 등장해 원문 인용에 가깝다고 판단. "배포"라는 개념 자체를 SQL 문장으로 축소한 부분이 이 글의 핵심을 가장 압축적으로 보여준다.)

## 댓글

- **hada 댓글 수·논조 확인 불가** — `news.hada.io` 차단.
- **[[2026-08-25-self-sqlite-executable-file-format]]에서 이미 확인된 원글 반응**(GitHub 276 stars, HN·Tildes·Simon Willison 링크블로그 동시 언급)이 이 후속 글에도 이어졌을 가능성이 높으나, 이 후속 글 자체의 반응은 별도로 확인하지 못했다.
- **읽을 때 감안**: 원글 노트가 이미 짚었듯 이건 극도로 실험적인 프로토타입이다. `self-httpd`도 "재미있는 개념 증명"이지 프로덕션 웹서버 대안으로 제시된 것이 아니다 — 동시 쓰기 트랜잭션, 캐시, 정적 자산 서빙 성능 같은 실무 질문은 이 발췌 수준에서는 전혀 다뤄지지 않는다.

## 내 생각 · 적용점

### 핵심 전이 — 원글의 "실행 파일이지만 쿼리 가능하다"는 명제가 "웹서버지만 그 서버의 상태 자체가 쿼리 가능하다"로 한 단계 더 나아간다

[[2026-08-25-self-sqlite-executable-file-format]]의 핵심 전이는 SELF가 "파일이지만 쿼리 가능하다"([[2026-05-08-sqlite-loc-recommended-storage-format]])는 명제를 실행 아티팩트로 확장했다는 것이었다. `self-httpd`는 그 확장을 한 겹 더 쌓는다 — 이번엔 **실행 중인 서버가 만들어내는 런타임 상태(방문 로그, 클릭 이벤트)조차 별도 저장소(로그 파일, 분석 DB, 세션 스토어) 없이 같은 파일의 테이블**이다. 보통 시스템에서 "코드"·"콘텐츠"·"관측 데이터"는 각각 다른 계층(배포 아티팩트, CMS, 로그 파이프라인)에 흩어져 사는데, `self-httpd`는 그 세 계층을 SQLite 트랜잭션 하나로 합친다. `SELECT count(*) AS n, path FROM visits GROUP BY path` 한 줄이 곧 트래픽 분석이라는 건, 이 배치의 다른 두 글(com2us Hive 애널리틱스)이 "방문·클릭을 집계해서 보려면 별도 분석 플랫폼과 이벤트 파이프라인이 필요하다"고 전제하는 것과 정확히 대조되는 극단적 반례다 — 물론 그 대가로 확장성·다중 프로세스 동시성 같은 걸 전부 포기한 장난감이라는 게 원글 노트가 짚은 한계와 같다.

## 호스피탈리티 / CRS 적용 포인트

이 글도 원글과 마찬가지로 **매우 실험적인 로우레벨 프로토타입**이라 CRS 실무에 직접 옮길 만한 조언은 없다. 억지로 끌어오지 않고 원칙만 남기면: **"콘텐츠·상태·관측 데이터를 별도 시스템으로 쪼개는 것이 항상 기본값일 필요는 없다"**는 관점 자체는 소규모 내부 도구(파트너 온보딩 상태를 추적하는 사내 대시보드 같은 것)를 만들 때 참고할 만하다 — 다만 이건 `self-httpd`의 결론이라기보다 그 아이디어에서 CRS가 아주 조금 되돌려 쓸 수 있는 원칙일 뿐이다. **직접 적용은 멀다.**

## 연관 자료
- [[2026-08-25-self-sqlite-executable-file-format]] — 같은 저자·같은 프로젝트(SELF)의 원글. 포맷·`binfmt_misc` 메커니즘 자체를 다룬 글이고, 이 노트는 그 위에 지은 웹서버 예제를 다룸
- [[2026-05-08-sqlite-loc-recommended-storage-format]] — "SQLite=애플리케이션 파일 포맷"이라는 명제의 원조
- [[2026-08-20-hive-common-metric-standard]] · [[2026-08-27-com2us-hive-test-data-filter]] — 같은 "방문·이벤트를 어떻게 집계하는가" 문제를 정반대 극단(전용 분석 플랫폼 vs 파일 하나)에서 푸는 대조군

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①`fzakaria.com`·GeekNews 접근이 풀리면 이 노트의 URL 대응 추정이 맞았는지 원문으로 확인 ②`self-httpd`가 GitHub 저장소에서 실제로 어떻게 구현됐는지(동시성 처리, 세션 관리) 코드 레벨로 확인 ③selfdb 프로젝트의 star 수·활동이 어떻게 바뀌었는지.)*
