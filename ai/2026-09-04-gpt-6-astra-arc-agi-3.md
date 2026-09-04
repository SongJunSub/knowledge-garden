---
title: "GPT-6 Astra, ARC-AGI-3에서 Standard 62.7% vs Provider Adapter 99.9% — 하네스가 다르면 벤치마크도 다른 걸 잰다"
source_title: "OpenAI's GPT-6 Astra on ARC-AGI-3"
source_url: "https://arcprize.org/blog/astra"
source_name: "ARC Prize (arcprize.org)"
referrer_url: "https://news.hada.io/topic?id=33202"
published_at: "2026-09-03"
summarized_at: "2026-09-04"
category: "ai"
tags: ["arc-agi", "benchmark-methodology", "gpt-6-astra", "openai", "agentic-efficiency", "cost-per-task"]
---

# GPT-6 Astra, ARC-AGI-3에서 Standard 62.7% vs Provider Adapter 99.9%

> 출처: [OpenAI's GPT-6 Astra on ARC-AGI-3](https://arcprize.org/blog/astra) (ARC Prize · GeekNews 경유) · 정리일 2026-09-04

## 한 줄 요약

**GPT-6 Astra는 명시적 지시 없이 낯선 게임 환경을 탐색해 규칙·목표를 알아내는 ARC-AGI-3에서, 하네스에 따라 62.7%(Standard, $26,098)와 99.9%(Provider Adapter, $18,817)라는 크게 갈리는 점수를 냈다.** 두 하네스의 차이는 "무엇을 측정하는가" 자체를 바꾼다 — Provider Adapter는 불투명한 추론 상태를 요청 간에 보존하고 컴팩션으로 이전 작업을 재사용할 수 있어, 사실상 모델이 더 유리한 조건에서 시험을 본 것에 가깝다. 그런데도 Provider Adapter 쪽이 비용은 오히려 더 낮았고, 행동 효율성에서는 완료한 레벨의 96%에서 인간 중앙값보다 적은 행동을 사용했다(레벨당 평균 51.7% 적음).

## 핵심 포인트

- **점수 격차의 원인은 재능이 아니라 조건** — Standard 하네스는 모델이 스스로 남기기로 선택한 메모만 이어받는 방식인 반면, Provider Adapter는 OpenAI의 문맥 관리 기능으로 **불투명한 추론 상태를 요청 간 보존**하고 **긴 대화를 압축(compaction)**해 이전 작업을 재사용한다. 같은 모델, 다른 인프라 조건에서 62.7% → 99.9%로 뛴 것.
- **비용은 오히려 역전** — Standard(max 추론) $26,098 > Provider Adapter(high 추론) $18,817. **추론 수준이 높을수록 행동·모델 호출·토큰이 줄어 비용도 대체로 낮아진다**는 패턴이 두 하네스 모두에서 관찰됐다.
- **행동 효율** — Provider Adapter의 Astra(max)는 완료한 레벨의 **96%에서 인간 중앙값보다 적은 행동**을 사용했고, 레벨당 평균 행동 수도 인간 대비 **51.7% 적었다**.
- **낯선 게임 규칙을 추론하는 과제** — 좌표·객체·규칙을 사전 설명 없이 스스로 발견해야 하는 ARC-AGI-3의 특성상, 이 결과는 단순 패턴 매칭이 아니라 **탐색·가설 검증 능력**을 시사한다.

## 인상 깊은 문장

> Standard 62.7% ($26,098, max reasoning) vs Provider Adapter 99.9% ($18,817, high reasoning) — 같은 모델의 같은 벤치마크 점수가 하네스 선택만으로 37.2%p 갈렸다.

## 댓글

**출처 한계 명시.** `news.hada.io`·`arcprize.org` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했고, 위 수치는 WebSearch가 여러 검색어에 걸쳐 일관되게 재현한 스니펫(ARC Prize 공식 블로그·rdworldonline·superpowerdaily·thepcenthusiast 등 다수 2차 보도가 동일 수치 인용)으로 교차 확인했다. HN에 별도 스레드(item id 49555691)가 있는 것으로 확인됐으나 점수·댓글 수는 특정하지 못했다. **정직하게 밝힐 점** — ARC Prize 자체가 "Provider Adapter 방식이 표준 비교 가능한 조건인가"에 의문을 제기하는 취지로 이 결과를 다뤘을 가능성이 높다(제목에 "Provider Adapter"를 별도로 명시한 것 자체가 방법론적 구분을 강조하려는 의도로 읽힌다). 원문을 직접 읽지 못해 ARC Prize 팀의 명시적 평가(축하/경고 톤)는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-02-arc-agi-tiny-transformer-67-cents]]와 정확히 반대 극단의 같은 벤치마크

이틀 전 정리한 노트는 RTX 5090 한 장으로 **67센트, 1.5시간** 학습한 소형 트랜스포머가 ARC-AGI-1 44%를 찍은 이야기였다. 이번 글은 **$18,817~26,098**을 들여 ARC-AGI-3에서 최대 99.9%를 낸 프론티어 모델이다. 같은 벤치마크 계열이 **스케일의 양쪽 끝**에서 동시에 실험대로 쓰이고 있다는 대조가 한 주 사이에 다시 반복됐다.

### 핵심 전이 2 — [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]]가 세운 "벤치마크 방법론을 의심하라"는 태도가 그대로 적용된다

Cerebras 발표 노트에서 정리했던 원칙 — **"근거로 무엇을 쟀는지" 먼저 확인하라** — 이 이번에도 유효하다. 그때는 처리량과 지연이 뒤섞였고, 이번에는 **"같은 조건에서 잰 점수인가"** 자체가 불명확하다. Provider Adapter의 99.9%를 "GPT-6 Astra의 ARC-AGI-3 점수"로 단순 인용하면, Standard 하네스에서는 62.7%라는 사실이 가려진다.

### 핵심 전이 3 — [[2026-09-04-openai-gpt-6-astra-release]]와 짝을 이루는 벤치마크 상세

같은 배치에서 정리한 GPT-6 Astra 정식 출시 노트는 OSWorld 2.0·Mind2Web·수학·사이버보안 결과에 집중했다. 이 노트는 ARC-AGI-3 벤치마크와 비용 구조에 집중해 중복을 피했다 — 두 노트를 함께 보면 "출시 발표문의 헤드라인 수치"와 "제3자 벤치마크 기관이 재현한 조건부 수치"의 격차가 드러난다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** ARC-AGI는 낯선 환경 탐색·규칙 추론이라는 연구용 메타인지 벤치마크다. 다만 전이 가능한 원칙 하나는 남는다 — **벤더가 제시하는 벤치마크 점수를 우리 워크로드 판단에 쓸 때는 "어떤 하네스·문맥 관리 조건에서 나온 점수인가"를 반드시 확인한다.** 이번 사례처럼 조건에 따라 37%p 이상 갈릴 수 있다면, 벤치마크 헤드라인 하나로 도입을 결정하는 건 위험하다.

## 연관 자료
- [[2026-09-04-openai-gpt-6-astra-release]] — 같은 모델의 정식 출시·스펙 노트, 중복 없이 짝을 이룸
- [[2026-09-02-arc-agi-tiny-transformer-67-cents]] — 같은 벤치마크의 정반대 극단(67센트 vs $26,098)
- [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]] — "무엇을 쟀는가부터 의심하라"는 같은 방법론적 태도
- [[2026-08-08-deepseek-v4-flash-arc-agi-results]] — 프론티어급 모델이 최대 추론으로 ARC-AGI-1/2를 공략한 다른 사례

## 한 달 뒤 회고
*(2026-10-04 즈음 — ARC Prize 팀이 Provider Adapter 방식의 공정성에 대해 공식 입장을 냈는지, 다른 프론티어 모델도 같은 하네스 격차를 보이는지, 단일 질문 지연 수치가 별도로 공개됐는지 확인.)*
