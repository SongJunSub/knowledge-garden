---
title: "아이지에이웍스 클레어의 Agentic AI PoC 여정 1부 (AWS 기술 블로그) — 고정된 LangGraph 흐름을 그대로 둔 채, 실행 환경만 AgentCore로 옮긴 1개월 스프린트"
source_title: "아이지에이웍스 클레어의 Agentic AI PoC 여정: Amazon Bedrock AgentCore로 설계하고 평가하기 (1부)"
source_url: "https://aws.amazon.com/ko/blogs/tech/igaworks-claire-agentic-agent-with-amazon-bedrock-agentcore-part-1/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-27"
category: "ai"
tags: ["aws", "bedrock-agentcore", "igaworks", "claire", "dfinery", "langgraph", "cdp", "agentic-architecture", "poc"]
---

# 아이지에이웍스 클레어의 Agentic AI PoC 여정 1부 (AWS 기술 블로그)

> 출처: [아이지에이웍스 클레어의 Agentic AI PoC 여정: Amazon Bedrock AgentCore로 설계하고 평가하기 (1부)](https://aws.amazon.com/ko/blogs/tech/igaworks-claire-agentic-agent-with-amazon-bedrock-agentcore-part-1/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-27
>
> **출처 한계를 먼저 밝힌다.** `aws.amazon.com` 도메인 전체가 이 세션의 egress 정책상 차단돼 원문을 한 줄도 직접 읽지 못했다 — [[2026-09-04-samsung-agentcore-aiops-01]], [[2026-10-17-aws-bedrock-agentcore-sdbiosensor-data-analysis-agent]]에서 이미 반복된 것과 같은 제약이다. WebSearch로 "아이지에이웍스 클레어 Agentic AI PoC 디파이너리"를 검색해, 클레어(Claire)가 아이지에이웍스의 CDP 플랫폼 '디파이너리(Dfinery)'의 **Text-to-SQL/Chart 데이터 분석 에이전트**이며 SQL 지식이 없는 마케터도 데이터를 분석하게 하는 것이 목표라는 점, 2025 AI x Industry Week에서 "Text2SQL로 완성한 디파이너리의 데이터 분석 에이전트"로도 발표됐다는 점은 교차확인했다. 다만 이 글이 AgentCore를 구체적으로 어떻게 썼는지에 대한 제3자 독립 서술은 찾지 못했고, 아래 내용은 **Slack 요약 3줄 + 스레드 상세 답글 1개**가 1차 근거다.

## 한 줄 요약

**아이지에이웍스가 CDP 플랫폼 '디파이너리'의 AI 분석 에이전트 '클레어'의 한계(고정된 LangGraph 워크플로우라 복잡한 질문·동시 요청 처리에 취약)를 해결하려, 1개월 집중 스프린트 동안 기존 워크플로우 로직은 그대로 두고 실행 환경만 Amazon Bedrock AgentCore Runtime으로 이관해 LLM이 도구를 자율적으로 선택·조합하는 에이전트 아키텍처와 평가 기반 개선 루프를 검증한 PoC다.**

## 핵심 포인트

- **고정 워크플로우의 한계** — 기존 클레어는 ***고정된 워크플로우를 따르는 결정론적 구조***라, 복잡한 사용자 질문 대응과 동시 요청 처리에 한계가 있었다. 미리 정해진 분기만 따라가는 구조이다 보니, 질문이 그 분기를 벗어나면 대응하지 못했다는 뜻으로 읽힌다.
- **AgentCore 도입 = LLM의 자율적 도구 선택** — 'Amazon Bedrock AgentCore'는 ***LLM이 도구를 자율적으로 선택하고 조합하는 에이전트 아키텍처***를 지원한다. 사람이 미리 정한 분기 대신, 모델이 상황에 맞춰 어떤 도구를 쓸지 스스로 판단하게 하는 전환이다.
- **1개월 스프린트, 로직은 유지하고 실행 환경만 이관** — 1개월간의 ***집중 스프린트***를 통해, 기존 LangGraph 워크플로우 **로직 자체는 유지**하면서 실행 환경을 AgentCore Runtime으로 옮겨 확장성·유연성을 확보했다. 처음부터 새로 짜지 않고 기존 자산을 재활용하는 이관 전략이다.
- **에이전트별 독립 실행 + 평가 기반 개선 루프** — 에이전트별 독립적인 실행 모델과 ***평가 기반의 개선 루프***를 구축해, 고정된 흐름에서 벗어나 다양한 데이터 소스를 유기적으로 결합하는 지능형 에이전트로 전환할 가능성을 입증했다.
- **3A 프로그램을 통한 설계·평가** — 3A 프로그램을 통해 LLM이 도구를 자율적으로 선택하는 구조를 설계하고 평가 기반 개선 루프를 검증했다는 언급이 있으나, Slack 발췌에 "3A 프로그램"의 구체적 정의(AWS의 특정 프로그램명인지 사내 명칭인지)는 없어 확인하지 못했다.

## 인상 깊은 문장

> "기존의 결정론적 방식에서 벗어나 복합적인 사용자 질문을 유연하게 처리할 수 있는 구조로 전환함." (Slack TechArticles 봇 스레드 상세 발췌 재구성)

"결정론적"이라는 단어를 정확히 짚은 지점이 눈에 띈다 — 이 글이 문제 삼는 것은 "느리다"나 "비싸다"가 아니라, 미리 정해둔 분기 바깥의 질문에 대응하지 못한다는 **유연성의 부재**다.

## 댓글

AWS 기술 블로그는 자사 솔루션(Bedrock AgentCore)을 쓴 고객 사례라, hada 댓글 수나 HN/Lobsters 큐레이션이라는 개념이 적용되지 않는다(GeekNews 경유가 아니라 Slack TechArticles 봇이 직접 수집). AWS와 아이지에이웍스 둘 다 **이 전환을 성공 사례로 포장할 유인**이 있다는 점은 감안해야 한다 — AWS는 AgentCore 채택 사례를, 아이지에이웍스는 자사 기술력을 알릴 이유가 있다. "1개월 스프린트로 검증했다"는 서사도 실제 프로덕션 투입까지의 과정(2부에서 다룬다고 밝힘)과는 별개로, PoC 단계의 낙관적 요약일 가능성을 감안해야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-04-samsung-agentcore-aiops-01]]·[[2026-10-17-aws-bedrock-agentcore-sdbiosensor-data-analysis-agent]]와 함께, 가든에 쌓이는 "한국 기업 + AWS Bedrock AgentCore 도입 사례" 장르의 또 한 편이다.** 이 장르의 공통 패턴이 이 글에서도 그대로 보인다 — ①AWS 기술 블로그가 Slack으로 직접 공유되고(GeekNews 경유가 아님), ②`aws.amazon.com`이 매번 egress 차단으로 원문을 못 읽고, ③그런데도 "기존 결정론적 구조의 한계 → AgentCore로 유연성 확보"라는 거의 같은 서사 구조가 반복된다. 삼성 AIOps 글이 "분석은 에이전트, 실행은 사람"이라는 안전장치를 강조했던 것과 달리, 이 글은 **안전장치보다 유연성 확보**에 서사의 무게가 실려 있다는 점이 차이다 — 다만 이 차이가 실제 아키텍처의 차이인지, 단순히 이 글이 1부(설계·평가)이고 운영상의 안전장치는 2부에서 다룰 가능성 때문인지는 2부를 봐야 분명해진다.

**핵심 전이 2 — 기존 로직을 재작성하지 않고 실행 환경만 바꾼다는 전략이, 이 가든의 "하네스 vs 모델" 구분과 정확히 들어맞는다.** [[2026-05-18-musinsa-query-engineer-harness]]가 확정한 "Agent = Model + Harness"라는 등식을 이 글에 적용하면, 클레어 팀이 바꾼 것은 **하네스(실행 환경)**이고 **모델이 할 일(LangGraph 워크플로우 로직)**은 그대로 뒀다는 것이 이 글의 핵심 선택이다. 재작성 비용을 최소화하면서 아키텍처 유연성을 얻는 전략으로, "모델 로직과 실행 환경을 분리해서 생각하라"는 하네스 엔지니어링 원칙의 또 다른 실무 사례다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성이 있다.** 온다 CRS의 예약·요금·채널 연동 데이터 분석에도 "마케터·운영자가 SQL 없이 자연어로 데이터를 질문한다"는 클레어와 같은 종류의 수요가 있을 수 있다. 이 글이 보여준 "기존 워크플로우 로직은 유지하고 실행 환경만 바꾼다"는 이관 전략은, CRS가 이미 돌리고 있는 데이터 분석 로직이 있다면 전면 재작성 없이 유연성을 확보하는 저risk 전환 경로로 참고할 만하다. 다만 AgentCore 자체는 AWS 특정 서비스라 온다의 클라우드 전략(AWS 사용 여부)에 따라 직접 적용 가능성이 달라지므로, 이 글의 결론은 "Bedrock AgentCore를 쓰라"가 아니라 "로직과 실행 환경을 분리해서 이관하라"는 더 일반화된 원칙으로 받아들이는 게 안전하다.

## 연관 자료

- [[2026-10-27-igaworks-claire-agentcore-poc-part2]] — 같은 시리즈 2부. 이 PoC가 실제 프로덕션으로 이관되는 운영 경험을 다룬다
- [[2026-09-04-samsung-agentcore-aiops-01]] — 같은 장르("한국 기업 + AWS Bedrock AgentCore" 도입 사례, AWS 도메인 차단이 반복되는 패턴)의 다른 사례
- [[2026-10-17-aws-bedrock-agentcore-sdbiosensor-data-analysis-agent]] — 같은 장르의 또 다른 사례(데이터 분석 에이전트라는 용도까지 클레어와 겹침)
- [[2026-05-18-musinsa-query-engineer-harness]] — "Agent = Model + Harness" 등식. 이 글이 보여준 "로직은 유지, 실행 환경만 전환"이 그 등식의 실무 적용

## 한 달 뒤 회고

2026-11-27 즈음, `aws.amazon.com` 접근이 풀렸다면 원문으로 "3A 프로그램"의 정확한 정의와 1개월 스프린트의 구체적 성과 지표(응답 시간·정확도 등)를 확인하고, 2부에서 다룬 프로덕션 이관 결과가 이 PoC의 낙관적 전망과 얼마나 일치했는지 대조한다.
