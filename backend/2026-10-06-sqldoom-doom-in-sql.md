---
title: "DOOMQL - 오리지널 Doom을 SQL로 포팅하기 (CedarDB, Lukas Vogel) — 게임 루프 전체를 VIEW 체인으로 짜면 데이터베이스가 그대로 게임 엔진이 된다"
source_title: "DOOMQL: A DOOM-like multiplayer shooter in pure SQL"
source_url: "https://www.cedardb.com/blog/doomql"
source_name: "CedarDB 블로그 (Lukas Vogel)"
referrer_url: "https://news.hada.io/topic?id=34815"
summarized_at: "2026-10-06"
category: "backend"
tags: ["cedardb", "sql", "sqlite-doom", "raycasting", "multiplayer", "game-engine", "가벼운-픽"]
---

# DOOMQL - 오리지널 Doom을 SQL로 포팅하기 (CedarDB, Lukas Vogel)

> 출처: [DOOMQL: A DOOM-like multiplayer shooter in pure SQL](https://www.cedardb.com/blog/doomql) (CedarDB 블로그 · Lukas Vogel) · GeekNews(id=34815) 경유 · 정리일 2026-10-06

> **출처 한계**: `news.hada.io`와 1차 출처인 `cedardb.com` 모두 이 세션의 egress 차단으로 직접 열지 못했다. The Register·Hackaday·Boing Boing·Yahoo Tech 등 2차 보도도 전부 같은 이유로 접근 불가였다. 이 노트는 **WebSearch 스니펫들을 교차확인**해 재구성한 것이다 — 프로젝트명이 GeekNews 제목은 "SQLDoom"이지만 실제 프로젝트명은 **DOOMQL**이라는 점, 작성자(Lukas Vogel, CedarDB 공동창업자), 아키텍처(테이블·VIEW·셸스크립트 게임루프·Python 클라이언트), 제작 기간(육아휴직 중 한 달), ~30FPS·128×64 해상도 수치는 복수 매체에서 일관되게 반복돼 신뢰도가 높다고 판단했다. 다만 **hada 댓글 수·HN/Lobsters 토론 여부는 전혀 확인하지 못했다** — "PASS"로 넘기지 않고 명시해둔다.

## 한 줄 요약

**CedarDB 공동창업자가 상태(테이블)·로직(VIEW)·입출력까지 전부 순수 SQL로 짜서 멀티플레이어 Doom 유사 슈터를 ~30FPS로 돌렸다 — 레이캐스팅부터 스프라이트 투영·HUD까지 "렌더링"이라는 절차적 코드의 영역을 선언적 VIEW 체인으로 완전히 대체했다는 점에서, 데이터베이스가 저장소가 아니라 그 자체로 게임 엔진의 런타임이 된 극단적 증명이다.**

## 핵심 포인트

- **상태는 전부 테이블** — `map`, `players`, `mobs`, `inputs`, `configs`, `sprites` 등 게임의 모든 상태가 테이블 행으로 존재한다.
- **렌더링은 VIEW 스택** — 레이캐스팅, 스프라이트 투영, 오클루전, HUD까지 ***전부 SQL VIEW의 체인***으로 구현했다. 절차적 루프 대신 선언적 쿼리로 한 프레임을 "계산"한다.
- **게임 루프 = 셸 스크립트** — 작은 셸 스크립트가 SQL 파일을 초당 약 30회 실행하는 것이 곧 게임 루프다.
- **클라이언트는 약 150줄 Python** — 입력을 폴링해 DB에 쓰고, DB에 쿼리를 던져 그 프레임의 3D 뷰를 받아오는 것이 클라이언트가 하는 일의 전부다. 렌더링 로직은 클라이언트에 없다.
- **멀티플레이어도 DB가 처리** — 동시 플레이어 동기화와 상태 관리를 CedarDB 쪽에서 그대로 처리한다. 별도 게임 서버 레이어가 없다.
- **성능과 제작 기간** — ~30FPS, 128×64 해상도(WebSearch 교차확인 수치, 원문 표현과 완전히 일치하는지는 미대조). Vogel이 ***육아휴직 중 한 달***, 수면 부족한 밤들을 들여 만들었다고 밝힌 것으로 다수 매체가 인용.
- **계보가 있다** — Patrick Trainer의 선행 프로젝트 "DuckDB-DOOM"에서 영감을 받았다고 한다. 그 프로젝트는 렌더링·입력에 JavaScript를 섞어 썼던 반면, DOOMQL은 렌더링과 입력 처리까지 SQL이 전담한다는 점이 차이로 언급된다.
- **공개 방식** — GitHub에 MIT 라이선스로 소스 공개, Docker + Python으로 로컬 실행 가능하다고 한다.

## 인상 깊은 문장

> "DOOMQL plays at a breezy ~30 FPS."
> (여러 매체가 동일하게 인용 — Vogel 본인 표현인지 매체의 재서술인지 원문 대조로는 확정 못함.)

## 댓글

**hada 댓글 수는 egress 차단으로 확인 불가.** HN·Lobsters에 별도 Show HN/토론 스레드가 있었는지도 특정하지 못했다 — WebSearch 결과는 The Register, Hackaday, Boing Boing, Yahoo Tech, GameGPU 등 테크 매체의 재보도 중심이었다. 다만 이렇게 여러 독립 매체가 거의 동시에 다뤘다는 것 자체가 간접적인 화제성 신호이기는 하다(정량 근거는 없음).

## 내 생각 · 적용점

### 핵심 전이 1 — "DB를 범용 런타임으로 쓰자"는 주장을 가장 극단까지 밀어붙인 재미있는 증명

[[2026-08-25-sqlite-for-everything]]은 SQLite 하나로 RDBMS·전문검색·문서저장소·캐시·벡터인덱스까지 대체하자는, 비교적 실용적인 선 안에서의 주장이었다. DOOMQL은 그 논지를 가장 비실용적인 방향(게임 렌더링 루프 자체)으로 밀어붙인 사례다 — "서버 역할을 줄이자"가 아니라 "애플리케이션 로직 전체를 쿼리로 바꿔보면 어디까지 가능한가"를 보여주는 실험이라는 점에서, 같은 축의 반대쪽 끝에 있다.

### 핵심 전이 2 — "실행 파일/프로그램이 곧 DB"라는 동일 계열의 장난스런 극단

[[2026-08-27-self-httpd-queryable-executable]]의 `self-httpd`는 웹서버의 라우트·방문기록·클릭을 전부 SQLite 테이블로 두고, 배포를 `UPDATE` 쿼리 한 줄로 축소했다. DOOMQL은 그 발상을 게임 루프로 옮긴 거울상이다 — 둘 다 "DB는 데이터를 담는 수동적 저장소"라는 통념을 깨고, 애플리케이션의 **실행 로직 자체**를 DB 레이어에 떠넘기는 재미 삼은 프로토타입이라는 공통점이 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 이건 재미로 만든 프로토타입이고, 온다 CRS가 게임 루프를 돌릴 일은 없다.** 다만 전이 가능한 원칙 하나는 가볍게 남겨둔다: 복잡한 상태 전이 로직(레이캐스팅처럼 "이전 상태 → 다음 프레임"을 계산하는 규칙)을 절차적 코드가 아니라 **선언적 VIEW 체인**으로 표현했다는 설계 선택 자체는, CRS의 요금 규칙이나 재고 할당처럼 "입력이 바뀌면 출력이 어떻게 바뀌는지"가 복잡한 로직을 DB 레이어의 뷰로 선언적으로 표현해두면 추적·디버깅이 쉬워질 수 있다는 정도의 느슨한 참고점이다. 억지로 더 당기지 않는다.

## 연관 자료

- [[2026-08-25-sqlite-for-everything]] — "DB를 범용 런타임으로 쓰자"는 주장의 실용적 버전. DOOMQL은 같은 축을 비실용적 극단까지 밀어붙인 사례.
- [[2026-08-27-self-httpd-queryable-executable]] — DB가 애플리케이션 상태+실행 로직을 떠안는 동일 계열의 다른 장난스런 극단(웹서버 쪽).

## 한 달 뒤 회고

*(2026-11-06 즈음 — (1) egress 차단이 풀리면 `cedardb.com` 원문과 GitHub 소스를 직접 대조해 수치(FPS·해상도·코드 줄 수)를 검증. (2) hada·HN 댓글 반응을 직접 확인. (3) "DB가 실행 런타임이 되는" 계열 글이 이후에도 이어지는지 — self-httpd, DOOMQL 다음은 뭘지 — 가볍게 추적.)*
