---
title: "MyGo, Go UI와 웹 프런트엔드로 데스크톱 앱을 만드는 오픈소스(GeekNews) — 웹뷰와 GPU 네이티브 UI를 한 앱에서 섞어 쓴다"
source_title: "MyGo - Go UI와 웹 프런트엔드로 데스크톱 앱을 만드는 오픈소스"
source_url: "https://news.hada.io/topic?id=36493"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36493"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "engineering"
tags: ["go", "desktop-app", "webview", "gpu-ui", "cross-platform", "mygo"]
---

# MyGo, Go UI와 웹 프런트엔드로 데스크톱 앱을 만드는 오픈소스(GeekNews)

> 출처: [MyGo - Go UI와 웹 프런트엔드로 데스크톱 앱을 만드는 오픈소스](https://news.hada.io/topic?id=36493) (GeekNews) · 정리일 2026-11-03
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 `pkg.go.dev/github.com/egoist/mygo`의 여러 버전 문서를 교차확인해 프로젝트 실재와 두 UI 모드(웹뷰/GPU 네이티브) 자체는 확인했지만, 버전별 기능 커버리지(구버전 문서는 웹뷰만 언급, GPU UI는 더 최근에 추가된 것으로 보임)는 독립확인 못했다.

## 한 줄 요약

**MyGo는 Go 언어 하나로 macOS·Windows·Linux 데스크톱 앱을 만드는 프레임워크로, OS 내장 웹뷰 기반 UI와 Go가 직접 GPU로 그리는 네이티브 UI를 한 앱 안에서 섞어 쓸 수 있게 해, "웹 기술 없이 순수 Go만으로" 개발하는 선택지까지 열어준다.**

## 핵심 포인트

- **두 가지 UI를 한 창에서 혼합** — Go로 직접 GPU 드로잉하는 네이티브 UI와 OS WebView 기반 웹 UI를 ***한 앱이나 한 창 안에서도 혼합 가능***하다고 설명한다. WebSearch로 확인한 `pkg.go.dev` 문서에서도 웹뷰 모드와 `ui` 패키지의 순수 Go GPU UI가 별도 경로로 존재함을 확인했다.
- **별도 브라우저 엔진을 앱에 포함하지 않음** — 웹 UI는 macOS의 WKWebView, Windows의 WebView2, Linux의 WebKitGTK처럼 ***OS가 이미 가진 웹뷰***를 그대로 쓴다. Electron류가 브라우저 엔진 전체를 앱에 묶어 배포하는 방식과 대비된다.
- **Go만으로도 완결 가능** — Go UI만 쓰는 앱은 ***HTML, JavaScript, WebView 없이 Go만으로 개발*** 가능하다고 명시한다. 웹 프런트엔드 지식 없이도 데스크톱 GUI를 만들 수 있다는 선택지다.
- **접근성까지 챙긴 UI 세트** — Flexbox·Grid 레이아웃, IME 텍스트 입력, 가상화 목록, SVG 아이콘, 애니메이션, ***스크린리더*** 지원까지 명시해, 토이 프로젝트 수준을 넘어서려는 의도가 보인다.
- **빌드 모델** — WebSearch 결과 cgo 없는 순수 Go 패키지로 확인됐으며(`pkg.go.dev` 문서), 프런트엔드는 생성된 TypeScript 클라이언트로 Go를 호출하는 구조라고 한다(웹뷰 모드 한정, 네이티브 GPU 모드는 해당 없음).

## 인상 깊은 문장

*(Slack 발췌가 "코드 편집기…"에서 말줄임으로 끊겨, 완결된 인용문이 남아 있지 않다. 발췌 자체도 TechArticles/GeekNews 봇의 요약체라 원문 저자의 직접 인용은 아니다.)*

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. **이해관계**: 확인되지 않음(저자 소속 등 불명). 이 글 자체가 홍보성 Show-HN류일 가능성이 있으나 과대광고 서술은 없다.

## 내 생각 · 적용점

**핵심 전이 — "웹 기술과 네이티브를 한 앱에서 섞는" 하이브리드 데스크톱 프레임워크 계열의 또 다른 선택지.** [[2026-08-30-geolibre-tauri-desktop-gis]]가 Tauri(Rust 코어 + 웹 프런트엔드)로 같은 문제를 풀었다면, MyGo는 Go 생태계에서 "웹뷰냐 네이티브 GPU냐"를 아예 둘 다 선택 가능하게 만든 점이 다르다. 백엔드 언어를 Go로 통일하고 싶은 조직이 Electron/Tauri 대신 고려할 수 있는 세 번째 축으로 봐도 될 듯하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 멀다.** CRS는 웹/서버 중심 B2B SaaS라 데스크톱 네이티브 앱 프레임워크 선택이 당장 쓰일 지점은 없다. 다만 내부 운영 도구(프런트 데스크 키오스크, 오프라인 체크인 단말 등)를 데스크톱 앱으로 만들 필요가 생기면, "웹뷰+네이티브 혼합"이라는 선택지로 참고할 가치는 있다.

## 연관 자료

- [[2026-08-30-geolibre-tauri-desktop-gis]] — 같은 "웹 프런트엔드 + 네이티브 셸" 하이브리드 데스크톱 프레임워크 계열, Rust/Tauri 버전

## 한 달 뒤 회고

*(2026-12-03 즈음 — 특별히 재확인할 내용 없음. GPU 네이티브 UI 모드의 실제 성숙도(버전별 커버리지)가 궁금하면 그때 `pkg.go.dev` 최신 버전으로 재확인.)*
