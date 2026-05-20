---
title: "Code w/ Claude에서 발표한 모든 것들 — 19개 세션 통합 정리"
source_title: "Code w/ Claude SF — All sessions"
source_url: "https://claude.com/code-with-claude/san-francisco"
source_name: "Anthropic (Code w/ Claude SF, 2026-05-06)"
referrer_url: "https://news.hada.io/topic?id=29493"
summarized_at: "2026-05-14"
category: "ai"
tags: ["AI", "Anthropic", "Claude", "컨퍼런스", "로드맵", "에이전트", "MangedAgents", "Dreaming", "ComputerUse"]
---

# Code w/ Claude에서 발표한 모든 것들 — 19개 세션 통합 정리

> 출처: [Code w/ Claude SF — All sessions](https://claude.com/code-with-claude/san-francisco) · 레퍼러: [GeekNews 29493](https://news.hada.io/topic?id=29493) · 정리일 2026-05-14

## 한 줄 요약
Anthropic이 1년치 *가든 가설*을 한꺼번에 **제품 라인업으로 답한 컨퍼런스** — 차별화 축이 "모델 호출 방식"에서 **"어떤 도구·데이터·권한·문맥·메모리를 열어주느냐"**로 공식 이동했고, 새 병목은 **검증·보안·권한·관찰가능성·평가**임을 Anthropic 자신이 명시했다.

## 핵심 포인트 (메타 요약)

### 0. 키노트가 정의한 *새로운 좌표계*
- **사용 폭증**: API 사용량 **YoY 17배**, Claude Code 평균 사용자 **주당 20시간** 실행.
- **차별화 축 이동**:
 > "How you call the model" → **"What tools, data, permissions, and context you open to it."**
- **새 병목** (Anthropic 공식 선언):
 > 검증 · 보안 · 권한 · 관찰 가능성 · 평가 · 조직 운영.
- **방향**: 더 긴 작업 + 장기 메모리 + 더 많은 도구 + 더 나은 검증.

### 1. *제품화된 것* — 가든 가설의 확인
| 세션 발표 | 가든의 사전 가설 (확인됨) |
|---|---|
| **Auto Mode** (파괴/주입 분류 후 자동 실행) | [Agents에 제어 흐름이 필요하다](2026-05-09-agents-need-control-flow.md) — 결정론적 스캐폴딩 |
| **Worktree** (세션별 격리 브랜치) | [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md) — 작업 환경 격리 |
| **Auto Memory** (`memory.md` 자율 관리) | [Anthropic Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — *왜*까지 메모리화 |
| **Routines · `/loop`** (cron/webhook 트리거) | [장기 실행 에이전트](2026-05-04-long-running-agents.md) — Brain/Hands/Session 분리 |
| **Outcomes** (종료 기준 만족까지 반복) | 위 글의 *done-condition 우선 원칙* |
| **Dreaming** (비동기 메모리 정리) | 가든에 *없던 결* — 새 학습 신호 |
| **Claude Managed Agents** | [복잡성 래칫 (Garry Tan)](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — 조직 차원 래칫 |
| **Effort low/high/max** | [AI는 사고를 끌어올려야 한다](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — 사고 레버 정량화 |
| **Computer Use 우선순위** (Cursor) | [vibe-coding ↔ agentic 수렴](2026-05-07-vibe-coding-agentic-engineering-converging.md) — Simon Willison 고백의 *다음 페이지* |

→ 가든이 이론으로 깔아둔 것들을 **Anthropic이 SDK·플랫폼·UX로 응답**한 셈.

### 2. 세션 하이라이트 (요약형)

#### 키노트 — Opus 4.7과 운영 자원
- **Opus 4.7**: Amp·Rakuten·Intuit에서 계획 품질·해결률 향상.
- **5시간 한도 2배** (Pro/Max/Team/Enterprise), **Opus API 한도** 대폭 상향.
- SpaceX **Colossus One** 데이터센터 용량 활용.

#### What's new in Claude Code
- **Remote Control**: 터미널 세션 → 웹/모바일 이어받기.
- **전체 화면 터미널 UI**: 가상 스크롤백, 깜빡임 없는 렌더, 클릭 가능한 도구 호출.
- **GUI**: 다중 세션 핀·필터·그룹·분할, plan/diff/files view에 줄 단위 댓글.
- **Auto Mode**: 파괴성·주입 가능성 분류 → 안전 시 권한 확인 생략.
- **Worktree** · **Auto Memory** · **Routines/loop**.

#### Memory and Dreaming
- 메모리는 **파일 시스템** 구조 (Claude가 Bash/Grep으로 직접 관리).
- **읽기 전용 조직 메모리 + 읽기-쓰기 작업 메모리** 분리.
- **콘텐츠 해시 기반 낙관적 동시성 제어** — 수백 개 에이전트 동시 쓰기.
- **변경 이력·작성 주체·세션·시점** 감사 로그.
- **Dreaming** = 비동기 transcript 분석으로 반복 실수·성공 전략·중복/오래된 메모리 정리.
 - Harvey: 법률 작업 완료율 **6배**.
 - SRE 데모: 단일 에이전트가 놓치던 *60초 재시도 패턴*을 Dreaming이 발견.

#### Caching, Harnesses, Advisors (GitHub)
- **캐시 적중률 목표 94~96%**, 70%대면 설계 문제 신호.
- 시스템 프롬프트·도구 목록 *앞부분은 정적으로*, UUID·시점·동적 도구 로딩은 *뒤로*.
- **Advisor 전략**: 저렴한 실행 모델 + 중요한 판단에만 Opus 조언자.
- 모델 발전 운영 순서: 오프라인 벤치 → 내부 → A/B → 온라인 → 출시 후 최적화.

#### The expanding toolkit
- 직접 만들던 보조 코드(수동 라우터·재시도 장식자)의 가치 하락.
- **도구 출력 스키마**도 함께 기술 → 왕복 호출 감소.
- **사전/사후 도구 훅**으로 차단·기록·분석.
- **100만 토큰 문맥 + 서버 측 압축 + 문맥 편집**.
- **Opus 4.7**: 최대 1440p 스크린샷에서 **1:1 픽셀 좌표** 반환 — 화면 자동화 좌표 보정 부담 제거.

#### Claude Managed Agents
- 구성: **agent config · environment · session**.
- **session events**: 사용자/에이전트/세션/구간 이벤트.
- **Console**: 설정·환경·전체 추적·병목·권장 조치 한 화면.
- **Outcomes**: 종료 기준 + 채점 기준 만족까지 반복.
- 데모: 대시보드 렌더링 **37초 → 10초** (병렬화·fast mode·프롬프트 최적화).

#### Dario & Daniela Amodei
- 사용량·매출 성장이 예상 초과 → 연산 부족.
- Claude Code 다음 변화: *개인 → 팀·조직 생산성*.
- 코드 작성 가속 → **보안·검증·신뢰성·유지보수가 새 병목**.

#### Live coding (Boris Cherny + Jarred Sumner)
- **Bun Robobun**: GitHub issue 자동 재현 + 실패→통과 조건을 PR 기준화.
- **CLAUDE.md** = 빌드/테스트 명령·테스트 위치·과거 실패 패턴·CI 로그 읽는 법.
- agent PR = **머지 의무가 아닌 검토 가능한 제안**.
- 병목 = 코드 작성 → **계획과 검증**.

#### Asana AI teammates
- 에이전트 = *actor*, 승인·워크플로·여러 단계 업무를 사람과 공동 처리.
- **공유 설정·역할 기반 접근 제어·감사 가능성**.
- **21개 이상 사전 구축 teammates** (PMO/마케팅/IT/HR/R&D).
- 피드백 = 다음 사용자 실수 방지용 메모리.

#### Running an AI-native engineering org
- 병목 = 코드 처리량 아님 → **검증·리뷰·보안·유지보수·직군 조율**.
- *긴 화이트보드* → **여러 구현 PR 비교**.
- 채용 = 처리량 < **창의적 빌더 + 깊은 시스템 전문성**.
- 성공 지표: 온보딩 단축, PR 주기 단축, Claude 도움 커밋 증가.

#### Cognition · Gamma · Harvey (AI-native stacks)
- **Cognition**: 모델이 좋아져서 *자체 계획·메모리 시스템 축소*.
- **Harvey**: 능력 변곡점마다 **제품 구조 재설계**.
- **공통**: 기록·관찰 가능성·재생·평가 = 빠른 구조 변화의 필수 장치.
- 법률 등: **공개/비공개/메모리/에이전트 흐름 사이 데이터 경계** 필요.

#### Vercel Guillermo Rauch
- **AI Gateway = 토큰용 CDN** (라우팅·장애·비용).
- **Opus = 사용량 < 지출** 비중 — 비용 구조 명확히 봐야.
- **V0**: 이전 보정 코드(문법 검사·자동 수정) 제거 가능 → *모델 도약 = 보정 제거*.
- V0 Opus 확대 후 크레딧 지출 **2배** 증가.

#### The thinking lever
- **Effort 파라미터** low/high/max — 같은 Opus 4.7도 *교통 시뮬* 품질 큰 차이.
- 토큰 3분류: **사고 / 도구 호출 / 텍스트**.
- **Task Budgets** = 토큰·시간·비용 상한.
- **적응형 사고** = 생각/도구/답변 순서 자유.
- 코딩·에이전트 기본값: **extra high**.

#### Datadog universal machine tool
- Datadog 엔지니어 **90%가 AI 코딩 사용**, 그중 2/3가 Claude Code.
- **Helix**: 며칠 만에 Kafka-like 스트리밍 서비스 시제품.
- **Tempor**: 즉흥 도구 생성 금지 → **청사진(상태·전이·효과·불변식) 선작성**.
- 검증 도구: 전이 표 · 정책 문 · 타입 있는 효과 · 검증기 · 속성 테스트.

#### Google Cloud
- **Application Default Credentials** 기반 설정 마법사.
- **5역할 협업 데모** (PM/UI-UX/SWE/Security/Growth) — 손그림 wireframe → 시제품.
- **Google Cloud Skills** = Cloud Run API/Firestore 블록.
- sub-agent로 API·수집·대시보드 **병렬 구현**.
- **OWASP·service account 권한** 자동 점검 후 Cloud Run 배포.

#### Getting more out of the Platform
- 우선순위: **프롬프트 캐싱 · 문맥 공학 · Advisor**.
- **캐시 적중률 90%대** 목표, **도구 검색 도구**로 필요한 정의만 적시 로드.
- **압축(Compaction)**으로 긴 작업 지속.

#### Replit Agent — 평가가 출시 확인표가 아니다
- 사용자 = framework/test 미지정.
- **오프라인 평가 = 출시 관문 / 온라인 평가 = 실사용 대응**.
- **VibeBench**: 20개 실제 PRD → 빈 저장소 시작 → 브라우저 자동 평가.
- **Telescope**: 운영 추적 의미 기반 그룹핑 → 긴 꼬리 실패 발견.
- 평가 = **매일 개선 엔진**.

#### The capability curve
- **SWE-bench Verified**: Sonnet 3.7 ~62% → **Opus 4.7 87%**.
- Opus 4.7 = 어려운 PR 성공률 **3배+**.
- 향상 영역: **계획 · 오류 복구 · 긴 실행 중 주의 유지**.
- 새 frontier model → **기존 보정 절차/프롬프트 재축소 검토**.

#### Cursor cloud agents
- 진짜 병목 = 모델 지능 < **사람이 충분한 도구·문맥·큰 목표를 못 주는 것**.
- **에이전트 온보딩** = 컴퓨터·개발 환경·문서 부여.
- **AnyDev CLI** = 서비스 시작·준비 대기·로그인까지.
- **Computer Use = 코딩 다음의 기본 요소**.
- **Agent Experience** = 별도 설계 대상 ("work on the factory" 이슈).
- 최종: **A→D 손으로** 아닌 **A→Z 시스템**.

## 인상 깊은 문장

> "How you call the model" → "**What tools, data, permissions, and context you open to it.**"

> "The new bottleneck isn't writing code. It's verification, security, permissions, observability, evaluation, and organizational operations."

> "Today's agent work should make tomorrow's agents automatically better." *(Memory & Dreaming 세션의 진짜 명제)*

> "Agent PRs aren't outputs you must merge. They're proposals you can review." *(Boris Cherny)*

> "The real bottleneck is not the model's intelligence — it's that people aren't giving it enough tools, context, and big enough goals." *(Cursor)*

> "Model step-changes don't just add features. They let you delete the corrections you wrote." *(Guillermo Rauch / V0)*

## 내 생각 · 적용점

### 1. 가든의 *이론 → 제품 확인* 점검표
이 컨퍼런스는 가든에 *읽는 글*이 아니라 **점검 도구**다. 위 매핑 표가 그 점검 결과 — 가든이 깔아둔 11개 가설 중 거의 전부에 Anthropic이 제품으로 응답했고, 가든에 *없던 결*은 **Dreaming** 한 개.

→ **Dreaming = 가든의 다음 연구 결**. *비동기 메모리 정리*는 BugSip의 코드 리딩 학습 누적, 가든 인덱스 자동 정리, MangoLove 자문 기록 누적 모두에 적용 가능. 별도 글로 깊게 파볼 가치.

### 2. CRS·Connectivity 즉시 적용 후보
컨퍼런스가 *조직 운영 병목*을 공식 선언한 만큼, CRS에 대응할 항목:

- **Auto Mode 직접 적용**: 결제·인벤토리 destructive op은 *자동 분류*로 권한 확인 강제, 그 외 read-only는 자동 실행 허용. **단일 ENV로 두 모드 분리**.
- **Worktree 표준화**: 채널 인테그레이션 PoC는 worktree로 격리, *Speed 라인*과 *Scale 라인*([Tuhin Nair 글](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md))과 자연 결합.
- **Auto Memory**: CRS 빌드 명령·디버깅 단서·OTA 매핑 결정 근거를 `memory.md`로 누적 — 신규 합류자/AI 모두에게 *제도적 기억*.
- **Advisor 패턴**: 일상 작업은 Sonnet/Haiku, 결제 정합성·세금 계산 같은 *중요 판단*만 Opus 조언자.
- **캐시 적중률 90%+ 목표**: CRS 도메인 프롬프트가 깨지지 않게 *정적 앞부분 + 동적 뒷부분* 분리.

### 3. BugSip 처음부터 깔 구조
BugSip은 기획 단계라 컨퍼런스 발표 **거의 전부를 첫날부터** 깔 수 있는 드문 기회:

- **CLAUDE.md** = 빌드·테스트·과거 실패 패턴 (Bun Robobun 패턴).
- **VibeBench-style 자체 벤치**: BugSip의 *코드 리딩 학습 시나리오* 20개 PRD화.
- **Tempor 청사진**: 학습 콘텐츠 생성 에이전트가 즉흥 도구 만들지 못하게 상태·전이·효과 선정의.
- **Dreaming**: 학습 transcript 비동기 분석 → *반복 오개념 발견* → 콘텐츠 자동 보강.
- **데이터 경계** (Harvey 패턴): 사용자 코드 vs 공개 학습 자료 vs 개인 메모리 분리.

### 4. MangoLove 자문 항목 추가 후보
컨퍼런스 발표는 자문 체크리스트로 압축 가능:

- "당신 조직의 캐시 적중률은? **90% 미만이면 운영층 설계 부재** 신호."
- "Effort 파라미터가 *low/high/max* 중 어디인가? **Coding/agentic이면 extra high 기본**."
- "agent가 만든 PR을 *결과물*로 보는가, *제안*으로 보는가? 후자가 정답."
- "조직 메모리와 작업 메모리를 분리했는가? 안 했다면 *낙관적 동시성 제어* 부재."

### 5. 가든 *Agent-Default Posture* 시리즈 v2
[확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md)·[Agent-Default Posture](2026-05-07-inverse-laws-of-robotics.md) 라인의 v2 후보:

- **Permission-First Posture**: 차별화는 모델이 아니라 *권한 설계*.
- **Memory-Compounding Posture**: 오늘의 세션이 내일의 에이전트를 자동으로 더 낫게.
- **Evaluation-as-Engine**: 평가는 출시 관문이 아니라 매일 개선 엔진.

## 연관 자료

가든 내 *직접 매핑*:

- [Agents에는 더 많은 프롬프트가 아니라 제어 흐름이 필요하다](2026-05-09-agents-need-control-flow.md) → **Auto Mode + Outcomes + Tempor**가 답.
- [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md) → **Worktree + Auto Memory + Managed Agents**가 그 제품화.
- [장기 실행 에이전트](2026-05-04-long-running-agents.md) → **Routines + Dreaming + done-condition (Outcomes)**.
- [복잡성 래칫 (Garry Tan)](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) → **Datadog Tempor + Replit VibeBench**.
- [Anthropic, Claude에게 '왜'를 가르치다](2026-05-14-teaching-claude-why-alignment-training.md) → **Auto Memory의 *왜* 저장**과 결합.
- [AI 코딩 에이전트는 유지보수 비용을 줄여야 한다](../engineering/2026-05-12-ai-must-reduce-maintenance-costs.md) → **V0 보정 코드 제거 사례**.
- [vibe coding ↔ agentic 수렴](2026-05-07-vibe-coding-agentic-engineering-converging.md) → **Cursor cloud agents**가 그 종착.
- [Claude Code: HTML 효율성](2026-05-10-claude-code-html-effectiveness.md) → **Interactive Tools** 발표가 정식화.
- [중국 AI 연구소 내부에서 얻은 교훈](2026-05-14-notes-from-inside-chinas-ai-labs.md) → *모델-품질-단일초점* vs 본 컨퍼런스의 *플랫폼-운영층-단일초점* 대비.

외부 추천:
- 다음 분기 추적 후보: Anthropic의 **Dreaming** 기술 백서 공개 시 가든에 별도 글.
- **VibeBench** 코드 공개 시 BugSip 자체 벤치 PoC.

## 한 달 뒤 회고
<!-- 2026-06-14 즈음:
- CRS에 Auto Mode 분류 도입 PoC 진행 여부
- BugSip 첫 PR에 CLAUDE.md + Tempor 청사진 깔았는지
- MangoLove 자문 체크리스트에 캐시 적중률·Effort·메모리 분리·PR 제안주의 4개 항목 추가 여부
- Dreaming 깊이 글 별도 작성 여부 -->
