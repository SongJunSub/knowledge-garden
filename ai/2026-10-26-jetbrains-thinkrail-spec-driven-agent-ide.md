---
title: "JetBrains ThinkRail — 명세로 프로젝트 지식을 세션 너머까지 유지하는 에이전트 IDE"
source_title: "ThinkRail"
source_url: "https://github.com/JetBrains/thinkrail"
source_name: "GitHub (JetBrains/thinkrail, Apache-2.0)"
referrer_url: "https://news.hada.io/topic?id=35994"
published_at: "미확인 (InnovationHub발 오픈소스 프로젝트, 알파 단계)"
summarized_at: "2026-10-26"
category: "ai"
tags: ["coding-agent", "spec-driven-development", "git-worktree", "agent-skills", "jetbrains", "pi", "developer-tools"]
---

# JetBrains ThinkRail — 명세로 프로젝트 지식을 세션 너머까지 유지하는 에이전트 IDE

> 출처: [ThinkRail](https://github.com/JetBrains/thinkrail) (GitHub, JetBrains InnovationHub · Apache-2.0) · GeekNews(id=35994) 경유 · 정리일 2026-10-26
>
> **출처 한계**: `news.hada.io`는 이번 세션에서 DNS 실패로 접근 불가해 hada 댓글 수·GN⁺ 큐레이션 여부는 확인하지 못했다. 대신 **GitHub 저장소 README는 WebFetch로 직접 확보**해 SPEC.md·스킬·worktree·PR 연계 설명은 1차 소스 기준이다. besthub.dev 등 제3자 리뷰와 JetBrains 채용 공고(스펙→코드 평가기 작업 중이라는 언급)는 WebSearch로 교차확인했으나, 실사용 벤치마크나 HN/Lobsters 반응은 찾지 못했다.

## 한 줄 요약

**JetBrains가 자사 InnovationHub에서 내놓은 ThinkRail은 터미널 코딩 에이전트 `pi`를 감싸는 에이전트 IDE로, git worktree로 작업공간을 격리해 여러 에이전트를 병렬 실행하고, 코드 옆에 두는 SPEC.md 그래프와 재사용 가능한 Agent Skills로 프로젝트 지식을 세션이 끝나도 남게 만든다.** 아직 알파 단계이며 `pi` 전용이라는 점이 Orca 같은 멀티 에이전트 ADE와 다르다.

## 핵심 포인트

- **SPEC.md 그래프** — 모듈마다 SPEC.md가 코드 옆에 놓여 서로 연결된 그래프를 이루고, 에이전트는 ***전용 `spec_*` 도구로 이를 읽고 검색하고 유지***한다. 세션이 끝나도 의도와 결정 배경이 파일로 남는다는 것이 핵심 차별점.
- **Agent Skills 재사용** — 다른 코딩 에이전트에서 이미 쓰던 Agent Skills를 옮기지 않고 그대로 읽어 쓴다. 번들 워크플로에 프로젝트 설정, 설계 브레인스토밍, PR 배포 안내가 포함된다.
- **git worktree 기반 병렬 작업** — 워크스페이스마다 고유 브랜치와 작업 디렉터리를 가진 `git worktree`로 열어 ***여러 에이전트가 원래 체크아웃을 건드리지 않고 병렬로 작업***한다. 끝났거나 방치된 워크스페이스는 PR 머지·종료 후 또는 일주일 비활동 시 프로젝트별 보관 영역(shelf)으로 자동 이동한다.
- **PR 생성부터 머지까지 연계** — 상단 바에서 브랜치의 origin/PR 상태를 보여주고, 게시·푸시·PR 열기를 한 번에 실행한다. PR 열리면 CI 체크와 리뷰 결정을 보여주고, 실패한 체크나 갈라진 브랜치를 에이전트에 넘기거나 마지막 방식으로 머지할 수 있다. GitHub 연동은 사용자의 `gh` CLI를 통한다.
- **`pi` 전용이라는 한계** — Orca·Proliferate 같은 ADE는 Codex·Claude Code·OpenCode 등 여러 에이전트를 나란히 돌리는 데 비해, ThinkRail은 하드와이어드로 `pi`만 지원한다. 지금은 기존 `pi` 사용자의 진입장벽을 낮추는 데 초점이 있다는 뜻.

## 인상 깊은 문장

> "읽기 전용 Specs 도구는 이 그래프를 트리로 보여 준다." — README가 설명하는 것은 명세를 사람이 쓰고 버리는 문서가 아니라, 에이전트가 **지속적으로 조회·갱신하는 1급 데이터 구조**로 다룬다는 점이다.

## 댓글

GeekNews hada 댓글 수는 egress 차단으로 확인하지 못했다. HN "Show HN" 검색에서도 ThinkRail 전용 스레드를 찾지 못했다. 제3자 리뷰(besthub.dev)는 "크고 혼잡한 AI 코딩 제품군에 하나 더 추가됐을 뿐, JetBrains의 전략적 방향성이 흐려지고 있다는 신호"라는 다소 비판적인 평가를 냈다는 점은 정직하게 적어둔다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-18-openspec-spec-driven-development-for-agents]]와의 연결.** OpenSpec은 `propose → apply → archive` 폴더로 구현 전 명세를 못박는 방식이었다면, ThinkRail의 SPEC.md는 코드 옆에 상주하며 에이전트가 직접 읽고 쓰는 "그래프"다. 둘 다 "대화 기록에만 남던 의도를 파일로 고정한다"는 같은 문제의식이지만, OpenSpec은 구현 전 승인 게이트에 가깝고 ThinkRail은 지속 갱신되는 지식 베이스에 가깝다 — 같은 니치의 다른 해법으로 비교해볼 가치가 있다.

**핵심 전이 2 — [[2026-08-08-orca-parallel-coding-agents-ade]]와의 연결.** Orca는 멀티 에이전트(Codex·Claude Code·OpenCode·Pi)를 격리된 worktree에서 병렬 실행하는 데 집중한 반면, ThinkRail은 worktree 격리는 같지만 단일 에이전트(`pi`)에 PR/CI 연계와 명세 관리까지 깊게 결합했다. "병렬 실행 자체"와 "그 결과를 지식으로 남기는 것" 중 어느 쪽에 무게를 두느냐가 두 도구의 분기점이다.

**핵심 전이 3 — [[2026-08-06-pi-minimalism-coding-harness]]와의 연결.** `pi`의 경쟁력이 "최소 도구·1,000토큰 미만 시스템 프롬프트"의 컨텍스트 절제였다는 점을 생각하면, ThinkRail이 그 위에 SPEC.md 그래프 조회 도구를 얹는 것이 미니멀리즘과 충돌하지 않는지가 흥미로운 지점이다 — 지식 유지 비용을 컨텍스트가 아니라 파일 시스템 쪽으로 옮긴 설계로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

온다(B2B 호스피탈리티/CRS)의 코드베이스에 직접 적용하기엔 아직 멀다 — ThinkRail은 `pi` 전용 알파 도구라 당장 채택 후보는 아니다. 다만 전이 가능한 원칙은 있다: 예약·요금 로직처럼 여러 세션·여러 엔지니어가 번갈아 건드리는 모듈에 "코드 옆 SPEC.md"로 의도와 제약을 못박아두면, 신규 합류 엔지니어나 다음 세션의 에이전트가 과거 결정의 배경을 다시 묻지 않아도 된다는 점은 참고할 만하다.

## 연관 자료

- [[2026-09-18-openspec-spec-driven-development-for-agents]] — 구현 전 명세를 못박는 또 다른 명세주도 워크플로, propose/apply/archive 방식과 대비
- [[2026-08-08-orca-parallel-coding-agents-ade]] — git worktree 기반 멀티 에이전트 병렬 실행이라는 같은 메커니즘, 범위는 다중 에이전트 대 단일 에이전트
- [[2026-08-06-pi-minimalism-coding-harness]] — ThinkRail이 감싸는 `pi` 하네스 자체의 미니멀리즘 설계 철학

## 한 달 뒤 회고

2026-11-26 즈음, ThinkRail이 알파를 벗어났는지, `pi` 외 에이전트 지원이 추가됐는지, SPEC.md 그래프가 실제 대규모 저장소에서 유지보수 부담 없이 버티는지(README의 장담과 실사용 리뷰가 일치하는지)를 확인한다.
