---
title: "Codex가 서브에이전트 프롬프트를 암호화하기 시작했다 — 내 컴퓨터에서 도는 에이전트가 받은 명령조차 검사할 수 없다면 감사 가능성은 회귀한 것이다"
source_title: "Regression: encrypted MultiAgentV2 messages remove readable task audit trail (Issue #28058)"
source_url: "https://github.com/openai/codex/issues/28058"
source_name: "github.com/openai/codex"
referrer_url: "https://news.hada.io/topic?id=31449"
published_at: "2026-06-13"
summarized_at: "2026-07-15"
category: "ai"
tags: ["auditability", "observability", "agent-transparency", "privacy-vs-hostile", "dual-content-contract", "prompt-orchestration-moat", "latent-space-comms"]
---

# Codex가 서브에이전트 프롬프트를 암호화하기 시작했다 — 내 컴퓨터에서 도는 에이전트가 받은 명령조차 검사할 수 없다면 감사 가능성은 회귀한 것이다

> 출처: [Regression: encrypted MultiAgentV2 messages remove readable task audit trail (openai/codex Issue #28058)](https://github.com/openai/codex/issues/28058) (ignatremizov) · 정리일 2026-07-15

## 한 줄 요약

**OpenAI Codex의 PR #26210이 다중 에이전트 통신(MultiAgentV2)의 페이로드를 암호화하면서, 부모 에이전트의 로컬 롤아웃 이력·추적·감사 화면에서 사람이 읽을 수 있는 평문 작업 지시가 사라졌다. 전달 경로 암호화(프라이버시 강화)는 이해하지만, 이 때문에 로컬 감사 가능성(auditability)이 회귀했다. 이슈 작성자는 "새 기능을 요구하는 게 아니라 사라진 감사 정보를 되돌려 달라"는 프레임으로, 수신 모델에는 암호문을 전달하되 부모 측 이력에는 별도의 평문 감사 사본을 함께 보존하는 "이중 콘텐츠 계약"을 제안한다.**

## 핵심 포인트

- **무엇이 사라졌나** — `spawn_agent`, `send_message`, `followup_task` 호출 시 로컬에 암호문만 남아, **어떤 작업이 하위 에이전트에 위임됐는지·무슨 메시지를 보냈는지 사후에 파악 불가**.
- **회귀 vs 신기능의 프레이밍** — 작성자는 "감사 로그를 되돌려 달라"는 회귀 관점을 택한다. 해결책 = **전달 경로(암호문)와 감사 경로(평문)를 분리하는 "이중 콘텐츠 계약"** — 보안과 투명성은 트레이드오프가 아니라 병존 가능하다.
- **왜 암호화했나(추정)** — 댓글 다수 의견: ① 경쟁 모델 훈련용 프록시·중국 암시장 재판매 방어 ② 다른 공급자가 OpenAI의 다중 에이전트 오케스트레이션을 역공학하는 것을 차단. "Codex의 IP는 코드베이스보다 프롬프트 구성·순서·오케스트레이션에 있다."
- **미래상(잠재 공간 통신)** — 원 스레드의 한 클러스터(tpurves): 프런티어 AI는 결국 에이전트 간 통신에서 인간 가독 표현을 버리고 언어보다 효율적인 **잠재 공간(latent space) 표현**으로 갈 수 있다.

## 인상 깊은 문장

> "The encrypted delivery path is understandable as privacy hardening, but it also removes the human-readable task/message text from local rollout history, trace reduction, and parent-side audit/debug surfaces."

> "Keep the existing encrypted `message` field as the delivery payload. Add a required, non-encrypted plaintext companion to each v2 communication tool."

> (댓글) "내 컴퓨터에서 수십~수백 개의 확률적 에이전트가 실행되는데 그 에이전트들이 받은 명령조차 검사할 수 없다는 건 황당하다."

## 댓글 — GN⁺의 HN 큐레이션 10개 클러스터 + 원 스레드(14 최상위) 누락분 확인

**GeekNews 자체 댓글 1개(= GN⁺의 HN 큐레이션, 10개 클러스터). 원 스레드(HN item 48905028, 14 최상위 클러스터)를 교차검증해 GN⁺가 약화·누락한 것도 확인했다.**

- **프라이버시 강화 vs 사용자 적대성** — 같은 암호화가 "프라이버시 하드닝"으로도, "DRM식 사용자 통제 박탈(RIAA 방식)"로도 읽힌다. "처음엔 동형 암호인가 했는데 결국 평범한 탐욕으로 보인다."
- **로컬 도구 오작동** — "코딩 에이전트 세션을 검사하는 내 로컬 도구가 왜 멈췄는지 이제 알겠다. 사용자 컴퓨터에서 실행될 외부 암호화 명령을 얼마나 많은 사람이 받아들일지."
- **안전장치 실패 우려** — "최근 서브에이전트가 실수로 사용자의 홈 디렉터리를 삭제했다는 보고가 있었는데, 하위 에이전트가 뭘 하려는지 볼 수 없으면 안전장치까지 실패하는 것 아닌가."
- **개방 하네스의 전략적 가치** — 논쟁 상당수가 "대체 하네스에서 계속 쓸 수 있나", "app-server RPC로 연동 가능한가", "프록시를 벤더가 직접 제공하는가"에 쏠림. Anthropic/Google은 자체 하네스에 추가 요금을 받는데 그게 OpenAI를 쓰는 이유였다는 지적.
- **누락분(원 스레드)** — 이슈 작성자 본인 해명("프롬프트는 이미 클라이언트를 거치며 변경은 디스크 영속화에만 영향, 나는 multi_agent_v1을 쓴다"), 그리고 "잠재 공간 통신으로의 이행"이라는 철학적 미래상 클러스터가 GN⁺ 한국어판에서 약화됨.

## 내 생각 · 적용점

### 핵심 전이 1 — "받은 명령조차 검사할 수 없다" = 감사 가능성이라는 최근 며칠의 축의 반례

이 이슈는 최근 반복 확인한 "계측·감사 가능성" 축의 **반례(악화 사례)**다. [[2026-07-13-own-the-outer-loop]]의 Answerability("무엇을 보냈는지 재구성 가능해야 한다"), [[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]]의 "내 경계에서 직접 봐라", [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]의 계측 — 이 모두가 "투명성"을 향하는데, 이 사례는 그 반대로 간다. **자율 에이전트를 도입할 때 위임된 지시의 사람 가독 감사 로그는 선택이 아니라 책임 있는 시스템의 필수 요건**이라는 것 — 호스피탈리티/CRS처럼 자동화가 실제 예약·재고·요금에 손대는 도메인에 그대로 전이된다.

### 핵심 전이 2 — 프라이버시 강화 vs 사용자 적대성: 벤더-사용자 이해 정렬

같은 기술이 정반대로 읽히는 이유는 **벤더의 유인(IP 보호·훈련 방어)과 사용자의 유인(디버깅·감사·이해)이 어긋나기** 때문이다. 기술적 정당성만으로는 신뢰를 얻지 못한다. 이건 [[2026-07-06-anthropic-losing-developer-goodwill]]의 "모델 제공자가 하네스도 공급하는 이해충돌", [[2026-07-13-i-love-llms-i-hate-hype]]의 "가치 포획" 논쟁과 같은 계열이다.

### 핵심 전이 3 — "개발 도구의 진짜 해자는 프롬프트 오케스트레이션"

"Codex의 IP는 코드베이스보다 프롬프트 구성·순서·오케스트레이션에 있다"는 통찰은, 마침 같은 배치에서 정리한 [[2026-07-15-wrapping-the-unpredictable-genius]]의 "해자는 모델이 아니라 wrap"과 정확히 만난다. 그리고 이 암호화가 그 오케스트레이션을 숨기려는 시도라는 점에서 [[2026-07-15-hardware-eating-software-value-migration]]의 "가치가 어디에 쌓이는가"와도 이어진다 — **AI 시대 개발 도구의 경쟁력은 모델 가중치가 아니라 에이전트를 어떻게 배치·지휘하는가로 이동한다.**

### 핵심 전이 4 — 잠재 공간 통신이라는 근본 질문

"에이전트 간 통신이 결국 인간 언어를 버리고 잠재 공간 표현으로 갈 수 있다"는 전망은, 향후 소프트웨어의 상당 부분이 사람이 직접 읽지 못하는 표현 위에서 돌아갈 때 **우리가 어떻게 통제·감사·디버깅할 것인가**라는 근본 질문을 던진다. 이건 [[2026-06-30-last-people-who-know-how-it-works]]("작동을 아는 마지막 세대")의 걱정을 에이전트 통신 층위로 밀어붙인 것이고, [[2026-07-14-understanding-is-the-new-bottleneck]]의 "이해가 병목"이 물리적으로 불가능해지는 시나리오다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-13-own-the-outer-loop]] — *Answerability = "무엇을 보냈는지 재구성 가능해야 한다"의 정반대 사례*
- [[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]] — *투명성·계측 vs 이 사례의 불투명화*
- [[2026-07-15-wrapping-the-unpredictable-genius]] — *"해자는 모델이 아니라 오케스트레이션/wrap"과 만남*
- [[2026-07-06-anthropic-losing-developer-goodwill]] — *벤더-사용자 이해 정렬 문제*

## 한 달 뒤 회고
*(2026-08-15 즈음 — CRS/온다에 자율 에이전트를 붙일 때 "위임된 지시의 사람 가독 감사 로그"를 필수 요건으로 설계했는지, 벤더의 불투명화가 우리 감사 능력을 해치지 않는지 점검했는지 기록.)*
