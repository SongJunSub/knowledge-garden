---
title: "Vibe coding과 agentic engineering이 내가 원하는 것보다 가까워지고 있다"
source_title: "Vibe coding and agentic engineering are getting closer than I'd like"
source_url: "https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/"
source_name: "Simon Willison's Weblog"
referrer_url: "https://news.hada.io/topic?id=29236"
published_at: "2026-05-06"
summarized_at: "2026-05-07"
category: "ai"
tags: ["AI코딩", "vibe-coding", "에이전트엔지니어링", "코드검토", "신뢰", "Simon-Willison"]
---

# Vibe coding과 agentic engineering이 내가 원하는 것보다 가까워지고 있다

> 출처: [Simon Willison — Vibe coding and agentic engineering are getting closer than I'd like](https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/) · 레퍼러: [GeekNews 29236](https://news.hada.io/topic?id=29236) · 정리일 2026-05-07

## 🔖 한 줄 요약
Simon Willison의 *자기 고백* — 두 방식이 *원래는* 명확히 달랐는데, 에이전트가 신뢰할 만해지면서 *자신조차* 코드를 일일이 검토하지 않는다. 책임·평판 없는 시스템에 의존이 깊어지는 회색지대 진입.

## 🧩 핵심 — 두 방식의 정의

### Vibe Coding
- *비-프로그래머*가 코드 품질 이해 없이 *결과만* 받는 방식
- 개인 도구엔 OK / *프로덕션·타인 영향 시스템*엔 무책임

### Agentic Engineering
- *경험 있는 엔지니어*가 AI를 활용하면서 *전문 기준*(보안·성능·유지보수성) 유지
- *더 좋은 소프트웨어*를 *더 빠르게* 만든다는 목표

### 문제: 둘의 경계가 흐려진다
> *나(Simon)도 에이전트 출력을 검토 없이 신뢰하기 시작했다 — 프로덕션에서도.*

신뢰할 만한 코딩 에이전트가 *모든 줄 검토*를 선택지에서 빼고 있다. *원래의 agentic engineering 정의가 실무에서 vibe coding 쪽으로 미끄러진다*.

---

### 핵심 통찰 1 — 신뢰는 있지만 책임은 없다
- *조직 내 *덜 신뢰하는 동료 팀*에 코드를 맡길 때*와 같은 방식으로 에이전트를 다루기 시작
- 그러나 **인간 개발자와 달리 Claude Code는 직업적 평판이 없고, 책임을 물 수도 없다**
- 위임은 가능, 책임 귀속은 불가능 — *비대칭*

### 핵심 통찰 2 — 평가 기준의 붕괴
- AI가 만든 *테스트·문서 잘 갖춰진 레포*가 *세심하게 만든 프로젝트*와 외형 동일
- *내 프로젝트조차 구분이 안 된다* — 산출물 외형으로는 품질 판단 불가
- → 이건 [No One's Happy의 *산출물-역량 분리*](2026-05-07-appearing-productive-in-the-workplace.md) 와 정확히 같은 진단의 *Simon Willison 버전*

### 핵심 통찰 3 — 사용량이 새 증거
- 완벽 문서화된 코드 < *2주간 매일 쓴* 코드
- *실제 사용*이 *외형 품질*보다 더 강한 신호
- *제품 평가도 같은 방식으로 재편됨*

### 핵심 통찰 4 — 병목 이동
- 코딩 속도 10x 증가 → *상류*(설계·요구사항)와 *하류*(검증·운영)가 새 병목
- 기존 SDLC 전체가 *느린 코딩*을 가정한 구조 → 재설계 필요

### 핵심 통찰 5 — 커리어 회복력
- 도구는 *기존 전문성을 증폭*함 — 무에서 만드는 게 아님
- *소프트웨어 개발은 여전히 매우 어렵다* — 대부분의 실무자가 *에이전트를 효과적으로 쓸 만큼* 경험을 갖지 못함
- [antirez](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md)·[K자형 곡선](2026-05-07-claude-code-not-making-your-product-better.md)과 같은 결

---

### 댓글 추가 통찰
- *"AI가 규율 없는 관행을 만든 게 아니라, *기존 문제를 드러내고 가속*했을 뿐"* — 가장 정확한 한 줄
- **컴파일·동작하는데 *경계 조건/보안*에서 실패하는 코드**가 가장 위험. 리뷰가 *더* 어려움
- *유지보수 단계*가 소프트웨어 생애의 대부분이지만 업계가 간과

## 📜 짧은 인용

> "Claude Code does not have a professional reputation."

> "Even for my own projects, I can't tell."

> "If you've used it every day for two weeks, that's worth more."

> *(댓글)* "Vibe coding and LLMs didn't create undisciplined practices — they exposed and accelerated existing problems."

## 💭 내 생각 · 적용점

### 가든 *AI 비판 시리즈* — 이번엔 *옹호자의 자기 고백*
지금까지 비판 5축은 외부 비판이었다:

| 글 | 비판자 위치 |
|---|---|
| [Trap](2026-05-05-agentic-coding-is-a-trap.md) | 비판자 |
| [Ding](2026-05-07-claude-code-not-making-your-product-better.md) | 비판자 |
| [Glaser](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) | 비판자 |
| [No One's Happy](2026-05-07-appearing-productive-in-the-workplace.md) | 비판자 |
| [3 역법칙](2026-05-07-inverse-laws-of-robotics.md) | 비판자 |
| **Simon Willison (이 글)** | **AI 옹호자가 *자기 고백*** |

이 글의 가치 — *비판자의 비판*이 아니라 *AI를 가장 잘 알고 적극 옹호하던 사람*이 *자기가 회색지대로 미끄러지는 것*을 인정. *외부 비판보다 내부 자백이 더 무겁다.*

### *외형 동일 = 평가 불가*는 가든 두 곳에서 동시 등장
- [No One's Happy](2026-05-07-appearing-productive-in-the-workplace.md): *"산출물이 작성자를 배신하지 않는다"*
- 이 글: *"내 프로젝트조차 구분이 안 된다"*

같은 주에 두 명이 *독립적으로* 같은 진단 → 신뢰성 매우 높은 패턴.

### *사용량 = 새 증거*가 가장 실용적
**완벽 문서 < 2주 매일 사용** — 이 한 마디가 *MangoLove·BugSip·가든 자체*에 그대로 적용된다:
- 가든 글의 가치 = *글이 잘 써졌나*가 아니라 *내가 한 달 뒤 회고에서 실제로 다시 보는가*
- BugSip 기능 가치 = 코드 품질이 아니라 *내가 매일 쓰는가*
- *한 달 뒤 회고 체크리스트*를 가든의 모든 글에 박아둔 게 의도적으로 *사용량 증거*를 남기려는 시도였음 — 이번에 그 의도를 명문화 가능

### *책임 귀속 불가*는 [3 역법칙](2026-05-07-inverse-laws-of-robotics.md)과 직결
- 인간 동료: 위임 + *평판/책임* 함께
- AI: 위임 가능, *평판/책임 없음*
- 따라서 *책임은 항상 위임자에게* — 이게 [Diallo의 *DB 삭제는 당신이*](2026-05-07-ai-didnt-delete-your-database-you-did.md)와 정확히 같은 결론

### CRS 컨텍스트 — *경계 조건/보안*이 가장 위험
*컴파일되고 정상 케이스 동작하는 AI 코드*가 호스피탈리티에서 가장 위험한 영역:
- 결제 처리 (잘못된 환불 계산이 *컴파일은 됨*)
- 객실 인벤토리 (race condition이 *대부분 정상 동작*)
- 권한 체크 (특정 경로만 *우회됨*)
- 다국어 / 통화 / 시간대 (영어/KRW만 테스트되면 *외부 OTA*에서 터짐)

→ [이번 주 CRS-739 race condition](#) 작업이 정확히 이런 *컴파일은 되는 미묘한 오류*였음. AI가 *생성한 코드*에서 더 자주 등장할 패턴.

### *유지보수 간과*는 호스피탈리티의 핵심 문제
- 대부분 *호텔 시스템 = 10년+ 유지보수*
- AI는 *새 코드 생성*에 강점, *기존 코드 이해·축소·정리*는 약함
- [Ding의 *코드 줄 수 = 비용*](2026-05-07-claude-code-not-making-your-product-better.md)과 결합하면 → *AI 가속이 유지보수 부채로 전환되는 속도*가 최대 위험

### MangoLove 적용 후보
1. **모든 글·skill·문서에 *사용 흔적 메트릭* 추가** — 한 달 뒤 회고가 한 형태, *재참조 횟수* 같은 가벼운 측정
2. **PR 설명 헤더에 *AI 사용 + 검토 강도* 1줄 메타데이터** — *"vibe(전체 위임) / hybrid(부분 검토) / agentic(라인 단위 리뷰)"* 3단계
3. ***경계 조건/보안 영역*에는 강제 라인 단위 리뷰 룰** — race condition·결제·권한·인벤토리·통화/시간대 5영역 명시

### 반론·균형점
- Willison의 자기 고백이 *과장*일 수도 있음 — 그는 *공개 블로그*라 *주의 환기 역할*을 의식했을 가능성
- *"vibe coding이 production에 무책임"* 이 너무 단정적 — *내부 도구·자동화 스크립트* 등 *위험이 작은* 영역에서는 가속이 가치
- *사용량 = 증거*가 매력적이지만 *측정·인증* 어려움 — *내가 매일 쓰는지*는 자기 보고일 뿐

## 🎯 즉시 시도할 액션 3가지
1. **PR 설명에 *AI 사용 + 검토 강도* 메타데이터 1줄** — `vibe / hybrid / agentic` 3단계
2. **CRS의 *경계 조건/보안 5영역* 식별 후 *AI 코드 강제 라인 리뷰* 룰 검토** (race·결제·권한·인벤토리·통화/시간대)
3. **가든 글에 *재참조 횟수* 가벼운 트래킹 시작** — 한 달 뒤 회고를 *사용량 증거*로 명문화

## 🔗 연관 자료
- [`ai/2026-05-07-appearing-productive-in-the-workplace.md`](2026-05-07-appearing-productive-in-the-workplace.md) — *외형 동일 = 평가 불가*의 동시 진단
- [`ai/2026-05-07-ai-didnt-delete-your-database-you-did.md`](2026-05-07-ai-didnt-delete-your-database-you-did.md) — *책임 귀속 불가* = 위임자 책임
- [`ai/2026-05-07-inverse-laws-of-robotics.md`](2026-05-07-inverse-laws-of-robotics.md) — 책임 포기 금지 원칙
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](2026-05-07-claude-code-not-making-your-product-better.md) — 코드 줄 수 = 비용 + K자형 곡선
- [`engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md`](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) — *기존 전문성 증폭*의 모범 사례
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](2026-05-05-agentic-coding-is-a-trap.md) — 같은 비판 흐름

## 📝 한 달 뒤 회고
- [ ] PR 설명에 *vibe/hybrid/agentic* 3단계 메타데이터를 한 번이라도 적용했는가
- [ ] CRS 경계 조건/보안 5영역 식별 메모를 작성했는가
- [ ] 이 글이 *재참조 횟수* 1회 이상 발생했는가 (사용량 = 증거 자기 검증)
- [ ] *AI 사용 + 강도*를 의식적으로 분류하는 습관이 자리잡았는가
