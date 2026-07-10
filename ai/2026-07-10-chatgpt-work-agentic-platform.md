---
title: "ChatGPT Work (OpenAI) — '질문 답변을 넘어 앱·파일·브라우저를 오가는 업무 에이전트', 재무팀 월말 마감을 며칠에서 몇 시간으로"
source_title: "ChatGPT for Your Most Ambitious Work"
source_url: "https://openai.com/index/chatgpt-for-your-most-ambitious-work/"
source_name: "OpenAI"
referrer_url: "https://news.hada.io/topic?id=31281"
summarized_at: "2026-07-10"
category: "ai"
tags: ["openai", "chatgpt-work", "agentic-platform", "codex", "computer-use", "scheduled-tasks", "enterprise-ai", "workflow-automation", "ux-confusion"]
---

# ChatGPT Work (OpenAI) — '질문 답변을 넘어 앱·파일·브라우저를 오가는 업무 에이전트', 재무팀 월말 마감을 며칠에서 몇 시간으로

> 출처: [ChatGPT for Your Most Ambitious Work](https://openai.com/index/chatgpt-for-your-most-ambitious-work/) (OpenAI) · 정리일 2026-07-10

## 한 줄 요약

**OpenAI가 ChatGPT를 "질문 답변을 넘어 앱·파일·브라우저를 오가는 업무 에이전트"로 확장한 ChatGPT Work를 출시했다. Codex 기술로 실제 작업을 수행하고 GPT-5.6이 다단계 추론을 담당한다. OpenAI 내부 테스트에서 거의 100% 팀이 사용 중이며, 영업팀은 discovery 대화를 24시간 안에 PoC로 전환하고 재무팀은 월말 마감을 며칠에서 몇 시간으로 단축했다. 다만 출시 직후 "ChatGPT Classic" 개명과 인터페이스 변경으로 사용자 혼란이 컸다.**

## 핵심 포인트

- **정의** — 복잡한 프로젝트를 작은 단계로 나누어 단계별로 완료, "하나의 요청으로 전체 워크플로를 이어갈" 수 있도록 설계.
- **기술 기반** — **Codex 기술**: 웹·모바일·데스크톱에서 실제 작업 수행. **GPT-5.6**: 다단계 추론·템플릿 기반 자료 생성 담당.
- **주요 기능**:
  1. **앱 연결** — Slack·Microsoft Teams·Google Drive·SharePoint·이메일·캘린더·CRM 등 플러그인 연결
  2. **Scheduled Tasks** — 반복 업무 자동화(일정 반복, 이벤트 발생 시 실행)
  3. **Sites in ChatGPT** — 인터랙티브 웹사이트/앱 생성
  4. **Computer Use** — 클릭·입력·파일 이동 등 백그라운드 작업 자동화
- **플랫폼별 제공** — 웹·모바일: Pro·Enterprise·Edu부터 Plus·Business로 확대. 데스크톱: Mac·Windows에서 Free 포함 모든 플랜.
- **보안·관리** — Enterprise/Edu는 접근 권한·회사 컨텍스트·연결 도구·실행 가능한 작업을 중앙 관리. **Auto-review로 민감 작업 사전 검토.**
- **내부 테스트 결과** — OpenAI 내부에서 **거의 100% 팀 사용 중**. 영업팀: discovery 대화를 24시간 안에 PoC로 전환. 재무팀: 월말 마감을 **며칠→몇 시간**으로 단축.

## 인상 깊은 문장

> "하나의 요청으로 전체 워크플로를 이어간다."

## 댓글 — HN 20개 이상 계층적 답글 전수 확인 (GN⁺ 큐레이션)

- **인터페이스 혼란 비판 집중**: 기존 ChatGPT 앱이 **"ChatGPT Classic"**으로 이름 변경된 점 비난. Chat 스레드가 작은 팝업 창으로 축소된 점 지적. **Work와 Codex의 구분이 불명확**하다는 지적.
- **UX 설계 실수 비판**: 앱 통합 과정에서의 기술적 문제점.
- **경쟁 서비스 비교**: Claude Cowork(Anthropic)와의 비교 논의.
- **선택지 모호성**: 에이전트 기능과 기존 채팅 기능의 차이를 설명하려는 시도들, Codex/ChatGPT 선택의 모호성.

## 내 생각 · 적용점

### 핵심 전이 1 — "Auto-review로 민감 작업 사전 검토"가 [[2026-07-03-short-leash-ai-coding-method]]·[[2026-07-03-agent-autonomy-levels]]의 실전 구현

Enterprise용 Auto-review 기능은, 지난주 정리한 "짧은 목줄"·"에이전트 자율성 6단계"의 원칙(고위험 작업엔 인간 검토 유지)을 대기업 제품 차원에서 그대로 구현한 것이다. **CRS가 자체 AI 에이전트를 설계할 때 "어떤 작업을 Auto-review 대상으로 지정할 것인가"를 명시적으로 정의하는 것이 실무적 다음 단계다.**

### 핵심 전이 2 — 인터페이스 혼란이 [[2026-06-30-code-review-purpose-maintainability]]·[[2026-07-06-anthropic-losing-developer-goodwill]]과 같은 패턴 — 이해 가능성과 투명성의 실패

"Work와 Codex의 구분이 불명확하다"는 비판은, 지난번 정리한 "이해 가능한 소프트웨어"·"Anthropic 신뢰 위기"에서 반복 확인된 문제의식과 정확히 겹친다. **제품이 강력해질수록 "사용자가 지금 무슨 모드에서 무엇을 하고 있는지 이해할 수 있는가"가 채택률을 좌우한다는 것을 대기업 출시에서도 확인.** CRS 관리자 UI에 여러 AI 기능(자동 요금 조정, 챗봇, 리포트 생성 등)을 추가할 때 이 실패 사례를 반면교사로 삼아야 한다.

### 핵심 전이 3 — "재무팀 월말 마감 며칠→몇 시간"이 구체적 ROI 벤치마크를 제공

이 수치는 [[2026-07-06-zuckerberg-agentic-slower-than-expected]]에서 다룬 "챗봇 vs 에이전트 오류 비대칭"과 대조된다. **재무 마감처럼 규칙이 명확하고 검증 가능한 작업(회계 데이터 대조)은 에이전트 자동화 효과가 극적이지만, 그렇지 않은 창의적·판단 집약적 작업은 여전히 제한적이라는 패턴이 이번에도 확인된다.** CRS에서 자동화 우선순위를 정할 때 "규칙이 명확한가"를 1차 필터로 삼아야 한다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-03-short-leash-ai-coding-method]] — *Auto-review가 짧은 목줄 원칙의 대기업 제품 구현*
- [[2026-07-03-agent-autonomy-levels]] — *중앙 관리되는 실행 권한이 자율성 캘리브레이션의 실전 사례*
- [[2026-07-06-anthropic-losing-developer-goodwill]] — *제품 혼란·불투명성이 신뢰를 훼손하는 반복 패턴*
- [[2026-07-06-zuckerberg-agentic-slower-than-expected]] — *"규칙 명확한 작업만 극적 효과" 패턴의 재확인*

## 한 달 뒤 회고
*(2026-08-10 즈음 — ChatGPT Work의 인터페이스 혼란이 해소됐는지, CRS 관리자 UI에 AI 기능을 추가할 때 "무슨 모드인지 명확한가"를 검증했는지 기록.)*
