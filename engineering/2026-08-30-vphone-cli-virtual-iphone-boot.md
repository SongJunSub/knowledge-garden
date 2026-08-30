---
title: "vphone-cli (Lakr233) — Apple Silicon Mac에서 '진짜 iOS'를 가상 iPhone으로 부팅하는 CLI, PCC 연구 VM 인프라를 재활용하다"
source_title: "vphone-cli"
source_url: "https://github.com/Lakr233/vphone-cli"
source_name: "GitHub · Lakr233/vphone-cli"
referrer_url: "https://news.hada.io/topic?id=33007"
summarized_at: "2026-08-30"
category: "engineering"
tags: ["ios", "virtualization", "apple-silicon", "security-research", "jailbreak", "sandbox-isolation", "reverse-engineering"]
---

# vphone-cli — Apple Silicon Mac에서 '진짜 iOS'를 가상 iPhone으로 부팅하는 CLI

> 출처: [vphone-cli](https://github.com/Lakr233/vphone-cli) (Lakr233 · GeekNews 경유) · 정리일 2026-08-30
> **출처 한계 먼저 밝힌다**: 이 세션의 네트워크 egress 정책상 `news.hada.io`(GeekNews 원 토픽) 직접 페치가 막혔다(`EGRESS_BLOCKED`). GitHub 저장소 README는 WebFetch로 직접 확인했지만, hada 댓글 수·논지·GeekNews 게시 시점은 확인하지 못해 WebSearch 교차검증으로 보강했다. 저장소 star/fork 수는 검색 스니펫(3.7k, 2026년 3월경 스냅샷 추정)과 이번 WebFetch(약 9,300 star·1,300 fork) 사이에 편차가 있는데, 후자가 더 최근 값으로 보여 그쪽을 기준으로 삼았다 — 다만 정확한 시점 대조는 못 했다.

## 한 줄 요약

**Apple이 자사 서버용 온디바이스 AI 인프라(Private Cloud Compute)에서 iOS 워크로드를 검증하려고 만든 "연구용 VM" 스택 — 매니페스트 포맷, 부트체인, VM 설정 — 을 역이용해, Apple Silicon Mac 위에서 ***에뮬레이터가 아니라 진짜 iOS 커널***을 Virtualization.framework로 직접 부팅하는 오픈소스 CLI. macOS 15에 도입된 `PV=3` 파라버추얼라이제이션 모드가 핵심 레버이고, 보안 완화 수준이 다른 5개 펌웨어 변형(least→exp)을 골라 SSH/VNC로 접속해 보안 연구·리버스엔지니어링·탈옥 개발을 할 수 있게 해준다.**

## 핵심 포인트

- **에뮬레이터가 아니라 실물 iOS 커널** — Xcode iOS 시뮬레이터(앱 디버깅용 사용자공간 재구현)와 달리, vphone-cli는 ***Apple Virtualization.framework를 통해 실제 iOS 커널·부트체인을 가상 하드웨어 위에서 부팅***한다. 게스트가 iOS 26까지 지원된다.
- **Apple의 PCC 인프라를 재활용** — Apple은 Private Cloud Compute 데이터센터에서 iOS 유사 워크로드를 돌리는데, 이때 쓰는 매니페스트 포맷·툴링·VM 구성이 이 프로젝트의 기반이다. ***연구자용으로 공개된 적 없는 Apple 내부 인프라 패턴을, 커뮤니티가 리버스엔지니어링해 일반 개발자 CLI로 재구성***한 셈이다.
- **보안 완화 5단계 변형** — `less`(4패치·2단계, iOS 완화 대부분 유지) → `regular`(42패치·10단계, AMFI/SSV/Img4 우회) → `dev`(53패치·12단계, TXM 디버그 우회 추가) → `jb`(113패치·14단계, Sileo·TrollStore까지 자동 마무리되는 완전 탈옥) → `exp`(141패치·18단계, 연구용 VM임을 숨기는 탐지 회피까지 포함) 순으로 ***패치 개수·부팅 단계 수가 늘며 침습성이 단계적으로 커지는*** 구조다. 목적에 맞는 최소 침습 변형을 고를 수 있게 설계했다는 점이 눈에 띈다.
- **원격 접근·자동화 채널 풍부** — SSH(22222), VNC(5901) 원격 데스크톱, DFU 모드(복구/복원), 호스트 소켓을 통한 화면 캡처·제어 자동화까지 지원한다. VM 생성·복제·export/import·삭제 같은 라이프사이클 관리도 CLI로 처리된다.
- **요구사항이 명확히 "연구 환경"임을 말해준다** — Apple Silicon + macOS 15 이상, Xcode/iOS SDK, SIP·AMFI 완화(부트-arg 또는 `amfidont`)가 전제조건이다. ***중첩 VM(예: 클라우드 macOS 러너 위)에서는 동작하지 않는다*** — Virtualization.framework 자체가 하드웨어 가상화 확장에 직접 의존하기 때문으로 보인다.
- **MIT 라이선스 + 활발한 커뮤니티 확장** — 약 9,300 star·1,300 fork(검색 스니펫 기준 2026년 3월경엔 3.7k였다는 언급도 있어 최근 급성장한 것으로 보인다), 369 커밋. 이미 SwiftUI GUI 프론트엔드(`vphone-ws`)를 비롯한 포크·파생 프로젝트가 여럿 나왔다.

## 인상 깊은 문장

> "It repurposes Apple's Virtualization.framework to boot an iOS kernel by leveraging a paravirtualization mode called PV=3, introduced in macOS 15."
> (WebSearch로 확인한 원문 취지 재구성 — Apple이 만든 기능을 원래 용도와 다르게 "재목적화"했다는 표현이 이 프로젝트의 성격을 정확히 요약한다. 새 취약점을 만든 게 아니라, ***이미 존재하던 파라버추얼라이제이션 모드를 커뮤니티가 처음으로 일반 사용자 손에 쥐여준 것***에 가깝다.)

## 댓글

hada 원문 페이지를 직접 페치하지 못해 ***댓글 수·논지는 확인하지 못했다*** — 이 노트의 가장 큰 한계다. HN/Lobsters 등 영어권 큐레이션 여부도 이번 세션에서는 검증하지 못했고, WebSearch 결과 상위에는 중국어권 미러(gitcode.com)·X 스레드("3000 star 찍고 화제")가 두드러져, ***이 도구가 중화권 개발자 커뮤니티에서 특히 빠르게 확산된 정황***은 있으나 이는 검색 결과의 편향일 수 있어 단정하지 않는다. "탈옥 완전 자동화(jb 변형에서 Sileo/TrollStore까지 자동 설치)"라는 특징상, 탈옥·보안 커뮤니티에서의 반응이 실제 논지의 큰 축일 가능성이 높은데 이 부분도 원문 댓글 없이는 확인 불가.

## 내 생각 · 적용점

이 글은 두 축을 동시에 건드린다. 하나는 **"격리 환경을 만드는 도구 자체가 공격/연구 대상이 될 수 있다"**는 축, 다른 하나는 **"침습성을 단계적으로 나눠 제공하는 설계"** 축이다.

- **[[2026-08-28-general-vm-not-enough-agent-isolation]]과 거울상 연결** — Trail of Bits 글은 "범용 VM(QEMU/KVM)만으로는 사이버 역량을 갖춘 에이전트를 못 가둔다"는 이야기였다. vphone-cli는 정반대 방향의 사례다 — ***Apple의 격리·검증 인프라(PCC 연구 VM 스택) 자체를 "정상적인 방법으로" 재활용해 격리를 우회하는 게 아니라 격리된 실물 환경을 일반 사용자에게 열어준 것***. 둘을 나란히 놓으면, "VM은 안전 경계"라는 단순한 믿음이 두 방향(공격자가 VM을 뚫는 것 / 방어용 인프라가 커뮤니티 손에 재해석되는 것) 모두에서 흔들리고 있다는 공통 패턴이 보인다.
- **[[2026-06-08-apple-container-machine]]과 같은 결, 다른 층위** — 두 프로젝트 모두 "Apple Silicon Mac + Virtualization.framework"라는 동일 기반 위에 서 있지만, Container Machine이 *개발자 워크플로용 경량 Linux VM*(WSL2 대응)이라면 vphone-cli는 *Apple 내부 인프라를 재활용한 iOS 자체의 가상화*다. Apple이 Virtualization.framework를 공식 API로 계속 확장할수록, 그 위에서 파생되는 비공식 용도(이번 경우 연구용 iOS VM)도 함께 늘어난다는 인프라 재사용의 흥미로운 사례.
- **[[2026-06-01-how-anthropic-contains-claude]]의 "환경 계층 먼저" 원칙과 대조** — Anthropic 글의 결론은 "격리 수준을 목적에 맞게 계층화하라(임시 컨테이너 < 샌드박스 < 로컬 VM)"였다. vphone-cli의 5단계 패치 변형(least→exp)도 정확히 같은 사고방식이다 — ***필요한 만큼만 침습적인 환경을 고르게 하는 설계***는 AI 에이전트 샌드박싱이든 보안 연구용 iOS VM이든 반복되는 좋은 패턴으로 보인다.

## 호스피탈리티 / CRS 적용 포인트

솔직히 밝히면, ***직접 적용은 멀다*** — 온다는 B2B 호스피탈리티/CRS 도메인이라 iOS 커널 가상화·탈옥 자동화 자체가 우리 제품 표면과 맞닿을 일은 거의 없다. 다만 전이 가능한 원칙 하나는 남긴다: **"필요한 침습성 수준을 단계별로 나눠 제공하는 설계"**는 우리 쪽에도 적용할 여지가 있다 — 예를 들어 CRS 연동 파트너에게 제공하는 테스트/샌드박스 환경도 "읽기 전용 조회" → "테스트 예약 생성" → "실제 재고·요금 변경 가능"처럼 단계적 침습 수준을 명시적으로 나누면, 파트너사가 자기 목적에 맞는 최소 권한 환경을 고를 수 있다는 점에서 vphone-cli의 `less`~`exp` 변형 설계와 같은 사고방식을 빌려올 수 있다. 격리 자체보다는 "격리 단계를 사용자가 고를 수 있게 열어둔다"는 UX적 교훈이 더 온다스럽게 옮겨오는 부분이다.

## 연관 자료

- [[2026-08-28-general-vm-not-enough-agent-isolation]] — VM 격리를 "뚫는" 쪽 사례. vphone-cli는 반대로 격리 인프라를 "재활용해 여는" 쪽 사례로, 같은 Virtualization/VM 신뢰 경계 주제를 다른 방향에서 비춘다.
- [[2026-06-08-apple-container-machine]] — 동일한 Apple Silicon + Virtualization.framework 기반 위에서, 개발자 워크플로용 경량 Linux VM이라는 다른 목적으로 세워진 이웃 프로젝트.
- [[2026-06-01-how-anthropic-contains-claude]] — "환경 계층에서 필요한 만큼만 격리 수준을 계층화하라"는 설계 원칙이 vphone-cli의 5단계 패치 변형과 같은 결로 반복된다.

## 한 달 뒤 회고

2026-09-30 즈음 다음을 점검한다.
- vphone-cli가 iOS 27(또는 그 다음 메이저) 대응까지 이어지며 계속 활발히 유지보수되는지, 아니면 Apple의 PV=3 인터페이스 변경 등으로 빠르게 deprecated 되는지.
- Apple이 이 프로젝트(또는 유사 프로젝트)에 공식 대응 — DMCA/약관 조치든, 반대로 공식 지원 채널 개설이든 — 을 했는지.
- hada 원문 댓글을 이번엔 직접 읽어, 이 노트에서 비워둔 "커뮤니티 반응·아젠다" 부분을 보강할 수 있는지.
