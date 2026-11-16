---
title: "Woz는 컴퓨터를 만들기도 전에 어떻게 Apple 1 BASIC을 작성했을까? — 어셈블러 없이 종이 위에서 짠 인터프리터"
source_title: "Apple 1 BASIC (관련 리버스엔지니어링/역사 분석 — 정확한 1차 출처 미확인)"
source_url: "https://www.apple2history.org/?p=24"
source_name: "Apple II History (Steven Weyhrich), 그 외 복수 레트로컴퓨팅 아카이브 교차확인"
referrer_url: "https://news.hada.io/topic?id=37196"
published_at: "확인 불가 (1975~76년 사건을 다루는 레트로컴퓨팅 글, 게시일 미확인)"
summarized_at: "2026-11-16"
category: "engineering"
tags: ["retro-computing", "apple-1", "wozniak", "6502", "basic", "reverse-engineering"]
---

# Woz는 컴퓨터를 만들기도 전에 어떻게 Apple 1 BASIC을 작성했을까?

> 출처: [Apple 1 BASIC 관련 역사 분석](https://www.apple2history.org/?p=24) (Apple II History 등 복수 자료 교차확인) · 정리일 2026-11-16

## 한 줄 요약
**Steve Wozniak은 어셈블러도 컴퓨터도 없는 상태에서, 종이 위에 6502 기계어를 손으로 번역해 BASIC 인터프리터를 먼저 완성하고 나서야 그것을 실행할 하드웨어(Apple 1)를 설계했다.**

## 핵심 포인트
- Wozniak 본인의 회고에 따르면 ***BASIC을 먼저 작성했고, 이게 하드웨어 설계보다 훨씬 오래 걸렸다*** — 흔히 생각하는 "하드웨어 먼저, 소프트웨어 나중" 순서가 뒤집혀 있었다.
- 당시 시분할 컴퓨터 사용료를 감당할 수 없어 ***어셈블러 없이 명령어를 직접 16진수 기계어로 손 번역***하고, 종이에 주소와 값을 적어가며 작업했다.
- 참고 자료는 거창한 컴퓨터과학 서적이 아니라 *101 BASIC Computer Games*와 HP BASIC 매뉴얼 정도였다.
- 메모리와 속도를 쥐어짜기 위해 ***Sweet 16***이라는 경량 가상머신(레지스터 기반)을 직접 설계해, 여러 단계의 6502 연산을 1바이트 명령으로 압축했다 — Slack 발췌가 언급한 "ALGOL 스택 머신" 서술은 이번 리서치에서 독립적으로 확인되지 않았다(아래 "댓글" 참고).
- 완성된 인터프리터는 약 4KB, 카세트테이프에서 로드하는 데 수 분이 걸렸고, 부동소수점을 포기해 정수 연산(Integer BASIC)만 지원했다.

## 인상 깊은 문장
> "I wrote the BASIC first, which took a lot more time than the computer design." — Steve Wozniak (여러 레트로컴퓨팅 아카이브가 인용하는 본인 회고)

## 댓글
hada 원문(news.hada.io)은 이 세션에서 egress 차단으로 직접 열람하지 못했다 — Slack 발췌문과 WebSearch 교차검증으로 작성. **중요한 출처 한계 하나**: Slack 발췌는 "수식 평가용 스택 머신을 ALGOL로 구현해 시험했다"고 서술하는데, 이번 조사에서 찾은 복수 자료(apple2history.org, Wikipedia Integer BASIC 항목 등)는 모두 **Sweet 16**(레지스터 기반 VM, 스택 머신이 아님)을 언급할 뿐 ALGOL은 전혀 등장하지 않았다. 원문 1차 자료를 직접 열람하지 못해 이 디테일의 진위는 확인 불가 — 가든 관례(정직성)에 따라 확인된 것과 확인 안 된 것을 분리해 적었다. hada 쪽 댓글 수·논조도 접속 차단으로 확인 불가.

## 내 생각 · 적용점
"검증보다 구현을 먼저 믿고 만든다"는 통념과 반대로, Woz는 **런타임 환경이 없는 상태에서 소프트웨어를 완성**했다 — 요즘이면 시뮬레이터·에뮬레이터로 미리 검증했을 작업을 순수 종이 추적(paper trace)으로 해낸 셈이다. 이는 [[2026-10-05-thoreau-basic]]에서 다룬 "BASIC이 유행에서 밀려나지 않았다면"이라는 가벼운 반사실적 질문에 역사적 닻을 하나 더 놓는다 — BASIC의 원형이 이미 제약(비용) 속에서 압축 설계의 산물이었다는 것. 제약이 없었다면 오히려 Sweet 16 같은 영리한 압축이 안 나왔을 수 있다는 역설도 있다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다 — 50년 전 1인 개발자의 하드웨어 제약 극복 일화라 CRS 시스템 설계에 바로 끌어올 소재는 아니다. 다만 "제약이 설계를 압축시킨다"는 원칙만 전이 가능: 레거시 PMS 연동처럼 자원이 극단적으로 제한된 환경(구형 온프레미스 서버, 저사양 키오스크)에서는 범용 프레임워크보다 Sweet 16 식의 **목적에 맞춘 초경량 중간 표현**이 나을 수 있다는 정도.

## 연관 자료
- [[2026-10-05-thoreau-basic]] — BASIC 계열 레트로 컴퓨팅 가벼운 픽, 같은 결의 자매 글
- [[2026-10-27-steve-jobs-next-early-years-photos]] — Apple 컴퓨팅 역사 시리즈, 같은 인물·시대 배경

## 한 달 뒤 회고
- [ ] 2026-12-16: 1차 원문(실제 hada 링크된 기사)을 다시 찾아 ALGOL/스택 머신 디테일의 진위를 확인할 수 있었는지 점검.
