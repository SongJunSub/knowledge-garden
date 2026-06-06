---
title: "코드는 더 싸졌다 — 그러나 이해 비용은 더 비싸졌다, '빼는 엔지니어'가 답 (boring·실무 방법론 라인)"
source_title: "Code is Cheap(er)"
source_url: "https://htmx.org/essays/code-is-cheap/"
source_name: "htmx.org · GeekNews 경유"
summarized_at: "2026-06-01"
category: "engineering"
tags: ["code-is-cheap", "comprehension-cost", "subtracting-engineer", "complexity", "simplicity", "boring-technology-line", "practice-methodology"]
---

# 코드는 더 싸졌다 — 그러나 이해 비용은 더 비싸졌다, '빼는 엔지니어'가 답 (boring·실무 방법론 라인)

> 출처: [Code is Cheap(er)](https://htmx.org/essays/code-is-cheap/) (htmx, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**AI 코딩으로 *코드 작성 비용은 급락*했지만 ***생성 코드를 이해하는 비용은 더 커졌다***는 역설 — LLM은 컴파일러와 달리 *비결정적*이고 *원본 소스를 보존하지 않아* 동일시할 수 없다. *코드 생성 속도가 이해 속도를 추월*하므로 점진적 사용이 필수. 핵심 위험은 *복잡성*(시스템 규모에 따라 기하급수 증가, LLM은 이를 두려워하지 않음). 해법은 ***"빼는 엔지니어(subtracting engineer)"*** — 추가보다 *제거·단순화를 우선*하고, *코드를 이해하며 통제력을 유지*하라.**

## 핵심 포인트

- **코드는 싸졌지만 이해는 비싸졌다** — *생산 비용 ↓, 이해 비용 ↑*. **[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *코드 가격 붕괴* + [[2026-05-29-orchestration-tax]] *검토 = 병목*의 가장 압축된 한 줄** — 병목이 *이해/검토*로 이동.
- **LLM ≠ 컴파일러 (비결정·원본 미보존)** — *생성 코드가 새 진실*이라 *추상화로 가둘 수 없음*. **[[2026-05-29-andrew-kelley-zig-interview]] *비결정성* + [[2026-05-29-ai-frontend-lost-decade]] *새는 추상화*와 동근**.
- **복잡성 = 진짜 위험, LLM은 두려워 안 함** — *규모 따라 기하급수*. **[[2026-05-25-constraint-decay-llm-agent-backend]] *구조 누적 하락* + [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *윈체스터 sprawl*의 메커니즘**.
- **"빼는 엔지니어" = 단순화 우선** — *추가보다 제거*. **[[2026-05-29-choose-boring-technology-2015]] *혁신 토큰 절약* + [[2026-05-28-favorite-developer-tools]] *좋은 기본값* + [[2026-06-01-how-to-build-ai-native-startup]] *가장 단순한 도구* + [[2026-06-01-my-software-north-star]] *수단을 목적으로 착각 말 것*의 한 동작(verb)** — *빼기*.

## 인상 깊은 문장

> *(요지)* 코드는 더 싸졌지만, 그 코드를 *이해하는 비용은 더 비싸졌다*.

> *(요지)* LLM은 복잡성을 *두려워하지 않는다* — 그래서 "빼는 엔지니어"가 필요하다. 추가보다 *제거와 단순화*를 우선하라.

## 내 생각 · 적용점

가든의 *orchestration-tax·윈체스터·boring-tech* 스레드를 **"빼기(subtract)"라는 한 동작으로 압축**. *코드가 공짜가 될수록, 차별점은 "무엇을 안 쓸지·무엇을 제거할지"의 판단*. **친·반 AI 균형 카운팅 무관한 boring·실무 방법론 라인** (부채 +2 유지 — 친-AI 잉여 지속, axelk 능동 큐레이션 권고). CRS: *AI 생성 코드를 점진 도입 + 정기적 "빼기"(제거·단순화) 리뷰*로 복잡성 폭증을 가둠.

## 연관 자료
- [Code is Cheap(er)](https://htmx.org/essays/code-is-cheap/) (원문)
- [GeekNews — 30215](https://news.hada.io/topic?id=30215)
- [[2026-06-01-cathedral-bazaar-winchester-mystery-house]]·[[2026-05-29-orchestration-tax]] — 코드 가격 붕괴·검토 병목
- [[2026-05-25-constraint-decay-llm-agent-backend]]·[[2026-05-29-ai-frontend-lost-decade]] — 복잡성·새는 추상화
- [[2026-05-29-choose-boring-technology-2015]]·[[2026-06-01-my-software-north-star]]·[[2026-06-01-how-to-build-ai-native-startup]] — 단순화·빼기·가장 단순한 도구

## 한 달 뒤 회고
*(2026-07-01 즈음 — "빼는 엔지니어" 리뷰(제거·단순화)를 정기화했는지, AI 코드 이해 비용을 점진 도입으로 통제했는지 기록.)*
