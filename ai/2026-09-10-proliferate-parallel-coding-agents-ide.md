---
title: "Proliferate — 여러 코딩 에이전트를 병렬로 실행하는 오픈소스 AI IDE (proliferate-ai, YC S25) — Orca와 Paseo가 풀던 문제를 벤처 자금으로 다시 푸는 세 번째 경쟁자, 라이선스는 Paseo 편(AGPL-3.0)에 선다"
source_title: "GitHub - proliferate-ai/proliferate: The open-source AI IDE for Claude Code, Codex, OpenCode, and more"
source_url: "https://github.com/proliferate-ai/proliferate"
source_name: "GitHub (proliferate-ai), GeekNews(id=33463) 경유"
referrer_url: "https://news.hada.io/topic?id=33463"
published_at: "확인 불가 (지속 업데이트되는 오픈소스 저장소. 회사는 YC S25 배치 소속)"
summarized_at: "2026-09-10"
category: "ai"
tags: ["coding-agents", "parallel-workflows", "git-worktree", "self-hosted", "agpl", "developer-tools"]
---

# Proliferate — 여러 코딩 에이전트를 병렬로 실행하는 오픈소스 AI IDE

> 출처: [GitHub - proliferate-ai/proliferate](https://github.com/proliferate-ai/proliferate) (proliferate-ai) · GeekNews(id=33463) 경유 · 정리일 2026-09-10

> **출처 한계**: 이번 세션에서 `news.hada.io`(원 토픽)와 그 프랑스어 미러 `fr.news.hada.io`가 모두 접근 차단돼 GeekNews 본문·hada 댓글 수를 직접 확인하지 못했다. `news.ycombinator.com`·`hn.algolia.com`·`promptzone.com`도 전부 차단돼 관련 Show HN 스레드의 실제 댓글 텍스트도 인용하지 못한다. 대신 WebSearch로 GitHub 저장소 원문(README·AGENTS.md·`specs/systems/harnesses/README.md`)과 Y Combinator 회사 정보(YC 페이지·LinkedIn·startupintros 교차 확인)를 확보해 재구성했다. Slack 발췌문 중 뒷부분이 잘린 "실행 파일을 그대로 호출" 설명은 harness 스펙 문서로 별도 검증했다.

## 한 줄 요약

**Proliferate는 Claude Code·Codex·OpenCode·Cursor·Grok 등 서로 다른 코딩 에이전트를 하나의 워크스페이스에서 병렬로 돌리는 오픈소스·셀프호스팅 AI IDE다.** 작업마다 격리된 git worktree와 브랜치를 만들어 에이전트들이 서로의 파일을 건드리지 않게 하고, 터미널·대화·리뷰 상태도 작업 단위로 분리한다. 각 에이전트의 동작을 자체 재구현하는 대신 해당 제품의 CLI 바이너리를 그대로 spawn해서 쓰고, 그 위에 subagent 위임·MCP/Skills 연동·반복·이벤트 기반 워크플로를 얹는다. Y Combinator S25 배치 소속 스타트업(True Ventures·Pear VC 등 투자)이 만들었고 라이선스는 AGPL-3.0이다.

## 핵심 포인트

- **Native harnesses** — Claude Code, Codex, OpenCode, Cursor, Grok 등을 각 벤더의 실제 CLI를 그대로 실행하는 방식(`launcher.rs`/`executable.rs`/`model_discovery.rs`)으로 지원. 기능을 자체 재구현하지 않고 "provider CLI mechanics"를 소비하는 구조라고 저장소 스펙 문서(`specs/systems/harnesses/README.md`)에 명시돼 있다.
- **Worktree workspaces** — 작업마다 ***"an isolated branch and working directory for every task"***(README) — 고립된 브랜치·작업 디렉터리를 만들어 에이전트들이 동시에 작업해도 파일이 충돌하지 않는다.
- **Parallel agents** — 같은 워크스페이스 안에서 여러 에이전트가 각자 자기 작업을 나란히 진행.
- **Subagents** — ***"agents delegate scoped work to child agents and pick the results back up when they finish"***(README) — 에이전트가 일부 작업을 하위 에이전트에 넘기고, 완료된 결과를 받아 나머지를 이어간다.
- **Integrations & Workflows** — MCP·Skills·Computer Use·Browser Use·커스텀 도구 연동, 반복 실행·이벤트 트리거 기반 워크플로.
- **완전 셀프호스팅** — 컨트롤 플레인 전체를 Docker·AWS·GCP·Azure·Kubernetes·에어갭 환경까지 직접 운영 가능. 라이선스는 AGPL-3.0.
- **자본 구조** — Y Combinator S25 배치, True Ventures·Pear VC·YC 창업자 50여 명 투자. 창업자 Pablo Hansen은 19세에 AI 석사를 마치고 Onyx(YC W24) 1호 직원을 거쳐 창업했다(WebSearch 교차확인, 1차 출처 직접 대조는 못함).

## 인상 깊은 문장

> "Run Claude Code, Codex, OpenCode, Grok, and any other coding agent in parallel, in one workspace." (GitHub 저장소 소개문, WebFetch로 직접 확인)

> "Claude Code/Codex/OpenCode/Cursor/Grok에 서로 다른 작업을 맡기고, 진행 상황과 코드 변경을 한곳에서 확인하는 데스크톱 IDE" (Slack 요약 발췌)

## 댓글

이번 세션은 GeekNews 원문·프랑스어 미러 모두 차단돼 hada 댓글 수를 확인하지 못했다. Show HN 스레드(`news.ycombinator.com/item?id=49390739`로 추정)도 직접 접근이 차단돼 실제 댓글을 대조하지 못했다 — WebSearch 결과 스니펫에 "포인트 16·댓글 6개, 컨슈머 하드웨어에서의 지연시간 질문"이라는 언급이 있었지만 원문을 못 봤으므로 이 수치는 미확인 2차 정보로만 남긴다. 감안할 점: ①이 도구는 벤처 투자(YC S25 + True Ventures·Pear VC)를 받은 회사의 제품으로, Orca·Paseo 같은 순수 커뮤니티 프로젝트와 달리 오픈소스 공개 자체가 오픈코어 성장 전략의 일부일 가능성이 있다(이해관계). ②GitHub 스타 수는 확인 시점 488개로, 이번 시즌 다룬 다른 오픈소스 도구 대비 아직 초기 단계다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 문제를 세 번째로 푸는데, 이번엔 자본 구조가 다르다

[[2026-08-08-orca-parallel-coding-agents-ade]]와 [[2026-08-08-paseo-coding-agent-orchestrator]]가 이미 "여러 코딩 에이전트를 격리된 git worktree에서 병렬 실행"이라는 같은 니치를 MIT(개인 개발자, 순수 입소문)와 AGPL(프라이버시 중심 셀프호스팅)로 각각 풀었는데, Proliferate는 정확히 같은 문제를 YC S25 벤처 자금으로 푸는 세 번째 경쟁자다. Orca 노트에서 정직한 급소로 남겼던 질문 — "이 니치가 폭발적으로 성장하는 시점의 타이밍 수혜인지, 제품이 정말 좋아서인지 구분하기 어렵다" — 에 대한 후속 신호로 읽을 수 있다. 개인 오픈소스 프로젝트 둘에 이어 기관 투자를 받은 경쟁자가 등장했다는 것은, 적어도 투자자 입장에서는 이 문제가 일회성 유행이 아니라 시장이 있다고 판단했다는 뜻이다. 다만 라이선스는 Orca의 MIT가 아니라 Paseo와 같은 AGPL-3.0을 택했다 — 셀프호스팅·프라이버시를 앞세운 진영에 합류한 셈이다.

### 핵심 전이 2 — subagent 위임이 벤더 내부 기능에서 벤더 횡단 계층으로 옮겨간다

[[2026-05-29-claude-code-dynamic-workflows]]에서 정리한 Anthropic의 다이나믹 워크플로우는 Claude Code 한 세션 안에서 수십~수백 서브에이전트를 동적으로 오케스트레이션하고 결과를 검증하는 기능이었다. Proliferate의 subagent 위임은 그 위에 한 겹을 더 얹는다 — Claude Code·Codex·OpenCode·Cursor·Grok 각각이 자기 내부에서 하위 에이전트를 부리는 동안, Proliferate 자체는 이 여러 벤더 에이전트들을 워크트리 단위로 나란히 관리하는 상위 오케스트레이션 계층 역할을 한다. 오케스트레이션 기능이 "벤더 하나의 제품 기능"에서 "여러 벤더를 가로지르는 인프라 계층"으로 옮겨가는 흐름을 보여준다.

### 핵심 전이 3 — 병렬 실행 능력이 늘어도 orchestration-tax의 병목은 그대로다

[[2026-05-29-orchestration-tax]]의 핵심 명제는 "에이전트를 병렬로 띄우는 비용은 거의 0이지만, 결과를 이해·검토·병합하는 인간의 판단은 병렬화되지 않는다"는 것이었다. Proliferate는 정확히 "몇 개까지 병렬로 띄울 수 있는가"를 계속 늘리는 방향의 도구다 — Orca가 5개 정도로 시연했던 것을, Proliferate는 워크플로·이벤트 트리거까지 붙여 사실상 개수 제한 없이 확장한다. 하지만 그 논문의 처방은 정반대다: "에이전트 수는 UI가 허용하는 수가 아니라 내가 검토 가능한 수(보통 한 자릿수)에 맞춰야 한다." Proliferate 같은 도구가 병렬 실행의 상한을 계속 밀어올릴수록, 이 검토 병목과의 간극(=오케스트레이션 세금)은 오히려 더 커질 가능성이 크다 — 도구가 문제를 푸는 게 아니라 문제를 더 눈에 띄게 만드는 경우다.

## 호스피탈리티 / CRS 적용 포인트

온다가 실제로 Proliferate를 도입했다는 근거는 전혀 없다 — 아래는 순수 원칙 차원의 적용 가능성이다. 온다 CRS 개발팀이 이미 Claude Code 등을 실무에 쓰고 있다는 전제 위에서, 한 스프린트 안에 성격이 다른 여러 작업(예: 예약 API 대규모 마이그레이션, 결제 게이트웨이 긴급 버그 수정, 채널매니저 연동 신규 기능)을 동시에 각각 다른 CLI 에이전트에게 맡기고 진행 상황·diff·리뷰 상태를 한 화면에서 확인하는 워크플로는 구체적으로 매력적이다. 다만 두 가지를 함께 챙겨야 한다. 첫째, [[2026-05-29-orchestration-tax]] 원칙대로 동시 실행 에이전트 수를 늘리기 전에 "팀이 실제로 그날 리뷰할 수 있는 PR 개수"부터 먼저 정해야 한다 — 안 그러면 Orca 노트가 지적한 "미완 잔량"만 쌓인다. 둘째, [[2026-08-08-paseo-coding-agent-orchestrator]] 노트에서 이미 짚은 것과 동일하게, AGPL-3.0 라이선스이므로 CRS 내부 인프라·자체 개발 도구에 통합하기 전에 법무 검토가 필요하다(파생 소프트웨어 소스 공개 의무 가능성). "실행 파일을 그대로 호출"하는 아키텍처 자체는, 이미 구독 중인 Claude Code 등의 약관·라이선스를 그대로 유지한 채 오케스트레이션만 얹는 설계라 벤더 종속 리스크가 상대적으로 낮다는 점은 CRS SaaS 조직의 벤더 관리 관점에서 참고할 만하다.

## 연관 자료

- [[2026-08-08-orca-parallel-coding-agents-ade]] — 같은 니치의 순수 오픈소스(MIT) 선행 사례, 벤처 자금 버전과의 대조
- [[2026-08-08-paseo-coding-agent-orchestrator]] — 같은 AGPL-3.0 라이선스 선택, 셀프호스팅·프라이버시 진영 합류
- [[2026-05-29-claude-code-dynamic-workflows]] — 벤더 내부 서브에이전트 오케스트레이션이 벤더 횡단 계층으로 옮겨가는 지점
- [[2026-05-29-orchestration-tax]] — 병렬 실행 능력 증가가 검토 병목을 해소하지 못한다는 반론

## 한 달 뒤 회고

*(2026-10-10 즈음 — ①Proliferate의 GitHub 스타·채택 규모가 Orca·Paseo 대비 어떻게 움직였는지, ②Show HN 스레드 실제 반응을 이번엔 확인할 수 있는지, ③YC 백드 오픈소스 도구의 AGPL 전략이 기업 채택에 실제로 장벽이 됐는지 기록.)*
