---
title: "T3 Code (pingdotgg) — 내 컴퓨터의 Claude Code/Codex 세션을 폰에서 그대로 이어가는 원격 제어 표면"
source_title: "T3 Code"
source_url: "https://github.com/pingdotgg/t3code"
source_name: "GitHub (pingdotgg/t3code)"
referrer_url: "https://news.hada.io/topic?id=35612"
summarized_at: "2026-10-19"
category: "ai"
tags: ["coding-agents", "claude-code", "codex", "remote-access", "multi-device", "agent-harness", "open-source"]
---

# T3 Code (pingdotgg)

> 출처: [T3 Code](https://github.com/pingdotgg/t3code) (GitHub, pingdotgg · MIT) · GeekNews(id=35612) 경유 · 정리일 2026-10-19

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단(`ENOTFOUND`)으로 열람 실패했으나, GitHub 저장소 원문은 WebFetch로 직접 확인했다(드문 성공 사례). 다만 README는 서버/클라이언트 상세 아키텍처와 GitHub 커밋·푸시·PR 생성 기능의 구체적 작동 방식을 `docs/internals/overview.md`, `docs/user/source-control.md`로 따로 미뤄두고 있어, 그 문서 내용까지는 이번 세션에서 확인하지 못했다. hada 댓글 수·HN 크로스포스트 여부도 미확인.

## 한 줄 요약

**T3 Code는 자체 코딩 에이전트가 아니라, 내 컴퓨터에서 실행 중인 Claude Code·Codex·Cursor·Grok Build·OpenCode·Google Antigravity 세션을 폰·브라우저·데스크톱 앱에서 그대로 이어서 제어하는 "에이전트 하네스 제어 표면"이다 — 기존 계정·구독을 그대로 쓰고, 실제 작업은 소스코드와 개발 도구가 있는 내 컴퓨터(서버 역할)에서 돈다.**

## 핵심 포인트

- **새 에이전트가 아니라 제어 표면** — README는 스스로를 "agent harness control surface"로 정의한다. 모델을 새로 만들거나 자체 에이전트를 돌리는 게 아니라, 이미 설치·인증된 기존 제공자(Claude Code 등)의 세션에 원격으로 접속하는 계층이다.
- **지원 제공자 6종** — Codex, Claude Code, Cursor, Grok Build, OpenCode, Google Antigravity. 사용하려면 해당 제공자를 먼저 컴퓨터에 설치·인증해야 한다.
- **3개 클라이언트 + 1개 서버 구조(추정)** — README에 명시적인 아키텍처 설명은 없지만, "로컬에서 `t3` 명령으로 서버를 실행"하고 "iOS/Android/웹/Electron 클라이언트가 그 서버에 원격 접속"하는 구조로 추정된다. 즉 ***실행 주체는 항상 내 컴퓨터***이고, 폰·브라우저는 화면과 입력만 중계한다.
- **수익 모델 없음, MIT 라이선스, 매우 초기 단계** — README가 스스로 "매우 초기 단계(very early)"이니 버그를 예상하라고 밝히고, 외부 기여는 "작은 수정만" 검토한다고 못 박는다.
- **Source control integrations는 별도 문서로 분리** — 커밋·푸시·PR 생성·제목/본문 자동 작성 같은 기능은 README 본문이 아니라 `docs/user/source-control.md`에 설명돼 있어, 이번 세션에서는 그 구체적 작동 방식(예: 자동 생성된 PR 본문이 사람 승인 없이 올라가는지)까지는 확인하지 못했다.

## 인상 깊은 문장

> "performant, remote-ready, and truly open" (GitHub README에서 직접 확인한 프로젝트 지향점 — 수익 모델이 없다는 점과 함께 명시됨)

## 댓글

GeekNews(hada) 댓글 수는 `news.hada.io` 차단으로 확인 못함. HN 크로스포스트 여부도 미확인. **"매우 초기 단계" 자기 고지와 "작은 수정만 기여 검토"라는 README 문구는 솔직한 기대치 설정이지만, 동시에 실사용 안정성에 대한 독립 검증이 아직 없다는 뜻이기도 하다.**

## 내 생각 · 적용점

**핵심 전이 — [[2026-09-27-atlas-source-control-for-coding-agents]]와 "여러 코딩 에이전트를 한 층 위에서 다루는 도구"라는 같은 범주지만 축이 다르다.** Atlas는 ***시간 축***(과거 세션 맥락을 커밋에 영구 기록해 나중에 되짚는 것)에 초점을 맞춘 반면, T3 Code는 ***공간/기기 축***(같은 세션을 PC→폰으로 이어가는 것)에 초점을 맞춘다. 코딩 에이전트가 늘어나면서 "에이전트 자체"보다 "에이전트를 다루는 메타 계층" 도구가 계속 분화하고 있다는 신호로 읽을 수 있다.

**핵심 전이 2 — [[2026-09-18-jcode-parallel-terminal-coding-agent]]가 "병렬 실행"으로 생산성 레버를 당겼다면, T3 Code는 "이동성(portability)"으로 다른 레버를 당긴다.** jcode는 한 기기 안에서 세션 수를 늘리는 데 집중했는데, T3 Code는 세션 수는 그대로 두고 "그 세션에 어디서 접근할 수 있는가"를 넓힌다. 둘 다 "에이전트 자체의 성능"이 아니라 "에이전트를 둘러싼 운영 마찰"을 줄이는 방향이라는 공통점이 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 1인 개발 워크플로 도구라 CRS 시스템 접점은 없다. 다만 "실행은 신뢰된 환경(내 컴퓨터)에 고정하고, 제어만 가볍게 원격화한다"는 아키텍처 원칙은, CRS 운영팀이 온콜 중 민감한 운영 작업(예: 예약 시스템 긴급 패치)을 모바일에서 트리거하되 실제 실행은 통제된 서버 환경에서만 이뤄지게 하는 설계에 참고할 수 있는 패턴이다.

## 연관 자료

- [[2026-09-27-atlas-source-control-for-coding-agents]] — 같은 "코딩 에이전트 메타 제어 도구" 범주, 시간 축(세션 맥락 기록) vs 공간 축(기기 간 이동)의 대비
- [[2026-09-18-jcode-parallel-terminal-coding-agent]] — 같은 범주, 병렬 실행이라는 다른 레버를 당기는 짝

## 한 달 뒤 회고

*(2026-11-19 즈음 — `docs/user/source-control.md`를 직접 확인해 PR 자동 생성이 사람 승인 게이트를 거치는지, 그리고 "매우 초기 단계" 딱지가 떼어질 만큼 안정화됐는지 점검.)*
