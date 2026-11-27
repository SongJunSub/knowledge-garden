---
title: "tidy - Prettier 스타일로 코드를 정리하는 Rust 기반 고속 포매터 (GeekNews) — Node.js 없이 단일 실행 파일로 Prettier의 멀티 언어 포맷팅을 대체한다"
source_title: "tidy - A fast Rust-based code formatter in the style of Prettier"
source_url: "https://news.hada.io/topic?id=37927"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37927&utm_source=slack&utm_medium=bot&utm_campaign=T02M82VMZ"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "engineering"
tags: ["rust", "code-formatter", "prettier", "developer-tools", "performance"]
---

# tidy - Prettier 스타일로 코드를 정리하는 Rust 기반 고속 포매터 (GeekNews)

> 출처: [tidy](https://news.hada.io/topic?id=37927) (GeekNews) · 정리일 2026-11-27

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 차단되어(ENOTFOUND) 원문과 hada 댓글을 직접 열람하지 못했다. WebSearch로 "tidy Rust Prettier 대체" 프로젝트 자체를 특정하지 못했다 — rustfmt 대안인 `chloro`, Rust용 Prettier 플러그인(`prettier-plugin-rust`) 등 유사 프로젝트만 확인됐고, 이 글이 말하는 "tidy"와 동일한지는 확인 불가. Slack 발췌 불릿 기준으로만 정리한다.

## 한 줄 요약

**tidy는 Node.js 런타임 없이 단일 실행 파일로 동작하는 Rust 기반 포매터로, Prettier가 지원하는 다국어(웹 개발 언어 + TOML·XML·Dockerfile·INI 등) 포맷팅을 속도 중심으로 대체하려는 프로젝트다.**

## 핵심 포인트

- **Node.js 의존성 제거** — Prettier와 같은 스타일 규칙을 적용하지만 ***Node.js 없이 단일 실행 파일***로 동작한다. CI 환경이나 설치가 까다로운 환경에서 런타임 의존성을 줄이는 방향.
- **웹 개발 언어 폭넓게 지원** — JavaScript, TypeScript, JSX, HTML, Vue, CSS, SCSS, Less 등 Prettier의 핵심 지원 범위를 그대로 커버.
- **플러그인 없이 추가 포맷 지원** — Markdown, JSON, YAML, GraphQL 외에 ***TOML, XML, Dockerfile, INI***까지 별도 플러그인 설치 없이 처리한다는 것이 Prettier 대비 차별점으로 서술됨.
- **파일 내 혼합 언어도 함께 정리** — HTML/Vue 안의 스타일·스크립트, Markdown 코드 블록 안의 JS 템플릿 리터럴 안 CSS/GraphQL/HTML/Markdown까지 재귀적으로 포맷한다는 설명.
- **자체 벤치마크 수치** — "자체 벤치마크에서 12,071개 파일 처리" 언급이 Slack 발췌에서 끊겨 구체적인 처리 시간·Prettier 대비 배속은 확인 불가.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함. Slack 발췌: "Prettier와 같은 코드 스타일을 빠르게 적용하는 포매터로, Node.js 없이 단일 실행 파일로 동작함")

## 댓글

GeekNews 댓글 수·반응 확인 불가(egress 차단). HN/Lobsters 등 외부 큐레이션 존재 여부도 미확인.

## 내 생각 · 적용점

### 핵심 전이 — "런타임 의존성 제거 + Rust 재작성"이라는 이번 주 반복 패턴

같은 배치의 [[2026-11-26-relax-rust-jit-live-compiler]](Rust JIT 컴파일러)와 묶어보면, 이번 주 GeekNews 피드에 "기존 Node.js/스크립트 생태계 도구를 Rust 단일 바이너리로 재작성해 속도와 배포 단순성을 얻는다"는 흐름이 반복적으로 올라온다. [[2026-11-25-trynix-browser-nix-webassembly]]나 [[2026-11-27-minipg-postgresql-single-executable]](이 배치의 다른 글, 작성 예정)도 "단일 실행 파일화"라는 같은 축이다.

### 적용점

CI 파이프라인에 Prettier를 쓰고 있다면 Node.js 설치 단계 자체를 없앨 수 있다는 점에서 빌드 시간 단축에 바로 적용 가능한 도구다. 다만 플러그인 생태계(Prettier의 커스텀 플러그인 의존 여부)를 먼저 점검해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS 개발 조직의 CI 빌드 시간을 줄이는 수단으로는 참고할 수 있으나, 업계 도메인 자체와는 무관한 범용 개발자 도구다.

## 연관 자료

- [[2026-11-26-relax-rust-jit-live-compiler]] — 같은 주 Rust 기반 개발자 도구 재작성 사례
- [[2026-11-25-trynix-browser-nix-webassembly]] — "무거운 런타임을 가볍게 만든다"는 같은 축

## 한 달 뒤 회고

2026-12-27 즈음 — 원문이 열리면 벤치마크 수치(Prettier 대비 배속)와 실제 GitHub 스타 수·채택 사례를 확인한다.
