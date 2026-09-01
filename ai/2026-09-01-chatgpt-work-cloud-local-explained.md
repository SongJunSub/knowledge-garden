---
title: "ChatGPT Work의 작동 방식 (Simon Willison 추정 외 종합) — Work Cloud와 Work Local은 다른 제품이고, 하위 에이전트 병렬 실행은 Chat이 아니라 Work에만 있으며, 사용량은 Chat과 별도로 Codex 한도를 나눠 쓴다"
source_title: "Understanding ChatGPT Work"
source_url: "https://simonwillison.net/2026/Aug/30/understanding-chatgpt-work/"
source_name: "simonwillison.net (직접 접근 불가 — dev.to·latent.space·help.openai.com 등 교차검증)"
referrer_url: "https://news.hada.io/topic?id=33078"
published_at: "2026-08-30 (추정)"
summarized_at: "2026-09-01"
category: "ai"
tags: ["chatgpt-work", "gpt-5-6", "sub-agents", "codex", "openai", "agentic-platform", "sol-terra-luna"]
---

# ChatGPT Work의 작동 방식: 일반 Chat과 무엇이 다른가

> 출처: [Understanding ChatGPT Work](https://simonwillison.net/2026/Aug/30/understanding-chatgpt-work/) (simonwillison.net 도메인으로 검색됨) · 정리일 2026-09-01
> **출처 한계**: `simonwillison.net`·`news.hada.io`·`help.openai.com` 등 전부 이번 세션 egress 차단되어 원문을 한 줄도 못 읽었다. dev.to, latent.space(제목만 확인, 본문 미확인), DataCamp, BYDFi 등 2차 매체의 WebSearch 스니펫으로 재구성했고, **저자가 실제로 Simon Willison인지도 도메인명으로 강하게 시사될 뿐 원문 직접 확인은 못했다** — 이 점은 정직하게 남긴다. 핵심 기술적 사실(Work Cloud/Local 구분, 서브에이전트, 지속 파일시스템, 과금 분리)은 서로 독립된 소스 3곳 이상에서 일치해 신뢰도는 있는 편이다.

## 한 줄 요약

**지난 7월 [[2026-07-10-chatgpt-work-agentic-platform]]에서 다룬 ChatGPT Work가 출시 두 달 뒤 실제로 어떻게 작동하는지 뜯어본 해설이다.** 핵심은 표면 UX로는 잘 드러나지 않는 세 가지 구분 — **Work Cloud와 Work Local은 서로 다른 제품**이고, **서브에이전트 병렬 실행은 일반 Chat에는 아예 없는 Work 전용 기능**이며, **Work 사용량은 Chat과 별도로 Codex 한도를 공유해서 빠져나간다**는 것이다.

## 핵심 포인트

- **Work Cloud** — Codex 하네스 위에서 동작한다. 작업공간이 영속 스토리지에 동기화되고 필요할 때 격리된 microVM에 다시 얹힌다 — "밑에 깔린 기계는 바뀌어도 작업 상태는 그대로 이어진다"는 구조다. 매 Work 세션마다 스크래치 폴더가 생기고, 그 폴더는 대화가 끝나도 대화 간에 계속 남는다.
- **Work Cloud 전용 기능(Chat엔 없음)** — 인터넷 연결된 코드 실행, Chrome 브라우저 자동화, 세션 간 영속 파일시스템, ChatGPT Sites(Cloudflare Workers 위에 D1·R2까지 쓰는 상태 유지형 웹사이트/앱 배포), 그리고 **서브에이전트** — 복잡한 작업을 서로 다른 모델의 하위 에이전트에 병렬로 위임하는 기능. **일반 Chat은 서브에이전트를 아예 실행할 수 없다.**
- **Work Local** — 데스크톱 앱에서 사용자가 명시적으로 권한을 준 뒤 로컬 폴더를 직접 쓸 수 있는 별도 경로. 웹·모바일의 Work는 이 옵션이 없고 클라우드 쪽 대화·업로드된 파일만 다룬다.
- **모델 선택** — GPT-5.6 **Sol**(가장 어려운 추론·전문 업무용 플래그십), **Terra**(속도·비용·성능 균형, 일상 업무용), **Luna**(가장 빠르고 저렴) 중 고르고, 추론 수준도 Light~Ultra까지 선택 가능. **Ultra 수준은 서브에이전트에 더 적극적으로 위임하는 방향으로 작동**한다.
- **가격·이용 조건** — ChatGPT Work는 월 $20 이상(Plus 이상) 유료 구독자만 이용 가능. Free·Go 요금제는 일반 Chat에서 GPT-5.6 Terra를 무료로 쓸 수 있지만 Work 자체는 이용할 수 없다.
- **눈에 잘 안 띄는 과금 구분** — $20 구독자 기준 Chat 모델 접근은 "High" 추론 단계에서 상한이 걸리고, **ChatGPT Work 세션의 사용량은 Chat과 별도 한도가 아니라 Codex 사용량 한도를 함께 나눠 쓴다.** Work를 많이 쓰면 Codex 코딩 작업에 쓸 수 있는 한도가 줄어드는 구조라는 뜻인데, 이건 UI 표면에서 잘 드러나지 않는다.

## 인상 깊은 문장

> "ChatGPT Work sessions are billed against your Codex allowance, while Chat sessions get their own separate allowance." (2차 소스 교차검증으로 재구성한 인용 — 원문 정확한 워딩은 미확인)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가** — 관련 도메인 전부 차단. 다만 latent.space가 별도로 "Unpacking ChatGPT Work: the Agent for a Billion Users"라는 심층 해설을, DataCamp가 "ChatGPT Work vs Claude Cowork" 비교 글을 냈다는 검색 결과는, 이 주제가 8월 말 기준 AI 업계에서 활발히 논의됐다는 정황을 보여준다.

## 내 생각 · 적용점

### 핵심 전이 1 — "Work와 Codex의 구분이 불명확하다"는 비판에 대한 사후 답변, 그런데 답변이 비판을 강화한다

[[2026-07-10-chatgpt-work-agentic-platform]]은 출시 직후 HN이 "Work와 Codex의 구분이 불명확하다"고 비판했다고 기록했다. 이번 해설이 그 답을 내놓는데, 내용 자체가 오히려 그 비판을 강화한다 — Work와 Codex는 기능만 다른 게 아니라 **사용량 한도를 공유하는 같은 계정**이었다. 두 달이 지나서야 3자 해설을 통해 이 구조가 명확해졌다는 것 자체가, "제품이 강력해질수록 사용자가 지금 무슨 모드에서 무엇을 쓰고 있는지 이해할 수 있는가가 채택률을 좌우한다"는 지난 노트의 진단이 여전히 유효함을 보여준다.

### 핵심 전이 2 — 서브에이전트 감사 공백의 영향 범위가 커진다

"서브에이전트는 Work에만 있고 Chat에는 없다"는 이번 구분은 [[2026-07-15-codex-encrypting-subagent-prompts-audit-gap]]이 다룬 "서브에이전트 통신 감사 가능성" 문제의 전제 조건이 된다. Codex 하네스가 암호화한 서브에이전트 메시지를 감사하지 못하게 된 그 이슈는, Work의 서브에이전트 병렬 위임 기능이 확산될수록 실질적 영향 범위도 함께 커진다는 뜻이다.

### 핵심 전이 3 — 도구 선택 가이드를 다시 읽게 만든다

[[2026-08-02-opinionated-guide-which-ai-to-use]]는 "ChatGPT Work·Claude Cowork는 이메일·Drive·웹을 활용하고, Codex·Claude Code는 더 광범위한 컴퓨터 조작이 가능하다"고 네 도구를 구분했다. 이번 해설은 Work 자체가 Codex 하네스 위에서 돈다는 걸 보여줘, 그 구분이 완전히 분리된 두 카테고리가 아니라 **연속선**이라는 걸 드러낸다 — "Work는 Codex와 다른 도구"가 아니라 "Work는 Codex를 감싼 특정 워크플로"로 이해하는 게 더 정확해 보인다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이나 실무적으로 확인할 가치가 있는 것이 하나 있다 — **Work Cloud의 세션 간 영속 스크래치 폴더**는, 매번 새로 컨텍스트를 설명해야 하는 반복 업무(예: 특정 호텔 체인의 요금 정책 문서를 계속 참조하며 여러 세션에 걸쳐 작업하는 경우)에 실질적으로 유용할 수 있다. 다만 **사용량이 Codex 한도와 공유된다**는 과금 구조는 실제 도입 전에 먼저 확인해야 할 항목이다 — 팀이 이미 Codex를 코딩용으로 쓰고 있다면 Work 도입이 그 한도를 잠식할 수 있다.

## 연관 자료

- [[2026-07-10-chatgpt-work-agentic-platform]] — Work 출시 당시 노트, 이 글이 그 후속 심층 해설.
- [[2026-07-15-codex-encrypting-subagent-prompts-audit-gap]] — 서브에이전트 통신 감사 공백, Work의 서브에이전트 기능 확대로 영향 범위가 커진 이슈.
- [[2026-08-02-opinionated-guide-which-ai-to-use]] — Work/Codex/Cowork/Claude Code 도구 선택 가이드, 이번 해설로 "Work=Codex 워크플로"라는 더 정확한 이해로 보정.

## 한 달 뒤 회고

*(2026-09-30 즈음 — Work의 사용량-Codex 한도 공유 구조가 실제 청구서에서 체감됐는지, 서브에이전트 감사 공백 이슈가 Work 확산과 함께 커졌는지, latent.space·DataCamp의 심층 비교 글도 원문 접근이 가능해지면 재확인.)*
