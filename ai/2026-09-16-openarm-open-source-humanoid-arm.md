---
title: "OpenArm - 오픈소스 7자유도 휴머노이드 로봇 팔 (Enactic) — 피지컬 AI를 연구하려는 랩마다 로봇 팔부터 새로 설계하지 않게, 사람 크기·저항성까지 표준화했다"
source_title: "OpenArm: An open-source 7DOF humanoid arm"
source_url: "https://github.com/enactic/openarm"
source_name: "GitHub (enactic/openarm) · Enactic"
referrer_url: "https://news.hada.io/topic?id=33739"
summarized_at: "2026-09-16"
category: "ai"
tags: ["휴머노이드로봇", "피지컬AI", "오픈소스하드웨어", "GeekNews"]
---

# OpenArm - 오픈소스 7자유도 휴머노이드 로봇 팔

> 출처: [OpenArm: An open-source 7DOF humanoid arm](https://github.com/enactic/openarm) (GitHub · Enactic) · 정리일 2026-09-16

## 한 줄 요약
**Enactic이 사람 크기 비율·백드라이버블 모터를 갖춘 7자유도 오픈소스 휴머노이드 로봇 팔 OpenArm을 소프트웨어·하드웨어 전부 오픈소스로 공개했다 — 피지컬 AI를 연구하려는 랩마다 로봇 팔 설계부터 새로 하지 않도록 하는 것이 목적이다.**

## 핵심 포인트
- 완전 오픈소스 ***7자유도(7DOF)*** 휴머노이드 팔, 소프트웨어 Apache-2.0 / 하드웨어 CERN-OHL-S-2.0
- ***160~165cm 사람 기준*** 스케일로 설계된 인간형 비율
- 페이로드 ***피크 6.0kg / 상시 4.1kg***, QDD 백드라이버블 모터로 고compliance·안전한 인간-로봇 상호작용 지향
- 완전 양팔(bimanual) 시스템 ***$6,500 USD*** — DIY 키트 또는 인증 제조사 완제품 선택 가능
- ROS 2 기반, MoveIt2 모션플래닝·CAN 실시간 제어·Isaac Lab 시뮬레이션 패키지 제공
- 원격조작·모방학습·시뮬레이션·실환경 데이터 수집용 플랫폼을 목적으로 설계됨

## 인상 깊은 문장
> "human-scale proportions, safety and compliance, and practical payloads"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 게시됨(item id=49684289, 3일 전)이나 정확한 포인트·댓글 수는 접근 차단으로 미확인. GitHub 저장소는 직접 확인해 신뢰도가 높다. 다만 동일 이름의 별도 프로젝트(`OpenArmRobot/openarm`, 중국산 저가 모터 기반 리메이크)도 검색되어, GeekNews 원글이 정확히 어느 프로젝트를 가리키는지는 완전히 교차 확인하지 못했다.

## 내 생각 · 적용점
**[[2026-08-23-china-humanoid-robot-100m-record]]**가 다룬 것처럼 중국이 하드웨어 성능/생산 경쟁에 주력하는 반면, OpenArm은 "누구나 같은 팔로 실험할 수 있게" 만드는 표준화·재현성 경쟁이다. **[[2026-08-02-gemini-robotics-2]]**가 소프트웨어(모델) 쪽 표준화를 노린다면, OpenArm은 하드웨어 쪽 표준화 — 둘이 만나야 피지컬 AI 연구가 소프트웨어처럼 빠르게 반복 가능해진다는 방향성이 읽힌다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다. 호텔 로비 로봇·객실 서비스 자동화가 실용화되려면 이런 표준화된 저비용 플랫폼이 먼저 성숙해야 한다는 정도의 원거리 연결만 가능하다.

## 연관 자료
- [[2026-08-23-china-humanoid-robot-100m-record]] — 같은 휴머노이드 로봇 경쟁, 하드웨어 성능 축의 대조
- [[2026-08-02-gemini-robotics-2]] — 피지컬 AI의 소프트웨어(모델) 표준화 축
- [[2026-08-29-anthropic-model-hardware-standard]] — 모델과 하드웨어 간 표준 인터페이스라는 유사 문제의식

## 한 달 뒤 회고
2026-10-16 즈음, OpenArm을 채택한 연구 결과나 랩이 나왔는지, 동명 프로젝트와의 혼동이 정리됐는지 점검.
