---
title: "Lean Analytics, AI와 에이전트 시대에 맞춰 돌아보기"
source_title: "Lean Analytics Reconsidered"
source_url: "https://www.focusedchaos.co/p/lean-analytics-reconsidered"
source_name: "Focused Chaos (Ben Yoskovitz)"
referrer_url: "https://news.hada.io/topic?id=29281"
published_at: "2026-04-28"
summarized_at: "2026-05-08"
category: "engineering"
tags: ["메트릭", "Lean-Analytics", "제품지표", "가치밀도", "AI시대", "측정"]
---

# Lean Analytics, AI와 에이전트 시대에 맞춰 돌아보기

> 출처: [Ben Yoskovitz — Lean Analytics Reconsidered](https://www.focusedchaos.co/p/lean-analytics-reconsidered) · 레퍼러: [GeekNews 29281](https://news.hada.io/topic?id=29281) · 정리일 2026-05-08

## 한 줄 요약
2013년 *Lean Analytics*의 **프레임워크는 여전히 유효**(5단계·비즈니스 모델·OMTM·벤치마킹)하지만, **구체적 지표 대부분은 재작성** 필요. 핵심 신메트릭 = **가치 밀도** (태스크당 비용 × 수익 포착률 × 사용자 가치).

## 6가지 제품 지표 변화

| # | 변화 | 이전 → 현재 |
|---|------|-----------|
| 1 | **Time to Value 붕괴** | "30일 내 활성화" → *첫 시도에서 고품질 기대* |
| 2 | **활성화의 *비결정성*** | 단계 완료 = 가치 전달 → **품질 가중 이벤트** |
| 3 | **인게이지먼트의 *방향성*** | "사용량↑?" → *"무엇에 시간을 썼나?"* |
| 4 | **고착성 = 흐름** | 담장(barrier) → *통합 깊이·태스크 다양성* |
| 5 | **품질의 일급화** | 부수 지표 → *출력 분포 지속 모니터링* (eval 필수) |
| 6 | **AI 신뢰도·편안함** | 단일 지표 → *AI 친숙도별 코호트 분리* (수용률·거부율) |

## 3가지 비즈니스 모델 지표 변화

### 1. *성공 태스크당 비용* (Cost per Successful Task)
- 토큰 기반 *변동 비용*이 마진을 직접 침식
- **"강력한 사용자는 *최고 자산이거나 최대 부채*"**
- 사용자 단위 *수익 vs LLM 호출 비용* 매트릭스 필수

### 2. *가격 책정 = 제품 결정*
- 가격 모델이 **성공의 정의를 사용자에게 신호**
- 결과 기반(outcome-based) 모델 부상
- 토큰별 과금 vs 결과별 과금이 *제품 정체성*에 다르게 작용

### 3. 실험의 재평가
- *만들기 쉬움 = 과도한 기능 추가 위험* (제번스 역설과 같은 결)
- **기능 삭제도 측정 항목**에 포함

> "평가 틀 자체가 MVP다. 행동 개선을 자동화하고 측정할 수 있는 최소 집합이다."

## 내 생각 · 적용점

### 가든 *측정 메트릭* 결의 첫 글
지금까지 가든이 *어떻게 위험을 다룰까* (비판 9), *무엇이 시간을 견디는가* (자산), *왜 만드는가* (철학)에 집중했는데, 이 글은 **"어떻게 측정할까"** — 가든의 새 결.

### 가든 글들과의 직접 연결
- [Glaser *Token-to-Learning*](2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md): 이 글의 *품질 일급화 + AI 코호트* 가 동일 정신
- [Langbroek *Goodhart's Law*](../career/2026-05-08-programming-still-sucks.md): *지표가 목표가 되면 신뢰성 잃음* — 이 글이 **새 지표를 제시하는 측면**, Langbroek가 **새 지표도 같은 함정 가능 경고**
- [Ding *코드 줄 수 = 비용*](../ai/2026-05-07-claude-code-not-making-your-product-better.md): *기능 삭제도 측정* 정신과 일치
- [No One's Happy *조직 슬롭*](../ai/2026-05-07-appearing-productive-in-the-workplace.md): 산출량이 아닌 *질적 가치 측정*의 필요성

### 호스피탈리티 메트릭 재설계 — 즉시 적용 후보

기존 호스피탈리티 KPI(점유율·ADR·RevPAR)는 *Time to Value 붕괴* 시대에 부족. *6가지 변화 매핑*:

| 변화 | 호스피탈리티 적용 |
|---|---|
| **Time to Value** | 검색→예약 *첫 클릭 만족률*. 30초 내 가치 인식? |
| **활성화 비결정성** | "예약 완료" ≠ "성공" — *체크인까지 도달*했나, *재방문*했나 |
| **인게이지먼트 방향성** | 앱 사용 시간 ↑ ≠ 가치. *어떤 화면에 시간 썼나* |
| **고착성 = 흐름** | 마일리지 락인 → *예약·결제·후기·사후관리 흐름의 매끄러움* |
| **품질 일급화** | NPS만 X → *룸 컨디션·청결·체크인 시간*의 *분포 모니터링* |
| **AI 신뢰도** | *AI 친숙도별 게스트 코호트* 분리 — 음성 컨시어지 수용률 차이 큼 |

### CRS·PickMe 측정 후보
- **PickMe 토스 미니앱**: *Time to Value 붕괴* 핵심 지표 — *진입 5초 내 호텔 카드 클릭률*
- **CRS Admin**: *직원 작업 시간을 무엇에 썼나* 측정. 단순 사용 시간 X
- **Connectivity API**: 파트너의 *성공 태스크당 호출 비용* — 한 예약 성공 = 평균 N번 호출, 그 비용
- **다크 마켓플레이스 시대**([어제 글](2026-05-08-the-dark-marketplace.md)): 사용자 화면이 사라지므로 *전통 인게이지먼트 메트릭 무용* → *에이전트 추천 풀 진입률* 같은 새 메트릭 필요

### *성공 태스크당 비용* — 호스피탈리티에선 진짜 위협
- LLM 호출 비용이 *예약 1건당 비용*에 누적
- 음성 컨시어지·자연어 검색·자동 응답이 늘면 → *단가가 마진을 갉아먹는다*
- "강력한 사용자가 부채" 시나리오: *VIP가 음성 컨시어지를 가장 많이 사용 → 토큰 비용 폭증 → 마진 음수* 가능

→ **PickMe·CRS Admin·B2C 사이트의 *사용자별 LLM 비용 한도* 정책**이 필요한 시점.

### *가격 책정이 제품 결정* — 호스피탈리티에선 미묘
- 호텔 *룸당 가격*은 이미 *결과 기반*에 가까움 (1박 = 결과)
- 그러나 *AI 추가 서비스*(컨시어지·여정 추천·자동 체크인)는 *어떻게 가격 매기는가*가 *제품 정체성*을 결정
- 토큰별? 사용 시간별? *서비스 결과별*?
- **선택이 곧 *어떤 게스트를 끌어들이느냐*를 결정**

### *기능 삭제도 측정* — Lord 3 제약과 결합
- [Lord *3 제약*](2026-04-28-three-constraints-before-i-build-anything.md)의 *"defining constraint"*
- [Ding *코드 줄 수 = 비용*](../ai/2026-05-07-claude-code-not-making-your-product-better.md)
- 이 글의 *"기능 삭제도 측정"*

→ **PR에 *삭제 줄 수*를 *별도 헤더*로 노출**하는 룰을 *문화적 메시지*로. [Willison 메타데이터 vibe/hybrid/agentic](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md)과 결합 — *PR 헤더 스키마*가 점점 풍부해지고 있음.

### MangoLove·가든 자체 적용
- **가든 메트릭 후보**: commit 수 X → *재참조 수* + *MangoLove 적용 후보 액션이 실제 실행됐나*
- **MangoLove `/strict`**: *Lean Analytics 단계*를 의식 — 5단계 중 어디인지 *명시*하면 우선순위가 명확해짐

### 반론·균형점
- *6+3 변화*가 모두 *실측·자동화 가능*하진 않음 — *품질 분포 모니터링*은 인프라 비용이 큼
- *가치 밀도* 3요소는 *동시 최적화 어려움* — 어떤 시점엔 *수익 포착*만, 어떤 시점엔 *사용자 가치*만 우선이 합리적
- 한국 IT의 *KPI 문화*는 *전통 지표(매출·MAU)*를 강하게 요구 — 새 메트릭이 *추가*되는 게 아니라 *대체*로 합의되어야 작동

## 즉시 시도할 액션 3가지
1. **CRS·PickMe·Connectivity 각각 *Time to Value 1개 + 성공 태스크당 비용 1개* 정의 시도** — 새 메트릭 후보 1페이지 메모
2. **PR 헤더 스키마 정리**: *추가/제거 줄 + AI 사용 강도 + 측정 가능한 가치 변화* 3-4 항목
3. **MangoLove `/strict`에 *Lean Analytics 단계 명시* 옵션 추가 검토** — 어떤 단계의 작업인지 명시하면 우선순위 명확

## 연관 자료
- [`engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md`](2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) — Token-to-Learning 동일 정신
- [`career/2026-05-08-programming-still-sucks.md`](../career/2026-05-08-programming-still-sucks.md) — Goodhart 함정 (새 지표도 동일 위험)
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](../ai/2026-05-07-claude-code-not-making-your-product-better.md) — 코드 줄 수 = 비용 정신과 일치
- [`engineering/2026-05-08-the-dark-marketplace.md`](2026-05-08-the-dark-marketplace.md) — 사용자 화면 사라지면 메트릭 재설계 필수
- [`engineering/2026-04-28-three-constraints-before-i-build-anything.md`](2026-04-28-three-constraints-before-i-build-anything.md) — 기능 삭제 측정과 결합
- [`ai/2026-05-07-vibe-coding-agentic-engineering-converging.md`](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md) — PR 메타데이터 vibe/hybrid/agentic
- 원전: Alistair Croll·Ben Yoskovitz, *Lean Analytics* (2013)

## 한 달 뒤 회고
- [ ] CRS·PickMe·Connectivity 신메트릭 후보 1페이지 메모를 작성했는가
- [ ] PR 헤더 스키마(추가/제거/AI 강도/가치) 시도했는가
- [ ] *성공 태스크당 비용* 관점이 한 번이라도 의사결정에 반영됐는가
- [ ] *기능 삭제도 측정* 정신이 PR 1건이라도 반영됐는가
