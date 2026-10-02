---
title: "Whiteboard 출시 스레드 다시 읽기 (/dev/fast, HN 142댓글) : 창업자는 코드를 계획의 싼 탐침이라 부르고, 다이어그램은 결국 휘발하며 남는 건 사람 머릿속 모델이라고 스스로 인정했다"
source_title: "Show HN: Whiteboard (YC W26) – An open-source IDE for thoughtful software design"
source_url: "https://news.ycombinator.com/item?id=49833867"
source_name: "Hacker News Show HN 스레드(hn.algolia.com API 전문), devdotfast/whiteboard README, GitHub API"
referrer_url: "https://news.hada.io/topic?id=34245"
published_at: "2026-09-24"
summarized_at: "2026-10-02"
category: "ai"
tags: ["code-review", "plan-mode", "agentic-coding", "diagramming", "cognitive-debt", "developer-tools", "hacker-news", "follow-up"]
---

# Whiteboard 출시 스레드 다시 읽기 (/dev/fast, HN 142댓글)

> 출처: [Show HN: Whiteboard (YC W26)](https://news.ycombinator.com/item?id=49833867) (Sid, Alex, Ketan, Milan / Hacker News) / [devdotfast/whiteboard](https://github.com/devdotfast/whiteboard) README / GeekNews(id=34245) 경유 / 정리일 2026-10-02

> **원문 확보 방식과 출처 한계 (4가지)**
> 1. 이 노트는 [[2026-09-25-whiteboard-ai-code-diff-canvas]]의 **후속편**이다. 그 노트는 GitHub와 HN이 모두 막혀 WebSearch로 재구성했고, 기능 설명은 이미 충실하다. 여기서는 그때 못 본 것, 즉 **HN 댓글 142개 전문과 README 원문**에서 나온 새 내용만 다룬다.
> 2. HN 스레드는 `hn.algolia.com/api/v1/items/49833867`로 전문을 받았다(2026-10-02 기준 **423점, 142댓글**). 앞 노트가 WebSearch로 적은 234점, 89댓글은 게시 초기 값이었다.
> 3. `news.hada.io`는 이번에도 막혀(curl 응답 10바이트) hada 댓글은 확인하지 못했다.
> 4. **출시 스레드라는 편향**: 142개 중 상당수를 창업자 4명이 직접 답했고 짧은 응원 댓글도 많다. 창업자 답변은 "앞으로 하겠다"는 로드맵 약속이 대부분이라 검증된 사실이 아니다. Salesforce, Modal이 쓴다는 주장도 본인들 진술뿐이다.

## 한 줄 요약

**출시 스레드에서 Whiteboard의 실체는 기능 목록보다 창업자의 답변에서 더 잘 드러났다. 이들은 "구현 없이 계획만 리뷰하는 건 더 이상 쓸모없게 느껴진다, 코드 작성은 스펙을 더 좋게 만드는 싼 노력"이라며 계획과 리뷰 사이의 간극을 없애는 쪽에 걸었고, 다이어그램이 코드와 어긋나 또 하나의 진실 공급원이 된다는 비판에는 "다이어그램은 확실히 휘발성이고, 오래 남는 건 내가 이해해서 더 나아진 코드와 내 머릿속 모델"이라고 인정했다. 반론도 선명했다. 한쪽은 구현 단계는 이미 에이전트와 자동 리뷰가 사람보다 낫다며 사람의 자리는 계획뿐이라 했고, 다른 쪽은 몇 주간 계획만 리뷰했더니 무너져 5만 줄을 걷어냈다고 했다. 그리고 데모 GIF 자체가 코드에 없는 화살표를 그린 "개념용" 그림이었다는 사실을 한 댓글이 잡아냈다.**

## 핵심 포인트

### 1. 출시 1주일 사이 바뀐 것 (GitHub API, 릴리스 기록으로 확인)

| 항목 | 출시 시점 | 2026-10-02 |
|---|---|---|
| 자기 규정 | "open-source **IDE**" | "open-source **canvas**" (HN 지적 후 GitHub와 사이트 문구 변경) |
| 제품명(릴리스) | Review Desktop 0.1.1 | Whiteboard 0.1.5 (09-28) |
| 플랫폼 | macOS (Fedora 빌드는 있었음) | Windows, Ubuntu 추가 (스레드 진행 중 출시) |
| 연결 대상 | Claude Code, Codex 등 | GitHub Copilot CLI 추가 (이슈 #593, 09-28 종료) |
| 스타 / 포크 | (09-29에 2,141 / 95) | 2,549 / 119 |

- ***"IDE인데 파일 편집이 안 된다"***는 지적이 가장 많이 반복됐다("IDE는 I Don't Edit의 약자냐"). 창업자는 "요즘 VSCode를 거의 코드 리뷰에만 쓰니 가장 가까운 비교 대상이라 골랐다"고 해명하고 결국 이름을 바꿨다. 편집을 안 넣은 이유는 "편집을 넣으면 Conductor, Superset 같은 오케스트레이터 모양으로 끌려간다"는 것이다.

### 2. README 원문에서 새로 확인된 것

- **Code OSS를 패치가 아니라 통째로 들여왔다(vendoring).** 이유는 두 가지다. 코딩 에이전트가 패치 파일 관리에 약하고, 기본 VS Code에는 필요 없는 것이 많다는 것(본인들 표현으로 ***"코드베이스의 약 45%가 Copilot"***). 대가는 용량이다. macOS 설치본이 **736MB**라는 지적에 창업자는 diff 뷰어만 138MB라고 인정하고 "언젠가 완전 네이티브로 다시 쓰겠다"고 답했다.
- **영향받은 글 목록 맨 앞이 Geoffrey Litt의 "Understanding is the new bottleneck"이다.** 가든에 이미 있는 [[2026-07-14-understanding-is-the-new-bottleneck]]이 이 제품의 문제 정의 그 자체라는 뜻이다.
- **알려진 한계**를 README가 직접 적는다: 편집 불가, 여러 레포를 한 리뷰에서 다루기 어려움, 공유한 뒤의 변경은 상대에게 안 보임(다시 공유해야 함).

### 3. 스레드의 핵심 논쟁: 사람은 계획을 볼 것인가, 구현을 볼 것인가

| 입장 | 화자 | 주장 |
|---|---|---|
| 사람은 계획만 | 2001zhaozhao | 구현 단계는 에이전트와 자동 리뷰가 이미 ***"초인적 신뢰도"***. 나는 plan mode와 `/code-review`만 쓴다. 사람의 접점은 계획이다 |
| 계획과 구현을 붙여라 | 창업자(Sid) | ***"구현 없이 계획을 리뷰하는 건 더 이상 쓸모없게 느껴진다. 핵심 트레이드오프는 구현하면서 드러나 최상위 스펙을 바꾸기 때문"***. Go의 design draft 관행(Russ Cox)에서 영향 |
| 구현은 터널 시야를 만든다 | sippeangelo | 모델이 구현을 한 번 확정하면 방금 자기가 쓴 코드를 진실로 취급해 재설계를 거부한다. ***"발전시키기보다 버리고 대화를 되감는 게 항상 낫다"*** |
| 코드를 안 보면 무너진다 | jenniferhooley | 몇 주간 계획만 리뷰했더니 미세 버그와 "찌꺼기"가 쌓였고, 결국 리셋해 ***같은 기능을 5만 줄 적게*** 다시 만들었다. [[2026-09-12-measuring-code-sloppiness]]를 인용 |

- 실제 사용 흐름에 대한 창업자 설명은 ***"계획 → 승인 → 에이전트 코딩 → Whiteboard로 코드 설명"***이고, 계획을 먼저 캔버스에 올리는 "scratchpad" 모드는 실험 단계라고 했다. 즉 지금의 Whiteboard는 **계획 도구가 아니라 사후 이해 도구**다.

### 4. 다이어그램 표류와 "또 하나의 진실 공급원" 비판

- asdev: 팀에 N+1번째 진실 공급원이 생기고 반드시 낡는다. 에이전트로 갱신하면 설계 문서가 알아볼 수 없는 slop으로 열화한다. ***"이건 소프트웨어 설계의 행동적, 구조적 문제라 소프트웨어로는 못 푼다."***
- 창업자 답변은 둘로 갈렸다. Sid는 "다이어그램 노드가 코드에 붙어 있어 표류를 감지할 수 있다(코드 포지의 코멘트처럼)"고 기술로 답했고, Ketan은 ***"다이어그램은 확실히 더 휘발성이다. 오래 남는 건 (1) 내가 이해했기에 더 나아진 출시 코드, (2) 현재 코드베이스에 맞춰진 내 머릿속 모델"***이라고 인정했다.
- cannonpalms의 사용 후기가 Ketan의 답과 정확히 맞물린다: 에이전트와 일하면 코드의 "모양"이 머리에 안 남아 회의에서 받은 질문에 나중에 비동기로 답해야 했다. 그래서 ***"기억할 수 있는 깊이로 내 산출물을 이해하는 데"*** 쓰겠다.

### 5. 데모 GIF 사건: "코드에 연결돼 있으니 환각은 없다"는 주장의 한계

- 8organicbits가 README 데모 GIF에서 **diff에 없는 "wait for release" 전이**를 찾아냈다. 코드상 그 "no" 분기는 컨텍스트 만료라 기다리면 안 되고 멈춰야 하는 자리였다.
- 창업자 답: 그 GIF는 디자인용으로 만든 **개념용(notional) 그림**이었고 실제 세션으로 교체했다. ***"실제 다이어그램은 전부 코드에 연결돼 있어 환각은 실무에서 거의 안 일어난다."***
- 이 답은 절반만 맞다. 노드가 실제 코드 위치를 가리킨다는 것은 **"이 상자가 존재하는 코드다"**를 보장할 뿐, **"이 화살표의 라벨이 그 코드의 의미를 맞게 말한다"**는 보장하지 않는다. 잡힌 오류가 바로 노드가 아니라 **전이(엣지)의 의미**였다.

### 6. 그 밖의 비판과 답

- **"기능 하나지 제품이 아니다(GUI 붙은 MCP)"**: 창업자는 Codex Desktop, Superset, Conductor 안에서 보이는 MCP UI로도 내놓겠다고 답했다. 사실상 인정에 가깝다.
- **"Mermaid, C4, LikeC4로 되지 않나"**: 정적 렌더링 도구는 클릭해서 코드로 가는 상호작용이 약하다는 답. 다만 C4 기반 "software map" 기능이 **기본 꺼진 실험 기능**으로 이미 들어 있다고 밝혔다. LikeC4도 상호작용과 워크스루가 있다는 재반박에는 답이 없었다.
- **자동 리뷰와의 분업**: 작은 변경은 Greptile 같은 자동 리뷰어에 맡기고 ***사람의 판단이 필요한 변경만 Whiteboard 세션으로 올린다***는 사용 패턴을 창업자가 직접 제시했다.
- **로컬이라더니 업로드 경고**: Codex가 "Whiteboard는 저장소 데이터를 authoring server에 업로드한다"고 경고했다는 제보에, 그 서버는 내 머신의 stdio MCP 서버이고 원격 수집은 버그 리포트나 세션 공유 시 사용자가 동의할 때만이라고 답했다(`docs/telemetry.md`에 항목 공개).

## 인상 깊은 문장

> "in some sense, the code writing process is just a cheap effort which makes the spec better and more thorough?"
> (창업자 Sid. 물음표로 끝난다는 점까지 포함해서)

> "once the LLM has locked down an implementation any reworks I try to do gets it really tunnelvisioned on the current implementation, treating it like the truth even though it JUST wrote it"
> (sippeangelo)

> "the diagrams/artifacts are definitely more ephemeral, since they fall out of date. in my experience, the more lasting artifacts from the whiteboarding session have been 1) making the code that ships higher quality because i understand it, and 2) getting my own mental model aligned"
> (공동창업자 Ketan)

## 댓글

- **HN**: 423점, 142댓글(2026-10-02, Algolia API 기준). 전문을 읽었다. 짧은 응원과 플랫폼 요청(Windows, AUR, Nix, deb)이 많고, 실질 논쟁은 위 3~6번 다섯 갈래에 몰려 있다. "바이브코딩한 랜딩 페이지는 거른다", "AI 생성 코드가 MIT 라이선스 대상이 되나" 같은 곁가지도 있었다. "AI가 코드를 쓰고 다른 AI가 설명해주는 걸 그냥 받아들이자는 거냐"는 날 선 반발에 창업자는 "에이전트가 slop 벽으로 설명하는 게 아니라 diff 자체를 다가가기 쉽게 만드는 것, 이해를 놓으려는 도구가 아니라 정반대"라고 답했다.
- **hada**: 접근 차단으로 댓글 수 미확인.
- **편향**: 창업자 4명이 스레드에 상주하며 답했고, 답변 상당수가 로드맵 약속(호스팅 버전, scratchpad 모드, 편집 기능, 네이티브 재작성)이다. 검증된 것은 스레드 중 실제로 나온 Windows/Ubuntu 빌드, 이름 변경, GIF 교체, Copilot CLI 지원까지다. "Salesforce와 Modal이 쓴다"는 확인할 방법이 없다.

## 내 생각, 적용점

### 핵심 전이 1: 계획 논쟁의 세 번째 꼭짓점

[[2026-09-27-plan-mode-is-dead]]의 Ayman Nadeem은 계획 문서 중심 도구를 만들다 실패하고 ***"계획은 행위이지 산출물이 아니다"***에 도달했다. Whiteboard 창업자는 같은 시기에 거의 같은 말을 다른 방향에서 한다. 계획을 따로 리뷰하지 말고 구현과 붙여서 보라, 코드는 스펙을 다듬는 싼 탐침이다. 반대편 꼭짓점은 [[2026-09-18-openspec-spec-driven-development-for-agents]]의 "코드 전에 명세를 못박는다"이다.

여기서 sippeangelo의 반론이 두 입장을 이어주는 조건이 된다. 코드가 정말 "싼 탐침"이려면 **버릴 수 있어야** 한다. 그런데 모델은 방금 쓴 구현에 고착되므로, 탐침으로 쓴 코드는 스펙이 바뀌면 고치는 게 아니라 버리고 되감아야 한다. 정리하면 ***"계획과 구현을 붙여 보되, 구현은 계획을 위한 일회용 시제품으로 취급하라"***이고, Whiteboard 창업자의 주장은 이 일회성 조건이 붙어야 성립한다. 2001zhaozhao의 "구현은 이미 초인적"과 jenniferhooley의 "5만 줄을 걷어냈다"의 충돌은 일반론으로 결론 낼 문제가 아니다. 그 차이는 아마 도메인(3D 게임의 상호작용 지연, 미세 버그는 계획에 안 보인다)과 측정 방법에서 나온다.

### 핵심 전이 2: 오래 남는 산출물은 다이어그램이 아니라 사람의 이론

Ketan의 자백은 [[2026-09-16-do-you-still-read-the-code]]가 인용한 Naur의 ***"프로그래밍의 산출물은 코드가 아니라 프로그래머 머릿속의 이론"***과 같은 말이다. 그리고 README가 첫 영향으로 꼽은 [[2026-07-14-understanding-is-the-new-bottleneck]]의 결론(이해의 목적은 검증이 아니라 다음 반복에 **참여**하는 것)과도 맞닿는다. 그렇다면 Whiteboard를 "설계 문서 도구"로 평가하면 asdev의 비판(N+1 진실 공급원)에 진다. "**이해를 만드는 일회성 세션 도구**"로 평가해야 성립한다. 제작사가 호스팅 버전으로 "항상 최신인 software map"을 약속하는 순간 다시 문서 도구 쪽으로 돌아가 asdev의 비판에 노출된다는 점이 이 제품의 전략적 긴장이다.

### 핵심 전이 3: 코드 연결은 존재를 보장하고 의미는 보장하지 않는다

데모 GIF 사건은 작지만 일반화된다. "근거에 연결돼 있으니 환각이 없다"는 주장은 RAG의 인용, 에이전트 트레이스 링크, 다이어그램 노드 어디에나 나오고, 늘 같은 구멍이 있다. **링크는 참조 대상이 실재함을 보장하지만, 링크 사이의 관계 서술이 맞다는 것은 보장하지 않는다.** 리뷰어가 Whiteboard에서 가장 의심해야 할 것은 상자가 아니라 화살표와 그 라벨이다. "환각은 실무에서 거의 안 일어난다"는 말이 더 따져볼 이유를 지우는 답으로 쓰이면, [[2026-09-28-normalization-of-unexplainable-failure]]가 경계한 "가끔은 그냥 안 된다"가 조사를 끝내는 답이 되는 것과 같은 구조가 된다.

### 핵심 전이 4: ADE의 반대편

스레드에서 "이런 도구를 뭐라 부르냐"는 논의에 창업자는 Whiteboard가 오케스트레이터나 ADE의 ***"거의 반대 문제"***를 푼다고 했다. [[2026-10-01-traycer-multi-agent-orchestration]] 같은 오케스트레이터는 여러 에이전트 사이의 맥락 전환을 줄이고, Whiteboard는 사람이 레버리지가 큰 지점에서만 깊게 들어가게 한다. [[2026-09-20-px0-lightweight-browser-code-review]]의 "저작은 에이전트, 검토는 읽기 전용 도구" 분리와 같은 계열이고, 편집 기능을 일부러 빼고 버틴 이유도 거기 있다.

## 호스피탈리티 / CRS 적용 포인트

- **깊은 리뷰로 올리는 기준을 결정적으로 정한다.** 창업자가 제시한 "작은 변경은 자동 리뷰, 사람 판단이 필요한 것만 세션으로"라는 분업은 CRS에 그대로 옮길 만하다. 다만 "사람 판단이 필요한가"를 LLM이 고르게 두면 안 된다. 요금 계산, 정산, 재고와 객실 할당, 채널 연동 매핑을 건드리는 PR은 **경로 기반 규칙으로 무조건 깊은 리뷰로 올리고**, 나머지만 자동 리뷰에 맡긴다. 앞 노트의 "정산 diff는 테스트를 펼쳐 본다"와 합치면 체크리스트가 된다.
- **다이어그램 검토는 화살표부터.** 예약 상태 전이(가예약 → 확정 → 취소, 노쇼 처리)를 에이전트가 그려주면 상자보다 **전이 조건과 라벨**을 코드의 실제 분기와 대조한다. GIF 사건의 "만료됐는데 대기로 돌아가는 화살표"는 예약 홀드 만료 처리에서 그대로 사고가 되는 유형이다.
- **도입 검토 시 사내 승인 관점.** "기존 에이전트에 붙는 로컬 플러그인이라 승인이 쉽다"는 댓글이 있었지만, 같은 스레드에 Codex의 업로드 경고 사례도 있었다. 제작사 설명(로컬 stdio MCP, 동의 시에만 수집)은 본인들 진술이므로 `docs/telemetry.md`와 실제 네트워크 트래픽을 먼저 확인하는 것이 순서다. 고객 예약 데이터가 있는 레포라면 더 그렇다.

## 연관 자료

- [[2026-09-25-whiteboard-ai-code-diff-canvas]] : 같은 도구의 기능 정리편. 이 노트는 그 후속으로 HN 반응과 README 원문만 다룬다
- [[2026-09-27-plan-mode-is-dead]] : "계획은 행위이지 산출물이 아니다". 창업자의 "구현 없는 계획 리뷰는 쓸모없다"와 같은 결론, 다른 경로
- [[2026-09-18-openspec-spec-driven-development-for-agents]] : 반대 꼭짓점. 코드 전에 명세를 못박는 SDD
- [[2026-07-14-understanding-is-the-new-bottleneck]] : Whiteboard README가 첫 영향으로 꼽은 글. 이해의 목적은 참여
- [[2026-09-16-do-you-still-read-the-code]] : Naur의 "산출물은 이론". Ketan의 "남는 건 내 머릿속 모델"과 같은 말
- [[2026-09-12-measuring-code-sloppiness]] : 스레드에서 "계획만 리뷰하다 5만 줄"의 근거로 인용된 글
- [[2026-09-28-normalization-of-unexplainable-failure]] : 한 문장짜리 답이 원인 조사를 끝내는 구조. "환각은 거의 없다"도 같은 위치에 설 수 있다
- [[2026-10-01-traycer-multi-agent-orchestration]] : 창업자가 "거의 반대 문제"라고 선을 그은 오케스트레이터 계열
- [[2026-09-20-px0-lightweight-browser-code-review]] : 저작과 검토의 물리적 분리, 편집 기능을 뺀 이유와 같은 계열

## 한 달 뒤 회고

*(2026-11-02 즈음 점검: 창업자가 약속한 scratchpad(계획 먼저) 모드가 나왔는지, 그렇다면 "구현 없는 계획 리뷰는 쓸모없다"는 입장과 어떻게 화해시켰는지. software map이 기본값으로 켜졌는지, 켜졌다면 asdev의 N+1 진실 공급원 비판에 어떻게 답했는지. 설치 용량이 736MB에서 줄었는지. 직접 써봤다면 다이어그램의 화살표 라벨이 코드 분기와 몇 번 어긋났는지 세어 둔다.)*
