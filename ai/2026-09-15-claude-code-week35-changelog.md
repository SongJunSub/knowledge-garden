---
title: "Claude Code Week 35 (v2.1.240–v2.1.250) — 데스크톱에서 CLI 세션 이어받기, Claude가 스스로 쓰는 피드백 초안, 그리고 평가 하네스를 위한 --restricted 모드"
source_title: "Week 35 · August 24–28, 2026"
source_url: "https://code.claude.com/docs/en/whats-new/2026-w35"
source_name: "code.claude.com"
referrer_url: "https://code.claude.com/docs/en/whats-new#week-35"
published_at: "2026-08-28"
summarized_at: "2026-09-15"
category: "ai"
tags: ["claude-code", "changelog", "desktop", "restricted-mode", "feedback", "claude-usage"]
---

# Claude Code Week 35 (v2.1.240–v2.1.250) — 데스크톱에서 CLI 세션 이어받기, Claude가 스스로 쓰는 피드백 초안, 그리고 평가 하네스를 위한 --restricted 모드

> 출처: [Week 35 · August 24–28, 2026](https://code.claude.com/docs/en/whats-new/2026-w35) (Claude Code 공식 What's New) · Slack #개발-뉴스-dev-news 경유 · 정리일 2026-09-15

## 한 줄 요약
**Desktop 앱 프롬프트 창에서 `/resume`을 치면 CLI에서 시작한 세션을 대화·컨텍스트 그대로 이어받고, Claude는 도구가 계속 실패하거나 실수를 지적받으면 `SendFeedback`으로 피드백 보고서 초안을 스스로 써서 검토·전송 여부를 사람에게 넘긴다. 그리고 `--restricted`는 공유 머신에서 평가 하네스가 `claude`를 돌릴 때를 위해 명령 실행 도구·WebFetch·사용자 설정까지 걷어낸 최소 권한 모드다.**

## 핵심 포인트
- **Desktop에서 CLI 세션 이어받기** — Desktop 프롬프트 창에서 `/resume`을 실행하면 CLI로 시작한 세션 목록이 뜨고, 제목·폴더·브랜치로 검색하고 어디서 멈췄는지 미리 보고 이어갈 수 있다. 대화와 컨텍스트가 그대로 보존된다.
- **Claude가 초안을 쓰는 피드백(`SendFeedback`)** — 도구가 계속 실패하거나, Claude가 요청을 처리할 수 없거나, 사용자가 실수를 지적하면 Claude가 `SendFeedback` 도구로 피드백 보고서를 직접 작성한다. 프롬프트 위 카드에 초안이 뜨고 검토·전송·무시를 고를 수 있으며, ***전송하기 전까지는 Anthropic에 아무것도 전달되지 않는다.*** v2.1.238 이상 필요. `/feedback`을 인자 없이 실행하면 모든 세션의 초안 큐가 열리고, `/config`에서 이 기능을 끌 수 있다.
- **Restricted 모드(v2.1.248)** — 명령·코드를 실행하는 내장 도구 없이 Claude Code를 시작한다. 공유 머신에서 평가 하네스가 `claude`를 구동할 때를 위한 것. `--restricted` 또는 `CLAUDE_CODE_RESTRICTED=1`로 켜며, `WebFetch`도 제거되고, 파일 도구는 작업 디렉터리로 제한되며, managed settings와 `--settings`만 로드하고, `bypassPermissions` 권한 모드는 거부한다. 제거된 도구를 되돌리려면 `--tools "Bash,Read,Edit"`처럼 명시적 허용목록으로 지정해야 하며, `--tools`의 `default` 프리셋은 제거된 도구를 복원하지 않는다.
- **기타 주요 변경** — `modelPicker` 설정으로 `/model` 목록에 직접 항목 추가(Bedrock·GCP Agent Platform 모델 ID 포함); `promptCacheTtl: 1h`로 API 키·클라우드 제공자 세션의 프롬프트 캐시를 1시간 유지, `subagentPromptCacheTtl`은 서브에이전트 등 메인 대화 밖 요청용; `/usage`에 Loops(실행 횟수·총 토큰·실행당 토큰·마지막 실행) 세부 항목 추가; 계약 요금제 조직은 `modelPricing` managed setting으로 `/usage`·상태줄·OpenTelemetry가 정가 대신 계약 요금을 표시하게 설정 가능; `/login`에 Console 계정으로 로그인 옵션 추가; `/permissions`에 Auto mode 탭이 생겨 설정 파일을 안 열고도 분류기 규칙을 보고 편집 가능; Manual·acceptEdits 모드의 Bash 권한 프롬프트에 "Yes, and switch to auto mode" 옵션 추가; `/cd`로 이동한 새 디렉터리의 프로젝트 설정·hooks·`.mcp.json`·skills·subagents가 다음 `--resume`이 아니라 즉시 적용; 서버 오류·연결 끊김으로 중간에 끊긴 응답(텍스트만 있고 도구 호출이 없을 때)을 비대화형 세션에서 자동으로 이어서 완성; `maxTurns`에 도달해 멈춘 서브에이전트는 결과가 "부분(partial)"로 표시되고 `SendMessage`로 이어갈 수 있다는 힌트 제공; 네이티브 설치 파일이 zstd 압축으로 Linux x64 기준 340MB에서 약 75MB로 축소, 세션당 메모리 사용도 40~70MB 감소.

## 인상 깊은 문장
> "Type /resume in the Claude Code Desktop prompt box to pick up any session you started from the CLI and continue it in the app with the full conversation and context intact."

> "Restricted mode starts Claude Code without the built-in tools that run commands or code. Use it when an evaluation harness drives claude on a shared machine."

## 댓글
Week 33·34와 마찬가지로 code.claude.com 공식 changelog를 WebFetch로 전문 확보했다 — 공식 1차 출처를 직접 읽은 사례라 내용 신뢰도는 높다. 댓글·커뮤니티 반응은 이 changelog 페이지 자체에는 없어 확인할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — Restricted 모드는 [[2026-09-01-claude-code-auto-mode-bypass-rce]]가 드러낸 공격 표면에 대한 정확한 답이다
그 노트는 독립 연구자가 웹사이트 요약만으로 Auto Mode를 60~80% 뚫었고, 감염을 정리하려던 Claude의 명령마저 Auto Mode가 막았다는 사례였다 — 즉 신뢰할 수 없는 입력이 섞일 수 있는 세션에서 명령 실행 도구 자체가 공격 표면이 된다는 것. Restricted 모드는 그 표면을 아예 없애는 접근이다 — 명령 실행 도구·WebFetch·사용자 설정을 통째로 제거하고 managed settings만 로드하게 강제한 것은, "분류기가 위험한 행동을 막는다"는 Auto Mode의 사후 방어와 달리 애초에 실행 가능한 범위를 좁히는 사전 방어다. 다만 이건 평가 하네스·공유 머신용으로 설계된 것이라 일반 대화형 세션의 대체재는 아니다.

### 핵심 전이 2 — Claude-drafted feedback은 하네스가 실패를 "잊지 않게" 만드는 장치
[[2026-04-28-agent-harness-engineering]]이 강조한 하네스 설계 원칙 — 실패를 어딘가에 흡수시키지 않고 다음 개선으로 이어지게 만드는 구조 — 이 `SendFeedback` 도구에 그대로 담겨 있다. 예전이라면 도구가 반복 실패해도 사용자가 직접 버그 리포트를 쓸 동기·시간이 없어 그냥 넘어갔을 상황을, Claude가 초안을 대신 써서 "검토만 하면 되는" 상태로 만들어 마찰을 줄인다. 다만 ***전송 전까지 Anthropic에 아무것도 안 간다***는 문구는 프라이버시 안전장치이자, 동시에 실제로 얼마나 많은 초안이 검토 없이 묻히는지는 이 changelog만으로는 알 수 없다는 한계도 남긴다.

### 핵심 전이 3 — 이 노트 자체가 Week 34의 "세션을 어디서 이어가느냐" 흐름의 다음 장이다
[[2026-09-03-claude-code-week34-changelog]]가 정리한 Remote Control 정식화("폰에서 내 컴퓨터로 세션 시작")에 이어, 이번엔 반대 방향 — "CLI에서 시작한 세션을 Desktop에서 이어받기"다. 시작 지점과 확인 지점의 마찰이 줄어드는 흐름이 두 주 연속 이어지고 있다.

## 호스피탈리티 / CRS 적용 포인트
이 글은 클로드 코드 사용법에 직접 도움이 된다. **Restricted 모드는 이 가든의 일간 다이제스트 파이프라인처럼 스케줄로 자동 실행되는 세션에도 검토할 가치가 있다** — 특히 신뢰할 수 없는 외부 콘텐츠(Slack 링크, 원문 페이지)를 다루는 자동화 세션에서 명령 실행 권한을 최소화하는 방향으로 설계하면 [[2026-09-01-claude-code-auto-mode-bypass-rce]]가 지적한 위험을 구조적으로 줄일 수 있다. `SendFeedback`은 이 세션 도중 겪는 반복 실패(예: egress 차단 패턴)를 매번 그냥 넘기지 않고 실제로 보고하는 습관을 만드는 데 쓸 수 있다. 온다 CRS 시스템에 아직 직접 적용할 지점은 없지만("Claude Code 자체의 사용법" 범주), 향후 사내에서 평가 하네스나 CI에 Claude Code를 물릴 계획이 있다면 Restricted 모드가 정확히 그 용도다.

## 연관 자료
- [[2026-09-03-claude-code-week34-changelog]] — 전전주 changelog, "세션을 어디서 시작·확인하느냐" 흐름의 이전 장
- [[2026-09-01-claude-code-auto-mode-bypass-rce]] — Restricted 모드가 답하는 구체적 공격 표면
- [[2026-04-28-agent-harness-engineering]] — 실패를 흡수하지 않고 개선으로 이어지게 만드는 하네스 설계 원칙
- [[2026-09-15-claude-code-week36-changelog]] — 다음 주 changelog

## 한 달 뒤 회고
*(2026-10-15 즈음 — Restricted 모드를 실제 평가·CI 워크플로에 써봤는지, `SendFeedback` 초안을 몇 번이나 실제로 전송했는지, Desktop `/resume`으로 CLI 세션을 이어받아본 적이 있었는지 기록.)*
