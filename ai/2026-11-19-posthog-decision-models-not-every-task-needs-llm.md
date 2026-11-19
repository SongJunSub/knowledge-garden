---
title: "모든 작업에 LLM이 필요한 것은 아니다(PostHog, 1차 소스 교차확인)"
source_title: "Not everything needs an LLM"
source_url: "https://posthog.com/newsletter/decision-models"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37415"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "ai"
tags: ["decision-model", "llm-cost", "posthog", "ml-ops"]
---

# 모든 작업에 LLM이 필요한 것은 아니다

> 출처: [Not everything needs an LLM](https://posthog.com/newsletter/decision-models) (PostHog, GeekNews 경유) · 정리일 2026-11-19

## 한 줄 요약

**PostHog는 예/아니오 같은 짧고 반복적인 판단을 고비용 LLM 대신 작은 결정 모델에 맡겨, 개인정보 검사의 98.7%에서 LLM 호출 자체를 생략하지만, 모델·버전이 바뀌면 같은 확률 점수의 의미도 달라져 임계값을 다시 보정해야 한다고 경고한다.**

## 핵심 포인트

- PostHog는 예/아니오나 정해진 선택지와 그 확률을 반환하는 결정 모델을 활용한다. 개인정보 탐지, 요청에 맞는 모델 선택, SQL 조회 결과에 맞는 차트 추천처럼 짧은 판단을 반복하는 작업에 적용한다 — PostHog 공식 뉴스레터로 직접 확인됨.
- 개인정보 검사에서는 세션 요약 전 결정 모델의 2문항 판단을 통과하면 ***요약의 98.7%가 LLM 호출을 건너뛴다***.
- 고비용 LLM 호출 전에 간단한 판단을 맡기면 불필요한 호출을 구조적으로 줄일 수 있다.
- 다만 모델이나 버전이 바뀌면 같은 확률 점수의 의미도 달라질 수 있어, ***실제 정답을 붙인 데이터로 임계값을 다시 보정***해야 한다고 원문이 명시적으로 경고한다. 다단계 추론에는 쓰지 말라는 경고도 포함된다.

## 인상 깊은 문장

> "decision models can take any job where an LLM is overkill" — PostHog 원문 취지.

## 댓글

GeekNews 댓글 수는 확인하지 못했다(원문 미확인은 hada.io 토론에 한정). 다만 이번 글은 드물게 **PostHog 공식 원문 자체가 WebSearch로 확인**되어, Slack 발췌의 모든 핵심 주장(98.7%, SQL 차트 추천, 임계값 재보정 경고)이 1차 소스와 일치한다.

## 내 생각 · 적용점

### 핵심 전이 — 레포에 이미 쌓인 "결정 모델" 계열의 또 다른 확인

레포에는 이미 결정 모델 계열 노트가 다수 쌓여 있다(예: [[2026-11-17-aws-sglang-multimodal-decision-model]], [[2026-11-17-aws-laya-decision-model]]). 이 글은 "왜" 결정 모델을 쓰는지(LLM 호출 비용·지연 회피)를 가장 명확하게 설명하는 원칙 수준의 글이라, 다른 사례들을 묶는 상위 개념으로 연결할 만하다.

### 적용점

Claude 기반 상담 에이전트를 설계할 때도, 매 요청마다 큰 모델을 호출하기 전에 "이 요청이 간단한 분기 판단인가"를 먼저 걸러내는 작은 모델을 두면 비용을 구조적으로 줄일 수 있다. 다만 모델 버전이 바뀌면 임계값을 반드시 재보정해야 한다는 경고는 운영 체크리스트에 그대로 넣어야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** 예약 문의가 "환불 가능 여부", "반려동물 동반 가능 여부" 같은 정해진 선택지 질문인지 먼저 작은 결정 모델로 분류하고, 그런 경우에만 LLM 호출을 생략하거나 캐시된 답변을 쓰는 설계는 바로 적용 가능하다. 단, 질문 유형이 바뀌거나 모델을 교체할 때는 반드시 재보정이 필요하다.

## 연관 자료

- [[2026-11-17-aws-sglang-multimodal-decision-model]] — 같은 결정 모델 계열, Decode 생략 방식
- [[2026-11-17-aws-laya-decision-model]] — 같은 결정 모델 계열, AWS 배포 가이드
- [[2026-10-11-microsoft-decision-1-decision-model]] — 같은 결정 모델 계열, Microsoft 사례

## 한 달 뒤 회고

2026-12-19 즈음 — 온다 상담 에이전트 설계에 결정 모델 전처리 단계를 실제로 검토했는지, 임계값 재보정 절차를 문서화했는지 점검.
