---
title: "OpenRig - Claude Code와 Codex를 팀으로 운영하는 멀티 에이전트 오케스트레이터 — '하네스를 감싸는 하네스', rig·seat·pod로 조직을 흉내낸다"
source_title: "OpenRig"
source_url: "https://github.com/mvschwarz/openrig"
source_name: "GitHub (mvschwarz/openrig), openrig.dev"
referrer_url: "https://news.hada.io/topic?id=34854"
published_at: "2026-09-29 전후 (WebSearch로 GitHub 트렌딩 등재 시점 교차확인)"
summarized_at: "2026-10-06"
category: "ai"
tags: ["multi-agent", "claude-code", "codex", "agent-orchestration", "tmux", "yaml", "developer-tools", "open-source"]
---

# OpenRig - Claude Code와 Codex를 팀으로 운영하는 멀티 에이전트 오케스트레이터

> 출처: [OpenRig](https://github.com/mvschwarz/openrig) (GitHub, Esoteric Labs) · GeekNews(id=34854) 경유 · 정리일 2026-10-06

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 직접 열지 못했다. 반면 **GitHub 저장소(`github.com/mvschwarz/openrig`)는 WebFetch로 README를 직접 확보**했다 — 이번 배치에서 원문 확보가 양호한 사례다. GitHub 스타 5,300개 이상·커밋 3,540개 이상이라는 수치는 WebFetch가 저장소 페이지에서 직접 읽어온 것이라 신뢰도가 있으나, **hada 댓글 수·HN 토론 여부는 이번 세션에서 전혀 확인하지 못했다.** README는 제작사(Esoteric Labs) 자신의 설명이라는 점도 감안해야 한다 — "팀 상태 지속성", "복구" 같은 주장이 실전에서 얼마나 매끄럽게 동작하는지는 README 수준에서는 검증되지 않는다.

## 한 줄 요약

**OpenRig은 Claude Code·Codex·Pi 같은 개별 코딩 에이전트 하네스를 "팀"으로 묶어 YAML로 토폴로지를 정의하고 한 명령으로 띄우는 오픈소스 멀티 에이전트 런타임이다 — 에이전트 자체를 더 똑똑하게 만드는 게 아니라, 여러 에이전트가 동시에 돌 때 생기는 ***터미널 세션 관리·역할 분담·상태 복구***라는 "팀 운영" 문제를 tmux와 SQLite 위에서 해결한다.**

## 핵심 포인트

- **"하네스를 감싸는 하네스" — rig가 harness를 감싼다** — README의 핵심 문구는 "A harness wraps a model. A rig wraps your harnesses."다. Claude Code·Codex 같은 개별 CLI(하네스)가 모델 하나를 감싸는 것처럼, OpenRig(rig)은 ***여러 하네스를 한 팀으로*** 감싼다 — 에이전트 자체의 능력이 아니라 에이전트들이 모였을 때 생기는 조직 문제를 다루는 한 층 위의 계층이다.
- **Seat·Pod·Lead Agent — 역할을 조직처럼 모델링** — `dev-build@starter`처럼 ***안정적인 역할 주소(Seat)***를 통해 특정 에이전트 인스턴스가 아니라 "역할"에 작업을 보낼 수 있고, 공유 컨텍스트를 갖는 Seat 묶음(Pod), 팀 조정을 맡는 Lead Agent로 구성된다. 사람 조직의 직책·부서 개념을 에이전트 팀 운영에 그대로 옮긴 설계다.
- **starter → workshop → factory, 세 단계 성장 경로** — 빌더+리뷰어 2명짜리 `starter`(단일 변경), 리더+빌더+QA+리뷰어 4명짜리 `workshop`(지속적 저장소 작업), 7명짜리 `factory`(제품 수준 작업)까지 ***팀 규모를 작업 단위에 맞춰 단계적으로 키우는*** 사전 정의 템플릿을 제공한다.
- **tmux 세션 지속성 + SQLite 상태 추적 + snapshot/restore** — 각 에이전트는 tmux 세션으로 돌고, 팀의 토폴로지·상태는 SQLite로 추적된다. ***스냅샷/복원***으로 전체 팀 구성을 저장하고 되살릴 수 있어, "재부팅 뒤 어떤 세션이 뭘 하고 있었는지 복구"하는 문제를 정면으로 다룬다.
- **크로스 에이전트 통신과 TUI 대시보드** — `rig send`·`rig broadcast`·`rig chatroom`으로 에이전트 간 메시지를 주고받고, TUI(토폴로지 탐색기·그래프 뷰)로 전체 팀 상태를 한눈에 모니터링한다. Apache 2.0 라이선스, Node.js 22/24 + tmux + macOS/Linux 요구.

## 인상 깊은 문장

> "A harness wraps a model. A rig wraps your harnesses. Define your agent team in YAML, boot it with one command."
> (GitHub 저장소 README, WebFetch로 직접 확보)

## 댓글

**hada 댓글 수는 egress 차단으로 확인 불가.** HN·Lobsters에 별도 토론이 있었는지도 이 세션에서 특정하지 못했다. GitHub 스타 5,300개 이상·이슈 88개·PR 52개라는 수치(WebFetch로 직접 확인)로 보면 이 니치(멀티 에이전트 오케스트레이터) 안에서는 꽤 활발한 채택을 보이는 편이나, 절대적 기준이 없어 "크다/작다"를 판단하긴 어렵다. **README가 자사 설명이라는 점을 감안해, "복구가 매끄럽다"·"터미널 난립을 막는다" 같은 주장은 실제 운영 경험 후기로 아직 검증되지 않았다는 것을 밝힌다.**

## 내 생각 · 적용점

### 핵심 전이 1 — "여러 코딩 에이전트를 병렬로 돌리는" 니치의 다섯 번째 사례, 이번엔 "팀 조직 모델"이 차별점

이 가든은 이미 [[2026-08-08-orca-parallel-coding-agents-ade]](MIT), [[2026-08-08-paseo-coding-agent-orchestrator]](AGPL), [[2026-09-10-proliferate-parallel-coding-agents-ide]](AGPL, YC), [[2026-10-01-traycer-multi-agent-orchestration]](MIT, "문맥 공유"가 차별점), [[2026-10-05-offrun-multi-agent-workspace]](Mac GUI, worktree 격리)까지 같은 니치의 다섯 경쟁자를 추적해왔다. OpenRig은 여섯 번째 진입자이면서, 앞선 도구들이 "worktree 격리"나 "문맥 공유"를 내세운 것과 달리 **Seat·Pod·starter/workshop/factory라는 명시적 조직 모델**을 차별점으로 내세운다 — 경쟁 축이 "격리 기술"에서 "팀 설계 템플릿"으로 한 단계 옮겨간 것으로 읽힌다.

### 핵심 전이 2 — Ordewell의 자동 의존성 그래프, Offrun의 사람 주도 분배와 또 다른 제3의 축

[[2026-09-26-ordewell-multi-agent-orchestrator]]는 작업을 의존성 그래프로 쪼개 자동 분배했고, [[2026-10-05-offrun-multi-agent-workspace]]는 사람이 직접 어느 에이전트에 뭘 맡길지 정했다. OpenRig의 `rig send dev-build@starter '...'`는 **"역할 주소"에 보내는 방식**으로, 사람이 작업을 지정하긴 하지만 "어느 에이전트 인스턴스인지"가 아니라 "어느 역할인지"로 추상화한다는 점에서 두 극단의 중간 지점에 있다. 세 노트를 겹쳐 보면 멀티 에이전트 오케스트레이션의 "작업 분배 방식" 설계가 자동 그래프·사람 직접 지정·역할 주소라는 세 축으로 분화되고 있다는 지형이 보인다.

### 핵심 전이 3 — Blast Radius의 "위험 작업 전 승인"과는 다른 층위의 안전장치가 비어 있다

[[2026-10-05-claude-code-mods]]의 Blast Radius는 "위험한 명령을 실행 전에 보여주고 승인받는" 안전장치였다. OpenRig의 README에는 권한 모드(permission mode)를 Seat별로 설정할 수 있다는 언급은 있지만, **여러 에이전트가 동시에 같은 저장소를 건드릴 때 생기는 충돌·레이스 컨디션을 어떻게 막는지**는 README 수준에서 명확히 설명되지 않는다 — [[2026-04-27-ai-agent-deleted-production-database]]가 보여준 "에이전트 하나도 위험한데 여럿을 동시에 풀어놓는다"는 리스크가 오케스트레이터 계층에서 실제로 얼마나 통제되는지는 검증이 더 필요한 지점이다.

**이 글은 "Claude를 더 잘 쓰는 데" 직접 도움이 되는 글이다.** Claude Code를 Codex와 함께 팀으로 묶어 바로 설치·실행해볼 수 있는 오픈소스 도구이기 때문이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 "개발팀의 로컬 작업 환경 도구" 수준에 머물지만, 조직 모델 자체는 참고할 만하다.** starter→workshop→factory처럼 ***작업 규모에 맞춰 팀 구성을 단계적으로 키우는 템플릿***은, 온다 CRS 개발팀이 "버그 수정 1건(starter급 — 에이전트 1~2개)"과 "레비뉴 매니지먼트 모듈 리라이트(factory급 — 여러 역할 분담)"처럼 작업 규모별로 어떤 에이전트 조합을 쓸지 내부 가이드를 만들 때 그대로 참고할 수 있는 틀이다. 다만 [[2026-05-29-orchestration-tax]]가 짚었듯, 팀을 키운다고 사람의 리뷰 병목이 사라지는 건 아니라는 원칙은 OpenRig에도 동일하게 적용해야 한다.

## 연관 자료

- [[2026-10-01-traycer-multi-agent-orchestration]] — 같은 니치의 바로 앞 사례, "문맥 공유"가 차별점
- [[2026-10-05-offrun-multi-agent-workspace]] — 사람이 직접 작업을 분배하는 대조적 설계
- [[2026-09-26-ordewell-multi-agent-orchestrator]] — 의존성 그래프 기반 자동 분배라는 또 다른 대조군
- [[2026-10-05-claude-code-mods]] — 위험 작업 승인 게이트(Blast Radius)라는, OpenRig에 비어 있는 듯한 안전장치의 선례
- [[2026-05-29-orchestration-tax]] — "에이전트가 늘어도 인간의 리뷰 병목은 줄지 않는다"는 원칙
- [[2026-04-27-ai-agent-deleted-production-database]] — 에이전트를 여럿 동시에 풀어놓을 때의 위험을 먼저 경고한 선행 사례

## 한 달 뒤 회고

*(2026-11-06 즈음 — (1) hada·HN 댓글이 egress 해제 후 확인되면 실제 운영 후기(충돌·레이스 컨디션 사례)를 점검. (2) OpenRig의 Seat별 권한 모드가 실제로 동시 작업 충돌을 막아주는지 README 이상의 근거를 찾아볼 것. (3) 온다 팀에 starter/workshop/factory 템플릿을 실제로 적용해볼 가치가 있는지 작은 파일럿으로 검토.)*
