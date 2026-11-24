---
title: "당근마켓, 파드는 뜨는데 왜 통신이 안될까 - kube-proxy nftables 전환 여정 (당근마켓, 원문 접속 차단) — 메이저 전환은 100% 호환을 보장하지 않는다"
source_title: "Why Can't My Running Pods Be Reached? Our Journey to kube-proxy nftables Mode"
source_url: "https://medium.com/daangn/why-cant-my-running-pods-be-reached-our-journey-to-kube-proxy-nftables-mode-6fceb1d2a5f7"
source_name: "당근마켓 기술 블로그(Medium)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (medium.com 세션 차단으로 미확인)"
summarized_at: "2026-11-24"
category: "architecture"
tags: ["kubernetes", "kube-proxy", "nftables", "iptables", "networking", "daangn"]
---

# 당근마켓, 파드는 뜨는데 왜 통신이 안될까 - kube-proxy nftables 전환 여정 (당근마켓)

> 출처: [Why Can't My Running Pods Be Reached? Our Journey to kube-proxy nftables Mode](https://medium.com/daangn/why-cant-my-running-pods-be-reached-our-journey-to-kube-proxy-nftables-mode-6fceb1d2a5f7) (당근마켓 기술 블로그, 영문·국문 동시 게시) · Slack `#개발-뉴스-dev-news` TechArticles 직공유(GeekNews 아님) · 정리일 2026-11-24

> **출처 한계**: `medium.com`이 이 세션에서 egress 전면 차단되어 원문을 열람하지 못했다. 같은 글이 한글판("파드는 뜨는데 왜 통신이 안될까?")과 영문판으로 동시에 Slack에 공유됐다 — 이 노트는 둘을 하나로 묶어 다룬다. 당근마켓 고유의 장애 사례·원인 분석은 WebSearch로도 독립 확인하지 못했다. 다만 Kubernetes 공식 블로그로 일반 맥락은 교차확인된다: nftables가 kube-proxy의 기본 백엔드로 전환되는 중이며, iptables/ipvs와의 100% 호환은 ***의도적으로 보장하지 않는다***고 명시돼 있고, 초기 nft 커맨드라인 버그·대규모 클러스터 성능 이슈(GitHub 이슈 #135639)가 실재 보고된 바 있다.

## 한 줄 요약

**당근마켓이 쿠버네티스 파드 간 통신 장애를 겪고 조사한 끝에 kube-proxy를 iptables에서 nftables 모드로 전환했다는 사례로, Slack 발췌의 서사는 "메이저 백엔드 전환이 완전한 하위 호환을 보장하지 않는다"는 쿠버네티스 공식 입장과 정확히 맞아떨어진다.**

## 핵심 포인트

- Slack 발췌: 쿠버네티스 파드 간 통신 장애를 해결하기 위해 ***kube-proxy의 nftables 모드 전환***을 수행한 사례이며, 네트워크 트래픽 제어의 효율성과 인프라 안정성 확보가 목적이라고 서술한다.
- WebSearch 교차확인(일반 맥락): nftables는 Kubernetes 1.31부터 kube-proxy의 새 백엔드로 도입돼 최신 버전에서 기본값으로 자리잡는 추세이며, 쿠버네티스 공식 문서는 iptables 모드와 ***동일한 동작을 보장하지 않는다***고 명시한다.
- 같은 공식 소스에서 확인되는 알려진 함정: 초기 nft 커맨드라인 사용 시의 버그, 대규모 클러스터에서의 성능 저하 이슈(GitHub #135639)가 보고된 바 있다 — 당근마켓의 "장애 → 원인 조사 → 전환"이라는 서사가 이런 알려진 비호환성/성능 함정과 부합하는 패턴으로 보인다(다만 당근마켓이 정확히 이 이슈를 겪었는지는 원문 없이 확정할 수 없다).
- 한글/영문 동시 게시는 당근마켓이 해외 엔지니어링 독자층도 겨냥한 기술 블로그 전략을 쓴다는 신호다.

## 인상 깊은 문장

> (원문 접속이 차단되어 1차 인용은 확보하지 못했다. "파드는 뜨는데 왜 통신이 안될까?"라는 제목 자체가 증상 중심 서사를 예고한다.)

## 댓글

GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글·HN/Lobsters 큐레이션 대상이 아니다. 당근마켓 자사 기술 블로그이므로 전환 결정을 정당화하는 톤일 가능성이 있으나, 장애 디버깅 서사 자체는 통상 솔직하게 쓰이는 장르다.

## 내 생각 · 적용점

### 핵심 전이 — kube-proxy를 고치는 접근과 kube-proxy 자체를 건너뛰는 접근이 레포에 나란히 쌓인다

[[2026-08-26-cilium-ebpf-under-the-hood]]는 Cilium이 ***eBPF로 kube-proxy 데이터플레인 자체를 대체***하는 접근을 다뤘다. 이 글은 반대 방향이다 — kube-proxy를 유지한 채 ***내부 백엔드(iptables→nftables)만 교체***하는 보수적 전환이다. 두 선택지를 나란히 놓으면, "커널 네트워크 스택을 통째로 바꾸는 것"과 "같은 추상화 안에서 구현만 현대화하는 것" 사이의 비용·리스크 트레이드오프가 뚜렷하게 보인다 — 당근마켓은 후자를 택했고, 그 과정에서도 "완전한 호환 보장 없음"이라는 쿠버네티스 공식 경고의 사례를 몸으로 겪은 것으로 추정된다.

### 적용점

메이저 버전/백엔드 전환 전에 "공식적으로 100% 호환을 보장하지 않는다"는 문구가 있다면, 스테이징에서 트래픽 패턴을 재현한 뒤 전환해야 한다는 원칙이 이 사례로 다시 확인된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다가 자체 쿠버네티스 클러스터의 네트워킹 데이터플레인(kube-proxy 백엔드)을 직접 운영·교체하는 상황이 당장은 아니다. 다만 매니지드 쿠버네티스(EKS 등)를 쓰더라도 "메이저 버전 전환 시 공식 문서가 100% 호환을 보장하지 않는다고 명시한 부분은 반드시 사전 점검한다"는 체크리스트 원칙은 참고할 가치가 있다.

## 연관 자료

- [[2026-08-26-cilium-ebpf-under-the-hood]] — 같은 네트워킹 데이터플레인 레이어를 다루지만 kube-proxy 자체를 eBPF로 건너뛰는 대조적 접근

## 한 달 뒤 회고

2026-12-24 즈음 — `medium.com` 접속이 가능해지면 당근마켓이 실제로 겪은 장애 원인(nft 버그인지, iptables 체인 폭증인지)을 원문으로 확인.
