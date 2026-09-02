---
title: "포스트 AI 데이터 스택의 형태와 사용감 (Ian Macomber) — 진짜 병목은 분석 생성이 아니라 전사적 합의"
source_title: "The Shape and Feel of the Post-AI Data Stack"
source_url: "https://www.iandmacomber.com/blog/post-ai-data-stack/"
source_name: "Ian Macomber (iandmacomber.com)"
referrer_url: "https://news.hada.io/topic?id=33097"
published_at: "2026-08-30(추정)"
summarized_at: "2026-09-02"
category: "architecture"
tags: ["data-stack", "data-governance", "semantic-layer", "ai-agents", "llm", "data-consensus"]
---

# 포스트 AI 데이터 스택의 형태와 사용감 (Ian Macomber)

> 출처: [The Shape and Feel of the Post-AI Data Stack](https://www.iandmacomber.com/blog/post-ai-data-stack/) (Ian Macomber, VP of Data @ Ramp) · GeekNews 경유(id=33097) · 정리일 2026-09-02

## 한 줄 요약

**데이터 스택이 단일 서버 분석 → 전사 데이터 활용/운영을 거쳐, 포스트 AI 시대에는 "기업이 무엇을 사실로 보고 중요하게 판단할지"를 설계하는 단계로 확장된다.** 코딩 에이전트·AI 네이티브 벤더가 분석 생성 자체를 거의 공짜로 만들면서, 역설적으로 어떤 인터페이스·모델을 쓰든 같은 기준과 답에 도달하게 만드는 전사적 합의(consensus)가 가장 희소하고 값진 자원이 됐다는 것이 이 글의 핵심 주장이다.

## 핵심 포인트

- **데이터팀의 임무가 둘로 재정의됨** — ① 모두가 데이터·AI로 정확하고, 강력하고, 독립적으로 만들 수 있게 지원하는 것, ② 회사 전체가 딛고 서는 단일한 현실을 구축하는 것.
- **진짜 병목은 분석 생성이 아니라 합의다** — 데이터 질문이 개인화되고 대시보드 생성 비용이 0에 가까워질수록, 어렵고 희소해지는 건 "모두가 같은 숫자·같은 정의에 동의하고 그 상태를 유지하는 것"이다.
- **사람용 인터페이스와 에이전트용 인터페이스를 이원화해야 한다** — 사람에게는 React 대시보드, 에이전트에게는 마크다운 서술자·조회 가능한 SQL·캐시된 값(.csv) 형태로 노출해야 한다.
- **사람은 더 이상 데이터팀 산출물의 1차 소비자가 아니다** — 데이터팀 산출물은 에이전틱 인터페이스가 소비하고, LLM이 사람의 눈높이에 맞게 재포장하는 구조로 바뀐다.
- **스택의 경계가 비정형 데이터까지 확장된다** — 문서·대화·티켓 같은 비정형 데이터를 스택 안으로 끌어들이고, 에이전트 하네스·회사 컨텍스트·피드백 루프라는 새 구성요소가 추가된다.

## 인상 깊은 문장

> "Humans are no longer the primary consumer of data team outputs, and dashboards + analyses are no longer the end products. Data team outputs are now consumed by agentic interfaces, and repackaged by LLMs for human eyeballs and decisions." (WebSearch 스니펫 재구성)

> "When building is cheap, consensus is the scarce resource." (같은 저자의 앞선 글에서 재확인된 축약판)

## 댓글

**hada 댓글 수·클러스터를 직접 확인하지 못했다.** HN·Lobsters에서 이 글을 겨냥한 전용 토론 스레드는 찾지 못했다. Slack 발췌 원문도 마지막 문장이 절단돼 있어 전체 논지를 그대로 옮기지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Guldmann의 "계약이 접착제다"와 정확히 같은 자리를 가리킴

[[2026-08-31-ai-era-data-architecture-meaning-over-storage]]에서 Guldmann은 "진지한 데이터 플랫폼을 규정하는 건 계약"이라고 했다. 이 글의 "합의"는 그 계약이 조직 차원에서 실제로 지켜지고 있는 상태를 가리키는 다른 이름이다.

### 핵심 전이 2 — Inmon의 ELDM·"단일한 현실"과의 삼각검증

[[2026-07-22-data-management-in-the-age-of-ai-inmon]]의 ELDM과 이 글의 "단일한 현실"은 거의 동일한 목표를 가리킨다. 서로 다른 세대·배경에서 같은 결론에 도달했다는 건 이게 AI가 데이터에 강제하는 구조적 요구라는 근거를 보탠다.

### 핵심 전이 3 — 합의가 깨지는 자리는 대개 "품질 사다리의 다른 단"

[[2026-07-14-on-data-quality-basics]]가 말한 "정의 불일치의 근원 = 서로 다른 사다리 단에서 품질을 말한다"는, 이 글이 말하는 "합의가 왜 안 되는가"에 대한 구체적 메커니즘을 제공한다.

## 호스피탈리티 / CRS 적용 포인트

이 글의 문제의식은 CRS에 상당히 직접적으로 닿는다. 온다의 예약·재고·요금 데이터가 여러 인터페이스로 조회될 때, "가용 객실 수", "확정 예약 건수" 같은 핵심 개념이 어떤 화면·모델을 통해 조회하든 같은 답을 내야 한다는 것이 실무 목표가 된다. 실무적으로: (1) 사람용 대시보드와는 별도로 에이전트가 직접 조회할 수 있는 형태(MCP형 도구)로 산출물을 노출. (2) "합의가 희소자원"이라는 프레임은 데이터 정합성 이슈가 터질 때마다 새 대시보드를 만드는 대신 정의 자체를 어디서 합의하고 강제할지를 먼저 묻게 한다.

## 연관 자료
- [[2026-08-31-ai-era-data-architecture-meaning-over-storage]] — "계약이 접착제"라는 같은 결론을 아키텍처 패턴 언어로 먼저 제시한 글
- [[2026-07-22-data-management-in-the-age-of-ai-inmon]] — ELDM·의미론적 중앙집중으로 "단일한 현실"을 먼저 이름 붙인 글
- [[2026-07-14-on-data-quality-basics]] — 합의가 깨지는 실제 메커니즘을 제공하는 짝

## 한 달 뒤 회고
*(2026-10-02 즈음 — 원문 직접 접근이 가능해지면 인용을 원문 대조로 교체. CRS 데이터 산출물 중 "사람용/에이전트용 이원 노출"을 실제로 검토했는지 점검.)*
