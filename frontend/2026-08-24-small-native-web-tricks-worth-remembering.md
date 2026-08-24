---
title: "기억해 둘 만한 작은 네이티브 웹 기법 (HTMLcat) — 목록이 아니라 세 번째 칸이 핵심이다. 기능·예제 옆에 '캐비어트'를 박아 넣었고, dialog·popover·inert 목록은 don't-roll-your-own 원칙이 구체적 대체재로 도착한 것이다"
source_title: "Small, native web tricks worth remembering"
source_url: "https://htmlcat.net/"
source_name: "HTMLcat (htmlcat.net)"
referrer_url: "https://news.hada.io/topic?id=32793"
summarized_at: "2026-08-24"
category: "frontend"
tags: ["css", "html", "web-platform", "dialog", "popover", "has-selector", "scope", "container-query", "dont-roll-your-own", "resource"]
---

# 기억해 둘 만한 작은 네이티브 웹 기법 (HTMLcat)

> 출처: [Small, native web tricks worth remembering](https://htmlcat.net/) (HTMLcat · GeekNews 경유) · 정리일 2026-08-24
> **성격**: **가벼운 자료**다. 단일 글이 아니라 계속 갱신되는 컬렉션형 레퍼런스 사이트라 **단일 발행일이 없다.** 짧게 남기되 **형식에서 읽히는 것**만 적는다.
> **출처 한계(정직하게 밝힘)**: **news.hada.io 와 htmlcat.net 둘 다 이 환경의 아웃바운드 프록시에 차단**돼 직접 fetch 하지 못했다. Hacker News 스레드 역시 마찬가지다. 아래 내용은 **WebSearch 스니펫과 이를 다룬 2차 매체(Boing Boing, Lobsters, HN 검색 결과)를 교차 확인**해 재구성했다 — **hada 댓글 수는 확인 불가.** 인상 깊은 문장도 원문 페이지를 직접 읽고 뽑은 게 아니라 **검색 결과에 반복 등장한 표현**을 인용으로 남긴다.

## 한 줄 요약

**HTMLcat 은 "리스트 사이트"가 아니라 형식이 곧 주장인 사이트다. `:has()`·`@scope`·컨테이너 쿼리처럼 컴포넌트 구조를 단순하게 만드는 CSS, `dialog`·Popover·`inert`처럼 JS로 직접 만들던 UI를 대체하는 네이티브 기능, `clamp()`·`text-wrap`·`color-mix()`·`light-dark()`처럼 반응형 크기·줄바꿈·색상을 미디어 쿼리 없이 푸는 패턴, 그리고 `Intl.NumberFormat`으로 가격을 지역화하는 것까지 다룬다. 그런데 항목 하나하나보다 값진 건 형식이다. 사이트 소개에 따르면 각 카드("post-it")는 기능 하나에 작은 예제 하나, 그리고 *"the caveat that matters"(중요한 주의사항 하나)*를 짝지어 놓는다 — 확인 가능한 예로 `corner-shape` 카드는 "border-radius 없이는 효과가 없고, 미지원 브라우저는 그냥 기존 둥근 모서리를 유지한다"는 한계를 함께 적어 놓는다. "이런 게 있다"만 나열하는 흔한 치트시트와 갈리는 지점이 거기다.**

## 핵심 포인트

- **사이트 정체**: **HTMLcat**(`htmlcat.net`). 자기소개 문구는 *"Compact notes on HTML, CSS, and JavaScript"*, 카피는 *"Back to Basics"*. HTML Day 2026(2026-08-08) 즈음 화제가 됐다.
- **형식이 핵심**: 각 항목("post-it")은 *"pairs one useful platform feature with a small example and the caveat that matters"* — **기능 + 예제 + 캐비어트**의 3칸 구조. 확인된 사례: `corner-shape` 카드 — border-radius 전제, 미지원 브라우저는 평범한 둥근 모서리로 열화(graceful degradation).
- **CSS 구조화 축**(Slack 요약): **`:has()`**, **`@scope`**, **컨테이너 쿼리** — 컴포넌트 경계를 CSS 만으로 긋는 기능들.
- **JS 대체 축**(Slack 요약): **`<dialog>`**, **Popover API**, **`inert`** — 모달·팝오버·배경 비활성화처럼 이전엔 라이브러리나 직접 구현이 필요했던 UI 상호작용.
- **반응형/색상 축**(Slack 요약): **`clamp()`**, **`text-wrap`**, **`color-mix()`**, **`light-dark()`** — 미디어 쿼리나 별도 계산 없이 크기·줄바꿈·색을 CSS 안에서 해결.
- **URL 로 직접 확인한 항목들**: `corner-shape`(모서리 도형), `customizing-native-form-control-colors`(`accent-color`), `apply-opacity-to-css-variables-with-color-mix`(`color-mix()`로 CSS 변수에 투명도 적용), `localized-pricing-with-intl-numberformat`(**`Intl.NumberFormat` 으로 가격 지역화** — Slack 요약에서 잘려 있던 "Intl…" 이 이것으로 확인됨), `tel-and-mail-links`(`tel:`/`mailto:` 링크), `text-wrap`.
- **HN 댓글(검색 스니펫 기준, 원문 대조 못함)**: Firefox 가 **자동 크기 조절 textarea**(`field-sizing: content`)를 구현했다는 언급과 함께 *"또 하나의 JS shim 을 공중으로 날려 보낼 수 있게 됐다"*는 취지의 댓글이 있었다 — 리스트에 없던 기능을 댓글이 보탠 사례.
- **2차 확산**: Boing Boing(2026-08-21), Lobsters(2026-08-21), Hacker News에서 함께 다뤄졌다.

## 인상 깊은 문장

> *"Compact notes on HTML, CSS, and JavaScript"* / *"Back to Basics"*
> 사이트 자기소개. **"기본으로 돌아가라"가 태그라인**이라는 것 자체가 이번 시즌 가든의 "기본기 회귀" 흐름과 정확히 겹친다.

> *"…pairs one useful platform feature with a small example and the caveat that matters."*
> **이 한 문장이 사이트 전체의 설계 원칙**이다 (→ 전이 1).

## 댓글

**hada 댓글 수 확인 불가**(news.hada.io 직접 접근 차단). HN·Lobsters 큐레이션은 **존재를 확인**했지만 **본문을 직접 읽지 못해 논조를 온전히 옮기지 못한다.**

**읽을 때 감안**
- ①**리소스 사이트다.** 주장이 아니라 목록이라 **핵심 전이도 가볍게 잡는다** — 억지 연결 금지 원칙대로.
- ②**출처 접근이 이례적으로 나빴다.** GeekNews·원문·HN 세 곳 다 이 환경에서 직접 fetch 가 막혀 **WebSearch 스니펫으로 재구성**했다. 인용문과 "확인된 항목" 목록은 신뢰하되, **전체 post-it 목록·정확한 캐비어트 문구·hada 댓글 논조는 이 노트에 없다.**
- ③**HTML Day 2026 화제성과 사이트 자체는 구분해야 한다.** 행사 시기에 맞춰 확산됐다는 것과 사이트의 정보 정확도는 별개다.

## 내 생각 · 적용점

### 핵심 전이 1: "캐비어트를 같이 적는다"는 형식이 don't-roll-your-own 원칙의 실행판이다

**[[2026-05-21-susam-dont-roll-your-own-web-ui]]가 "검증되지 않은 자체 구현보다 브라우저 기본 동작을 살리라"는 원칙**을 세웠다. **HTMLcat 의 JS 대체 축(`dialog`·Popover·`inert`)이 그 원칙의 구체적 대체 목록**이다. 모달을 직접 만들지 말고 `<dialog>` 를 쓰라는 게 산문으로 주장된 걸, HTMLcat 은 예제 코드로 준 것이다.

그런데 **더 값진 건 세 번째 칸(캐비어트)이다.** [[2026-08-20-how-ikea-names-products]]가 세운 결론 하나가 *"검토했다는 말은 범위 안에서 검토했다는 뜻"*이었다. HTMLcat 이 "이 기능을 써라"만 말하지 않고 **"단, 이 한계 안에서"를 매 항목에 강제로 붙인 게 그 원칙의 사이트 설계판**이다. `corner-shape` 카드가 "border-radius 없이는 효과 없음, 미지원 브라우저는 열화"를 명시하는 게 예다. **한계 없는 추천은 광고이고, 한계 있는 추천이라야 레퍼런스다.**

### 핵심 전이 2: state-of-css 가 "얼마나 쓰이나"를 쟀다면 여기는 "어떻게 쓰나"다

**[[2026-08-14-state-of-css-2026]]에서 `:has()` 채택률 83.7%, CSS Nesting 70.6%, "프레임워크 없음"이 Bootstrap 을 제쳤다는 걸 확인했다.** 그 노트가 세운 결론이 *"JavaScript 가 하던 일을 이제 CSS 가 할 수 있다"*([[2026-07-20-what-happened-to-the-frontend]]와 같은 문장)였는데, **HTMLcat 은 그 결론의 실행 매뉴얼 쪽**이다. 설문이 "이미 주류"라고 잰 기능(`:has()`)과 설문이 다루지 않은 최신 기능(`@scope`, Popover API, `inert`)이 **같은 카드 형식 안에 나란히** 있다 — 데이터가 확인한 것과 아직 확인 안 된 것이 형식적으로 구분되지 않는다는 게, 도입 판단에는 오히려 **state-of-css 쪽 채택률 수치를 따로 대조해야 한다**는 뜻이기도 하다.

### 핵심 전이 3(짧게): 사이트 자체가 이 노트의 출처 한계를 예증한다

**아이러니한데 정직하게 적는다.** 이 노트를 쓰면서 **GeekNews·htmlcat.net·HN 세 출처 모두 직접 fetch 가 막혔다.** [[2026-08-20-how-ikea-names-products]]에서 세운 **"검증은 항상 유한한 범위에서 이뤄지고, 범위 밖은 사고로 발견된다"**는 원칙이, 이번엔 **자료 자체가 아니라 내 조사 과정**에서 그대로 재현됐다. **그래서 이 노트는 "리스트를 옮겨 적은 노트"가 아니라 "확인된 것과 확인 못 한 것을 가른 노트"로 남긴다** — 그게 곧 HTMLcat 이 하는 일(기능 + 캐비어트)과 같은 태도다.

## 호스피탈리티 / CRS 적용 포인트

**온다 B2B CRS 대시보드·예약 UI 관점에서 라이브러리 의존을 줄일 수 있는 구체 지점을 검토한다.**

- **모달/다이얼로그** — 예약 상세·확인 팝업에 별도 모달 라이브러리 대신 **네이티브 `<dialog>` + `::backdrop`**. `showModal()` 로 열면 배경이 자동으로 `inert` 처리돼 **포커스 트랩·배경 상호작용 차단 로직을 직접 짤 필요가 없다.** [[2026-05-21-susam-dont-roll-your-own-web-ui]]가 이미 CRS 적용 후보로 짚었던 지점과 같은 방향.
- **드롭다운·툴팁·컨텍스트 메뉴** — Popover API(`popover` 속성)는 **light-dismiss(바깥 클릭 시 자동 닫힘)를 브라우저가 처리**한다. 다만 위치 계산(뷰포트 충돌 회피) 라이브러리까지 대체하진 못하므로 **완전 대체가 아니라 부분 대체**로 접근해야 정확하다.
- **대시보드 위젯 반응형** — 컨테이너 쿼리로 **위젯이 배치된 컬럼 폭 기준 스타일링**이 가능해져, 리사이즈 옵저버 기반 JS 로직을 줄일 여지가 있다. state-of-css 노트에서 확인한 채택률(관련 기능 70~80%대)을 근거로 **신규 화면에서 우선 검토할 명분은 있다.** 단 실제 도입은 **온다 파트너사 관리자 화면의 실제 브라우저 접속 분포를 먼저 확인**하고 판단한다.
- **다국어/다통화 가격 표시** — CRS 예약 화면은 통화·소수점 표기가 국가마다 다르다. `Intl.NumberFormat` 으로 직접 포맷팅하면 **별도 포맷팅 라이브러리 의존을 줄일 여지**가 있다. 이건 이 사이트에서 URL 로 직접 확인한 항목이라 다른 항목보다 신뢰도가 높다.
- **다크모드** — 대시보드에 다크모드를 도입한다면 `light-dark()` 로 **테마별 미디어 쿼리 분기를 줄일 수 있다.**
- **정직한 한계**: 이 항목들 전부 **브라우저 지원 폭과 접근성 세부 동작(포커스 순서, 스크린 리더 announce 등)을 실기기로 검증하기 전까지는 제안일 뿐**이다. HTMLcat 형식 자체가 강제하는 태도(기능 + 캐비어트)를 그대로 여기에도 적용한다.

## 연관 자료
- [[2026-05-21-susam-dont-roll-your-own-web-ui]] — "자체 구현 대신 브라우저 기본"이라는 원칙의 산문판. HTMLcat 의 JS 대체 축(dialog·Popover·inert)이 이 원칙의 구체적 목록이다
- [[2026-08-14-state-of-css-2026]] — `:has()` 83.7%·Nesting 70.6% 등 "얼마나 쓰이나"의 데이터. HTMLcat 은 같은 기능들의 "어떻게 쓰나" 레시피
- [[2026-07-20-what-happened-to-the-frontend]] — "2026년 최전선은 웹 플랫폼 활용"이라는 결론과 이 사이트의 존재 이유가 같은 방향
- [[2026-05-17-jvns-moving-away-from-tailwind]] — 프레임워크·라이브러리 의존을 줄이는 흐름의 n=1 사례. "기본기 회귀"의 같은 계열
- [[2026-08-20-how-ikea-names-products]] — "검증은 항상 유한한 범위에서 이뤄진다"는 원칙이 이번엔 이 노트의 조사 과정 자체에서 재현됐다

## 한 달 뒤 회고
*(2026-09-24 즈음: ①news.hada.io·htmlcat.net 이 이 환경에서 접근 가능해졌다면 원문 대조로 이 노트의 인용·목록을 보정 ②온다 신규 대시보드 화면에서 `<dialog>`·컨테이너 쿼리·`Intl.NumberFormat` 중 실제로 도입한 게 있는지 ③Popover API 로 만든 드롭다운이 위치 계산 라이브러리를 실제로 대체 가능했는지 실기기 검증 결과)*
