---
title: "iOS Safari의 60 FPS 제한을 우회해 네이티브처럼 느껴지는 웹 애플리케이션 만들기 (GeekNews) — 전역 렌더 루프가 아니라 네이티브 스크롤 컴포지터 채널에 올라탄다"
source_title: "Beating iOS Safari's 60fps cap to make web apps feel native"
source_url: "https://news.hada.io/topic?id=37832"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37832"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "frontend"
tags: ["ios-safari", "offscreencanvas", "web-performance", "120hz", "webkit", "scroll-compositor"]
---

# iOS Safari의 60 FPS 제한을 우회해 네이티브처럼 느껴지는 웹 애플리케이션 만들기 (GeekNews)

> 출처: [Beating iOS Safari's 60fps cap to make web apps feel native](https://news.hada.io/topic?id=37832) · 정리일 2026-11-26

> **출처 한계**: 원문(news.hada.io)은 egress 차단으로 못 열었다. WebSearch로 확인한 일반적인 웹 플랫폼 지식은 Slack 불릿의 구체 기법과 ***부분적으로만 일치한다*** — WebKit 버그트래커에는 "Prefer Page Rendering Updates Near 60fps" 설정을 끄면 PWA가 120fps로 동작한다는 보고가 있지만, 이는 ***사용자가 Safari 설정에서 바꾸는 값***이라 앱 코드가 직접 제어할 수 없다. Slack 불릿이 설명하는 "OffscreenCanvas + 네이티브 스크롤 컴포지터" 기법은 이 사용자 설정과는 다른, 네이티브 스크롤이 이미 고주사율로 처리된다는 사실을 활용하는 별도의 우회로로 보이나, 원문 저자·블로그를 특정하진 못했다.

## 한 줄 요약

**사용자가 Safari 설정을 바꾸지 않아도, 네이티브 스크롤 이벤트가 이미 별도 스레드의 컴포지터에서 고주사율로 처리된다는 사실을 활용해, 스크롤 영역을 입력 컨트롤러로 써서 OffscreenCanvas 기반 UI를 120Hz로 그리는 기법이다.**

## 핵심 포인트

- **네이티브 스크롤은 이미 120Hz다** — iOS Safari의 일반 DOM 업데이트는 60Hz에 묶이지만, ***네이티브 스크롤 자체는 JavaScript 왕복 없이 별도 스레드의 컴포지터가 처리***하므로 이미 고주사율로 동작한다는 전제.
- **스크롤 영역을 입력 컨트롤러로 전용** — 실제 스크롤로 콘텐츠를 움직이는 게 아니라, 스크롤 입력을 ***고빈도 입력 신호***로만 활용해 `OffscreenCanvas`로 그린 Liquid Glass 탭 바·드래그 상호작용을 구현.
- **WebKit 구현의 틈을 활용** — `OffscreenCanvas`가 다음 페이지 렌더링을 기다리지 않고 프레임을 전달하는 WebKit 내부 구현을 이용해, 입력만 120Hz로 받고 일반 DOM 갱신은 60Hz에 묶인 제약을 우회.
- **일반 지식과의 접점** — WebSearch로 확인한 WebKit 버그 리포트들은 "Prefer Page Rendering Updates Near 60fps"라는 ***사용자 설정***이 PWA 주사율에 영향을 준다는 별개의 사실을 보여준다. 이 글의 기법이 그 설정과 무관하게 동작하는지, 아니면 그 설정에도 영향을 받는지는 원문 없이는 확인 불가.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함.)

## 댓글

GeekNews 댓글 수 미확인(원문 차단). 프론트엔드 성능 최적화 기술 글 특성상 HN류 커뮤니티에서도 다뤄졌을 가능성이 있으나 확인하지 못했다.

## 내 생각 · 적용점

이 기법은 "플랫폼이 공식적으로 막아둔 것"과 "플랫폼이 이미 다른 용도로 고성능으로 돌리고 있는 채널"을 구분해, 후자에 올라타는 전형적인 플랫폼 우회 패턴이다. WebKit의 "Prefer 60fps" 사용자 설정이 따로 존재한다는 사실과 겹쳐 생각하면, iOS의 웹앱 프레임레이트 제약은 ***단일한 하나의 벽이 아니라 여러 겹의 제약***이라는 걸 알 수 있다 — 코드로 우회 가능한 부분과 사용자 설정에 의존하는 부분이 섞여 있다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** CRS 시스템은 대개 데스크톱·태블릿 환경의 업무용 웹앱이라 모바일 Safari의 프레임레이트 최적화가 직접 적용될 지점은 거의 없다. 다만 "플랫폼 제약을 피해가려면 공식 API가 아니라 플랫폼이 이미 다른 목적으로 고성능으로 돌리는 채널을 찾아라"는 사고방식 자체는, 레거시 PMS 연동에서 공식 API가 느릴 때 다른 경로(웹훅, 이벤트 스트림)를 찾는 발상으로 느슨하게 연결 가능하다.

## 연관 자료

- 관련 선행 노트 없음(이 레포에 iOS Safari 프레임레이트/OffscreenCanvas 전용 노트는 처음).

## 한 달 뒤 회고

2026-12-26 즈음 — 이 기법이 WebKit 업데이트로 막혔는지, 다른 프레임워크(React Native WebView 등)에도 적용 가능한 일반화된 패턴으로 소개됐는지 확인.
