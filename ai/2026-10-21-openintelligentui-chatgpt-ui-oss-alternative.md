---
title: "OpenIntelligentUI - ChatGPT Intelligent UI의 오픈소스 대체 구현 (CopilotKit) — 벤더 전용 기능이 2주 만에 누구나 가져다 쓸 수 있는 오픈소스 패턴으로 내려왔다"
source_title: "OpenIntelligentUI"
source_url: "https://github.com/CopilotKit/OpenIntelligentUI"
source_name: "CopilotKit (GitHub)"
referrer_url: "https://news.hada.io/topic?id=35735"
published_at: "확인 불가"
summarized_at: "2026-10-21"
category: "ai"
tags: ["generative-ui", "copilotkit", "ag-ui", "open-source", "chatgpt", "agent-ui"]
---

# OpenIntelligentUI - ChatGPT Intelligent UI의 오픈소스 대체 구현 (CopilotKit)

> 출처: [OpenIntelligentUI](https://github.com/CopilotKit/OpenIntelligentUI) (CopilotKit, GitHub) · GeekNews(id=35735) 경유 · 정리일 2026-10-21
>
> **출처 한계**: `news.hada.io`·`github.com` 모두 이번 세션에서 egress 차단(`getaddrinfo ENOTFOUND`)으로 직접 열지 못했다. WebSearch로 저장소 자체는 명확히 특정했다 — `trendshift.io`가 TypeScript 프로젝트로 분류하고 스타 약 1.6k·포크 214개라고 집계했으며, GitHub raw README(`raw.githubusercontent.com/CopilotKit/OpenIntelligentUI/main/README.md`)가 "CopilotKit·AG-UI 기반, MIT 라이선스"라고 설명하는 걸 확인했다. 다만 이 수치·설명은 WebSearch 스니펫을 통한 재구성이라 README 전체 문장을 1:1로 대조하지는 못했고, 실제 설치·구동 테스트는 하지 않았다. Slack 발췌(마지막 문장 끊김)와 WebSearch 결과가 "질문에 맞춰 텍스트·표·차트·대화형 도구 중 형식을 고른다"는 핵심에서 일치해, 두 소스를 함께 근거로 쓴다.

## 한 줄 요약

**CopilotKit이 AG-UI 프로토콜 위에 OpenAI ChatGPT의 'Intelligent UI'(차트·지도·계산기·조작 가능한 설명으로 답하는 기능)를 오픈소스로 재현한 MIT 라이선스 프로젝트로, 질문 성격에 맞춰 텍스트·표·차트·다이어그램·대화형 도구 중 형식을 모델이 직접 골라 대화 안에 렌더링하고, 뒤이은 요청으로 표현 형식을 바꾸거나 UI에서 고른 값을 다음 에이전트 작업에 넘길 수 있다.**

## 핵심 포인트

- **ChatGPT의 벤더 전용 기능을 오픈소스로** — ChatGPT처럼 ***질문에 차트와 지도, 계산기, 조작 가능한 설명으로 답하는 UI를 자신의 앱에 구현하는 오픈소스 프로젝트***다. [[2026-10-08-gpt-6-intelligent-ui-chatgpt]]가 다룬 OpenAI의 Intelligent UI는 ChatGPT 안에서만 동작하는 제품 기능(소스 비공개)이었는데, 이 프로젝트는 그 기능을 외부 개발자가 자신의 애플리케이션에 직접 통합할 수 있는 형태로 재현했다.
- **형식을 모델이 직접 고른다** — ***질문에 따라 텍스트와 표, 차트, 다이어그램, 대화형 도구 중 적절한 형식을 선택해 대화 안에 표시***한다. 단순한 질문엔 텍스트로, 비교가 필요하면 표나 차트로, 구조를 설명해야 하면 다이어그램으로 — 이 판단 자체를 모델에게 맡기는 설계다.
- **구체적 산출물 예시** — ***알고리즘을 단계별로 따라가는 설명, 슬라이더로 회전하는 3D 모델, 입력값에 따라 결과가 바뀌는 계산기, 여행 경로를 보여주는 지도*** 등을 생성한다고 소개된다. ChatGPT Intelligent UI의 "저축 계산기·비용 분할 도구·비교표·여행 지도"라는 산출물 목록과 거의 겹친다.
- **후속 요청으로 표현을 바꾸고, 값을 다음 작업에 전달** — ***"표로 비교해 줘" 다음에 "차트로 보여 줘"처럼 후속 요청으로 표현을 바꾸고, UI에서 선택한 값을 다음 에이전트 작업에 전달 가능***하다는 점이 이 프로젝트가 단순 렌더링을 넘어선다는 신호다 — 사용자가 UI에서 조작한 상태(슬라이더 값, 선택한 옵션)가 그냥 화면에 머물지 않고 에이전트의 다음 단계 입력으로 다시 들어간다. (WebSearch 교차확인) CopilotKit·AG-UI 기반이라는 점도 이 "UI ↔ 에이전트 상태 양방향 연결"을 기술적으로 뒷받침한다 — AG-UI는 에이전트와 프론트엔드 사이의 상태 동기화를 표준화하려는 프로토콜이다.

## 인상 깊은 문장

> "표로 비교해 줘" 다음에 "차트로 보여 줘"처럼 후속 요청으로 표현을 바꾸고, UI에서 선택한 값을 다음 에이전트 작업에 전달 가능 (Slack 발췌 인용)

## 댓글

GeekNews(hada) 댓글 수·HN/Lobsters 큐레이션 유무는 원문 차단으로 확인하지 못했다. CopilotKit은 에이전트-UI 통합 프레임워크를 만드는 회사이므로, 이 프로젝트가 자사 프레임워크(CopilotKit·AG-UI)의 활용 사례이자 홍보 성격을 겸한다는 점은 감안해야 한다 — "OpenAI 기능의 오픈소스 재현"이라는 프레이밍 자체가 자사 제품을 돋보이게 하는 선택이기도 하다. 스타 1.6k·포크 214개(WebSearch 집계)는 공개 후 관심도를 보여주지만 실제 프로덕션 채택 여부를 말해주지는 않는다.

## 내 생각 · 적용점

**핵심 전이 — 가든에 쌓인 "생성형 UI" 계열 세 글이 "벤더 제품 → 개발자 도구 → 오픈소스 재현"이라는 확산 경로를 완성한다.** [[2026-08-28-antigravity-interactive-ui-artifacts]]는 Google Antigravity가 "조작 가능한 화면을 만드는" 기능을 코딩 에이전트 개발자 도구에 추가한 사례였고, [[2026-10-08-gpt-6-intelligent-ui-chatgpt]]는 같은 아이디어가 10억 명 이상이 쓰는 일반 소비자 챗봇의 기본 기능으로 내려온 사례였다. 이번 OpenIntelligentUI는 세 번째 단계다 — ***벤더가 소스를 공개하지 않은 소비자 기능을, 외부 커뮤니티가 공개된 프로토콜(AG-UI) 위에서 재현해 아무 애플리케이션에나 가져다 쓸 수 있게 만들었다.*** "개발자 전용 → 소비자 기본 기능 → 오픈소스 재현"이라는 세 노트의 순서는, 생성형 UI라는 아이디어가 얼마나 빨리(GPT-6 Intelligent UI 공개 후 약 2주 안에) 벤더 종속을 벗어나 범용 패턴으로 확산되는지를 보여준다. 다만 그 GPT-6 노트가 지적한 경고 — ***"동작하는 화면이 곧 맞다는 증거처럼 느껴진다"*** — 는 이 오픈소스 버전에도 그대로 적용된다. 누가 만들었든 "화면이 그럴듯하게 동작한다"는 사실이 "그 화면의 계산이 맞다"는 증거는 아니다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성 있음.** CopilotKit·AG-UI가 공개 프로토콜이라는 점은, [[2026-10-08-gpt-6-intelligent-ui-chatgpt]] 노트가 "직접 적용은 멀다"고 밝혔던 벽(ChatGPT Intelligent UI는 벤더 전용 기능이라 가져올 수 없었다)을 일부 낮춘다 — 온다 CRS 고객센터 상담 화면이나 매니저 대시보드에서 "상황에 맞는 요금 비교표·재고 캘린더·환불 시뮬레이터를 대화형으로 즉석 생성"하는 기능을, 이제는 오픈소스 프레임워크 위에서 직접 실험해볼 수 있는 길이 열렸다는 뜻이다. 다만 "UI에서 선택한 값을 다음 에이전트 작업에 전달"하는 구조는 재무·요금처럼 되돌리기 어려운 작업에 쓰려면 반드시 사람이 최종 확인하는 단계를 두어야 한다 — 생성된 화면의 그럴듯함과 그 화면이 수행하는 계산의 정확성은 별개라는 원칙은 여기서도 그대로 적용된다.

## 연관 자료

- [[2026-10-08-gpt-6-intelligent-ui-chatgpt]] — 이 프로젝트가 직접 재현 대상으로 삼은 OpenAI의 원조 기능, "동작하는 화면이 곧 증거처럼 느껴진다"는 같은 경고가 적용된다.
- [[2026-08-28-antigravity-interactive-ui-artifacts]] — "조작 가능한 화면을 에이전트가 만든다"는 같은 아이디어의 개발자 도구 버전, 확산 경로의 첫 단계.

## 한 달 뒤 회고

2026-11-21 즈음, `github.com` 접근이 가능해지면 README 원문으로 전면 재작성하고, 이 프로젝트가 실제 프로덕션에 채택된 사례가 나왔는지, 그리고 생성된 화면의 계산 오류를 다룬 비판이 있었는지 확인.
