---
title: "AI가 스스로를 만들 때 — 재귀적 자기 개선 (경계 자산: Anthropic 비전 ↔ 검토 병목·측정·안전 비판)"
source_title: "When AI builds itself: Our progress toward recursive self-improvement"
source_url: "https://www.anthropic.com/institute/recursive-self-improvement"
source_name: "anthropic.com · GeekNews 경유"
summarized_at: "2026-06-01"
category: "ai"
tags: ["recursive-self-improvement", "ai-writing-code", "loc-metric", "review-bottleneck", "ai-safety", "boundary-asset"]
---

# AI가 스스로를 만들 때 — 재귀적 자기 개선 (경계 자산: Anthropic 비전 ↔ 검토 병목·측정·안전 비판)

> 출처: [When AI builds itself: progress toward recursive self-improvement](https://www.anthropic.com/institute/recursive-self-improvement) (Anthropic, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**Anthropic은 Claude가 인간 개발자의 업무를 점진적으로 인수 중이라 주장 — *2026년 5월 기준 Anthropic 코드의 80% 이상이 Claude 작성*, *엔지니어당 일일 병합 코드 2024 대비 8배*, *명확한 목표 하에서 "초인적 최적화"(52배 개선)*. 다만 ***"어떤 문제를 풀 것인가"라는 연구 판단은 여전히 인간 영역***. 재귀적 자기 개선(RSI)이 가능하려면 *여러 국가의 검증 가능한 조율*이 필수라고 강조. 그러나 댓글은 강하게 회의적 — *4만 줄 PR은 한 주에 검토 불가능해 병목*, *LoC는 양 위주 지표일 뿐 품질과 무관*, *RSI를 추진하며 안전을 주장하는 모순*.**

## 핵심 포인트

- **80% 코드·8배 병합·52배 최적화 (Anthropic 주장)** — *코드 생산이 거의 공짜*. **[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *코드 가격 붕괴*의 공급자 자기 보고**.
- **"어떤 문제를 풀 것인가는 인간" (한계 인정)** — *목표·연구 판단은 인간*. **[[2026-06-01-domain-expertise-is-the-real-moat]] *도메인 판단* + [[2026-06-01-my-software-north-star]] *목적 정의* + [[2026-06-01-engineering-in-the-era-of-llms]] *구조적 결정은 인간*과 정확히 일치** — Anthropic도 *판단은 인간*이라 인정.
- **댓글 = orchestration-tax의 직접 반박** — *"4만 줄 PR 한 주 검토 불가 = 병목"*. **[[2026-05-29-orchestration-tax]] *검토 = 직렬 병목*이 *Anthropic의 RSI 주장을 정확히 반박*** — 80% 코드를 써도 검토 못 하면 의미 없음.
- **LoC 측정 비판** — *코드 줄 수는 양 지표, 품질 무관*. **[[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *측정 회의* + [[2026-05-26-bottleneck-is-organization]] *속도 ≠ 가치 전달*의 적용** — "8배 병합"이 8배 가치인가?
- **안전 모순 (axelk 비판)** — *RSI 추진 ↔ 안전 주장*의 긴장. **[[2026-06-01-how-anthropic-contains-claude]] 봉쇄와 같은 회사의 정반대 메시지** — 가두면서 동시에 풀어준다.
- **인프라 현실** — 댓글: *API 에러·요청 제한으로 실제는 수동 개입 다수*. 주장과 현장의 간극.

## 인상 깊은 문장

> *(요지)* Anthropic 코드의 80% 이상을 Claude가 작성하지만, *어떤 문제를 풀 것인가라는 판단은 여전히 인간의 영역*이다.

> *(댓글)* 4만 줄짜리 PR은 *한 주에 검토할 수 없다* — 진짜 병목은 거기다.

> *(댓글)* 코드 줄 수(LoC)는 *양 위주 지표*일 뿐, 실제 품질 향상과 무관할 수 있다.

## 내 생각 · 적용점

### *경계 자산* — Anthropic 비전(낙관) ↔ 가든 프레임의 반박(axelk)

이 글은 **친·반이 한 글에서 충돌하는 경계 자산**:
- *낙관(Anthropic)*: RSI 진전·80% 코드·52배 최적화
- *비판(댓글 + 가든 프레임)*: 검토 병목([[2026-05-29-orchestration-tax]])·LoC 무의미([[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]])·안전 모순

**가든의 orchestration-tax·측정 회의 프레임이 *Anthropic의 RSI 주장을 정확히 반박***하므로, *친·반 균형 카운팅 보류*(=[[2026-05-29-ai-frontend-lost-decade]]처럼 경계 자산). 균형 의례 부채 *+2 유지* — *2연속 친-AI 후 경계 자산*이라 **axelk 능동 큐레이션은 여전히 권고**(지식 생태계 클러스터).

### *Anthropic 스스로 "판단은 인간"이라 인정한다*

가장 중요한 포인트: **Anthropic조차 *"어떤 문제를 풀 것인가는 인간"*이라 인정**. 가든의 핵심 명제([[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-01-my-software-north-star]]·[[2026-06-01-engineering-in-the-era-of-llms]] *판단·목적·구조는 인간*)가 *공급자 측에서도 확인*. → *RSI가 진전해도 "무엇을 왜"의 인간 판단은 남는다*는 게 양 측 합의.

### *80% 코드의 함정 = 검토 병목*

"80% 코드를 Claude가 쓴다"는 [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *코드 가격 붕괴*의 극단 — 그러나 *검토는 그대로*([[2026-05-29-orchestration-tax]]). **생산 80%가 자동화돼도 *검토 100%는 여전히 사람*이면, 병목은 더 심해진다** (4만 줄 PR 댓글이 정확). [[2026-06-01-how-anthropic-contains-claude]]의 *"주의력을 싸게"*가 RSI보다 먼저 필요.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [When AI builds itself](https://www.anthropic.com/institute/recursive-self-improvement) (원문)
- [GeekNews — 30189](https://news.hada.io/topic?id=30189)
- [[2026-05-29-orchestration-tax]] — 검토 = 병목 *(RSI 주장 직접 반박)*
- [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] — 코드 가격 붕괴 *(80% 코드의 함정)*
- [[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-01-my-software-north-star]]·[[2026-06-01-engineering-in-the-era-of-llms]] — 판단·목적·구조는 인간 *(양 측 합의)*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]]·[[2026-05-26-bottleneck-is-organization]] — LoC 측정 비판·속도≠가치
- [[2026-06-01-how-anthropic-contains-claude]] — 봉쇄 *(안전 모순)*
- [[2026-05-29-ai-frontend-lost-decade]] — 경계 자산 선례

## 한 달 뒤 회고
*(2026-07-01 즈음 — RSI 주장이 검토 병목을 넘었는지, LoC 외 가치 지표가 나왔는지, "판단은 인간"이 계속 유효한지, 안전 모순이 어떻게 다뤄졌는지 기록.)*
