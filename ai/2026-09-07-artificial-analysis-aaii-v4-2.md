---
title: "Artificial Analysis, AAII v4.2 발표 — 비공개 테스트 비중을 20%에서 40%로 두 배 늘려 벤치마크 게이밍을 막는다"
source_title: "Announcing Artificial Analysis Intelligence Index v4.2"
source_url: "https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v4-2"
source_name: "Artificial Analysis"
referrer_url: "https://news.hada.io/topic?id=33291"
published_at: "2026-09"
summarized_at: "2026-09-07"
category: "ai"
tags: ["benchmark", "artificial-analysis", "eval-methodology", "private-test-set", "gpqa", "agentic-knowledge-work"]
---

# Artificial Analysis, AAII v4.2 발표 — 실제 업무 평가 강화, 비공개 테스트 확대

> 출처: [Announcing Artificial Analysis Intelligence Index v4.2](https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v4-2) (Artificial Analysis) · GeekNews(id=33291) 경유 · 정리일 2026-09-07

> **출처 한계**: `artificialanalysis.ai`·`news.hada.io` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. 공식 X(트위터) 발표문·xfinit.ro 블로그·ai-tldr.dev 요약을 WebSearch로 교차 확인했다. **이해관계**: Artificial Analysis는 벤치마크·인덱스 자체가 상품인 회사로, 벤치마크의 신뢰성을 계속 강화한다는 발표가 곧 자사 서비스 가치 유지와 직결된다는 점을 감안해서 읽어야 한다.

## 한 줄 요약

**AI 모델의 종합 성능을 비교하는 Artificial Analysis Intelligence Index가 v4.2로 갱신되면서, 복잡한 업무 수행·장문 분석을 평가에 추가하고 비공개(held-out) 테스트 세트의 비중을 v4.1의 20%에서 40%로 두 배 늘려 모델 개발사가 특정 벤치마크에 맞춰 모델을 최적화하는 "게이밍"을 억제하려 한다.**

## 핵심 포인트

- **비공개 테스트 비중 2배 확대 — 게이밍 방지가 핵심 동기** — v4.1 대비 비공개 테스트 세트 비중이 20%에서 40%로 늘었다. AA-Briefcase, AA-Omniscience, CritPt 정답 등이 비공개 데이터에 포함되며, ***모델 개발사가 이 벤치마크를 노려 모델을 튜닝하는 능력을 줄이는 게 목적***이라고 명시했다. 향후 v5에서는 이 비중이 더 늘어날 예정이다.
- **에이전트 지식 업무·장문 추론 평가 추가** — 수천 개 자료를 활용하는 에이전트 지식 업무와, 여러 페이지에 흩어진 근거를 종합하는 전문 문서 추론을 평가에 새로 추가했다.
- **포화된 벤치마크는 제외** — 상위 모델의 성능이 포화된 GPQA Diamond는 지수에서 제외했다 — 변별력을 잃은 벤치마크를 계속 쓰지 않겠다는 결정이다.
- **평가 편법 축소 목적** — 평가에 맞춰 모델을 최적화하는 편법을 줄이기 위해 비공개 테스트 비중 확대와 함께, 채점 오류와 실행 환경도 개선했다고 밝혔다.
- **개편된 종합 지수에서 Claude Fable 5.1이 선두** — 개편된 v4.2 종합 지수에서는 Claude Fable 5.1이 선두를 차지했고, GPT-6 Astra가 뒤를 이었다는 정황이 확인된다(Slack 발췌가 이 지점에서 끊겨 정확한 점수 차이는 확인하지 못했다).

## 인상 깊은 문장

> (WebSearch 종합 재인용) "40% of the Artificial Analysis Intelligence Index weighting is now private, held-out test sets — double the figure from v4.1... to prevent gaming."

## 댓글

hada 댓글 수·HN 큐레이션 여부는 확인하지 못했다. **출처 한계**: 비공개 테스트 세트의 구체적 구성·채점 방식은 "비공개"라는 특성상 검증할 수 없다 — Artificial Analysis 자체의 방법론 신뢰도에 의존해야 한다는 구조적 한계가 있다(다른 독립 벤치마크와의 교차 검증이 어렵다).

## 내 생각 · 적용점

### 핵심 전이 1 — "벤치마크는 목표가 되는 순간 좋은 척도이길 멈춘다"는 굿하트의 법칙이 여기서도 반복

벤치마크 비중을 비공개로 늘려야만 게이밍을 막을 수 있다는 사실 자체가, ***공개 벤치마크는 결국 그 벤치마크를 노린 최적화의 대상이 된다***는 걸 벤치마크 운영자 스스로 인정한 셈이다. 가든에 이미 정리된 "굿하트의 법칙"(측정이 목표가 되면 좋은 측정이길 멈춘다) 계열 논의와 정확히 같은 패턴이 벤치마크 산업 자체에서 재현되고 있다.

### 핵심 전이 2 — GPT-6 Astra 벤치마크 시리즈와 나란히 놓고 보면 "어떤 벤치마크를 믿을 것인가"라는 메타 질문이 남는다

같은 배치에서 정리한 [[2026-09-07-gpt-6-astra-korean-csat-perfect-score]](비공식 개인 벤치마크, 만점)와 [[2026-09-04-gpt-6-astra-arc-agi-3]](하네스에 따라 점수가 극단적으로 갈림)를 이 글과 함께 놓으면, 벤치마크마다 신뢰도의 근거가 다르다는 게 드러난다 — 수능 벤치마크는 "외부 도구 없이"라는 통제로, ARC-AGI-3는 "하네스 명시"로, AAII는 "비공개 테스트 확대"로 각자 다른 방식으로 게이밍을 막으려 한다. ***벤치마크를 인용할 때는 그 벤치마크가 어떤 방식으로 게이밍을 막고 있는지까지 확인하는 습관***이 필요하다는 원칙이 세워진다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS 팀이 독자적으로 AI 벤치마크를 설계·운영할 일은 드물다. 다만 원칙만 전이하면, ***CRS 내부에서 AI 기능(예: 리뷰 요약, 채팅 응대)의 품질을 자체 평가할 때도 "평가 기준을 모델이 학습·최적화 대상으로 삼을 수 있는 공개 데이터로만 구성하지 말라"***는 교훈은 유효하다 — 사내 QA 셋의 일부를 비공개로 유지해 실제 운영 성능과 괴리되지 않도록 하는 접근이 참고가 된다.

## 연관 자료

- [[2026-09-07-gpt-6-astra-korean-csat-perfect-score]] — 다른 방식(외부 도구 배제)으로 벤치마크 신뢰도를 확보하려는 사례
- [[2026-09-04-gpt-6-astra-arc-agi-3]] — 같은 모델도 하네스 설정에 따라 점수가 갈린다는 벤치마크 신뢰성 문제의 다른 축

## 한 달 뒤 회고

*(2026-10-07 즈음 — v4.2 종합 순위 변동, v5 발표 시 비공개 테스트 비중이 실제로 더 늘었는지 점검.)*
