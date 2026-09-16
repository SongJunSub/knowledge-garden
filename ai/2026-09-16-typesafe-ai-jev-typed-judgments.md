---
title: "Jev - 문장 대신 판단과 확률을 반환하는 AI 모델 (TypeSafe AI) — 토큰을 생성하지 않는 System One 모델이라 LLM보다 20~200배 빠르고 40~400배 저렴하다고 주장한다"
source_title: "Introducing System One Models and Jev"
source_url: "https://typesafe.ai/blog/introducing-system-one-models-and-jev"
source_name: "TypeSafe AI 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33751"
summarized_at: "2026-09-16"
category: "ai"
tags: ["구조화된판단", "저지연추론", "AI스타트업", "GeekNews"]
---

# Jev - 문장 대신 판단과 확률을 반환하는 AI 모델

> 출처: [Introducing System One Models and Jev](https://typesafe.ai/blog/introducing-system-one-models-and-jev) (TypeSafe AI) · 정리일 2026-09-16

## 한 줄 요약
**TypeSafe AI가 추론이나 설명 텍스트를 전혀 생성하지 않고, 분류·라우팅·점수화 같은 반복 판단을 타입 지정된 값(선택지/척도/예아니오)과 보정된 확률로 직접 반환하는 "System One 모델" Jev를 공개했다 — 토큰 생성 자체를 건너뛰어 LLM보다 훨씬 빠르고 싸다는 주장이다.**

## 핵심 포인트
- TypeSafe AI는 2024년 설립된 샌프란시스코 랩으로, ***OpenAI/Google Brain 출신이자 RLHF 공동 발명자로 알려진 Diogo Almeida***가 공동창업자
- Jev는 상태(이메일·로그·티켓·JSON 등)와 타입 지정 질문을 입력받아 ***Choice(선택지 중 하나)/Score(척도 평가)/Noul(예·아니오 확률)*** 세 형태의 답을 확률·신뢰도 점수와 함께 반환
- ***여러 타입 질문을 병렬로 한 번에 평가***하고 확률 분포를 반환하는 구조 — 출력 토큰을 생성하지 않아 지연시간 자체를 줄인 설계
- 훈련 기법은 ***RLCD(Reinforcement Learning for Calibrated Decisions)*** — 모델이 실제로 맞힌 빈도에 맞춰 확률을 보정
- 성능 주장: ***응답시간 70~500ms, LLM 대비 20~200배 빠르고 40~400배 저렴***(가격은 입력 100만 토큰당 0.042달러, 출력은 무료)

## 인상 깊은 문장
> "a fast judgment with calibrated probabilities and a confidence score"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 두 건 크로스포스트됨(item id=49717558, 49718888)이나 정확한 포인트·댓글 수는 접근 차단으로 미확인 — 검색 스니펫 기준으로 "Jev가 확산되면 GPU 수요가 줄 수 있다"는 하드웨어 임팩트 논쟁이 있었던 정황만 파악됨. typesafe.ai 원문은 회사 자체 발표(벤더 1차 소스)이므로, ***속도·비용 수치는 검증되지 않은 자체 벤치마크 주장***임을 감안해야 한다.

## 내 생각 · 적용점
분류·라우팅·조건 분기처럼 "자유로운 문장"이 아니라 "미리 정한 형식의 값"이 필요한 자리에 범용 LLM을 그대로 쓰는 건 원래도 과잉스펙이었다. Jev의 제안은 그 과잉스펙을 아예 다른 모델 클래스로 분리하자는 것 — function calling이나 structured output으로 LLM 출력을 강제하는 기존 패턴보다 한 단계 더 나아가, 애초에 토큰을 생성하지 않는 구조를 택했다는 점이 구별된다. 다만 벤더 자체 벤치마크라 실제 정확도·보정 품질은 외부 검증 전까지 유보적으로 봐야 한다.

## 호스피탈리티 / CRS 적용 포인트
예약 요청 분류(정상/이상 패턴), 리뷰 감성 점수화, 채널 메시지 라우팅(고객문의 vs 스팸)처럼 CRS에서 반복되는 판단 작업은 정확히 이 모델이 노리는 사용 사례다. 다만 외부 검증 전 단계 모델이라 지금 당장 프로덕션에 넣기보다는, "판단 전용 소형 모델로 분류 파이프라인을 분리한다"는 아키텍처 아이디어만 참고할 단계.

## 연관 자료
억지로 연결할 만한 기존 노트가 없다 — 이 가든에는 아직 "판단 전용 저지연 모델" 카테고리의 선행 노트가 없어 신규 축으로 남겨둔다.

## 한 달 뒤 회고
2026-10-16 즈음, TypeSafe AI가 독립 벤치마크나 실사용 사례를 공개했는지, Jev의 정확도·보정(calibration) 품질에 대한 제3자 평가가 나왔는지 점검.
