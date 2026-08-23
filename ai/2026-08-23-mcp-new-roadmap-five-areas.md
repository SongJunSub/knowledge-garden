---
title: "새로운 MCP 로드맵 — 앞으로 집중할 5가지 영역 (Model Context Protocol 공식 블로그) — 요청-응답 프로토콜이던 MCP가 장시간 실행·에이전트 신원·대규모 tool 탐색을 다루는 인프라로 방향을 튼다. 특히 '에이전트 신원과 엔터프라이즈 보안' 영역은 DoorDash가 이미 직접 구축했던 게이트웨이를 프로토콜 표준으로 흡수하려는 시도로 읽힌다"
source_title: "The New MCP Roadmap"
source_url: "https://blog.modelcontextprotocol.io/posts/mcp-roadmap/"
source_name: "Model Context Protocol 공식 블로그 (David Soria Parra·Den Delimarsky, Lead Maintainers)"
referrer_url: "https://news.hada.io/topic?id=32777"
published_at: "2026-08-22"
summarized_at: "2026-08-23"
category: "ai"
tags: ["mcp", "roadmap", "agent-identity", "tool-discovery", "streamable-http", "protocol", "enterprise-security"]
---

# 새로운 MCP 로드맵 — 앞으로 집중할 5가지 영역 (Model Context Protocol 공식 블로그)

> 출처: [The New MCP Roadmap](https://blog.modelcontextprotocol.io/posts/mcp-roadmap/) (Model Context Protocol 공식 블로그 · David Soria Parra·Den Delimarsky) · 정리일 2026-08-23

## 한 줄 요약

**MCP Core Maintainer들이 향후 몇 달간 집중할 5개 영역을 발표했다 — ①장시간 실행 에이전트 작업을 위한 에이전틱 메시징 프리미티브(Tasks·서버 주도 webhook/channel) ②로컬 서버까지 확대하는 Streamable HTTP 통합 ③에이전트 신원·위임을 위한 엔터프라이즈급 보안(Workload Identity Federation·ID-JAG·token exchange) ④tool이 늘어날수록 선택 품질이 나빠지는 문제를 푸는 점진적 탐색(progressive discovery) ⑤SDK 개발자 경험 개선. 핵심 문장은 하나다 — ***"현대의 에이전틱 워크로드는 더 이상 표준적인 요청-응답 패턴에 맞지 않는다."*** 이번 로드맵은 MCP를 "LLM이 로컬 도구를 부르는 단순 프로토콜"에서 "장시간 실행되는 자율 에이전트가 엔터프라이즈 인프라 위에서 신원을 갖고 대규모 도구 카탈로그와 안전하게 상호작용하는 표준 인프라"로 성숙시키려는 방향이다.**

## 핵심 포인트

- **① 에이전틱 메시징 프리미티브** — ***"Loops can run for longer, servers can push streamed results, and there is a clear need to steer work mid-flight."*** Tasks·subscriptions/listen·progress notification에 더해, 서버가 먼저 이벤트를 밀어주는 webhook·channel을 도입해 **클라이언트가 폴링하며 기다리지 않도록** 한다.
- **② HTTP-native transport 통합** — 2026-07-28 stateless 코어 전환으로 원격 MCP 서버가 "여느 HTTP 워크로드와 다를 바 없어졌다"는 데서 출발, ***"stdio 위에서 Streamable HTTP를 말하는 로컬 서버를 포함해 다른 배포 방식까지"*** 이 방식을 확대한다 — 로컬·원격 구현이 하나의 transport 모델로 수렴.
- **③ 에이전트 신원·엔터프라이즈 보안** — ***"more and more of the callers are agents running as cloud workloads with their own identity."*** Workload Identity Federation, Enterprise-Managed Authorization의 기반인 ID-JAG grant, 표준 token exchange로 **에이전트 신원·위임(delegation)에 대한 명확한 경로**를 정의하려 한다.
- **④ Tool 탐색 개선** — ***"tool selection tends to get worse as the list grows."*** 서버가 전체 카탈로그를 한 번에 노출하는 대신 **작은 진입점부터 점진적으로 공개**하는 progressive discovery 작업을 시작한다.
- **⑤ SDK 개발자 경험** — conformance testing·문서화 등 SDK 품질·일관성 개선. 다른 4개 영역만큼 길게 다뤄지지 않는다.
- 이번 로드맵은 2026-03-09 발표된 이전 로드맵(4개 영역: Transport Evolution·Agent Communication·Governance Maturation·Enterprise Readiness)에서 "향후 과제"로만 언급됐던 항목들이 정식 우선순위로 승격된 후속판이다.

## 인상 깊은 문장

> "Modern agentic workloads no longer fit the standard request-and-response pattern."
> (현대의 에이전틱 워크로드는 더 이상 표준적인 요청-응답 패턴에 맞지 않는다.)

> "tool selection tends to get worse as the list grows. We're starting a progressive discovery effort so a server can offer a small entry point"
> (도구 목록이 커질수록 도구 선택은 나빠지는 경향이 있다. 서버가 작은 진입점을 제공할 수 있도록 점진적 탐색 작업을 시작한다.)

> "defining an opinionated path for agent identity and delegation through Workload Identity Federation, the ID-JAG grant behind Enterprise-Managed Authorization, and standard token exchange"
> (Workload Identity Federation, Enterprise-Managed Authorization 이면의 ID-JAG grant, 표준 token exchange를 통해 에이전트 신원과 위임에 대한 명확한 경로를 정의한다.)

## 댓글

**GeekNews 원문 페이지는 이번 세션의 네트워크 egress 정책상 접근 불가**(`news.hada.io` 도메인 자체가 프록시에서 차단) — hada 댓글 수·논조는 전혀 확인하지 못했다. **HN 큐레이션은 확인됨** — "The New MCP Roadmap"이라는 동일 제목으로 HN에 게시된 스레드(`item?id=49399591`)가 존재한다. 다만 HN 도메인도 이 세션에서 직접 열람은 안 돼 포인트 수·댓글 내용은 확인하지 못했다 — **존재만 확인, 논조는 재구성 불가**. 공식 로드맵 문서 페이지(`modelcontextprotocol.io/development/roadmap`)도 같은 이유로 접근 불가해, 블로그 포스트와 세부 내용이 완전히 일치하는지는 대조하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "에이전트 신원·보안" 영역은 DoorDash가 이미 직접 구축했던 걸 프로토콜이 뒤늦게 흡수하려는 시도다

[[2026-08-10-doordash-ai-agent-gateway]]는 정확히 이 지점을 지적했다 — ***"MCP는 도구 설명·탐색·호출 방식을 표준화했지만, 인증·권한·자격증명·접근 회수·감사는 해결하지 않는다."*** DoorDash는 그 공백을 자체 Agent Gateway(호출자 인증→권한확인→도구노출→자격증명주입→MCP서버 전달→사용기록)로 메워야 했고, 200개+ MCP 서버·30개+ 에이전트를 운영하며 얻은 교훈이 ***"통제된 경로가 셀프서비스가 아니면 팀은 우회한다"***였다. 이번 로드맵의 ③번 영역(Workload Identity Federation·ID-JAG·token exchange)은 **바로 그 문제를 프로토콜 표준으로 끌어올리려는 시도**로 읽힌다. 흥미로운 건 순서다 — **표준이 먼저 나오고 기업이 따라간 게 아니라, 기업(DoorDash)이 먼저 아쉬운 대로 자체 게이트웨이를 만들었고, 그 실전 압력이 쌓여서야 프로토콜이 움직였다.** DoorDash의 향후 계획("암호학적 신원, 단기 위임 자격증명")과 이번 로드맵의 방향이 거의 겹치는 것도 우연이 아니라, 같은 문제를 다른 layer에서 동시에 풀고 있었다는 신호에 가깝다.

### 핵심 전이 2 — "tool이 늘수록 선택이 나빠진다"는 문제는 이미 한 차례 "MCP를 버리자"는 결론까지 갔던 논쟁이다

[[2026-05-29-mcp-is-dead-cli-skills]]가 인용한 Quandri의 벤치마크는 Linear·Notion·Slack·Postgres 등 77개 도구 정의만으로 200K 컨텍스트의 10.5%(~21,077토큰)를 소모한다고 지적하며, 대안으로 "CLI를 Skills로 감싸 토큰을 회수하고, MCP는 CLI가 없거나 팀 단위 권한 제어가 필요한 특수 상황에만 쓰라"는 우선순위 재조정을 제안했다. 이번 로드맵 ④번(progressive discovery)은 그 비판을 정면으로 받아, **"MCP를 버려라"가 아니라 "MCP가 한 번에 전체 카탈로그를 노출하지 않도록 프로토콜 자체를 고치겠다"**는 반대 방향의 해법이다. 두 글을 겹쳐 보면 지난 석 달 사이 MCP 생태계의 논쟁 구도가 선명해진다 — **컨텍스트/선택 비용 문제를 프로토콜 밖(Skills로 우회)에서 풀 것인가, 프로토콜 안(progressive discovery)에서 풀 것인가.** 이번 로드맵은 메인테이너들이 후자 쪽에 베팅했다는 뜻이고, 몇 달 뒤 실제 구현이 Quandri류의 비판을 잠재울 만큼 효과적인지가 이 논쟁의 다음 라운드가 될 것이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 아직 이르지만, 지켜볼 이유는 분명하다.** 온다가 PMS·채널매니저 연동에 MCP 서버를 채택한다면 세 영역이 실제로 관계된다: ①로컬 개발 중 붙였던 MCP 서버를 프로덕션에서도 같은 transport로 그대로 운영할 수 있다는 ②번 영역의 약속은, 로컬-프로덕션 격차를 줄이는 실질적 이점이 될 수 있다(단, 이번 로드맵 시점엔 아직 계획 단계). ②에이전트가 파트너 호텔 시스템에 접근할 때 "누구 이름으로 호출하는가"를 표준화하는 ③번 영역은, [[2026-08-10-doordash-ai-agent-gateway]] 정리 때 이미 짚었듯 **자체 게이트웨이를 만들 필요를 줄여줄 잠재력**이 있다 — 다만 지금은 로드맵 단계이지 구현이 아니므로, 실제 스펙이 나올 때까지는 자체 인증·권한 계층을 계속 필요로 한다는 원칙(DoorDash 노트의 결론)을 바꿀 이유는 없다. ③파트너사가 늘어나며 도구 카탈로그가 커질 상황을 대비해 ④번 progressive discovery의 실제 구현 패턴을 참고할 가치는 있다.

## 연관 자료

- [[2026-08-10-doordash-ai-agent-gateway]] — 이 로드맵 ③번 영역(에이전트 신원·보안)이 표준화하려는 문제를 DoorDash가 이미 자체 게이트웨이로 먼저 풀었던 사례
- [[2026-05-29-mcp-is-dead-cli-skills]] — 이 로드맵 ④번 영역(tool 탐색 개선)이 정면으로 대응하는, "MCP 컨텍스트 비용이 너무 크다"는 선행 비판
- [[2026-08-22-computer-use-skills-files-api-ga]] — Anthropic Skills API GA와 겹쳐 보면, MCP·Skills 두 표준이 각자 다른 층위(연결 vs 방법)에서 동시에 성숙해가는 중임을 보여줌

## 한 달 뒤 회고
*(2026-09-23 즈음 — ①progressive discovery의 실제 스펙·구현이 나왔는지, Quandri류 비판이 실제로 잠재워졌는지 ②에이전트 신원 영역의 ID-JAG·token exchange가 구체 스펙으로 나왔는지, DoorDash 같은 자체 게이트웨이 구축 사례가 표준으로 대체되기 시작했는지 ③이번엔 확인 못한 HN 반응을 나중에라도 확인할 수 있었는지 기록.)*
