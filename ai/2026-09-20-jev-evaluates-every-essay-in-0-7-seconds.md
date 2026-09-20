---
title: "TypeSafe의 Jev가 내가 쓴 모든 글을 0.7초 만에 평가했다 (Mike Taylor, Every) — 777건의 판단, 0.25센트, AI 말투 탐지 실험"
source_title: "Mini-Vibe Check: TypeSafe's Jev Judged Everything I've Written in 0.7 Seconds"
source_url: "https://every.to/also-true-for-humans/mini-vibe-check-typesafe-s-jev-judged-everything-i-ve-written-in-0-7-seconds"
source_name: "Every (also true for humans)"
referrer_url: "https://news.hada.io/topic?id=33973"
published_at: "확인 불가"
summarized_at: "2026-09-20"
category: "ai"
tags: ["jev", "typed-judgments", "ai-writing-detection", "typesafe", "benchmark", "essay-analysis"]
---

# TypeSafe의 Jev가 내가 쓴 모든 글을 0.7초 만에 평가했다 (Mike Taylor, Every)

> 출처: [Mini-Vibe Check: TypeSafe's Jev Judged Everything I've Written in 0.7 Seconds](https://every.to/also-true-for-humans/mini-vibe-check-typesafe-s-jev-judged-everything-i-ve-written-in-0-7-seconds) (Mike Taylor, Every) · GeekNews(id=33973) 경유 · 정리일 2026-09-20
>
> **출처 한계**: `news.hada.io`·`every.to` 모두 egress 차단으로 원문을 직접 읽지 못했다. Slack GN⁺ 발췌(4개 불릿, 마지막 불릿이 "Jev의 차별성이 모델 자체…"에서 잘림)와 WebSearch 스니펫을 교차해 재구성했다 — WebSearch로 저자가 Mike Taylor이고 대상 문서가 Every 기사 27편 + 의도적으로 AI 말투로 쓴 대조군 10편(총 37편)이라는 세부까지 확인했으나, 정확한 21개 평가 기준 목록이나 hada/HN 댓글 논조까지는 확인하지 못했다.

## 한 줄 요약

**Every의 필자 Mike Taylor가 자신이 쓴 글 27편과 일부러 AI 말투로 다시 쓴 대조군 10편(총 37편)을 TypeSafe의 Jev에 넣어 반복·억지 양비론·과도한 설명 등 21개 기준으로 평가시켰더니, 777건의 판단이 0.7초 미만·약 0.25센트에 끝났다 — 텍스트 생성이 아니라 확률 판정이기 때문에 가능한 속도다.**

## 핵심 포인트

- **판단 자체가 텍스트가 아니라 확률** — Jev는 자연어 질문에 서술형 답변 대신 ***예/아니요 또는 사용자가 정의한 범주별 확률***을 반환해, 코드가 곧바로 판단에 활용할 수 있는 형태로 결과를 준다.
- **37개 문서 × 21개 기준 = 777건, 0.7초 미만** — 글의 반복, 억지 양비론, 과도한 설명 등 ***21개 기준으로 37개 문서(진짜 글 27편 + 의도적으로 AI 말투로 쓴 대조군 10편)를 검사***해 777건의 판단을 0.7초 미만에 반환, 추정 비용은 ***0.25센트***.
- **11개 실험, 1,709건, 1센트 미만** — 코드 파일 찾기, 고객 지원 답변 평가, 위험한 에이전트 행동 표시 등 ***11개 실험에서 총 1,709건***을 판단했고 추정 비용은 ***1센트 미만*** — 반복 판단 작업 전체를 사실상 무시할 만한 비용으로 처리한 셈.
- **별도 글쓰기 검사 — Fable 5.1 대비 약 25배 빠름** — 별도의 글쓰기 품질 검사 실험에서는 Jev가 ***Fable 5.1보다 약 25배 빠르고 비용도 더 낮았다***는 비교가 인용된다(정확한 비용 배수는 GN⁺ 발췌가 문장 중간에 잘려 확보하지 못함).
- **가격 구조** — WebSearch로 확인한 바로는 Jev가 ***100만 토큰이 아니라 10억 토큰당 42달러***로 가격이 매겨져 있다는 점이 일반 LLM 과금 단위와 다르다는 점도 이 실험의 저비용을 뒷받침한다.

## 인상 깊은 문장

> "37 documents — 27 real articles and 10 deliberately AI-styled counterparts — with 777 judgments completed in under 0.7 seconds at an estimated cost of roughly a quarter of a cent."
> (WebSearch로 확보한 원문 인용 취지의 재구성.)

## 댓글

**확인 불가.** hada 댓글 수·HN 반응 모두 이번 세션에서 확인하지 못했다. **읽을 때 감안**: 이 실험은 저자 1인이 자신의 글로 직접 돌린 n=1 사례 연구이고, "AI 말투로 일부러 다시 쓴 대조군 10편"을 Jev가 실제로 얼마나 정확히 걸러냈는지(정밀도·재현율)는 이 정보만으로는 확인할 수 없다 — 판단이 빠르고 쌌다는 것과 판단이 정확했다는 것은 다른 주장이다.

## 내 생각 · 적용점

### 핵심 전이 1 — "새 계산 단위" 주장을 숫자로 채우는 실증 사례

[[2026-09-20-jev-structured-output-interesting-again]]은 "빠른 구조화된 출력이 새로운 계산 단위가 될 수 있다"고 추상적으로 주장했다. 이 글은 그 주장에 구체적인 숫자(777건·0.7초·0.25센트)를 채워 넣는 실사용 사례다 — 다만 정확도 검증 없이 속도·비용만 증명한다는 한계는 그대로 남는다.

### 핵심 전이 2 — AI 말투 탐지라는 용도는 이미 다른 노트들이 다룬 문제의 실전 도구화

[[2026-08-18-gruber-watermark-perversion-of-writing]]과 [[2026-08-28-github-pr-claude-like-prose-analysis]]는 "AI가 쓴 티가 나는 문장 패턴"이 실제로 존재하고 탐지 가능하다는 논지를 다뤘다. 이 실험은 그 탐지 작업을 사람이 직접 읽는 대신 Jev로 자동화·대량화한 사례로 읽을 수 있다 — 다만 Jev의 판정 자체가 얼마나 신뢰할 만한지는 이 실험만으로는 검증되지 않는다는 점에서, 탐지 도구가 하나 더 늘었다는 것 이상의 결론은 유보해야 한다.

## 호스피탈리티 / CRS 적용 포인트

리뷰·문의 텍스트의 대량 1차 분류(감성 점수, 긴급도, AI 생성 스팸 여부)에 직접 적용 가능한 사례다. 다만 이 글이 보여준 건 속도·비용이지 정확도 검증이 아니므로, CRS 파이프라인에 넣기 전에는 반드시 골든셋으로 정밀도·재현율을 먼저 측정해야 한다는 원칙을 함께 남긴다.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Jev 원조 소개, 이 실험이 실사용으로 확장한 대상
- [[2026-09-20-jev-structured-output-interesting-again]] — 같은 배치의 자매 글, "새 계산 단위" 주장을 이 실험이 숫자로 뒷받침
- [[2026-08-18-gruber-watermark-perversion-of-writing]] — AI 말투 탐지라는 용도의 선행 논지
- [[2026-08-28-github-pr-claude-like-prose-analysis]] — 같은 AI 말투 탐지를 다른 도메인(PR 설명)에서 다룬 사례

## 한 달 뒤 회고

*(2026-10-20 즈음 — Jev의 AI 말투 판정이 실제로 정밀도·재현율 검증을 거쳤는지, 이 실험이 다른 필자·플랫폼으로 재현됐는지 확인.)*
