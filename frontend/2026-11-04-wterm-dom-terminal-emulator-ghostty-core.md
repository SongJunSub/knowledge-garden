---
title: "wterm, DOM 렌더링과 Ghostty 코어를 지원하는 웹 터미널 에뮬레이터(GeekNews) — 캔버스를 버리고 진짜 DOM 노드로 그려 브라우저 기본 기능을 되찾았다"
source_title: "wterm"
source_url: "https://github.com/vercel-labs/wterm"
source_name: "GitHub (vercel-labs/wterm, 확인 수준 중간)"
referrer_url: "https://news.hada.io/topic?id=36554"
summarized_at: "2026-11-04"
category: "frontend"
tags: ["wterm", "terminal", "dom-rendering", "ghostty", "wasm", "vercel-labs"]
---

# wterm, DOM 렌더링과 Ghostty 코어를 지원하는 웹 터미널 에뮬레이터(GeekNews)

> 출처: [wterm](https://github.com/vercel-labs/wterm) (GitHub) · GeekNews 경유 · 정리일 2026-11-04
>
> **출처 한계**: news.hada.io와 github.com 원 저장소 모두 이 세션에서 직접 열람하지 못해, betterstack.com·p.codekk.com 등의 WebSearch 2차 설명에 의존했다. 저장소 소유자 표기가 매체마다 `vercel-labs`와 `beardedeagle`로 갈려 있어, 다수 2차 자료가 가리키는 `vercel-labs/wterm`을 원 저장소로 판단했지만 미확정이다. published_at(최초 공개일)도 확인하지 못해 생략했다.

## 한 줄 요약

**Vercel Labs가 만든 wterm은 캔버스 대신 실제 DOM 노드로 터미널을 렌더링해 네이티브 텍스트 선택·클립보드·브라우저 찾기·스크린리더 접근성을 그대로 살리면서, 코어는 약 26KB의 자체 Zig/WASM과 libghostty 기반 Ghostty 코어(~400KB) 중 선택할 수 있게 한 웹 터미널 에뮬레이터 라이브러리다.**

## 핵심 포인트

- ***DOM 렌더링*** — 텍스트가 실제 DOM 노드로 존재해 네이티브 선택·복사·찾기·스크린리더가 그대로 작동하고, 바뀐 행만 다시 그리는 더티-로우 추적으로 성능을 지킨다.
- 기본 코어는 ***Zig로 컴파일한 WASM***(약 26KB)으로 VT100/VT220/xterm 이스케이프 시퀀스를 처리한다.
- 선택적으로 ***@wterm/ghostty*** 코어를 쓸 수 있다 — libghostty 기반의 완전한 VT 에뮬레이션(그래핌 처리, 소프트랩 메타데이터 포함)으로, 용량은 더 크지만(약 400KB) 호환성이 넓다.
- ***CJK·이모지·한글 IME 조합 입력***을 지원하며, 조합이 확정된 텍스트만 연결된 프로그램에 전달한다.
- 헤드리스 코어(@wterm/core)·DOM 렌더러(@wterm/dom)·React/Vue 통합 패키지로 구성돼 프레임워크에 맞춰 조합할 수 있다.
- 화면 밖으로 스크롤된 출력 전체를 ***검색·선택***할 수 있고, 가상 스크롤로 화면 주변만 실제 DOM에 유지한다.

## 인상 깊은 문장

> "Text stays in the page as real nodes, so native selection, clipboard, browser find, and screen readers work on mounted rows." — betterstack.com 가이드 재구성(WebSearch 종합, 원문 GitHub README 직접 열람 못함)

## 댓글

GeekNews hada 댓글 수는 확인하지 못했다(news.hada.io 접근 차단). **이해관계**: Vercel Labs의 사이드 프로젝트성 오픈소스 라이브러리로, 과장된 마케팅 성격은 적어 보이지만 Ghostty 코어의 실제 안정성·채택 수준은 WebSearch로 확인하지 못했다.

## 내 생각 · 적용점

**핵심 전이 — 터미널 코어를 재사용 가능한 라이브러리로 뽑아내는 흐름이 데스크톱과 웹 양쪽에서 동시에 일어나고 있다.** [[2026-09-16-termdom-html-css-dom-terminal-ui]]는 "별도 터미널 위젯 API를 배우는 대신 실제 DOM을 문자 셀 그리드로 써서 React·Vue를 그대로 렌더링한다"는 아이디어였다 — wterm은 같은 'DOM을 터미널 렌더링 타깃으로 쓴다'는 축을, Ghostty라는 완성형 터미널 코어와 결합해 한 단계 더 제품화한 사례다. 또한 [[2026-11-02-kwi-kde-terminal-libghostty]]에서 libghostty 코어가 KDE 데스크톱으로 옮겨갔다면, wterm은 같은 코어를 웹·WASM으로 옮긴 짝이 되는 사례다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** CRS 제품에 웹 기반 풀 터미널이 필요한 경우는 거의 없다(관리 콘솔의 로그 뷰어 정도). 다만 "접근성 기본값을 버리지 않는 렌더링 방식을 설계 초기에 고르면 나중에 되돌리기 어려운 비용을 피한다"는 원칙은 참고할 만하다 — 네이티브 텍스트 선택·스크린리더 지원은 나중에 끼워 넣기 어렵다.

## 연관 자료

- [[2026-09-16-termdom-html-css-dom-terminal-ui]] — DOM을 터미널 렌더링 타깃으로 쓰는 같은 아이디어의 이전 사례
- [[2026-11-02-kwi-kde-terminal-libghostty]] — 같은 libghostty 코어가 데스크톱(KDE)으로 옮겨간 짝이 되는 사례

## 한 달 뒤 회고

*(2026-12-04 즈음 — github.com 접근이 풀리면 실제 저장소 소유자(vercel-labs vs beardedeagle)와 라이선스, 다운로드 지표로 채택 수준을 확인한다.)*
