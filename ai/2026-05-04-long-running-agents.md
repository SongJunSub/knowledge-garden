---
title: "장기 실행 에이전트 — 며칠 동안 실행되면 무엇이 달라지는가"
source_title: "Long-running agents"
source_url: "https://addyo.substack.com/p/long-running-agents"
source_name: "Elevate by Addy Osmani"
referrer_url: "https://news.hada.io/topic?id=29153"
published_at: "2026-04-30"
summarized_at: "2026-05-04"
category: "ai"
tags: ["AI에이전트", "Long-running", "Brain-Hands-Session", "Ralph-Loop", "Checkpoint", "Memory", "Addy-Osmani"]
---

# 장기 실행 에이전트 — 며칠 동안 실행되면 무엇이 달라지는가

> 출처: [Addy Osmani — Long-running agents](https://addyo.substack.com/p/long-running-agents) · 레퍼러: [GeekNews 29153](https://news.hada.io/topic?id=29153) · 정리일 2026-05-04

## 한 줄 요약
Anthropic·Google·Cursor가 **모두 같은 아키텍처로 수렴**: *모델 루프 ↔ 실행 샌드박스 ↔ 지속 세션 로그* 의 3분리. 24시간 자율 실행은 *모델 능력*이 아니라 **상태 관리·세션 지속성·구조화된 핸드오프**로 결정된다.

## 핵심 포인트

### "Long-running"의 세 가지 의미 분리
혼동되는 개념을 명확히:
| 개념 | 정의 | 예시 |
|------|------|------|
| **Long-horizon reasoning** | 모델이 종속 단계를 계획·실행 | 7개월마다 능력 2배 (METR 연구) |
| **Long-running execution** | 시간/일 단위로 실행되는 *프로세스* | 24시간 리팩토링 — *하네스 문제* |
| **Persistent agency** | 신원을 유지하며 *학습*하는 에이전트 | 메모리 뱅크 방식 |

### 세 가지 핵심 장벽
1. **Finite context** — 24시간 실행은 *어떤 컨텍스트 윈도우에도 안 들어감* + context rot
2. **No persistent state** — 새 세션은 백지로 시작
3. **No self-verification** — 모델이 자기 작업을 *너무 긍정적으로* 평가

> "A 24-hour run is not going to fit in any context window the field has on its roadmap. Something has to give."

---

### 수렴된 아키텍처: Brain / Hands / Session 분리
Anthropic의 프레이밍:

> "The Hands are sandboxes, the Brain is the model, the Session is an append-only event log."

| 컴포넌트 | 역할 |
|----------|------|
| **Brain** | 모델 (사고·생성) |
| **Hands** | 샌드박스 (도구 실행, 부수효과) |
| **Session** | append-only 이벤트 로그 (지속 상태) |

이점:
- 각 컴포넌트 *독립 교체*
- *뇌 충돌*이 전체 세션을 잃지 않음
- 세션 로그에서 *상태 복구*

> "Now you pick which version of 'decoupled brain, hands, and session' you want to rent."

---

### Ralph Loop (Geoffrey Huntley / Ryan Carson)
실무자 버전, 단순한 패턴:

```
1. 미완료 작업 선택
2. 프롬프트 구성 (컨텍스트 + 지속 노트)
3. 에이전트 호출
4. 테스트/검증
5. progress.txt에 결과 기록
6. 작업 상태 업데이트
```

> "State lives outside the agent's context. prd.json is the plan, progress.txt is the lab notes."

핵심: **상태는 에이전트 컨텍스트 *밖에* 산다** — 파일시스템에.

---

### Planner / Worker / Judge 분리 (Cursor 진화)
- **초기**: 평등한 에이전트들 → *병목*
- **개선**: 낙관적 동시성 제어 → 여전히 조정 문제
- **현재**: **역할 분리** — Planner / Worker / Judge

> "A surprising amount of the system's behavior comes down to how we prompt the agents more than the harness or the model."

**중요 발견**: 같은 작업도 *다른 역할에서는 다른 모델이 더 나음*. 모델·역할 매트릭스 최적화가 차세대 차별화 지점.

---

### 5가지 프로덕션 패턴

#### 1. Checkpoint-and-Resume
> "Treat the agent like a long-running server process: write intermediate state to disk, checkpoint every N units of work."

- 200개 문서 처리 후 201번째에서 실패 → *처음부터 시작 X*
- 올바른 *checkpoint granularity* 선택이 핵심

#### 2. Delegated Approval
- 에이전트가 *완전한 상태로 일시 정지* → 사람 승인 → 재개
- 위험한 단계 직전에 자동 일시정지

#### 3. Memory-Layered Context
> "Govern memory like you govern microservices."

- 메모리 드리프트 방지를 *마이크로서비스처럼 관리*
- 단기/장기/공유 메모리 계층화

#### 4. Ambient Processing
- Pub/Sub·BigTable 스트림에 *비감독* 에이전트
- 이벤트 드리븐 자율 실행

#### 5. Fleet Orchestration
- 전문가 에이전트 *코디네이터* (리드 / 점수 / 아웃리치 분리)

---

### 기업별 비교 (같은 패턴, 다른 포장)

| 회사 | 핵심 제품 | 특징 |
|------|----------|------|
| **Anthropic** | Claude Managed Agents (2026.04 출시) | initializer + coding agent, **test ratchet** (테스트 삭제 금지) |
| **Google** | Agent Platform (Cloud Next '26) | Memory Bank, Agent Sessions(비즈니스 ID 통합), Agent Gateway |
| **Cursor** | Background cloud agents | 8시간 리팩토링이 *랩톱 종료로 안 끊김*, git worktree 격리, PR 머지 |

세 회사 모두 *같은 패턴*에 수렴 — 표면 차이는 *엔터프라이즈 정책 / 호스팅 여부 / IDE 통합*.

---

### 가장 중요한 한 가지

> "Write down the done-condition before the agent starts. This is the single highest-leverage move for long runs."

**완료 조건을 *시작 전에* 외부 파일로 명시** — 그래야 *생성기와 평가기*가 분리될 수 있다.

### 미해결 문제
- **비용**: 회로 차단기 필요
- **보안**: 모델 생성 코드가 *자격증명 접근 불가*해야
- **정렬 드리프트**: 장시간 요약 반복으로 원래 목표 손상
- **검증 비용**: 24시간 활동 감사의 *인간 시간*
- **인간 역할 변화**: 에이전트가 실행 가능하도록 *명확한 명세 작성*이 어려움

## 인상 깊은 문장

> "A 24-hour run is not going to fit in any context window the field has on its roadmap. Something has to give."

> "The Hands are sandboxes, the Brain is the model, the Session is an append-only event log."

> "State lives outside the agent's context. prd.json is the plan, progress.txt is the lab notes."

> "A surprising amount of the system's behavior comes down to how we prompt the agents more than the harness or the model."

> "Govern memory like you govern microservices."

> "Write down the done-condition before the agent starts. This is the single highest-leverage move for long runs."

## 내 생각 · 적용점

### 하네스 엔지니어링과의 직접 연결
[1주일 전 정리한 Addy Osmani의 하네스 엔지니어링 글](2026-04-28-agent-harness-engineering.md)의 **직접 후속작**. *하네스가 줄어들지 않고 이동한다*는 결론이 이번엔 *시간 축 확장*으로 구체화됨.

| 1주 전 | 이번 |
|--------|------|
| 하네스 6영역 | Brain/Hands/Session 3분리 |
| Ratchet 원칙 | Checkpoint-and-resume |
| AGENTS.md 60줄 | done-condition.txt + progress.txt |
| 자기 검증 분리 | Planner/Worker/Judge 분리 |

### 즉시 적용 — 내 Claude Code 세션
긴 세션(가든 큐레이션 / BugSip 작업 / CRS 분석 등)에 *단계별로* 적용:

1. **done-condition을 시작 전에 적기**: *지금부터 가든에 무엇을 추가하면 끝인가*를 한 줄로 메모. 시작 후엔 바꾸지 않는다.
2. **progress.txt 외부화**: 현재 마음속이나 채팅 컨텍스트에만 있는 진행 상황을 *별도 파일로* — Spec과 commit 메시지가 이미 일부 역할 수행 중. 강화 가능.
3. **Checkpoint granularity 의식**: 큰 작업을 *단계별 commit*으로 끊으면 세션이 잘려도 재시작 비용이 작다. 이미 부분 실행 중인 워크플로지만 *명시화*하면 더 강해짐.

### MangoLove 트랙·서브에이전트와의 정렬
- **Brain/Hands/Session 분리**: MangoLove의 *서브에이전트 worktree 격리*가 정확히 *Hands 분리*다. *Session*에 해당하는 것이 부족 — 작업 로그를 *append-only 이벤트 로그*로 명시화하면 복구·감사 가능성이 비약적으로 상승한다.
- **Planner/Worker/Judge**: Large Track의 *Spec 리뷰(적대적) → Product/Engineering 리뷰 → 3인 리뷰*가 정확히 이 패턴. 이론적 근거가 이번 글에서 다시 보강됨.
- **Test ratchet**: Anthropic의 *"테스트 삭제 금지"* 정책. MangoLove의 [근본 원인 우선 원칙](../engineering/2026-04-23-laws-of-software-engineering.md)에 *테스트 삭제 금지*를 명시 룰로 추가 후보.

### 호스피탈리티/CRS 적용 후보
- **Ambient Processing 패턴**이 호스피탈리티 운영에서 자연스럽게 맞는다 — *OTA 가격 변경 이벤트 / 예약 취소 알림 / 회원 행동 신호* 같은 스트림에 *비감독 에이전트*를 붙이는 그림. *YC RFS #15 The AI OS for Companies*의 호스피탈리티 버전.
- **Memory governance**: 호텔 도메인의 *컨트랙트·정책·예외*는 정확히 *마이크로서비스처럼 관리해야 할 메모리*. Hotel Brain의 *왜를 남기는* 자산이 곧 메모리 거버넌스.

### 반론·균형점
- 5가지 패턴 모두 *제품화된 시스템*에 잘 맞지만, *내가 쓰는 1인 워크플로*에선 *과한 인프라*가 될 수 있다. 우선순위는 **done-condition 명시**와 **progress.txt 외부화** 두 가지. 나머지는 작업 규모가 *진짜 24시간 단위로* 커질 때 도입.
- *"같은 작업도 다른 역할에서는 다른 모델"* 통찰은 흥미롭지만, 현재 Claude Code 단일 모델 워크플로에선 직접 활용 어려움. 미래 표준이 될 가능성으로만 인지.

## 즉시 시도할 액션 3가지
1. **MangoLove `/strict` Spec 템플릿에 *done-condition* 항목 명시 추가** — 작업 시작 전에 *외부 파일에 1줄로* 적는 단계
2. **Append-only progress 로그 패턴 시범** — 가든 큐레이션·BugSip 같은 긴 작업에서 commit 메시지 + 별도 progress.md 조합 시도
3. **Test ratchet 정책 명문화** — `/strict`에 *"테스트 삭제는 근본 원인 해결이 아니다"* 룰 추가

## 연관 자료
- [`ai/2026-04-28-agent-harness-engineering.md`](2026-04-28-agent-harness-engineering.md) — **이 글의 직계 선행작** (Addy Osmani 같은 저자)
- [`ai/2026-04-29-mattpocock-skills-vs-mangolove.md`](2026-04-29-mattpocock-skills-vs-mangolove.md) — Planner/Worker/Judge 분리는 mattpocock의 *grill→tdd→diagnose* 분리와 통한다
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](2026-04-27-ai-agent-deleted-production-database.md) — *Hands 샌드박스의 부재*가 만든 9초 사고
- [`engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md`](../engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md) — *Records of Functions* + *Temporal durable execution*은 Brain/Hands/Session 분리의 Haskell 표현
- [`engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md`](../engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — Ambient Processing이 #15 AI OS의 호스피탈리티 적용 후보

## 한 달 뒤 회고
- [ ] `/strict` Spec에 *done-condition* 명시 단계 추가했는가
- [ ] Append-only progress 로그 시범 적용했는가 (가든·BugSip)
- [ ] Test ratchet 정책 명문화했는가
- [ ] Hotel Brain·Ambient Processing 후보 포함된 호스피탈리티 AI OS PoC 검토했는가
