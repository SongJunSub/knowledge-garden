---
title: "네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 1편 — 컨테이너와 VM의 차이, Kata Containers의 Pod 실행 구조(NAVER D2, 원문 접속 불가)"
source_title: "컨테이너처럼 쓰고, VM처럼 격리하기 1편 - 컨테이너와 VM의 차이, Kata Containers의 Pod 실행 구조"
source_url: "https://d2.naver.com/helloworld/8055238"
source_name: "NAVER D2"
referrer_url: "Slack #개발-뉴스-dev-news (TechArticles 직공유, GeekNews 아님)"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "architecture"
tags: ["naver", "kata-containers", "virtualization", "container-isolation", "kubernetes", "gpu"]
---

# 네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 1편 — Kata Containers의 Pod 실행 구조

> 출처: [컨테이너처럼 쓰고, VM처럼 격리하기 1편](https://d2.naver.com/helloworld/8055238) (NAVER D2) · 정리일 2026-11-18
>
> **출처 한계**: `d2.naver.com`은 이 세션에서 WebFetch가 차단되어 원문을 읽지 못했다. 이 노트는 Slack 다이제스트 봇의 3줄 발췌(문장이 중간에 끊겨 있음)만을 근거로, Kata Containers의 일반 아키텍처는 WebSearch로 보강해 재구성했다. 네이버 환경에 특화된 구체 구현(어떤 하이퍼바이저·버전을 쓰는지 등)은 확인하지 못했다.

## 한 줄 요약

**컨테이너의 가벼운 인터페이스와 VM의 강한 격리 경계를 동시에 얻으려는 Kata Containers 기반 Pod 실행 구조를 네이버가 GPU 클러스터에 도입한 사례(시리즈 1편, 배경 설명)다.**

## 핵심 포인트

- 일반 컨테이너는 ***호스트 커널을 공유***하고 네임스페이스·cgroup으로만 논리적 분리를 하는 반면, Kata Containers는 Pod마다 ***자체 게스트 커널을 가진 경량 VM***을 띄워 하드웨어 가상화 수준의 격리 경계를 만든다(WebSearch로 확인한 Kata 공식 아키텍처).
- 컨테이너 런타임이 Pod를 Kata shim에 넘기면, shim이 VM 모니터에 Pod VM 생성을 요청하고 그 안에서 Kata agent가 실제 컨테이너를 실행하는 구조 — Pod 삭제 시 shim이 VM을 종료하고 자원을 회수한다.
- 트레이드오프로 hostPath 볼륨·privileged 컨테이너·직접 디바이스 접근이 제한되고, 스토리지 I/O 성능이 일반 컨테이너보다 낮을 수 있다는 점이 알려져 있다(이 역시 일반론이며, 네이버가 이 제약을 어떻게 다뤘는지는 원문 미확인).
- Slack 발췌는 "클라우드 네이티브 환경에서 보안과 성능을 동시에 확보하기 위한 아키텍처 분석"이라고 전하나, 구체적으로 네이버가 무엇을 분석했는지는 문장이 끊겨 확인 불가.

## 인상 깊은 문장

> (Slack 발췌가 기능 설명 요약 위주이고 중간에 끊겨, 저자의 표현을 그대로 인용할 부분을 확보하지 못했다 — 원문 미열람으로 인용 생략.)

## 댓글

GeekNews(hada) 경유가 아니라 Slack TechArticles 채널의 RSS 직공유다. 블로그 자체 댓글 수·HN·Lobsters 큐레이션 여부 모두 확인 불가. **"PASS"만 보고하지 않음을 명시**: 이 글이 다루는 "보안과 성능을 동시에 확보"라는 주장은 Kata Containers 자체의 일반적 포지셔닝과 일치하지만, 네이버 환경에서 실측했는지는 원문 미확보로 검증하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 격리 비용은 어딘가로 반드시 전가된다

Kata의 트레이드오프(스토리지 I/O 저하, 직접 디바이스 접근 제한)는 "격리를 공짜로 얻을 수 없다"는 원칙을 보여준다. 4편에서 다룰 IB 네트워크·로컬 NVMe 최적화가 바로 이 비용을 되갚는 작업일 가능성이 높다 — 시리즈 전체가 "격리 도입 → 트레이드오프 발생 → 최적화로 되갚기"의 흐름일 것으로 추정(2~4편에서 확인).

### 핵심 전이 2 — GPU 운영에서 "컨테이너 인터페이스 유지"가 반복되는 테마

[[2026-11-16-naver-image-ai-serving-litserve-gpu-idle]]도 "기존 서빙 인터페이스를 유지하면서 내부 자원 활용을 최적화"하는 패턴이었다. 이 시리즈는 그 패턴을 인프라 계층(VM/컨테이너 경계)으로 한 단 더 내려간 버전으로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** GPU 클러스터의 컨테이너/VM 격리 아키텍처는 온다의 B2B CRS 도메인과 거리가 크다. 다만 "무거운 공유 자원(여기서는 GPU, CRS라면 멀티테넌트 DB·연동 큐)을 가벼운 인터페이스로 격리해 운영 편의성과 보안을 동시에 얻는다"는 추상적 설계 원칙 정도는 멀티테넌트 아키텍처를 다시 설계할 때 참고할 만하다.

## 연관 자료

- [[2026-11-18-naver-container-vm-isolation-part2-gpu-passthrough]] — 같은 시리즈 2편, GPU 패스스루 계층
- [[2026-11-18-naver-container-vm-isolation-part3-fabric-manager-dra]] — 같은 시리즈 3편, Fabric Manager/DRA GPU 할당
- [[2026-11-18-naver-container-vm-isolation-part4-ib-network-nvme]] — 같은 시리즈 4편, 네트워크·스토리지 성능
- [[2026-11-16-naver-image-ai-serving-litserve-gpu-idle]] — 같은 네이버 GPU 운영 축, 유휴시간 제거라는 인접 문제

## 한 달 뒤 회고

*(2026-12-18 즈음 — d2.naver.com 접속 차단이 풀려 원문을 직접 확인했는지, 네이버가 실제로 어떤 하이퍼바이저를 썼는지, 시리즈 전체를 관통하는 "격리 비용 상환" 가설이 맞았는지 점검.)*
