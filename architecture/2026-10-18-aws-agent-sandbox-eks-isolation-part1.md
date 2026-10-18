---
title: "AWS AI 에이전트 샌드박스 1부 — EKS 격리 (AWS) — 에이전트 실행 환경을 '격리'가 아니라 'SandboxTemplate·WarmPool·Claim·Sandbox 네 리소스의 수명주기 관리'로 재정의한다"
source_title: "AWS AI Agent Sandbox: EKS에서 격리된 에이전트 코드 실행 환경 구성하기 [1편]"
source_url: "https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-1/"
source_name: "AWS 한국 기술 블로그 (Slack #개발-뉴스-dev-news 발췌 경유, 원문 직접 열람 실패)"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-1/"
summarized_at: "2026-10-18"
category: "architecture"
tags: ["ai-agent-sandbox", "gvisor", "kubernetes", "eks", "aws", "agent-isolation", "sandboxtemplate", "warm-pool"]
---

# AWS AI 에이전트 샌드박스 1부 — EKS 격리

> 출처: [AWS AI Agent Sandbox: EKS에서 격리된 에이전트 코드 실행 환경 구성하기 [1편]](https://aws.amazon.com/ko/blogs/tech/aws-ai-agent-sandbox-eks-isolation-part-1/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-10-18

> **출처 한계**: `aws.amazon.com`은 이 세션에서 egress 자체가 막혀(`ENOTFOUND`) 원문을 직접 열람하지 못했다. 이 글은 GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 개념도 적용되지 않는다. 대신 WebSearch로 교차확인했다 — Kubernetes 업스트림 프로젝트 `kubernetes-sigs/agent-sandbox`(agent-sandbox.sigs.k8s.io, alpha 단계)가 **SandboxTemplate · SandboxClaim · SandboxWarmPool · Sandbox** 네 CRD로 구성된 동일한 리소스 모델을 공개 문서로 설명하고 있고, AWS의 `awslabs/ai-on-eks` 가이드(한국어판 포함)가 이 프로젝트를 gVisor NodePool과 Cilium FQDN 필터링으로 EKS 위에 배선하는 같은 구성을 소개한다는 정황까지는 검색 스니펫으로 확인했다. 다만 `agent-sandbox.sigs.k8s.io`와 `awslabs.github.io` 두 도메인 모두 이 세션에서는 직접 페치가 안 돼(`ENOTFOUND`), **AWS 블로그 본문의 정확한 문장·코드·저자·발행일은 이번에도 확인하지 못했다.** 아래 내용은 Slack 발췌 세 줄 + WebSearch 교차확인(업스트림 프로젝트 문서의 요약, alpha 단계라는 점, API 그룹명이 소스마다 `agents.x-k8s.io`/`extensions.agents.x-k8s.io`로 갈리는 불일치까지)을 조합해 재구성한 것이지, 원문을 문장 단위로 대조한 결과가 아니다.

## 한 줄 요약

**AI 에이전트가 생성한 코드를 안전하게 실행하기 위해, Kubernetes 기반 Agent Sandbox 프로젝트는 "격리"를 가상화 런타임 하나의 문제가 아니라 SandboxTemplate(관리자가 정의하는 청사진)·SandboxWarmPool(미리 데워둔 풀)·SandboxClaim(요청)·Sandbox(실제 실행 단위) 네 CRD로 쪼갠 수명주기 관리 문제로 풀고, 그 바닥을 gVisor 같은 런타임으로 커널 접근을 중재하는 보안 격리 계층이 받친다.**

## 핵심 포인트

- **네 가지 리소스로 쪼갠 수명주기** — ***SandboxTemplate***은 관리자가 정의하는 샌드박스 청사진(이미지·리소스·보안 정책), ***SandboxWarmPool***은 그 템플릿으로 미리 N개를 데워두는 풀, ***SandboxClaim***은 에이전트가 "샌드박스 하나 달라"고 보내는 요청, ***Sandbox***는 클레임이 바인딩된 실제 실행 Pod다. 하나의 "컨테이너 격리"가 아니라 **청사진·대기풀·요청·실행**이라는 네 단계로 쪼갠 게 이 설계의 핵심이다.
- **Warm Pool이 콜드 스타트를 지운다** — 에이전트 요청이 올 때마다 새 Pod를 처음부터 띄우는 대신, SandboxWarmPool이 미리 떠 있는 Pod 풀을 유지해두면 SandboxClaim은 그 풀의 Pod 하나에 즉시 바인딩된다. "에이전트 실행 환경도 결국 콜드 스타트 문제"라는 걸 인정하고 선제적으로 데워두는 접근이다.
- **gVisor가 호스트 커널 접근을 중재** — 실행 격리 자체는 ***gVisor***(사용자 공간에서 시스템 콜을 가로채 호스트 커널 노출을 줄이는 런타임) 같은 런타임이 맡는다. 업스트림 프로젝트는 더 강한 격리가 필요하면 Kata Containers(VM급 격리)로도 교체 가능하다고 소개한다 — 런타임 자체를 리소스 모델에서 떼어내 교체 가능하게 둔 설계다.
- **EKS에서는 가상화 런타임용 전용 NodePool로 배선** — AWS의 EKS 적용 가이드는 gVisor를 쓸 수 있는 전용 NodePool(AL2023 user-data로 `runsc` containerd shim을 설치)을 따로 구성해, 일반 워크로드 노드와 에이전트 실행 노드를 분리하는 구조로 읽힌다(교차확인 정황, 원문 문장 대조는 아님).
- **1부는 개념·구성, 2부는 네트워크 격리 실제 구현** — 같은 날 올라온 2부([[2026-10-18-aws-agent-sandbox-eks-isolation-part2]])가 NetworkPolicy·VPC CNI strict 모드 등 EKS 네트워크 격리 디테일을 다룬다 — 이 1부는 "무엇을 쪼갰는가"에 집중하고, 네트워크 레이어는 2부로 넘겨둔 구조로 보인다.

## 인상 깊은 문장

> "Kubernetes 기반의 Agent Sandbox를 사용하여 AI 에이전트가 생성한 코드를 안전하게 실행하는 구조"
> (Slack 발췌 인용)

> "SandboxTemplate과 Warm Pool 등 4가지 리소스를 통해 에이전트 실행 환경의 수명 주기를 관리함"
> (Slack 발췌 인용)

## 댓글

GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 자체가 해당되지 않는다. **정직하게 밝힐 한계**: `aws.amazon.com`·`agent-sandbox.sigs.k8s.io`·`awslabs.github.io` 세 도메인 모두 이 세션에서 직접 열지 못해, 이 노트는 Slack 세 줄 발췌와 WebSearch 검색 스니펫의 조합이다. 업스트림 `kubernetes-sigs/agent-sandbox` 프로젝트가 아직 **alpha 단계**이고 API 그룹명조차 소스마다 다르게 적힐 만큼 스펙이 안정화되지 않았다는 점은, 이 전체 스택(AWS 가이드 포함)이 아직 프로덕션 검증보다 레퍼런스 아키텍처 제시 단계에 가깝다는 뜻으로 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "VM/컨테이너 하나 = 격리 끝"이 아니라는 이 가든의 기존 결론과 정확히 같은 방향

[[2026-08-28-general-vm-not-enough-agent-isolation]]은 공격 표면을 크게 줄인 Firecracker조차 공유 커널 표면이 남아있어 완전한 답이 아니라고 결론지었다. 이 글의 설계는 그 결론을 역으로 받아들인 형태다 — gVisor 같은 런타임 하나에 격리를 전부 맡기지 않고, **런타임(실행 격리) + 수명주기 관리(4개 CRD) + 네트워크 격리(2부)**로 레이어를 분리해, 한 레이어가 뚫려도 다른 레이어가 남는 구조를 추구한다. "VM 하나로는 부족하다"는 진단에 대한 하나의 실천적 응답이 바로 이런 다층 분리 설계다.

### 핵심 전이 2 — [[2026-06-01-how-anthropic-contains-claude]]의 "환경 계층 먼저, 모델 계층 다음" 원칙의 Kubernetes 버전

Anthropic의 봉쇄 전략(gVisor·Seatbelt·VM, 환경 계층에서 먼저 막고 모델 정렬에 의존하지 않기)과 이 글의 Agent Sandbox는 **같은 원칙을 다른 레이어에서 구현**한다. Anthropic은 제품(claude.ai, Claude Code)에 봉쇄를 심었고, 이 글은 Kubernetes 클러스터 운영자가 재사용할 수 있는 CRD 세트로 같은 원칙을 일반화했다. "에이전트를 믿지 말고 환경으로 가둔다"는 가든의 반복되는 결론이 AWS·Kubernetes 생태계에서도 같은 형태로 수렴하고 있다.

### 핵심 전이 3 — Warm Pool은 [[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]]가 다룬 "콜드 스타트는 미리 데워서 없앤다"는 패턴의 또 다른 적용 대상

Gemma 4 vLLM 서빙 글은 GPU 모델 가중치의 콜드 스타트를 S3 스트리밍·sleep/wake로 해결했다. 이 글의 SandboxWarmPool은 **같은 패턴을 에이전트 실행 Pod 단위로** 적용한 것이다 — 대상(모델 가중치 vs 실행 환경 Pod)은 다르지만 "요청이 올 때 처음부터 띄우지 말고, 미리 데워둔 풀에서 즉시 꺼내 쓴다"는 해법의 형태는 동일하다.

## 호스피탈리티 / CRS 적용 포인트

온다가 지금 당장 Kubernetes 위에서 AI 에이전트가 생성한 코드를 실행할 일은 없어 **직접 적용은 멀다.** 다만 전이 가능한 원칙은 분명하다 — CRS 내부에 향후 "고객 요청에 따라 동적으로 코드/쿼리를 생성해 실행하는" 류의 에이전트 기능(예: 자연어로 리포트 쿼리 생성)을 들인다면, 그 실행 환경을 **①** 전용 런타임(가벼운 VM/가상화 격리)으로 가두고, **②** 요청이 올 때마다 새로 띄우지 말고 **미리 데워둔 풀**로 지연을 줄이고, **③** 실행 환경의 생성·회수를 명시적 리소스(이 글의 CRD 같은)로 추적 가능하게 만든다는 설계 원칙 세 가지는 그대로 참고할 만하다.

## 연관 자료

- [[2026-10-18-aws-agent-sandbox-eks-isolation-part2]] — 같은 날 올라온 2부, 이 글이 구성한 Agent Sandbox를 EKS 네트워크(NetworkPolicy·VPC CNI strict 모드)로 실제로 가두는 구현
- [[2026-10-18-agent-substrate-kubernetes-runtime]] — 같은 날 정리한, 거의 같은 문제의식(AI 에이전트 실행 격리 + 대기 자원 관리)을 범용 OSS 도구로 푸는 글 — AWS 자사 서비스 vs 벤더 중립 도구라는 벤더 축만 다르다
- [[2026-08-28-general-vm-not-enough-agent-isolation]] — "VM/컨테이너 하나로는 격리가 끝나지 않는다"는 이 글의 다층 분리 설계가 응답하는 원래 문제
- [[2026-06-01-how-anthropic-contains-claude]] — "환경 계층 먼저, 모델 계층 다음"이라는 같은 원칙의 제품 레벨 구현
- [[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]] — "미리 데워서 콜드 스타트를 없앤다"는 Warm Pool과 같은 패턴의 다른 적용 대상(GPU 모델 가중치)

## 한 달 뒤 회고

*(2026-11-18 즈음 — `aws.amazon.com`·`agent-sandbox.sigs.k8s.io` 접근이 가능해지면 원문과 업스트림 CRD 스펙을 직접 대조하고, alpha 단계였던 API 그룹명이 안정화됐는지, 온다 내부에서 에이전트 생성 코드를 실행할 필요가 실제로 생겼는지 점검.)*
