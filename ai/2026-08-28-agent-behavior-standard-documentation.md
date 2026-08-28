---
title: "Agent Behavior — 에이전트의 반복 행동을 표준 스펙으로 문서화하는 오픈 포맷 (Braintrust & Basis) — 결과 하나로 평가할 수 없는 장시간 에이전트를, 과정을 문서화해서 평가 가능하게 만든다"
source_title: "Behavior specs, an open standard for supervising long-horizon agents"
source_url: "https://github.com/braintrustdata/agentbehavior"
source_name: "GitHub (braintrustdata/agentbehavior) · 원 발표는 Braintrust 블로그(Braintrust & Basis 공동)"
referrer_url: "https://news.hada.io/topic?id=32962"
published_at: "2026-07-29"
summarized_at: "2026-08-28"
category: "ai"
tags: ["agent-behavior", "behavior-spec", "ai-agent-evaluation", "eval-driven-development", "long-horizon-agents", "open-standard", "llm-as-judge", "agents-md", "geeknews"]
---

# Agent Behavior — 에이전트의 반복 행동을 표준 스펙으로 문서화하는 오픈 포맷

> 출처: [braintrustdata/agentbehavior](https://github.com/braintrustdata/agentbehavior) (GitHub, Apache 2.0 · 원 발표: [Braintrust 블로그 "Behavior specs, an open standard for supervising long-horizon agents"](https://www.braintrust.dev/blog/behavior-specs), 2026-07-29 · 스펙 사이트 [agentbehavior.dev](https://www.agentbehavior.dev/)) · 정리일 2026-08-28
> **출처 한계**: `news.hada.io`, `www.braintrust.dev`, `www.agentbehavior.dev` 세 곳 모두 이번 세션 egress 차단으로 **직접 열지 못했다.** 확인 가능했던 건 GitHub 저장소 README(WebFetch 성공)와 WebSearch 스니펫뿐이다. 그래서 ①GeekNews 원문이 정확히 어느 URL(GitHub / Braintrust 블로그 / agentbehavior.dev)을 1차 링크로 걸었는지, ②hada 댓글 수·논조, ③HN·Lobsters 큐레이션 여부를 **하나도 원문으로 확인하지 못했다.** `published_at`은 WebSearch로 재구성한 Braintrust 블로그 공개일(2026-07-29)이며 대조 검증은 못했다.

## 한 줄 요약

**Braintrust(AI 관측·평가 플랫폼)와 Basis(세무 신고서를 대신 작성하는 AI 에이전트 스타트업)가 공동으로 만든 오픈 표준 "behavior spec"은, 장시간 동작하며 수백 번 판단을 내리는 에이전트를 ***"결과 하나로 평가할 수 없다"***는 전제에서 출발한다 — 대신 그 과정에서 반복적으로 지켜야 할 행동(정보를 어떻게 확인하고, 무엇을 판단하며, 어떻게 실행하고, 정보가 부족하거나 실패했을 때 어떻게 복구하는지)을 `.agents/behaviors/<name>/BEHAVIOR.md`라는 파일에 YAML frontmatter(`name`, `description`) + 자유 형식 마크다운으로 문서화한다.** 이 문서는 그 자체로 리뷰어·루브릭·스코어러·eval이 등장하기 이전의 ***"단일 기준 문서"*** 역할을 하고, 이후 실제 트레이스(trace)를 놓고 각 스펙을 `true`/`false`/`NA` 세 등급 중 하나로 채점하는 ***"standing eval"***로 전환된다. Basis 자신도 처음엔 "정확한 세무 신고서가 나왔는가"라는 결과 지표만 썼다가, 과정 자체를 정의하고 궤적(trajectory)의 각 단계를 평가하는 쪽으로 옮겨갔다고 밝힌다.

## 핵심 포인트

- **문제의식** — ***"현대의 에이전트는 몇 시간 동안 일하며 하나의 궤적(trajectory) 안에서 수백 번 판단을 내릴 수 있고, 그 행동을 하나의 결과 지표로 환원할 수 없다."*** 결과만 보는 평가로는 "우연히 맞았지만 과정이 위험했던" 궤적을 걸러낼 수 없다는 문제의식.
- **파일 형식과 위치** — `BEHAVIOR.md` 파일. YAML frontmatter는 최소 `name`·`description` (예시: `name: validate-rendered-deck`, `description: Render the current PowerPoint before delivery, inspect it for visual issues, and revalidate after fixes.`). 위치는 **평가 대상 에이전트 바로 옆** `.agents/behaviors/<name>/BEHAVIOR.md`이고, 선택적으로 `references/` 하위 디렉토리에 참고자료를 둘 수 있다.
- **여섯 가지 선택적 조직화 라벨** — 본문을 구조화할 때 쓰는 개념 틀(모두 선택 사항): **Intent**(이 행동의 목적) · **Evidence**(판단의 근거가 되는 정보) · **Decision**(무엇을 판단할지) · **Execution**(실제로 어떻게 실행하는지) · **Recovery**(정보 부족·실패 시 복구 방법) · **Failure modes**(흔히 깨지는 방식). Slack 발췌가 요약한 "확인·판단·실행·복구" 네 축과 대체로 겹치되, 원문은 여기에 Intent와 Failure modes 두 축을 더 갖고 있다.
- **예시 스펙** — `validate-rendered-deck`: PPT를 전달하기 전에 실제로 렌더링해 이미지로 시각적 문제를 검사하고, 수정 후 재검사까지 요구하는 행동 스펙. "결과물이 열리는가"가 아니라 "전달 전에 반드시 눈으로 확인하는 행동을 했는가"를 문서화한 예.
- **채점 방식** — 각 스펙은 실제 트레이스를 놓고 `true` / `false` / `NA` 셋 중 하나로 독립적으로 채점된다. 파일 안에 스펙이 여러 개면 **각각 개별적으로** 판정한다(전체를 하나로 뭉뚱그리지 않음).
- **도구 체인** — `packages/agentbehavior` CLI로 구조 검증(`pnpm exec agentbehavior validate .` 형태로 검색됨), "writing-agent-behavior"라는 스킬로 스펙 작성을 보조, 이후 Braintrust에서 실제 트레이스에 대해 스펙을 판정.
- **AGENTS.md류와의 위치 차이(Slack 발췌 + 본문 취지 종합)** — 일회성 작업 절차나 도구 사용법이 아니라, ***비용·안전·정확성처럼 여러 작업에 걸쳐 계속 지켜야 하는 행동***을 겨냥한다고 소개된다. 다만 이 구분을 명시한 원문 문장을 직접 대조하지는 못했다 — GitHub README와 WebSearch 스니펫에서 재구성한 취지다.
- **저장소 규모(WebFetch로 직접 확인, 2026-08-28 기준)** — 스타 311개, 포크 6개, Apache 2.0 라이선스. 채택 사례가 아직 폭넓게 드러나지 않은 신생 표준.
- **탄생 배경** — Basis(세무 AI 에이전트 스타트업)와 Braintrust(관측·평가 플랫폼)의 협업에서 출발 — Basis가 실무에서 결과 지표만으로는 부족함을 겪은 게 표준화의 계기.

## 인상 깊은 문장

> "A modern agent can work for hours and make hundreds of decisions in a single trajectory, and you cannot reduce that behavior to one outcome metric."
> (WebSearch로 재구성된 원문 인용 — 이 표준 전체의 출발점을 가장 압축해서 보여주는 문장. 직접 대조 검증은 못했지만 여러 검색 결과에서 일관되게 인용된다.)

## 댓글

- **hada 댓글 수·논조 확인 불가**(`news.hada.io` 이번 세션 egress 차단).
- **HN/Lobsters 큐레이션 여부**: WebSearch로 `agentbehavior.dev`·`behavior specs`·`braintrustdata/agentbehavior`를 HN·Lobsters 한정 검색했지만 **관련 스레드를 찾지 못했다.** 다만 이건 "존재하지 않는다는 증거"가 아니라 "이 세션의 검색으로는 발견하지 못했다"는 뜻으로만 읽어야 한다 — `news.ycombinator.com`을 직접 열 수 없어 사이트 내 검색으로 재확인은 못했다.
- **읽을 때 감안**: ①스타 311개의 신생 프로젝트라 실제 프로덕션 채택 사례·장기 운영 경험은 아직 드러나지 않는다. ②"에이전트가 몇 시간 동안 수백 번 판단한다"는 문제 제기 자체는 Braintrust·Basis 모두 이 표준을 파는 당사자이므로, 표준의 필요성을 얼마나 객관적으로 봐야 할지는 감안할 부분이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-08-eval-driven-development-airbnb]]가 이미 짚은 "trace/span 단위 평가"를, behavior spec은 재사용 가능한 파일 포맷으로 표준화한 것에 가깝다

Airbnb의 EDD 노트는 ***"에이전트 시스템은 최종 답변만으론 평가 불가능해 실행 추적·스팬을 재구성해 하위 호출·도구 선택·매개변수까지 검사한다"***고 했다. behavior spec의 `true`/`false`/`NA` 채점과 `.agents/behaviors/`라는 위치는 정확히 그 문제의식을 파일 포맷으로 만든 것으로 읽힌다 — Airbnb가 사내에서 만든 3계층 평가 체계의 "2층(LLM-as-Judge)이 무엇을 판단할지"에 해당하는 **루브릭 자체를 회사마다 새로 설계하지 말고 표준 파일로 공유하자**는 제안인 셈이다. 다만 Airbnb 글의 "골든 데이터셋 50~100개로 80%대 후반~90%대 일치를 목표로 보정"하는 정량적 보정 절차가 이 표준 문서 어디에 있는지는 이번 조사에서 확인하지 못했다 — behavior spec 자체는 "무엇을 평가할지"의 포맷이지, "그 평가가 얼마나 신뢰할 만한지"를 보증하는 절차까지 포함하는지는 불명확하다.

### 핵심 전이 2 — [[2026-08-24-agent-md-improve-llm-code-quality]]와 생성 메커니즘은 닮았지만, 용도가 다르다

Sanglard의 `agent.md`는 ***"세션마다 반복해서 지적한 리뷰 코멘트를 사후에 파일에 추가"***하는, 관찰에서 자라는 규칙 축적물이었다. behavior spec도 "반복적으로 보여야 할 행동"을 문서화한다는 점에서 생성 동기는 같다. 그러나 `agent.md`는 **매 세션 프롬프트에 주입되는 지시문**(생성을 바꾸는 입력)인 반면, behavior spec은 **트레이스를 사후에 채점하는 평가 기준**(생성 이후 결과를 판정하는 출력 쪽 도구)이다 — 같은 "반복 행동을 문서화한다"는 발상이 파이프라인의 서로 다른 지점(입력 프롬프트 vs 사후 평가)에서 독립적으로 나타난 셈이다.

### 핵심 전이 3 — [[2026-08-09-eight-line-context-file]]의 "밀도" 원칙과 정면으로 다른 방향을 택하는데, 목적이 다르기 때문일 것이다

8줄 파일 노트의 핵심은 ***"에이전트가 스스로 탐색 가능한 정보는 적지 말고, 알면서도 하지 않는 행동만 8줄로 압축하라"***였다. 반대로 behavior spec은 Intent·Evidence·Decision·Execution·Recovery·Failure modes라는 **여섯 축의 구조를 명시적으로 갖추라**고 권한다 — 밀도를 낮추는 방향이다. 이 둘은 모순이 아니라 **용도가 다르다**는 게 내 잠정 해석이다: 8줄 파일은 "매 세션 컨텍스트 윈도에 밀어넣는 프롬프트"라 짧아야 살아남고, behavior spec은 "가끔 참조하며 채점 기준으로 쓰는 문서"라 구조가 있는 편이 오히려 판정의 일관성을 높인다. 다만 이 해석도 두 원문 모두 벤치마크가 아니라 각자의 실무 관찰담이라 검증된 구분은 아니다.

### 핵심 전이 4 (자기지시적 관찰) — 이 가든의 `CLAUDE.md` 자체가 이미 소규모 behavior spec처럼 작동하고 있다

이 노트를 쓰는 파이프라인 자체가 좋은 예다. `CLAUDE.md`의 "자율 워크플로우"·"커밋 규칙"·"품질 기준" 절은 **일회성 작업 절차가 아니라 이 가든에서 정리 노트를 쓸 때마다 반복적으로 지켜야 할 행동**(정직성 명시, 핵심 전이 세우기, CRS 접점 시도, 억지 연결 금지)을 규정한다 — behavior spec의 Intent(왜 정리하는가)·Decision(무엇을 판단 기준으로 삼는가)·Execution(어떻게 커밋·푸시하는가)·Failure modes(dead link, "PASS"만 보고 금지)와 거의 1:1로 대응한다. 다만 이 가든의 `CLAUDE.md`는 `true`/`false`/`NA`로 트레이스를 채점하는 형식적 평가 루프까지는 갖추고 있지 않다 — "품질 기준을 지켰는가"를 사람(사용자)이 직접 읽고 판단하는 수준에 머문다는 점에서, behavior spec이 제안하는 표준화의 다음 단계가 무엇인지 가늠하게 해준다.

## 호스피탈리티 / CRS 적용 포인트

- **가장 직접적인 적용점은 온다 사내 AI 에이전트(고객 응대·예약 처리·정산 자동화 등)의 평가 체계다.** "정산 전 원장을 반드시 대사했는가", "고객 응대 중 확인되지 않은 정보를 확정적으로 답변하지 않았는가", "실패 시 임의로 재시도하지 않고 사람에게 에스컬레이션했는가" 같은 **반복적으로 지켜야 할 행동**을 `BEHAVIOR.md` 유사 포맷으로 명문화하고, 실제 트레이스를 놓고 사후 채점하는 구조는 [[2026-08-08-eval-driven-development-airbnb]]의 3계층 평가와 결합해 CRS 도메인에도 옮길 만한 방향이다.
- **다만 정직하게 밝히면, 지금 시점에 "이 표준 자체(BEHAVIOR.md 파일 포맷, `.agents/behaviors/` 규약)"를 그대로 도입할 근거는 약하다.** 스타 311개의 신생 프로젝트라 실전 검증이 얕고, 이번 조사로 도구 체인(CLI 검증, 채점 파이프라인)의 성숙도까지는 확인하지 못했다. 옮길 만한 것은 **"결과 하나가 아니라 반복 행동을 문서화하고 채점한다"는 원칙**이지, 이 특정 파일 포맷을 지금 바로 채택하는 건 아니다.
- **부수적으로 흥미로운 관찰**: 이 가든의 `CLAUDE.md`가 이미 유사한 역할(핵심 전이 4)을 하고 있다는 걸 이번 노트를 쓰면서 발견했다 — CRS 프로덕션 코드에 앞서, 이 개인 가든 자체가 "반복 행동을 문서화해 품질 기준으로 삼는다"는 원칙의 작은 실증 사례인 셈이다.

## 연관 자료
- [[2026-08-08-eval-driven-development-airbnb]] — behavior spec의 `true`/`false`/`NA` 채점과 trace/span 평가가 정확히 겹치는 방법론적 뿌리. 골든 데이터셋 보정 같은 정량적 신뢰도 검증 절차가 behavior spec에도 있는지는 미확인
- [[2026-08-24-agent-md-improve-llm-code-quality]] — "반복 관찰된 행동을 문서화한다"는 같은 발상의 다른 쪽(입력 프롬프트 축적 vs 사후 평가 기준)
- [[2026-08-09-eight-line-context-file]] — 정반대의 밀도 원칙(짧게 vs 구조화해서 풍부하게) — 용도(프롬프트 주입 vs 채점 기준)가 다르기 때문이라는 잠정 해석
- [[2026-08-27-headlong-persistent-agent-microharness]] — "장시간 동작하며 수백 번 판단하는 에이전트"라는 같은 문제 인식을 공유하지만, 그쪽은 하네스 설계 축, 이쪽은 평가 표준 축이라는 차이

## 한 달 뒤 회고
*(2026-09-28 즈음 — ①`news.hada.io`·`braintrust.dev`·`agentbehavior.dev` 접근이 가능해지면 이 노트의 인용문·구조 설명을 원문으로 대조. ②GitHub 스타 수·이슈 트래커에서 실제 채택 사례나 채점 신뢰도(정량적 보정)에 대한 논의가 나왔는지 확인. ③HN·Lobsters 스레드 존재 여부를 재검색. ④온다 사내 에이전트 평가에 "반복 행동 문서화 → 사후 채점" 원칙을 실제로 검토했는지 기록.)*
