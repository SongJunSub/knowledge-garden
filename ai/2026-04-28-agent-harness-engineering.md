---
title: "하네스 엔지니어링: 모델보다 중요한 작업 환경 설계의 시대"
source_title: "Agent Harness Engineering"
source_url: "https://addyosmani.com/blog/agent-harness-engineering/"
source_name: "Addy Osmani's Blog"
referrer_url: "https://news.hada.io/topic?id=28966"
published_at: "2026-04-28"
summarized_at: "2026-04-28"
category: "ai"
tags: ["AI에이전트", "하네스", "AGENTS.md", "컨텍스트관리", "Claude-Code", "에이전트SDK"]
---

# 하네스 엔지니어링: 모델보다 중요한 작업 환경 설계의 시대

> 출처: [Addy Osmani — Agent Harness Engineering](https://addyosmani.com/blog/agent-harness-engineering/) · 레퍼러: [GeekNews 28966](https://news.hada.io/topic?id=28966) · 정리일 2026-04-28

## 한 줄 요약
**Agent = Model + Harness.** 모델 성능 향상을 기다리는 것보다 **현재 모델 주변의 하네스(프롬프트·도구·컨텍스트·훅·관찰성)를 정교하게 설계**하는 것이 실질적 개선을 만든다.

## 핵심 포인트

### 핵심 공식
> "Agent = Model + Harness. If you're not the model, you're the harness." — Viv Trivedy

하네스 = 모델을 제외한 **모든 코드·설정·실행 로직**. 모델 단독으로는 에이전트가 아니다. 상태 관리, 도구 실행, 피드백 루프, 강제 가능한 제약이 더해져야 *agent*가 된다.

### 하네스의 6개 영역
| 영역 | 구성 |
|------|------|
| **프롬프팅** | 시스템 프롬프트, `AGENTS.md`, 스킬 파일, 서브에이전트 프롬프트 |
| **도구 계층** | 도구, MCP 서버, 스킬 레지스트리 |
| **실행 환경** | 파일시스템, 샌드박스, 브라우저 |
| **오케스트레이션** | 서브에이전트 생성, 핸드오프, 모델 라우팅 |
| **실행 제어** | 훅, 미들웨어, 결정론적 검증 |
| **관찰성** | 로그·트레이스, 비용·지연 측정 |

---

### "Skill Issue, Not Model Issue"
- HumanLayer 관찰: 같은 모델이 하네스에 따라 점수가 크게 갈린다.
- **증거**: Terminal Bench 2.0에서 **Claude Opus 4.6**이 기본 하네스에서는 하위권 → 커스텀 하네스로 옮기자 상위권. 모델은 *훈련받은 하네스와 강하게 결합*되어 있다.

> "A decent model with a great harness beats a great model with a bad harness."

> "The gap between what today's models can do and what you see them doing is largely a harness gap."

---

### Ratchet 원칙 (실수를 영구 규칙으로)
하네스 엔지니어링의 **가장 중요한 습관**: 에이전트가 한 실수를 *일회성 사고가 아니라 영구 신호*로 취급.

```
실수 → 구체적 규칙으로 인코딩 → 다시는 같은 실수 못하게
```

예: "테스트를 주석 처리한다" → `AGENTS.md`에 규칙 추가 → 사전 커밋 훅 추가 → 리뷰어 서브에이전트가 플래그.

> "Every line in a good `AGENTS.md` should be traceable back to a specific thing that went wrong."

---

### 컨텍스트 부패(Context Rot) 대응 4가지
1. **압축(Compaction)**: 창이 가득 차면 지능형 요약으로 오프로드
2. **도구 출력 오프로드**: 대용량 로그는 파일시스템 저장 → 필요할 때만 접근
3. **점진적 공개(Progressive Disclosure)**: 필요한 도구·지시만 그때그때 로드
4. **전체 리셋**: 장기 작업 후 *컴팩트한 인계 파일*로 새 컨텍스트 시작

---

### 행동에서 역설계 (Behavior → Harness)
> 원하는 행동을 정의 → 그걸 구현하는 하네스 설계.

각 하네스 기능은 **모델 혼자서 할 수 없는 행동**을 담당해야 한다. 명확한 목적이 없으면 제거.

> "If you can't name the behaviour a component exists to deliver, it probably shouldn't be there."

---

### 장시간 자율 실행 패턴

#### Ralph Loop
훅이 모델의 *종료* 시도를 차단하고 원래 프롬프트를 새 컨텍스트에 재주입. 매 반복은 깨끗한 상태에서 시작 + 상태는 파일시스템에.

#### 계획/생성/평가 분리
- **Planner**: 목표 → 단계 분해
- **Generator**: 코드 작성
- **Evaluator**: 독립 검증 (← *자기검증보다 항상 우수*)

---

### `AGENTS.md` 설계 원칙
- **짧게**: HumanLayer는 60줄 이하 유지
- **줄마다 정당화**: 과거 실패나 하드 제약에 추적 가능
- **파일럿 체크리스트처럼, 스타일 가이드처럼 *아니*하게**
- 도구는 **집중된 10개 > 중복된 50개**

---

### 훅(Hooks): 집행 계층
> "Success is silent, failures are verbose."

- 편집 후 타입체크·린트·테스트 자동 실행
- 위험 명령(`rm -rf`, `git push --force`) 차단
- 승인 필요 조건 설정

---

### Harness-as-a-Service (HaaS)
**LLM API → 하네스 API**로 패러다임 전환:
- **Claude Agent SDK**, **OpenAI Agents SDK**, **Cline**, **Aider** 등이 루프·도구·컨텍스트 관리·훅을 기본 제공
- 개발자는 *도메인 특화 설정*에 집중

> "Harnesses don't shrink, they move." — 모델이 좋아져 한 부담을 덜면, 새로운 작업이 등장해 새 하네스가 필요해진다.

상위 코딩 에이전트들(Claude Code, Cursor, Codex, Aider, Cline)은 **기반 모델보다 하네스 패턴으로 더 비슷해지고 있다.** 다음 경계는 **동적 도구·컨텍스트 어셈블리**와 **자동 하네스 최적화**.

---

### 모델-하네스 훈련 루프
현재 에이전트 제품들은 하네스를 함께 묶어 *포스트훈련*된다:
- 모델은 파일시스템, Bash, 계획, 서브에이전트 디스패치에 *특화*되어 있다
- 그래서 **Opus 4.6은 Claude Code 안에서와 다른 하네스에서 다르게 작동**한다 — 모델 단독 평가가 무의미해지는 이유.

## 인상 깊은 문장

> "Agent = Model + Harness. If you're not the model, you're the harness." — Viv Trivedy

> "A decent model with a great harness beats a great model with a bad harness."

> "The gap between what today's models can do and what you see them doing is largely a harness gap."

> "Every line in a good `AGENTS.md` should be traceable back to a specific thing that went wrong."

> "Success is silent, failures are verbose."

> "If you can't name the behaviour a component exists to deliver, it probably shouldn't be there."

> "Harnesses don't shrink, they move."

## 내 생각 · 적용점

- **Ratchet 원칙은 즉시 도입**할 만하다. 지금까지 Claude/Cursor가 같은 실수를 반복할 때마다 그때만 잡고 넘어갔는데, 이걸 **`AGENTS.md` / `CLAUDE.md` / 훅 / 서브에이전트 룰**의 어딘가에 *영구 규칙*으로 박는 습관으로 바꾸자. **MangoLove의 셀프 리뷰 단계 → 실패 발견 → 즉시 영구 규칙화** 흐름을 명문화.
- **"줄마다 정당화"** 가 가장 강력한 자기 검증 도구. 지금 내 `CLAUDE.md`/`MEMORY.md` 항목들 중 *과거 실패 사례를 짚을 수 없는 줄*은 모두 의심 대상이다. 한 번 정리할 가치가 있다 — 메모리 항목별로 *왜 들어왔는지* 한 줄 메모를 단다.
- **"하네스는 줄어들지 않고 이동한다"** — 너무 정확한 관찰. 모델이 좋아질 때마다 "이제 하네스 필요 없겠지" 했지만 매번 *새로운 하네스 필요 영역*이 떠올랐다. 하네스 투자가 모델 발전에 *낭비되지 않는다*는 강력한 근거.
- **계획/생성/평가 분리**는 MangoLove Large Track의 페르소나 리뷰 구조와 정확히 일치. 같은 모델이 한 컨텍스트에서 평가까지 하면 자기검증의 함정에 빠진다 — 이미 MangoLove가 채택한 방식이지만, *왜 페르소나를 분리하는지*에 대한 이론적 근거가 이 글에서 보강된다.
- **AI 사고의 9초 사건과 짝**: 어제 정리한 [9초 사고](2026-04-27-ai-agent-deleted-production-database.md) 는 *하네스 부재가 만든 참사*다. 이 글의 7항 안전 체크리스트는 결국 *destructive op에 대한 하네스 설계 가이드라인*이었음을 재확인.
- **AI 사고의 위임 분리와 짝**: [Koshy John 글](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md)은 *사람 측의 사고 위임*을 다뤘다면, 이 글은 *기계 측의 행동 위임*을 어떻게 안전하게 가둘지를 다룬다. 두 글을 함께 읽으면 **"AI를 어디에 어떻게 가둘 것인가"**의 양면이 완성된다.
- **즉시 적용 후보**:
 1. CRS·PickMe의 `CLAUDE.md`를 60줄 이하로 다이어트, 줄마다 *근거 사례* 주석 달기
 2. `precommit-check.sh` 형태의 하드 가드를 모든 활성 프로젝트에 표준화
 3. Claude Code 슬래시 커맨드 `/ratchet` 만들기 — 발견된 실패를 입력받아 적절한 위치(skill, hook, AGENTS.md)에 인코딩하도록

## 연관 자료
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](2026-04-27-ai-agent-deleted-production-database.md) — 하네스 부재가 만든 9초 사고. 이 글이 그 안전 체크리스트의 이론적 토대를 제공
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — 사람 측 사고 위임 / 이 글 = 기계 측 행동 위임. 짝으로 읽기
- [`weekly/2026-W17-geeknews-355.md`](../weekly/2026-W17-geeknews-355.md) — Addy Osmani의 70% 문제(28716)와 같은 저자, 같은 흐름의 후속작
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — `AGENTS.md` 줄마다 의도 추적 = 의도 부채에 대한 직접적 처방
- 관련 도구: Claude Agent SDK, OpenAI Agents SDK, Cline, Aider

## 한 달 뒤 회고
<!-- CLAUDE.md 60줄 다이어트 / Ratchet 슬래시 커맨드 / precommit 하드 가드 표준화 — 셋 중 어디까지 갔는지 한 달 뒤 점검. -->
