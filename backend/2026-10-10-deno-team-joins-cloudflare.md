---
title: "Deno 팀, Cloudflare 합류 - 런타임 개발은 1년 뒤 종료 (Ryan Dahl) — 독자 런타임을 1년 유지보수 뒤 접고, celld를 workerd에 합쳐 '서버사이드 코드의 기본값'을 Workers 모델로 만들겠다는 선언"
source_title: "Deno is joining Cloudflare"
source_url: "https://simonwillison.net/2026/Oct/9/deno-is-joining-cloudflare/"
source_name: "Simon Willison 블로그(요약·링크) — Cloudflare/Deno 공식 발표문 정확한 URL은 WebFetch 차단으로 직접 확인 못함, The New Stack·AlternativeTo·iMasters·ByteIota·Lobsters 등 복수 매체 교차확인"
referrer_url: "https://news.hada.io/topic?id=35073"
published_at: "2026-10-09"
summarized_at: "2026-10-10"
category: "backend"
tags: ["deno", "cloudflare", "javascript-runtime", "workerd", "acquihire", "deno-deploy", "runtime-sunset"]
---

# Deno 팀, Cloudflare 합류 - 런타임 개발은 1년 뒤 종료 (Ryan Dahl)

> 출처: [Deno is joining Cloudflare](https://simonwillison.net/2026/Oct/9/deno-is-joining-cloudflare/) (Ryan Dahl, Cloudflare/Deno 공식 발표 · Simon Willison 블로그 경유 요약, 2026-10-09) · GeekNews(id=35073) 경유 · 정리일 2026-10-10

> **출처 한계**: `news.hada.io`, `simonwillison.net`, `lobste.rs`, `thenewstack.io` 모두 이번 세션에서 WebFetch가 DNS 단계부터 막혀(`ENOTFOUND`) 직접 열람하지 못했다. 아래 내용은 WebSearch(확장 모드 포함)로 교차확인한 결과이며, Simon Willison·The New Stack·AlternativeTo·iMasters·ByteIota·KuCoin 뉴스·Ryan Dahl 본인의 X 포스트 인용 등 복수의 독립 소스가 핵심 사실(팀 합류, 런타임 1년 뒤 종료, Deploy 6개월 내 종료, JSR 존속)에서 합의한다. 다만 Cloudflare·Deno 공식 블로그의 정확한 URL과 원문 전체 워딩은 확인하지 못했다. hada 댓글 수는 확인 불가하며, Lobsters에 토론 스레드(`lobste.rs/s/8hauxs`)가 존재한다는 것은 WebSearch로 확인했으나 본문·댓글 수는 열람하지 못했다. HN 토론 존재 여부도 이번 세션에서는 확정하지 못했다.

## 한 줄 요약

**2026-10-09, Deno 팀 전원(창업자 Ryan Dahl·Bert Belder 포함)이 Cloudflare에 합류한다고 발표했다. 재무 조건은 비공개다. Cloudflare는 Deno 런타임을 앞으로 1년간 월간 릴리스(버그 수정·보안 패치)로만 유지하고, 그 뒤 공식 개발을 종료한다 — 오픈소스로는 남아 누구든 이어갈 수 있다는 조건부 생존이다. Deno Deploy(호스팅 서비스)는 6개월 안에 완전히 종료되고 유료 고객은 Cloudflare Workers로 이전 지원을 받는다. 핵심은 "Deno라는 제품을 산 것"이 아니라 "Dahl과 Belder가 만든 celld(Deno의 Workers/Durable Objects 구현체)의 코드와 아이디어를 Cloudflare의 오픈소스 런타임 workerd에 합쳐, Workers 프로그래밍 모델 자체를 서버사이드 코드 작성의 기본값으로 만들려는" 인재·기술 흡수다.**

## 핵심 포인트

- **팀 전원 이동, 제품은 단계적 종료** — Dahl·Belder를 포함한 Deno 팀 전체가 Cloudflare로 옮긴다. 복수 매체가 이를 "acquihire"(인재 확보형 인수)로 읽는다 — Lobsters 댓글 중 하나는 ***"Cloudflare는 제품을 원한 게 아니라 사람을 원했다"***는 취지로 평가했다고 WebSearch 요약이 전한다(원문 직접 확인은 못함).
- **런타임: 1년 유지보수 뒤 공식 종료** — Deno CLI/런타임은 앞으로 1년간 월간 릴리스(버그 수정·보안 패치)만 받고, 그 뒤 Cloudflare의 공식 개발이 끝난다. 오픈소스 라이선스는 유지되므로 커뮤니티가 이어갈 길은 열려 있지만, 1년 뒤 "회사가 미는 런타임"에서 "커뮤니티가 떠받치는 레거시 런타임"으로 지위가 바뀐다.
- **Deno Deploy: 6개월 시한부, Workers로 이전** — 호스팅 서비스는 6개월 안에 종료되고, 유료 고객은 Cloudflare Workers로 마이그레이션 지원을 받는다.
- **JSR(패키지 레지스트리)은 존속, 인프라만 이전** — 서비스 자체는 계속되지만 인프라가 Cloudflare로 옮겨간다.
- **기술적 목표는 celld → workerd 통합** — Dahl과 Belder는 Deno가 자체 구현한 Workers/Durable Objects 런타임인 "celld"의 코드와 아이디어를 Cloudflare의 오픈소스 런타임 workerd에 합치는 작업을 주도한다고 알려졌다.
- **Dahl의 동기 — "Workers 모델을 기본값으로"** — 본인 X 포스트에서 ***"Cloudflare Workers 프로그래밍 모델은 'The Network Is the Computer'라는 옛 Sun Microsystems 태그라인을 진짜로 구현한 'hermetic computing abstraction'"***이라 평하며, Workers 모델을 서버사이드 애플리케이션 코드를 작성하는 기본 방식으로 만들고 싶다고 밝혔다(원문 워딩은 WebSearch 요약을 통한 재구성). AI 에이전트들이 전부 Linux VM을 필요로 하는 건 아니라는 동기도 언급했다고 한다.
- **같은 패턴의 두 번째 사례** — Cloudflare는 2026-06-04(복수 매체 일치)에 Vite·Vitest·Rolldown·Oxc를 만든 VoidZero(창업자 Evan You)를 인수해 팀을 ETI(Emerging Technology and Incubation) 조직에 합류시킨 바 있다. 재무 조건 비공개, 오픈소스·MIT 라이선스 유지라는 조건까지 이번 Deno 딜과 거의 같은 틀이다.

## 인상 깊은 문장

*(이번 정리에서는 Cloudflare·Deno 공식 발표문 원문에 직접 접근하지 못해, 위 "Dahl의 동기" 항목에 넣은 X 포스트 인용은 WebSearch의 재구성이라는 점을 밝혀둔다. 더 정확한 원문 인용은 WebFetch 차단이 풀린 뒤 보강이 필요하다.)*

## 댓글

**hada 댓글 수 확인 불가.** `news.hada.io` WebFetch가 DNS 단계부터 막혔다. Lobsters에 별도 토론 스레드(`lobste.rs/s/8hauxs`)가 존재한다는 것은 WebSearch로 확인했고, 그 안에서 "acquihire" 평가가 나왔다는 것도 확인했지만, 실제 댓글 수·전체 논조는 열람하지 못했다. HN 토론 존재 여부는 이번 세션의 검색으로는 확정하지 못했다(제목이 워낙 화제성이 커서 존재할 개연성은 높지만, 추정으로 남긴다). **이해관계 고지**: 1차 발표문은 당사자(Cloudflare·Dahl)의 공식 포지셔닝이므로 "팀을 위한 안정적 거처"라는 긍정적 프레이밍 자체가 당사자 발화다. 반대로 "제품이 아니라 사람이 목적이었다"는 평가는 제3자(커뮤니티) 해석이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-10-tailwind-labs-joins-shopify]]와 거의 동형인 "독립 OSS 런타임/팀이 대기업에 흡수되는" 패턴

Tailwind Labs가 Shopify에 합류한 사건은 ***"채택률 1위인데 매출은 80% 무너진 회사가, MIT 라이선스와 팀을 그대로 유지한 채 대기업의 사내 자산으로 편입"***되는 구조였다. Deno의 경우 매출 붕괴가 전면에 보도되지는 않았지만(이번 조사로는 확인 못함), 결과 구조는 거의 같다 — ***독립 런타임/프레임워크 회사가 "오픈소스 라이선스 유지 + 팀 흡수 + 상업 제품 단계적 종료"라는 같은 틀로 대기업에 들어간다.*** 더 흥미로운 건 Cloudflare가 이 틀을 반복하고 있다는 점이다 — 2026-06 VoidZero(Vite/Evan You), 2026-10 Deno(Dahl/Belder) 모두 "오픈소스·MIT 유지, 재무 조건 비공개, 팀 전원 합류" 패턴이 동일하다. 이건 더 이상 개별 사건이 아니라 ***Cloudflare가 JS 생태계의 핵심 개발 도구 제작자들을 체계적으로 흡수하는 롤업 전략***으로 읽힌다.

### 핵심 전이 2 — [[2026-10-06-deno-friendship-over-node-best-friend]]가 "원칙의 후퇴"로 짚었던 궤적의 결말

나흘 전 정리한 노트는 Deno가 ***"npm 비호환·보안 기본값"이라는 원칙을 세우고 시작했지만, 생태계 압력에 밀려 그 원칙을 하나씩 포기하다가 결국 원칙 없는 Node 경쟁자가 돼버렸다***는 비판적 서사를 다뤘다(단, 그 노트 자체도 원문을 특정 못한 재구성이었다). 이번 사건은 그 서사의 결말처럼 보인다 — 독자 원칙으로 경쟁하려던 런타임이, 결국 "자체 생태계를 지킬 자원"을 못 구하고 더 큰 플랫폼(Cloudflare Workers)의 구현 세부로 흡수된다. 다만 정직하게 짚어야 할 긴장이 있다 — 그 노트는 Dahl이 "Deno 2 출시 이후 월간 활성 사용자가 두 배 늘었다"고 반박했다는 사실도 함께 실었다. ***사용자가 늘고 있다는 당사자 주장과, 결국 독립 런타임 사업을 접고 대기업에 합류하는 선택은 모순되지 않는다*** — Tailwind 사례에서도 "채택률 1위"와 "매출 붕괴"가 동시에 참이었던 것과 같은 구조다. 채택 지표만으로는 사업의 생존 가능성을 못 읽는다는 원칙이 두 번째로 확인된 셈이다.

### 핵심 전이 3 — "인재 확보형 인수"는 결국 통제 지점을 사는 행위다

[[2026-07-15-hardware-eating-software-value-migration]]의 핵심 명제 ***"가치는 질량처럼, 쉽게 움직일 수 없는 곳에 쌓인다"***를 여기 대입하면, Cloudflare가 사려는 건 Deno라는 브랜드가 아니라 ***"Workers/Durable Objects를 구현할 수 있는 몇 안 되는 엔지니어 두 명(Dahl·Belder)"***이라는 희소 자원이다. 제품(런타임·Deploy)은 쉽게 복제·대체 가능하지만, 그걸 특정 방식으로 구현해본 팀의 축적된 판단은 쉽게 움직일 수 없는 자산이라는 점에서 "통제 지점을 언더라이트하라"는 원칙이 인수 시장에서도 반복된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — Deno 자체를 CRS 백엔드 런타임으로 쓰고 있지 않다면 이 사건이 당장 바꾸는 건 없다.** 다만 전이 가능한 원칙 둘은 남길 만하다. ① ***"오픈소스·MIT 유지"라는 약속이 인수 이후에도 "서비스(호스팅·Deploy)는 유지"를 보장하지는 않는다*** — 런타임 코드는 남지만 그 위에 올린 상용 서비스는 6개월~1년 시한부로 끝날 수 있다는 걸 보여주는 사례다. CRS가 특정 벤더의 매니지드 런타임/호스팅(서버리스 플랫폼 등)에 의존하고 있다면, "오픈소스니까 안전하다"와 "그 위의 운영 서비스가 계속된다"를 분리해서 봐야 한다. ② 핵심 전이 1에서 짚은 "메인테이너 지속가능성 점검" 원칙(Tailwind 노트에서 이미 CRS 체크리스트로 제안한 것)이 이번에도 그대로 적용된다 — 사용 중인 핵심 OSS 도구의 회사가 최근 1년 내 레이오프·인수·피벗 신호가 있는지는 분기 점검 항목으로 둘 만하다.

## 연관 자료

- [[2026-10-06-deno-friendship-over-node-best-friend]] — 같은 런타임을 다룬 선행 노트, "원칙을 포기하다 정체성을 잃은" 궤적의 결말처럼 보이는 이번 사건
- [[2026-09-10-tailwind-labs-joins-shopify]] — 거의 동형인 "독립 OSS 런타임/프레임워크 팀이 대기업에 흡수되는" 패턴, Cloudflare의 VoidZero 인수까지 포함해 세 사례가 같은 틀을 반복
- [[2026-07-15-hardware-eating-software-value-migration]] — "가치는 쉽게 움직일 수 없는 곳에 쌓인다"는 인수의 동기를 설명하는 원칙

## 한 달 뒤 회고

*(2026-11-10 즈음 — ①WebFetch 차단이 풀려 Cloudflare·Deno 공식 발표문 원문과 정확한 인용을 보강할 수 있는지, ②HN 토론 존재 여부와 실제 반응 규모를 확인했는지, ③celld→workerd 통합의 구체적 기술 진행 상황이 공개됐는지, ④Deno Deploy 유료 고객의 Cloudflare Workers 이전이 실제로 순조로웠는지 기록.)*
