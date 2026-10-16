---
title: "Voxel (Oxide Computer) — 실제 제품 소프트웨어를 수정 없이 돌리는 원칙 하나로, 미니PC가 32대짜리 서버 랙을 흉내 낸다"
source_title: "Oxide's Voxel Labs Emulates a Full Rack on a Mini-PC"
source_url: "https://zeli.app/story/50092423"
source_name: "zeli.app (2차 보도 애그리게이터, Oxide 공식 발표 원문 미확인)"
referrer_url: "https://news.hada.io/topic?id=35421"
published_at: "확인 불가"
summarized_at: "2026-10-16"
category: "engineering"
tags: ["oxide-computer", "voxel", "emulator", "virtualization", "test-infrastructure", "propolis", "softnpu", "hardware"]
---

# Voxel (Oxide Computer)

> 출처: [Oxide's Voxel Labs Emulates a Full Rack on a Mini-PC](https://zeli.app/story/50092423) (zeli.app, 2차 보도) · GeekNews(id=35421) 경유 · 정리일 2026-10-16

> **출처 한계**: `news.hada.io`·`oxide.computer` 공식 블로그·`zeli.app` 모두 이 세션에서 WebFetch가 전면 차단됐다(이 세션은 `en.wikipedia.org`까지 막혀 세션 전체의 egress 제약으로 판단한다). WebSearch로 zeli.app의 2차 보도(영어·독일어·스페인어·러시아어 번역본 다수)와 Oxide 공식 GitHub(`oxidecomputer/propolis`), 공식 문서(`docs.oxide.computer`)를 교차확인했다. 핵심 수치는 번역본 간에 약간씩 다르다 — 영어 요약은 가동 시간만 "약 10분"이라고 적고, 러시아어 번역은 "32스레드 Ryzen 9 미니PC·96GB RAM·6개 슬레드 10분"으로 더 구체적이다. Slack 발췌의 "하나의 랙이나 관리 체계를 공유하는 두 랙 구성"은 이번 WebSearch에서 확인하지 못했다. 1차 Oxide 공식 블로그 원문은 끝내 확보하지 못했다.

## 한 줄 요약

**Oxide Computer의 Product Assurance 팀이, 고객이 데이터센터에 직접 설치하는 서버 랙 제품(최대 32개 컴퓨트 슬레드 + Sidecar 스위치)을 전부 소프트웨어로 재현하는 에뮬레이터 Voxel을 만들었다 — 32스레드 Ryzen 미니PC 한 대에서 Propolis 가상머신으로 슬레드를, SoftNPU로 스위치 데이터플레인을, 에뮬레이션된 Cortex-M 코어로 관리용 마이크로컨트롤러까지 재현해 6개 슬레드짜리 랙을 약 10분 만에 띄운다. 핵심 원칙은 "실제 제품 소프트웨어를 수정 없이 그대로 실행"하는 것 — 테스트 전용 빌드를 따로 만들지 않고, 고객의 실제 네트워크 구성과 최신 소프트웨어를 랙 하드웨어 없이도 검증할 수 있게 한다.**

## 핵심 포인트

- **재현 대상** — 슬레드(서버 모듈)·스위치·관리용 마이크로컨트롤러까지 ***랙 전체를 하나의 미니PC에서 통째로 에뮬레이션***한다. Oxide의 실제 제품은 랙 전체가 판매 단위이기 때문에, 하드웨어 없이 통합 동작을 검증할 수 있다는 게 이 도구의 존재 이유다.
- **구성 요소별 에뮬레이션 전략** — ***Propolis***(Oxide 자체 VM, Falcon 기반)로 슬레드를 가상화, ***SoftNPU***(Tofino 없이 switch dataplane을 소프트웨어 P4로 흉내)로 스위치를, Cortex-M 코어 에뮬레이션으로 관리 컨트롤러를 대체한다. 요소별로 가장 적합한 가상화 기법을 다르게 골라 조합한 게 특징이다.
- **핵심 설계 원칙 — 수정 없는 실행** — ***테스트용으로 따로 빌드한 소프트웨어가 아니라 실제 프로덕션 Oxide 소프트웨어가 그대로 돌아간다***는 점이 가장 중요하다고 보도는 강조한다 — 에뮬레이터가 "진짜와 다르게 행동할 위험"을 원천적으로 줄이는 설계다.
- **성능** — 32스레드 Ryzen 미니PC·96GB RAM에서 6개 슬레드 랙을 약 10분 만에 기동(러시아어 번역본 기준 수치, 영어 요약은 시간만 확인). 실제 하드웨어 랙 조달·설치에 걸리는 시간과 비교하면 압도적으로 빠른 반복(iteration) 사이클이다.
- **용도** — 테스트 전용 버전을 만들지 않기 때문에, ***고객의 실제 네트워크 구성과 최신 소프트웨어 조합을 랙 없이 사전 검증***할 수 있다 — 하드웨어 조달이 병목인 온프레미스 제품에서, 소프트웨어 검증을 하드웨어 조달과 분리하는 전략이다.

## 인상 깊은 문장

> (zeli.app 영문 요약 재인용) "Oxide's Product Assurance team built Voxel, a software emulation stack that runs a complete Oxide rack — sleds, switches, and microcontrollers — on a single mini-PC."

## 댓글

**hada 댓글 수 확인 불가.** HN/Lobsters 큐레이션 유무도 확인하지 못했다. zeli.app은 다국어로 같은 기사를 재배포하는 애그리게이터라, 수치가 번역본마다 조금씩 다르다는 점(두 랙 구성 여부 포함)을 그대로 밝혀둔다 — Oxide 공식 블로그나 Oxide and Friends 팟캐스트 원문을 1차로 확인하면 더 정확해질 여지가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — "실제 소프트웨어 + 저비용 가상 환경"이라는 같은 공식

[[2026-10-15-qa-wolf-disposable-vm-windows-testing]]과 같은 축의 원칙이다 — ***"실제 환경에서만 드러나는 문제를, 실제 소프트웨어를 수정 없이 돌리는 저렴한 가상 환경에서 미리 잡는다"***는 설계가 QA Wolf의 일회용 Windows VM 테스트와 Voxel의 미니PC 랙 에뮬레이션 둘 다에 똑같이 적용된다. 대상이 "일회용 데스크톱"에서 "32슬레드 데이터센터 랙"으로 규모만 바뀌었을 뿐, "수정 없는 실제 소프트웨어 + 저비용 가상 환경"이라는 공식은 동일하다.

### 핵심 전이 2 — "진짜와 다르게 행동할 위험"을 줄이려는 같은 태도

[[2026-08-30-vphone-cli-virtual-iphone-boot]]가 보여준 "진짜 OS를 가상 기기로 부팅해 연구 인프라를 재활용"하는 접근과도 결이 같다 — 세 글 모두 테스트 전용 모사품이 아니라 실제 소프트웨어를 그대로 가상 환경에 올리는 쪽을 택해, 에뮬레이터가 "진짜와 다르게 행동할 위험"을 줄이려 한다.

### 핵심 전이 3 — 인프라를 바꾸는 것과 인프라를 검증하는 하네스를 만드는 것의 차이

[[2026-10-04-ftl-new-os-for-cloud]]가 "재부팅 없이 애플리케이션처럼 고치고 디버깅"하는 걸 OS 설계 목표로 삼았던 것과 대조하면, Voxel은 OS/인프라 자체를 바꾸는 게 아니라 ***그 인프라를 검증하는 하네스를 따로 만든다는 점에서 다른 층위의 해법***이다 — 문제(하드웨어 조달·반복 느림)는 비슷하지만 해법의 층위가 다르다는 대비다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다는 온프레미스 서버 랙을 판매하지 않는다. 다만 전이 가능한 원칙은 뚜렷하다: ***파트너 호텔의 PMS·네트워크 구성이 제각각일 때, 그 조합을 실제 장비 없이 "실제 소프트웨어 그대로" 재현하는 가상 스테이징 환경을 만들 수 있는가***는 CRS 통합 테스트에도 그대로 적용 가능한 질문이다. 신규 파트너 온보딩 전 네트워크/PMS 조합을 저비용으로 미리 검증하는 하네스를 설계할 때 참고할 사례.

## 연관 자료

- [[2026-10-15-qa-wolf-disposable-vm-windows-testing]] — "실제 소프트웨어를 수정 없이 저비용 가상 환경에서" 테스트하는 같은 공식, 대상이 데스크톱
- [[2026-08-30-vphone-cli-virtual-iphone-boot]] — 진짜 OS를 가상 기기로 부팅해 재현하는 같은 태도
- [[2026-10-04-ftl-new-os-for-cloud]] — 인프라를 바꾸는 해법과 인프라를 검증하는 해법의 대비

## 한 달 뒤 회고

*(2026-11-16 즈음 — ①Oxide 공식 1차 소스로 "두 랙 구성" 여부와 정확한 하드웨어 사양을 재확인했는지, ②Voxel이 Oxide의 실제 고객 온보딩 프로세스에 어떻게 쓰이는지 사례가 나왔는지, ③이 설계가 다른 온프레미스 하드웨어 벤더에도 비슷하게 적용된 사례가 있는지 점검.)*
