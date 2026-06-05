---
title: "AI-네이티브 스타트업을 만드는 방법 — 진짜 해자는 규율 (Lasn 측 실무 적응 방법론: 운영 플레이북 종합)"
source_title: "How to build an AI-native startup"
source_url: "https://x.com/cyberfund/status/2058950286324986294"
source_name: "cyberfund · X · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30195"
summarized_at: "2026-06-01"
category: "career"
tags: ["ai-native", "startup-operations", "discipline-moat", "eval", "git-context", "autonomy-levels", "practice-methodology", "lasn-side"]
---

# AI-네이티브 스타트업을 만드는 방법 — 진짜 해자는 규율 (Lasn 측 실무 적응 방법론: 운영 플레이북 종합)

> 출처: [How to build an AI-native startup](https://x.com/cyberfund/status/2058950286324986294) (cyberfund, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**AI 에이전트로 스타트업을 운영하는 6단계 플레이북 — 핵심은 ***"모두가 같은 모델을 쓰는 환경에서 진짜 해자는 규율(discipline)"***. *매주 업무 매핑과 컨텍스트 구축을 반복하는 일관성*이 경쟁력이다. 6단계: ①*반복 업무 매핑 + 자율성 레벨 분류* ②*Git 기반 컨텍스트 시스템* ③*스크립트·워크플로·에이전트 중 가장 단순한 도구 선택* ④*스킬 인코딩 + eval(평가) 체계* ⑤*팀원 온보딩·역할 재정의* ⑥*주간 피드백 루프*. 장기 성장을 결정하는 건 *출처 추적 가능한 컨텍스트*와 *신뢰 가능한 eval 작성 능력*.**

## 핵심 포인트

- **"진짜 해자는 규율" — 모델은 모두 같다** — *모델로는 차별화 못 하니 운영 규율로*. **[[2026-06-01-app-layer-not-dead-system-of-work-moat]] *모델은 대체 가능, system of work는 아니다* + [[2026-06-01-harness-era-software-after-ai]] *하네스 = 해자*의 운영 플레이북**.
- **자율성 레벨 분류** — *업무마다 AI 자율 정도를 등급화*. **[[2026-06-01-ai-in-sre-google-reliable-operations]] *L0~L4 자율성* + [[2026-06-01-how-anthropic-contains-claude]] *봉쇄 등급*의 스타트업 적용**.
- **Git 기반 컨텍스트 = 출처 추적** — *컨텍스트를 버전 관리·추적 가능하게*. **[[2026-06-01-engineering-in-the-era-of-llms]] *휴먼 컨텍스트* + [[2026-06-01-harness-era-software-after-ai]] *맥락·메모리(요소1)*의 구현 — *출처 추적 = 검증 가능성***.
- **가장 단순한 도구 선택(스크립트 < 워크플로 < 에이전트)** — *과하게 쓰지 말 것*. **[[2026-05-29-mcp-is-dead-cli-skills]] *CLI 우선* + [[2026-05-29-orchestration-tax]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] *모든 작업에 워크플로 필수 아님* + [[2026-05-29-choose-boring-technology-2015]] *혁신 토큰 절약***.
- **스킬 인코딩 + eval = 신뢰의 토대** — *무엇이 "맞음"인지 평가 체계*. **[[2026-06-01-engineering-in-the-era-of-llms]] *테스트·보상 함수* + [[2026-05-19-openai-codex-goals-persistent-objectives]] *보상·중단 조건* + [[2026-06-01-harness-for-every-task-dynamic-workflows]] *적대적 검증***.
- **주간 피드백 루프** — *규율 = 반복*. 일회성이 아니라 *매주 매핑·갱신*.

## 인상 깊은 문장

> *(요지)* 모두가 같은 모델을 쓰는 환경에서, *진짜 해자는 규율*이다 — 매주 업무를 매핑하고 컨텍스트를 구축하는 *일관성*.

> *(요지)* 장기 성장을 결정하는 것은 *출처 추적 가능한 컨텍스트*와 *신뢰 가능한 eval 작성 능력*이다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* — 클러스터의 운영 플레이북 종합

가든의 판단력·하네스·방법론 클러스터를 **6단계 실전 플레이북으로 종합**:

| 단계 | 가든 자산 |
|---|---|
| 자율성 레벨 | [[2026-06-01-ai-in-sre-google-reliable-operations]]·[[2026-06-01-how-anthropic-contains-claude]] |
| Git 컨텍스트 | [[2026-06-01-engineering-in-the-era-of-llms]]·[[2026-06-01-harness-era-software-after-ai]] |
| 단순 도구 우선 | [[2026-05-29-mcp-is-dead-cli-skills]]·[[2026-05-29-choose-boring-technology-2015]] |
| eval | [[2026-06-01-harness-for-every-task-dynamic-workflows]]·[[2026-05-19-openai-codex-goals-persistent-objectives]] |

→ Lasn 측 실무 방법론 *7번째 자산*. 균형 의례 부채 *+1 → +2 친-AI 측 빚 누적* — **2연속 친-AI(봉쇄·이번) → 능동 큐레이션 상환 후보 명시** (weekly #360 *지식 생태계 클러스터(axelk)* 적합).

### *"규율 = 해자" = 가든 전체의 한 줄 요약*

가든이 수십 자산으로 말해온 것을 cyberfund가 *한 단어로*: ***규율(discipline)***. 모델·코드가 공짜가 되면([[2026-06-01-cathedral-bazaar-winchester-mystery-house]]), *남는 차별점은 "꾸준히 매핑·컨텍스트·eval·검토를 반복하는 규율"*. **[[2026-06-01-domain-expertise-is-the-real-moat]] 도메인 + [[2026-06-01-app-layer-not-dead-system-of-work-moat]] system of work + 이 글 규율 = 같은 해자의 세 이름**.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [How to build an AI-native startup](https://x.com/cyberfund/status/2058950286324986294) (원문)
- [GeekNews — 30195](https://news.hada.io/topic?id=30195)
- [[2026-06-01-app-layer-not-dead-system-of-work-moat]]·[[2026-06-01-harness-era-software-after-ai]] — 해자(system of work·하네스)의 운영판
- [[2026-06-01-ai-in-sre-google-reliable-operations]]·[[2026-06-01-how-anthropic-contains-claude]] — 자율성 레벨·봉쇄
- [[2026-05-29-mcp-is-dead-cli-skills]]·[[2026-05-29-choose-boring-technology-2015]] — 단순 도구 우선
- [[2026-06-01-engineering-in-the-era-of-llms]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] — 컨텍스트·eval
- [[2026-06-01-domain-expertise-is-the-real-moat]] — 규율 = 도메인·system of work와 같은 해자

## 한 달 뒤 회고
*(2026-07-01 즈음 — 6단계 중 몇 단계를 실제로 운영했는지(특히 eval·Git 컨텍스트·자율성 레벨), 규율(주간 반복)이 유지됐는지, "가장 단순한 도구" 원칙을 지켰는지 기록.)*
