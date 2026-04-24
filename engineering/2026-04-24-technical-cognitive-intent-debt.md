---
title: "기술 부채, 인지 부채, 의도 부채"
source_title: "Technical Debt, Cognitive Debt, Intent Debt"
source_url: "https://martinfowler.com/fragments/2026-04-02.html"
source_name: "martinfowler.com"
referrer_url: "https://news.hada.io/topic?id=28824"
published_at: "2026-04-02"
summarized_at: "2026-04-24"
category: "engineering"
tags: ["부채", "LLM", "검증", "아키텍처", "엔지니어링문화", "추상화"]
---

# 기술 부채, 인지 부채, 의도 부채

> 출처: [Technical Debt, Cognitive Debt, Intent Debt](https://martinfowler.com/fragments/2026-04-02.html) · 레퍼러: [GeekNews 28824](https://news.hada.io/topic?id=28824) · 정리일 2026-04-24

## 🔖 한 줄 요약
LLM이 코드를 대량 생성하는 시대엔 **코드(기술)·사람(인지)·산출물(의도)** 세 층위의 부채를 구분해야 하며, 엔지니어링의 무게중심은 **구현 → 검증**으로 이동한다.

## 🧩 핵심 포인트

### 세 가지 부채 (Margaret-Anne Storey 모델)

| 층위 | 사는 곳 | 축적되는 순간 |
|------|--------|-------------|
| **Technical debt** | **Code** — 코드에 산다 | 구현 결정이 미래의 변경 가능성을 해칠 때 |
| **Cognitive debt** | **People** — 사람에 산다 | 시스템에 대한 **공유된 이해가 보충보다 빠르게 사라질 때** |
| **Intent debt** | **Artifacts** — 산출물(문서·스펙·테스트 등)에 산다 | 시스템을 이끌어야 할 **목표와 제약이 제대로 기록·유지되지 않을 때** |

### 왜 지금 이 구분이 중요한가 (LLM 시대)
- **코딩 비용이 낮아질수록 검증 비용은 상대적으로 비싸진다**. 만드는 건 쉬워지고, 만든 것이 맞는지 확인하는 게 병목이 된다.
- LLM이 짧은 시간에 많은 코드를 쏟아내면서 **인지 부채가 폭발적으로 증가**한다 — 사람은 이 코드가 왜 이렇게 생겼는지 따라가지 못한다.
- **의도 부채가 가장 치명적이다.** 의도는 코드에 잘 드러나지 않고, 기록이 없어지면 **AI 에이전트도 시스템을 제대로 진화시킬 수 없다.** 규제·정책처럼 "원래 왜 이래야 했는지"가 사라지면 조용히 잘못된 방향으로 진화한다.

### 엔지니어의 역할 재편 (Ajey Gore)
- 에이전트가 실행을 맡으면 **사람의 일은 ①검증 시스템 설계, ②품질 정의, ③에이전트가 풀 수 없는 모호한 케이스 처리**로 이동한다.
- 조직 구조도 "기능을 만드는 팀" 중심에서 **"검증을 설계하는 팀"** 중심으로 재편될 가능성.
- 인간 엔지니어가 잘해야 하는 것 → **추상화 창조**, **명확한 이름 짓기**, **테스트·수용 기준 설계**.

### 커뮤니티 논점 (긱뉴스 댓글에서)
- **좋은 테스트 하네스 설계가 핵심**이지만, 그 자체가 **비즈니스 로직에 대한 깊은 이해**를 요구한다 — 검증은 공짜가 아니다.
- LLM의 실무적 한계: 과잉 수정, 추상화 오판, 결정성 부재.
- **추상화 vs 중복**: AI가 코드를 값싸게 뽑아내는 시대에 DRY가 여전히 최우선인지 재검토 필요.
- 진짜 병목은 코드가 아니라 **요구사항 → 스펙 → 수용 기준** 사이의 전이 과정이다.

## 📜 인상 깊은 문장

> "Technical debt lives in code. It accumulates when implementation decisions compromise future changeability."

> "Cognitive debt lives in people. It accumulates when shared understanding of the system erodes faster than it is replenished."

> "Intent debt lives in artifacts. It accumulates when the goals and constraints that should guide the system are poorly captured or maintained."

> "If agents handle execution, the human job becomes designing verification systems, defining quality, and handling the ambiguous cases agents can't resolve."

## 💭 내 생각 · 적용점

- **가장 쓸모 있는 렌즈는 "의도 부채"**다. 우리 팀에서 실제로 사고를 일으키는 건 코드가 아니라 "왜 이렇게 정했는지 아무도 모르게 된 결정"들이다. RFC/ADR, PR 설명, Spec 문서를 실체 있게 남기는 습관이 앞으로 더 비싸진다.
- **AI 에이전트에게 맡기는 일이 늘어날수록 "의도 기록"이 더 중요**하다. 나도 Claude에게 코드를 위임할 때, 단순히 "~해줘"가 아니라 **제약·목표·수용 기준**까지 남기는 식으로 프롬프트 구조를 바꿔야 한다 (이미 MangoLove Spec 템플릿이 이 방향인데, 강화할 명분이 생겼다).
- **인지 부채 관리 = 리뷰·페어·문서** 세 축. LLM이 만드는 코드량이 늘어날수록 **읽는 능력·해석 능력**이 상대적으로 희소해진다. 코드리뷰 시간을 아끼는 게 아니라 **오히려 늘려야 할 때**다.
- **엔지니어링 가치의 이동**: "빨리 만든다" → "빠르게 검증 가능한 형태로 만든다". 팀 평가 지표나 PR 템플릿을 이 방향으로 손볼 여지가 있다. 수용 기준을 자동 검증 가능한 형태로 요구하는 체크리스트 추가.
- **추상화 vs 중복 논쟁**도 실무에 울림이 있다. 예전엔 중복을 보면 반사적으로 추상화했지만, AI가 쉽게 양산하는 코드에선 **섣부른 추상화의 인지 부채가 더 비쌀 수 있다**. "같은 코드 3번 = 추상화" 규칙은 그대로 두되, 그 추상화의 **의도**를 남기는 데 에너지를 더 쓴다.

## 🔗 연관 자료
- Martin Fowler, *Refactoring* / *Patterns of Enterprise Application Architecture*
- Margaret-Anne Storey의 엔지니어링 생산성·시스템 건강 연구
- [`engineering/2026-04-23-laws-of-software-engineering.md`](2026-04-23-laws-of-software-engineering.md) — "기술 부채", "Hyrum's Law", "Conway's Law" 등과 직접 연결

## 📝 한 달 뒤 회고
<!-- 우리 팀 Spec/ADR 습관을 의도 부채 관점에서 재점검해본 결과를 나중에 덧붙인다. -->
