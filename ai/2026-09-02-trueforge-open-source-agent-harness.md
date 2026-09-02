---
title: "TrueForge (TrueFoundry) — LLM을 실행 가능한 에이전트로 바꾸는 실행 루프 전체를 하나의 오픈소스 런타임으로 패키징하다"
source_title: "truefoundry/trueforge: The open-source agent harness"
source_url: "https://github.com/truefoundry/trueforge"
source_name: "GitHub (truefoundry/trueforge)"
referrer_url: "https://news.hada.io/topic?id=33138"
published_at: "2026-08-19"
summarized_at: "2026-09-02"
category: "ai"
tags: ["ai-agent", "agent-harness", "mcp", "sandbox", "open-source", "typescript", "self-hosted", "catalog"]
---

# TrueForge (TrueFoundry) — LLM을 실행 가능한 에이전트로 바꾸는 실행 루프 전체를 하나의 오픈소스 런타임으로 패키징하다

> 출처: [truefoundry/trueforge](https://github.com/truefoundry/trueforge) (GitHub, MIT) · 경유: GeekNews(id=33138) · 정리일 2026-09-02
> **출처 한계**: `news.hada.io`·`www.truefoundry.com`·`news.ycombinator.com`이 전부 egress 차단이라 원문을 직접 열지 못했다. GitHub 저장소 README는 직접 WebFetch로 확인했고, 나머지는 WebSearch 2차 보도와 Slack 발췌를 종합해 재구성했다.

## 한 줄 요약

**TrueForge는 모델 호출부터 MCP 도구·샌드박스·승인·컨텍스트 관리·세션 상태까지 "에이전트 실행 루프" 전체를 대신 돌려주는 MIT 라이선스 오픈소스 런타임이다.** 핵심은 "카탈로그" 개념 — 모델·MCP 서버·`SKILL.md` 스킬·샌드박스를 한 번 등록해두면 여러 에이전트가 그걸 골라 쓰는 구조라, 매 에이전트마다 배선을 반복하지 않아도 된다.

## 핵심 포인트

- **정의** — "the runtime layer that turns an LLM into a working agent".
- **세 가지 노출 형태** — ①내장 채팅 UI, ②HTTP API + TypeScript SDK, ③애플리케이션에 임베드하는 UI SDK.
- **모델 지원** — OpenAI·Anthropic·Google Gemini 및 OpenAI 호환 엔드포인트를 YAML 카탈로그로 등록해 관리.
- **MCP 도구** — 원격 MCP 서버를 헤더 인증 또는 OAuth로 연결.
- **스킬 시스템** — git 기반 명령어 패키지를 필요할 때 동적으로 로드, `SKILL.md` 포맷을 그대로 채택.
- **샌드박스** — "도구로서의 샌드박스"로 다루며, 코드 실행이 필요한 순간에만 격리 샌드박스를 on-demand로 프로비저닝.
- **인간 체크포인트** — 도구 호출 승인, ask-user-questions, Generative UI 스트리밍.
- **배포 스케일** — 로컬 모드(SQLite)와 호스티드 모드(Postgres+Redis) 둘 다 지원.
- **비용 포지셔닝(벤더 자체 주장)** — Claude Managed Agents 대비 작업 완료 비용이 30~75% 저렴하다고 보도됨. 제3자 검증은 확인되지 않았다.
- **라이선스·생태계** — MIT 라이선스, PyPI 배포. 초기 사용 사례로 NetApp·Automatiq이 언급됐다.

## 인상 깊은 문장

> "TrueForge runs the agent execution loop for you — model calls, MCP tools, skills, sandboxing, approvals, context management, and session state."
> (GitHub README를 직접 확인해 인용.)

## 댓글

**hada 댓글 수·논지는 확인 불가.** HN 스레드 존재는 확인했으나 포인트·댓글 수·상위 댓글 논조는 원문 대조를 못했다. **읽을 때 감안** — 비용 절감 수치(30~75%)의 출처가 사실상 TrueFoundry 자신이거나 그걸 인용한 보도자료성 기사뿐이다.

## 내 생각 · 적용점

### 핵심 전이 1 — "하네스 6개 영역" 이론이 카탈로그형 제품 아키텍처로 그대로 구현된 사례

[[2026-04-28-agent-harness-engineering]]에서 정리한 하네스의 6개 영역 중 "도구 계층 = 도구·MCP 서버·스킬 레지스트리"라는 항목을, TrueForge는 정확히 "모델/MCP서버/SKILL.md/샌드박스를 카탈로그에 한 번 등록해 여러 에이전트가 골라 쓴다"는 제품 기능으로 문자 그대로 구현했다.

### 핵심 전이 2 — Corsair와는 "부분집합 vs 전체 루프"라는 스코프 차이

[[2026-08-27-corsair-agent-integration-layer]]가 통합 계층 한 조각에 집중한 오픈소스라면, TrueForge는 그 통합 계층을 포함해 모델 호출·샌드박스·승인·세션까지 전체 실행 루프를 감싼다.

### 핵심 전이 3 — SKILL.md 포맷이 하네스 벤더의 실제 소비자로 확인됨

TrueForge가 SKILL.md 포맷을 그대로 채택했다는 것은, 이 포맷이 특정 벤더의 관습을 넘어 업계 공통 어휘로 굳어지는 방향의 근거가 된다.

## 호스피탈리티 / CRS 적용 포인트

- **아키텍처 원칙은 직접 참고 가치가 있다.** 온다 내 여러 팀이 각자 에이전트를 만들 경우, "모델·MCP 서버·스킬·샌드박스를 한 번 카탈로그에 등록하고 여러 에이전트가 재사용"하는 구조는 팀마다 반복되는 배선 비용을 줄이는 설계로 유비할 수 있다.
- **도구 자체의 도입은 아직 이르다.** 벤더 자체 비용 절감 주장이 제3자 검증 전이다. 로컬 모드(SQLite)로 PoC 비용이 낮다는 점을 활용해 소규모로 먼저 찔러보는 게 우선이다.
- **승인 게이트가 기본 내장**돼 있다는 점은, CRS/PMS처럼 실패 비용이 큰 도메인에서 "결정적 승인 지점을 루프 안에 명시적으로 둔다"는 원칙과 방향이 같다.

## 연관 자료

- [[2026-04-28-agent-harness-engineering]] — "하네스 = 모델을 제외한 모든 것"이라는 이론이 카탈로그형 제품 아키텍처로 구체화된 사례
- [[2026-08-27-corsair-agent-integration-layer]] — MCP/OAuth 통합이라는 부분집합만 다루는 통합 레이어, 스코프 차이

## 한 달 뒤 회고

*(2026-10-02 즈음 — GitHub 스타·이슈 트래커·실제 채택 사례로 실사용 확산 가늠, "30~75% 절감" 주장이 제3자 벤치마크로 검증됐는지, 원문 접근이 가능해지면 댓글 논조 대조.)*
