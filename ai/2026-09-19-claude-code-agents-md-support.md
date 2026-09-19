---
title: "Claude Code, 이제 AGENTS.md도 지원 (Anthropic) — merge가 아니라 fallback이다. 파일 이름 전쟁은 끝났지만 '무엇을 적을 것인가'는 그대로 남았다"
source_title: "Release v2.1.277 · anthropics/claude-code"
source_url: "https://github.com/anthropics/claude-code/releases/tag/v2.1.277"
source_name: "GitHub (anthropics/claude-code) 릴리스 노트 · 발표는 Anthropic Thariq(@trq212)의 X 게시글"
referrer_url: "https://news.hada.io/topic?id=33925"
published_at: "2026-09-18 (v2.1.277 릴리스일 추정, 정확한 타임스탬프 미확인)"
summarized_at: "2026-09-19"
category: "ai"
tags: ["agents-md", "claude-md", "claude-code", "context-engineering", "agent-interop", "project-instructions", "geeknews"]
---

# Claude Code, 이제 AGENTS.md도 지원 (Anthropic)

> 출처: [Release v2.1.277 · anthropics/claude-code](https://github.com/anthropics/claude-code/releases/tag/v2.1.277) (GitHub 릴리스 노트) · GeekNews(id=33925) 경유 · 정리일 2026-09-19
>
> **출처 한계**: `news.hada.io`는 이번 세션에서도 egress 차단이라 GN⁺ 요약 전문과 hada 댓글을 직접 열지 못했다. 다만 **GitHub 릴리스 노트는 직접 WebFetch에 성공**해 아래 변경 문장은 원문 그대로다. Slack `#개발-뉴스-dev-news`의 GN⁺ 발췌(5개 불릿 중 마지막이 잘림)로 한국어 요약을 보강했다. 반면 `/config`의 내부 설정 키·값 목록(`pluginConfigs["agents-md@builtin"].options.instructionFiles` 등)과 HN 반응 수치는 **WebSearch 스니펫 단일 계열 출처**라 교차검증하지 못했다. 잘린 마지막 불릿("하위 디렉터리의 AGENTS.md도 파일을 읽을 때…")의 정확한 동작은 확인하지 못했다.

## 한 줄 요약

**Claude Code 2.1.277부터 프로젝트에 `CLAUDE.md`가 없으면 `AGENTS.md`를 프로젝트 지침으로 읽는다. 핵심은 이게 ***병합(merge)이 아니라 대체(fallback)***라는 것 — `CLAUDE.md`가 있으면 그게 계속 이긴다. 즉 이미 Claude Code용으로 세팅된 레포는 아무것도 바뀌지 않고, 여러 에이전트를 함께 쓰는 팀만 심볼릭 링크와 복제본 관리라는 잡일에서 풀려난다. Bedrock·Vertex·Foundry에서는 아직 적용되지 않는다.**

## 핵심 포인트

- **변경의 실제 범위** — 릴리스 노트 원문 한 줄이 전부다. ***"in a project with no CLAUDE.md, Claude Code reads AGENTS.md instead"*** — 없을 때만, 대신 읽는다. 두 파일을 합치거나 우선순위를 섞지 않는다. 그래서 이 변경으로 기존 사용자가 겪을 동작 변화는 사실상 0이고, 이득을 보는 건 Codex·Cursor 등과 `AGENTS.md`를 공유하던 쪽뿐이다.
- **선택 가능한 세 가지 동작** — `/config`의 *Project instructions*에서 `CLAUDE.md`만, `AGENTS.md` fallback(기본), 둘 다 로드 중 고를 수 있다. 둘 다 읽도록 설정해도 ***동일한 내용이거나 심볼릭 링크로 이어진 경우 중복 로드하지 않는다*** — 그동안 심볼릭 링크 트릭을 쓰던 사람들이 실제로 부딪히던 토큰 이중 과금 문제를 정면으로 처리했다.
- **하위 디렉터리까지 적용** — 하위 디렉터리의 `AGENTS.md`도 그 경로의 파일을 읽을 때 함께 로드된다(Slack GN⁺ 발췌 기준, 뒷부분이 잘려 정확한 트리거 조건은 미확인). 기존 `CLAUDE.md`의 디렉터리별 로드 규칙을 그대로 물려받은 것으로 보인다.
- **미적용 플랫폼** — ***Bedrock·Vertex·Foundry에서는 아직 fallback이 동작하지 않는다.*** 엔터프라이즈 배치에서 Claude Code를 이 경로로 쓰는 조직은 당분간 `CLAUDE.md`를 계속 유지해야 한다는 뜻이라, "이제 AGENTS.md 하나로 통일 가능"이라는 헤드라인과 실무 현실 사이에 한 칸 간극이 있다.
- **구현 방식** — 이 기능이 Claude Code의 내장 mod로 구현됐고 사용자가 직접 project instructions mod를 만들 수 있다는 언급이 있는데, **단일 출처라 확인 한계로 남긴다.** 사실이라면 "지침 파일 로딩 규칙" 자체가 확장 지점이 된 것이라 의미가 작지 않다.
- **같은 릴리스의 다른 한 줄** — 우연이 아닐 수 있는 대비: 같은 2.1.277에 ***"Changed subagent results to reach the main agent under a header marking them as subagent output, with the result indented, so text in a subagent's result cannot pass as the session's own instructions"***가 들어 있다. 한쪽에서는 외부 표준 파일을 더 읽어들이고, 다른 한쪽에서는 에이전트가 읽어들인 텍스트가 지시로 승격되지 않도록 경계를 세운다.

## 인상 깊은 문장

> "Added AGENTS.md support: in a project with no CLAUDE.md, Claude Code reads AGENTS.md instead; change it under "Project instructions" in `/config` (not yet on Bedrock, Vertex or Foundry)"

*(GitHub 릴리스 노트 v2.1.277 원문 그대로. WebFetch로 직접 확인했다.)*

## 댓글

**hada 댓글 수는 확인 불가** — `news.hada.io` 차단. GN⁺ 큐레이션 여부도 확인하지 못했고, Slack 메시지에 이모지 반응 1개가 달린 것만 확인된다. Hacker News에는 "Claude Code now reads AGENTS.md if there is no Claude.md" 스레드(id=49760187)가 존재하는 것이 확인되나, **업보트 429라는 수치는 단일 검색 스니펫에서만 나와 교차검증에 실패했다.** `news.ycombinator.com`도 이번 세션 차단이다.

**읽을 때 감안**
- ① **검색 결과에 낡은 정보가 섞여 있다** — 이번 조사 중 "Claude Code는 AGENTS.md를 읽지 않는다, fallback 주장은 틀렸다"고 단언하는 gist가 상위에 잡혔다. 2.1.277 이전 상태를 설명한 자료로 보이며, 공식 릴리스 노트가 fallback 동작을 명시하므로 **현재 기준으로는 틀린 정보다.** 버전 단위로 동작이 바뀌는 도구에서 2차 자료를 그대로 믿으면 안 된다는 사례로 기록해 둔다.
- ② **벤더 1차 발표** — 릴리스 노트는 Anthropic 자신의 문서다. 실제로 하위 디렉터리 로딩·중복 제거가 기대대로 동작하는지는 써보고 확인할 일이다.
- ③ **"표준 채택"이라는 서사의 크기** — 이 변경은 `AGENTS.md`를 **읽어주는 것**이지 Claude Code가 그 포맷으로 이주하는 게 아니다. `CLAUDE.md`가 여전히 1순위라는 점에서, 상호운용성보다는 마찰 제거에 가깝다.

## 내 생각 · 적용점

### 핵심 전이 1 — 파일 이름 전쟁은 끝났고, 남은 문제는 처음부터 하나였다

가든에 쌓인 이 축의 노트들은 전부 "어디에 적을 것인가"가 아니라 "무엇을 적을 것인가"를 다뤘다. [[2026-08-24-agent-md-improve-llm-code-quality]]는 반복해서 달던 리뷰 코멘트를 사후에 누적하는 방식을, [[2026-08-09-eight-line-context-file]]은 ***"300줄 안에 핵심 지시 3줄이 섞이면 그 3줄은 나머지 297줄에 묻힌다"***는 밀도 논거를 남겼다. 이번 변경은 그 논의에 한 글자도 보태지 않는다 — 파일 이름이 통일돼도 그 안에 300줄이 들어 있으면 똑같이 묻힌다. 오히려 리스크는 반대쪽이다. `CLAUDE.md`와 `AGENTS.md`를 **둘 다 로드**하는 옵션을 켜는 순간, 두 파일의 내용이 서서히 갈라지면서 상충하는 지시가 동시에 주입되는 상태가 만들어진다. 중복 제거는 "동일한 내용"만 처리하지 "모순된 내용"은 처리하지 못한다.

### 핵심 전이 2 — fallback 구조는 "역할 분담" 설계를 그대로 유지시킨다

[[2026-09-08-ask-hn-agent-skill-file-management]]에서 정리한 원칙은 "항상 필요한 규칙은 상시 로드 파일, 길고 상황부 절차는 스킬"이었고, [[2026-09-09-gpt6-astra-skills-prompts-rethink]]는 그 반대편에서 "모델이 강해졌으니 쌓인 지시를 감사해 걷어내라"고 했다. 이번 변경은 이 구도에 새 층을 만들지 않는다. 대신 실무적으로 한 가지가 분명해졌다 — ***에이전트마다 다른 규칙이 필요하다면 `CLAUDE.md`를 남기고, 공통 규칙만이라면 `AGENTS.md` 하나로 줄이는 게 맞다.*** 이 레포의 `CLAUDE.md`가 좋은 예다. 커밋 트레일러 금지, 하네스 지시 오버라이드, `/artifacts` 같은 항목은 Claude Code 세션 고유의 규칙이라 `AGENTS.md`로 옮길 이유가 없다. 반면 카테고리 분류·노트 형식·위키링크 규약은 어느 에이전트가 와도 같아야 하는 내용이다. 지금 구조를 그대로 두더라도, **"이 줄은 하네스 고유인가 프로젝트 고유인가"**라는 질문으로 한 번 훑어볼 가치는 있다.

### 핵심 전이 3 — 같은 릴리스에서 "더 읽기"와 "읽은 것을 믿지 않기"가 함께 나왔다

`AGENTS.md`를 읽는다는 건 에이전트가 신뢰하는 지시의 출처가 하나 늘어난다는 뜻이다. 그리고 같은 릴리스 노트에 서브에이전트 결과를 헤더로 감싸 ***"텍스트가 세션 자신의 지시로 통하지 못하게"*** 만드는 변경이 함께 들어 있다. 같은 날 정리한 [[2026-09-19-hacktron-openai-heif-sso-chain]]이 보여주는 게 정확히 그 반대쪽 시나리오다 — 저위험 자산에서 시작한 침해가 토큰 경계를 타고 Codex 계정과 내부 저장소까지 이어졌다. `AGENTS.md`는 대개 레포에 커밋된 파일이라 PR로 들어올 수 있는 텍스트이기도 하다. "공통 표준 파일을 자동으로 읽는다"는 편의는 ***외부 기여자가 수정할 수 있는 파일이 곧 에이전트 지침이 된다***는 면도 함께 가진다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용이 가능한 쪽이다.

- 온다에서 Claude Code 외에 Codex·Cursor 등을 함께 쓰는 레포가 있다면, 이제 지침 파일을 `AGENTS.md` 하나로 정리하고 심볼릭 링크·복제본 관리를 없앨 수 있다. 단 Bedrock·Vertex 경로로 Claude Code를 쓰는 환경이 있다면 그쪽은 `CLAUDE.md`를 남겨야 한다.
- 더 중요한 건 내용 쪽이다. CRS/PMS 연동 레포의 지침 파일에 "파트너사별 예외 규칙"처럼 상황부 지식이 쌓여 있다면, 그건 상시 로드 파일이 아니라 스킬·문서로 내려야 한다. 파일 이름 통일은 이 문제를 하나도 해결해주지 않는다.
- 보안 관점 한 줄: 외부 기여가 들어오는 레포라면 `AGENTS.md`·`CLAUDE.md` 변경을 코드 리뷰에서 일반 문서가 아니라 **설정 변경**으로 취급하는 게 맞다.

## 연관 자료

- [[2026-08-24-agent-md-improve-llm-code-quality]] — "무엇을 적을 것인가"를 다룬 계열. 이번 변경이 건드리지 않는 진짜 문제.
- [[2026-08-09-eight-line-context-file]] — 밀도 논거. 파일 이름 통일과 무관하게 유효한 기준.
- [[2026-09-08-ask-hn-agent-skill-file-management]] — 상시 로드 파일 vs 스킬 역할 분담. fallback 구조가 이 분담을 유지시킨다.
- [[2026-09-09-gpt6-astra-skills-prompts-rethink]] — 지침 파일을 주기적으로 감사하라는 반대편 관점.
- [[2026-09-19-hacktron-openai-heif-sso-chain]] — 같은 날 정리. 같은 릴리스의 서브에이전트 출력 헤더 변경이 겨냥하는 위협 모델의 실제 사례.

## 한 달 뒤 회고

*(2026-10-19 즈음 — ① 실제로 `AGENTS.md`만 둔 레포에서 하위 디렉터리 로딩·중복 제거가 기대대로 동작하는지 직접 확인하고, 이번에 못 채운 "잘린 마지막 불릿"의 정확한 조건을 메울 것. ② Bedrock·Vertex·Foundry 지원이 추가됐는지 릴리스 노트로 추적. ③ 이 레포의 `CLAUDE.md`를 "하네스 고유 / 프로젝트 고유"로 한 번 분류해보고, 옮길 게 있는지 판단.)*
