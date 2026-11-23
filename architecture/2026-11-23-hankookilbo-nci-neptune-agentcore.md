---
title: "한국일보 N.C.I, Neptune+Bedrock AgentCore 뉴스룸 이슈 그래프 (AWS 한국 기술 블로그, 원문 세션 네트워크 차단) — 그래프로 묶는 건 기사가 아니라 '이슈의 맥락'이다"
source_title: "Amazon Neptune과 Amazon Bedrock AgentCore로 만든 뉴스룸 이슈 그래프: 한국일보 N.C.I 구축 사례"
source_url: "https://aws.amazon.com/ko/blogs/tech/hankookilbo-journal-ontology-nci/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-23"
category: "architecture"
tags: ["bedrock", "agentcore", "neptune", "ontology", "knowledge-graph", "hankookilbo", "newsroom"]
---

# 한국일보 N.C.I, Neptune+Bedrock AgentCore 뉴스룸 이슈 그래프 (AWS 한국 기술 블로그)

> 출처: [Amazon Neptune과 Amazon Bedrock AgentCore로 만든 뉴스룸 이슈 그래프: 한국일보 N.C.I 구축 사례](https://aws.amazon.com/ko/blogs/tech/hankookilbo-journal-ontology-nci/) (AWS 한국 기술 블로그) · Slack TechArticles 경유 · 정리일 2026-11-23

> **출처 한계**: `aws.amazon.com`은 이 세션에서 WebFetch가 egress 차단되어 원문을 직접 읽지 못했다(과거 실행에서 반복 확인된 패턴, 이번에도 ENOTFOUND로 동일). WebSearch로는 이 기사 자체를 찾지 못했고, 같은 언론사(한국일보)가 이미 다른 AgentCore 사례로 가든에 한 번 등장한 적이 있다는 점과 Neptune+AgentCore 조합이 다른 업종(여행)에서 실재 검증된 패턴이라는 점으로만 기술적 타당성을 교차확인했다. N.C.I 그래프의 구체 스키마(노드·엣지 정의)와 수치는 Slack 발췌 수준을 넘어서지 못한다.

## 한 줄 요약

**한국일보는 Amazon Bedrock과 Neptune을 결합해 기사·전개·물음·후속 발제 간 관계를 그래프로 엮는 "뉴스룸 이슈 그래프(N.C.I)"를 만들었다 — 목표는 기사 하나를 잘 요약하는 게 아니라, 이슈가 어디서 와서 어디로 갈지를 편집회의 전에 시각적으로 보여주는 것이다.**

## 핵심 포인트

- 생성형 AI가 기사 내용을 기반으로 이슈를 분류하고, 거기서 파생될 ***후속 취재 발제를 직접 생성***한다.
- 그래프 데이터베이스(Neptune)로 기사·전개·물음·발제 간의 ***연결 고리와 근거 문장***을 시각적으로 제공한다.
- 목적은 관리자(데스크)가 이슈의 맥락을 빠르게 이해하고, ***놓치기 쉬운 후속 보도 의제***를 효율적으로 발굴하도록 돕는 것이다.
- Bedrock AgentCore가 파이프라인의 에이전트 실행 계층을, Neptune이 지속적인 관계 저장 계층을 맡는 전형적인 "생성 + 그래프 저장" 이중 구조다.

## 인상 깊은 문장

> (원문 직접 접속이 차단되어 저자의 1차 표현을 인용할 근거를 확보하지 못했다. Slack 발췌 범위를 벗어나는 인용은 지어내지 않는다.)

## 댓글

TechArticles 채널의 AWS 공식 블로그 직공유로, hada.io 경유가 아니다. 블로그 자체 댓글·HN/Lobsters 큐레이션 여부는 확인 불가. **"PASS" 아님을 명시**: 그래프의 실제 노드/엣지 스키마, "놓치기 쉬운 발제"를 얼마나 정확히 짚어내는지에 대한 정량 평가는 원문 미확보로 검증하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 패턴의 네 번째 반복, 그러나 도메인이 또 바뀌었다

가든에는 이미 Neptune+온톨로지로 개체 간 관계를 추론하는 사례가 세 번(물류 [[2026-11-10-eugene-group-neptune-ontology]], 금융상품 [[2026-11-20-miraeasset-bedrock-neptune-ontology]], 사내 지식 [[2026-11-19-naver-ontology-logistics-question-design]]) 쌓여 있었는데, 이번엔 뉴스룸 편집 도메인이다. 업종은 매번 바뀌지만 구조는 똑같다 — "그래프로 뭘 추적할지"를 먼저 정의하고 나서야 온톨로지가 의미를 갖는다. 같은 회사([[2026-11-18-hankookilbo-agentcore-gateway-rbac]], 사내 MCP 게이트웨이)가 AgentCore를 두 가지 다른 용도(권한관리·그래프생성)로 쓰고 있다는 것도 눈에 띈다 — 한 회사 안에서 AgentCore가 인프라 레이어로 자리잡는 속도를 보여준다.

### 적용점

"기사·전개·물음·발제"의 4종 관계는 CRS 맥락에서 "예약·클레임·리뷰·응대"로 바로 치환된다. 고객 불만이 생겼을 때 그게 어떤 예약 이력·어떤 채널·어떤 과거 응대와 연결되는지 그래프로 추적하면, 담당자가 "이 클레임 뒤에 무엇이 더 있을지" 미리 보게 할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 뉴스룸의 "이슈 그래프"를 CRS로 옮기면 "컴플레인 그래프"가 된다 — 리뷰·예약 변경 이력·고객센터 문의·채널별 노출을 하나의 그래프로 엮어, 특정 객실 타입이나 특정 채널에서 반복되는 불만 패턴을 사람이 놓치기 전에 드러낼 수 있다. 핵심은 AI가 "분류"만 하는 게 아니라 "다음에 확인해야 할 질문"까지 생성한다는 점이다.

## 연관 자료

- [[2026-11-18-hankookilbo-agentcore-gateway-rbac]] — 같은 언론사, 같은 AgentCore 계열이지만 용도는 권한관리(사내 MCP 게이트웨이)
- [[2026-11-20-miraeasset-bedrock-neptune-ontology]] — 같은 Neptune+온톨로지 패턴, 금융상품 도메인
- [[2026-11-10-eugene-group-neptune-ontology]] — 같은 패턴, 물류 도메인
- [[2026-11-19-naver-ontology-logistics-question-design]] — "질문이 설계를 이끈다"는 상위 원칙

## 한 달 뒤 회고

2026-12-23 즈음 — aws.amazon.com 접속 차단이 풀려 N.C.I 그래프의 실제 노드/엣지 스키마를 확인했는지, 뉴스룸 밖 도메인(컴플레인 그래프)에 같은 설계를 실제로 검토했는지 점검.
