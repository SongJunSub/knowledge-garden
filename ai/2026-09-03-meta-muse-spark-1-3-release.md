---
title: "Muse Spark 1.3 공개 (Meta) — 긴 에이전트 작업의 지구력을 개선, 이전 버전 대비 도구 호출 약 20%·토큰 약 25% 감소"
source_title: "Meta Launches Muse Spark 1.3, Citing Gains in Coding and Agentic Tasks"
source_url: "https://www.unite.ai/meta-launches-muse-spark-1-3-citing-gains-in-coding-and-agentic-tasks/"
source_name: "Unite.AI"
referrer_url: "https://news.hada.io/topic?id=33166"
published_at: "2026-09-02"
summarized_at: "2026-09-03"
category: "ai"
tags: ["meta", "muse-spark", "coding-agent", "long-horizon-tasks", "model-release"]
---

# Muse Spark 1.3 공개 (Meta) — 긴 에이전트 작업의 지구력을 개선, 이전 버전 대비 도구 호출 약 20%·토큰 약 25% 감소

> 출처: [Meta Launches Muse Spark 1.3, Citing Gains in Coding and Agentic Tasks](https://www.unite.ai/meta-launches-muse-spark-1-3-citing-gains-in-coding-and-agentic-tasks/) (Unite.AI) · GeekNews(id=33166) 경유 · 정리일 2026-09-03

## 한 줄 요약

**Meta가 긴 에이전트 작업·코딩 효율을 개선한 Muse Spark 1.3을 Muse Code와 Meta Model API에 동시 공개했다. 하나의 긴 대화에서 여러 작업과 이전 결과를 추적하고 계획의 빈틈을 스스로 보완하도록 훈련됐으며, 모호한 요청에는 추가 질문을 하고, Meta 내부 비교에서 도구 호출은 약 20%, 토큰은 약 25% 줄었다.**

## 핵심 포인트

- **긴 호라이즌 작업 지속 능력** — 하나의 긴 대화에서 여러 작업과 이전 결과를 추적하며 서로 충돌하는 정보를 정리하고 계획의 빈틈을 스스로 보완하도록 훈련. 개방형 목표가 주어지면 지저분하고 상충하는 소스 전반에서 스스로 맥락을 만들어낸다.
- **사용자와의 협업 능력 강화** — 모호한 요청에는 추가 질문을 하고 막히면 도움을 요청하며, 되돌리기 어려운 작업은 실행 전에 확인하는 등 사용자와의 협업 능력이 강화됨.
- **효율 개선** — Muse Spark 1.2 대비 불필요한 대화와 장황한 출력을 줄였고, Meta 내부 비교에서 도구 호출은 약 20%, 토큰은 약 25% 감소하며 체감상 더 빠르고 효율적.
- **동시 출시** — 2026년 9월 2일, Muse Code와 Meta Model API에 동시 공개.

## 인상 깊은 문장

> "When given an open-ended objective, the model uses tools to generate its own context across messy and conflicting sources." (Meta 발표 인용)

## 댓글

**출처 한계 부분적.** news.hada.io는 접속 차단. WebSearch로 Unite.AI, Neowin, fonearena 등 복수 매체와 Meta 공식 X 계정(AI at Meta)의 발표 스니펫을 교차확인했다. 핵심 수치(도구 호출 20%↓, 토큰 25%↓)는 Meta 자체 내부 비교 결과라는 점을 명시해둔다(독립 벤치마크 아님). GeekNews 댓글 수는 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "되돌리기 어려운 작업은 확인 후 실행"은 이번 배치에서 세 번째 등장하는 원칙

[[2026-09-03-claude-commerce-agents-blueprint]]의 "판매자 쓰기는 전부 승인 대기", [[2026-09-03-claude-code-week34-changelog]]의 파괴적 작업 확인 유지 설계와 함께, Muse Spark 1.3도 같은 원칙을 채택했다 — **되돌릴 수 없는 작업 전 확인**이 이제 벤더를 가리지 않는 업계 표준 안전 설계로 자리 잡고 있다는 걸 같은 날 세 개의 다른 소스에서 확인한 셈이다.

### 핵심 전이 2 — 효율 개선(토큰·도구 호출 감소)은 [[2026-09-03-zg-zvec-grep-local-search-infra]]와 같은 방향의 다른 접근

zg가 검색 인프라 층위에서 도구 호출·토큰을 줄였다면, Muse Spark 1.3은 모델 자체의 훈련으로 같은 목표(불필요한 대화·장황한 출력 축소)를 달성한다 — **모델 층위 최적화와 도구 층위 최적화가 병행되고 있다.**

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이다 — 온다가 Claude 생태계 중심이라면 Muse Spark는 직접 사용 대상이 아니지만, "긴 대화에서 여러 작업을 추적하고 빈틈을 스스로 보완하는" 설계 방향 자체는 CRS의 장기 실행 에이전트(재고 관리, 요금 최적화 등 여러 턴에 걸친 작업)를 설계할 때 참고할 만한 벤치마크 대상이다. 경쟁 모델의 발전 속도를 추적해 Claude 대비 상대적 위치를 가늠하는 용도로 남긴다.

## 연관 자료
- [[2026-09-03-claude-commerce-agents-blueprint]] — *"되돌리기 어려운 작업은 승인/확인 후 실행"이라는 같은 안전 설계 원칙*
- [[2026-09-03-claude-code-week34-changelog]] — *같은 원칙의 Claude Code 버전(파괴적 작업 확인 유지)*
- [[2026-09-03-zg-zvec-grep-local-search-infra]] — *도구 호출·토큰 절감이라는 같은 목표의 다른 접근(검색 인프라 vs 모델 훈련)*

## 한 달 뒤 회고
*(2026-10-03 즈음 — Muse Spark 1.3의 실제 사용자 벤치마크(비-Meta 출처)가 나왔는지, Claude 계열 모델과의 상대적 위치를 재확인했는지 기록.)*
