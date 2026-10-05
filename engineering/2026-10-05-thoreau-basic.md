---
title: "Thoreau BASIC (Tarjan) — BASIC이 유행에서 밀려나지 않았다면? (가벼운 픽)"
source_title: "Thoreau BASIC"
source_url: "https://tarjan.itch.io/thoreaubasic"
source_name: "itch.io (Tarjan), 공식 사이트 thoreaubasic.com"
referrer_url: "https://news.hada.io/topic?id=34778"
published_at: "확인 불가 (itch.io 프로젝트, v1.0 마일스톤 이후 지속 업데이트 중으로 WebSearch 교차확인)"
summarized_at: "2026-10-05"
category: "engineering"
tags: ["basic", "retro-computing", "gw-basic", "uefi", "jit-compilation", "parfor", "light-pick"]
---

# Thoreau BASIC (Tarjan)

> 출처: [Thoreau BASIC](https://tarjan.itch.io/thoreaubasic) (Tarjan, itch.io · 공식 사이트 [thoreaubasic.com](https://thoreaubasic.com/)) · GeekNews(id=34778) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`, `thoreaubasic.com`, `itch.io`, `tarjan.itch.io`, `news.ycombinator.com`, `hackaday.com` 전부 이 세션에서 egress 차단으로 직접 열지 못했다. 이 노트는 전부 **WebSearch 스니펫의 교차확인**으로 재구성한 것이다 — 기능 목록(64비트 메모리, 24비트 그래픽, TCP/IP·HTTP, GM/GS 웨이브테이블 사운드, 복소수·사원수·팔원수, PARFOR 멀티코어, x64 JIT)은 Hacker News Show HN 재인용(2건: `id=49942103`, `id=49410814`)과 Hackaday 기사 요약, itch.io 데브로그 제목들이 여러 독립 경로로 일치해 신뢰도가 있다. 다만 **가격("무료"라는 WebSearch 요약과 "pay-what-you-want"라는 별도 요약이 서로 다르게 나와 소스 간 불일치가 있다** — 어느 쪽이 정확한지 이 세션에서 확정하지 못했다. hada 댓글 수는 전혀 확인하지 못했고, HN Show HN 게시물 두 건의 정확한 점수·댓글 수도 egress 차단으로 직접 보지 못해 "토론이 있었다"는 사실 정도만 안다.

## 한 줄 요약

**Thoreau BASIC은 GW-BASIC의 줄 번호·`PRINT`·`FOR`/`NEXT` 문법을 그대로 유지하면서, 64비트 메모리·24비트 그래픽·스프라이트·TCP/IP·HTTP·MIDI/WAV/FLAC/Opus 사운드·복소수 연산·x64 JIT 컴파일·멀티코어 `PARFOR`까지 얹은 x64 BASIC 인터프리터다. Windows 프로그램으로 돌리거나 운영체제 없이 PC에 직접 부팅해 쓸 수 있고, 작성한 프로그램을 독립 실행형 EXE나 부팅 가능한 EFI 앱으로 만들어낼 수 있다.**

## 핵심 포인트

- **옛 문법 그대로, 메모리만 1990년대 밖으로 나왔다** — GW-BASIC과 거의 호환되는 줄 번호 기반 문법을 유지하면서, 사용 가능 메모리는 시스템이 보고하는 만큼 — 즉 기가바이트 단위 — 그대로 쓸 수 있다. "메가바이트 몇 개로 버티던 BASIC 머신"을 그대로 기가바이트 시대로 옮겨놓은 셈이다.
- **OS 없이도 돈다 — UEFI 베어메탈 부팅** — 같은 BASIC 언어가 일반 Windows 프로그램으로도, 운영체제 없이 UEFI 펌웨어에서 직접 부팅되는 형태로도 실행된다. 작성한 프로그램은 독립 실행형 EXE나 부팅 가능한 EFI 앱으로 패키징할 수 있다.
- **그래픽·사운드·네트워크를 별도 프레임워크 없이** — 24비트 그래픽과 스프라이트, 마우스 입력, TCP/IP·HTTP 통신, GM/GS 웨이브테이블 기반 MIDI/WAV/FLAC/Opus 재생을 전부 BASIC 명령 레벨에서 처리한다. 복소수·사원수(quaternion)·팔원수(octonion) 값까지 언어 차원에서 지원한다.
- **멀티코어 BASIC — `PARFOR`** — v2.5.1에서 추가된 기능으로, 독립적인 루프 반복을 여러 CPU 스레드에 자동으로 분산시킨다(Windows·베어메탈 UEFI 양쪽에서). 작업자 수 자동 튜닝, JIT 코드 공유, 컴파일 시점 안전성 검사까지 갖췄고, `PROFILE` 명령이 PARFOR 작업자별 측정까지 지원한다.
- **디버거·프로파일러·네이티브 JIT** — 중단점(breakpoint), `PRINT JUSTIFY`, `FIND` 같은 편의 기능과 함께 네이티브 x64 JIT 컴파일을 지원해 순수 인터프리터보다 빠르게 실행된다. itch.io 데브로그를 보면 v1.0부터 v3.2까지 꾸준히(수십 차례) 업데이트되며 다듬어지고 있다.

## 인상 깊은 문장

> "It has 64-bit memory, 24-bit graphics, sprites, mouse input, TCP/IP and HTTP, a complete GM/GS wavetable with MIDI/WAV/FLAC/Opus playback, complex/quaternion/octonion values, a debugger, profiler, source tools, multicore PARFOR, and native x64 JIT compilation."
> (Hackaday 기사 요약을 WebSearch가 재인용 — 원문 기사를 직접 열어 대조하지는 못했다.)

## 댓글

**hada 댓글 수는 egress 차단으로 확인 불가.** Hacker News에 Show HN 게시물이 적어도 두 건(`id=49942103`, `id=49410814`) 있었던 것으로 WebSearch 검색 결과 자체에서 확인되지만, 각각의 점수·댓글 수·논쟁 내용은 열어보지 못했다 — "토론이 있었다"는 존재만 알고 내용은 모르는 상태다. 이 글은 가벼운 리소스성 픽인 만큼, [[2026-10-04-rfc-1149-pigeon-packet-christies-auction]]과 마찬가지로 전이를 억지로 늘리지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 (가볍게) — "레트로 컴퓨팅은 애정으로 하는 것, 그 자체는 괜찮다"는 카맥의 유보적 긍정과 정확히 겹친다

[[2026-09-14-john-carmack-dont-be-kung-fu-master]]에서 카맥은 ***"레트로 컴퓨팅 문화는 사랑으로 옛 기술을 훈련하고 발휘하는 사람들로 가득하다"***며 그 자체는 괜찮다고 인정했다 — 다만 "현실과 동떨어진 쿵푸 고수가 되지는 말라"는 유보를 달았다. Thoreau BASIC은 바로 그 "애정으로 하는 레트로"의 실물 사례다. GW-BASIC 문법을 그대로 지키면서 멀티코어·JIT·네트워킹을 얹는 건 실용적 필요(미래 코딩 트렌드를 좇는 것)가 아니라, 카맥이 말한 "술(術)에서 도(道)로" 넘어간 애호가적 실천에 가깝다 — 그리고 이 프로젝트가 v1.0부터 v3.2까지 꾸준히 업데이트된다는 사실 자체가, 그런 애정 기반 프로젝트도 장난감에 머물지 않고 상당한 완성도로 갈 수 있다는 걸 보여준다.

이번 묶음 다섯 편 중 이 글만 뚜렷한 두 번째 전이를 세우지 않는다 — 가벼운 리소스성 픽이라 억지로 늘리지 않는다.

**이 글은 "Claude를 더 잘 쓰는 데" 직접적인 함의는 없다.** 순수하게 레트로 프로그래밍 취미 영역의 도구 소개다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 없음.** BASIC 인터프리터 자체가 CRS 도메인과 접점이 전혀 없고, 억지로 연결점을 만들지 않는다. 다만 일반론 수준에서 하나는 참고할 만하다 — "줄 번호 BASIC"처럼 극단적으로 단순한 문법이 현대적 기능(네트워크·그래픽·멀티코어)을 품을 수 있다는 건, 레거시 CRS 시스템의 오래된 설정 언어나 룰 엔진을 완전히 새로 짜는 대신 ***기존 문법은 유지하면서 기능만 확장하는*** 선택지가 종종 과소평가된다는 걸 가볍게 떠올리게 한다 — 다만 이건 이 글에서 직접 끌어낸 통찰이라기보다 유비 수준의 메모다.

## 연관 자료

- [[2026-09-14-john-carmack-dont-be-kung-fu-master]] — "레트로 컴퓨팅은 애정으로 하면 괜찮다"는 유보적 긍정, Thoreau BASIC은 그 실물 사례
- [[2026-10-04-rfc-1149-pigeon-packet-christies-auction]] — 같은 "가벼운 픽" 장르, 농담/레트로가 실제 완성도 있는 결과물로 이어진 또 다른 사례

## 한 달 뒤 회고

*(2026-11-05 즈음 — (1) egress가 풀리면 thoreaubasic.com과 itch.io 원문을 직접 읽어 가격(무료 vs pay-what-you-want) 불일치를 해소. (2) HN Show HN 두 건의 실제 댓글 내용을 확인해 커뮤니티가 어느 기능에 가장 반응했는지 점검.)*
