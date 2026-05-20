---
title: "AI의 세 가지 역법칙 — 인간이 AI와 상호작용할 때의 원칙"
source_title: "Inverse Laws of Robotics"
source_url: "https://susam.net/inverse-laws-of-robotics.html"
source_name: "Susam Pal's Blog"
referrer_url: "https://news.hada.io/topic?id=29223"
published_at: "2026-01-12"
summarized_at: "2026-05-07"
category: "ai"
tags: ["AI윤리", "책임", "의인화", "검증", "Asimov", "원칙"]
---

# AI의 세 가지 역법칙 — 인간이 AI와 상호작용할 때의 원칙

> 출처: [Susam Pal — Inverse Laws of Robotics](https://susam.net/inverse-laws-of-robotics.html) · 레퍼러: [GeekNews 29223](https://news.hada.io/topic?id=29223) · 정리일 2026-05-07

## 한 줄 요약
아시모프의 *로봇 행동* 3법칙을 뒤집어 **인간이 AI를 *어떻게 다뤄야 하는가*** 의 3원칙으로 재구성 — *의인화 금지 / 맹목적 신뢰 금지 / 책임 포기 금지*.

## 핵심 — 역법칙 3가지

### 1. 의인화 금지 (Non-Anthropomorphism)
> "Humans must not anthropomorphise AI systems. That is, humans must not attribute emotions, intentions or moral agency to them."

- AI = *데이터 패턴 기반 *그럴듯한 텍스트* 생성하는 통계 모델*
- 사람다운 언어가 *진정한 이해·의도*로 오인되기 쉬움
- 처방: *조금 더 로봇처럼 톤*이 사용자가 *유창성을 이해로* 착각할 가능성을 줄인다

> "A slightly more robotic tone would reduce the likelihood that users mistake fluent language for understanding."

### 2. 맹목적 신뢰 금지 (Non-Deference)
> "AI-generated content must not be treated as authoritative without independent verification appropriate to its context."

- AI 출력 = *피어 리뷰 없는* 확률적 생성물
- AI가 발전해도 *오류 가능성은 0이 되지 않음*
- 검색엔진이 상단에 띄운 AI 답변을 *검증 없이 받아들이는 습관*이 가장 위험

> "Over time, this could inadvertently train users to treat AI as the default authority rather than as a starting point."

### 3. 책임 포기 금지 (Non-Abdication of Responsibility)
> "Humans must remain fully responsible for decisions involving AI and accountable for consequences arising from its use."

- AI는 *목표를 선택하지도, 자신을 배포하지도, 실패 비용을 지지도 않는다*. *사람과 조직이* 한다.
- *"AI가 그렇게 말했다"* 는 변명이 일상화되는 게 가장 큰 위험

> "We should never accept 'the AI told us so' as an acceptable excuse for harmful outcomes."

> "AI is a tool we choose to use, not an authority we defer to."

### 한계 인정
> "No finite set of laws can ever be foolproof for the complex issues we face with AI and robotics."

저자도 이 3법칙이 *완전한 답*은 아님을 인정. 출발점일 뿐.

## 인상 깊은 문장

> "AI is a tool we choose to use, not an authority we defer to."

> "We should never accept 'the AI told us so' as an acceptable excuse for harmful outcomes."

> "A slightly more robotic tone would reduce the likelihood that users mistake fluent language for understanding."

> "Over time, this could inadvertently train users to treat AI as the default authority rather than as a starting point."

> "No finite set of laws can ever be foolproof for the complex issues we face with AI and robotics."

## 내 생각 · 적용점

### 가든 *Agent-Default Posture* 시리즈의 *원칙 층위*
가든 안에서 같은 정신이 여러 층위로 등장:

| 층위 | 글 |
|---|---|
| **원칙** (왜?) | **이 글 — 3 역법칙** |
| 인프라 (어떻게?) | [9초 사고](2026-04-27-ai-agent-deleted-production-database.md) / [DB 삭제는 당신이](2026-05-07-ai-didnt-delete-your-database-you-did.md) |
| 사고 (개인) | [Elevate not Replace](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) / [Trap](2026-05-05-agentic-coding-is-a-trap.md) |
| 조직 | [확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md) / [Glaser 조직 학습](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) |

이 글은 *"왜 그래야 하는가"*의 가장 압축된 답. 다른 글들이 *방법론*이라면 이 글은 *원칙 헌장*.

### *책임 포기 금지* — 실무 함정
지금 한국 IT에서 *"Claude가 그렇게 말했는데..."* 가 회의·PR 리뷰에 등장하기 시작했다. 댓글의 지적과 동일.
- 이 표현이 *책임 회피의 코드*가 되지 않게 하려면 **명시적 룰화** 필요
- MangoLove 추가 후보: *PR/티켓에서 "AI가 제안했다"는 표현은 *근거가 아니라 출처 메타데이터*로만 허용*

### *의인화 금지*의 한계 — 댓글이 더 정확
- 인간은 *무엇이든 의인화*하므로 규칙으로 막기 어렵다는 지적이 맞다
- 더 현실적 처방: *AI 응답 톤을 의식적으로 사무적으로 유지* (Claude의 *"Sure, I'd be happy to..."* 같은 친화 톤이 *의인화 압력*을 만든다)
- caveman skill 같은 [mattpocock](2026-04-29-mattpocock-skills-vs-mangolove.md) 패턴이 *의인화 감소* 부수효과를 가질 수 있음

### *맹목적 신뢰 금지* — 가든 큐레이션 자기 점검
가든의 글들이 *Claude의 요약*에 기반한 부분이 큼. 이 글의 처방을 *나 자신*에게 적용하면:
- 가든 글의 *원문 인용은 verified*해야 함 (요약이 아니라)
- *호스피탈리티 적용 메모*는 *내 판단*이지 *Claude 판단이 아님*을 명시
- 가든 자체가 *권위가 아니라 시작점*이라는 것을 README에 박아둘 가치

### 호스피탈리티/CRS 적용 — 3법칙을 *코드 리뷰 룰*로
| 법칙 | 코드 리뷰 / 운영 룰 |
|---|---|
| **의인화 금지** | 시스템 메시지·에이전트 응답에 *과도한 친근 톤 지양* (특히 호텔 컨시어지 봇 — *명확한 정보 전달*이 *공감 연기*보다 가치) |
| **맹목적 신뢰 금지** | AI가 만든 코드는 *사람 코드와 동일한 리뷰 통과* 필요. AI 라벨이 *완화 사유 X* |
| **책임 포기 금지** | 사고 RCA에 *"AI가 했다"* 만 적힌 항목은 *근본 원인 분석 부족*으로 반려 |

### MangoLove에 명시적 추가 후보
*4번째 핵심 원칙으로 strict.md에 추가 가능*:
> "에이전트 출력은 *권위가 아니라 시작점*이다. 모든 결정의 책임은 *항상 사용자*에게 있다."

[Agent-Default Posture](../career/2026-05-05-rise-of-the-probabilistic-founder.md)와 짝이 되는 *원칙 선언* — 자기 책임 강조의 명문화.

### 반론·균형점
- *의인화 금지*가 너무 강하면 *공감·돌봄 도메인*(상담·교육·헬스케어 챗봇)에서 *역효과* — 적정 의인화는 사용자 경험에 필요
- *모든 출력 검증* 요구는 *현실적으로 불가능* — *컨텍스트별 적정 검증*(저자도 *"appropriate to its context"* 명시)이 핵심
- 이 3법칙은 *최소 윤리 베이스라인* — *적용 강도*는 도메인·위험·맥락에 따라 다름

## 즉시 시도할 액션 3가지
1. **MangoLove `strict.md`에 *Inverse Laws 4번째 원칙* 추가 검토** — Agent-Default Posture와 짝
2. **가든 README에 *맹목적 신뢰 금지* 명시** — *"이 가든은 시작점이지 권위가 아니다"* 1문장
3. **PR 룰 후보**: *"AI가 제안했다"는 표현은 *근거 X, 출처 메타데이터 O***

## 연관 자료
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — *Agent-Default Posture* (조직 적용)
- [`ai/2026-05-07-ai-didnt-delete-your-database-you-did.md`](2026-05-07-ai-didnt-delete-your-database-you-did.md) — *책임 포기 금지*의 인프라 사례
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — *맹목적 신뢰 금지*의 사고 차원
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](2026-05-05-agentic-coding-is-a-trap.md) — 같은 비판적 흐름
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — *법칙 모음* 형식의 짝

## 한 달 뒤 회고
- [ ] *4번째 원칙* MangoLove 추가 검토 했는가
- [ ] 가든 README *시작점이지 권위 아님* 추가했는가
- [ ] *"AI가 제안했다"* 책임 회피 표현이 PR/회의에서 등장한 사례를 1회라도 *지적했는가*
