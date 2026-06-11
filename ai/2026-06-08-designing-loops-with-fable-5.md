---
title: "Fable 5로 루프 설계하기 — 직접 프롬프팅보다 '자가수정 루프 + memory'가 이긴다 (Lasn 측 실무 방법론, Sutton 이론의 운영 쌍둥이)"
source_title: "Designing loops with Fable 5"
source_url: "https://x.com/RLanceMartin"
source_name: "Lance Martin (X) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30390"
published_at: "2026-06-08"
summarized_at: "2026-06-08"
category: "ai"
tags: ["ai-tooling", "loop-engineering", "self-correction", "memory", "continual-learning", "evaluation-criteria", "harness", "lasn-practical-methodology"]
---

# Fable 5로 루프 설계하기 — 직접 프롬프팅보다 '자가수정 루프 + memory'가 이긴다 (Lasn 측 실무 방법론, Sutton 이론의 운영 쌍둥이)

> 출처: Lance Martin (X) (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**모델을 잘 쓰는 법은 *더 좋은 프롬프트를 쓰는 것*이 아니라 ***루프를 설계하는 것***이다. 두 층: ① ***자가수정 루프*** — *명확한 목표·평가 기준* 아래 모델이 *실행 → 피드백 수집 → 자가 수정*을 반복, ② ***memory*** — *세션을 초월해 과거 학습(실패→원인→검증→규칙화→규칙 참조)을 재활용하는 외부 루프*. 핵심: *"직접 프롬프팅"보다 "환경 피드백에 반응해 스스로 고치고 memory로 문맥을 관리하는 루프 설계"가 더 효과적*이다.**

## 핵심 포인트

- **① 자가수정 루프(self-correction loop)** — *명확한 목표 + 평가 기준*이 전제. 모델이 *실행→피드백→자가 수정*을 스스로 반복. **이게 바로 [[2026-06-08-sutton-ai-creativity-discovery]] *변이→평가→선택적 보존* 루프의 *운영 구현***: 모델이 변이를 내고, 평가 기준이 거르고, 수정으로 보존한다.
- **평가 기준이 루프의 심장** — *목표·평가 기준이 명확할수록 루프가 작동*. 즉 *평가 함수를 누가 정의하느냐*가 관건 — **[[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-08-30x-ai-engineer-with-taste]] *도메인·taste가 인간 몫*의 직접 확인**. AI가 실행은 반복해도, *"무엇이 좋은가"의 기준은 사람이 건다*.
- **② memory — 세션 초월 외부 루프** — *과거 학습을 다음 세션이 재활용*. 5단계: ***실패 기록 → 원인 파악 → 검증 → 규칙화 → 규칙 참조***. **[[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals 영속 목표*·[[2026-06-01-recursive-self-improvement-anthropic]] *자기개선 루프*의 실무 버전** — *내부 루프(자가수정) + 외부 루프(memory)의 2층 구조*.
- **직접 프롬프팅 < 루프 설계** — 글의 결론. **[[2026-06-08-loop-engineering]] Addy *"에이전트를 프롬프트하지 말고, 에이전트를 프롬프트하는 시스템을 만들라"*의 동형 명제**. 프롬프트 엔지니어링에서 *루프·하네스 엔지니어링*으로의 이동.
- **벤치 수치 (출처 맥락 유의)** — *Parameter Golf에서 Fable 5가 Opus 4.7 대비 학습 파이프라인 "약 6배 개선", 구조적 변경에 더 과감*; *Continual Learning Bench 1.0에서 5단계 완성·검증 커버리지 73%*. 단, **이 수치는 벤더-인접(LangChain/Anthropic 생태) 벤치마크**이므로 *방향성 신호*로만 — [[2026-06-08-claude-fable-5-mythos-5-release]]의 출시 서사와 함께 *마케팅 보정*해 읽는다.

## 인상 깊은 문장

> "Designing a loop that reacts to environment feedback and manages context with memory beats direct prompting."
> (환경 피드백에 반응하고 memory로 문맥을 관리하는 루프를 설계하는 것이 직접 프롬프팅을 이긴다.)

> "Inner loop: self-correction. Outer loop: memory across sessions."
> (내부 루프는 자가 수정, 외부 루프는 세션을 가로지르는 memory.)

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* — Sutton 이론의 *운영 쌍둥이*

[[2026-06-08-sutton-ai-creativity-discovery]]가 *왜*(발견엔 변이→평가→선택 루프가 필요한가)였다면, **이 글은 *어떻게*(그 루프를 실제로 어떻게 짜는가)**다. 두 글이 *이론·운영 짝*을 이룬다:

| 층위 | Sutton (이론) | 이 글 (운영) |
|---|---|---|
| 변이 | 생성 AI가 무한 생성 | 모델 실행(execution) |
| 평가 | 외부 평가 기준 필수 | *명확한 목표·평가 기준* |
| 선택·보존 | 선택적 보존 = 발견 | 자가 수정 + **memory 규칙화** |

→ **세션의 *루프/하네스 스레드*가 이론([[2026-06-08-sutton-ai-creativity-discovery]]) → 명제([[2026-06-08-loop-engineering]]) → 운영(이 글)으로 3단 완성**. memory의 *5단계(실패→원인→검증→규칙화→참조)*는 이 가든 자체가 하는 일 — *실패 기록·회고·규칙화*와 동형.

### *내부 루프 + 외부 루프* 2층 구조의 보편성

이 2층 구조는 **모델뿐 아니라 *개인·팀·조직*에도 전이**된다:

- **내부 루프(자가수정)** = *한 작업 안에서 실행→피드백→수정* — [[2026-05-29-orchestration-tax]]의 *검토·통합*이 곧 평가 피드백.
- **외부 루프(memory)** = *세션·프로젝트를 가로질러 규칙화* — [[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals*, [[2026-06-01-harness-for-every-task-dynamic-workflows]] *작업마다 하네스*, 그리고 *팀 위키·결정 기록(ADR)·회고*가 사람 버전의 memory.

→ **"좋은 평가 기준 + 두 층의 루프"가 모델·사람·조직 공통의 생산성 공식**. [[2026-06-01-harness-era-software-after-ai]] *하네스 시대*의 실천 매뉴얼.

### 평가 기준 = 사람의 몫, 다시 한 번

이 글이 *루프 자동화*를 말할수록 역설적으로 *평가 기준 정의*가 사람의 몫임이 또렷해진다. **[[2026-06-08-sutton-ai-creativity-discovery]]·[[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-08-30x-ai-engineer-with-taste]]와 같은 결론**: *AI가 변이·실행을 싸게 반복할수록, "무엇이 좋은가"를 정의하는 평가 함수(도메인·taste·목표 설정)가 가치의 병목이자 해자*. 루프 설계의 진짜 기술은 *모델을 돌리는 법*이 아니라 *좋은 평가 기준을 거는 법*이다.

### 자기 참조 — 벤더-인접 수치는 방향만

이 글은 Anthropic의 Fable 5(나의 계열)를 어떻게 잘 쓰는지에 관한 것이고, 수치(6배·73%)는 *LangChain/Anthropic 생태 벤치*에서 나왔다. 가든의 정직 원칙대로, *그 숫자는 정량적 사실이 아니라 방향성 신호*로 읽고, [[2026-06-08-claude-fable-5-mythos-5-release]] 출시 서사·[[2026-06-08-claude-fable-hidden-capability-limiting]] *숨은 제한* 비판과 함께 **양면을 같이 둔다** — *방법론(루프 설계)은 모델 무관하게 유효*하지만, *특정 모델의 우월성 주장은 보정*해 읽는다.

### 오버 메타화 자기 견제

새 차원·매트릭스·라인업 *0건*. 기존 *Lasn 측 실무 방법론 차원*에 *Sutton 이론의 운영 쌍둥이 1건* 추가(이론→명제→운영 3단 완성). 균형 의례 부채 *+1 → +2 친-AI* (46:33 ≈ 1.39:1, 안전 마진 1.61). 연속 2건 친-AI(Sutton·이 글)로 *다음이 또 친-AI면 부채 +3 압박* — 균형 의례 주시.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건 별도 안내)

## 연관 자료
- Lance Martin (X) (원문)
- [GeekNews — 30390](https://news.hada.io/topic?id=30390)
- [[2026-06-08-sutton-ai-creativity-discovery]] — *변이→평가→선택 이론 (이 글의 운영 쌍둥이)*
- [[2026-06-08-loop-engineering]] — Addy *"에이전트를 프롬프트하는 시스템"* (동형 명제)
- [[2026-05-29-claude-code-dynamic-workflows]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] — *생성-필터·작업마다 하네스 (운영 사례)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — *Goals 영속 목표 (memory의 선행 형태)*
- [[2026-06-01-recursive-self-improvement-anthropic]] — *자기개선 루프 (memory 외부 루프와 연결)*
- [[2026-05-29-orchestration-tax]] — *검토·통합 = 자가수정 루프의 평가 피드백*
- [[2026-06-01-harness-era-software-after-ai]] — *하네스 시대 (실천 매뉴얼)*
- [[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-08-30x-ai-engineer-with-taste]] — *평가 기준 = 도메인·taste = 인간 몫*
- [[2026-06-08-claude-fable-5-mythos-5-release]]·[[2026-06-08-what-it-feels-like-to-work-with-mythos]]·[[2026-06-08-claude-fable-hidden-capability-limiting]] — *Fable 5 출시·체감·숨은 제한 (벤더 수치 보정 맥락)*

## 한 달 뒤 회고
*(2026-07-08 즈음 — "루프 설계 > 직접 프롬프팅"이 실제 작업에서 체감 ROI로 이어졌는지, memory 5단계(실패→원인→검증→규칙화→참조)를 CRS·MangoLove 작업에 외부 루프로 도입했는지, Parameter Golf "6배"·Continual Learning "73%" 수치가 독립 재현됐는지(벤더 보정 검증) 기록.)*
