---
title: "Running a Software Factory Efficiently at Uber Scale (Uday Kiran Medisetty) — PR 70%는 에이전트 몫인데 4월 이후 지출은 그대로다"
source_title: "Running a Software Factory Efficiently at Uber Scale"
source_url: "https://www.uber.com/us/en/blog/efficient-software-factory/"
source_name: "Uber Engineering Blog"
referrer_url: "https://news.hada.io/topic?id=33141"
published_at: "2026-08-27"
summarized_at: "2026-09-02"
category: "ai"
tags: ["uber", "agentic-coding", "model-selection", "pareto-optimal", "cost-optimization", "prompt-caching", "context-management", "agent-harness", "subagent"]
---

# Running a Software Factory Efficiently at Uber Scale (Uday Kiran Medisetty)

> 출처: [Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/) (Uday Kiran Medisetty, Uber Distinguished Engineer · 2026-08-27) · 레퍼러: GeekNews(33141) · 정리일 2026-09-02
> **출처 확보 한계**: news.hada.io·uber.com 등 시도한 도메인이 전부 egress 차단. 원문을 직접 읽지 못했고, 2차 매체 다수를 WebSearch 스니펫으로 교차검증해 재구성했다. 핵심 수치는 여러 독립 소스에서 일치해 신뢰도가 있지만, 인상 깊은 문장의 인용은 원문 verbatim 대조는 못 했다.

## 한 줄 요약

**Uber는 로컬·클라우드 에이전트에 PR의 70% 이상을 귀속시키고 3,600개+ 에이전트 스킬을 하루 3만 회 이상 실행하는 규모까지 왔지만, 2026년 2~8월 주간 사용자 7배·에이전트 요청 9.4배 증가에도 4월 이후 총 AI 지출을 거의 안정시켰다** — 비결은 모델 자체의 발전을 기다리는 게 아니라, 관리형 에이전트마다 실작업 벤치마크를 만들어 비용/품질/신뢰성의 Pareto 최적 모델을 고르고, 주 모델은 작업 분해·평가만 맡고 범위가 명확한 서브태스크는 기본적으로 더 저렴한 모델에 위임하며, 컨텍스트 상한·추론 강도·캐시 TTL을 실사용 패턴에 맞춰 촘촘히 튜닝하는 전방위 운영 최적화였다.

## 핵심 포인트

- **규모와 표현의 정직한 경계** — "PR의 70%+가 로컬·클라우드 에이전트 귀속"은 사람 리뷰·에스컬레이션을 전제로 한 측정치이지, 완전 자율 배포를 뜻하지 않는다.
- **급성장에도 지출 안정** — 주간 활성 사용자 7배, 주간 에이전트 요청 9.4배 증가했는데 4월 이후 총 AI 지출은 비교적 평평하게 유지됐다.
- **Pareto 최적 모델 선택 방법론** — 관리형 에이전트마다 실제 작업 벤치마크를 만들고, 작업당 완료 비용·품질·신뢰성 세 축에서 파레토 효율적인 모델로 지속적으로 옮겨간다.
- **주 모델 vs 서브에이전트 역할 분리** — 서브에이전트 작업은 대개 프런티어급 추론이 필요 없으므로 기본값을 더 저렴한 모델로 두는 것이 가장 임팩트가 큰 단일 레버였다.
- **컨텍스트·추론 기본값 튜닝** — 400K 토큰 컨텍스트 상한과 Medium 추론 강도를 기본값으로 설정, MCP 도구 스키마를 필요한 시점에 리졸브.
- **프롬프트 캐싱 TTL을 실사용 패턴에 맞춤** — 대화형 세션은 캐시 TTL을 1시간으로 늘리고 서브에이전트는 5분을 유지.

## 인상 깊은 문장

> (2차 매체 교차 재구성) "관리형 에이전트마다 실작업에서 뽑은 벤치마크를 만들고, 어떤 모델이든 하나의 인터페이스 뒤에서 서비스하는 하네스 위에서 돌려, 비용·품질·신뢰성 기준으로 파레토 최적인 모델로 옮겨간다."

## 댓글

**GeekNews 댓글 수는 확인하지 못했다.** 이 특정 포스트를 다루는 HN/Lobsters 전용 스레드는 찾지 못했다(인접 시기 다른 Uber AI 기사의 스레드들만 발견, 별개 기사라 직접 인용하지 않는다). **출처 한계를 강조**: Uber 자사 엔지니어링 블로그라는 성격상 성공 서사 위주로 쓰였을 가능성(홍보 편향)을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — 5월 COO 발언에 대한 3개월 뒤의 부분적 반박, 그러나 완전하지는 않음

[[2026-05-26-uber-coo-ai-token-spending-hard-to-justify]]에서 Uber COO는 "AI 토큰 지출과 유용한 기능 증가 사이의 연결고리가 아직 없다"고 밝혔다. 3개월 뒤 이번 블로그는 "지출이 안정됐다"는 수치로 그 우려의 절반(비용 통제)에만 답한다. PR 귀속률·스킬 실행 횟수는 여전히 산출물 지표지, "유용한 기능으로 이어지는 연결고리"라는 가치 지표가 아니다.

### 핵심 전이 2 — Agentic Awakening의 Part I 처방을 실제 규모로 구현한 사례, 그러나 여전히 산출물 지표

[[2026-08-31-agentic-awakening-10x-coding-org-productivity-gap]]이 요구한 결과 중심 측정 체계와 전담 AI Ops 인프라를, 이번 Uber 사례는 대기업 규모로 구현한 실물이다. 다만 토대는 갖췄지만 그 토대가 25~30%의 벽을 넘었는지는 이 글만으로 판단할 수 없다.

### 핵심 전이 3 — "Agent = Model + Harness" 명제의 기업 규모 실증

[[2026-04-28-agent-harness-engineering]]의 명제를, 이번 글은 정확히 기업 인프라 스케일로 보여준다.

## 호스피탈리티 / CRS 적용 포인트

① 워크로드별 모델 라우팅 — 범위가 명확한 반복 작업은 저렴한 모델에, 아키텍처 판단이나 리뷰는 상위 모델에 맡기는 이분법을 가져올 수 있다. ② 캐시 TTL을 실제 작업 패턴에 맞추기 — 인터랙티브 세션과 배치성 세션을 구분해 캐시 운용을 설계. ③ 정직하게 갈라야 할 지점 — "PR 귀속률" 같은 산출물 지표만으로 성공을 말하지 말고 "배포된 가치" 지표를 병행 측정해야 한다는 반면교사로 이 글을 읽는 게 유용하다.

## 연관 자료

- [[2026-05-26-uber-coo-ai-token-spending-hard-to-justify]] — 같은 회사의 5월 COO 발언에 대한 3개월 뒤 엔지니어링팀의 비용 축 답변
- [[2026-08-31-agentic-awakening-10x-coding-org-productivity-gap]] — 격차의 처방을 대기업 규모로 구현한 실물 사례
- [[2026-04-28-agent-harness-engineering]] — "Agent = Model + Harness" 명제를 기업 인프라 스케일에서 보여주는 실증

## 한 달 뒤 회고

*(2026-10-02 즈음 — 원문 접속이 가능해지면 직접 대조해 이 노트의 2차 재구성 내용을 검증. Uber가 후속 글에서 "배포된 가치" 지표를 공개하는지 확인.)*
