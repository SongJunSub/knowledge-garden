---
title: "Julia Evans, Tailwind에서 벗어나며 CSS 구조화 배우기 — *추상화 도구의 졸업*이라는 학습 곡선의 모양"
source_title: "Moving away from Tailwind (and learning to structure my CSS)"
source_url: "https://jvns.ca/blog/2026/05/15/moving-away-from-tailwind--and-learning-to-structure-my-css-/"
source_name: "Julia Evans (jvns.ca)"
referrer_url: "https://news.hada.io/topic?id=29553"
published_at: "2026-05-15"
summarized_at: "2026-05-17"
category: "frontend"
tags: ["css", "tailwind", "julia-evans", "abstraction", "learning-curve", "semantic-html", "design-tokens", "tooling"]
---

# Julia Evans, Tailwind에서 벗어나며 CSS 구조화 배우기 — *추상화 도구의 졸업*이라는 학습 곡선의 모양

> 출처: [Moving away from Tailwind — Julia Evans](https://jvns.ca/blog/2026/05/15/moving-away-from-tailwind--and-learning-to-structure-my-css-/) · GeekNews 경유 [news.hada.io/topic?id=29553](https://news.hada.io/topic?id=29553) · 정리일 2026-05-17

## 🔖 한 줄 요약
Julia Evans(시스템·디버깅 글로 유명한 jvns.ca)가 여러 사이트를 *Tailwind → 시맨틱 HTML + 바닐라 CSS*로 옮긴 경험기 — 표면 주제는 CSS 도구 선택이지만, 진짜 주제는 *"추상화 도구가 학습 보조였다가 학습이 추상화를 넘어서면 도구가 짐이 된다"는 학습 곡선의 모양*. CSS 변수·컴포넌트 파일 분리·디자인 토큰 같은 *Tailwind가 잘 가르쳐 준 개념을 직접 재구현*해서 가져온다는 점이 글의 본체.

## 🧩 핵심 포인트

- **Tailwind를 *벗어난* 4가지 구체적 이유.** (1) *빌드 시스템 의존성 증가* — v2를 유지해 온 이유가 이미 *부담 인식*의 증거, (2) *2.8MB 파일 크기* — *얇음 vs 두꺼움*의 문제가 CSS에도 동일, (3) *CSS 실력 향상으로 *제약*의 필요성 감소* — **학습 곡선이 도구의 가치 곡선과 어디서 교차하는가**, (4) *시맨틱 HTML 작성 욕구* — 표현 매체로서의 코드의 *의미*가 회복되는 욕구.
- **Tailwind가 잘 가르쳐 준 *바닐라 CSS의 베스트 프랙티스*.** 디자인 토큰(색상 팔레트·폰트 스케일), 컴포넌트별 파일 분리, CSS 변수 — *모두 바닐라 CSS의 기본 좋은 습관*. **Tailwind를 쓰는 동안 그 습관이 *몸에 베인다***. 즉 Tailwind는 *나쁜 도구라서 떠나는 게 아니라*, *좋은 도구라서 그 안의 *개념*만 가지고 떠난다*. 이게 정상적인 학습 곡선의 모양.
- **남기는 자산과 버리는 부담의 분리.** Reset stylesheet·색상 팔레트·폰트 스케일·컴포넌트별 파일·CSS 변수는 *남기고*, 빌드 의존성·2.8MB·HTML 클래스 폭증은 *버린다*. **"좋은 부분만 취사선택"이 *학습 후*에만 가능**한 행위라는 점이 핵심 — Tailwind를 쓰기 전엔 *무엇이 좋은 부분인지* 모른다.
- **앞으로 학습할 *현대 CSS* 라인업.** `CSS Grid auto-fit`, `grid-template-areas`, `@layer`, `@scope`, 컨테이너 쿼리. *기본 기술을 더 깊이* 가는 방향. *추상화 도구 위에서 살았다면 *영원히 만나지 못했을* 표면*이 학습 대상으로 들어옴.
- **반론 — *도구 사용의 책임은 개발자에게*.** 커뮤니티 반응의 핵심 반박: *Tailwind 자체가 잘못이 아니라 잘못 쓰는 개발자가 잘못이다*. Julia 글에 대한 *기술적 반박*이라기보다 *기본값에 대한 입장 차이* — Julia는 *학습 곡선에 도구를 맞춘다*, 반박은 *도구에 학습 곡선을 맞춘다*. 두 입장 모두 일리 있고 *어느 시점의 개발자인가*에 따라 답이 다르다.

## 📜 인상 깊은 문장

> CSS 실력이 늘면서 Tailwind의 *제약*이 필요한 만큼 도움이 되지 않게 됐다.

> Tailwind를 사용하면서 배운 개념들 — 색상 팔레트·폰트 스케일·컴포넌트 파일 분리 — 을 직접 재구현해서 가져온다.

## 💭 내 생각 · 적용점

***추상화 도구의 졸업*이라는 학습 곡선의 모양이 가든의 여러 글을 *시간 차원으로 관통*한다.** Julia의 글은 *추상화 도구가 잘 작동하는 시기*와 *부담이 되는 시기*의 *경계*에 관한 글. 이걸 가든의 다른 글들에 적용하면 *지금 우리 도구들의 어디쯤*인지가 보인다:
- **AI 코딩 도구** — Julia 곡선의 *초기 구간*. *추상화가 학습을 보조*하는 시기. [Garry Tan Ratchet](../ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Anthropic 공식 매뉴얼](../ai/2026-05-16-claude-code-large-codebases.md)이 *지금 시기의 유리함*을 정확히 본다.
- **Tailwind** — Julia 곡선의 *졸업 구간*. 일부 개발자에게 *부담 인식*이 시작되는 시기.
- **CRS·MangoLove의 자체 도구 라인** — *학습이 도구를 넘어서면 자체 빌드로 졸업*하는 자연스러운 흐름. [Ptacek 30분 1인 빌더](../ai/2026-05-14-emacsification-of-software-ptacek.md)가 그 졸업의 *가속기*.

**[Naur 이론 형성](../engineering/2026-05-14-naur-programming-as-theory-building.md)이 *추상화 도구와 어떻게 상호작용하는가*의 정밀한 사례.** Naur는 *코드의 본체가 머릿속 이론*이라고 했다. **Tailwind는 *이론 형성의 보조*** — 어떻게 디자인 토큰을 만들고 컴포넌트를 분리하는지를 *몸으로 가르쳐 준다*. 그 *이론이 머릿속에 형성된 후*에야 Tailwind를 *떠나도 안전*해진다. 즉 *추상화 도구는 이론 형성이 끝나면 *역전*된다 — 도구 안에 있는 동안은 이론을 *대신*해 줬지만, 이론이 생기면 도구가 *이론을 가린다*.

**[Anthropic *얇은 CLAUDE.md*](../ai/2026-05-16-claude-code-large-codebases.md) 처방과 *완벽히 동형*.** 2.8MB Tailwind와 *과적합 CLAUDE.md*는 *같은 종류의 부담*. **두꺼운 추상화 = 자율 판단 공간 침식**. Julia가 Tailwind에서 *디자인 토큰만 가지고 떠나듯*, *얇은 CLAUDE.md*는 *원칙만 박고 상세는 코드/PR이 표현*한다. **"좋은 도구의 안에서 살았다가 나올 때 *무엇만* 가지고 나오는가"** 가 두 글의 공통 질문.

**[Hashimoto AI 광기](../ai/2026-05-16-hashimoto-ai-mass-psychosis.md)의 *이해 가능성* 관점에서 본 Tailwind 졸업.** Tailwind의 2.8MB는 *이해 가능성의 한계*. 바닐라 CSS로 가면 *내가 정확히 무엇을 쓰는가*가 보인다. Julia는 *조직 차원의 광기*가 아니라 *개인 차원의 광기 자가 진단*을 해서 *졸업*한 케이스. **광기 자가 진단의 처방 = *내가 쓰는 도구의 어디까지 *이해하는가*를 정기적으로 점검***. 이해하지 못한 채 의존하는 부분이 *부담의 후보*.

**[Jay Gup 경험=세금](../career/2026-05-14-experience-is-now-a-tax.md)에 대한 *영역 분리 강화*.** Jay Gup은 *경험이 부채*라 했다. Julia는 *경험(CSS 실력)이 자산*이라 한다. **둘은 정면 충돌이 아니라 *영역이 다르다***:
- *Jay Gup의 영역* = *과거 시도-번복 비용*에 기반한 *결정 알고리듬* (탐색-유지·보유-외부화·커밋-철회). 변동이 큰 시장에서 옛 비용 함수가 오답을 낳음.
- *Julia의 영역* = *기본 기술의 시간 축이 긴 축적*. CSS Grid·CSS 변수 같은 *언어/플랫폼 자체*의 학습. 변동이 작은 영역(기본 기술)에서는 *축적이 자산*.

이 분리가 가든의 *시니어 가치 논쟁*의 정밀한 답 — **시니어의 결정 *알고리듬*은 빠르게 부식하지만, 시니어의 *기본 기술*은 천천히 자산화된다**. [Eric Ries Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)의 *시간 축*과도 정확히 같은 분리.

**가든 자체에 대한 자가 적용 — 세 번째.** 이 세 번째 자가 진단은 **나의 *현재 도구들*에 Julia 곡선을 적용**하는 것. *지금 내가 *추상화로 의존*하는 도구 중 *졸업 시점*이 가까운 것은?* 후보들:
- *AI 도구 사용 자체* — 매뉴얼 단계는 끝났는가? 내 *고유 워크플로우*가 *공식 베스트 프랙티스*를 넘어선 부분이 있는가?
- *글 정리 템플릿* — `templates/article.md`의 형식을 *그냥 따르는* 단계인가, *왜 이 형식인가*를 알고 *변형*하는 단계인가?
- *MangoLove `strict.md`* — 이건 *내가 만든 추상화*. 졸업이라는 개념이 적용되는가? *원칙이 몸에 베인 시점*이 *strict.md 자체의 무게 감량*을 의미하는가?

**MangoLove·CRS·BugSip 적용 후보.**
- ***도구 졸업 표지판*을 KPI에 박기.** *팀원이 X 도구의 *내용*을 직접 재구현할 수 있게 됐는가?* 라는 *졸업 가능 여부 점검*을 분기 1회. 졸업 가능이면 *도구 자체의 의존을 줄일* 다음 분기 옵션을 *열어 둠*.
- **BugSip 초기 기술 스택 *졸업 가능성* 평가.** 처음부터 *졸업할 수 없는 추상화*(폐쇄 API·암묵 의존)를 피하는 게 [Ries 시점 잠금](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)과 같은 형식. *3년 뒤 졸업이 가능한 도구*만 선택.
- **CRS 신규 합류자 학습 트랙 *T자 모양*으로 설계.** 기본 기술(데이터베이스·HTTP·시스템 호출)은 *축적이 자산*, 도구별 추상화(특정 ORM·특정 SDK)는 *졸업 단계 있음*. [Naur 이론](../engineering/2026-05-14-naur-programming-as-theory-building.md)이 형성될 가능성이 높은 *기본 기술*에 더 무게.
- **MangoLove `strict.md`의 *부피 감량 의례*.** *원칙이 몸에 베이면 원칙의 *글*은 짧아도 된다*. 분기 1회 *몸에 베인 원칙은 한 줄로 줄이고 옆에 *왜* 만 남긴다*. [Anthropic 얇은 CLAUDE.md](../ai/2026-05-16-claude-code-large-codebases.md) 처방의 *시간적 적용*.

## 🔗 연관 자료
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *추상화 도구가 이론을 *대신*하다가 이론이 생기면 *가린다*는 역전*
- [Ptacek — Emacsification](../ai/2026-05-14-emacsification-of-software-ptacek.md) — *직접 만들기*의 비용이 0에 가까워지는 *졸업의 가속기*
- [Anthropic — Claude Code 대규모 코드베이스 사용법](../ai/2026-05-16-claude-code-large-codebases.md) — *얇은 CLAUDE.md*의 처방이 *Tailwind 졸업*과 동형
- [Hashimoto — AI 집단 광기](../ai/2026-05-16-hashimoto-ai-mass-psychosis.md) — *이해 가능성*의 개인 차원 자가 진단
- [Jay Gup — 경험은 이제 세금이다](../career/2026-05-14-experience-is-now-a-tax.md) — *경험 부채 vs 자산*의 *영역 분리* (결정 알고리듬 vs 기본 기술)
- [Eric Ries — Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *시점 잠금*과 *추상화 졸업 가능성*의 시간 축 공통 메커니즘
- [matklad — Learning Software Architecture](../engineering/2026-05-13-learning-software-architecture.md) — *기본 기술의 도제식 학습*이 시간이 갈수록 자산화되는 메커니즘

## 📝 한 달 뒤 회고
<!-- 6월 중순: 내가 *지금 의존*하는 추상화 도구 중 *졸업 시점이 가까운 것*을 한 번 줄 세웠는가? CRS 신규 합류자 학습 트랙을 *T자 모양*으로 명문화했는가? MangoLove `strict.md`의 *부피 감량 의례* 1회를 시도했는가? BugSip 기술 스택 선택 시 *3년 뒤 졸업 가능성*을 1차 점검 항목으로 박았는가? -->
