---
title: "Corgi (tals) — herdr에서 영감받아 Ghostty 위에 지은, Claude Code·Codex·Pi·OpenCode 통합 터미널 멀티플렉서"
source_title: "corgi"
source_url: "https://github.com/tals/corgi"
source_name: "GitHub (tals/corgi, MIT)"
referrer_url: "https://news.hada.io/topic?id=35971"
published_at: "미확인 (지속 업데이트되는 오픈소스 저장소, 커밋 636개 누적)"
summarized_at: "2026-10-26"
category: "ai"
tags: ["coding-agents", "terminal-multiplexer", "claude-code", "codex", "agent-harness", "ghostty", "developer-tools"]
---

# Corgi (tals) — 여러 AI 코딩 에이전트를 한눈에 관리하는 터미널 도구

> 출처: [tals/corgi](https://github.com/tals/corgi) (GitHub, MIT) · GeekNews(id=35971) 경유 · 정리일 2026-10-26
>
> **출처 한계**: `news.hada.io`는 이번 세션에서 DNS 실패로 접근 불가해 hada 댓글 수·GN⁺ 큐레이션 여부는 확인하지 못했다. 대신 **GitHub 저장소는 이번 세션에서 예외적으로 WebFetch에 성공**해 README·저장소 통계(스타·포크·커밋 수)는 1차 소스로 직접 확인했다. 다만 README에서 확인한 기능 목록과 Slack 발췌가 완전히 일치하지는 않는다 — **Slack 발췌가 언급한 "수정한 파일과 diff", "git worktree 상태", "작업공간별 CPU·메모리·GPU 사용량"은 WebFetch로 가져온 README 요약에서는 명시적으로 확인되지 않았다**(요약 과정에서 누락됐을 수도 있고, README 밖의 별도 문서·스크린샷에서만 다룰 수도 있다). 이 차이를 숨기지 않고 그대로 적어둔다. HN·Lobsters 반응도 WebSearch로 특정하지 못했다.

## 한 줄 요약

**Corgi는 tmux 비슷한 조작 방식(기본 prefix Ctrl+B, Detach/재접속)으로 여러 AI 코딩 에이전트(Claude Code, Codex, Pi, OpenCode) 세션을 터미널 하나에서 관리하는 멀티플렉서로, herdr에서 영감을 받아 Ghostty 터미널 엔진 위에 Bun/TypeScript 데몬과 Zig/C 네이티브 레이어로 구현됐다.** 에이전트별 상태(작업 중/입력 필요/완료)와 컨텍스트·토큰·속도 제한을 보여주고, 비정상 종료나 재부팅 후에도 세션을 재개할 수 있으며, 다중 계정과 셸 스크립팅(`corgi list`, `corgi pane send`, `--json`)을 지원한다.

## 핵심 포인트

- **멀티 에이전트 지원과 자동 훅 설정** — Claude Code·Codex·Pi·OpenCode를 지원하며, 에이전트를 실행하면 Corgi가 이를 감지해 설정에 훅을 추가한다. Pi는 확장 기능을 받고 OpenCode는 별도 설정이 필요 없으며, ***Codex는 `/hooks`에서 훅을 한 번 신뢰해야 하는 번거로움***이 있다.
- **상태 한눈에 보기** — 각 세션이 작업 중·입력 필요·완료 중 어느 상태인지, 활동 요약과 서브에이전트 존재 여부를 패널에서 바로 확인한다. "누가 작업 중인지, 어디에 내 입력이 필요한지"를 찾아 여러 창을 돌아다니지 않아도 되게 하는 것이 이 도구의 핵심 가치 제안이다.
- **컨텍스트·토큰·속도 제한 표시** — 세션별 컨텍스트 사용량, 토큰 소모, 속도 제한(rate limit) 정보를 패널에서 보여준다. 여러 에이전트를 동시에 돌릴 때 ***어느 세션이 한도에 가까워지는지를 터미널을 떠나지 않고 파악할 수 있다***는 뜻이다.
- **세션 재개와 다중 계정** — 비정상 종료나 재부팅 뒤에도 ***세션을 재개***할 수 있고, 여러 계정을 등록해 쓸 수 있다. 이름 변경과 "포크"(세션 분기)도 지원한다.
- **tmux 스타일 접속·분리** — 기본 prefix는 Ctrl+B이고, 단축키 메뉴에서 Detach를 선택하면 프로세스가 백그라운드에서 계속 돌아간다. 다시 `corgi`를 실행하면 같은 세션에 재접속된다 — tmux·herdr 사용자에게 익숙한 조작 모델을 그대로 가져왔다.
- **셸 스크립팅 인터페이스** — `corgi list`, `corgi pane send` 등으로 실행 중인 세션을 셸에서 직접 제어할 수 있고 `--json` 출력도 지원해, 다른 도구나 CI 파이프라인에 Corgi를 끼워 넣을 여지를 열어둔다.
- **아키텍처와 규모** — Bun/TypeScript 데몬이 상태를 관리하고 PTY를 멀티플렉싱하며, Zig/C 네이티브 레이어가 터미널 에뮬레이션·프레임 diff를 담당한다(Ghostty·Kitty 영향). macOS(Apple Silicon)·Linux(amd64)를 지원하고, GitHub 기준 **스타 162개·포크 10개·커밋 636개**, MIT 라이선스(알림 사운드는 herdr에서 가져온 Apache-2.0).

## 인상 깊은 문장

> "Happy helper for your terminal" — README의 소개 문구 그대로. 거창한 오케스트레이션 플랫폼이 아니라 "터미널의 작은 도우미"라는 겸손한 포지셔닝이, 기존 CLI 에이전트를 대체하지 않고 감싸기만 하는 이 도구의 설계 철학과 맞아떨어진다.

## 댓글

GeekNews hada 댓글 수는 원문 접근 차단으로 확인하지 못했다. HN·Lobsters에서 Corgi를 직접 다룬 스레드도 WebSearch로 찾지 못했다 — 비슷한 시기 나온 herdr(유사 포지셔닝의 선행 도구, 저자가 직접 영감을 받았다고 밝힘)가 HN에서 두 차례 크게 다뤄졌다는 점은 확인됐지만, Corgi 자체의 반응 지표는 "확인 불가"로 남긴다. GitHub 스타 162개는 herdr류 선행 도구들(수천~3만 스타대)에 비하면 아직 초기 단계임을 보여주는 수치다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-18-jcode-parallel-terminal-coding-agent]]와의 층위 대비.** jcode는 그 자체가 모델과 직접 통신하는 하네스였다 — Claude Code를 대체하려는 "차 자체를 다시 설계"하는 접근. Corgi는 정반대다 — Claude Code·Codex·Pi·OpenCode를 **그대로 둔 채** 감싸는 멀티플렉서로, "여러 완성차를 한 차고에 세워두고 번갈아 모는" 쪽에 가깝다. jcode 노트가 이미 Orca·Proliferate를 이 오케스트레이터 층위로 분류했는데, Corgi도 그 층위에 들어간다 — 단 Orca·Proliferate가 git worktree 기반 병렬 실행에 무게를 둔 반면, Corgi는 README 기준으로는 **"한 화면에서 여러 세션의 상태·입력 필요 여부를 놓치지 않는다"**는 가시성 쪽에 더 가깝다.
**핵심 전이 2 — [[2026-08-08-orca-parallel-coding-agents-ade]]와의 연결.** 두 도구 모두 기존 CLI 에이전트를 wrapping하는 오케스트레이터형이라는 점에서 같은 계열이다. 다만 Orca는 git worktree 격리로 "충돌 없는 병렬 실행"을 핵심 가치로 삼았는데, 이번 WebFetch로 확인한 Corgi README에는 worktree 관련 언급이 없었다 — Slack 발췌가 설명한 "Git worktree의 상태" 기능이 실존한다면 Orca와 더 가깝게 겹치겠지만, 이번 세션에서는 그 부분을 1차 소스로 확인하지 못했다는 점을 다시 강조해둔다.
**Claude Code 사용 각도** — 평소 Claude Code를 쓰는 입장에서 유용한 지점은 "여러 세션을 동시에 띄웠을 때 어디에 입력이 필요한지"를 매번 터미널을 전환하며 확인하는 수고다. Corgi가 실제로 이 문제를 해결한다면(README 확인 기능 기준으로도 상태·입력 필요 표시는 명시돼 있다), 세션 수가 늘어날수록 체감 가치가 커지는 도구로 보인다 — 다만 162스타·초기 단계라는 점에서 안정성·장기 유지보수는 아직 검증되지 않았다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — Corgi 자체는 범용 개발자 도구이지 CRS 도메인 제품이 아니다. 전이 가능한 원칙만 남기면, 온다 팀이 여러 파트너사 연동 이슈를 병렬로 Claude Code·Codex 세션에 맡기는 상황이 생긴다면, **"어느 세션이 입력을 기다리는지"를 한눈에 보여주는 대시보드형 가시성**은 실제 작업 흐름을 끊지 않는 데 도움이 될 수 있다. 다만 162스타짜리 초기 오픈소스 도구를 바로 사내 표준으로 채택하기보다는, 비슷한 가시성을 제공하는 더 성숙한 도구(herdr 등)와 함께 비교 검토할 후보로 봐야 한다.

## 연관 자료

- [[2026-09-18-jcode-parallel-terminal-coding-agent]] — 같은 "여러 에이전트 동시 운용" 문제를 다른 층위(하네스 자체 재설계)에서 푸는 대비 사례
- [[2026-08-08-orca-parallel-coding-agents-ade]] — 같은 오케스트레이터형 계열, git worktree 기반 병렬 실행에 무게를 둔다는 점에서 Corgi의 가시성 중심 접근과 비교할 거울상

## 한 달 뒤 회고

2026-11-26 즈음, `news.hada.io` 접근이 풀렸다면 hada 댓글·반응을 확인하고, Slack 발췌가 언급한 diff/worktree 상태·CPU·메모리·GPU 사용량 표시 기능이 README 밖의 어느 문서에 실제로 존재하는지(또는 이후 릴리스에서 추가됐는지) 재확인한다. GitHub 스타 수 변화도 함께 점검한다.
