---
title: "Git을 어떤 규모에서도 확장하는 법 — Cursor의 Continuity, Git 저장소 자체가 아니라 S3의 WAL을 진실의 원천으로 삼다"
source_title: "Git at any scale"
source_url: "https://cursor.com/blog/git-at-any-scale"
source_name: "cursor.com 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=32926"
published_at: "2026-08-23"
summarized_at: "2026-08-27"
category: "engineering"
tags: ["git", "distributed-systems", "cursor", "storage-architecture", "write-ahead-log", "agent-infrastructure"]
---

# Git을 어떤 규모에서도 확장하는 법 — Cursor의 Continuity

> 출처: [Git at any scale](https://cursor.com/blog/git-at-any-scale) (cursor.com 공식 블로그) · 정리일 2026-08-27
> **출처 한계**: `cursor.com`·`news.hada.io`가 이 세션에서 전부 egress 차단돼 원문·hada 댓글을 직접 읽지 못했다. 아래 내용은 The Register, XenoSpectrum, Tildes, XiaoHu 등 여러 매체가 원문을 인용·재구성한 WebSearch 스니펫과 Slack 발췌를 교차해 재구성한 것이며, 원문 표현을 직접 확인한 것은 아니다. 다만 "S3 WAL이 진실의 원천, 로컬은 캐시"라는 핵심 아키텍처는 다섯 개 이상의 독립 매체에서 일관되게 확인돼 사실관계 신뢰도는 높다고 판단한다.

## 한 줄 요약

**Git은 로컬에서는 단순하지만 대규모로 호스팅하면 packfile의 랜덤 접근·강한 일관성 요구·복제 비용 때문에 운영 복잡도가 폭증한다. 업계 표준이 된 GitHub의 Spokes는 저장소마다 최소 3개 복제본을 로컬 NVMe에 두고 3-phase commit(3PC)으로 동기화하는 방식인데, ***대형 monorepo에는 복제 수가 부족하고(느린 노드 하나가 3PC 전체를 묶는다), 에이전트가 마구 만들어내는 수많은 작은 저장소에는 복제본 3개가 과한 구조***다. Cursor의 Continuity는 발상을 뒤집는다 — ***Git 저장소 자체가 아니라 S3에 쌓는 Write-Ahead Log(WAL)를 진실의 원천으로 두고, 로컬 디스크의 실제 Git 저장소는 필요할 때 WAL에서 언제든 재생성 가능한 "따뜻한 캐시"로 취급***한다. 그 결과 저장소별 복제본 수를 트래픽에 맞춰 0에서 수백 개까지 자유롭게 늘리고 줄일 수 있는, 상태를 갖지 않는(stateless) 서비스가 된다.**

## 핵심 포인트

- **문제의 뿌리** — Git 자체는 로컬 워크플로에 최적화된 설계라 서버에서 대규모로 호스팅하면 packfile의 랜덤 접근 패턴, 강한 일관성(강제 푸시·레퍼런스 업데이트의 원자성) 요구, 복제 비용이 그대로 운영 복잡도로 전이된다.
- **Spokes의 성공과 한계** — GitHub의 Spokes는 저장소마다 **최소 3개 복제본**을 로컬 NVMe에 두고 **3-phase commit**으로 동기화해 업계 표준이 됐다. 하지만 3PC는 합의 알고리즘의 근본적 한계를 그대로 물려받는다 — ***모든 단계의 지연이 클러스터에서 가장 느린 서버에 의해 결정***된다. 인기 있는 대형 monorepo는 복제본 3개로 CI 트래픽을 못 받아내고, 복제본을 늘리면 늘릴수록 느린 노드가 푸시를 더 자주 지연시킨다.
- **정반대 극단의 문제 — 에이전트가 만드는 무수한 작은 저장소** — 에이전트가 Git을 대규모로 다루기 시작하면 monorepo 밖에서 방대한 수의 작은 저장소를 만들어낸다. Spokes 구조에서는 이런 저장소 하나하나에도 여전히 최소 3개 복제본이 강제돼, 트래픽 대비 리소스가 크게 과잉이다.
- **Continuity의 발상 전환** — ***S3(또는 호환 오브젝트 스토리지)의 Write-Ahead Log를 진실의 원천***으로 삼는다. 저장소가 푸시를 받으면 그 내용은 별도 오브젝트로 S3에 WAL 엔트리로 기록되고, **완전히 영속화되기 전까지는 푸시를 확인(ack)하지 않는다.** 푸시된 packfile은 디스크에 쓰이는 동시에 S3에도 업로드된다.
- **가시성의 원자적 순간** — 푸시는 (1) 레퍼런스 트랜잭션이 로컬에서 준비되고 (2) WAL 인덱스 파일에 WAL 엔트리 포인터가 기록되는 순간에만 비로소 "보이게" 된다. 로컬 디스크의 저장소는 웜 캐시일 뿐, 진실은 항상 S3의 WAL이다.
- **운영상 이득** — 시스템 전체가 ***상태를 갖지 않고(stateless) 라우팅 테이블도 없다.*** 어떤 노드에서든 로컬 디스크에 저장소가 없으면 WAL로부터 즉시 재구성(materialize)할 수 있다. 복제본 수를 저장소별 트래픽에 맞춰 0부터 수백 개까지 유연하게 조정 가능 — Spokes가 강제하던 "모든 저장소 최소 3개"라는 일률적 제약이 사라진다.

## 인상 깊은 문장

> "Continuity treats an S3-based write-ahead log as the source of truth, with local NVMe serving as a regenerable cache."
> (WebSearch로 재구성한 원문 취지 — 이 아키텍처의 핵심을 한 문장으로 압축한다: 로컬 Git 저장소는 이제 "정본"이 아니라 "다시 만들 수 있는 것"이다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단).
- The Register·Tildes(~comp) 등에 이 글이 게시돼 논의된 흔적은 확인했지만, 구체적 댓글 논지(예: S3 리전 장애 시 가용성, 비용 비교)는 이 세션에서 직접 읽지 못했다 — 원문 접근이 가능해지면 보강이 필요하다.

## 내 생각 · 적용점

### 핵심 전이 — Cursor의 자체 인프라 확장이 "왜 Origin을 만들었는가"의 다음 장이다

[[2026-08-19-cursor-origin-code-hosting]]에서 Cursor는 "GitHub을 대체하지 않는다, 다만 에이전트가 붙을 표면이 자기 인프라에 필요하다"고 밝히며 Origin 코드 호스팅을 시작했다. Continuity는 바로 그 Origin을 떠받치는 저장 계층으로 읽힌다 — **에이전트가 대량으로 만들어내는 작은 저장소를 감당해야 한다는 문제의식이 Origin 발표 당시부터 이미 있었고, Continuity는 그 문제에 대한 구체적인 엔지니어링 답**이다. 두 노트를 나란히 놓으면 "왜 Cursor가 자체 Git 인프라를 만들었는가"라는 질문에 "표면이 필요해서"(Origin, 8/19)에 이어 "그 표면을 감당할 저장 구조가 필요해서"(Continuity, 8/27)라는 답이 이어진다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다** — CRS/호스피탈리티 도메인에는 "저장소별 복제본 수를 0~수백 개로 탄력적으로 조정해야 하는" 규모의 문제가 없다.
- 다만 **"정본(source of truth)과 캐시를 분리하고, 캐시는 언제든 정본에서 재생성 가능하게 설계한다"**는 원칙 자체는 재사용 가치가 있다 — 예를 들어 예약/재고 조회 캐시 계층을 설계할 때, 캐시가 깨지거나 유실돼도 원장(예약 DB)에서 언제든 다시 만들어낼 수 있다면 그 캐시 계층의 가용성 요구를 크게 낮출 수 있다는 발상은 전이 가능한 일반 원칙이다.

## 연관 자료
- [[2026-08-19-cursor-origin-code-hosting]] — 같은 Cursor의 자체 Git 인프라 시리즈, "왜 만드는가"(에이전트 표면)에 대한 답이 이 노트에서 "어떻게 확장하는가"(Continuity)로 이어짐
- [[2026-08-04-github-has-alternatives-no-replacement]] — GitHub의 진짜 자산은 저장소 호스팅 기술이 아니라 사회적 인프라라는 반대 극의 논지, Continuity처럼 기술적으로 뛰어나도 "GitHub을 대체"하지는 못한다는 맥락을 보완

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①Continuity가 Origin 사용자에게 실제로 어떤 체감 변화를 줬는지, ②S3 리전 장애 시 가용성에 대한 실전 데이터나 논쟁이 나왔는지, ③원문·hada 댓글 직접 접근이 가능해지면 이 노트의 "추정" 표시를 확정 사실로 교체.)*
