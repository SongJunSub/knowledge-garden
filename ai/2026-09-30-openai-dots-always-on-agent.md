---
title: "OpenAI Dots - 상시 작동하는 AI 에이전트 공개 (OpenAI) — 4,000개 앱에 연결된 '두 번째 뇌'가, 대화창을 닫아도 계속 일한다"
source_title: "OpenAI's Dots are always-on agents that can investigate, build, and act across 4,000 apps"
source_url: "https://www.digitaltrends.com/computing/openais-dots-push-ai-beyond-chatbots-with-always-on-agents-that-can-investigate-build-and-act-across-4000-apps/"
source_name: "Digital Trends (OpenAI DevDay 2026 발표 보도)"
referrer_url: "https://news.hada.io/topic?id=34501"
published_at: "2026-09-29"
summarized_at: "2026-09-30"
category: "ai"
tags: ["openai", "dots", "always-on-agent", "gpt-6-astra", "devday-2026", "personal-agent", "agentic-ai"]
---

# OpenAI Dots - 상시 작동하는 AI 에이전트 공개 (OpenAI)

> 출처: [OpenAI's Dots are always-on agents that can investigate, build, and act across 4,000 apps](https://www.digitaltrends.com/computing/openais-dots-push-ai-beyond-chatbots-with-always-on-agents-that-can-investigate-build-and-act-across-4000-apps/) (Digital Trends) · GeekNews(id=34501) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `news.hada.io`·`openai.com` 모두 이번 세션 egress 차단으로 원문을 직접 열람하지 못했다. WebSearch로 교차확인한 Digital Trends, SiliconANGLE, TheNextWeb, 9to5Google, Windows Report 등 복수 매체 보도로 재구성했다. 핵심 사실(4,000개 앱 연결, Pro/Business Premium 대상, GPT-6 Astra 기반)은 여러 매체에서 일관되게 확인되지만, "작업별 허용·승인·차단 범위를 사전에 설정한다"는 Slack 발췌의 구체 UI 동작은 원문(OpenAI 공식 페이지)을 직접 열람하지 못해 2차 보도 수준으로만 검증했다. `news.ycombinator.com`도 차단돼 HN 반응은 확인하지 못했다.

## 한 줄 요약

**OpenAI가 GPT-6 Astra 기반의 상시 작동 에이전트 Dots를 공개했다 — 자체 클라우드 컴퓨터와 브라우저로 대화창을 닫은 뒤에도 여러 프로젝트를 이어서 진행하고, 4,000개 이상의 앱에 연결되며, Custom Rules로 어떤 행동을 자율 실행·승인 대기·완전 차단할지 사용자가 사전에 정할 수 있다.**

## 핵심 포인트

- **GPT-6 Astra 기반, 자체 클라우드 컴퓨터** — Dots는 ***자체 클라우드 컴퓨터와 브라우저***에서 작동하며, 사용자가 로그아웃한 뒤에도 여러 프로젝트를 계속 진행한다. 고객 피드백을 코드 수정·테스트·PR로 만들거나, 새 데이터에 맞춰 연구 분석을 갱신하고, 청구서를 준비해 승인 후 발송하는 식의 다단계 작업을 이어서 처리한다.
- **4,000개 이상 앱에 연결, 대화 채널을 넘나들며 맥락 유지** — ***4,000개 이상의 앱***에 플러그인으로 연결되고, ChatGPT·Slack·Teams 어디서 대화해도 작업 맥락이 유지된다. 진행 상황과 사용자의 결정이 필요한 사항을 먼저 알릴 수 있다.
- **Custom Rules로 자율성의 경계를 사전 설정** — ChatGPT 앱 설정에서 Dot이 ***독립적으로 수행할 수 있는 행동, 수동 승인이 필요한 행동, 완전히 차단할 행동***을 구분해 지정할 수 있다고 보도된다(Slack 발췌와 일치하지만, 정확한 UI·기본값은 원문 미확보로 확정하지 못했다).
- **Pro·Business Premium 한정, 첫 Dot은 무료** — Dots는 ***ChatGPT Pro와 Business Premium 가입자***(적격 시장 한정)에게만 제공되며, 기본 Dot 1개는 무료이고 추가 Dot은 나중에 붙일 수 있다.
- **OpenAI 내부에서도 실사용 중** — OpenAI는 Slack에서 버그가 언급되면 Dot이 자동으로 조사하거나, "새 디자인이 나오면" 곧바로 작동하는 앱을 만드는 식으로 사내에서 이미 쓰고 있다고 밝혔다.

## 인상 깊은 문장

> "OpenAI has officially launched Dots, a new class of always-on AI agents designed to keep working on users' goals even when they are not actively chatting with them." (WebSearch로 확인한 복수 매체 보도의 공통 표현을 재구성)

## 댓글

**hada 댓글 수 확인 불가**(원문 페이지 egress 차단). HN 큐레이션 여부도 확인하지 못했다. **정직하게 감안할 점**: Dots는 OpenAI가 자사 발표를 통해 공개한 신제품이라, "사용자 선호와 업무 기준을 학습한다"는 표현이 실제 운영 데이터로 검증된 것인지 마케팅 문구인지는 이번 세션 자료만으로는 구분하기 어렵다. 또한 이 노트는 DevDay 2026 발표 당일 자료로 재구성한 것이라, 실사용 리뷰·장애 사례는 아직 반영되지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — "언제나 켜져 있는 개인 에이전트" 경쟁에서 Meta Muse와 정반대 포지셔닝

[[2026-09-26-alexandr-wang-why-building-muse]]에서 Meta Alexandr Wang은 Muse를 "반쯤 흘린 말만 듣고도 이메일을 보내고 전화를 걸고 자금을 찾는" 개인 생활의 "두 번째 뇌"로 포지셔닝했다. Dots도 "대화창을 닫아도 계속 일한다"는 상시성은 같지만, 강조점은 코드 수정·PR·청구서 발송·연구 분석 갱신처럼 ***업무 실행***에 있다 — 개인의 소원을 대신 이뤄주는 Muse와, 업무 파이프라인의 다음 단계를 대신 처리하는 Dots는 "상시 작동 에이전트"라는 같은 형태를 완전히 다른 시장(소비자 개인 생활 vs 업무 자동화)에 겨냥한 셈이다.

### 핵심 전이 2 — Microsoft가 막 포기한 "동반자" 노선과의 대조

[[2026-09-27-microsoft-abandons-personal-ai-companion-race]]는 Microsoft가 불과 며칠 전 "사람들이 원하는 건 개인적 동반자가 아니라 일을 끝내도록 돕는 도구"라며 개인 AI 챗봇 경쟁에서 철수했다고 정리했다. Dots의 공개 시점과 메시지(업무를 대신 끝내주는 에이전트)는 정확히 Microsoft가 결론 내린 "일을 끝내는 도구" 방향과 일치한다 — Microsoft가 개인 동반자 경쟁을 접은 바로 그 주에, OpenAI는 "동반자가 아니라 업무 실행자"로 포지셔닝을 명확히 하며 같은 시장에 뛰어들었다. 업계 전체가 "정서적 동반자"보다 "일을 끝내는 에이전트" 쪽으로 수렴하고 있다는 신호로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

CRS 운영에서 "상시 작동 에이전트"가 매력적인 지점은 명확하다 — 예약 변경 요청이 야간에 들어와도 Dot류 에이전트가 초안을 만들어두고, 담당자가 출근하면 승인만 하는 흐름이 가능해진다. 다만 Custom Rules(자율 실행/승인 대기/완전 차단 구분) 개념은 CRS처럼 규제·감사 대응이 중요한 도메인에서 그대로 참고할 만하다 — 요금 조정·환불처럼 금전이 오가는 작업은 항상 승인 대기로, 조회·요약 같은 저위험 작업만 자율 실행으로 분리하는 정책 설계에 직접 적용 가능하다.

## 연관 자료

- [[2026-09-26-alexandr-wang-why-building-muse]] — 경쟁하는 "상시 작동 개인 에이전트" 비전, 개인 생활 대 업무 실행이라는 포지셔닝 차이
- [[2026-09-27-microsoft-abandons-personal-ai-companion-race]] — Microsoft가 막 접은 "개인 동반자" 노선과의 시점상 대조
- [[2026-09-30-openai-devday-2026-summary]] — 같은 DevDay 2026 배치의 발표 총정리
- [[2026-09-30-gpt-6-1-sol-release]] — 같은 배치에서 발표된 기반 모델(GPT-6 Astra 계열)의 하위 티어

## 한 달 뒤 회고

*(2026-10-30 즈음 — Dots의 실사용 리뷰·오작동 사례가 나왔는지, Custom Rules 설계가 실제로 얼마나 세밀한지, Meta Muse·Microsoft Copilot과의 실사용 비교가 나왔는지 확인.)*
