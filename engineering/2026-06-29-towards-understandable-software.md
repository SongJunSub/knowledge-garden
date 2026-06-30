---
title: "이해 가능한 소프트웨어를 향하여 (gracefulliberty.com) — 'LLM은 자동화이지 추상화가 아니다', 문서 우선·GUI·결정론적 자연어로 프로그래밍의 근본 문제를 해결해야 한다"
source_title: "Towards Understandable Software"
source_url: "https://gracefulliberty.com/articles/towards-understandable-software/"
source_name: "gracefulliberty.com"
referrer_url: "https://news.hada.io/topic?id=30938"
summarized_at: "2026-06-29"
category: "engineering"
tags: ["literate-programming", "llm-criticism", "abstraction", "natural-language-programming", "gui", "documentation-first", "understandable-software", "future-of-programming", "entangled"]
---

# 이해 가능한 소프트웨어를 향하여 (gracefulliberty.com) — 'LLM은 자동화이지 추상화가 아니다', 문서 우선·GUI·결정론적 자연어로 프로그래밍의 근본 문제를 해결해야 한다

> 출처: [Towards Understandable Software](https://gracefulliberty.com/articles/towards-understandable-software/) (gracefulliberty.com) · 정리일 2026-06-29

## 한 줄 요약

**"프로그래밍이 끔찍하다"는 문제를 LLM으로 자동화하는 것은 해결이 아니다. LLM은 자동화 계층이지 추상화 계층이 아니기 때문이다. 진짜 해결은 문서 우선 프로그래밍·GUI 다중 표현·결정론적 자연어 프로그래밍으로 추상화 수준 자체를 높이는 것이다.**

## 핵심 포인트

- **LLM의 근본 한계** — LLM은 ①환경 파괴적 ②도난 코드 기반 ③확률적 결과(불일치). 가장 중요한 것: LLM은 **자동화 계층(Automation Layer)**이지 **추상화 계층(Abstraction Layer)**이 아니다. 진정한 추상화는 예측 가능하고 일관되어야 한다.
- **해결책 1 — 문서 우선 프로그래밍(Literate Programming)** — 기존: 코드 먼저 → 문서 나중. 제안: 문서 먼저 → 코드 뒤따름. Entangled(양방향 tangler): 문서와 코드를 동기화, 어느 쪽을 수정해도 반영. 저자가 Rust로 ReTangled 개발 중.
- **해결책 2 — 코드 폐지와 GUI 다중 표현** — 코드는 "터미널 시대의 개념." IDE가 그래픽 기반 프로그래밍으로 진화해야 한다. 단, 접근성 필수 — 시각 장애인을 위한 스크린리더 통합이 설계 단계부터 포함되어야 함.
- **해결책 3 — 결정론적 자연어 프로그래밍** — LLM의 확률적 자연어 처리가 아닌, 예측 가능한 NLP 파이프라인으로 자연어 → 중간 표현 → 기계어 변환. "인간에게 설명하는 언어가 기계에게도 명령이 되는" 세계.
- **사례**: Eve — 문학적 프로그래밍 시도, 자금 부족으로 실패. Inform — 인터랙티브 픽션용 선언형 자연어 언어, 개념 확장 가능성 입증.
- **핵심 재정의** — "프로그래밍이 끔찍하다고 해서 없애야 하는 것이 아니라, 더 높은 추상화 수준에서 소통할 수 있도록 재구성해야 한다."

## 인상 깊은 문장

> "LLM은 자동화 계층이지, 추상화 계층이 아니다. 진정한 추상화는 예측 가능하고 일관되어야 한다."

> "코드는 과거 터미널 시대의 개념이다 — 더 높은 추상화 수준에서 소통할 수 있도록 재구성해야 한다."

> "문서를 먼저 작성하고 코드가 그 뒤를 따라야 한다."

## 댓글 — Lobste.rs 관점 (GN⁺ 큐레이션)

- **"프로그래밍 언어 = 사용자 인터페이스"**: 잘 만든 형식 표기는 "사고의 도구"가 된다.
- **"모든 사람이 프로그래머가 될 필요는 없다"**: 추상화가 높아질수록 비전문가도 사용 가능해야 한다는 의견.
- **GUI 도구의 역설**: 기존 GUI 도구들이 오히려 비프로그래머를 소외시켰다는 지적.
- **결정론적 자연어의 어려움**: 자연어를 예측 가능하게 변환하는 것은 NLP 복잡성 때문에 매우 어렵다는 회의적 의견.
- **관련 프로젝트 언급**: Glamorous Toolkit·Curv·Dynamicland 등 같은 방향을 시도하는 프로젝트들.

## 내 생각 · 적용점

### 핵심 전이 1 — "LLM은 추상화가 아닌 자동화" 구분이 실천에서 핵심이다

Claude Code를 쓸 때 착각하기 쉬운 것: "AI가 설계를 해줄 것이다." 그런데 AI는 내가 말한 것을 자동화할 뿐, **추상화 — 올바른 경계를 찾고, 복잡성을 숨기고, 예측 가능한 인터페이스를 설계하는 것 — 는 여전히 인간의 일이다.** "추상화를 AI에게 위임했더니 코드가 이상하게 됐다"는 경험이 있다면, 이 구분을 놓친 것이다. [[2026-06-26-joy-and-power-of-understanding]]의 "설명할 수 없는 해법은 받으면 안 된다"와 같은 구조.

### 핵심 전이 2 — "문서 우선"은 API 설계의 원칙이기도 하다

"문서 먼저, 코드 나중"은 단지 글쓰기 방법론이 아니다. **API를 설계할 때 "이 API를 어떻게 사용하는지 먼저 글로 써보기"가 설계 품질을 높인다.** CRS·PickMe의 API 스펙을 코드 이전에 OpenAPI 문서로 먼저 정의하면, 실제 구현 전에 인터페이스 결함을 발견할 수 있다. "README-driven development"가 이 접근을 소프트웨어 팀에 이미 적용하고 있다. [[2026-06-27-37signals-decision-guide]]의 "결정 전에 먼저 질문하기"와 같은 사전 사고 원칙.

### 핵심 전이 3 — BugSip의 핵심이 여기에 있다

BugSip은 "모바일에서 코드를 읽는" 앱이다. 이 글이 말하는 방향 — 코드를 다양한 표현으로, 접근 가능하게, 문서와 통합되어 — 이 BugSip이 풀려는 문제와 정확히 겹친다. **BugSip의 차별화 포인트: 코드를 단순히 모바일로 옮기는 것이 아니라 "이해 가능한 표현으로 재구성"하는 것.** 이 글의 "문서와 코드의 경계를 무너뜨리는" 방향이 BugSip의 장기 비전이 될 수 있다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-26-joy-and-power-of-understanding]] — *"설명할 수 없는 해법은 받으면 안 된다" — LLM은 추상화가 아닌 자동화*
- [[2026-06-29-robin-williams-lived-experience]] — *AI가 줄 수 없는 것 — 이해·공감·맥락 판단은 추상화에 속한다*
- [[2026-06-29-gtm-ai-context-layer]] — *"의사결정 로직은 내부에서 소유" — 추상화는 외부 위탁 불가*
- [[2026-06-27-37signals-decision-guide]] — *"먼저 질문하고, 나중에 코드" — 문서 우선과 같은 원칙*

## 한 달 뒤 회고
*(2026-07-29 즈음 — "문서 먼저, 코드 나중" 원칙을 CRS·PickMe API 설계에 적용했는지, BugSip의 "이해 가능한 코드 표현" 방향을 구체화했는지 기록.)*
