---
title: "Pi: MCP는 지원하지 않는다더니! (Mario Zechner, earendil-works) — 홈페이지에 'Pi는 MCP를 지원하지 않는다'고 1년 넘게 써놨던 코딩 에이전트가, 결국 MCP가 필요했던 게 아니라 'Jev 같은 도구를 코드로 조합할 샌드박스'가 필요해서 MCP까지 같이 끌고 들어왔다"
source_title: "feat(coding-agent): Codemode and MCP (PR #10040) / \"You Said No MCP!\""
source_url: "https://github.com/earendil-works/pi/pull/10040"
source_name: "earendil-works/pi (GitHub), earendil.com 블로그"
referrer_url: "https://news.hada.io/topic?id=34545"
published_at: "2026-09-29"
summarized_at: "2026-10-01"
category: "ai"
tags: ["mcp", "codemode", "pi-coding-agent", "quickjs-sandbox", "tool-exposure", "agent-tooling", "jev"]
---

# Pi: MCP는 지원하지 않는다더니! (Mario Zechner, earendil-works)

> 출처: [feat(coding-agent): Codemode and MCP](https://github.com/earendil-works/pi/pull/10040) (earendil-works/pi, GitHub PR 설명) + [GitHub Releases v0.99.0](https://github.com/earendil-works/pi/releases) · GeekNews(id=34545) 경유 · 정리일 2026-10-01

> **출처 한계**: `news.hada.io`와 Pi 공식 발표 글(`earendil.com/posts/you-said-no-mcp/`)은 이 세션에서 egress 차단돼 직접 열람하지 못했다. 대신 **GitHub PR #10040의 실제 설명 텍스트와 Releases 페이지는 WebFetch로 직접 확보**했다 — 이번 배치에서 원문을 가장 온전히 얻은 사례다. hada 댓글 수·공식 발표 글의 정확한 어조("자기 풍자적")는 WebSearch 재인용(dev.to 제목 등)으로만 교차확인했다. Pi 창업자 Mario Zechner가 실제로 "MCP는 지원하지 않는다"를 홈페이지에 명시했었다는 것, 그가 블로그·팟캐스트에서 MCP를 비판해왔다는 것은 WebSearch로 교차확인됐으나 그 비판의 정확한 문구는 원문을 못 봐서 인용하지 않는다.

## 한 줄 요약

**Pi(Mario Zechner가 만든 "최소주의" 코딩 에이전트)는 1년 넘게 홈페이지에 "Pi는 MCP를 지원하지 않는다"고 내세우며 MCP를 공개적으로 비판해왔는데, v0.99.0(2026-09-29)에서 MCP를 핵심 기능으로 전격 통합했다 — 이유는 "MCP가 좋아져서"가 아니라, Jev 같은 도구들을 코드로 엮어 호출할 샌드박스(Codemode)가 Pi 자체에 필요했고, 그 샌드박스를 만들고 보니 MCP 서버를 그 안에서 호출하는 것도 거의 같은 작업이었기 때문이다.**

## 핵심 포인트

- **입장 전환의 실제 계기 — "모델이 도구 호출보다 코드 구성에서 훨씬 잘 작동한다"** — PR #10040 설명이 직접 밝히는 이유다. MCP를 다시 평가해서 받아들인 게 아니라, **Codemode라는 다른 필요(도구를 코드로 동적 조합)를 풀다 보니 MCP 지원이 거의 공짜로 따라왔다.**
- **핵심은 Codemode — QuickJS 샌드박스에서 도구를 코드로 호출** — 모델이 매 턴 도구 하나씩 호출하는 대신, **모델이 작성한 JavaScript가 QuickJS(wasm) 샌드박스 안에서 실행**되며 `tools.<name>(args)` 형태로 여러 도구를 비동기로 호출·연결한다. 호스트 스레드와 분리된 워커 안에서 돌기 때문에, 같은 프로세스의 V8이 아니라 **격리된 wasm 인스턴스**다.
- **도구 노출 범위를 `exposure` 속성으로 세분화** — `direct`(바로 노출) · `model-only`(모델에게만) · `codemode`(코드에서만 호출 가능) · `deferred` · `hidden` 다섯 단계로 각 도구가 "어디서 호출 가능한가"를 선언한다. MCP 서버의 도구도 이 체계에 편입된다.
- **중첩 호출과 결과 관리** — `ctx.executeTool()`로 중첩 도구 호출도 같은 검증·훅을 거치고 `parentToolCallId`로 추적된다. 50KB 또는 2000줄을 넘는 결과는 JSON 임시 파일로 저장돼 **컨텍스트에 그대로 쌓이지 않는다** — 도구를 전부 프롬프트에 나열하는 방식과 가장 대비되는 지점이다.
- **MCP 연결 자체는 표준적** — `/mcp add|remove|list|login|logout` 명령과 `mcp.json` 설정(전역/프로젝트별)으로 stdio·OAuth·HTTP 스트림 방식 서버에 연결한다. 둘 다 **기본값은 비활성화**된 내장 확장(extension)으로 구현됐다 — 코어에 억지로 끼워 넣은 게 아니라, 다른 확장이 대체할 수 있는 선택적 기능으로 설계했다는 뜻이다.
- **구체적 조합 예시 — Linear MCP + Jev** — WebSearch로 교차확인한 예시로, Linear의 MCP 서버에서 이슈를 가져오고 그 결과를 같은 코드 블록 안에서 Jev 분류기에 넘겨 감정 점수를 매기는 식의 조합이 Codemode가 겨냥하는 용례다 — **MCP 도구 하나와 판단 모델 하나를 같은 실행 흐름 안에서 엮는 것**이 프롬프트 나열 방식으로는 어려웠던 지점이다.

## 인상 깊은 문장

> "the changes made to MCP also enable the use of Jev more easily within Pi. Ultimately what Pi needs is quite similar to what MCP needs: a sandbox to play with in the form of an interpreter." (WebSearch 재인용, 발표 글 취지 요약)

> PR #10040 설명(WebFetch로 직접 확보): "models work much better at composing tools in a sandbox than at calling tools" (요지, 정확한 원문 문구는 한국어 번역 과정에서 재구성됨 — 번역 원본은 위 핵심 포인트 1번 참조)

## 댓글

**hada 댓글 수는 확인 불가**(원문 차단). WebSearch로 교차확인한 바로는 Pi 팀이 이 전환을 "You Said No MCP!"라는 **자기 풍자적 제목**으로 직접 발표했고, 이 발표가 HN 상위권에 올라 **"수백 점, 수백 댓글"** 규모의 논쟁을 일으켰다고 전해진다(정확한 점수·댓글 수는 HN 직접 접근이 차단돼 미확인). **정직하게 감안할 점**: (1) "수백 점, 수백 댓글"이라는 수치 자체가 2차 요약의 재인용이라 과장 여부를 검증할 수 없다. (2) Mario Zechner는 이미 "최소주의 도구" 철학을 브랜드로 내세운 인물이라, 입장을 바꾼 것 자체가 그의 신뢰도에 득이 될지 실이 될지는 커뮤니티 반응이 나뉠 수 있는 지점이다 — "유연하게 생각을 바꾼 정직한 엔지니어"로 볼 수도 있고 "자기가 비웃던 유행을 결국 따라간 것"으로 볼 수도 있다. (3) 이 노트는 PR 설명과 릴리스 노트라는 **1차 기술 문서**에 의존했지만, Pi 창업자가 실제로 왜 1년 넘게 MCP를 반대해왔는지의 **원래 논거**는 원문 차단으로 직접 확인하지 못했다 — "입장을 바꾼 이유"는 봤지만 "원래 입장의 근거"는 못 봤다는 비대칭이 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 가든의 MCP 논쟁 계열에 "코드 실행으로 도구를 동적 호출한다"는 구체적 구현체가 등장한다

[[2026-09-22-mcp-was-always-a-bad-idea]]는 "코드를 실행하고 API를 직접 호출할 수 있는 에이전트에는 MCP 서버의 재포장이 불필요해진다"는 추상적 주장이었고, [[2026-08-23-mcp-new-roadmap-five-areas]]는 MCP 메인테이너들이 "도구 목록이 늘수록 선택이 나빠지는 문제"를 **progressive discovery**(프로토콜 안에서 점진적으로 카탈로그를 노출)로 풀려 한다는 로드맵이었다. Pi의 Codemode는 이 둘 사이의 **세 번째 해법**을 실제로 구현해 보여준다 — MCP를 버리지도(전자) 않고, 프로토콜 자체를 고치지도(후자) 않은 채, **"도구 설명을 전부 프롬프트에 미리 나열하는 대신, 모델이 코드를 써서 필요한 도구를 그때 호출하게 한다."** `exposure: codemode` 속성으로 도구를 코드 전용으로 한정하면, 그 도구의 스키마가 매 턴 컨텍스트에 통째로 실릴 필요가 없다 — [[2026-05-29-mcp-is-dead-cli-skills]]가 지적한 "77개 도구 정의만으로 21,077토큰 소모"라는 문제를 프로토콜 교체 없이, **실행 환경을 코드 샌드박스로 바꾸는 것만으로** 완화하는 셋째 길이다.

### 핵심 전이 2 — Claude Code 사용자에게 주는 실무적 시사점: MCP 서버가 늘어날 때 참고할 패턴

레포 주인이 Claude Code를 매일 쓰는 입장에서 가장 직결되는 대목은 이거다. Claude Code도 MCP 서버를 여럿 붙이면 [[2026-08-16-maximizing-claude-code-sessions]]가 짚었듯 **도구 정의 자체가 컨텍스트의 고정 비용**이 된다(`/context`로 확인 가능). Pi의 Codemode가 보여주는 해법 — "도구를 전부 프롬프트에 노출하는 대신 코드에서만 호출 가능하게 하고, 결과가 크면 파일로 빼낸다" — 은 Claude Code의 MCP 생태계에도 같은 방향(Claude의 `tool_search`, code execution 기반 MCP 호출 패턴 등 업계 전반의 "코드 실행으로 도구 사용" 트렌드)으로 이미 움직이고 있는 흐름과 일치한다. 실무적으로 당장 적용할 점: ①MCP 서버를 새로 붙이기 전에 "이 도구가 모델이 직접 봐야 하는 것인지, 아니면 코드/스크립트로 조합만 하면 되는 것인지"를 구분해보는 습관, ②`/context`로 MCP 도구 정의가 차지하는 고정 비용을 주기적으로 점검하는 습관, ③Pi처럼 "철학적으로 반대하던 기능도, 다른 필요(이 경우 Codemode)를 풀다가 거의 공짜로 따라온다면 받아들인다"는 유연성 — 도구 선택에서 이념보다 실측을 우선하라는 원칙이다.

### 핵심 전이 3 — 입장을 바꾼 방식 자체가 신뢰를 주는 사례

Pi 팀이 입장 전환을 숨기거나 조용히 바꾸지 않고 "You Said No MCP!"라는 자기 풍자적 제목으로 정면으로 발표한 것은, [[2026-09-21-jev-field-guide-system-one-model]]이 높게 평가했던 "회사가 자기 제품의 한계를 스스로 공개 문서에 박아둔다"는 정직성 패턴과 같은 결이다. 오픈소스 도구 생태계에서 "원래 입장을 유지하는 척하며 조용히 기능을 끼워 넣는 것"보다, 왜 바뀌었는지를 기술적으로(PR 설명 수준으로) 투명하게 밝히는 쪽이 사용자 신뢰를 더 얻는다는 걸 보여주는 사례다.

## 호스피탈리티 / CRS 적용 포인트

CRS 개발팀이 Claude Code·Pi류의 코딩 에이전트에 내부 MCP 서버(PMS 연동, 채널매니저 API, 내부 리포팅 툴 등)를 여러 개 붙이는 상황을 가정하면, Codemode 패턴이 주는 구체적 설계 원칙이 있다. **①자주 조합해서 쓰는 도구(예: "예약 조회 MCP + 환불 정책 판단 Jev형 분류기")는 모델이 매번 따로 호출하게 하지 말고, 코드로 한 번에 엮어 호출하는 경로를 만들어두면 지연시간과 토큰 비용이 동시에 줄어든다.** ②도구마다 "모델이 직접 판단해야 하는 것(예: 고객 문의 의도 파악)"과 "그냥 기계적으로 조합만 하면 되는 것(예: 조회 → 필터 → 포맷)"을 구분해 노출 범위를 다르게 설계하면, [[2026-09-22-mcp-was-always-a-bad-idea]]가 짚은 "통제가 필요한 상황엔 MCP가 유효하다"는 절충안과 Codemode의 "코드 실행이 유리한 경우"를 동시에 만족시킬 수 있다. 다만 이건 아직 Pi라는 비교적 작은 커뮤니티의 신생 도구 사례라, CRS 프로덕션에 바로 들여오기보다는 Claude Code 생태계에서 유사 패턴(코드 실행 기반 도구 호출)이 표준화되는 흐름을 지켜보며 참고하는 정도가 맞다.

## 연관 자료

- [[2026-09-22-mcp-was-always-a-bad-idea]] — "코드 실행 능력이 강한 에이전트에는 MCP 재포장이 불필요하다"는 추상적 주장, Pi의 Codemode는 그 주장을 구체적으로 구현한 사례
- [[2026-08-23-mcp-new-roadmap-five-areas]] — MCP 메인테이너들이 같은 "도구 선택 저하" 문제를 프로토콜 안에서 progressive discovery로 풀려는 대안적 접근
- [[2026-05-29-mcp-is-dead-cli-skills]] — "MCP 도구 정의가 컨텍스트를 과도하게 차지한다"는 선행 비판, Codemode가 완화하려는 바로 그 문제
- [[2026-08-16-maximizing-claude-code-sessions]] — Claude Code에서 MCP 도구 정의가 세션 고정 비용이 된다는 실무 지침, Codemode 패턴의 Claude Code 적용 가능성과 연결
- [[2026-09-30-naver-d2-agent-concepts-workflow-harness-context-memory-mcp-a2a]] — MCP와 A2A를 REST API와 비교하려 한 개념 정리 글, 이 노트의 "도구-코드 통합" 논의가 그 개념 축에서 어디에 위치하는지 참고
- [[2026-10-01-text-classification-bag-of-words-to-jev]] — 이번 배치의 다른 글, Codemode가 실제로 Jev를 Pi 안에서 쉽게 쓰게 만든다는 연결점

## 한 달 뒤 회고
*(2026-11-01 즈음 — Pi의 MCP+Codemode 통합이 실제 사용자층에서 얼마나 채택됐는지, HN 논쟁의 실제 쟁점(점수·댓글)을 확인할 수 있는지, Claude Code나 다른 주요 에이전트가 유사한 "코드 실행 기반 도구 조합" 기능을 공식 채택했는지 확인.)*
