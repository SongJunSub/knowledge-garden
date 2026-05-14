---
title: "AI 코딩 시대의 복잡성 래칫 — 90% 테스트 커버리지가 필요한 이유"
source_title: "Why you need 90% test coverage in the age of AI coding (Complexity Ratchet)"
source_url: "https://x.com/garrytan/status/2054064931515855118"
source_name: "Garry Tan (Y Combinator CEO) on X"
referrer_url: "https://news.hada.io/topic?id=29462"
summarized_at: "2026-05-14"
category: "ai"
tags: ["AI", "테스트", "커버리지", "AgenticCoding", "엔지니어링", "래칫", "YC"]
---

# AI 코딩 시대의 복잡성 래칫 — 90% 테스트 커버리지가 필요한 이유

> 출처: [Why you need 90% test coverage in the age of AI coding](https://x.com/garrytan/status/2054064931515855118) (Garry Tan / X) · 레퍼러: [GeekNews 29462](https://news.hada.io/topic?id=29462) · 정리일 2026-05-14

## 🔖 한 줄 요약
AI가 *지루한 엣지 케이스 테스트* 작성 비용을 0으로 만들면서 — **테스트·문서·평가가 누적되어 후퇴 불가능해지는 "복잡성 래칫"**이 가능해졌고, 50년간 항공·의료의 전유물이던 **90% 커버리지가 개인 개발자의 일상**이 된다.

## 🧩 핵심 포인트

### 1. "속도 vs 품질"이라는 50년의 전제가 깨졌다
- 과거 50년: "에러 예방" 패러다임 — 코드 리뷰·QA·스테이징으로 결함이 *들어오지 않게* 막음.
- 지금: 대부분의 에러는 **에이전트가 다음 턴에 진단·수정** 가능. *예방*에서 *빠른 복구*로 무게 중심 이동.
- 결과: "속도와 품질은 양자택일"이 더 이상 참이 아니다.

### 2. 복잡성 래칫(Complexity Ratchet)의 정의
- 비유: **한 방향으로만 움직이는 톱니바퀴**. 한 번 올라간 품질은 다시 내려가지 않는다.
- 세 가지가 누적되며 작동한다:
  1. **테스트** — *무엇이 옳은가*의 영구 기록
  2. **문서** — *왜 그렇게 결정했는가*
  3. **평가 결과** — *최소 품질 기준선*
- 다음 턴의 에이전트가 모두 컨텍스트로 로드 → **결함을 도입하기 어려워진다**.

### 3. 시스템 복잡도 상한이 재정의됐다
- 이전 상한: **"한 팀이 머리에 담을 수 있는 양"**
- 새 상한: **"한 사람 + 전체 코드베이스를 컨텍스트에 로드한 에이전트들"**
- 즉 *제도적 기억*이 사람과 분리되어 영속화된다.
  > "사람은 떠나지만, 테스트와 문서로 남은 지식은 어떤 모델·어떤 시점에서도 다시 불러올 수 있다."

### 4. 90% 커버리지의 비선형성 — *무릎 지점*
- **Capers Jones**의 1만+ 프로젝트 연구: **85~95% 커버리지에서 결함 제거율 92~97%** 도달하는 *knee point*.
- **항공 산업(DO-178C Level A)**: MC/DC 커버리지 강제 → 99%+ 결함 제거.
- **AI의 경제학적 전환점**:
  > "마지막 20%를 채우는 작업은 인간에게 지루하고 비쌌지만, 에이전트는 피로를 느끼지 않으므로 새벽에도 엣지 케이스 테스트를 끝없이 작성한다."

### 5. 게리 탄의 실제 사례
- **GBrain 추출 정확도**: "누가 그 주장을 했는가"를 35% 오인하던 문제를 **17개 테스트로 고정** → 후속 버전이 절대 이를 초과하지 못함. *회귀를 가두는 것이 래칫의 본질*.
- **Superpowers TTY 테스트**: AI 자신의 비정상 행동(대화 건너뛰기)을 Bun의 의사 터미널로 감시. **"AI가 대화했는가"라는 비전통적 요구사항까지 테스트화**.
- 프로젝트 규모: 약 **97만 LOC, 665개 테스트 파일, 15개 에이전트 세션** 동시 운영.

### 6. 한계 — 모든 게 래칫에 잡히진 않는다
- **상태 파괴형 에러**는 여전히 치명적: 잘못된 DB 마이그레이션·보안 침해.
- 약 **10%의 통합 지점과 인프라**는 본질적으로 테스트하기 어렵다.
- 반론 ("테스트 잘 짜는 사람이 원래 아키텍처도 잘 짠다")에 대한 답:
  > "래칫의 핵심은 사람이 아니라 **다음 턴의 안전망**이다."

### 7. 진짜 메시지
> "AI 코딩의 진짜 가치는 '빨리 짜는 것'이 아니라, **지금까지 너무 비싸서 포기했던 수준의 검증을 무료로 만들었다**는 점이다."

## 📜 인상 깊은 문장

> "Tests, documentation, and evals accumulate. Each agent session leaves behind a ratchet — quality only goes one way: up."

> "85–95% coverage hits the knee — 92–97% defect removal. AI makes the last 20% essentially free."

> "People leave; tests and docs don't. Any future model can rehydrate the institutional memory."

> "The real value of AI coding isn't speed. It's that levels of verification we used to consider too expensive are now free."

### GeekNews 댓글에서
- **skymer**: *"SQLite보다 4배 많은 LOC로 Rails 블로그를 만드신 분..."* — Garry Tan의 *과거 프로젝트와의 대비*를 통한 암묵적 비판. **97만 LOC가 적절한 규모인가**라는 정당한 의문 제기.

## 💭 내 생각 · 적용점

### 가든 *균형추*로서의 가치
가든은 [Agentic Coding은 함정이다](2026-05-05-agentic-coding-is-a-trap.md) 이후 **AI 비판 시리즈가 옹호 시리즈보다 우세**한 상태였다. 이 글은 그 균형을 다시 한쪽으로 미는 *옹호 측 강한 한 방* — 다만 **막연한 옹호가 아니라 정량(85~95% knee point) + 메커니즘(래칫) + 사례(GBrain 17개 테스트)**로 무장한 옹호다. 이런 옹호와 비판을 같은 정밀도로 나란히 두는 게 가든의 가치다.

### 가든 *Ratchet 원칙* 시리즈의 완성
가든에는 이미 두 가지 래칫이 있다:

1. [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md) — Addy Osmani의 **개인 작업 래칫** (Brain/Hands/Session 분리, Ratchet 원칙).
2. [Redis Array — antirez 4개월 AI 협업기](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) — **단일 시니어 프로젝트 래칫** (테스트로 회귀 가두기).

본 글이 **조직/팀 차원의 래칫**을 추가하며 3축 시리즈가 완성된다:

| 차원 | 글 | 래칫 단위 |
|---|---|---|
| 개인 작업 | 하네스 엔지니어링 (Addy) | 세션 |
| 시니어 프로젝트 | Redis Array (antirez) | 프로젝트 |
| 조직 / 외부 기여 | **Complexity Ratchet (Garry Tan)** | 코드베이스 |

### CRS 적용 — *지루한 커버리지* 우선순위 매기기
조선호텔 CRS는 결제·인벤토리·OTA 인테그레이션이 핵심이고, 거기서도 **엣지 케이스 커버리지가 가장 비싸다**. 본 글의 시사점:

- **회귀 가두기 우선 영역 1순위**: 결제 idempotency + 환불 경계 케이스.
- **2순위**: OTA 매핑 변환 — *Falsehoods* 시리즈에서 짚었던 이름/주소/통화 변환.
- **3순위**: 객실 인벤토리 동시성 — race condition은 정확히 *지루하고 비쌌던 영역*.
- 액션: 각 영역별로 **AI에 *엣지 케이스 테스트만* 위임**하는 PoC. 코드는 사람이, 회귀 안전망은 AI가.

### BugSip — *처음부터* 래칫 구조로 시작
BugSip은 아직 기획 단계라 **래칫을 처음부터 깔 수 있는 드문 기회**다.

- CMP(Compose Multiplatform) 도메인 모델에 *Why-coverage* + *테스트 커버리지* 두 축으로 시작.
- Spring Boot 백엔드: 회귀 가둘 핵심 시나리오를 **첫 PR**에 정의 (사용자 코드 리뷰 기록 보존·재구성·검색).
- 이 글 + [Anthropic Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) 결합 → **테스트가 *이유*까지 담는 BugSip 콘텐츠 템플릿**.

### *한 명이 만들 수 있는 시스템 상한*의 의미
이 명제는 호스피탈리티 IT 업계에 의미가 크다 — **소수 인원으로 큰 시스템을 운영해야 하는 환경**이 보편적이기 때문. 가든의 [확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md), [확률적 엔지니어링과 24/7 직원](../engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md)과 결합:

- *조직 규모*가 아니라 *래칫 깊이*가 새로운 경쟁 자산.
- MangoLove에 **"래칫 깊이 자가 진단"** 자문 후보: 테스트 커버리지 + 문서 밀도 + 평가 기록 3축 점검.

## 🔗 연관 자료

- [Agentic Coding은 함정이다 — 비판적 관점](2026-05-05-agentic-coding-is-a-trap.md) — 본 글의 **정확한 대척점**. 두 글을 짝지어 읽는 게 핵심.
- [Redis Array — antirez의 4개월 AI 협업기](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) — 단일 시니어의 *프로젝트 차원 래칫* 사례.
- [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md) — Addy Osmani의 *세션 차원 래칫*. 본 글의 *조직 차원 래칫*과 3축 완성.
- [코드 작성에 쓰는 AI 코딩 에이전트는 반드시 유지보수 비용을 줄여야 한다](../engineering/2026-05-12-ai-must-reduce-maintenance-costs.md) — James Shore의 2×2=4 부담 수학. **본 글이 "어떻게"를 채워주는 답**.
- [Agents에는 더 많은 프롬프트가 아니라 제어 흐름이 필요하다](2026-05-09-agents-need-control-flow.md) — 결정론적 스캐폴딩. 래칫의 *런타임 짝*.
- [Anthropic, Claude에게 '왜'를 가르치다](2026-05-14-teaching-claude-why-alignment-training.md) — 같은 날 정리. *왜* 중심 학습이 *what 중심 테스트*와 어떻게 결합하는지가 다음 단계 질문.
- [기술 부채, 인지 부채, 의도 부채](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — Martin Fowler의 3축. 래칫은 *의도 부채*의 누적 방지 메커니즘.
- 외부 참고: Capers Jones, *Software Quality* (1996/2008) — 본 글이 인용한 *85~95% knee* 데이터 원전.
- 외부 참고: DO-178C — 항공 SW 인증 표준, MC/DC 커버리지 정의.

## 📝 한 달 뒤 회고
<!-- 2026-06-14 즈음:
- CRS 결제 idempotency 엣지 케이스를 AI에 위임한 PoC 실행 여부
- BugSip 첫 PR에 래칫 구조(테스트+문서+평가 3축) 깔았는지
- MangoLove "래칫 깊이 자가 진단" 자문 항목 정식 추가했는지 -->
