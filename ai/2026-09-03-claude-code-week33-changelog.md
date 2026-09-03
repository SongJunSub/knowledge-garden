---
title: "Claude Code Week 33 (v2.1.225–v2.1.233) — 포크 모드 기본 활성화, GitLab 병합요청 지원, 그리고 조용히 사라진 TaskCreate/TodoWrite"
source_title: "Week 33 · August 10–14, 2026"
source_url: "https://code.claude.com/docs/en/whats-new/2026-w33"
source_name: "code.claude.com"
referrer_url: "https://code.claude.com/docs/en/whats-new#week-33"
published_at: "2026-08-14"
summarized_at: "2026-09-03"
category: "ai"
tags: ["claude-code", "changelog", "fork-mode", "gitlab", "cross-session-messaging", "claude-usage"]
---

# Claude Code Week 33 (v2.1.225–v2.1.233) — 포크 모드 기본 활성화, GitLab 병합요청 지원, 그리고 조용히 사라진 TaskCreate/TodoWrite

> 출처: [Week 33 · August 10–14, 2026](https://code.claude.com/docs/en/whats-new/2026-w33) (Claude Code 공식 What's New) · 정리일 2026-09-03

## 한 줄 요약

**Claude Code 데스크톱이 사용량 제한 후 자동 재개하고, 포크 모드(대화 맥락을 통째로 물려받는 서브에이전트)가 인터랙티브 세션에서 기본 활성화되며, GitLab 병합요청·마켓플레이스가 GitHub와 동등한 대우를 받는다. 그런데 "다른 성과들" 목록에 숨어 있는 한 줄이 더 눈에 띈다 — Opus 4.8·Sonnet 5·Fable 5·Mythos 5 이후 모델에서는 TaskCreate·TodoWrite 같은 작업 추적 도구가 기본적으로 더 이상 제공되지 않는다.**

## 핵심 포인트

- **Desktop 사용량 제한 자동 재개** — 세션 제한에 걸리면 카드에 "Auto-continue when limits reset" 체크박스가 뜨고, 체크하면 리셋 후 중단된 턴을 자동 재시도. 주간 제한 카드는 이 옵션이 없음.
- **포크 모드 기본 활성화(v2.1.232)** — Claude가 `fork` 서브에이전트 타입을 요청하면 전체 대화와 프롬프트 캐시를 그대로 물려받아 맥락을 다시 설명할 필요가 없다. `/subtask` 명령으로 직접 트리거 가능, `CLAUDE_CODE_FORK_SUBAGENT=0`으로 끌 수 있음. 에이전트 팀 팀원이 아닌 한, 인터랙티브 세션에서 Claude가 띄우는 서브에이전트는 기본적으로 백그라운드 실행.
- **GitLab 병합요청·마켓플레이스 지원(v2.1.232)** — `--worktree`에 GitLab MR URL을 넘기면 그 브랜치로 워크트리 생성, `claude agents` 뷰에 `!N` 라벨 표시. 마켓플레이스는 `gitlab.com` bare URL(중첩 서브그룹 포함)도 clone 가능. `glpat-`·`glrt-` 같은 GitLab 토큰도 `gh`처럼 자동 마스킹.
- **`@` 세션 멘션** — 프롬프트에 `@`를 입력하면 다른 Claude 세션을 이름으로 지목해 `SendMessage`로 바로 전달. 정확히 하나의 세션과 일치하면 확인 단계 없이 즉시 전달.
- **⚠️ 조용히 바뀐 기본값** — Opus 4.8, Sonnet 5, Fable 5, Mythos 5 이후 모델 계열에서는 `TaskCreate`·`TaskUpdate`·`TodoWrite` 같은 작업 추적 도구가 더 이상 기본 제공되지 않는다. `CLAUDE_CODE_ENABLE_TODO_TOOLS=1`로 재활성화해야 한다. "Other wins" 섹션의 한 줄로만 언급되고 별도 공지 없이 넘어갔다는 점이 눈에 띈다.

## 인상 깊은 문장

> "Fork mode is now on by default in interactive sessions. Claude can request the fork subagent type, which inherits the full conversation and prompt cache instead of starting fresh, so you don't have to re-explain the context for a side task."

> "The task-tracking tools, such as TaskCreate, TaskUpdate, and TodoWrite, are no longer available on Opus 4.8, Sonnet 5, Fable 5, Mythos 5, and later models in those families."

## 댓글

이 노트는 GeekNews 경유가 아니라 Claude Code 공식 changelog(code.claude.com)를 직접 WebFetch로 전문 확보했다 — 이번 배치에서 드물게 원문을 완전히 읽은 사례다. 댓글·커뮤니티 반응은 이 changelog 페이지 자체에 없어 확인 불가하지만, 공식 1차 출처라 내용 신뢰도는 높다.

## 내 생각 · 적용점

### 핵심 전이 1 — TodoWrite 제거는 "조용한 저하" 패턴의 반복이자, 지금 이 세션에도 실제로 적용되는 변경

[[2026-08-23-claude-code-reasoning-effort-ab-test]]가 지적한 "changelog 없이 실험으로 굴리는 조용한 저하" 패턴과 결이 다르다 — 이번엔 changelog에 실제로 적혀 있지만 "Other wins" 목록 한 줄로 축소돼 눈에 띄지 않는다. 그리고 이건 추상적인 이야기가 아니다: 이 세션 도중에도 "Task tools haven't been used recently... consider using TaskCreate"라는 시스템 리마인더가 반복적으로 떴는데, 이 changelog에 따르면 Sonnet 5 이후 모델은 애초에 이 도구가 기본 제공되지 않는다 — 즉 그 리마인더는 옵트인하지 않은 도구를 옵트인하라고 권하는 셈이다. **공식 changelog를 정기적으로 읽지 않으면 하네스 차원의 기본값 변화를 놓친 채 옛 습관대로 도구를 찾게 된다**는 걸 이 세션 스스로 보여준 사례다.

### 핵심 전이 2 — 포크 모드는 "메모리 파일 포맷" 논의와 다른 축의 컨텍스트 재사용

[[2026-09-02-memoryfields-agent-memory-file-format]]이 "메모리를 파일로 영속화"하는 방향이라면, 포크 모드는 "현재 세션의 살아있는 컨텍스트를 캐시째로 분기"하는 방향이다 — 영속 vs 순간 재사용이라는 두 가지 다른 컨텍스트 관리 전략이 같은 시기에 각각 발전하고 있다.

### 핵심 전이 3 — GitLab 동등 지원은 벤더 락인 완화 신호

Claude Code가 GitHub 전용 기능(워크트리, 에이전트 뷰 라벨, 토큰 마스킹)을 GitLab에도 동등하게 확장한 것은, 이 가든이 이미 다룬 [[2026-08-04-github-has-alternatives-no-replacement]]의 "GitHub 대안은 있지만 대체재는 없다" 논의에서 도구 생태계 쪽의 락인이 하나씩 풀리는 사례로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

이 글은 클로드 사용법 자체에 직접 적용된다. **`CLAUDE_CODE_ENABLE_TODO_TOOLS=1`을 팀 표준 설정에 반영할지 검토할 가치가 있다** — 특히 여러 세션을 오래 굴리는 워크플로우(이 가든의 일간 다이제스트 루틴 포함)에서 작업 추적이 필요하면 명시적으로 켜야 한다. 또한 온다 코드베이스가 GitLab을 쓴다면 `--worktree`에 MR URL을 바로 넘기는 워크플로우를 도입할 수 있다.

## 연관 자료
- [[2026-08-23-claude-code-reasoning-effort-ab-test]] — *"changelog 없는 조용한 저하"라는 같은 우려, 이번엔 changelog에 적혀 있었다는 차이*
- [[2026-09-02-memoryfields-agent-memory-file-format]] — *컨텍스트 재사용의 다른 축(영속 파일 vs 캐시 분기)*
- [[2026-08-04-github-has-alternatives-no-replacement]] — *GitLab 동등 지원 = 도구 생태계 락인 완화의 한 조각*
- [[2026-09-03-claude-code-week34-changelog]] — *다음 주 changelog*

## 한 달 뒤 회고
*(2026-10-03 즈음 — `CLAUDE_CODE_ENABLE_TODO_TOOLS`를 팀 설정에 반영했는지, 포크 모드를 실제로 활용해봤는지, GitLab 워크트리 지원을 써볼 일이 있었는지 기록.)*
