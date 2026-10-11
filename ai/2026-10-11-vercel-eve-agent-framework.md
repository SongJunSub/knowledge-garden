---
title: "Eve (Vercel) — 디렉터리 하나가 에이전트다, 파일시스템이 곧 작성 인터페이스"
source_title: "vercel/eve"
source_url: "https://github.com/vercel/eve"
source_name: "GitHub (vercel/eve)"
referrer_url: "https://news.hada.io/topic?id=35140"
published_at: "2026-06-17"
summarized_at: "2026-10-11"
category: "ai"
tags: ["eve", "vercel", "agent-framework", "filesystem-first", "skills", "tools", "durable-agents", "oss"]
---

# Eve (Vercel) — 디렉터리 하나가 에이전트다

> 출처: [vercel/eve](https://github.com/vercel/eve) (GitHub, Apache-2.0) · GeekNews(id=35140) 경유 · 정리일 2026-10-11
>
> **출처 한계**: `news.hada.io`는 이번 세션 내내 `getaddrinfo ENOTFOUND`로 전혀 열리지 않았고, `vercel.com`·`thenewstack.io`·`flaviocopes.com` 등 2차 매체도 전부 같은 방식으로 막혀 직접 열람하지 못했다. 다행히 **`github.com/vercel/eve`와 그 `README.md`는 WebFetch로 직접 확보**했으므로, 폴더 구조·기능·라이선스·CLI 사용법은 1차 소스다. 반면 **출시일(2026-06-17, Vercel "Ship 26" 컨퍼런스)과 "Next.js for agents"라는 표현, 경쟁 프레임워크(Mastra·LangGraph) 비교는 전부 WebSearch로 교차 확인한 2차 매체(dev.to, logrocket, explainx.ai 등)에서만 나왔다** — README 자체에는 출시 맥락이 없다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인하지 못했다.

## 한 줄 요약

**Vercel이 공개한 오픈소스 프레임워크 eve는 "파일시스템이 곧 작성 인터페이스"라는 한 문장으로 요약된다 — 에이전트 개발자는 `agent/` 디렉터리 안에 `instructions.md`(필수 시스템 프롬프트) 하나만 있어도 에이전트를 돌릴 수 있고, `tools/`에 타입이 지정된 TypeScript 함수를, `skills/`에 필요할 때만 불러오는 마크다운 절차를, `channels/`에 HTTP·Slack·Discord 연결을, `schedules/`에 cron 작업을 파일로 추가해 확장한다. 별도의 등록 코드 없이 파일 하나를 추가하는 것 자체가 곧 기능 추가인 설계다.**

## 핵심 포인트

- **핵심 설계 — "The filesystem is the authoring interface"** — README가 명시하는 한 문장. 설정·프롬프트·도구·스킬·채널·스케줄을 전부 `agent/` 폴더 안의 ***정해진 위치의 파일***로 정의하므로, 프로젝트를 열어보는 것 자체가 에이전트의 전체 구조를 파악하는 행위가 된다.
- **폴더 구조와 역할 분담** — `agent.ts`(선택, 모델·reasoning 설정, 기본값 `openai/gpt-6-luna-fast`)·`instructions.md`(***필수***, 매 대화에 항상 들어가는 시스템 프롬프트)·`tools/`(선택, 입력 스키마를 `zod`로 검증하는 타입 지정 함수, ***파일명이 곧 도구 이름***이라 별도 등록이 필요 없다)·`skills/`(선택, 모델이 ***관련 있을 때만*** 불러오는 절차 마크다운)·`channels/`(선택, HTTP·Slack·Discord·Web Chat)·`schedules/`(선택, cron 작업). 본문에서는 `subagents/`도 필요에 따라 추가할 수 있는 폴더로 언급된다.
- **도구와 스킬의 명확한 역할 구분** — 도구는 ***항상 호출 가능한 실행 함수***, 스킬은 ***상황에 맞을 때만 로드되는 절차 문서***라는 이분법이 뚜렷하다. 이 구분 자체가 "항상 필요한 건 상시 로드, 상황부 절차는 필요할 때만"이라는 컨텍스트 관리 원칙을 프레임워크 레벨에서 강제한다.
- **CLI 중심 워크플로우** — `npx eve@latest init my-agent`로 디렉터리 생성·의존성 설치·Git 초기화·로컬 터미널 UI 실행이 한 번에 이뤄진다. 기존 프로젝트에 추가하려면 `npx eve@latest init .`. Web Chat을 쓰려면 `npx eve link`로 Vercel 프로젝트를 연결해야 하지만, ***로컬 개발은 Vercel 로그인 없이 동작한다***("Local development works without browser sign-in.")고 README가 명시한다.
- **human-in-the-loop·서브에이전트·문서 내장** — human-in-the-loop 승인 프롬프트, 서브에이전트 지원, cron 스케줄 실행을 기본 제공하고, 전체 문서를 `node_modules/eve/docs`에 패키지로 함께 심어둬 코딩 에이전트가 로컬에서 바로 문서를 읽을 수 있게 했다.
- **베타 단계, Apache-2.0** — README는 "currently in beta and subject to the Vercel beta terms"라고 명시하며, 프레임워크·API·문서·동작이 정식 출시 전 바뀔 수 있다고 경고한다. 저장소 지표(약 5.5k 스타, 615 포크, 커밋 1,922개, 열린 이슈 338개·PR 425개)는 활발한 초기 생태계를 보여준다.
- **2차 소스로만 확인된 것 — "Next.js for agents", 플랫폼 제약** — "Next.js for agents"라는 포지셔닝과 2026-06-17 Vercel Ship 컨퍼런스 출시 맥락, Mastra·LangGraph와의 경쟁 비교는 복수의 2차 매체가 공통으로 전하지만 README 자체에는 없다. 일부 2차 매체는 "현재는 Vercel에서만 실행되고 다른 플랫폼 지원은 추후 예정"이라고 전하는데, 이는 README가 보여주는 "로컬 개발은 로그인 없이 동작한다"는 서술과 긴장이 있어 — ***배포(Web Chat)와 로컬 실행의 범위를 혼동한 2차 서술일 가능성***이 있다고 보고 이 노트에서는 단언하지 않는다.

## 인상 깊은 문장

> "The filesystem is the authoring interface."
> (vercel/eve README, WebFetch로 직접 확보)

> "eve is currently in beta and subject to the Vercel beta terms."
> (vercel/eve README, WebFetch로 직접 확보)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 전부 확인 불가** — `news.hada.io`가 이번 세션 내내 DNS 레벨로 막혀 있었다. **정직하게 밝힐 이해관계**: Vercel은 자사 플랫폼(Web Chat 배포·Vercel 로그인)과 느슨하게 결합된 오픈소스 프레임워크를 내놓는, "오픈소스로 생태계를 넓히고 배포 단계에서 플랫폼 락인을 거는" 전형적인 벤더 전략의 가능성이 있다 — README의 라이선스(Apache-2.0)와 로컬 실행 자유도는 후하지만, 배포 단계에서는 Vercel 계정 연동이 전제된다는 점은 그대로 남는 사실이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-05-29-mcp-is-dead-cli-skills]]가 제기한 "도구 정의가 컨텍스트를 먹는다"는 문제에 대한 프레임워크 레벨의 답

그 노트는 "77개 도구 정의만으로 21,077토큰을 먹는다"는 문제의 해법이 두 갈래 — 프로토콜을 고치거나(MCP의 progressive discovery), 실행 환경을 코드 샌드박스로 바꾸거나(Codemode) — 라고 짚었다. eve는 세 번째 답을 보여준다 — ***도구(항상 호출 가능)와 스킬(필요할 때만 로드)을 프레임워크 차원에서 분리***해서, 애플리케이션 개발자가 매번 "이걸 상시 로드할지 지연 로드할지"를 직접 설계하지 않아도 되게 만든 것. 세 가지 해법이 수렴하는 지점은 결국 ***"모델에 한꺼번에 다 보여주지 말라"***는 같은 원칙이다.

### 핵심 전이 2 — [[2026-04-29-mattpocock-skills-vs-mangolove]]·[[2026-09-08-ask-hn-agent-skill-file-management]]가 커뮤니티 차원에서 자생적으로 수렴해온 패턴을, eve는 프레임워크로 표준화한다

mattpocock/skills 노트는 "스킬은 작고 조합 가능해야 한다"는 커뮤니티 관행을, Ask HN 스레드 노트는 "상시 규칙은 AGENTS.md류에, 상황부 절차는 스킬로 분리한다"는 실무자들의 자생적 합의를 보여줬다. eve의 `instructions.md`(필수, 상시)와 `skills/`(선택, 상황부)라는 폴더 분리는 ***그 커뮤니티 합의를 프레임워크의 1급 개념으로 끌어올린 것***이다 — "다들 각자 git 심볼릭 링크로 흉내 내던 걸 공식 폴더 규약으로 만들었다"는 평가가 가능하다. 다만 이 가든의 CLAUDE.md 자체도 이미 비슷한 이원 구조(상시 로드되는 CLAUDE.md + 필요할 때만 불러오는 스킬)를 쓰고 있다는 점도 같은 패턴의 독립적 재발견으로 읽힌다.

### 핵심 전이 3 — "파일명이 곧 도구 이름" 설계는 등록 보일러플레이트를 지우는 익숙한 전략

Next.js의 파일 기반 라우팅이 라우트 등록 코드를 지웠듯, eve의 `tools/get_weather.ts` → 도구 이름 자동 결정은 같은 전략의 에이전트판이다. "Next.js for agents"라는 2차 소스의 표현이 과장이 아니라 실제 설계 철학의 정확한 요약일 가능성이 있다 — 다만 이 평가는 README 자체가 아니라 2차 매체의 틀이라는 점은 그대로 남긴다.

## 호스피탈리티 / CRS 적용 포인트

CRS 내부에서 Slack 알림 봇, 예약 변경 요청 1차 분류, PMS 연동 상태 점검 같은 ***작고 목적이 분명한 내부 에이전트***를 만들 필요가 생긴다면, eve가 보여주는 설계 원칙 두 가지는 바로 참고할 만하다 — ***①*** "항상 필요한 규칙(예: 응답 톤·금지 행동)은 상시 프롬프트에, 특정 상황에서만 필요한 절차(예: 특정 채널매니저 연동 장애 대응법)는 필요할 때만 불러오는 파일로" 분리하는 구조는 내부 에이전트의 프롬프트 설계에 바로 옮길 수 있는 원칙이다. ***②*** "파일 하나 추가 = 기능 하나 추가"라는 등록 없는 확장 모델은, CRS 개발팀이 자체 에이전트 하네스를 만들 때 도구 추가의 마찰을 줄이는 참고 설계가 된다. 다만 eve 프레임워크 자체를 CRS 프로덕션에 바로 들여오기보다는, 아직 베타 단계라는 점을 감안해 설계 아이디어만 가져오고 채택은 생태계가 더 성숙한 뒤로 미루는 게 맞다.

## 연관 자료

- [[2026-05-29-mcp-is-dead-cli-skills]] — "도구 정의가 컨텍스트를 과점한다"는 문제, eve의 도구/스킬 분리가 답하는 바로 그 질문
- [[2026-04-29-mattpocock-skills-vs-mangolove]] — "스킬은 작고 조합 가능해야 한다"는 커뮤니티 관행, eve가 프레임워크로 표준화한 패턴의 선행 사례
- [[2026-09-08-ask-hn-agent-skill-file-management]] — "상시 규칙은 AGENTS.md류, 상황부 절차는 스킬로"라는 실무자 합의, eve의 `instructions.md`/`skills/` 분리와 같은 결론

## 한 달 뒤 회고

*(2026-11-11 즈음 — `news.hada.io`·`vercel.com` 접근이 가능해지면 출시 맥락·hada 댓글 논조를 직접 대조했는지, "다른 플랫폼 지원 예정"이라는 2차 서술이 실제로 진행됐는지, eve가 베타를 벗어나 GA됐는지, 이 가든이나 온다 내부에서 유사한 파일 기반 에이전트 구조를 실제로 시도해봤는지 점검.)*
