---
title: "Claude Code Week 37 (v2.1.263–v2.1.269) — claude plugin eval로 플러그인에 베이스라인 대조 평가를 붙이고, 데스크톱 패널을 창으로 뜯어낸다"
source_title: "Week 37 · September 7–11, 2026"
source_url: "https://code.claude.com/docs/en/whats-new/2026-w37"
source_name: "code.claude.com"
referrer_url: "https://code.claude.com/docs/en/whats-new#week-37"
published_at: "2026-09-11"
summarized_at: "2026-09-15"
category: "ai"
tags: ["claude-code", "changelog", "plugin-eval", "evals", "desktop", "webfetch", "claude-usage"]
---

# Claude Code Week 37 (v2.1.263–v2.1.269) — claude plugin eval로 플러그인에 베이스라인 대조 평가를 붙이고, 데스크톱 패널을 창으로 뜯어낸다

> 출처: [Week 37 · September 7–11, 2026](https://code.claude.com/docs/en/whats-new/2026-w37) (Claude Code 공식 What's New) · Slack #개발-뉴스-dev-news 경유 · 정리일 2026-09-15

## 한 줄 요약
**`claude plugin eval`은 플러그인을 테스트 케이스 모음에 돌려 점수를 매기고, 기본적으로 플러그인 없이 같은 케이스를 한 번 더 돌려 "이 플러그인이 실제로 뭘 기여했는지"를 대조해 보여준다.** `claude plugin eval init`이 좋은 결과가 뭔지 물어본 뒤 테스트 케이스와 채점 기준을 제안하고 한 번 실행해본 뒤 파일로 써준다. 그 외 Desktop 앱은 어떤 패널이든 별도 창으로 뜯어낼 수 있게 됐고, WebFetch는 5분 안에 못 끝내면 무한 대기 대신 실패한다.

## 핵심 포인트
- **`claude plugin eval`(v2.1.269)** — 플러그인을 테스트 케이스 모음에 돌려 점수를 매기고, 기본적으로 각 케이스를 플러그인 없이 한 번 더 돌려 기여도(delta)를 보여준다. ***평가 한 번, 그리고 두 번째 모델이 답을 채점하는 체크 하나하나가 모두 실제 계정에 청구되는 진짜 모델 호출***이라는 점이 명시돼 있다. `claude plugin eval init`을 플러그인 루트 디렉터리에서 실행하면 "좋은 결과가 뭔지" 물어본 뒤 테스트 케이스와 채점 기준(checks)을 제안하고, 스위트를 한 번 시험 실행한 뒤 파일로 저장한다. 이후 `claude plugin eval .`로 전체 케이스를 채점하면 터미널에 요약 표(케이스별 플러그인 유무 점수·델타·실행 횟수·비용)가 뜨고, `evals/results/report.html`에 실행별 상세가 남는다.
- **Desktop 패널을 별도 창으로 팝아웃** — 어떤 패널이든(diff, 터미널 등) 독립된 창으로 뜯어낼 수 있다. 두 번째 화면으로 드래그해두고 메인 창에서는 Claude가 계속 작업하게 두다가, 필요하면 다시 도킹할 수 있다.
- **기타 주요 변경** — `maxEffortLevel`을 최상위 또는 `modelSettings` 아래 모델별로 설정하면 Bedrock·GCP Agent Platform·Microsoft Foundry를 포함한 모든 제공자에서 effort 레벨 상한을 강제(그 이상 요청은 상한에서 실행); `--plugin-dir`에 플러그인들이 담긴 폴더를 지정하면 매니페스트가 있는 하위 폴더 각각을 로드; ***WebFetch가 5분 안에 페이지 다운로드를 못 끝내면 무한 대기 대신 데드라인 오류로 실패***하며(`CLAUDE_CODE_WEBFETCH_DEADLINE_MS`로 조정, `0`이면 제한 해제); `claude plugin install`·`uninstall`·`update`·`enable`·`disable`에 `--json`을 붙이면 결과를 stdout 마지막 줄에 JSON 객체로 출력; Auto mode 분류기가 행동을 차단할 때 Claude가 받는 사유에 대개 매치된 규칙 이름(예: `[Data Exfiltration]`)이 포함됨; 프롬프트 중간에 `/`를 입력하면 단일 제안이 아니라 일치하는 명령 목록에서 고를 수 있고(전체화면 렌더링에서는 입력하는 대로 목록이 열림), 플러그인 스킬도 플러그인 접두사 없이 이름만으로 매칭; VS Code 확장에서 프롬프트 박스 하단 에이전트 수를 클릭하면 서브에이전트의 읽기전용 트랜스크립트를 열거나 중지할 수 있는 agent map이 열림; VS Code 확장 명령 메뉴의 Customize 섹션에서 Hooks·Permissions를 골라 사용자·프로젝트·로컬 설정에 훅·권한 규칙을 추가·제거 가능; Claude가 발행하는 아티팩트마다 맞는 브라우저 탭 아이콘을 고를 수 있음; Claude Code on the web에서 클라우드 세션의 큐에 넣은 메시지를 Claude가 읽기 전에 큐에서 빼거나 `Esc`/`Up`으로 취소해 다시 편집 가능.

## 인상 깊은 문장
> "claude plugin eval runs your plugin against a suite of test cases, scores the results, and by default runs each case again without the plugin so you can see what it contributes."

> "Every run, and every check that has a second model judge the reply, is a real model call on your account."

> "If WebFetch hasn't finished downloading a page within five minutes, the fetch fails with a deadline error instead of hanging."

## 댓글
Week 33~36과 마찬가지로 code.claude.com 공식 changelog를 WebFetch로 전문 확보한 1차 출처 직접 확인이다. 댓글·커뮤니티 반응은 changelog 페이지 자체에 없다. 참고로 이 세션에서 이번 배치의 GeekNews 항목(#1·#5)을 조사하며 WebFetch가 news.hada.io 등에서 즉시 `EGRESS_BLOCKED`로 실패하는 걸 여러 번 겪었는데, 이는 이번 주 changelog의 "5분 타임아웃" 항목과는 다른 종류의 실패(egress 정책 차단 vs 다운로드 지연)라는 점은 구분해서 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — `claude plugin eval`은 [[2026-08-08-eval-driven-development-airbnb]]가 정리한 원칙을 플러그인 단위로 제도화한 것
그 노트가 강조한 핵심 — ***"평가는 팀 스포츠다", 결정론적 검사·LLM 심판·인간 평가를 계층적으로 쓰고 골든 데이터셋으로 보정한다*** — 가 이번 기능에서 "베이스라인 대비 델타"라는 구체적 형태로 나타난다. Airbnb 사례가 조직 전체의 평가 문화를 다뤘다면, `claude plugin eval`은 그 사고방식을 "플러그인 하나가 실제로 기여하는가"라는 좁고 실행 가능한 질문으로 압축해 도구화했다 — 그리고 그 평가 자체가 진짜 모델 호출이라 비용이 든다는 점을 명시한 것도, "평가에도 예산이 필요하다"는 그 노트의 문제의식과 맞닿는다.

### 핵심 전이 2 — "베이스라인과 대조해 기여도를 본다"는 발상은 [[2026-08-06-pi-minimalism-coding-harness]]가 하네스 비교에서 썼던 방법론과 같은 축
그 노트는 Pi가 "같은 모델·같은 추론강도인데도 하네스에 따라 작업당 비용이 2배 넘게 갈렸다"는 걸 보여줬는데, 거기서 못 박았던 한계가 "정확한 통과율·비용 수치가 원문에 구체적으로 나오지 않는다"는 것이었다. `claude plugin eval`이 있었다면 그런 하네스 비교 주장 자체를 (플러그인 유무 대조라는 좁은 범위에서나마) 재현 가능한 숫자로 만들 수 있었을 것 — "느낌상 낫다"가 아니라 "델타가 몇 점"이라고 말할 수 있는 도구가 생긴 셈이다.

### 핵심 전이 3 — WebFetch 5분 데드라인은 [[2026-09-15-claude-code-week35-changelog]]가 다룬 "중단된 걸 어떻게 처리하느냐" 흐름의 반대쪽 사례
Week 35가 "서버 오류로 끊긴 응답을 자동으로 이어서 완성한다"는 관대한 복구를 다뤘다면, 이번 WebFetch 데드라인은 반대로 "안 끝나는 걸 무한정 기다리지 않고 명시적으로 실패시킨다"는 엄격한 처리다. 두 changelog를 나란히 보면, Claude Code가 "중단"이라는 같은 현상을 상황에 따라 (a) 복구할 수 있으면 이어서 완성하고 (b) 데드라인이 명확한 I/O는 실패로 못 박는, 서로 다른 두 원칙으로 다루고 있다는 게 드러난다.

## 호스피탈리티 / CRS 적용 포인트
**`claude plugin eval`은 이 가든이나 온다 팀이 자체 Claude Code 플러그인·스킬을 만들 계획이 있다면 바로 도움이 되는 도구다** — 예를 들어 이 가든의 자율 정리 워크플로우를 플러그인으로 패키징한다면, "이 플러그인이 있을 때와 없을 때 요약 품질(핵심 전이 개수, 위키링크 정확도 등)이 실제로 다른가"를 `claude plugin eval`로 정량화할 수 있다 — 지금까지는 "이 워크플로우가 낫다"는 주관적 판단에 의존해왔는데, 이 도구가 있으면 그 판단을 재현 가능한 델타로 바꿀 수 있다. WebFetch 5분 데드라인은 이 세션이 반복적으로 겪는 외부 사이트 차단(EGRESS_BLOCKED)과는 다른 문제이지만, 향후 느린 원문 사이트를 다룰 때 무한 대기를 방지한다는 점에서 참고할 만하다. 온다 CRS 도메인에 직접 적용되는 지점은 없다 — 이번에도 정직하게 밝히면 전부 "Claude Code 자체를 어떻게 쓰느냐"의 범주다.

## 연관 자료
- [[2026-09-15-claude-code-week36-changelog]] — 전주 changelog, Claude Fable 5.1·`/skill-doctor`
- [[2026-08-08-eval-driven-development-airbnb]] — "평가는 팀 스포츠다"라는 원칙을 플러그인 단위로 제도화한 대상
- [[2026-08-06-pi-minimalism-coding-harness]] — 하네스 비교 주장에 재현 가능한 숫자가 없었다는 한계, 이 도구가 메울 수 있는 공백

## 한 달 뒤 회고
*(2026-10-15 즈음 — 이 가든의 정리 워크플로우를 플러그인화해 `claude plugin eval`로 실제 델타를 측정해봤는지, WebFetch 데드라인 설정을 조정해본 적이 있었는지 기록.)*
