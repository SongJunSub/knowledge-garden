---
title: "Claude Skills 빌딩 가이드 (Anthropic) — '점진적 공개·조합성·이식성'으로 워크플로를 마크다운 레시피로 자산화, 그리고 '검증은 결정적 코드로' (AI 도구 설계 라인)"
source_title: "The Complete Guide to Building Skills for Claude"
source_url: "https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf"
source_name: "Anthropic (claude.ai)"
referrer_url: "https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf"
published_at: "2026-01"
summarized_at: "2026-06-08"
category: "ai"
tags: ["claude-skills", "agent-design", "progressive-disclosure", "mcp", "skill-creator", "tool-philosophy", "open-standard", "methodology-as-asset"]
---

# Claude Skills 빌딩 가이드 (Anthropic) — '점진적 공개·조합성·이식성'으로 워크플로를 마크다운 레시피로 자산화, 그리고 '검증은 결정적 코드로' (AI 도구 설계 라인)

> 출처: [The Complete Guide to Building Skills for Claude](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf) (Anthropic, claude.ai) · 정리일 2026-06-08

## 한 줄 요약

**Skill은 ***"특정 작업·워크플로를 다루는 법을 Claude에게 가르치는, 폴더로 패키징된 지시 묶음"*** — ***"매 대화마다 선호·프로세스·도메인 지식을 다시 설명하는 대신, Claude에게 한 번 가르치고 매번 이득을 본다."*** 핵심 설계 원리 셋: ***①점진적 공개(progressive disclosure, 3계층) ②조합성(composability) ③이식성(portability, Claude.ai·Claude Code·API 동일 동작)***. MCP와의 관계는 *주방 비유*: ***"MCP는 전문 주방(도구·재료·장비) = 무엇을 할 수 있는가(Connectivity), Skill은 레시피(단계별 지시) = 어떻게 해야 하는가(Knowledge)."*** 가장 중요한 건 *YAML frontmatter의 `description`* — *무엇을 + 언제(트리거 조건)*를 담아 Claude가 *언제 로드할지*를 판단하게 한다. 그리고 결정적 통찰: ***"중요한 검증은 언어 지시가 아니라 스크립트로 — 코드는 결정적이지만 언어 해석은 그렇지 않다."*** Skill은 *오픈 스탠더드*로 공개됐다(MCP처럼 이식 가능).**

## 핵심 포인트

- **Skill = 워크플로를 자산화하는 단위** — ***"teach Claude once and benefit every time."*** 폴더 구조: `SKILL.md`(필수, 마크다운+YAML) + `scripts/`·`references/`·`assets/`(선택). 단순 링크가 아니라 *반복 가능한 워크플로(스펙→프론트엔드 생성, 일관된 방법론의 리서치, 팀 스타일 가이드 준수 문서)*를 박제.
- **점진적 공개(3계층)** — ***①L1 YAML frontmatter*** (항상 시스템 프롬프트에 상주, *언제 쓸지* 판단할 최소 정보만) → ***②L2 SKILL.md 본문*** (관련 작업일 때만 로드, 전체 지시) → ***③L3 링크된 파일*** (필요할 때만 탐색). **토큰을 아끼면서 전문성을 유지하는 메커니즘** — [[2026-06-08-dont-trust-large-context-windows]] *"큰 컨텍스트 ≠ 좋음"*의 설계적 답.
- **조합성·이식성** — *여러 Skill이 동시에 로드*되니 "내가 유일한 능력"이라 가정 말 것. *Claude.ai·Claude Code·API에서 수정 없이 동일 동작*. → 도구가 표면을 안 가린다.
- **MCP × Skill = 연결 × 지식** — ***"MCP=What Claude can do, Skills=How Claude should do it."*** Skill 없는 MCP는 *"연결은 됐는데 뭘 할지 모름·매 대화가 처음부터·프롬프트 제각각이라 결과 불일치"*. [[2026-05-29-mcp-is-dead-cli-skills]] *"MCP는 죽었다, CLI+Skills"*·[[2026-04-29-mattpocock-skills-vs-mangolove]] 와 직접 연결.
- **`description`이 트리거를 결정** — 구조 = ***[무엇을 한다] + [언제 쓴다] + [핵심 능력]***. 좋은 예: *"Figma 파일을 분석해 핸드오프 문서 생성. .fig 업로드·'design specs'·'design-to-code handoff' 요청 시 사용."* 나쁜 예: *"Helps with projects"(너무 막연), 트리거 없음, 너무 기술적*. 1024자 이내, XML 태그 금지.
- **지시 작성 = 구체·실행 가능 + 에러 핸들링 + 점진적 공개** — *"`python scripts/validate.py`를 실행해 검사하라"* (○) vs *"진행 전에 검증하라"* (×). 상세 문서는 `references/`로 빼고 SKILL.md는 핵심만(5,000단어 이하 권장).
- **검증은 결정적 코드로** — ***"중요한 검증은 언어 지시 대신 스크립트로 — 코드는 결정적이고 언어 해석은 그렇지 않다."*** [[2026-06-08-ai-demands-more-engineering-discipline]] *"AI는 더 큰 엔지니어링 규율을 요구"*와 정확히 같은 결.
- **테스트 3축 + "단일 과제부터"** — *①트리거 테스트(90% 관련 쿼리에 로드, 무관 토픽엔 X) ②기능 테스트 ③베이스라인 비교(skill 없이 15왕복·3실패·12K토큰 → skill로 자동·2질문·0실패·6K토큰)*. **Pro tip: ***"하나의 까다로운 과제를 Claude가 성공할 때까지 반복한 뒤, 그 승리 접근을 skill로 추출하라 — in-context learning을 활용."*****
- **오픈 스탠더드 + 결과 중심 포지셔닝** — ***"Agent Skills를 오픈 스탠더드로 공개했다. MCP처럼 skill은 도구·플랫폼 간 이식 가능해야 한다."*** 그리고 ***"기능이 아니라 결과로 설명하라"*** — *"YAML+마크다운 폴더"(×) vs "팀이 프로젝트 워크스페이스를 수초 만에 세팅"(○)*.

## 인상 깊은 문장

> "Instead of re-explaining your preferences, processes, and domain expertise in every conversation, skills let you teach Claude once and benefit every time."
> (매 대화마다 선호·프로세스·도메인 지식을 다시 설명하는 대신, skill은 Claude에게 한 번 가르치고 매번 이득을 보게 한다.)

> "MCP provides the professional kitchen: access to tools, ingredients, and equipment. Skills provide the recipes: step-by-step instructions on how to create something valuable."
> (MCP는 전문 주방 — 도구·재료·장비 접근. Skill은 레시피 — 가치 있는 것을 만드는 단계별 지시.)

> "For critical validations, consider bundling a script that performs the checks programmatically rather than relying on language instructions. Code is deterministic; language interpretation isn't."
> (중요한 검증은 언어 지시에 기대지 말고 검사를 코드로 수행하는 스크립트를 동봉하라. 코드는 결정적이지만, 언어 해석은 그렇지 않다.)

## 댓글 (전수 확인)

> Anthropic 공식 PDF 문서(33p) — **공개 댓글 섹션 없음**(아카이브용 메타로만 남김).

## 내 생각 · 적용점

### AI 도구 설계 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 ***"에이전트를 어떻게 커스터마이즈/제약하고, 워크플로를 어떻게 재사용 자산으로 만드는가"라는 도구 설계 철학***. [[2026-05-29-mcp-is-dead-cli-skills]]·[[2026-04-29-mattpocock-skills-vs-mangolove]]·[[2026-04-28-agent-harness-engineering]] 와 같은 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — Skill = "untrainable한 워크플로"를 기록해 자산화하는 그릇

가장 전이력 높은 통찰: ***"한 번 가르치고 매번 이득"*** + ***"하나의 과제를 성공시킨 뒤 그 접근을 skill로 추출"*** 은, 바로 앞 [[2026-06-08-the-untrainable]] *"무엇이 좋은 답인지를 기록하는 자가 benchmark의 주인"*·[[2026-06-01-domain-expertise-is-the-real-moat]] *도메인 해자*·[[2026-05-14-naur-programming-as-theory-building]] *"이론을 사람·팀에 남긴다"*의 **실행 도구**다. **내 머릿속/세션에만 있던 워크플로(예: 이 가든 정리 의례, CRS 요금 결정 절차)를 SKILL.md로 적어두는 순간, 그건 흡수·이식·재사용 가능한 자산이 된다.** "적어두면 자산, 안 적으면 매번 0부터"라는 게 핵심.

### 핵심 전이 2 — "검증은 결정적 코드로" = AI 시대 규율의 구체적 처방

***"중요한 검증은 스크립트로, 코드는 결정적이고 언어 해석은 그렇지 않다"*** 는 [[2026-06-08-ai-demands-more-engineering-discipline]]·[[2026-06-08-agentic-code-review]] *"검증·승인은 사람/결정적 장치 몫"*의 정확한 실천 지침. 내 작업에 직접: *LLM에게 "잘 검증해"라고 부탁하는 대신, 불변식은 `requireNotNull`·테스트·스크립트로 박는다*([[2026-06-08-java-to-kotlin-woowahan]] 함정 체크리스트와 같은 정신). **확률적 언어에 맡길 것 vs 결정적 코드로 못 박을 것의 경계선을 명확히** — 점진적 공개도 같은 축(컨텍스트는 아끼되 핵심은 항상 상주).

### 핵심 전이 3 — MangoLove의 정체성 = "Skills의 사상을 CLI로 일반화"

내가 만드는 [[2026-04-29-mattpocock-skills-vs-mangolove]] **MangoLove(방법론 주입 CLI)** 와 정확히 같은 문제를 푸는 1차 자료다 — *"how Claude should do it(지식·방법론)"을 재사용 가능하게 주입*. 이 가이드의 설계 원리(***점진적 공개·조합성·이식성·트리거 description·결과 중심 포지셔닝·단일 과제부터 추출***)는 그대로 MangoLove 설계 체크리스트로 전이된다. 특히 *"기능이 아니라 결과로 포지셔닝"*·*"description이 트리거를 결정"* 은 MangoLove의 방법론 카탈로그·자동 발동 규칙 설계에 직접 적용. (Skill을 직접 안 쓰더라도 *"방법론을 자산화하는 형식"* 이라는 전이 가능한 관점만 가져옴.)

### 오버 메타화 자기 견제

새 차원·매트릭스 0건(저자의 3계층·5패턴은 *글의 내용*, 내 메타 차원 신설 아님). *AI 도구 설계 라인* 강화 — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Anthropic (원문 PDF) · [resources.anthropic.com](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf)
- [[2026-05-29-mcp-is-dead-cli-skills]]·[[2026-04-29-mattpocock-skills-vs-mangolove]]·[[2026-04-28-agent-harness-engineering]] — *"Skills/CLI·하네스가 에이전트를 만든다(AI 도구 설계 라인)"*
- [[2026-06-08-the-untrainable]]·[[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-05-14-naur-programming-as-theory-building]] — *"좋은 답·도메인·이론을 기록해 자산화"*
- [[2026-06-08-ai-demands-more-engineering-discipline]]·[[2026-06-08-agentic-code-review]] — *"검증은 결정적 코드/사람 몫"*
- [[2026-06-08-dont-trust-large-context-windows]] — *"점진적 공개(컨텍스트 절제)"*
- [[2026-06-08-ponytail-lazy-senior-developer]] — *"AI 행동을 제약·유도(빼기)"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — 내 반복 워크플로(가든 의례·CRS 절차) 중 하나를 실제 SKILL.md로 추출했는지, "검증은 결정적 코드로" 경계선을 코드에 적용했는지, 이 가이드의 설계 원리를 MangoLove 설계 체크리스트로 옮겼는지 기록.)*
