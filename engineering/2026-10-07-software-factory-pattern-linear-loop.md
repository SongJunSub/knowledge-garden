---
title: "소프트웨어 팩토리 패턴 시도하기 (Will Larson) — 개별 티켓이 아니라 '/linear-project-loop'로 목표와 지표부터 읽게 했더니, 머릿속에만 있던 프로젝트 상태를 전부 밖으로 꺼내야 했다"
source_title: "The software factory pattern lets agents run projects, not just tasks"
source_url: "https://news.hada.io/topic?id=34925 (lethain.com 원문 URL 미확정, 아래 출처 한계 참고)"
source_name: "Will Larson (Imprint CTO) · Irrational Exuberance(lethain.com) 추정"
referrer_url: "https://news.hada.io/topic?id=34925"
published_at: "2026-10 (추정)"
summarized_at: "2026-10-07"
category: "engineering"
tags: ["software-factory", "agentic-workflow", "linear", "harness", "project-management"]
---

# 소프트웨어 팩토리 패턴 시도하기 (Will Larson)

> 출처: [The software factory pattern lets agents run projects, not just tasks](https://news.hada.io/topic?id=34925) (Will Larson 추정 · GeekNews 경유) · 정리일 2026-10-07

> **출처 한계**: news.hada.io(GeekNews)와 lethain.com 둘 다 이번 세션의 네트워크 egress 차단으로 직접 접근하지 못했다. WebSearch로 교차확인한 결과 저자는 Imprint CTO이자 "Irrational Exuberance" 블로거 Will Larson으로 특정되고, zeli.app 등 HN 신디케이션 미러 2곳 이상이 같은 핵심 사실(Linear/Datadog MCP/Snowflake 의존, Agent Fleet 이전 계획, Stripe Minions 참조)을 일치해서 전하고 있어 재구성에 활용했지만, lethain.com 원문 문장 대조는 하지 못했다. 정확한 원문 URL과 발행일도 확정 못 함. hada 댓글 수는 확인 불가.

## 한 줄 요약

**Linear 프로젝트 전체의 목표·지표를 읽고 스스로 다음 작업을 찾아 수행하는 "소프트웨어 팩토리" 에이전트 스킬(`/linear-project-loop`)을 실험했는데, 그 과정에서 저자 자신이 머릿속에만 담아두고 있던 프로젝트 상태를 전부 외부화해야 했다는 것이 핵심 발견이다.**

## 핵심 포인트

- 에이전트에게 개별 티켓을 맡기는 대신, 프로젝트 목표와 지표를 직접 확인하며 필요한 작업을 스스로 찾아 수행하는 "소프트웨어 팩토리"를 Imprint에서 실험 중이다.
- `/linear-project-loop`는 Linear 프로젝트를 읽고 ***목표·접근 방식이 담긴 문서와, 진척을 측정할 대시보드·쿼리부터 확인***한다. 빠진 요소(문서·대시보드)는 에이전트가 혼자 만들지 않고 사용자와 함께 만든다.
- 지표와 이슈 상태를 검토해 새로 필요한 작업을 티켓으로 추가하고, 진행 가능한 작업의 PR을 쓰거나 수정하고, 리뷰 요청과 확인 질문을 던진 뒤 다음 작업으로 넘어가는 루프를 돈다.
- Linear를 프로젝트 상태의 단일 소스로, Datadog MCP·Snowflake를 지표 소스로 삼는 ***오케스트레이션된 하네스***에 의존한다. 지금은 로컬에서 직접 돌리지만, Stripe의 "Minions" 시스템에서 착안한 Imprint 내부 오케스트레이터 "Agent Fleet"로 옮길 계획이다.
- 패스키 도입률 급등이나 에러율 변화처럼 출시 후에 나타나는 문제를 개별 티켓 단위 에이전트는 못 잡지만, 지표를 계속 들여다보는 이 루프는 잡아낸다.
- 가장 인상적인 지점은 ***사람이 머릿속에만 갖고 있던 목표와 측정 기준을 전부 공유 가능한 형태로 꺼내야 했다***는 것 — Larson은 이 패턴이 자신이 평소 일하던 방식과 닮아 있으면서도, 자신이 프로젝트 상태를 몰래 혼자 쥐고 있던 지점들을 들춰냈다고 돌이켰다.

## 인상 깊은 문장

> "the factory pattern parallels very closely how I've been working locally, while forcing me to recognize the places where I was accidentally hoarding parts of the state for myself regarding the goals of the project." (WebSearch로 교차확인한 2차 인용. 원문 전체 문단 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. 2차 신디케이션 미러에서도 댓글 섹션은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "다크 팩토리" 경고와 정면으로 겹치는 지점

[[2026-07-24-software-factories-light-and-dark]]는 자율성은 "값싸게 검증 가능한 범위까지만" 줘야 한다고 경고했다. Larson의 `/linear-project-loop`는 정확히 그 경계선 위에 있다 — 티켓 추가·PR 작성까지는 자동화하지만, 빠진 문서·대시보드는 "사용자와 함께 만든다"고 명시해 검증 불가능한 영역(목표 자체의 정의)은 사람에게 남겨뒀다. 백프레셔를 실제로 설계한 사례로 읽힌다.

### 핵심 전이 2 — "하네스가 좋아도 무인 공장은 안 된다"는 반증 사례일 수도

[[2026-07-25-why-software-factories-fail]]은 모델의 RL이 초 단위 보상(테스트 통과)만 최적화하고 유지보수성 훼손엔 패널티가 없어 10~100배가 아니라 2~3배가 현실이라고 못 박았다. Larson의 글에는 생산성 배수 주장이 없다 — 대신 "내가 숨기고 있던 상태를 드러냈다"는, 더 겸손하고 조직적인 효과를 보고한다. 과장된 배수 대신 가시성 확보를 1차 효과로 꼽은 점에서 이 비판을 우회하는 실천처럼 보인다.

### 핵심 전이 3 — "더 많은 프롬프트가 아니라 제어 흐름"의 실제 구현

[[2026-05-09-agents-need-control-flow]]가 주장한 "에이전트에겐 프롬프트보다 제어 흐름이 필요하다"를, `/linear-project-loop`는 슬래시커맨드로 만든 명시적 루프(목표 확인 → 지표 검토 → 작업 선정 → PR → 리뷰 요청 → 다음 작업)로 구체화한 사례다.

## 호스피탈리티 / CRS 적용 포인트

온다의 CRS 백로그에도 "개별 티켓"이 아니라 "이번 분기 목표 + 측정 지표"를 에이전트가 먼저 읽게 하는 구조를 적용할 여지가 있다. 다만 전제 조건이 있다 — Larson의 사례는 Linear·Datadog·Snowflake가 이미 신뢰할 수 있는 단일 소스로 정리돼 있었기에 가능했다. CRS 쪽은 숙소별 지표·이슈 상태가 아직 여러 시스템에 흩어져 있다면, 팩토리 패턴보다 먼저 "측정 기준을 공유 가능한 형태로 꺼내는 작업"이 선행돼야 한다는 원칙만 가져온다.

## 연관 자료

- [[2026-07-24-software-factories-light-and-dark]] — 자율성에 백프레셔를 걸어야 한다는 원칙이 `/linear-project-loop`의 설계(사용자와 함께 빠진 문서 만들기)에 실제로 반영된 사례.
- [[2026-07-25-why-software-factories-fail]] — 무인 공장의 한계를 지적한 비판과, 더 겸손한 효과(가시성)를 보고한 Larson의 실천을 대조.
- [[2026-05-09-agents-need-control-flow]] — "프롬프트보다 제어 흐름"이라는 주장의 구체적 구현 사례.

## 한 달 뒤 회고

*(2026-11-07 즈음) Larson이 실제로 "Agent Fleet"으로 옮겼는지, 그리고 이 패턴이 Imprint 바깥에서도 재현되는 사례가 더 나왔는지 확인한다.*
