---
title: "Revolut, 개발자 2,000명에게 자체 호스팅 GLM 제공…AI 비용을 기존의 10분의 1로 절감(GeekNews) — 토큰 제한을 없애자 작업 흐름 전체가 코딩 밖으로 번졌다"
source_title: "Revolut Says Self-Hosted AI Cut Coding Costs 90%"
source_url: "https://www.startuphub.ai/ai-news/artificial-intelligence/2026/revolut-says-self-hosted-ai-cut-coding-costs-90"
source_name: "StartupHub AI"
referrer_url: "https://news.hada.io/topic?id=36534"
published_at: "2026-10-29"
summarized_at: "2026-11-04"
category: "ai"
tags: ["revolut", "self-hosted-llm", "glm", "llm-cost", "b200-gpu", "finops"]
---

# Revolut, 개발자 2,000명에게 자체 호스팅 GLM 제공…AI 비용을 기존의 10분의 1로 절감(GeekNews)

> 출처: [Revolut Says Self-Hosted AI Cut Coding Costs 90%](https://www.startuphub.ai/ai-news/artificial-intelligence/2026/revolut-says-self-hosted-ai-cut-coding-costs-90) (StartupHub AI) · GeekNews 경유 · 정리일 2026-11-04
>
> **출처 한계**: news.hada.io는 이 세션에서 egress 차단으로 직접 열람하지 못했다. WebSearch로 찾은 1차 자료는 AI Engineer 컨퍼런스 발언을 보도한 StartupHub 기사뿐이며, Revolut의 공식 발표문이나 블로그는 찾지 못했다 — "90%", "10분의 1" 수치는 전부 Revolut이 발표한 2차 보도이고 독립 검증은 없다.

## 한 줄 요약

**Revolut이 약 2,000명 개발자의 코딩 작업을 API 기반 LLM에서 NVIDIA B200 GPU 56개로 자체 호스팅한 GLM으로 옮겨 AI 비용을 약 10분의 1(90% 절감)로 줄였다고 밝혔다 — 다만 Claude Code와 Codex는 예외적으로 계속 외부 API를 쓴다.**

## 핵심 포인트

- 엔지니어 약 2,000명에게 ***자체 호스팅 GLM을 기본으로 제공***하되, Claude Code와 Codex는 예외적으로 계속 활용 — 전면 대체가 아니라 난이도 높은 작업은 여전히 프런티어 모델에 맡기는 이원 구조다.
- ***NVIDIA B200 GPU 56개***로 GLM-5.3을 운영하며, 혼합 기준 비용은 ***100만 토큰당 0.30달러***.
- Anthropic·OpenAI에 내던 비용을 ***약 10분의 1로 줄였고***, 내부 지표로 코딩 시간 60%·리드타임 70% 개선을 기록했다고 주장 — 전부 자체 발표 수치.
- ***토큰 제한을 없애자*** 사용 범위가 코딩 작업뿐 아니라 메일, Jira, Confluence 관련 업무까지 확대됐다.
- GPU 증설 없이 추론 설정을 조정해, 요청량이 76% 증가하는 동안에도 첫 토큰 대기 시간을 유지했다(Slack 발췌가 문장 중간에 끊겨 구체적 조정 방식은 확인하지 못했다).

## 인상 깊은 문장

> "Revolut cut AI coding costs by 90% by moving about 2,000 engineers from metered APIs to self-hosted open models running on 56 Nvidia B200 GPUs." — StartupHub AI 기사 종합(WebSearch)

## 댓글

GeekNews hada 댓글 수는 이 세션에서 확인하지 못했다(news.hada.io 접근 차단). HN·Lobsters 큐레이션 여부도 확인하지 못했다. **이해관계**: 이 수치는 Revolut 엔지니어가 AI Engineer 컨퍼런스에서 발언한 내용을 매체가 보도한 것으로, 자체 인프라 투자를 정당화하려는 발표 성격이 있어 비용 절감 효과가 낙관적으로 제시됐을 가능성이 있다.

## 내 생각 · 적용점

**핵심 전이 — LLM 비용은 고정값이 아니라 선택 하나로 몇 배씩 요동친다.** [[2026-10-21-daangn-llm-model-swap-triples-cost]]에서는 당근마켓이 모델만 교체했는데 캐시 히트율이 조용히 무너져 비용이 3배가 됐다. Revolut은 정반대 방향으로 자체 호스팅을 택해 비용을 10분의 1까지 낮췄다고 주장한다. 같은 축의 양극단 사례 — 비용은 모델 자체의 가격표가 아니라 **운영 설계(캐싱 전략, 추론 인프라, 사용 패턴)**가 결정한다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성은 제한적.** 온다 규모에서 자체 GPU 클러스터(B200 56개) 운영은 Revolut 같은 대형 핀테크의 개발자 수·사용량 규모에서나 경제성이 맞는 결정이라, 그대로 가져오기는 어렵다. 다만 "토큰 제한을 없애자 사용 범위가 코딩 밖으로 번졌다"는 관찰은 참고할 원칙이다 — CRS 내부 도구에 AI를 도입할 때 비용 통제를 지나치게 보수적으로 설계하면 실제 채택 속도 자체가 늦어질 수 있다.

## 연관 자료

- [[2026-10-21-daangn-llm-model-swap-triples-cost]] — LLM 비용이 선택 하나로 요동친다는 같은 축의 반대 사례(비용 3배 증가 vs 10분의 1 절감)

## 한 달 뒤 회고

*(2026-12-04 즈음 — Revolut의 공식 블로그나 추가 보도로 "90%" 수치가 독립적으로 확인됐는지, 실제 쓰인 GLM 버전이 무엇인지 보강한다.)*
