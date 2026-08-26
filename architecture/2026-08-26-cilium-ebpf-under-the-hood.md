---
title: "Cilium, Under the Hood #1 (컴투스플랫폼) — IP는 위치일 뿐, Kubernetes 네트워크 보안의 진짜 단위는 Identity"
source_title: "Cilium, Under the Hood #1: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리"
source_url: "https://on.com2us.com/tech/cilium-ebpf-under-the-hood-part1/"
source_name: "컴투스플랫폼 기술 블로그"
summarized_at: "2026-08-26"
category: "architecture"
tags: ["kubernetes", "ebpf", "cilium", "network-security", "service-mesh"]
---

# Cilium, Under the Hood #1: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리

> 출처: [Cilium, Under the Hood #1: eBPF로 들여다보는 Kubernetes 네트워크의 동작 원리](https://on.com2us.com/tech/cilium-ebpf-under-the-hood-part1/) (컴투스플랫폼 기술 블로그) · 정리일 2026-08-26
> **출처 한계**: 원문 `on.com2us.com`이 이 세션에서 egress 차단되어 WebFetch 불가. WebSearch로 원문 자체(제목·저자·발행일)를 특정하지 못했고, "Identity가 파드 정체성·Endpoint가 노드 내 워크로드·IP가 위치"라는 3분 개념 정의와 "멀티클러스터 실습" 언급은 Slack 발췌 세 줄이 사실상 유일한 확정 정보다. 다만 "IPTables 선형 탐색 병목을 eBPF로 해결"·"Identity 기반 보안 정책"이라는 핵심 주장은 Cilium 공식 문서·다수의 독립 기술 블로그(KT Cloud, b-nova, 여러 Medium 글)와 일반론 차원에서 일치함을 WebSearch로 교차검증했다 — 단 이 노트의 수치·구조 설명 중 컴투스 원문에 고유한 세부(실습 시나리오·멀티클러스터 구축 방법 등)는 검증하지 못했다.

## 한 줄 요약
**Cilium의 핵심 발상은 "IP로 방화벽 규칙을 짜지 말고, 라벨로 만든 정체성(Identity)으로 짜라"는 것** — 파드가 뜨고 죽을 때마다 바뀌는 IP 대신, 라벨 조합을 해시한 불변의 Identity를 보안 정책의 단위로 삼아 IPTables의 선형 탐색 병목을 eBPF 해시맵으로 우회한다.

## 핵심 포인트
- Cilium은 쿠버네티스 환경에서 ***IP 대신 라벨 기반의 Identity를 사용하여 네트워크 보안 정책을 관리***한다 — 파드의 namespace·app·version 등 라벨 집합을 해시해 만든 식별자가 워크로드 생애주기 동안 불변으로 유지된다(일반 Cilium 문서 기준 교차검증).
- 전통적인 IPTables는 규칙을 체인(연결 리스트)으로 순차 탐색하는 구조라 서비스 수가 늘수록 패킷 처리 비용이 사실상 선형(O(n))으로 증가한다 — Cilium은 이 ***선형 탐색 병목을 해결하기 위해 eBPF를 활용해 커널 네트워크 스택을 최적화***, 해시맵 기반 조회로 서비스 수와 무관하게 일정한 조회 비용을 노린다(일반론 교차검증).
- 개념 3분법: ***Identity는 파드의 정체성을, Endpoint는 노드 내 워크로드를, IP는 위치를 나타낸다*** — IP는 언제든 재할당될 수 있는 "주소"일 뿐이고, 보안 정책이 실제로 걸리는 대상은 Identity라는 것이 Cilium 아키텍처의 핵심 분리.
- 이 분리 덕분에 파드가 재스케줄링되어 IP가 바뀌어도 같은 라벨을 가지면 같은 Identity·같은 정책이 그대로 적용된다(kube-proxy 없는 클러스터에서 eBPF datapath가 이 매핑을 담당한다는 것이 일반 Cilium 아키텍처 문서의 설명).
- 원문은 이 데이터패스 동작 원리를 ***실습 기반***으로 설명하며 멀티클러스터 환경 구축까지 다룬다고 하나(Slack 발췌), 구체적인 실습 절차·클러스터 간 Identity 동기화 방식 등은 원문을 직접 확인하지 못해 이 노트에 옮기지 못한다.

## 인상 깊은 문장
> "Identity는 파드의 정체성을, Endpoint는 노드 내 워크로드를, IP는 위치를 나타내는 핵심 개념으로 정의함" (Slack 발췌)

## 댓글
- **GeekNews(hada) 경유가 아니다** — Slack TechArticles 봇이 컴투스플랫폼 블로그를 직접 링크한 글이라 hada 댓글 자체가 없다.
- HN/Lobsters 큐레이션 여부도 확인되지 않았다(원문 검색으로 별도 영문권 토론 스레드를 찾지 못함).
- 원문이 시리즈 1편(`#1`)이라는 점에서, 이번 배치에서 다루는 내용은 개념 소개 수준일 가능성이 높고 심화 내용(정책 강제·성능 벤치마크 등)은 후속 편에 있을 것으로 추정된다 — 이 역시 확인 못한 추정이다.

## 내 생각 · 적용점
이 글의 "IP는 위치일 뿐, 보안 단위는 정체성"이라는 구도는 [[2026-06-08-kubernetes-gateway-api]]에서 정리했던 "좋은 API는 소유권 경계를 명시한다"는 설계 철학과 같은 방향에서 읽힌다 — Ingress가 커스텀 annotation으로 정책·라우팅·소유권을 뒤섞어 취약해졌던 것처럼, IPTables 기반 네트워크 정책도 "규칙이 IP라는 휘발성 속성에 묶여 있다"는 게 근본 취약점이었고, Cilium은 그 결합을 Identity로 끊어낸 것이다. 또한 [[2026-06-08-job-interviews-taught-me-kubernetes]]가 짚었던 "K8s 채택은 조직적 이점 때문"이라는 관찰과 나란히 놓으면, Cilium/eBPF로의 전환도 결국 "선형 탐색이 느리다"는 성능 문제만이 아니라 "정책을 IP가 아니라 의도(라벨)로 표현할 수 있다"는 조직적·운영적 이점이 채택 동인이라고 볼 수 있다. [[2026-08-24-srelens-kubernetes-control-room]]에서 다뤘던 "로컬 kubeconfig로 API 서버에 직접 붙는" 통제 축과는 층위가 다르지만(그쪽은 운영 도구 접근 통제, 이쪽은 데이터패스 자체의 정책 단위), 둘 다 "쿠버네티스 신뢰 경계를 어디에 그을 것인가"라는 상위 질문의 다른 답이라는 점에서 느슨하게 연결된다.

## 호스피탈리티 / CRS 적용 포인트
온다의 백엔드가 쿠버네티스 위에서 마이크로서비스로 운영된다면, IPTables 기반 NetworkPolicy에서 Cilium/eBPF로 전환하는 것은 파트너사별 격리(멀티테넌시)를 라벨 기반 Identity로 명시적으로 표현할 수 있다는 점에서 실질적 적용점이 있다 — 파드 IP가 재배치될 때마다 방화벽 규칙을 다시 계산할 필요 없이, "이 라벨을 가진 워크로드는 이 정책"이라는 선언이 유지되기 때문이다. 다만 이번 노트의 근거가 Slack 발췌 세 줄과 일반론 교차검증뿐이라, 온다 클러스터의 실제 서비스 수·NetworkPolicy 규칙 수가 IPTables 병목을 체감할 임계치에 도달했는지는 별도로 측정해야 한다 — 지금 시점에 "무조건 전환"을 CRS 결론으로 내리기엔 근거가 얇다.

## 연관 자료
- [[2026-06-08-kubernetes-gateway-api]] — "소유권 경계를 명시하는 API가 좋은 API"라는 설계 철학, IPTables→eBPF 전환의 배경 논리와 같은 축.
- [[2026-06-08-job-interviews-taught-me-kubernetes]] — Kubernetes 채택 동인이 기술이 아니라 조직적 이점이라는 관찰, CNI 선택에도 적용 가능.
- [[2026-08-24-srelens-kubernetes-control-room]] — 같은 시즌에 정리한 또 다른 쿠버네티스 신뢰 경계 설계 사례(운영 도구 접근 통제 축).

## 한 달 뒤 회고 (2026-09-26 즈음)
- 원문 `on.com2us.com`이 이 세션 이후 접근 가능해지면 실제 저자·발행일·시리즈 후속편 유무를 확인해 이 노트를 보강.
- 온다 쿠버네티스 클러스터에 실제로 IPTables 기반 NetworkPolicy를 쓰고 있는지, 서비스 수 규모가 eBPF 전환을 정당화할 수준인지 점검.
