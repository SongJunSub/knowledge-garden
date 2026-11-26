---
title: "Chat DIC 1년, 무엇이 바뀌었나: Basic 개선과 Pro 런칭 (SK플래닛) — 수동 품질 평가를 데이터 기반 회귀평가로 바꾼 1년의 전환"
source_title: "Chat DIC 1년, 무엇이 바뀌었나: Basic 개선과 Pro 런칭"
source_url: "https://techtopic.skplanet.com/chatdic-1year-pro/"
source_name: "SK플래닛 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "ai"
tags: ["sk-planet", "nl2sql", "text-to-sql", "ai-agent-chatbot", "langfuse", "eval"]
---

# Chat DIC 1년, 무엇이 바뀌었나: Basic 개선과 Pro 런칭 (SK플래닛)

> 출처: [Chat DIC 1년, 무엇이 바뀌었나: Basic 개선과 Pro 런칭](https://techtopic.skplanet.com/chatdic-1year-pro/) (SK플래닛 기술 블로그) · 정리일 2026-11-26

> **출처 한계**: `techtopic.skplanet.com`이 이 세션에서 egress 차단되어 원문을 열람하지 못했다. Slack 발췌 불릿 3개만을 근거로 작성했으며, WebSearch로도 "Chat DIC"라는 제품명 자체의 독립 출처를 찾지 못했다.

## 한 줄 요약

**SK플래닛의 사내 데이터 분석 챗봇 "Chat DIC"가 1년 만에 Basic(SQL 생성·튜닝)과 Pro(검증된 쿼리 실행+인사이트 도출)로 분화했고, 수동 품질 평가를 Langfuse 기반 데이터 회귀평가 체계로 전환했다는 운영 회고다.**

## 핵심 포인트

- **Basic/Pro 두 단계로 분화** — Basic은 ***SQL 생성과 튜닝***을 지원하고, Pro는 ***검증된 쿼리 실행과 인사이트 도출***까지 맡는다. "생성까지"와 "실행·해석까지"를 등급으로 나눈 설계.
- **개인정보 보호를 위한 폐쇄망 유지** — 외부 LLM API로 데이터를 내보내지 않는 쪽을 1년째 고수하고 있다는 서술.
- **Langfuse로 모든 요청을 트레이스** — 모든 요청을 트레이스로 기록해, 사후 분석과 회귀평가의 원재료로 쓴다.
- **수동 평가 → 데이터 기반 회귀평가 체계로 전환** — 초기엔 사람이 품질을 수동으로 평가했으나, 이를 ***축적된 트레이스 기반의 회귀평가 체계***로 바꿔 운영 효율을 높였다는 핵심 주장. 이 전환의 구체 지표(평가 소요시간 감소율 등)는 Slack 발췌에 없다.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함.)

## 댓글

SK플래닛 자사 기술 블로그 특성상 hada 댓글 생태계 밖이다. 이해관계 고지: 자사 제품의 1년 회고이므로 실패나 보류한 시도는 축소 서술될 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 — "평가는 과소평가된 역량"의 또 다른 실증

[[2026-11-24-evals-underrated-ai-engineering-skill]]은 골든셋이 운영 실패를 계속 먹여야 썩지 않는다고 짚었다. Chat DIC의 "수동 평가 → 트레이스 기반 회귀평가" 전환은 그 원칙이 실제 1년짜리 프로덕션 사이클에서 어떻게 구현되는지 보여주는 사례다 — Langfuse로 모든 요청을 쌓아두는 것 자체가 "운영 실패를 계속 먹이는" 인프라다. [[2026-11-25-naver-omnievaluator-unified-eval-framework]]의 "아티팩트 기반 재현성"과도 같은 축: 둘 다 "평가를 1회성 수작업에서 지속 가능한 인프라로" 옮기는 이야기다.

### 적용점

NL2SQL/데이터 분석 챗봇을 "생성만 하는 등급"과 "실행·해석까지 하는 등급"으로 나누는 설계는, 신뢰도가 낮은 출력과 검증된 출력을 분리해 사용자에게 다른 권한을 주는 일반적 패턴으로 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 데이터 분석/리포팅 챗봇을 설계한다면 "쿼리 생성만 돕는 Basic"과 "검증된 쿼리를 실행해 인사이트까지 주는 Pro"로 등급을 나누는 게, 잘못된 쿼리가 바로 실행되는 위험을 줄이는 현실적 완충 장치가 된다. 폐쇄망 유지 원칙도 B2B 고객 데이터를 다루는 CRS 환경에 직접 참고할 만하다.

## 연관 자료

- [[2026-11-24-evals-underrated-ai-engineering-skill]] — 평가 인프라화라는 같은 원칙
- [[2026-11-25-naver-omnievaluator-unified-eval-framework]] — 재현성 있는 평가 인프라의 다른 사례

## 한 달 뒤 회고

2026-12-26 즈음 — Chat DIC Pro의 실제 사용률이나 Basic 대비 전환율에 대한 후속 공개가 있었는지 확인.
