---
title: "NVIDIA Auto Ontology, 기업 데이터의 의미와 관계를 AI 에이전트에 연결하는 오픈소스 도구(GeekNews) — 온톨로지 생성은 자동화됐지만 검증 책임은 그대로 사람에게 남는다"
source_title: "Building an Agent Knowledge Foundation"
source_url: "https://developer.nvidia.com/topic/ai/agent-knowledge-foundation/"
source_name: "NVIDIA Developer"
referrer_url: "https://news.hada.io/topic?id=36528"
published_at: "2026-10-21"
summarized_at: "2026-11-04"
category: "ai"
tags: ["nvidia", "auto-ontology", "semantic-layer", "agent-knowledge-foundation", "mcp", "enterprise-data"]
---

# NVIDIA Auto Ontology, 기업 데이터의 의미와 관계를 AI 에이전트에 연결하는 오픈소스 도구(GeekNews)

> 출처: [Building an Agent Knowledge Foundation](https://developer.nvidia.com/topic/ai/agent-knowledge-foundation/) (NVIDIA Developer) · GeekNews 경유 · 정리일 2026-11-04
>
> **출처 한계**: news.hada.io는 이 세션에서 egress 차단으로 직접 열람하지 못했다. NVIDIA Developer 페이지도 직접 열람하지 못해, TheNewStack·letsdatascience·alphasignal·besthub 등 복수 매체의 WebSearch 보도를 종합했다. "90%" 수치의 측정 기준(테스트 환경·데이터 규모)은 어느 매체에서도 구체적으로 확인하지 못했다.

## 한 줄 요약

**NVIDIA가 기업 데이터의 업무 용어·지표·관계를 자동으로 정리해 온톨로지(시맨틱 레이어)를 생성하는 오픈소스 도구 Auto Ontology를 Agent Knowledge Foundation의 일부로 공개했다 — 자연어 질문을 SQL로 변환해 실행하고 MCP·CLI·API로 에이전트에 연결하지만, "읽기 전용"이 곧 데이터 접근 위험의 제거를 의미하진 않는다.**

## 핵심 포인트

- Apache-2.0 오픈소스로, FastAPI 백엔드·Next.js 프런트엔드·PostgreSQL(pgvector) 구조이며 ***Databricks, Postgres, Snowflake, DuckDB***에 연결할 수 있다.
- 자연어 질문을 ***SQL로 변환해 직접 실행***하며, 업무 정의와 데이터 계보에 대조해 검증하고 답변의 출처를 함께 제시한다.
- NVIDIA 자체 테스트에서 ***온톨로지 구축 시간을 90% 줄였다***고 주장한다 — 제3자 독립 벤치마크는 아직 없다.
- ***MCP, CLI, API***로 에이전트와 연결되며, 기존에 쓰던 온톨로지·의미 모델과도 연동할 수 있다.
- Palantir, Databricks, Snowflake와 초기 협력 관계를 맺었고, ***데이터를 이동하거나 거버넌스 체계를 바꾸지 않고도*** 도입할 수 있다고 홍보한다.

## 인상 깊은 문장

> "NVIDIA says this reduced ontology creation time by 90% in NVIDIA testing." — WebSearch 종합(복수 매체 보도 재구성, 원문 직접 열람 못함)

## 댓글

GeekNews hada 댓글 수는 확인하지 못했다(news.hada.io 접근 차단). WebSearch로 찾은 복수 매체 보도는 "90%"를 NVIDIA 테스트 결과 또는 벤더 테스트로 다르게 표현해 미묘한 차이가 있었고, 한 리뷰어는 독립적인 프로덕션 벤치마크가 아직 없다고 지적했다. **이해관계**: NVIDIA가 자사 에이전트 생태계(Nemotron Retriever, Kumo, CUDA-X)를 함께 홍보하는 발표라, 효과가 낙관적으로 제시됐을 가능성이 있다.

## 내 생각 · 적용점

**핵심 전이 — 시맨틱 레이어 "생성"은 빨라져도 "검증" 책임은 그대로 사람에게 남는다.** [[2026-10-31-can-ai-data-agents-do-real-analysis]]는 시맨틱 레이어를 제공하면 에이전트 정확도가 크게 오르지만 "그 레이어를 누가 그리고 관리하느냐"의 문제는 여전히 중요하다고 결론 냈다. Auto Ontology는 바로 그 레이어의 **초안 생성**을 자동화한 시도지만, 생성 이후 업무 전문가가 검증·인증하는 단계가 필수로 남아 있다는 점에서 저 노트의 결론을 뒤집지 못한다 — 만드는 속도는 빨라졌어도, 맞는지 확인하는 일은 자동화되지 않았다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 있다.** CRS의 예약·요금·채널·재고 데이터는 테이블과 용어가 파편화돼 있어 AI 에이전트가 자연어로 질의하기 어려운 경우가 많다. Auto Ontology 같은 "자동 초안 생성 + 전문가 검증" 2단계 접근은, 처음부터 수작업으로 시맨틱 레이어를 짜는 대신 초안을 빠르게 만들고 다듬는 방식으로 CRS 데이터 에이전트 파일럿의 착수 비용을 낮출 수 있다.

## 연관 자료

- [[2026-10-31-can-ai-data-agents-do-real-analysis]] — 시맨틱 레이어가 에이전트 정확도를 좌우한다는 같은 결론, Auto Ontology는 그 레이어 생성 자체를 자동화한 사례

## 한 달 뒤 회고

*(2026-12-04 즈음 — 실제 프로덕션 도입 사례나 독립 벤치마크가 나오면 "90%" 수치를 검증하고, 검증 단계에 실제로 드는 사람의 시간도 확인한다.)*
