---
title: "Lean·Mathlib 커뮤니티, 리만 가설 증명 '형식 검증' 완료 공동성명(Lean FRO) — 수학적 명제·코드 정합성 검증과 인간 동료검토의 완료는 다르다"
source_title: "Lean and Mathlib community statement on the verification of the Riemann Hypothesis proof"
source_url: "확인 불가 (Lean Zulip/GitHub 공동성명 원문 확보 실패)"
source_name: "Lean FRO·Mathlib 커뮤니티 (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=37586"
published_at: "2026-11-21"
summarized_at: "2026-11-22"
category: "ai"
tags: ["riemann-hypothesis", "lean", "mathlib", "formal-verification", "math-proof"]
---

# Lean·Mathlib 커뮤니티, 리만 가설 증명 '형식 검증' 완료 공동성명 (Lean FRO)

> 출처: Lean·Mathlib 커뮤니티 공동성명 (GeekNews 경유) · 정리일 2026-11-22

## 한 줄 요약

**Lean FRO·Mathlib 커뮤니티가 2026-11-21 "리만 가설의 명제와 증명이 모두 올바르다"는 공동성명을 내고, 1,700만 줄 규모로 공개된 Levent Alpöge의 Lean 증명이 Mathlib의 표준 명제와 정확히 일치하며 독립된 두 번째 커널(NanoDa)로도 재현됨을 확인했다 — 다만 이는 "기계적·형식적 검증"이며, Scientific American조차 "almost certainly true"라는 신중한 표현을 쓸 만큼 수학계의 완전한 동료검토는 아직 진행 중이다.**

## 핵심 포인트

- Lean FRO·Mathlib 커뮤니티는 2026-11-21 공동성명으로 ***"We hereby certify that both the statement and the proof of the Riemann Hypothesis are correct"*** 를 발표(Digg, Scientific American 보도로 교차확인).
- 증명은 **1,700만 줄 규모의 Lean 라이브러리**로 공개됐고, 직접 의존하는 외부 라이브러리는 Mathlib뿐 — Slack 발췌와 일치.
- **"증명한 대상이 우리가 알고 있는 리만 가설인지"**를 전문가들이 검토한 Mathlib의 표준 명제와 Alpöge의 정리를 독립 도구로 비교해 정확히 일치함을 확인 — 이 부분이 이번 성명의 핵심 기여다.
- MIT의 **Andrew Sutherland**가 독립적으로 Lean 코드를 재컴파일해 성공, 커널이 표준 공리 3개만으로 재검증했다고 언급. 수십 명이 정상 컴파일·원시 증명 내보내기 파일 재현을 보고(Slack 발췌와 일치).
- ***구분이 중요***: (a) "명제가 우리가 아는 리만 가설과 같다", (b) "코드가 정상 컴파일되고 두 번째 커널로도 재현된다"는 **형식적·기계적 검증**이고, "리만 가설이 수학적으로 증명됐다"는 **인간 동료검토·수학계 공식 합의**는 별개다. kingy.ai 등 보도에 따르면 Sutherland의 end-to-end 비교 실행조차 여전히 "in progress"로 언급됨.

## 인상 깊은 문장

> "We hereby certify that both the statement and the proof of the Riemann Hypothesis are correct." — Lean·Mathlib 커뮤니티 공동성명 (Digg·Scientific American 경유 재인용, 1차 원문 미확보)

## 댓글

news.hada.io가 세션 네트워크에서 전면 차단되어 GeekNews 원문 댓글 수는 확인하지 못했다. 다만 이번 건은 Digg·Scientific American이라는 복수의 독립 2차 매체로 핵심 사실(공동성명 발표, Sutherland의 독립 재현)이 교차확인되어 신뢰도가 높다. 성명 원문(Zulip/GitHub) 자체는 직접 확보하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "증명 주장"에서 "형식 검증 완료"로, 그러나 여전히 "증명됐다"는 아니다

이틀 전 [[2026-11-21-anthropic-alpoge-claude-riemann-hypothesis-proof-claim]]에서는 "증명했다가 아니라 증명 주장 공개"로 신중하게 선을 그었는데, 이번 Lean 검증 완료로 **형식적 정합성**은 확정됐다. 하지만 이 노트에서 짚었듯 기계적 검증과 인간 동료검토는 다른 축이라, 결론은 여전히 "증명이 틀렸을 가능성은 극히 낮아졌다"까지만 당겨졌을 뿐 "수학계가 증명됐다고 선언했다"로 비약하면 안 된다.

### 핵심 전이 2 — Fermat 형식화와 같은 "검증 인프라" 패턴의 재확인

[[2026-09-05-anthropic-fermat-last-theorem-lean]]에서 다뤘던 "Lean으로 거대 증명을 형식화·병렬 검증하는 인프라" 패턴이 이번에도 그대로 작동했다 — 다만 이번엔 Anthropic 한 회사의 내부 인프라가 아니라 Mathlib이라는 공개 커뮤니티 전체가 독립적으로 검증 작업을 수행했다는 점에서 "검증의 분산화"가 한 단계 더 진행된 사례다.

## 호스피탈리티 / CRS 적용 포인트

**멀다, 원칙만 참고.** 수학 증명의 형식 검증은 CRS와 접점이 없지만, "기계적 검증 통과"와 "전문가 최종 승인"을 분리해서 보도/보고하는 태도는, AI가 생성한 요금·예약 로직을 검증할 때도 "자동 테스트 통과"와 "운영 승인"을 섞지 않는 원칙으로 전이할 수 있다.

## 연관 자료

- [[2026-11-21-anthropic-alpoge-claude-riemann-hypothesis-proof-claim]] — *이틀 전 "증명 주장" 공개, 이번 성명으로 형식 검증 완료*
- [[2026-09-05-anthropic-fermat-last-theorem-lean]] — *같은 Lean 기반 대규모 형식 검증 인프라 패턴의 선행 사례*
- [[2026-11-22-riemann-proof-human-agency-loss]] — *이 검증 완료 소식이 촉발한 철학적 반응(같은 배치)*
- [[2026-11-22-re-riemann-ai-human-agency]] — *같은 주제의 또 다른 독립적 반응 글(같은 배치)*

## 한 달 뒤 회고

*(2026-12-22 즈음 — Sutherland의 end-to-end 비교 실행이 완료됐는지, 수학계의 공식 동료검토 결과가 나왔는지 확인.)*
