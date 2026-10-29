---
title: "AWS Lambda Web Functions 실전 가이드 1부: 실행 모델, 과금, CloudFront 오리진 구성 (AWS 기술 블로그) — 어댑터 없이 표준 HTTP 서버를 그대로 올리고, 대기 시간은 과금하지 않는다"
source_title: "AWS Lambda Web Functions 실전 가이드 1부: 실행 모델, 과금, Amazon CloudFront 오리진 구성"
source_url: "https://aws.amazon.com/ko/blogs/tech/lambda-web-functions-1/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-29"
category: "architecture"
tags: ["aws", "lambda", "web-functions", "serverless", "cloudfront", "billing-model", "bff"]
---

# AWS Lambda Web Functions 실전 가이드 1부: 실행 모델, 과금, CloudFront 오리진 구성 (AWS 기술 블로그)

> 출처: [AWS Lambda Web Functions 실전 가이드 1부](https://aws.amazon.com/ko/blogs/tech/lambda-web-functions-1/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-29

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 원글 불릿 3개 + 스레드 상세 답변 1개(끊김 없이 완결된 문단)를 1차 자료로 썼다. hada 댓글·HN 반응은 확인 불가.

## 한 줄 요약

**AWS Lambda Web Functions는 어댑터 없이 표준 HTTP 서버를 그대로 배포할 수 있는 새 실행 모델로, 하나의 실행 환경이 최대 128개 요청을 동시에 처리하며 실제 CPU 연산 시간에만 과금되고(대기 시간은 무료), Amazon CloudFront와 연동해 오리진으로 즉시 쓸 수 있다.**

## 핵심 포인트

- **어댑터 없는 표준 서버 배포** — 기존 Event Functions와 달리 별도 어댑터 레이어 없이 ***표준 HTTP 서버를 그대로*** Lambda에 배포할 수 있다. 하나의 실행 환경이 ***최대 128개 요청을 동시에*** 처리하는 다중 동시 실행 모델을 지원한다.
- **"활성 CPU 과금"이라는 핵심 변화** — 코드가 실제로 연산하는 시간에만 CPU 비용을 청구하는 ***'활성 CPU 과금'*** 방식을 채택해, 외부 API 응답이나 DB 대기 시간으로 인한 비용 낭비를 최소화했다. 일반 Event Functions보다 대기 시간이 긴 에이전트 응답 처리에 특히 경제적이다.
- **CloudFront 오리진으로 즉시 통합** — Amazon CloudFront와의 연동을 통해 웹 애플리케이션의 오리진으로 즉시 활용할 수 있는 환경을 제공한다. 프로그래밍 모델의 단순화, 동시성 향상, 비용 효율성이라는 세 가치를 묶어 특히 BFF(Backend for Frontend)나 실시간 스트리밍 워크로드에 최적화된 환경이라고 밝힌다.

## 인상 깊은 문장

> "Web Functions는 코드가 실제로 연산하는 시간 동안만 CPU 비용이 청구되는 '활성 CPU 과금' 방식을 채택하여, 외부 API 응답이나 데이터베이스 대기 시간으로 인한 비용 낭비를 최소화했습니다." (Slack TechArticles 스레드 답변 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단, AWS 블로그는 애초에 그런 댓글 시스템이 없음). "활성 CPU 과금"의 구체적 단가, 콜드스타트 특성, 128개 동시 요청 한도의 조정 가능 여부 등 수치는 발췌에 없어 확인 못했다 — AWS 자체 발표 자료이므로 벤더 편향을 감안해야 한다.

## 내 생각 · 적용점

**핵심 전이 — Event Functions의 "요청당 과금"에서 "연산 시간당 과금"으로의 전환은, 서버리스가 오래 품었던 두 가지 과금 불만(대기 시간 과금·콜드스타트 비용)을 동시에 겨냥한다.** 기존 Lambda Event Functions 모델은 요청을 처리하는 전체 wall-clock 시간에 과금되어, 외부 API나 DB를 기다리는 동안에도 비용이 발생했다. Web Functions가 "활성 CPU 과금"으로 전환했다는 것은, AWS가 에이전트·BFF처럼 I/O 대기가 많은 워크로드를 서버리스로 끌어오기 위해 과금 모델 자체를 재설계했다는 신호다. 다만 "CPU를 쓰지 않는 시간은 무료"라는 설계는 거꾸로 "CPU를 쓰는 작업"의 정의와 측정 방식에 벤더 재량이 크게 개입한다는 뜻이기도 하다 — 실제 비용 절감 폭은 자체 벤치마크 없이는 가늠하기 어렵다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 PMS·채널매니저·결제 게이트웨이 등 외부 API 응답을 오래 기다리는 BFF 계층을 운영한다면, "대기 시간은 과금하지 않는다"는 모델은 직접적인 비용 절감 후보다. 예약 조회·가용 재고 확인처럼 외부 호출이 잦고 응답 지연이 들쭉날쭉한 API를 Web Functions로 옮기면, 현재 Event Functions 기반에서 대기 시간까지 과금되는 구조보다 비용 구조가 유리해질 가능성이 있다. 단, 실제 절감액은 AWS 발표 수치가 아니라 자체 트래픽 패턴으로 재현해봐야 한다.

## 연관 자료

- [[2026-10-29-aws-lambda-web-functions-guide-part2]] — 같은 시리즈 2부. 1부가 다룬 실행 모델·과금·CloudFront 구성을 바탕으로, AI 에이전트를 위한 BFF 보안·세션 관리 구체 사례로 이어진다.
- [[2026-10-27-igaworks-claire-agentcore-poc-part1]] — 같은 AWS 생태계의 AgentCore Runtime 활용 사례, 에이전트 실행 환경을 바꾸는 접근이라는 공통점.

## 한 달 뒤 회고

2026-11-29 즈음, `aws.amazon.com` 접근이 풀렸다면 "활성 CPU 과금"의 실제 단가표와 콜드스타트 특성을 원문으로 확인하고, Event Functions 대비 비용 절감 사례가 커뮤니티에 보고됐는지 점검한다.
