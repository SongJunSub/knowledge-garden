---
title: "4B 모델을 훈련해 Postgres보다 81% 빠른 쿼리 실행 계획 만들기 (Rohan Bansal) — 플래너를 대체하지 않고 pg_hint_plan으로 '넛지'만 한다. JOB 113개 쿼리에서 1.81배 기하평균 속도향상, 회귀 0건, 총비용 $1,200"
source_title: "Training a 4B model to produce 81% faster query plans than Postgres"
source_url: "https://rohanbansal.com/qorl"
source_name: "rohanbansal.com (Rohan Bansal)"
referrer_url: "https://news.hada.io/topic?id=33805"
published_at: "2026-09-16"
summarized_at: "2026-09-17"
category: "backend"
tags: ["postgresql", "query-optimizer", "reinforcement-learning", "grpo", "distillation", "small-models", "pg_hint_plan", "cost-efficiency", "benchmark"]
---
# 4B 모델을 훈련해 Postgres보다 81% 빠른 쿼리 실행 계획 만들기 (Rohan Bansal)

> 출처: [Training a 4B model to produce 81% faster query plans than Postgres](https://rohanbansal.com/qorl) (Rohan Bansal · 개인 블로그, 프로젝트명 "Qorl") · 정리일 2026-09-17
> **출처 한계**: 이번 세션은 `news.hada.io`·`rohanbansal.com`·`news.ycombinator.com`·`dev.to`·`ai-tldr.dev` 전부 egress 차단으로 직접 열람하지 못했다. 아래 내용은 WebSearch로 교차 확인한 여러 매체(AI/TLDR, DEV Community, Hacker News 제목/스니펫)의 요약과, egress가 허용된 GitHub 저장소(`github.com/polyphilz/qorl`) README를 직접 읽어 재구성했다. 원문의 정확한 문장·그래프·코드 스니펫은 대조하지 못했다.

## 한 줄 요약

**작은 오픈웨이트 모델(4B, Qwen3.8 distill)을 SFT(교사 궤적 모방) + GRPO 기반 에이전틱 RL로 후처리해, Postgres 플래너를 대체하는 대신 `pg_hint_plan`으로 "넛지"하는 힌트를 생성하게 만들었더니, Join Order Benchmark 113개 쿼리에서 기하평균 1.81배(약 81%) 빨라지고 회귀(느려진 쿼리)는 0건이었다는 프로젝트.** 총비용은 $1,200(2×H100 95시간 대여 약 $800 + 교사 모델 API 비용 약 $400).

## 핵심 포인트

- ***플래너를 통째로 대체하지 않는다*** — Postgres의 쿼리 옵티마이저 자체를 ML로 갈아엎는 게 아니라, 서드파티 확장 `pg_hint_plan`을 통해 SQL 주석 형태의 "힌트"(조인 순서·조인 알고리즘 등)를 원 쿼리 앞에 덧붙이는 방식. 기존 플래너의 안전장치·폴백 위에서 동작한다는 점이 리스크를 낮춘다.
- ***2단계 훈련*** — 1단계 SFT: GPT-6 Astra가 6종 도구(`inspect_relation`, `get_column_stats`, `get_plan`, `evaluate_candidate`, `keep_default`, `finish`)로 Postgres를 직접 조작하며 만든 420개 교사 궤적을 off-policy로 모방. 2단계 RL: anchored relative advantage를 쓰는 GRPO 변형으로, 쿼리 하나당 4개 롤아웃을 굴려 각 후보 힌트 플랜의 실제 실행시간 단축분을 스칼라 보상으로 역전파.
- ***초기 상태는 처참했다*** — 후처리 전 4B 모델은 113개 쿼리 중 99개에서 아예 유효한 플랜조차 못 만들었다. 그 상태에서 SFT+RL을 거쳐 44.7% 지연시간 감소(≈1.81배 속도향상)까지 끌어올렸다는 게 이 프로젝트의 실질적 설득력.
- ***비용 구조가 핵심 주장*** — 중고급 하드웨어로 총 $1,200. "프론티어 모델 API를 계속 호출하는 게 아니라, 한 번 학습시킨 4B 모델을 반복 배치한다"는 경제성이 논지의 축.
- ***전제: 반복 실행되는 쿼리 워크로드*** — 힌트를 생성하는 데도 추론 비용·지연이 들기 때문에, 한 번만 실행되는 ad-hoc 쿼리보다는 같은 쿼리가 계속 반복 실행되는 워크로드(대시보드, 정기 배치, 앱의 고정 쿼리 패턴)에서 투자 대비 효과가 난다는 설계 전제가 있다.
- ***오픈소스로 공개*** — 학습 코드·평가 하네스가 `github.com/polyphilz/qorl`에 공개되어 있어 재현 가능성이 상대적으로 높다(README 기준 4가지 실험 모드: calibrate/eval/sft/rl, Python 3.12 + Linux x86-64 + CUDA 요구).

## 인상 깊은 문장

> "On the 113-query Join Order Benchmark it reaches a 1.81x geometric-mean speedup with no regressions, for $1,200." (WebSearch로 교차 확인된 스니펫 인용 — 원문 전체 문맥은 직접 대조하지 못함)

## 댓글

Hacker News에 동일 제목("Training a 4B model to produce 81% faster query plans than Postgres")으로 별도 토픽이 올라와 있음을 확인했다(news.ycombinator.com/item?id=49731285). 다만 이번 세션에서는 HN 도메인도 egress 차단이라 **댓글 수·논쟁 내용은 직접 확인하지 못했다.** GeekNews(`news.hada.io`) 원 토픽 페이지 역시 egress 차단으로 열람 불가해 **hada 댓글 수도 확인 불가**하다. Lobsters 큐레이션 여부는 검색으로 명확히 확인되지 않았다(관련성 낮은 결과만 나옴) — 있다고 단정하지 않는다. n=1 벤치마크(JOB 하나, 113개 쿼리)라는 점, 그리고 저자 본인이 만든 벤치마크·평가 하네스로 저자 본인이 성능을 측정했다는 이해상충 소지도 정직하게 남겨둔다(제3자 재현 결과는 아직 없음).

## 내 생각 · 적용점

- **"좁은 태스크 + RL 후처리로 프론티어/디폴트를 이긴다" 패턴의 반복.** [[2026-08-02-500-dollar-finetune-beats-frontier-models]]과 [[2026-08-07-castform-neon-4b-model-beats-gpt-search]]가 다룬 것과 같은 형태 — 작은 오픈웨이트 모델을 GRPO 계열 RL로 좁게 특화시켜, 범용 대형 시스템(프론티어 모델 또는 여기선 Postgres 기본 플래너)을 좁은 벤치마크에서 이긴다. 다만 이 글은 앞의 두 글과 달리 ***"몇 개 쿼리에서, 회귀 몇 건, 비용 얼마"***까지 구체적 숫자를 명시한다는 점에서 [[2026-08-07-castform-neon-4b-model-beats-gpt-search]]가 지적당했던 "헤드라인엔 숫자, 본문엔 다이어그램만" 문제를 상당 부분 피해간다 — 다만 이 판단도 원문을 직접 못 읽고 WebSearch 스니펫에 의존한 것이라 조심스럽다.
- **쿼리 플래너 개입은 결국 "인덱스로 찾을지, 스캔으로 훑을지"의 확장판.** [[2026-07-23-postgres-survival-guide-startups]]가 제시한 멘탈모델(단일 행을 빨리 찾거나, 순차 스캔으로 전부 읽거나)과 정확히 같은 축 위에서, 조인 순서·조인 알고리즘 선택이라는 더 복잡한 의사결정을 자동화하려는 시도로 읽힌다.
- **일반화 가능성엔 회의적.** JOB은 조인이 많은 분석성 쿼리 벤치마크라 학습이 잘 통했을 수 있고, 실제 프로덕션의 다양한 쿼리 분포·통계 변화(데이터 드리프트)에서도 동일 힌트가 유효한지는 별도 검증이 필요하다 — 이 글 자체가 "반복 실행 워크로드" 전제를 명시한 것도 이런 한계를 인지한 설계로 보인다.

## 호스피탈리티 / CRS 적용 포인트

CRS는 대규모 RDB 위에서 예약 가능 재고 조회, 요금 계산, 채널별 가용성 쿼리처럼 **같은 형태의 쿼리가 초당 수백~수천 번 반복 실행되는** 워크로드다 — 이 글이 명시한 "반복 실행 워크로드"라는 전제와 정확히 맞아떨어진다. 특히 재고/요금 조인 쿼리(객실×기간×채널×요금규칙)처럼 조인이 많고 패턴이 고정된 쿼리는 QORL류 접근의 이상적인 타겟에 가깝다. 다만 직접 도입을 고려한다면: (1) 이 접근은 정적 데이터 분포를 전제로 학습되므로 실시간 재고·요금 변동이 잦은 CRS 환경에서 힌트의 유효기간을 어떻게 관리할지가 관건이고, (2) $1,200이라는 비용 자체는 작지만 학습 인프라(2×H100)와 재학습 주기 운영 부담은 별도 비용이며, (3) `pg_hint_plan` 같은 확장을 프로덕션 DB에 넣는 것 자체가 Aurora/RDS 관리형 환경에서는 제약될 수 있다([[2026-09-10-aurora-postgresql-pgvector-production]]에서 다룬 관리형 Postgres 운영 제약과 같은 축). 전면 도입보다는, 느린 쿼리 상위 N개를 골라 오프라인으로 QORL 방식을 실험해보고 `EXPLAIN ANALYZE` 대비 개선폭을 확인하는 "타겟형 PoC"가 현실적인 첫 단계로 보인다.

## 연관 자료

- [[2026-08-02-500-dollar-finetune-beats-frontier-models]] — 같은 패턴(작은 모델 + GRPO 강화학습으로 좁은 태스크에서 대형/기본 시스템을 이김), 이쪽은 전자상거래 카탈로그 검수 도메인
- [[2026-08-07-castform-neon-4b-model-beats-gpt-search]] — 같은 4B 모델 + RL 후처리 패턴의 거울상. 저쪽은 핵심 수치가 빠진 홍보성 주장이었다는 비판이 있었는데, 이 글은 상대적으로 구체적 벤치마크 수치를 제시한다는 점에서 대조된다
- [[2026-07-23-postgres-survival-guide-startups]] — "인덱스로 찾거나 스캔으로 훑거나"라는 쿼리 성능 멘탈모델의 확장판으로 이 글의 조인 순서 최적화를 이해할 수 있다
- [[2026-09-10-aurora-postgresql-pgvector-production]] — 관리형 Postgres(Aurora) 환경에서 확장·튜닝 자유도의 제약이라는 맥락에서 QORL의 실전 도입 난이도를 가늠하는 데 참고가 된다

## 한 달 뒤 회고

- 2026-10-17 즈음: `github.com/polyphilz/qorl`에 독립적인 3자 재현 결과나 HN/Lobsters 논쟁에서 나온 반박(과적합·벤치마크 편향 지적 등)이 있었는지 확인한다.
- JOB 벤치마크를 넘어 TPC-H나 실제 프로덕션 워크로드로 확장 검증한 후속 글이 나왔는지, 그리고 이번 세션에서 막혔던 원문·HN 댓글을 직접 읽어 이 노트의 "출처 한계" 부분을 보강할 수 있는지 점검한다.
