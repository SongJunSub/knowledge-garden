---
title: "htmx 4.0 출시 (htmx) — 암묵적이던 것을 명시적으로: XHR을 fetch()로 바꿔 스트리밍·모프 스왑까지 흡수하면서도 14KB를 지켰다"
source_title: "htmx 4.0.0 has been released!"
source_url: "https://four.htmx.org/announcements/2026-08-28-htmx-4.0.0-is-released"
source_name: "htmx 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=32993"
published_at: "2026-08-28"
summarized_at: "2026-08-29"
category: "frontend"
tags: ["htmx", "hypermedia", "웹 플랫폼", "fetch API", "HTML 스트리밍", "서버사이드 렌더링"]
---

# htmx 4.0 출시 - HTML 스트리밍과 화면 갱신 강화, 암묵적 동작은 명시적으로

> 출처: [htmx 4.0.0 has been released!](https://four.htmx.org/announcements/2026-08-28-htmx-4.0.0-is-released) (htmx 공식 블로그) · 정리일 2026-08-29
> **출처 한계**: `news.hada.io`와 `four.htmx.org` 모두 이 세션에서 egress 차단되어 WebFetch 불가. 아래 내용은 Slack 발췌와 WebSearch 스니펫(InfoWorld·daily.dev·Medium·blog.setec.rs 등 2차 매체가 거의 같은 시점에 다룬 내용의 교차검증) 재구성이다 — htmx 공식 문서·CHANGELOG 원문을 직접 대조하지는 못했고, hada·HN 댓글의 정확한 수치도 확인하지 못했다.

## 한 줄 요약
**htmx 4.0은 내부 통신을 XMLHttpRequest에서 fetch()/ReadableStream으로 전면 교체해 SSE·WebSocket·multipart 방식의 HTML 스트리밍과 모프 스왑을 기본 기능으로 흡수하면서, 동시에 속성 상속처럼 "암묵적으로 걸리던" 동작들은 명시적 표기(`:inherited`)로 바꿔 마법을 줄이는 방향으로 갔다** — 스크립트 용량은 여전히 14KB 선을 지킨다.

## 핵심 포인트
- **XHR → fetch() 전환**: htmx 2.x는 1990년대 후반 IE에 뿌리를 둔 XMLHttpRequest를 썼는데, XHR은 응답 전체를 버퍼링한 뒤에야 스왑할 수 있었다. 4.0은 fetch()의 ReadableStream을 써서 HTML 조각이 도착하는 대로 처리·주입할 수 있게 됐고, 이 구조 변경 하나로 "스트리밍 UI"가 14KB짜리 스크립트만으로 가능해졌다(InfoWorld·Medium 교차검증).
- **HTML 스트리밍**: 이 fetch 기반 인프라 위에서 SSE·WebSocket·multipart 방식의 HTML 스트리밍을 지원 — 서버가 순차적으로 밀어주는 여러 HTML 청크를 htmx가 그대로 받아 화면에 반영한다.
- **모프 스왑 기본 내장**: idiomorph(Hotwired의 Morphdom에서 발전한 방식)로 두 HTML 문서를 비교해 최소 변경분만 갱신하는 모프 스왑이 별도 확장 설치 없이 기본으로 딸려온다.
- **`<hx-partial>` 신설**: 기존 OOB(out-of-band) 스왑의 대체재. 자기 자신에 `hx-target`·`hx-swap` 등 표준 htmx 옵션을 그대로 걸 수 있어, 한 응답 안에서 화면의 여러 영역을 각각 다른 방식으로 갱신하는 패턴이 OOB보다 명확해진다.
- **암묵적 → 명시적 상속**: 2.x에서는 부모 요소의 속성(예: `hx-confirm`)이 자동으로 자식에 상속됐지만, 4.0에서는 `hx-confirm:inherited`처럼 `:inherited`를 명시해야 상속된다 — "왜 이 동작이 여기 걸렸는지" 코드만 보고 추적할 수 있게 된 대신, 마이그레이션 시 상속을 다시 명시해줘야 하는 속성들이 생긴다.
- **뒤로 가기 복원 방식 변경**: 2.x는 로컬 캐시 스냅샷으로 히스토리 내비게이션을 처리했는데, 4.0은 서버에 다시 요청해 전체 페이지를 받아 복원하는 방식으로 바뀌었다(로컬 캐시가 필요하면 `hx-history-cache` 확장으로 되돌릴 수 있다). 이벤트 이름 체계도 함께 표준화·정리됐다.
- **htmx 2 지원 정책**: 2.x는 계속 npm `latest` 태그를 유지하며 보안 패치를 받고, 4.0 라인은 2027년 초까지 `next` 태그로 병행된다 — htmx 팀 스스로도 "2.x와 4.x의 실제 동작 차이는 상대적으로 작다"고 설명한다(InfoWorld 교차검증). 즉 강제 이전이 아니라 옵션의 확장이다.

## 인상 깊은 문장
> "in short, the use of Fetch is a refactor that should net both more power and less complexity." (htmx 팀, four.htmx.org 발표문 — WebSearch로 확인)

Slack 발췌의 표어 ***"암묵적 동작은 명시적으로"***가 상속 규칙(`:inherited`) 하나에 정확히 들어맞는다 — 이번 릴리스 전체를 관통하는 태도가 이 한 줄에 압축돼 있다.

## 댓글
- **hada 댓글 수 미확인** — `news.hada.io`가 이 세션에서 egress 차단되어 페이지를 열지 못했다.
- 이 릴리스는 InfoWorld·daily.dev·Medium(복수 저자)·blog.setec.rs·Azalio 등 여러 2차 매체가 거의 동시에 다뤘다는 점에서 실제 주목도가 있는 릴리스임을 시사하지만, 특정 HN/Lobsters 스레드를 이번 조사에서 확정하지는 못했다(존재 여부 자체를 확인 못함 — Orbify·GUI 키보드 글과 달리 이번엔 HN 스레드 ID를 특정하지 못했다).
- n=1 주의 없음(릴리스 노트 성격의 글이라 개인 경험담이 아님)이지만, 이번 노트는 htmx 공식 발표문을 직접 읽지 못하고 2차 매체 교차검증으로 재구성했다는 한계는 위에 명시한 그대로다.

## 내 생각 · 적용점
세 개의 핵심 전이가 있다.

1. [[2026-07-20-what-happened-to-the-frontend]]가 그린 "각 레이어의 해결책이 다음 레이어의 문제를 낳으며 8단계로 쌓였고, 44미터를 파내려가 도착한 최전선은 '서버 HTML·최소 JS'"라는 서사의 최신 증거로 이 릴리스를 놓을 수 있다 — SPA의 실시간성(스트리밍, 부분 갱신)을 클라이언트 프레임워크 없이 htmx가 흡수한 것은, "결국 20년 전 현관으로 돌아왔다"는 그 글의 주장을 한 단계 더 구체화한다.
2. [[2026-05-21-susam-dont-roll-your-own-web-ui]]의 "직접 만들지 말라" 원칙과도 맞닿는다 — 그동안 개발자들이 각자 손으로 짜맞추던 OOB 스왑 패턴을 `<hx-partial>`이라는 표준 태그로 흡수한 것은, "관용구가 프레임워크의 1급 기능으로 승격"되는 전형적인 성숙 신호다.
3. [[2026-08-24-small-native-web-tricks-worth-remembering]]에서 짚었던 "캐비어트를 코드 옆에 박아 넣는" 정직성과, htmx의 암묵적 상속 → 명시적 상속 전환은 같은 방향이다 — "왜 동작하는지 추적 가능해야 한다"는 원칙이 이번엔 프레임워크 설계 레벨로 올라왔다.

가볍게 하나 더: [[2026-07-12-your-app-could-have-been-a-webpage]]가 주장한 "매체는 콘텐츠를 따라야 하고, 앱의 유일한 차별점이 추적·광고라면 반기능"이라는 관점과 htmx의 "서버 HTML" 노선은 정신적으로 같은 진영에 서 있다 — 억지 연결까지는 아니지만, 이 노트의 핵심 전이만큼 깊지는 않다.

## 호스피탈리티 / CRS 적용 포인트
온다 CRS Admin·파트너 대시보드처럼 서버 상태를 자주 반영해야 하는 백오피스 화면에서, htmx 4의 SSE 기반 HTML 스트리밍 + 모프 스왑은 React/Vue 없이도 "실시간 갱신 UI"를 구현할 실질적 선택지가 된다 — 특히 예약 현황판·알림 피드처럼 서버가 주도하는 갱신이 많은 화면에 잘 맞는 패턴이다. 다만 이 노트는 릴리스 발표 자체를 다룬 것이라, 온다 스택에서 실제 htmx 채택 여부나 기존 React 자산 대비 전환 비용까지는 검증하지 못했다 — "검토해볼 가치가 있다" 수준의 코멘트이지 도입 근거는 아니다.

## 연관 자료
- [[2026-07-20-what-happened-to-the-frontend]] — "서버 HTML·최소 JS"로 회귀한다는 8단계 서사, htmx 4가 그 다음 단계의 구체적 증거.
- [[2026-05-21-susam-dont-roll-your-own-web-ui]] — "직접 만들지 말라" 원칙, `<hx-partial>`이 그 원칙의 프레임워크화.
- [[2026-08-24-small-native-web-tricks-worth-remembering]] — 캐비어트를 명시하는 정직성, 암묵→명시 상속 전환과 같은 축.
- [[2026-07-12-your-app-could-have-been-a-webpage]] — "매체는 콘텐츠를 따라야 한다"는 관점과 서버 HTML 노선이 느슨하게 같은 진영.

## 한 달 뒤 회고 (2026-09-29 즈음)
- `four.htmx.org` 접근이 가능해지면 공식 발표문·CHANGELOG 원문을 직접 대조해 이 노트의 세부(특히 이벤트 이름 표준화 목록, `hx-history-cache` 확장의 정확한 동작)를 보강.
- 실제 htmx 2 → 4 마이그레이션 사례가 나오는지, 온다 스택에 htmx 도입을 검토할 만한 화면(현황판·알림 피드 등)이 있는지 점검.
