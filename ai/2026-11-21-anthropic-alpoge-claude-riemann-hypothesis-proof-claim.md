---
title: "Anthropic 수학자, Claude와 함께 리만 가설·일반화 리만 가설을 증명했다고 발표 (Levent Alpöge) — 동료검토 전 '증명 주장'일 뿐, 이미 검증된 Anthropic의 8월 하한 개선 결과와는 다른 것"
source_title: "Remark"
source_url: "미특정 (Alpöge 개인 게시 PDF, 정확한 URL 확보 실패)"
source_name: "Levent Alpöge (Anthropic 소속 수학자, 개인 게시)"
referrer_url: "https://news.hada.io/topic?id=37529"
published_at: "2026-11-20"
summarized_at: "2026-11-21"
category: "ai"
tags: ["riemann-hypothesis", "math-proof", "claude", "lean", "formalization", "unverified-claim"]
---

# Anthropic 수학자, Claude와 함께 리만 가설·일반화 리만 가설을 증명했다고 발표 (Levent Alpöge) — 동료검토 전 '증명 주장'일 뿐, 이미 검증된 Anthropic의 8월 하한 개선 결과와는 다른 것

> 출처: Levent Alpöge의 "Remark" (개인 게시 PDF, GeekNews 경유) · 정리일 2026-11-21

## 한 줄 요약

**Anthropic 소속 수학자 Levent Alpöge가 2026-11-20 "Claude와 함께 작업하며 리만 가설의 증명을 발견했다고 믿는다"는 취지의 짧은 노트를 공개했고, 증명은 수백 페이지 분량의 논문이 아니라 Lean 4 형식화 코드 덩어리로 공개됐다 — 다만 이 글을 쓰는 지금까지 어느 전문가도 독립 검증을 완료했다고 보도하지 않았고 Clay Mathematics Institute도 여전히 "미해결"로 표시하고 있어, "증명했다"가 아니라 "증명 주장을 공개, 검증 진행 중"으로 읽어야 한다.**

## 핵심 포인트

- Alpöge 본인 서술(2차 보도 인용): "**I believe I have, working with Claude, discovered a proof of the Riemann Hypothesis.**" — 증명이 **일반화 리만 가설(GRH)까지 포괄**한다고 주장.
- 증명은 전통적 논문이 아니라 **Lean 4 코드**로 공개됐는데, 규모 자체가 소스마다 다르게 보도됨(14개 분할 파일 vs 25만 페이지 이상이라는 보도도 있어 **수치 자체가 불일치**) — 이것부터가 출처 혼선을 보여준다.
- 수학자 Elliot Glazer는 X에서 "공개된 정형화 문장이 실제로는 GRH"라고 언급했다는 2차 보도가 있으나, 이 역시 직접 확인하지 못했다.
- **검증 상태 미확정**: Scientific American·Futurism 등 복수 매체가 보도했지만 어느 곳도 독립 검증 완료를 확인하지 못했다. Anthropic의 공식 입장도 확인되지 않았다.
- Alpöge는 "초반엔 자신이 방향을 주도했으나, 후반에는 Claude가 자신이 통달하지 못한 수학 영역까지 증명을 진전시켰다"고 서술했다는 보도가 있다.
- **반드시 구별해야 할 점**: 이것과 전혀 다른, **이미 공식 검증된** Anthropic의 결과가 있다 — 2026년 8월 Anthropic의 연구용 Claude가 리만 제타함수 영점 중 임계선 위에 있는 비율의 **하한을 41.6%→67.2%로 개선**한 논문(Alpöge·Furman 검토, anthropic.com/research/riemann-zeta 공식 발표). **이건 "완전 증명"이 아니라 "부분적 하한 개선"**이고, 이번 11/20 "증명 주장"과 범위·검증 상태가 완전히 다르다 — 혼동하면 안 된다.

## 인상 깊은 문장

> "I believe I have, working with Claude, discovered a proof of the Riemann Hypothesis."

## 댓글

GeekNews(news.hada.io)가 이 세션에서 전면 차단되어 원문 페이지 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다. 원문 PDF 역시 정확한 URL을 확보하지 못해 2차 보도(Scientific American, Futurism, IBM Think 등)로만 재구성했다. **수학계 대형 미해결 문제의 증명 주장은 통상 검증에 수개월~수년이 걸리므로, 이 노트의 "증명했다"는 표현은 전부 저자 본인의 주장이며 외부 검증 결과가 아님을 명시한다.**

## 내 생각 · 적용점

### 핵심 전이 1 — "발표와 검증 사이의 간극"은 이 가든에서 반복되는 AI·수학 패턴

[[2026-10-27-openai-ai-math-physics-breakthroughs]]의 "발표와 검증 사이의 간극", [[2026-10-07-openai-722-math-manuscripts]]의 "발표 건수와 검증 건수를 분리해서 보는 습관", [[2026-09-09-tao-ai-mining-unsolved-math-problems]]의 "강력한 해결 도구가 난이도 지형을 평탄화해 유망 문제를 못 찾게 만든다"는 경고가 모두 같은 구조로 반복된다 — **AI가 수학 난제에 "증명했다"고 발표하는 빈도가 늘수록, 그 발표와 동료검토 완료 사이의 간극을 분리해서 보는 습관이 더 중요해진다.**

### 핵심 전이 2 — Lean 형식화가 "증명됨"을 보장하지 않는다는 반복되는 함정

Lean으로 형식화됐다는 사실만으로 수학적으로 완전하다고 오해하기 쉬운데, [[2026-09-27-we-need-more-mathematicians]]의 "증명됐다와 전제가 맞다는 별개"라는 지적처럼 **형식화는 "주어진 전제 안에서 논리가 맞다"는 것만 보장하고, 그 전제 자체가 리만 가설이 말하는 것과 정확히 같은지는 사람이 따로 검증해야 한다.** 이번 글에서 "공개된 정형화 문장이 실제로는 GRH"라는 Glazer의 지적(미확인이지만)이 바로 이런 함정의 구체적 사례일 수 있다.

### 핵심 전이 3 — 같은 날 쏟아진 경쟁 주장과의 관계 (클러스터 노트)

오늘 같은 배치에서 [[2026-11-21-masullo-grh-proof-attempt]](독립 연구자의 경쟁 GRH 증명안)와 [[2026-11-21-euler-navier-stokes-grh-singularities]](같은 저자 Alpöge가 함께 쓴 유체역학 논문, GRH를 보조정리로 사용)가 같은 날 공개됐다. 세 글은 같은 주장이 아니라 "2026-11-20 리만가설 소동"의 세 갈래이며, 전부 동료검토 미완료 상태다.

## 호스피탈리티 / CRS 적용 포인트

**적용 멀다.** 순수 수학 난제 증명 소식으로 CRS에 직접 적용할 지점은 없다. "발표와 검증 사이의 간극을 분리해서 본다"는 원칙만 일반론으로 참고 — 벤더나 파트너가 "해결했다"고 발표할 때, 그 발표가 자체 검증인지 독립 검증인지 구분하는 습관 정도.

## 연관 자료

- [[2026-11-21-masullo-grh-proof-attempt]] — *같은 날 공개된 독립 경쟁 GRH 증명안, "AI 없이 순수 인간 증명"이라는 대조 서사*
- [[2026-11-21-euler-navier-stokes-grh-singularities]] — *같은 저자 Alpöge가 함께 쓴 유체역학 짝 논문, GRH를 도구로 사용*
- [[2026-10-27-openai-ai-math-physics-breakthroughs]] — *"발표와 검증 사이의 간극"을 먼저 지적한 선행 사례*
- [[2026-09-09-tao-ai-mining-unsolved-math-problems]] — *AI의 수학 난제 채굴에 대한 Tao의 회의적 경고*

## 한 달 뒤 회고

*(2026-12-21 즈음 — Alpöge의 증명 주장이 동료검토를 거쳤는지, 수학계의 공식 반응이 나왔는지, 8월의 "하한 개선" 결과와 11월의 "완전 증명" 주장이 어떻게 연결되는지 추가 확인했는지 기록.)*
