---
title: "OpenAI Codex Record & Replay — '시연이 프롬프트 설명보다 쉬운 작업'을 스킬로 (Lasn 측 실무 도구)"
source_title: "OpenAI Codex Record & Replay: turn a demo into a reusable Skill"
source_url: "https://developers.openai.com/codex/record-and-replay"
source_name: "OpenAI · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30642"
published_at: "2026-06-16"
summarized_at: "2026-06-08"
category: "ai"
tags: ["openai-codex", "record-replay", "skill", "demonstration", "computer-use", "workflow-automation", "lasn-practical-methodology"]
---

# OpenAI Codex Record & Replay — '시연이 프롬프트 설명보다 쉬운 작업'을 스킬로 (Lasn 측 실무 도구)

> 출처: OpenAI (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**OpenAI Codex의 *Record & Replay*는 *macOS에서 사용자가 수행하는 작업을 AI가 화면 녹화로 관찰한 뒤 재사용 가능한 스킬로 변환*한다. *반복적·UI 기반 작업(비용 청구·이슈 생성·리포트 다운로드)*에 적합하고, ***"직접 보여주는 편이 (프롬프트로 설명하는 것보다) 쉬운 작업"***에 효과적이다. 이후 유사 작업 시 *변수만 입력하면 자동 실행*. (Computer Use 활성화 필요, macOS 한정, EEA/영국/스위스 제외. 녹화는 간결하게, 숨은 선호는 녹화 후 보완.)**

## 핵심 포인트

- **"시연 > 설명"** — *프롬프트로 설명하기 어려운 작업은 한 번 보여주면 됨*. **[[2026-06-08-claude-code-designer-builds-with-ai]] *"파이프라인 통합"*·[[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals*의 시연 기반 버전**.
- **녹화 → 스킬(재사용)** — *워크플로를 학습해 변수만 바꿔 재실행*. **[[2026-06-08-designing-loops-with-fable-5]] *memory(규칙화·재사용)*·[[2026-06-08-homelab-ai-dev-platform]] *하네스*의 UI 자동화판**.
- **한계** — *macOS 한정·접근성 권한 필요(순수 화면만은 아님)·팀 배포엔 플러그인이 더 적합*.

## 인상 깊은 문장

> "Some tasks are easier to show than to describe — record once, replay forever."
> (어떤 작업은 설명보다 보여주기가 쉽다 — 한 번 녹화하면 계속 재생한다.)

## 댓글 (전수 확인)

> GeekNews 직댓글 2개:
- *armila: "옛날에도 좀 특이한 배포를 스텝바이스텝으로 지시한 다음 '이 세션에서 한 걸 스킬로 만들어' 하니까 만들어주던데, 더 발전된 기능인가 보네요."*
- *dongho42: "이건 스텝바이스텝 지시가 아니라 화면을 보고 내 작업을 알아서 skill로 만들어주더라. 단 접근성 요소 권한도 달라는 걸 보면 순수 화면만은 아니라 Windows·Linux에선 안 될 듯."*

→ **무게중심**: *한국 사용자도 "시연→스킬"을 흥미로워하되, "순수 화면이 아니라 접근성 권한 필요"라는 기술적 한계를 정확히 짚음.*

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* (counted)

*OpenAI가 "시연→재사용 스킬"이라는 실무 도구를 제공* — 친-AI 실무 방법론. Lasn 측 counted(부채 1건 상환). **균형 의례 부채 *−1 → 0*** (53:41 ≈ 1.29:1), 중립 복귀.

### 핵심 전이 1 — "시연이 명세의 한 형태"

가장 전이력 높은 통찰: ***프롬프트(텍스트 명세)로 설명하기 어려운 작업은 "시연"이 더 나은 명세***. 이는 세션의 *명세=memory·하네스*([[2026-06-08-designing-loops-with-fable-5]]·[[2026-06-08-homelab-ai-dev-platform]])의 다른 양식 — **암묵적 워크플로(UI 조작)는 텍스트보다 시연으로 포착**. 단 *"녹화→스킬"도 결국 "재사용 가능한 규칙화"*(memory 5단계의 UI 버전).

### 핵심 전이 2 — 단, "결정론적 작업은 결정론으로"

UI 자동화 스킬은 편리하나, [[2026-06-08-not-everyone-uses-ai-for-everything]] *"결정론적 도구를 LLM으로 대체하는 거꾸로"* 경계가 적용 — **반복적·결정론적 작업은 "AI 시연 스킬"보다 "스크립트/플러그인"이 더 안정적일 수 있다**(댓글의 "팀 배포엔 플러그인" 인정). *시연 스킬은 "스크립트화가 어려운 UI 작업"에 한정*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *Lasn 실무 도구* 사례(부채 상환). 부채 *−1 → 0* (53:41).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- OpenAI (원문) · [GeekNews — 30642](https://news.hada.io/topic?id=30642)
- [[2026-06-08-claude-code-designer-builds-with-ai]]·[[2026-05-19-openai-codex-goals-persistent-objectives]] — *"파이프라인 통합·Goals"(시연 기반)*
- [[2026-06-08-designing-loops-with-fable-5]]·[[2026-06-08-homelab-ai-dev-platform]] — *memory·하네스(재사용·자동화)*
- [[2026-06-08-not-everyone-uses-ai-for-everything]] — *"결정론적 작업은 스크립트로"(경계)*
- [[2026-06-08-sutton-ai-creativity-discovery]] — *"규칙화·재사용"(memory)*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "시연→스킬"이 실무 자동화에 자리잡았는지, "결정론적 작업은 스크립트로" 경계를 지켰는지, CRS의 반복 UI 작업(리포트·예약 처리)에 적용했는지 기록.)*
