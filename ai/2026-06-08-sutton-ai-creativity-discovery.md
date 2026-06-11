---
title: "Rich Sutton — AI 창의성과 발견은 '변이→평가→선택' 루프에서 온다 (Lasn 측 실무 방법론: 루프/하네스의 RL 이론적 토대)"
source_title: "Rich Sutton on AI creativity and discovery"
source_url: "https://twitter.com/RichardSSutton/status/2061216087744946656"
source_name: "Richard Sutton · X · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30387"
summarized_at: "2026-06-08"
category: "ai"
tags: ["richard-sutton", "creativity", "discovery", "variation-evaluation-selection", "feedback-loop", "rl", "agent-harness", "lasn-side"]
---

# Rich Sutton — AI 창의성과 발견은 '변이→평가→선택' 루프에서 온다 (Lasn 측 실무 방법론: 루프/하네스의 RL 이론적 토대)

> 출처: [Rich Sutton on AI creativity and discovery](https://twitter.com/RichardSSutton/status/2061216087744946656) (Richard Sutton, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**강화학습 대가 Richard Sutton(‘The Bitter Lesson’): *생성 AI는 학습 데이터를 모방하는 모델*이며, *진정한 창의성과 발견*을 위해서는 ***"변이(variation) → 평가(evaluation) → 선택적 보존(selective retention)"의 피드백 루프***가 필수다. *지도학습 기반 생성 AI는 새로운 발견에 한계*가 있고(환각: *원천 자료를 벗어나는 출력은 부정확*), *AlphaGo·AlphaFold·Claude-Code*처럼 *평가와 선택을 통해서만 진정한 발견*이 구현된다. 결론: *완전한 AI 과학자를 원한다면 "명시적 목표를 통해 AI가 생성·평가·발견하는 폐루프"*를 구축해야 한다. 댓글: *생성-테스트-선택 루프가 핵심이고 LLM은 구성요소일 뿐*, *RLVR(검증 가능 보상 강화학습)로 변이·평가·보존이 실제로 일어남*, *외부 평가 기준이 있으면 생성 AI도 놀라운 결과*.**

## 핵심 포인트

- **루프/하네스 스레드의 RL 이론적 토대** — 이번 세션의 *루프·하네스·오케스트레이션*이 *Sutton의 변이→평가→선택*으로 **이론적 근거를 얻음**. **[[2026-06-08-loop-engineering]] Addy *"에이전트를 프롬프트하는 시스템 설계"* + [[2026-05-29-orchestration-tax]] *검토 = 직렬 자원*의 RL 정초**.
- **LLM = 모방, 발견 ≠ LLM 단독** — *LLM은 구성요소, 발견은 평가·선택 루프에서*. **[[2026-06-01-ted-chiang-ai-is-not-conscious]] *LLM = 형식 모방(딥페이크)*과 같은 진단** — *원천을 벗어나면 환각*.
- **변이→평가→선택 = 워크플로 패턴** — *생성-테스트-선택*. **[[2026-05-29-claude-code-dynamic-workflows]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] *적대적 검증·생성-필터·토너먼트* 패턴의 *이론적 이름***.
- **"외부 평가 기준" = 인간의 환원 불가능한 몫** — *평가 함수가 있어야 발견*. **[[2026-06-01-domain-expertise-is-the-real-moat]] *검증=해자* + [[2026-06-08-30x-ai-engineer-with-taste]] *내부 평가 함수=taste* + [[2026-06-08-users-dont-care-but-you-should]] *품질 판단*** — *변이는 AI가, 평가는 인간/도메인이*.
- **폐루프 발견 = RSI의 이론** — *명시적 목표로 생성·평가·발견*. **[[2026-06-01-recursive-self-improvement-anthropic]] *1주일 자율 ML*·[[2026-06-01-how-to-build-ai-native-startup]] *eval 체계*·[[2026-05-19-openai-codex-goals-persistent-objectives]] *목표·보상*의 RL 정초**.

## 인상 깊은 문장

> *(Sutton, 요지)* 생성 AI는 학습 데이터를 *모방*한다. 진정한 창의성과 발견에는 *변이 → 평가 → 선택적 보존*의 피드백 루프가 필요하다.

> *(Sutton, 요지)* 완전한 AI 과학자를 원한다면, *명시적 목표를 통해 AI가 생성하고 평가하고 발견하는 폐루프*를 구축해야 한다.

> *(댓글)* 핵심은 *생성-테스트-선택 루프*이고, *LLM은 그 구성요소일 뿐*이다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* — 세션 루프 스레드의 이론 정초

[[2026-06-08-loop-engineering]]·[[2026-06-01-harness-era-software-after-ai]]·[[2026-05-29-orchestration-tax]]로 쌓인 *루프/하네스* 스레드가, *Sutton(RL 대가)*의 ***변이→평가→선택***으로 **이론적 토대를 얻음**. 균형 의례 부채 *0 → +1 친-AI* (45:33 ≈ 1.36:1) — 구성적 방법론 자산.

### *세션 전체가 하나의 등식으로 — 변이(AI) · 평가(인간) · 선택(루프)*

이번 세션의 모든 라인이 Sutton의 루프로 수렴한다:
- ***변이(생성)*** = AI가 싼 값에 무한 생성([[2026-06-01-cathedral-bazaar-winchester-mystery-house]] 코드 가격 붕괴).
- ***평가*** = ***인간의 환원 불가능한 몫*** — [[2026-06-01-domain-expertise-is-the-real-moat]] 도메인·[[2026-06-08-30x-ai-engineer-with-taste]] taste·[[2026-06-08-users-dont-care-but-you-should]] 품질. *Sutton: 외부 평가 기준이 발견의 조건*.
- ***선택·루프*** = [[2026-06-08-loop-engineering]]·[[2026-05-29-claude-code-dynamic-workflows]] 하네스가 자동화.
→ ***"AI가 변이를 싸게 만들수록, 좋은 평가 함수(판단)가 발견을 결정한다."*** 이게 세션 내내 반복된 "생산은 공짜, 판단·검증이 희소"의 *RL 이론 버전*.

### *겸손한 단서 — LLM 단독은 발견이 아니다*

Sutton의 *"LLM은 모방, 구성요소일 뿐"*은 [[2026-06-01-recursive-self-improvement-anthropic]] *RSI 과장*·[[2026-06-08-claude-fable-5-mythos-5-release]] *"아키텍처 혁신 없음"* 회의와 정합 — *발견은 LLM 스케일이 아니라 루프(평가·선택)에서*. (이 세션도 워크플로 = 변이·평가·선택 루프의 실연.)

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [Rich Sutton on AI creativity and discovery](https://twitter.com/RichardSSutton/status/2061216087744946656) (원문)
- [GeekNews — 30387](https://news.hada.io/topic?id=30387)
- [[2026-06-08-loop-engineering]]·[[2026-05-29-orchestration-tax]]·[[2026-06-01-harness-era-software-after-ai]] — 루프/하네스 *(이론 정초)*
- [[2026-05-29-claude-code-dynamic-workflows]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] — 적대적 검증·생성-필터·토너먼트 *(변이-평가-선택)*
- [[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-08-30x-ai-engineer-with-taste]]·[[2026-06-08-users-dont-care-but-you-should]] — 평가 = 인간 몫
- [[2026-06-01-recursive-self-improvement-anthropic]]·[[2026-06-01-how-to-build-ai-native-startup]]·[[2026-05-19-openai-codex-goals-persistent-objectives]] — 폐루프·eval·목표
- [[2026-06-01-ted-chiang-ai-is-not-conscious]]·[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] — LLM 모방·코드 가격 붕괴

## 한 달 뒤 회고
*(2026-07-08 즈음 — "변이→평가→선택" 루프를 실제로 구축했는지(좋은 평가 함수가 있었는지), LLM 단독에 발견을 기대하지 않았는지, 평가(인간 판단)에 투자했는지 기록.)*
