---
title: "Agent Substrate (Google) — AI 에이전트를 격리하고 대기 자원을 줄이는 Kubernetes 실행 환경, AWS의 Agent Sandbox와 같은 업스트림 프로젝트 위에 서 있다"
source_title: "About Agent Substrate"
source_url: "https://news.hada.io/topic?id=35557"
source_name: "Google Cloud (docs.cloud.google.com, GKE 공식 문서) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=35557"
published_at: "2026-05-20 (Google 발표 기준, WebSearch 교차확인)"
summarized_at: "2026-10-18"
category: "architecture"
tags: ["agent-substrate", "kubernetes", "gvisor", "microvm", "cloud-hypervisor", "agent-isolation", "resource-efficiency", "google"]
---

# Agent Substrate (Google) — AI 에이전트를 격리하고 대기 자원을 줄이는 Kubernetes 실행 환경

> 출처: [About Agent Substrate](https://news.hada.io/topic?id=35557) (Google Cloud GKE 공식 문서 추정, GeekNews [id=35557](https://news.hada.io/topic?id=35557) 경유) · 정리일 2026-10-18

> **출처 한계**: `news.hada.io`는 이 세션에서 egress가 막혀(`ENOTFOUND`) GeekNews 토픽 페이지·hada 댓글을 직접 열지 못했다. `docs.cloud.google.com`도 이 세션에서 직접 페치가 막혀(`ENOTFOUND`) GKE 공식 문서 원문 역시 대조하지 못했다. 이 노트는 Slack 발췌 네 줄(마지막이 "gVisor 또는 Cloud Hypervisor 기반 마이크로VM으로 실행 환경을…"에서 끊김) + WebSearch 교차확인(Google의 공식 발표 시점, kagent 블로그·IT Brief 보도, DoiT 블로그의 성능 주장)을 조합한 재구성이다. GitHub 저장소의 정확한 URL은 이 세션에서 특정하지 못했다.

## 한 줄 요약

**Agent Substrate는 여러 AI 에이전트를 독립된 샌드박스에서 실행하면서도, 모델 응답이나 도구 실행을 기다리며 대기하는 에이전트의 메모리·파일 상태를 저장소에 내려두고 소수의 미리 준비된 Kubernetes Pod(warm Worker)로 돌려가며 쓰게 해 대기 자원을 회수하는 Kubernetes 실행 환경이다 — gVisor 또는 Cloud Hypervisor 기반 마이크로VM으로 격리하고, 저장된 상태를 다른 워커에서도 복원할 수 있어 실행 위치가 바뀌어도 세션이 끊기지 않는다. Google이 2026년 5월 공개했고, 같은 업스트림 Kubernetes 프로젝트(Agent Sandbox) 위에서 동작한다.**

## 핵심 포인트

- **"에이전트도 결국 워크로드다"라는 전제 — Kubernetes는 Pod 하이버네이션을 지원하지 않는다** — Kubernetes는 애초에 ***Pod를 "일시 정지"시키는 기능 자체가 없다.*** Agent Substrate는 그 공백을 메우는 레이어다 — 에이전트가 모델 응답이나 도구 실행 결과를 기다리는 "대기 시간"을, 미리 준비된 소수의 워커가 여러 에이전트를 번갈아 처리하는 구조로 해소한다.
- **대기 중 상태를 저장하고 복원 — 메모리·파일까지** — 에이전트가 ***유휴 상태***가 되면 메모리와 파일 상태를 스냅샷으로 저장소에 내려두고, 다시 요청이 오면 그 상태를 복원해 작업을 재개한다. Google의 공식 설명(WebSearch 교차확인)은 복원이 1초 미만으로 끝난다고 주장하며, 수백만 개의 중단된 에이전트 스냅샷을 저장해뒀다가 필요할 때 공유 워커 풀로 복원하는 규모를 언급한다.
- **실행 위치가 바뀌어도 세션은 유지된다** — 저장된 상태가 특정 워커에 묶여 있지 않고 ***다른 워커에서도 복원 가능***하다는 게 핵심이다. 에이전트마다 전용 Pod를 계속 띄워두는 부담 대신, 상태를 외부화해두고 워커는 공유 풀로 쓰는 구조다.
- **gVisor + 선택적 마이크로VM(Cloud Hypervisor) 이중 격리 옵션** — 기본은 ***gVisor***로 격리하고, 더 강한 격리가 필요한 워크로드에는 ***Kata Containers + Cloud Hypervisor 기반 마이크로VM*** 샌드박스 클래스를 선택할 수 있다(WebSearch 교차확인) — 격리 강도를 워크로드별로 고를 수 있게 한 설계다.
- **밀도 주장은 출처마다 다르다 — 정직하게 구분해서 받아들여야 한다** — 한 콘퍼런스 발표는 최대 ***30배 오버서브스크립션***을, DoiT 블로그는 표준 컨테이너 런타임 대비 ***10배 밀도***와 500ms 미만 재개 시간을 각각 주장한다(WebSearch 교차확인) — 두 수치가 다르고 어느 쪽도 이 세션에서 1차 소스로 대조하지 못했다. DoiT는 또한 이 프로젝트가 ***아직 초기 개발 단계로 프로덕션 사용에는 준비되지 않았다***고 밝힌다.
- **같은 업스트림 프로젝트 위에 서 있다 — Agent Sandbox와의 관계** — WebSearch로 확인한 가장 중요한 사실 하나: Agent Substrate는 ***Agent Sandbox의 역량을 기반으로 구축***됐고, Kubernetes 컨트롤 플레인의 표준적인 병목을 넘어서려는 목적의 신규 오픈소스 프로젝트로 소개된다. 즉 [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]]·[[2026-10-18-aws-agent-sandbox-eks-isolation-part2]]가 다룬 `kubernetes-sigs/agent-sandbox`(SandboxTemplate·SandboxClaim·SandboxWarmPool·Sandbox 4개 CRD)와 **완전히 다른 두 프로젝트가 아니라, 같은 업스트림 위에 Google이 한 층을 더 얹은 관계**일 가능성이 크다 — "AWS 자사 서비스 vs 범용 OSS 도구"라는 벤더 축의 대비가 아니라, "같은 Kubernetes SIG 프로젝트를 각자 다른 방식으로 배선한다"는 쪽에 더 가까운 그림이다.

## 인상 깊은 문장

> "여러 AI 에이전트를 독립된 샌드박스에서 실행하고, 대기 중인 에이전트의 자원을 회수하는 인프라 도구"
> (Slack 발췌 인용)

> "미리 준비된 소수의 Kubernetes Pod를 여러 에이전트가 번갈아 사용해, 에이전트마다 Pod를 계속 유지하는 부담을 줄임"
> (Slack 발췌 인용)

## 댓글

**hada 댓글·GeekNews 토픽 본문은 `news.hada.io` egress 차단으로 확인하지 못했다.** `docs.cloud.google.com`도 직접 열지 못해 Google 공식 문서 원문과 문장 단위로 대조하지는 못했다. **정직하게 밝힐 한계 두 가지**: ① 밀도·성능 수치(10배~30배, 500ms 미만 재개)가 출처마다 달라 어느 쪽이 공식 수치인지 특정하지 못했고, 벤더/파트너사(DoiT)·콘퍼런스 발표라는 2차 소스의 홍보성 과장 가능성을 배제할 수 없다. ② DoiT는 이 프로젝트가 아직 프로덕션 준비 단계가 아니라고 명시한다 — Google이 2026년 5월에 발표하고 9월에 GKE 가용성 보도가 나온 비교적 최신 프로젝트라, 성숙도를 보수적으로 봐야 한다.

## 내 생각 · 적용점

### 핵심 전이 — AWS Agent Sandbox 시리즈와 "벤더가 다른 두 솔루션"이 아니라 "같은 업스트림의 두 배선"일 가능성

이 노트에서 찾은 가장 중요한 사실은 Agent Substrate가 [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]]·[[2026-10-18-aws-agent-sandbox-eks-isolation-part2]]가 다룬 **같은 Agent Sandbox 프로젝트를 기반으로 한다**는 점이다. 겉으로는 "AWS가 EKS 위에 배선한 가이드" vs "Google이 공개한 범용 실행 환경"이라는 벤더 대비로 보이지만, 실제로는 **①** AWS는 Agent Sandbox를 EKS의 gVisor NodePool·네트워크 정책으로 ***배선하는 법***을 보여주고, **②** Google은 그 위에 ***유휴 자원 회수(상태 저장·복원·워커 풀 공유)***라는 한 층을 더 쌓은 확장으로 읽힌다. 같은 날 세 글을 나란히 정리하고 보니, "에이전트 실행 격리"라는 문제를 Kubernetes 생태계 전체가 하나의 업스트림 CRD 세트를 중심으로 수렴해가는 중이라는 그림이 더 선명해졌다.

### 핵심 전이 — vLLM Sleep Mode와 정확히 같은 철학, 대상만 GPU 가중치에서 에이전트 세션으로 바뀜

[[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]]가 다룬 vLLM Sleep Mode는 "완전 종료 대신 유휴 상태로 전환해 메모리 대부분을 반환하고, 깨울 때는 완전 재적재보다 훨씬 빠르게 재개한다"는 설계였다. Agent Substrate의 "대기 중 상태를 저장하고 필요시 복원한다"는 정확히 ***같은 패턴***을 에이전트 세션 단위로 적용한 것이다 — 대상(GPU 모델 가중치 vs 에이전트 메모리·파일 상태)은 다르지만, "완전히 끄지 않고, 상태를 외부화해 빠르게 되돌린다"는 해법의 골격은 동일하다. 이 가든에 쌓인 "유휴 자원 회수" 계열 노트(Run:ai의 동적 할당 회수, vLLM sleep/wake, 이제 Agent Substrate)가 같은 원칙이 레이어마다 반복해서 나타나는 걸 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다가 Kubernetes 위에서 다수의 AI 에이전트를 동시에 격리 실행해야 하는 규모의 문제를 아직 마주하지 않았다. 다만 전이 가능한 원칙은 명확하다 — CRS 내부에 여러 고객사(호텔/체인)별로 독립된 에이전트 세션(예: 고객사별 챗봇·자동화 워크플로우)을 운영하게 된다면, **"세션마다 전용 자원을 계속 유지하지 말고, 대기 중인 세션의 상태를 외부화해 소수의 공유 워커로 돌려 쓴다"**는 Agent Substrate의 설계 원칙은 자원 비용을 줄이는 구체적인 참고 모델이 된다. 특히 "실행 위치가 바뀌어도 세션이 유지된다"는 특성은, 멀티테넌트 CRS 환경에서 특정 워커 장애가 생겨도 고객사 세션이 끊기지 않게 하는 요구사항과 맞아떨어진다.

## 연관 자료

- [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]] — 이 글이 기반으로 삼는 것으로 보이는 같은 업스트림 Agent Sandbox 프로젝트, AWS의 EKS 배선 가이드
- [[2026-10-18-aws-agent-sandbox-eks-isolation-part2]] — 같은 시리즈 2부, EKS 네트워크 격리 구현
- [[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]] — "완전 종료 대신 유휴 상태로 전환해 빠르게 복원한다"는 같은 철학의 다른 적용 대상(GPU 모델 가중치)
- [[2026-10-17-nvidia-runai-kubernetes-gpu-scheduling]] — "정적 할당과 실사용 간극을 동적으로 회수한다"는 같은 계열의 자원 효율화 원칙, 대상은 GPU 스케줄링

## 한 달 뒤 회고

*(2026-11-18 즈음 — `news.hada.io`·`docs.cloud.google.com` 접근이 가능해지면 GitHub 저장소 정확한 위치, Agent Substrate와 Agent Sandbox의 실제 의존 관계, 10배/30배로 갈린 밀도 수치 중 Google 공식 자료의 숫자를 확인.)*
