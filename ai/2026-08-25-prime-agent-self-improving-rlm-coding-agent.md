---
title: "Prime Agent (Prime Intellect) — 컨텍스트를 변수로, 서브에이전트를 함수로 다루는 RLM 하네스가, 이론(Meta-Harness)에서 오픈소스 프로덕트로 3주 만에 넘어왔다"
source_title: "PrimeIntellect-ai/prime-agent — A self-improving RLM agent for coding workflows and long-running autonomous tasks"
source_url: "https://github.com/PrimeIntellect-ai/prime-agent"
source_name: "GitHub (PrimeIntellect-ai) / primeintellect.ai 블로그(egress 차단으로 원문 미확인, 검색 스니펫으로만 재구성)"
referrer_url: "https://news.hada.io/topic?id=32861"
published_at: "2026-08-05"
summarized_at: "2026-08-25"
category: "ai"
tags: ["prime-agent", "recursive-language-model", "rlm", "continual-harness", "coding-agent", "long-running-agents", "self-improving-ai", "agentic-harness", "geeknews"]
---

# Prime Agent (Prime Intellect) — 컨텍스트를 변수로, 서브에이전트를 함수로

> 출처: [PrimeIntellect-ai/prime-agent](https://github.com/PrimeIntellect-ai/prime-agent) (GitHub, MIT) · 정리일 2026-08-25
> **출처 한계**: `news.hada.io`, `www.primeintellect.ai`, `news.ycombinator.com`, `www.marktechpost.com`이 이번 세션 egress 정책상 모두 차단이다. **직접 열어 확인한 건 GitHub 저장소(README)와 `packages/coding-agent/docs/rlm.md` 문서 두 개뿐**이고, 나머지(Prime Intellect 공식 블로그 발표문, ARC-AGI-3 95.5% 벤치마크의 구체 조건, HN 스레드 포인트·댓글 수)는 **WebSearch가 반환한 검색 스니펫으로 재구성한 것**이라 원문 그대로인지 대조 검증은 못했다. Slack 발췌 마지막 불릿("실행 가…")이 가리키는 문장도 원문 미확인으로 완성하지 못했다.

## 한 줄 요약

**Prime Intellect가 2026년 8월 5일 공개한 오픈소스 코딩·리서치 에이전트 Prime Agent는, RLM(Recursive Language Model — 컨텍스트를 지속형 IPython 커널의 변수로 취급하고 서브에이전트 호출을 함수 호출처럼 다루는 방식)과 Continual Harness(보조 프롬프트·메모리·스킬·서브에이전트 사양을 에이전트 스스로 CRUD 가능한 영속 상태로 취급하는 방식) 두 추상화로 설계됐다.** `/refine` 명령으로 과거 실행 궤적을 보조 프롬프트·메모리·재사용 스킬로 스스로 변환하며, Opus 5와 조합했을 때 ARC-AGI-3에서 95.5%(보고된 human-expert 베이스라인 95.4%를 상회)를 기록했다고 알려졌다 — MIT 라이선스로 공개된 지 3주 만에 GitHub 스타 1만8천 개를 넘겼다.

## 핵심 포인트

- **RLM(Recursive Language Model)** — 지속형 IPython REPL이 모델의 유일한 기본 도구다. Python 상태가 턴을 넘어 유지돼("변수·임포트·함수·파싱 결과가 다음 턴에서도 재사용 가능"), 파일 읽기·셸 명령·도구 사용·컨텍스트 관리가 전부 코드로 처리된다. 서브에이전트 호출은 `await rlm("Review authentication flow", name="auth-reviewer")`처럼 **함수 호출** 형태이며, 호출은 작업 승인 직후 곧바로 반환되고 자식의 답변을 기다리지 않는다 — 부모는 다음 턴으로 진행하고 결과는 `agent_message` 응답이나 파일로 나중에 도착한다. 독립적인 서브태스크를 병렬로 띄우는 게 자연스러운 이유다.
- **Continual Harness** — 보조 프롬프트·메모리·스킬 설명·재사용 가능한 서브에이전트 사양을 "작은 근거 기반 업데이트로 계속 다듬을 수 있는 영속 상태"로 저장한다. `/refine` 명령이 과거 실행 궤적을 이 영속 상태로 변환하는 자기개선 루프의 진입점이다.
- **그 밖의 기능** — 데몬 기반 백그라운드 실행·재연결, 에이전트 간 직접 통신, 자동 컴팩션과 영속 목표 추적. 설치는 `curl -fsSL https://app.primeintellect.ai/prime-agent/install.sh | sh` 한 줄.
- **벤치마크(검색 스니펫 재구성, 원문 대조 못함)** — Opus 5 기준 ARC-AGI-3 95.5% RHAE Best@1(3회 실행 95.0/95.2/95.5, Best@3 99.97%, 183/183 레벨 완료로 보고). Prime Intellect는 "벤치마크 특화 이득이 아니다"라며 GPT-5.6 Sol·GLM-5.2 등 다른 프론트 모델에서도 자사 하네스 대비 개선을 관찰했다고 주장한다 — **이 주장 자체는 벤더 발표라 제3자 재현 검증은 확인 못했다.**
- **프로젝트 규모** — GitHub 직접 확인(2026-08-25 기준): **스타 18.3k, 포크 2.0k, MIT 라이선스.** 공개 3주 만의 수치라 성장세는 빠르지만, 스타 수가 프로덕션 검증을 의미하지는 않는다.
- **보안 주의사항** — README 자체가 "신뢰할 수 있는 코드·지침만 사용하고, 불신뢰 코드는 격리 환경에서 실행하라"고 명시한다 — 지속형 REPL + 자율 셸 접근 조합의 위험을 프로젝트 스스로도 인지하고 있다는 뜻으로 읽힌다.

## 인상 깊은 문장

> "config_files = list(Path(".").rglob("*.toml")); large_files = [path for path in config_files if path.stat().st_size > 10_000]" — 이 변수들은 다음 모델 응답에서도 그대로 재사용된다.
> **(GitHub `rlm.md` 원문 예시 그대로 — "컨텍스트를 변수로 취급한다"는 표현이 은유가 아니라 말 그대로 Python 변수 바인딩이라는 걸 가장 잘 보여준다.)**

> "handle = await rlm("Review authentication flow", name="auth-reviewer")"
> **(서브에이전트 위임이 진짜 비동기 함수 호출 문법이라는 걸 보여주는 예시. 프롬프트로 "서브에이전트를 시작해라"라고 지시하는 게 아니라, 실제 async 함수를 호출한다.)**

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 **댓글 수·논조 확인 불가.**
- **Hacker News**: "Prime Agent: A self-improving RLM agent" 항목이 존재하는 것으로 검색되며, 검색 스니펫 종합으로는 **2026-08-07 시점 약 249포인트·65댓글**로 추정된다. 다만 `news.ycombinator.com` 자체가 이번 세션 egress 차단이라 **스레드를 직접 열어 대조하지 못했고, 상위 댓글 논조는 확인 불가** — 수치의 정확도를 보장할 수 없다.
- **Lobsters**: 검색으로 개별 제출을 찾지 못했다. **큐레이션 여부 확인 불가.**
- **GitHub**: 스타 18.3k·포크 2.0k는 직접 페이지 확인(가장 신뢰도 높은 수치).
- **읽을 때 감안**: ①Prime Intellect는 자체 벤더이므로 ARC-AGI-3 95.5%·"다른 모델에서도 개선" 주장 모두 **자사 발표 수치**이고 제3자 재현은 이번 세션에서 확인하지 못했다. ②공개 3주 차 프로젝트라 **장기 프로덕션 신뢰성·실패 사례는 아직 축적되지 않았다.** ③Slack 발췌가 잘려 있던 마지막 문장("실행 가…")이 정확히 무슨 내용인지 — 아마도 "실행 가능한(executable)" 무언가를 가리키는 것으로 짐작되지만 원문을 못 구해 **추측 이상은 아니다.**

## 내 생각 · 적용점

### 핵심 전이 1: [[2026-08-06-harness-engineering-for-self-improvement]]가 그린 "Meta-Harness" 이론이, 3주 만에 오픈소스 프로덕트로 도착했다

Lilian Weng의 글이 세운 3단계 진화(ACE→MCE→**Meta-Harness**: 맥락이 아니라 하네스 코드 자체가 최적화 대상)와 DGM 실험(고정 모델 위에서 에이전트가 자기 하네스를 편집)은, Prime Agent의 **Continual Harness + `/refine`**과 거의 1:1로 겹친다 — "보조 프롬프트·메모리·스킬·서브에이전트 사양을 CRUD 가능한 영속 상태로 취급"한다는 설명은 DGM이 하던 일의 프로덕트화다. 그런데 Weng이 세운 가장 중요한 경계 — ***"평가기와 권한 제어는 루프 외부에 있어야 한다"*** — 가 Prime Agent에서 지켜지는지는 **이번 조사로 확인하지 못했다.** `/refine`이 궤적을 스스로 평가해 스스로 영속 상태에 반영하는 구조라면, Weng이 경고한 **보상 해킹·다양성 붕괴** 위험이 그대로 잠재한다. 이건 흠을 잡는 게 아니라 — 이론(경계가 중요하다)과 제품(경계를 실제로 어떻게 구현했는지는 문서에 안 나온다) 사이의 간극이 정확히 여기서 드러난다는 관찰이다.

### 핵심 전이 2: 어제 정리한 [[2026-08-24-agent-md-improve-llm-code-quality]]의 "사후 관찰 → 규칙화"를, Prime Agent는 사람 없이 자동화하려 한다

Sanglard의 `agent.md`는 **사람이** 반복 리뷰 코멘트를 관찰하고 **수동으로** 파일에 추가하는 방식이었다 — 그 노트에서 짚었듯 "실패 로그를 관찰하며 갱신하는 운영 자산"이라는 원칙이 핵심이었다. Prime Agent의 `/refine`은 정확히 같은 생성 메커니즘(관찰된 실패/성공 궤적 → 재사용 규칙)을, **에이전트 스스로** 수행하도록 자동화한 것이다. 흥미로운 건 그 노트의 전이 1에서 이미 "밀도는 파일 길이가 아니라 세션 길이로 관리된다"고 짚었는데, Prime Agent는 그 관리 단위(세션 경계)를 하네스 기능(자동 컴팩션 + 영속 상태)으로 코드화했다는 점이다. 다만 Sanglard 사례엔 **사람이 매 규칙을 승인**한다는 암묵적 검증 단계가 있었는데, `/refine`에 그 승인 단계가 있는지는 문서에서 확인 못했다 — 있다면 안전한 자동화, 없다면 전이 1의 우려가 그대로 적용된다.

### 핵심 전이 3: [[2026-05-04-long-running-agents]]의 Brain/Hands/Session 3분리와, RLM의 "상태를 REPL 안에 산 채로 둔다"는 서로 다른 해법이다

Osmani 글이 수렴시킨 아키텍처는 **"상태는 에이전트 컨텍스트 밖에 산다"** — `progress.txt`·append-only 이벤트 로그처럼 **디스크의 외부 파일**로 상태를 빼내는 방식이었다. RLM은 정반대에 가깝다 — 상태(변수·임포트·파싱 결과)를 **지속형 IPython 프로세스 안**에 살아있는 채로 유지한다. 이건 진짜 트레이드오프다: 살아있는 프로세스 상태는 파일 I/O 없이 빠르고 표현력이 높지만, **그 프로세스가 죽으면 무엇이 살아남는가**가 Osmani 아키텍처만큼 명확하지 않다. README의 "데몬 기반 백그라운드 실행과 재연결" 기능이 이 문제에 대한 답으로 보이지만, 재연결 시 REPL 상태가 어느 수준까지 복구되는지는 문서에서 확인하지 못했다 — 확인했다면 이건 두 아키텍처 축(외부 로그 vs 살아있는 프로세스)의 실질적 우열을 가릴 좋은 사례가 됐을 것이다.

### 핵심 전이 4: [[2026-05-09-agents-need-control-flow]]의 "프롬프트가 아니라 런타임으로"가, RLM에서는 은유가 아니라 문자 그대로다

Brian의 진단은 ***"신뢰성은 prose가 아니라 runtime으로 로직을 옮겨야 나온다"***였고, 그 근거로 3층 구조(결정적 스캐폴딩 / LLM 판단 / 결정적 도구)를 세웠다. RLM은 이 원칙을 가장 급진적으로 실현한 사례다 — "서브에이전트를 순서대로 호출해라" 같은 지시를 프롬프트 문장으로 강화하는 대신, 아예 **진짜 Python 함수 호출 문법**을 모델에게 준다. 비결정성이 사라지는 건 아니다 — 모델이 어떤 코드를 쓸지는 여전히 비결정적이다. 다만 그 코드가 일단 쓰이고 나면 IPython 실행은 결정적이라, Brian이 말한 "비결정성을 좁은 구간에 가둔다"는 원칙이 문자 그대로 코드 실행 경계에서 성립한다.

## 호스피탈리티 / CRS 적용 포인트

- **"컨텍스트를 변수로, 서브에이전트를 함수로" 설계 원칙은 온다가 장기 자율 코딩 에이전트 도입을 검토할 때 구체적 참고 대상이 된다.** 예를 들어 CRS 모듈의 야간 배치 리팩토링·마이그레이션처럼 여러 시간 걸리는 작업을 에이전트에 맡긴다면, "서브태스크를 프롬프트로 순차 지시"하는 대신 "서브에이전트 호출을 실제 비동기 함수 호출로 표현하고 결과를 메시지/파일로 비동기 수신"하는 RLM 패턴이 병렬화·재시도 로직을 코드로 명확히 표현하게 해준다 — 프롬프트 체인보다 디버깅·재현이 쉬울 가능성이 크다.
- **다만 이 패턴을 그대로 들여오려면 [[2026-05-04-long-running-agents]]가 강조한 "상태는 컨텍스트 밖 외부 파일에 둔다"는 원칙과의 긴장을 먼저 풀어야 한다.** 정산·예약 상태 전이처럼 감사 추적이 필수인 CRS 도메인에서는, RLM처럼 상태를 살아있는 프로세스 변수로만 두면 장애 시 복구·감사가 어려울 수 있다 — 채택한다면 REPL 상태를 주기적으로 외부 append-only 로그에 체크포인트하는 하이브리드가 필요할 것이다.
- **Continual Harness의 "규칙을 에이전트가 스스로 CRUD"하는 개념은, CRS처럼 실패 비용이 큰 도메인에서는 [[2026-08-06-harness-engineering-for-self-improvement]]의 경고("평가기·권한 제어는 루프 외부에")를 그대로 지켜야만 안전하게 쓸 수 있다.** 즉 `/refine`류 자동 규칙 갱신을 CRS 코드베이스에 도입한다면, 정산·요금 로직에 영향을 주는 규칙 변경만큼은 사람 승인 게이트를 반드시 루프 밖에 둬야 한다 — 이건 이 프로젝트가 보장해주는 게 아니라 도입하는 쪽이 직접 설계해야 할 부분이다.
- **정직하게 밝히면**: Prime Agent 자체를 CRS 프로덕션에 바로 도입하는 건 아직 멀다 — 공개 3주 차, 벤치마크는 벤더 자체 발표, 실패 사례·장기 신뢰성 데이터가 없다. 지금 시점에 옮길 만한 건 프로덕트 자체가 아니라 **설계 원칙**(컨텍스트=변수, 서브에이전트=함수, 관찰 기반 규칙 축적)뿐이다.

## 연관 자료
- [[2026-08-06-harness-engineering-for-self-improvement]] — Meta-Harness·DGM이라는 이론이 3주 만에 프로덕트(Continual Harness)로 도착, 그러나 "평가기는 루프 밖에" 원칙의 구현 여부는 미확인
- [[2026-08-24-agent-md-improve-llm-code-quality]] — 사람이 수동으로 하던 "반복 관찰→규칙화"를, `/refine`이 자동화하려는 시도. 승인 게이트 유무가 안전성을 가른다
- [[2026-05-04-long-running-agents]] — 상태를 "외부 파일"에 두는 아키텍처 vs RLM의 "살아있는 프로세스 변수"에 두는 아키텍처, 서로 다른 트레이드오프
- [[2026-05-09-agents-need-control-flow]] — "프롬프트가 아니라 런타임으로"가 RLM에서는 은유가 아니라 문자 그대로의 함수 호출 문법으로 실현됨

## 한 달 뒤 회고
*(2026-09-25 즈음: ①Prime Intellect 블로그·HN 스레드 접근이 풀리면 ARC-AGI-3 수치와 `/refine`의 승인 게이트 유무를 원문으로 대조했는지 ②GitHub 스타·이슈 트래커에서 프로덕션 실패 사례가 보고됐는지 ③"컨텍스트=변수, 서브에이전트=함수" 패턴을 실제로 프로토타입해봤는지 기록.)*
