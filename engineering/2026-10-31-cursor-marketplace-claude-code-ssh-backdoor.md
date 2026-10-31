---
title: "Cursor 마켓플레이스의 Claude Code 확장에서 SSH 백도어 발견(GeekNews) — 확장을 로드하는 순간 이미 당한다"
source_title: "Cursor 마켓플레이스의 Claude Code 확장에서 SSH 백도어 발견"
source_url: "https://news.hada.io/topic?id=36295"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36295"
summarized_at: "2026-10-31"
category: "engineering"
tags: ["supply-chain-attack", "ssh-backdoor", "cursor", "claude-code", "marketplace-security"]
---

# Cursor 마켓플레이스의 Claude Code 확장에서 SSH 백도어 발견(GeekNews)

> 출처: [Cursor 마켓플레이스의 Claude Code 확장에서 SSH 백도어 발견](https://news.hada.io/topic?id=36295) (GeekNews) · 정리일 2026-10-31

> **출처 한계**: news.hada.io는 egress 차단으로 원문 열람 불가. WebSearch로 "Cursor marketplace Claude Code extension SSH backdoor 2.1.312 2.1.313"을 검색했지만, **이 사건과 정확히 일치하는 1차 보도(벤더 공지, 버전 번호, SSH 백도어 구체 내용)를 찾지 못했다.** 발견한 유사 사례는 서로 다른 세 건이다 — (1) Cursor 마켓플레이스(OpenVSX 기반, 검증이 느슨함)에 올라온 가짜 "Solidity" 확장이 PowerShell로 원격 접근을 열어 50만 달러를 탈취한 사례, (2) FauxCode라는 역설계된 가짜 Claude Code npm 패키지가 SSH 세션 모듈을 포함하고 API 트래픽을 공격자 프록시로 우회시킨 사례, (3) Claude Code 플러그인을 사칭한 가짜 VS Code 확장 3종이 PowerShell·LOLBIN 실행 체인을 포함한 사례. 이 셋 모두 "AI 코딩 도구 마켓플레이스의 검증 공백"이라는 같은 패턴을 보이지만, **이 노트가 다루는 사건과 동일한 건인지는 확인하지 못했다.** Slack 발췌를 1차 자료로, 위 세 사례는 배경 맥락으로만 인용한다.

## 한 줄 요약

**Cursor 마켓플레이스에 Claude Code 확장을 사칭한 변조본이 올라왔고, 로드되는 순간 SSH 키와 역방향 터널을 심어 원격 접근을 시도했다 — 확장이 실행되는 순간 이미 침해가 시작된다는 뜻이다.**

## 핵심 포인트

- **Cursor 마켓플레이스에서 Claude Code 확장에 SSH 백도어를 삽입한 변조본 배포** — 최신 공지의 영향 대상은 macOS·Windows용 2.1.312/2.1.313이다.
- **확장 로드 즉시 실행** — ***시스템 정보를 전송하고 공격자의 SSH 키와 자동 실행 스크립트를 설치하며, 역방향 SSH 터널로 원격 접근을 시도한다.*** 사용자가 별도 동작을 하지 않아도 확장을 설치·로드하는 순간 공격이 시작된다.
- **SSH 활성화 코드에 오류가 있지만, 이미 SSH가 켜진 시스템은 위험하다** — 공격 코드 자체가 완벽하지 않아도, 이미 SSH가 활성화된 환경에서는 접근 경로가 그대로 열릴 수 있다.
- **서비스 활성화가 실패해도 정보 수집·지속성 설치는 막히지 않는다** — ***확장 업데이트·삭제만으로는 이미 설치된 백도어가 제거되지 않을 가능성이 있다.*** 겉으로 보이는 조치(확장 제거)가 실제 위협 제거와 다를 수 있다.
- **(WebSearch 참고) Cursor·Windsurf 등은 OpenVSX 마켓플레이스를 쓰는데, 이름이 등록되지 않은 확장은 누구나 선점해 악성 확장을 올릴 수 있는 구조적 공백이 있다고 보도됨.**

## 인상 깊은 문장

*(GeekNews 발췌에 직접 인용할 문장이 남아 있지 않다. 원문 접근이 가능해지면 보강한다.)*

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. 이 노트는 **1차 보도를 특정하지 못한 채 Slack 발췌에만 의존한 낮은 확인 수준**임을 분명히 밝힌다.

## 내 생각 · 적용점

**핵심 전이 1 — "확장을 지우면 끝"이라는 직관이 틀릴 수 있다.** 백도어가 로드 즉시 시스템 정보를 빼가고 지속성 메커니즘(SSH 키, 자동 실행 스크립트)을 심었다면, 확장 삭제는 증상 제거일 뿐 원인 제거가 아니다. [[2026-10-31-binance-hack-8-5-trillion-won]]에서 "서명이 정상이어도 안전을 보장하지 않는다"고 다룬 것과 같은 축이다 — ***겉으로 정상화된 상태(확장 삭제, 정상 서명)가 실제 안전을 보장하지 않을 수 있다.***

**핵심 전이 2 — AI 코딩 도구 생태계 자체가 새로운 공급망 공격 표면이 됐다.** Claude Code, Cursor 같은 도구의 인기가 올라가면서, 그 이름을 사칭하는 확장·패키지가 늘어나는 건 예상 가능한 패턴이다. [[2026-10-30-claude-code-30-second-conversation-sync]]에서 다룬 Claude Code의 백그라운드 동작 방식처럼, "에이전트/확장이 무엇을 언제 전송하는지"를 사용자가 직접 확인하기 어려운 구조 자체가 이런 공격에 취약한 토양이 된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능하다.** 온다 개발팀의 AI 코딩 도구(Claude Code, Cursor 등) 사용 정책에 구체적으로 반영할 수 있다 — ***비공식/검증이 느슨한 마켓플레이스(OpenVSX 등)에서 확장을 설치할 때는 발행자·버전·설치 수를 반드시 확인하고, 사내 표준 확장 목록을 정해 임의 설치를 제한한다.*** 이미 설치된 확장을 삭제하는 것만으로 안전하다고 단정하지 말고, SSH 설정·알려지지 않은 키 등록 여부를 별도로 점검하는 절차를 포함해야 한다.

## 연관 자료

- [[2026-08-26-key-amnesia-agent-secrets]] — 에이전트가 다루는 비밀정보 관리라는 같은 보안 축
- [[2026-07-24-fake-interview-git-hook-malware]] — 개발자를 표적으로 한 또 다른 공급망형 백도어 사례
- [[2026-06-08-linkedin-job-offer-backdoor]] — 개발자 신뢰를 노린 같은 계열의 사회공학적 공급망 공격
- [[2026-10-31-binance-hack-8-5-trillion-won]] — "형식적으로 정상인 신호가 실제 안전을 보장하지 않는다"는 같은 축

## 한 달 뒤 회고

*(2026-11-30 즈음 — 벤더(Cursor/Anthropic)의 정식 보안 공지가 나왔는지 WebSearch로 재확인하고, 영향받은 버전·대응 조치를 교정.)*
