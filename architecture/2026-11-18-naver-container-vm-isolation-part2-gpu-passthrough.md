---
title: "네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 2편 — GPU 패스스루 계층과 GPU 8장 VM의 부팅·메모리 구성(NAVER D2, 원문 접속 불가)"
source_title: "컨테이너처럼 쓰고, VM처럼 격리하기 2편 - GPU 패스스루 계층과 GPU 8장 VM의 부팅·메모리 구성"
source_url: "https://d2.naver.com/helloworld/1376800"
source_name: "NAVER D2"
referrer_url: "Slack #개발-뉴스-dev-news (TechArticles 직공유, GeekNews 아님)"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "architecture"
tags: ["naver", "gpu-passthrough", "virtualization", "vfio", "kubernetes", "gpu"]
---

# 네이버, 컨테이너처럼 쓰고 VM처럼 격리하기 2편 — GPU 패스스루와 8장 VM 부팅·메모리 구성

> 출처: [컨테이너처럼 쓰고, VM처럼 격리하기 2편](https://d2.naver.com/helloworld/1376800) (NAVER D2) · 정리일 2026-11-18
>
> **출처 한계**: d2.naver.com 차단으로 원문 미확인. Slack 발췌 3줄(문장 끊김)에만 의존했고, GPU 패스스루 일반 개념만 WebSearch로 보강했다. "GPU 8장 VM"의 구체 부팅 시간·메모리 구성 수치는 확인하지 못했다.

## 한 줄 요약

**1편에서 구축한 Kata 기반 격리 위에, GPU 8장을 통째로 VM에 패스스루할 때 생기는 부팅·메모리 구성 문제를 다룬 2편(Slack 발췌 기준, 세부 수치 미확인).**

## 핵심 포인트

- GPU 패스스루(VFIO 기반)는 ***물리 GPU를 VM에 직접 할당***해 거의 베어메탈급 성능을 내지만, 일반적으로 VM 부팅 시 디바이스 초기화·IOMMU 매핑 비용이 GPU 수에 비례해 커지는 문제가 알려져 있다(WebSearch로 확인한 일반 패스스루 특성, 네이버 환경 수치는 원문 미확인).
- Slack 발췌는 "대규모 GPU 자원 할당 시 발생하는 부팅 및 메모리 구성 문제를 해결하는 최적화 전략"이라고 전하나, 구체적으로 무엇을 어떻게 최적화했는지(예: 지연 초기화, 메모리 사전할당 방식)는 문장이 끊겨 알 수 없다.
- "GPU 8장"이라는 구체적 숫자가 등장하는 것으로 보아, 이 시리즈가 실제 네이버의 대형 멀티-GPU VM(아마 학습/추론 클러스터 노드) 운영 경험에서 나온 글로 추정된다.

## 인상 깊은 문장

> (원문 미열람 + Slack 발췌 문장 끊김으로 직접 인용 가능한 문장을 확보하지 못했다.)

## 댓글

Slack TechArticles 채널 직공유, hada 경유 아님. 댓글 수·HN·Lobsters 큐레이션 확인 불가. 발췌가 짧아 "최적화 전략"의 실체를 검증하지 못했다는 점을 분명히 밝힌다 — PASS로 보고하지 않음.

## 내 생각 · 적용점

### 핵심 전이 1 — "자원 수에 비례해 커지는 초기화 비용"은 일반적인 패턴

GPU 8장 VM의 부팅 비용 문제는, 자원을 많이 묶을수록 초기화·헬스체크 오버헤드가 선형 이상으로 커지는 일반적인 인프라 패턴을 보여준다(CRS에서도 대량 배치 작업을 한 VM/프로세스에 몰아넣을 때 유사하게 나타남).

### 핵심 전이 2 — [[2026-11-18-naver-container-vm-isolation-part1-kata-containers]]의 격리 비용을 되갚는 단계

1편에서 예상한 "격리 비용은 반드시 전가된다"는 가설대로, 2편은 그 비용(패스스루 오버헤드)을 최적화로 되갚는 단계로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** GPU 패스스루·VFIO는 CRS 도메인에 존재하지 않는 레이어다. 다만 "자원을 많이 묶어 쓸수록 초기화 비용을 별도로 관리해야 한다"는 원칙은, PMS 동기화 배치처럼 다량의 작업을 한 번에 묶어 처리하는 설계에서 참고할 만한 정도다.

## 연관 자료

- [[2026-11-18-naver-container-vm-isolation-part1-kata-containers]] — 같은 시리즈 1편, 격리 구조의 배경
- [[2026-11-18-naver-container-vm-isolation-part3-fabric-manager-dra]] — 같은 시리즈 3편, GPU 할당 자동화
- [[2026-11-18-naver-container-vm-isolation-part4-ib-network-nvme]] — 같은 시리즈 4편, 네트워크·스토리지 성능
- [[2026-11-16-naver-image-ai-serving-litserve-gpu-idle]] — 같은 네이버 GPU 운영 축

## 한 달 뒤 회고

*(2026-12-18 즈음 — GPU 8장 VM의 실제 부팅 시간 수치, 네이버가 쓴 최적화 기법의 실체를 원문으로 확인했는지 점검.)*
