---
title: "ChatGPT Work 도구·스킬 레퍼런스 (Simon Willison) — 에이전트에게 '네 도구를 전부 나열해봐'라고 시켜 223개 도구·44개 스킬을 통째로 자백시키다"
source_title: "Codex Tool Reference"
source_url: "https://codex-tool-reference.simonw.chatgpt.site/"
source_name: "codex-tool-reference.simonw.chatgpt.site (Simon Willison 제작)"
referrer_url: "https://news.hada.io/topic?id=33127"
published_at: "2026-09-01 (추정)"
summarized_at: "2026-09-02"
category: "ai"
tags: ["chatgpt-work", "codex", "tool-reference", "skills", "simon-willison", "automation", "github-integration", "data-analytics", "agent-transparency"]
---

# ChatGPT Work 도구·스킬 레퍼런스 (Simon Willison)

> 출처: [Codex Tool Reference](https://codex-tool-reference.simonw.chatgpt.site/) (Simon Willison · ChatGPT Sites) · 정리일 2026-09-02
> **출처 한계**: `news.hada.io`·`codex-tool-reference.simonw.chatgpt.site`·`news.ycombinator.com` 전부 이번 세션 egress 차단으로 원문을 한 줄도 못 읽었다. WebSearch 스니펫만으로 재구성했으며, "223개 등록 도구·44개 스킬"이라는 핵심 수치는 독립된 검색 결과 2곳 이상에서 일치해 신뢰도는 있는 편이다.

## 한 줄 요약

**Simon Willison이 ChatGPT Work에게 "네가 가진 도구를 전부 나열해서 사이트로 만들어봐"라고 시켰더니, Work가 스스로 등록 도구 223개(그중 6개는 Willison 자신의 개인 MCP)와 스킬 44개의 정의를 통째로 뽑아 ChatGPT Sites로 퍼블리시했다** — 벤더의 공식 문서가 아니라 에이전트 자신의 자기 진술로 나온, 아마 최초의 완전한 Work 도구맵이다.

## 핵심 포인트

- **제작 경위** — "카테고리별로 나누고, 각 도구가 무엇을 하는지 재현해서 설명하라"고 프롬프트. 이 과정에서 스킬 44개가 별도로 존재한다는 걸 알게 되어 스킬 전문도 추가.
- **자동화(Automations) 도구의 숨은 제약** — 조건 감시는 폴링 기반이라 ***시간당 최대 1회로 제한***되며, ***사전에 해당 앱이 연결돼 있어야만*** 자동화를 걸 수 있다.
- **GitHub 도구의 세분화와 금지 규칙** — 조회용/쓰기용 도구가 명확히 나뉘어 있고, ***경로나 사용자명 같은 식별자를 추측해서 호출하는 것을 명시적으로 금지***한다.
- **Data Analytics 도구의 검증 강제** — 분석 결과를 쓰기 전에 manifest와 snapshot을 먼저 검증하도록 설계됐고, 데이터셋은 최대 50개·각 최대 2,000행으로 제한된다.
- **스킬 44개의 성격** — 기존 도구를 이럴 때 이렇게 써라는 사용 설명서에 가깝다.

## 인상 깊은 문장

> "a complete reference to the tools and full skill definitions available in this Codex Work session." (사이트 자기소개 문구, 2차 소스 재구성)

## 댓글

**hada 댓글 수 확인 불가.** HN에 별도 스레드가 존재함을 확인했으나 포인트·댓글 수는 확인하지 못했다. **n=1 리버스엔지니어링**이라는 점도 밝혀둔다 — 실제 프로덕션 도구 정의와 100% 일치한다는 보장은 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-01-chatgpt-work-cloud-local-explained]]의 "불투명성" 문제에 대한 실천적 답

문서화가 안 된 시스템은, 그 시스템 자신에게 "네가 가진 것을 전부 나열해봐"라고 프롬프트해서 자백시킬 수 있다. 이건 벤더 문서 공백을 메우는 재현 가능한 방법론이다.

### 핵심 전이 2 — [[2026-07-10-chatgpt-work-agentic-platform]]에서 지적된 "Work/Codex 구분 불명확" 비판의 실체가 이번에 드러남

혼란의 원인은 기능이 없어서가 아니라 압도적으로 많은 기능이 표면 UX에 노출되지 않아서였다.

### 핵심 전이 3 — GitHub 도구의 "식별자 추측 금지" 규범은 코딩 에이전트 하네스 설계의 공통 원칙

에이전트가 존재를 확인하지 않은 대상에 쓰기 작업을 하지 못하게 막는다는 원칙이 벤더를 가리지 않고 수렴하고 있다는 방증.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이다. 다만 기법 자체는 전이 가능하다 — 벤더 문서가 없거나 오래된 사내 AI 에이전트가 있다면, 정기적으로 "네가 지금 쓸 수 있는 도구와 권한을 전부 나열해봐"라고 자체 감사를 시켜 시스템 프롬프트·도구 정의가 문서와 실제로 일치하는지 검증하는 루틴을 도입할 만하다.

## 연관 자료

- [[2026-09-01-chatgpt-work-cloud-local-explained]] — 같은 저자의 직전 심층 해설, 그 불투명성 문제 제기에 대한 실천적 후속작.
- [[2026-07-10-chatgpt-work-agentic-platform]] — Work 출시 당시 노트, "Work/Codex 구분 불명확" 비판이 이번 도구 레퍼런스로 실체가 드러남.

## 한 달 뒤 회고

*(2026-10-02 즈음 — 이 리버스엔지니어링 이후 OpenAI가 공식 도구 레퍼런스를 문서화했는지, 도구/스킬 구성이 바뀌었는지 재확인.)*
