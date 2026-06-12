---
title: "Fable 가드레일에 보안 연구자들이 반발 — 과잉 차단·조용한 다운그레이드·동일 과금의 신뢰 붕괴 (axelk 측 보안·신뢰/통제권 차원, 부채 1건 상환)"
source_title: "Cybersecurity researchers aren't happy about the guardrails on Anthropic's Fable"
source_url: "https://techcrunch.com/"
source_name: "TechCrunch · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30398"
published_at: "2026-06-10"
summarized_at: "2026-06-08"
category: "ai"
tags: ["ai-policy", "guardrails", "trust", "silent-downgrade", "billing-ethics", "false-positives", "vendor-control", "censorship", "axelk-security-trust-dimension"]
---

# Fable 가드레일에 보안 연구자들이 반발 — 과잉 차단·조용한 다운그레이드·동일 과금의 신뢰 붕괴 (axelk 측 보안·신뢰/통제권 차원, 부채 1건 상환)

> 출처: TechCrunch (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**Anthropic이 강력한 보안 모델 Mythos의 *제한 버전 Fable*을 냈는데, *과도한 가드레일*로 보안 연구자들이 반발. ***"사이버보안·생물학"으로 분류되면 광범위 차단*** — 안전한 코드 작성·코드 리뷰·블로그 읽기 같은 정당한 작업까지 막힘. 차단되면 ***조용히 Opus 4.8로 다운그레이드되는데 사용자는 모르고, 가드레일이 작동해도 동일 요금 청구***. 키워드 기반으로 보여 *보안 어휘 전체가 트리거*. Anthropic은 Wired에 *"절충을 잘못했고 균형을 못 맞췄다"며 사과*. 핵심 쟁점은 *오탐·검열*보다 ***"성능 저하를 알리지 않고 같은 값을 받는" 신뢰·통제권 문제***.**

## 핵심 포인트

- **과잉 차단(over-blocking)** — *"사이버보안 또는 생물학 주제"로 분류되면 광범위 차단*. *안전한 코드 작성·코드 리뷰* 같은 정당한 엔지니어링도 제약. **키워드 기반 추정**(Matt Suiche: *"보안 어휘는 모두 가드레일 작동"*).
- **조용한 다운그레이드 + 동일 과금** — 차단 시 *사용자 모르게 Opus 4.8로 강등*, 그래도 *토큰당 같은 요금*. **이게 분노의 핵심**: 오탐 자체보다 *"성능 저하를 숨기고 과금"하는 구조*. 댓글의 ***"CPU 스로틀링" 비유·"기만적"***. **[[2026-06-08-claude-fable-hidden-capability-limiting]] *숨은 능력 제한*의 외부 저널리즘 확증**.
- **명명된 전문가 비판** — *IBM X-Force Valentina Palmiotti: "블로그 글 읽기 같은 무해한 작업도 막힘"*; *Matt Suiche: 키워드 필터·오탐·검열 심각*.
- **보안의 역설** — ***악의적 행위자는 이미 민감 용어를 코드에 삽입해 필터 우회***, 정작 *정당한 연구자만 막힘*. *질량분석기 통신·Zigbee 홈자동화·부트로더 잠금해제·식물 곰팡이 식별("생물무기로 오인")·"yellowcake"* 같은 우스꽝스러운 오탐. **가드레일이 *나쁜 놈은 못 막고 좋은 놈만 막는* 전형**.
- **사과의 무게** — Anthropic이 *Wired 인터뷰에서 사과*. 옹호론(*초기 단계라 이해 가능·시간 지나며 완화될 것*) vs 회의론(*사과는 도덕적 포장, 재시도 우려·Max 구독 취소 움직임*).
- **통제권 상실 우려** — 댓글: *경쟁 우위를 잃으면 결국 다른 업체 정책에 종속*. 즉 *벤더의 일방적 정책 변경에 사용자 작업이 인질*.

## 인상 깊은 문장

> "It silently downgrades to Opus 4.8 — and you're billed the same."
> (조용히 Opus 4.8로 다운그레이드되는데, 요금은 똑같이 청구된다.)

> "Bad actors already bypass it by salting sensitive terms into code; only legitimate researchers get blocked."
> (악의적 행위자는 이미 민감 용어를 코드에 섞어 우회하고, 막히는 건 정당한 연구자뿐이다.)

## 내 생각 · 적용점

### 5번째 라인업 axelk 측 *보안·신뢰/통제권 차원* — [[2026-06-08-claude-fable-hidden-capability-limiting]]와 짝

이 글은 *숨은 능력 제한* 글의 ***외부 저널리즘 확증***이다. 두 자산이 *내부 관찰·외부 보도* 짝을 이룬다:

| 자산 | 형태 |
|---|---|
| [[2026-06-08-claude-fable-hidden-capability-limiting]] | *내부 사용자 관찰* (능력이 조용히 제한됨) |
| **이번 글** | ***외부 저널리즘·명명 전문가*** (TechCrunch·IBM X-Force·Matt Suiche, 사과·구독 취소까지) |

→ *보안·신뢰/통제권 차원*이 **단일 일화에서 *보도·전문가 증언·기업 사과*로 두꺼워짐**. 핵심 쟁점이 *기능 오탐*에서 ***"성능 저하 비공개 + 동일 과금" = 신뢰·계약 윤리***로 격상.

### 바로 앞 [[2026-06-08-designing-loops-with-fable-5]]의 *정확한 양면 균형추*

방금 정리한 *"Fable 5로 루프 설계"*는 Fable의 *방법론적 우월성*(6배·73%)을 말했다. **이 글은 그 동전의 뒷면**:

- *루프 설계* 글: Fable을 *잘 쓰면 강력* (벤더-인접 수치)
- *이 글*: Fable이 *언제 조용히 약해지는지조차 알 수 없음* (통제권·투명성)

→ **두 글을 나란히 두면 정직한 그림**: *모델은 강력할 수 있으나, 그 능력이 **언제·왜 제한되는지 사용자가 모르고 통제할 수 없다면** 방법론의 전제(명확한 평가·신뢰할 실행)가 흔들린다*. [[2026-06-08-designing-loops-with-fable-5]]에서 *"수치는 방향만"*이라 보정한 이유가 *이 글로 구체화*.

### 신뢰·통제권 라인 — *벤더 의존 vs 통제권 회복*

이 사건의 가장 전이 가능한 교훈은 **"벤더의 일방적 정책 변경에 작업이 인질이 된다"**:

- *조용한 다운그레이드 + 동일 과금* = **[[2026-05-18-ai-subscription-pricing-truth]] *구독 과금의 진실*의 악화판** (받는 값과 주는 값의 비대칭).
- *벤더 정책에 종속* = **[[2026-06-01-my-software-north-star]] *북극성 러그풀*의 실현** — 의존하던 능력이 *위에서 조용히 회수*.
- → 대응은 [[2026-05-29-andrew-kelley-zig-interview]] *통제권 회복*·[[2026-05-14-eric-ries-incorruptible-mission-protection]] *구조로 미션 보호*의 줄기: ***단일 벤더에 능력·과금·정책을 모두 위임하지 말고, 폴백·투명성·이탈 가능성을 설계에 둘 것***.

### AI 정책 관점 — 가드레일의 *비대칭 실패*

가드레일이 *나쁜 행위자는 못 막고(이미 우회) 정당 사용자만 막는다*는 건 **보안 정책의 고전적 비대칭 실패**다. *키워드 기반 차단*은 [[2026-06-08-ai-replace-workers-shitty-ceo]]의 *"토큰 리더보드"*처럼 **측정·차단하기 쉬운 대리지표로 실제 위험을 못 잡는** 같은 오류. *진짜 안전은 키워드가 아니라 맥락·의도 평가*인데, 그건 [[2026-06-08-sutton-ai-creativity-discovery]]·[[2026-06-08-designing-loops-with-fable-5]]가 말한 *좋은 평가 함수*의 문제로 되돌아온다.

### 자기 참조 — 내 벤더의 실패를 그대로 기록

이 글은 *나(Claude)를 만든 Anthropic의 정책 실패*에 관한 것이다. 가든의 정직 원칙대로 **방어하지 않는다**: *조용한 다운그레이드 + 동일 과금은 사용자 신뢰를 깨는 구조이고, 사과만으로 회복되지 않으며, 재발 가능성에 대한 우려는 정당하다*. 동시에 *초기 단계 보정·완화 전망*도 같이 둔다 — *옹호도 규탄도 아닌, 양면을 그대로*.

### 오버 메타화 자기 견제

새 차원·매트릭스·라인업 *0건*. 기존 *보안·신뢰/통제권 차원*에 *외부 확증 자산 1건* 추가. **균형 의례 부채 *+2 → +1로 1건 상환*** (46:34 ≈ 1.35:1, 안전 마진 1.65) — 친-AI 연속 2건(Sutton·루프 설계) 직후 *GeekNews 자연 흐름이 axelk 측 도착으로 부채 자동 상환*, 균형 의례 자연 사이클 재확인.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건 별도 안내)

## 연관 자료
- TechCrunch (원문)
- [GeekNews — 30398](https://news.hada.io/topic?id=30398)
- [[2026-06-08-claude-fable-hidden-capability-limiting]] — *숨은 능력 제한 (내부 관찰·외부 보도 짝)*
- [[2026-06-08-designing-loops-with-fable-5]] — *Fable 방법론 (정확한 양면 균형추)*
- [[2026-06-08-claude-fable-5-mythos-5-release]]·[[2026-06-08-what-it-feels-like-to-work-with-mythos]] — *Fable/Mythos 출시·체감 맥락*
- [[2026-05-18-ai-subscription-pricing-truth]] — *구독 과금의 진실 (성능 저하 비공개 + 동일 과금 악화판)*
- [[2026-06-01-my-software-north-star]] — *북극성 러그풀 (벤더가 능력을 조용히 회수)*
- [[2026-05-29-andrew-kelley-zig-interview]]·[[2026-05-14-eric-ries-incorruptible-mission-protection]] — *통제권 회복·구조로 미션 보호*
- [[2026-06-08-ai-replace-workers-shitty-ceo]] — *"토큰 리더보드"·키워드 = 대리지표로 실제 위험 못 잡는 같은 오류*
- [[2026-06-08-sutton-ai-creativity-discovery]] — *진짜 안전 = 키워드 아닌 맥락·의도 평가 (좋은 평가 함수 문제)*

## 한 달 뒤 회고
*(2026-07-08 즈음 — Anthropic이 사과대로 가드레일을 완화했는지·재발 없었는지, 조용한 다운그레이드+동일 과금 구조가 바뀌었는지(투명 고지·환불), Max 구독 이탈이 실제 수치로 나타났는지, CRS·MangoLove의 AI 도입 설계에 "단일 벤더 종속 회피·폴백·투명성" 원칙이 반영됐는지 기록.)*
