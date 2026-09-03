---
title: "Claude Code Week 34 (v2.1.234–v2.1.239) — /design로 아트보드 워크플로 도입, Concise 출력 스타일, 그리고 폰에서 내 컴퓨터로 세션 시작하기"
source_title: "Week 34 · August 17–21, 2026"
source_url: "https://code.claude.com/docs/en/whats-new/2026-w34"
source_name: "code.claude.com"
referrer_url: "https://code.claude.com/docs/en/whats-new#week-34"
published_at: "2026-08-21"
summarized_at: "2026-09-03"
category: "ai"
tags: ["claude-code", "changelog", "design-skill", "output-style", "remote-control", "claude-usage"]
---

# Claude Code Week 34 (v2.1.234–v2.1.239) — /design로 아트보드 워크플로 도입, Concise 출력 스타일, 그리고 폰에서 내 컴퓨터로 세션 시작하기

> 출처: [Week 34 · August 17–21, 2026](https://code.claude.com/docs/en/whats-new/2026-w34) (Claude Code 공식 What's New) · 정리일 2026-09-03

## 한 줄 요약

**`/design`이 Claude Design의 아트보드 워크플로를 CLI·데스크톱에 들여오고, 새 Concise 출력 스타일은 서론 없이 결과부터 보여주며(단, 오류·보안 경고·파괴적 작업 확인은 축약 안 함), `claude remote-control`을 실행한 어떤 머신이든 이제 폰의 디바이스 카드로 나타나 바로 세션을 시작할 수 있다 — Remote Control이 정식 기능으로 전환됐다.**

## 핵심 포인트

- **`/design` (리서치 프리뷰)** — 브리프를 주면 Claude가 아티팩트 기반의 편집 가능한 아트보드 캔버스를 발행하고, 하나를 고르면 그대로 구현. Pro/Max/Team/Enterprise, v2.1.234 이상.
- **Concise 출력 스타일(v2.1.237)** — 결과를 먼저 보여주고 서론·내레이션을 생략하되, 작업 자체는 Default 스타일과 동일하게 철저히 수행. 설명·상세를 요청하면 전체 답변. 오류 리포트·보안 경고·파괴적 작업 확인은 완전한 내용 유지. `/config`의 Output style에서 켜거나 `settings.json`에 `"outputStyle": "Concise"`.
- **폰에서 내 컴퓨터로 세션 시작** — `claude remote-control`을 실행 중인 머신은 Claude 앱 Code 탭 상단에 디바이스 카드로 표시. 탭하면 디렉토리를 골라 그 자리에서 세션 시작. Remote Control이 리서치 프리뷰를 벗어남.
- **기타 주요 변경** — claude.ai 사용량 제한 리셋 시 세션 자동 재개(`/config`에서 끄기 가능), `spellcheck` 설정으로 프롬프트 입력 중 맞춤법 밑줄 표시, GitLab MR 배지가 풋터에 색상별 표시, 폰·claude.ai/code에서 effort 레벨 변경이 내 컴퓨터 세션에 즉시 반영, `/goal`이 백그라운드 작업을 30분 후 체크인(무한 대기 방지), **`ANTHROPIC_DEFAULT_MODEL`** 환경변수로 새 세션의 기본 모델 지정(단, `/model`로 직접 고르면 그게 우선하고 재시작 후에도 유지).

## 인상 깊은 문장

> "Concise is a new built-in output style. Claude leads with the result and skips preamble and narration, while doing the work as thoroughly as in the Default style."

> "Change the effort level from your phone or claude.ai/code and it applies to the session on your machine."

## 댓글

Week 33와 마찬가지로 code.claude.com 공식 changelog를 WebFetch로 전문 확보 — 1차 출처 직접 확인. 댓글·커뮤니티 반응은 changelog 페이지 자체에 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — Concise 스타일은 "서론 생략, 결과 우선"이라는 원칙의 하네스 차원 구현

이건 이 가든이 반복해서 다뤄온 "군더더기 없는 커뮤니케이션" 원칙([[2026-06-08-taste-is-the-new-10x]] 계열, 짧고 밀도 높은 결과물 지향)이 Claude Code 자체의 기본 출력 방식으로 편입된 사례다. 다만 "오류·보안 경고·파괴적 작업 확인은 축약 안 함"이라는 예외 설계가 핵심 — **속도와 안전 확인을 트레이드오프하지 않는 구조**라는 점이 눈여겨볼 만하다.

### 핵심 전이 2 — Remote Control 정식화는 "언제 어디서나 에이전트를 굴린다"는 흐름의 완성

[[2026-05-04-long-running-agents]]가 다룬 장시간 실행 에이전트 개념과 짝을 이룬다 — 세션이 오래 걸리는 작업을 백그라운드로 돌리고, 이제 그 진행 상황을 확인하고 새로 시작하는 진입점 자체가 폰까지 넓어졌다. **"세션을 어디서 시작하고 어디서 확인하느냐"의 마찰이 계속 줄어드는 방향.**

### 핵심 전이 3 — `/design`은 "AI가 판단층을 대신할 수 없다"는 반복 주제의 실제 도구화

[[2026-08-05-future-of-design-systems-context]]가 강조한 "판단층은 사람이 쥔다"는 원칙이, `/design`의 워크플로 자체(여러 아트보드를 발행 → 사람이 하나를 고름 → 그걸 구현)에 그대로 반영돼 있다. AI가 옵션을 넓게 생성하고, 최종 선택은 명시적으로 사람에게 남긴다.

## 호스피탈리티 / CRS 적용 포인트

**Concise 출력 스타일과 `ANTHROPIC_DEFAULT_MODEL`은 이 가든의 일간 다이제스트 루틴 같은 반복 자동화 세션에 바로 적용 가능하다** — 정형화된 반복 작업에서는 서론 없이 결과부터 받는 게 유용할 수 있다(다만 이 가든의 노트 형식 자체는 밀도 높은 서술을 요구하므로 전면 적용은 신중해야 함). Remote Control 정식화는 장시간 배치 작업(예: 이 다이제스트 파이프라인)의 진행 상황을 이동 중에도 확인·개입할 수 있게 해 실무적으로 유용하다.

## 연관 자료
- [[2026-09-03-claude-code-week33-changelog]] — *전주 changelog, 포크 모드·TodoWrite 기본값 변경*
- [[2026-08-05-future-of-design-systems-context]] — *"판단층은 사람이 쥔다"는 같은 원칙의 디자인 시스템 버전*
- [[2026-05-04-long-running-agents]] — *장시간 실행 에이전트를 어디서 확인하느냐는 문제의식*
- [[2026-09-03-claude-fable-5-1-prompting-guide]] — *같은 주 Claude 사용법 갱신, 모델 프롬프팅 관점*

## 한 달 뒤 회고
*(2026-10-03 즈음 — `/design`을 실제로 써봤는지, Concise 스타일을 반복 자동화 세션에 적용해봤는지, Remote Control로 이동 중 세션을 확인·개입한 사례가 있었는지 기록.)*
