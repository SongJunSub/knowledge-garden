---
title: "코드 작성에 쓰는 AI 코딩 에이전트는 반드시 유지보수 비용을 줄여야 한다"
source_title: "You need AI that reduces your maintenance costs"
source_url: "https://www.jamesshore.com/v2/blog/2026/you-need-ai-that-reduces-your-maintenance-costs"
source_name: "James Shore"
referrer_url: "https://news.hada.io/topic?id=29399"
published_at: "2026-05-10"
summarized_at: "2026-05-12"
category: "engineering"
tags: ["AI비판", "유지보수", "기술부채", "생산성수학", "James-Shore", "장기지속"]
---

# 코드 작성에 쓰는 AI 코딩 에이전트는 반드시 유지보수 비용을 줄여야 한다

> 출처: [James Shore — You need AI that reduces your maintenance costs](https://www.jamesshore.com/v2/blog/2026/you-need-ai-that-reduces-your-maintenance-costs) · 레퍼러: [GeekNews 29399](https://news.hada.io/topic?id=29399) · 정리일 2026-05-12

## 🔖 한 줄 요약
**James Shore**(TDD 저자)의 *생산성 산수*: 생산량 2배 + 유지보수 2배 = **부담 4배**. 산출 N배 늘리려면 *유지보수 비용을 1/N로 감소*시켜야 진짜 생산성 향상.

## 🧩 핵심 주장 — 산술 모델

### 2×2 = 4 부담의 수학
- 매달 코드 작성 시간 → 향후 *수년간* 유지보수 시간으로 누적
- 생산량 *2배* + 유지보수 비용 *2배* → 누적 부담 **2 × 2 = 4배**
- *생산성 향상의 이득은 ~5개월 후 완전히 소멸*

### 진정한 생산성 조건
> *산출 N배 ↑* ⟶ *유지보수 비용 1/N ↓* 가 필수
> (역수 관계여야 진짜 향상)

### 영구적 부담의 비대칭
> "당신은 *일시적 속도 향상*을 위해 *영구적 예속 상태*로 빠진다."

> "당신이 에이전트 사용을 중단해도 추가된 유지보수 비용은 *남아 있다*."

→ AI 사용은 *되돌릴 수 있지만*, AI가 만든 유지보수 부채는 *되돌릴 수 없다*.

### 댓글의 결정적 통찰
- **AI 코드는 *틀렸을 때도 유창하고 확신에 차 있어서* 검토가 더 어려움**
- 대기업 사례: 코드 배포 증가 → 장애 증가, 레거시 개선이 신규 증가 *상쇄 못함*

## 💭 내 생각 · 적용점

### 가든 *AI 비판 시리즈*의 *수학적 보강*
가든의 *AI 채택 옹호 비판*들이 **직관·서사·일화**였는데, 이 글이 **산술 모델**을 제공:

| 글 | 형태 |
|---|---|
| [Trap (Lars Faye)](../ai/2026-05-05-agentic-coding-is-a-trap.md) | 디버깅 47% 감소 *수치 1개* |
| [Ding 코드 줄 수 = 비용](../ai/2026-05-07-claude-code-not-making-your-product-better.md) | 복리 효과 부재 *논리* |
| [.txt 병목](2026-05-07-bottleneck-was-never-the-code.md) | 제번스 역설 *비유* |
| **이 글 (Shore)** | **2×2=4 부담 *수학 공식*** |

→ **가장 액션 가능한 형태**. 회의·1on1에서 *"AI 도입 시 *유지보수도 1/N로 줄어야* 한다"* 한 줄로 압축 가능.

### *2×2=4* 가 가든의 다른 위험과 결합
- **Jevons 역설** ([.txt](2026-05-07-bottleneck-was-never-the-code.md), [Tim Davis](2026-05-10-probabilistic-engineering-and-24-7-employee.md)): 가속 → *더 많이 만들기*
- 이 글: 더 많이 만들면 *유지보수 부담 4배*
- → **Jevons + Shore = 안 잡으면 *지수적* 위기**

### 호스피탈리티 IT 직격 — *레거시 자산*이 핵심
- 호스피탈리티는 *10년+ 운영 시스템* 산업
- *유지보수가 *전체 라이프사이클의 80%* 이상* (이미 검증된 사실)
- → **N배 산출 가속에 1/N 유지보수 감소가 *없으면* 5개월 후 *순손실***
- *AI 가속이 *매력적*이지만 *덫이 깊은* 산업*

### 시범 가능한 *유지보수 비용 감소* 측정 후보

| 영역 | 측정 |
|---|---|
| **AI가 만든 PR의 *6개월 후 수정 빈도*** | 사람이 만든 PR과 비교 — 기본 메트릭 |
| **AI 코드가 들어간 모듈의 *장애 발생률*** | 6개월 누적 |
| **AI 코드 *코드 리뷰 시간*** | 사람 코드 대비 (Shore 댓글: *더 어려움*) |
| **AI 코드 *재작성 빈도*** | "한 번 더 고친" 횟수 |

→ [Lean Analytics 성공 태스크당 비용](2026-05-08-lean-analytics-reconsidered.md)과 결합해 **MangoLove PR 헤더 스키마에 *유지보수 영향 메타데이터***를 9번째 후보로 추가.

### MangoLove 적용 — *유지보수 감소 의무*
[어제 `/strict` 로컬 우선 라우팅 매트릭스](../ai/2026-05-12-running-local-models-on-m4-24gb.md) 메모와 결합:
- *대규모 리팩토링* 같은 *유지보수 비용 감소* 작업 → **AI 적극 활용**
- *새 기능 추가* 같은 *유지보수 부담 증가* 작업 → **신중하게 + 사람 검토 깊게**

→ **MangoLove `/strict`에 *"이 작업은 유지보수 비용을 *늘리는가, 줄이는가*?" 자문 추가** 후보. PR 단계 게이트.

### *영구적 예속*은 [Sara cron 우화](../career/2026-05-08-programming-still-sucks.md)의 가속 버전
- Sara cron: 1개의 의도 부채가 *수십 년* 살아남음
- AI 코드: *수많은 Sara cron이 매주 추가*되는 흐름
- **Shore의 수학이 *Sara가 기하급수적 증가하는 시나리오*** 진단

### *AI 사용 중단도 부채는 남는다*
가장 무거운 한 줄. AI 도구 사용 중단은 *하루 결정*, AI가 만든 부채 청산은 *수년 작업*. 비대칭이 결정적.

→ ***모든 AI 코드는 *생성 직후* 사람의 *유지보수성 검증* 통과 필수***. 이게 [Brian 결정적 영역](../ai/2026-05-09-agents-need-control-flow.md) + [Willison 검토 강도](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md)의 *순간 검증의 정당성*.

### 반론·균형점
- 2×2=4 모델은 *단순화* — 실제로는 *유지보수 비용 곡선이 비선형*일 수 있음
- *AI 코드가 자동으로 유지보수 어렵다*는 가정도 *조건부* — 잘 짜여진 AI 코드는 *오히려 사람 코드보다 유지보수 쉬울 수 있음* (검증 가능 시)
- 핵심: ***측정 없이는 어느 방향인지 알 수 없다*** — 위 측정 메트릭이 진짜 결정

### 가든 *위험 인덱스*에 추가
누적 위험 패턴에 새 항목:
- *유지보수 비용 비대칭* — *생성 후 영구 부담*
- *AI 사용 중단해도 부채 남음* — 되돌릴 수 없음

[Jevons 역설·생성-검증 비대칭·훈련 위기·기본값 신뢰 가정] 다음으로 5번째.

## 🎯 즉시 시도할 액션 3가지
1. **AI 코드 *6개월 후 수정 빈도* 측정 시작** — 사람 코드와 분리해 baseline 수집
2. **MangoLove `/strict`에 *유지보수 비용 영향* 자문 추가** — *늘리는가/줄이는가?* PR 단계
3. **CRS·Connectivity 등 레거시 코어에 *AI 도입 가이드* 문서 작성** — *유지보수 감소가 증명된 영역*에 한정 권장

## 🔗 연관 자료
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](../ai/2026-05-07-claude-code-not-making-your-product-better.md) — *코드 줄 수 = 비용*의 직관, 이 글이 수학적 보강
- [`engineering/2026-05-07-bottleneck-was-never-the-code.md`](2026-05-07-bottleneck-was-never-the-code.md) — Jevons 역설과 결합 (가속 → 더 만들기 → 부담 4배)
- [`engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md`](2026-05-10-probabilistic-engineering-and-24-7-employee.md) — Tim Davis의 같은 정신
- [`career/2026-05-08-programming-still-sucks.md`](../career/2026-05-08-programming-still-sucks.md) — Sara cron의 *AI 시대 가속 버전*
- [`ai/2026-05-09-agents-need-control-flow.md`](../ai/2026-05-09-agents-need-control-flow.md) — 결정적 영역 검증
- [`engineering/2026-05-08-lean-analytics-reconsidered.md`](2026-05-08-lean-analytics-reconsidered.md) — 성공 태스크당 비용 + 유지보수 영향 메타데이터
- 추천 책: James Shore, *The Art of Agile Development* / *Testing Without Mocks*

## 📝 한 달 뒤 회고
- [ ] AI 코드 *6개월 후 수정 빈도* baseline 측정을 시작했는가
- [ ] MangoLove `/strict`에 *유지보수 비용 영향* 자문이 들어갔는가
- [ ] *AI 도입 가이드* 문서가 *유지보수 감소 영역*에 한정 권장으로 작성됐는가
- [ ] 우리 회사에서 *5개월 후 순손실* 시나리오를 식별한 사례가 있는가
