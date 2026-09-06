---
title: "unbash (webpro-nl) — Bash 명령을 실행하지 않고 구조만 분석하는 TypeScript 파서"
source_title: "unbash: Fast 0-deps bash parser written in TypeScript"
source_url: "https://github.com/webpro-nl/unbash"
source_name: "GitHub (webpro-nl/unbash)"
referrer_url: "https://news.hada.io/topic?id=33269"
summarized_at: "2026-09-06"
category: "engineering"
tags: ["bash", "static-analysis", "ast", "typescript", "parser", "agent-safety", "developer-tools"]
---

# unbash (webpro-nl) — Bash 명령을 실행하지 않고 구조만 분석하는 TypeScript 파서

> 출처: [unbash](https://github.com/webpro-nl/unbash) (webpro-nl, GitHub) · GeekNews(id=33269) 경유 · 정리일 2026-09-06

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 열람 불가. GitHub 저장소 README는 직접 열람했으므로 프로젝트 설명·API·설계 의도는 1차 확인. 다만 hada 댓글 수·HN/Lobsters 등 외부 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**unbash는 Bash 명령·스크립트를 실행하거나 셸 확장을 수행하지 않고, 명령어·인자·조건문·파이프·리다이렉트 구조를 타입이 있는 소스 위치 포함 AST(추상 구문 트리)로 반환하는 0-의존성 TypeScript 파서다.** 목적은 "이 명령이 안전한지 판단"하거나 "실행"하는 게 아니라, 명령의 **구조**를 정적으로 들여다볼 수 있게 하는 데 있다 — 그 판단은 이 도구를 쓰는 쪽의 몫으로 명시적으로 남겨둔다.

## 핵심 포인트

- **실행 없는 분석** — README가 직접 명시하는 설계 의도: ***"does not execute code, perform shell expansion, provide a sandbox, or decide whether a command is safe"***. 파싱과 판단(안전성 평가)을 분리한 것이 핵심 설계 결정이다.
- **지원 문법 범위** — 명령·제어흐름·파이프라인·리다이렉트·할당·복합문·파라미터/워드 확장·프로세스/중첩 치환·coproc·heredoc·herestring까지 폭넓게 지원한다. `Word` 노드는 `parts` 속성으로 내부 확장을 노출하고, 모든 노드가 정확한 소스 위치를 유지한다.
- **부분 파싱** — 오류가 발생해도 부분 트리를 반환할 수 있어, 완전히 정형화되지 않은 스크립트(예: heredoc 안에 중첩된 다른 명령)도 구조 파악을 시도할 수 있다.
- **0 의존성·동기 실행** — 별도 네이티브 애드온이나 WASM 런타임, 쿼리 레이어 없이 순수 TypeScript로 동작한다. `import { parse } from "unbash"` 한 줄로 즉시 사용 가능.
- **용도 예시** — 저장소는 이 파서의 활용처로 두 가지를 든다: ① 셸 명령의 **실행 권한을 사전 확인**하는 도구, ② CI·패키지 스크립트가 **어떤 프로그램·파일을 사용하는지 감사(audit)**하는 도구. 둘 다 "명령을 돌리기 전에 구조부터 본다"는 공통 패턴이다.

## 인상 깊은 문장

> "does not execute code, perform shell expansion, provide a sandbox, or decide whether a command is safe" (GitHub README 직접 인용)

## 댓글

hada 댓글 수, HN/Lobsters 큐레이션 여부는 `news.hada.io` 접근 차단으로 확인하지 못했다. GitHub 저장소 자체는 이 정리 시점 기준 약 125개 스타로, 아직 광범위하게 검증된 프로덕션 도구라기보다는 초기 단계 유틸리티에 가깝다는 점을 밝혀둔다. PHP 포트도 별도로 존재한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "판단과 분석을 분리"하는 설계가 에이전트 권한 모델과 정확히 맞물린다

[[2026-08-11-claude-code-auto-mode-default]]에서 다룬 Claude Code Auto mode의 핵심 구조는 "분류기가 위험 행동을 선별하고, 하드룰이 최종 차단선을 긋는" 3층 구조였다. unbash는 그 분류기가 셸 명령을 판단하기 **전에 필요한 구조화 단계**를 제공하는 도구로 읽을 수 있다 — 정규식으로 `rm -rf`를 문자열 매칭하는 대신, AST 수준에서 "이 명령이 어떤 프로그램을 호출하고 어떤 인자·리다이렉트를 갖는지"를 정확히 알아야 신뢰할 수 있는 승인 게이트를 만들 수 있다. **파서(구조 파악)와 정책(안전 판단)을 의도적으로 분리한 설계**는, 에이전트 권한 시스템을 직접 만들 때 참고할 만한 아키텍처 원칙이다.

### 핵심 전이 2 — 격리(샌드박스)와 정적 분석은 대체재가 아니라 다른 계층의 방어선

[[2026-08-28-general-vm-not-enough-agent-isolation]]가 짚은 "격리 자체만으로는 에이전트 안전이 충분하지 않다"는 문제의식과 나란히 놓으면, unbash류의 정적 분석은 격리(실행 후 피해 억제)와 다른 계층 — **실행 전에 무엇을 하려는지 미리 안다**는 계층의 방어선이다. 실무에서는 "샌드박스 안에서 실행 + 실행 전 구조 검사"를 함께 쓰는 것이 한쪽만 쓰는 것보다 안전하다는 원칙이 다시 확인된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 이르다 — 온다가 셸 명령을 대량으로 실행하는 에이전트 파이프라인을 운영하지 않는 한 이 도구 자체를 쓸 일은 적다. 다만 원칙은 전이 가능하다: **CRS·PMS 연동 파이프라인에서 외부 스크립트나 배치 작업을 자동 실행하기 전에, "무엇을 하려는 명령인지" 구조적으로 확인하는 단계를 실행 단계와 분리해 두면** — 예를 들어 야간 배치 스크립트가 실제로 무슨 파일·API를 건드리는지 사전 감사하는 것 — 예기치 못한 운영 사고를 줄일 수 있다.

## 연관 자료
- [[2026-08-11-claude-code-auto-mode-default]] — 분류기 기반 명령 승인 구조, unbash가 그 판단 이전 단계(구조화)를 제공할 수 있는 위치
- [[2026-08-28-general-vm-not-enough-agent-isolation]] — 격리만으로 부족하다는 문제의식과 대비되는 "실행 전 정적 분석"이라는 다른 방어선

## 한 달 뒤 회고
*(2026-10-06 즈음 — unbash가 실제 CI 감사 도구나 에이전트 권한 게이트에 채택된 사례가 나왔는지, 스타 수·이슈 트래커로 채택 추이 확인.)*
