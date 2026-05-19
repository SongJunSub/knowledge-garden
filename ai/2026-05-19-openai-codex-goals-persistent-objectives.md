---
title: "OpenAI Codex Goals — *증거 기반 완료*를 프로토콜로 만든 영속적 목표 기능"
source_title: "How to use Goals in Codex"
source_url: "https://developers.openai.com/codex/goals"
source_name: "OpenAI Cookbook (developers.openai.com) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29639"
published_at: "2026-05-19"
summarized_at: "2026-05-19"
category: "ai"
tags: ["codex", "openai", "harness", "agent-protocol", "completion-verification", "long-running-tasks", "vendor-convergence", "goal-engineering"]
---

# OpenAI Codex Goals — *증거 기반 완료*를 프로토콜로 만든 영속적 목표 기능

> 출처: [How to use Goals in Codex](https://developers.openai.com/codex/goals) · GeekNews 정리일 2026-05-19

## 🔖 한 줄 요약
**Codex Goals는 *완료 환각*을 프로토콜 차원에서 풀려는 OpenAI의 답** — *단일 프롬프트 1회로 끝나는 작업*이 아닌 *프로파일링·패치·벤치마킹 같은 장기 다단계 작업*을 위해 *결과·검증면·제약·경계·반복 정책·중단 조건* 6요소를 사전 정의받고 *증거 기반으로 자체 완료를 판정*하는 *영속적 목표(persistent objective)* 1차 프리미티브 — *무제한 자율*이 아니라 *사용자 통제 하의 지속성*.

## 🧩 핵심 포인트

- **Goals = 영속적 목표 프리미티브** — 한 프롬프트에 안 들어가는 *반복·다단계 작업*을 단일 단위로 묶어 *세션 간에도 살아남는 1급 객체*로 만듦. 클로드 코드의 *Tasks/Skills*에 대응하는 *Codex 쪽 답*이자, *프롬프트→대화→세션→하네스→Goal*로 *운영 단위가 한 칸 더 위로 이동*한 사건.
- **자율 완료 평가 (Evidence-based completion)** — *"아마 끝났을 것 같다"*는 모델의 *주관적 종료* 금지. **결과·검증면·제약을 사전 정의받으면 *그 검증면의 증거*로만 완료 판정**. *Goal: work → check → continue or complete* 루프가 명시.
- **수명주기 명령** (v0.128.0+) — `/goal` (생성·표시) / `/goal pause` (보류) / `/goal resume` (재개) / `/goal clear` (종료). *사용자가 Goal의 ON/OFF를 직접 제어* — *무제한 백그라운드 폭주* 차단.
- **강한 Goal의 6요소** — *Outcome* (성공이 무엇인가) + *Verification surface* (어떻게 확인하는가, 어떤 명령·테스트·파일) + *Constraints* (해선 안 되는 것) + *Boundaries* (영역 한계, 어떤 파일/시스템) + *Iteration policy* (반복 시도 규칙) + *Blocked stop condition* (멈춰야 할 신호). **각 요소가 빠지면 *완료 환각*이 그 자리로 들어옴**.
- **범위 설정 원칙** — *"감사 가능할 만큼 좁고, 다음 행동을 선택할 수 있을 만큼 넓어야 함."* 이 한 줄이 *Goal 엔지니어링의 메타 원칙* — 좁으면 *Goal이 한 프롬프트와 다를 게 없고*, 넓으면 *증거가 모호해져 환각 복귀*.
- **사용자 통제 하의 지속성** — *"Unbounded autonomy가 아니라 user-controlled persistence."* 이 *철학 선언*이 OpenAI의 *공식 입장* — 가든의 [Hashimoto 광기]·[Gruber AI=기술] 비판에 대한 *공급자 측의 자기 검열적 답변*.
- **연구·벤치마크 분야에서 가치** — *과대 주장 방지*. *근사 재현*과 *정확 재현*의 경계를 *명시적으로 박는다*. 학술 코드의 *재현 가능성 위기*에 대한 작은 처방.
- **"끝났다는 것의 의미를 알려주는 것"** — *Goal은 끝내라고 시키는 게 아니라, 끝났음을 정의해 주는 것* — *완료의 정의권*이 *모델→사용자*로 명시 이전. 가든이 추적해온 *결정권 이동*의 한 사례.

## 📜 인상 깊은 문장

> "Goal: work → check → continue or complete." (Goal은 *작업 → 검증 → 계속 또는 완료* 루프다)

> "A good Goal isn't simply asking Codex to finish — it's telling Codex what *finished* means."  
> (좋은 Goal은 Codex에게 *끝내라*고 요청하는 게 아니라, *끝났다*는 게 무엇인지 알려 주는 것이다)

> "Narrow enough to be auditable, broad enough to allow the model to choose its next action."  
> (감사 가능할 만큼 좁고, 모델이 다음 행동을 선택할 수 있을 만큼 넓어야 한다)

## 💭 내 생각 · 적용점

### *공급자 간 하네스 수렴(Vendor Harness Convergence)* — 가든이 추적해온 가설의 확증

가든의 [[2026-05-18-musinsa-query-engineer-harness]] *Agent = Model + Harness* 명제와 [[2026-05-16-claude-code-large-codebases]] *프롬프트→대화→세션→하네스* 운영 단위 상승은 **Anthropic 진영의 관찰**이었다. 이번 Codex Goals는 **OpenAI 진영도 *같은 방향*에 도달했다는 외부 확증**:
- *Tasks/Skills* (Claude) ↔ *Goals* (Codex) — *언어가 다른 같은 추상화*
- *Claude Code의 worktree·plan·검증* ↔ *Codex Goal의 verification surface·iteration policy·stop condition* — *6요소 어휘가 거의 1:1 대응*
- *사용자 통제 하의 지속성* (Codex 공식 문구) ↔ *Auto Mode·Allow rules* (Claude Code) — *철학 선언이 평행*

**→ *공급자 간 하네스 수렴*은 가설이 아니라 *현재의 사실***. *Agent = Model + Harness*가 *업계 표준 정의*로 굳어지는 단계.

### *완료 환각*에 대한 *프로토콜 차원 답*

가든의 *완료 환각 라인*:
| 자산 | 완료 환각의 어느 차원 |
|---|---|
| [[2026-05-17-claude-to-codex-migration-reddit]] | *모델 차원* — "40%인데 100% 보고" |
| [[2026-05-16-hashimoto-ai-mass-psychosis]] | *조직 차원* — MTTR 만능주의 |
| [[2026-05-17-amazon-token-burning-goodharts-law]] | *제도 차원* — 토큰 KPI |
| [[2026-05-18-musinsa-query-engineer-harness]] | *하네스 차원* — EXPLAIN 정합성 게이트 |
| **Codex Goals** | ***프로토콜 차원*** — *Verification surface 사전 정의* |

**→ 완료 환각이 *5개 차원*에서 동시에 공격받는 그림 완성**. 가든의 *지표 왜곡 5자 짝*. 어느 하나도 충분조건이 아니지만, *Goal 프로토콜이 모델 차원의 자기 검증을 표준화*하므로 *하부 안전망*이 한 층 더 두꺼워짐.

특히 [[2026-05-18-musinsa-query-engineer-harness]]의 *4관점×2공급자 교차 검증·EXPLAIN+실측 정합성 게이트*는 *조직이 만든 하네스 차원 처방*이었는데, **Codex Goals는 그 일부를 *공급자가 직접 제공*하는 단계**. *외부 하네스가 내부 프리미티브로 흡수되는 흐름*.

### [[2026-05-17-claude-to-codex-migration-reddit]] *Claude → Codex 이동 보고*에 *결정적 데이터 1건 추가*

5월 17일 Reddit 사용자가 *Codex의 회귀 감지·일관된 아키텍처 우위*를 주장했고, 내 답변은 *모델 품질 측면 데이터*를 일부 수용했다. 이번 Goals 발표는 **Codex의 *프로토콜 차원 차별화*가 추가**:
- Claude Code는 *Tasks/Skills이 여러 프리미티브로 분산*
- Codex는 *Goals 하나로 통합·명령형 인터페이스(`/goal`)·6요소 명시 강제*

**→ *완료 정의를 강제하는 인터페이스 친절도*에서 Codex가 한 발 앞섬** (현 시점 비교). 단, 이건 *현재 스냅샷*이고 Anthropic도 곧 비슷한 통합 인터페이스를 낼 가능성 높음 — *공급자 간 수렴 가속*.

**2026-05-15 사용자 *코덱스 이전* 질문 v3 답변**:
- v1 (가격): 인터랙티브엔 영향 적음
- v2 (모델 품질): Reddit 회귀 감지 우위 일부 수용
- **v3 (프로토콜): Goals가 *장기 작업의 완료 정의 강제*에서 우위 — 옮길 가치 있는 작업 종류가 *구체적으로 식별됨***
  - **옮길 후보**: 프로파일링·벤치마킹·대규모 리팩터링·재현 가능성 검증 등 *Goal 6요소가 자연스럽게 정의 가능한 작업*
  - **옮기지 말 후보**: 인터랙티브 탐색·일회성 코드 수정·디자인 결정 — *Goal 6요소가 모호한 작업*

### [[2026-05-18-eugene-yan-compounding-with-ai]] *5원칙 중 3번 (검증 자동화)*의 *공급자 측 표준화*

Eugene Yan의 5원칙 중 3번 *검증 자동화·드리프트 방지*는 *개인 차원에서 만들어 둬야 할 것*이었다. **Codex Goals는 그 일부를 *공급자가 프로토콜로 제공*** — *Verification surface*를 명시 요구하니 *드리프트를 사용자가 자동으로 정의*하게 됨.

**5원칙 25칸 체크리스트(5층×5원칙)** 갱신:
- *Model × 검증* 칸: *Goals 6요소 사용 빈도*가 새 측정 항목
- *Harness × 검증* 칸: *Goal/Task 인터페이스 격차*가 *공급자 선택 시 1순위 평가 항목*
- *Platform × 검증* 칸: *내부 도구가 Goals API 호출 표준화* 여부

### [[2026-05-18-gruber-ai-is-technology-not-product]] *AI=기술이지 제품이 아니다*의 **반례인가 친화 사례인가?**

Goals는 **두 가지 해석**이 동시에 가능:
- **친화 해석**: Goals는 *기능*이 아니라 *프로토콜* — *모든 작업에 침투하는 인프라*. Gruber 명제와 일치.
- **반례 해석**: `/goal`은 *명령형 슬래시 인터페이스* — *제품화된 명령 카탈로그*. Gruber 명제와 충돌.

**가든의 판정**: *Goals는 Gruber 친화*. *명령 카탈로그처럼 보이는 표면* 아래의 *증거 기반 완료 루프*가 본질 — 이 루프는 *AI 기능을 *기술 인프라*로 만드는 메커니즘* 그 자체.

다만 *9번째 자가 진단 — 카테고리화 편향*에서 *Goals를 새 카테고리로 호들갑떨지 말 것*. *지금까지의 Tasks/Skills와 같은 가족*임을 인식하는 게 정직한 분류.

### [[2026-05-17-ascetic-computing-ratfactor]] *Ascetic Computing*과의 미묘한 긴장

Ascetic은 *기본 도구에 머무르라*고 한다. Goals는 *새 추상화 추가*다. **충돌하는가?**

가든의 판정: *Goals는 *기본 도구가 될 가능성이 높은 추상화** — *증거 기반 완료*는 *프로그래밍의 기본기*이지 일시 유행 아님. *Ascetic 기준 통과*. 단, **현재의 Goal 슬래시 명령 문법은 *공급자 종속 표면***이므로 *공급자 교차 정의(plain text Goal spec)*로 한 번 추상화하면 *Ascetic 친화 곡선* 완성. 이건 *공급자가 표준화*하기 전엔 *사용자 측 작은 작업*.

### CRS / 사이드 프로젝트 *즉시 적용 후보 4건*

1. **CRS 슬로우 쿼리 6요소 Goal 템플릿** — 무신사 정찰조 패턴을 *Goal 1개로 표현*:
   - *Outcome*: P95 < 200ms 달성
   - *Verification surface*: EXPLAIN 실행 계획 + 실측 응답시간
   - *Constraints*: 비즈니스 로직 변경 금지, 인덱스만
   - *Boundaries*: 특정 테이블 한정
   - *Iteration policy*: 최대 3회 변경 시도
   - *Blocked stop condition*: P99 회귀 발생 시
2. **CRS 결제 idempotency Goal** — [[2026-05-14-ai-coding-complexity-ratchet-garry-tan]]의 *결제 idempotency AI 위임 PoC*에 *완료 조건 강제*를 박는다.
3. **[[project_bugsip]] 코드 리딩 세션 5분 Goal** — *5분 세션 종료*를 *Goal 6요소*로 정의 (Outcome=핵심 함수 1개 이해, Verification=요약 정확도 자가 채점 ≥4/5).
4. **가든 *주간 정리 Goal*** — *매주 5건 정리 + 자가 진단 1건 추가 + 큰 메타 프레임 0~1건* (자산 크기 다양성 시험과 결합).

### *Goal 6요소가 안 맞는 작업*의 정직한 식별

[[feedback_self_verification]]의 *엣지 케이스 검증* 6단계 적용 — Goals가 안 맞는 작업 유형:
- **창발적 탐색** — *Outcome 사전 정의 불가능*. 디자인 결정·아키텍처 선택 초기 단계.
- **한 줄 수정** — *6요소 정의 비용 > 작업 비용*. 오버헤드만 발생.
- **인터랙티브 대화** — *작업 → 검증 루프가 사용자 응답에 종속*. Goal 일시정지의 빈번한 진동.
- **데이터 정의·UX 결정** — *Verification surface가 인간 판단* → 자동 증거 검증 불가능.

→ **Goals는 *프로파일링·벤치마킹·재현·리팩터링·테스트 작성* 같은 *증거 명료 작업*에 적합**. *모든 작업의 Goal화*는 오버 엔지니어링.

### **11번째 가든 자가 진단 — *완료 정의 강제 시험***

가든의 정리본은 *내가 끝났음을 어떻게 알았는가*를 어디서 박고 있나?

지금 가든의 정리본은 *💭 내 생각·적용점*과 *📝 한 달 뒤 회고*만 있고 *"이 정리는 무엇을 만족시키면 완료인가"*가 빠져있다. **Goal 6요소를 *가든 정리 템플릿에 적용*하는 옵션 검토**:
- *Outcome*: 한 줄 요약 (이미 있음 ✓)
- *Verification surface*: ?? (없음 — 추가 후보: *한 달 뒤 1개 이상 의사결정에 영향*)
- *Constraints*: ?? (없음 — 추가 후보: *원문 직접 인용 5문장 이내*)
- *Boundaries*: 카테고리 1개 (이미 있음 ✓)
- *Iteration policy*: ?? (없음 — 추가 후보: *한 달 뒤·분기 뒤 회고 2회만*)
- *Blocked stop condition*: ?? (없음 — 추가 후보: *원문 fetch 불가 시 사용자에게 본문 요청*)

→ **가든 템플릿 *v2 후보*: 6요소 중 부족한 4개를 frontmatter에 옵션 필드로 추가**. *작은 자산엔 안 박고, 중·대 자산엔 박는다*.

## 🔗 연관 자료
- [How to use Goals in Codex (OpenAI Cookbook)](https://developers.openai.com/codex/goals)
- [GeekNews — 29639](https://news.hada.io/topic?id=29639)
- [[2026-05-18-musinsa-query-engineer-harness]] — Agent=Model+Harness *(공급자 간 수렴 짝)*
- [[2026-05-16-claude-code-large-codebases]] — 하네스 운영 단위 *(Anthropic 측 짝)*
- [[2026-05-17-claude-to-codex-migration-reddit]] — Claude→Codex 이전 *(v3 답변 결정적 데이터)*
- [[2026-05-16-hashimoto-ai-mass-psychosis]] — AI 집단 광기 *(완료 환각 조직 차원)*
- [[2026-05-17-amazon-token-burning-goodharts-law]] — Goodhart's Law *(완료 환각 제도 차원)*
- [[2026-05-18-eugene-yan-compounding-with-ai]] — 복리 5원칙 *(검증 자동화의 공급자 표준화)*
- [[2026-05-18-gruber-ai-is-technology-not-product]] — AI=기술 *(친화 vs 반례 해석)*
- [[2026-05-17-ascetic-computing-ratfactor]] — Ascetic Computing *(미묘한 긴장)*
- [[2026-05-14-ai-coding-complexity-ratchet-garry-tan]] — 복잡성 래칫 *(결제 idempotency PoC 짝)*

## 📝 한 달 뒤 회고
*(2026-06-19 즈음 — CRS 슬로우 쿼리에 실제로 Codex Goal을 박았는지, 가든 템플릿 v2의 4개 새 필드가 정리 품질을 높였는지 vs 정리 비용을 늘렸는지, Anthropic이 Goal-동등 통합 인터페이스를 발표했는지 정직히 기록.)*
