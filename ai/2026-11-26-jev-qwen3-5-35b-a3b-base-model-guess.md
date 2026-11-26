---
title: "Jev는 아마도 Qwen3.5-35B-A3B 기반일 것 (GeekNews) — 자기식별 질문에 74% 확률로 Qwen을 고른다고 기반 모델이 확정되는 건 아니다"
source_title: "Jev is probably based on Qwen3.5-35B-A3B (추정)"
source_url: "https://news.hada.io/topic?id=37859"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37859"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "ai"
tags: ["jev", "typesafe", "qwen", "model-fingerprinting", "reverse-engineering"]
---

# Jev는 아마도 Qwen3.5-35B-A3B 기반일 것 (GeekNews)

> 출처: [Jev is probably based on Qwen3.5-35B-A3B (추정)](https://news.hada.io/topic?id=37859) · 정리일 2026-11-26

> **출처 한계**: 원문(news.hada.io)이 egress 차단으로 막혔다. WebSearch로 확인한 바, ***"Jev"는 TypeSafe AI의 상용 비공개 "System One" 결정 모델***이고, 이 레포가 이미 여러 번 다룬 그 Jev다([[2026-09-20-jevs-architecture-unmasked]] 등). 그런데 WebSearch는 동시에 Hugging Face에 `autotrust/JEV-35B`라는 ***완전히 다른, 비공식 프로젝트***가 있다는 것도 확인했다 — AutoTrust AI가 만든 Qwen3.5-35B-A3B 기반 오픈 System 1 모델로, TypeSafe AI와 무관·비제휴·비승인임을 HF 페이지에 명시한다. 이 글이 다루는 "Jev"가 TypeSafe의 비공개 상용 Jev를 리버싱한 추정인지, 이름이 비슷한 이 오픈소스 프로젝트와 혼동한 것인지 ***원문 없이는 구분할 수 없다*** — 이름이 거의 같은 두 프로젝트가 존재한다는 사실 자체가 혼란의 소지다.

## 한 줄 요약

**비공개 상용 모델 Jev(TypeSafe AI)에 간접적인 자기식별 질문을 반복해, 토큰 수·지연시간 분석과 함께 Jev 두 버전 모두가 74% 확률로 Qwen을 선택했다는 것을 근거로 기반 모델이 Qwen3.5-35B-A3B일 가능성이 가장 높다고 추정하는 블랙박스 리버싱 시도다.**

## 핵심 포인트

- **9,984개 프롬프트로 자기식별 테스트** — Qwen 토크나이저의 토큰 수와 지연시간을 분석해 ***Qwen3.5-35B-A3B를 가장 유력한 기반 모델 후보***로 추정.
- **74%라는 확률의 의미는 제한적** — 간접적인 자기식별 질문에서 Jev 두 버전 모두 Qwen 선택지에 74%의 확률을 부여했다는 결과를 제시하지만, 글쓴이 스스로도 ***이 응답만으로는 기반 모델을 입증할 수 없다***고 인정한다는 서술 — 자기식별 응답은 모델이 실제로 학습한 사실이 아니라 패턴 매칭의 산물일 수 있기 때문이다.
- **"Jev"라는 이름의 모호성 — 이 레포가 처음 맞닥뜨리는 혼선** — WebSearch 결과, Hugging Face의 `autotrust/JEV-35B`는 ***정확히 Qwen3.5-35B-A3B 기반이면서도 TypeSafe의 Jev와 무관함을 명시***한 별도 프로젝트다. 이름의 우연한 유사성이 이 레포가 다루려는 "리버싱 추정"과 "실제 공개 모델"을 혼동시킬 위험이 있다.
- **기존 Jev 아키텍처 리버싱 계열과 같은 방법론** — [[2026-09-20-jevs-architecture-unmasked]]가 보여준 "1만 번 API 호출로 블랙박스 구조를 역추적"하는 방식과 같은 접근을, 이번엔 "기반 모델 추정"이라는 구체 질문에 적용한 사례로 보인다.

## 인상 깊은 문장

> (원문 미확정으로 1차 인용 확보 못함.)

## 댓글

GeekNews 댓글 수 미확인(원문 차단). Jev/TypeSafe 리버싱은 이 커뮤니티에서 꾸준히 반복되는 토픽으로 보인다(이 레포에 이미 여러 Jev 관련 노트 존재).

## 내 생각 · 적용점

### 핵심 전이 — 이 레포의 Jev 계열 노트와 직접 연결

이 레포는 Jev를 이미 수십 번 다뤘다 — [[2026-09-16-typesafe-ai-jev-typed-judgments]](Jev의 등장), [[2026-09-20-jevs-architecture-unmasked]](아키텍처 리버싱), [[2026-11-10-flide-jev-inference-acceleration]](추론 가속화)까지. 이 글은 "구조"가 아니라 "기반 모델"이라는 더 좁은 질문에 같은 블랙박스 리버싱 방법론을 적용한 ***최신 조각***이다. "Jev"라는 이름을 쓰는 비공식 오픈 프로젝트(JEV-35B)까지 등장했다는 건, 이 모델이 업계에서 얼마나 화제가 됐는지를 보여주는 간접 증거이기도 하다.

### 적용점

"비공개 API를 간접 신호(토큰 수, 지연시간, 자기식별 응답)로 리버싱하는" 방법론은, CRS가 외부 벤더의 블랙박스 API(요금 엔진 등)의 특성을 추정해야 할 때 참고할 수 있는 조사 기법이다 — 단 이 글 자체가 보여주듯, 그 추정의 신뢰 수준은 "가능성이 높다" 정도로 제한해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 경쟁사 AI 모델의 기반을 추정하는 일 자체는 CRS 도메인과 무관하다. "블랙박스 API를 간접 신호로 조사하되 확실성의 한계를 인정한다"는 조사 방법론만 참고 가능.

## 연관 자료

- [[2026-09-20-jevs-architecture-unmasked]] — 같은 방법론(블랙박스 API 리버싱)의 선행 사례
- [[2026-11-10-flide-jev-inference-acceleration]] — Jev 계열의 가장 최근 선행 노트
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev의 개념(System One 모델) 소개 노트

## 한 달 뒤 회고

2026-12-26 즈음 — TypeSafe가 Jev의 기반 모델을 공식 확인·반박했는지, `autotrust/JEV-35B`와의 관계가 더 명확해졌는지 확인.
