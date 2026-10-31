---
title: "Herdr, 터미널과 코딩 에이전트를 한곳에서 관리하는 네이티브 앱(GeekNews) — 거의 전부를 AI 에이전트가 직접 짰다는 프로젝트가 AI 에이전트를 관리하는 도구를 만들었다"
source_title: "herdr: A Terminal Tool for Managing Multiple AI Coding Agents"
source_url: "https://tecmint.com/herdr-run-ai-coding-agents-in-linux-terminal"
source_name: "Tecmint"
referrer_url: "https://news.hada.io/topic?id=36283"
summarized_at: "2026-10-31"
category: "engineering"
tags: ["coding-agent", "terminal", "developer-tools", "herdr", "agent-orchestration"]
---

# Herdr, 터미널과 코딩 에이전트를 한곳에서 관리하는 네이티브 앱(GeekNews)

> 출처: [herdr: A Terminal Tool for Managing Multiple AI Coding Agents](https://tecmint.com/herdr-run-ai-coding-agents-in-linux-terminal) (Tecmint) · [GeekNews](https://news.hada.io/topic?id=36283) 경유 · 정리일 2026-10-31

> **출처 한계**: news.hada.io는 egress 차단됐다. WebSearch로 GitHub 저장소·Tecmint·flaviocopes.com 등을 찾았으나, **GitHub 저장소 소유자가 검색 결과마다 다르게 나왔다**(naaive/herdr, ogulcancelik/herdr 두 계정이 모두 걸림) — 어느 쪽이 정본인지 확정하지 못했다. "OSC 7501" 프로토콜 관련 서술도 검색 결과에서 직접 확인하지 못해 Slack 발췌를 그대로 인용했다.

## 한 줄 요약

**Herdr는 여러 터미널 창과 AI 코딩 에이전트를 작업공간·탭·분할 패널로 한곳에서 관리하는 터미널 네이티브 앱이다. 실행을 담당하는 백그라운드 서버와 앱 창을 분리해, 창을 닫거나 앱을 업데이트해도 작업이 끊기지 않는다.**

## 핵심 포인트

- **저장소별 작업공간, 여러 작업을 나란히 배치** — 작업 공간을 저장소별로 나누고, 탭과 분할 패널로 여러 에이전트 작업을 동시에 볼 수 있게 설계됐다.
- **에이전트 상태를 사이드바에서 한눈에** — 프로세스명과 터미널 출력 패턴을 300~500ms 주기로 폴링해 에이전트를 감지하며, 작업 중·입력 대기·완료 상태를 표시한다. 더 안정적인 상태 보고를 위한 전용 통합(공개 프로토콜 기반)도 설치할 수 있다.
- **실행 코어와 앱 UI가 분리돼 있다** — herdr-core가 패널 실행을 담당하는 백그라운드 서버로 동작해, ***창을 닫거나 앱을 업데이트해도 터미널 세션이 유지된다.*** SSH 원격 머신에서 돌아가는 작업도 같은 화면에서 관리할 수 있다.
- **"거의 전부를 AI 에이전트가 직접 만들었다"는 출처(원점)** — 한 소스에 따르면 이 프로젝트 자체가 사람의 감독 아래 AI 코딩 에이전트들을 통해 거의 전부 작성됐다고 한다. ***AI 에이전트를 관리하는 도구를, AI 에이전트가 만들었다는 재귀적 구조***가 흥미롭다.
- 레이아웃·사이드바·메뉴·단축키를 JavaScript 모드로 커스터마이즈할 수 있다는 Slack 발췌는 확인했으나, 세부 API는 원문 미확인으로 남긴다.

## 인상 깊은 문장

> "the project was built almost entirely through AI coding agents, with human supervision" — WebSearch 스니펫 기반 재구성, 원문 직접 인용 아님

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. GitHub 저장소 소유자가 검색 결과마다 엇갈리는 점, "OSC 7501" 같은 세부 프로토콜명이 외부 검색으로 재확인되지 않는 점을 볼 때, **이 프로젝트에 대한 독립적인 2차 보도가 아직 충분히 축적되지 않은 신생 도구**로 보인다.

## 내 생각 · 적용점

**핵심 전이 1 — 여러 코딩 에이전트를 동시에 돌리는 "에이전트 다중화(multiplexing)"가 이미 도구 레벨의 수요가 됐다.** 한 명의 개발자가 여러 에이전트를 저장소별·작업별로 병렬 운용하는 패턴이 Herdr 같은 전용 관리 도구를 낳을 만큼 자리 잡았다는 신호다. [[2026-10-30-claude-code-30-second-conversation-sync]]에서 "백그라운드 에이전트가 대화를 반복 재전송해 토큰을 먹는다"고 지적했던 문제도, 에이전트를 여러 개 동시에 띄우는 운용 방식이 일반화되면서 비용 문제가 더 커질 수 있다는 점과 맞닿아 있다.

**핵심 전이 2 — "실행과 UI의 분리"는 장기 실행 에이전트 도구의 공통 설계 패턴이다.** herdr-core(백그라운드 서버)와 앱 창을 분리한 설계는, 장시간 실행되는 작업을 관리하는 도구가 공통적으로 수렴하는 아키텍처(tmux의 detach/attach, 서버-클라이언트 분리)를 코딩 에이전트 영역에 다시 적용한 것이다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다, 참고 원칙만.** 온다 개발팀이 Claude Code 등 여러 코딩 에이전트를 동시에 운용하는 작업 방식을 쓴다면, **에이전트 작업을 저장소별로 분리하고 상태를 한눈에 모아보는 터미널 관리 도구(Herdr류)를 검토해볼 가치는 있다.** 다만 이는 개발팀 내부 도구 선택의 문제이지 CRS 제품 자체에 적용할 사안은 아니다.

## 연관 자료

- [[2026-10-30-claude-code-30-second-conversation-sync]] — 여러 백그라운드 에이전트를 동시에 운용할 때 커지는 토큰 비용 문제, 같은 "에이전트 다중 운용" 맥락

## 한 달 뒤 회고

*(2026-11-30 즈음 — GitHub 정본 저장소를 특정했는지, "OSC 7501" 프로토콜의 실체를 확인했는지, 실제로 써볼 기회가 있었는지 점검.)*
