---
title: "소프트웨어 아키텍처 배우기"
source_title: "Learning Software Architecture"
source_url: "https://matklad.github.io/2026/05/12/software-architecture.html"
source_name: "matklad (Aleksey Kladov)"
referrer_url: "https://news.hada.io/topic?id=29452"
published_at: "2026-05-12"
summarized_at: "2026-05-13"
category: "engineering"
tags: ["아키텍처", "학습방법", "Conway-Law", "인센티브", "rust-analyzer", "matklad", "사회구조"]
---

# 소프트웨어 아키텍처 배우기

> 출처: [matklad — Learning Software Architecture](https://matklad.github.io/2026/05/12/software-architecture.html) · 레퍼러: [GeekNews 29452](https://news.hada.io/topic?id=29452) · 정리일 2026-05-13

## 한 줄 요약
**matklad (rust-analyzer 핵심 개발자)** 의 학습론 — *형식 교육보다 실무 책임*, *Conway's Law*, *인센티브 구조가 코드 품질보다 중요*. rust-analyzer가 *낮은 진입장벽 + 핵심 엄격*을 동시에 달성한 사례.

## 핵심 주장

### 1. 실무 책임이 최고의 학습
- *형식 교육 < 실제 프로젝트 책임*
- *유지보수 경험*이 단일 책보다 강력
- → 책임 없이 *읽기만* 하면 깊이 안 생긴다

### 2. Conway's Law의 우선
> "프로그래밍은 코드 작성에 관한 것이지만, 결국 *아키텍처가 더 중요*하고 *사회 이슈가 가장 중요*."

- 코드 구조 = *조직 사회 구조*의 반영
- **인센티브 구조가 코드 품질을 좌우**

### 3. 인센티브 적응
> "인센티브 구조는 거의 원하는 것이 아니지만, *변경할 수 없다면 적응할 수 있다*."

- *완벽한 조직*은 없음
- *주어진 인센티브* 안에서 *최선의 설계*를 찾는 게 진짜 능력

### 4. rust-analyzer 사례 — *낮은 진입장벽 + 핵심 엄격* 동시 달성
- 빠른 빌드 → 주말 기여자 유입
- 독립 기능 격리 (`catch_unwind`) — 오류가 사용자 영향 없게
- **핵심 부분에는 엄격한 품질 기준**
- 결과: *대량 기여 + 안정성* 양립

### 5. 학습 자료 추천
- Gary Bernhardt — **"Boundaries"** 강연
- Pieter Hintjens — Conway's Law 저술
- *Software Engineering at Google*
- Ousterhout — *The Philosophy of Software Design*

### 댓글 통찰
- **놀라움 최소화** + 단일 진실 공급원
- **데이터 모델 > 코드** (수명이 더 길다)
- *헥사고날 아키텍처·Unix 파이프·REST 패턴* 성공 사례 학습 추천

## 내 생각 · 적용점

### 가든 *학습 방법론* 결의 첫 글
가든이 그동안 *기술 자체·비판·메트릭·실용 팁* 위주였는데, 이 글은 ***학습 방법론*** — 새 결. 이전 글들의 *어떻게 배울까* 자가 검증 도구 역할.

### *Conway's Law*는 가든 3회 등장
- [56법칙 글](2026-04-23-laws-of-software-engineering.md): 첫 등장
- [Glaser Loop Intelligence](2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md): 조직 학습 단위 = 코드 구조
- 이 글: *가장 중요한 단일 원칙*으로 격상

→ ***Conway's Law*가 가든의 *반복 위험·반복 패턴 인덱스*에 추가***. [Jevons 역설·생성-검증 비대칭·훈련 위기]와 같은 *반복 등장 핵심 개념* 그룹.

### *인센티브 구조 우선*은 [Langbroek 메타 비판](../career/2026-05-08-programming-still-sucks.md)과 같은 결
- Langbroek: *"AI가 직업 빼앗은 게 아니라 *탐욕(인센티브)*이 했다"*
- matklad: *코드 품질 < 인센티브 구조*
- → 두 글이 *서로 다른 톤*으로 같은 진단

### rust-analyzer 패턴 — *낮은 진입장벽 + 핵심 엄격*
호스피탈리티 CRS 적용 후보:
- **공헌 가능 영역**: UI·운영 도구·내부 스크립트 → *빠른 빌드·낮은 진입장벽*
- **핵심 보호 영역**: 결제·재고·OTA 정산 → *엄격한 라인 단위 리뷰*
- 이건 [Willison 경계 조건 5영역](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md), [Brian 결정적 영역](../ai/2026-05-09-agents-need-control-flow.md)과 정확히 같은 패턴

→ **CRS *공헌 영역 분류 정책*** 후보: 빠른 통과 영역 vs 엄격 검증 영역 명시.

### [Sara cron 우화](../career/2026-05-08-programming-still-sucks.md)와의 인센티브 결합
- Sara cron: *기관 지식이 한 사람에 묶임*
- matklad: *인센티브 구조가 그걸 만든다* — *공유 인센티브 부재* → Sara 발생
- 호스피탈리티 적용: *Sara 후보 식별*만으로는 부족, *공유 인센티브* 설계 필요
- 후보: *문서화·인계 활동의 KPI 가중치* 명시

### *실무 책임 = 학습*은 가든 *행동 후보* 결과 결합
- [LLM-from-Scratch 워크숍](../ai/2026-05-07-llm-from-scratch-workshop.md): 학습 자료 ()
- [Rapid-MLX](../ai/2026-05-12-rapid-mlx-apple-silicon-local-ai.md): 실용 도구 ()
- 이 글: ***책임지는 프로젝트가 진짜 학습***
- → BugSip·knowledge-garden 같은 *내 책임 프로젝트*가 *학습 자산*

### *데이터 모델 > 코드 수명*은 [SQLite 의회도서관](../backend/2026-05-08-sqlite-loc-recommended-storage-format.md) 정신
- SQLite: 30년 살아남는 데이터 포맷
- 이 글: *데이터 모델이 더 오래간다*는 원칙
- → **CRS 스키마 설계 신중함**의 이론적 근거 — Falsehoods 시리즈와도 결합

### *놀라움 최소화* 원칙
- 댓글: *Principle of Least Astonishment*
- 가든 모든 글의 *액션 후보*가 이 원칙 따르고 있는지 자기 점검 후보
- 호스피탈리티: *예약 흐름·환불 정책·요금 표시*에서 *사용자가 놀라지 않는* 설계

### MangoLove 적용 — *학습 자산화 룰*
- *책임진 프로젝트의 회고를 *학습 자산*으로 변환* 룰 추가
- [Willison 사용량 = 증거](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md)와 결합 — *재참조 빈도 ≠ 학습 깊이*
- *깊은 학습은 책임에서 옴* — 글 작성보다 *프로젝트 책임*이 학습 신호

### 가든 그래프 강화
- [경력 수명 글](../career/2026-05-12-software-engineering-may-no-longer-be-lifetime-career.md)의 *재훈련 경로 부재* 문제 → 이 글이 답 일부: ***책임지는 프로젝트가 재훈련 경로***
- *AI 시대 학습*은 *AI로 빠르게 배우는 게 아니라 *책임지는 프로젝트로 깊이 배우는 것*

### 반론·균형점
- *책임 = 학습*이 진리지만 *모든 사람이 책임을 받을 수 있는 환경*은 아님 — *주니어가 책임을 받기 어려운* 현실 ([Sara cron 주니어 장례식](../career/2026-05-08-programming-still-sucks.md))
- *Conway's Law*가 *결정론*이면 *개인 노력 무용*. 다만 글은 *적응 가능*이라는 균형
- *인센티브 우선*은 *기술적 우수성 무시*가 아님 — 둘 다 필요

## 즉시 시도할 액션 3가지
1. **CRS *공헌 영역 분류 정책* 후보 메모** — 빠른 통과 vs 엄격 검증 영역 명시 (rust-analyzer 패턴)
2. **MangoLove에 *책임진 프로젝트 회고 → 학습 자산* 룰** 추가
3. **Conway's Law를 가든 *반복 위험·반복 패턴 인덱스*에 추가** (3회 등장)

## 연관 자료
- [`engineering/2026-04-23-laws-of-software-engineering.md`](2026-04-23-laws-of-software-engineering.md) — Conway's Law 첫 등장
- [`engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md`](2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) — Loop Intelligence 조직 구조 = 코드 구조
- [`career/2026-05-08-programming-still-sucks.md`](../career/2026-05-08-programming-still-sucks.md) — *탐욕(인센티브)이 했다* 같은 결
- [`ai/2026-05-07-vibe-coding-agentic-engineering-converging.md`](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md) — 경계 조건 영역 = rust-analyzer 핵심 엄격
- [`ai/2026-05-09-agents-need-control-flow.md`](../ai/2026-05-09-agents-need-control-flow.md) — 결정적 영역
- [`backend/2026-05-08-sqlite-loc-recommended-storage-format.md`](../backend/2026-05-08-sqlite-loc-recommended-storage-format.md) — 데이터 모델 > 코드 수명
- [`career/2026-05-12-software-engineering-may-no-longer-be-lifetime-career.md`](../career/2026-05-12-software-engineering-may-no-longer-be-lifetime-career.md) — 재훈련 경로 = 책임 프로젝트
- 추천: Gary Bernhardt "Boundaries", Ousterhout *Philosophy of Software Design*, *SE at Google*

## 한 달 뒤 회고
- [ ] CRS 공헌 영역 분류 정책 메모를 작성했는가
- [ ] MangoLove에 *책임진 프로젝트 회고 → 학습 자산* 룰이 들어갔는가
- [ ] Conway's Law가 의사결정에 한 번이라도 의식적으로 적용됐는가
- [ ] *책임지는 프로젝트가 재훈련 경로*라는 프레임으로 BugSip·docs-ko 평가했는가
