---
title: "Cilium, Under the Hood #2 (컴투스플랫폼) — SNAT는 응답까지 노드를 거치고, DSR은 클라이언트 IP를 지킨 채 그 홉을 없앤다"
source_title: "Cilium, Under the Hood #2: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리"
source_url: "https://on.com2us.com/tech/cilium-ebpf-under-the-hood-part2/"
source_name: "컴투스플랫폼 기술 블로그 · Slack #개발-뉴스-dev-news 경유(TechArticles 봇, GeekNews 아님)"
referrer_url: "https://on.com2us.com/tech/cilium-ebpf-under-the-hood-part2/"
published_at: "2026-09 (정확한 게시일 미확인, 정리일에 근접한 것으로 추정)"
summarized_at: "2026-09-25"
category: "architecture"
tags: ["kubernetes", "ebpf", "cilium", "load-balancing", "snat", "dsr", "network-security"]
---

# Cilium, Under the Hood #2: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리

> 출처: [Cilium, Under the Hood #2: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리](https://on.com2us.com/tech/cilium-ebpf-under-the-hood-part2/) (컴투스플랫폼 기술 블로그) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-09-25
>
> **출처 한계**: 원문 `on.com2us.com`이 이 세션에서 egress 차단돼 WebFetch 불가. WebSearch로 원문 자체(저자·발행일·실습 세부)는 특정하지 못했다. 다만 "North-South 로드밸런싱·SNAT 모드·DSR 방식"이라는 핵심 개념과 그 동작 원리는 Cilium 공식 문서(docs.cilium.io)를 통해 일반론 차원에서 교차검증했다 — SNAT 모드에서는 노드가 외부 요청을 원격 노드의 백엔드로 리다이렉트할 때 소스를 자신으로 SNAT하고, DSR 모드에서는 백엔드가 서비스 IP/포트를 소스로 써서 외부 클라이언트에 직접 응답한다는 설명이 일반 Cilium 문서와 일치한다. 다만 이 노트의 수치·구조 설명 중 컴투스 원문에 고유한 세부(구체적인 벤치마크 수치·실습 시나리오)는 검증하지 못했다. [[2026-08-26-cilium-ebpf-under-the-hood]](#1편)와 마찬가지로 시리즈 특성상 컴투스 자체 실습·인프라 맥락이 있을 것으로 보이나 이 노트에는 반영하지 못했다.

## 한 줄 요약

**1편이 "IP는 위치일 뿐, 보안 단위는 라벨 기반 Identity"라는 구도를 세웠다면, 2편은 그 Identity가 실제로 트래픽을 어떻게 받아내는지 — North-South(클러스터 경계를 넘나드는) 로드밸런싱의 두 방식을 대비한다. SNAT 모드는 노드 IP로 소스를 바꿔치기해 통신하는 대신 응답이 반드시 그 노드를 다시 거쳐야 하는 네트워크 홉을 만들고, DSR(Direct Server Return) 모드는 클라이언트 IP를 보존한 채 백엔드가 클라이언트에 직접 응답해 그 홉을 없앤다.**

## 핵심 포인트

- **North-South 로드밸런싱 = 외부 트래픽을 클러스터 내부로 전달하는 관문** — Cilium의 North-South 로드밸런싱은 클러스터 바깥에서 들어온 트래픽을 내부 서비스로 전달하는 핵심 경로다. Kubernetes NodePort·LoadBalancer 서비스가 이 경로를 통해 외부에 노출된다.
- **SNAT 모드 — 노드 IP로 바꿔치기, 응답도 그 노드를 거친다** — 외부 요청이 도착한 노드에 실제 백엔드 파드가 없을 경우, 그 노드는 요청을 원격 노드로 전달하면서 소스 IP를 ***자신(노드)의 IP로 SNAT***한다. 이 때문에 응답 패킷도 원래 요청을 받았던 노드를 다시 거쳐 돌아가야 해, ***불필요한 네트워크 홉이 추가***된다(일반 Cilium 문서 기준 교차검증).
- **DSR 모드 — 클라이언트 IP 보존, 응답 경로 단축** — DSR 방식은 백엔드 파드가 ***클라이언트에게 직접 응답***하면서도 소스로 서비스 IP/포트를 사용해, 클라이언트 입장에서는 원래 요청한 서비스가 응답한 것처럼 보이게 한다. 이 과정에서 ***클라이언트의 실제 IP가 보존***되고, 응답이 원래 노드를 거치지 않아 ***네트워크 홉이 줄어들어 효율적***이다.
- **eBPF가 이 전환을 커널 레벨에서 처리** — 두 모드 모두 eBPF 해시맵 기반 datapath 위에서 동작하며, Cilium은 이를 통해 ***노드 간 패킷 전달과 로드밸런싱을 최적화***하고 트래픽 흐름에 대한 네트워크 가시성(observability)도 함께 제공한다.
- **선택의 트레이드오프** — SNAT는 별도 설정 없이 동작하는 기본값이지만 홉이 늘어 지연이 생기고, DSR은 지연을 줄이고 클라이언트 IP를 보존하지만 도입 조건(동일 L2 세그먼트 또는 터널링 지원 등)이 더 까다롭다는 것이 일반 Cilium 문서의 설명이다(컴투스 원문이 이 트레이드오프를 어떻게 서술했는지는 확인하지 못했다).

## 인상 깊은 문장

> "SNAT 모드는 노드 IP로 소스를 변경해 통신하며, 응답 경로가 노드를 거쳐 네트워크 홉이 발생함" / "DSR 방식은 클라이언트 IP를 보존하고 응답 경로를 단축하여 효율적인 트래픽 처리가 가능함" (Slack 발췌 원문)

## 댓글

GeekNews를 거치지 않아 hada 댓글은 없다(Slack TechArticles 봇이 컴투스플랫폼 블로그를 직접 링크). HN/Lobsters 큐레이션 여부는 확인하지 못했다. 1편과 마찬가지로 이 노트의 근거는 Slack 발췌 네 줄 + 일반 Cilium 문서 교차검증이 전부이며, 컴투스 조직 고유의 실측 벤치마크·트래픽 규모는 확인하지 못했다는 한계를 그대로 안고 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 1편의 "Identity vs IP" 구도가 2편에서 "성능 vs 정확성"의 구체적 트레이드오프로 착지한다

[[2026-08-26-cilium-ebpf-under-the-hood]](1편)는 "IP는 위치일 뿐, 정책의 단위는 Identity"라는 개념적 분리를 세웠다. 2편이 다루는 SNAT/DSR 대비는 그 개념이 실제 패킷 경로에서 어떤 비용으로 나타나는지 보여주는 사례다 — SNAT는 "정확성(항상 동작)"을 우선한 기본값이고, DSR은 "성능(홉 감소)과 정확성(클라이언트 IP 보존)"을 더 얻는 대신 배포 조건이 까다로워진다. 인프라 설계에서 "기본값은 안전하지만 느리고, 최적화는 조건부"라는 패턴이 여기서도 반복된다.

### 핵심 전이 2 — "경계를 넘을 때마다 비용이 생긴다"는 AWS 네트워킹 3부작의 원칙과 같은 결

[[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]]·[[2026-09-21-aws-network-data-transfer-part2-intra-region]]·[[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]]가 완성한 "네트워크 경계를 넘을 때마다 비용(과금이든 홉이든)이 생긴다"는 원칙이 여기서도 그대로 확인된다 — SNAT의 추가 홉은 "클러스터 노드 경계를 두 번 넘는" 구조적 비용이고, DSR은 그 경계 통과 횟수 자체를 줄이는 최적화다. 클라우드 네트워크 비용 구조와 쿠버네티스 데이터패스 설계가 "경계 통과 = 비용"이라는 같은 물리 법칙 위에서 움직인다는 방증이다.

## 호스피탈리티 / CRS 적용 포인트

온다의 백엔드가 쿠버네티스 위에서 NodePort/LoadBalancer로 외부 트래픽을 받는 구조라면, 이 대비는 실질적인 점검 항목이 된다 — 예약·결제처럼 클라이언트 IP 기반 지역 판단(사기 탐지, 지역별 요금 노출)이 필요한 API라면 SNAT 모드에서는 백엔드가 실제 클라이언트 IP를 못 보고 노드 IP만 보게 될 수 있어, DSR 전환이나 Proxy Protocol 같은 별도 보완이 필요한지 확인해야 한다. 다만 1편 노트에서도 밝혔듯, 이번 근거 역시 Slack 발췌와 일반론 교차검증뿐이라 "온다 클러스터가 지금 SNAT 홉으로 실제 지연을 체감하고 있는가"는 별도로 측정해야 하며, 이 노트만으로 전환을 결론 내리기엔 근거가 얇다.

## 연관 자료
- [[2026-08-26-cilium-ebpf-under-the-hood]] — 1편, "IP는 위치일 뿐 보안 단위는 Identity"라는 개념적 토대
- [[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]] — "경계를 넘을 때마다 비용이 생긴다"는 같은 원칙, 클라우드 과금 축
- [[2026-09-21-aws-network-data-transfer-part2-intra-region]] — 같은 3부작, AZ 경계 비용
- [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] — 같은 3부작, VPC/리전 경계 비용

## 한 달 뒤 회고
*(2026-10-25 즈음 — 원문 `on.com2us.com` 접근이 풀리면 저자·발행일과 SNAT/DSR 벤치마크 수치를 직접 대조해 이 노트를 보강. 온다 클러스터의 실제 로드밸런싱 모드(SNAT 기본값인지)와 클라이언트 IP 의존 기능이 있는지 점검.)*
