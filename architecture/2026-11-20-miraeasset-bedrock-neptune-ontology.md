---
title: "미래에셋증권, Bedrock+Neptune으로 상품지식 온톨로지 구축 (AWS 한국 기술 블로그) — 권위·추적성·확장성·의미, 네 가지 데이터 요건이 먼저다"
source_title: "Amazon Bedrock 및 Amazon Neptune을 이용한 미래에셋증권의 상품지식 온톨로지 및 상품AI검색 서비스 구축기"
source_url: "https://aws.amazon.com/ko/blogs/tech/miraeasset-sercurites-knowledgedb-ontology/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "architecture"
tags: ["bedrock", "neptune", "ontology", "graphrag", "knowledge-graph", "miraeasset"]
---

# 미래에셋증권, Bedrock+Neptune으로 상품지식 온톨로지 구축 (AWS 한국 기술 블로그)

> 출처: [Amazon Bedrock 및 Amazon Neptune을 이용한 미래에셋증권의 상품지식 온톨로지 및 상품AI검색 서비스 구축기](https://aws.amazon.com/ko/blogs/tech/miraeasset-sercurites-knowledgedb-ontology/) (AWS 한국 기술 블로그) · Slack TechArticles 경유 · 정리일 2026-11-20
>
> **출처 한계**: `aws.amazon.com`은 이 세션에서 WebFetch가 egress 차단되어 원문을 직접 읽지 못했다(과거 실행에서도 반복 확인된 패턴). WebSearch로 찾은 2차 보도(Daum, "AWS로 진화한 미래에셋증권 AI 검색")로 핵심 수치 하나만 교차확인했고, 온톨로지·Neptune 그래프의 구체 스키마는 Slack 발췌 3줄과 이 2차 보도 수준에 그친다.

## 한 줄 요약

**미래에셋증권은 정형·비정형 데이터를 통합한 AI-Ready 데이터 체계 위에 Bedrock+Neptune 기반 지식 온톨로지를 쌓아 상품 간 관계를 추론하는 검색 서비스를 만들었고, 2차 보도 기준 AI 검색 정답률이 45%에서 84.7%로 올랐다.**

## 핵심 포인트

- AI 프로젝트 성공을 위해 ***정형 데이터와 비정형 데이터를 통합한 AI-Ready 데이터 체계***를 먼저 구축했다(Slack 발췌).
- Amazon Bedrock과 Neptune을 결합해 상품 간 관계를 추적하는 지식 온톨로지 기반 검색 서비스를 구현했다.
- 자연어 질의와 복합 조건 검색으로 PB와 고객에게 정확한 투자 정보와 근거를 제시하는 환경을 마련했다.
- 2차 보도(Daum) 기준 ***AI 검색 정답률이 45%에서 84.7%로 상승***했다는 수치가 확인된다 — 1차 소스로는 검증하지 못했다.
- 법령·내부 업무 규칙처럼 "사람이 정한 제약"은 AI 모델과 별도로 관리하고, AI는 이를 참조해 답하도록 분리하는 설계 원칙이 보인다(일반적인 금융권 GraphRAG 구성과 일치).
- 보안 요건을 준수하며 온프레미스와 AWS를 연결한 하이브리드 클라우드 아키텍처로 구축했다.

## 인상 깊은 문장

> (원문 직접 접속이 차단되어 저자의 1차 표현을 인용할 근거를 확보하지 못했다. 2차 보도 기준 가장 명확한 수치 표현은 "정답률이 45%에서 84.7%로" 뿐이다.)

## 댓글

TechArticles 채널의 AWS 공식 블로그 직공유로, hada.io 경유가 아니다. 블로그 자체 댓글·HN/Lobsters 큐레이션 확인 불가. **"PASS" 아님을 명시**: 84.7%라는 수치가 1차 소스(AWS 블로그)에 실제로 있는지, 어떤 평가셋 기준인지는 원문 미확보로 검증하지 못했다. Neptune 온톨로지의 구체 스키마(노드/엣지 정의)도 확인 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 배치의 "질문이 먼저" 원칙과 Neptune 온톨로지 계열의 세 번째 사례

[[2026-11-19-naver-ontology-logistics-question-design]]가 "데이터 구조보다 먼저 어떤 질문에 답해야 하는지 분석"한다는 원칙을 세웠는데, 이번 글의 "권위·추적성·확장성·의미" 네 가지 AI-Ready 데이터 요건은 그 질문 중심 설계를 금융 도메인에서 구체화한 버전으로 보인다. [[2026-11-10-eugene-group-neptune-ontology]]와 함께 Neptune+온톨로지로 상품/개체 간 관계를 추론하는 패턴이 레포에 세 번째로 쌓였다 — 업종은 다르지만(물류·금융) 같은 그래프 기반 지식층 접근이 반복 확인되는 셈이다.

### 적용점

법령·업무 규칙을 모델과 분리해 "참조 가능한 제약 조건"으로 별도 관리한다는 설계는, 요금제 약관·환불 정책처럼 규정이 자주 바뀌는 CRS 지식베이스에도 바로 적용 가능한 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** 숙박 상품(객실 타입·요금 플랜·부대조건)도 상품 간 관계가 복잡해 온톨로지로 모델링할 가치가 크다. "권위(authority)·추적성(traceability)·확장성·의미(semantics)" 네 요건을 CRS 상품 데이터 설계 체크리스트로 그대로 가져올 수 있고, 약관·환불 규정 같은 "사람이 정한 제약"을 AI 모델과 분리해 참조 전용으로 관리하는 패턴은 챗봇 상담 정확도를 높이는 데 직접 적용할 만하다.

## 연관 자료

- [[2026-11-10-eugene-group-neptune-ontology]] — 같은 Neptune+온톨로지 패턴, 다른 업종(물류) 사례
- [[2026-11-19-naver-ontology-logistics-question-design]] — 같은 배치, "질문이 설계를 이끈다"는 상위 원칙

## 한 달 뒤 회고

2026-12-20 즈음 — aws.amazon.com 접속 차단이 풀려 84.7% 수치의 평가 기준과 Neptune 온톨로지 스키마를 직접 확인했는지, CRS 상품 온톨로지 설계에 이 네 요건을 실제로 반영했는지 점검.
