---
title: "Rust 1.100.0 출시 — 8월에 merge된 never 타입 PR이 석 달 만에 실사용자 손에 닿았다"
source_title: "Rust 1.100.0 - never 타입과 사용자 정의 메모리 할당자 안정화"
source_url: "https://news.hada.io/topic?id=37070"
source_name: "GeekNews(news.hada.io), 원문 미확인"
referrer_url: "https://news.hada.io/topic?id=37070"
published_at: "2026-11-12"
summarized_at: "2026-11-13"
category: "engineering"
tags: ["rust", "type-system", "never-type", "memory-allocator", "language-release"]
---

# Rust 1.100.0 출시 — 8월에 merge된 never 타입 PR이 석 달 만에 실사용자 손에 닿았다

> 출처: [Rust 1.100.0 - never 타입과 사용자 정의 메모리 할당자 안정화](https://news.hada.io/topic?id=37070) (GeekNews, 원문 미확인) · 정리일 2026-11-13
> **출처 한계**: news.hada.io 전면 차단, 공식 Rust 릴리즈 노트(releases.rs)도 WebSearch 결과에선 1.100.0 항목을 찾지 못했다. never 타입 부분은 지난 2026-08-26 노트에서 추적한 PR #155499의 milestone·일정(9월25일 분기, 11월12일 stable 예정)으로 교차확인했지만, 할당자 API와 DropGuard 항목은 끝내 교차확인하지 못했다.

## 한 줄 요약

**Rust 1.100.0이 (추정) 2026년 11월 12일경 출시되며, 지난 8월 24일 merge됐던 "never 타입 `!` 안정화" PR(#155499)이 드디어 stable 채널에 도달했다. 사용자 정의 메모리 할당자 API 안정화도 같은 릴리즈에 포함됐다고 Slack 발췌는 전하지만, 이 부분은 원문을 확인하지 못해 확정하지 못한다.**

## 핵심 포인트

- **never 타입 `!` 안정화가 "도달"한 시점** — [[2026-08-26-rust-never-type-stabilized]]에서 정리했던 PR #155499는 8월 24일 merge됐고, milestone은 1.100.0, 9월 25일 master 분기, 11월 12일 stable 예정이었다(WebSearch로 PR 타임라인 확인). `Result<T, !>`처럼 실패할 수 없는 연산을 표현할 수 있고, `Infallible`은 `!`의 타입 별칭이 됐다.
- **모든 에디션의 fallback 통일** — 2015/2018/2021/2024 에디션 전부 never-type fallback이 `()`에서 `!`로 바뀌어, 일부 코드의 타입 추론에 영향을 줄 수 있다. 지난 노트에서 이미 "crater 회귀 3,277건을 의도된 breaking change로 승인했다"는 결정 과정을 정리했다.
- **사용자 정의 메모리 할당자 API** — Slack 발췌에 따르면 `Allocator` 트레이트로 사용자 정의 할당자를 구현하고, `Vec::new_in`·`Box::new_in`으로 객체 생성 시 할당자를 지정할 수 있다고 한다. **다만 WebSearch 결과는 이 API가 1.99와 1.100 중 어느 버전에서 안정화됐는지조차 상충됐고(LWN은 1.99, 다른 국내 매체는 1.100 milestone), 공식 확인에 실패했다** — 정직하게 미확정으로 남긴다.
- **DropGuard** — Slack 메시지 원문이 "스코프를 벗어날 때..."에서 잘려 있었고, WebSearch로 찾은 Rust 표준 라이브러리 문서 예제는 여전히 `#[feature(drop_guard)]`로 게이트되어 있었다. 이번 릴리즈에서 실제로 안정화됐는지 확정하지 못한다.

## 인상 깊은 문장

> "This PR stabilizes the never type, sets the never type fallback to `!` on all editions, and makes `Infallible` an alias of `!`." (PR #155499 본문, 지난 노트에서 재인용)

## 댓글

원문 미열람으로 hada 댓글 수 확인 불가. 할당자·DropGuard 관련 논쟁이 있었을 가능성이 있으나 확인 못함.

## 내 생각 · 적용점

이 글의 진짜 흥미로운 지점은 "never 타입 자체"가 아니라 **"8월에 merge된 변경이 3개월의 릴리즈 사이클을 거쳐 11월에 실제 사용자 손에 들어온다"**는 리드타임이다. [[2026-08-26-rust-never-type-stabilized]]에서 "10년·5차 시도"라고 불렀던 장기 프로젝트가 merge 이후에도 또 한 번의 "배포까지의 거리"를 거치는 셈이다. 이건 "결정(merge)"과 "영향이 실제로 발생하는 시점(stable 도달)"이 분리되어 있다는, 모든 소프트웨어 릴리즈 엔지니어링에 보편적인 교훈이다. 같은 배치에서 정리한 [[2026-11-12-lets-try-gleam]](설계 철학과 입문 경험의 짝)과 달리, 이번 글은 "오래된 언어가 breaking change를 어떻게 안전하게 배포하는가"라는 반대편 사례다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 다만 전이 가능한 원칙: "breaking change를 crater 같은 전수 회귀 테스트로 수치화한 뒤 의도된 변경으로 승인한다"는 의사결정 패턴은, 레거시 CRS 시스템을 변경할 때 영향 범위를 먼저 수치로 측정하고 승인하는 프로세스에 참고할 수 있다.

## 연관 자료

- [[2026-08-26-rust-never-type-stabilized]] — 이번에 stable로 "도달"한 PR #155499의 원래 merge 소식
- [[2026-10-22-rust-compiler-2026-exciting-year]] — 같은 Rust 생태계 모멘텀 계열(빌림검사기 Polonius 등)
- [[2026-09-11-rust-microsoft-tier-1-language]] — Rust 생태계 확장 맥락

## 한 달 뒤 회고

*(2026-12-13 즈음 — 사용자 정의 할당자 API·DropGuard의 실제 안정화 버전을 공식 릴리즈 노트로 재확인했는지, 1.100.0 출시일을 교차확인했는지 기록.)*
