---
title: "웅진북클럽의 AI-Ready Data 기반 콘텐츠 추천 에이전트 구축기 Part 2 - Amazon Bedrock AgentCore로 그래프 에이전트 만들기 (AWS) — 지식그래프는 Part 1에서 만들고, 그 위에서 질의하는 에이전트는 Part 2에서 만든다"
source_title: "웅진북클럽의 AI-Ready Data 기반 콘텐츠 추천 에이전트 구축기 Part 2 – Amazon Bedrock AgentCore로 그래프 에이전트 만들기"
source_url: "https://aws.amazon.com/ko/blogs/tech/woongjin-ai-ready-data-graph-agent-part-2/"
source_name: "AWS 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "ai"
tags: ["woongjin", "bedrock-agentcore", "graph-agent", "amazon-neptune", "content-recommendation"]
---

# 웅진북클럽의 AI-Ready Data 기반 콘텐츠 추천 에이전트 구축기 Part 2 (AWS)

> 출처: [웅진북클럽의 AI-Ready Data 기반 콘텐츠 추천 에이전트 구축기 Part 2](https://aws.amazon.com/ko/blogs/tech/woongjin-ai-ready-data-graph-agent-part-2/) (AWS 기술 블로그) · 정리일 2026-11-26

> **출처 한계**: `aws.amazon.com`이 egress 차단되어 원문을 열람하지 못했다. WebSearch로 "웅진북클럽" 고유 사례는 확인하지 못했으나, Amazon Bedrock AgentCore와 Neptune을 결합해 그래프 기반 에이전트를 만드는 패턴 자체는 이 레포에 이미 여러 유사 사례([[2026-11-23-hankookilbo-nci-neptune-agentcore]] 등)가 있어 업계에서 반복되는 구조임이 확인된다.

## 한 줄 요약

**웅진북클럽이 Part 1에서 만든 Neptune 지식그래프를 Amazon Bedrock AgentCore로 그래프 에이전트화해, 사용자 질문을 분석하고 규칙 기반 즉시 응답과 그래프 조회 도구를 통한 근거 기반 응답을 상황에 맞게 나눠 생성하도록 설계했다는 연작의 완결편이다.**

## 핵심 포인트

- **AgentCore로 에이전트 설계·평가 체계 고도화** — Amazon Bedrock AgentCore를 도입해 에이전트 설계와 평가 체계를 고도화하고 옵저버빌리티를 확보했다는 서술.
- **질문 유형에 따른 두 가지 응답 경로** — 사용자 질문을 분석해 ***규칙 기반으로 즉시 응답***하거나, ***그래프 조회 도구를 통해 근거 기반의 답변***을 생성한다는 분기 구조 — 모든 질문을 LLM에 던지지 않고 빈도 높은 질문은 규칙으로 빠르게 처리한다는 비용·속도 최적화로 읽힌다.
- **Part 1과의 완결 구조** — [[2026-11-26-woongjin-bookclub-neptune-semantic-layer-part1]]에서 쌓은 시맨틱 레이어(콘텐츠 간 관계)를, 이 Part 2의 그래프 에이전트가 ***조회 도구***로 소비하는 구조다.
- **구체 성능 지표는 Slack 불릿에 없음** — 응답 정확도나 비용 절감률 등 정량 효과는 Slack 발췌에 담기지 않아 확인 불가.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함.)

## 댓글

AWS 기술 블로그 사례 공유 글이라 hada 댓글 생태계 밖. 벤더(AWS) 블로그이므로 AgentCore 도입의 성공 사례로만 서술됐을 가능성에 유의.

## 내 생각 · 적용점

### 핵심 전이 — Part 1과의 완결, 그리고 네이버 2부작과의 평행 구조

[[2026-11-26-woongjin-bookclub-neptune-semantic-layer-part1]](Part 1)에서 쌓은 시맨틱 레이어를 이 Part 2가 "그래프 조회 도구"로 노출해 에이전트가 쓰게 만드는 구조는, 같은 날 배치의 [[2026-11-26-naver-care-agent-mcp-agent-design-part2]](네이버 D2, Care AI 2부)가 1부의 지식그래프를 MCP로 노출하는 구조와 ***완전히 평행***하다. 두 회사가 독립적으로 "지식그래프 축적 → 노출/서빙"이라는 같은 2단계 아키텍처에 도달했다는 건, 이게 우연이 아니라 업계의 수렴하는 설계 패턴임을 보여준다. "규칙 기반 즉시 응답 vs 그래프 조회 근거 응답"이라는 분기도 [[2026-11-26-naver-care-agent-mcp-agent-design-part2]]의 "탐색·판단(모델) vs 검증·확정(코드)" 역할 분리와 같은 축이다.

### 적용점

"모든 질문을 LLM+그래프 조회로 보내지 않고, 빈도 높은 질문은 규칙으로 즉시 처리"하는 비용 최적화 패턴은 CRS 상담 에이전트 설계에도 바로 적용 가능한 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** [[2026-11-26-woongjin-bookclub-neptune-semantic-layer-part1]]의 CRS 적용점(패키지·업그레이드 관계의 그래프 모델링)에 더해, 이 Part 2는 "그 그래프를 실제로 조회하는 에이전트"를 어떻게 설계할지(규칙 vs 그래프 조회 분기)에 대한 구체적 패턴을 더한다. 둘을 합치면 CRS 추천/상담 에이전트의 완결된 참고 아키텍처가 된다.

## 연관 자료

- [[2026-11-26-woongjin-bookclub-neptune-semantic-layer-part1]] — 같은 연작 Part 1, 이 에이전트가 쓰는 지식그래프
- [[2026-11-26-naver-care-agent-mcp-agent-design-part2]] — 평행한 구조(지식그래프 축적→노출)의 다른 회사 사례
- [[2026-11-23-hankookilbo-nci-neptune-agentcore]] — Neptune+AgentCore 결합의 다른 산업 사례
- [[2026-11-09-woongjin-thinkbig-bedrock-agentcore-eks]] — 같은 그룹(웅진) 다른 계열사의 에이전트 런타임 사례

## 한 달 뒤 회고

2026-12-26 즈음 — 원문이 열리면 규칙 기반 응답과 그래프 조회 응답의 실제 분기 비율·정확도 지표를 확인한다.
