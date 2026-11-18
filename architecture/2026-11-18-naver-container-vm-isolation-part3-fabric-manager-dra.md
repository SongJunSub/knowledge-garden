---
title: "네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 3편 — Fabric Manager 파티션과 DRA를 이용한 GPU 할당(NAVER D2, 원문 접속 불가)"
source_title: "컨테이너처럼 쓰고, VM처럼 격리하기 3편 - Fabric Manager 파티션과 DRA를 이용한 GPU 할당"
source_url: "https://d2.naver.com/helloworld/6180316"
source_name: "NAVER D2"
referrer_url: "Slack #개발-뉴스-dev-news (TechArticles 직공유, GeekNews 아님)"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "architecture"
tags: ["naver", "nvidia-fabric-manager", "dra", "dynamic-resource-allocation", "kubernetes", "gpu"]
---

# 네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 3편 — Fabric Manager 파티션과 DRA GPU 할당

> 출처: [컨테이너처럼 쓰고, VM처럼 격리하기 3편](https://d2.naver.com/helloworld/6180316) (NAVER D2) · 정리일 2026-11-18
>
> **출처 한계**: d2.naver.com 차단으로 원문 미확인. NVIDIA Fabric Manager 파티션과 Kubernetes DRA(Dynamic Resource Allocation)의 공식 메커니즘은 WebSearch로 교차확인했으나(NVIDIA·Kubernetes SIG 공식 문서), 네이버가 이를 구체적으로 어떻게 조합했는지는 Slack 발췌 3줄(문장 끊김)에만 의존한다.

## 한 줄 요약

**NVIDIA Fabric Manager의 NVSwitch 파티션 기능과 Kubernetes DRA를 결합해, GPU 패스스루 VM(2편)에 들어가는 GPU 자원 할당 과정을 자동화하는 3편(공식 메커니즘은 확인, 네이버 구현 디테일은 미확인).**

## 핵심 포인트

- NVIDIA의 DRA 드라이버는 Fabric Manager 파티션을 ***디바이스 속성으로 노출***하고, Pod의 ResourceClaim이 특정 파티션(예: `gpu.nvidia.com/partitionN`)과 매칭되도록 요청하는 방식으로 동작한다(WebSearch로 확인한 NVIDIA/Kubernetes SIG 공식 문서, 드라이버 v0.5.0 기준).
- GPU 패스스루·VFIO 바인딩 전에 kubelet 플러그인이 해당 파티션을 활성화하고, GPU 반환 시 비활성화하는 흐름 — 이는 2편의 "GPU 패스스루" 문제를 자동화로 풀어내는 레이어에 해당한다.
- Kubernetes 1.32 이상을 요구하며 1.34부터 DRA가 기본 활성화된다는 점도 확인됨(일반 사양, 네이버의 실제 k8s 버전은 미확인).
- Slack 발췌는 "복잡한 GPU 할당 과정을 자동화하여 클라우드 인프라 운영의 편의성을 높이는 방식"이라고만 전해 네이버의 구체 구현(자체 컨트롤러를 만들었는지, NVIDIA 공식 DRA 드라이버를 그대로 썼는지)은 확인 불가.

## 인상 깊은 문장

> (Slack 발췌 문장이 끊겨 직접 인용 가능한 저자의 표현을 확보하지 못했다.)

## 댓글

Slack TechArticles 직공유, hada 경유 아님. 댓글 수·외부 큐레이션 확인 불가. **정직성 명시**: Fabric Manager·DRA의 공식 메커니즘은 확인했지만 "네이버가 실제로 이렇게 구현했다"는 연결은 추정이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 수동 할당에서 선언적 할당으로

Fabric Manager를 직접 조작하는 대신 DRA의 ResourceClaim으로 "원하는 파티션 모양"만 선언하면 시스템이 활성화/비활성화를 대신한다는 설계는, 2편의 수동 최적화 문제를 "선언적 인터페이스"로 추상화하는 전형적인 인프라 성숙 단계를 보여준다.

### 핵심 전이 2 — [[2026-11-18-naver-container-vm-isolation-part2-gpu-passthrough]]의 운영 문제를 자동화 레이어로 해결

2편이 GPU 패스스루의 부팅·메모리 문제를 다뤘다면, 3편은 그 할당 자체를 자동화하는 레이어다 — 시리즈가 "문제 발견(1편) → 수동 최적화(2편) → 자동화(3편) → 성능 검증(4편)" 순으로 쌓이는 구조로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** GPU 파티션 자동 할당은 CRS 인프라와 무관하다. 다만 "리소스 할당을 명령형(직접 설정)에서 선언형(원하는 결과만 기술)으로 바꿔 운영 부담을 줄인다"는 설계 원칙은, 멀티테넌트 환경의 테넌트별 자원 할당 로직을 다시 설계할 때 일반론으로 참고할 만하다.

## 연관 자료

- [[2026-11-18-naver-container-vm-isolation-part1-kata-containers]] — 같은 시리즈 1편
- [[2026-11-18-naver-container-vm-isolation-part2-gpu-passthrough]] — 같은 시리즈 2편, 이 글이 자동화하는 대상 문제
- [[2026-11-18-naver-container-vm-isolation-part4-ib-network-nvme]] — 같은 시리즈 4편

## 한 달 뒤 회고

*(2026-12-18 즈음 — 네이버가 NVIDIA 공식 DRA 드라이버를 그대로 썼는지 자체 구현했는지, 원문 확인 시 실제 파티션 전략을 점검.)*
