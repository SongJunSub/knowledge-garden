---
title: "Rebalancer (Meta) — 9년간 내부에서 하루 4천만 건의 배치 문제를 풀어온 뒤에야 공개된, 문제 정의와 솔버를 분리한 할당 최적화 라이브러리"
source_title: "Rebalancer: an open-source library for solving assignment problems at scale"
source_url: "https://news.hada.io/topic?id=35320"
source_name: "Meta Engineering (github.com/facebook/rebalancer)"
referrer_url: "https://news.hada.io/topic?id=35320"
summarized_at: "2026-10-14"
category: "architecture"
tags: ["rebalancer", "meta", "optimization", "assignment-problem", "mixed-integer-programming", "local-search", "capacity-planning", "open-source"]
---

# Rebalancer (Meta) — 복잡한 제약 조건에 맞춰 작업과 자원을 배치하는 최적화 도구

> 출처: [GeekNews 토픽](https://news.hada.io/topic?id=35320) · 교차확인: [Meta AI Open-Sources Rebalancer (marktechpost.com)](https://www.marktechpost.com/2026/10/06/meta-ai-open-sources-rebalancer-a-c-assignment-solver-that-runs-about-40-million-placement-problems-a-day/), [alphasignal.ai](https://alphasignal.ai/news/meta-opens-rebalancer-solving-40-million-daily-infrastructure-problems) · 정리일 2026-10-14

> **출처 한계**: `news.hada.io`가 이 세션에서 `ENOTFOUND`로 전면 차단돼 GeekNews 원문(hada 댓글 수·큐레이션)은 확인하지 못했다. 대신 WebSearch로 **marktechpost.com, alphasignal.ai, aiwiki.ai 등 복수의 2차 매체**가 핵심 수치(하루 4천만 건, 265,000개 객체·3,200개 bin을 12초에 처리, Apache 2.0 라이선스, OSDI 2024 논문 기반)를 일관되게 보도하는 걸 확인해 신뢰도는 비교적 높다고 판단했다. 다만 **발표 날짜가 매체마다 9/21과 10/5~6으로 엇갈리고**(Meta 엔지니어링 포스트 원문을 직접 대조하지 못해 확정 못함), Slack 발췌의 "25개 이상의 목표·제약 조건" 표현은 WebSearch로 정확히 교차확인하지 못했다(2차 매체는 "30개 이상의 문제 유형(formulation)"이라고만 전한다 — 이는 "제약 조건 개수"와는 다른 개념일 수 있어 혼동하지 않도록 구분해 둔다).

## 한 줄 요약

**Meta가 9년간 내부에서 하루 약 4천만 건의 배치(할당) 문제 — 서버에 작업 배치, 샤드 분산, 트래픽 라우팅 등 — 를 풀어온 라이브러리 Rebalancer를 오픈소스로 공개했다. 핵심 설계는 "문제를 무엇으로 정의할지"와 "어떻게 풀지"를 분리한 것이다 — 같은 문제 정의를 정확한 해를 보장하는 혼합정수계획법(MIP) 솔버에도, 전체 최적해는 보장 못하지만 대규모 문제에 적합한 지역 탐색(local search) 엔진에도 그대로 흘려보낼 수 있다. Meta의 대규모 문제 대부분은 후자로 처리되며, 99퍼센타일 기준 265,000개 객체·3,200개 bin 문제를 12초 만에 푼다.**

## 핵심 포인트

- **9년간 내부 검증 후 공개** — WebSearch 교차확인에 따르면 Meta는 이 라이브러리를 ***9년 넘게*** 내부에서 서버 배치, 작업 스케줄링, 트래픽 라우팅에 써왔다. 하루 약 ***4천만 건***의 할당 문제를 ***30개 이상의 문제 유형(formulation)***에 걸쳐 처리한다는 게 2차 매체의 보도다.
- **문제 정의와 솔버의 분리** — 공유 모델링 레이어가 문제 명세를 받아, 이를 ①정확한 해를 보장하는 혼합정수계획법(MIP) 솔버(HiGHS·Gurobi·FICO Xpress 중 선택 가능) 또는 ②병렬화된 지역 탐색(local search) 엔진 중 어느 쪽으로도 넘길 수 있게 설계됐다. 작은 모델로 정의를 검증한 뒤 같은 정의를 그대로 확장(scale up)할 수 있다는 게 핵심 이점이다.
- **지역 탐색 — 속도와 규모, 최적성의 트레이드오프** — Slack 발췌대로 지역 탐색은 대상을 옮기거나 교환하며 배치를 점진 개선하는 방식으로, ***대규모 문제에 적합하지만 전체 최적해는 보장하지 않는다.*** Meta의 대규모 문제 대부분이 이 방식으로 처리된다는 게 과업 지시 Slack 발췌와 2차 매체 보도가 일치하는 지점이다.
- **구체적 성능 수치** — 2차 매체에 따르면 ***99퍼센타일 기준 265,000개 객체·3,200개 bin 문제를 12초***에 푼다. Meta 자신도 이 수치가 "자사 워크로드 기준이며 임의의 모델에 대한 보장된 실행시간은 아니"라고 못박았다고 전해진다 — **벤치마크의 한계를 스스로 명시한 드문 사례**다.
- **연구적 뿌리와 공개 형태** — 설계는 OSDI 2024 논문 "Optimizing Resource Allocation in Hyperscale Datacenters"에 기반하며, 이 논문은 문제를 ①사용성(정책을 수식으로 번역하기 어려움) ②확장성(NP-난해 문제라 상용 솔버가 버거움)이라는 두 장벽으로 프레이밍했다고 한다. 라이브러리는 Apache 2.0 라이선스로 GitHub·PyPI(v1.0.4, Python 3.12+)를 통해 배포되며, 디버깅 인터페이스 Rebalancer Explorer도 함께 공개됐다(단, PyPI 분류상 아직 Alpha 단계).

## 인상 깊은 문장

> WebSearch 교차확인(marktechpost.com): "Meta has open-sourced Rebalancer, a library it has used internally for over nine years to solve assignment problems... Its 99th-percentile solve time is 12 seconds for a problem with 265,000 objects and 3,200 bins."

> Slack 발췌: "지역 탐색은 대상을 옮기거나 교환하며 배치를 개선하고, 대규모 문제에 적합하지만 전체 최적해는 보장하지 않는다 - Meta의 대규모 문제 대부분은 이 방식으로 처리함"

## 댓글

GeekNews 원문 접근 실패로 **hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인 불가.** 다만 WebSearch로 찾은 2차 매체 3곳(marktechpost, alphasignal, aiwiki)의 핵심 수치가 서로 일치해 교차확인 신뢰도는 준수하다. 벤더(Meta) 자체 발표라는 점, 그리고 "40만 건" 같은 규모 수치는 Meta 내부 워크로드 기준이라 일반 조직의 할당 문제 규모와는 거리가 멀 수 있다는 점은 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "자사 인프라에서 충분히 검증한 뒤 공개한다"는 신뢰 구축 패턴의 또 다른 사례

[[2026-10-01-google-gemini-4-argon]]에서 정리했던 핵심 전이는 "Google이 신모델을 자사 데이터센터 메모리 최적화·Rust 전환에 먼저 투입해 ROI를 증명한 뒤 외부에 공개한다"는 **선내부검증 후공개(dogfooding) 패턴**이었다. Rebalancer는 같은 패턴의 훨씬 긴 버전이다 — Google의 사례가 "공개 전 수개월"이었다면, Meta는 ***9년***간 내부에서 하루 4천만 건을 처리하며 검증한 뒤에야 공개했다. 오픈소스 인프라 도구에서 "내부에서 얼마나 오래, 얼마나 큰 규모로 실전 사용됐는가"가 신뢰도의 가장 강력한 신호라는 걸 다시 확인시켜주는 사례다.

### 핵심 전이 2 — "문제 정의를 명시하면 솔버를 자유롭게 바꿀 수 있다"는 것도 "제약을 명시하면 보증이 생긴다"의 한 형태

[[2026-08-18-flex-modules-agents-read-less]]가 짚은 패턴 — ***"제약을 명시적으로 만들면 보증이 생기고, 그 보증이 기계가 검사할 수 있는 것이 된다"*** — 는 Rebalancer의 설계와도 겹친다. Rebalancer가 "문제 정의(목표·제약)"와 "풀이 방법(MIP냐 지역 탐색이냐)"을 분리한 건, **명세를 명시적으로 고정하면 구현(솔버)을 자유롭게 교체할 수 있다**는 동일한 원리다. 다른 건 수혜자인데, flex의 사례는 "에이전트가 덜 읽어도 되게" 하는 게 목적이었다면, Rebalancer는 "같은 문제를 작은 규모로 검증하고 큰 규모로 그대로 확장"하는 게 목적이다 — **명시적 선언이 주는 이득이 맥락마다 다른 형태로 나타난다**는 공통 패턴.

## 호스피탈리티 / CRS 적용 포인트

**원칙은 가져올 만하지만, 직접 도입은 온다의 현재 규모엔 과분하다.** 하루 4천만 건 규모의 할당 문제를 푸는 라이브러리는 온다 같은 B2B CRS(예약·재고·채널 동기화)의 현재 스케일에는 과도한 도구다. 다만 전이 가능한 원칙 둘은 남는다 — ① **객실 재고 배분, 채널별 노출 우선순위 조정 같은 다목표 제약 문제를 수식으로 직접 짜지 말고, "목표와 제약을 선언하는 계층"과 "실제로 푸는 솔버"를 분리해 설계**해두면 나중에 문제 규모가 커져도 솔버만 교체하면 된다는 설계 원칙 ② **"전체 최적해가 필요한가, 빠른 근사해로 충분한가"를 먼저 구분**하는 것 — 예약 배정처럼 실시간성이 중요한 문제는 지역 탐색식 근사해가, 월간 정산처럼 한 번에 정확히 풀면 되는 문제는 MIP식 정확해가 맞는 식으로 문제 성격에 따라 트레이드오프를 의식적으로 고르는 습관.

## 연관 자료

- [[2026-10-01-google-gemini-4-argon]] — "자사 인프라에서 먼저 검증한 뒤 공개한다"는 같은 신뢰 구축 패턴의 더 짧은 버전
- [[2026-08-18-flex-modules-agents-read-less]] — "제약을 명시하면 보증이 생긴다"는 같은 형태의 원칙이 다른 맥락(에이전트 읽기 범위)에 적용된 사례

## 한 달 뒤 회고

*(2026-11-14 즈음 — GeekNews 원문·Meta 엔지니어링 공식 포스트에 접근 가능해지면 발표 날짜(9/21 vs 10/5~6)와 "25개 이상의 목표·제약 조건" 표현의 정확한 의미를 확인하고, 온다의 재고·채널 배분 로직 중 "문제 정의와 솔버를 분리"하면 이득이 될 후보가 있는지 점검.)*
