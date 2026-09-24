---
title: "Stripe의 사내 업무용 AI 플랫폼 Kai — 4,000개의 중복 에이전트를 정리한 것은 새 모델이 아니라 공유 인프라였다 (Stripe / LangChain)"
source_title: "How Stripe Built Kai on Deep Agents in 1 Week / Meet Stripe's Knowledge AI Platform"
source_url: "https://www.langchain.com/blog/how-stripe-built-their-knowledge-ai-platform-on-deep-agents"
source_name: "LangChain Blog, Stripe.dev Blog, GeekNews(id=34198) 경유"
referrer_url: "https://news.hada.io/topic?id=34198"
published_at: "2026-09 (정확한 게시일 미확인, LangChain·Stripe.dev 블로그 동시 게재로 추정)"
summarized_at: "2026-09-24"
category: "ai"
tags: ["stripe", "kai", "internal-ai-platform", "deep-agents", "langchain", "agentstudio", "enterprise-ai"]
---

# Stripe의 사내 업무용 AI 플랫폼 Kai

> 출처: [How Stripe Built Kai on Deep Agents in 1 Week](https://www.langchain.com/blog/how-stripe-built-their-knowledge-ai-platform-on-deep-agents) (LangChain Blog, GeekNews 경유) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`langchain.com`·`stripe.dev` 모두 egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장 "API, AgentStudio, 실행 환경의…"에서 잘림)와 WebSearch(LangChain 블로그, Stripe.dev 블로그, X(트위터)의 Emily Sands·Harrison Chase 게시물, daily.dev·digg 등 2차 보도) 교차확인으로 재구성했다. 인용은 전부 WebSearch가 반환한 스니펫 기반이라, 원문 전체 맥락과는 다를 수 있다.

## 한 줄 요약

**Stripe는 영업·재무·컴플라이언스 업무를 돕던 4,000개 이상의 중복 마이크로 에이전트를 정리하기 위해, 공용 API·부서별 에이전트를 만드는 AgentStudio·공유 실행 환경 세 층으로 이뤄진 사내 AI 플랫폼 Kai를 만들었다 — 첫 버전은 엔지니어 한 명이 LangChain의 Deep Agents 프레임워크로 일주일 만에 구축했고, 발표 시점 기준 직원 83%가 매주 사용한다.**

## 핵심 포인트

- **4,000개+ 마이크로 에이전트가 낳은 중복·품질 문제** — 각 팀이 개별적으로 만든 ***업무별 마이크로 에이전트가 4,000개를 넘어서면서***, 비슷한 프롬프트가 여러 번 중복 작성되고 지시문 품질이 팀마다 들쭉날쭉해 유지보수 부담이 커졌다.
- **3층 아키텍처: API·AgentStudio·실행 환경** — ***표면에 무관한 공용 API***(웹앱·Slack·기존 사내 도구에서 동일 에이전트 호출), 부서(영업·재무·컴플라이언스 등)가 직접 ***스킬과 에이전트를 만들고 거버넌스하는 AgentStudio***, 세션·도구·코드·파일 서비스를 공통 제공하는 ***공유 실행 환경***으로 나뉜다 — 공통 인프라와 부서별 전문성을 분리한 구조다.
- **엔지니어 1명, 1주일, Deep Agents 프레임워크** — 첫 버전은 ***LangChain의 Deep Agents***를 기반으로 엔지니어 한 명이 일주일 만에 만들었다는 것이 이 사례의 화제성 핵심이다.
- **83% 주간 활성 사용자, 1,000개 이상 스킬** — 발표 시점 기준 직원 ***83%가 매주 사용***하며, 영업·고객 성공·기술 영업 등 GTM 조직 거의 전원이 포함된다. 1,000개 이상의 스킬이 4개 층 위에서 동작한다는 수치도 확인된다.

## 인상 깊은 문장

> "My Stripe career is divided into before and after Kai."
> (LangChain 블로그가 인용한 Stripe 직원 코멘트, WebSearch 교차확인 재인용 — 원문 맥락 미확인)

## 댓글

**확인 불가.** hada 댓글 수는 원문 매체 접근 차단으로 확인하지 못했다. HN에서도 관련 논의가 있었던 것으로 보이나(Glean·Notion AI와 비교하는 반응, Stripe의 자기 제품 dogfooding에 대한 신뢰, 반대로 데이터 유출·환각 우려를 짚는 반응이 있었다는 것을 WebSearch로 확인) 구체적인 점수·댓글 수는 특정하지 못했다. **이 글 자체가 Stripe·LangChain 양쪽의 홍보 콘텐츠(자사 사례 발표 + LangChain의 고객 성공 사례)라는 점을 감안해야 한다** — "83%가 매주 사용"이라는 채택률 수치의 정의(로그인만 해도 카운트되는지, 실제 업무 완료까지 포함하는지)는 원문에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "에이전트가 늘어나면 결국 공유 플랫폼 문제가 된다"는 패턴이 가든에 반복해서 쌓이고 있다

이 사례는 [[2026-08-10-doordash-ai-agent-gateway]]와 거의 같은 문제의식에서 출발한다 — DoorDash는 200개 이상의 MCP 서버와 30개 이상의 에이전트가 생기면서 인증·권한·자격증명 관리가 감당 안 돼 중앙 게이트웨이를 만들었고, Stripe는 4,000개의 중복 마이크로 에이전트가 생기면서 공용 API·거버넌스 계층·공유 실행 환경으로 통합했다. ***"에이전트를 먼저 각자 자유롭게 만들게 뒀다가, 개수가 임계점을 넘으면 공유 인프라로 수렴한다"***는 조직의 성장 곡선이 반복되는 셈이다. [[2026-08-18-ly-sage-security-ai-agent-platform]]가 보여준 "판단은 사람에게 남기고 AI는 무엇을 봐야 하는지만 정리한다"는 설계 철학과 나란히 놓으면, Kai의 3층 구조에서도 ***AgentStudio가 부서별 판단(도메인 전문성)을 담당하고 공유 실행 환경은 순수 인프라만 제공***한다는 점에서 같은 계보로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

직접 규모는 다르지만(Stripe는 수천 명 조직, 온다는 훨씬 작다) 전이 가능한 원칙은 있다 — **부서마다 각자 프롬프트·봇을 따로 만들기 전에, 공통 실행 환경(세션·도구·로그·자격증명 관리)과 부서별 거버넌스 계층을 먼저 분리해 설계**하는 것이 나중에 중복·유지보수 부채를 피하는 길이다. 영업·CS·운영이 각자 GPT 프롬프트를 흩어 쓰기 시작하는 초기 단계에서, "언제 공유 플랫폼으로 통합할 것인가"의 임계점(Stripe는 4,000개 에이전트가 그 신호였다)을 미리 정의해두는 것이 실무적으로 쓸 만하다.

## 연관 자료

- [[2026-08-10-doordash-ai-agent-gateway]] — 같은 문제(에이전트 난립)를 게이트웨이·인증 계층으로 푼 사례, Kai의 "공용 API" 층과 대응
- [[2026-08-18-ly-sage-security-ai-agent-platform]] — "판단은 사람에게, AI는 정리만" 설계 철학, Kai의 AgentStudio 층과 같은 계보
- [[2026-09-15-samsung-llm-gateway-subscription-to-server]] — 사내 LLM 사용을 게이트웨이로 통합한 국내 사례, 같은 "흩어진 것을 하나로 모은다" 패턴
- [[2026-08-17-staff-engineer-at-stripe-in-2026]] — 같은 회사(Stripe)의 엔지니어링 문화, "AI 접근이 쉬워진 만큼 기대치도 올라간다"는 서술과 Kai의 채택률이 맞물린다

## 한 달 뒤 회고

*(2026-10-24 즈음 — Kai의 실제 원문(Stripe.dev·LangChain 블로그)에 직접 접근해 "83% 주간 활성 사용자"의 정확한 정의와, 4,000개 에이전트에서 통합 이후 실제로 몇 개로 줄었는지, 에이전트 오작동·환각으로 인한 사고 사례가 보고됐는지 확인.)*
