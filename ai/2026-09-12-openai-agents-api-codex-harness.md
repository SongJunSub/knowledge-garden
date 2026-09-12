---
title: "OpenAI Agents API 공개 (OpenAI) — Codex 하네스를 통째로 매니지드 API로 판다, 그런데 Assistants API를 폐기당해 본 사람들이 제일 먼저 락인을 물었다"
source_title: "Introducing the Agents API"
source_url: "https://openai.com/index/introducing-the-agents-api/"
source_name: "openai.com, developers.openai.com"
referrer_url: "https://news.hada.io/topic?id=33516"
published_at: "2026-09-10"
summarized_at: "2026-09-12"
category: "ai"
tags: ["openai", "agents-api", "codex", "mcp", "agent-orchestration", "vendor-lock-in", "hosted-sandbox"]
---

# OpenAI Agents API 공개 (OpenAI)

> 출처: [Introducing the Agents API](https://openai.com/index/introducing-the-agents-api/) (OpenAI) · GeekNews(id=33516) 경유 · 정리일 2026-09-12

> **출처 한계**: `openai.com`·`developers.openai.com`·`news.hada.io`·`news.ycombinator.com` 모두 이번 세션 egress 정책으로 직접 열람하지 못했다. WebSearch로 InfoWorld·AgentConn·AlphaSignal·explainx.ai·BigGo Finance 등 복수 2차 매체의 요약·인용을 교차 확인해 재구성했다. GeekNews 댓글 수는 확인 불가.

## 한 줄 요약

**OpenAI가 자사 코딩 에이전트 Codex의 내부 하네스(세션 오케스트레이션·컨텍스트 압축·복구·실행 환경)를 그대로 뽑아 `Agents API`라는 매니지드 API로 2026-09-10 공개 베타 출시했다.** 개발자는 도구·MCP 서버·실행 환경(자체 호스팅 또는 OpenAI 호스팅 샌드박스)만 붙이면 되고, 별도 API 요금 없이 사용한 모델의 표준 토큰 요금만 낸다 — 다만 커뮤니티가 즉시 짚은 것은 "Assistants API를 무단폐기당한 경험"을 근거로 한 벤더 락인 우려다.

## 핵심 포인트

- **Agents API vs Agents SDK** — SDK는 개발자 자신의 앱 안에서 도는 오픈소스 프레임워크로 에이전트 루프·배포를 직접 통제하지만, Agents API는 OpenAI가 세션·오케스트레이션·컨텍스트 압축·복구를 전부 관리하는 매니지드 런타임이라는 점에서 근본적으로 다른 제품이다.
- **하네스 기능을 API로 노출** — 스킬·지시사항 적용, 작업 도중 에이전트 조종(steer), 컨텍스트 창 관리를 위한 이전 작업 요약, 하위작업 분해 및 서브에이전트 위임, 중단된 세션 재개 같은 Codex 하네스의 핵심 기능을 그대로 API 호출로 쓸 수 있게 했다.
- **실행 환경 선택권** — OpenAI 호스팅 샌드박스를 쓰거나, Blaxel·Cloudflare·Daytona·DigitalOcean·E2B·Modal·Oracle·Runloop·Vercel 등 파트너/자체 인프라의 샌드박스를 연결할 수 있다.
- **연결은 MCP로** — 외부 데이터·도구 연결은 툴 정의 또는 MCP(Model Context Protocol) 서버를 통해 이뤄진다.
- **가격 정책 — 별도 요금 없음** — Agents API 자체에 추가 수수료는 없고, 세션이 어떤 모델을 쓰느냐에 따라 그 모델의 표준 입출력 토큰 요금이 그대로 청구된다.
- ***"락인이 가장 큰 우려다. OpenAI가 모델·컨텍스트 관리·도구·오케스트레이션·실행 환경을 전부 제공하면, 다른 플랫폼으로 옮기기가 더 어려워진다"*** — 한 분석가의 지적처럼, 오케스트레이션 레이어 전체가 OpenAI 구현에 고정된다는 점이 반복적으로 언급됐다.

## 인상 깊은 문장

> "Lock-in is the biggest concern. If OpenAI provides the model, context management, tools, orchestration, and execution environment, moving to another platform becomes harder."

> "The orchestration layer is locked to OpenAI's implementation, but for teams whose differentiation is the tools, data, and workflows rather than the agent loop itself, that is likely a trade worth making." (커뮤니티 반응 종합)

## 댓글

GeekNews(id=33516) hada 댓글 수는 이번 세션 접근 차단으로 확인하지 못했다. HN에 관련 스레드(news.ycombinator.com/item?id=49649213)가 존재하는 것으로 검색됐으나 egress 차단으로 실제 포인트·댓글 수·상세 논조는 확인하지 못했다. WebSearch로 확인되는 반응만 보면, 다수 커뮤니티 논평이 "락인" 우려를 첫손에 꼽았고 그 근거로 **OpenAI가 이전 매니지드 에이전트 인프라였던 Assistants API를 짧은 공지 기간만 두고 폐기해 강제 마이그레이션을 겪었던 전례**를 반복 인용했다는 점은 짚어둘 만하다 — 이는 OpenAI 발표문 자체에는 담기지 않는 맥락이다. 반대로 "샌드박스 VM을 직접 유지보수할 부담을 없애준다"는 긍정적 평가도 공존해 온도차가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-13-codex-linux-desktop-preview]]가 지적한 "발표는 되는 것만 말한다" 패턴이 이번엔 더 크게 반복됐다

Linux Codex 프리뷰 노트가 짚었던 원칙은 "발표는 되는 것만 말하고 안 되는 것은 말하지 않는다"였다. 이번에도 발표문은 매니지드 인프라의 편의성만 강조하지, "Assistants API 폐기 전례가 있으니 이번에도 갑자기 접을 수 있다"는 리스크는 스스로 언급하지 않는다. 다만 이번엔 그 공백을 커뮤니티가 즉시, 그것도 구체적 전례를 근거로 메웠다는 점이 다르다 — 도구 사용자층이 이런 패턴에 학습되고 있다는 신호로 읽힌다.

### 핵심 전이 2 — [[2026-08-23-mcp-new-roadmap-five-areas]]와 정반대 방향에서 같은 문제(에이전트 오케스트레이션 표준화)에 답한다

MCP 로드맵 노트는 "에이전트 신원·엔터프라이즈 보안"을 프로토콜 차원의 개방형 표준으로 흡수하려는 시도였다. 이번 Agents API는 정확히 같은 문제(세션 오케스트레이션·컨텍스트 관리·실행 환경)를 OpenAI 한 회사의 폐쇄형 매니지드 스택 안에 통합해서 푼다. 같은 인프라 성숙 단계에서 "개방 프로토콜 vs 벤더 통합 스택"이라는 두 갈래 해법이 동시에 진행 중이라는 게 이 둘을 겹쳐 보면 드러난다.

### 핵심 전이 3 — [[2026-09-02-uber-software-factory-pareto-model-selection]]이 실증한 "작업별 모델을 골라 쓰는 전략"과 구조적으로 충돌할 수 있다

Uber 노트의 핵심은 "에이전트별 실작업 벤치마크로 비용/품질/신뢰성 Pareto 최적 모델을 고르고, 서브에이전트는 저렴한 모델로 돌린다"는 세밀한 모델 선택 전략이 총지출을 flat하게 유지한 비결이었다. Agents API처럼 OpenAI가 모델·오케스트레이션·실행 환경을 한 번에 묶어 제공하면, 그 안에서 다른 벤더 모델을 섞어 Pareto 최적화를 하기가 구조적으로 더 어려워질 가능성이 있다 — 매니지드 인프라의 편의와 세밀한 비용 최적화 자유도가 트레이드오프 관계에 놓인다는 것.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 이 API는 코딩 에이전트(Codex) 개발 인프라이지, CRS 제품 자체에 바로 얹을 기능이 아니다. 다만 전이 가능한 원칙은 있다: 온다가 향후 어떤 벤더의 매니지드 에이전트 인프라(모델+오케스트레이션+실행환경 번들)를 CRS 개발 파이프라인에 도입할 때는, "이번 발표문이 말하지 않는 것" — 벤더 락인 비용과 과거 유사 서비스 폐기 전례 — 을 채택 전에 명시적으로 조사·계산하는 절차를 넣어야 한다는 것. Assistants API 폐기 사례처럼, 매니지드 인프라는 편의성만큼 이탈 비용도 함께 산다.

## 연관 자료

- [[2026-08-13-codex-linux-desktop-preview]] — 같은 "발표는 되는 것만 말한다" 패턴이 이번엔 벤더 락인이라는 더 큰 리스크로 반복
- [[2026-08-23-mcp-new-roadmap-five-areas]] — 같은 에이전트 오케스트레이션 표준화 문제를 개방 프로토콜로 풀려는 정반대 접근
- [[2026-09-02-uber-software-factory-pareto-model-selection]] — 매니지드 번들 인프라가 제약할 수 있는, 실제로 총지출을 눌러준 세밀한 모델 선택 전략의 실증 사례

## 한 달 뒤 회고

*(2026-10-12 즈음 — Agents API의 정식(GA) 전환 여부, 커뮤니티가 우려한 벤더 락인이 실제 이탈 사례로 이어졌는지, HN 스레드(id=49649213) 원문을 직접 확인했는지 점검.)*
