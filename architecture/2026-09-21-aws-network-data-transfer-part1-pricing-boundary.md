---
title: "AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [1부: 요금 구조와 인터넷 경계] (AWS) — 청구서만 봐서는 어느 서비스가 비용을 냈는지 식별하기 어렵다"
source_title: "AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [1부: 요금 구조와 인터넷 경계]"
source_url: "https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-01/"
source_name: "Amazon Web Services 한국 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-01/"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "architecture"
tags: ["aws", "networking", "data-transfer-cost", "nat-gateway", "internet-gateway", "cost-optimization", "series"]
---

# AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [1부: 요금 구조와 인터넷 경계] (AWS)

> 출처: [AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [1부]](https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-01/) (AWS 한국 블로그) · Slack TechArticles 봇 직링크 · 정리일 2026-09-21
>
> **출처 한계**: `aws.amazon.com`이 egress 차단으로 원문 접근 불가. Slack TechArticles 봇 발췌(3개 불릿, 마지막이 "인프라 운영의 경제성을 확보하는 방법을 제시…"에서 잘림)와 WebSearch로 확보한 NAT Gateway·인터넷 게이트웨이 요금 구조에 대한 일반 지식(CloudZero, Usage.ai, CloudChipr 등)을 교차해 재구성했다. 이 시리즈는 3부작이며([[2026-09-21-aws-network-data-transfer-part2-intra-region]], [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] 참고), 이 노트는 1부(요금 구조·인터넷 경계)를 다룬다.

## 한 줄 요약

**AWS 네트워크 비용은 "데이터 전송"과 "처리"라는 두 축으로 구성되고, 인터넷 게이트웨이·NAT Gateway 같은 인터넷 경계에서 비용이 발생하는데, 이 비용은 청구서에서 서비스별로 식별하기 어려워 설계 단계부터 고려해야 한다는 게 시리즈 1부의 핵심이다.**

## 핵심 포인트

- **비용의 두 축 — 전송과 처리** — AWS 네트워크 비용은 ***데이터 전송과 처리라는 두 가지 축으로 구성***되며, 설계 단계에서 이를 고려하는 것이 중요하다.
- **인터넷 경계(IGW·NAT)가 비용 발생 지점** — ***인터넷 게이트웨이와 NAT Gateway 등 인터넷 경계에서 발생하는 비용 구조***를 이해하고 최적화 전략을 수립해야 한다. WebSearch로 보강한 구체 수치: NAT Gateway는 시간당 $0.045 + 처리 GB당 $0.045가 항상 과금되며, 여기에 인터넷 egress $0.09/GB까지 더하면 실질 비용은 GB당 최대 $0.135에 달한다. S3·DynamoDB용 게이트웨이 엔드포인트는 무료라 NAT 트래픭을 크게 줄일 수 있고, IPv6 트래픽은 Egress-Only 인터넷 게이트웨이(무료)로 NAT 자체를 우회할 수 있다.
- **청구서만으로는 식별 불가 — 서비스별 분석 필요** — 청구서에서 식별하기 어려운 네트워크 비용을 서비스별로 분석하여 ***인프라 운영의 경제성을 확보하는 방법을 제시***한다(발췌가 여기서 끊겨 구체적인 분석 도구·방법론은 확인하지 못했다).

## 인상 깊은 문장

> "인터넷 게이트웨이와 NAT Gateway 등 인터넷 경계에서 발생하는 비용 구조를 이해하고 최적화 전략을 수립해야 한다."
> (Slack TechArticles 봇 발췌 원문)

## 댓글

**확인 불가.** AWS 자체 기술 블로그라 클라우드 네이티브 아키텍처를 권장하는 방향으로 서술됐을 가능성이 있다. "청구서에서 식별하기 어렵다"는 지적 자체는 AWS의 비용 대시보드(Cost Explorer)가 네트워크 비용을 세분화해 보여주지 못한다는 오래된 실무 불만과 일치하지만, 이 글이 그 문제를 AWS 자체 도구로 해결하자는 건지 서드파티 도구를 권하는 건지는 발췌만으로 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 AWS 네트워크·VPC 비용 계열 노트에 "인터넷 경계"라는 첫 번째 층위가 추가됨

가든에는 이미 AWS 네트워킹 비용/보안 관련 노트가 쌓여 있다 — [[2026-09-16-aws-network-firewall-container-attributes-eks-ecs]](네트워크 방화벽 규칙), [[2026-09-01-imweb-vpc-lattice-service-network-redesign]](VPC Lattice 서비스 네트워크), [[2026-09-20-aws-devops-agent-vpc-lattice-private-connections]](VPC Lattice 프라이빗 연결), [[2026-09-04-aws-ecs-design-02-deployment-network]](ECS 배포 네트워크). 이 시리즈는 그 노트들이 각각 다룬 개별 서비스(방화벽, Lattice, ECS)를 관통하는 **"네트워크 비용이 어느 경계에서 발생하는가"라는 공통 프레임**을 제공한다 — 1부가 다루는 인터넷 경계(IGW/NAT)는 이 계열 노트들이 다룬 서비스 경계 바로 바깥쪽 층위다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 OTA·PMS 등 외부 시스템과 인터넷을 통해 연동하는 구간(NAT Gateway를 경유하는 아웃바운드 API 호출)에서 실질적인 비용 최적화 포인트가 될 수 있다. 특히 S3·DynamoDB 같은 AWS 관리형 서비스를 게이트웨이 엔드포인트로 직접 연결해 NAT 트래픽을 줄이는 방법은, CRS가 대량의 데이터를 S3나 DynamoDB에 주고받는 배치 작업이 있다면 즉시 적용 가능한 비용 절감 항목이다.

## 연관 자료

- [[2026-09-21-aws-network-data-transfer-part2-intra-region]] — 같은 시리즈 2부(리전 내 AZ 간 트래픽)
- [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] — 같은 시리즈 3부(VPC 간 연결과 하이브리드)
- [[2026-09-16-aws-network-firewall-container-attributes-eks-ecs]] — 서비스 경계(EKS/ECS) 네트워크 비용을 다룬 인접 노트
- [[2026-09-20-aws-devops-agent-vpc-lattice-private-connections]] — 프라이빗 연결로 인터넷 경계를 아예 피하는 대안 패턴

## 한 달 뒤 회고

*(2026-10-21 즈음 — 원문 접근이 복구돼 "청구서에서 식별하기 어려운 네트워크 비용을 서비스별로 분석하는 방법"의 구체 내용을 확인할 수 있는지 재확인.)*
