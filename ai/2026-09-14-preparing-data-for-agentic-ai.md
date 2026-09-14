---
title: "에이전트형 AI를 위한 데이터 준비하기 (Pramod Sadalage, Thoughtworks/martinfowler.com) — 사람이 눈치껏 알아채던 오류와 맥락을 에이전트는 못 알아챈다, 그래서 계약·등급·공통 정의가 필요하다"
source_title: "Making Your Data Ready for Agentic AI"
source_url: "https://martinfowler.com/articles/making-data-ready-for-agentic-ai.html"
source_name: "martinfowler.com"
referrer_url: "https://news.hada.io/topic?id=33657"
published_at: "2026-09 (추정, WebSearch 교차확인 기준)"
summarized_at: "2026-09-14"
category: "ai"
tags: ["agentic-ai", "data-contracts", "data-quality", "data-governance", "semantic-layer", "medallion-architecture", "traceability", "llm-agents"]
---

# 에이전트형 AI를 위한 데이터 준비하기 (Pramod Sadalage, Thoughtworks/martinfowler.com)

> 출처: [Making Your Data Ready for Agentic AI](https://martinfowler.com/articles/making-data-ready-for-agentic-ai.html) (Pramod Sadalage, Thoughtworks Distinguished Engineer · martinfowler.com) · GeekNews 경유 · 정리일 2026-09-14

## 한 줄 요약
**사람은 경험으로 데이터 오류나 업무 맥락을 눈치껏 알아채고 보정하지만, 에이전트에게 그런 암묵지를 기대할 수 없다. 그래서 저자는 데이터를 에이전트에 내주기 전에 ***신뢰(Trusted, 계약·품질) → 추적·거버넌스(Traceable/Governed) → 의미(Contextual, 공통 정의) → 실행 가능성(Operational)***이라는 순서로 명시적으로 준비해야 한다고 주장한다. 핵심은 "품질 기준을 통과하지 못한 데이터·모델이 자신 있게 답해도 기준을 어기는 상황은 에이전트가 아니라 사람에게 넘긴다"는 명시적 실패 경로다.**

## 핵심 포인트
- **암묵지의 부재를 전제하라** — 사람은 "이 숫자는 좀 이상한데" 같은 감각으로 데이터 오류·맥락을 스스로 보정하지만, ***에이전트는 그런 직관 없이 주어진 데이터를 곧이곧대로 사용한다.*** 그래서 품질·의미·권한을 시스템에 명시적으로 박아둬야 한다는 것이 출발점.
- **데이터 계약(data contract)이 첫 관문** — ***"a single wrong fact poisons every layer built on top of it"(잘못된 사실 하나가 그 위에 쌓인 모든 층을 오염시킨다)*** — 그래서 형식·최신성·품질 기준을 데이터 계약으로 검증하고, ***이 기준을 통과하지 못한 데이터는 애초에 에이전트에 전달하지 않는다.***
- **Bronze/Silver/Gold 등급 중 Gold만 에이전트에 노출** — Medallion 스타일 등급에서 ***Gold 등급 이상만 에이전트에 노출***하고, Bronze·Silver는 계보(lineage) 검증·디버깅·사람의 직접 조사용으로만 남겨 원본이나 부분 검증 데이터가 에이전트에 그대로 흘러가지 않게 막는다.
- **자신감 있는 오답보다 명시적 이관** — 모델이 확신에 차서 답하더라도 ***데이터가 품질 기준을 어기면 그 요청은 사람에게 넘겨야 한다*** — 확신도(confidence)가 아니라 데이터 계약 통과 여부가 이관 기준이다.
- **버전관리되는 공통 정의(semantic/context layer)** — 매출 계산법·고객의 정의·환불 조건처럼 업무 규칙이 부서마다 다르게 해석되면 에이전트도 요청마다 제각각 추측한다. ***"매출과 같은 고객을 가리키지 않으면 환불도 다른 고객에 적용된다"*** 식의 정합성 붕괴를 막으려면, 이런 정의를 ***버전관리되는 공통 규칙***으로 명시해 에이전트가 매번 추측하지 않게 해야 한다.
- **추적성·거버넌스는 교차 관심사** — 계약·지표 정의·접근 범위·실행 기록을 ***담당 소유자가 지속적으로 관리***해야 하며, 감사·신뢰성 점검을 위해 에이전트의 판단과 행동을 끝까지 추적할 수 있어야 한다.

## 인상 깊은 문장
> "A single wrong fact poisons every layer built on top of it."

> "A refund acts on the same customer the revenue figure counts, requiring one vocabulary underneath — or you get two." (WebSearch 스니펫 재구성, 원문 문장 직접 대조는 못함)

## 댓글
이 세션에서 `news.hada.io`(토픽 33657)와 `martinfowler.com` 모두 egress 프록시로 차단(EGRESS_BLOCKED)돼 원문·hada 댓글 화면에 직접 접근하지 못했다. WebSearch로 GeekNews 토픽 페이지 제목·핵심 내용(3계층 데이터 스택, Gold 등급만 에이전트 노출, 거버넌스)이 martinfowler.com 원문 스니펫과 일치함을 교차확인했지만, **hada 댓글 수·의견 클러스터는 확인하지 못했다.** 저자 Pramod Sadalage는 Thoughtworks Distinguished Engineer이자 『Refactoring Databases』·『Software Architecture: The Hard Parts』 공저자로, 데이터베이스 진화적 설계·아키텍처 실무 이해관계가 뚜렷한 인물이다(광고성 벤더 글은 아니지만 Thoughtworks 컨설팅 관점이 실려 있을 수 있음). 인용문 중 하나는 WebSearch 스니펫을 재구성한 것이라 원문 단어 그대로인지는 확정하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "계약이 접착제다"라는 결론의 세 번째 목격자
[[2026-08-31-ai-era-data-architecture-meaning-over-storage]](Guldmann)가 "저장 위치가 아니라 계약이 진지한 데이터 플랫폼을 규정한다"고 했고, [[2026-09-02-post-ai-data-stack-shape-and-feel]](Macomber)가 그 계약이 조직 차원에서 지켜지는 상태를 "합의(consensus)"라 불렀다. 이 글은 같은 결론을 ***에이전트 관점에서*** 다시 도달한다 — "사람은 계약이 깨져도 암묵지로 메우지만 에이전트는 못 메운다"는 것이 계약이 왜 지금 더 절실해졌는지의 구체적 이유를 보탠다. 세 글을 겹치면 "계약→합의→에이전트 안전장치"로 이어지는 하나의 축이 완성된다.

### 핵심 전이 2 — 데이터 품질 사다리의 "목적 적합성" 단이 곧 이 글의 계약
[[2026-07-14-on-data-quality-basics]]의 4단 사다리에서 3번째 단인 ***목적 적합성(fitness-for-purpose)***이 이 글에서 말하는 "데이터 계약"의 실체다. 사다리 노트가 예고했던 "2부: AI 세계에서의 데이터 품질"의 역할을, 이 글이 다른 저자·다른 프레임으로 사실상 대신 채워준 셈이다.

### 핵심 전이 3 — Core/Overlay 시맨틱 레이어는 "공통 정의" 요구의 실제 구현체
[[2026-08-26-musinsa-ai-native-domain-knowledge]]의 Core(업계 표준)/Overlay(조직 예외) 2층 구조는, 이 글이 요구하는 "매출·고객·환불 조건의 버전관리되는 공통 정의"를 실제 시스템으로 구현하면 어떤 모양이 되는지 보여주는 구체 사례다.

## 호스피탈리티 / CRS 적용 포인트
CRS 접점이 매우 직접적이다. 온다 데이터에서 ***"가용 객실 수", "확정 예약", "취소/환불 가능 조건"*** 같은 개념이 부서·시스템마다 조금씩 다르게 정의돼 있다면, 사람 운영자는 경험으로 그 차이를 눈치채고 보정할 수 있지만 ***예약·정산을 다루는 에이전트는 그 차이를 그대로 사실로 받아들인다*** — 이 글의 핵심 경고가 정확히 이 지점을 가리킨다. 실무적으로: (1) PMS·채널매니저·OTA에서 들어오는 재고/요금 데이터에 ***형식·최신성·품질 기준을 계약으로 명시***하고, 기준 미달 데이터는 자동화(에이전트) 경로가 아니라 사람이 처리하는 예외 큐로 보낸다. (2) "가용 객실 수"·"확정 예약" 같은 핵심 지표를 부서 간 ***버전관리되는 공통 정의 문서***로 못박아, CS 자동응답·정산 자동화 같은 에이전트형 기능을 얹을 때 각 기능이 서로 다른 정의로 계산하는 사고를 막는다.

## 연관 자료
- [[2026-08-31-ai-era-data-architecture-meaning-over-storage]] — "계약이 접착제"라는 같은 결론을 아키텍처 패턴 언어로 먼저 제시
- [[2026-09-02-post-ai-data-stack-shape-and-feel]] — 계약이 조직 차원에서 지켜지는 상태를 "합의"라 부른 짝
- [[2026-07-14-on-data-quality-basics]] — "목적 적합성" 단이 곧 이 글의 데이터 계약이라는 연결점
- [[2026-08-26-musinsa-ai-native-domain-knowledge]] — 공통 정의 요구를 실제로 구현한 Core/Overlay 시맨틱 레이어 사례

## 한 달 뒤 회고
*(2026-10-14 즈음 — 원문 직접 접근이 가능해지면 인용을 원문 대조로 교체. CRS 파이프라인 중 에이전트(CS 자동응답·정산 자동화 등)에 노출되는 데이터에 "Gold 등급"에 준하는 명시적 품질 게이트가 있는지, 없다면 어디부터 걸어야 하는지 점검.)*
