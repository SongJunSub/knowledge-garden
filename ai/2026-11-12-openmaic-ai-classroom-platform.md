---
title: "OpenMAIC - 주제나 문서를 AI 교사와 토론하는 수업으로 만드는 오픈소스 플랫폼(GeekNews, 부분 확인) — 수업 산출물을 멀티 에이전트가 역할을 나눠 만든다"
source_title: "OpenMAIC: Open Multi-Agent Interactive Classroom"
source_url: "https://github.com/THU-MAIC/OpenMAIC"
source_name: "THU-MAIC (Tsinghua University, GitHub)"
referrer_url: "https://news.hada.io/topic?id=37017"
published_at: "2026"
summarized_at: "2026-11-12"
category: "ai"
tags: ["ai-education", "multi-agent", "edtech", "open-source", "llm-tutoring", "project-based-learning"]
---

# OpenMAIC - 주제나 문서를 AI 교사와 토론하는 수업으로 만드는 오픈소스 플랫폼

> 출처: [OpenMAIC](https://github.com/THU-MAIC/OpenMAIC) (Tsinghua University, GitHub, AGPL-3.0) · 정리일 2026-11-12
>
> **출처 한계**: `news.hada.io` 차단으로 GeekNews 원문·댓글 미확인. GitHub 공식 저장소는 WebSearch 2차 매체(블로그, 아그리게이터)를 통해서만 교차확인했고 직접 열람은 못 했다. 공개 시기(2025-03 vs 2026-03 vs v1.0 2026-08-27)에 대해 소스마다 서로 다른 날짜를 제시해 정확한 출시일은 미확정이다.

## 한 줄 요약

**OpenMAIC(Open Multi-Agent Interactive Classroom)는 주제 설명이나 업로드한 문서를 입력하면, AI 교사·AI 조교·AI 동급생 등 역할이 나뉜 여러 에이전트가 음성 강의·슬라이드·퀴즈·프로젝트 기반 학습(PBL)까지 포함한 완전한 수업을 자동 생성하는 오픈소스 플랫폼이다.**

## 핵심 포인트

- **입력은 주제 또는 문서** — 배우고 싶은 주제를 적거나 자료(PDF 등)를 올리면, 슬라이드·퀴즈·시뮬레이션·PBL을 포함한 멀티씬 수업을 자동 생성한다.
- **AI 교사의 음성·시각 연출** — AI 교사가 음성으로 설명하고 슬라이드에 스포트라이트·레이저 포인터 효과까지 더해 강의를 진행한다는 설명이다.
- **역할이 나뉜 멀티 에이전트** — 교사 외에 조교, 토론을 이끄는 AI 동급생 역할이 따로 있어 또래 학습(peer learning) 구조를 흉내낸다.
- **실시간 채점·피드백 퀴즈** — 객관식·단답형 퀴즈를 지원하며 AI가 실시간으로 채점하고 피드백을 준다.
- **2단계 생성 파이프라인** — 멀티 에이전트 오케스트레이션(LangGraph 추정)으로 개요(outline) → 씬(scenes) 순서의 2단계 생성을 쓴다는 2차 매체 설명이 있다.
- **오픈소스 + 복수 LLM 지원** — AGPL-3.0 라이선스로 자체 호스팅이 가능하고, OpenAI·Anthropic·Google Gemini·DeepSeek 등 주요 LLM 제공자를 지원한다고 알려져 있다.

## 인상 깊은 문장

> "turns any topic description or uploaded document into a full, multimedia lesson in minutes" (2차 매체 요약 재구성)

## 댓글

hada 댓글 미확인. 중국(Tsinghua University) 연구실 기원의 오픈소스 프로젝트라, 실제 수업 효과(학습 성과)에 대한 독립적 검증이나 교육학적 리뷰는 찾지 못했다 — 기술 데모 성격의 소개가 대부분이었다는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — AI가 "채점을 대신"하는 두 가지 반대 결말

[[2026-10-26-berkeley-math-ai-grading-pointless]]에서는 AI가 과제를 너무 쉽게 만점으로 만들어버려서, 결국 교수가 "채점에 의미가 없다"며 완료 여부 확인으로 후퇴했다. OpenMAIC는 정반대 방향을 택한다 — **AI가 채점하는 대신 AI가 수업 자체를 만들고, 그 수업 안의 퀴즈까지 AI가 실시간으로 채점한다.** 두 사례를 나란히 보면, "AI가 평가를 대신한다"는 같은 재료로 (1) 평가 체계가 무의미해지는 결말과 (2) 평가를 수업 설계 안에 통합해 되살리려는 시도가 동시에 존재한다는 게 흥미롭다. 어느 쪽이 더 지속 가능한 모델인지는 아직 열린 질문이다.

### 전이 2 — 역할을 나눈 멀티 에이전트라는 반복되는 패턴

"교사 역할 + 조교 역할 + 동급생 역할"로 에이전트를 나누는 설계는, 이 가든에서 여러 번 등장한 "하나의 거대 에이전트보다 역할을 나눈 여러 에이전트가 낫다"는 패턴의 교육 도메인 버전이다. 역할 분리가 실제로 학습 효과를 높이는지, 단순히 데모 효과(시각적으로 풍부해 보이는 것)에 그치는지는 검증되지 않았다.

### 전이 3 — "AI 중심 대학" 정책과의 연결

[[2026-09-30-ai-centered-universities-korea-launch]]에서 정리한 국내 AI중심대학 정책은 "전교생 AI 기초교육 의무화"를 다뤘다. OpenMAIC류 플랫폼이 실제로 그런 대규모 기초교육의 실행 수단이 될 수 있는지는 미지수지만, **"AI가 콘텐츠를 생성하는 교육"에서 "AI가 교실 전체(교사·조교·동급생)를 시뮬레이션하는 교육"으로 넘어가는 다음 단계**를 보여주는 사례로 참고할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS 도메인과 AI 교실 플랫폼은 접점이 거의 없다. 다만 "역할을 나눈 멀티 에이전트로 하나의 완성된 산출물(수업)을 조립한다"는 아키텍처 패턴 자체는, 온다 내부에서 신규 입사자 온보딩 자료나 파트너 교육 콘텐츠를 자동 생성하는 먼 미래의 아이디어로 가볍게 기록해둘 만하다 — 지금 우선순위로 검토할 사안은 아니다.

## 연관 자료

- [[2026-10-26-berkeley-math-ai-grading-pointless]] — AI가 평가를 무너뜨린 반대 사례, OpenMAIC의 "AI가 채점까지 통합"하는 시도와 대비
- [[2026-09-30-ai-centered-universities-korea-launch]] — 국내 AI 기초교육 의무화 정책, 같은 "AI 교육" 큰 흐름
- [[2026-09-12-music-theory-21st-century-classroom]] — 자기주도학습 교재 설계라는 다른 결의 교육 콘텐츠 사례

## 한 달 뒤 회고

*(2026-12-12 즈음 — OpenMAIC 공식 저장소를 직접 열람해 출시일·라이선스·실제 데모 영상을 확인했는지, 실사용 리뷰나 교육 효과 검증이 나왔는지 점검.)*
