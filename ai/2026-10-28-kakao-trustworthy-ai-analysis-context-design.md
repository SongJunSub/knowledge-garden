---
title: "팀이 신뢰할 수 있는 AI 분석 환경 만들기: 추천팀의 컨텍스트 설계 (카카오) — Data Catalog·Analyst Persona·Task Context 세 컨텍스트로 쪼개 분석 신뢰도를 올린다"
source_title: "팀이 신뢰할 수 있는 AI 분석 환경 만들기: 추천팀의 컨텍스트 설계"
source_url: "https://tech.kakao.com/posts/844"
source_name: "카카오 기술 블로그 (tech.kakao.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-28"
category: "ai"
tags: ["context-engineering", "data-analysis-agent", "kakao", "analyst-persona", "task-context", "data-catalog"]
---

# 팀이 신뢰할 수 있는 AI 분석 환경 만들기: 추천팀의 컨텍스트 설계 (카카오)

> 출처: [팀이 신뢰할 수 있는 AI 분석 환경 만들기: 추천팀의 컨텍스트 설계](https://tech.kakao.com/posts/844) (카카오 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-28

> **출처 한계**: `tech.kakao.com`은 이 세션에서 egress 전면 차단(WebFetch 시도 결과 `getaddrinfo ENOTFOUND`)으로 원문을 전혀 읽지 못했다. 이 노트는 Slack 발췌 3줄 + 스레드 상세 답글 1개만으로 작성됐다 — 저자, 발행일, 구체적인 프롬프트 문구나 Jira 연동 구현 방식은 확인하지 못했다.

## 한 줄 요약

**카카오 추천팀은 AI 에이전트 분석마다 데이터 해석과 분석 기준이 달라 결과가 일치하지 않는 문제를 겪었고, 이를 Data Catalog(데이터 정의, What)·Analyst Persona(분석 방법, How)·Task Context(과제 배경, Why) 세 컨텍스트로 분리해 팀 공통 지식베이스를 구축하는 것으로 풀었다 — Task Context를 Jira와 연동해 실시간으로 관리한다는 점이 구체적 실행 디테일이다.**

## 핵심 포인트

- **문제 — 분석가마다 다른 데이터 해석** — AI 에이전트 분석 시 데이터 해석 차이와 분석 기준의 불일치로 결과값이 어긋나는 문제를 겪었다. 데이터의 암묵지, 분석 방법의 차이, 분석 배경의 부재에서 기인한다고 진단했다.
- **세 컨텍스트로 분리** — ***Data Catalog(What)***은 데이터의 의미·집계 기준 정의, ***Analyst Persona(How)***는 분석 절차와 리포트 형식 규정, ***Task Context(Why)***는 과제의 목적과 가설을 담는다 — 세 층위를 분리해서 각각 다른 주기로 관리할 수 있게 만든 설계로 읽힌다.
- **Task Context를 Jira와 실시간 연동** — 과제별 목적·가설을 담는 Task Context는 Jira와 연동해 실시간으로 관리한다고 밝혔다. 과제가 진행되며 바뀌는 맥락을 정적 문서가 아니라 운영 중인 이슈 트래커에서 끌어온다는 뜻으로, 세 컨텍스트 중 가장 자주 바뀌는 층위를 가장 "live"한 소스에 묶은 선택으로 보인다.
- **목표는 일관성 + 협업 효율** — 구조화된 지식베이스를 통해 팀원들이 일관된 분석 결과를 도출하고, AI 에이전트와의 협업 효율을 극대화하려 했다고 밝힌다. 다만 실제로 일치도가 얼마나 개선됐는지 수치는 발췌에 없다.

## 인상 깊은 문장

> "추천팀은 AI 에이전트 분석 시 발생하는 데이터 해석 차이와 분석 기준의 불일치 문제를 경험함." (Slack 발췌)

> "데이터 정의, 분석 방법, 과제 배경을 세 가지 컨텍스트로 분리하여 팀 공통의 지식베이스를 구축함." (Slack 발췌)

## 댓글

이 글은 GeekNews를 경유하지 않고 Slack `TechArticles` 봇이 직접 수집했다 — hada 댓글 수, HN/Lobsters 큐레이션 모두 해당 없음. 카카오 자사 기술 블로그 글이라 "잘 설계했다"는 성공 서사일 가능성을 배제할 수 없고, 세 컨텍스트 분리가 실제로 분석 불일치를 얼마나 줄였는지 정량 수치는 제시되지 않았다.

## 내 생각 · 적용점

**핵심 전이 — [[2026-10-02-kakao-data-analysis-agent-context-design]]의 구체화된 후속편이다.** 그 글(tech.kakao.com/posts/838)은 "시스템 프롬프트에 역할·안전 규칙·도구 가이드를 담고, 도메인 지식과 서비스 테이블 정보를 별도로 제공한다"는 2분할 설계를 다뤘지만 원문 발췌가 끊겨 구체성이 부족했다. 이번 글은 같은 "분석 환경 신뢰성" 문제의식을 Data Catalog·Analyst Persona·Task Context라는 3분할로 더 선명하게 쪼갰고, 특히 Task Context를 Jira와 묶은 건 그 글이 가능성으로만 남겨둔 "Context vs Memory 구분의 실전 구현"에 해당한다 — 과제별 가변 맥락(Context)과 팀 공통 지식(Memory에 가까운 Data Catalog·Persona)을 서로 다른 갱신 주기의 소스로 나눈 설계로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 높다.** 온다 CRS에 예약·요금 데이터 분석 에이전트를 둔다면, "데이터 정의(요금 코드·채널별 집계 기준) / 분석 방법(리포트 형식·절차) / 과제 배경(이번 분석을 요청한 이유와 가설)"을 세 레이어로 분리하고, 과제 배경만큼은 Jira나 내부 이슈 트래커와 연동해 살아있는 맥락으로 관리하는 구조를 그대로 가져올 수 있다. 분석가마다 "노쇼율 집계 기준이 다르다"는 식의 불일치는 CRS에서도 흔히 일어날 수 있는 문제라, 이 글의 3분할 자체가 체크리스트로 쓸 만하다.

## 연관 자료

- [[2026-10-02-kakao-data-analysis-agent-context-design]] — 같은 회사, 같은 문제의식의 3주 전 선행편. 이번 글이 그 설계를 Data Catalog·Persona·Task Context로 더 구체화했다.

## 한 달 뒤 회고

2026-11-28 즈음, `tech.kakao.com` 접근이 풀렸다면 원문으로 저자·발행일, Task Context-Jira 연동의 실제 구현 방식, 분석 불일치가 실제로 얼마나 줄었는지 수치를 보강한다.
