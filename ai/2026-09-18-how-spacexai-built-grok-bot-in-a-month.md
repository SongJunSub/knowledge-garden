---
title: "SpaceXAI가 한 달 만에 Grok Bot을 만든 방법 (Roman Ugarte, Lenny's Podcast) — 내부 베타 이후 오히려 기능을 걷어내는 'unshipping'에 집중했다"
source_title: "How we built Grok Bot in a month | Roman Ugarte (SpaceXAI)"
source_url: "https://www.lennysnewsletter.com/p/how-we-built-grok-bot-in-a-month"
source_name: "Lenny's Podcast (Lenny Rachitsky 진행 · Roman Ugarte 출연, YouTube 영상 병행)"
referrer_url: "https://news.hada.io/topic?id=33872"
published_at: "확인 불가"
summarized_at: "2026-09-18"
category: "ai"
tags: ["grok-bot", "spacexai", "agent-product", "unshipping", "product-velocity", "persistent-agent", "onboarding"]
---

# SpaceXAI가 한 달 만에 Grok Bot을 만든 방법 (Roman Ugarte, Lenny's Podcast)

> 출처: [How we built Grok Bot in a month | Roman Ugarte (SpaceXAI)](https://www.lennysnewsletter.com/p/how-we-built-grok-bot-in-a-month) (Lenny's Podcast, Lenny Rachitsky 진행 · Roman Ugarte 출연) · GeekNews 경유 [id=33872](https://news.hada.io/topic?id=33872) · 정리일 2026-09-18
>
> **출처 한계 (영상/팟캐스트 + 접근 차단이 겹침)**: 원문이 영상(YouTube `maSdsTLaMuU`)과 팟캐스트로만 존재해 자막·트랜스크립트를 직접 읽어야 하는데, `youtube.com`·`lennysnewsletter.com`·`news.hada.io`·트랜스크립트 미러(podscripts.co, egleze.com 등)가 전부 이번 세션 egress 정책으로 차단됐다. 이 노트는 Slack 발췌와, WebSearch로 확인한 Lenny Rachitsky 본인의 X 스레드 요약·Roman Ugarte 본인 X 게시물·복수 2차 보도(BigGo Finance, Summify 등) 스니펫을 교차해 재구성했다. **정확한 발화 순서·수치의 출처(내부 자료 vs 추정)는 확인하지 못했다.**

## 한 줄 요약

**Grok Bot은 개발자뿐 아니라 일반 지식노동자가 업무를 맡길 수 있도록, 기존 Grok 챗봇 제품과 분리해 소규모 전담팀이 처음부터 새로 만든 AI 에이전트 제품이다. 핵심 설계는 클라우드에서 지속적으로 작동하는 봇과, 봇이 직접 쓰는 전용 컴퓨터 — 사용자 기기의 전원 상태와 무관하게 작동하며 API·MCP가 부족한 도구도 화면을 직접 조작해 쓸 수 있다. 첫 코드부터 내부 공개까지 약 한 달, 일반 공개까지 추가로 약 3주가 걸렸고, 초기 사용자 수백 명을 직접 온보딩하며 불필요한 UI를 걷어내는 데 집중했다.**

## 핵심 포인트

- **기존 제품과 분리된 신규 제품** — Grok Bot은 개발자용 기존 제품(예: Cursor 계열)이 아니라, ***소규모 전담팀이 일반 지식노동자를 겨냥해 처음부터 새로 만든*** 에이전트 제품이다.
- **핵심 설계 두 축** — ***클라우드에서 지속적으로 작동하는 봇***과 ***봇이 직접 쓰는 전용 컴퓨터***. 사용자 기기의 전원 상태와 무관하게 작동하고, API·MCP 연동이 부족한 도구도 화면을 직접 조작해 사용할 수 있다.
- **개발 타임라인** — 첫 코드부터 내부 공개(베타)까지 ***약 4주***, 일반 공개까지 추가로 ***약 3주*** 걸렸다. Roman Ugarte는 전 Cursor Growth 리드로, Cursor가 SpaceX에 인수되기 전 Cursor를 15명에서 1,000명 이상 규모로 성장시킨 이력이 있다.
- **초기 사용자 직접 온보딩** — Ugarte가 ***초기 사용자 200~300명을 약 2주에 걸쳐 직접 온보딩***하며 실제 업무 완료율과 사용성 문제를 관찰했다.
- **"Unshipping"에 집중** — 내부 베타와 공개 출시 사이, 오히려 ***기능을 제거***하는 데 집중했다 — 봇의 내부 사고 과정·저장된 기억을 디버깅용으로 노출하던 실험적 기능들을 걷어냈다. "출시 트윗에 설득력 있게 넣을 수 없는 기능이면 애초에 만들지 말아야 한다"는 자체 기준을 썼다고 알려짐(2차 인용, 정확한 원문 미확인).
- **AI 능력에 대한 인식 변화** — Ugarte는 ***"일의 100%를 해내는 AI는 90%까지만 해주는 AI와 범주적으로 다르게 느껴진다"***며 AI가 할 수 있는 일에 대한 기대치가 크게 바뀌었다고 밝혔다(본인 X 게시물로 확인).
- **비전은 챗봇이 아니라 동료** — 인터뷰 전체의 지향점은 "챗봇"이 아니라 ***진짜 AI 동료로 이뤄진 팀***이라는 제품 철학으로 정리된다.

## 인상 깊은 문장

> "An AI that does 100% of the job feels categorically different from one that gets you 90% there. I've significantly updated what I think AI is capable of."

*(Roman Ugarte 본인의 X 게시물에서 WebSearch로 직접 확인된 인용. 팟캐스트 발화 그 자체는 아니지만 같은 시기·같은 주제의 본인 발언이라 신뢰도가 높다고 판단.)*

## 댓글

**확인 불가.** `news.hada.io` 접근 차단으로 hada 댓글 수·GN⁺의 HN/Lobsters 큐레이션 여부를 확인하지 못했다. Lenny Rachitsky 본인이 X에 핵심 요약 스레드를 올린 것으로 미루어 콘텐츠 자체의 실재와 화제성은 교차 확인되지만, hada 쪽 반응은 이 세션에서 알 수 없다.

**읽을 때 감안**
- ① Roman Ugarte는 ***SpaceXAI 소속으로 자사 제품(Grok Bot)을 홍보하는 인터뷰***에 출연한 것이다 — 실패담·비용·이탈 사용자 이야기는 상대적으로 덜 다뤄졌을 가능성이 높다.
- ② Lenny's Podcast 자체도 스타트업·제품 성공 서사를 선호하는 매체라는 점, 그리고 이 노트가 참고한 2차 보도들(BigGo Finance, Summify 등) 역시 팟캐스트 내용을 재요약한 것이라 원문의 뉘앙스·반론이 얼마나 정확히 보존됐는지는 확인할 수 없다는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — 가든에 이미 있던 두 Grok Bot 노트의 "빠진 조각"을 채운다

[[2026-09-08-grok-bot-persistent-agent-design]]은 Grok Bot이 왜 "Bot 목록"을 제품 중심에 뒀는지(설계 원칙)를 다뤘고, [[2026-09-02-grok-bot-spacexai-engineering-org]]는 그 제품을 SpaceXAI·Cursor가 자사 엔지니어링 조직 운영에 실제로 써본 도그푸딩 결과(관리 가능한 동시 에이전트 수 15개→200개 이상)를 다뤘다. 이 노트는 그 사이를 채운다 — ***그 설계 원칙이 어떻게, 얼마나 빨리, 누구의 손으로 만들어졌는지*** 다. 셋을 나란히 읽으면 "설계 근거(9/8) → 제작 과정(이 노트) → 실전 도그푸딩 결과(9/2)"로 이어지는 제품 개발의 전체 궤적이 보인다. 다만 세 노트 모두 벤더(SpaceXAI/x.ai) 자신이나 그 협력사의 발표·인터뷰에 의존한다는 공통 한계도 그대로 이어진다 — 세 노트를 다 합쳐도 "실패·이탈·비용" 쪽 데이터는 여전히 비어 있다.

### 핵심 전이 2 — "기능을 걷어낸다"는 결정은 YAGNI의 제품판이다

[[2026-06-30-yagni-hidden-costs]]는 "추측 기반 구조화가 선택권과 시간 가치를 갉아먹는다"며 짓지 않아도 될 것을 미리 짓지 말라고 처방했다. Grok Bot 팀의 "unshipping"은 같은 원칙을 코드 구조가 아니라 제품 기능 자체에 적용한 사례다 — 이미 만든 기능(디버깅용 내부 사고 과정 노출)조차 "설명하기 어렵다"는 이유로 걷어냈다는 점에서, YAGNI보다 한 걸음 더 나아간 결정이다. 두 노트를 겹쳐 읽으면 "짓지 않는다"는 원칙이 설계 단계뿐 아니라 이미 만든 뒤에도 계속 적용돼야 한다는 시사점이 보인다.

## 호스피탈리티 / CRS 적용 포인트

**직접 제품 도입은 아니지만, 두 가지 원칙은 참고할 만하다.** ① ***"출시 문장으로 설득력 있게 설명 못하면 만들지 말라"***는 기준 — CRS 신규 기능(파트너 대시보드, AI 어시스턴트 등)을 만들 때도, "이 기능을 한 문장으로 왜 필요한지 설명할 수 있는가"를 사전 필터로 쓸 수 있다. ② ***초기 사용자를 소수라도 직접, 오래 온보딩하며 관찰한다***는 방식 — 200~300명을 2주에 걸쳐 직접 온보딩한 것처럼, CRS 신규 기능도 자동화된 온보딩 플로우 이전에 소수 파트너를 직접 관찰하는 단계를 거치면 실제 완료율·불편 지점을 더 정확히 잡을 수 있다.

## 연관 자료

- [[2026-09-08-grok-bot-persistent-agent-design]] — Grok Bot이 왜 이런 인터페이스로 설계됐는지, 이 노트가 다루는 "어떻게 만들어졌는가"의 설계 근거 쪽
- [[2026-09-02-grok-bot-spacexai-engineering-org]] — 같은 제품을 실제 엔지니어링 조직 운영에 도그푸딩한 결과, 이 노트의 후속편
- [[2026-06-30-yagni-hidden-costs]] — "짓지 않는다"는 같은 원칙을 코드 구조가 아니라 제품 기능에 적용한 "unshipping"과의 비교

## 한 달 뒤 회고

*(2026-10-18 즈음 — `youtube.com`·`lennysnewsletter.com` 접근이 풀렸다면 팟캐스트를 직접 듣고 이 노트의 타임라인·인용문을 검증. Grok Bot의 사용자 수·완료율 등 후속 공개 지표가 나왔는지, "unshipping" 접근이 다른 AI 에이전트 제품에도 확산되는 정황이 있는지 점검.)*
