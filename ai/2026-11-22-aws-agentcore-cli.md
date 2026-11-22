---
title: "AgentCore CLI (AWS) — Kiro·Claude Code 연동은 아직 MCP 서버 경유일 뿐, CLI 자체의 '풀 연동'은 공식 발표 시점에 예정 단계였다"
source_title: "AgentCore CLI로 AI 에이전트 개발부터 배포까지 - Kiro CLI, Claude Code와 함께 쓰는 워크플로우"
source_url: "https://aws.amazon.com/ko/blogs/tech/bedrock-agentcore-cli/"
source_name: "AWS 한국 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/bedrock-agentcore-cli/"
published_at: "확인 불가"
summarized_at: "2026-11-22"
category: "ai"
tags: ["aws", "bedrock-agentcore", "cli", "cdk", "claude-code", "mcp"]
---

# AgentCore CLI (AWS) — Kiro·Claude Code 연동은 아직 MCP 서버 경유일 뿐, CLI 자체의 '풀 연동'은 공식 발표 시점에 예정 단계였다

> 출처: [AgentCore CLI로 AI 에이전트 개발부터 배포까지](https://aws.amazon.com/ko/blogs/tech/bedrock-agentcore-cli/) (AWS 한국 기술 블로그) · 정리일 2026-11-22

## 한 줄 요약

**AWS가 공개한 AgentCore CLI(`npm install -g @aws/agentcore`)는 프로젝트 생성·배포·운영을 터미널로 통합하고 내부적으로 `@aws/agentcore-cdk`(AWS CDK)로 IaC 배포하는 도구로, TUI와 비대화형 모드를 모두 지원해 CI/CD 연동이 쉽지만, Kiro CLI/Claude Code와의 "결합"은 CLI 자체 기능이 아니라 별도 컴포넌트인 AgentCore MCP 서버를 통한 연동이다.**

## 핵심 포인트

- **TechArticles 봇이 올린 직접 링크**(GeekNews 아님) — AWS 한국 블로그 원문이지만, 이 세션 네트워크에서 `aws.amazon.com` 도메인 자체가 DNS 레벨로 막혀 WebFetch 직접 확인 실패. 조사는 WebSearch로 교차확인한 AWS 공식 docs·발표 기준.
- AgentCore CLI는 **프로젝트 생성부터 배포·운영까지 전체 수명 주기를 터미널로 통합**, `@aws/agentcore-cdk`(AWS CDK 기반)로 에이전트 인프라를 IaC로 관리.
- **TUI와 비대화형 모드**를 모두 지원해 개발자가 직접 쓰거나 CI/CD 파이프라인에 연동하기 쉬움.
- ***"Kiro CLI나 Claude Code와 결합해 AI 에이전트 개발 워크플로우를 자동화"***라는 Slack 발췌는 절반만 정확 — WebSearch로 확인한 AWS 공식 발표 시점 기준으로 Kiro는 "Kiro Power"로 AgentCore skills를 이미 지원했지만 Claude Code/Codex/Cursor 쪽은 "coming next week"(곧 지원)로 안내된 상태였다. 실제 연동 경로는 CLI 자체가 아니라 **AgentCore MCP 서버**(별도 컴포넌트)이고, 이는 Claude Code 등 MCP 클라이언트와 이미 호환.
- 발행일은 블로그 원문을 직접 열지 못해 미확인. 관련 AWS AgentCore 기능 발표는 2026-04 전후로 확인됨.

## 인상 깊은 문장

(원문 블로그에 직접 접근하지 못해 1차 인용은 확보하지 못했다.)

## 댓글

GeekNews 경유가 아니라 TechArticles 봇의 직접 링크라 hada 댓글 수 자체가 존재하지 않는다. HN/Lobsters 동시 게재 여부는 WebSearch로 확인되지 않았다. **출처 한계가 이번 배치에서 가장 크다** — 원문 블로그를 세션 네트워크에서 전혀 열지 못해 "코딩 에이전트로 LLM 추론 구현" 같은 구체 사용 예시·코드는 전혀 확보하지 못했고, Slack 발췌와 AWS 공식 docs 수준의 교차확인만으로 정리했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "에이전트 전체 수명주기를 CLI로 통합"은 이미 가든에 누적된 AgentCore 배포 흐름의 다음 단계

[[2026-08-23-claude-code-bedrock-agentcore-deployment]]에서 Claude Code로 AgentCore에 배포하는 흐름을 이미 다뤘는데, 이번 AgentCore CLI는 그 배포 과정 자체를 (Console 클릭이 아니라) 코드/CLI로 표준화하려는 시도다. "배포를 코드로" 흐름이 AWS 쪽에서도 굳어지고 있다.

### 핵심 전이 2 — "coming next week"급 연동 발표는 발표 시점의 완성도를 과신하면 안 된다

Astra/Sol 벤치마크 건과 마찬가지로, 벤더의 "A와 B가 결합된다"는 발표 문구는 실제로는 "예정"일 수 있다. [[2026-11-20-gemini-4-neon-official-release-correction]]에서 봤듯 AI 제품 발표는 단계별 롤아웃이 흔하므로, 연동 발표를 읽을 때는 "지금 쓸 수 있는 것"과 "곧 올 것"을 구분해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 호텔 CRS 쪽에서 AI 에이전트(예약 조회, 요금 비교)를 운영에 올릴 때 "배포 전체를 CLI/IaC로 관리"하는 패턴은 그대로 참고할 만하다 — 콘솔 클릭 기반 배포는 변경 추적이 안 되지만, CDK 기반 IaC는 배포 변경사항이 코드 리뷰 대상이 된다. 단, MCP 서버 연동처럼 "곧 지원"이라는 벤더 발표는 실제 가용 여부를 직접 확인 후 반영해야 한다.

## 연관 자료

- [[2026-08-23-claude-code-bedrock-agentcore-deployment]] — *Claude Code로 AgentCore에 배포하는 선행 사례, 이번 CLI는 그 배포 과정의 표준화*
- [[2026-10-16-strands-harness-sdk]] — *AWS 에이전트 개발 생태계의 다른 축(SDK), CLI는 배포 축*
- [[2026-11-21-anthropic-building-always-on-agents]] — *에이전트 운영 인프라를 다루는 같은 결의 최근 노트*

## 한 달 뒤 회고

*(2026-12-22 즈음 — Claude Code/Codex 연동이 실제로 "coming next week" 약속대로 됐는지, AgentCore CLI 실사용 후기가 쌓였는지 확인.)*
