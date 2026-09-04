---
title: "K2 Horizon, 학습 전 과정을 공개하는 6개 AI 모델 제품군 (IFM) — 최종 가중치가 아니라 데이터·코드·체크포인트·로그까지 공개해 '능력이 만들어지는 과정'을 추적 가능하게 한다"
source_title: "Introducing K2 Horizon: Frontier Performance, Radically Open"
source_url: "https://ifm.ai/blog/k2"
source_name: "ifm.ai"
referrer_url: "https://news.hada.io/topic?id=33208"
published_at: "2026-09-03"
summarized_at: "2026-09-04"
category: "ai"
tags: ["k2-horizon", "ifm", "open-weight", "open-source-ai", "moe", "reproducibility"]
---

# K2 Horizon, 학습 전 과정을 공개하는 6개 AI 모델 제품군 (IFM)

> 출처: [Introducing K2 Horizon: Frontier Performance, Radically Open](https://ifm.ai/blog/k2) (Institute of Foundation Models) · 정리일 2026-09-04

## 한 줄 요약

**IFM(Institute of Foundation Models)이 0.9B부터 375B-A23B까지 6개 모델을 공개해 웨어러블·스마트폰부터 로컬 워크스테이션·기업 서버까지 하나의 제품군으로 연결했다. 단순히 최종 가중치만 내놓는 게 아니라 학습 데이터 또는 구축법, 코드, 설정, 중간 체크포인트, 로그와 평가 결과까지 공개해 "능력이 어떻게 만들어졌는가"의 과정 전체를 추적할 수 있게 한다는 점이 이번 릴리스의 핵심 차별점이다.**

## 핵심 포인트

- **6개 모델, 하나의 제품군** — 0.9B / 3.7B / 7B / 32B(dense) / 36B-A4B(MoE) / 375B-A23B(MoE)까지, ***웨어러블·스마트폰·로컬 워크스테이션·기업 서버***를 하나의 스펙트럼으로 연결한다.
- **가중치를 넘어선 전면 공개** — 최종 가중치뿐 아니라 ***학습 데이터(또는 구축법), 코드, 설정, 중간 체크포인트, 학습 로그, 평가 결과***까지 Apache 2.0으로 공개해, 역량이 만들어지는 과정을 재현·검증할 수 있게 한다.
- **크기별 SOTA** — 자체 평가에서 0.9B·3.7B·7B는 각 크기 등급에서 최고 수준 결과를 기록했으며, 추론·수학·코딩·도구 사용·에이전트 작업을 모델 크기에 맞춰 지원한다.
- **새 아키텍처 도입** — 36B-A4B는 새로운 MoVA·MoE 구조를 사용한다(Slack 발췌가 여기서 끊김, 세부 구조는 원문 확인 필요).

## 인상 깊은 문장

> "최종 가중치만 제공하는 데 그치지 않고 학습 데이터 또는 구축법, 코드, 설정, 중간 체크포인트, 로그와 평가 결과를 공개해 역량이 만들어지는 과정을 추적할 수 있음" (Slack 발췌 요약)

## 댓글

**출처 한계 명시.** `news.hada.io`와 `ifm.ai` 모두 이 세션에서 WebFetch가 egress 프록시에 차단됐다. WebSearch로 hpcwire.com(AIwire/BigDATAwire), datastudios.org, ai-tldr.dev, neomanex.com 등 ***복수의 독립 매체가 같은 스펙(6개 모델, 0.9B~375B, Apache 2.0, 전 과정 공개)을 교차 보도***해 핵심 사실관계는 신뢰도 높게 확인했다. 다만 GeekNews 댓글 수·HN/Lobsters 큐레이션 여부, 그리고 Slack 발췌 이후 끊긴 "새로운 MoVA와 MoE 구조" 세부 내용은 확인하지 못했다. IFM(Institute of Foundation Models)이라는 조직 자체의 배경(어느 회사·컨소시엄인지)도 이번 검색으로 명확히 특정하지 못해 정직하게 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "지능을 소유하라"는 전략의 실물 사례

같은 날 정리한 [[2026-09-04-own-your-intelligence-sovereign-ai-guide]]는 "지능 계층의 소유권"이 AI 제품 경쟁의 새 축이 됐다고 진단했다. K2 Horizon처럼 ***학습 데이터·코드·체크포인트까지 재현 가능하게 공개하는 모델***은 그 소유권 경쟁에서 "빌리는" 게 아니라 "소유하는" 선택지를 실제로 제공한다는 점에서, 전략과 실물이 같은 날 만나는 흐름이다.

### 핵심 전이 2 — 오픈 웨이트 공개 계열의 최신 사례

[[2026-08-29-glm-5-3-open-weights-release]], [[2026-08-02-kimi-k3-huggingface-release]]와 같은 계열의 오픈 웨이트 공개 흐름이지만, K2 Horizon은 ***가중치 공개를 넘어 학습 데이터·중간 체크포인트·로그까지 공개***한다는 점에서 한 단계 더 나아간 개방성을 보여준다. GLM·Kimi가 "결과"를 공개했다면 K2 Horizon은 "과정"까지 공개하는 셈이다.

### 핵심 전이 3 — "능력 격차가 좁혀졌다"는 관찰의 최신 데이터 포인트

[[2026-07-18-state-of-open-source-ai-2026-mozilla]]는 "오픈웨이트가 능력에서 폐쇄형과 평균 3.3%까지 좁혔다"고 짚었다. 0.9B·3.7B·7B가 각 크기 등급에서 SOTA를 기록했다는 이번 발표는 그 좁혀진 격차가 ***소형 모델 구간에서 특히 두드러진다는 최신 증거***로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**부분적으로 적용 가능하다.** 온다가 다루는 CRS 워크로드 중 채팅 의도 분류, 간단한 규칙 기반 자동화, 온프레미스 요구가 있는 고객사向 배포처럼 ***저지연·로컬 실행이 필요한 영역***이라면 0.9B~7B급 K2 Horizon 모델이 실질적 후보가 될 수 있다. 특히 학습 데이터와 과정이 공개된다는 점은, 고객사에 "이 모델이 어떤 데이터로 학습됐는지" 설명해야 하는 B2B 컴플라이언스 요구에도 유리하다. 다만 실제 벤치마크·서빙 비용 검증 없이 도입을 판단하긴 이르다.

## 연관 자료
- [[2026-09-04-own-your-intelligence-sovereign-ai-guide]] — *"지능 소유" 전략의 실물 사례, 같은 날 같은 흐름*
- [[2026-08-29-glm-5-3-open-weights-release]] — *오픈 웨이트 공개 계열, 최종 가중치 공개 수준*
- [[2026-08-02-kimi-k3-huggingface-release]] — *오픈 웨이트 공개 계열, 프론티어급 모델 카드 공개*
- [[2026-07-18-state-of-open-source-ai-2026-mozilla]] — *"오픈웨이트가 폐쇄형과 격차를 좁혔다"는 관찰의 최신 데이터 포인트*

## 한 달 뒤 회고
*(2026-10-04 즈음 — ifm.ai 원문 접근이 가능해지면 MoVA 구조 세부와 IFM 조직 배경을 보완했는지, 0.9B~7B급 모델이 실제 CRS 워크로드 벤치마크에서 검증됐는지 기록.)*
