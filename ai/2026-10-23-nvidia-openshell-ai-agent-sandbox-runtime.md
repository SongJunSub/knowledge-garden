---
title: "OpenShell - AI 에이전트의 파일과 네트워크 접근을 제어하는 NVIDIA 런타임 — 정책 엔진이 에이전트 프로세스 바깥에 앉지만, 그 바깥은 여전히 호스트 커널이다"
source_title: "OpenShell"
source_url: "https://docs.nvidia.com/openshell/latest/about/overview.html"
source_name: "NVIDIA 공식 문서(docs.nvidia.com), WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=35833"
published_at: "확인 불가 (2026-03 GTC에서 alpha 공개로 추정)"
summarized_at: "2026-10-23"
category: "ai"
tags: ["ai-agent-security", "nvidia", "sandbox-isolation", "openshell", "network-policy", "credential-isolation", "kernel-level-isolation"]
---

# OpenShell - AI 에이전트의 파일과 네트워크 접근을 제어하는 NVIDIA 런타임

> 출처: [OpenShell 공식 문서](https://docs.nvidia.com/openshell/latest/about/overview.html) (NVIDIA) · GeekNews [id=35833](https://news.hada.io/topic?id=35833) 경유 · 정리일 2026-10-23
>
> **출처 한계**: `news.hada.io`와 `docs.nvidia.com`은 이 세션에서 egress 차단으로 WebFetch가 전부 실패했다(`ENOTFOUND`). WebSearch로는 꽤 두텁게 교차확인됐다 — NVIDIA 공식 문서 자체의 요약(선언적 YAML 정책, 커널 수준 격리, 파일·비밀정보·네트워크 접근 통제)과 NVIDIA의 자체 perspectives 블로그(설치 환경: macOS는 Docker Desktop, Linux는 Debian/Ubuntu, Windows는 WSL2; 여러 에이전트가 각자 격리된 샌드박스+정책+프로세스 ID로 동시 실행 가능, Claude Code·OpenCode·Codex를 같은 게이트웨이에서 동시에 돌리는 예시)가 WebSearch 스니펫으로 확인됐다. 다만 ***"API 키와 자격 증명을 에이전트에 노출하지 않고, 승인된 목적지로 가는 요청에만 런타임이 추가하는 방식"이라는 Slack 발췌의 구체적 메커니즘***은, "승인된 목적지만 허용하고 나머지는 차단한다"는 네트워크 정책 수준까지는 교차확인됐지만 그 ***자격증명 주입 방식의 세부***는 확인하지 못했다. "GTC 2026에서 alpha(v0.0.8)로 공개됐다"는 발행 시점은 제3자 리서치 페이지(Brenner-axiom, AI 생성 리포트로 표기됨) 하나에만 근거해 신뢰도를 낮게 잡는다. hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인 불가.

## 한 줄 요약

**NVIDIA가 공개한 오픈소스 런타임 OpenShell은 AI 에이전트에게 작업 권한을 주면서도, 선언적 YAML 정책으로 파일·비밀정보·네트워크 접근 범위를 커널 수준에서 제한한다 — 정책 엔진이 에이전트 프로세스 바깥에 앉아 파일시스템·네트워크·프로세스·추론(inference) 네 계층을 중재하고, 네트워크는 승인된 목적지 외 전부 차단해 데이터 유출을 막는 걸 핵심으로 삼는다.**

## 핵심 포인트

- **"정책이 프로세스 바깥에 있다"는 설계** — 제3자 분석에 따르면 정책 엔진은 파일시스템·네트워크·프로세스·추론 계층을 다루며 ***에이전트 프로세스 바깥***에 위치한다. 에이전트가 스스로 정책을 우회·수정할 수 없게, 통제권을 에이전트가 아니라 런타임이 쥐는 구조다.
- **네트워크 — 화이트리스트, 나머지는 전부 차단** — 공식 문서는 네트워크 정책이 ***승인된 목적지만 허용하고 그 외 아웃바운드 트래픽은 거부***한다고 밝힌다. 데이터 유출(exfiltration)을 겨냥한 설계라는 게 명시적 목표다.
- **멀티 에이전트 — 각자 자기 샌드박스·정책·프로세스 ID** — NVIDIA 자체 블로그에 따르면 여러 에이전트를 같은 게이트웨이 위에서 동시에 돌릴 수 있는데, ***에이전트별로 각자 파일시스템 정책·네트워크 정책·프로세스 ID가 분리된 샌드박스***를 쓴다. 예시로 Claude Code·OpenCode·Codex를 같은 게이트웨이의 별도 샌드박스에서 동시 실행하는 구성을 든다.
- **성숙도 — alpha, 공식 비판도 NVIDIA 발이 아니다** — 제3자 리서치(AI 생성 리포트로 명시된 페이지)는 "프로덕션 하드닝·제3자 보안 감사·멀티테넌트 지원이 더 필요하다"고 지적하는데, ***이건 NVIDIA 자신의 평가가 아니라 외부 비평***이라는 걸 구분해둔다.

## 인상 깊은 문장

> "network policies allow only approved destinations, and other outbound traffic is denied" (NVIDIA 공식 문서 요약, WebSearch 재구성)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가**(`news.hada.io` 차단). 정직하게 짚을 점: ①NVIDIA 자체 문서와 블로그가 핵심 근거라 "이 정책 엔진이 실제로 돌파당한 사례가 있는가"는 NVIDIA 쪽 자료에서 당연히 다루지 않는다 — 아래 핵심 전이에서 짚듯, 바로 이 공백이 중요하다. ②alpha 단계 소프트웨어라는 점(제3자 리포트 근거라 신뢰도 낮음)을 감안하면 "커널 수준 격리"라는 표현이 실제로 얼마나 단단한지는 독립된 보안 감사 없이는 판단하기 어렵다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-08-28-general-vm-not-enough-agent-isolation]]이 보여준 것과 똑같은 경계를 OpenShell도 쓴다는 게 걸린다.** Trail of Bits 글은 GPT 5.6-Cyber가 12시간 자율 작업으로 QEMU/KVM을 세 번 탈출했는데, 그중 세 번째는 ***호스트 커널의 가상화 스택 자체를 처음부터 다시 취약점 헌팅***해서 성공했다. 저자의 결론은 "VM 하나로는 사이버 역량을 갖춘 에이전트를 가두기 충분하지 않다"였고, 공격 표면을 줄인 Firecracker조차 ***같은 계열의 커널 결함으로 호스트를 하드락***시켰다. OpenShell의 "커널 수준 격리"도 결국 ***같은 호스트 커널이라는 공유 표면*** 위에 정책을 얹는 방식이다 — "정책 엔진이 에이전트 프로세스 바깥에 있다"는 것과 "그 바깥이 뚫릴 수 없다"는 건 다른 주장인데, OpenShell의 공식 자료는 전자만 증명하고 후자는 다루지 않는다. alpha 단계에서 독립 보안 감사가 없다는 제3자 비평이 바로 이 틈을 가리킨다.
**핵심 전이 2 — [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]]과 같은 문제를, 서로 다른 레이어에서 풀고 있다.** AWS Agent Sandbox는 Kubernetes CRD(SandboxTemplate·WarmPool·Claim·Sandbox) 네 개로 "격리"를 리소스 수명주기 문제로 쪼개고 gVisor·Cilium FQDN 필터링을 바닥에 깐다. OpenShell은 단일 호스트(또는 WSL2·Docker Desktop)에서 선언적 정책 파일 하나로 같은 "파일·네트워크 통제"를 구현한다. 두 접근 모두 "에이전트가 직접 커널을 보게 하지 않는다"는 목표는 같지만, ***AWS는 쿠버네티스 네이티브 멀티테넌시를, NVIDIA는 로컬 개발 워크플로우(Claude Code를 바로 그 위에서 돌리는 예시)를 1차 타깃으로 삼는다*** — 같은 문제의식이 서로 다른 운영 규모를 향해 분기하는 모습이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음.** 온다가 AI 에이전트에 파트너 호텔의 PMS·CRS API 키나 OTA 연동 자격증명을 쥐여줘야 하는 시점이 오면, ***"에이전트에게 자격증명 자체를 노출하지 않고, 승인된 목적지로 가는 요청에만 런타임이 인증을 끼워넣는다"***는 이 설계 원칙이 그대로 요구사항이 된다 — 에이전트가 프롬프트 인젝션으로 오염되더라도 승인되지 않은 외부 목적지로는 그 자격증명이 아예 흘러나갈 수 없게 만드는 구조다. 다만 핵심 전이 1에서 짚었듯, "정책이 있다"는 것과 "그 정책이 실제 공격에도 버틴다"는 것 사이의 검증은 이 alpha 단계 자료만으로는 확인되지 않으므로, 실제 도입 전에는 독립 보안 감사 여부를 먼저 확인해야 한다.

## 연관 자료

- [[2026-08-28-general-vm-not-enough-agent-isolation]] — 같은 "커널 수준 격리"가 실제로 사이버 역량 에이전트에게 뚫린 선행 사례, OpenShell의 신뢰 가정에 직접 거는 반증
- [[2026-10-18-aws-agent-sandbox-eks-isolation-part1]] — 같은 문제를 Kubernetes 네이티브 레이어에서 푸는 AWS의 답
- [[2026-10-11-microsoft-mxc-sandbox-execution]] — Microsoft의 답(OS 프로세스 샌드박스~VM까지 공통 JSON API), 세 빅테크가 같은 시기 같은 문제로 수렴하는 정황

## 한 달 뒤 회고

2026-11-23 즈음, `docs.nvidia.com` egress가 풀리면 원문으로 YAML 정책 스키마 예시와 "승인된 목적지에 자격증명을 끼워넣는" 메커니즘의 정확한 구현(프록시 레벨 injection인지, mTLS 인증서 교체인지)을 확인하고, 독립 보안 감사 결과가 나왔는지 점검한다.
