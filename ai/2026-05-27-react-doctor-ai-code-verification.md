---
title: "React Doctor — AI 생성 React 코드 정적 분석 진단 도구 (Lawson 다중 모델 패턴 직접 도구화)"
source_title: "React Doctor — Static analysis diagnostic for AI-generated React code"
source_url: "https://github.com/millionco/react-doctor"
source_name: "GitHub (millionco/react-doctor) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29920"
published_at: "2026-05-27"
summarized_at: "2026-05-28"
category: "ai"
tags: ["react-doctor", "ai-code-verification", "static-analysis", "oxlint", "react-compiler", "audit-tool", "verification-surface", "multi-model-pattern-tool"]
---

# React Doctor — AI 생성 React 코드 정적 분석 진단 도구 (Lawson 다중 모델 패턴 직접 도구화)

> 출처: [GitHub millionco/react-doctor](https://github.com/millionco/react-doctor) · 정리일 2026-05-28

## 한 줄 요약
**AI 코딩 에이전트가 쓴 React 코드를 *정적 분석으로 검증*하는 *감사 도구* — `npx react-doctor@latest` 한 줄로 *상태 관리·부수 효과·성능·보안·접근성·아키텍처* 6 차원 진단·*0~100점 출력*. *100+ oxlint 규칙 + React Compiler 규칙 + GitHub Actions PR 인라인 어노테이션*. *ESLint와 달리 설치 즉시 전체 범주 진단 실행*하는 ***감사 도구* 포지셔닝**.

## 핵심 포인트

- ***AI 코드 검증 감사 도구*** — *AI 코딩 에이전트 코드 품질 검증*이 *명시 포지셔닝*. **[[2026-05-25-claude-is-not-your-architect]] *책임 공백 회피*의 *기술 인프라 도착***.
- **6 차원 진단** — 상태 관리·부수 효과·성능·보안·접근성·아키텍처. *0~100점 단일 메트릭*. **[[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals 6요소 Verification surface*의 *직접 도구 구현***.
- **100+ oxlint 규칙** — *Rust 기반 빠른 분석*. *React Compiler 규칙 통합*으로 *수동 메모이제이션 감지*. **[[2026-05-26-does-anyone-actually-like-react]] *React useEffect/useMemo 복잡 API* 비판의 *도구 측 응답***.
- **GitHub Actions 인라인 어노테이션** — *PR마다 진단 자동*. **[[2026-05-25-lawson-better-code-slower-with-ai]] *다중 모델 합치기 패턴*의 *CI 인프라 도구화***.
- **Effect v4 스트리밍 파이프라인** — *병렬 처리*. *현대 함수형 스트리밍 패턴 도입*.
- ***ESLint와 다른 감사 도구 포지셔닝*** — *설치 즉시 전체 범주 진단*. ESLint = *점진 도입*, React Doctor = *one-shot 종합*. **[[2026-05-21-susam-dont-roll-your-own-web-ui]] *전용 감사 도구 vs 범용 lint*의 분기**.
- **MIT 오픈소스** — *벤더 종속 없음*. **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] *통제권 회복 라인*과 [[2026-05-26-does-anyone-actually-like-react]] *Vercel 락인 비판*의 *오픈소스 응답***.
- **댓글 *번들 실행 + 오류 발견 효과*** — *놓친 오류 몇 가지를 찾아줌·한 번쯤 써볼 만한 도구*. *실용 검증 사례*.

## 인상 깊은 문장

> "Who's actually reviewing whether the React code written by AI coding agents is correct?"  
> (AI 코딩 에이전트가 쓴 React 코드가 정말 올바른지, 누가 검토하고 있을까요)

> "The last checkpoint for codebase quality in an environment where AI code generation is everyday."  
> (AI 코드 생성이 일상화된 환경에서 코드베이스 품질의 마지막 검문소 역할을 목표로)

## 내 생각 · 적용점

### **[[2026-05-25-lawson-better-code-slower-with-ai]] *다중 모델 패턴 직접 도구화***

Lawson 패턴 (5월 25일): *Claude sub-agent + Codex + Cursor Bugbot* 다중 모델 합치면 *오탐률 ≈ 0*. **이 글이 *그 패턴의 *4번째 검증 모델로 직접 도구 도착***:
- Claude sub-agent + Codex + Cursor Bugbot + ***React Doctor* = 4중 검증*
- *3개는 *LLM 기반*, React Doctor는 *정적 분석 기반*. *서로 다른 검증 방식*이 *오탐률 더 낮춤*
- 특히 *React Doctor = 비-LLM 도구*가 *LLM 한계 보완*

→ Lawson 패턴이 *3개월 안에 *4중 검증 시대*로 진화* 신호. *상위 시니어 매뉴얼*([Comeau Matt Perry])이 *도구 카탈로그로 표준화*.

### **[[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals 6요소 *Verification surface 도구 구현****

Codex Goals 6요소 중 *Verification surface*는 *작업 완료 검증 표면 사전 정의*. **React Doctor 6 차원 진단 (상태·부수 효과·성능·보안·접근성·아키텍처)이 *Verification surface의 React 영역 표준화 도구 형태***:
- *0~100점 단일 메트릭* = *Goal Outcome의 측정 가능 형태*
- *6 차원* = *Constraints + Boundaries의 도구화*
- *CI 인라인 어노테이션* = *Iteration policy + Blocked stop condition 자동화*

→ ***Codex Goals 추상 명세 → React Doctor 구체 구현*** 짝. *Goals 6요소가 *추상 프로토콜*에서 *오픈소스 도구 카탈로그*로 진화*.

### **균형 의례 부채 *-3 → -2로 1건 자연 회복*** — 자연 균형 사이클 *6번째 시연*

- 어제 (좋아하는 개발자 도구) 부채 -3 유지 (라인 자산)
- *이 글 친-AI 측 도구 +1 → 부채 -2 (1건 자연 회복)*
- 비율: **26:17 ≈ 1.53:1** (안전 마진 1.47, 가장 안전 유지)
- → ***14번째 자가 진단 자연 균형 사이클 6번째 시연***

가든 운영 자연 사이클 누적 시연:
1. Susam 6번째 자산 (Wasp 보류 → 24h 도착)
2. Lasn 5번째 라인업 (axelk 후보 → 24h 도착)
3. Claude는 아키텍트 (AWS 5번째 차원 → 24h 도착)
4. Bottleneck 1건 상환 (Lawson +2 → 24h axelk 도착)
5. Uber COO 부채 완전 상환 (Bottleneck +1 → 24h axelk 도착)
6. ***이번 글 1건 회복*** (외주+LocalAI 후 라인 자산 → 친-AI 자산 도착)

→ ***자연 균형 사이클이 *반복 관찰 사실*로 정착*** — 가든 운영의 *자율 균형 메커니즘*이 *외부 GeekNews 자연 흐름 + 가든 큐레이션 정직*의 *교차 작동* 결과.

### [[2026-05-26-does-anyone-actually-like-react]] *React 비판의 *도구 측 응답***

어제 React 비판: *useEffect/useMemo 복잡 API·시니어 이탈·CVE-2025-55182*. **이 글 React Doctor는 *그 비판의 *도구 측 응답***:
- *복잡 API* → *React Compiler 규칙으로 수동 메모이제이션 감지*
- *시니어 이탈* → *0~100점으로 *시니어 검토 부담 표준화*
- *보안* → *6 차원에 *보안 포함*
- → ***React를 사용해야 한다면 *최소 검증 인프라*** 도착*

다만 *React Doctor가 React 사용을 *정당화하지 않음** — *기본기 회귀 라인의 *7번째 자산 React 비판* 명제는 *여전히 유효*. *React Doctor = 졸업 결정 *전에 사용하는* 최소 안전망*.

### [[2026-05-25-constraint-decay-llm-agent-backend]] *45% 데이터 계층 실패 회피 인프라*

학술(Constraint Decay): *데이터 계층 결함이 실패 45%*. **React Doctor *상태 관리 + 부수 효과 진단*이 *45% 회피의 React 차원 도구화***:
- *상태 관리 = React 차원의 *데이터 계층** (React state·context·reducer)
- *45% 실패 회피 = React Doctor 진단 점수 측정*
- → 학술 진단의 *프론트엔드 차원 도구 도착*

### [[2026-05-21-susam-dont-roll-your-own-web-ui]]·[[2026-05-26-does-anyone-actually-like-react]] *기본기 회귀 라인의 *전용 도구 vs 범용 도구 분기***

이 글의 *ESLint와 다른 감사 도구 포지셔닝*은 ***기본기 회귀 라인의 미묘한 정밀화***:
- *범용 도구* (ESLint·범용 lint) = *점진 도입·범용성*
- *전용 도구* (React Doctor·전용 감사) = *원샷 종합 진단*
- → *기본기 회귀가 *범용 vs 전용 분기*에서 정답 갈림*. *작업 종류별 분기 원칙*(라인 4번째 운영 원칙) 정확 적용 사례.

### [[2026-05-21-axelk-ai-is-plagiarism-at-scale]]·[[2026-05-14-eric-ries-incorruptible-mission-protection]] *MIT 오픈소스 = 통제권 회복·미션 보호*

MIT 라이선스 = *오픈소스 = 사용자 측 통제권 보장*. **[axelk 통제권 회복 라인]·[Ries Incorruptible 미션 보호]의 *AI 검증 도구 차원 시연***:
- axelk 측 (통제권): 사용자가 검증 도구 자체를 통제
- Ries 측 (미션 보호): *MIT 라이선스 = 미션 부식 회피의 라이선스 차원*
- → ***좋은 *친-AI 도구가 *axelk 비판 + Ries 보호 원칙 동시 통과* 가능*** 시연

### *오버 메타화 자기 견제 31 자산 연속*

31 자산 동안 새 자가 진단·매트릭스·라인업 *0건*. *Lawson 패턴 4중 검증 진화·Codex Goals 추상→구체 진화·자연 균형 사이클 6번째 시연*은 *기존 도구 활용*.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [React Doctor GitHub](https://github.com/millionco/react-doctor)
- [GeekNews — 29920](https://news.hada.io/topic?id=29920)
- [[2026-05-25-lawson-better-code-slower-with-ai]] — Lawson *(다중 모델 패턴 직접 도구화)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(Verification surface 추상→구체 구현)*
- [[2026-05-26-does-anyone-actually-like-react]] — React 비판 *(도구 측 응답·React 사용 최소 안전망)*
- [[2026-05-25-claude-is-not-your-architect]] — Claude 아키텍트 *(책임 공백 회피 인프라)*
- [[2026-05-25-constraint-decay-llm-agent-backend]] — Constraint Decay *(45% 데이터 계층 회피 React 차원)*
- [[2026-05-21-susam-dont-roll-your-own-web-ui]] — Susam *(전용 도구 vs 범용 도구 분기)*
- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]]·[[2026-05-14-eric-ries-incorruptible-mission-protection]] — MIT 오픈소스 *(통제권·미션 보호 동시 통과)*

## 한 달 뒤 회고
*(2026-06-28 즈음 — React Doctor가 *실제 사용 사례·만족도*, 다른 AI 코드 검증 도구 (Codex Doctor·Vue Doctor 등) 도착, *Lawson 패턴 4중 검증 표준화 가속*, CRS의 *crs-admin-web·crs-be-web에 React Doctor PoC* 한 번이라도 돌았는지 기록.)*
