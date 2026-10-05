---
title: "Claude Code 모드(mod) 시작하기 (Anthropic) — 상태 없는 CLI에 자체 UI와 훅을 심어, 사용자가 직접 하네스를 고쳐 쓰게 만들다"
source_title: "Introducing Claude Code mods"
source_url: "https://github.com/anthropics/claude-code-playground/tree/main/claude-code/mods"
source_name: "GitHub (anthropics/claude-code-playground), code.claude.com 플러그인 문서"
referrer_url: "https://news.hada.io/topic?id=34796"
published_at: "2026-10-01 (WebSearch 교차확인)"
summarized_at: "2026-10-05"
category: "ai"
tags: ["claude-code", "mods", "plugins", "hooks", "developer-tools", "hot-reload", "harness-engineering"]
---

# Claude Code 모드(mod) 시작하기 (Anthropic)

> 출처: [anthropics/claude-code-playground — mods](https://github.com/anthropics/claude-code-playground/tree/main/claude-code/mods) (GitHub, 공식 저장소) · GeekNews(id=34796) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 열지 못했다. 반면 **공식 GitHub 저장소(`anthropics/claude-code-playground`)의 mods 디렉터리는 WebFetch로 직접 확보**했고(1차 소스), 이 노트의 핵심 사실(Token Weather·Blast Radius·Replay Theater 세 예제, 설치 명령어, `claude --plugin-dir` 사용법, 필요 버전 `2.1.287+`)는 그 1차 소스에서 나온 것이다. 다만 **출시일(2026-10-01)과 "핫 리로드로 세션 재시작 없이 확인", "자연어로 모드 제작을 요청할 수 있다"는 설명, mods의 권한 범위(Claude Code와 동일한 머신 접근권)**는 AlphaSignal·superpowerdaily·cellcog.ai 등 복수 2차 매체의 WebSearch 스니펫 교차확인으로 보강한 것이라 원문 발표 문구 그대로는 아닐 수 있다. hada 댓글 수, HN/Lobsters 큐레이션 여부는 전혀 확인하지 못했다 — 다만 WebSearch로 LinkedIn·AI 뉴스레터 다수에서 거의 동시에 다뤄진 걸로 보아 반응 자체는 적지 않았던 것으로 보인다(정량 데이터는 없음).

## 한 줄 요약

**Claude Code가 세션 안의 모든 이벤트(도구 호출·턴·렌더링)에 개입할 수 있는 TypeScript 플러그인 "mods"를 10월 1일 도입했다 — 프롬프트를 고치고, 셸 명령을 가로채 승인 UI를 띄우고, 자체 패널을 그리는 것까지 전부 ***핫 리로드로 세션을 재시작하지 않고*** 바로 확인할 수 있게 됐다는 점에서, "하네스를 코드로 설계하는" 영역이 Anthropic 내부에서 사용자 손으로 넘어온 사건이다.**

## 핵심 포인트

- **mods란 무엇인가 — 미들웨어로서의 훅** — mods는 Claude Code의 내부 이벤트에 끼어드는 작은 TypeScript 함수다. 도구 호출을 ***막거나, 고쳐 쓰거나, 재시도***시킬 수 있고, 권한 요청을 승인·거부하거나, Claude가 읽기 전에 도구 결과에서 비밀정보를 지울 수 있다. 화면에 그려지는 것(도구 결과, Claude의 질문)을 바꾸거나 버튼·입력창을 더해 자체 UI를 만들 수도 있다.
- **Token Weather 🌤️ — 약 80줄짜리 컨텍스트 날씨** — 프롬프트 위에 컨텍스트 윈도우 상태를 "날씨"로 표시하고 ***최근 12턴의 작은 스파크라인***을 같이 보여준다. 매 턴마다 자동 갱신된다.
- **Blast Radius 💣 — 위험한 명령 앞에 멈춰 서는 게이트** — `rm -rf`, `git reset --hard`, force push, 마이그레이션 같은 파괴적 셸 명령을 가로채 영향 범위를 보여주고 ***Proceed/Cancel 버튼이 있는 사이드 패널***을 띄운다. dry-run 검사를 먼저 돌린 뒤 승인을 받는 구조다.
- **Replay Theater 🎬 — 턴 단위 diff 재생** — 직전 턴에서 Claude가 만든 파일 편집들을 ***한 번에 하나씩 단계별로*** 돌려볼 수 있게 한다.
- **설치와 제작 — 플러그인 안에 패키징, 자연어로도 작성 가능** — `claude --plugin-dir ./token-weather`로 단일 세션에 바로 적용하거나, `claude plugin marketplace add ./` + `claude plugin install`로 로컬 마켓플레이스에 등록할 수 있다. 각 mod 폴더는 hooks 모듈 + 자체 UI + README를 갖춘 완전한 플러그인이고, `_template/README.md`를 베껴 새 mod를 만들 수 있다. Claude Code 2.1.287 이상이 필요하다.
- **보안 경고가 따라붙는다** — 여러 2차 매체가 공통으로 짚는 지점은, mods가 ***Claude Code 자신과 똑같은 머신 접근 권한***으로 돈다는 것이다. Anthropic은 신뢰할 수 있는 소스의 mod만 설치하라고 안내한다 — 플러그인 생태계가 늘어나는 것과 공급망 신뢰 문제가 그대로 같이 따라온다는 뜻이다.

## 인상 깊은 문장

> "Mods run with the same access to your machine as Claude Code itself."
> (superpowerdaily.com 등 2차 매체의 WebSearch 요약 — Anthropic 공식 발표문의 정확한 워딩인지는 대조하지 못했다. 다만 여러 독립 매체가 같은 취지로 반복해 신뢰도는 있다.)

## 댓글

**hada 댓글 수는 egress 차단으로 확인 불가.** HN이나 Lobsters에 별도 Show HN/토론 스레드가 있었는지도 이 세션에서 특정하지 못했다 — WebSearch 결과는 뉴스레터·블로그 재인용 중심이었고 1차 커뮤니티 토론 링크를 주지 않았다. 다만 LinkedIn·AlphaSignal·여러 "AI 위클리" 뉴스레터가 발표 당일~익일에 거의 동시에 다뤄, 개발자 커뮤니티 안에서 체감 화제성은 있었던 것으로 보인다(정량적 근거는 없다 — n=1 체감 수준의 간접 증거).

## 내 생각 · 적용점

### 핵심 전이 1 — "Agent = Model + Harness" 공식이 이제는 사용자가 직접 고치는 런타임이 됐다

[[2026-04-28-agent-harness-engineering]]은 "모델이 아니면 네가 하네스다"라는 공식을 Anthropic 바깥의 엔지니어(Addy Osmani)가 관찰자 입장에서 정리한 글이었다. mods는 그 하네스 개념을 ***Anthropic이 직접 사용자에게 수정 권한으로 내준*** 사건이다 — 프롬프팅·도구 계층·실행 제어(훅)라는 그 글의 "하네스 6개 영역" 중 특히 "실행 제어" 영역이 이제는 사용자가 TypeScript로 직접 끼워 넣는 영역이 됐다. 하네스 엔지니어링이 "써드파티가 관찰해서 쓰는 지식"에서 "벤더가 1급 기능으로 제공하는 런타임"으로 승격된 셈이다.

### 핵심 전이 2 — "하네스가 곧 회사다" 테제와 정면으로 마주친다

[[2026-10-04-the-harness-is-the-company]]는 "오케스트레이션 코드는 commoditize되고, 사람이 무엇을 고쳤는가의 기록만 해자로 남는다"고 주장했다. mods는 그 commoditize를 Anthropic 자신이 가속하는 사례로 읽힌다 — Claude Code라는 하네스의 가장 안쪽 레이어(승인 로직, UI, 도구 개입)까지 사용자가 직접 바꿔 쓸 수 있게 열어줬으니, Claude Code라는 "제품"과 "그 위에 사용자가 쌓는 커스터마이징"의 경계가 흐려진다. 다만 이게 저자의 논지를 반증하진 않는다 — 오히려 코드 레이어가 공짜(오픈 플러그인)가 될수록, "어떤 mod를 왜 만들었는가"라는 조직별 판단의 기록이 상대적으로 더 희소해진다는 쪽으로도 읽을 수 있다.

### 핵심 전이 3 — Pi의 미니멀리즘과 정반대 방향의 설계 선택

[[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]]는 "기본 도구 4개, 시스템 프롬프트 1,000토큰 미만"을 자랑하는 미니멀 하네스였다. Claude Code의 mods는 정확히 반대 방향이다 — 확장 표면을 의도적으로 넓혀 사용자가 원하는 만큼 UI와 로직을 덧붙이게 한다. 같은 시기 "코딩 에이전트 하네스를 어떻게 설계할 것인가"라는 질문에 두 메이저 도구가 정반대 답을 내놓은 셈이라, 어느 쪽이 "표준"이 될지는 아직 열려 있는 질문으로 남겨둔다.

**이 글은 "Claude를 더 잘 쓰는 데" 직접 도움이 되는 글이다.** mods는 사용자가 Claude Code 세션에서 바로 설치·제작해볼 수 있는 기능이라, 다른 네 글과 달리 추상적 통찰이 아니라 실제로 써볼 수 있는 도구 소개다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 "Claude Code를 쓰는 개발팀의 작업 방식" 수준에 머물지만, 패턴 하나는 CRS 운영 쪽으로 옮겨볼 만하다.** Blast Radius가 보여주는 "위험한 명령 전에 영향 범위를 보여주고 승인받는" 패턴은, 온다 CRS에서 대량 요금 변경 스크립트나 재고 일괄 수정, DB 마이그레이션처럼 되돌리기 어려운 운영 작업 전에 "이 변경이 몇 개 숙소·몇 건의 예약에 영향을 주는지"를 보여주는 승인 게이트로 그대로 번역할 수 있다. [[2026-10-03-deepseek-harness-desktop-app]]에서도 비슷하게 "AI가 짠 요금·재고 변경을 적용 전 diff로 보여주는" 패턴을 CRS 적용점으로 짚었는데, mods의 Blast Radius는 그 아이디어를 Claude Code 세션 안에서 바로 실험해볼 수 있는 구체적 레퍼런스 구현이라는 점에서 더 실천적이다.

## 연관 자료

- [[2026-04-28-agent-harness-engineering]] — "Agent = Model + Harness" 공식의 원류, mods는 그 하네스의 실행 제어 영역을 사용자에게 1급 기능으로 넘긴 사례
- [[2026-10-04-the-harness-is-the-company]] — 오케스트레이션 코드의 commoditize 테제와 mods가 정면으로 마주치는 지점
- [[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]] — 같은 시기 정반대 방향(미니멀리즘)을 택한 하네스 설계
- [[2026-10-03-deepseek-harness-desktop-app]] — 위험한 변경을 diff로 승인받는 패턴의 또 다른 선례

## 한 달 뒤 회고

*(2026-11-05 즈음 — (1) hada·HN에서 실제 댓글 반응을 egress가 풀리면 직접 확인. (2) 커뮤니티에서 어떤 서드파티 mod 생태계(마켓플레이스)가 자리잡았는지 점검. (3) 이 레포 `.claude/hooks/session-start.sh`처럼 이미 쓰고 있는 훅을 mod 형태(자체 UI 포함)로 확장할 여지가 있는지 검토.)*
