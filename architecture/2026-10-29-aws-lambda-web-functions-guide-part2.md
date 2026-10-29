---
title: "AWS Lambda Web Functions 실전 가이드 2부: Amazon Bedrock AgentCore Runtime V2 에이전트를 위한 BFF 구성 (AWS 기술 블로그) — 에이전트를 브라우저에서 직접 부르지 않고, 중간에 BFF를 끼워 보안과 세션을 가둔다"
source_title: "AWS Lambda Web Functions 실전 가이드 2부: Amazon Bedrock AgentCore Runtime V2 에이전트를 위한 BFF 구성"
source_url: "https://aws.amazon.com/ko/blogs/tech/lambda-web-functions-2/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-29"
category: "architecture"
tags: ["aws", "lambda", "web-functions", "bedrock-agentcore", "bff", "security", "session-management"]
---

# AWS Lambda Web Functions 실전 가이드 2부: Amazon Bedrock AgentCore Runtime V2 에이전트를 위한 BFF 구성 (AWS 기술 블로그)

> 출처: [AWS Lambda Web Functions 실전 가이드 2부](https://aws.amazon.com/ko/blogs/tech/lambda-web-functions-2/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-29

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 원글 불릿 3개 + 스레드 상세 답변 1개(완결된 문단)를 1차 자료로 썼다.

## 한 줄 요약

**브라우저에서 Amazon Bedrock AgentCore Runtime V2 에이전트를 직접 호출하면 보안·세션 관리가 위험해지므로, [[2026-10-29-aws-lambda-web-functions-guide-part1]]의 Lambda Web Functions를 BFF(Backend for Frontend) 계층으로 중간에 두어 입력값 검증과 세션 매핑을 담당시키라는 실전 가이드다.**

## 핵심 포인트

- **브라우저 직접 호출의 위험성** — 브라우저와 에이전트 런타임 사이에서 보안과 세션 관리를 담당하는 BFF 계층 구축이 필수적이라고 못 박는다. AgentCore Runtime V2를 브라우저에서 직접 호출하는 것은 ***보안 및 세션 관리 측면에서 위험***하다.
- **BFF의 세 가지 역할** — BFF는 사용자 인증, 입력값 검증, 세션 매핑, 그리고 에이전트 응답의 스트리밍 중계 역할을 수행한다. 특히 ***Web Functions는 에이전트 응답을 기다리는 대기 시간 동안 CPU 비용이 거의 발생하지 않아***, 일반적인 Event Functions보다 경제적이고 효율적인 아키텍처를 제공한다.
- **CloudFront와 연동한 보안 강화** — 도쿄 리전을 기준으로 한 이 구성은 CloudFront와 연동되어 보안성을 높이고, 안정적인 사용자 경험과 비용 최적화를 동시에 달성할 수 있다고 설명한다.

## 인상 깊은 문장

> "브라우저와 에이전트 런타임 사이에서 보안과 세션 관리를 담당하는 BFF 계층 구축이 필수적입니다." (Slack TechArticles 스레드 답변 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단). "위험하다"는 서술의 구체적 공격 시나리오(세션 하이재킹? 프롬프트 주입 경로 노출?)는 발췌에 명시되지 않아, 실제 위협 모델까지는 확인하지 못했다.

## 내 생각 · 적용점

**핵심 전이 — [[2026-10-29-aws-lambda-web-functions-guide-part1]]이 설명한 "활성 CPU 과금"이, 이 2부에서는 구체적으로 "에이전트 응답을 기다리는 동안 비용이 거의 안 든다"는 실전 이점으로 번역된다.** 1부는 일반론으로 "대기 시간은 과금 안 한다"고 했지만, 2부는 그 일반론이 정확히 어떤 워크로드에 유리한지를 짚는다 — LLM 에이전트처럼 추론에 수 초씩 걸리는 응답을 BFF가 중계할 때, 그 대기 시간 전체가 공짜라는 것이다. 또한 이 글은 "에이전트를 왜 프런트엔드에서 직접 부르면 안 되는가"라는, AI 제품을 만드는 누구나 마주치는 질문에 "BFF"라는 뻔하지만 종종 생략되는 답을 다시 확인시켜준다 — 데모 단계에서는 브라우저가 LLM API를 직접 호출하는 경우가 많지만, 프로덕션에서는 반드시 중계 계층이 필요하다는 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 챗봇·AI 컨시어지 기능을 웹/앱 프런트엔드에 노출한다면, 이 가이드의 핵심 원칙("에이전트 런타임을 브라우저에서 직접 부르지 말고 BFF로 가둬라")은 바로 적용 가능하다. 특히 세션 매핑 — 어떤 대화가 어떤 예약 건과 연결되는지 — 을 BFF 계층이 책임지게 하면, 에이전트 런타임 자체는 특정 고객·예약 정보를 직접 알 필요가 없어져 PII 노출 범위를 줄일 수 있다. 다만 실제 도입 전 AWS 외부의 BFF 패턴(API Gateway + Lambda 등)과 비용·운영 복잡도를 비교해야 한다.

## 연관 자료

- [[2026-10-29-aws-lambda-web-functions-guide-part1]] — 같은 시리즈 1부. 실행 모델·과금·CloudFront 구성의 일반론이 이 2부에서 AgentCore 에이전트라는 구체 사례로 좁혀진다.
- [[2026-10-27-igaworks-claire-agentcore-poc-part2]] — 같은 AgentCore Runtime 생태계, LangGraph 워크플로우를 어댑터로 이관한 프로덕션 사례와 비교할 만하다.

## 한 달 뒤 회고

2026-11-29 즈음, `aws.amazon.com` 접근이 풀렸다면 "위험하다"는 서술의 구체적 위협 모델(세션 하이재킹, 프롬프트 주입 경로 등)을 원문으로 확인하고, 실제 BFF 구현 코드 샘플이 공개됐는지 점검한다.
