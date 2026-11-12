---
title: "Gleam을 써보자(GeekNews, 원문 미확인) — 설계 철학과 입문 경험이 짝을 이룬다"
source_title: "Let's try Gleam"
source_url: "https://news.hada.io/topic?id=36975"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36975"
published_at: "2026-11"
summarized_at: "2026-11-12"
category: "engineering"
tags: ["gleam", "functional-programming", "beam", "erlang", "type-system"]
---

# Gleam을 써보자

> 출처: [GeekNews](https://news.hada.io/topic?id=36975) (GeekNews, 원문 미확인) · 정리일 2026-11-12
>
> **출처 한계**: `news.hada.io` 차단으로 원문·hada 댓글 미확인. Gleam 언어 자체의 일반 사실(BEAM/JS 이중 타겟, 정적 타입, v1.0 하위호환성)은 Wikipedia·InfoQ 등으로 교차확인했지만, 이 글의 저자·구체적 입문 경험 서술은 확인하지 못했다.

## 한 줄 요약

**Gleam은 Erlang VM(BEAM)과 JavaScript를 동시에 타겟으로 컴파일되는 정적 타입 함수형 언어로, 간결한 문법과 Erlang/Elixir 생태계와의 상호운용성을 내세운다.**

## 핵심 포인트

- **이중 타겟 컴파일** — BEAM(Erlang VM)과 JavaScript를 대상으로 컴파일되어, 백엔드와 프런트엔드에서 같은 언어·타입 정의를 공유할 수 있다.
- **파이프와 `use` 구문** — 파이프 연산자 `|>`와 콜백 중첩을 줄이는 `use`, 꼬리 호출 최적화를 중심으로 불변 데이터와 함수 조합을 다룬다.
- ***대수적 데이터 타입으로 원치 않는 상태를 표현 자체를 못하게 설계*** — "illegal states unrepresentable"이라는 함수형 언어 공통 철학을 타입 시스템으로 강제한다.
- **Erlang/Elixir 생태계 상호운용성** — BEAM과 OTP의 메시지 전달, 경량 프로세스, 내결함성 모델을 그대로 활용할 수 있다.
- **Rust 함수형 코드 경험자에게 친숙** — 문법과 타입 추론 스타일이 Rust의 함수형 패턴과 가깝다는 평.

## 인상 깊은 문장

> "대수적 데이터 타입으로 원치 않는 상태를 표현하지 못하게 설계할 수 있음" (Slack 발췌 재구성)

## 댓글

hada 댓글 미확인(원문 차단). HN/Lobsters 큐레이션 여부도 확인 못함. 이 글이 입문기(튜토리얼형)인지 평가 비평인지 원문 미확인 상태라 논조는 불분명하다.

## 내 생각 · 적용점

**전이 1 — 같은 언어, 다른 시점의 기록.** [[2026-08-24-gleam-cool-things-one-explicit-way]]에서 이미 Gleam의 "명시성(explicitness)"을 다룬 적이 있다. 이번 글은 같은 언어를 다루지만 "써보자"는 입문 관점이라, 선행 노트의 설계 철학 설명과 짝을 지어 보면 "왜 이런 설계를 했는가"(선행 노트)와 "실제로 써보면 어떤가"(이 글)가 보완 관계를 이룬다.

**전이 2 — 함수형 언어의 프로덕션 생존 사례들과 비교.** [[2026-05-04-mercury-couple-million-lines-of-haskell]]에서 본 "대규모 Haskell 프로덕션 코드베이스" 사례처럼, Gleam도 BEAM 생태계라는 이미 검증된 런타임(Erlang/Elixir) 위에 올라탄다는 점이 신생 함수형 언어로서는 유리한 조건이다 — 런타임을 새로 증명할 필요가 없다는 뜻.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다 CRS 스택에 Gleam을 도입할 구체적 동기는 없다. 다만 "타입 시스템으로 잘못된 상태 자체를 표현 불가능하게 만든다"는 원칙은, 예약 상태 머신(예약중/확정/취소/노쇼)처럼 상태 전이 오류가 실제 비즈니스 손실로 이어지는 도메인에서 언어 불문하고 참고할 가치가 있는 설계 원칙이다.

## 연관 자료

- [[2026-08-24-gleam-cool-things-one-explicit-way]] — 같은 언어의 설계 철학(명시성)을 먼저 다룬 선행 노트
- [[2026-05-04-mercury-couple-million-lines-of-haskell]] — 함수형 언어의 대규모 프로덕션 생존 전례

## 한 달 뒤 회고

*(2026-12-12 즈음 — 원문 저자·논조를 확인할 수 있게 됐는지, Gleam 1.0 이후 생태계(패키지 수, 실 프로덕션 도입 사례)가 더 늘었는지 점검.)*
