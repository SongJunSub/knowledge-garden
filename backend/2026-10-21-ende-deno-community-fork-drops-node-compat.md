---
title: "Ende - Node.js 호환성을 걷어내는 Deno 커뮤니티 포크 (Webb) — Deno 팀이 Cloudflare로 떠나며 접은 '원칙'을, 커뮤니티가 포크로 되찾으려 한다"
source_title: "Deno Goes the Way of the Dinosaur (Ende 포크 관련 보도)"
source_url: "https://socket.dev/blog/deno-acquisition"
source_name: "Socket.dev — WebFetch 차단으로 WebSearch 경유, 1차 발표(Lobsters 'Beginning of the Ende' 스레드·ende.sh)는 직접 대조 못함"
referrer_url: "https://news.hada.io/topic?id=35688"
published_at: "확인 불가 (2026-10-09 Cloudflare 합류 발표 이후, 2026-10-17 전후로 추정)"
summarized_at: "2026-10-21"
category: "backend"
tags: ["deno", "cloudflare", "javascript-runtime", "fork", "open-source-governance", "chronver"]
---

# Ende - Node.js 호환성을 걷어내는 Deno 커뮤니티 포크 (Webb)

> 출처: Socket.dev "[Deno Goes the Way of the Dinosaur](https://socket.dev/blog/deno-acquisition)" 중 Ende 포크 관련 보도 (WebSearch 경유) · GeekNews(id=35688) 경유 · 정리일 2026-10-21

> **출처 한계**: `news.hada.io`, `socket.dev`, `lobste.rs`, `ende.sh` 전부 이 세션에서 egress 차단으로 직접 열람하지 못했다. WebSearch로 확인한 건 Socket.dev의 2차 보도와 Lobsters 스레드 제목("Beginning of the Ende (a community Deno fork)", `lobste.rs/s/8ejwsp`)뿐이다. Socket.dev 보도에 따르면 포크 저자 본인이 Hacker News 댓글에서 ***"Node 호환성, Deploy, KV, Jupyter를 제거했다"***고 직접 밝혔고 `ende.sh`를 링크했다지만, 그 1차 발언과 사이트 내용을 이번 세션에서 직접 대조하지는 못했다. 저자 이름은 WebSearch가 "Webb"(또는 "Paul Webb")으로 전했으나, 이름 표기의 정확성도 1차 확인은 못했다. Slack 발췌의 "SemVer 대신 출시 날짜 기반 ChronVer"는 ChronVer 자체가 실재하는 별도 버전 관리 규격(JSR `@chronver/chronver`)이라는 것까지는 확인했지만, Ende가 그걸 실제로 쓰는지는 Slack 발췌 외에 독립 확인하지 못했다. 현재 포크를 쓰려면 소스에서 직접 빌드해야 한다고 Socket.dev가 전한다 — 아직 바이너리 릴리스가 없는 초기 단계라는 뜻이다. Ende와 별도로 "Dodo"라는 또 다른 Deno 포크도 거론되는데, Socket.dev에 따르면 Dodo는 "아직 릴리스가 없는" 더 초기 단계라고 한다.

## 한 줄 요약

**Ryan Dahl이 Deno 팀 전체를 이끌고 Cloudflare로 떠나며 런타임 공식 개발을 1년 뒤 접겠다고 발표하자, 한 개발자가 ***"Node 호환성을 추구한 게 결국 Deno를 Node의 재구현으로 만들었다"***는 Dahl 자신의 반성을 정반대 방향으로 해석해 Node 호환성·Deploy·KV·Jupyter를 전부 걷어낸 커뮤니티 포크 Ende를 시작했다 — 이름(독일어로 "끝")부터 "Deno의 타협 노선과는 끝을 내겠다"는 선언이다.**

## 핵심 포인트

- **촉발 사건 — Cloudflare 합류와 1년 시한부 종료** — Dahl·Belder를 포함한 Deno 팀 전원이 2026-10-09 Cloudflare에 합류했고, 런타임은 1년간 월간 패치만 받다가 공식 개발이 끝난다는 것이 Ende가 등장한 직접적 배경이다.
- **Dahl 본인이 "Node 호환 추구가 실패였다"고 짚었다** — Socket.dev 보도에 따르면 Dahl은 Deno가 ***"Node 호환성이라는 중력에 빨려 들어가, 결국 Node처럼 행동하도록 강제됐다"***고 평했다. Ende는 바로 이 자기비판을 "그럼 그 중력에서 벗어나자"는 실행으로 옮긴 셈이다.
- **제거 목록이 명확하다 — Node 호환성, Deploy, KV, Jupyter** — 저자는 HN 댓글에서 이 네 가지를 뺐다고 직접 밝혔다고 한다. Deploy·KV·Jupyter 제외는 "호스팅 서비스·관리형 기능까지 유지할 여력이 없는 커뮤니티 포크가 런타임 자체에만 집중한다"는 선택으로 읽힌다.
- **저자 본인이 이 포크의 직접적 이해관계자다** — Socket.dev는 저자가 Deno 위에 자신의 사업을 짓고 있다고 전한다. "경쟁자가 많아서 재미로 포크했다"가 아니라, ***런타임이 사라지면 자기 사업이 위태로워지는 사람이 생존을 위해 직접 포크를 만든 것***이라는 동기가 뚜렷하다.
- **ChronVer — SemVer를 버리는 또 하나의 상징적 선택** — Slack 발췌는 Ende가 날짜 기반 버전 관리(ChronVer)를 쓴다고 전한다. SemVer가 "호환성 약속"을 버전 번호에 인코딩하는 체계라면, 날짜 기반 버전은 ***"언제 나왔는지"만 말하고 호환성은 별도로 증명해야 한다*** — Node 호환성이라는 "호환성 약속"을 정체성으로 세웠다가 포기했던 Deno의 궤적과 대조되는 선택이다.
- **아직 초기 단계 — 소스 빌드만 가능** — 공식 바이너리 릴리스 없이 소스에서 직접 빌드해야 쓸 수 있는 상태라고 한다. 비슷한 시도인 Dodo는 그보다도 더 이른 단계다.

## 인상 깊은 문장

> "it has been sucked into the gravity well of node compatibility" (Ryan Dahl, Socket.dev 보도 경유 재구성 인용 — 원문 정확한 워딩은 못 대조함)

## 댓글

GeekNews(hada) 댓글 수는 확인 불가. Lobsters에 "Beginning of the Ende" 스레드(`lobste.rs/s/8ejwsp`)가 존재한다는 것은 WebSearch로 제목만 확인했고, 실제 댓글 수·논조는 열람하지 못했다. HN 토론도 저자 본인이 거기 댓글을 남겼다는 것만 간접 확인했을 뿐, 그 글 자체의 점수·댓글 수는 확인하지 못했다. **정직하게 짚을 점**: ① 현재로서는 Ende가 실제로 지속 가능한 커뮤니티를 모을지, 아니면 "발표는 됐지만 소수만 쓰는 포크"로 남을지는 전혀 알 수 없다 — Socket.dev 보도 시점 기준 소스 빌드만 가능한 초기 단계다. ② 저자가 Deno 위에 사업을 짓고 있다는 이해관계는, "순수하게 커뮤니티를 위한 선의"라는 서사만으로 읽으면 안 된다는 뜻이기도 하다 — 동시에 그 이해관계가 포크를 실제로 지속시킬 동력이 될 수도 있다는 양면성이 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 레포의 Deno 연대기에 "원칙을 되찾으려는 반란" 챕터가 추가된다

[[2026-10-06-deno-friendship-over-node-best-friend]]는 Deno가 ***"npm 비호환·보안 기본값"이라는 원칙을 세우고 시작했지만 생태계 압력에 밀려 하나씩 포기하다 결국 원칙 없는 Node 경쟁자가 됐다***는 비판을 다뤘다. [[2026-10-10-deno-team-joins-cloudflare]]는 그 궤적의 결말로, Dahl 본인이 "Node 호환이라는 중력에 빨려 들어갔다"고 자인하며 팀 전체가 Cloudflare로 떠나는 사건을 다뤘다. [[2026-10-18-thank-you-deno-javascript-ecosystem-competition]]는 그 결말을 "제품은 졌지만 압력은 남았다"는 긍정적 유산 평가로 재해석했다. 이번 Ende는 이 세 노트가 그려온 서사에 ***네 번째이자 가장 급진적인 반응***을 더한다 — 앞의 셋이 전부 "평가하는" 입장이었다면, Ende는 ***"그 원칙 포기가 실패였다면, 포기하지 않은 버전을 직접 만들겠다"는 실행***이다. 흥미로운 지점은 Dahl 본인의 자기비판("Node 호환의 중력")이 바로 이 포크를 정당화하는 근거로 재사용된다는 것 — Deno를 떠나는 사람(Dahl)과 Deno의 유산을 이어가려는 사람(Ende 저자)이, ***정확히 같은 문장을 서로 다른 결론으로 가져간다***.

### 핵심 전이 2 — "인재 확보형 인수"가 남긴 빈자리를 커뮤니티가 직접 메우려는 시도

[[2026-10-10-deno-team-joins-cloudflare]]가 짚은 "Cloudflare가 제품이 아니라 사람(Dahl·Belder)을 산 것"이라는 해석이 맞다면, Ende는 ***"회사가 떠나며 비운 자리를, 그 회사의 원래 원칙에 동의하는 외부인이 직접 메우는"*** 오픈소스 거버넌스의 교과서적 반응이다. Tailwind Labs의 Shopify 합류 때는 (이 가든이 확인한 범위에서는) 이런 즉각적인 커뮤니티 포크 시도가 보도되지 않았다는 점에서, Deno 사례가 ***"오픈소스 라이선스가 남아 있다"는 조건이 실제로 작동하는지를 시험하는 첫 케이스***가 될 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — CRS 백엔드 런타임 선택에 Ende가 당장 고려 대상이 되기엔 너무 이른 단계(소스 빌드만 가능)다.** 다만 전이 가능한 원칙 하나는 남긴다 — ***"핵심 메인테이너가 회사 사정으로 떠나도, 오픈소스 라이선스와 활발한 사용자층이 있으면 커뮤니티 포크가 현실적인 대안으로 등장할 수 있다"***는 사례다. CRS가 특정 오픈소스 의존성의 메인테이너 리스크를 평가할 때, "라이선스가 오픈소스인가"뿐 아니라 "실제로 포크를 이어갈 만큼 적극적인 이해관계자 커뮤니티가 있는가"까지 함께 봐야 한다는 걸 보여준다 — Ende의 경우 저자 본인이 Deno 위에 사업을 짓고 있다는 "포크를 지속시킬 이해관계"가 바로 그 신호다.

## 연관 자료

- [[2026-10-06-deno-friendship-over-node-best-friend]] — Deno가 원칙을 하나씩 포기하며 정체성을 잃었다는 비판적 선행 노트, Ende가 되찾으려는 바로 그 원칙
- [[2026-10-10-deno-team-joins-cloudflare]] — Dahl의 "Node 호환 중력" 자기비판과 팀 전원의 Cloudflare 합류, Ende의 직접적 촉발 사건
- [[2026-10-18-thank-you-deno-javascript-ecosystem-competition]] — 같은 사건을 "제품은 졌지만 압력은 남았다"로 평가한 선행 노트, Ende는 그 평가를 넘어선 실행 단계

## 한 달 뒤 회고

*(2026-11-21 즈음 — ①Ende가 바이너리 릴리스를 냈는지, 실제 사용자·컨트리뷰터가 모였는지. ②저자 "Webb"의 정확한 신원과 ende.sh 사이트 내용을 1차로 확인했는지. ③Dodo 등 경쟁 포크와의 관계가 합병·경쟁 중 어느 쪽으로 정리됐는지 점검.)*
