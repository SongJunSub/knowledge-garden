---
title: "mattpocock/skills vs MangoLove — 내 워크플로우와의 비교·합칠 후보"
source_title: "Skills For Real Engineers"
source_url: "https://github.com/mattpocock/skills"
source_name: "github.com/mattpocock/skills"
referrer_url: "https://jkf87.github.io/mattpocock-skills-real-engineers-claude-2026-04-27"
published_at: "2026-04-27"
summarized_at: "2026-04-29"
category: "ai"
tags: ["AI에이전트", "Claude-Code-Skills", "워크플로우", "MangoLove", "비교분석", "도입후보"]
---

# mattpocock/skills vs MangoLove — 내 워크플로우와의 비교·합칠 후보

> 출처: [github.com/mattpocock/skills](https://github.com/mattpocock/skills) (37.5k ⭐, MIT) · 한국어 해설: [코난쌤 블로그](https://jkf87.github.io/mattpocock-skills-real-engineers-claude-2026-04-27) · 정리일 2026-04-29

## 🔖 한 줄 요약
Matt Pocock가 매일 쓰는 22개 Claude Code 스킬 모음 — **내 MangoLove `/strict` 워크플로우와 강하게 겹치지만, 합치면 더 강해질 4가지 공백**(grill·CONTEXT.md·diagnose loop·write-a-skill)이 명확히 보인다.

## 🧩 mattpocock/skills 핵심 구조

### 4가지 문제 프레임 + 처방
| # | 문제 | 처방 스킬 |
|---|------|----------|
| 1 | **의도 불일치** (Agent didn't do what I want) | `/grill-me`, `/grill-with-docs` |
| 2 | **과도한 verbosity** (공유 언어 부재) | `CONTEXT.md` + `/grill-with-docs` |
| 3 | **작동하지 않는 코드** | `/tdd`, `/diagnose` |
| 4 | **진흙 공 아키텍처** | `/improve-codebase-architecture`, `/zoom-out`, `/to-prd` |

### 22 스킬 카테고리
- **Engineering (8)**: diagnose, grill-with-docs, triage, improve-codebase-architecture, setup-matt-pocock-skills, tdd, to-issues, to-prd, zoom-out
- **Productivity (3)**: caveman (75% 토큰 절감), grill-me, write-a-skill
- **Misc (4)**: git-guardrails, migrate-to-shoehorn, scaffold-exercises, setup-pre-commit
- **Personal/Deprecated**: 4개 (개인용 또는 폐기 예정)

### 핵심 철학
> "These skills are designed to be small, easy to adapt, and composable. They work with any model."

> *"GSD, BMAD, Spec-Kit"이 프로세스 자체를 소유하면서 통제권을 빼앗는 반면, 이 스킬들은 작고 조합 가능하고 적응 가능*하도록 설계됨.

---

## 🔄 MangoLove `/strict` vs mattpocock/skills 매핑

### A. 겹치는 영역 (둘 다 잘 다루는 것)

| 영역 | MangoLove `/strict` | mattpocock |
|------|---------------------|-----------|
| **사전 정렬** (의도 일치) | Spec 작성 + 적대적 Spec 리뷰 | `/grill-me`, `/grill-with-docs` |
| **검증 중심 사고** | RED-GREEN-REFACTOR 자동 행동 전환 | `/tdd` 스킬 (vertical slicing 강조) |
| **다중 관점 리뷰** | 3인 페르소나 리뷰 (보안/성능/비즈니스) | `/triage` (state machine) |
| **위험 명령 차단** | 사용자 승인 원칙 | `git-guardrails-claude-code` (실제 hook) |
| **PR/이슈 생성 지원** | PR 생성 단계 | `/to-issues`, `/to-prd` |

### B. mattpocock이 강한 영역 (MangoLove에 *공백*)

#### B-1. **`/grill-me` — 적대적 인터뷰 모드**
- "한 번에 한 질문씩, 결정 트리의 모든 가지를 풀 때까지" 사용자를 압박해서 *의도를 끌어낸다*.
- 내 워크플로우: Spec 템플릿은 있지만 "TBD가 있으면 통과 못함" 정도의 검증. **사용자에게 적극적으로 질문을 던지는 모드는 없다**.
- **합칠 가치**: 매우 큼. Spec 작성 단계에 `/grill-me`를 넣으면 누락된 분기를 자동으로 끌어낼 수 있다.

#### B-2. **`CONTEXT.md` + ADR — 공유 언어 자산**
- 프로젝트별 도메인 용어집과 *되돌리기 어려운 결정*을 ADR에 보관.
- 효과: 토큰 사용 ~75% 감소, 변수·함수·파일명 일관성, **다음 세션에도 의도가 남는다**.
- 내 워크플로우: 의도 부채를 인지하고는 있지만(`engineering/2026-04-24-...`) **레포 단위 표준 자산화는 없음**. 프로젝트별 CLAUDE.md만 있을 뿐.
- **합칠 가치**: 최상. [의도 부채 글](2026-04-24-technical-cognitive-intent-debt.md)이 경고하는 바로 그 공백을 정확히 메우는 도구.

#### B-3. **`/diagnose` — 6단계 디버깅 디시플린**
- Phase 1 (피드백 루프 구축) > 나머지 모든 것. *"30초 flaky 루프는 무용지물, 2초 deterministic 루프는 디버깅 슈퍼파워"*.
- Phase 2~6: Reproduce → 3-5개 가설 랭크 → Instrument(`[DEBUG-a4f2]` 태그) → 회귀 테스트 → 클린업 + 포스트모템.
- 내 워크플로우: "체계적 디버깅"으로만 명시되어 있고 **각 단계가 정형화돼 있지 않다**.
- **합칠 가치**: 큼. `/diagnose` 텍스트가 그 자체로 디버깅 SOP라 **Skill로 그대로 도입 가능**.

#### B-4. **`/write-a-skill` — 스킬을 만드는 스킬**
- 새 스킬을 만들 때의 구조·점진적 공개·번들 리소스 가이드.
- 내 환경: MangoLove에 `skills/` 디렉토리는 있지만 비어 있음. **스킬 작성 자체가 표준화돼 있지 않다**.
- **합칠 가치**: 중상. Ratchet 원칙([어제 글](2026-04-28-agent-harness-engineering.md))을 실행할 때 *발견된 실수를 스킬로 빠르게 만드는 도구*가 필요하다.

### C. MangoLove가 강한 영역 (mattpocock에 없음)

| 영역 | MangoLove의 것 |
|------|---------------|
| **작업 규모 자동 분류** | Change Impact Score → Trivial/Small/Medium/Large 트랙 자동 선택 |
| **단일 최종 승인 게이트** | 중간 확인 없이 분석/Spec/리뷰 자율 진행 후 한 번만 승인 |
| **서브에이전트 worktree 격리** | 메인 세션 브랜치를 건드리지 않고 병렬 작업 |
| **Review Readiness Dashboard** | 트랙별 PASS/FAIL 게이트 명시 |
| **자동 메모리 관리** | user/feedback/project/reference 4 타입 분류, MEMORY.md 인덱스 |
| **변경 유형별 스마트 라우팅** | API/DB/인프라/UI 등 유형에 따라 강조 리뷰 관점 자동 부여 |

### D. 충돌·의도적으로 다른 접근

- **mattpocock은 "사용자 인터뷰" 적극 / MangoLove는 "단일 최종 승인"**: 정반대 같지만 사실 *보완 관계*. Spec 작성 *내부*에서는 grill, *전체 워크플로우 외부*에는 single approval — 두 층위가 다르다.
- **mattpocock은 vertical slicing TDD 강조 / MangoLove도 RED-GREEN-REFACTOR 명시**: 동일.
- **mattpocock은 글로벌 스킬 / MangoLove는 글로벌 methodology**: 단위가 다를 뿐 같은 방향.

---

## 🎯 합칠 후보 우선순위

### 🔴 즉시 도입 (High)
1. **`/grill-me` 또는 `/grill-with-docs` 스킬 도입**
   - MangoLove Spec 작성 단계에서 자동 호출되도록 strict.md 수정
   - 효과: TBD 잡아내는 정도가 아니라 *결정 트리의 빈 가지*를 채우는 데까지 확장

2. **`CONTEXT.md` + `docs/adr/` 표준 도입**
   - CRS, PickMe, BugSip 각 레포에 `CONTEXT.md` 시드
   - "되돌리기 어렵고 / 맥락 없이는 이상해 보이고 / 진짜 트레이드오프인" 결정만 ADR
   - 효과: 의도 부채 *직접* 감소, 토큰 절약은 부산물

### 🟡 다음 사이클 도입 (Medium)
3. **`/diagnose` 스킬 도입**
   - 디버깅 트리거(`/strict`의 디버깅 자동 행동) 진입 시 자동 호출
   - 6단계 SOP를 그대로 활용

4. **`/write-a-skill` + Ratchet 원칙 결합**
   - "발견된 실수 → 즉시 스킬화" 슬래시 커맨드 자체를 만들기
   - [하네스 엔지니어링 글](2026-04-28-agent-harness-engineering.md)에서 도출한 `/ratchet` 후보의 구체화

### 🟢 선택 (Low)
5. **`/caveman` 토큰 절약 모드**
   - 긴 작업 후반부에 토큰 부족할 때 트리거
   - 평소엔 가독성 손해라 기본 활성 X

6. **`/zoom-out` (낯선 코드 영역 진입 시)**
   - 사실 Explore 서브에이전트가 비슷한 역할 — 중복 가능

### ⛔ 도입 보류
- `/triage`, `/to-issues`, `/to-prd`: 내 흐름과 다른 이슈 트래커 운영 방식. 차라리 Linear MCP 활용이 적합.
- `/migrate-to-shoehorn`, `/scaffold-exercises`: TypeScript 강의용 — 내 컨텍스트에 안 맞음.
- `/setup-matt-pocock-skills`: 다른 스킬과 결합된 셋업이라 단독 도입 의미 없음.

---

## 📜 인상 깊은 문장

> "These skills are designed to be small, easy to adapt, and composable. They work with any model."

> "Approaches like GSD, BMAD, and Spec-Kit try to help by owning the process. But while doing so, they take away your control."

> "A 30-second flaky loop is barely better than no loop. A 2-second deterministic loop is a debugging superpower." — `/diagnose`

> "Tag every debug log with a unique prefix. Untagged logs survive; tagged logs die." — `/diagnose`

> "Only offer to create an ADR when all three are true: hard to reverse, surprising without context, the result of a real trade-off." — `/grill-with-docs`

> *(코난쌤 블로그)* "신선한 점은 모델이 아니라 워크플로가 자산이라는 사실을 보여준 거"

## 💭 내 생각 · 적용점

- **이 레포가 GitHub 트렌딩 1위가 된 이유는 모델이 아니라 *공정*이 자산임을 가장 구체적으로 보여줬기 때문**이다. [Addy Osmani의 하네스 엔지니어링](2026-04-28-agent-harness-engineering.md)이 *이론*이라면 mattpocock은 *작품*. 둘은 짝.
- **CONTEXT.md가 가장 큰 공백**: [인지 부채/의도 부채](../engineering/2026-04-24-technical-cognitive-intent-debt.md) 글에서 경고했던 바로 그 공백을 외부 도구 없이 *문서 한 장*으로 메운다는 게 충격적으로 단순하고 강력하다. CRS/PickMe/BugSip 각각의 도메인 용어를 한 페이지에 박아놓는 작업은 즉시 시도할 가치가 있다.
- **`/grill-me`의 "한 번에 한 질문" 룰**이 디테일이지만 핵심. 한꺼번에 5-7개 던지면 사용자가 가장 쉬운 것만 답하고 나머지를 잊는다. 한 번에 하나씩이 인터뷰의 디시플린.
- **`/diagnose`의 Phase 1 강조**가 가장 진짜다 — *피드백 루프가 디버깅의 90%*. 내가 그동안 "버그 추적할 때 가설부터 세우고 logs 뿌리는" 안티패턴을 종종 했는데, **루프 자체를 product처럼 다듬는다**는 발상은 직접적인 개선점.
- **MangoLove 통합 액션 플랜**:
  1. `~/.mangolove/methodology/strict.md` 분석 단계에 *grill 모드*를 옵션으로 추가 (Medium 이상 트랙)
  2. CRS/PickMe/BugSip에 `CONTEXT.md` 초안 작성 (1시간 작업)
  3. `/diagnose` 스킬을 `~/.mangolove/skills/`에 도입, 디버깅 자동 행동 시 호출
  4. `/ratchet` 슬래시 커맨드 자체 제작 (write-a-skill 참고)
- **반론·균형점**: mattpocock 스킬은 *TypeScript/JS 생태계와 GitHub Issues* 가정이 강하다. 일부는 그대로 차용하기보다 정신만 가져오고 도구는 한국 백엔드(Java/Kotlin/JIRA·Linear) 환경에 맞게 재구성하는 게 맞다.
- **충돌 없는 결합 가능**: mattpocock의 *내부 작업 방법론* + MangoLove의 *외부 워크플로우 게이트* — 두 층위가 다르다. 서로 잡아먹지 않는다.

## 🔗 연관 자료
- [`ai/2026-04-28-agent-harness-engineering.md`](2026-04-28-agent-harness-engineering.md) — 하네스 엔지니어링의 *이론*. 이 글은 *실전 모범*
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — `/grill-me`는 사고 위임을 막는 직접 도구
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — `CONTEXT.md` + ADR이 의도 부채의 직접 처방
- [`engineering/2026-04-28-three-constraints-before-i-build-anything.md`](../engineering/2026-04-28-three-constraints-before-i-build-anything.md) — Jordan Lord의 1-pager는 mattpocock의 PRD-grill 방식과 통한다
- [`weekly/2026-W17-geeknews-355.md`](../weekly/2026-W17-geeknews-355.md) — Skillify(28777)와 같은 흐름의 다음 사례

## 📝 한 달 뒤 회고
- [ ] CONTEXT.md를 CRS/PickMe/BugSip에 시드했는가
- [ ] `/diagnose` 스킬이 실제 디버깅에 진입했는가
- [ ] `/ratchet` 슬래시 커맨드가 만들어졌는가
- [ ] grill 모드를 한 번이라도 Spec 단계에서 호출했는가
