---
title: "Claude로 커머스 에이전트 구축하기 (Anthropic) — 쇼핑 에이전트·판매자 에이전트 참조 블루프린트, 판매자의 쓰기 작업은 전부 승인 대기 상태로 설계된다"
source_title: "Building Commerce Agents with Claude / anthropics/commerce-agents"
source_url: "https://github.com/anthropics/commerce-agents"
source_name: "claude.com/blog · github.com"
referrer_url: "https://news.hada.io/topic?id=33176"
published_at: "2026-09-02"
summarized_at: "2026-09-03"
category: "ai"
tags: ["commerce-agent", "shopping-agent", "merchant-agent", "anthropic", "agent-sdk", "crs"]
---

# Claude로 커머스 에이전트 구축하기 (Anthropic) — 쇼핑 에이전트·판매자 에이전트 참조 블루프린트, 판매자의 쓰기 작업은 전부 승인 대기 상태로 설계된다

> 출처: [Building Commerce Agents with Claude](https://claude.com/blog/claude-for-commerce-agents) / [anthropics/commerce-agents](https://github.com/anthropics/commerce-agents) (Anthropic 공식) · GeekNews(id=33176) 경유 · 정리일 2026-09-03

## 한 줄 요약

**Anthropic이 소매·여행·통신·티켓팅 플랫폼을 위한 쇼핑 에이전트(고객용)와 판매자 에이전트(백오피스용) 참조 구현을 오픈소스로 공개했다. 홀리데이 쇼핑 시즌을 앞둔 시점의 발표이며, 핵심 설계 원칙은 "모델은 결과만 본다"(백엔드가 세션 자격증명으로 서비스를 호출)와 "판매자의 모든 쓰기 작업은 승인 대기(Staged) 상태"라는 안전장치다.**

## 핵심 포인트

- **두 가지 에이전트** — 쇼핑 에이전트: 상품 검색·비교·장바구니·결제, 주문/정책 질문 응답, 고객 대화 기억. 판매자 에이전트: 성과 분석, 재고/주문 알림 대응, 가격·프로모션 관리 — 단 **모든 쓰기 작업은 사람 승인 대기 상태**로 설계.
- **세 가지 실행 방식** — 같은 라이브러리를 Messages API(참조 구현), Agent SDK, Managed Agents(호스팅형) 세 가지로 실행 가능. 단계적 도입 지원: 검색·상품 상세만 먼저 구현하고 나머지는 스텁으로 두어도 프롬프트 바이트 변경 없이 확장 가능.
- **네 가지 수직 예시** — Retail(기본 검색·비교·장바구니), Travel(날짜 기반 재고·일정 제시), Telecom(요금제 행렬·규제 수수료 공시), Entertainment(시간 제한 보유·대기열·수수료 공개) — 업종별로 요구되는 UX 패턴이 다르다는 걸 예시 자체가 보여준다.
- **안전·검증 계층** — 펜싱(fencing), 프로비넌스 게이트, 상한선이 도구 호출 내부에서 실행되고, 판매자 쓰기 작업은 별도 승인 게이트를 통과해야 한다. `ruff check`·`pytest`·자체 검증 스크립트로 규칙을 강제.
- **실측 성과(2차 출처)** — Claude 기반 쇼핑 에이전트를 도입한 리테일러에서 장바구니 규모 최대 35% 증가, 구매 완료율 60% 상승이라는 수치가 보도됐다(Anthropic 발표 인용, 독립 검증은 아님).

## 인상 깊은 문장

> "The reference blueprint is for building shopping and merchant agents with Claude, with examples in retail, commerce, telecom, and entertainment included." (GitHub README)

## 댓글

**출처 한계 부분적.** claude.com은 이 세션에서 egress 차단됐으나, GitHub 저장소(README)는 WebFetch로 직접 확보해 아키텍처·실행 방식·안전장치를 확인했다. 장바구니 35%·구매완료율 60% 수치는 WebSearch로 찾은 2차 보도(Yahoo, WMBD 등 통신사 배포 기사)를 인용한 것으로, Anthropic 발표를 그대로 옮긴 값이라 독립적 검증은 아니다. news.hada.io 원문·GeekNews 댓글 수는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "판매자 쓰기는 전부 승인 대기"는 이 가든이 반복해온 자율성 설계 원칙의 실전 적용

[[2026-08-28-aws-frontier-agents-devops-release-management]]나 여러 에이전틱 코딩 도구 논의에서 반복된 "돌이키기 어려운 작업은 사람 승인을 거치게 하라"는 원칙이, 상거래 도메인에서는 훨씬 더 명확한 형태로 나타난다 — **재고 조정·가격 변경·프로모션은 되돌리기 비용이 크므로 구조적으로 승인 게이트를 강제한다.** 이건 이 저장소 자체의 설계 철학이지 옵션이 아니다.

### 핵심 전이 2 — "SoR→SoI" 논의의 실제 구현체

[[2026-05-18-system-of-record-to-system-of-intelligence-a16z]]가 예견한 "여러 데이터 소스를 모아 수집·분석·추천·실행하는 지능 계층"이 커머스 도메인에서 실제 오픈소스 참조 구현으로 나온 셈이다. 쇼핑 에이전트가 여러 상품·정책 데이터를 통합해 "하나의 대화로 연결"하는 구조는, [[2026-09-02-consumer-fintech-unbundling-ai-agent]]가 그렸던 "여러 금융기관 계좌를 모으는 AI 에이전트" 시나리오의 커머스판이다.

### 핵심 전이 3 — 4개 수직(retail/travel/telecom/entertainment) 중 Travel이 CRS와 가장 가깝다

날짜 기반 재고·일정 제시라는 Travel 수직의 요구사항은 호텔 예약 시스템의 요구사항(객실 재고·요금 캘린더·체크인/아웃 날짜)과 구조적으로 동일하다. 이 저장소를 직접 열어 Travel 예시 코드를 검토하면 CRS 쇼핑 에이전트 설계의 출발점으로 쓸 수 있을 것으로 보인다.

## 호스피탈리티 / CRS 적용 포인트

**이번 배치에서 가장 CRS 적용 가능성이 높은 글이다.** `anthropics/commerce-agents` 저장소의 Travel 수직 예시(`examples/travel`)를 직접 클론해 실행해보고, 온다 CRS의 "예약 상담 에이전트"(고객이 날짜·인원·요금 조건으로 객실을 검색·비교·예약하는 흐름)와 "운영 에이전트"(재고·요금 변경은 승인 대기, 성과 분석은 자동)를 이 블루프린트 패턴으로 프로토타이핑하는 것을 다음 스텝으로 제안한다. 특히 "판매자 쓰기는 전부 승인 대기"라는 안전 설계는 CRS의 요금·재고 자동화 논의에 그대로 가져올 수 있는 구체적 아키텍처 원칙이다.

## 연관 자료
- [[2026-05-18-system-of-record-to-system-of-intelligence-a16z]] — *"여러 소스를 모아 수집·분석·추천·실행"이라는 예견의 실제 구현체*
- [[2026-09-02-consumer-fintech-unbundling-ai-agent]] — *같은 구조(여러 소스 통합 지능 계층)의 핀테크판*
- [[2026-08-28-aws-frontier-agents-devops-release-management]] — *"되돌리기 어려운 작업은 승인 게이트"라는 같은 안전 설계 원칙*

## 한 달 뒤 회고
*(2026-10-03 즈음 — anthropics/commerce-agents의 Travel 예시를 실제로 클론·실행해봤는지, 온다 CRS 프로토타입에 이 패턴을 적용해봤는지 기록.)*
