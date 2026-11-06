---
title: "Discord, Electron을 버리고 RAM 사용량이 적은 새 앱으로 전환 (원문 미확인) — WebSearch로는 공식 전면 재작성 발표를 찾지 못했고, 확인되는 건 임시 완화책과 커뮤니티의 Tauri 전환 요청뿐이다"
source_title: "확인 불가"
source_url: "확인 불가"
source_name: "GeekNews (원문 매체·저자 특정 실패)"
referrer_url: "https://news.hada.io/topic?id=36657"
published_at: "확인 불가"
summarized_at: "2026-11-06"
category: "engineering"
tags: ["discord", "electron", "rust", "tauri", "desktop-app", "memory-usage", "rewrite", "unverified-claim"]
---

# Discord, Electron을 버리고 RAM 사용량이 적은 새 앱으로 전환

> 출처: 원문 미확인 (GeekNews 경유, id=36657) · 정리일 2026-11-06

> **출처 한계 — Slack 발췌와 WebSearch 결과가 정면으로 어긋난다.** Slack 발췌는 "Discord가 데스크톱 앱 전체를 Rust로 전환하며 Electron을 제거 중이고, 2018년부터 Rust를 도입해왔다"고 서술한다. 하지만 WebSearch로는 Discord의 공식 전면 Rust 재작성 발표를 찾지 못했다. 확인되는 것은 (1) Discord가 Windows 앱의 과도한 RAM 사용(세션당 4GB 이상)을 인정하고 **자동 재시작이라는 임시 완화책**을 실험 중이라는 보도, (2) Discord 공식 지지 포럼에 사용자가 "Electron에서 Tauri로 전환해달라"고 요청한 글(회사의 공식 계획이 아니라 유저 제안), (3) FastCord·RustVesktop 같은 **제3자 비공식 Rust/Tauri 재구현 프로젝트**뿐이다. GeekNews가 이 세션에서 검색되지 않는 더 최신·비영어 1차 발표를 인용했을 가능성도 있어 완전히 틀렸다고 단정하진 않지만, **"공식 전면 전환"이라는 핵심 주장은 미확인 상태로 남긴다.**

## 한 줄 요약

**Slack 발췌는 Discord가 데스크톱(및 모바일 네이티브 UI 제외) 앱을 Rust로 전환해 Electron을 걷어내고 있다고 전한다. 그러나 이 세션의 WebSearch로 확인되는 건 "RAM 문제를 자동 재시작으로 임시 봉합"하는 조치와 "사용자들이 Tauri 전환을 요청"하는 포럼 글뿐이다 — 전면 재작성 발표 자체를 독립적으로 확인하지 못했다.**

## 핵심 포인트

- **Slack 발췌 주장**: 데스크톱 앱 전체를 Rust로 전환, Electron 제거. 모바일은 React Native 제거하되 네이티브 UI는 유지, Rust로 데스크톱·모바일 코드 공유 계획. CTO 공개 이미지 기준 RAM 290MB. 2018년부터 Rust 도입(인프라·음성 기술 상당 부분, 기존 클라이언트 일부).
- **WebSearch로 확인된 사실 ①**: Discord가 Windows 앱의 RAM 사용량이 의도보다 훨씬 크다는 것(세션당 4GB 이상)을 인정했고, 1시간 이상 실행 + 30분 유휴 + 통화 중이 아닐 때 자동 재시작하는 기능을 테스트 중이라는 보도가 있다(AlternativeTo, Korben 보도).
- **WebSearch로 확인된 사실 ②**: Korben은 "네이티브 재작성은 비용이 커서 Discord가 추진하지 않았다"고 주장하는 쪽 기사도 썼다 — Slack 발췌의 "전면 재작성 진행 중"과 **직접 상충**한다.
- **WebSearch로 확인된 사실 ③**: Discord 공식 지지 포럼에 "Electron에서 Tauri로 전환해달라"는 사용자 요청 글이 있다 — 회사가 아니라 유저가 제안한 것.
- **WebSearch로 확인된 사실 ④**: FastCord(Tauri+Rust 재구현), RustVesktop(Vesktop/Vencord의 네이티브 부분만 Rust로) 같은 **비공식 서드파티 프로젝트**가 존재한다.

## 인상 깊은 문장

> "Discord's current use of Electron for developing their desktop client is not the most efficient." (Discord 공식 지지 포럼의 사용자 요청 글, Discord의 공식 입장 아님)

## 댓글

GN⁺ 댓글 수 확인 불가(news.hada.io 차단). 이 노트는 **Slack 자동 요약 파이프라인이 전달한 정보가 실제로는 "사용자 요청"이나 "제3자 프로젝트"를 "회사의 공식 전환"으로 뭉뚱그렸을 가능성**을 보여주는 사례로 남긴다 — GN⁺ 원문 자체가 과장했을 수도 있고, Slack 발췌 생성 단계에서 뭉개졌을 수도 있어 원인은 특정하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "공식 발표"와 "유저 요청·서드파티 프로젝트"를 섞으면 안 된다

이번 배치의 [[2026-11-06-gpt6-astra-sandbagging-safety-eval]]에서도 "연구자가 지시한 적대적 설정"과 "자발적 행동"을 구분해야 한다고 적었는데, 여기서도 같은 교정이 필요하다 — **"회사가 공식적으로 전환을 발표했다"와 "유저들이 전환을 요청하고 있다/누군가 비공식으로 재구현했다"는 완전히 다른 신뢰도를 갖는다.** 뉴스 다이제스트를 자동화할 때 이 구분이 흐려지면 가든 전체의 신뢰도가 떨어진다.

### 핵심 전이 2 — [[2026-10-09-photocraft-rust-photoshop-clone]], [[2026-08-30-geolibre-tauri-desktop-gis]]와의 계열 — Electron 이탈은 실재하는 트렌드다

주장의 사실 여부와 무관하게, **"무거운 Electron/Chromium 기반 데스크톱 앱을 Rust+경량 웹뷰(Tauri 등)로 재구현하는 흐름" 자체는 실재한다.** PhotoCraft(이미지 편집기)와 GeoLibre(Tauri 기반 GIS 도구)가 그 사례다. Discord 사례의 진위와 별개로, **이 트렌드가 왜 반복적으로 등장하는지(메모리·CPU 비용, 배포 크기)는 가든에 이미 축적된 다른 노트들과 함께 봐야 한다.**

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(단, 전제가 확인되지 않은 상태로 주의).** CRS·PMS의 프론트 데스크 단말 소프트웨어가 Electron 기반이라면, 이 사례(사실이든 아니든)는 **"다수의 상시 사용 단말에서 메모리 사용량이 쌓이는 Electron 앱의 구조적 비용"을 재점검할 계기**로 참고할 만하다. 다만 Discord의 구체적 전환 여부를 근거로 삼지 말고, PhotoCraft·GeoLibre 같은 확인된 Rust/Tauri 사례를 벤치마크로 쓰는 게 안전하다.

## 연관 자료
- [[2026-11-06-gpt6-astra-sandbagging-safety-eval]] — "유도된 행동"과 "자발적 행동"을 구분해야 한다는 같은 결의 정직성 교정
- [[2026-10-09-photocraft-rust-photoshop-clone]] — Rust로 데스크톱 앱을 가볍게 재구현한 확인된 사례
- [[2026-08-30-geolibre-tauri-desktop-gis]] — Electron 대안인 Tauri를 실제로 채택한 확인된 사례

## 한 달 뒤 회고

*(2026-12-06 즈음 — Discord의 공식 Rust 전환 발표가 실제로 있었는지, 혹은 이 보도 자체가 오역·과장이었는지 1차 자료로 확인했는지 기록.)*
