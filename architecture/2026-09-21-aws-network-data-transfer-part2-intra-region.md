---
title: "AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [2부: 리전 안의 트래픽] (AWS) — AZ 간 통신은 양방향으로 과금된다"
source_title: "AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [2부: 리전 안의 트래픽]"
source_url: "https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-02/"
source_name: "Amazon Web Services 한국 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-02/"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "architecture"
tags: ["aws", "networking", "data-transfer-cost", "availability-zone", "private-ip", "load-balancer", "series"]
---

# AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [2부: 리전 안의 트래픽] (AWS)

> 출처: [AWS 네트워크 데이터 전송 및 처리 요금, 아키텍처로 이해하기 [2부]](https://aws.amazon.com/ko/blogs/tech/aws-networking-dto-dp-02/) (AWS 한국 블로그) · Slack TechArticles 봇 직링크 · 정리일 2026-09-21
>
> **출처 한계**: `aws.amazon.com`이 egress 차단으로 원문 접근 불가. Slack TechArticles 봇 발췌(3개 불릿, 마지막이 "효율적인 아키텍처를 설계…"에서 잘림)와 AZ 간 데이터 전송 과금 구조에 대한 일반 지식(WebSearch, CloudZero 등)을 교차해 재구성했다. 3부작 시리즈의 2부([[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]] 1부, [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] 3부 참고).

## 한 줄 요약

**같은 리전 안에서도 가용 영역(AZ)이 다르면 데이터 전송이 양방향으로 과금되는데, 프라이빗 IP 통신 활용 등으로 불필요한 비용을 줄일 수 있고, 로드 밸런서·데이터베이스 같은 주요 서비스가 이 비용을 실제로 어디서 발생시키는지 파악해야 효율적인 아키텍처를 설계할 수 있다.**

## 핵심 포인트

- **AZ 간 전송 요금의 규칙** — 같은 리전 내 가용 영역(AZ) 간 발생하는 데이터 전송 요금의 규칙과 ***서비스별 최적화 방안을 상세히 설명***한다.
- **양방향 과금 — 프라이빗 IP로 절감** — AZ 간 통신 시 ***양방향으로 과금되는 비용 구조***를 이해하고, ***프라이빗 IP 통신 등을 통해 불필요한 비용을 절감***해야 한다. WebSearch로 보강한 일반 수치: Cross-AZ 전송은 보통 방향당 GB당 $0.01(양방향이면 실질 $0.02/GB)로, 처리량이 높은 마이크로서비스 아키텍처에서는 이 비용이 빠르게 누적된다.
- **로드 밸런서·DB가 비용 발생 지점** — ***로드 밸런서와 데이터베이스 등 주요 서비스의 네트워크 비용 발생 지점을 파악***하여 효율적인 아키텍처를 설계한다(발췌가 여기서 끊겨, 구체적으로 ALB·RDS가 AZ 간 트래픽을 얼마나 만드는지는 확인하지 못했다).

## 인상 깊은 문장

> "AZ 간 통신 시 양방향으로 과금되는 비용 구조를 이해하고, 프라이빗 IP 통신 등을 통해 불필요한 비용을 절감해야 한다."
> (Slack TechArticles 봇 발췌 원문)

## 댓글

**확인 불가.** 발췌가 짧아(3개 불릿) 로드 밸런서·데이터베이스 각각의 정확한 비용 발생 메커니즘(예: ALB가 같은 AZ의 타겟으로 우선 라우팅하는지)은 확인하지 못했다. AWS 자체 블로그라 자사 서비스 조합(예: AZ 어웨어 라우팅 옵션)을 홍보하는 방향으로 서술됐을 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 — 1부의 "인터넷 경계" 비용과 대칭되는 "리전 내부 경계" 비용, 마이크로서비스 아키텍처 전반에 적용되는 원칙

[[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]]가 인터넷 경계(바깥)의 비용을 다뤘다면, 이 2부는 같은 리전 "안"에서도 경계(AZ)를 넘으면 비용이 발생한다는 걸 보여준다 — 두 노트를 합치면 "경계를 넘을 때마다 비용이 발생한다"는 일반 원칙이 인터넷 경계뿐 아니라 리전 내부에도 적용된다는 게 명확해진다. [[2026-09-08-sega-sonic-rumble-dynamodb-elasticache]]나 [[2026-09-10-aws-eks-gemma4-vllm-part2-throughput-slo]]처럼 가든에 이미 쌓인 고처리량 아키텍처 노트들도 실제로는 이 AZ 간 비용을 어떻게 처리했는지가 숨은 변수였을 가능성이 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 고가용성을 위해 여러 AZ에 걸쳐 서비스를 배포한다면(일반적인 프로덕션 구성), 마이크로서비스 간 통신이 AZ 경계를 자주 넘으면 이 비용이 누적된다. 같은 AZ 내 인스턴스끼리 우선 통신하도록 라우팅을 설계하거나, 처리량이 큰 배치 작업(요금 재계산 등)은 같은 AZ 안에서 완결되도록 배치 전략을 짜는 것이 실질적인 비용 절감 포인트다.

## 연관 자료

- [[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]] — 같은 시리즈 1부(요금 구조와 인터넷 경계)
- [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] — 같은 시리즈 3부(VPC 간 연결과 하이브리드)
- [[2026-09-10-aws-eks-gemma4-vllm-part2-throughput-slo]] — 고처리량 서빙 아키텍처, AZ 간 비용이 숨은 변수였을 인접 노트

## 한 달 뒤 회고

*(2026-10-21 즈음 — 로드 밸런서·데이터베이스의 정확한 AZ 간 비용 발생 메커니즘을 원문에서 확인할 수 있는지 재확인.)*
