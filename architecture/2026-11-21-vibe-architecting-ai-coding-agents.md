---
title: "우리는 개발자들에게 알리지도 않고 아키텍처로 승진시켰다 (Architecture Without Architects, 추정) — AI 코딩 에이전트가 프레임워크·DB·인증 방식을 수 초 내 결정하지만, 아무도 그걸 아키텍처 결정으로 검토하지 않는다"
source_title: "Architecture Without Architects: How AI Coding Agents Shape Software Architecture (추정)"
source_url: "https://arxiv.org/abs/2604.04990"
source_name: "남덴마크대(Konrad, Adam, Terrenzi, Ayvaz), IEEE ICSA SAGAI 워크숍 (추정, 1:1 매칭 미확정)"
referrer_url: "https://news.hada.io/topic?id=37548"
summarized_at: "2026-11-21"
category: "architecture"
tags: ["vibe-coding", "ai-coding-agents", "software-architecture", "adr", "implicit-decisions"]
---

# 우리는 개발자들에게 알리지도 않고 아키텍처로 승진시켰다 (Architecture Without Architects, 추정) — AI 코딩 에이전트가 프레임워크·DB·인증 방식을 수 초 내 결정하지만, 아무도 그걸 아키텍처 결정으로 검토하지 않는다

> 출처: [Architecture Without Architects: How AI Coding Agents Shape Software Architecture](https://arxiv.org/abs/2604.04990) (추정, 1:1 매칭 미확정) · 정리일 2026-11-21

## 한 줄 요약

**AI에게 요구사항만 전달하고 아키텍처를 지정하지 않으면, 성능과 데이터 설계에 관한 결정까지 AI에게 암묵적으로 맡겨지게 된다 — "바이브 코딩(vibe coding)"이 아키텍처 차원으로 올라간 "바이브 아키텍팅(vibe architecting)"으로, 프레임워크·DB·배포 타겟·인증 방식 같은 아키텍처 결정이 수 초 안에 내려지지만 누구도 그걸 검토 대상으로 인식하지 못한다.**

## 핵심 포인트

- **AI에 요구사항만 전달하고 아키텍처를 지정하지 않으면**, 성능과 데이터 설계에 관한 결정까지 AI에게 맡겨지게 됨.
- Google Forms 애드온 사례: AI가 작성한 설치 로그 코드가 사용자 이메일과 ID를 **차례로 조회**하면서, 정적인 환영 화면을 띄우는 데 **15초**가 걸림 — 요구사항에는 없던 구현 방식이 성능 문제를 그대로 만든 것.
- **아키텍처의 역할은 앱을 느리게 만드는 요구사항에 제동을 걸거나**, 비동기 처리 등으로 성능과 보안 사이의 절충안을 찾는 것.
- AI 코딩 도구에 구현을 맡기려면 사람이 **아키텍처와 데이터 모델을 먼저 설계**하고, 변경 승인과 하위 호환성 유지 여부를 명확히 정해야 함.
- 원문 추정 근거(교차검증, 완전 확정은 아님): **"vibe architecting"** 개념을 제시하는 arXiv 논문(2604.04990, 2026-04, IEEE ICSA SAGAI 워크숍 포지션 페이퍼)이 Slack 발췌와 가장 부합 — 암묵적 아키텍처 결정 5가지 메커니즘, prompt-architecture coupling 패턴 6가지를 제시하고, 해법으로 리뷰 프로세스·결정기록(ADR)·툴링을 제안한다는 내용이 교차확인됨. **다만 "Google Forms 15초 지연" 같은 구체 사례가 실제로 이 논문에 있는지는 확인하지 못했다** — 주제·논지는 강하게 일치하지만 그 특정 사례의 1차 출처는 미확인이다.

## 인상 깊은 문장

(논문 원문·2차 해설 모두 접속 차단으로 영문 그대로 인용을 확보하지 못했다.)

## 댓글

GeekNews(news.hada.io)가 이 세션에서 전면 차단됐고, arxiv.org와 관련 2차 해설(towardsai.net)도 모두 접속 차단되어 원문 전문을 읽지 못했다. **제목의 정확한 독해부터 주의가 필요하다** — "개발자들을 아키텍처로 승진시켰다"가 아니라 **"AI를 아키텍트로 승진시켰다(그 사실을 개발자들에게 알리지 않은 채)"**가 Slack 발췌와 부합하는 올바른 해석이다. 원문 1:1 매칭이 확정되지 않았으므로 추정임을 명시한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "바이브 코딩"의 범위가 구현에서 아키텍처로 올라간 자연스러운 확장

[[2026-10-13-vibe-coded-photoshop-clones]]와 [[2026-05-07-vibe-coding-agentic-engineering-converging]]이 다룬 "바이브 코딩"은 구현 디테일(색상 프로파일, 암묵적 전문 기준)의 누락 문제였는데, 이 글은 같은 패턴을 **한 단계 위, 아키텍처 결정 자체**로 끌어올린다. **"검증 오라클이 명확한 범위엔 AI가 강하다"**는 기존 원칙에 더해, 아키텍처처럼 **검증 오라클 자체가 존재하지 않는 영역**(프레임워크 선택, 인증 방식)에서는 AI의 암묵적 결정을 아무도 검토하지 않는다는 더 근본적인 위험이 드러난다.

### 핵심 전이 2 — ADR(결정기록)이라는 해법은 이미 이 가든이 실천 중인 패턴

이 글이 제안하는 해법(리뷰 프로세스·결정기록·툴링)은 [[2026-11-18-bespin-claude-code-bundling-skills-into-standards]]에서 "반복 업무는 Skills, 상시 규칙은 CLAUDE.md로 분리"한 이 가든 자체의 운영 방식과 같은 원리다 — **AI에게 맡기기 전에 암묵적 결정이 될 수 있는 부분을 명시적 문서(CLAUDE.md, ADR)로 먼저 박아두는 것**이 "바이브 아키텍팅"의 위험을 줄이는 실천적 해법이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS·PMS 통합처럼 성능·데이터 일관성이 중요한 시스템에 AI 코딩 에이전트로 신규 기능을 구현할 때, "요구사항만 주고 아키텍처는 안 지정"하면 Google Forms 사례처럼 성능이나 보안에 영향을 주는 구현 방식(예: 예약 조회 시 순차 쿼리 vs 배치 쿼리)이 암묵적으로 결정될 수 있다. 예약·결제처럼 리스크가 큰 모듈은 AI에게 구현을 맡기기 전에 **데이터 모델과 핵심 성능 제약을 사람이 먼저 명시**해야 한다는 체크리스트로 직접 적용 가능하다.

## 연관 자료

- [[2026-10-13-vibe-coded-photoshop-clones]] — *바이브 코딩이 구현 디테일을 누락시키는 선행 사례*
- [[2026-05-07-vibe-coding-agentic-engineering-converging]] — *바이브 코딩과 에이전틱 엔지니어링이 수렴하는 배경*
- [[2026-11-18-bespin-claude-code-bundling-skills-into-standards]] — *암묵적 결정을 명시적 문서로 미리 박아두는 같은 해법을 이미 실천 중인 사례*

## 한 달 뒤 회고

*(2026-12-21 즈음 — 이 글의 원문을 정확히 특정했는지, CRS 관련 AI 구현 작업에서 아키텍처·데이터 모델을 사전에 명시하는 체크리스트를 실제로 적용했는지 기록.)*
