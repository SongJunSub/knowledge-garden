---
title: "OpenClaw 2.0 (구 Clawdbot·Moltbot) — 933명이 16,000개 PR로 다시 지은 메신저 상주형 개인 AI 에이전트, '게이트웨이당 신뢰 경계 하나'라는 한계까지 스스로 명시했다"
source_title: "OpenClaw 2.0 릴리즈(버전 2026.8.1) 종합"
source_url: "https://docs.openclaw.ai/releases/2026.8.1"
source_name: "다수 매체 교차검증 (공식 사이트 접근 불가)"
referrer_url: "https://news.hada.io/topic?id=33090"
published_at: "2026-08-29 (추정 — 다수 매체 보도일 기준)"
summarized_at: "2026-09-01"
category: "ai"
tags: ["openclaw", "open-source-agent", "messaging-agent", "agent-memory", "agent-security", "trust-boundary", "browser-automation"]
---

# OpenClaw 2.0 — 설치부터 메모리와 브라우저 제어까지 전면 개편

> 출처: [OpenClaw 2.0 릴리즈(버전 2026.8.1)](https://docs.openclaw.ai/releases/2026.8.1) (OpenClaw 공식, 다수 매체 교차검증) · 정리일 2026-09-01
> **출처 한계**: `openclaw.ai`·`docs.openclaw.ai`·`news.hada.io`·`cellcog.ai`·`cybersecuritynews.com`·`marktechpost.com` 등 이번 세션에서 시도한 도메인 전부 egress 차단되어 공식 블로그·릴리즈 노트 원문을 단 한 줄도 못 읽었다. 아래는 gadgetpilipinas, techgenyz, hokanews, aidisruption, cryptopond, technosports 등 5개 이상의 2차 매체가 핵심 수치("933명 기여자", "16,000개+ PR", "575ms Control UI", "one trust boundary per gateway")를 반복 일치시켜 보도한 WebSearch 스니펫으로 재구성했다 — 신뢰도는 있으나 원문 직접 인용은 전부 2차 소스를 통한 재구성이다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인 못했다.

## 한 줄 요약

**OpenClaw 역사상 가장 큰 업데이트로, 933명의 기여자(그중 569명이 첫 기여)가 만든 16,000개 이상의 PR — 프로젝트 전체 역사상 병합된 PR의 약 절반 — 을 반영해 설치·메시징·메모리·스킬·자동화·앱·플러그인·보안 전반을 개편했다.** 동시에 "게이트웨이당 신뢰 경계 하나"라는 보안 설계의 명시적 한계도 함께 공개했다 — 상호 적대적인 사용자가 공유하는 멀티테넌시 환경을 위한 보안 경계가 아니라는 것.

## 핵심 포인트

- **OpenClaw란 무엇인가(정확성을 위해 배경부터)** — 2025년 11월 오스트리아 개발자 Peter Steinberger가 "Clawdbot"으로 처음 공개 → Anthropic이 Claude와의 상표 유사성에 이의를 제기해 "Moltbot"으로 개명 → 2026-01-30 "OpenClaw"로 재개명. MIT 라이선스 코어 Gateway, 모델 비종속(Claude·GPT·로컬 Ollama/LM Studio 등 무엇이든 연결). WhatsApp·Telegram·Discord·Slack·Signal 등 12개+ 메신저에 상주하는 데몬형 개인 에이전트로 3개월 만에 GitHub 스타 24만7천+를 모아 "역사상 가장 빠르게 성장한 오픈소스 에이전트 프레임워크"로 보도된 바 있다. Steinberger는 이후 OpenAI에 합류했고, OpenAI가 OpenClaw를 계속 오픈소스로 유지하기로 했다고 알려짐.
- **2.0(버전 2026.8.1) 규모** — 933명 기여자, 16,000개 이상 PR. 설치·메시징·메모리·스킬·모델·자동화·브라우저/네이티브 앱·플러그인·보안 전반을 손댐(Slack 발췌와 일치).
- **설치 간소화** — 가이드형 모델 설정이 기기에 이미 있는 AI 접근권(검증된 Codex/ChatGPT/Claude CLI 로그인, API 키, 공급자 로그인, 설치된 Ollama/LM Studio 모델)을 찾아내 재사용하고, **저장 전에 그 선택이 실제로 응답할 수 있는지까지 확인**한다.
- **Control UI** — 대화 중심 1차 작업공간으로 재구축, 시작 575ms. 세션 파일·터미널 활동·git 기반 diff·PR 상태·브라우저 활동·대시보드를 한 화면에서 확인.
- **메모리** — 내장 Memory가 검색·회상을 전담, 백그라운드 통합(consolidation)이 "출처가 검증된(provenance-qualified)" 내용만 장기 기억으로 승격, 자가학습이 강한 교훈을 스킬 제안으로 전환.
- **스킬·공유 클라우드 세션** — 작업 방식을 재사용·개선하는 스킬(Slack 발췌 일치), 그리고 맥락을 유지한 채 협업하거나 인계하는 "멀티플레이어"형 공유 클라우드 세션.
- **보안 개편** — 승인이 "정확히 그 요청"에만 결속돼 승인 후 임의로 스코프가 확장되지 않도록 구조화. 새 비공개 자격증명 요청 기능으로 대화창에 노출 없이 에이전트에 자격증명을 안전하게 공유.
- **명시된 한계 — "게이트웨이당 신뢰 경계 하나"** — 단일 운영자, 또는 서로 신뢰하는 팀을 전제로 한다. **상호 적대적인 사용자가 하나의 에이전트/게이트웨이를 공유하는 적대적 멀티테넌시 보안 경계가 아니라고 스스로 명시.**
- **세션·트랜스크립트를 SQLite로 이전.**

## 인상 깊은 문장

> "One trust boundary per gateway... not a hostile multi-tenant security boundary for mutually adversarial users sharing one agent or gateway." (2차 소스 교차검증으로 재구성한 인용 — 원문 정확한 워딩은 확인 못함)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가** — 관련 도메인 전부 차단. OpenClaw 전신(Clawdbot/Moltbot)이 상표 분쟁·"Moltbook" 논란 등으로 과거 CNBC·Forbes·Fortune에 반복 등장했다는 정황은 확인했지만, 이번 2.0 자체에 대한 커뮤니티 찬반 반응은 이 세션에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "승인 스코프 결속"과 Auto Mode의 "회로 차단기", 다른 접근의 같은 원칙

[[2026-08-11-claude-code-auto-mode-default]]가 검토한 Claude Code Auto Mode는 "연속 3회 차단 시 수동 승인으로 강제 복귀"하는 **회로 차단기**로 승인 남용을 사후에 결정적으로 되돌리는 구조였다. OpenClaw는 반대 방향에서 접근한다 — 애초에 승인을 "정확히 그 요청"에만 결속해 스코프가 확장될 여지 자체를 없앤다. 접근법은 다르지만 **"한 번의 승인이 이후 임의 행동까지 정당화하면 안 된다"**는 같은 원칙을 사후 복구형과 사전 봉쇄형으로 각각 구현한 셈이다.

### 핵심 전이 2 — 출처 기반 메모리 승격이라는 같은 방향

메모리 설계의 "provenance-qualified 승격"은 [[2026-08-30-lemmalog-llm-memory-program-analysis]]가 다룬 "출처 기반 자동 철회(supersession)"와 방향이 같다. 둘 다 "메모리는 무작정 쌓는 게 아니라 출처를 검증하고, 조건이 바뀌면 재계산·재승격해야 한다"는 문제의식을 공유한다.

### 핵심 전이 3 — 기존 인프라에 에이전트를 편입시킨다는 평행 사례

[[2026-08-31-mu-personal-server-with-embedded-agent]]와 나란히 놓으면 흥미롭다 — mu는 "데이터가 사는 곳(메일함·파일)에 에이전트를 데려간다"는 설계고, OpenClaw는 "사람이 이미 있는 곳(메신저)에 에이전트를 상주시킨다"는 설계다. 둘 다 "에이전트 전용 API를 새로 만들지 않고 기존 인프라에 편입시킨다"는 같은 철학을 다른 층위(데이터 vs 커뮤니케이션)에서 구현한 사례로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

"게이트웨이당 신뢰 경계 하나"라는 명시적 한계 자체가 유용한 정보다 — 온다처럼 서로 신뢰하지 않는 다수 테넌트(호텔·체인 고객사)가 공존해야 하는 멀티테넌시 B2B SaaS에는 이 아키텍처를 그대로 들여올 수 없다는 뜻을 프로젝트가 스스로 밝히고 있다. 다만 원칙 두 가지는 사내 단일 팀용 에이전트 도구(신뢰 경계가 하나뿐인 상황)를 만든다면 참고할 가치가 있다 — ① 이미 있는 로그인·API 키를 재사용해 온보딩 마찰을 줄이는 가이드형 설정, ② 승인을 "정확한 요청 범위"에 결속해 스코프 확장을 원천 차단하는 설계.

## 연관 자료

- [[2026-08-11-claude-code-auto-mode-default]] — 승인 스코프 결속(사전 봉쇄) vs 회로 차단기(사후 복구), 다른 접근의 같은 원칙.
- [[2026-08-30-lemmalog-llm-memory-program-analysis]] — 출처 기반 메모리 승격·철회라는 같은 방향.
- [[2026-08-31-mu-personal-server-with-embedded-agent]] — "기존 인프라에 에이전트를 편입시킨다"는 평행 사례(메신저 vs 메일/파일).
- [[2026-05-04-long-running-agents]] — Brain/Hands/Session 분리 아키텍처, OpenClaw의 Memory+공유 클라우드 세션과 비교할 기준점.

## 한 달 뒤 회고

*(2026-09-30 즈음 — 공식 사이트 접근이 가능해지면 원문 재확인, "게이트웨이당 신뢰 경계" 제약이 실제 엔터프라이즈 채택에 걸림돌이 됐다는 후속 보도가 있었는지 점검.)*
