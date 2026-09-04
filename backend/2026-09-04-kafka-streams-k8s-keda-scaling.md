---
title: "Kafka Streams를 k8s로 옮기며 얻은 스케일링 설계 (데브시스터즈) — CPU 기반 HPA는 파티션 불균형을 못 본다: consumer lag을 직접 보는 KEDA로 바꾸고 cron·스레드 다중화까지 얹어 비용 80% 절감"
source_title: "Kafka Streams를 k8s로 옮기며 얻은 스케일링 설계: 비용 80% 절감까지"
source_url: "https://tech.devsisters.com/posts/kafka-streams-keda-scaling"
source_name: "tech.devsisters.com (데브시스터즈 기술 블로그)"
referrer_url: "https://tech.devsisters.com/posts/kafka-streams-keda-scaling"
published_at: "확인 불가 (Slack 공유일 2026-09-03 20:10 KST)"
summarized_at: "2026-09-04"
category: "backend"
tags: ["kafka-streams", "kubernetes", "keda", "autoscaling", "consumer-lag", "cost-optimization", "devsisters"]
---

# Kafka Streams를 k8s로 옮기며 얻은 스케일링 설계 (데브시스터즈)

> 출처: [Kafka Streams를 k8s로 옮기며 얻은 스케일링 설계: 비용 80% 절감까지](https://tech.devsisters.com/posts/kafka-streams-keda-scaling) (데브시스터즈 기술 블로그 · Slack #개발-뉴스-dev-news TechArticles 봇 직링크, GeekNews 경유 아님) · 정리일 2026-09-04

## 한 줄 요약

**데브시스터즈가 Kafka Streams 애플리케이션을 쿠버네티스로 옮기면서, CPU 기반 HPA가 파티션 불균형을 감지하지 못하는 문제를 KEDA와 consumer lag 기반 스케일링 정책으로 해결하고, cron 트리거와 스레드 다중화 전략까지 병행해 인프라 비용을 기존 대비 80% 이상 절감했다는 사례다.**

## 핵심 포인트

- **CPU 기반 HPA의 한계** — Kafka Streams 워크로드는 파티션 단위로 작업이 분배되는데, ***CPU 사용률만 보는 HPA는 특정 파티션에 트래픽이 몰려 불균형이 생겨도 이를 감지하지 못한다.*** 전체 평균 CPU는 낮아 보여도 특정 컨슈머만 밀려 있는 상황을 놓친다는 뜻으로 읽힌다.
- **KEDA + consumer lag 기반 스케일링** — ***Kafka Streams 애플리케이션을 k8s로 이전하며 KEDA와 consumer lag 기반의 스케일링 정책을 설계***했다. lag(처리 못한 메시지 적체량)을 직접 스케일링 트리거로 삼아 트래픽 패턴에 즉각 반응하는 자동화 환경을 구축했다.
- **cron 트리거 + 스레드 다중화 병행** — lag 기반 스케일링만으로 부족한 지점(예: 예측 가능한 트래픽 패턴에 선제 대응)을 ***cron 트리거***로 보완하고, 파드 수를 늘리는 대신 ***스레드 다중화***로 자원 활용을 높이는 전략을 함께 썼다.
- **비용 80% 이상 절감** — 위 조합으로 ***인프라 비용을 기존 대비 80% 이상 절감***했다고 밝힌다. 구체적인 비교 기준(이전 아키텍처의 형태, 절대 비용 규모)은 이 노트가 확보하지 못했다.

## 인상 깊은 문장

> "CPU 기반 HPA의 파티션 불균형 문제를 해결하고 트래픽 패턴에 즉각 반응하는 자동화 환경 구축" (Slack 발췌 요약)

## 댓글

**출처 한계.** `tech.devsisters.com`이 이 세션에서 egress 정책으로 차단돼 원문을 직접 읽지 못했다. WebSearch로도 이 특정 사례(데브시스터즈·Kafka Streams·KEDA·80% 절감)를 다룬 2차 자료는 찾지 못했다 — 검색은 KEDA·Kafka consumer lag 오토스케일링에 관한 일반 기술 자료만 반환했고, 이 글 고유의 수치·설계 디테일을 뒷받침하는 교차 출처는 확보하지 못했다. **Slack 발췌 3줄이 이 글에 대한 사실상 유일한 근거다.** hada 댓글이나 HN/Lobsters 큐레이션은 대상이 아니다(GeekNews 경유 글이 아님, 게임사 기술 블로그 직링크).

## 내 생각 · 적용점

### 핵심 전이 1 — "평균이 아니라 가장 뜨거운 지점을 봐야 한다"는 원칙이 Atlassian의 발견과 겹친다

[[2026-08-10-atlassian-streamhub-kinesis-to-kafka]]에서 Atlassian이 Kafka 클러스터를 확장하며 도달한 결론은 ***"용량 계획 기준을 클러스터 평균이 아니라 가장 뜨거운 broker로 바꿔야 한다"***는 것이었다. 이 글의 "CPU 기반 HPA는 파티션 불균형을 못 본다"는 정확히 같은 구조의 문제다 — **평균 지표는 국소적 병목을 숨긴다.** 한쪽은 브로커 단위, 다른 쪽은 파티션/컨슈머 단위라는 계층만 다를 뿐, "Kafka 인프라를 스케일링할 때는 평균이 아니라 가장 밀린 단위를 봐야 한다"는 원칙이 서로 다른 회사에서 독립적으로 재확인된다.

### 핵심 전이 2 — "측정 가능한 신호로 직접 스케일링한다"는 이번 배치의 반복 문법

CPU라는 간접 지표 대신 consumer lag이라는 도메인에 직접적인 지표로 스케일링 트리거를 바꾼 선택은, 값싼 대리 지표(proxy metric)보다 실제로 문제를 표상하는 지표를 찾아 쓰라는 일반 원칙의 인프라 버전이다. 근본 원인을 직접 가리키는 신호를 찾는다는 점에서, 이번 배치의 AIOps/로그 분석 계열 글들이 "원본 데이터를 규칙 기반으로 걸러 근거 있는 신호만 본다"고 말하는 것과 같은 태도를 인프라 자동화 층에서 보여준다.

## 호스피탈리티 / CRS 적용 포인트

CRS의 이벤트 기반 워크로드(예약 확정·채널 동기화·요금 재계산을 Kafka/큐로 처리하는 구조가 있다면) 스케일링 정책을 CPU 기반 HPA로만 잡고 있다면 이 글의 문제의식이 바로 적용된다 — **특정 파트너 호텔이나 특정 채널에 이벤트가 몰릴 때, 전체 평균 CPU는 낮아도 그 파티션만 지연될 수 있다.** consumer lag 기반 스케일링으로 전환을 검토할 근거가 되고, 예측 가능한 트래픽(체크인 러시 시간대 등)에는 cron 트리거를 병행하는 전략도 그대로 옮길 만하다. 다만 이 노트 자체가 원문을 확보하지 못한 상태라, 구체적인 KEDA ScaledObject 설정값이나 lag 임계치 같은 실무 디테일은 원문 확보 후 별도로 검증해야 한다.

## 연관 자료

- [[2026-08-10-atlassian-streamhub-kinesis-to-kafka]] — "평균이 아니라 가장 뜨거운 지점을 본다"는 같은 원칙을 브로커 단위에서 확인한 자매 사례
- [[2026-08-24-srelens-kubernetes-control-room]] — 같은 k8s 오토스케일링·운영 자동화 도메인, AI 에이전트 협업이라는 다른 축

## 한 달 뒤 회고

*(2026-10-04 즈음 — tech.devsisters.com 접근이 가능해지면 원문에서 KEDA ScaledObject 구체 설정과 80% 절감의 비교 기준(before/after 인스턴스 규모)을 확인해 이 노트를 보강했는지, CRS 이벤트 워크로드의 스케일링 정책을 실제로 점검했는지 기록.)*
