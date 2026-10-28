---
title: "Amazon MSK Express Broker에서 Kafka 트랜잭션 워크로드를 최적화하는 방법 (AWS) — 운영 복잡성을 줄여주는 고정 복제 설정이, 트랜잭션의 커밋 경로에서는 숨은 비용으로 되돌아온다"
source_title: "Amazon MSK Express Broker에서 Kafka 트랜잭션 워크로드를 최적화하는 방법"
source_url: "https://aws.amazon.com/ko/blogs/tech/optimizing-kafka-transactional-workloads-on-msk-express-broker/"
source_name: "AWS 한국 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-28"
category: "backend"
tags: ["kafka", "msk", "transactions", "exactly-once", "performance-tuning", "aws"]
---

# Amazon MSK Express Broker에서 Kafka 트랜잭션 워크로드를 최적화하는 방법 (AWS)

> 출처: [Amazon MSK Express Broker에서 Kafka 트랜잭션 워크로드를 최적화하는 방법](https://aws.amazon.com/ko/blogs/tech/optimizing-kafka-transactional-workloads-on-msk-express-broker/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-28

> **출처 한계**: `aws.amazon.com`은 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND`)으로 원문을 읽지 못했다. Slack 발췌 3줄 + 스레드 상세 답글 2개(서로 거의 같은 내용을 반복)만으로 작성됐다 — 구체적인 처리량 수치, 설정 파라미터 이름, 저자는 확인하지 못했다.

## 한 줄 요약

**Amazon MSK Express 브로커는 스토리지 프로비저닝 없이 고정된 복제 설정으로 운영 복잡성을 낮추지만, Kafka 트랜잭션(원자적 쓰기·exactly-once)을 쓰면 `__transaction_state` 내부 토픽 기록·커밋 마커 같은 추가 오버헤드가 발생해 일반 워크로드보다 훨씬 낮은 처리량에서 성능 한계에 도달한다 — 프로듀서 수를 늘리는 것만으로는 해결되지 않고, 프로듀서·컨슈머·클러스터 계층별로 병목을 정확히 판별해야 한다.**

## 핵심 포인트

- **Express 브로커의 트레이드오프** — 고정된 복제 설정으로 운영 복잡성은 줄지만, 이 "고정"이라는 특성 자체가 트랜잭션처럼 커밋 경로에 추가 작업이 필요한 워크로드에서는 ***일반적인 처리량 공식이 적용되지 않는 병목***으로 되돌아온다.
- **트랜잭션의 추가 오버헤드** — 원자적 쓰기와 exactly-once 처리를 보장하려면 트랜잭션 코디네이터, 내부 상태 토픽(`__transaction_state`), 커밋 마커 기록 같은 추가 작업이 발생한다. 이 오버헤드는 네트워크 대역폭이 아니라 ***커밋 경로의 고정 비용***에서 나온다는 점이 핵심이다.
- **프로듀서 수 증가로는 해결 안 됨** — 트랜잭션 워크로드는 네트워크 기준선보다 훨씬 낮은 처리량에서 성능 한계에 도달하며, 단순히 프로듀서 수를 늘리는 것만으로는 병목을 해소할 수 없다고 명시한다.
- **계층별 병목 판별이 핵심** — 결국 트랜잭션이 브로커에 가하는 부하를 단계별로 분석하고, 워크로드의 처리량 상한을 계산하는 방법과 함께 프로듀서·컨슈머·클러스터 각 계층에서 수행해야 할 최적화 전략을 제시한다. 자신의 서비스 환경에 맞는 병목 지점을 찾아내 설정을 조정하는 과정이 핵심이라는 결론이다.

## 인상 깊은 문장

> "트랜잭션은 원자적 쓰기와 'exactly-once' 처리를 보장하기 위해 트랜잭션 코디네이터, 내부 상태 토픽, 커밋 마커 기록 등 추가적인 오버헤드를 발생시키기 때문입니다." (Slack 스레드 상세 발췌)

## 댓글

GeekNews를 경유하지 않고 Slack `TechArticles` 봇이 직접 수집한 글이라 hada 댓글·HN/Lobsters 큐레이션은 해당 없음. AWS 공식 기술 블로그로, 자사 서비스(MSK Express)의 한계를 스스로 인정하면서 최적화 가이드를 제공하는 성격의 글이라 비교적 균형 잡힌 톤으로 보이나, 실제 벤치마크 수치나 재현 가능한 설정값은 Slack 발췌 수준에서는 확인할 수 없다.

## 내 생각 · 적용점

**핵심 전이 — [[2026-09-29-diskless-kafka-object-storage]]와 "Kafka 운영 복잡성을 어떻게 줄이는가"라는 같은 질문에 반대 방향 답을 준다.** 그 글은 브로커 자체에서 로컬 디스크를 없애고 오브젝트 스토리지로 복제를 대체해 운영 부담을 구조적으로 걷어내려 했다. 이 MSK Express 글은 반대로 "고정된 복제 설정"이라는 또 다른 단순화 전략을 쓰지만, 트랜잭션처럼 커밋 경로에 비용이 드는 워크로드에서는 그 단순화가 숨은 성능 한계로 돌아온다는 걸 보여준다 — 운영 복잡성을 줄이는 선택은 공짜가 아니라 워크로드 특성에 따라 다른 비용으로 전가된다는 점에서 두 글이 서로를 보완한다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능.** 온다가 예약·재고 변경 이벤트를 Kafka로 처리한다면, 모든 이벤트에 트랜잭션을 걸기보다 ***원자성이 꼭 필요한 경로(결제 확정, 재고 차감처럼 중복·누락이 치명적인 지점)만 선별해 트랜잭션을 적용***하고 나머지는 일반 처리량 공식을 따르는 설계가 이 글의 교훈과 맞아떨어진다. 구체적인 MSK Express 설정 파라미터는 원문 확보 전까지는 가져올 수 없다는 점은 정직하게 밝혀둔다.

## 연관 자료

- [[2026-09-29-diskless-kafka-object-storage]] — Kafka 운영 복잡성을 줄이는 반대 방향 접근(로컬 디스크 제거), 이 글의 "고정 설정"이라는 단순화와 대비되는 사례.

## 한 달 뒤 회고

2026-11-28 즈음, `aws.amazon.com` 접근이 풀렸다면 구체적인 처리량 수치·설정 파라미터를 원문으로 확인하고, 온다 CRS의 Kafka 사용 이벤트 중 실제로 트랜잭션이 걸려 있는 경로가 있는지 점검한다.
