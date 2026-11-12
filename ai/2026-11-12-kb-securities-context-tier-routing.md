---
title: "KB증권 Context Tier-Routing (AWS, 원문 미확인) — 질의 난이도에 따라 모델을 갈아타는 라우팅을 에이전트 플랫폼에 심었다"
source_title: "KB증권 AI 에이전트는 어떻게 최적의 모델을 선택할까? – Amazon Bedrock 기반 Context Tier-Routing"
source_url: "https://aws.amazon.com/ko/blogs/tech/kb-securities-ai-agent-optimal-model-selection/"
source_name: "AWS 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/kb-securities-ai-agent-optimal-model-selection/"
summarized_at: "2026-11-12"
category: "ai"
tags: ["model-routing", "amazon-bedrock", "kb-securities", "cost-optimization", "prompt-cache", "decision-model"]
---

# KB증권 Context Tier-Routing (AWS)

> 출처: [KB증권 AI 에이전트는 어떻게 최적의 모델을 선택할까? – Amazon Bedrock 기반 Context Tier-Routing](https://aws.amazon.com/ko/blogs/tech/kb-securities-ai-agent-optimal-model-selection/) (AWS 기술 블로그) · 정리일 2026-11-12
>
> **출처 한계**: `aws.amazon.com` egress 차단으로 원문을 직접 열지 못했다. WebSearch로는 "Context Tier-Routing"이라는 고유 명칭 자체는 찾지 못했다. KB증권이 Bedrock 기반 에이전트 플랫폼과 사내 통합 AI 에이전트 '깨비AI'를 운영하며 RAG 기반 지식 응답 구조를 AWS 행사에서 소개한 사실은 다른 보도로 교차확인했고, AWS 블로그 일반적으로 난이도별 모델 라우팅(Bedrock Prompt Router, Haiku/Sonnet/Opus 역할 분담)을 다룬 사례가 있다는 점도 확인했다. 이 글의 "Elevate-only 규칙" 같은 세부 메커니즘은 Slack 발췌문에만 의존했다.

## 한 줄 요약

**KB증권은 질의 난이도에 따라 최적의 LLM을 고르는 Tier-Routing 방식을 깨비AI(사내 통합 AI 에이전트)에 도입해, 작업 복잡도에 맞춰 모델을 유연하게 전환하면서도 한 번 상위 모델로 올라가면 다시 하향하지 않는 Elevate-only 규칙으로 프롬프트 캐시 효율을 높였다고 전해진다.**

## 핵심 포인트

- **난이도 기반 Tier-Routing**: 질의의 난이도에 따라 적합한 모델을 선택해, 작업 복잡도에 맞춰 모델을 전환함으로써 클라우드 비용 절감과 응답 시간 단축을 동시에 거둔다는 설계.
- ***"Elevate-only 규칙"*** — 한 번 상위 모델로 전환하면 다시 하향하지 않는다. 이는 프롬프트 캐시가 모델이 바뀔 때마다 무효화되는 비용을 막기 위한 장치로 읽힌다.
- **깨비AI 생태계**: KB증권의 사내 통합 AI 에이전트 '깨비AI'는 2026년 10월 기준 25개 AI 에이전트를 하나로 묶었다고 보도된 바 있어, Tier-Routing은 이 멀티 에이전트 체제 안에서 모델 선택 레이어 역할로 추정된다.

## 인상 깊은 문장

> "작업 복잡도에 맞춰 모델을 유연하게 전환하여 클라우드 비용 절감과 응답 시간 단축 효과를 거둠" (Slack 발췌)

## 댓글

AWS 기술 블로그 글로 hada/HN 큐레이션 대상이 아니며 자체 댓글 생태계가 없다. AWS·KB증권 공동 사례 소개 형식이라 양측의 이해관계(Bedrock 도입 성과 홍보)가 있다는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "닫힌 선택지 분류"와 "열린 추론"을 가르는 라우팅 설계는 반복되는 패턴이다

[[2026-11-07-opus-jev-cost-routing]]의 Opus-Jev 비용 라우팅, [[2026-11-06-kakao-kanana-2-v-decide-decision-model]]의 결정 모델, [[2026-09-12-nvidia-switchyard-llm-router]]의 라우터 설계와 같은 축이다. 금융권까지 이 "난이도별 라우팅 + 캐시 보존"이라는 조합이 퍼졌다는 건, 이게 이제 업계 표준 패턴으로 수렴하고 있다는 신호다.

### 핵심 전이 2 — Elevate-only 규칙은 "캐시 무효화 비용"을 라우팅 설계에 명시적으로 반영한 사례

단순히 "난이도에 맞는 모델을 고른다"가 아니라 "한 번 올리면 안 내린다"는 비대칭 규칙을 둔 건, 모델 전환 자체의 숨은 비용(프롬프트 캐시 리셋)을 설계에 반영했다는 뜻이다. 라우팅을 설계할 때 모델 선택 비용뿐 아니라 "전환 비용"까지 고려해야 한다는 교훈으로 일반화할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 챗봇/문의 분류도 난이도가 제각각이다(단순 FAQ부터 복잡한 환불 정책 해석까지). KB증권식 Tier-Routing + Elevate-only 규칙을 적용하면, 단순 문의는 저비용 모델로 처리하고 복잡한 문의로 판단되면 상위 모델로 올라간 뒤 그 세션 안에서는 다시 내려가지 않게 해 캐시 효율과 응답 일관성을 동시에 챙길 수 있다.

## 연관 자료

- [[2026-11-07-opus-jev-cost-routing]] — 비용 기준 모델 라우팅의 또 다른 사례
- [[2026-11-06-kakao-kanana-2-v-decide-decision-model]] — 닫힌 선택지 분류용 결정 모델
- [[2026-09-12-nvidia-switchyard-llm-router]] — LLM 라우터 설계 선행 사례

## 한 달 뒤 회고

*(2026-12-12 즈음 — "Context Tier-Routing"이라는 명칭의 공식 자료를 추가로 찾았는지, Elevate-only 규칙류의 비대칭 라우팅을 CRS 문의 분류 설계에 검토했는지 확인한다.)*
