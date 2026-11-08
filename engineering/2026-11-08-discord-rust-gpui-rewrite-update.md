---
title: "Discord의 Rust 재작성, 소문에서 CTO 공식 확인으로 — GPUI 기반 'Phoenix' 빌드가 RAM 290MB를 기록했다"
source_title: "Discord CTO confirms the desktop and mobile apps are being rebuilt in Rust (CTO Stanislav Vishnevskiy의 X 발언을 인용한 복수 테크 매체 보도)"
source_url: "https://www.techpowerup.com/354550/discord-is-rebuilding-its-app-in-rust-early-build-uses-just-290-mb-of-ram"
source_name: "TechPowerUp, gHacks, Windows Latest 등 복수 테크 매체 (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=36778"
published_at: "2026-11-04"
summarized_at: "2026-11-08"
category: "engineering"
tags: ["discord", "electron", "rust", "gpui", "zed", "desktop-app", "memory-usage", "rewrite"]
---

# Discord의 Rust 재작성, 소문에서 CTO 공식 확인으로

> 출처: [Discord Is Rebuilding Its Desktop App in Rust, Early Build Uses Just 290 MB of RAM](https://www.techpowerup.com/354550/discord-is-rebuilding-its-app-in-rust-early-build-uses-just-290-mb-of-ram) (TechPowerUp 등, CTO 발언 인용) · 정리일 2026-11-08

> **출처 한계 — 이전 노트([[2026-11-06-discord-electron-to-rust-rewrite]])의 "미확인" 상태를 오늘 WebSearch로 해소했다.** news.hada.io는 이번에도 egress 차단(getaddrinfo ENOTFOUND)으로 원문 열람 불가. 대신 TechPowerUp·gHacks·Windows Latest·inven Global 등 다수 독립 매체가 거의 동일한 사실을 보도하고 있어 교차확인 신뢰도는 높다. 다만 1차 출처는 **Discord의 공식 블로그 포스트가 아니라 CTO Stanislav Vishnevskiy의 X(트위터) 개인 발언**이며, RAM 수치도 Discord 측이 자체 제작한 데모 스크린샷 1장("Discord Phoenix" 빌드)에서 나온 것으로 독립 벤치마크는 아직 없다. "회사 공식 확인"과 "회사 공식 발표(블로그)"는 여전히 구분해 읽어야 한다.

## 한 줄 요약

**이전 노트에서 "유저 요청·서드파티 프로젝트일 뿐"이라 미확인으로 남겼던 Discord의 Rust 전면 재작성은, 2026년 11월 4일 CTO가 X에서 직접 확인하며 소문에서 회사 공식 확인으로 격상됐다 — 다만 여전히 공개 일정·CPU 벤치마크·Discord 자체 블로그 발표는 없다.**

## 핵심 포인트

- CTO Stanislav Vishnevskiy가 2026-11-04 X에서 데스크톱·모바일 앱을 Rust로 재작성하며 Electron(데스크톱)과 React Native(모바일)를 모두 걷어낸다고 공개 확인했다.
- 많은 사용자가 예상했던 **Tauri가 아니라 Zed 에디터 팀이 만든 Rust UI 프레임워크 ***GPUI***** 를 사용하며, Discord 자체 패치를 얹었다고 밝혔다. GPUI는 웹뷰 없이 GPU에 직접 렌더링하는 Zed의 네이티브 프레임워크다.
- 초기 Windows 빌드("Discord Phoenix")는 **계정 2개를 동시 실행한 상태에서 RAM 290.2MB** 를 기록한 태스크 매니저 스크린샷으로만 공개됐다 — 1장짜리 데모이며 독립 벤치마크는 아님.
- 기존 Electron 클라이언트의 메모리 사용량에 대해 Discord가 **세션당 최대 4GB까지 인정**했다는 보도가 있다(이전 노트에서 다룬 "자동 재시작 완화책"과 같은 맥락).
- **공개 일정은 아직 없다.** CPU 벤치마크, 접근성·기능 동등성, 테스트 일정 어느 것도 공식화되지 않았고 "곧 유저 테스트에 올리고 싶다"는 수준의 발언뿐이다.

## 인상 깊은 문장

> "The new app is built with GPUI, not Tauri as many had guessed." (Vishnevskiy, X, 2026-11-04 — 복수 매체 인용)

## 댓글

GN⁺ 댓글 수 확인 불가(news.hada.io 차단). 다만 이번 사안은 "GN⁺ 댓글"보다 "다수 독립 테크 매체의 동일 사실 보도"로 신뢰도를 확보한 사례라, 코멘트 섹션의 의미는 이전 노트들보다 작다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-06-discord-electron-to-rust-rewrite]]와의 관계: "미확인"이 "회사 공식 확인"으로 격상된 과정 자체가 교훈이다

이전 노트를 쓸 때는 WebSearch로 Discord의 공식 전면 재작성 발표를 찾지 못했고, 발견된 건 유저의 "Tauri로 바꿔달라" 요청 글과 FastCord·RustVesktop 같은 서드파티 재구현뿐이었다. 이틀 뒤(2026-11-04) CTO가 직접 X에 올리면서 상황이 바뀌었다 — **"회사가 공식적으로 전환을 발표했다"와 "유저가 요청 중이다/서드파티가 재구현했다"를 구분해 미확인으로 남겨둔 판단이 옳았다는 게 오히려 이번에 증명됐다.** 다만 동시에, "CTO의 X 발언"과 "회사의 공식 블로그 발표"도 또 다른 단계 차이라는 걸 이번 노트에도 그대로 적용해야 한다 — 아직 Discord 자체 공지는 없다.

### 핵심 전이 2 — Tauri 예상이 빗나가고 GPUI가 선택된 것은 "데스크톱 앱 경량화 트렌드" 안에서도 선택지가 다양함을 보여준다

[[2026-10-09-photocraft-rust-photoshop-clone]], [[2026-08-30-geolibre-tauri-desktop-gis]]가 Tauri 기반 재구현 사례였다면, Discord는 그보다 더 로우레벨인 GPUI(Zed 자체 렌더링 프레임워크)를 택했다. 같은 "Electron 이탈" 트렌드라도 **Tauri(웹뷰+네이티브 셸) vs GPUI(네이티브 GPU 렌더링)는 트레이드오프가 다르다** — 전자는 기존 웹 UI 코드 재사용이 쉽고, 후자는 성능은 높지만 UI를 처음부터 새로 짜야 한다. Discord가 후자를 택한 건 수억 명 규모 서비스가 "장기적 성능"에 베팅했다는 신호로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 여전히 멀다.** 다만 이전 노트에서 남긴 "다수의 상시 사용 단말에서 Electron 메모리 비용이 쌓이는 구조적 문제"는 이번에 Discord CTO 확인으로 더 신빙성을 얻었다 — CRS·PMS 프론트데스크 단말이 Electron 기반이라면 장시간 구동 시 메모리 누수·재시작 운영 비용을 이 사례로 재점검할 계기 정도로만 참고한다.

## 연관 자료

- [[2026-11-06-discord-electron-to-rust-rewrite]] — 이틀 전 같은 주제를 "미확인"으로 남겼던 노트. 이번 글이 그 불확실성을 상당 부분 해소한다.
- [[2026-10-09-photocraft-rust-photoshop-clone]] — Tauri로 데스크톱 앱을 가볍게 재구현한 사례(같은 트렌드, 다른 기술 선택)
- [[2026-08-30-geolibre-tauri-desktop-gis]] — Tauri를 Electron 대안으로 채택한 또 다른 확인된 사례

## 한 달 뒤 회고

*(2026-12-08 즈음 — Discord가 실제 테스트 빌드를 공개했는지, CPU·배터리 벤치마크가 나왔는지, 그리고 Discord 자체 공식 블로그 발표가 있었는지 확인.)*
