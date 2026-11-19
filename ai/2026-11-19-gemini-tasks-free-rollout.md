---
title: "Google Gemini의 개인 비서 'Tasks', 6개국 무료 전환(GeekNews, 모델명 Hydrogen은 구글 공식 미확인)"
source_title: "Gemini's $19.99 Task mode goes free in 6 countries"
source_url: "https://blog.google/innovation-and-ai/products/gemini-app/tasks-in-gemini-free-new-features/"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37433"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "ai"
tags: ["gemini", "ai-agent", "google", "agent-payments", "source-limitation"]
---

# Google Gemini의 개인 비서 'Tasks', 6개국 무료 전환

> 출처: [Google Gemini의 개인 비서 기능 'Tasks', 이제 무료로 제공](https://news.hada.io/topic?id=37433) (GeekNews) · 정리일 2026-11-19
>
> **출처 한계**: 무료화 자체는 Google 공식 블로그로 확인되나, "Gemini 4 Hydrogen 모델 사용" 주장은 구글 공식 포스트로 직접 확인되지 않고 복수 2차 매체만 언급한다.

## 한 줄 요약

**Gemini Tasks가 유료 기능에서 6개국 무료로 전환된 것은 공식 확인되지만, 각 작업이 하드웨어 격리 VM에서 실행된다는 세부와 무료 사용량 한도는 공개되지 않아 실무 적용 리스크가 남는다.**

## 핵심 포인트

- Tasks가 미국, 일본, 한국, 캐나다, 호주, 인도에서 무료로 배포되기 시작했다 — Google 공식 블로그로 교차확인됨. 고급 기능 일부는 미국부터 출시한다.
- 각 작업은 Google Cloud Agent Compute Engine의 ***하드웨어 격리 VM***에서 실행된다 — Slack 발췌에는 없던 추가 디테일이다.
- 이메일, 캘린더, 비밀번호, 결제 수단과 연결해 전화 예약, 청구서 분석, 쇼핑을 수행한다. 구매에는 Agent Payments Protocol(AP2)을 사용하며, 사전 지출 한도를 설정할 수 있고 지원 카드의 디지털 토큰으로 결제를 보호한다.
- "Gemini 4 Hydrogen 모델을 사용한다"는 주장은 ***구글 공식 포스트로 직접 확인되지 않는다*** — 복수 2차 매체만 언급한다.
- 무료 티어의 사용량 제한, 유료 구독자용 별도 모델 운영 여부는 Google이 공개하지 않아 미확인으로 남는다.

## 인상 깊은 문장

> Google이 무료 사용량 한도를 공개하지 않았다는 사실 자체가, 실무 적용 시 핵심 리스크다 — 언제 요금이 발생할지 예측할 수 없는 상태로 기능을 쓰게 된다는 뜻이다.

## 댓글

GeekNews 댓글 수는 확인하지 못했다(원문 미확인). 무료화와 핵심 기능(결제 연동, AP2)은 Google 공식 블로그로 확인됐지만, 모델명과 사용량 한도처럼 "실제로 운영할 때 중요한" 디테일은 공개되지 않은 비대칭이 눈에 띈다.

## 내 생각 · 적용점

### 핵심 전이 — 개인 정보·결제 수단을 쥔 에이전트의 범위 확장

이메일·캘린더·비밀번호·결제수단까지 연결해 전화 예약과 쇼핑을 대행한다는 점에서, 에이전트가 다루는 권한 범위가 계속 넓어지는 추세를 보여준다. [[2026-11-17-bespin-ai-agent-auth-security-design]]이 강조한 "API 키·설정 분리 + 임시 자격증명"같은 보안 설계 원칙이, 이런 소비자용 에이전트에도 똑같이 요구되는 문제라는 걸 확인시켜준다.

## 호스피탈리티 / CRS 적용 포인트

**제한적.** 투숙객이 Gemini Tasks 같은 개인 비서로 호텔 예약·전화 문의를 대행시키는 경우가 늘어날 수 있다는 시나리오는 참고할 만하다. CRS 쪽에서는 "에이전트가 대신 전화·예약하는" 요청을 어떻게 식별·처리할지 미리 고려할 필요가 있다.

## 연관 자료

- [[2026-11-17-bespin-ai-agent-auth-security-design]] — 에이전트의 권한·자격증명 분리 설계 원칙

## 한 달 뒤 회고

2026-12-19 즈음 — 무료 티어 사용량 한도가 공개되는지, Hydrogen 모델 사용 여부가 구글 공식으로 확인되는지 점검.
