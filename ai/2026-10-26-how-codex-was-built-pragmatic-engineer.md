---
title: "Codex는 어떻게 탄생했나 (Gergely Orosz, Pragmatic Engineer) — 클라우드 실패 뒤 로컬로 돌아와, Rust 공통 엔진으로 인터페이스와 모델을 분리했다"
source_title: "How Codex is built"
source_url: "https://newsletter.pragmaticengineer.com/p/how-codex-is-built"
source_name: "The Pragmatic Engineer (Gergely Orosz)"
referrer_url: "https://news.hada.io/topic?id=36004"
published_at: "2026-02-17 (WebSearch로 확인, 유료 구독자 전용 글)"
summarized_at: "2026-10-26"
category: "ai"
tags: ["openai", "codex", "coding-agent", "rust", "agent-harness", "product-market-fit", "claude-code-comparison"]
---

# Codex는 어떻게 탄생했나 (Gergely Orosz, Pragmatic Engineer)

> 출처: [How Codex is built](https://newsletter.pragmaticengineer.com/p/how-codex-is-built) (Gergely Orosz · The Pragmatic Engineer, 2026-02-17) · GeekNews(id=36004) 경유 · 정리일 2026-10-26
>
> **출처 한계(큼)**: `news.hada.io`와 `newsletter.pragmaticengineer.com` 모두 이번 세션에서 DNS 실패로 직접 열람하지 못했다. 이 글은 **유료 구독자 전용(paywalled)**이라 설령 접근됐어도 본문 전체를 못 봤을 가능성이 크다. Slack 발췌(Codex Cloud의 초기 실패, 로컬 도구 전환, Rust 공통 엔진 재작성, 데스크톱 앱이 내장 에디터를 배제한 설계)가 이 노트의 핵심 근거이고, WebSearch로는 **같은 저자의 선행 팟캐스트 인터뷰**("Building Codex with Tibo Sottiaux")와 이 유료 글의 공개 미리보기 조각(출발점이 2024년 말 내부 실험이었다는 것, Thibault Sottiaux·Shao-Qian Mah·Emma Tang 세 명을 인터뷰했다는 것, 출시 이후 사용량이 1월 초 대비 5배 늘었다는 것)만 교차확인했다. **Codex Cloud의 구체적 실패 이유(개발 환경 재설정 부담·개입 불가·모델 성능 부족)와 데스크톱 앱이 내장 코드 에디터를 뺐다는 설계 디테일은 이번 세션에서 1차 소스로 검증하지 못했다** — Slack 발췌를 신뢰하되, 그 사실 자체는 "미확인"으로 남긴다.

## 한 줄 요약

**Codex는 OpenAI 내부 연구·인프라 가속 실험에서 출발해, 초기 클라우드 전용 버전(Codex Cloud)이 개발 환경 재설정 부담·작업 중 개입 불가·모델 성능 부족으로 제품 시장 적합성을 찾지 못한 뒤 로컬 도구로 방향을 틀었고, 에이전트 핵심 로직을 Rust 기반 공통 엔진으로 재작성해 인터페이스(터미널·에디터·데스크톱 앱)와 분리하면서 현재는 월간 100만 명 이상이 쓰는 OpenAI의 핵심 제품 기반이 됐다.**

## 핵심 포인트

- **출발점 — 2024년 말 내부 실험** — Codex는 OpenAI 내부 연구와 인프라 개발을 가속하기 위한 모델/에이전트 실험에서 시작됐다(WebSearch로 교차확인). 연구 조직과 엔지니어링 조직이 모델과 하네스를 함께 설계하는 방식으로 발전했다는 점은 선행 인터뷰에서도 반복해서 확인된다.
- **Codex Cloud의 초기 실패(Slack 발췌 기준, 미확인)** — 개발 환경을 매번 다시 설정해야 하는 부담, 작업이 진행되는 동안 사람이 개입할 수 없는 구조, 당시 모델 성능의 한계가 겹쳐 제품 시장 적합성을 찾지 못했다고 Slack 발췌는 전한다. 이게 사실이라면, ***클라우드 우선 설계가 오히려 "사람이 지켜보며 고치는" 코딩 작업의 실제 흐름과 어긋났다는 뜻***이 된다 — 다만 이 구체적 서사는 원문 유료 영역에 있어 1차 확인은 못했다.
- **Rust 공통 엔진으로 재작성, 인터페이스와 분리** — 팀은 에이전트를 Rust 기반 공통 엔진으로 재작성해 터미널·코드 편집기 등 여러 인터페이스에서 재사용할 토대를 마련했다. 선행 팟캐스트 인터뷰(Tibo Sottiaux)에서 이미 확인된 ***"수백만 대의 클라우드 머신에서 돌아갈 것을 염두에 두고 정확성·보안·효율을 1원칙으로 삼아 Rust를 골랐다"***는 설계 철학과 정확히 같은 방향이다([[2026-09-21-tibo-codex-development-story]] 참고).
- **데스크톱 앱, 내장 에디터 배제(Slack 발췌 기준, 미확인)** — 데스크톱 앱은 자체 코드 편집기를 두지 않고 여러 에이전트에 작업을 위임하는 쪽에 집중했다고 Slack 발췌는 전한다. 사실이라면, Codex가 "에디터를 대체하는 제품"이 아니라 "여러 곳에서 돌아가는 에이전트를 통솔하는 제품"으로 자기 정체성을 잡았다는 뜻으로 읽힌다.
- **규모와 자기 생산성** — WebSearch로 확인한 선행 보도에 따르면 Codex는 2026년 1월 초 대비 사용량이 5배 늘었고, 팀 추산으로 Codex 앱 자체 코드의 90% 이상을 Codex가 작성했다 — 에이전트가 자기 자신을 만드는 재귀적 생산 구조가 꽤 진행된 상태임을 보여준다.

## 인상 깊은 문장

> "Scaffolding is coping, not scaling" — 같은 인물(Tibo Sottiaux)의 선행 팟캐스트 발언이지만, "모델이 좋아질수록 하네스는 줄어드는 방향으로 설계한다"는 이 철학이 이번 Rust 공통 엔진 재작성 서사(인터페이스와 핵심 로직을 분리해 어디서든 재사용 가능하게 만든 것) 뒤에도 그대로 깔려 있다고 읽을 수 있다.

## 댓글

GeekNews hada 댓글 수는 원문 접근 차단으로 확인하지 못했다. HN에서 이 특정 글("How Codex is built")을 다룬 스레드도 WebSearch로 특정하지 못했다 — The Pragmatic Engineer의 유료 딥다이브는 보통 HN에 공개 미리보기만 공유되는 경우가 많아, 댓글이 본문 전체가 아니라 미리보기에 대한 반응일 가능성도 있다. **읽을 때 감안**: 저자 Gergely Orosz는 OpenAI 쪽 세 명(Codex 헤드·모델 훈련 연구자·데이터 인프라 헤드)을 직접 인터뷰해 쓴 글이라, Codex Cloud의 "실패"를 OpenAI 스스로 회고하는 서사 — 즉 회사가 공개하기로 선택한 버전의 실패담일 수 있다는 점은 정직하게 밝혀둔다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-21-tibo-codex-development-story]]와의 연결(같은 인물, 다른 시점·형식의 보강).** 그 노트는 같은 Tibo Sottiaux의 팟캐스트 인터뷰를 다뤘고 "하네스는 모델의 부족함을 메우는 목발"이라는 철학을 확인했다. 이번 글은 그 철학이 **구체적으로 어떤 제품 결정(클라우드 실패 → 로컬 전환 → Rust 공통 엔진 분리)으로 나타났는지**를 시간순으로 채워준다. 두 글을 합치면 "철학(목발론)"과 "그 철학이 실제로 겪은 실패와 재설계 과정"이 한 쌍으로 완성된다.
**핵심 전이 2 — Claude Code와의 설계 비교(Claude Code 사용 각도).** Codex가 "인터페이스와 엔진을 분리해 여러 제품(터미널·에디터·데스크톱 앱)에서 재사용"하는 방향으로 간 것과 달리, Claude Code는 터미널 CLI 하나에 집중하며 기능을 거기에 쌓아온 궤적이 상대적으로 뚜렷하다. [[2026-08-03-boris-cherny-unhobbling-claude-code]]가 다룬 Claude Code의 설계 철학과 나란히 놓으면, ***"하나의 표면에 깊게 집중"(Claude Code)과 "하나의 엔진을 여러 표면에 재사용"(Codex)***이라는 서로 다른 확장 전략이 대비된다 — 어느 쪽이 맞다기보다, 두 회사가 각자 다른 길을 선택했다는 사실 자체가 흥미로운 지점이다. 평소 Claude Code를 쓰는 입장에서는, Codex의 "클라우드 우선 → 실패 → 로컬 회귀" 서사가 ***"에이전트가 결국 사람이 지켜보며 개입할 수 있는 로컬 환경에서 더 잘 작동한다"***는 교훈으로 일반화할 수 있는지가 관전 포인트다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 자체 코딩 에이전트 워크플로를 설계할 때 직접 참고할 만한 원칙 하나는, **"클라우드에서 전부 자동화하면 더 빠를 것"이라는 가정이 Codex Cloud 사례(미확인이지만 Slack 발췌 기준)에서는 틀렸다는 것**이다 — 사람이 작업 중 개입할 수 없는 구조는 실제 코딩 워크플로와 어긋났다. 온다 내부에서 에이전트 기반 자동화를 설계할 때도, "사람이 중간에 멈추고 고칠 수 있는가"를 클라우드 자동화의 편의성보다 먼저 확인하는 체크리스트로 쓸 수 있다. 다만 이건 일반 원칙 차원의 적용이고, CRS 도메인 로직(예약·요금)에 직접 이식할 기술적 결정은 아니다.

## 연관 자료

- [[2026-09-21-tibo-codex-development-story]] — 같은 인물(Tibo Sottiaux)의 선행 인터뷰. "하네스는 목발" 철학과 이번 글의 구체적 실패·재설계 서사가 한 쌍을 이룸
- [[2026-08-03-boris-cherny-unhobbling-claude-code]] — Claude Code 쪽의 설계 철학, "하나의 표면에 집중"이라는 대비축

## 한 달 뒤 회고

2026-11-26 즈음, `newsletter.pragmaticengineer.com` 접근이 풀렸거나 이 글의 비유료 요약이 추가로 공개됐다면 Codex Cloud 실패의 구체적 수치·시점과 데스크톱 앱의 에디터 배제 설계를 1차 소스로 재확인한다.
