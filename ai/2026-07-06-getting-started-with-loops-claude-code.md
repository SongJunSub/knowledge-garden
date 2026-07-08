---
title: "루프 시작하기 (Claude Code 팀) — '매번 프롬프트 입력 대신 정지 조건까지 반복', Turn-based·Goal-based·Time-based·Proactive 4가지 루프 패턴"
source_title: "Getting Started with Loops"
source_url: "https://x.com/ClaudeDevs/status/2074208949205881033"
source_name: "x.com/ClaudeDevs"
referrer_url: "https://news.hada.io/topic?id=31225"
summarized_at: "2026-07-06"
category: "ai"
tags: ["claude-code", "agent-loops", "automation", "goal-based-execution", "scheduled-tasks", "proactive-agents", "token-management", "verification"]
---

# 루프 시작하기 (Claude Code 팀) — '매번 프롬프트 입력 대신 정지 조건까지 반복', Turn-based·Goal-based·Time-based·Proactive 4가지 루프 패턴

> 출처: [Getting Started with Loops](https://x.com/ClaudeDevs/status/2074208949205881033) (x.com/ClaudeDevs) · 정리일 2026-07-06

## 한 줄 요약

**Claude Code 팀이 개발자에게 "매번 프롬프트를 입력하는 대신 정지 조건이 충족될 때까지 작업 사이클을 반복"하는 에이전트 루프 패턴을 공식 가이드로 제시했다. Turn-based·Goal-based·Time-based·Proactive 4가지 루프 유형으로 나뉘며, [[2026-07-03-art-of-loop-engineering]]에서 다룬 LangChain의 이론적 4단계 프레임워크(에이전트→검증→이벤트→힐클라이밍)를 실제 제품 기능(/goal, /loop, /schedule)으로 구현한 실전판이다.**

## 핵심 포인트

- **4가지 루프 유형**:
  1. **Turn-based 루프** — 사용자 프롬프트로 트리거, 짧은 작업에 적합. skills를 통해 검증 절차 자동화 — "변경한 페이지를 브라우저로 확인"하는 식의 구체적 검증 규칙 인코딩 가능.
  2. **Goal-based 루프 (`/goal`)** — 목표 달성 또는 최대 턴 수까지 반복. 예: `/goal get the homepage Lighthouse score to 90 or above`.
  3. **Time-based 루프 (`/loop`, `/schedule`)** — 지정된 시간 간격으로 반복 실행. 외부 환경 변화에 대응하는 작업에 적합.
  4. **Proactive 루프** — 이벤트 기반 자동 실행, 사람 개입 없음. 버그 분류·마이그레이션 등 반복 정의 작업에 최적.
- **성공 전략**:
  - **코드 품질**: 기존 코드베이스 패턴 준수, 자체 검증 수단 제공
  - **토큰 관리**: 적합한 primitive 선택, **명확한 성공 기준 정의**, 파일럿으로 규모 검증
  - **실행 시작**: 현재 병목 작업 중 검증·목표·스케줄 중 어느 것을 위임할지 판단 후 시작

## 인상 깊은 문장

> "정지 조건이 충족될 때까지 작업 사이클을 반복한다."

## 댓글 전수 확인

**댓글 없음** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-03-art-of-loop-engineering]]의 이론이 실제 제품 명령어로 구현된 것을 확인

지난주 정리한 LangChain의 "에이전트 루프→검증 루프→이벤트 기반 루프→힐 클라이밍 루프" 4단계와, 이 글의 4가지 유형을 매핑하면 정확히 대응된다:

| LangChain 이론 | Claude Code 실제 기능 |
|---|---|
| 에이전트 루프 | Turn-based 루프 |
| 검증 루프 | Turn-based의 skills 검증 |
| 이벤트 기반 루프 | Time-based(`/schedule`)·Proactive |
| 힐 클라이밍 루프 | (아직 명시적 기능 없음 — Goal-based가 가장 근접) |

**CRS에서 AI 자동화를 설계할 때, "이 작업이 4가지 루프 유형 중 어디에 해당하는가"를 먼저 분류하면 어떤 Claude Code 기능(`/goal`·`/loop`·`/schedule`)을 쓸지 즉시 결정된다.**

### 핵심 전이 2 — "Proactive 루프"가 [[2026-07-03-agent-autonomy-levels]]의 Level 5(Managed-by-exception)와 정확히 일치

이벤트 기반·사람 개입 없는 Proactive 루프는 지난주 정리한 자율성 최고 단계와 같다. **버그 분류·마이그레이션 같은 "반복 정의 작업"이라는 조건이 중요하다** — CRS에서 이 단계를 적용할 작업은 "정의가 명확하고 반복적인" 것으로 한정해야 한다는 시사점. 요금 규칙처럼 자의적이고 검증이 어려운 작업([[2026-06-30-artificial-adventures-ai-tools-reality]]의 보드게임 규칙 실패 사례)에는 Proactive 루프를 쓰면 안 된다.

### 핵심 전이 3 — "명확한 성공 기준 정의"가 오늘 정리한 모든 AI 글의 공통 결론

Goal-based 루프의 `/goal get the homepage Lighthouse score to 90 or above` 예시처럼, **성공 기준이 측정 가능한 숫자로 정의될 때만 이 루프가 안전하게 작동한다.** [[2026-07-06-zuckerberg-agentic-slower-than-expected]]의 "챗봇 10% 틀려도 도움, 에이전트 10% 틀리면 감시 없이 오류 실행"이라는 경고와 결합하면 — CRS에서 Goal-based 루프를 쓸 작업은 "성공 여부를 자동으로 검증 가능한 숫자 지표가 있는가"를 필수 전제 조건으로 삼아야 한다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-03-art-of-loop-engineering]] — *이 글의 4단계 이론적 프레임워크가 실제 제품 기능으로 구현된 것*
- [[2026-07-03-agent-autonomy-levels]] — *Proactive 루프=Level 5(Managed-by-exception)와 정확히 매핑*
- [[2026-06-30-artificial-adventures-ai-tools-reality]] — *자의적·검증 어려운 작업에 Proactive 루프 적용 금지 근거*
- [[2026-07-06-zuckerberg-agentic-slower-than-expected]] — *"성공 기준의 명확성"이 에이전트 오류 리스크를 줄이는 핵심*

## 한 달 뒤 회고
*(2026-08-06 즈음 — CRS 자동화 작업을 4가지 루프 유형으로 분류해 Claude Code 명령어를 실제로 활용했는지, Proactive 루프를 명확히 정의된 반복 작업에만 제한했는지 기록.)*
