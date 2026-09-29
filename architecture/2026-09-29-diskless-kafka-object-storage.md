---
title: "Diskless Kafka: 브로커가 데이터를 소유하지 않으면 무엇이 달라질까? (SoftwareMill) — 복제와 합의는 사라지지 않는다, 대상이 메시지에서 메타데이터로 옮겨갈 뿐"
source_title: "Diskless Kafka: What Happens When Brokers Stop Owning the Data?"
source_url: "https://softwaremill.com/diskless-kafka-object-storage-kip-1150-and-kafkas-future/"
source_name: "SoftwareMill"
referrer_url: "https://news.hada.io/topic?id=34454"
published_at: "확인 불가"
summarized_at: "2026-09-29"
category: "architecture"
tags: ["kafka", "diskless-kafka", "kip-1150", "object-storage", "s3", "distributed-systems", "streaming-infrastructure"]
---

# Diskless Kafka: 브로커가 데이터를 소유하지 않으면 무엇이 달라질까? (SoftwareMill)

> 출처: [Diskless Kafka: What Happens When Brokers Stop Owning the Data?](https://softwaremill.com/diskless-kafka-object-storage-kip-1150-and-kafkas-future/) (SoftwareMill) · GeekNews(id=34454) 경유 · 정리일 2026-09-29

> **출처 한계**: `news.hada.io`는 이 환경에서 egress 자체가 차단돼 있어 WebFetch를 시도하지 않았고, hada 원문 페이지(댓글 수·큐레이션 배지)를 확인할 방법이 없었다. `softwaremill.com` 원문도 WebFetch 시도 시 `EGRESS_BLOCKED`로 막혔다. 이 노트는 제공된 GeekNews 발췌 4줄(마지막 줄 "여러 파티션의 데이터를 묶어..."는 절단됨)과 WebSearch로 교차 확인한 KIP-1150 관련 자료(Aiven·AutoMQ·Factor House·2minutestreaming·Kai Waehner 등 여러 독립 소스가 같은 메커니즘을 설명)를 근거로 재구성했다. 핵심 메커니즘(리더 없는 쓰기, 공유 객체 스토리지 저장, 메타데이터 코디네이터가 오프셋·순서를 관리, 여러 파티션의 배치를 묶어 하나의 공유 로그 세그먼트 객체로 업로드)은 다수 소스가 일치해 신뢰도가 높지만, SoftwareMill 원문 고유의 논증 순서·비유·저자 관점은 확인하지 못했다. KIP-1150은 2026년 3월 2일 Apache Kafka 커뮤니티에서 찬성 9(binding)·5(non-binding)로 가결(Accepted)됐고, 실제 구현 KIP인 KIP-1163(Diskless Core)·KIP-1164(Diskless Coordinator)는 2026년 8월 기준 여전히 "Under Discussion" 상태라 네이티브 Diskless Topics는 아직 정식 Kafka 기능이 아니다 — 지금 당장 쓸 수 있는 건 AutoMQ·WarpStream·Aiven Inkless 같은 서드파티 구현체다. hada 댓글 수는 확인 못했지만, 같은 주제(Diskless Kafka·KIP-1150)를 다룬 여러 글이 Hacker News에서 독립적으로 논의됐다는 것은 WebSearch로 확인했다(아래 댓글 항목 참고).

## 한 줄 요약

**Diskless Kafka는 Kafka 클라이언트 API·프로토콜은 그대로 유지하면서, 브로커의 로컬 디스크 대신 S3 같은 공유 객체 스토리지를 메시지의 진짜 저장소로 삼는 설계다. 복제와 합의(consensus)가 사라지는 게 아니라, 그 대상이 대용량 메시지 자체에서 순서·오프셋·커밋 상태를 가리키는 작은 메타데이터로 옮겨간다는 것이 이 글이 짚는 핵심 재구조화다.**

## 핵심 포인트

- **API는 그대로, 저장 계층만 바뀐다** — 기존 Kafka 클라이언트·프로듀서/컨슈머 코드는 손대지 않고, 브로커가 메시지를 어디에 영속시키느냐만 바꾼다. 마이그레이션 비용을 낮추는 설계상 선택이다.
- **리더 없는(leaderless) 쓰기** — 기존 Kafka는 파티션마다 리더 브로커가 있어야 쓰기를 받을 수 있었지만, Diskless 구조에서는 임의의 브로커가 임의의 파티션에 대한 쓰기 요청을 받을 수 있다. 브로커가 여러 파티션에서 들어온 배치를 버퍼링했다가, ***여러 파티션의 데이터를 묶어 하나의 공유 로그 세그먼트 객체(Shared Log Segment Object)로 한 번에 S3에 업로드***한다 — 매 파티션·매 메시지마다 별도 객체를 쓰면 S3 API 호출 비용·지연이 감당 안 되기 때문에, 배칭 자체가 이 설계의 핵심 성능 레버다.
- **복제를 스토리지 서비스에 위임한다** — 기존 Kafka는 브로커 간에 직접 데이터를 복제해 가용 영역(AZ) 간 네트워크 트래픽 비용이 컸다. Diskless는 그 복제 책임을 S3 같은 객체 스토리지의 자체 내구성(보통 여러 AZ에 걸친 자동 복제)에 넘겨, ***AZ 간 트래픽과 브로커별 저장 비용을 함께 줄인다.***
- **메타데이터가 순서·오프셋·커밋을 관리한다** — 객체 스토리지는 메시지 바이트를 보관할 뿐이고, 별도의 코디네이터/메타데이터 계층이 "어떤 오프셋이 어떤 객체의 어디에 있는지, 어디까지 커밋됐는지"를 추적한다. 즉 ***복제와 합의는 사라지는 게 아니라, 무거운 메시지 데이터 대신 훨씬 작은 메타데이터를 두고 수행하는 문제로 축소***된다 — 합의해야 할 대상의 크기를 줄이는 게 이 아키텍처의 진짜 트릭이다.
- **브로커 확장·교체가 가벼워진다** — 브로커가 데이터를 "소유"하지 않으므로(로컬 디스크에 유일한 사본이 없으므로), 브로커를 늘리거나 교체할 때 대용량 파티션 데이터를 새 브로커로 옮기는 리밸런싱 부담이 크게 줄어든다. 브로커는 사실상 상태 없는(stateless) 프록시·컴퓨트 계층에 가까워진다.
- **아직 커뮤니티 표준 구현은 진행 중** — KIP-1150(방향성)은 2026년 3월 가결됐지만, 실제 구현 KIP(1163·1164)는 아직 "Under Discussion"이라 네이티브 Kafka에는 정식 반영 전이다. 현재 실사용 가능한 건 AutoMQ·WarpStream·Aiven Inkless 등 서드파티 구현이다.

## 인상 깊은 문장

> "Diskless is to No-Disks as Serverless is to No-Servers" — 디스크가 사라지는 게 아니라, 디스크가 활성 데이터의 내구성 계층이기를 멈춘다는 뜻이다. (WebSearch로 확인한 KIP-1150 진영의 프레이밍 문구, SoftwareMill 원문에서의 정확한 인용 여부는 미확인)

> "Diskless Kafka는 Kafka 클라이언트 API를 유지하면서 메시지를 브로커의 로컬 디스크 대신 S3 같은 공유 객체 스토리지에 저장하는 방식임" (GeekNews 발췌)

## 댓글

hada 댓글 수와 큐레이션 배지(GN⁺ 여부 등)는 `news.hada.io` 접속 차단으로 이 세션에서 확인하지 못했다. 다만 WebSearch로 확인한 바, Diskless Kafka·KIP-1150을 다룬 여러 다른 글(SoftwareMill 원문 포함 최소 4~5편)이 Hacker News에서 각각 별도로 논의됐다 — 논의 주제는 대체로 "표준 Kafka 클라이언트·툴 호환성이 정말 유지되는가", "쓰기 확인(ack)·WAL 복구는 어떻게 되는가", "벤치마크 수치가 있는가", "AutoMQ 같은 서드파티가 실제로 Kafka처럼 동작하는가"에 집중돼 있었다. 이는 이 주제가 인프라 엔지니어들 사이에서 "그럴듯한 마케팅"과 "실제로 검증 가능한 트레이드오프"를 가르는 회의적 질문을 받고 있다는 신호로 읽을 수 있다. 다만 이 GeekNews 글 자체의 hada 댓글 반응은 이 노트에서 확인하지 못했다는 한계를 명시한다. 또한 SoftwareMill은 인프라 컨설팅 회사로, Diskless Kafka 관련 구현 프로젝트 수주 유인이 있을 수 있다는 점도 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "복제 부담을 스토리지 계층으로 넘긴다"는 원칙이 [[2026-08-10-atlassian-streamhub-kinesis-to-kafka]]의 Tiered Storage와 같은 방향, 더 급진적인 버전

Atlassian의 StreamHub는 "실시간 데이터는 로컬 디스크, 오래된 데이터는 S3"라는 Tiered Storage로 EBS 비용을 줄였다 — 그런데 그 글이 발견한 진짜 병목은 "CPU가 아니라 broker 네트워크 처리량"이었다. Diskless Kafka는 그 병목 자체를 정면으로 겨냥한다 — 실시간 데이터까지 포함해 애초에 브로커 간 복제 트래픽 자체를 없애버리는 설계이기 때문이다. Tiered Storage가 "오래된 데이터는 밀어낸다"는 점진적 해법이라면, Diskless는 "애초에 브로커가 복제를 하지 않는다"는 더 근본적인 재구조화다 — 같은 문제(브로커 네트워크·저장 비용)에 대해 한쪽은 완화, 한쪽은 제거를 택한 대비되는 두 해법으로 나란히 읽을 수 있다.

### 핵심 전이 2 — "합의 대상을 작게 만든다"는 원칙은 이 가든이 반복 확인해 온 설계 패턴

[[2026-09-28-federated-learning-nvidia-flare-amazon-eks]]에서 연합학습이 "원본 데이터 대신 모델 가중치만 오간다"고 짚었던 것과, 이 글이 "대용량 메시지 대신 작은 메타데이터를 중심으로 복제·합의를 수행한다"고 짚은 것은 같은 설계 원리의 다른 도메인 적용이다 — ***무거운 실물 데이터는 값싸고 단순한 계층(객체 스토리지·로컬 사이트)에 맡기고, 비싸고 정교한 합의·조율 메커니즘은 훨씬 작은 대상(메타데이터·가중치)에만 집중시킨다.*** 분산 시스템이 스케일을 얻는 반복되는 방법 하나가 "무엇을 합의해야 하는 대상으로 남기고, 무엇을 그냥 복제 가능한 벌크 데이터로 취급할 것인가"를 재정의하는 것이라는 걸 다시 보여준다.

### 핵심 전이 3 — 브로커가 "상태 없는 프록시"가 되는 흐름은 [[2026-09-04-kafka-streams-k8s-keda-scaling]]의 스케일링 문제 자체를 재정의한다

데브시스터즈 사례는 "Kafka Streams를 k8s에서 스케일링할 때 파티션 불균형을 CPU 기반 HPA가 못 본다"는 문제를 consumer lag 기반 스케일링으로 풀었다. Diskless 아키텍처에서 브로커가 데이터를 소유하지 않게 되면, 애초에 "어느 브로커가 어느 파티션을 맡고 있는가"에 따른 리밸런싱 비용 자체가 줄어들어 스케일링 문제의 형태가 바뀐다 — 파티션 이동이 곧 대용량 데이터 이동을 의미하던 시대에서, 파티션 소유권 자체가 가벼운 메타데이터 재할당 문제로 축소되는 시대로 넘어간다는 뜻이다. 다만 이건 원리적 추론이고, 실제 KIP-1163/1164가 확정되기 전까지는 이 스케일링 이점이 실전에서 어느 정도로 구현될지 이 노트에서 확정할 수 없다.

## 호스피탈리티 / CRS 적용 포인트

온다가 지금 당장 자체 Kafka 클러스터를 Diskless 아키텍처로 전환할 상황은 아니고(운영 규모·비용 압박이 Atlassian·데브시스터즈급이 아니라면 이 정도 재구조화는 과할 수 있다), 직접 적용은 시기상조에 가깝다는 걸 정직하게 밝힌다. 다만 전이 가능한 원칙 하나는 남는다 — **"복제·조율이 필요한 대상을 최대한 작게 만든다"는 설계 원리**다. CRS의 멀티 리전·멀티 채널 동기화(예: 여러 채널 매니저·OTA에 동일 재고·요금을 전파하는 구조)에서, 전체 예약 레코드를 매번 복제·조율하는 대신 "무엇이 바뀌었는지"를 가리키는 작은 메타데이터(변경 이벤트, 버전 번호)만 조율 대상으로 삼고 실제 대용량 데이터는 더 단순한 계층(캐시·스냅샷)에 맡기는 방향으로 재설계할 여지가 있는지 점검해볼 만하다. 또한 "벤더가 표준 API 호환을 유지하면서 내부 저장 방식만 바꾼다"는 이 설계의 마이그레이션 전략 자체도, CRS가 향후 내부 저장소를 교체할 때 클라이언트(파트너 연동 API)를 건드리지 않고 내부만 바꾸는 하위 호환 전환의 참고 사례가 될 수 있다.

## 연관 자료

- [[2026-08-10-atlassian-streamhub-kinesis-to-kafka]] — 같은 "브로커 네트워크·저장 비용" 병목을 Tiered Storage로 완화한 점진적 해법, Diskless는 그 병목을 제거하는 더 근본적인 버전
- [[2026-09-04-kafka-streams-k8s-keda-scaling]] — 같은 Kafka 생태계, 파티션 소유권과 스케일링 문제라는 자매 주제
- [[2026-09-28-federated-learning-nvidia-flare-amazon-eks]] — "무거운 실물 데이터는 값싼 계층에, 합의는 작은 메타데이터/가중치에만 집중시킨다"는 같은 설계 원리의 다른 도메인(연합학습) 적용

## 한 달 뒤 회고

*(2026-10-29 즈음 — KIP-1163·1164 논의 진행 상황, AutoMQ·WarpStream·Aiven Inkless 같은 서드파티 구현체의 실제 프로덕션 도입 사례가 늘었는지, `news.hada.io`·`softwaremill.com` 접근이 가능해지면 원문·hada 댓글 반응을 직접 확인해 이 노트를 보강했는지 기록.)*
