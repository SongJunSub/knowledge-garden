---
title: "Addy Osmani — 오케스트레이션 세금 (Lasn 측 *실무 적응 방법론 차원* 2번째 자산: 인간 판단력 = 직렬 병목)"
source_title: "The Orchestration Tax"
source_url: "https://addyosmani.com/blog/orchestration-tax/"
source_name: "addyosmani.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29971"
summarized_at: "2026-05-29"
category: "ai"
tags: ["ai-agents", "orchestration", "amdahls-law", "human-bottleneck", "cognitive-bandwidth", "code-review", "lasn-side", "practice-methodology", "addy-osmani"]
---

# Addy Osmani — 오케스트레이션 세금 (Lasn 측 *실무 적응 방법론 차원* 2번째 자산: 인간 판단력 = 직렬 병목)

> 출처: [The Orchestration Tax](https://addyosmani.com/blog/orchestration-tax/) (Addy Osmani, GeekNews 경유) · 정리일 2026-05-29

## 한 줄 요약
**여러 AI 에이전트를 병렬로 띄우는 비용은 거의 0이지만, *그 결과를 이해·검토·병합하는 인간의 판단은 병렬화되지 않는다* — 에이전트 20개가 생산성 20배를 뜻하지 않으며, *인간이 시스템의 느린 직렬 구성요소(Python GIL)*가 된다. Amdahl의 법칙대로 *직렬로 남는 일의 비율이 전체 가속의 상한*. 처방: *에이전트 수를 UI 한계가 아니라 *내 검토 역량*에 맞추고(보통 한 자릿수), 판단 필요 작업은 병렬화하지 말고, 인지 대역폭을 핵심 판단에 집중하라.* 안 내면 *기술 부채 + 인지 부채가 조용히 쌓인다.***

## 핵심 포인트

- **숨은 비대칭** — *에이전트 시작 비용 ≈ 0*, 그러나 *루프를 닫는 비용(검토·조정·병합)은 전부 나에게*. **[[2026-05-28-claude-opus-4-8-release]] *수백 병렬 서브 에이전트*의 *정확한 반대편 청구서*** — 에이전트 공급은 폭증해도 *검토 역량 천장*은 그대로.
- **인간 = GIL(Global Interpreter Lock)** — *에이전트는 동시에 돌지만, 진짜 이해가 필요한 작업은 *단 하나뿐인 내 잠금*을 순차적으로 획득해야* 한다. 동시성 시스템의 직렬 락과 동형.
- **Amdahl의 법칙 적용** — *병렬화로 얻는 가속은 *직렬로 남는 일의 비율*에 의해 상한이 정해진다.* 직렬 분율(=판단)이 크면 코어를 아무리 늘려도 천장에 부딪힘.
- **병목의 현실** — *에이전트를 늘리면 판단이 빨라지는 게 아니라 *대기 큐만 깊어진다*. *시스템 처리량 = 검토 단계의 처리량*과 정확히 같다.* **[[2026-05-26-bottleneck-is-organization]] *DORA 병목 = 조직*의 *개인 차원 동형*** — 조직 차원 병목(가치 전달)이 *개인 차원(검토 판단)*으로 축소 재현.
- **노력으로 못 넘는 구조적 한계** — *더 갈아넣어도 직렬 제약은 안 풀리고, *얕은 검토* 또는 *인지적 항복(cognitive surrender)*만 낳는다.* **[[2026-05-25-claude-is-not-your-architect]] *"아니오"·"왜?" 부재*의 *대역폭 고갈 경로*** — 검토를 포기하면 책임 공백이 그대로 통과.
- **보이지 않는 실패 모드** — *바쁜 느낌과 실제 산출은 다르다*. 안 낸 오케스트레이션 세금은 *기술 부채 + 인지 부채*로 조용히 적립. **[[2026-05-26-users-are-visibly-frustrated]] *감정 비용*의 *생산성 착시 차원***.
- **처방: 검토 역량에 맞춰라** — *에이전트 수 = UI가 허용하는 수가 아니라 *내가 검토 가능한 수*(보통 한 자릿수)*. 백그라운드 작업과 판단 작업 분리, 검토 배치화(컨텍스트 전환 최소화), 직렬 시간 보호. **[[2026-05-18-eugene-yan-compounding-with-ai]] *병렬 세션 3~6개 위임*의 *상한 근거 설명*** — Eugene Yan의 3~6개가 *왜 한 자릿수에서 멈추는지*를 이 글이 메커니즘으로 해명.

## 인상 깊은 문장

> "You are the GIL of your AI agents... when any of their work needs genuine understanding... that work has to acquire the lock. There is one lock. You hold it."  
> (당신은 당신 AI 에이전트들의 GIL이다 — 그들의 작업 중 진짜 이해가 필요한 것은 잠금을 획득해야 하는데, 잠금은 하나뿐이고, 그걸 당신이 쥐고 있다)

> "The speedup you get from paralellizing is capped by the fraction of work that stays serial."  
> (병렬화로 얻는 가속은 직렬로 남는 일의 비율에 의해 상한이 정해진다 — Amdahl의 법칙)

> "The constraint is the review step and the throughput of your system equals exactly the throughput of that step."  
> (제약은 검토 단계이며, 시스템의 처리량은 그 단계의 처리량과 정확히 같다)

> "You can be maximally busy and barely produce anything. From the inside it feels identical."  
> (최대로 바쁘면서도 거의 아무것도 산출하지 못할 수 있다 — 내부에서 보면 둘은 똑같이 느껴진다)

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원 2번째 자산* — 차원 명시 라벨링 발현

| 자산 | 실무 적응 방법론 차원 형태 |
|---|---|
| [[2026-05-25-lawson-better-code-slower-with-ai]] | *다중 모델 교차 검증 = 오탐률 0* (입력 품질 방법론) |
| **이번 글 (Addy Osmani)** | ***에이전트 수를 검토 역량에 맞춤*** (처리량 병목 방법론) |

→ [[2026-05-25-lawson-better-code-slower-with-ai]]에서 *"각 차원 1 자산이라 명시 라벨링 보류 — 2번째 자산 도착 시 라벨링"*으로 **예고해 둔 라벨링이 정확히 발현**. Lawson은 *검토 품질을 어떻게 높이는가*, 이 글은 *검토 처리량의 상한을 어떻게 인정하는가* — **품질·처리량 두 축으로 실무 방법론 차원이 두꺼워짐**. Lasn 측 6 자산 (적응·최적화 1 + 공급자 비전 1 + **실무 적응 방법론 2** + 자본·재무 1 + 공급자 제품 1) vs axelk 측 19.

### **균형 의례 부채 *-2 → -1 자연 회복* — 자연 균형 사이클 9번째 시연**

- 직전([[2026-05-28-claude-opus-4-8-release]]) 부채 -2 (axelk 측 잉여)
- *이번 글 Lasn 측 +1 → 부채 -1로 자연 회복*
- 비율: **29:19 ≈ 1.53:1** (안전 마진 1.47, 임계점 3:1 안쪽)
- → 어제 *48시간 진동 패턴*으로 정정한 *친-AI ↔ axelk 교대 도착*이 이번에도 작동 (Opus 4.8 친-AI → 이번 친-AI 연속이지만, 직전 axelk 잉여 -2를 *회복하는 방향*이라 임계점에서 멀어짐). **수동 능동 큐레이션 없이 GeekNews 자연 흐름이 균형 회복** — 자연 균형 사이클 9번째.

### *경계 자산(boundary asset) 인식* — axelk 측 측정 회의 풍미를 가진 Lasn 측 방법론

이 글은 *순수 친-AI 찬가가 아니다*. "에이전트 20개 ≠ 20배"는 **[[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *생산성 측정 회의*(axelk 측)와 같은 결**의 비판을 품는다. 다만 **프레이밍이 처방적**(어떻게 잘 쓰는가)이고 **저자가 친-AI**라 *실무 적응 방법론 = Lasn 측*으로 분류. 가든의 *경계 자산* 처리 관행대로 *양면성 명시 + 우세 측 분류*. → axelk 측 측정 차원과 Lasn 측 방법론 차원이 **같은 사실(직렬 분율의 지배)을 양 측에서 해석**하는 성숙한 분기.

### [[2026-05-28-claude-opus-4-8-release]] *수백 병렬 서브 에이전트*의 24시간 반대편 청구서

어제 Opus 4.8 자산의 핵심 셀링 포인트 중 하나가 *수백 개 병렬 서브 에이전트*. **이 글이 정확히 그 다음 날 *공급 폭증의 청구서를 발행***:

- 공급 측(Opus 4.8): *에이전트를 수백 개 띄울 수 있다*
- 수요 측(이 글): *그래도 검토 역량 = 한 자릿수가 천장*
- → **에이전트 공급 능력과 인간 검토 처리량의 격차 = 오케스트레이션 세금의 크기**. 모델 세대가 올라갈수록 *세금이 더 커진다* (공급은 늘고 검토 락은 그대로).

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [The Orchestration Tax](https://addyosmani.com/blog/orchestration-tax/) (원문)
- [GeekNews — 29971](https://news.hada.io/topic?id=29971)
- [[2026-05-25-lawson-better-code-slower-with-ai]] — 실무 적응 방법론 차원 *1번째 자산 (품질 축)·차원 라벨링 짝*
- [[2026-05-26-bottleneck-is-organization]] — DORA 병목 = 조직 *(개인 차원 동형)*
- [[2026-05-28-claude-opus-4-8-release]] — Opus 4.8 수백 병렬 서브 에이전트 *(공급 폭증의 반대편 청구서)*
- [[2026-05-18-eugene-yan-compounding-with-ai]] — Eugene Yan 병렬 세션 3~6개 *(한 자릿수 상한의 메커니즘 해명)*
- [[2026-05-25-claude-is-not-your-architect]] — 인간 판단력 대체 불가 *(대역폭 고갈 시 책임 공백)*
- [[2026-05-26-users-are-visibly-frustrated]] — 인간 직렬 병목의 *감정 비용·생산성 착시 차원*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] — 생산성 측정 회의 *(경계 자산 = axelk 측 풍미)*
- [[2026-05-18-musinsa-query-engineer-harness]] — Agent = Model + Harness *(잘된 오케스트레이션의 하네스 사례)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — 실제로 동시 에이전트 수를 *한 자릿수로 제한*해보고 검토 처리량이 개선됐는지, *검토 배치화*로 컨텍스트 전환 비용이 줄었는지, 실무 적응 방법론 차원 *3번째 자산*이 도착해 품질·처리량 외 새 축이 추가됐는지, CRS·MangoLove 운영에 *에이전트 수 = 검토 역량* 규칙을 도입했는지 기록.)*
