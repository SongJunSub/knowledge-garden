---
title: "Gemini Decision 1 기반 Decisions API, 입력 하나에 최대 1,000개 판단 질문 (Google, 원문 미확인) — 토큰을 생성하지 않고 한 번의 순전파로 선택지를 채점해 1,000문항까지도 지연시간이 거의 안 변한다"
source_title: "Gemini Decisions API - 입력 하나에 최대 1,000개 질문을 평가하는 멀티모달 API"
source_url: "https://news.hada.io/topic?id=37011"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37011"
published_at: "2026-11-12"
summarized_at: "2026-11-12"
category: "ai"
tags: ["gemini-decision-1", "decision-model", "jev", "llm-judge", "multimodal", "calibration", "batch-evaluation"]
---

# Gemini Decision 1 기반 Decisions API, 입력 하나에 최대 1,000개 판단 질문 (Google, 원문 미확인)

> 출처: [Gemini Decisions API](https://news.hada.io/topic?id=37011) (GeekNews) · 정리일 2026-11-12

## 한 줄 요약

**Google이 Gemini Decision 1 기반 판단 전용 API를 공개했다. 텍스트·이미지·오디오·영상·PDF를 하나의 입력으로 받아 예/아니요·객관식·기준별 채점 질문을 한 요청에 최대 1,000개까지 보낼 수 있고, 토큰을 하나씩 생성하지 않고 한 번의 순전파로 선택지를 채점하기 때문에 질문 수가 늘어도 지연시간이 거의 일정하다.**

## 핵심 포인트

- Google이 *Gemini Decision 1* 기반 판단 API를 공개. 텍스트·이미지·오디오·영상·PDF를 하나의 입력으로 묻고, 그 입력에 대해 ***예/아니요, 객관식, 기준별 채점 질문을 최대 1,000개***까지 한 요청으로 보낼 수 있음.
- 답변을 토큰별로 생성하지 않고 ***한 번의 순전파***로 후보 선택지를 채점해 확률과 신뢰도를 반환. 최대 16K 토큰 문맥 측정에서 종단 간 지연시간은 ***150~250ms***이며, 질문이 1개에서 100개로 늘어도 거의 일정하게 유지.
- 예/아니요, 객관식, 순서형 평가 기준 점수를 한 요청에 섞어 사용 가능. 모든 답변에 0~1의 신뢰도가 포함돼 모호한 사례를 대체 처리 경로나 사람 검토자에게 보낼 수 있음.
- 이 가든이 추적해온 "판단 전용 소형/전용 모델"(Jev 계열) 라인업에 Google도 합류한 셈 — Microsoft-Decision-1, Strands Decider, Kanana-2-v-decide와 같은 패턴.

## 인상 깊은 문장

> "입력 하나에 최대 1,000개 질문을 평가" — Slack 발췌 재구성

> "질문이 1개에서 100개로 늘어도 거의 일정하게 유지" — Slack 발췌 재구성

## 댓글

Slack 봇 발췌문이 유일 근거. news.hada.io는 이 세션에서 egress 차단(getaddrinfo ENOTFOUND)으로 원문·hada 댓글 모두 미확인. WebSearch로도 "Gemini Decision 1"/"Decisions API"라는 명칭 자체를 독립 확인하지 못함(OpenAI의 실제 "Decisions API"는 별개 제품으로 존재가 확인됨 — 이름이 비슷해 혼동 주의). 제품명·수치 모두 교차확인 실패.

## 내 생각 · 적용점

Decision model 계열(Jev 계보)에 빅테크 세 번째(MS, AWS Strands, 이제 Google)가 합류했다. 공통 패턴: "생성 대신 판단만 반환해 속도·비용을 줄인다." 그러나 [[2026-10-23-llm-confidence-score-unreliable]]이 지적했듯 0~1 신뢰도는 "측정값이 아니라 생성값"이라는 비판이 유효하다 — 이 API의 신뢰도 점수도 그대로 믿지 말고 자체 캘리브레이션 검증이 필요하다. [[2026-10-11-microsoft-decision-1-decision-model]], [[2026-11-11-amazon-sonnet-strands-decider-cost]]와 같은 계열.

## 호스피탈리티 / CRS 적용 포인트

적용 가능성 있음. 리뷰·문의 분류, 예약 조건 체크리스트(취소 가능 여부, 환불 규정 매칭 등) 같은 "닫힌 선택지 판단"을 토큰 생성형 LLM 대신 이런 배치 판단 API로 처리하면 비용·지연 모두 개선 여지가 있다. 단 신뢰도 점수를 그대로 믿지 말고 실측 보정이 필요하다.

## 연관 자료
- [[2026-10-11-microsoft-decision-1-decision-model]] — 빅테크의 Jev 계열 합류 선례
- [[2026-11-11-amazon-sonnet-strands-decider-cost]] — 같은 패턴의 비용 절감 주장
- [[2026-10-23-llm-confidence-score-unreliable]] — 신뢰도 점수를 믿지 말아야 하는 이유

## 한 달 뒤 회고
*(2026-12-12 즈음 — Gemini Decision 1의 공식 발표문·벤치마크가 교차확인됐는지, 이 API의 신뢰도 점수가 실측 캘리브레이션과 맞는지 확인.)*
