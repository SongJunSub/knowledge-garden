---
title: "tinyjs (Tarwin Stroh-Spijer) - JavaScript로 약 6MB 데스크톱 앱을 만드는 경량 프레임워크 — Electron도 Node도 번들하지 않고, OS의 WebView와 txiki.js 런타임만 쓴다"
source_title: "tinyjs: tiny desktop apps for macOS — and, in beta, Windows and Linux"
source_url: "https://github.com/tarwin/tinyjsapp"
source_name: "GitHub (tarwin/tinyjsapp)"
referrer_url: "https://news.hada.io/topic?id=35038"
published_at: "2026-07-12"
summarized_at: "2026-10-09"
category: "engineering"
tags: ["tinyjs", "txiki-js", "electron-alternative", "webview", "desktop-app", "lightweight-framework"]
---

# tinyjs (Tarwin Stroh-Spijer) - JavaScript로 약 6MB 데스크톱 앱을 만드는 경량 프레임워크

> 출처: [tinyjs](https://github.com/tarwin/tinyjsapp) (Tarwin Stroh-Spijer, GitHub) · GeekNews(id=35038) 경유 · 정리일 2026-10-09

> **출처 한계**: `news.hada.io`와 `tinyjs.app` 공식 문서 페이지는 이 세션에서 egress 차단돼 직접 열람하지 못했다. 대신 **GitHub 공개 저장소(`tarwin/tinyjsapp`)를 직접 클론해 README·LICENSE를 1차 소스로 확보**했다 — 기능 설명·설치 방법·API 목록은 이 README에서 직접 확인한 것이다. 저장소는 2026-07-12 생성, MIT 라이선스(저자: Tarwin Stroh-Spijer), 조회 시점 기준 스타 712개·포크 20개로 이미 상당한 관심을 받고 있다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**tinyjs는 프론트엔드와 백엔드를 모두 JavaScript로 쓰는 데스크톱 앱 프레임워크로, Electron·Node.js·Chromium을 앱에 전혀 포함하지 않고 txiki.js 백엔드와 OS 기본 WebView(macOS WebKit, Windows WebView2, Linux WebKitGTK)만으로 배포 크기를 약 6MB(실제 파일 두 개)까지 줄인다.**

## 핵심 포인트

- **번들하지 않는 것으로 크기를 줄인다** — README가 명시하는 건 ***"No Electron, no Node, no bundled Chromium"***이다. 프론트엔드는 OS가 이미 갖고 있는 WebView(시스템 WebKit/WebView2/WebKitGTK)가 그리고, 백엔드는 QuickJS 엔진과 libuv를 쓰는 경량 런타임 ***txiki.js***가 담당해, 앱이 직접 들고 다닐 무게가 거의 없다.
- **페이지-백엔드 통신도 가볍다** — HTTP 서버나 포트를 열지 않고, 페이지와 백엔드가 ***프라이빗 임시 디렉터리의 Unix 도메인 소켓***으로 직접 통신한다. 백엔드는 파일·소켓·프로세스·FFI에 완전히 접근할 수 있는 평범한 JavaScript다.
- **프레임워크 생태계를 그대로 올릴 수 있다** — `tinyjs new myapp --template react-ts`(또는 vue-ts, svelte-ts, solid-ts, preact-ts 등)로 Vite 기반 프런트엔드를 그대로 얹을 수 있고, TypeScript 백엔드는 esbuild로 자동 번들된다. SQLite가 런타임에 내장돼 있어 `tiny.store`보다 큰 로컬 데이터는 바로 써도 된다.
- **네이티브 기능이 상당히 넓다** — 네이티브 메뉴·트레이·알림·드래그앤드롭(실제 파일 경로 포함)·전역 핫키·클립보드(NSPasteboard 직접 접근)·화면 녹화·온디바이스 OCR·macOS Apple Intelligence 호출까지, `tiny.*` API 하나로 접근한다. 단 Linux에서는 Web Audio가 WebKitGTK의 일반 우선순위 스레드에서 돌아 오디오가 끊길 수 있다는 점을 README가 직접 경고하고, `<audio>` 엘리먼트 직결을 대안으로 제시한다.

## 인상 깊은 문장

> "~6 MB shipped, two real files — no Electron, no Node, no bundled Chromium"
> (README 원문 그대로)

## 댓글

hada 댓글 수는 확인 불가(원문 egress 차단). 다만 이 노트의 핵심 설명은 hada 댓글이 아니라 **프로젝트 자신의 GitHub README를 직접 읽은 1차 소스**에 기반한다. 스타 712개·포크 20개는 공개 3개월 만의 수치로 적지 않은 관심을 보여주지만, 실제 프로덕션 배포 사례나 Windows/Linux(베타 단계) 안정성에 대한 독립적인 평가는 이번 조사로 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "숨겨진 런타임을 몰래 심는 AI 데스크톱 앱"과 정반대의 극단

[[2026-09-02-chatgpt-codex-bundled-libreoffice-runtime]]는 ChatGPT/Codex 데스크톱 앱이 사용자 모르게 `~/.cache`에 1.7GB짜리 런타임(Python·Node.js 전체 설치본, 430MB짜리 헤드리스 LibreOffice까지)을 심어두고, 문서 작업을 한 번도 요청하지 않아도 로그인 직후 똑같이 생성된다는 사실을 다뤘다. tinyjs는 정확히 그 반대 축에 서 있다 — "6MB, 실제 파일 두 개, Node도 Chromium도 번들하지 않는다"를 기능이 아니라 README 맨 윗줄의 정체성으로 내세운다. 같은 "데스크톱에 JS 런타임을 올린다"는 과제를 두고, 한쪽은 투명성 없이 무게를 늘리고 다른 쪽은 투명하게 무게를 줄이는 정반대 선택을 한 사례로 나란히 읽힌다.

### 핵심 전이 2 — Electron 기반 에이전트 데스크톱 앱 계열과의 무게 대조

[[2026-10-03-deepseek-harness-desktop-app]]는 DeepSeek Harness가 맥·윈도우용 데스크톱 앱으로 나온 사례를 다뤘는데, 그 기반은 Electron이다. AI 코딩 에이전트의 데스크톱 포팅이 이어지는 흐름에서, tinyjs 같은 프레임워크가 "같은 결과물(네이티브 창 하나, 웹 기술로 그린 UI)을 훨씬 가벼운 번들로 낼 수 있다"는 대안을 보여준다. 다만 tinyjs는 아직 Windows/Linux가 베타 단계라, Electron이 플랫폼 성숙도에서 여전히 우위를 갖는 지점도 분명하다.

## 호스피탈리티 / CRS 적용 포인트

CRS 코어 시스템에 tinyjs를 바로 쓸 일은 많지 않겠지만, **프런트 데스크나 하우스키핑 현장에서 쓰는 가벼운 보조 도구**(재고 스캐너, 룸 상태 체크 패널, 키오스크 관리 유틸리티) 같은 보조 데스크톱 앱에는 전이 가능성이 있다. 배포 크기와 설치 시간이 중요한 현장(저사양 PC, 느린 네트워크 환경의 프런트 데스크)에서는 Electron보다 tinyjs 같은 경량 접근이 실질적인 이점을 줄 수 있다. 단 Windows/Linux가 아직 베타인 점, 그리고 프로덕션 검증 사례가 부족한 점은 도입 전 반드시 자체 검증이 필요하다.

## 연관 자료

- [[2026-09-02-chatgpt-codex-bundled-libreoffice-runtime]] — 반대편 극단: AI 데스크톱 앱이 사용자 모르게 1.7GB 런타임을 심는 사례, tinyjs의 "6MB·투명성" 포지셔닝이 겨냥하는 바로 그 문제
- [[2026-10-03-deepseek-harness-desktop-app]] — Electron 기반 AI 에이전트 데스크톱 앱 계열, tinyjs와 배포 무게를 비교할 지점

## 한 달 뒤 회고

*(2026-11-09 즈음 — Windows/Linux 베타가 정식으로 전환됐는지, 실제 프로덕션 도입 사례가 보고되는지 확인.)*
