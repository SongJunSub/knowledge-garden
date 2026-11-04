---
title: "Amazon Bedrock Managed Agents: OpenAI 에이전트를 AWS에서 운영하는 방법(AWS 기술 블로그) — 에이전트 구현 대신 IAM과 CloudTrail만 남는다"
source_title: "Amazon Bedrock Managed Agents: OpenAI 에이전트를 AWS에서 운영하는 방법"
source_url: "https://aws.amazon.com/ko/blogs/tech/bma-openai/"
source_name: "AWS 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/bma-openai/"
summarized_at: "2026-11-04"
category: "ai"
tags: ["aws", "bedrock", "openai", "codex", "managed-agents", "agentcore"]
---

# Amazon Bedrock Managed Agents: OpenAI 에이전트를 AWS에서 운영하는 방법(AWS 기술 블로그)

> 출처: [Amazon Bedrock Managed Agents: OpenAI 에이전트를 AWS에서 운영하는 방법](https://aws.amazon.com/ko/blogs/tech/bma-openai/) (AWS 기술 블로그) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-04
>
> **출처 한계**: 이 세션에서 aws.amazon.com 접근이 egress 차단으로 막혀 이 한국어 블로그 글 자체는 열람하지 못했다. Slack 본문 발췌와 스레드 답글로 핵심 내용을 확인하고, WebSearch로 영문 AWS 공지("Amazon Bedrock now offers OpenAI models, Codex, and Managed Agents", 2026년 4월 28일 게시)와 제품 페이지 설명을 교차 확인해 맥락을 보강했다. 단, 이 글이 4월 발표의 재소개 글인지 이후 GA 업데이트를 다루는 글인지는 구분하지 못했다.

## 한 줄 요약

**Amazon Bedrock Managed Agents(BMA)는 OpenAI의 Codex 하네스와 모델을 Amazon Bedrock AgentCore 위에서 실행해주는 관리형 서비스로, 개발자가 직접 구현해야 했던 모델 호출 루프·컨텍스트 관리·권한 설정을 AWS가 대신 처리하고 IAM·CloudTrail로 에이전트별 권한 관리와 감사 추적을 제공한다.**

## 핵심 포인트

- **핵심은 'Codex 하네스' 실행 루프의 자동화** — 기존에는 개발자가 모델 호출 루프, 대화 상태 유지, 컨텍스트 관리, 권한 설정 등을 ***직접 구현***해야 했지만, BMA는 이를 ***내부적으로 수행***하며 실제 명령은 고객 계정 내의 실행 환경에서 안전하게 실행된다.
- **OpenAI API 키 직접 관리 불필요** — 개발자는 ***AWS IAM 역할을 통해 보안을 유지***하고, ***CloudTrail을 통한 감사 기록***도 확보할 수 있어 OpenAI API 키를 직접 다룰 필요가 없다.
- **실행 환경 선택 가능, 프리뷰는 추가 비용 없음** — 실행 환경은 ***자체 호스팅 방식과 Amazon Bedrock AgentCore Runtime 중 선택*** 가능하며, 프리뷰 단계에서는 특정 리전에서 ***추가 비용 없이 모델 추론 및 리소스 사용료만*** 부과된다.
- **(WebSearch 보강) 2026년 4월 28일 제한적 프리뷰로 첫 발표** — AWS의 영문 "What's New" 공지에 따르면 OpenAI 모델, Codex, Managed Agents 세 가지가 함께 제한적 프리뷰로 공개됐고, OpenAI 측은 Codex를 "프론티어 코딩 하네스 및 제품군"으로 소개했다. 즉 BMA는 올해 4월 파트너십의 연장선에 있는 서비스다.

## 인상 깊은 문장

> "BMA의 핵심은 'Codex 하네스'라는 실행 루프입니다. 모델이 도구를 선택하고 결과를 처리하는 반복 과정을 BMA가 내부적으로 수행하며, 실제 명령은 고객 계정 내의 실행 환경에서 안전하게 실행됩니다." — Slack TechArticles 봇 스레드 답글(원문 발췌 재구성)

## 댓글

GeekNews를 거치지 않은 TechArticles 봇의 직링크라 hada 댓글은 없다. HN/Lobsters 큐레이션 여부는 확인 못함. **이해관계**: AWS·OpenAI 양사 제품을 조합한 AWS 공식 블로그 글로, 관리형 서비스의 실제 운영 비용·지연·실패 사례보다는 통합 편의성을 강조하는 홍보성 서술일 가능성이 높다.

## 내 생각 · 적용점

**핵심 전이 — "Codex를 AWS 거버넌스로 감싼다"는 이야기가 1년 가까이 이어지고 있다.** [[2026-06-01-openai-frontier-models-codex-on-aws]]가 올해 6월 "OpenAI 모델·Codex가 AWS에서 제공된다"는 공급자 차원 발표였고, [[2026-08-24-codex-on-bedrock-mantle]]은 8월 "Bedrock Mantle"이라는 두 번째 추론 엔드포인트로 Codex를 IAM·PrivateLink·CloudWatch로 감싸는 구체적 아키텍처였다. 이 글은 그 다음 단계 — 엔드포인트를 감싸는 것을 넘어 **에이전트 실행 루프 자체**(하네스)를 AWS가 관리형으로 대행하는 단계다. 매번 "개발자가 직접 구현하던 부분"이 한 단계씩 AWS 관리형 서비스로 흡수되는 패턴이 뚜렷하다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음.** CRS가 예약 변경·고객 응대 자동화에 Codex나 유사 에이전트를 쓴다면, 직접 하네스를 구현하는 대신 BMA처럼 관리형 실행 환경에 올려 IAM 기반 권한 분리와 CloudTrail 감사 기록을 확보하는 선택지가 있다. 단, 프리뷰 단계 서비스라 프로덕션 SLA·리전 가용성을 먼저 확인해야 한다.

## 연관 자료

- [[2026-08-24-codex-on-bedrock-mantle]] — Codex를 Bedrock 거버넌스로 감싸는 직전 단계(Bedrock Mantle 엔드포인트)
- [[2026-06-01-openai-frontier-models-codex-on-aws]] — OpenAI-AWS 파트너십의 최초 발표, 이 글이 잇는 같은 시리즈의 출발점

## 한 달 뒤 회고

*(2026-12-04 즈음 — aws.amazon.com 접근이 풀리면 BMA의 실제 GA 일정, 리전 확대, 프리뷰 이후 요금 정책을 보강한다.)*
