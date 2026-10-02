---
title: "Cloudflare K2 - 서버리스 이벤트 스트림 (Cloudflare) — 브로커를 지우는 대신 R2 위에 로그를 쌓는다, Diskless Kafka와 같은 답을 자체 상품으로 내놓은 벤더"
source_title: "Announcing Cloudflare K2: serverless event streams"
source_url: "https://blog.cloudflare.com/cloudflare-k2-streams/"
source_name: "Cloudflare Blog"
referrer_url: "https://news.hada.io/topic?id=34629"
published_at: "2026-10-01 (공개 베타 발표일, WebSearch 교차확인)"
summarized_at: "2026-10-02"
category: "architecture"
tags: ["cloudflare", "k2", "serverless", "event-streaming", "r2", "object-storage", "pub-sub", "distributed-systems"]
---

# Cloudflare K2 - 서버리스 이벤트 스트림 (Cloudflare)

> 출처: [Announcing Cloudflare K2: serverless event streams](https://blog.cloudflare.com/cloudflare-k2-streams/) (Cloudflare Blog) · GeekNews(id=34629) 경유 · 정리일 2026-10-02

> **출처 한계**: `news.hada.io`와 `blog.cloudflare.com` 모두 이번 세션 egress 정책으로 전면 차단돼 원문을 한 줄도 직접 읽지 못했다. 이 노트는 WebSearch로 교차 확인한 여러 독립 소스(Cloudflare 공식 K2 docs `developers.cloudflare.com/k2/`, ByteIota의 해설 기사, X에서 Cloudflare 내부 사정을 아는 개발자의 설명 스레드)를 근거로 재구성했다. 핵심 메커니즘(세그먼트 배칭, 구독·소비자 그룹 모델, R2 기반 저장)은 다수 소스가 일치해 신뢰도가 높지만, Cloudflare 원문 고유의 비유·발표 맥락·공식 수치는 확인하지 못했다. hada 댓글 수·논조도 확인 불가.

## 한 줄 요약

**Cloudflare가 K2라는 이름으로 서버리스 이벤트 스트리밍 서비스를 공개 베타로 내놓았다. 브로커가 메시지를 로컬에 들고 있는 대신 R2 객체 스토리지 위에 파티션된 내구성 있는 로그를 쌓는 구조로, 클러스터 운영·확장 부담 없이 대량의 이벤트를 저비용으로 장기 보관하면서, 구독(subscription) 단위로 소비자들이 작업을 나눠 처리하거나 각자 전체 이벤트를 독립적으로 읽을 수 있게 한다.**

## 핵심 포인트

- **R2 위에 쌓는 파티션 로그** — K2는 Worker나 HTTP로 쓰는 이름 붙은 로그(named, append-style log)이고, 그 실제 저장소는 R2 객체 스토리지다. 브로커가 데이터를 "소유"하지 않는다는 점에서 [[2026-09-29-diskless-kafka-object-storage]]가 정리한 Diskless Kafka(KIP-1150)와 정확히 같은 설계 철학을 Cloudflare가 자체 상품으로 구현한 것이다.
- **세그먼트 배칭이 핵심 성능 레버** — 에지 서비스에서 쓰기를 메모리에 모았다가 ***충분히 큰 세그먼트 파일로 묶어 한 번에 기록***한다. 이벤트 하나하나를 R2에 바로 쓰면 쓰기·읽기 비용이 감당 안 되기 때문에, 배칭 자체가 설계의 핵심 트릭이다 — Diskless Kafka의 "Shared Log Segment Object" 패턴과 동일한 이유로 동일한 해법을 쓴다.
- **구독(subscription) 단위로 소비 패턴을 고른다** — 하나의 구독 안에서는 ***여러 컨슈머가 메시지를 나눠 처리***(파티션드 컨슈밍)하고, 별도 구독을 또 만들면 그 구독에 속한 컨슈머들은 ***같은 스트림 전체를 독자적으로 처음부터 받는다***(팬아웃·pub/sub). 두 패턴을 섞어 쓸 수도 있다 — 주문 완료 이벤트 하나를 분석 파이프라인과 부정거래 탐지 시스템에 동시에 독립적으로 흘려보내는 구성이 가능한 이유다.
- **운영 부담 제거가 핵심 가치 제안** — 완전 서버리스라 ***브로커 클러스터를 직접 운영·확장할 필요가 없고***, 보존 기간을 최대 한 달까지 설정할 수 있어 과거 데이터를 저비용으로 쌓아둘 수 있다.
- **베타 제한은 아직 작다** — 공개 베타는 Workers Paid 플랜 가입자 대상이고, 계정당 10GB 저장 한도가 걸려 있다 — 아직 프로덕션 대량 트래픽을 전제로 한 상품은 아니라는 뜻으로 읽힌다(이 수치는 WebSearch 스니펫 기준이며 Cloudflare 공식 발표문 원문으로 직접 대조하지 못했다).

## 인상 깊은 문장

> "Cloudflare is working on K2, a durable event-stream primitive... Basically Cloudflare Kafka." (X, 제임스 로스 — Cloudflare 동향을 추적하는 개발자의 요약, Cloudflare 공식 발표문 원문 인용은 아님)

> 주문 완료 이벤트를 분석과 부정 거래 탐지 시스템에 함께 전달하는 데 활용 가능 (Slack GN⁺ 발췌)

## 댓글

hada 댓글 수·큐레이션 배지는 이번 세션에서 확인하지 못했다(`news.hada.io` 전면 차단). HN·Lobsters에서 K2 자체를 다루는 별도 스레드가 있었는지도 이번 WebSearch로는 특정하지 못했다. **벤더(Cloudflare) 자신의 발표문이 유일한 공식 출처이고, 그걸 직접 읽지 못한 채 3차 해설 기사로 재구성했다는 한계**를 분명히 밝힌다 — 벤치마크 수치나 실제 프로덕션 도입 사례, 장애 시 복구 동작 같은 세부는 전혀 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-29-diskless-kafka-object-storage]]가 커뮤니티 표준(KIP-1150)으로 논의하던 것을, Cloudflare가 벤더 상품으로 먼저 내놓았다

Diskless Kafka 노트에서 "KIP-1163·1164는 아직 Under Discussion이라 네이티브 Kafka에는 정식 반영 전이고, 지금 쓸 수 있는 건 AutoMQ·WarpStream·Aiven Inkless 같은 서드파티 구현"이라고 짚었다. K2는 그 "서드파티 구현" 목록에 Cloudflare라는 대형 플레이어가 들어왔다는 신호다 — 단 Kafka 프로토콜 호환을 내세우는 AutoMQ류와 달리, K2는 Cloudflare 자체 API·Worker 생태계에 묶인 독자 상품이다. ***"복제·조율 대상을 메시지에서 메타데이터로 줄인다"는 같은 아키텍처 원리가, 표준화 경쟁(KIP)과 벤더 락인 상품(K2) 두 갈래로 동시에 퍼지고 있다***는 게 흥미로운 지점이다.

### 핵심 전이 2 — "API는 유지, 저장만 바꾼다"는 마이그레이션 전략의 결은 다르다

Diskless Kafka는 ***기존 Kafka 클라이언트 API를 그대로 유지***하는 게 핵심 설계 제약이었다. K2는 그 제약이 없다 — Cloudflare 생태계 신규 상품이라 레거시 호환 부담 없이 구독·소비자 그룹 모델을 처음부터 설계할 수 있었다. 같은 "브로커가 데이터를 소유하지 않는다"는 원리를 "레거시 호환"(Diskless Kafka)과 "그린필드 신규 상품"(K2)이라는 정반대 제약 조건에서 각각 구현한 대비되는 두 사례로 읽을 수 있다.

### 핵심 전이 3 — Cloudflare 생태계에서 반복되는 "운영 부담을 지운다"는 포지셔닝

[[2026-09-22-cloudflare-python-workers-ga]]도 Python 런타임을 Workers에 들여오며 "직접 환경을 구성하지 않아도 된다"는 같은 톤의 가치 제안을 폈다. K2 역시 "클러스터를 직접 운영하거나 확장할 필요가 없다"는 동일한 포지셔닝이다 — Cloudflare가 최근 여러 상품에서 "직접 운영하는 인프라를 Cloudflare 플랫폼 안으로 흡수시킨다"는 전략을 일관되게 반복하고 있다는 패턴으로 묶일 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**원칙 차원에서는 바로 적용되지만, K2 자체를 지금 쓸 단계는 아니다.** CRS에서 "예약 확정 이벤트"는 재고 갱신·채널 매니저 동기화·매출 집계·부정거래 모니터링 등 여러 독립 시스템이 동시에 소비해야 하는 전형적 팬아웃 패턴이다. 지금은 이걸 메시지 큐(SQS·SNS)나 직접 구축한 이벤트 버스로 처리하고 있을 가능성이 높은데, K2가 제시하는 "하나의 이벤트를 구독별로 전체 수신시키거나 나눠 처리하게 한다"는 모델은 그 구조를 그대로 설명한다. 다만 ① K2는 아직 공개 베타(10GB 한도)라 프로덕션 전제로 쓰기엔 이르고, ② Cloudflare Workers 생태계에 이미 깊이 들어가 있지 않다면 이것 때문에 새 벤더 종속을 만들 유인은 약하다. 전이 가능한 원칙만 남기면: "같은 이벤트를 소비하는 시스템이 늘어날수록, 이벤트 발행자가 각 소비자를 일일이 알 필요 없는 구독 모델로 일찍 전환해두는 편이 뒤늦게 팬아웃을 추가하는 것보다 싸다."

## 연관 자료

- [[2026-09-29-diskless-kafka-object-storage]] — 같은 "브로커가 데이터를 소유하지 않는다"는 설계 원리, K2는 그 원리의 Cloudflare 자체 상품화 버전
- [[2026-09-04-kafka-streams-k8s-keda-scaling]] — 같은 이벤트 스트리밍 생태계, 파티션 소유권·스케일링이라는 자매 주제
- [[2026-08-10-atlassian-streamhub-kinesis-to-kafka]] — Tiered Storage로 브로커 저장 비용을 완화한 점진적 해법, K2·Diskless는 그 병목을 아예 없애는 더 근본적인 버전
- [[2026-09-22-cloudflare-python-workers-ga]] — 같은 Cloudflare 생태계, "운영 부담을 플랫폼 안으로 흡수시킨다"는 동일한 포지셔닝

## 한 달 뒤 회고

*(2026-11-02 즈음 — K2가 정식 GA로 전환됐는지, 저장 한도·가격 정책이 공개됐는지, 실제 프로덕션 도입 사례(특히 전자상거래 주문 이벤트 팬아웃)가 보고됐는지, `blog.cloudflare.com` 접근이 가능해지면 원문을 직접 대조해 이 노트의 추정 부분(베타 제한, 공식 비유)을 검증했는지 확인.)*
