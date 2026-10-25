---
title: "분산 SQLite의 12년 - rqlite에서 클라우드 서비스까지 (Philip O'Toole) — 합의·스트리밍·병합이라는 세 갈래가 풀던 건 각기 다른 요구였다"
source_title: "Twelve years of distributed SQLite"
source_url: "https://philipotoole.com/twelve-years-of-distributed-sqlite/"
source_name: "Philip O'Toole (philipotoole.com), GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=35911"
published_at: "2026-10-24 (WebSearch 교차확인, 원문 직접 확인은 못함)"
summarized_at: "2026-10-25"
category: "backend"
tags: ["sqlite", "distributed-systems", "rqlite", "dqlite", "litestream", "cr-sqlite", "turso", "cloudflare-d1", "consensus", "crdt", "raft"]
---

# 분산 SQLite의 12년 - rqlite에서 클라우드 서비스까지 (Philip O'Toole)

> 출처: [Twelve years of distributed SQLite](https://philipotoole.com/twelve-years-of-distributed-sqlite/) (Philip O'Toole · rqlite 저자) · GeekNews(id=35911) 경유 · 정리일 2026-10-25
>
> **출처 한계**: `news.hada.io`·`philipotoole.com`·`news.ycombinator.com`·`zeli.app`·`news.lavx.hu` 등이 이 세션에서 모두 `getaddrinfo ENOTFOUND`로 차단돼 원문·HN 스레드·2차 재게시 글 어느 것도 직접 열람하지 못했다. 저자·제목("Twelve years of distributed SQLite", 2026-10-24 발행 추정)과 핵심 논지(합의·스트리밍·병합 세 갈래, rqlite·dqlite·Litestream·cr-sqlite·Turso/libSQL·Cloudflare D1·SQLite Cloud 언급)는 WebSearch 스니펫 다수(runtimewire, aicrier, Lemmy 재게시, dev.to 등)가 상호 일치해 **일반 구성은 신뢰할 만하다**. 다만 `github.com`은 이 세션에서 정상 접근돼, rqlite·dqlite·cr-sqlite·Litestream 각 프로젝트의 README는 **1차 자료로 직접 확인**했다. 원문 고유의 세부 문장·인용구는 2차 재서술로만 확보해 정확한 어순·인용부호까지는 보장 못하며, HN 토론은 "27 points"라는 스니펫 수치 하나만 확인했고 댓글 내용은 못 봤다. hada 댓글 수도 확인 불가.

## 한 줄 요약

**rqlite 저자 Philip O'Toole이 2014년 자신이 SQLite에 Raft 로그를 얹어 분산 데이터베이스를 만든 이후 12년을 돌아보며, 분산 SQLite가 이제 rqlite·dqlite·Litestream·cr-sqlite·Turso·Cloudflare D1·SQLite Cloud 등 12개 안팎의 프로젝트를 갖춘 분야로 성장했다고 정리하고, 그 설계가 합의(consensus)·스트리밍(streaming)·병합(merge)이라는 세 갈래로 나뉘어 각기 다른 요구(강한 일관성의 클러스터, 단일 노드의 저비용 재해복구, 여러 쓰기 주체의 최종 일관성)를 해결해왔다고 짚는다.**

## 핵심 포인트

- **원점 — rqlite(2014)** — O'Toole이 2014년 9월 SQLite를 저장 엔진으로 두고 Raft 로그로 쓰기를 복제하는 rqlite를 공개했다. 아마도 SQLite와 Raft를 결합한 최초의 오픈소스 시스템으로 꼽힌다. rqlite는 **CP(일관성 우선) 시스템**이다 — 모든 쓰기는 리더를 거쳐야 하고 과반의 확인이 필요하며, 파티션에 갈린 소수 쪽은 쓰기를 거부한다. 이 결정은 12년 동안 바뀌지 않았다고 저자는 말한다.
- **갈래 1 — 합의(Consensus)** — rqlite와 Canonical의 dqlite가 대표다. 둘 다 ***Raft 합의 알고리즘***으로 여러 노드 간 데이터 일관성을 유지한다. GitHub에서 직접 확인한 바, rqlite는 외부 의존성 없는 단일 바이너리 서버로 HTTP API를 내주는 독립 애플리케이션인 반면, dqlite는 ***임베드 가능한 C 라이브러리***로 libuv 기반 비동기 단일 스레드 구현에 전용 와이어 프로토콜을 쓴다 — 같은 Raft 기반이지만 "서버로 띄우는 것"과 "애플리케이션에 라이브러리로 심는 것"이라는 배치 형태가 다르다. 둘 다 노드 장애가 나도 백업 복원을 기다리지 않고 서비스를 계속하려는 ***강한 일관성의 클러스터*** 요구에 대응한다.
- **갈래 2 — 스트리밍(Streaming)** — Ben Johnson의 Litestream이 대표다. 합의 알고리즘 없이, SQLite의 WAL(Write-Ahead Log)을 백그라운드에서 증분으로 S3 같은 객체 스토리지에 복제한다. GitHub README에서 확인한 바로는 SQLite와는 SQLite API로만 통신해 DB를 손상시키지 않는다고 설명하며, 목표는 ***단일 노드 SQLite의 저비용 재해복구(disaster recovery)*** — 여러 노드로 일관성을 맞추는 게 아니라, 한 노드가 죽었을 때 거의 비용 없이 최근 상태로 복원하는 것이다.
- **갈래 3 — 병합(Merge)** — cr-sqlite가 대표다. GitHub README에서 확인한 바, CRDT(충돌 없는 복제 데이터 타입)로 독립적으로 쓰기가 일어난 여러 SQLite DB를 리더 없이 합친다. 최종 쓰기 우선(LWW)·카운터 합산·분수 인덱스 등 컬럼 단위 병합 규칙을 쓰며, 읍기 전용 CRR(충돌 없는 복제 관계) 삽입은 일반 테이블보다 약 2.5배 느리다는 트레이드오프도 명시돼 있다. 이 갈래는 ***여러 쓰기 주체(오프라인 기기 등)가 각자 쓰다가 나중에 합치는 최종 일관성*** 요구에 대응한다 — 저자는 이를 CAP 정리의 AP(가용성 우선) 코너로 분류한다.
- **상업화와 포크** — libSQL(Turso가 메인테인하는 SQLite 포크)은 서버 모드·HTTP 기반 복제·임베드 레플리카를 더했고, 2026-10-02 Supabase가 Turso를 인수한다고 발표했다([[2026-10-03-supabase-acquires-turso]]에서 이미 다룬 사건). Cloudflare D1은 SQLite를 Workers 안에서 돌리며 전역 읍기 복제를 제공한다. 종합하면 이 분야는 "열두 개 안팎의 프로젝트, 일부는 벤처 투자를 받았고, 둘은 인수됐다"는 상업적 성숙 단계에 들어섰다는 게 2차 소개 글들이 공통으로 짚는 지점이다.

## 인상 깊은 문장

> "rqlite가 쓰기는 리더를 거쳐 과반 확인을 받아야 한다는 CP 결정을 내린 게 12년 동안 바뀌지 않았다." (2차 소개 글 재서술, 원문 1차 인용 불가)

## 댓글

`news.hada.io` 차단으로 hada 댓글 수는 확인 못했다. Hacker News 토론은 포인트 27개라는 스니펫만 확인했고 실제 댓글 내용은 보지 못했다 — 포인트가 비교적 낮은 편이라, 화제성보다는 "분산 SQLite 생태계를 한 번에 정리한 레퍼런스 글" 정도로 조용히 소비됐을 가능성이 있다. 저자가 rqlite 창작자 본인이라는 점은 — 이 분야 역사를 복원력 있게 정리할 자격이 충분하지만, 동시에 자기 프로젝트(rqlite)를 "오픈소스·자체 호스팅 모델의 원형"으로 포지셔닝하려는 동기가 있을 수 있다는 점도 같이 읽어야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-10-03-supabase-acquires-turso]]와의 직접 연결.** 그 노트가 다룬 "Supabase의 Turso 인수"는 이 글이 말하는 "상업화 단계에 들어선 분산 SQLite 분야"의 가장 최근 사건이다. 그 노트에서 짚은 "에이전트가 테넌트 단위로 DB를 만들고 버리는" 패턴은, 이 글의 세 갈래 분류 중 Turso/libSQL이 속한 "임베드 레플리카 + HTTP 기반 복제" 쪽 설계가 왜 그 용도에 맞는지(가벼운 단위로 쪼개고 합치기 쉬운 구조)를 설명해주는 배경 지식이 된다.

**핵심 전이 2 — [[2026-08-29-syncular-offline-first-sqlite-sync-engine]]과의 연결(병합 갈래의 실제 구현체).** syncular는 클라이언트마다 로컬 SQLite를 두고 서버 권위형 커밋 로그와 동기화하는 오프라인 우선 엔진이었다 — 이 글의 "병합(merge)" 갈래가 요구하는 "여러 쓰기 주체의 최종 일관성"을 cr-sqlite의 CRDT 방식이 아니라 **서버 권위형 아웃박스+멱등 커밋**이라는 다른 방식으로 푼 사례다. 같은 요구(오프라인 쓰기 + 나중에 합치기)를 리더 없는 CRDT로 풀 수도 있고, 서버를 유일한 권위로 두고 클라이언트를 종속시킬 수도 있다는 **설계 선택의 스펙트럼**을 이 두 노트가 양 끝에서 보여준다.

**핵심 전이 3 — [[2026-08-10-sqlite-reliability-lessons-hipp]]와의 연결(신뢰의 기반).** 이 모든 분산 SQLite 프로젝트가 성립하는 전제는 "SQLite 자체의 신뢰성"이다. Hipp이 그 노트에서 인정한 MC/DC 테스트 커버리지의 한계는, rqlite·dqlite·cr-sqlite 같은 레이어가 아무리 합의·복제 로직을 잘 짜도 그 아래 SQLite 엔진 자체의 결함이 전체 분산 시스템에 그대로 전파될 수 있다는 점을 상기시킨다 — 분산 레이어의 정교함과 기반 엔진의 신뢰성은 서로 다른 축의 문제다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다의 CRS/PMS 연동은 멀티테넌트 RDBMS(Postgres 등) 위에서 돌아갈 가능성이 높고, 호텔·채널 단위로 SQLite 파일 하나씩 쪼개 쓰는 모델을 지금 당장 들여올 이유는 약하다. 다만 **전이 가능한 원칙** 하나는 있다 — "하나의 저장 엔진 위에 다른 요구(강한 일관성 vs 저비용 복구 vs 최종 일관성)마다 다른 복제 전략을 얹을 수 있다"는 이 글의 틀은, CRS 내부에서도 "예약 상태처럼 강한 일관성이 필요한 데이터"와 "조회용 캐시·로그처럼 최종 일관성으로 충분한 데이터"를 같은 DB 엔진 안에서 뭉뚱그리지 않고 요구 수준별로 복제·동기화 전략을 분리해 설계하는 습관으로 옮겨볼 만하다.

## 연관 자료

- [[2026-10-03-supabase-acquires-turso]] — 이 글이 말하는 "상업화" 단계의 최근 사건(Turso 인수)
- [[2026-08-29-syncular-offline-first-sqlite-sync-engine]] — "병합" 갈래의 요구를 CRDT 아닌 다른 방식(서버 권위형 아웃박스)으로 푼 대조 사례
- [[2026-08-10-sqlite-reliability-lessons-hipp]] — 모든 분산 레이어가 전제하는 기반 엔진(SQLite)의 신뢰성 한계

## 한 달 뒤 회고

2026-11-25 즈음, 이 글의 원문(philipotoole.com)과 HN 토론을 다시 열어볼 수 있는지 확인하고, dqlite·cr-sqlite가 실제로 프로덕션에서 채택된 사례를 더 찾아 "열두 개 프로젝트"라는 분류가 실무에서도 체감되는 구분인지 점검한다.
