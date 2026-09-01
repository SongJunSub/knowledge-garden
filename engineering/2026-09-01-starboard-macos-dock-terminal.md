---
title: "Starboard — macOS Dock 옆에 항상 붙어 있는 터미널 (palamim) — 소환하는 게 아니라, 그냥 항상 거기 있는 터미널"
source_title: "Starboard - macOS Dock 옆에 항상 붙어 있는 터미널"
source_url: "https://github.com/palamim/starboard"
source_name: "GitHub (palamim)"
referrer_url: "https://news.hada.io/topic?id=33093"
published_at: "확인 불가"
summarized_at: "2026-09-01"
category: "engineering"
tags: ["macos", "terminal", "dock", "developer-tools", "swift", "cli-tools"]
---

# Starboard — macOS Dock 옆에 항상 붙어 있는 터미널 (palamim)

> 출처: [palamim/starboard](https://github.com/palamim/starboard) (GitHub · palamim, GeekNews 경유) · 정리일 2026-09-01
> **출처 한계**: `news.hada.io`가 이번 세션에서 접속 차단(EGRESS_BLOCKED)돼 GeekNews 원문 페이지·댓글을 직접 열람하지 못했다. **GitHub 저장소는 직접 열람**했고, 아래 기능·통계 서술은 그 원문(README·저장소 메타데이터)을 근거로 한다. WebSearch로 HN·Lobsters 크로스포스팅 여부를 확인했으나 이 프로젝트(palamim/starboard) 관련 스레드를 찾지 못했다 — 아직 크로스포스팅되지 않은 것으로 추정되나, 없다는 확정은 아니다. 원문 게시일도 확인하지 못했다.

## 한 줄 요약

**Starboard는 단축키로 불러내는 드롭다운 터미널이 아니라, macOS Dock 옆에 계속 표시되며 Dock의 위치·높이를 실시간으로 따라가는 상시 터미널이다 — 일회성 명령 실행기가 아니라 실제 `zsh -l` 셸로 동작해 디렉터리·기록·셸 상태가 계속 유지된다.**

## 핵심 포인트

- **"소환하는 게 아니라 항상 거기 있다"** — Quake 스타일의 핫키 드롭다운 터미널과 달리, ***macOS Dock 옆에 계속 표시되는 터미널***이다. GitHub 저장소 설명 그대로: ***"A terminal that's just always there — not summoned, not dismissed."***
- Dock의 위치와 높이를 실시간으로 따라가며 **모든 Space와 전체 화면 앱 위에서도 표시**된다.
- 다른 앱을 사용하는 동안 **자동으로 포커스를 빼앗지 않고**, 필요할 때 바로 명령을 입력하는 방식으로 설계됐다.
- 일회성 명령 실행기가 아니라 **실제 `zsh -l` 셸**로 동작해 디렉터리·기록·셸 상태가 계속 유지된다.
- `Cmd+E`로 Dock 높이와 전체 화면 높이를 전환하고, `Cmd+T`로 **20개 내장 테마**(다크/라이트 각 10개) 선택이 가능하다.
- Swift로 작성, macOS 13+ 지원, Accessibility 권한 필요, MIT 라이선스. **star 275 · fork 11**(확인 시점 기준). Homebrew(`brew install --cask palamim/starboard/starboard`)·수동 다운로드·소스 빌드(`swift build`) 세 가지 설치 경로를 제공한다.

## 인상 깊은 문장

> "A terminal that's just always there — not summoned, not dismissed."
> (GitHub 저장소 설명 — Quake 스타일 핫키 터미널과의 차이를 한 줄로 요약한다.)

## 댓글

**hada 댓글 수·논조 확인 불가**(news.hada.io 세션 내 차단). HN·Lobsters 크로스포스팅도 WebSearch로 찾지 못했다 — 새 프로젝트라 아직 널리 퍼지지 않은 것으로 보이나, 이 노트가 그 부재를 확정하는 건 아니다.

## 내 생각 · 적용점

### 핵심 전이 — "터미널 르네상스"에 카테고리가 또 하나 추가됐다

[[2026-08-28-superfile-multi-panel-terminal-file-manager]]가 짚은 **터미널 앱들의 현대화 트렌드**(WezTerm·Ghostty·kitty·tmux 같은 에뮬레이터·멀티플렉서에 이어 파일 관리자까지)에, Starboard는 "상시 표시 터미널"이라는 카테고리를 하나 더 보탠다. 도구 소개 성격이 짙은 가벼운 글이라 억지로 깊은 전이를 늘리기보다, **같은 트렌드가 계속 새로운 형태(에뮬레이터 → 멀티플렉서 → 파일 관리자 → 상시 표시 오버레이)로 반복해서 나타난다는 점만 가볍게 기록**해둔다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** Starboard는 로컬 macOS 개발 환경의 개인 생산성 도구이고, 온다의 CRS(B2B 호스피탈리티) 제품 로직과는 접점이 없다. 억지로 남기자면 팀 개발 환경 표준화 논의가 있을 때 참고할 만한 사례 정도이며, 이마저도 CRS에 무리하게 붙이지 않는다.

## 연관 자료

- [[2026-08-28-superfile-multi-panel-terminal-file-manager]] — 같은 "터미널 르네상스" 흐름에 상시 표시 터미널이라는 카테고리를 보태는 사례

## 한 달 뒤 회고

*(2026-10-01 즈음 — hada 접근이 가능해졌다면 GeekNews 댓글 반응·HN/Lobsters 크로스포스팅 여부를 확인했는지, "터미널 르네상스" 트렌드에 또 어떤 카테고리가 추가됐는지 관찰.)*
