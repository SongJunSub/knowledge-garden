---
title: "한국일보, Bedrock AgentCore Gateway로 사내 MCP 게이트웨이 구축 (AWS 한국 기술 블로그) — 도구마다 따로 하던 인증을 중앙 게이트웨이 하나로 모으면 그게 감사 로그가 된다"
source_title: "Claude에서 사내 데이터를 안전하게: 한국일보의 Amazon Bedrock AgentCore Gateway 기반 사내 MCP 게이트웨이 구축기"
source_url: "https://aws.amazon.com/ko/blogs/tech/hankookilbo-agentcore-gateway-rbac/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "backend"
tags: ["mcp", "agentcore-gateway", "bedrock", "rbac", "access-control", "audit-log", "hankookilbo"]
---

# 한국일보, Bedrock AgentCore Gateway로 사내 MCP 게이트웨이 구축 (AWS 한국 기술 블로그)

> 출처: [Claude에서 사내 데이터를 안전하게: 한국일보의 Amazon Bedrock AgentCore Gateway 기반 사내 MCP 게이트웨이 구축기](https://aws.amazon.com/ko/blogs/tech/hankookilbo-agentcore-gateway-rbac/) (AWS 한국 기술 블로그) · Slack TechArticles 경유 · 정리일 2026-11-18
>
> **출처 한계**: `aws.amazon.com`은 이 세션에서 WebFetch가 `getaddrinfo ENOTFOUND`로 차단된다(과거 실행에서도 반복 확인). WebSearch로 "한국일보 AgentCore Gateway"를 찾아봤지만 이 기사 자체는 찾지 못했다 — 대신 AgentCore Gateway가 "에이전트가 도구를 찾고·접근하고·호출하는 중앙 MCP 도구 서버"로서 라우팅·인증·도구 관리를 한 지점에서 처리하는 실재 AWS 공식 기능임은 교차확인했다. 아래 핵심 포인트는 Slack 발췌 3줄이 유일한 1차 근거다.

## 한 줄 요약

**한국일보는 Amazon Bedrock AgentCore Gateway를 사내 MCP 게이트웨이로 세워, 회사 계정 연동 + 역할 기반 접근 제어(RBAC)로 데이터 보안과 접근성을 동시에 확보하고, 도구별로 따로 하던 인증 관리를 중앙화해 감사 로그까지 한곳에 통합했다.**

## 핵심 포인트

- **Bedrock AgentCore Gateway를 사내 MCP 게이트웨이로 사용** — 클로드(Claude) 에이전트가 사내 데이터·도구에 접근하는 경로를 이 게이트웨이 하나로 모았다.
- **회사 계정 연동 + 역할 기반 권한 제어(RBAC)** — ***데이터 보안과 접근성을 동시에 확보***하는 설계. 누가 어떤 도구에 접근 가능한지를 역할 단위로 관리한다.
- **중앙 집중식 게이트웨이로 도구별 인증 복잡성 해소** — 도구마다 따로 인증을 구현하던 방식에서, 게이트웨이 한곳이 인증을 떠안는 구조로 전환.
- **감사 로그 통합** — 중앙화된 지점이 곧 ***감사 추적의 단일 소스***가 된다는 점이 Slack 발췌의 핵심 암시(문장이 끊겨 구체 구현은 확인 못 함).

## 인상 깊은 문장

> (Slack 발췌가 기능 설명 위주로 끊겨, 저자의 직접 표현을 인용할 근거를 확보하지 못했다 — 원문 미열람으로 인용 생략.)

## 댓글

TechArticles 채널의 AWS 공식 블로그 직공유로, GeekNews/hada 경유가 아니다. 블로그 자체 댓글·HN/Lobsters 큐레이션 확인 불가. **"PASS" 아님을 명시**: RBAC와 감사 로그 통합이 실제로 어떤 수준(필드 단위? 도구 단위?)으로 구현됐는지는 원문 미확보로 전혀 검증하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "플랫폼이 접근 제어를 떠안는다"는 같은 결, 규모는 다르다

[[2026-10-12-uber-mcp-gateway-platform-design]]는 Uber가 800개 이상의 MCP 서버를 Registry(컨트롤 플레인)+Proxy Gateway(데이터 플레인)로 표준화한 사례를 다뤘다. 이번 한국일보 사례는 그보다 훨씬 작은 스케일이지만 같은 원리 — "도구별 산발적 인증은 조직 규모와 무관하게 깨진다"를 보여준다. Uber는 "발견≠공개"로 소유팀 승인을 거치는 거버넌스가 핵심이었고, 한국일보는 RBAC+감사 로그가 핵심이라는 점에서 같은 문제의 다른 해법 축을 보여준다.

### 핵심 전이 2 — 비밀 관리의 중앙화라는 공통 패턴

[[2026-11-17-bespin-ai-agent-auth-security-design]]의 "IAM 역할 기반 임시 자격증명으로 모델·저장소 접근을 함께 관리"하는 설계와, 이번 글의 "중앙 게이트웨이가 도구별 인증을 흡수"하는 설계는 같은 원칙의 다른 표현이다 — 장기 비밀을 여기저기 흩어두지 않고, 중앙화된 짧은 수명의 자격증명·권한 체계로 대체한다.

### 핵심 전이 3 — 감사 로그는 "사람 단위" 추적이 핵심

[[2026-09-29-sagemaker-studio-tip-access-grants-athena]]가 다룬 CloudTrail `onBehalfOf` 필드 — 공유 컴퓨팅 세션 뒤에서도 실제 행위자를 사람 단위로 드러내는 메커니즘 — 와 이번 글의 "감사 로그 통합"이 지향점은 같다. 게이트웨이가 중앙화됐다는 사실 자체보다, 그 로그가 "누가" 수준까지 내려가는지가 실질적 가치다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** CRS가 PMS·PG·OTA·채널매니저 등 다수 외부 시스템과 AI 에이전트를 연동할 때, 연동마다 따로 인증을 구현하면 어떤 연동이 어떤 데이터에 접근했는지 전사적으로 파악하기 어려워진다. 이 사례처럼 중앙 MCP 게이트웨이 + 역할 기반 접근 제어 + 통합 감사 로그 구조를 먼저 세우면, 신규 연동을 늘릴 때마다 인증을 재발명하지 않고 접근 이력도 한곳에서 추적할 수 있다. 다만 RBAC의 역할 정의·감사 로그의 보존 기준은 이 글만으로는 구체화되지 않아, 설계 원칙만 가져오고 세부는 AWS 공식 AgentCore Gateway 문서로 보완해야 한다.

## 연관 자료

- [[2026-10-12-uber-mcp-gateway-platform-design]] — 같은 "도구별 인증을 플랫폼이 흡수" 원리, 800개+ 서버 규모의 거울상
- [[2026-11-17-bespin-ai-agent-auth-security-design]] — 같은 배치 연속선, IAM 임시 자격증명 기반 보안 설계
- [[2026-09-29-sagemaker-studio-tip-access-grants-athena]] — 공유 환경에서 사람 단위 감사 추적이라는 같은 목표
- [[2026-11-18-gs-energy-bedrock-ai-hub]] — 같은 배치, 같은 "엔터프라이즈 Claude/Bedrock 거버넌스" 주제의 다른 축(비용·SSO)

## 한 달 뒤 회고

*(2026-12-18 즈음 — aws.amazon.com 접속 차단이 풀려 원문의 RBAC 역할 정의·감사 로그 구체 구현을 확인했는지, CRS 멀티벤더 연동에 이 패턴을 적용할 구체 후보가 생겼는지 점검.)*
