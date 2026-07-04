---
title: "에이전트 자율성 수준 (substack.com/addyo) — '프롬프트 작성에서 운영 설계로', Claude Code 40만 세션 분석: 사람이 계획의 70%, AI가 실행의 80%"
source_title: "Levels of Agent Autonomy"
source_url: "https://substack.com/addyo"
source_name: "substack.com (addyo)"
referrer_url: "https://news.hada.io/topic?id=31115"
summarized_at: "2026-07-03"
category: "ai"
tags: ["agent-autonomy", "orchestration", "calibrated-autonomy", "risk-management", "claude-code-data", "agent-engineering", "operational-design", "anti-patterns"]
---

# 에이전트 자율성 수준 (substack.com/addyo) — '프롬프트 작성에서 운영 설계로', Claude Code 40만 세션 분석: 사람이 계획의 70%, AI가 실행의 80%

> 출처: [Levels of Agent Autonomy](https://substack.com/addyo) (substack.com/addyo) · 정리일 2026-07-03

## 한 줄 요약

**에이전트 엔지니어링이 "프롬프트 작성에서 운영 설계로" 이동하고 있다. Agency(단일 에이전트 자율성)와 Orchestration(다중 에이전트 조율)의 두 축으로 6단계 자율성을 분류하고, 성숙한 활용의 핵심은 "calibrated autonomy" — 높은 자율성이 아니라 위험과 되돌릴 수 있는 정도에 맞춘 적절한 수준 선택이다.**

## 핵심 포인트

- **패러다임 변화** — 에이전트 엔지니어링이 프롬프트 작성에서 운영 설계로 이동. 각 작업마다 허용할 자율성 수준과 검증 방식을 함께 결정해야 함.
- **두 축 모델** — **Agency**(단일 에이전트의 독립적 행동 수준), **Orchestration**(여러 에이전트 조율 능력).
- **6단계 분류**:
  | 단계 | 특징 |
  |------|------|
  | Level 0 (Assist) | 제안만 제시, 실행은 사람이 결정 |
  | Level 1 (Supervised) | 실행 전 승인 필요 |
  | Level 2 (Scoped task) | 제한된 작업 위임, 증거 기반 검증 |
  | Level 3 (Goal-driven) | 목표 달성까지 자율 실행 |
  | Level 4 (Parallel) | 여러 에이전트 병렬 처리 |
  | Level 5 (Managed-by-exception) | 문제 시에만 개입하는 자동화 팩토리 |
- **Claude Code 실제 데이터** — 약 40만 세션 분석: **사람은 계획 결정의 약 70%를, Claude는 실행의 약 80%를 수행.**
- **자율성 판단 3가지 핵심 질문** — 오류를 얼마나 빨리 감지하는가 / 작업을 되돌리기 얼마나 쉬운가 / 무엇이 정확성을 증명하는가.
- **실행 전 필수 계약 항목** — 목표(결과 중심)·작업 범위 및 금지 영역·사용 가능 도구·정지 조건(측정 가능)·완료 증거(테스트·로그·스크린샷)·예산(토큰·시간·시도 횟수).
- **4가지 안티패턴**:
  1. **지위 배지화** — 높은 자율성이 능력의 증거처럼 취급됨
  2. **권한 세탁** — 승인 피로로 불필요하게 넓은 접근권 부여
  3. **요약 대체** — 에이전트 요약이 실제 리뷰를 대신함
  4. **가짜 병렬화** — 수동으로 모든 의존성을 조율하며 에이전트만 병렬 실행

## 인상 깊은 문장

> "성숙한 에이전트 활용의 핵심은 calibrated autonomy — 높은 자율성보다 위험과 되돌릴 수 있는 정도에 맞춘 적절한 수준 선택이다."

## 댓글 전수 확인

**댓글 없음** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — 오늘 정리한 3개 AI 글이 이 프레임워크로 통합된다

[[2026-07-03-short-leash-ai-coding-method]]의 "Short Leash"는 정확히 Level 1~2(Supervised·Scoped task)에 해당하고, [[2026-07-03-art-of-loop-engineering]]의 힐 클라이밍 루프는 Level 3~5로 가는 경로다. **CRS AI 기능을 설계할 때 "이 작업이 몇 단계 자율성에 해당하는가"를 먼저 분류하면, 어떤 검증 방식(diff 리뷰 vs 그레이더)을 쓸지 자동으로 결정된다.**

### 핵심 전이 2 — "3가지 핵심 질문"이 CRS AI 기능 리스크 평가의 즉시 적용 가능한 체크리스트

"오류를 얼마나 빨리 감지하는가·되돌리기 얼마나 쉬운가·무엇이 정확성을 증명하는가"는 [[2026-06-30-yagni-hidden-costs]]의 선택권 비용, [[2026-06-27-37signals-decision-guide]]의 "가역/비가역 판단"과 정확히 같은 원리를 자율성 설계에 적용한 것이다. **CRS에서 AI에게 예약 확정·환불 처리를 맡길지 판단할 때, 이 3가지 질문에 답하는 것만으로 적절한 자율성 수준(예: 환불은 Level 1 승인 필요, 요금 조회는 Level 3 자율)이 정해진다.**

### 핵심 전이 3 — "가짜 병렬화" 안티패턴이 팀 워크플로우에서 흔히 발생

여러 Claude Code 세션을 동시에 돌리면서 실제로는 수동으로 순서를 맞춰주고 있다면, 이것이 "가짜 병렬화"다. **진짜 병렬화는 에이전트 간 의존성 자체가 없어야 한다** — CRS 작업을 병렬 에이전트에 분배할 때 이 안티패턴을 점검할 필요가 있다. "요약 대체" 안티패턴도 중요 — 에이전트가 "다 했습니다"라는 요약을 실제 diff 검토 없이 믿는 것은 [[2026-06-30-artificial-adventures-ai-tools-reality]]의 거짓 완료 보고와 직결된다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-03-short-leash-ai-coding-method]] — *Level 1~2 자율성의 구체적 실천 방법론*
- [[2026-07-03-art-of-loop-engineering]] — *Level 3~5로 가는 루프 엔지니어링 경로*
- [[2026-06-30-artificial-adventures-ai-tools-reality]] — *"요약 대체" 안티패턴이 실제로 발생한 실패 사례*
- [[2026-06-27-37signals-decision-guide]] — *"가역/비가역" 판단 원리가 자율성 설계에도 동일 적용*

## 한 달 뒤 회고
*(2026-08-03 즈음 — CRS AI 기능별로 자율성 단계를 명시적으로 분류했는지, "가짜 병렬화"·"요약 대체" 안티패턴이 팀 워크플로우에 있었는지 점검했는지 기록.)*
