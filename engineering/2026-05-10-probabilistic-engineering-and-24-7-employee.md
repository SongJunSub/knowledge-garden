---
title: "확률적 엔지니어링과 24/7 직원"
source_title: "Probabilistic Engineering and the 24/7 Employee"
source_url: "https://www.timdavis.com/blog/probabilistic-engineering-and-the-24-7-employee"
source_name: "Tim Davis (Modular)"
referrer_url: "https://news.hada.io/topic?id=29345"
published_at: "2026-04-16"
summarized_at: "2026-05-10"
category: "engineering"
tags: ["확률적엔지니어링", "AI에이전트", "검증병목", "Jevons역설", "조직", "훈련위기", "24-7-직원"]
---

# 확률적 엔지니어링과 24/7 직원

> 출처: [Tim Davis — Probabilistic Engineering and the 24/7 Employee](https://www.timdavis.com/blog/probabilistic-engineering-and-the-24-7-employee) · 레퍼러: [GeekNews 29345](https://news.hada.io/topic?id=29345) · 정리일 2026-05-10

## 🔖 한 줄 요약
**Modular CEO Tim Davis의 직접 글** — *결정론에서 확률론으로의 전환*과 *24/7 에이전트 함대*가 만드는 새 조직 구조. 가든의 [확률적 창업자 글](../career/2026-05-05-rise-of-the-probabilistic-founder.md)에서 인용된 *"이 시대의 베팅"* 발언의 **원전**.

## 🧩 핵심 주장 5가지

### 1. 엔지니어 역할의 분화 (상승 + 하강)
- *최상위*: 상위로 이동 — 아키텍처·전략·취향
- *중간층*: 하향 분화 — 프롬프트 작성·검토·에이전트 관리
- → *연봉 격차 심화*가 자연스럽게 따라온다

### 2. 생성-검증 비대칭
> "Generation got cheap, but verification didn't."

- 에이전트가 1분에 *500줄* 생성
- 그러나 *미묘한 버그 발견*은 시니어 *1시간* 필요
- **검증이 새 병목** — [.txt 병목](2026-05-07-bottleneck-was-never-the-code.md)·[Ding K자형](../ai/2026-05-07-claude-code-not-making-your-product-better.md)과 같은 결

### 3. Jevons 역설
- 1865년 *석탄 효율 향상이 석탄 사용량을 늘렸던* 관찰
- 코드 생성 비용 ↓ → **더 많은 코드 작성** (덜 만들기 X)
- 따라서 *선택과 방향성*이 새 가치 지점

> "내일 무엇을 지시할지 파악하는 것만으로 어제를 따라잡는다."

### 4. 24/7 직원의 *진짜 의미*
- *개인이 24시간 일하는 게 아님*
- **야간 에이전트 함대의 활동으로 *매일 아침 미분류 업무*가 생긴다**
- 매니저 = *어제 밤 에이전트가 만든 결과*를 *triage 하는 사람*
- 이게 [Long-running agents](../ai/2026-05-04-long-running-agents.md)의 *Brain/Hands/Session 분리*가 도달하는 자연스러운 조직 형태

### 5. 훈련 위기 (Training Crisis)
- 주니어가 *기계 매개 환경*에서만 일하면 → *"내부 모델"* 형성 기회 상실
- 다음 세대 = ***취향(taste) 개발이 어려워진다***
- → [Sara cron 우화 — *주니어가 없다*](../career/2026-05-08-programming-still-sucks.md)·[Trap 디버깅 47% 감소](../ai/2026-05-05-agentic-coding-is-a-trap.md)와 정확히 같은 진단

> "빌드하지 않으면 평가 능력을 잃는다."

> "당신이 가진 모델은 앞으로 사용할 가장 어리석은 모델이다."

> "정확성은 *알던 것*에서 *믿는 것*으로 변한다."

## 💭 내 생각 · 적용점

### 가든 그래프 — *원전 보강*의 효과
[확률적 창업자 글](../career/2026-05-05-rise-of-the-probabilistic-founder.md)에서 인용했던 *Tim Davis*의 *"이 시대의 베팅은 인간이 루프에서 충분히 날카롭고 정직하고 훈련되어 루프 안에 있을 가치가 있는지"* 가 **이 글에서 발전된 형태로 등장**:
- *루프에 있을 가치* = *훈련 위기*가 *그 가치*를 위협
- *날카로움·정직함·훈련* = *내부 모델 형성*에서 옴
- → **두 글이 같은 사고의 짧은 버전 vs 긴 버전**

가든이 *인용 → 원전*으로 거슬러 올라가 *생각의 계보*를 확인한 좋은 사례.

### *24/7 직원*은 호스피탈리티에 딱 맞는 메타포
호스피탈리티는 *원래 24/7 산업*. 호텔은 *밤에도 운영*이고, OTA는 *밤에도 예약*이 들어옴.
- **새벽 알림·민원·OTA 변경**을 *에이전트가 분류*하고
- *아침에 매니저가 triage*하는 모델이 *호스피탈리티의 자연스러운 적용*
- 이미 [YC RFS #15 AI OS](2026-04-29-yc-rfs-summer-2026-hospitality-it.md)·[Long-running agents Ambient Processing](../ai/2026-05-04-long-running-agents.md)에서 메모한 흐름이 *이 글에서 더 강한 이름*을 얻음 — *24/7 직원*

→ **호스피탈리티 IT 적용**: *어떤 작업을 *밤에 에이전트가 분류*하고 *아침 매니저 triage*에 올리는가* 라는 1페이지 매핑이 새 액션 후보.

### 역할 분화는 한국 IT에서 더 첨예해질 가능성
- 한국 IT는 [듀얼 트랙(IC vs Manager) 부재](../career/2026-05-04-learnings-from-1000-interviews-at-amazon.md)
- 이 글의 *상위 집중·하위 분화*가 진행되면 **중간층 부재가 더 빨리 드러남**
- *연봉 격차*가 정당화되는 새 시대 — *공정성 논의*가 따라올 것

### *Jevons 역설*은 가든에 두 번째 등장
- [.txt 병목](2026-05-07-bottleneck-was-never-the-code.md): "전에 없던 기능까지 만들기 시작"
- 이 글: 1865년 석탄 사례로 더 강한 명명
- → ***Jevons 역설이 AI 시대의 핵심 위협*** 이라는 패턴 확인

가든에서 *같은 위험을 두 번 이상 만난 개념*을 따로 모으는 *위험 인덱스* 만들 가치 있음.

### *내부 모델 형성*은 [antirez 글](2026-05-05-redis-array-antirez-4-months-with-ai.md)의 정확한 반대편
- antirez는 *기존 전문성을 AI로 증폭* — 시니어 측
- 이 글의 훈련 위기 = *주니어가 그 전문성을 만들지 못하는* 위협
- 5년 후 *antirez 같은 시니어 풀이 마르면* AI 채택 옹호 글들이 무의미해진다는 [어제 메모](../career/2026-05-08-programming-still-sucks.md)와 정확히 결합

### MangoLove 적용 후보
- ***24/7 직원* 워크플로**: 가든·BugSip·CRS 작업에 *밤에 에이전트가 처리할 작업*과 *아침 사람이 triage할 작업* 분리
- *내부 모델 보존* 룰: 한 달에 한 번 *AI 없이* 작업 ([Trap 글](../ai/2026-05-05-agentic-coding-is-a-trap.md) 메모와 같은 처방)

### 가든 PR 헤더 스키마는 점점 길어지고 있음
누적된 후보:
- 추가/제거 줄 (Ding)
- AI 강도 vibe/hybrid/agentic (Willison)
- 측정 가능 가치 변화 (Lean Analytics)
- 결정적/비결정적 영역 (Brian)
- 공개 보안 함의 (Kaufman)
- ***주니어 학습 가치 여부* (이 글)** ← 7번째 후보? — *주니어가 직접 만들면 *내부 모델 형성*에 기여*하는지 표시

→ 너무 많아진다 = 분기 회고 시 *축약 통합*이 필수가 됨. 6-7개를 *3-4개로 압축*하는 작업이 다음 큰 가든 메타.

### 반론·균형점
- *훈련 위기*는 *현 세대 관점*. 다음 세대는 *AI를 도구로 쓰는 새 형태의 내부 모델*을 만들 가능성도 — *내부 모델의 정의*가 바뀔 수 있음
- *24/7 직원*은 *분리 가능한 작업*에만 적용. *대인 협상·정성적 판단*은 여전히 사람 시간 필요
- *연봉 격차 심화*는 *시장 충격*이지 *경영진 결정*은 아니라는 부분에 동의 — 그러나 *완화 가능한 정책*은 분명 존재

## 🎯 즉시 시도할 액션 3가지
1. **호스피탈리티 *24/7 직원 매핑*** — 밤에 에이전트가 처리·아침 매니저 triage 후보 5개 식별
2. **가든 *위험 인덱스*** 시범 — *Jevons 역설·생성-검증 비대칭* 같이 *두 번 이상 등장한 위험*을 따로 모음
3. **PR 헤더 *축약 통합*** — 누적된 6-7 후보를 3-4개로 압축할 후보 제안

## 🔗 연관 자료
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — Tim Davis 인용의 *원전 보강*
- [`engineering/2026-05-07-bottleneck-was-never-the-code.md`](2026-05-07-bottleneck-was-never-the-code.md) — Jevons 역설의 같은 결
- [`ai/2026-05-04-long-running-agents.md`](../ai/2026-05-04-long-running-agents.md) — 24/7 직원이 도달하는 자연스러운 조직 형태
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](../ai/2026-05-05-agentic-coding-is-a-trap.md) — 훈련 위기의 같은 진단
- [`career/2026-05-08-programming-still-sucks.md`](../career/2026-05-08-programming-still-sucks.md) — Sara cron + 주니어 장례식 = 같은 위기
- [`engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md`](2026-05-05-redis-array-antirez-4-months-with-ai.md) — 시니어 측 모범, 이 글의 정반대편
- [`engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md`](2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — #15 AI OS와 24/7 직원 결합

## 📝 한 달 뒤 회고
- [ ] 호스피탈리티 24/7 직원 매핑(밤 에이전트·아침 triage 후보 5개)을 작성했는가
- [ ] 가든 *위험 인덱스* 시범을 시작했는가
- [ ] PR 헤더 6-7 후보의 축약 통합 시도가 있었는가
- [ ] *내부 모델 보존* 룰(한 달 한 번 AI 없이)을 한 번이라도 적용했는가
