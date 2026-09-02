---
title: "Darling — 6년 만에 되살아난 macOS-on-Linux 호환 계층, Wine처럼 VM 없이 API를 다시 짠다"
source_title: "Darling: Darwin/macOS emulation layer for Linux"
source_url: "https://github.com/darlinghq/darling"
source_name: "GitHub (darlinghq/darling)"
referrer_url: "https://news.hada.io/topic?id=33124"
published_at: "확인 불가"
summarized_at: "2026-09-02"
category: "engineering"
tags: ["darling", "macos", "linux", "compatibility-layer", "wine", "reverse-engineering", "open-source"]
---

# Darling — 6년 만에 되살아난 macOS-on-Linux 호환 계층

> 출처: [Darling: Darwin/macOS emulation layer for Linux](https://github.com/darlinghq/darling) (darlinghq · GeekNews 경유, id=33124) · 정리일 2026-09-02
> **출처 한계**: 이 세션에서 `news.hada.io`·`news.ycombinator.com`·`darlinghq.org`가 전부 egress 차단됐다. GitHub 저장소와 릴리스 페이지는 직접 확인했고, 그 외는 Slack 발췌와 WebSearch 교차검증만으로 재구성했다.

## 한 줄 요약

**Wine이 Windows 바이너리를 리눅스에서 돌리듯, Darling은 Mach-O 바이너리 로더와 유저스페이스 커널 서버로 macOS의 Mach IPC·POSIX·Darwin 시스콜을 다시 구현해 VM도 하드웨어 에뮬레이션도 없이 macOS 프로그램을 Linux에서 실행하는 프로젝트다.** 2022년 이후 사실상 멈춰 있던 릴리스가 2025년 10월부터 다시 이어지며, 그래픽·오디오·미디어·시스템 프레임워크를 대거 채워 넣는 재건 국면에 들어갔다.

## 핵심 포인트

- **VM/에뮬레이션이 아니라 API 재구현** — Mach-O 로더 + userspace 커널 서버로 macOS의 시스콜을 Linux 위에 다시 짜 넣는 방식.
- **6년 만의 재개** — 2022년 이후 잠잠하던 릴리스가 2025-10-23부터 다시 이어졌고, MetalPerformanceShaders·Vision·SpriteKit 등 십수 개 프레임워크와 심볼을 새로 채웠다.
- **인프라·빌드 체인도 같이 손질** — 다중 인스턴스 동시 실행 버그 수정, 좀비 프로세스 처리, DMG 마운트 수정, 최신 Fedora·Ubuntu·Clang·FFmpeg 환경에서의 빌드 호환성 복구.
- **여전히 x86_64 중심, GUI는 진행형** — CLI 도구는 이미 여러 개 동작하지만 GUI 애플리케이션 지원은 아직 개발 중.
- **GitHub 기준 약 13.3k star·522 fork·GPL-3.0, 오픈 이슈 387개** — 2012년경 시작한 오래된 프로젝트.

## 인상 깊은 문장

> "Darwin/macOS emulation layer for Linux" — 저장소 설명 문구. "emulation"이라는 단어를 쓰지만 실제로는 API·시스콜 재구현이라는 점에서, Wine이 스스로를 "Wine Is Not an Emulator"라고 부르는 것과 같은 용어상 아이러니가 있다.

## 댓글

GeekNews 원문 댓글 수·논지는 확인 못했다. HN에 관련 스레드로 추정되는 항목이 검색됐으나 접속 차단으로 포인트·댓글 수를 확정하지 못한다. 검색 스니펫으로 재구성한 댓글 단편 하나는 Darling을 Apportable과 비교하며 "x86_64만 타깃한다"는 한계를 짚었다.

## 내 생각 · 적용점

### 핵심 전이 1 — "공식이 안 열어주는 통로를 커뮤니티가 만든다"는 동일 패턴, 이번엔 재구현이라는 가장 무거운 방식으로

[[2026-08-31-tether-linux-imessage-sms-iphone-bridge]]와 [[2026-08-30-vphone-cli-virtual-iphone-boot]] 둘 다 "Apple 생태계 바깥에서 커뮤니티가 벌이는 리버스엔지니어링" 계열이다. Darling은 macOS라는 운영체제의 API·프레임워크 표면 전체를 처음부터 다시 구현하는 가장 무거운 길을 택했다.

### 핵심 전이 2 — [[2026-06-08-apple-container-machine]]과 정확히 반대 방향, 그리고 정반대 전략

Apple Container Machine은 공식적으로 Virtualization.framework로 Linux VM을 돌리는 도구였다. Darling은 그 거울상 — VM을 아예 쓰지 않고 API를 재구현한다. 재구현 쪽이 훨씬 가볍고 빠르지만 상대 플랫폼이 API를 바꿀 때마다 영원히 따라잡아야 하는 처지에 놓인다는 트레이드오프가 선명해진다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 전이 가능한 원칙: **"레거시·폐쇄 플랫폼과의 호환을 유지보수 중단 없이 계속 약속하려면, 그 플랫폼의 변화를 영원히 뒤쫓는 비용을 감수해야 한다"** — 특정 PMS·OTA의 구버전 연동 API를 계속 지원한다고 약속하는 순간, Darling이 Apple의 API 변화를 뒤쫓듯 그 파트너사의 API 변경을 영원히 뒤쫓는 유지보수 부채를 떠안게 된다.

## 연관 자료

- [[2026-08-31-tether-linux-imessage-sms-iphone-bridge]] — Apple 생태계 바깥에서 커뮤니티가 공식 미지원 기능을 재현하는 동일 패턴
- [[2026-08-30-vphone-cli-virtual-iphone-boot]] — 같은 패턴의 또 다른 변주
- [[2026-06-08-apple-container-machine]] — 정확히 반대 방향(가상화 vs 재구현)의 거울상 사례

## 한 달 뒤 회고

*(2026-10-02 즈음 — Darling의 릴리스 리듬이 유지되는지, GUI 애플리케이션 지원이 실질적으로 진전됐는지, 원문에 직접 접근할 수 있게 됐다면 댓글 수·논지를 보강.)*
