---
title: "작업별 맞춤 하네스 — Claude Code 동적 워크플로우의 패턴과 실패 모드 (Lasn 측 공급자 제품: 하네스 시대의 제품 실현)"
source_title: "A harness for every task: dynamic workflows in Claude Code"
source_url: "https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code"
source_name: "claude.com (Anthropic) · GeekNews 경유"
summarized_at: "2026-06-01"
category: "ai"
tags: ["dynamic-workflows", "harness", "subagents", "failure-modes", "orchestration-patterns", "supplier-product", "lasn-side"]
---

# 작업별 맞춤 하네스 — Claude Code 동적 워크플로우의 패턴과 실패 모드 (Lasn 측 공급자 제품: 하네스 시대의 제품 실현)

> 출처: [A harness for every task: dynamic workflows in Claude Code](https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code) (Anthropic, GeekNews 경유) · 정리일 2026-06-01
>
> *([[2026-05-29-claude-code-dynamic-workflows]] 발표글의 심화편 — 패턴·실패 모드·작업별 하네스에 초점.)*

## 한 줄 요약
**Claude Code 동적 워크플로우는 *JavaScript 파일 실행으로 작업에 맞는 맞춤 하네스를 즉시 작성* — 여러 서브에이전트를 생성·조율하고 *각 에이전트가 쓸 모델과 격리 수준을 선택*한다. *단일 컨텍스트 윈도우의 한계를 극복*하며, ***"게으른 완료·자기 편향·목표 이탈" 같은 실패 모드를 분리된 컨텍스트로 구조적으로 방지***. 주요 패턴: *분류-실행·병렬 처리-종합·적대적 검증·생성-필터링·토너먼트·반복 루프*. 마이그레이션·딥 리서치·검증·정렬·트리아지·근본 원인 조사 같은 비기술 작업에도 유용. 단 *토큰 소비가 크므로 창의적 활용이 필요하고 모든 작업에 필수는 아님*.**

## 핵심 포인트

- **작업별 맞춤 하네스 = "하네스 시대"의 제품 실현** — *JS 파일로 그때그때 하네스를 짠다*. **[[2026-06-01-harness-era-software-after-ai]] Tunguz *"하네스 시대"*가 *제품 기능*으로 도착** (제목부터 "a harness for every task").
- **실패 모드를 컨텍스트 분리로 방지** — *게으른 완료·자기 편향·목표 이탈*을 *분리 컨텍스트*로 차단. **[[2026-06-01-engineering-in-the-era-of-llms]] *slop 악순환·휴먼 컨텍스트* + [[2026-06-01-ai-in-sre-google-reliable-operations]] *안전 경계*의 제품 메커니즘**.
- **에이전트별 모델·격리 선택** — *작업 성격에 맞는 모델·샌드박스*. **[[2026-06-01-engineering-in-the-era-of-llms]] padded rooms·[[2026-06-01-harness-era-software-after-ai]] 샌드박스(요소5)의 구현**.
- **6가지 오케스트레이션 패턴** — 분류-실행·병렬-종합·**적대적 검증**·생성-필터·토너먼트·반복 루프. **[[2026-05-25-lawson-better-code-slower-with-ai]] *다중 모델 judges* + [[2026-06-01-ai-in-sre-google-reliable-operations]] *통계 검증*의 패턴화** (적대적 검증 = 가장 강한 신뢰 패턴).
- **비기술 작업까지** — 딥 리서치·검증·정렬·트리아지. *오케스트레이션이 코드 너머로*. 단 **토큰 비용 = orchestration-tax** ([[2026-05-29-orchestration-tax]]: 모든 작업에 필수 아님, 검토 역량에 맞춤).

## 인상 깊은 문장

> *(요지)* 동적 워크플로우는 *작업에 맞는 맞춤 하네스를 즉시 작성*한다 — 각 서브에이전트가 쓸 모델과 격리 수준까지 선택해서.

> *(요지)* "게으른 완료·자기 편향·목표 이탈" 같은 실패 모드를 *분리된 컨텍스트로 구조적으로 방지*한다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *공급자 제품 차원* — 하네스 시대의 제품 실현

[[2026-05-29-claude-code-dynamic-workflows]](발표) 심화편이자, [[2026-06-01-harness-era-software-after-ai]](Tunguz 하네스 시대 명제)의 **같은 날 제품 도착** — *개념(하네스가 경쟁 레이어) → 기능(작업별 하네스를 JS로)*. 균형 의례 부채 *+1 → +2 친-AI 측 빚 누적* (다음 axelk 2건(밸류에이션 회의)에서 0 복귀 예정).

### *실패 모드 명명 = 가든 검증 논쟁의 제품 답*

*게으른 완료·자기 편향·목표 이탈*은 가든이 *slop·검토 병목*으로 논해온 것의 **구체 명명 + 구조적 방지책(컨텍스트 분리)**. **[[2026-06-01-ai-in-sre-google-reliable-operations]] 안전 경계·[[2026-06-01-engineering-in-the-era-of-llms]] padded rooms가 *제품 기능으로 내려옴***. (이 세션 자체가 동적 워크플로우 류 패턴 — 적대적 검증·병렬-종합 —을 쓰는 같은 구조.)

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [A harness for every task: dynamic workflows](https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code) (원문)
- [GeekNews — 30125](https://news.hada.io/topic?id=30125)
- [[2026-05-29-claude-code-dynamic-workflows]] — 발표글 *(심화편의 원형)*
- [[2026-06-01-harness-era-software-after-ai]] — 하네스 시대 *(개념→제품)*
- [[2026-06-01-engineering-in-the-era-of-llms]]·[[2026-06-01-ai-in-sre-google-reliable-operations]] — 실패 모드·안전 경계
- [[2026-05-25-lawson-better-code-slower-with-ai]] — 다중 모델 judges *(적대적 검증)*
- [[2026-05-29-orchestration-tax]] — 토큰 비용·검토 역량 *(모든 작업에 필수 아님)*

## 한 달 뒤 회고
*(2026-07-01 즈음 — 작업별 하네스(적대적 검증·병렬-종합)를 실제로 짜봤는지, 실패 모드 방지가 효과 있었는지, 토큰 비용 대비 가치를 판단했는지 기록.)*
