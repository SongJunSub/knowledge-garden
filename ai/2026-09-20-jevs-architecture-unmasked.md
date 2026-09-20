---
title: "Jev의 아키텍처를 파헤치다 (Archer Hume) — 비공개 상용 API에 1만 번 호출을 던져 블랙박스 구조를 역추적한다"
source_title: "Jev's Architecture Unmasked"
source_url: "https://archerhume.com/posts/jevs-architecture-unmasked/"
source_name: "archerhume.com"
referrer_url: "https://news.hada.io/topic?id=33930"
published_at: "확인 불가"
summarized_at: "2026-09-20"
category: "ai"
tags: ["jev", "reverse-engineering", "typesafe", "black-box-api", "shared-state-encoding", "typed-judgments"]
---

# Jev의 아키텍처를 파헤치다 (Archer Hume)

> 출처: [Jev's Architecture Unmasked](https://archerhume.com/posts/jevs-architecture-unmasked/) (Archer Hume) · GeekNews(id=33930) 경유 · 정리일 2026-09-20
>
> **출처 한계**: `news.hada.io`·`archerhume.com` 모두 egress 차단으로 원문을 직접 읽지 못했다. Slack GN⁺ 발췌(5개 불릿, 마지막 불릿이 "선택지의 순서를 바꾸거나 무관한 선택지를 추가해…"에서 잘림)와 WebSearch 스니펫(같은 주제를 다룬 flaviocopes.com·GitHub `SamuelSacco/jev-exploration` 등 유사 분석 교차 확인)을 종합해 재구성했다. 이 글 자체는 저자 개인의 블랙박스 실험이라 hada·HN 댓글 논조는 확인하지 못했다.

## 한 줄 요약

**저자가 TypeSafe의 비공개 상용 모델 Jev에 약 1만 번의 API 호출을 보내 응답 시간·질문 간 정보 전달·선택지 변화를 관찰하는 방식으로 내부 구조를 역추적했다 — 공통 입력을 한 번 처리한 뒤 여러 질문을 서로 격리해 병렬로 판단하는 구조가 유력하다는 결론이다.**

## 핵심 포인트

- **방법론 — 블랙박스 프로빙** — Jev에 ***약 1만 번의 API 호출***을 보내, 응답 시간과 질문 간 정보 전달, 선택지 변화로 비공개 내부 구조를 추적했다 — 소스코드나 논문이 아니라 API 응답 패턴만으로 아키텍처를 역추론하는 접근.
- **유력 구조 — 공유 인코딩 + 격리된 병렬 판단** — ***공통 입력을 한 번 처리하고 여러 질문을 서로 격리해 병렬 판단***하는 구조가 유력하다는 게 핵심 추론. WebSearch로 확인한 유사 분석에서도 "shared-state encoding, isolated question branches, direct probability readouts"라는 표현이 나와, 공유 상태 인코딩 뒤 질문별로 독립된 분기를 태운다는 그림이 일관되게 뒷받침된다.
- **토큰 생성이 아니라 확률 직접 출력** — 답을 ***토큰 단위로 생성하지 않고 확률을 직접 출력***해 반복 계산과 생성 비용을 줄인다 — Jev의 공식 소개([[2026-09-16-typesafe-ai-jev-typed-judgments]])가 주장한 "토큰을 생성하지 않는 구조"를 외부에서 실험으로 재확인한 셈.
- **출력 토큰 수는 과금용 집계일 뿐** — API의 ***출력 토큰 수는 실제 생성 횟수가 아니라 과금용 집계***이며, ***선택지가 늘어 응답이 길어져도 처리 시간이 비례해 늘지는 않았다*** — "토큰 수 = 계산량"이라는 일반 LLM 직관이 Jev에는 그대로 적용되지 않는다는 걸 실험으로 보여준다.
- **선택지 순서·무관한 선택지 실험(발췌 일부 확인)** — 선택지의 순서를 바꾸거나 무관한 선택지를 추가하는 실험도 진행한 것으로 보이나, GN⁺ 발췌가 여기서 잘려 그 결과(순서에 민감한지, 무관한 선택지가 점수를 오염시키는지)는 확인하지 못했다.

## 인상 깊은 문장

> "The evidence points toward a causal transformer (likely using sparse MoE) repurposed for decisions: shared-state encoding, isolated question branches, and direct probability readouts instead of text generation."
> (WebSearch로 확보한 유사 분석의 원문 취지 재구성 — 이 글 자체의 정확한 문장은 미확보.)

## 댓글

**확인 불가.** hada 댓글 수·HN 반응 모두 이번 세션에서 대조하지 못했다. **읽을 때 감안**: 이건 어디까지나 ***블랙박스 프로빙을 통한 추론***이지 TypeSafe의 공식 확인이 아니다 — "유력하다"는 표현 자체가 저자도 확신하지 못한다는 뜻이고, 1만 번의 호출이라는 표본이 실제 내부 아키텍처를 얼마나 정확히 반영하는지는 검증할 길이 없다(원조 회사가 구조를 공개하지 않는 한).

## 내 생각 · 적용점

### 핵심 전이 1 — 원조 소개 노트의 주장을 외부에서 실험으로 재확인하는 관계

[[2026-09-16-typesafe-ai-jev-typed-judgments]]는 TypeSafe의 자체 발표를 근거로 "토큰 생성 없는 구조"를 소개하며 "벤더 자체 벤치마크라 외부 검증 전까지 유보적으로 봐야 한다"고 명시했다. 이 글은 그 유보를 부분적으로 해소한다 — 독립된 제3자가 블랙박스 실험으로 같은 결론(토큰을 생성하지 않는다)에 도달했다는 점에서, "주장"이 "정황 증거로 뒷받침된 추론"으로 한 단계 격상된다. 다만 정확도·보정 품질 같은 다른 주장들은 여전히 미검증 상태로 남는다.

### 핵심 전이 2 — 오늘 배치의 "새 계산 단위" 주장에 메커니즘을 붙여준다

[[2026-09-20-jev-structured-output-interesting-again]]은 "빠른 구조화된 출력이 새로운 계산 단위"라고 추상적으로 주장했다. 이 글이 추론한 "공유 인코딩 + 격리된 병렬 분기"라는 구조는 그 주장이 실제로 어떤 설계로 구현되는지 보여주는 메커니즘 층이다 — 세 글(구조적 주장, 아키텍처 추론, 실사용 속도 실증)이 같은 대상을 서로 다른 층위에서 검증하는 삼각형을 이룬다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS가 Jev의 내부 아키텍처를 알아야 할 실질적 이유는 없다. 다만 전이 가능한 원칙은 있다: 벤더가 비공개로 판매하는 API의 성능·비용 특성(이 경우 "선택지가 늘어도 처리 시간이 비례하지 않는다")을 도입 전에 직접 실험으로 확인하는 습관 — 벤더 소개 자료의 주장을 그대로 믿지 않고, 적은 비용으로도 자체 프로빙 테스트를 먼저 돌려보는 태도.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — 이 글이 외부 실험으로 재확인하는 원조 주장
- [[2026-09-20-jev-structured-output-interesting-again]] — "새 계산 단위"라는 추상적 주장, 이 글은 그 메커니즘
- [[2026-09-20-jev-evaluates-every-essay-in-0-7-seconds]] — 같은 대상의 실사용 속도·비용 실증

## 한 달 뒤 회고

*(2026-10-20 즈음 — `archerhume.com` 접근이 가능해지면 원문을 직접 대조하고, "선택지 순서·무관한 선택지" 실험 결과를 확인, TypeSafe가 이 역추적에 공식 반응을 냈는지 점검.)*
