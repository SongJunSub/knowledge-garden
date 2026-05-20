---
title: "Claude Code는 당신의 제품을 더 좋게 만들지 않는다"
source_title: "Claude Code is not making your product better"
source_url: "https://ethanding.substack.com/p/claude-code-is-not-making-your-product"
source_name: "Ethan Ding (mandates)"
referrer_url: "https://news.hada.io/topic?id=29225"
published_at: "2026-04-21"
summarized_at: "2026-05-07"
category: "ai"
tags: ["AI생산성", "제품개발", "취향", "복잡성", "K자형곡선", "코드줄수"]
---

# Claude Code는 당신의 제품을 더 좋게 만들지 않는다

> 출처: [Ethan Ding — Claude Code is not making your product better](https://ethanding.substack.com/p/claude-code-is-not-making-your-product) · 레퍼러: [GeekNews 29225](https://news.hada.io/topic?id=29225) · 정리일 2026-05-07

## 한 줄 요약
*코드 생산 속도*는 빨라졌지만 *제품 개선 속도*는 그만큼 빨라지지 않았다 — 진짜 병목은 **취향·판단·삭제 능력**이고 AI는 거기를 가속하지 못한다.

## 핵심 주장

### 1. K자형 생산성 곡선
- *시니어*는 산출량 증가, *주니어*는 정체·감소
- AI 도구의 이점이 *경험 수준에 따라 극도로 불균등*
- [Trap](2026-05-05-agentic-coding-is-a-trap.md)·[antirez](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) 두 글의 *균형*이 데이터로 확인된 셈

### 2. 복리 효과가 안 보이는 모순
> "engineering productivity is a compounding function. if using claude code gives you even a 1.5x improvement in the rate at which you can improve your product, then the team using it from day one should be racing away from everyone else."

그런데 실제론 *Codex·Cursor 같은 경쟁사가 금방 따라잡음* — *복리 격차가 안 만들어진다.* 이건 곧 *AI 채택이 진짜 병목을 풀고 있지 않다*는 신호.

### 3. 코드 줄 수 = 비용, 자산 X
> "the best engineering cultures treat lines of code as something you spend, not something you produce. you spend them on the features that matter."

- Comma.ai의 Tinychat은 *코드베이스 크기 경보*를 설정
- 좋은 엔지니어링 문화는 *코드를 *지출*하는 것*으로 간주

> "lines of code is a cost, not a product."

### 4. 복잡성의 지수적 증가
한 기능 추가가 *여러 연쇄 요구*를 만든다:
- Slack 통합 → Teams → 이메일 → 알림 일반화
- 각 알림 → 모바일 · SMS · MDM 정책 · 접근성 호환

LLM은 *코드 생산*은 가속하지만 *복잡도 억제*는 못한다.

### 5. 진짜 병목 — 취향과 거절
> "product quality doesn't emerge from token throughput. it emerges from taste. from the decision to build less."

- *Linear의 성공*은 코드량이 아니라 *Nan Yu의 제품 비전*에서 옴
- Facebook 규모에서는 *"보상 함수 = 압축이지 생산이 아님"*

### 6. 최전선 기업 증언
- **David Cramer** (Sentry 창업자)
- **Karri Saarinen** (Linear CEO)
- **Dax** (OpenCode 창시자)

이들 모두 *코딩 에이전트로 *제품 개선 속도가 가속되지 않았다*고 보고. 이건 *최상위 시니어 모집단*에서 나온 신호라 더 무겁다.

### 7. Camry vs Ferrari 모델
- AI = *평범한 제품을 빠르게 만든다* (Camry 라인)
- AI ≠ *최고 제품을 더 좋게 만든다* (Ferrari 라인)
- 제품 우수성의 핵심은 *엔지니어링 속도*가 아니라 **제거와 거절의 미학**

> "we're losing our ability to delay gratification."

## 인상 깊은 문장

> "engineering productivity is a compounding function."

> "lines of code is a cost, not a product."

> "the best engineering cultures treat lines of code as something you spend, not something you produce."

> "product quality doesn't emerge from token throughput. it emerges from taste."

> "the reward function is compression, not production."

> "we're losing our ability to delay gratification."

## 내 생각 · 적용점

### 가든 입장 스펙트럼 *재정렬*
이번 글로 가든의 AI 입장이 더 정밀해진다:

| # | 글 | 위치 |
|---|---|---|
| 1 | [Trap](2026-05-05-agentic-coding-is-a-trap.md) | 회의 — *위축 위험* |
| 2 | **이 글 (Ding)** | **현실론 — *복리 안 됨, 진짜 병목 다른 곳*** |
| 3 | [Elevate](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) | 조심 |
| 4 | [9초 사고](2026-04-27-ai-agent-deleted-production-database.md) / [DB 삭제는 당신이](2026-05-07-ai-didnt-delete-your-database-you-did.md) / [3 역법칙](2026-05-07-inverse-laws-of-robotics.md) | 가드레일·원칙 |
| 5 | [antirez](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) | 현실 채택 |
| 6 | [Probabilistic Founder](../career/2026-05-05-rise-of-the-probabilistic-founder.md) / [Glaser](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) | 조직 채택 |
| 7 | [하네스](2026-04-28-agent-harness-engineering.md) / [Long-running](2026-05-04-long-running-agents.md) | 인프라화 |

이 글은 *Trap의 *위축* 비판*과 다른 결의 *비판* — **"AI가 정작 풀어야 할 병목을 안 풀고 있다"** 는 *기능 비판*. 둘 다 같은 결론을 향하지만 *경로*가 다르다.

### *복리 효과 부재*가 가장 강한 논거
*"1.5x면 첫날부터 격차가 벌어져야 한다"* — 이 단순한 수학이 가장 설득력 있다. 격차가 안 만들어진다 = *AI가 *진짜 병목*을 안 푼다*. 이게 가든의 [확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md) 70% 실험·[하네스](2026-04-28-agent-harness-engineering.md) 인프라 옹호와 *긴장*한다. *낙관 시나리오가 작동한다면 시장에서 *명백한 격차*가 보여야 하는데 안 보인다*는 관찰.

### 호스피탈리티 적용 — Camry 라인 vs Ferrari 라인
호스피탈리티 IT는 대체로 **Camry 라인** (운영 도구·통합·관리·내부 효율). *AI 가속이 큰 가치*. 단:
- **Ferrari 라인**(고객 대면 차별화·UX·게스트 경험·브랜드 정체성)에서는 **취향·삭제·거절이 핵심**
- *PickMe* 같은 B2C 미니앱은 *Ferrari 라인*에 가까움 — *기능 추가*보다 *덜 만드는 결정*이 가치
- *CRS Admin·Connectivity API*는 *Camry 라인* — AI 가속 적극 활용 가능

**구분**이 중요. 같은 회사 안에서 *어떤 부분이 어느 라인인지* 인식이 안 되면 *Ferrari에 Camry 가속도구*를 적용해 망친다.

### 코드 줄 수 = 비용 프레임 적용
이번 주 한 [CRS-739 작업](#)이 정확히 이 정신:
- *조회 효율 개선* = *2회 → 1회 단축*
- *호출자 0건 메서드 *제거*
- 새 기능 추가가 아니라 *덜어내기*

이 정신이 일반화되어야 함. PR 설명에 *"덜어낸 줄 수 / 추가된 줄 수"* 라인 추가가 *문화적 메시지*가 될 수 있음.

### MangoLove 추가 후보
- *셀프 리뷰 단계에 **"코드 줄 수가 *늘었다면* 이유가 있는가?"*** 1줄 자문 추가
- /strict의 시각을 *생산 → 압축*으로 살짝 기울이기

### *지연 만족 능력 상실* 우려
이 글의 한 줄이 가장 무겁다 — *"we're losing our ability to delay gratification."*
- AI가 *즉각 결과*를 주는 환경 → *기다림·반복·재작성*의 가치를 잃음
- [생산적 미루기](../career/2026-05-07-productive-procrastination.md)의 *도파민 새 자극* 메커니즘과 정확히 같은 결
- *Lord의 1-pager*([3 제약](../engineering/2026-04-28-three-constraints-before-i-build-anything.md))나 *antirez의 손작성 명세*가 모두 *지연 만족 훈련*

### 반론·균형점
- 저자의 K자형 곡선이 *데이터 인용 없이 주장*인 부분이 있음 — 검증 필요
- *Linear·Sentry·OpenCode* 모두 *제품 자체가 개발자 도구*. 일반 SaaS·B2B와 *입장 분포*가 다를 수 있음
- *복리 효과 부재* 논거는 강하지만, *모든 시장에 적용*되진 않을 수도 — *구체 도메인·기간*이 명시 안 됨

## 즉시 시도할 액션 3가지
1. **PR 설명에 *추가 줄/제거 줄* 헤더 1줄 추가** — 코드 줄 수 = 비용 프레임의 가벼운 시작
2. **호스피탈리티 영역을 *Camry 라인 / Ferrari 라인*으로 분류** — AI 가속 적용 강도 차별화
3. **MangoLove 셀프 리뷰에 *"코드 줄 수가 늘었다면 이유 있는가?"* 자문 추가**

## 연관 자료
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](2026-05-05-agentic-coding-is-a-trap.md) — *위축* 비판 / 이 글 = *기능* 비판 (다른 경로 같은 결론)
- [`engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md`](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) — antirez = K자형 *시니어 쪽*의 정확한 사례
- [`engineering/2026-04-28-three-constraints-before-i-build-anything.md`](../engineering/2026-04-28-three-constraints-before-i-build-anything.md) — *덜 만들기*의 1-pager·core tech·defining constraint
- [`career/2026-05-07-productive-procrastination.md`](../career/2026-05-07-productive-procrastination.md) — *지연 만족 능력*의 신경과학 짝
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — 70% 실험과 *복리 부재* 사이의 긴장
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — 최고의 코드는 *없는 코드*

## 한 달 뒤 회고
- [ ] PR에 *추가/제거 줄* 헤더가 한 번이라도 들어갔는가
- [ ] 호스피탈리티 영역 *Camry/Ferrari 분류* 메모를 시작했는가
- [ ] 본업에서 *덜어낸 PR*이 *추가한 PR*과 의식적으로 균형을 이뤘는가
- [ ] *지연 만족* 훈련(손작성 명세 / 직접 디버깅 1차 시도)이 한 번이라도 일어났는가
