---
title: "Text.js (anomalyco) — 브라우저 DevTools 콘솔을 렌더링 타겟으로 삼은 React 프레임워크"
source_title: "textjs"
source_url: "https://github.com/anomalyco/textjs"
source_name: "GitHub (anomalyco/textjs)"
referrer_url: "https://news.hada.io/topic?id=37181"
published_at: "확인 불가"
summarized_at: "2026-11-15"
category: "frontend"
tags: ["react", "devtools", "console", "yoga", "tui", "geeknews"]
---
# Text.js - 브라우저 콘솔에서 동작하는 앱을 만드는 React 프레임워크

> 출처: [textjs](https://github.com/anomalyco/textjs) (GitHub · anomalyco) · 정리일 2026-11-15
>
> **출처 한계**: news.hada.io가 이 세션에서 egress 차단되어 원문 hada 토픽과 댓글을 직접 열람하지 못했다. GitHub 리포지토리(README)는 직접 조회했지만, Slack 발췌에 있던 `route.ts` 파일명과 MCP 연동 언급은 README 열람 범위에서는 "route handlers"로만 확인되고 정확히 재현되지 않았다 — 과장 없이 README 기준으로만 서술한다.

## 한 줄 요약

**Text.js는 React 컴포넌트·훅으로 짠 UI를 Yoga 레이아웃 엔진으로 문자 격자에 배치한 뒤, 변경된 프레임만 `console.log` 한 번으로 브라우저 개발자 도구의 Console 탭에 그려내는 React 프레임워크다 — 렌더링 타겟을 화면이 아니라 "로그"로 바꾼 아이디어가 핵심이다.**

## 핵심 포인트

- ***렌더링 타겟이 Console 탭*** — `Box`/`Text` 컴포넌트와 `useInput` 훅으로 UI와 키 입력을 정의하면, 실제 화면이 아니라 브라우저 DevTools의 콘솔 로그 한 줄에 전체 프레임을 그려낸다. 표·차트·폼·명령 팔레트를 조합한 키보드 조작형 대시보드까지 만들 수 있다.
- ***Yoga 레이아웃 재사용*** — React Native·Ink.js 등에서 쓰는 Facebook의 Yoga(flexbox) 엔진으로 문자 셀 그리드에 레이아웃을 계산한다. 상태가 바뀌면 전체를 다시 그리지 않고 변경된 프레임만 `console.log()` 한 번으로 출력해 콘솔 로그 폭주를 막는다.
- ***App Router 기반 풀스택 구조*** — `@textjs/app` 패키지가 파일 기반 라우팅을 담당해 `app/` 아래에 페이지·공통 레이아웃을 정의하고, 같은 프로젝트에 라우트 핸들러로 API를 추가할 수 있다. Bun 1.2+/Node 22+ 요구, `bunx create-text-app@latest`로 시작한다.
- ***규모*** — GitHub 스타 257개, MIT 라이선스, `anomalyco` 조직 소유. 데스크톱 Chrome/Edge/Firefox/Safari를 지원 대상으로 명시한다.

## 인상 깊은 문장

> (원문 hada 댓글·블로그 포스트 미열람으로 직접 인용 생략 — README 자체에는 인용할 만한 선언적 문장이 없었다.)

## 댓글

hada 원문 차단으로 댓글 수·HN/Lobsters 큐레이션 여부를 확인할 수 없다. 레포 스타 수(257)만으로는 커뮤니티 반응의 질을 가늠하기 어렵다 — 아이디어의 신기함과 실사용 채택 여부는 별개로 다뤄야 한다.

## 내 생각 · 적용점

이 글은 기술적 재미가 핵심인 가벼운 리소스성 프로젝트에 가깝다 — "브라우저 콘솔도 결국 터미널처럼 문자 격자를 그릴 수 있는 출력 장치"라는 관찰을 극단까지 밀어붙인 사례다. 다만 같은 가든에 정반대 방향의 거울상이 이미 있다: [[2026-09-16-termdom-html-css-dom-terminal-ui]]는 "터미널에 실제 DOM을 구현"해 웹 생태계(React/Angular/Vue)를 터미널로 끌어왔고, Text.js는 "브라우저 콘솔을 렌더링 타겟으로" 웹 앱을 거꾸로 로그 안에 투사한다. 두 글을 나란히 보면 ***"렌더링 타겟을 바꿔치기해서 기존 프레임워크 생태계를 그대로 재사용한다"***는 패턴이 양방향으로 성립한다는 게 보인다 — DOM을 터미널로 가져가거나(TermDOM), 콘솔을 화면으로 가져가거나(Text.js).

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS/호텔 운영 시스템에 "콘솔에 렌더링되는 숨겨진 디버그 대시보드"가 필요할 일은 거의 없다. 다만 전이 가능한 원칙 하나는 있다: ***운영자용 내부 디버그·모니터링 도구를 만들 때, 별도 UI를 새로 짜는 대신 이미 열려 있는 개발자 도구(콘솔/네트워크 탭)를 보조 출력창으로 재활용***하는 발상은 참고할 만하다 — 예: 예약/배치 작업 실패 시 운영 콘솔에 구조화된 디버그 프레임을 찍어주는 경량 훅.

## 연관 자료

- [[2026-09-16-termdom-html-css-dom-terminal-ui]] — 정반대 방향의 거울상: 터미널에 실제 DOM을 구현해 웹 프레임워크를 그대로 돌리는 TermDOM
- [[2026-11-04-wterm-dom-terminal-emulator-ghostty-core]] — 같은 "브라우저↔터미널 렌더링 경계 재설계" 계열의 또 다른 시도

## 한 달 뒤 회고

*(2026-12-15 즈음 — GitHub 스타 추이와 실제 프로덕션 채택 사례가 나왔는지, `route.ts`/MCP 연동이 공식 문서에 명시됐는지 재확인.)*
