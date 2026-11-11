---
title: "Amazon, Sonnet 4.6을 Strands Decider로 대체해 수백만 달러 절감(GeekNews, 핵심 수치 미확인) — 닫힌 선택지 분류엔 결정 모델이 맞다"
source_title: "Amazon, Sonnet 4.6을 Strands Decider로 대체해 수백만 달러 절감"
source_url: "https://news.hada.io/topic?id=36935"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36935"
published_at: "2026-11"
summarized_at: "2026-11-11"
category: "ai"
tags: ["amazon", "strands-decider", "model-routing", "cost-optimization", "decision-model", "sonnet"]
---

# Amazon, Sonnet 4.6을 Strands Decider로 대체해 수백만 달러 절감

> 출처: [Amazon, Sonnet 4.6을 Strands Decider로 대체해 수백만 달러 절감](https://news.hada.io/topic?id=36935) (GeekNews) · 정리일 2026-11-11
>
> **출처 한계**: `news.hada.io` 차단으로 원문 미확인. 98% 절감이라는 핵심 수치는 독립 확인하지 못했다. Slack 발췌와 이 가든의 기존 노트([[2026-10-08-strands-decider-2b-decision-model]])로만 교차확인했다.

## 한 줄 요약

**아마존이 대규모 내부 티켓 분류에 쓰던 Claude Sonnet 4.6을 Strands Decider E4B 결정 모델로 교체해, 티켓 100만 건당 약 22,200달러에서 500달러로 비용을 98% 줄이고 연간 수백만 달러를 절감할 것으로 예상된다.**

## 핵심 포인트

- **텍스트 생성 대신 확률 반환**: 의사결정 모델은 텍스트를 생성하는 대신 주어진 선택지별 확률과 신뢰도를 반환하므로, 정해진 20개 범주에서 티켓 라벨을 고르는 작업에 적합했다.
- **품질도 유지**: 별도 티켓 평가에서 E4B가 운영 중인 Sonnet보다 좋은 결과를 보였다.
- **비용 절감 수치**: 실제 비교에서 평균 호출 시간은 78%, 티켓당 총 토큰 수는 70% 감소했다.

## 인상 깊은 문장

> "의사결정 모델은 텍스트를 생성하는 대신 주어진 선택지별 확률과 신뢰도를 반환하므로, 정해진 20개 범주에서 티켓 라벨을 고르는 작업에 적합했음" (Slack 발췌)

## 댓글

hada 차단으로 댓글 미확인. 98% 절감이라는 핵심 수치가 원문 1차 확인이 아니라는 점은 과장 가능성을 염두에 둬야 한다.

## 내 생각 · 적용점

### 핵심 전이 — "닫힌 선택지에는 범용 생성 모델이 과잉 스펙"이라는 원칙의 실증 사례

이 가든의 [[2026-10-08-strands-decider-2b-decision-model]]이 소개한 Strands Decider라는 결정 전용 모델 개념이, 이 글에서 실제 대규모 운영 사례로 입증됐다. [[2026-09-21-jev-field-guide-system-one-model]]이 말하는 "직관적, 빠른 판단(시스템 1)"에 해당하는 작업은 생성형 거대 모델보다 전용 결정 모델이 맞다는 원칙과도 정확히 들어맞는다. 범용 생성 모델을 "20개 중 하나 고르기"에 쓰는 건 망치로 압정을 박는 것과 비슷하다는 교훈.

### Claude 사용자 관점의 적용점

내가 Claude를 쓸 때도, 작업이 "자유로운 텍스트 생성"이 아니라 "정해진 선택지 중 하나를 고르는 분류"라면, 매번 풀스펙 모델을 호출하는 대신 더 가벼운 분류 전용 모델이나 구조화된 출력으로 전환할 수 있는지 먼저 따져보는 습관이 이 사례로 뒷받침된다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 온다 CRS의 CS 문의 분류, 룰 기반 판단(예: 환불 정책 적용 여부, 객실 타입 매칭)처럼 선택지가 닫혀 있는 작업은, 매번 풀스펙 LLM을 호출하기보다 결정 모델 방식으로 전환하는 걸 검토할 가치가 있다. 호출 시간과 토큰을 70~80% 가까이 줄일 수 있다는 이 사례의 수치가 전환 타당성 검토의 출발점이 될 수 있다.

## 연관 자료

- [[2026-10-08-strands-decider-2b-decision-model]] — Strands Decider 결정 모델 개념의 원 출처
- [[2026-09-21-jev-field-guide-system-one-model]] — 직관적, 빠른 판단에는 전용 모델이 맞다는 같은 원칙

## 한 달 뒤 회고

*(2026-12-11 즈음 — news.hada.io 접근이 풀리면 98% 절감 수치를 1차 출처로 재확인한다.)*
