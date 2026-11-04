---
title: "OpenAI, 병렬 에이전트 개발을 위한 Git 백엔드 'Pando' 구축(GeekNews) — 하루 1페타바이트를 받아내려 클라이언트는 그대로 두고 서버만 다시 지었다"
source_title: "OpenAI built itself a new Git backend, too"
source_url: "https://thenewstack.io/openai-pando-git-backend/"
source_name: "The New Stack"
referrer_url: "https://news.hada.io/topic?id=36517"
published_at: "2026-11-02"
summarized_at: "2026-11-04"
category: "architecture"
tags: ["openai", "git", "pando", "monorepo", "codex", "infrastructure-scaling"]
---

# OpenAI, 병렬 에이전트 개발을 위한 Git 백엔드 'Pando' 구축(GeekNews)

> 출처: [OpenAI built itself a new Git backend, too](https://thenewstack.io/openai-pando-git-backend/) (The New Stack) · GeekNews 경유 · 정리일 2026-11-04
>
> **출처 한계**: news.hada.io와 OpenAI의 원 엔지니어링 블로그 모두 이 세션에서 직접 열람하지 못했다. The New Stack·GIGAZINE·MarkTechPost·SmartScope·BigGo 등 복수 2차 보도와 OpenAI 공식 X(@OpenAIDevs) 발표문을 종합했다. 수치는 전부 OpenAI 자체 발표이며 외부 검증은 없다. 공개 범위(완전 비공개 vs 일부 파트너 공개)는 매체 간 주장이 충돌한다 — 아래 "공개 범위" 항목 참고.

## 한 줄 요약

**OpenAI가 모놀리식 저장소의 Git 서빙 병목(안정성 90% 미달, 느린 페치, 실패하는 머지)을 해결하려고 Git 클라이언트·프로토콜은 그대로 둔 채 서버 쪽만 새로 지은 백엔드 'Pando'를 구축해, 중간값 푸시 지연을 약 80% 줄이고 하루 약 1페타바이트의 Git 데이터를 서빙하고 있다고 밝혔다.**

## 핵심 포인트

- ***"문제는 Git 자체가 아니라 Git을 서빙하는 방식이었다"***는 결론 — 기존 백엔드는 안정성이 90% 밑으로 떨어지고 있었다.
- Git 클라이언트·프로토콜은 그대로 유지하고 ***서버 사이드만 재구축*** — 개발자와 에이전트는 평소처럼 git 명령을 그대로 쓴다.
- ***다른 브랜치로의 푸시는 병렬 처리***하고, 같은 브랜치로의 푸시는 순서를 보장한다 — 브랜치 단위 동시성이 핵심 설계다.
- 클라이언트가 보낸 패킷파일을 ***재사용***해(매번 새로 생성하지 않음) 서버 부담을 줄인다.
- 중간값 푸시 지연 약 ***80% 감소***, 하루 약 ***1페타바이트*** Git 데이터 서빙 — 전부 자체 발표 수치.
- 2차 보도에 따르면 리드 엔지니어 1명이 핵심 설계를 맡고 ***여러 Codex 에이전트 팀이 구현에 참여***해 약 10주 안에 프로덕션에 배포했다(단일 출처 성격의 세부사항, 확인 수준 낮음).
- **공개 범위**: 대부분의 매체는 "내부용이며 Git 클라이언트 쪽 수정만 오픈소스 상류에 기여"로 보도하지만, Emergent 한 곳만 "일부 엔터프라이즈 파트너에게 제한 공개"라고 주장한다 — 다른 출처에서 뒷받침되지 않아 미검증으로 취급한다.

## 인상 깊은 문장

> "We built Pando, a new Git backend for our monorepo, to handle more pushes and fetches without changing how our engineers and agents use Git. Pando cut push latency by ~80% and now serves nearly a petabyte of Git data a day." — OpenAI Developers(X, @OpenAIDevs)

## 댓글

GeekNews hada 댓글 수는 확인하지 못했다(news.hada.io 접근 차단). HN 반응은 WebSearch로 직접 확인하지 못했다. **이해관계**: OpenAI가 자사 인프라 역량을 홍보하는 성격의 발표이고 수치는 전부 자체 공개다 — "안정성 90% 미달"이었다는 이전 상태의 구체적 측정 기준은 제시되지 않았다.

## 내 생각 · 적용점

**핵심 전이 — 에이전트 시대의 Git 재설계는 서로 다른 층에서 동시에 일어나고 있다.** [[2026-09-27-atlas-source-control-for-coding-agents]]는 코딩 에이전트가 늘어나며 커밋에 "왜"라는 맥락을 영구히 붙이는 식으로 소스 관리 도구의 **의미 계층**이 변형되는 사례였다. Pando는 같은 흐름에서 **물리 계층**(서버 처리량, 동시성)을 다룬다. 에이전트가 늘어날수록 Git이 감당해야 할 요청량 자체가 병목이 된다는 점은, 동시성이 늘수록 기존 도구가 전제했던 가정(사람 하나가 순차적으로 커밋한다)이 깨진다는 더 큰 흐름의 한 조각이다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** 온다 규모의 모노레포가 하루 페타바이트급 Git 트래픽을 겪을 가능성은 낮다. 다만 "에이전트가 늘어나면 기존 도구가 전제했던 가정(동시 사용자 수, 요청 패턴)이 무너진다"는 원칙은, CRS에 AI 에이전트를 여러 개 동시 운영하게 될 때 DB 커넥션 풀이나 API 레이트리밋을 설계하며 미리 참고할 교훈이다.

## 연관 자료

- [[2026-09-27-atlas-source-control-for-coding-agents]] — 에이전트 시대에 맞춰 Git/소스관리 도구가 재설계되는 같은 흐름의 다른 층(커밋 의미 계층 vs 서버 처리량 계층)

## 한 달 뒤 회고

*(2026-12-04 즈음 — OpenAI 공식 블로그 원문을 직접 열람할 수 있게 되면 "안정성 90% 미달"의 구체적 측정 기준과 오픈소스 공개 범위를 둘러싼 매체 간 불일치를 다시 확인한다.)*
