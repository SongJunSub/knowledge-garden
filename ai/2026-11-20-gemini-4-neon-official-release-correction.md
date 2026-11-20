---
title: "Gemini 4 Neon, 공식 출시로 확인됨 (Google 공식 블로그) — 어제 '비공식 유출 코드네임'이라 썼던 판단을 하루 만에 정정한다"
source_title: "Introducing Gemini 4 Neon"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-4-neon/"
source_name: "Google 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=37456"
published_at: "2026-11-18"
summarized_at: "2026-11-20"
category: "ai"
tags: ["gemini-4-neon", "google", "benchmark", "correction", "agent-arena"]
---

# Gemini 4 Neon, 공식 출시로 확인됨 (Google 공식 블로그)

> 출처: [Introducing Gemini 4 Neon](https://blog.google/innovation-and-ai/models-and-research/gemini-4-neon/) (Google 공식 블로그) · [GeekNews](https://news.hada.io/topic?id=37456) 경유 · 정리일 2026-11-20
>
> **정정 고지**: 바로 하루 전(2026-11-19) 작성한 [[2026-11-19-gemini-4-neon-unconfirmed-leak]]는 "Gemini 4 Neon = Google 비공식 유출 코드네임, 모델 여부조차 불명확"이라고 판단했다. 그런데 이 글의 근거를 다시 짚어보니, Google은 ***2026-11-18에 Gemini 4 Neon을 공식 발표***했다 — 어제 노트가 다룬 유출설은 공식 발표 이전 상황이었던 것으로 보인다. 과거 기록은 수정하지 않고(레포 관례), 이 노트로 정정 사실을 명시적으로 남긴다.

## 한 줄 요약

**Gemini 4 Neon은 유출 코드네임이 아니라 2026-11-18 Google이 공식 발표한 모델로, Carbon과 Hydrogen 사이에 포지션하며 Artificial Analysis Intelligence Index 61점(Opus 5.5는 59점)을 기록했지만 Slack 발췌의 "Agent Duel Elo 1,066 vs 1,078" 수치는 출처를 찾지 못했다.**

## 핵심 포인트

- Google이 ***2026-11-18 공식 발표***하고 Gemini API·AI Studio·Antigravity·Gemini 앱으로 롤아웃했다. 하루 전 다른 노트가 "비공식 유출"로 판단한 건 공식 발표 **이전** 시점의 정보였다.
- Carbon과 Hydrogen 사이 포지션의 모델로, Artificial Analysis Intelligence Index 61점을 기록(Opus 5.5는 59점으로 비교됨).
- Arena.ai Agent Arena Index에서는 전체 2위(1336점, 1위는 Claude Fable 5.2 Max 1463점)로, Opus 5.5 Max보다 53% 저렴하다는 서술이 있다.
- ***Slack 발췌의 "Agent Duel Elo 1,066 vs 1,078" 수치는 출처를 찾지 못했다*** — AAII나 Arena Index 같은 다른 벤치마크와 혼동된 수치일 가능성이 있다.
- Carbon은 기존 Agent Duel 순위표(조기 투표 제외)에서 최고 모델이지만 느린 응답 속도가 주요 문제로 지적돼왔는데, Neon은 벤치마크가 소폭 개선되고 속도가 크게 향상된 것으로 보인다.

## 인상 깊은 문장

> (공식 블로그 발표문의 정확한 인용은 직접 재확인이 더 필요하다 — "rolling out today" 수준의 표현만 확보했다.)

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: AAII·Agent Arena Index 수치는 벤더 발표와 제3자 집계가 섞여 있고, Slack이 언급한 Agent Duel Elo 수치는 끝내 출처를 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 레포 자신의 판단이 하루 만에 뒤집힌 사례

[[2026-11-19-gemini-4-neon-unconfirmed-leak]]는 "미확인 유출 코드네임"으로 신중하게 판단했지만, 하루 뒤 공식 발표로 그 판단이 뒤집혔다. 이는 레포가 반복해서 마주하는 교훈 — [[2026-11-20-nginx2root-rce-cve-confirmed-correction]]에서도 "당일 미확인이 영구 미확인을 의미하지 않는다"는 같은 패턴이 나타난다. 급변하는 소식은 "미확인"이라는 판단 자체도 시한부라는 걸 레포가 스스로 보여준다. [[2026-11-11-gemini-4-carbon-release]]와는 같은 세대의 대조군이다.

### 적용점

"미확인"으로 분류한 소식은 하루 이틀 뒤 공식화될 수 있으므로, 중요한 벤더 발표 소식은 하루 간격으로 재검색해보는 습관이 유용하다는 걸 이번 사례가 직접 증명한다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 모델 선택 참고 정보일 뿐 직접 적용점은 없다. 다만 "벤더 발표 소식의 미확인 판단은 유효기간이 짧다"는 원칙은 AI 모델 조달 의사결정 프로세스에 참고할 만하다.

## 연관 자료

- [[2026-11-19-gemini-4-neon-unconfirmed-leak]] — 이 노트가 정정하는 바로 전날의 판단
- [[2026-11-11-gemini-4-carbon-release]] — 같은 세대의 대조군(속도 문제가 지적된 모델)
- [[2026-11-20-nginx2root-rce-cve-confirmed-correction]] — 같은 배치, "당일 미확인 ≠ 영구 미확인"이라는 같은 교훈

## 한 달 뒤 회고

2026-12-20 즈음 — Agent Duel Elo 1,066/1,078 수치의 실제 출처를 확인했는지, Neon의 실사용 평가가 축적됐는지 점검.
