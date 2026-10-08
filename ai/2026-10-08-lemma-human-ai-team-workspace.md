---
title: "Lemma (Folks and Machines) — 사람과 AI 에이전트가 같은 파일을 공유하는 오픈소스 작업 공간, 코딩 에이전트 로그인을 그대로 팀원으로 앉힌다"
source_title: "Lemma Platform"
source_url: "https://github.com/lemma-work/lemma-platform"
source_name: "GitHub (lemma-work/lemma-platform)"
referrer_url: "https://news.hada.io/topic?id=34976"
published_at: "확인 불가"
summarized_at: "2026-10-08"
category: "ai"
tags: ["multi-agent", "open-source", "human-ai-collaboration", "workspace", "lemma", "agent-client-protocol"]
---

# Lemma (Folks and Machines) — 사람과 AI 에이전트가 같은 파일을 공유하는 오픈소스 작업 공간

> 출처: [Lemma Platform](https://github.com/lemma-work/lemma-platform) (GitHub, Folks and Machines, Inc.) · GeekNews(id=34976) 경유 · 정리일 2026-10-08

> **출처 한계**: `news.hada.io`는 이번 세션에서도 egress 차단으로 직접 열지 못했다. 대신 **GitHub 저장소(`github.com/lemma-work/lemma-platform`)는 WebFetch로 README를 직접 확보**해 핵심 기능·연동 방식·라이선스·스타 수를 1차 소스로 확인했다. 다만 README는 제작사 자신의 설명이라, 권한 모델·워크플로 그래프가 실전에서 얼마나 매끄럽게 동작하는지는 검증되지 않았다. hada 댓글 수·HN 큐레이션 유무는 확인 불가.

## 한 줄 요약

**Lemma는 사람과 AI 에이전트가 테이블·파일·에이전트·워크플로·권한을 한 "파드(pod)"에 같이 담아 쓰는 오픈소스 작업 공간으로, 이미 구독 중인 Claude Code·Codex·Cursor·OpenCode 로그인을 그대로 팀원 에이전트로 앉히고, Slack·Teams·Telegram·WhatsApp·이메일에서 같은 권한 규칙으로 접근하게 만든다.**

## 핵심 포인트

- **파드(pod) — 팀의 작업 공간 단위** — 테이블, 파일, 에이전트, 워크플로, 권한, 앱을 한 디렉터리에 묶은 것이 파드다. 앱·페이지·워크플로를 채팅으로 요청해 만들 수 있고, 파드 자체를 파일 묶음으로 내보내기·공유·가져오기할 수 있다.
- **코딩 에이전트를 팀원으로 — Agent Host + ACP** — 사용자가 이미 구독 중인 ***Claude Code, Codex, Cursor, OpenCode 로그인으로 팀원 AI를 그대로 실행***한다. Agent Host가 로컬의 이 네 에이전트를 Agent Client Protocol(ACP)로 파드에 연결하고, 각 에이전트가 앱·테이블·에이전트·워크플로·권한을 파일로 작성한 뒤 CLI로 검증하는 구조다. `lemma skills install`로 스킬을 설치한다.
- **다섯 채널, 같은 권한 규칙** — Slack, Teams, Telegram, WhatsApp, 이메일 다섯 채널에서 웹훅 수신·신원 확인·에이전트 주도 작업을 지원한다. 로컬 환경은 Telegram 롱 폴링·Slack Socket Mode로 바로 연결되고, ***파드 에이전트마다 고유 이메일 주소***가 생긴다(Gmail·Outlook 계정 연결은 "서피스"가 아니라 별도 "커넥터"로 분류). 앱·Slack·WhatsApp 어디서든 같은 권한 규칙이 적용된다고 설명한다.
- **사람·에이전트 공용 단일 권한 모델** — 파드 수준 역할, 테이블별 권한, 리소스 가시성, 위임 토큰, 행 단위 보안을 사람과 에이전트 모두에 동일하게 부여한다. 중요한 단계엔 ***사람의 승인 게이트***를 둘 수 있다.
- **워크플로 = 그래프, 메모 = 공용/개인 구분** — 워크플로는 에이전트·함수·조건 분기·반복·대기·사람의 승인 단계를 조합한 그래프로, 일정·행 변경·웹훅·채팅·API로 시작된다. 메모는 마크다운 파일로 저장되며 전문 검색이 되고, ***팀이 함께 읽는 공용 메모와 개인만 보는 메모가 구분***된다.
- **라이선스와 규모** — 백엔드·프론트엔드 핵심은 AGPLv3, CLI·SDK·스킬·로컬 스택 도구·파드 번들 형식은 Apache-2.0인 듀얼 라이선스. 상업 라이선스는 Folks and Machines, Inc.가 제공한다. 확인 시점 기준 스타 521개, 포크 69개, 워처 6명(스냅샷 수치).

## 인상 깊은 문장

> "The open-source workspace where humans and AI agents work as one team." (GitHub README, 직접 확인)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "기존 로그인을 그대로 쓴다"는 같은 원칙을 공유하는 가장 가까운 사례

[[2026-10-05-offrun-multi-agent-workspace]]도 Claude Code·Codex·Antigravity·Grok Build를 "새 계정이나 API 키 없이" 기존 구독으로 한 작업 공간에서 돌린다. Offrun은 개인 개발자의 Mac 앱으로 코딩 에이전트만 다루지만, Lemma는 그 원칙을 팀 단위로, 코딩을 넘어 테이블·워크플로·외부 채널까지 확장했다는 점이 차이다.

### 핵심 전이 2 — 에이전트 "팀"을 조직처럼 모델링하는 또 다른 축

[[2026-10-06-openrig-multi-agent-orchestrator]]는 Claude Code·Codex를 Seat·Pod·Lead Agent로 묶어 "팀"을 흉내낸다. Lemma의 파드(pod)와 이름부터 겹치지만, OpenRig은 코딩 하네스 여러 개를 tmux 위에서 운영하는 문제(세션 관리·역할 분담·상태 복구)에 집중하고, Lemma는 사람과 에이전트가 같은 데이터(테이블·메모)를 공유하며 일하는 업무 공간 자체를 다룬다 — "에이전트 팀 운영"이라는 같은 메타포를 코딩 전용과 범용 업무로 각각 가져간 사례다.

### 핵심 전이 3 — 가족·개인용 멀티유저 비서와의 대조

[[2026-10-07-octop-self-hosted-ai-assistant]]는 한 프로세스로 가족·소규모 팀이 각자의 전문 에이전트를 꾸리는 셀프호스팅 비서였다. Lemma는 같은 "여러 사용자 + 여러 에이전트"를 다루지만, 외부 비즈니스 채널(Slack·Teams·이메일) 연동과 테이블·워크플로 중심의 업무 자동화에 더 가깝다 — 개인·가족용 비서와 팀용 업무 플랫폼이라는 용도의 분기로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 아직 멀지만 참고할 원칙은 있다. 파드 하나에 테이블(예약 데이터)·에이전트(응대 봇)·워크플로·권한을 같이 담고, Slack·이메일 같은 기존 채널에서 같은 권한 규칙으로 접근하게 하는 구조는, 온다의 CRS가 숙소·체인별 운영 데이터와 AI 응대 에이전트를 한 공간에 두고 매니저 역할별 권한을 나누는 모델과 닿아 있다. 특히 "팀이 함께 읽는 공용 메모 vs 개인만 보는 메모" 구분은 CRS 고객 응대 이력 관리에 바로 참고할 만하다. 다만 AGPLv3 핵심 라이선스가 상용 SaaS에 어떤 제약을 거는지, 실제 운영 부담이 어느 정도인지는 README 수준에서는 검증되지 않았다.

## 연관 자료

- [[2026-10-05-offrun-multi-agent-workspace]] — "기존 구독·로그인을 그대로 쓴다"는 같은 원칙을 공유하는 코딩 전용 버전.
- [[2026-10-06-openrig-multi-agent-orchestrator]] — 에이전트 "팀"을 조직 메타포로 모델링하는 또 다른 축, 코딩 하네스 운영에 집중.
- [[2026-10-07-octop-self-hosted-ai-assistant]] — 가족·개인용 멀티유저 셀프호스팅 비서와의 대조, 용도의 분기.

## 한 달 뒤 회고

*(2026-11-08 즈음) 스타 수 추이, Agent Host의 ACP 연동이 실제로 Claude Code·Codex와 얼마나 매끄럽게 동작하는지, 상업 라이선스 가격이 공개됐는지 확인한다.*
