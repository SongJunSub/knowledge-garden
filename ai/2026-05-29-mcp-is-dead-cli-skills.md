---
title: "MCP는 죽었나 — 컨텍스트 비용·지연·CLI 중복, 그리고 Skills 대안 (AI 툴링 실용주의: 보링테크·조합성 라인)"
source_title: "MCP is dead"
source_url: "https://www.quandri.io/engineering-blog/mcp-is-dead"
source_name: "quandri.io · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30028"
summarized_at: "2026-05-29"
category: "ai"
tags: ["mcp", "ai-tooling", "context-cost", "cli", "skills", "composability", "boring-technology-line", "agent-tools"]
---

# MCP는 죽었나 — 컨텍스트 비용·지연·CLI 중복, 그리고 Skills 대안 (AI 툴링 실용주의: 보링테크·조합성 라인)

> 출처: [MCP is dead](https://www.quandri.io/engineering-blog/mcp-is-dead) (Quandri Engineering, GeekNews 경유) · 정리일 2026-05-29

## 한 줄 요약
**MCP(Model Context Protocol)의 세 가지 실전 비용 — ①*컨텍스트 비용*(Linear·Notion·Slack·Postgres 77개 도구 정의만으로 ~21,077토큰 = 200K의 10.5% 선점), ②*성능·안정성*(별도 서버 프로세스 → 초기화 실패·인증 반복·외부 왕복, Jira 벤치 REST 직접 호출 대비 3배 느림), ③*기존 도구와 중복*(CLI/API는 pipe·`jq`·`grep`과 자유 조합·터미널 즉시 재현/디버깅, MCP는 서버 반환 형식에 제약). Quandri의 대안: *기존 CLI를 Skills로 감싸 ~21K 토큰 회수*, *CLI가 없거나 팀 단위 권한 제어가 필요할 때만 MCP*. (반론: OpenAI는 "지연 로딩으로 개선, 프로토콜로서 죽지 않았다.")**

## 핵심 포인트

- **컨텍스트 = 비용** — 도구 정의가 *컨텍스트 예산을 선점*. 77개 = 10.5%. **[[2026-05-29-orchestration-tax]]·[[2026-05-29-claude-code-dynamic-workflows]] *토큰=희소 자원* 라인** — 도구 노출도 *오케스트레이션 세금*의 일부.
- **추상화 계층의 지연·취약성** — 별도 서버 프로세스가 *초기화·인증·왕복*을 추가. *REST 직접 호출 대비 3배 느림*. → 새 계층이 항상 이득은 아님.
- **CLI의 조합성·재현성** — *pipe·jq·grep*과 자유 조합, *터미널에서 즉시 재현·디버깅*. **[[2026-05-28-favorite-developer-tools]] *좋은 기본값·조합 가능한 도구* 라인** + **[[2026-05-29-choose-boring-technology-2015]] *검증된 것 우선*** — CLI = boring·proven, MCP = 새 토큰.
- **대안: CLI를 Skills로 래핑** — 도구 정의 비용 없이 *필요할 때만 로드*. *CLI 없거나 팀 권한 제어 필요 시에만 MCP*.
- **죽지 않았다는 반론도 합리** — *지연 도구 로딩(lazy loading)으로 컨텍스트 비용 개선*, *상황에 맞게 택하면 됨*. → **"죽음"이 아니라 *기본값을 CLI/Skills로, MCP는 특수 상황으로*라는 우선순위 재조정**.

## 인상 깊은 문장

> *(요지)* 77개 도구 정의만으로 약 21,077 토큰 — Claude 200K 컨텍스트의 10.5%가 *아무 일도 하기 전에* 소비된다.

> *(요지)* CLI/API는 *pipe·jq·grep과 자유롭게 조합*되고 *터미널에서 즉시 재현·디버깅*되지만, MCP는 *서버가 반환하는 형식에 묶인다*.

## 내 생각 · 적용점

### *AI 툴링의 보링테크·조합성 라인* (친·반 카운팅 무관)

이 글은 *MCP 비관*이 아니라 **"기본값을 조합 가능한 검증된 도구(CLI/Skills)로, 새 프로토콜은 특수 상황으로"라는 우선순위 재조정**. 가든의 *좋은 기본값·조합성 라인*([[2026-05-28-favorite-developer-tools]] ripgrep·jq)과 *보링테크 라인*([[2026-05-29-choose-boring-technology-2015]])에 귀속. **친·반 AI 균형 카운팅 무관** (부채 -5 유지).

### *도구 노출도 오케스트레이션 세금이다*

핵심 통찰: **컨텍스트는 유한 예산**. 도구를 많이 *노출*하는 것만으로 *판단·검토 대역폭(컨텍스트)*이 줄어든다 — [[2026-05-29-orchestration-tax]]의 *직렬 자원*이 토큰 차원에서 재현. → 에이전트에 *모든 MCP를 연결*하기보다 *필요한 Skills만 지연 로드*하는 게 *세금 절감*. (이 세션도 Claude Code의 Skills·지연 도구 로딩을 쓰는 같은 구조.)

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [MCP is dead](https://www.quandri.io/engineering-blog/mcp-is-dead) (원문)
- [GeekNews — 30028](https://news.hada.io/topic?id=30028)
- [[2026-05-29-orchestration-tax]]·[[2026-05-29-claude-code-dynamic-workflows]] — 토큰=희소 자원 *(도구 노출도 세금)*
- [[2026-05-28-favorite-developer-tools]] — 조합 가능한 좋은 기본값 *(CLI·jq·grep)*
- [[2026-05-29-choose-boring-technology-2015]] — 검증된 것 우선 *(CLI=boring·proven)*
- [[2026-05-18-musinsa-query-engineer-harness]] — Agent = Model + Harness *(도구·하네스 설계)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — 에이전트 도구를 MCP 전부 연결 vs Skills 지연 로드 중 무엇으로 운영했는지, 컨텍스트 비용을 실제로 절감했는지 기록.)*
