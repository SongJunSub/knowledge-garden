---
title: "대성당·바자르·윈체스터 미스터리 하우스 — AI 시대 개발의 세 번째 모델 (Lasn 측 실무 방법론: orchestration-tax 허브 역사적 종합)"
source_title: "The Cathedral, the Bazaar, and the Winchester Mystery House"
source_url: "https://www.oreilly.com/radar/the-cathedral-the-bazaar-and-the-winchester-mystery-house/"
source_name: "O'Reilly Radar (Drew Breunig) · GeekNews 경유"
summarized_at: "2026-06-01"
category: "engineering"
tags: ["software-development-model", "code-price-collapse", "review-bottleneck", "attention", "ai-coding", "winchester-mystery-house", "practice-methodology", "lasn-side"]
---

# 대성당·바자르·윈체스터 미스터리 하우스 — AI 시대 개발의 세 번째 모델 (Lasn 측 실무 방법론: orchestration-tax 허브 역사적 종합)

> 출처: [The Cathedral, the Bazaar, and the Winchester Mystery House](https://www.oreilly.com/radar/the-cathedral-the-bazaar-and-the-winchester-mystery-house/) (Drew Breunig, O'Reilly Radar, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**Eric Raymond의 1998년 "대성당과 바자르"(폐쇄형 vs 개방형)에 이어, AI 코딩 에이전트가 *세 번째 모델 = "윈체스터 미스터리 하우스"*(끝없이 증축되는 개인 맞춤 도구의 무한 확장)를 낳았다. 핵심은 ***"코드의 가격이 무너졌다"*** — Claude Code는 *커밋당 약 1,000줄 순증*을 생성(인간 개발자 일일 10~30줄의 수십 배). 그러나 *검토와 테스트 같은 피드백 비용은 그대로*라 ***병목이 (생산에서 검토로) 이동***했다. 결론: 이제 필요한 것은 ***"주의력(attention)을 싸게 만드는 도구"***다.**

## 핵심 포인트

- **세 번째 모델: 윈체스터 미스터리 하우스** — *대성당(폐쇄)·바자르(개방)*에 이어 *끝없이 증축되는 개인 맞춤 도구의 무한 확장*. *AI와 협력해 개인 도구를 무한정 늘리는 현상*. **[[2026-06-01-codex-for-every-role]] *직무별 도구 폭증* + [[2026-06-01-what-matters-when-anyone-can-build]] *누구나 만든다*의 어두운 변형** — *일관된 설계 없는 증축*(윈체스터 하우스 = 유령을 피하려 무계획 증축한 집).
- **"코드의 가격이 무너졌다"** — *1,000줄/커밋 vs 10~30줄/일*. **[[2026-05-29-claude-code-dynamic-workflows]] Bun 75만 줄·[[2026-06-01-codex-for-every-role]]의 거시 명제** — 생산은 거의 공짜.
- **병목 이동: 생산 → 검토** — *피드백 비용(검토·테스트)은 그대로*. **[[2026-05-29-orchestration-tax]] *검토 = 직렬 병목*의 가장 직접적 재진술** — 같은 명제, 역사적 프레임.
- **"주의력을 싸게 만드는 도구"가 필요** — *생산이 아니라 검토·주의력이 희소 자원*. **[[2026-06-01-engineering-in-the-era-of-llms]] *휴먼 컨텍스트* + [[2026-06-01-harness-era-software-after-ai]] *관측성·거버넌스(하네스 요소6)*가 바로 그 도구** — 검토 자동화·요약·우선순위가 "주의력 비용 절감".

## 인상 깊은 문장

> *(요지)* 코드의 가격이 무너졌다 — Claude Code는 *커밋당 약 1,000줄*을 만든다(인간의 일일 10~30줄과 비교하라). 그러나 *검토와 테스트의 비용은 그대로*다.

> *(요지)* 이제 우리에게 필요한 것은 *주의력(attention)을 싸게 만드는 도구*다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* — orchestration-tax 허브의 역사적 종합

[[2026-05-29-orchestration-tax]](검토=병목)·[[2026-06-01-domain-expertise-is-the-real-moat]](검증=해자)·[[2026-06-01-engineering-in-the-era-of-llms]](휴먼 컨텍스트)·[[2026-06-01-harness-era-software-after-ai]](하네스)가 *같은 명제*였는데, **이 글이 *Raymond 1998 → 2026 AI*의 역사적 아크로 종합** — *세 번째 개발 모델*이라는 기억에 남는 프레임. 균형 의례 부채 *-1 → 0 자연 회복* (Lasn).

### *"주의력을 싸게 만드는 도구" = 가든의 수렴 처방*

가든 전체가 한 처방으로 수렴: ***생산(코드)은 공짜가 됐으니, 희소 자원(주의력·검토·판단)을 싸게 만드는 데 투자하라***:
- *하네스 관측성·거버넌스*([[2026-06-01-harness-era-software-after-ai]])
- *작업별 하네스의 자동 검증·적대적 검증*([[2026-06-01-harness-for-every-task-dynamic-workflows]])
- *린터·LLM judges·작은 PR*([[2026-06-01-engineering-in-the-era-of-llms]])
- *도메인 전문성으로 빠른 판별*([[2026-06-01-domain-expertise-is-the-real-moat]])
→ 모두 *"주의력 비용 절감 도구"*의 구체형.

### *윈체스터 하우스 = sprawl 경고*

세 번째 모델은 *축복이자 경고* — *일관된 설계 없는 무한 증축*은 [[2026-05-29-choose-boring-technology-2015]] *혁신 토큰 낭비*·[[2026-05-28-favorite-developer-tools]] *좋은 기본값*의 반대. **AI sprawl을 막으려면 *boring한 뼈대 + 주의력 도구*가 필요** — 무한 증축을 *검토 가능한 구조*로 가둬야.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [The Cathedral, the Bazaar, and the Winchester Mystery House](https://www.oreilly.com/radar/the-cathedral-the-bazaar-and-the-winchester-mystery-house/) (원문)
- [GeekNews — 30166](https://news.hada.io/topic?id=30166)
- [[2026-05-29-orchestration-tax]] — 검토 = 직렬 병목 *(가장 직접적 재진술)*
- [[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-01-engineering-in-the-era-of-llms]]·[[2026-06-01-harness-era-software-after-ai]] — 판단·휴먼 컨텍스트·하네스 *(주의력 도구)*
- [[2026-06-01-harness-for-every-task-dynamic-workflows]] — 자동 검증 *(주의력 절감)*
- [[2026-06-01-codex-for-every-role]]·[[2026-06-01-what-matters-when-anyone-can-build]] — 도구 폭증 *(윈체스터 sprawl)*
- [[2026-05-29-choose-boring-technology-2015]]·[[2026-05-28-favorite-developer-tools]] — boring 뼈대 *(sprawl 방지)*

## 한 달 뒤 회고
*(2026-07-01 즈음 — "주의력을 싸게 만드는 도구"를 실제로 도입했는지(요약·우선순위·자동 검증), AI sprawl(윈체스터 하우스)을 boring 뼈대로 가뒀는지, 병목이 검토에 있다는 인식이 운영을 바꿨는지 기록.)*
