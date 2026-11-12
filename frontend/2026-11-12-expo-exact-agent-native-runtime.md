---
title: "Expo의 Exact, React 없이 웹·iOS·macOS·Linux 앱을 만드는 AI 에이전트 중심 런타임 (GeekNews, 제품 존재 자체 미확인) — UI를 선언형 Contract로 쓰고 에이전트가 빌드·실행·화면확인·테스트까지 대신한다"
source_title: "Expo의 Exact - React 없이 웹·iOS·macOS·Linux 앱을 만드는 AI 에이전트 중심 런타임"
source_url: "https://news.hada.io/topic?id=36991"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36991"
published_at: "2026-11-12"
summarized_at: "2026-11-12"
category: "frontend"
tags: ["expo", "agent-native", "cross-platform", "react-alternative", "ai-coding-agent", "rust"]
---

# Expo의 Exact, React 없이 웹·iOS·macOS·Linux 앱을 만드는 AI 에이전트 중심 런타임 (GeekNews, 제품 존재 자체 미확인)

> 출처: [Expo의 Exact](https://news.hada.io/topic?id=36991) (GeekNews) · 정리일 2026-11-12

## 한 줄 요약

**Expo가 공개했다고 전해지는 Rust 기반 크로스플랫폼 런타임으로, React·JSX 없이 선언형 Contract로 UI를 쓰고 AI 코딩 에이전트가 빌드·실행·화면확인·테스트까지 자동으로 수행하는 "Agent-native 아키텍처"가 핵심이다. 다만 이번 배치 중 확인 수준이 가장 낮은 건으로, 제품 존재 자체를 독립 확인하지 못했다.**

## 핵심 포인트

- Expo가 공개한 Rust 기반 크로스플랫폼 애플리케이션 런타임으로, 하나의 코드베이스에서 웹·macOS·iOS·Linux 네이티브 앱을 개발하도록 설계.
- AI 코딩 에이전트가 앱을 작성·빌드·실행·화면 확인·사용자 조작·테스트까지 자동으로 수행할 수 있는 ***Agent-native 아키텍처***가 핵심.
- UI는 자체 선언형 언어 ***Contract***로 작성, 비즈니스 로직·데이터 처리는 TypeScript 또는 Rust로 구현.
- React·JSX를 쓰지 않고, 네이티브 UI 렌더링에 WebView나 JavaScript 브릿지가 필요 없음 — 기존 Expo/React Native 생태계와는 다른 완전히 새로운 트랙.
- WebSearch로는 "Expo Exact"라는 이름도, 이런 Rust 기반 Contract 런타임도 독립 확인하지 못함. 확인되는 건 Expo가 2026년 4월 시리즈B $45M 투자를 받고 "Expo Agent"(Claude Code 기반 에이전트 빌더, 비공개 베타)로 AI 에이전트 방향에 베팅 중이라는 사실뿐.

## 인상 깊은 문장

> "React나 JSX를 사용하지 않으며, 네이티브 UI 렌더링에 WebView나 JavaScript 브릿지가 필요하지 않다" — Slack 발췌 재구성

## 댓글

news.hada.io 차단. WebSearch로 제품명·아키텍처 둘 다 특정하지 못함(Expo Agent라는 별개 공개 제품만 확인). 매체·저자도 특정 못함. 이번 배치 중 확인 수준이 가장 낮은 건 — "제품 존재 자체도 교차확인 실패"로 정직하게 표기.

## 내 생각 · 적용점

"React를 포기하고 네이티브로 돌아간다"는 방향이 공교롭게도 [[2026-09-11-shopify-react-native-return]]의 "코딩 에이전트가 두 번 만드는 비용을 낮췄다"는 전제와 거울상을 이룬다 — Shopify는 "에이전트가 있으니 플랫폼별로 따로 만들자"로, Expo Exact(가 실존한다면)는 "에이전트가 있으니 React/JSX 같은 추상화 계층 자체를 걷어내자"로 서로 다른 결론에 도달했다. 두 글 다 "AI 에이전트의 존재가 크로스플랫폼 추상화의 효용 계산을 바꾼다"는 같은 전제에서 출발한다는 점이 흥미롭다. [[2026-10-21-tsrs-typescript-compiler-rust-port]]의 "두 번째 네이티브화 레이스"와도 "기존 웹 생태계 레이어를 Rust로 다시 쓴다"는 결에서 통한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 온다의 B2B 제품은 모바일 네이티브 앱 전환 수요가 당장 크지 않다. 다만 "AI 에이전트가 UI를 화면 확인·조작까지 자동 테스트한다"는 Agent-native 아키텍처 개념 자체는, 내부 운영 툴의 E2E 테스트 자동화 설계에 장기적으로 참고할 만한 방향성 원칙으로만 남겨둔다.

## 연관 자료

- [[2026-09-11-shopify-react-native-return]] — 같은 전제(에이전트 비용 절감)에서 반대 결론에 도달한 거울상
- [[2026-10-21-tsrs-typescript-compiler-rust-port]] — 웹 생태계 레이어를 Rust로 다시 쓰는 같은 흐름

## 한 달 뒤 회고

*(2026-12-12 즈음 — "Expo Exact"라는 제품이 실제 존재가 확인됐는지, Expo Agent와의 관계가 밝혀졌는지 확인.)*
