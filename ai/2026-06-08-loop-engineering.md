---
title: "루프 엔지니어링 — 에이전트를 프롬프트하는 시스템을 설계하라 (Lasn 측 실무 방법론: orchestration-tax의 구성적 속편)"
source_title: "Loop Engineering"
source_url: "https://addyo.substack.com/p/loop-engineering"
source_name: "addyo.substack.com (Addy Osmani) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30336"
summarized_at: "2026-06-08"
category: "ai"
tags: ["loop-engineering", "agent-orchestration", "automations", "worktrees", "sub-agents", "comprehension-debt", "practice-methodology", "lasn-side"]
---

# 루프 엔지니어링 — 에이전트를 프롬프트하는 시스템을 설계하라 (Lasn 측 실무 방법론: orchestration-tax의 구성적 속편)

> 출처: [Loop Engineering](https://addyo.substack.com/p/loop-engineering) (Addy Osmani, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Addy Osmani: AI 에이전트와의 상호작용이 *매번 직접 프롬프트*에서 ***에이전트를 프롬프트하는 자동화 시스템을 설계*(루프 엔지니어링)**로 전환된다. 루프의 5가지 구성요소: *①Automations(스케줄 기반 자동 실행) ②Worktrees(병렬 작업 충돌 방지) ③Skills(반복 프로젝트 지식 저장) ④Plugins·connectors(외부 도구 연동) ⑤Sub-agents(제작과 검증의 분리)* + *메모리(상태 저장용 마크다운/보드)*. 그러나 핵심 경고를 분명히 한다: ***검증은 여전히 사람의 책임***(루프도 실수한다), ***comprehension debt(이해 부채)*** — 자동화에만 의존하면 코드 이해 간극이 커진다, ***"엔지니어로 남을 것"*** — 단순히 시작 버튼만 누르면 안 된다.**

## 핵심 포인트

- **orchestration-tax의 구성적 속편 (같은 저자)** — [[2026-05-29-orchestration-tax]](Addy)가 *"인간 검토 = 직렬 병목, 에이전트를 검토 역량에 맞춰라"*였다면, 이 글은 *그 병목을 줄이는 시스템 설계 플레이북*. **이번 세션 허브가 *문제 진단 → 운영 처방*으로 완성**.
- **루프 5요소 = 하네스의 운영 구현** — *Automations·Worktrees·Skills·Plugins·Sub-agents*. **[[2026-06-01-harness-era-software-after-ai]] 하네스 7요소·[[2026-06-01-harness-for-every-task-dynamic-workflows]] 작업별 하네스·[[2026-06-01-how-to-build-ai-native-startup]] 6단계 규율의 *개인 워크플로 버전*** — Worktrees(격리)·Sub-agents(제작/검증 분리)는 [[2026-06-01-how-anthropic-contains-claude]] 봉쇄·[[2026-05-29-claude-code-dynamic-workflows]] 적대적 검증의 손에 잡히는 형태.
- **Skills > 매번 프롬프트** — *반복 지식을 Skills로 저장*. **[[2026-05-29-mcp-is-dead-cli-skills]] *CLI를 Skills로 래핑*과 같은 결**.
- **comprehension debt = 이해 부채** — *자동화 의존 → 코드 이해 간극*. **[[2026-06-01-code-is-cheaper]] *코드는 싸졌지만 이해 비용은 비싸졌다* + [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *검토 병목*의 명명** — 루프가 빨라도 *이해는 사람이 갚아야 할 부채*.
- **"검증은 사람, 엔지니어로 남을 것"** — *루프도 실수, 시작 버튼만 누르면 안 됨*. **[[2026-06-08-users-dont-care-but-you-should]] *품질 책임* + [[2026-06-01-domain-expertise-is-the-real-moat]] *검증=해자* + [[2026-06-01-ask-hn-genai-oh-shit-moments]] *"무엇을 해야 하는지 아는 능력 침식"* 경계** — 자동화의 끝에서도 *판단·검증은 환원 불가능*.

## 인상 깊은 문장

> *(요지)* 매번 에이전트에 직접 프롬프트하는 대신, *에이전트를 프롬프트하는 자동화 시스템을 설계*하라.

> *(요지)* 루프도 실수할 수 있다 — *검증은 여전히 사람의 책임*이다. 자동화에만 의존하면 *이해의 부채(comprehension debt)*가 쌓인다. *엔지니어로 남아라.*

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* — 허브의 운영 완성

[[2026-05-29-orchestration-tax]]에서 시작한 이번 세션의 *검토 병목 허브*가, 같은 저자의 *루프 엔지니어링*으로 **진단 → 처방으로 완성**. [[2026-06-01-harness-era-software-after-ai]]·[[2026-06-01-how-to-build-ai-native-startup]]가 *시장·조직 차원*이라면, 이 글은 *개인 엔지니어의 워크플로 차원*. 균형 의례 부채 *0 → +1 친-AI 측 빚* (44:32 ≈ 1.38:1) — 직전 Fable 5로 0 회복 후 다시 친-AI 잉여로.

### *자기 참조 — 이 세션이 곧 루프*

정직하게: **이 큐레이션 세션 자체가 루프 엔지니어링의 실연**이다 — *Worktrees(매 글마다 격리)·Sub-agents(#30249는 워크플로로 제작/검증 분리)·Skills/메모리(가든 규약·feedback 메모리)*. 그리고 Addy의 경고도 그대로 적용: *검증(링크 무결성·분류·밸런스)은 내가 책임지고, "시작 버튼만"이 아니라 매 글의 판단을 한다*. (자기 참조 메타는 여기까지 — 오버 메타화 자제.)

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [Loop Engineering](https://addyo.substack.com/p/loop-engineering) (원문)
- [GeekNews — 30336](https://news.hada.io/topic?id=30336)
- [[2026-05-29-orchestration-tax]] — 검토 = 병목 *(같은 저자, 진단→처방)*
- [[2026-06-01-harness-era-software-after-ai]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]]·[[2026-06-01-how-to-build-ai-native-startup]] — 하네스·규율 *(운영 구현)*
- [[2026-06-01-how-anthropic-contains-claude]]·[[2026-05-29-claude-code-dynamic-workflows]] — Worktrees·Sub-agents·격리·적대적 검증
- [[2026-05-29-mcp-is-dead-cli-skills]] — Skills
- [[2026-06-01-code-is-cheaper]]·[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] — comprehension debt
- [[2026-06-08-users-dont-care-but-you-should]]·[[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-01-ask-hn-genai-oh-shit-moments]] — 검증 책임·판단 침식 경계

## 한 달 뒤 회고
*(2026-07-08 즈음 — 직접 프롬프트에서 루프 설계로 옮겼는지, comprehension debt를 의식적으로 갚았는지, "시작 버튼만"이 아니라 검증·판단을 지켰는지 기록.)*
