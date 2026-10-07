---
title: "Octop (TencentCloud) — 가족과 소규모 팀이 함께 쓰는 셀프 호스팅 AI 비서, 한 프로세스에 대시보드·CLI·IM·스케줄러를 전부 담았다"
source_title: "Octop: A smarter, self-hosted AI assistant — multi-user, multi-agent"
source_url: "https://github.com/TencentCloud/Octop"
source_name: "GitHub (TencentCloud/Octop)"
referrer_url: "https://news.hada.io/topic?id=34916"
published_at: "2026-07 (GitHub 공개 추정)"
summarized_at: "2026-10-07"
category: "ai"
tags: ["self-hosted-ai", "multi-agent", "open-source", "personal-assistant", "tencentcloud"]
---

# Octop (TencentCloud) — 가족과 소규모 팀이 함께 쓰는 셀프 호스팅 AI 비서

> 출처: [Octop](https://github.com/TencentCloud/Octop) (GitHub) · 정리일 2026-10-07

> **출처 한계**: GeekNews 토픽 페이지(news.hada.io)는 egress 차단으로 접근하지 못했다. 대신 GitHub 저장소(github.com/TencentCloud/Octop)는 직접 열어 README와 스타 수(7.6k, 포크 918, 오픈 이슈 414)를 확인했다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**TencentCloud가 공개한 오픈소스 셀프 호스팅 AI 비서로, 한 개의 Python 프로세스 안에 멀티유저·멀티에이전트·웹 대시보드·CLI·메신저 연동·스케줄러를 전부 담아 개인 컴퓨터나 자체 서버에서 가족·소규모 팀이 함께 쓸 수 있게 만들었다.**

## 핵심 포인트

- 여러 사용자와 전문 에이전트를 지원하는 오픈소스 AI 비서 플랫폼으로, 개인 컴퓨터나 자체 서버에서 운영한다. 관리자 한 명과 공유 사용자들이 각자의 ***전문 에이전트 팀***을 꾸릴 수 있다.
- 사용자마다 ***작업 공간, 기억, 모델과 도구를 갖춘 전문 에이전트***를 구성하고, 유용한 에이전트 설정과 스킬을 다른 사용자와 공유할 수 있다.
- AgentTeams 베타에서는 ***조정 에이전트가 여러 전문가에게 작업을 병렬로 배정***하고 결과를 종합하며, 각 전문가의 응답을 그룹 대화에서 확인할 수 있다.
- 웹 대시보드와 데스크톱 앱 외에도 Telegram, Discord, WeChat, Feishu, DingTalk, QQ 등 다양한 메신저 채널과 cron 기반 자동화를 지원한다.
- ***단일 프로세스***가 대시보드·API·CLI·메신저 연동·스케줄러를 전부 처리한다 — 메시지 브로커·워커 플릿·사이드카 DB 클러스터 없이, 데이터는 기본적으로 `~/.octop/` 아래 SQLite에(선택적으로 PostgreSQL) 로컬 저장된다. Python 3.12+, MIT 라이선스.
- GitHub 기준 2026년 7월 공개 이후 ***7.6k 스타, 918 포크***를 모았다.

## 인상 깊은 문장

> "A smarter, self-hosted AI assistant — multi-user, multi-agent." (GitHub README, 직접 확인)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — 가장 가까운 동형 사례

[[2026-10-05-openmuse-open-source-personal-agent]]는 브라우저·터미널로 일하는 오픈소스 개인 AI 에이전트로, "두뇌까지 통째로 셀프 호스팅해 토큰과 자격증명을 사용자 손에 둔다"는 같은 철학을 공유한다. Octop은 거기서 한 단계 더 나가 "여러 사용자"를 1급 개념으로 설계했다는 점이 차이다 — 개인용 셀프호스팅에서 가족·소규모 팀용 멀티유저 셀프호스팅으로 넘어가는 다음 단계처럼 보인다.

### 핵심 전이 2 — 폐쇄형 버전과의 대조

[[2026-09-09-muse-meta-personal-ai-agent]]는 Meta의 개인 AI 에이전트로, "못 보는 결제수단"과 "되돌릴 수 없는 행동엔 승인"을 설계에 넣은 폐쇄형 서비스다. Octop은 같은 "개인 비서" 자리를 두고 정반대 축 — 데이터와 실행 환경을 전부 사용자 손에 두는 오픈소스·셀프호스팅 — 에 서 있다. 통제권을 어느 쪽이 쥐느냐가 이 두 글을 가르는 축이다.

### 핵심 전이 3 — 철학적 뒷받침

[[2026-05-11-local-ai-needs-to-be-the-norm]]이 주장한 "로컬 AI가 표준이 되어야 한다"는 원칙을, Octop은 개인을 넘어 가족·소규모 팀 단위로 한 번 더 확장해 보여주는 실제 제품이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다의 CRS는 B2B SaaS이고, 가족·개인용 셀프호스팅 비서와는 운영 환경이 다르다. 다만 "사용자마다 독립된 작업 공간·기억·에이전트를 두고, 설정과 스킬만 공유한다"는 설계 원칙은 전이 가능하다. 숙소·체인별로 CRS 에이전트 설정(요금 정책, 응대 템플릿)을 각자 독립적으로 갖되, 잘 만든 설정을 다른 숙소에 "공유"하는 구조는 Octop의 멀티유저 모델과 닿아 있다.

## 연관 자료

- [[2026-10-05-openmuse-open-source-personal-agent]] — 셀프호스팅·오픈소스 개인 에이전트라는 같은 철학을 공유하는 가장 가까운 사례.
- [[2026-09-09-muse-meta-personal-ai-agent]] — 통제권을 플랫폼이 쥐는 정반대 축의 폐쇄형 버전.
- [[2026-05-11-local-ai-needs-to-be-the-norm]] — "로컬 AI가 표준이어야 한다"는 원칙을 가족·팀 단위로 확장한 실제 사례.

## 한 달 뒤 회고

*(2026-11-07 즈음) 스타 수·이슈 수 추이와, AgentTeams 베타가 정식 기능으로 넘어갔는지 확인한다.*
