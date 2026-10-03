---
title: "PicoMQ - S3 기반 실시간 데이터 스트림 서버 (Adesh Nalpet Adimurthy) — 모든 레코드와 WAL을 객체 스토리지에 두고, 브로커에는 버릴 수 있는 캐시만 남긴다"
source_title: "PicoMQ: Durable streams on object storage"
source_url: "https://github.com/PicoMQ/picomq"
source_name: "GitHub (PicoMQ/picomq)"
referrer_url: "https://news.hada.io/topic?id=34694"
published_at: "확인 불가"
summarized_at: "2026-10-03"
category: "architecture"
tags: ["picomq", "object-storage", "s3", "streaming", "wal", "postgres", "sqlite", "kafka-protocol", "durable-streams"]
---

# PicoMQ - S3 기반 실시간 데이터 스트림 서버 (Adesh Nalpet Adimurthy)

> 출처: [PicoMQ: Durable streams on object storage](https://github.com/PicoMQ/picomq) (GitHub) · GeekNews(id=34694) 경유 · 정리일 2026-10-03

> **출처 한계**: `news.hada.io`, `picomq.com`, `news.ycombinator.com`(Show HN, id=49421806) 모두 이 세션에서 egress 차단으로 직접 열지 못했다. 대신 **`github.com/picomq/picomq`의 공식 README를 WebFetch로 직접 확보**했다 — 설치·실행 방법은 1차 소스로 확정했지만, README 자체가 짧아 설계 철학·사용 사례·제작자 정보는 담겨 있지 않았다. 이 부분은 WebSearch로 교차확인한 Show HN 토론 요약(runtimewire.com 등 2차 소개)으로 보강했다 — Kafka 호환성에 대한 제작자 발언, 그래뉼러 스트림 권장 방향 등은 **2차 소스 종합이라 원문 인용부호까지는 대조하지 못했다.** hada 댓글 수·HN 포인트 수는 확인 불가.

## 한 줄 요약

**PicoMQ는 채팅, 기기 이벤트, 작업 이력, 에이전트 대화 같은 레코드를 순서대로 저장하고 실시간으로 전달하는 스트림 서버다. 모든 레코드와 쓰기 복구 로그(WAL)까지 S3 호환 객체 스토리지에 두어 durability가 단 하나의 노드에도 의존하지 않게 만들고, 브로커 노드에는 교체 가능한 캐시만 남긴다. 클러스터 메타데이터와 스트림 소유권은 Postgres(단일 노드는 SQLite)로 관리해, 별도 브로커 디스크나 자체 합의 프로토콜 없이 SQL과 객체 스토리지만으로 내구성 있는 스트림을 구성한다.**

## 핵심 포인트

- **구성요소가 명확히 분리된 Rust 구현** — [`s3stream`](https://github.com/PicoMQ/s3stream)이 스트림 엔진을 맡고, `picomq` 호스트가 메타데이터 플레인·서버·프로토콜 프론트엔드(HTTP 기반 Pico 프로토콜·Durable Streams, Kafka 프로토콜)·클라이언트·`pico` CLI를 담당한다.
- **모든 레코드 + WAL까지 객체 스토리지로** — durability가 특정 노드의 로컬 디스크에 묶이지 않도록, 쓰기 복구 로그(WAL)조차 S3에 쓴다. 브로커 노드는 상태를 들고 있지 않으므로 ***언제든 죽이고 새 노드로 교체할 수 있는, 사실상 교체 가능한 캐시***에 가깝다.
- **메타데이터 계층의 분리와 단일 노드 축소** — 클러스터 메타데이터·스트림 소유권은 Postgres에서 순서가 있는 명령 로그로 관리되고, 단일 노드 배포에서는 SQLite로 그대로 대체된다. `pico serve --meta-url sqlite:./data/meta.db --storage=-2@file://./objects` 한 줄로 메타데이터(SQLite)·객체 스토리지(로컬 파일)를 모두 로컬에 띄운 전체 스택을 실행할 수 있다.
- **Kafka 프로토콜은 지원하지만 "Kafka 대체"를 약속하지 않는다** — 클라이언트는 HTTP 또는 Kafka 프로토콜로 레코드를 쓰고 읽을 수 있지만, 제작자는 Show HN에서 ***Kafka 호환성이나 1밀리초대 쓰기 지연을 약속하지 않는다***고 밝혔다고 WebSearch 스니펫은 전한다. 대신 수십 밀리초대의 durable append와 ***언제든 버릴 수 있는 노드, 세션·기기·AI 대화별로 독립 식별 가능한 그래뉼러 스트림***을 맞바꾼다.
- **"큰 토픽" 대신 "엔티티 단위 그래뉼러 스트림"** — Kafka는 적은 수의 큰 토픽에 대규모 트래픽을 몰아넣는 모델에 최적화돼 있는 반면, PicoMQ는 사용자·세션·차량·에이전트 대화별로 ***세분화된 스트림***을 만들도록 권장한다 — 토픽 단위가 아니라 엔티티 단위로 쪼개는 접근.
- **읽기 모델이 실시간 구독과 이력 재생을 통합한다** — 클라이언트는 읽던 오프셋부터 이어받거나(`pico tail -f`), 처음부터 과거 기록을 다시 읽을(`pico read`) 수 있어 실시간 구독과 이벤트 이력 보관을 같은 API로 처리한다.
- **합의 알고리즘을 새로 만들지 않는다** — 데이터 내구성은 객체 스토리지, 메타데이터 합의는 Postgres/SQLite라는 이미 성숙한 두 계층에 위임해, PicoMQ 자신은 별도 브로커 디스크나 자체 합의 프로토콜을 구현하지 않는다.

## 인상 깊은 문장

> "PicoMQ is durable, real-time streams over HTTP and Kafka, built on S3-compatible object storage."
> (GitHub README, 원문 그대로)

> "PicoMQ trades tens-of-milliseconds durable appends for disposable nodes and independently addressable streams for sessions, devices and AI conversations."
> (Show HN 논의를 전하는 WebSearch 스니펫의 재구성 — 제작자 발언 취지로 보이나 원문 인용부호까지는 대조하지 못했다.)

## 댓글

**hada 댓글 수와 Show HN(id=49421806)의 정확한 포인트·댓글 순위는 egress 차단으로 확인하지 못했다.** 대신 WebSearch로 교차확인한 바, 논의는 "PicoMQ가 Kafka 호환성을 약속하지 않는다는 점", "AutoMQ·WarpStream 같은 경쟁 구현체가 지연시간 대신 더 싸다는 비교", "그래뉼러 스트림이라는 사용 패턴 자체의 타당성"에 집중돼 있었다고 runtimewire.com 등 2차 소개가 전한다. **정직하게 감안할 점**: (1) 제작자(Adesh Nalpet Adimurthy)가 Terminal(YC S23) 소속으로 알려져 있어, 이 프로젝트가 그 스타트업의 실제 필요(세션·에이전트 대화 스트리밍)에서 나왔을 가능성이 있다 — 범용 인프라로 포장된 특정 워크로드 최적화일 수 있다는 점을 감안해야 한다. (2) README 자체에 벤치마크 수치나 프로덕션 도입 사례가 없어, "durable"·"real-time" 같은 표현의 실제 성능 보증 수준은 이 노트에서 확정할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — Diskless Kafka와 같은 답, 다른 길

[[2026-09-29-diskless-kafka-object-storage]]는 "브로커가 데이터를 소유하지 않고 객체 스토리지가 내구성을 맡는다"는 같은 설계 원리를, 기존 Kafka 생태계 내부에서 KIP-1150으로 점진적으로(아직 구현 진행 중) 추진하는 시도였다. PicoMQ는 애초에 Kafka 프로토콜 호환을 선택 사항으로 두고 그린필드로 새로 지었다 — 같은 아키텍처 답에 "기존 생태계를 바꾸는 길"과 "작게 새로 짓는 길"이라는 서로 다른 경로로 도달한 두 사례를 나란히 볼 수 있다.

### 핵심 전이 2 — Cloudflare K2와 같은 저장 계층 트릭, 다른 상품화 축

[[2026-10-02-cloudflare-k2-serverless-event-streams]]도 R2(객체 스토리지) 위에 세그먼트 배칭으로 로그를 쌓는 동일한 핵심 트릭을 쓴다. 다만 K2는 "완전 관리형 서버리스 상품"으로 운영 부담 자체를 없애는 방향으로 상품화했고, PicoMQ는 "엔티티 단위로 쪼갠 그래뉼러 스트림"이라는 ***사용 패턴 자체를 재정의***하는 방향으로 상품화했다 — 같은 저장 계층 혁신이 서로 다른 축(운영 부담 제거 vs 스트림 단위 재정의)에서 차별화될 수 있다는 걸 보여준다.

### 핵심 전이 3 — "서버가 사라지면 아키텍처 결정 자체가 사라진다"는 원칙의 실증

[[2026-08-25-sqlite-for-everything]]의 논지는 서버·네트워크 왕복을 없애면 그걸 둘러싼 아키텍처 결정 자체가 사라진다는 것이었다. PicoMQ의 단일 노드 모드(SQLite 메타데이터 + 로컬 파일 객체 스토리지, 명령 한 줄로 전체 스택 실행)는 ***분산 메시지 브로커조차 그 원칙에서 자유롭지 않다***는 걸 보여주는 구체 사례다 — 메시징 인프라처럼 "당연히 분산·클러스터여야 한다"고 여겨지던 영역에서도, 운영 규모가 작으면 서버 구성 자체를 지울 수 있는 선택지가 있다.

## 호스피탈리티 / CRS 적용 포인트

**온다가 지금 자체 메시지 스트리밍 인프라를 PicoMQ로 교체할 상황은 아니다** — 운영 규모가 이 정도 재구조화를 요구하지 않는다면 과한 선택일 수 있고, 직접 적용은 멀다는 걸 정직하게 밝힌다. 다만 전이 가능한 원칙 둘은 남는다. ①***엔티티 단위로 쪼갠 그래뉼러 스트림*** 개념은, CRS가 예약 변경·채널 동기화 이벤트를 다룰 때 "하나의 거대 토픽"이 아니라 예약 건·고객·채널별로 독립 스트림을 쪼개는 설계를 검토할 거리를 준다 — 멀티테넌트 B2B 구조에서 테넌트별 격리가 중요한 CRS에 자연스럽게 맞아떨어지는 아이디어다. ②***단일 노드는 SQLite, 클러스터는 Postgres로 전환 가능하게 만드는 설계***는, 온다가 소규모 고객사용 경량 배포와 대규모 SaaS 배포를 하나의 코드베이스로 감당해야 할 때 참고할 만한 아키텍처 유연성 패턴이다.

## 연관 자료

- [[2026-09-29-diskless-kafka-object-storage]] — 같은 "브로커는 데이터를 소유하지 않는다" 설계 원리, 기존 Kafka 생태계 내부에서 점진적으로 추진 중인 버전
- [[2026-10-02-cloudflare-k2-serverless-event-streams]] — 같은 객체 스토리지 기반 로그 설계를 완전 관리형 서버리스 상품으로 구현한 벤더 사례
- [[2026-08-25-sqlite-for-everything]] — "서버가 사라지면 아키텍처 결정도 사라진다"는 원칙을 스트리밍 서버 영역에서 구체화한 실증 사례

## 한 달 뒤 회고

*(2026-11-03 즈음 — (1) `picomq.com`·`news.hada.io` 접근이 풀리면 공식 문서와 hada 댓글을 직접 확인해 설계 철학·한계(특히 Postgres 메타데이터 계층의 병목 가능성)를 보강. (2) Show HN 스레드의 실제 포인트·비판 댓글(특히 지연시간·내구성 트레이드오프에 대한 반론)을 1차로 확인. (3) PicoMQ나 유사한 그래뉼러 스트림 설계를 CRS 이벤트 파이프라인 논의에 실제로 꺼내봤는지 점검.)*
