---
title: "Anthropic Claude Tag 공개 — Slack 팀원으로서의 '지속적·비동기 AI', LLM UX의 3번째 패러다임(Karpathy) + 내부 코드 65% (단 회의 공존) (AI 도구 설계·제품 라인)"
source_title: "Introducing Claude Tag"
source_url: "https://www.anthropic.com/news/introducing-claude-tag"
source_name: "Anthropic · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30809"
published_at: "2026-06-23"
summarized_at: "2026-06-08"
category: "ai"
tags: ["claude-tag", "async-agent", "ambient-agent", "slack", "interaction-paradigm", "governance", "audit", "ai-teammate"]
---

# Anthropic Claude Tag 공개 — Slack 팀원으로서의 '지속적·비동기 AI', LLM UX의 3번째 패러다임(Karpathy) + 내부 코드 65% (단 회의 공존) (AI 도구 설계·제품 라인)

> 출처: [Introducing Claude Tag](https://www.anthropic.com/news/introducing-claude-tag) (Anthropic · GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**Anthropic이 *Claude를 팀원으로 합류시키는* Claude Tag를 공개(Slack이 첫 시작점, Opus 4.8 구동). ***"@Claude"를 태그해 작업을 위임***하면 *백그라운드에서 수 시간~수일 자율 수행*. 핵심 설계: ①***멀티플레이어*** — *"채널 안에는 모두와 상호작용하는 하나의 Claude가 있다"*(모두가 작업을 보고 이어받음) ②***축적되는 맥락***(채널을 따라가며 학습, 권한 시 다른 채널·데이터 소스도) ③***ambient(선제) 동작***(미해결 스레드·작업 후속 처리) ④***거버넌스***(채널별 도구·정보 접근 지정, *분리된 Claude 정체성으로 메모리까지 채널 범위로 한정*, 토큰 지출 한도·감사 로그). Anthropic 내부에선 ***제품팀 코드의 65%*** 가 내부 버전으로 작성(단 벤더 자기보고). 댓글이 짚은 의미: 이는 ***LLM UI/UX의 3번째 패러다임(Karpathy)*** — ***웹사이트 → 다운로드 앱 → "도구·맥락을 갖춘 독립적·지속적·비동기적 존재로 팀과 협업"***. 단 회의도 공존(복잡도 래칫·토큰 판매 인센티브·메모리 환각·엔터프라이즈 컴플라이언스 불명확·멀티플레이어 정보 비공개 보장 불가).**

## 핵심 포인트

- **"지속적·비동기 팀원" = 채팅의 다음 패러다임** — ***웹 → 앱 → "독립적·지속적·비동기 존재"***(Karpathy). 위임 후 *수 시간~수일 자율*. **상호작용 모델이 "내가 묻고 답 받기"에서 "맡기고 내 일 하기"로** — [[2026-06-08-the-coming-loop]] *하네스 루프*·[[2026-06-08-harness-engineering-jaehong]] *비동기 에이전트*의 제품화.
- **멀티플레이어 + 축적 맥락** — *채널당 하나의 Claude, 모두가 작업을 보고 이어받음*, *반복 설명 불필요*. → "개인 챗봇"이 아니라 "팀 공유 동료". [[2026-05-13-interaction-models-thinking-machines]] *상호작용 모델*과 연결.
- **거버넌스가 도입의 관문** — *채널별 도구·정보 접근 지정, 분리된 정체성으로 메모리까지 채널 범위 한정, 토큰 한도·감사 로그*. **"능력"보다 "권한 경계·감사·범위 한정"이 엔터프라이즈 도입 가능성을 가름** — [[2026-06-08-the-untrainable]] *권한·책임*·[[2026-06-08-hacking-google-with-ai-bug-bounty]] *감사·격리*의 제품화.
- **내부 65% 코드(벤더 자기보고, 회의 함께)** — *제품팀 코드 65%가 내부 Claude Tag로, 엔지니어링 넘어 지표·티켓·버그 원인 분석까지 확산*. 단 HN 회의: ***"복잡도 증가가 모델 개선을 앞지를 가능성"·"토큰 판매자로서 사용량 유도 인센티브"·"메모리 환각·부풀려진 출처"·"멀티플레이어는 정보 비공개 보장 불가"·"엔터프라이즈 컴플라이언스 통과 방식 불명확"***.
- **출시/상업** — *Enterprise·Team 베타(2026-06-23), "Claude in Slack" 대체, 30일 내 옵트인, 런칭 크레딧 Enterprise $25k·Team $2.5k*. → 명백한 *enterprise·services-as-software* 베팅([[2026-06-08-who-prices-intelligence]]).

## 인상 깊은 문장

> "주어진 Slack 채널 안에는 모두와 상호작용하는 하나의 Claude가 있다." (멀티플레이어)

> "도구와 맥락을 갖춘 독립적이고, 지속적이며, 비동기적인 존재로서, 사람들로 이뤄진 팀과 함께 작업한다." (3번째 패러다임 — Karpathy, 댓글)

> "제품팀 코드의 65%가 내부 버전 Claude Tag로 작성됐다." (Anthropic 자기보고 — 곧이곧대로 받지 말 것)

## 댓글 (전수 확인)

> **댓글 2개 전수 확인:**
- ***xguru: Karpathy의 LLM UI/UX 3단계(웹사이트→다운로드 앱→지속적 비동기 팀원) 소개 — "개념 이해엔 시간이 걸리지만 실제로 작동하며 훌륭하다."***
- *GN⁺의 Hacker News 큐레이션*: **긍정**(Claude Code CLI 사용자 호평·비동기/ambient 유용성) / **회의**(65% 통계 — 복잡도가 모델 개선 앞지를 우려·토큰 판매 인센티브·보안/컴플라이언스 불명확·메모리 환각·멀티플레이어 정보 비공개 불가) / **제품 전략 비판**(매주 1~2개 출시 후 소식 없는 패턴·Cursor 등 대비 지체).

→ **무게중심**: *발표(지속적 비동기 팀원·65%)에 대해 댓글은 "패러다임 전환은 진짜(Karpathy 3단계) + 그러나 거버넌스·복잡도·벤더 인센티브를 의심하라"는 균형*.

## 내 생각 · 적용점

### AI 도구 설계·제품 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *상호작용 패러다임·거버넌스·제품 설계*. 65% 등은 *벤더 자기보고(친-측 주장)*지만 제품 발표라 라인 자산으로 처리(카운팅 무관). [[2026-06-08-the-coming-loop]]·[[2026-06-08-harness-engineering-jaehong]]·[[2026-06-08-anthropic-skills-building-guide]]의 제품화 종합. 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — "지속적 비동기 팀원" 패러다임을 내 워크플로에

가장 전이력 높은 통찰: ***상호작용이 "묻고 답 받기"에서 "맡기고 내 일 하기(비동기·축적 맥락)"로*** — 이건 [[2026-06-08-the-coming-loop]] *하네스 루프*·[[2026-06-08-harness-engineering-jaehong]] *비동기 서브에이전트가 더 낫다*의 제품 실현. 내 작업(이 가든 정리도 백그라운드 잡으로 돌고 있음)·**MangoLove를 "채팅 도구"가 아니라 "맥락 쌓는 비동기 팀원/하네스"로 포지셔닝**하는 방향과 정확히 일치. 단 [[2026-06-08-the-coming-loop]] 경계대로 *오래 가는 핵심 코드는 human-in-loop*.

### 핵심 전이 2 — "능력보다 거버넌스가 도입을 가른다"

***채널별 권한·분리된 정체성·메모리 범위 한정·토큰 한도·감사 로그*** 가 제품의 절반 — [[2026-06-08-the-untrainable]] *"병목은 지능이 아니라 권한·책임"*·[[2026-06-08-hacking-google-with-ai-bug-bounty]] *감사·격리*의 제품 증명. **AI를 팀/시스템에 들일 때 "얼마나 똑똑한가"가 아니라 "권한 경계·감사·범위 한정·데이터 격리"가 실제 도입 가능성을 결정**. 내가 AI 도구를 설계/도입할 때 거버넌스를 1급 요구사항으로.

### 핵심 전이 3 — "65%"를 곧이곧대로 받지 않기 (벤더 인센티브·노이즈 거르기)

***"제품 코드 65%"*** 는 *토큰을 파는 벤더의 자기보고*다 — [[2026-06-08-noise-bottleneck]] *"마케팅 vs 실제 갭을 거르고 충분히 알고 판단"*·[[2026-06-08-jobs-and-software-broken]] *"측정 대용물 게임"* 경계. **어떤 코드(단명·변환 vs 오래 가는 핵심)인지, 복잡도 래칫([[2026-05-14-ai-coding-complexity-ratchet-garry-tan]])이 모델 개선을 앞지르는지를 본다.** 비동기 팀원은 *지표 추적·티켓 트리아지·버그 원인 분석* 같은 반복/탐색에 강하고(↔ the-coming-loop "루프 적합"), 핵심 도메인 설계는 여전히 사람.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *AI 도구 설계·제품 라인*(친/axelk 직교, 65%는 벤더 자기보고로 회의 병기, 카운팅 무관). 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Anthropic (원문) · [GeekNews — 30809](https://news.hada.io/topic?id=30809)
- [[2026-06-08-the-coming-loop]]·[[2026-06-08-harness-engineering-jaehong]] — *"하네스 루프·비동기 에이전트(이 제품의 개념적 토대)"*
- [[2026-06-08-anthropic-skills-building-guide]]·[[2026-06-08-slack-agentic-testing]] — *"도구·맥락·Skills·Slack 표면"*
- [[2026-06-08-the-untrainable]]·[[2026-06-08-hacking-google-with-ai-bug-bounty]] — *"권한·책임·감사·격리가 거버넌스"*
- [[2026-06-08-who-prices-intelligence]]·[[2026-05-13-interaction-models-thinking-machines]] — *"enterprise·services-as-software·상호작용 모델"*
- [[2026-06-08-noise-bottleneck]]·[[2026-06-08-jobs-and-software-broken]]·[[2026-05-14-ai-coding-complexity-ratchet-garry-tan]] — *"65% 같은 벤더 통계·복잡도 래칫을 회의적으로"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — 에이전트를 "비동기 팀원"으로 쓰는 패턴(반복/탐색 위임, 핵심은 human-in-loop)을 적용했는지, AI 도입 시 "권한·감사·범위 한정"을 1급 요구사항으로 봤는지, 벤더 "65%" 통계를 곧이곧대로 받지 않고 어떤 코드인지 분별했는지, MangoLove를 "비동기 팀원/하네스"로 포지셔닝했는지 기록.)*
