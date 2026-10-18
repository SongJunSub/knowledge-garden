---
title: "AWS AI 에이전트 샌드박스 2부 — EKS 네트워크 격리 (AWS) — gVisor로 커널을 막아도 Pod가 사설·링크 로컬 대역에 열려 있으면 격리가 완성되지 않는다"
source_title: "AWS AI Agent Sandbox: EKS에서 격리된 에이전트 코드 실행 환경 구성하기 [2편]"
source_url: "https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-2/"
source_name: "AWS 한국 기술 블로그 (Slack #개발-뉴스-dev-news 발췌 경유, 원문 직접 열람 실패)"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-2/"
summarized_at: "2026-10-18"
category: "architecture"
tags: ["ai-agent-sandbox", "eks", "networkpolicy", "vpc-cni", "gvisor", "aws", "network-isolation"]
---

# AWS AI 에이전트 샌드박스 2부 — EKS 네트워크 격리

> 출처: [AWS AI Agent Sandbox: EKS에서 격리된 에이전트 코드 실행 환경 구성하기 [2편]](https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-2/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-10-18

> **출처 한계**: `aws.amazon.com`은 이 세션에서도 egress가 막혀(`ENOTFOUND`) 원문을 직접 열람하지 못했다. GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 자체가 해당되지 않는다. [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]]과 같은 날 올라온 연속 시리즈의 2부로, 이 노트 역시 Slack 발췌 세 줄이 유일한 1차 근거이고 WebSearch로는 "VPC CNI strict 모드"·"NetworkPolicy로 사설/링크 로컬 대역 차단"이라는 조합의 정확한 AWS 공식 문서를 이 세션에서 직접 열어 대조하지 못했다 — 아래는 Slack 발췌와 일반적인 Kubernetes/EKS 네트워크 보안 지식(VPC CNI의 정책 적용 타이밍 문제는 공개적으로 알려진 이슈)을 조합한 재구성이다.

## 한 줄 요약

**1부에서 gVisor로 커널 접근을 막아도, 샌드박스 Pod가 클러스터 내부의 사설 대역(다른 Pod·서비스)이나 링크 로컬 대역(클라우드 메타데이터 엔드포인트 등)에 자유롭게 접근할 수 있다면 격리는 완성되지 않는다 — 이 글은 NetworkPolicy로 그 대역들을 명시적으로 차단하고, VPC CNI의 strict 모드로 "정책이 적용되기 전에 트래픽이 먼저 나가는" 틈을 없애는 EKS 네트워크 격리 구현을 다룬다.**

## 핵심 포인트

- **런타임 격리와 네트워크 격리는 다른 문제** — 1부의 gVisor는 샌드박스 프로세스가 ***호스트 커널***에 닿는 걸 막지만, 그 프로세스가 네트워크로 ***다른 목적지***에 접근하는 건 별도로 막아야 한다. 코드 실행 격리(가로 방향: 프로세스↔커널)와 네트워크 격리(세로 방향: Pod↔네트워크)는 서로 다른 공격 표면이라는 게 이 글이 1부와 나누는 지점이다.
- **NetworkPolicy로 사설·링크 로컬 대역을 차단** — 샌드박스 Pod의 송신(egress) 트래픽에서 ***사설 IP 대역(RFC 1918)***과 ***링크 로컬 대역(169.254.0.0/16 등, 클라우드 인스턴스 메타데이터 서비스가 흔히 이 대역에 떠 있다)***을 명시적으로 차단한다. 에이전트가 생성한 임의 코드가 메타데이터 엔드포인트를 두드려 자격증명을 탈취하는 SSRF류 공격을 이 레이어에서 막는 구조로 읽힌다.
- **VPC CNI strict 모드 — "정책 적용 전 노출"을 없앤다** — 일반적인 Kubernetes NetworkPolicy 구현은 Pod가 뜨고 네트워크 인터페이스가 먼저 붙은 다음에 정책이 적용되는 짧은 틈이 생길 수 있다. ***VPC CNI의 strict 모드***는 정책이 적용되기 전까지 Pod의 네트워크 트래픽 자체를 차단해, 이 틈에 트래픽이 새나가는 경로를 없앤다.
- **1부가 쪼갠 4개 리소스의 바닥을 네트워크 레이어로 완성** — [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]]의 SandboxTemplate이 런타임·보안 정책의 청사진이라면, 이 글은 그 청사진에 네트워크 정책을 포함시켜 "런타임이 안전해도 네트워크가 열려 있으면 소용없다"는 격리의 마지막 조각을 채우는 역할로 보인다.

## 인상 깊은 문장

> "Amazon EKS 환경에서 Agent Sandbox와 gVisor를 활용해 AI 에이전트의 실행 환경을 격리하는 방법"
> (Slack 발췌 인용)

> "NetworkPolicy를 통해 샌드박스 Pod의 네트워크 접근을 제어하고 사설 및 링크 로컬 대역을 차단함"
> (Slack 발췌 인용)

> "VPC CNI의 strict 모드를 사용하여 정책 적용 전 트래픽 노출을 방지하는 보안 강화 전략이 필요함"
> (Slack 발췌 인용)

## 댓글

GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 자체가 해당되지 않는다. **정직하게 밝힐 한계**: 원문·업스트림 프로젝트 문서 모두 이 세션에서 직접 열지 못해, "사설·링크 로컬 대역 차단"의 정확한 NetworkPolicy YAML이나 "strict 모드"의 정확한 동작 범위(어떤 트래픽까지 차단하는지)는 Slack 발췌 수준의 문장으로만 남는다. 1부와 마찬가지로 이 전체 레퍼런스 아키텍처는 alpha 단계 업스트림 프로젝트(`kubernetes-sigs/agent-sandbox`)를 기반으로 한 것으로 추정되며, 실제 도입 사례나 침투 테스트 결과는 확인되지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-08-nds-trusted-research-environment-no-igw]]와 "경로를 없앤다"는 같은 철학, 다만 이 글은 더 좁은 범위에서 적용

농심데이터시스템의 TRE는 ***인터넷 게이트웨이 자체를 두지 않는*** 가장 근본적인 "경로 제거"였다. 이 글의 NetworkPolicy·VPC CNI strict 모드는 그보다 좁은 범위의 같은 철학이다 — 인터넷 전체를 끊는 대신, 에이전트 Pod가 ***특정 위험 대역(사설·링크 로컬)에만*** 닿지 못하게 좁혀서, 외부 API 호출 같은 정상적인 에이전트 기능은 유지하면서 위험한 경로만 제거한다. "경로 자체를 없앤다"는 원칙이 완전 차단(NDS)과 선택적 차단(이 글)이라는 두 가지 강도로 구현될 수 있다는 걸 나란히 보면 알 수 있다.

### 핵심 전이 2 — 링크 로컬 대역 차단은 [[2026-08-02-hugging-face-tailscale-agent-breach]]가 보여준 "탈출해도 훔칠 게 없게 만든다" 원칙의 네트워크 버전

Hugging Face/Tailscale 사고 노트가 제시한 처방(워크로드 신원 연합·단명 토큰)은 "자격증명 자체를 훔칠 가치가 없게" 만드는 접근이었다. 이 글의 ***링크 로컬 대역(클라우드 메타데이터 엔드포인트) 차단***은 같은 목표를 네트워크 레이어에서 구현한 것이다 — 에이전트 코드가 아무리 자유롭게 실행돼도, 메타데이터 서비스에 닿는 경로 자체가 막혀 있으면 인스턴스 자격증명을 훔칠 방법이 없다. "탈출 자체를 막는 것"과 "탈출해도 훔칠 게 없게 만드는 것"이 이 2부에서는 같은 NetworkPolicy 안에 공존한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 아직 에이전트가 생성한 코드를 EKS에서 실행하는 인프라를 운영하지 않는다. 다만 전이 가능한 원칙 하나는 명확하다 — **앞으로 CRS 내부에 코드 실행형 에이전트 기능을 들인다면, "런타임 격리가 끝났다"고 네트워크 격리를 당연히 따라오는 것으로 가정하면 안 된다.** 이 글이 보여주듯 런타임(1부)과 네트워크(2부)는 별도로 설계하고 검증해야 하는 서로 다른 레이어다 — 특히 클라우드 메타데이터 엔드포인트처럼 "같은 클라우드 안에서는 당연히 막혀 있을 것"이라고 가정하기 쉬운 경로를 명시적으로 점검하는 체크리스트 항목으로 남겨둘 만하다.

## 연관 자료

- [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]] — 같은 시리즈 1부, 이 글이 네트워크 레이어로 완성하는 4개 CRD 기반 수명주기 관리
- [[2026-10-18-agent-substrate-kubernetes-runtime]] — 같은 날 정리한 범용 OSS 에이전트 실행 격리 도구, AWS 자사 서비스 스택과 같은 문제의식을 다른 벤더 축에서 다룬다
- [[2026-09-08-nds-trusted-research-environment-no-igw]] — "네트워크 경로를 없앤다"는 같은 철학을 더 근본적인 강도(IGW 자체 제거)로 적용한 사례
- [[2026-08-02-hugging-face-tailscale-agent-breach]] — "탈출해도 훔칠 게 없게 만든다"는 원칙이 자격증명 레이어에서 구현된 사고 사례, 이 글의 링크 로컬 차단이 네트워크 레이어에서 같은 원칙을 구현

## 한 달 뒤 회고

*(2026-11-18 즈음 — `aws.amazon.com` 접근이 가능해지면 NetworkPolicy·VPC CNI strict 모드의 정확한 매니페스트를 원문으로 대조하고, 1부·2부가 실제로 같은 레퍼런스 아키텍처의 연속 문서인지, 온다 내부에 코드 실행형 에이전트 기능 도입 논의가 생겼는지 점검.)*
