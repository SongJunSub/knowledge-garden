---
title: "PostgreSQL의 MVCC는 나쁘다. 다른 DB도 마찬가지다 (boringsql.com) — 쓰기 증폭·테이블 팽창·VACUUM 부담·XID wraparound는 실제 문제이지만 MVCC의 결함이 아니라 설계 선택의 결과다. 모든 DB는 '과거 버전을 어디에 두고, 어떻게 찾고, 누가 언제 치우는가'라는 같은 질문에 다른 답을 낼 뿐이다. Oracle은 undo log 비용으로, SQL Server는 tempdb 증가로, MongoDB는 cache pressure로 — 비용은 사라지지 않고 자리만 옮긴다"
source_title: "PostgreSQL's MVCC is Bad. So Is Everyone Else's."
source_url: "https://boringsql.com/posts/mvcc-bad-bad/"
source_name: "boringsql.com"
referrer_url: "https://news.hada.io/topic?id=32326"
published_at: "2026-08-08"
summarized_at: "2026-08-10"
category: "backend"
tags: ["postgresql", "mvcc", "database-internals", "vacuum", "tradeoffs", "boring-technology"]
---

# PostgreSQL의 MVCC는 나쁘다. 다른 DB도 마찬가지다 — 비용은 사라지지 않고 자리만 옮긴다

> 출처: [PostgreSQL's MVCC is Bad. So Is Everyone Else's.](https://boringsql.com/posts/mvcc-bad-bad/) (boringsql.com · GeekNews GN⁺ 요약) · 정리일 2026-08-10

## 한 줄 요약

**PostgreSQL의 ***"쓰기 증폭, 테이블 팽창, VACUUM 부담, 32비트 XID wraparound"***는 실제 문제이지만, **MVCC 자체의 결함이 아니라 설계 선택의 결과**라는 게 이 글의 핵심 주장이다. 모든 DB는 ***"과거 버전을 어디에 두고 / 어떻게 찾고 / 누가 언제 치우는지"***라는 같은 질문에 **다른 답으로 비용을 재배치**할 뿐이다. **Oracle/InnoDB**는 undo log로(롤백·undo 재구성 비용), **SQL Server**는 version store/tempdb로(tempdb 증가), **MongoDB/WiredTiger**는 메모리 delta chain으로(cache pressure), **LSM 엔진**은 timestamped key로(compaction 비용), **etcd**는 append-now-clean-later로(운영 작업 필요) — 각자 비용을 다른 곳으로 옮긴다. **오래 열린 snapshot은 모든 설계에서 문제**이며, 실패 형태만 다르다. PostgreSQL은 **garbage 가시성과 reader 비차단**을 선택했다. 4가지 비용 구조 — ①**쓰기 증폭**(물리 위치 기반 인덱스, HOT update로 일부 완화) ②**테이블 팽창**(UPDATE가 garbage 생성, VACUUM이 나중에 정리) ③**오래 열린 트랜잭션**(VACUUM 차단, 운영자 개입 필요) ④**32비트 XID wraparound**(주기적 freeze 필요). 개선 시도로 **zheap**(2018, 현재 dormant)과 **OrioleDB**(undo 기반 versioning)가 있지만, **core PostgreSQL은 설계를 유지하며 점진적으로 비용을 줄이는** 경로를 택하고 있다.**

## 핵심 포인트

- **핵심 주장** — PostgreSQL의 4대 문제(쓰기증폭·팽창·VACUUM·XID wraparound)는 **MVCC 결함이 아니라 설계 선택의 결과.**
- **공통 질문** — 모든 DB는 ***"과거 버전을 어디에 두고, 어떻게 찾고, 누가 언제 치우는지"***라는 같은 질문에 다른 답을 낸다.
- **대안 비교 5가지** — Oracle/InnoDB(undo log→롤백비용)·SQL Server(version store→tempdb 증가)·MongoDB/WiredTiger(메모리 delta chain→cache pressure)·LSM 엔진(timestamped key→compaction 비용)·etcd(append-now-clean-later→운영작업).
- **PostgreSQL의 선택** — garbage 가시성+**reader 비차단.**
- **4가지 비용 구조** — 쓰기 증폭(HOT update로 일부 완화)·테이블 팽창(VACUUM 지연 정리)·오래 열린 트랜잭션(운영자 개입 필요)·XID wraparound(주기적 freeze).
- **개선 시도** — **zheap**(2018, dormant)·**OrioleDB**(undo 기반). **Core PostgreSQL**은 설계 유지+점진적 비용 감소.

## 인상 깊은 문장

> "과거 버전을 어디에 두고 / 어떻게 찾고 / 누가 언제 치우는지"
> (모든 데이터베이스 버저닝 설계를 관통하는 하나의 질문 — 이 글 전체가 이 질문에 대한 답의 목록이다)

## 댓글

**hada 댓글을 확보하지 못했다** — 페이지에 댓글 섹션이 표시되나 이번 정리에서 실제 내용을 가져오지 못했다.

**읽을 때 감안**
- ①**boringsql.com은 필명 저자 기반의 개인 기술 블로그**로 추정되며, 저자의 전문성 배경이 이번 정리에서 확인되지 않는다.
- ②**"모든 DB가 마찬가지로 나쁘다"는 프레이밍이 균형 잡힌 비교인지, PostgreSQL을 옹호하기 위한 상대화인지는 판단이 필요하다** — 다섯 대안 모두에 비용이 있다는 게 사실이어도, 그 비용의 "정도"가 동등한지는 이 글만으로 확인할 수 없다.
- ③**zheap·OrioleDB 같은 대안 프로젝트의 현재 상태(dormant 등)에 대한 평가가 다소 짧다** — 왜 zheap이 활발하지 않은지 등의 배경 설명이 부족하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "비용은 사라지지 않고 자리만 옮긴다"는 이번 시즌 가장 명확하게 재확인된 트레이드오프 이동 원칙이다

[[2026-08-05-canva-session-revocation-at-scale]]에서 짚었던 급소 — **성과는 측정·보고되지만 트레이드오프(최종 일관성 창)는 언급조차 안 됨** — 는 결국 **트레이드오프가 사라진 게 아니라 어딘가로 옮겨갔을 뿐**이라는 걸 암시했다. 이 글은 그 원칙을 **다섯 개 DB 시스템을 나란히 놓고 명시적으로 증명**한다 — Oracle의 undo 비용, SQL Server의 tempdb 팽창, MongoDB의 cache pressure는 전부 PostgreSQL의 VACUUM 부담과 **같은 문제의 다른 이름**이다. 어떤 시스템도 "비용 없는 해법"을 찾은 게 아니라, 비용을 각자 다른 곳에 숨겨뒀을 뿐이다.

### 핵심 전이 2 — 5가지 DB 설계 비교는 이번 주 정리한 "효율성 프런티어" 개념이 DB 아키텍처 선택에도 적용된다는 걸 보여준다

[[2026-08-09-managing-ai-coding-costs-databricks]]에서 다룬 **"최고 성능이 아니라 주어진 조건에서 최적의 트레이드오프를 추적"**한다는 원칙을, 이 글의 DB 비교가 다른 도메인에서 반복한다 — **"어떤 DB가 가장 좋은가"가 아니라 "우리 워크로드에 어떤 비용 배치가 가장 덜 아픈가"**를 물어야 한다는 것. 쓰기가 많은 워크로드엔 PostgreSQL의 VACUUM 부담이, 읽기가 많은 워크로드엔 Oracle의 undo 비용이 상대적으로 유리할 수 있다.

### 핵심 전이 3 — "설계를 유지하며 점진적으로 비용을 줄인다"는 선택은 오래된 "boring technology" 원칙의 실물이다

zheap 같은 근본적 재설계 시도가 dormant 상태로 남고, **core PostgreSQL이 기존 설계를 유지하며 점진적 개선을 택한 것**은, 이 가든이 예전에 정리한 [[2026-05-29-choose-boring-technology-2015]]·[[2026-05-29-choose-boring-technology-revisited-2025]]의 원칙 — **검증된 기존 기술의 점진적 개선이, 화려하지만 검증 안 된 재설계보다 나을 때가 많다** — 을 데이터베이스 아키텍처 결정에서 실증하는 사례다.

### 핵심 전이 4 — 정직한 급소: 댓글 확보 실패로 "모든 DB가 똑같이 나쁘다"는 균형 잡힌 프레이밍의 반박 계층이 없다

이 글의 "모든 DB가 마찬가지로 비용을 진다"는 논지가 균형 잡힌 관찰인지, 아니면 **PostgreSQL을 상대적으로 정당화하려는 수사적 전략**인지는 외부 검증 없이 판단하기 어렵다. 댓글을 확보하지 못해 이번 노트엔 그 반박·보완 계층이 완전히 빠져 있다는 걸 정직하게 남겨둔다.

## 호스피탈리티 / CRS 적용 포인트

- **CRS 데이터베이스 선택 시 "어떤 DB가 최고인가"가 아니라 "우리 워크로드에 어떤 비용 배치가 맞는가"로 질문 전환(전이 2).** 예약 시스템처럼 쓰기가 잦은 워크로드와, 리포팅처럼 읽기가 잦은 워크로드에 서로 다른 DB 선택 기준을 적용.
- **VACUUM·tempdb 등 현재 사용 중인 DB의 알려진 비용 구조를 정기 모니터링(전이 1).** "비용이 없는 게 아니라 숨겨져 있을 뿐"이라는 전제로, CRS 프로덕션 DB의 팽창·정리 지연 지표를 정기 점검.

## 연관 자료
- [[2026-08-05-canva-session-revocation-at-scale]] — *"트레이드오프는 사라지지 않고 이동한다"는 원칙의 명시적 재확인*
- [[2026-08-09-managing-ai-coding-costs-databricks]] — *"효율성 프런티어 추적" 원칙이 DB 아키텍처 선택에도 적용*
- [[2026-05-29-choose-boring-technology-2015]] · [[2026-05-29-choose-boring-technology-revisited-2025]] — *"설계 유지+점진적 개선"이라는 boring technology 원칙의 실물*

## 한 달 뒤 회고
*(2026-09-10 즈음 — ①OrioleDB 같은 대안 프로젝트가 실제로 채택 확산됐는지, ②이 글의 "모든 DB가 마찬가지" 프레이밍에 대한 반박이 다른 채널에서 나왔는지, ③CRS DB 선택 기준을 워크로드별 비용 배치로 재정리했는지 기록.)*
