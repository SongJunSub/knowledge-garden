---
title: "Redis Array — antirez의 4개월 AI 협업 시스템 개발기"
source_title: "Redis array: a long development, the short story"
source_url: "https://antirez.com/news/164"
source_name: "antirez (Salvatore Sanfilippo)"
referrer_url: "https://news.hada.io/topic?id=29173"
published_at: "2026-05-05"
summarized_at: "2026-05-05"
category: "engineering"
tags: ["Redis", "antirez", "AI협업", "시스템프로그래밍", "Spec-Driven", "사례연구"]
---

# Redis Array — antirez의 4개월 AI 협업 시스템 개발기

> 출처: [antirez — Redis array: a long development, the short story](https://antirez.com/news/164) · 레퍼러: [GeekNews 29173](https://news.hada.io/topic?id=29173) · 정리일 2026-05-05 · PR: [redis/redis#15162](https://github.com/redis/redis/pull/15162)

## 🔖 한 줄 요약
Redis 창시자가 4개월간 AI(Opus → Codex/GPT 5.x)와 협업해 새 Array 데이터 타입을 만든 경험기 — **AI가 *없었다면 회피했을 복잡도*에 도전했다**는 한 문장이 핵심.

## 🧩 개발 일정과 방법론

### 1개월차 — 명세 작성
- **수작업으로 장문 설계 문서** (Opus와 함께 다듬음)
- 도중에 GPT 5.3 출시 → Codex로 전환. 이후 *시스템 프로그래밍은 GPT 5.x*

### 2-3개월차 — 구현 + 최적화
- 본격적 *auto coding*으로 방대한 코드 생성
- 초기 설계(2단계 디렉터리+슬라이스)의 한계 발견
- **재설계**: *슬라이스된 밀집 디렉터리의 슈퍼 디렉터리 구조* (슬라이스당 4,096 요소)
- 라인 단위 *수동 코드 검토* + AI 보조 재작성

### 3-4개월차 — 검증 + 기능 확장
- 광범위한 스트레스 테스트
- 사용 사례(마크다운 파일 저장)에서 새 기능 필요성 발견 → **`ARGREP` 정규식 기능 추가**
- 정규식 라이브러리 TRE 선택 (pathological pattern 방지)

### 결과
- **PR #15162** (redis/redis)
- 새 명령: `ARSET`, `ARSCAN`, `ARPOP`, `ARGREP` 등
- *희소 배열 표현*: `ARSET myarray 293842948324 foo` 같은 *극단적 인덱스*도 메모리 효율적으로
- 동적 변형으로 *선형 스캔 복잡도*도 보장

## 🛠 antirez의 AI 협업 패턴 4단계

| 단계 | 사람 | AI |
|------|------|-----|
| **1. 초기 설계** | *손작성 명세* + 결정권 | 옵션 제시·반박 (지적 도전 파트너) |
| **2. 구현** | 방향성·아키텍처 결정 | 대량 자동 코딩 |
| **3. 검증** | **라인 단위 수동 리뷰** | 32비트 지원 추가 같은 *피로도 높은 작업*, 광범위 스트레스 테스트 |
| **4. 재작성** | 구조 문제 식별 | *AI 지원 하에서만* 대규모 리팩토링 |

> "I really wanted people to be able to do `ARSET myarray 293842948324 foo` and everything to still work."

> "Because I had AI, I took no compromises, and I decided to go the extra mile."

### 핵심 통찰: AI = *난이도 천장 상승기*
> "For high quality system programming tasks you have to still be fully involved, but I ventured to a level of complexity that I would have otherwise skipped."

**AI는 사람을 대체하지 않고, *피했을 난이도에 도전하게 한다*** — 이게 이 글의 진짜 메시지.

> "The virtual work force required to make sure there are no obvious bugs in complicated algorithms."

복잡한 알고리즘의 *피로도 높은 검증 작업*을 AI가 담당함으로써, 사람은 *판단·설계·구조 결정*에 집중.

## 📜 인상 깊은 문장

> "Because I had AI, I took no compromises, and I decided to go the extra mile."

> "For high quality system programming tasks you have to still be fully involved, but I ventured to a level of complexity that I would have otherwise skipped."

> "Everything was working, and this type has massive testing, thanks, again to AI, but still things that superficially work do not mean they are optimal."

> "Sometimes to detach yourself from the keyboard is complicated."

## 💭 내 생각 · 적용점

### 어제 글의 정확한 반대 사례 — *균형 보강*
어제 정리한 [Agentic Coding은 함정이다](../ai/2026-05-05-agentic-coding-is-a-trap.md)와 정확히 *대척점*. 두 글을 같이 읽어야 그림이 완성된다.

| Lars Faye (어제) | antirez (오늘) |
|------------------|---------------|
| AI가 *기술을 위축*시킨다 | AI로 *난이도 천장을 올렸다* |
| *생산량* 증가가 잘못된 우선순위 | *불가능했을 도전*을 가능하게 |
| 책임 있는 위임 = 적게 위임 | 충분히 검토하면 *많이 위임 가능* |
| 디버깅 47% 감소 (위험 신호) | 4개월 풀가동 시스템 프로그래밍 (성공 신호) |

**둘 다 맞다.** 차이를 만드는 변수: **베이스 실력 + 검증 능력 + 수동 리뷰 의지**. antirez는 1) Redis 창시자, 2) 라인 단위 직접 리뷰, 3) 명세 손작성으로 시작 — 모두 Lars Faye가 말한 *위축의 반례*.

### 가든 입장 스펙트럼 (이번 글 추가 후)

| 글 | 입장 | 핵심 조건 |
|----|------|----------|
| [하네스 엔지니어링](../ai/2026-04-28-agent-harness-engineering.md) | 인프라화 | 조직 규모 가정 |
| [Long-running agents](../ai/2026-05-04-long-running-agents.md) | 시간 확장 | 자동화 워크로드 |
| **이 글 (antirez)** | **개인 능력 증폭** | **베이스 실력 + 직접 리뷰** |
| [mattpocock skills](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md) | 도구화 | 워크플로 자산 |
| [9초 사고](../ai/2026-04-27-ai-agent-deleted-production-database.md) | 가드레일 | 위임 전 안전 |
| [Elevate not Replace](../ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) | 조심 | 30분 룰 |
| [Agentic Coding Trap](../ai/2026-05-05-agentic-coding-is-a-trap.md) | 회의 | 47% 위축 |

이 글은 *"채택 옹호"의 가장 신뢰할 만한 형태*다 — Lars Faye가 비판하는 *"맹목적 위임"*과 다르고, *경험 많은 개발자가 충분히 리뷰하며 사용하는*. 가든의 *현실적 채택 모델*로 설정 가능.

### 4단계 패턴을 내 워크플로에 적용
antirez의 4단계가 [MangoLove `/strict`](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md) 워크플로와 거의 일치한다:

| antirez 단계 | MangoLove `/strict` 대응 |
|---|---|
| 손작성 명세 + AI 다듬기 | 분석 → Spec → Spec 적대적 리뷰 |
| 자동 코딩 | 6단계 구현 |
| 라인 단위 수동 검토 + 32비트 작업 AI | 7단계 셀프 리뷰 + 8단계 페르소나 리뷰 |
| 구조 문제 식별 후 AI 재작성 | Critical/Major 발견 시 즉시 수정 |

차이: antirez는 *4개월간 한 사람이 자율 진행* / MangoLove는 *세션 단위 + 게이트*. **antirez 모델이 더 *오래 가는 작업*에 맞고**, MangoLove는 *세션·트랙 단위 안전성*에 맞다.

### 호스피탈리티/CRS 적용
- **CRS 설계 결정 영역에 antirez 패턴 도입 가치 큼**: 새 PMS 통합, 새 채널 통합, 마이그레이션 같은 *수개월짜리 작업*에 *손작성 명세 + 자동 코딩 + 라인 단위 리뷰* 패턴 적용
- 단, **antirez의 베이스 — 라인 단위 리뷰 의지**가 *위축되지 않게* 유지하는 게 전제. 어제 글의 경고와 분리 불가능.

### 가장 인상 깊은 한 가지
**"Because I had AI, I took no compromises."** — AI 도구의 진짜 효용이 *생산성*이 아니라 **타협을 줄인다**는 표현. 평소 *"이건 너무 복잡하니까 그냥 둔다"* 했던 작업을 *진짜로 풀어내는* 도구로서의 AI. 호스피탈리티에서도 *"6년째 못 건드린 환불 로직"* 같은 영역에 적용 가능.

### 반론·균형점
- antirez 같은 *베이스를 가진 사람*에게나 작동. 신입·중급에겐 [Agentic Coding Trap](../ai/2026-05-05-agentic-coding-is-a-trap.md)의 경고가 더 정확.
- 4개월간 *한 사람의 인지 부하*가 어떻게 유지됐는지는 글에 안 나옴. 일반화 가능성에 한계.
- 결과물(Redis Array)이 *진짜로 잘 설계됐는지*는 시간이 검증할 것. 단기 PR 머지 = 장기 검증 X.

## 🎯 즉시 시도할 액션 3가지
1. **다음 큰 CRS 작업(긴 마이그레이션 또는 새 통합)에 *antirez 4단계*를 시범 적용** — 손작성 명세 → AI 자동 코딩 → 라인 단위 수동 리뷰 → AI 재작성
2. **"AI 덕분에 *못 건드릴 영역*에 도전한다"는 프레임을 의식적으로 사용** — 평소 회피했던 리팩토링·최적화·복잡한 비즈니스 로직 후보 1개 선정
3. **"AI 위임 비율" + "수동 리뷰 시간" 동시 측정** — 가든·BugSip·CRS에서. *Lars vs antirez*의 차이를 만드는 핵심 변수가 바로 이것

## 🔗 연관 자료
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](../ai/2026-05-05-agentic-coding-is-a-trap.md) — **정확한 대척점**. 같이 읽어야 균형
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](../ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — antirez = *"Elevate, not replace"의 실제 사례*
- [`ai/2026-05-04-long-running-agents.md`](../ai/2026-05-04-long-running-agents.md) — 4개월 자동 코딩 = checkpoint·done-condition 패턴의 실전
- [`ai/2026-04-29-mattpocock-skills-vs-mangolove.md`](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md) — *spec-driven*이 두 사람 모두의 출발점
- [`engineering/2026-04-27-overthinking-scope-creep-structural-diffs.md`](2026-04-27-overthinking-scope-creep-structural-diffs.md) — Lynagh의 *성공 기준 내면화*가 antirez의 *손작성 명세*에 정확히 대응
- 도구: [TRE](https://laurikari.net/tre/) (정규식 라이브러리)

## 📝 한 달 뒤 회고
- [ ] 다음 큰 CRS 작업에 *antirez 4단계* 시범 적용했는가
- [ ] *"AI 덕분에 더 어려운 도전"* 프레임으로 시도한 작업이 있는가
- [ ] AI 위임 비율 + 수동 리뷰 시간 측정 시작했는가
- [ ] 가든의 입장 스펙트럼이 *현실적 채택 모델*(antirez 위치)을 의식적으로 유지하는가
