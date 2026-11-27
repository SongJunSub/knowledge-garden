---
title: "AWS 멀티 계정·리전 네트워크 토폴로지 시각화하기 (AWS) — 전용 서버 없이 CloudFormation과 CodeBuild로 30종 이상의 리소스를 수집해 S3에 쌓고 HTML 다이어그램으로 보여준다"
source_title: "AWS 멀티 계정·리전 네트워크 토폴로지 시각화하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/visualize-multi-account-multi-region-network-topology-aws/"
source_name: "AWS 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "architecture"
tags: ["aws", "network-topology", "visualization", "multi-account", "cloudformation", "observability"]
---

# AWS 멀티 계정·리전 네트워크 토폴로지 시각화하기 (AWS)

> 출처: [AWS 멀티 계정·리전 네트워크 토폴로지 시각화하기](https://aws.amazon.com/ko/blogs/tech/visualize-multi-account-multi-region-network-topology-aws/) (AWS 기술 블로그) · 정리일 2026-11-27

> **출처 한계**: `aws.amazon.com`이 egress 차단되어 원문을 직접 열람하지 못했다. WebSearch로 유사한 공식 AWS 솔루션인 "Workload Discovery on AWS"(CloudFormation으로 배포하며 아키텍처 다이어그램을 자동 생성하는 시각화 솔루션)와 AWS Config 집계자 기반 멀티 계정·리전 리소스 인벤토리 패턴을 교차확인했다. 다만 ***이 글이 그 공식 솔루션을 그대로 쓰는지, 자체 구축한 도구인지는 확인하지 못했다*** — Slack 발췌 기준으로만 정리한다.

## 한 줄 요약

**AWS 멀티 계정과 리전의 복잡한 네트워크 구성을 읽기 전용으로 수집해 HTML 다이어그램으로 시각화하는 도구로, CloudFormation과 CodeBuild만으로 별도 서버 없이 30종 이상의 리소스 정보를 S3에 모아 한눈에 파악하고 검색까지 할 수 있게 해준다.**

## 핵심 포인트

- **읽기 전용 수집 + HTML 다이어그램** — AWS 멀티 계정과 리전의 복잡한 네트워크 구성을 ***읽기 전용으로 수집***하여 HTML 다이어그램으로 시각화하는 도구.
- **서버 없이 CloudFormation+CodeBuild로 동작** — CloudFormation과 CodeBuild를 활용해 ***별도 서버 없이*** 리소스 정보를 수집하고 S3에 결과물을 저장한다는 구조 — WebSearch로 확인한 "Workload Discovery on AWS"가 배포 아티팩트를 S3에 올리고 CloudFormation으로 배포하는 방식과 같은 철학이다.
- **30종 이상 리소스를 한눈에 파악** — 30종 이상의 리소스 정보를 한눈에 파악하고 상세 정보 확인 및 검색 필터 기능을 통해 운영 효율성을 개선한다는 서술.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함. Slack 발췌: "AWS 멀티 계정과 리전의 복잡한 네트워크 구성을 읽기 전용으로 수집하여 HTML 다이어그램으로 시각화함" / "CloudFormation과 CodeBuild를 활용해 별도 서버 없이 리소스 정보를 수집하고 S3에 결과물을 저장함")

## 댓글

AWS 기술 블로그 신기능/도구 소개 글이라 hada 댓글 생태계 밖. 벤더 자체 도구 소개이므로 실제 대규모(수백 계정) 환경에서의 성능이나 한계는 서술되지 않았을 가능성.

## 내 생각 · 적용점

### 핵심 전이 — 같은 날 배치의 "재해석"과 "시각화"는 서로 보완적

같은 배치의 [[2026-11-27-bespin-aws-data-platform-restructuring]](AWS 기본 서비스를 데이터플랫폼 구조로 다시 묶어보기)가 "Region/AZ를 장애 범위 판단 기준으로, VPC/Subnet을 격리 경계로 재해석"하는 ***개념적 프레임워크***를 제시했다면, 이 글은 그 프레임워크를 실제로 ***눈으로 확인할 수 있게*** 해주는 도구다. 재해석한 구조를 다이어그램으로 시각화하지 않으면 그 구조가 실제 인프라와 일치하는지 검증할 방법이 없다는 점에서, 두 글은 "설계"와 "검증"의 짝을 이룬다.

### 적용점

멀티 계정·리전 환경에서 네트워크 구성이 문서와 실제 상태 사이에 드리프트(drift)가 생기기 쉬운데, 이런 자동 시각화 도구를 CI에 주기적으로 돌려 "실제 상태"를 계속 눈으로 확인하는 습관이 설계 문서의 신뢰성을 유지하는 데 도움이 된다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** CRS가 여러 호텔 고객사별로 계정을 분리 운영하는 멀티 테넌트 AWS 환경이라면, 이런 자동 시각화 도구로 계정 간 네트워크 경계와 연결 관계를 주기적으로 점검해 격리가 실제로 유지되는지 확인하는 용도로 쓸 수 있다.

## 연관 자료

- [[2026-11-27-bespin-aws-data-platform-restructuring]] — 같은 날 배치, Region/AZ·VPC/Subnet 재해석이라는 개념적 짝

## 한 달 뒤 회고

2026-12-27 즈음 — 원문이 열리면 이 도구가 AWS 공식 "Workload Discovery on AWS"와 같은 솔루션인지, 자체 구축 도구인지 확인한다.
