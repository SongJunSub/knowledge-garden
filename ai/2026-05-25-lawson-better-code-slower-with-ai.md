---
title: "Nolan Lawson — AI로 더 나은 코드를 더 천천히 (Lasn 측 *실무 적응 방법론*: axelk 비판의 통합 응답)"
source_title: "Writing slower, better code with AI"
source_url: "https://nolanlawson.com/2026/05/25/writing-slower-better-code-with-ai/"
source_name: "nolanlawson.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29870"
published_at: "2026-05-25"
summarized_at: "2026-05-26"
category: "ai"
tags: ["ai-coding-practice", "multi-model-verification", "code-quality", "slower-better", "lasn-side", "axelk-response", "false-positive-zero", "deliberate-programming"]
---

# Nolan Lawson — AI로 더 나은 코드를 더 천천히 (Lasn 측 *실무 적응 방법론*: axelk 비판의 통합 응답)

> 출처: [Nolan Lawson 블로그](https://nolanlawson.com/2026/05/25/writing-slower-better-code-with-ai/) · 정리일 2026-05-26

## 한 줄 요약
**AI 코딩 = *저품질 대량 생성 도구만이 아니라 고품질 신중 작성 도구로도 사용 가능* — *Claude sub-agent + Codex + Cursor Bugbot 다중 모델 합치면 오탐률 ≈ 0*, *Critical/High 문제 반복 수정 + 비용 대비 낮은 항목 건너뛰기*, *속도가 아니라 코드베이스 건강 초점*. **LLM 이전부터 지향하던 신중·체계적·품질 집착 프로그래밍을 *더 강력하게 만든 형태***.

## 핵심 포인트

- **AI 코딩의 양 측 사용 가능성** — *저품질 빠른 대량 생성* (axelk 측 비판 대상) ↔ ***고품질 신중 작성*** (이 글의 제안). **사용 방식이 결과를 결정**.
- **LLM 버그 탐지 강점 + 우선순위·검증 난점** — *발견은 쉽지만 *우선순위 지정·검증*이 진짜 어려움*. **[[2026-05-25-claude-is-not-your-architect]]의 *"아니오"·"왜?" 부재*의 *극복 방법론***.
- **다중 모델 합치기 = *오탐률 ≈ 0*** — *Claude sub-agent + Codex + Cursor Bugbot* 교차 검증. **[[2026-05-18-musinsa-query-engineer-harness]] *4관점×2공급자 교차 검증*의 *개인 차원 시연***. 무신사 패턴이 *팀 → 개인*으로 확장.
- **Critical/High 반복 + 비용 대비 낮은 건너뛰기** — *실용적 흐름*. **[[2026-05-19-openai-codex-goals-persistent-objectives]] Goals 6요소의 *Iteration policy + Blocked stop condition* 실무 표현**.
- **속도 ≠ 목표, *코드베이스 건강이 목표*** — *생산성 단위 변경*. **[[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *시스템 사고·비용 비대칭 회피* 원칙의 *개인 실천*** + **[[2026-05-21-mr-market-product-age-ends-brain-age-begins]] *판단력 가치 단위*의 *코드 차원 시연***.
- **신중한 프로그래밍의 *AI 강화 형태*** — *LLM 이전 지향*과 같은 결, *더 강력하게*. **[[2026-05-21-comeau-ai-amplifies-existing-skills]] *Iron Man 슈트 곱셈*의 *기존 신중함 강화*** — *기존에 신중하지 않았던 사람이 신중해지는 게 아님, 기존 신중한 사람이 *더 깊게* 신중해짐*.
- **Lobsters 댓글 핵심**: ***항상 되고 싶었던 엔지니어처럼 일하게 해줌*** — 제대로 된 테스트 하네스·CI 검증·배포 모니터링이 *AI 에이전트로 가능해짐*. **[[2026-05-24-aws-four-years-and-out]] *대체 가능 인력 격하*의 *정반대 시나리오*** — *전문성을 더 발휘할 수 있게 됨*.
- **양극 회피의 실용성** — *무조건 찬성·반대* 양극보다 *저품질 결과물을 받아들일 필요가 없다는 점을 이해하는 실용적 태도*. **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] ↔ [[2026-05-21-trevor-lasn-aeo-geo-ai-search]] *5번째 라인업 분기*의 *통합 응답***.

## 인상 깊은 문장

> "Opposite of generating low-quality code en masse — you can also use AI to review PRs more deeply and obsessively check for failure modes."  
> (저품질 코드를 빠르게 대량 생성하는 방식과 반대로, PR을 더 깊게 검토하고 실패 가능성을 집요하게 확인하는 방식도 가능함)

> "This is closer to a stronger version of the deliberate, methodical, quality-obsessed programming we wanted before LLMs."  
> (이 방식은 LLM 이전부터 지향하던 신중하고 체계적이며 품질에 집착하는 프로그래밍을 더 강력하게 만든 형태에 가까움)

> *(Lobsters 댓글)* "It lets me work like the engineer I always wanted to be — proper test harnesses, CI verification, deployment monitoring."  
> (항상 되고 싶었던 엔지니어처럼 일하게 해준다 — 제대로 된 테스트 하네스, CI 검증, 배포 모니터링)

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 ***실무 적응 방법론*** 차원 도착 — 라인업 *Lasn 측 3 차원 완성*

| 자산 | Lasn 측 차원 |
|---|---|
| [[2026-05-21-trevor-lasn-aeo-geo-ai-search]] | *적응·최적화 (콘텐츠 측)* |
| [[2026-05-24-brockman-interview-ai-explosive-growth]] | *공급자 비전·이상* |
| **이번 글 (Lawson)** | ***실무 적응 방법론*** |

→ ***Lasn 측 3 차원 완성*** (vs axelk 측 5 차원). 라인업이 *양 측 충분히 두꺼운 성숙한 분기*. *각 차원 1 자산이라 *명시 라벨링은 아직 보류** (어제 axelk 측 5번째 차원처럼 *2번째 자산 도착 시* 라벨링).

### *axelk 비판의 통합 응답 자산* — *어제 글과의 정확한 짝*

어제([[2026-05-25-claude-is-not-your-architect]])의 axelk 측 비판:
- *"아니오"·"왜?" 부재*
- *맥락 부재 = 일반 모범 사례만*
- *엔지니어 → 구현자 격하*
- *책임 공백*

**이 글이 *각 비판의 운영 회피책 제시***:
- "아니오"·"왜?" 부재 → *다중 모델 합치기로 오탐률 0* (모델 간 거절·반박)
- 맥락 부재 → *Critical/High 우선순위 + 비용 대비 낮은 건너뛰기* (인간 맥락 주입)
- 구현자 격하 → *코드베이스 건강·실패 모드 이해 = 더 신중한 엔지니어 역할*
- 책임 공백 → *우선순위·검증 책임 = 인간*

→ ***24시간 만에 *반대 측 응답 자산 도착*** — 어제 *5번째 라인업이 양 측 자산 동시 누적*하는 사이클의 *3번째 시연* (Susam·Lasn·이번 글). 가든이 *주제 균형을 자연 달성하는* 운영 동력 확인.

### **균형 의례 부채 *+1 → +2 누적*** — 안전 마진 잔여

- 어제 ([[2026-05-25-claude-is-not-your-architect]]) 부채 +1 (친-AI 빚)
- *이 글 친-AI 측 +1 → 부채 +2 누적*
- 비율: **25:12 ≈ 2.08:1** (안전 마진 0.92, 임계점 안쪽)
- → *연속 2건 친-AI 자산*. *다음 자산이 또 친-AI면 부채 +3 누적* + 비율 2.17:1 (안전 마진 0.83 — 점차 감소)

**상환 후보 능동 큐레이션 의식**:
- 다음 1~2 자산 안에 *axelk 측 능동 검색*이 자연스러움
- 후보: AI 환경 영향(에너지·물)·EU AI Act·노동 시장 데이터·AI 윤리 사고 사례

### [[2026-05-18-musinsa-query-engineer-harness]] *4관점×2공급자 교차 검증*의 *개인 차원 시연*

무신사 패턴 (팀 차원):
- 4 정찰조: 인덱스·쿼리·실행 계획·도메인
- 2 공급자: Claude + Codex
- 정합성 게이트: EXPLAIN + 실측

**이 글 패턴 (개인 차원)**:
- 다중 모델: Claude sub-agent + Codex + Cursor Bugbot
- 합치면 오탐률 ≈ 0
- Critical/High 우선순위

→ ***같은 원리의 팀·개인 차원 짝*** — 무신사 *Agent = Model + Harness*의 *개인 하네스 시연*. [[2026-05-18-eugene-yan-compounding-with-ai]] Eugene Yan 5원칙(*위임 확대 = 병렬 세션 3~6개*)과도 일치.

### [[2026-05-25-constraint-decay-llm-agent-backend]] *Constraint Decay 30포인트 하락 완화 방법*

학술 (Constraint Decay): *구조 누적 시 30포인트 하락·데이터 계층 45% 실패*.
이 글 (실무 방법론): ***다중 모델 + 우선순위 + 검증***이 *30포인트 회복 + 45% 회피*의 실무 답.

→ *학술 진단 + 실무 처방* 짝 완성. 어제 박은 *Wilson 방법론 디딤돌 라인 = 진단* + *이번 글 실무 방법론 = 처방*의 *상호 보완 라인*.

### *어제 [[2026-05-25-claude-is-not-your-architect]] 댓글*의 *본 자산 분리*

어제 글 댓글: *프롬프트 비판적이면 Claude 거절·반박 잘함*. **이 글이 *그 댓글을 별도 자산으로 분리***:
- 댓글 진술 (사용자 숙련도 차원) → *Lawson 블로그 글 (방법론 차원)*
- *Comeau Matt Perry 167% 곱셈*의 *프롬프트·도구 사용 차원* 시연

→ ***시니어 양극화 가설*** (Wilson 평균 하락 + Comeau 상위 곱셈)의 *상위 사용자 매뉴얼* 도착. *상위 시니어가 어떻게 AI를 쓰는지*가 *공개 콘텐츠로 표준화*.

### *오버 메타화 자기 견제 23 자산 연속*

23 자산 연속 새 자가 진단·매트릭스 추가 *0건 유지*. 어제 *5번째 차원 명시 라벨링 1건* 정당화 확장 (4번째 자제→도착 사이클은 *Lasn 측 차원 라벨링*은 아직 *각 차원 1 자산이라 보류*).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [Writing slower, better code with AI](https://nolanlawson.com/2026/05/25/writing-slower-better-code-with-ai/)
- [GeekNews — 29870](https://news.hada.io/topic?id=29870)
- [[2026-05-25-claude-is-not-your-architect]] — 어제 axelk 비판 *(통합 응답 짝)*
- [[2026-05-25-constraint-decay-llm-agent-backend]] — Constraint Decay *(학술 진단 + 실무 처방 짝)*
- [[2026-05-18-musinsa-query-engineer-harness]] — 무신사 하네스 *(4관점×2공급자의 개인 차원 시연)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(6요소의 실무 표현)*
- [[2026-05-21-comeau-ai-amplifies-existing-skills]] — Comeau *(곱셈의 프롬프트·도구 차원 매뉴얼)*
- [[2026-05-18-eugene-yan-compounding-with-ai]] — Eugene Yan *(5원칙 위임 확대 시연)*
- [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] — Mr Market *(판단력 가치의 코드 차원 시연)*
- [[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-05-24-brockman-interview-ai-explosive-growth]] — 5번째 라인업 Lasn 측 *(3 차원 완성)*

## 한 달 뒤 회고
*(2026-06-26 즈음 — 다중 모델 합치기 패턴이 *후속 도구 통합으로 표준화*되었는지, 균형 의례 부채 +2가 *상환*되었는지, *Lasn 측 차원별 2번째 자산* 도착으로 명시 라벨링 가능한지, CRS·MangoLove에 *Lawson 패턴 다중 모델 검증* 도입되었는지 기록.)*
