---
title: "하나의 플랫폼으로 두 가지 에이전트 런타임 운영하기: 웅진씽크빅의 Amazon Bedrock AgentCore 및 Amazon EKS 기반 플랫폼 구축기 (AWS) — 관리형 런타임과 자체 운영 런타임을 동시에 쓰는 선택 자체가 이미 하나의 아키텍처 결정이다"
source_title: "하나의 플랫폼으로 두 가지 에이전트 런타임 운영하기: 웅진씽크빅의 Amazon Bedrock AgentCore 및 Amazon EKS 기반 플랫폼 구축기"
source_url: "https://aws.amazon.com/ko/blogs/tech/woongjin-thinkbig-agent-platform/"
source_name: "AWS 기술 블로그 (한국)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "미확인 (2026-11 초 추정, Slack 공유일 2026-11-09 기준)"
summarized_at: "2026-11-09"
category: "ai"
tags: ["bedrock-agentcore", "eks", "agent-runtime", "platform-architecture", "woongjin-thinkbig", "source-limitation"]
---

# 하나의 플랫폼으로 두 가지 에이전트 런타임 운영하기 (AWS, 웅진씽크빅)

> 출처: [하나의 플랫폼으로 두 가지 에이전트 런타임 운영하기](https://aws.amazon.com/ko/blogs/tech/woongjin-thinkbig-agent-platform/) (AWS 기술 블로그) · 정리일 2026-11-09
> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 차단되어 원문을 전혀 열지 못했다. Slack 발췌에도 불릿이 없고 제목만 공유되어(thread 1 reply 존재하나 내용 미확인), WebSearch로도 웅진씽크빅 고유 사례를 찾지 못했다 — 이번 배치 중 확인 수준이 가장 낮은 노트다.

## 한 줄 요약

**웅진씽크빅이 Amazon Bedrock AgentCore(관리형)와 Amazon EKS(자체 운영) 두 에이전트 런타임을 하나의 플랫폼 위에서 함께 운영하기로 한 것은, "관리형이냐 자체 구축이냐"를 양자택일이 아니라 워크로드별로 나눠 쓰는 쪽이 유리하다고 판단했다는 신호다.**

## 핵심 포인트

- 제목이 명시하는 핵심 결정은 ***"하나를 고르지 않고 두 런타임을 동시에 운영"***하는 것 자체다. Slack에 공유된 내용은 제목뿐이라 본문 수치·세부 아키텍처는 확보하지 못했다.
- (배경지식, 이 글의 내용 아님) AWS Builder Center의 별도 글("Running AI agents on EKS vs Amazon Bedrock AgentCore: A Well-Architected Perspective")은 두 선택지를 배포·보안·재해복구·비용·성능 축으로 비교한다 — 이 웅진씽크빅 사례가 그 비교를 구체적으로 어떻게 적용했는지는 원문 미확인.
- (배경지식) AgentCore는 2025-10 GA(정식 출시)된 관리형 서비스로, 모델 선택의 자유와 필요한 서비스만 골라 쓰는 조립식 구조가 특징이라고 AWS 공식 자료는 설명한다 — 이 사례 고유 정보는 아니다.

## 인상 깊은 문장

원문 접근 불가로 인용할 문장을 확보하지 못했다.

## 댓글

TechArticles 봇의 직공유로 추정되며 GeekNews 경유가 아니다. hada 댓글·HN·Lobsters 큐레이션 대상이 아니다. thread 1 reply가 있다고 표시되나 내용은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "관리형 vs 자체운영"은 흑백 선택이 아니라 혼합이 기본값이 되고 있다

이 가든은 이미 [[2026-11-02-aws-bedrock-agentcore-gitops-eks]]에서 AgentCore+EKS+GitOps 조합을 다뤘고, [[2026-09-04-samsung-agentcore-aiops-01]], [[2026-10-06-gs-energy-smus-agentcore-data-platform]] 등 여러 국내 기업의 AgentCore 채택 사례를 쌓아왔다. 웅진씽크빅 사례가 특이한 건 "AgentCore로 전환"이 아니라 "AgentCore와 EKS를 같은 플랫폼에서 공존"시킨다는 틀이다 — 다만 본문을 확보하지 못해 실제로 어떤 워크로드를 어느 런타임에 배정했는지는 추정에 그친다.

### 핵심 전이 2 — 원문 없이 제목만으로 노트를 쓰는 것의 함정

이 노트는 가든의 품질기준이 가장 약하게 지켜진 경우 중 하나다. 제목 자체가 거의 유일한 근거라, "왜 두 런타임을 같이 쓰는가"에 대한 저자의 실제 이유(비용? 기존 자산 재사용? 특정 워크로드의 지연시간 요구?)는 전혀 알 수 없다. 추측으로 채우지 않고 빈 칸으로 남겨두는 것도 핵심 전이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 온다 CRS/채널매니저도 향후 에이전트 자동화를 도입할 때 "관리형 에이전트 서비스로 전부 교체" 대신 "기존 EKS 기반 배치 작업 + 관리형 에이전트 런타임을 특정 워크로드(예: 요금 모니터링)에만 선별 도입"하는 혼합 전략을 참고할 수 있다. 다만 원문 세부가 없어 깊이 있는 참고는 어렵다.

## 연관 자료

- [[2026-11-02-aws-bedrock-agentcore-gitops-eks]] — AgentCore+EKS+GitOps를 함께 다룬 선행 노트, 같은 조합의 다른 사례
- [[2026-09-04-samsung-agentcore-aiops-01]] — 국내 기업의 AgentCore 채택 사례
- [[2026-10-06-gs-energy-smus-agentcore-data-platform]] — 국내 기업의 AgentCore 데이터 플랫폼 적용 사례

## 한 달 뒤 회고

- 2026-12-09 즈음 점검: `aws.amazon.com` 접근이 복구되면 원문에서 두 런타임의 실제 워크로드 분배 기준과 전환 이유를 확인.
