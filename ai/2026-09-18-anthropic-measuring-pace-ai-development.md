---
title: "Anthropic, AI가 AI를 개발하는 내부 현황과 감독 지표 공개 (Anthropic Institute) — Claude가 R&D의 26%를 주도해도 완전 자율 업무는 하나도 없고, 3만 에이전트를 전수 감시해도 그게 모든 위험의 탐지를 뜻하진 않는다"
source_title: "Measurements for understanding the pace of AI development inside frontier labs"
source_url: "https://www.anthropic.com/institute/measuring-pace-of-ai-development"
source_name: "Anthropic Institute 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33871"
published_at: "2026-09-17"
summarized_at: "2026-09-18"
category: "ai"
tags: ["anthropic", "ai-safety", "rd-automation-index", "agent-oversight", "transparency", "recursive-self-improvement", "compute-allocation"]
---

# Anthropic, AI가 AI를 개발하는 내부 현황과 감독 지표 공개 (Anthropic Institute)

> 출처: [Measurements for understanding the pace of AI development inside frontier labs](https://www.anthropic.com/institute/measuring-pace-of-ai-development) (Anthropic Institute 공식 블로그) · GeekNews(id=33871) 경유 · 정리일 2026-09-18
>
> **출처 한계**: `news.hada.io`와 `anthropic.com`이 이 세션의 egress 정책으로 전면 차단되어 hada 토픽 페이지(댓글 수·GN⁺ 큐레이션 여부)와 Anthropic 원문을 직접 열람하지 못했다. 아래 내용은 CNBC·SiliconANGLE·Unite.AI·AlphaSignal·BigGo Finance 등 이 발표를 다룬 여러 매체의 WebSearch 스니펫을 3회 이상 교차 확인해 재구성했다. 핵심 수치(26%, 3만 에이전트, 0.002%, 6%/12% 컴퓨트 배분)는 여러 소스에서 일관되게 재현돼 신뢰도가 높다고 판단하지만, Anthropic 원문의 정확한 문장·수치의 세부 정의(예: "주도(lead)"의 판정 기준)까지는 확인하지 못했다. Slack 발췌 마지막 문장("AI 연구개발 컴...")이 가리키는 것으로 보이는 컴퓨트 배분 수치는 WebSearch로 별도 확보해 보강했다.

## 한 줄 요약

**Anthropic은 모델 성능이 아니라 "AI가 자사 연구개발을 얼마나 대신하고 있는가"를 처음으로 정량 공개했다 — 2026년 8월 기준 Claude가 AI R&D 업무의 26%를 주도하고 90% 이상에서 협업 이상의 역할을 하지만 완전 자율 업무는 0건이며, 내부 플랫폼에서 동시에 활동하는 약 3만 개 에이전트의 모든 행동을 실행 전 감시하되(10억여 건 중 차단은 0.002%) "그 감시가 모든 위험의 탐지를 뜻하진 않는다"고 스스로 선을 긋는다.**

## 핵심 포인트

- **R&D 자동화 지수(R&D Automation Index) 첫 공개**: 2026년 8월 기준, Claude가 Anthropic ***AI 연구개발 업무의 26%를 "주도(lead)"***하고, 90% 이상에서 단순 협업 이상의 역할을 맡지만, ***완전 자율(fully autonomous) 단계에 도달한 업무는 하나도 없다*** — "AI가 AI를 만든다"는 서사에 "아직 사람 없이는 안 된다"는 조건이 그대로 딸려 있다.
- **3만 에이전트, 전수 감시**: 가장 많이 쓰는 내부 플랫폼에서 ***동시에 약 3만 개 에이전트***가 연구·엔지니어링 작업을 수행하며, 온라인 모니터가 실행 전 ***모든 행동의 100%***를(보통 수 초 내) 검사한다. 2026년 8월 한 달간 분석한 ***10억 건 이상의 에이전트 결정 중 0.002%(약 47,000건에 1건)가 차단***됐다.
- **"감시 범위 = 위험 탐지"는 아니다**: Anthropic 스스로 ***모든 행동을 감시한다고 해서 모든 위험을 탐지한다는 뜻은 아니라고 명시***한 것으로 보인다(Slack 발췌 표현) — 감시 커버리지(coverage)와 감시 효과(efficacy)를 분리해서 말하는, 자사 발표치고는 드문 정직성이다.
- **컴퓨트 배분 스냅샷**: 7월 13일~20일 한 주 동안, 전체 컴퓨트 자원의 ***약 6%가 AI 안전(safety)에, 추가로 12%가 안전에 초점을 맞춘 "AI 주도 R&D"에*** 배분됐다는 스냅샷을 공개했다.
- **목적은 벤치마크가 아니라 "속도" 측정**: 세 지표(AI 주도 R&D 비중, 에이전트 감독, 컴퓨트 배분) 모두 모델 성능이 아니라 ***"AI 개발 과정 자체가 얼마나 빨리, 얼마나 자율적으로 굴러가는가"***를 정량화하려는 시도라는 점에서 기존 모델 벤치마크 공개와는 결이 다르다. Anthropic은 다른 AI 개발사에도 유사한 지표 공개를 촉구했다.

## 인상 깊은 문장

> "약 3만 개 에이전트가 동시에 활동하며, 모든 행동을 실행 전후로 감시한다. 다만 감시 범위가 곧 모든 위험의 탐지를 뜻하지는 않는다." (Slack 발췌 재구성, WebSearch로 취지가 여러 매체에서 확인됨 — Anthropic 원문의 정확한 영어 문장을 직접 대조하지는 못했다.)

## 댓글

**hada 댓글 수 확인 불가** — `news.hada.io` 전면 차단. HN에 이 글(Anthropic Institute의 "Measuring the pace of AI development" 포스트) 자체를 다루는 전용 스레드는 이번 세션에서 찾지 못했다 — 관련은 있지만 별개인 다리오 아모디 개인 블로그 글 "Pacing the Frontier"(이 가든의 [[2026-09-13-dario-amodei-pace-the-frontier]])의 HN 스레드(553점·784댓글)는 확인되지만, 이 지표 공개 글과 혼동하지 않도록 구분해서 남긴다. Lobsters 큐레이션 여부도 미확인.

**정직하게 감안할 점**: 이 지표는 Anthropic 자신이 스스로 측정·공개한 1차 자료다 — "우리는 이만큼 감시하고 있다"는 주장을 검증할 제3자 감사 결과는 아니다. [[2026-09-13-models-dont-go-rogue-human-decisions]]가 지적했듯 "안전장치가 켜져 있었다"는 사실과 "안전장치가 실제로 작동했다"는 사실은 다른 명제인데, 이 글의 "100% 사전 감시" 수치도 커버리지일 뿐 효과성의 증거는 아니라는 걸 Anthropic 스스로도 인정한 대목(위 핵심 포인트)이 있다는 게 그나마 신뢰도를 올려준다.

## 내 생각 · 적용점

### 핵심 전이 1 — 5월의 낙관적 수치에 처음으로 "주도 vs 작성"이라는 분모가 붙었다

[[2026-06-01-recursive-self-improvement-anthropic]]는 2026년 5월 시점 "Anthropic 코드의 80% 이상이 Claude 작성"이라는 수치를 내놓으면서도 "어떤 문제를 풀 것인가는 인간의 판단"이라고 자인했던 글이다. 이 글은 그로부터 석 달 뒤 같은 회사가 내놓은 후속 수치(26% "주도")인데, 오히려 ***5월의 "80%"보다 낮은 숫자***다 — "작성(write)"과 "주도(lead)"가 다른 기준이라는 뜻으로 읽히고, 두 노트를 겹치면 Anthropic이 스스로도 이 수치들의 정의를 아직 통일하지 못했거나, 의도적으로 더 보수적인 지표(주도권 기준)로 옮겨간 것일 수 있다는 질문이 남는다.

### 핵심 전이 2 — [[2026-09-13-dario-amodei-pace-the-frontier]]가 예고한 "외부 평가자" 약속의 자사 버전 증거

다리오 아모디의 "프론티어 페이싱" 제안은 "외부 평가자에게 직원급 접근권한을 주고, 불리한 결과도 편집 없이 공개한다"는 거버넌스였다. 이 글은 그 거버넌스의 정신을 자사 내부 지표(에이전트 감독·컴퓨트 배분)로 먼저 실천해 보인 것에 가깝다 — 다만 이건 외부 평가자가 아니라 ***Anthropic 스스로 측정하고 스스로 공개***한 것이라, "외부 감사"라는 원래 약속과는 신뢰의 층위가 다르다는 걸 짚어야 한다.

### 핵심 전이 3 — "감시 커버리지 ≠ 위험 탐지"라는 자인이 선행 노트의 결론과 정확히 만난다

[[2026-09-13-models-dont-go-rogue-human-decisions]]는 OpenAI-Hugging Face 사건을 재검토하며 "안전장치가 꺼져 있었다"는 사실과 "AI가 통제를 벗어났다"는 서사를 분리했다. 이 글에서 Anthropic이 스스로 "100% 감시 ≠ 모든 위험 탐지"라고 인정한 대목은, 그 노트가 세운 원칙(안전 실패는 대개 시스템의 자율성이 아니라 인간이 설계한 경계의 허점에서 온다)을 Anthropic이 자기 지표에도 미리 적용한 셈이다.

## 호스피탈리티 / CRS 적용 포인트

온다는 프론티어 AI 랩이 아니라 이 정도 규모의 R&D 자동화 지수를 그대로 적용할 일은 없다 — ***직접 적용은 멀다.*** 다만 전이 가능한 원칙 하나: 온다가 사내에서 Claude·에이전트를 CRS 코드베이스·운영 업무에 점점 더 위임한다면, "몇 %가 자동화됐는가"만큼 "그 자동화를 몇 %나 사람이 실행 전에 검토하는가"와 "검토율이 곧 안전율은 아니다"라는 구분을 같이 남기는 습관이 유용하다 — Anthropic처럼 대규모 감독 인프라가 없더라도, PR 머지 전 리뷰 비율 같은 지표를 잴 때 "리뷰했다"와 "리뷰가 실제로 문제를 잡아냈다"를 혼동하지 않는 정도는 지금도 적용 가능하다.

## 연관 자료

- [[2026-06-01-recursive-self-improvement-anthropic]] — 5월 시점 "80% 이상 Claude 작성"이라는 선행 수치, 이 글의 "26% 주도"와 기준이 다른 후속 수치라는 점에서 직접 비교
- [[2026-09-13-dario-amodei-pace-the-frontier]] — "외부 평가자 상주"를 약속한 거버넌스 제안, 이 글은 그 정신을 자사 내부 지표로 먼저 실천한 버전
- [[2026-06-01-how-anthropic-contains-claude]] — 환경 계층 봉쇄라는 같은 회사의 다른 방어선, "3만 에이전트 전수 감시"가 실제로 어떤 격리 환경 위에서 이뤄지는지의 배경
- [[2026-09-13-models-dont-go-rogue-human-decisions]] — "감시 커버리지 ≠ 위험 탐지"라는 이 글의 자인과 정확히 만나는 선행 결론

## 한 달 뒤 회고

*(2026-10-18 즈음 — news.hada.io·anthropic.com 접근이 풀렸다면 hada 댓글·HN 전용 스레드 유무를 직접 확인하고, 원문의 정확한 인용문을 대조. 다른 프론티어랩(OpenAI 등)이 Anthropic의 촉구대로 유사 지표를 실제로 공개했는지도 점검.)*
