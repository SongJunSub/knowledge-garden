---
title: "AI가 코드 거의 전부를 쓸 때, 소프트웨어 엔지니어링에는 무엇이 남는가 (Gergely Orosz, The Pragmatic Engineer) — 코드를 쓰는 능력이 아니라 무엇이 좋은지 알아보는 안목이 새 병목이 된다"
source_title: "When AI writes almost all code, what happens to software engineering?"
source_url: "https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what"
source_name: "The Pragmatic Engineer (Gergely Orosz)"
referrer_url: "https://news.hada.io/topic?id=34310"
published_at: "2026-01-06 최초 게시 (2026-09-24 페이월 해제 후 재유통)"
summarized_at: "2026-09-26"
category: "engineering"
tags: ["ai-coding", "software-engineering", "validation", "taste", "pragmatic-engineer", "gergely-orosz", "37signals", "dhh"]
---

# AI가 코드 거의 전부를 쓸 때, 소프트웨어 엔지니어링에는 무엇이 남는가 (Gergely Orosz)

> 출처: [When AI writes almost all code, what happens to software engineering?](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what) (Gergely Orosz · The Pragmatic Engineer) · GeekNews 경유(https://news.hada.io/topic?id=34310) · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io`가 이 세션에서 egress 차단돼 GeekNews 원문(한글 발췌·hada 댓글)을 직접 열람하지 못했다. `newsletter.pragmaticengineer.com` 원문도 동일하게 차단돼, WebSearch가 반환한 다수의 인용·요약 스니펫(원 뉴스레터, 이를 재인용한 beSpacific·dev.to·cummulative.io 등)을 교차확인해 재구성했다. 이 글은 2026년 1월 6일 유료 구독자 대상으로 처음 게시됐다가, 2026년 9월 24일 DHH의 Rails World 2026 기조연설("연필을 내려놓는다")이 화제가 된 직후 저자가 페이월을 해제하고 다시 유통시킨 것으로 확인된다 — 즉 이번 GeekNews 노출은 신작이 아니라 **8개월 전 글을 시의적절한 순간에 재유통시킨 것**이다.

## 한 줄 요약

**Gergely Orosz는 AI가 코드 대부분을 작성하는 세계에서도 소프트웨어 엔지니어링은 사라지지 않고, 다만 무게중심이 "코드를 직접 타이핑하는 능력"에서 "무엇을 만들지 정의하고, 그 결과를 검증하고, 언제 충분히 좋은지 판단하는 안목(taste)"으로 옮겨간다고 주장한다 — 그리고 이 재유통 타이밍 자체가 DHH의 "연필을 내려놓는다" 선언에 올라탄 것이다.**

## 핵심 포인트

- **역할 이동의 핵심 축 — 타이핑에서 검증으로** — 저자는 ***"소프트웨어 엔지니어링의 미래는 AI와 타이핑 속도로 경쟁하는 게 아니라, 문제를 이해하고 시스템을 설계하고 결정을 검증하는 데 더 능숙해지는 것"***이라고 정리한다. 리뷰의 대상이 소스 코드 자체가 아니라 **행동**(기대한 대로 동작하는가, 성능·보안·컴플라이언스 기준을 지키는가)으로 옮겨간다는 것.
- **"안목(taste)"이 남는 자리** — 문제를 분해하고, 무엇을 만들지 결정하고, 테스트 가능성·신뢰성을 고려해 설계하고, 언제 출시할 만큼 충분히 좋은지 아는 것 — ***"그게 바로 안목이고, 결국 가장 중요한 부분으로 드러난다"***는 게 이 글이 여러 매체에 걸쳐 가장 자주 인용되는 문장이다.
- **검증과 리뷰가 병목이 된다** — AI는 대규모 리팩터링 등에서 여전히 실수하기 때문에 코드 검증의 중요성이 오히려 커진다. Stack Overflow 2025 개발자 설문에서 개발자의 66%가 ***"거의 맞지만 완전히는 아닌 코드"***를 AI 도구의 가장 큰 불만으로 꼽았다는 통계가 이 논지의 근거로 함께 인용된다 — "그럴듯해 보이는 코드"와 "실제로 맞는 코드" 사이의 간극이 버그가 숨는 자리이고, 테스트·리뷰가 그 간극을 메운다.
- **역할 재정의 — "아키텍트 + PM을 합친 존재"** — 일부 업계 인사의 견해를 인용해, 미래의 소프트웨어 엔지니어를 "아키텍트와 프로덕트 매니저를 합친 존재"로 그린다. AI가 과거 소프트웨어 아키텍트가 코더에게 배정하던 일을 대신 수행한다는 구도.
- **재유통 타이밍이 논지 자체를 증명한다** — 이 글은 원래 2026년 1월 게시됐지만, 2026-09-23 DHH의 Rails World 키노트에서 37signals가 "연필을 내려놓았다"고 선언한 직후(9/24) 저자가 페이월을 풀고 재유통했다. [[2026-09-25-dhh-rails-world-2026-keynote]]가 정리한 바로 그 사건이 이 글의 재부상 트리거였다.

## 인상 깊은 문장

> "When AI writes most code, software engineering becomes less about producing code and more about producing trustworthy software."

> "[Breaking down complex problems, deciding what to build, architecting for testability and reliability, knowing when something is good enough to ship —] that's taste, and it turns out it's the part that matters most."

## 댓글

**GeekNews(hada) 댓글 수 확인 불가** — 원문 페이지 egress 차단. 프랑스어 미러(`fr.news.hada.io/topic?id=34310`)를 WebSearch로 확인한 결과 이 정리 시점 기준 **댓글 0개**로 보인다(다만 이는 프랑스어 미러이고 한글 GeekNews 본문의 댓글 수와 일치한다는 보장은 없다). 원문(Substack형 뉴스레터)의 자체 댓글 수나 별도 HN 제출 스레드도 이번 세션에서 확정하지 못했다(검색 결과에 등장한 HN 아이템 ID 일부는 존재하지 않는 페이지로 확인됨). **정직성 노트**: 저자 Gergely Orosz는 유료 뉴스레터 운영자로서, 화제성 있는 순간(DHH 키노트 직후)에 맞춰 과거 글의 페이월을 해제하는 것은 구독 성장을 노린 콘텐츠 마케팅 성격도 있다는 점을 감안해야 한다 — 주장 자체의 타당성과는 별개로, "왜 하필 지금 이 글이 다시 화제인가"에는 우연이 아니라 의도가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 글이 올라탄 바로 그 사건이 가든에 이미 있다

[[2026-09-25-dhh-rails-world-2026-keynote]]는 DHH의 "연필을 내려놓는다" 선언을 정리하며 HN 반응이 헤드라인만큼 뜨겁지 않았다(40점·15댓글)는 것과, 이 선언이 1인 창업자 조직(37signals)의 n=1 경험이라는 한계를 짚었다. Orosz의 이 글은 정확히 같은 사건을 트리거 삼아 재유통됐지만, DHH처럼 "코딩이 끝났다"는 극단으로 가지 않고 **"검증·설계·안목이라는 다른 종류의 엔지니어링 노동이 남는다"**는 더 절제된 결론을 낸다 — 같은 촉발 사건에 대한 두 가지 다른 온도의 반응을 나란히 놓을 수 있다.

### 핵심 전이 2 — "LLM은 추론하지 않는다"는 기존 노트의 단호함과 정확히 만나는 지점

[[2026-08-17-software-engineering-fundamentals-matter-more]]에서 Joseph Heck은 에이전트 도구가 구현의 문턱을 낮췄을 뿐 "어떻게 조립되는가"가 모든 차이를 만들며, LLM은 추론하지 않고 예측한다고 단호히 말한다. Orosz의 "검증이 새로운 리뷰"라는 주장은 바로 이 단호함의 실무적 결과물이다 — **예측 기계가 만든 산출물이기 때문에 사람이 검증해야 한다**는 인과가, 두 글을 이으면 더 뚜렷해진다.

## 호스피탈리티 / CRS 적용 포인트

CRS/PMS 개발에서 AI 코딩 에이전트 비중이 늘어날수록, 이 글의 주장은 원칙 수준에서 바로 쓸 만하다 — **정산·요금·예약 상태 전이처럼 "그럴듯해 보이지만 틀릴 수 있는" 로직일수록, 코드 리뷰의 초점을 "문법이 맞는가"에서 "이 변경이 실제로 의도한 비즈니스 규칙을 지키는가(검증)"로 명시적으로 옮겨야 한다.** 다만 이 글 자체는 일반론 수준의 주장이라 온다 조직에 곧바로 적용할 구체적 프로세스까지 제공하지는 않는다 — "타이핑에서 검증으로 리뷰 기준을 재정의하라"는 원칙만 전이 가능하다.

## 연관 자료

- [[2026-09-25-dhh-rails-world-2026-keynote]] — 이 글의 재유통을 촉발한 바로 그 사건(DHH "연필을 내려놓는다"), 같은 촉발점에 대한 더 절제된 반응
- [[2026-08-17-software-engineering-fundamentals-matter-more]] — "LLM은 추론하지 않고 예측한다"는 단호함이, 이 글의 "검증이 새 병목" 주장의 근거를 채워줌
- [[2026-08-04-taste-judgment-and-ai]] — "안목"을 "판단"과 분리하는 Osmani의 논의, 이 글이 말하는 taste 개념과 같은 계열이지만 한 단계 더 세분화된 프레임

## 한 달 뒤 회고

*(2026-10-26 즈음 — 이 글이 재유통 이후 실제 HN/Lobsters 토론을 낳았는지, "안목·검증" 프레임이 이후 업계 담론에서 더 구체적인 실무 체크리스트로 발전했는지 확인.)*
