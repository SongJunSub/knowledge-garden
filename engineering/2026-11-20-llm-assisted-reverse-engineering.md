---
title: "LLM을 활용한 리버스 엔지니어링 (GeekNews) — 전용 스킬이 없으면 에이전트는 디스어셈블리 실행법을 몰라 일찍 멈춘다"
source_title: "LLM assisted reverse engineering (추정)"
source_url: "https://blog.adafruit.com/2026/11/19/llm-assisted-reverse-engineering/"
source_name: "Adafruit Blog (1차 저자: ioma8)"
referrer_url: "https://news.hada.io/topic?id=37466"
published_at: "2026-11-19"
summarized_at: "2026-11-20"
category: "engineering"
tags: ["reverse-engineering", "llm-agent", "ghidra", "radare2", "agent-skills"]
---

# LLM을 활용한 리버스 엔지니어링 (GeekNews)

> 출처: 추정 "LLM assisted reverse engineering" (Adafruit Blog, 1차 저자 ioma8) · [GeekNews](https://news.hada.io/topic?id=37466) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 egress 차단 재확인. Adafruit은 2차 재게시로 확인했고, 1차 원문(저자 개인 블로그로 추정)의 정확한 URL은 확보하지 못했다.

## 한 줄 요약

**20년간 수작업으로 리버스 엔지니어링을 해온 저자는 AI 코딩 에이전트에 바이너리와 직접 만든 전용 스킬을 함께 투입해 분석 시간을 크게 줄였는데, 전용 스킬이 중요한 이유는 에이전트가 디스어셈블리 실행 방법을 모르면 조기에 멈추는 경향이 있어서다.**

## 핵심 포인트

- 저자 **ioma8**은 약 20년간 하드웨어/소프트웨어 리버스 엔지니어링을 수작업으로 해왔다.
- AI 코딩 에이전트에 바이너리와 **직접 작성한 전용 스킬**을 함께 투입해 코드 개요를 빠르게 생성한다. 공개된 스킬 중 하나는 radare2·Ghidra MCP 브리지(Ghidra 스크립트 22개 포함)로 타겟 디컴파일을 지원한다.
- 스킬이 중요한 이유: ***에이전트는 디스어셈블리 실행 방법을 모르면 조기에 멈추는 경향***이 있는데, 스킬이 그 실행 경로를 대신 제공한다.
- 분석은 바이너리 유형과 플랫폼 파악, 도구 선택, 주요 함수와 분기 구조 조사 순으로 진행하며, 발견 사항을 Markdown 파일에 기록해 맥락 압축이나 에이전트 교체 이후에도 작업을 이어간다(Slack 발췌와 일치).
- "가설 기반 디버깅" 패턴은 학계 연구에서도 뒷받침된다 — 가설을 세우고 검증하고 기각되면 재수립하는 루프, 결과를 컨텍스트 밖(마크다운 등)에 영속화하는 게 핵심이라는 결론이 일치한다.
- 참고 사례: Claroty Team82가 자체 Ghidra MCP 서버로 벤더 공개 펌웨어를 10분 이내 분석했다(과거엔 사람이 같은 작업으로 CVE 5건을 수작업 발견).

## 인상 깊은 문장

> "agents otherwise tend to stop early when they don't know how to run the disassembly step."

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: 1차 원문을 확보하지 못해 2차 재게시 기준으로 정리했다. Claroty "10분" 수치도 2차 요약 기반이다.

## 내 생각 · 적용점

### 핵심 전이 — "전용 스킬이 에이전트의 조기 중단을 막는다"는 원칙

[[2026-10-11-rea-reverse-engineer-anything]]과 같은 "AI+리버스엔지니어링" 계열이며, 두 글 모두 "에이전트에게 도메인 전용 실행 경로(스킬·도구)를 쥐여주면 막연한 추론 대신 실제 작업을 끝낸다"는 같은 결론에 도달한다. [[2026-09-05-imhex-file-format-reverse-engineering]], [[2026-09-09-fnprint-binary-function-identification]]와도 같은 도구 계열이다.

### 적용점

가설 기반 디버깅 루프와 "발견 사항을 컨텍스트 밖(마크다운)에 영속화"하는 패턴은, 긴 디버깅 세션을 거치는 어떤 에이전트 워크플로우에도 일반화할 수 있는 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 리버스 엔지니어링 자체는 CRS와 무관하다. 다만 "에이전트에 전용 스킬을 쥐여주면 조기 중단을 막는다"는 일반 원칙은 CRS 운영 에이전트(장애 진단, 로그 분석 등)를 설계할 때 참고할 수 있다.

## 연관 자료

- [[2026-10-11-rea-reverse-engineer-anything]] — 같은 "AI+리버스엔지니어링" 계열
- [[2026-09-05-imhex-file-format-reverse-engineering]] — 같은 바이너리 분석 도구 계열
- [[2026-09-09-fnprint-binary-function-identification]] — 같은 바이너리 분석 도구 계열

## 한 달 뒤 회고

2026-12-20 즈음 — 1차 원문을 확보해 스킬 2개의 실제 구조를 확인했는지, 같은 "전용 스킬" 패턴을 온다 운영 에이전트에 검토했는지 점검.
