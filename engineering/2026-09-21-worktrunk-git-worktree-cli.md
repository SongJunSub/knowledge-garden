---
title: "Worktrunk - 여러 코딩 에이전트의 Git 작업 공간을 관리하는 CLI (max-sixty) — 브랜치 이름만으로 worktree 생성부터 에이전트 실행까지 한 번에"
source_title: "Worktrunk — Git worktree management for parallel AI agent workflows"
source_url: "https://worktrunk.dev/"
source_name: "Worktrunk (max-sixty, Rust CLI, OSS)"
referrer_url: "https://news.hada.io/topic?id=34017"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "engineering"
tags: ["git-worktree", "coding-agent", "cli", "rust", "parallel-agents", "claude-code", "codex", "developer-tooling"]
---

# Worktrunk - 여러 코딩 에이전트의 Git 작업 공간을 관리하는 CLI (max-sixty)

> 출처: [Worktrunk](https://worktrunk.dev/) (max-sixty, GitHub `max-sixty/worktrunk`) · GeekNews(id=34017) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "wt list로 작업 공간별…"에서 잘림)와 WebSearch로 확보한 공식 사이트(worktrunk.dev)·GitHub 저장소·데일리dev·블로그 리뷰 스니펫을 교차해 재구성했다. 실사용 벤치마크나 채택 사례는 확인하지 못했다.

## 한 줄 요약

**Claude Code나 Codex 같은 코딩 에이전트 여러 개를 동시에 돌릴 때 생기는 git worktree 관리 번거로움을, 브랜치 이름 하나로 worktree 생성·이동·에이전트 실행까지 묶는 Rust CLI로 해결한다 — `.worktrunk.toml` 훅으로 셋업을 자동화하고 빌드 캐시(node_modules 등)를 워크트리 간에 공유한다.**

## 핵심 포인트

- **문제 정의 — 에이전트마다 별도 작업 디렉터리가 필요** — 여러 코딩 에이전트에 작업을 동시에 맡기면 서로의 파일 수정을 방해하지 않도록 ***에이전트마다 별도의 작업 디렉터리를 만들어 서로의 파일 수정을 방해하지 않도록*** 관리해야 하는데, git worktree 자체의 UX가 번거롭다(디렉터리 경로를 매번 입력해야 하고, 생성·삭제를 브랜치와 동기화하기 어려움).
- **`wt switch` — 브랜치+작업공간+에이전트 실행을 한 번에** — `wt switch -c -x claude feature-a`처럼 ***브랜치와 작업 공간을 만들고 에이전트까지 한 번에 실행*** 가능하다. worktree의 생성, 이동, 삭제를 ***브랜치 이름만으로 처리***해 디렉터리 경로를 매번 입력할 필요가 없다.
- **`.worktrunk.toml` 훅과 빌드 캐시 공유** — `on_create`/`pre_merge`/`post_merge` 훅으로 셋업 자동화가 가능하고, `copy-build-cache` 설정으로 `node_modules`·`.next`·`dist` 같은 빌드 산출물을 워크트리 간에 재사용해 매번 새로 설치하지 않아도 된다.
- **`wt list`로 상태 일람** — 작업 공간별 변경 사항, 커밋, 원격 브랜치 상태를 한눈에 확인하고, 대화형 선택 화면에서 diff·로그·PR과 댓글을 미리 볼 수 있다(WebSearch로 확인). Homebrew·Cargo·Winget·AUR로 설치 가능.

## 인상 깊은 문장

> "Worktrunk is a CLI for Git worktree management, designed for parallel AI agent workflows."
> ([GitHub 저장소 설명](https://github.com/max-sixty/worktrunk) 원문)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: 프로젝트 저자 자체가 "AI 에이전트를 5~10개 이상 동시에 관리"한다는 전제를 깔고 만든 도구라, 실제로 그 규모로 에이전트를 병렬 운용하는 팀이 아니면 체감 효용이 과장돼 보일 수 있다. 제3자 리뷰나 채택 사례(스타 수, 실사용 후기)는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "에이전트 오케스트레이션 도구" 계열에 worktree 관리 축이 추가됨

가든에는 이미 병렬 코딩 에이전트를 다루는 도구 노트가 여러 개 쌓여 있다 — [[2026-08-08-orca-parallel-coding-agents-ade]](여러 에이전트를 나란히 실행하는 ADE), [[2026-08-08-paseo-coding-agent-orchestrator]](오케스트레이터), [[2026-09-18-jcode-parallel-terminal-coding-agent]](세션당 메모리 10MB로 가벼운 병렬 하네스). Worktrunk는 이들과 달리 에이전트 실행 자체보다 **"에이전트가 건드릴 git 작업 공간을 어떻게 격리·재사용할까"**라는, 더 아래 계층의 인프라 문제에 집중한다는 점이 다르다. 병렬 에이전트 생태계가 "누가 빠른가"에서 "누가 작업 공간을 안 밟나"로 관심이 옮겨가는 신호로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS 개발팀이 Claude Code 같은 코딩 에이전트를 여러 기능 브랜치에 동시에 투입하는 워크플로를 쓴다면, worktree 격리 자동화는 실질적인 생산성 도구가 될 수 있다. 다만 이 가든의 실제 개발팀 규모와 병렬 에이전트 운용 빈도를 감안하면, 지금 당장 도입 우선순위는 높지 않다 — "여러 에이전트를 동시에 돌리는 습관이 생긴 뒤" 재검토할 후보로 남겨둔다.

## 연관 자료

- [[2026-08-08-orca-parallel-coding-agents-ade]] — 병렬 에이전트 실행 도구, Worktrunk는 그 실행이 아니라 작업 공간 격리를 다룬다는 점에서 대조
- [[2026-09-18-jcode-parallel-terminal-coding-agent]] — 같은 "병렬 코딩 에이전트" 계열, 가벼운 하네스라는 다른 축

## 한 달 뒤 회고

*(2026-10-21 즈음 — GitHub 스타 수·실사용 후기가 쌓였는지, `.worktrunk.toml` 훅 생태계가 확장됐는지 확인.)*
