---
title: "StreamHub 확장: 하루 1,450억 이벤트 처리를 위해 Kinesis에서 Kafka로 전환 (Atlassian) — 일일 이벤트가 220억에서 1,500억으로 늘며 Kinesis 한계에 도달, AWS MSK 기반 Kafka로 전환했다. 발견한 건 CPU가 아니라 브로커 네트워크 처리량이 진짜 제약이라는 것. 그래서 용량 계획 기준을 클러스터 평균에서 '가장 뜨거운 브로커'로 바꿨다. '신뢰성은 기능 하나가 아니라 보수적 용량계획·명시적 트래픽제어·blast radius 제한·충분한 여유·검증된 복구경로의 조합'"
source_title: "Scaling StreamHub: Transitioning from Kinesis to Kafka for 145 Billion Daily Events"
source_url: "https://www.atlassian.com/blog/how-we-build/scaling-streamhub-transitioning-from-kinesis-to-kafka-for-145-billion-daily-events"
source_name: "atlassian.com"
referrer_url: "https://news.hada.io/topic?id=32323"
published_at: "2026-08-09"
summarized_at: "2026-08-10"
category: "backend"
tags: ["kafka", "kinesis", "streaming-infrastructure", "capacity-planning", "blast-radius", "reliability", "atlassian"]
---

# StreamHub 확장: 하루 1,450억 이벤트 처리를 위해 Kinesis에서 Kafka로 전환 (Atlassian)

> 출처: [Scaling StreamHub: Transitioning from Kinesis to Kafka for 145 Billion Daily Events](https://www.atlassian.com/blog/how-we-build/scaling-streamhub-transitioning-from-kinesis-to-kafka-for-145-billion-daily-events) (atlassian.com · GeekNews GN⁺ 요약) · 정리일 2026-08-10

## 한 줄 요약

**Atlassian의 StreamHub는 일일 이벤트 규모가 **220억 건에서 1,500억 건**으로 성장하며 **Amazon Kinesis의 한계**에 도달해 **AWS MSK 기반 Kafka**로 전환했다. 현재 **일일 1,500억 건 이상 수집·처리, 2,250억 건 이상 전달**, **초당 168만~320만 건** 처리 규모다. **Tiered Storage**로 실시간 데이터는 로컬 디스크, 오래된 데이터는 S3로 옮겨 EBS 비용을 절감한다. 마이그레이션 과정에서 발견한 것 — ***"CPU보다 broker 네트워크 처리량이 더 중요한 제약 요소"***였다는 것. 그래서 **용량 계획 기준을 클러스터 평균이 아니라 "가장 뜨거운 broker" 기준**으로 바꿨다. 트래픽 제어는 **rate limiting·Kafka quota·quarantine**으로 특정 워크로드의 영향을 제한하고, 장애 대응은 **다중 shard 클러스터, failover cluster, companion region** 구성으로 control plane 의존성을 제거한다. 핵심 원칙 — ***"신뢰성은 특정 기능 하나가 아니라, 보수적 용량 계획·명시적 트래픽 제어·blast radius 제한·충분한 headroom·검증된 복구 경로의 조합."*****

## 핵심 포인트

- **규모 성장** — 일일 이벤트 **220억 → 1,500억** 건. 현재 **수집/처리 1,500억+, 전달 2,250억+**, **초당 168만~320만 건.**
- **전환 이유** — **Amazon Kinesis 한계 도달** → **AWS MSK 기반 Kafka**로 이전.
- **Tiered Storage** — 실시간 데이터는 **로컬 디스크**, 오래된 데이터는 **S3**로 이동해 **EBS 비용 절감.**
- **핵심 발견** — ***"CPU보다 broker 네트워크 처리량이 더 중요한 제약."***
- **용량 계획 전환** — 클러스터 평균이 아닌 **"가장 뜨거운 broker" 기준.**
- **트래픽 제어** — **Rate limiting·Kafka quota·quarantine**으로 워크로드 영향 제한.
- **장애 대응** — **다중 shard 클러스터·failover cluster·companion region**으로 control plane 의존성 제거.
- **핵심 원칙** — ***"신뢰성은 보수적 용량 계획, 명시적 트래픽 제어, blast radius 제한, 충분한 headroom, 검증된 복구 경로의 조합."***

## 인상 깊은 문장

> "신뢰성이 특정 기능 하나가 아니라 보수적 용량 계획, 명시적 트래픽 제어, blast radius 제한, 충분한 headroom, 검증된 복구 경로의 조합"
> (이 글 전체의 결론이자, 신뢰성 공학 일반에 적용되는 원칙)

## 댓글

**hada 댓글을 확보하지 못했다** — 페이지에 댓글 섹션이 표시되나 실제 내용은 이번 정리에서 가져오지 못했다.

**읽을 때 감안**
- ①**정확히 몇 번의 실제 장애·failover 발동 사례가 있었는지는 이 글에 없다** — 설계 원칙은 명확하지만, 실전에서 얼마나 자주 그 원칙이 시험대에 올랐는지는 확인할 수 없다.
- ②**Kinesis에서 정확히 어떤 한계에 부딪혔는지(비용? 처리량 상한? API 제약?)의 구체적 내용이 이번 정리에서 확보한 요약에는 없다.**
- ③**Atlassian 자사 인프라 블로그**로, 성공적으로 전환했다는 서사가 자연스럽게 강조될 수 있다는 걸 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "가장 뜨거운 broker" 기준은 이번 시즌 반복해 온 "평균이 아니라 꼬리를 봐야 한다"는 원칙의 새 인프라 사례다

[[2026-08-04-why-elevators-take-so-long]]에서 다룬 ***"사람들은 평균 대기시간을 기억하지 않는다, p90 사례에 집착한다"***는 원칙이, 이 글에서 **용량 계획 층위**로 반복된다 — 클러스터 평균 부하를 기준으로 계획하면 실제 병목(가장 뜨거운 브로커)을 놓친다는 것. **엘리베이터 대기 체감부터 Kafka 브로커 용량 계획까지, "평균은 거짓말한다"는 원칙이 도메인을 가리지 않고 반복 확인**된다.

### 핵심 전이 2 — "blast radius 제한"은 이번 주 반복 확인한 단계적 마찰 거버넌스와 같은 설계 철학이다

[[2026-08-09-managing-ai-coding-costs-databricks]]의 ***"하드 예산 대신 가시성→게이트→다운시프트→차단"***과, 이 글의 **rate limiting·quota·quarantine**을 통한 blast radius 제한은 같은 원칙을 다른 도메인에서 반복한다 — **전면 차단이 아니라, 문제가 되는 워크로드만 점진적으로 격리·제한**한다는 것. AI 비용 거버넌스와 스트리밍 인프라라는 완전히 다른 문제에서, **"급격한 전면 조치보다 점진적·국소적 통제"**라는 같은 설계 원리가 반복 발견된다.

### 핵심 전이 3 — Tiered Storage는 이번 주 정리한 Canva·PlanetScale의 S3 활용 패턴과 같은 계열이다

[[2026-08-05-canva-session-revocation-at-scale]]의 S3 청크 분할, [[2026-08-10-planetscale-parallel-backups]]의 S3 기반 백업 순환에 이어, 이 글의 **Tiered Storage**(실시간=로컬, 오래된 데이터=S3)까지 — **이번 시즌 정리한 대규모 인프라 블로그 3편이 모두 S3를 "저렴하지만 느린 계층"으로 활용하는 같은 패턴**을 반복한다. 규모가 커진 시스템들이 수렴하는 공통 아키텍처 패턴으로 보인다.

### 핵심 전이 4 — 정직한 급소: 실제 장애 빈도·Kinesis의 구체적 한계가 이 요약에 빠져 있다

이 글의 원칙들(용량계획·트래픽제어·blast radius·headroom·복구경로)은 훌륭하지만, **그 원칙들이 실전에서 얼마나 자주 시험대에 올랐는지, Kinesis의 정확히 어떤 한계(비용인지 처리량인지 API 제약인지)에 부딪혔는지는 이번 정리에서 확인하지 못했다.** 원문을 더 깊이 파고들어야 확인 가능한 디테일로 남겨둔다.

## 호스피탈리티 / CRS 적용 포인트

- **CRS 이벤트 처리 인프라의 용량 계획을 클러스터 평균이 아닌 최대 부하 노드 기준으로(전이 1).** 예약·결제 이벤트 스트림의 용량 계획 시, 평균 처리량이 아니라 성수기 피크에 가장 부하가 몰리는 노드를 기준으로 계획.
- **Blast radius 제한 원칙을 CRS 시스템 전반의 장애 격리 설계에(전이 2).** 특정 사업자·특정 API 클라이언트의 비정상 트래픽이 전체 시스템에 영향을 주지 않도록 rate limiting·quota·quarantine 계층을 표준 설계 요소로.

## 연관 자료
- [[2026-08-04-why-elevators-take-so-long]] — *"평균이 아니라 꼬리를 봐야 한다"는 원칙의 인프라 버전*
- [[2026-08-09-managing-ai-coding-costs-databricks]] — *"단계적 마찰"이라는 같은 거버넌스 설계 철학*
- [[2026-08-05-canva-session-revocation-at-scale]] · [[2026-08-10-planetscale-parallel-backups]] — *S3를 저렴한 저장 계층으로 쓰는 같은 아키텍처 패턴*

## 한 달 뒤 회고
*(2026-09-10 즈음 — ①이 전환 이후 실제 장애·failover 사례가 얼마나 발생했는지, ②Kinesis의 구체적 한계가 무엇이었는지 추가로 확인됐는지, ③CRS 이벤트 인프라에 "가장 뜨거운 노드" 기준 용량 계획을 실제 도입했는지 기록.)*
