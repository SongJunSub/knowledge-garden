---
title: "Claude Code Week 36 (v2.1.251–v2.1.261) — Claude Fable 5.1 도입, 백그라운드 Computer Use, 그리고 안 쓰는 스킬을 찾아주는 /skill-doctor"
source_title: "Week 36 · August 31 – September 4, 2026"
source_url: "https://code.claude.com/docs/en/whats-new/2026-w36"
source_name: "code.claude.com"
referrer_url: "https://code.claude.com/docs/en/whats-new#week-36"
published_at: "2026-09-04"
summarized_at: "2026-09-15"
category: "ai"
tags: ["claude-code", "changelog", "claude-fable-5-1", "computer-use", "skills", "desktop", "claude-usage"]
---

# Claude Code Week 36 (v2.1.251–v2.1.261) — Claude Fable 5.1 도입, 백그라운드 Computer Use, 그리고 안 쓰는 스킬을 찾아주는 /skill-doctor

> 출처: [Week 36 · August 31 – September 4, 2026](https://code.claude.com/docs/en/whats-new/2026-w36) (Claude Code 공식 What's New) · Slack #개발-뉴스-dev-news 경유 · 정리일 2026-09-15

## 한 줄 요약
**Claude Fable 5.1이 100만 토큰 컨텍스트로 Claude Code에 들어오고(`fable` 별칭이 이제 5.1을 가리킴), macOS Desktop 앱의 Computer Use가 백그라운드에서 돌며 작업을 이어가고, `/diff`는 대화 옆에 실시간으로 갱신되는 패널로 바뀌었으며, `/skill-doctor`는 내가 설치한 스킬 각각이 컨텍스트에 얼마를 쓰고 실제로 얼마나 쓰이는지 보여준다.**

## 핵심 포인트
- **Claude Fable 5.1** — Claude Code에서 100만 토큰 컨텍스트 윈도우로 사용 가능해졌고, `fable` 별칭이 이제 5.1을 가리킨다(단 Claude apps 게이트웨이 세션에서는 `fable`이 여전히 Fable 5를 가리키므로, 게이트웨이가 5.1을 서비스한다면 `/model claude-fable-5-1`을 직접 실행해야 함). v2.1.257 이상 필요. Anthropic API에서는 조직에 제공 가능하다고 서버가 알려줄 때만 피커에 표시되지만, `/model fable`을 직접 입력하면 서버에 바로 확인한다.
- **Desktop에서 백그라운드 Computer Use** — macOS에서 Claude Code Desktop 앱의 Computer Use가 이제 백그라운드에서 동작한다. 승인한 앱 안에서 Claude가 보고 조작하는 동안 사용자는 다른 작업을 계속할 수 있다. Pro·Max 플랜 베타.
- **전체화면 렌더링의 실시간 diff 패널(v2.1.260)** — 전체화면 렌더링에서 `/diff`가 닫아야 하는 뷰어 대신 대화 옆 패널로 열린다. 변경된 파일과 추가·삭제 줄 수를 나열하고, Claude가 파일을 편집하거나 셸 명령을 실행할 때마다 갱신된다. 패널에서 마우스로 줄을 선택하면 다음 프롬프트에 첨부할 수 있다. git 저장소 안, 폭 110컬럼 이상 터미널에서 동작.
- **안 쓰는 스킬을 찾는 `/skill-doctor`** — 설치된 스킬마다 컨텍스트 비용과 실제 사용 빈도를 보여줘 어떤 걸 끌지 판단하게 돕는다. ***스킬 목록에 있는 모든 스킬은 Claude가 실제로 쓰든 안 쓰든 매 턴 컨텍스트에 더해진다***는 게 이 기능이 다루는 문제. v2.1.252 이상 필요, feature-flag fetching을 건너뛰는 세션에서는 사용 불가. 인터랙티브 세션에서는 `/plugin` 관리자의 Stats 탭에 리포트가 열리고, `-p` 비대화형 모드에서는 텍스트로 출력.
- **기타 주요 변경** — `PreModelSwitch` hook으로 모델 전환 요청 자체를 막을 수 있고 `PostModelSwitch` hook으로 전환 후 컨텍스트 추가 가능; `/cost`에 `Prompt cache (main)` 줄 추가(캐시로 처리된 입력 토큰 비율, 캐시 미스, 캐시가 warm한지, 마지막 미스의 유력 원인까지); 조직은 `managedMcpServers`로 모든 사용자에게 HTTP·SSE MCP 서버를 배포 가능; `/effort`와 `/model` 피커가 모델별로 effort 레벨을 따로 저장(Enter 대신 `s`를 누르면 현재 세션에만 적용); Auto mode 분류기가 기본으로 클라우드 인스턴스 메타데이터 엔드포인트에서 자격증명을 요청하거나 Claude가 시작하지 않은 형제 컨테이너에 연결하는 행동도 차단; Auto mode에서 작업 디렉터리 밖 파일을 처음 읽을 때 확인을 요청(이후 그런 읽기를 차단하는 옵션 포함); `bashOutputMaxChars`·`taskOutputMaxChars`를 최대 128,000자까지 올려 성공한 명령·백그라운드 작업 출력을 더 많이 인라인으로 받을 수 있음; 프로젝트 `.claude/settings.json`에 `defaultMode: "bypassPermissions"`를 두면 더 이상 적용되지 않고 Manual 모드로 시작(사용자·managed settings에 두거나 `--permission-mode`로 전달해야 함); 시트 기반 Enterprise 플랜이 이제 기본으로 Opus 5 사용.

## 인상 깊은 문장
> "Claude Fable 5.1 is available in Claude Code with a 1M-token context window, and the fable alias now selects it."

> "Every skill in the skill listing adds to your context on every turn, whether or not Claude ever uses it."

## 댓글
Week 33~35와 마찬가지로 code.claude.com 공식 changelog를 WebFetch로 전문 확보한 1차 출처 직접 확인이다. 댓글·커뮤니티 반응은 changelog 페이지 자체에 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — Fable 5.1이 드디어 Claude Code에 들어온 것은 이미 이 가든이 다룬 출시 흐름의 자연스러운 다음 단계
[[2026-09-02-claude-fable-5-1-mythos-5-1-release]]가 "벤치마크보다 캐시 읽기 75% 인하가 실질적 변화"라고 짚었던 그 모델이, 이번 주에야 Claude Code 안에서 `fable` 별칭으로 정식 연결됐다 — 출시와 하네스 통합 사이에 약 2주의 시차가 있었다는 뜻이다. 그리고 [[2026-09-03-claude-fable-5-1-prompting-guide]]가 강조한 "effort가 이제 지능·지연·비용을 조절하는 첫 다이얼"이라는 조언은, 이번 주 changelog의 "모델별로 effort 레벨을 따로 저장"하는 기능과 정확히 맞물린다 — Fable 5.1로 옮기며 기존 5.0 설정을 그대로 가져오면 안 된다는 그 가이드의 경고가, 이제 모델별 effort 저장 기능으로 실제로 다루기 쉬워졌다.

### 핵심 전이 2 — 백그라운드 Computer Use는 [[2026-08-22-computer-use-skills-files-api-ga]]가 예고한 GA화의 데스크톱 완성판
그 노트가 "에이전트가 보고 조작하고(Computer/Browser Use) 방법을 알고(Skills) 파일을 주고받는(Files) 세 축이 독립 API로 굳어졌다"고 정리한 프로덕션 GA의 다음 단계가, 이제 "백그라운드에서, 사용자 작업을 방해하지 않고" 돌아가는 형태로 Desktop 앱에 구현됐다. API 차원의 성숙이 실제 제품 UX(포그라운드 독점 없이 백그라운드 실행)로 이어지는 흐름이다.

### 핵심 전이 3 — `/skill-doctor`는 [[2026-06-08-anthropic-skills-building-guide]]가 경고한 "컨텍스트 비용"을 처음으로 계측 가능하게 만든 도구
그 가이드가 스킬 설계 원칙으로 "검증은 결정적 코드로, 워크플로는 점진적 공개로"를 내세웠는데, 정작 "스킬이 매 턴 컨텍스트를 갉아먹는다"는 비용 자체를 확인할 도구는 없었다. `/skill-doctor`가 그 공백을 메운다 — 스킬 목록에 있다는 것 자체가 비용이라는 사실을, 이제 숫자로 보여준다. [[2026-09-14-diagram-design-skill-for-agents]] 같은 스킬을 여러 개 설치해둔 상태라면, 실제로 얼마나 쓰이는지 이 도구로 점검해볼 만하다.

## 호스피탈리티 / CRS 적용 포인트
이 changelog도 대부분 클로드 코드 사용법에 직접 적용된다. **`/skill-doctor`는 지금 바로 이 세션에 써볼 수 있다** — 이 가든의 자율 워크플로우가 참조하는 스킬들(artifact-design, dataviz 등)이 실제로 자주 쓰이는지, 컨텍스트 비용 대비 값어치를 하는지 점검하는 데 직접 유용하다. 백그라운드 Computer Use는 macOS 전용이라 이 세션 환경(리눅스 컨테이너)에는 해당하지 않는다. 온다 CRS 관점의 직접 적용은 이번에도 거의 없다 — 정직하게 밝히면, 이번 주 항목들은 전부 "Claude Code를 어떻게 더 잘 쓰느냐"의 문제이지 CRS 도메인 로직과는 별개다. 굳이 전이 가능한 원칙만 남기면, ***"목록에 있다는 것 자체가 비용"이라는 `/skill-doctor`의 문제의식은, 온다 CRS의 규칙 엔진·요금 정책 목록에도 그대로 적용된다*** — 안 쓰이는 규칙이 매 요청마다 평가 비용을 발생시키고 있지 않은지 점검할 가치가 있다.

## 연관 자료
- [[2026-09-15-claude-code-week35-changelog]] — 전주 changelog, Restricted 모드·Claude-drafted feedback
- [[2026-09-02-claude-fable-5-1-mythos-5-1-release]] — Fable 5.1 출시 노트, 이번 주에야 Claude Code에 연결됨
- [[2026-09-03-claude-fable-5-1-prompting-guide]] — effort 다이얼 가이드, 모델별 effort 저장 기능과 직접 연결
- [[2026-08-22-computer-use-skills-files-api-ga]] — Computer Use API GA화, 이번 주 백그라운드 실행으로 이어진 흐름
- [[2026-06-08-anthropic-skills-building-guide]] — 스킬의 컨텍스트 비용 문제의식, `/skill-doctor`가 처음 계측 가능하게 만듦

## 한 달 뒤 회고
*(2026-10-15 즈음 — Fable 5.1로 실제 세션을 옮겨봤는지, `/skill-doctor`로 이 가든 워크플로우의 스킬 사용 현황을 점검했는지, 백그라운드 Computer Use를 macOS 환경에서 써볼 기회가 있었는지 기록.)*
