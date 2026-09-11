---
title: "Cognition, 코딩 모델 SWE-2 출시 (Cognition 공식 블로그) — 'Fable 5.1급'이라는 주장은 자기가 앞서는 벤치마크 하나에서만 참이고, 장기 에이전트 작업(Terminal-Bench 4.0)에서는 격차가 그대로 남아 있다"
source_title: "Introducing SWE-2: Pushing the Pareto Frontier"
source_url: "https://cognition.com/blog/swe-2"
source_name: "Cognition 공식 블로그(cognition.com)"
referrer_url: "https://news.hada.io/topic?id=33494"
published_at: "2026-09-10"
summarized_at: "2026-09-11"
category: "ai"
tags: ["cognition", "devin", "coding-agent", "model-release", "benchmark", "reinforcement-learning", "cost-performance"]
---

# Cognition, 코딩 모델 SWE-2 출시 (Cognition 공식 블로그)

> 출처: [Introducing SWE-2: Pushing the Pareto Frontier](https://cognition.com/blog/swe-2) (Cognition 공식 블로그) · GeekNews(id=33494) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`·`cognition.com` 모두 이번 세션 egress 정책으로 직접 열람하지 못했다(WebFetch `EGRESS_BLOCKED`). 아래 벤치마크 수치는 WebSearch로 확보한 alphasignal.ai·officechai·startupfortune 등 2차 보도와, HN 스레드(news.ycombinator.com/item?id=49645443, id=49646778)에 대한 WebSearch 요약을 교차 확인한 것이다 — Cognition 공식 발표문 원문을 직접 인용하지는 못했다. GeekNews(id=33494) hada 댓글 수는 확인하지 못했다.

## 한 줄 요약

**Cognition이 Moonshot AI의 2.8조 파라미터 모델 Kimi K3를 강화학습으로 추가 학습한 코딩 모델 SWE-2를 공개했다.** 자체 발표 기준 FrontierCode 1.1 Main에서 Fable 5.1(Anthropic)과 0.9%p 차이인 50.0%를 기록하면서 비용은 64% 낮췄다고 주장한다. 하지만 **이 "프론티어급" 주장은 Cognition이 앞서는 벤치마크(FrontierCode) 하나에 국한된 이야기이고, 장기 에이전트 작업을 측정하는 Terminal-Bench 4.0에서는 SWE-2가 27.3점으로 Fable 5.1(55.8)·GPT-6 Astra(57.9)에 큰 격차로 뒤처진다** — HN 커뮤니티도 발표 직후 이 선택적 비교를 정확히 짚었다.

## 핵심 포인트

- **베이스 모델과 학습 방식** — 2.8조 파라미터 Kimi K3(이미 에이전틱 코딩에 대규모 RL을 거친 모델)를 Cognition이 추가 강화학습했다. 핵심 기법은 medium·high·max **세 가지 추론 강도(effort level)를 한 번의 RL로 동시에 학습**하는 것 — 각 강도별 비용 페널티를 그 강도가 위치한 Pareto 프론티어의 국소 기울기에 맞춰 튜닝해, 프론티어 곡선 전체를 한꺼번에 밀어올리는 방식이다(한 지점만 개선하는 게 아니라).
- **FrontierCode 1.1 Main** — SWE-2 **50.0%**, Fable 5.1 **50.9%**, GPT-6 Astra **53.3%**. Cognition이 강조하는 지표에서 SWE-2는 Fable 5.1과 0.9%p 차이에 불과하다고 주장하고, 비용은 **64% 낮다**고 발표했다.
- **Terminal-Bench 2.1 vs 4.0에서 갈리는 그림** — Terminal-Bench 2.1에서는 SWE-2가 92.8점으로 강세를 보이지만, 더 최신·장기 에이전트 작업을 측정하는 **Terminal-Bench 4.0에서는 27.3점**에 그쳐 Fable 5.1(55.8)·GPT-6 Astra(57.9)·DeepSeek V4.1 Flash(31.2)에마저 밀린다. "프론티어급"이라는 헤드라인 주장이 벤치마크 선택에 크게 의존한다는 걸 이 격차가 보여준다.
- **효율 개선(medium 설정)** — SWE-1.7 대비 ***medium 설정이 더 높은 점수***를 내면서 평균 작업 단계는 58%, 비용은 81% 감소. 첫 실제 코드 편집까지 걸리는 단계 수도 중앙값 18단계로, SWE-1.7의 48단계보다 크게 줄었다 — 관련 코드만 집중적으로 살펴 불필요한 탐색·반복 읽기를 줄인 결과라고 설명한다.
- **DeepSWE 1.1** — SWE-2 **73.0점**. 같은 날 공개된 DeepSeek V4.1 Flash가 이 벤치마크에서 **74.2점**을 기록해, SWE-2보다 근소하게 앞선다(각 벤더 자체 발표 기준) — 두 모델을 같은 잣대(DeepSWE 1.1)로 놓고 보면 "코딩 특화 모델"이라는 SWE-2의 포지셔닝이 범용 모델에게도 뚫리는 지점이 있다는 뜻이다.
- **배포** — Devin Desktop·CLI·Web·Fusion 전반에 즉시 롤아웃.
- **HN 반응** — WebSearch로 확인한 HN 스레드는 "프론티어급 매칭" 주장이 선택적(Cognition이 앞서는 FrontierCode 지표 기준)이라는 점, Terminal-Bench 4.0에서 격차가 크다는 점을 놓고 벤더 벤치마크 마케팅에 대한 회의적 반응을 다뤘다고 요약된다.

## 인상 깊은 문장

*(WebFetch·WebSearch 모두 Cognition 공식 발표문의 원문 문장을 직접 인용할 수 있는 형태로 반환하지 않았다 — 2차 보도의 수치·요약만 확보했다. 인상 깊은 문장 대신, 위 "Terminal-Bench 2.1 vs 4.0에서 갈리는 그림" 항목의 27.3 대 55.8·57.9라는 수치 대비 자체가 이 노트에서 가장 인상적인 "문장"이다.)*

## 댓글

GeekNews(id=33494) hada 댓글 수는 이번 세션 egress 차단으로 확인하지 못했다. HN에는 최소 두 개의 관련 스레드(id=49645443 "Cognition launches new SWE-2 model, Rivaling Fable 5.1 and GPT-Astra", id=49646778 "Cognition's SWE-2 achieves 92.8 on Terminal-Bench 2.1")가 확인됐고, WebSearch 요약에 따르면 "매칭 프론티어" 주장이 선택적이라는 지적과 벤더 자체 벤치마크에 대한 회의론이 논의됐다고 한다 — 다만 이건 HN 댓글 원문이 아니라 WebSearch가 재구성한 요약이라는 한계가 있다. **이해관계**: 출처가 Cognition 자사 블로그이므로 "0.9%p 차이로 프론티어급"·"64% 저렴" 같은 수치는 벤더가 자신에게 유리한 지표를 헤드라인으로 고른 결과일 가능성이 높다 — Terminal-Bench 4.0처럼 불리한 지표는 이 노트가 별도로 찾아서 대비시킨 것이다.

## 내 생각 · 적용점

### 핵심 전이 1 — "PASS만 보고하지 말라"는 이 가든의 원칙을 벤더가 스스로 어기는 정확한 사례

Cognition의 헤드라인 주장("Fable 5.1과 0.9%p 차이")은 사실이지만 벤치마크 하나에 국한된다. Terminal-Bench 4.0에서 27.3 대 55.8이라는 격차는 발표문이 앞세우지 않는 숫자다. 이건 [[2026-09-10-coding-agents-test-verification-techniques]]가 실증한 "에이전트는 자기가 통과한 테스트만 보고 실제 성능을 판단하면 안 된다"는 원칙의 벤더 마케팅 버전이다 — 에이전트의 자기 검증이 선택적이듯, 벤더의 벤치마크 헤드라인도 선택적이다. 둘 다 "통과했다는 사실"과 "전반적으로 신뢰할 만하다는 사실" 사이에 간극이 있다는 같은 구조를 보여준다.

### 핵심 전이 2 — [[2026-09-09-gpt6-astra-skills-prompts-rethink]]가 말한 "모델이 똑똑해질수록 지시는 짧아져야 한다"는 조언이 SWE-2의 효율 개선과 반대 방향에서 만난다

그 글은 GPT-6 Astra 같은 프론티어 모델이 스스로 판단할 수 있으니 장황한 지시를 걷어내라고 했다. SWE-2는 반대 접근이다 — 모델 자체(추론 단계, 코드 탐색 범위)를 훈련 단계에서 조정해 "관련 코드만 집중적으로 살펴 불필요한 탐색을 줄이도록" RL로 학습시켰다. 하나는 프롬프트 레이어에서, 하나는 학습 레이어에서 같은 목표(불필요한 작업 제거)를 추구하는 셈이다 — 다만 SWE-2의 효율 개선이 Terminal-Bench 4.0의 장기 작업에서는 안 통한다는 게, "짧은 지시/적은 단계"가 모든 난이도의 작업에 균일하게 좋은 건 아니라는 걸 시사한다.

## 호스피탈리티 / CRS 적용 포인트

이 글에서 CRS에 직접 전이할 기술적 원칙은 제한적이다 — 범용 코딩 에이전트 모델 출시 소식이라 온다의 예약·CRS 도메인 로직과 구조적으로 맞닿지 않는다. 다만 벤치마크를 읽는 방법론 하나는 그대로 옮겨올 만하다: **"이 도구가 프론티어급이다"라는 벤더 주장을 마주하면, 그 벤더가 앞세우는 지표가 아니라 우리 작업과 가장 비슷한 성격의 지표(장기·다단계 작업이라면 Terminal-Bench 4.0류)를 따로 찾아 대조하는 습관.** CRS 개발에 코딩 에이전트를 도입·교체할 때, 헤드라인 벤치마크 하나만 보고 판단하지 않는 원칙으로 남긴다.

## 연관 자료

- [[2026-09-10-coding-agents-test-verification-techniques]] — "자기가 통과한 테스트만 보고 실제 성능을 신뢰하면 안 된다"는 원칙이 이 글에서는 벤더의 선택적 벤치마크 마케팅으로 재현됨
- [[2026-09-09-gpt6-astra-skills-prompts-rethink]] — "모델이 똑똑해질수록 지시는 짧게"라는 프롬프트 레이어 원칙과, SWE-2의 학습 레이어 효율화가 반대 방향에서 같은 목표를 추구

## 한 달 뒤 회고

*(2026-10-11 즈음 — cognition.com·news.hada.io 접근이 풀리면 공식 발표문 원문과 HN 댓글 원문을 직접 대조. Terminal-Bench 4.0 격차가 후속 버전에서 좁혀졌는지, SWE-2의 실사용 후기가 벤치마크 수치와 부합하는지 점검.)*
