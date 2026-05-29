---
title: "Claude Code 다이나믹 워크플로우 — 수백 병렬 서브에이전트·자동 검증·재개 (Lasn 측 공급자 제품 차원 2번째 자산: orchestration-tax 공급자 응답)"
source_title: "Introducing dynamic workflows in Claude Code"
source_url: "https://claude.com/blog/introducing-dynamic-workflows-in-claude-code"
source_name: "claude.com (Anthropic) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29981"
summarized_at: "2026-05-29"
category: "ai"
tags: ["claude-code", "dynamic-workflows", "parallel-subagents", "orchestration", "agent-verification", "checkpoint-resume", "bun-port", "lasn-side", "supplier-product"]
---

# Claude Code 다이나믹 워크플로우 — 수백 병렬 서브에이전트·자동 검증·재개 (Lasn 측 공급자 제품 차원 2번째 자산: orchestration-tax 공급자 응답)

> 출처: [Introducing dynamic workflows in Claude Code](https://claude.com/blog/introducing-dynamic-workflows-in-claude-code) (Anthropic, GeekNews 경유) · 정리일 2026-05-29

## 한 줄 요약
**Claude Code가 *오케스트레이션 스크립트를 동적으로 작성해 한 세션 안에서 수십~수백 개 병렬 서브에이전트를 띄우고, 통합 전에 결과를 스스로 검증해 *단일하게 조율된 답*만 사용자에게 돌려주는* 다이나믹 워크플로우를 공개. *진행이 자동 저장돼 중단돼도 처음부터가 아니라 중단점에서 재개*. 코드베이스 전역 감사(버그·보안·프로파일링)·대규모 마이그레이션·고위험 작업(독립 검증·적대적 테스트 필요)에 적합. **단, *토큰 소비가 일반 세션보다 대폭 증가*하므로 *범위가 명확한 작업부터* 시작 권장.** Bun(Jarred Sumner)이 *Zig→Rust 75만 줄을 11일에 포팅, 테스트 99.8% 통과*(파일당 이중 리뷰어).**

## 핵심 포인트

- **수백 병렬 서브에이전트 + 자동 검증 계층** — Claude가 *문제를 동적으로 분해 → 독립 에이전트에 분산 → 통합 전 결과 검증 → 수렴까지 반복*. **[[2026-05-28-claude-opus-4-8-release]] *수백 병렬 서브 에이전트* 셀링 포인트의 *제품화***.
- **"검증을 사람 앞에서 끝낸다" = orchestration-tax 공급자 응답** — *결과는 통합 전에 검증되고, 당신은 단일하게 조율된 답으로 돌아온다*. **[[2026-05-29-orchestration-tax]] *인간 검토 = 직렬 병목*에 대한 정면 응답** — 검토·대조를 *에이전트 간으로 옮겨(파일당 이중 리뷰어·적대적 테스트)* 사람의 직렬 락에 *N개의 PR이 아니라 1개의 조율된 답*만 도달시키려는 시도.
- **재개 가능한 체크포인트** — *진행이 저장돼 중단돼도 이어서 실행*. **[[2026-05-19-openai-codex-goals-persistent-objectives]] *지속 목표·중단 조건*의 제품 구현**.
- **적합 작업: 감사·마이그레이션·고위험 검증** — *전역 버그/보안/프로파일 감사*, *프레임워크 교체·API 폐기·언어 포팅(수천 파일)*, *독립 검증·적대적 테스트가 필요한 작업*. **[[2026-05-18-musinsa-query-engineer-harness]] *Agent = Model + Harness*의 하네스 강화** (정찰조 병렬화의 제품 일반화).
- **토큰 비용 = 세금은 사라지지 않음** — *일반 세션보다 토큰 대폭 증가, 범위 명확한 작업부터*. **orchestration-tax의 *부분 인정*** — 검토는 자동화해도 *비용·범위 관리는 여전히 사람 몫*. **[[2026-05-28-outsourcing-localai-vs-frontier-labs]] *30배 토큰 비용 격차*의 적용 지점** (대량 병렬 = 비용 폭증).
- **Bun 사례 — Zig→Rust 75만 줄 11일** — 한 워크플로가 *모든 구조체의 Rust 라이프타임 매핑* → 병렬 에이전트가 *동작 동일 .rs 작성(파일당 이중 리뷰어)* → 빌드 수렴 fix 루프 → 야간 워크플로가 *불필요한 복사 제거를 개별 PR로*. **[[2026-05-29-andrew-kelley-zig-interview]]와 아이러니 대비** — *Zig 프로젝트는 AI를 금지*, *Bun은 AI로 Zig를 떠나 Rust로 포팅*.

## 인상 깊은 문장

> "Claude dynamically writes orchestration scripts that run tens to hundreds of parallel subagents in a single session, checking its work before anything reaches you."  
> (Claude가 오케스트레이션 스크립트를 동적으로 작성해 한 세션에서 수십~수백 개의 병렬 서브에이전트를 돌리고, 무엇이든 당신에게 도달하기 전에 스스로 검증한다)

> "Results are checked before they're folded in, and you come back to a single, coordinated answer."  
> (결과는 통합되기 전에 검증되고, 당신은 하나의 조율된 답으로 돌아온다)

> "Dynamic workflows can consume substantially more tokens than a typical Claude Code session, so we recommend starting on a scoped task to get a feel for usage in your work."  
> (다이나믹 워크플로우는 일반 세션보다 토큰을 훨씬 많이 쓸 수 있으니, 범위가 정해진 작업부터 시작해 사용량 감을 잡길 권한다)

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *공급자 제품 차원 2번째 자산* — [[2026-05-28-claude-opus-4-8-release]]와 짝

| 자산 | 공급자 제품 차원 형태 |
|---|---|
| [[2026-05-28-claude-opus-4-8-release]] | *모델 능력* (정직성·자기 포착·수백 병렬) |
| **이번 글** | ***오케스트레이션 제품화*** (그 수백 병렬을 워크플로 기능으로) |

→ **공급자 제품 차원이 *모델 → 오케스트레이션*으로 두꺼워짐**. Lasn 측 *7 자산* (적응1·비전1·방법론2·자본1·**제품2**) vs axelk 측 18.

### [[2026-05-29-orchestration-tax]] 허브 — *5번째 연속 접속*, 그리고 *공급자 측 응답 도착*

orchestration-tax 명제("인간 검토 = 희소한 직렬 락") 이후 *연속 5글이 같은 허브*:

| 글 | 측 | orchestration-tax 관점 |
|---|---|---|
| [[2026-05-29-orchestration-tax]] | (명제) | 검토 = 직렬 병목 |
| [[2026-05-29-can-i-take-a-day-off]] | axelk | "10배" 전제 회의 |
| [[2026-05-29-andrew-kelley-zig-interview]] | axelk | 외부 AI PR = 검토 락 강탈(입구 차단) |
| **이번 (Dynamic Workflows)** | **Lasn** | ***검토를 에이전트로 옮겨 단일 답만 도달*** (공급자 응답) |

→ **세금에 대한 두 처방의 대립**:
- **Zig(입구 차단)**: *사람의 락을 보호하려 AI를 큐에서 뺀다.*
- **Dynamic Workflows(검토 자동화)**: *사람의 락에 도달하기 전에 에이전트가 서로 검증해 N개 → 1개로 줄인다.*

둘 다 *직렬 병목을 인정*하되, *AI를 빼느냐 / 검토를 AI에 더 위임하느냐*로 갈린다. **남는 질문**: *에이전트 간 검증이 인간 판단을 *대체*하는가, *지연*시키는가?* orchestration-tax의 논리로는 *환원 불가능한 판단(수용·책임)은 여전히 사람의 락* — Dynamic Workflows는 *세금을 낮추지 없애지 못함* (그래서 "범위·토큰은 네가 관리하라"). **[[2026-05-25-lawson-better-code-slower-with-ai]] *다중 모델 교차 검증*의 *공급자 내재화*** (Lawson 수동 패턴 → 제품 자동화).

### **균형 의례 부채 *-3 → -2 자연 회복* — Zig에서 예고한 상환 후보 실현 (자연 균형 사이클 10번째 시연)**

- 직전 2글(day-off·Zig) axelk 연속 → 부채 -3
- **[[2026-05-29-andrew-kelley-zig-interview]]에서 박은 *"다음 친-AI 자산 시 -3 → -2 회복"*이 정확히 실현**
- 비율: **30:21 ≈ 1.43:1** (안전 마진 1.57 — 친-AI 측으로 1 이동해 직전 1.62에서 소폭 감소)
- → *48시간 진동*대로 *axelk 2연속 → 친-AI 도착*. 능동 큐레이션 없이 *GeekNews 자연 흐름*이 또 회복 — 자연 균형 사이클 10번째.

### 적용점 — *언제 워크플로를, 언제 단일 세션을*

orchestration-tax + 이 제품을 합치면 **실무 규칙**:
- **단일 세션**: 판단·맥락이 촘촘히 얽힌 작업(설계, 미묘한 버그, 책임 큰 결정) — *직렬 락이 본질*.
- **다이나믹 워크플로**: *독립적으로 쪼개지고 자동 검증 가능한* 대량 작업(감사, 마이그레이션, 대규모 리팩터) — *병렬이 본질, 검토는 에이전트 위임*.
- **공통 규칙**: *범위를 좁혀 시작 → 토큰·산출 감 잡기 → 확장*. **[[2026-05-26-bottleneck-is-organization]] 가드레일(자동 테스트·점진 배포·롤백)이 있어야 워크플로가 안전** — 검증 자동화는 *기존 인프라 위에서만* 신뢰 가능.

### *오버 메타화 자기 견제 39 자산 연속 0건 유지*

공급자 제품 차원 *2번째 자산으로 보강* + orchestration-tax 허브 *기존 연결 확장* = 신규 자가 진단 아님. (이 글이 *내가 쓰는 도구 자체*를 다루나, 자기 참조 메타는 의도적으로 절제.) 라인업 *Lasn 7·axelk 18*.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [Introducing dynamic workflows in Claude Code](https://claude.com/blog/introducing-dynamic-workflows-in-claude-code) (원문)
- [GeekNews — 29981](https://news.hada.io/topic?id=29981)
- [[2026-05-29-orchestration-tax]] — 검토 = 직렬 병목 *(공급자 응답·5번째 연속 접속)*
- [[2026-05-28-claude-opus-4-8-release]] — 수백 병렬 서브 에이전트 *(공급자 제품 차원 짝)*
- [[2026-05-29-andrew-kelley-zig-interview]] — Zig no-AI 정책 *(입구 차단 vs 검토 자동화 대립·Bun이 Zig 포팅하는 아이러니)*
- [[2026-05-25-lawson-better-code-slower-with-ai]] — 다중 모델 교차 검증 *(공급자 내재화)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — 지속 목표·중단 조건 *(체크포인트 재개)*
- [[2026-05-18-musinsa-query-engineer-harness]] — Agent = Model + Harness *(하네스 강화)*
- [[2026-05-28-outsourcing-localai-vs-frontier-labs]] — 30배 토큰 비용 격차 *(대량 병렬 = 비용 폭증)*
- [[2026-05-26-bottleneck-is-organization]] — 가드레일 *(검증 자동화의 전제 인프라)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — 다이나믹 워크플로를 *어떤 작업에 실제로 썼는지*, 토큰 비용 대비 가치가 있었는지, *에이전트 간 검증이 인간 검토를 얼마나 줄였는지(또는 못 줄였는지)*, CRS의 대규모 마이그레이션·보안 감사에 적용했는지 기록.)*
