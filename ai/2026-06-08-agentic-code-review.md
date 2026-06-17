---
title: "에이전틱 코드 리뷰 (Addy Osmani) — '작성은 싸졌으나 이해는 비싸다', 검증=병목 스레드의 캡스톤 (판단·craft·검증 라인)"
source_title: "Agentic Code Review"
source_url: "https://addyo.substack.com/"
source_name: "Addy Osmani · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30571"
published_at: "2026-06-14"
summarized_at: "2026-06-08"
category: "ai"
tags: ["code-review", "verification", "missing-intent", "blast-radius", "human-on-the-loop", "heterogeneity", "craft-line"]
---

# 에이전틱 코드 리뷰 (Addy Osmani) — '작성은 싸졌으나 이해는 비싸다', 검증=병목 스레드의 캡스톤 (판단·craft·검증 라인)

> 출처: Addy Osmani (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**AI 코딩 에이전트의 성능 향상으로 *엔지니어링의 병목이 "코드 작성"에서 "코드 검증"으로 이동*했다는 글. 2026년 데이터가 일관된 결론을 보여준다: ***에이전트는 산출량을 4배 늘리지만 실제 생산성은 약 12% 증가에 불과***하고, *코드 churn 861%↑·인시던트 242.7%↑·리뷰 시간 441.5%↑·리뷰 없이 머지된 PR 31.3%↑*. 핵심: ***"기계가 코드를 작성했으므로, 그 코드를 신뢰할지가 새로운 병목"***이고, ***"작성은 싸졌으나 이해는 여전히 비싸다 — 향후 우위는 신뢰할 수 있는 리뷰 시스템을 구축하는 팀에게."*****

## 핵심 포인트

- **병목 이동: 작성 → 검증** — *산출 4배·생산성 12%·churn 861%↑·인시던트 242.7%↑*. **[[2026-05-29-orchestration-tax]] *"검토=직렬 병목"*(같은 저자 Addy)의 데이터 완결·[[2026-06-08-formal-methods-future-of-programming]] *"검증이 병목"*과 정합** — *생성이 싸질수록 검증이 가치*([[2026-06-08-sutton-ai-creativity-discovery]]).
- **사라진 의도(Missing Intent)** — *에이전트의 추론 과정이 버려져 리뷰어가 "처음 보는 인간"이 됨*. **[[2026-06-08-dont-trust-large-context-windows]] *"명세·맥락이 진짜 memory"*·[[2026-06-08-software-made-between-commits-deltadb]] *맥락 기록*의 필요성 확증**.
- **위치별 규칙 + blast radius** — *솔로 vs 대규모 팀의 리뷰 요구가 다름, 영향 범위에 따라 리뷰 강도 조정*. **[[2026-06-08-homelab-ai-dev-platform]] *"미션 크리티컬엔 엄격, 비핵심엔 빠르게"*와 정합**.
- **AI 리뷰 = 이질성(heterogeneity)** — *"단일 최고 도구는 없음, 4개 도구가 93.4% 고유 이슈만 검출"*. **[[2026-06-08-designing-loops-with-fable-5]] *다양한 렌즈의 적대적 검증*·워크플로의 *perspective-diverse verify*와 동형**.
- **닫힌 루프 위험 = "빌려온 확신"** — *에이전트→리뷰→판정 자동화 시 맹점*. *Human on the Loop(모든 PR 읽기보다 시스템 감시·샘플링·감사)*. *"테스트 고침"(동작 변경 후 assertion 수정) 위험*.

## 인상 깊은 문장

> "Writing got cheap; understanding is still expensive. The edge goes to teams who build trustworthy review systems."
> (작성은 싸졌고, 이해는 여전히 비싸다. 우위는 신뢰할 수 있는 리뷰 시스템을 구축하는 팀에게 간다.)

> "The machine wrote the code, so whether to trust it is the new bottleneck."
> (기계가 코드를 썼으니, 그것을 신뢰할지가 새로운 병목이다.)

## 댓글

> GeekNews/HN 큐레이션 미표시(댓글 적음). 본문 데이터(Faros AI·CodeRabbit·GitClear·GitHub 동일 결론)가 핵심.

## 내 생각 · 적용점

### 5번째 라인업 *판단·craft·검증 라인* (친/axelk 축과 직교, 카운팅 무관) — 세션 캡스톤

이 글은 세션 내내 쌓은 *"생성은 싸지고 검증·평가가 가치"* 스레드의 **데이터 기반 캡스톤**이다. 같은 저자([[2026-05-29-orchestration-tax]] Addy)가 *"검토=병목"을 2026 데이터로 완결*. 라인 자산(카운팅 무관). 부채 *−1 유지* (50:40 ≈ 1.25:1).

### 핵심 전이 1 — 세션 핵심 등식의 "측정된" 완성

세션의 핵심 등식이 **수치로 닫힌다**:

| 자산 | "검증이 가치" |
|---|---|
| [[2026-06-08-sutton-ai-creativity-discovery]]·[[2026-06-08-designing-loops-with-fable-5]] | *변이는 싸지고 평가가 발견을 결정(이론)* |
| [[2026-06-08-formal-methods-future-of-programming]] | *형식 기법=검증의 최강형(방법)* |
| [[2026-05-29-orchestration-tax]] | *검토=직렬 병목(명제)* |
| **이번 글** | ***산출 4배·생산성 12%·인시던트 242%↑(측정)*** |

→ ***"작성은 싸졌으나 이해는 비싸다"가 세션 전체의 한 줄 요약***. *AI가 4배를 만들어도 12%만 남는 건, 나머지가 검증·이해·인시던트로 새기 때문*. **우위는 "생성"이 아니라 "신뢰할 리뷰 시스템"을 가진 팀**.

### 핵심 전이 2 — "Missing Intent" + "이질성" = 구체적 리뷰 설계

두 가지 실무 처방:
1. ***Missing Intent*** — *에이전트의 추론·의도를 버리면 리뷰가 비싸짐* → [[2026-06-08-dont-trust-large-context-windows]] *"명세·맥락을 시스템에"*. **에이전트에게 "왜 이렇게 했는지"를 PR에 남기게**.
2. ***이질성(heterogeneity)*** — *단일 도구가 아니라 4개 도구가 고유 이슈* → [[2026-06-08-designing-loops-with-fable-5]] *다양한 렌즈의 적대적 검증*. **하나의 AI 리뷰어를 믿지 말고, 다른 관점의 여러 검증을**.

### 핵심 전이 3 — "닫힌 루프 = 빌려온 확신" + Human on the Loop

*에이전트→AI 리뷰→판정을 전부 자동화하면 "빌려온 확신"의 맹점*이 생긴다. **[[2026-06-08-homelab-ai-dev-platform]] *"제안-승인-배포"의 사람 게이트*·[[2026-06-08-linkedin-job-offer-backdoor]] *읽기 전용 에이전트 검토*의 한계 보완** — *Human on the Loop은 "모든 PR을 읽기"가 아니라 "시스템을 감시·샘플링·감사"*. *"테스트 고침"(동작 바뀌었는데 assertion만 수정)*은 [[2026-06-08-not-everyone-uses-ai-for-everything]] *"결정론적 검증을 LLM이 망침"*의 사례 — **검증의 무결성을 에이전트에 맡기지 말 것**.

### 측정 — "생산성 12% vs 산출 4배"

*Faros·CodeRabbit·GitClear·GitHub 모두 동일 결론*은 [[2026-06-08-lines-of-code-got-a-publicist]] *"허영 지표 vs 검증된 성과"*·[[2026-06-08-productive-individuals-not-productive-firms]] *"생산적 느낌 ≠ 가치"*의 **결정적 데이터** — *산출(4배)을 측정하지 말고 가치(12%)·인시던트·churn을 측정*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *판단·craft·검증 라인* 캡스톤(세션 핵심 등식의 측정 완성). 부채 *−1 유지* (50:40).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Addy Osmani (원문) · [GeekNews — 30571](https://news.hada.io/topic?id=30571)
- [[2026-05-29-orchestration-tax]] — *"검토=병목"(같은 저자, 이 글=데이터 완결)*
- [[2026-06-08-formal-methods-future-of-programming]]·[[2026-06-08-sutton-ai-creativity-discovery]]·[[2026-06-08-designing-loops-with-fable-5]] — *"검증이 가치"(이론·방법) + 이질성=다양한 렌즈 검증*
- [[2026-06-08-dont-trust-large-context-windows]] — *Missing Intent → "명세·맥락을 시스템에"*
- [[2026-06-08-homelab-ai-dev-platform]]·[[2026-06-08-linkedin-job-offer-backdoor]] — *Human on the Loop·승인 게이트·읽기 전용 검토*
- [[2026-06-08-lines-of-code-got-a-publicist]]·[[2026-06-08-productive-individuals-not-productive-firms]] — *"산출 4배 vs 생산성 12%"(측정)*
- [[2026-06-08-human-attention-human-effort]] — *검토는 사람 몫*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "작성은 싸졌으나 이해는 비싸다"가 CRS 팀에 리뷰 시스템 투자로 이어졌는지, Missing Intent(의도 기록)·이질성(다중 검증)·Human on the Loop(샘플링·감사)을 도입했는지, "산출이 아니라 가치·인시던트로 측정"했는지, "테스트 고침" 같은 검증 무결성 훼손을 막았는지 기록.)*
