---
title: "Apple, iCloud+ '나의 이메일 가리기' 도메인 통합 계획을 두 달 만에 철회 — 같은 도메인을 쓰는 것 자체가 방어였다"
source_title: "Apple reverses planned Hide My Email domain change after user pushback"
source_url: "https://9to5mac.com/2026/08/24/apple-reverses-planned-hide-my-email-domain-change-after-user-pushback/"
source_name: "9to5Mac (외 MacRumors·AppleInsider·TechTimes·MacDailyNews 교차검증)"
referrer_url: "https://news.hada.io/topic?id=32873"
published_at: "2026-08-24"
summarized_at: "2026-08-26"
category: "engineering"
tags: ["apple", "privacy", "email", "icloud", "developer-experience"]
---

# Apple, iCloud+ '나의 이메일 가리기' 도메인 통합 계획을 두 달 만에 철회

> 출처: [Apple reverses planned Hide My Email domain change after user pushback](https://9to5mac.com/2026/08/24/apple-reverses-planned-hide-my-email-domain-change-after-user-pushback/) (9to5Mac 외 다수 매체) · 정리일 2026-08-26
> **출처 한계**: `news.hada.io`, `9to5mac.com`, `macrumors.com`, `appleinsider.com`, `techtimes.com`, `macdailynews.com`, `tech.yahoo.com`, `gadgetreview.com`, `gblock.app` 등 이 사안을 다룬 거의 모든 매체 도메인이 이 세션에서 egress 차단됐다. 예외적으로 **`developer.apple.com`은 fetch에 성공**했지만, 그 페이지는 **2026-06-15자 원래 통합 계획만 담고 있고 8월 24일 철회는 반영돼 있지 않았다**(사이트가 갱신되지 않았거나 별도 URL로 이전했을 가능성). 아래 "철회" 관련 내용은 **WebSearch로 9개 안팎의 매체 스니펫을 교차검증해 재구성**한 것이며, Apple 공식 발표 원문 전체를 직접 읽지는 못했다. Slack 발췌와 이 재구성 내용은 서로 일치한다.

## 한 줄 요약

**Apple은 2026년 6월, Sign in with Apple과 iCloud+ '나의 이메일 가리기'(Hide My Email)의 이메일 도메인을 `private.icloud.com`으로 통합하겠다고 발표했다가, 두 달 만인 8월 24일 이를 철회했다. Hide My Email 주소는 계속 `icloud.com`에 남고, `private.icloud.com`은 올해 말부터 새로 발급되는 Sign in with Apple 비공개 이메일에만 적용된다. 기존 `privaterelay.appleid.com` 주소는 중단 없이 계속 작동·전달된다. 철회의 이유가 핵심이다 — Hide My Email 주소가 일반 iCloud 계정과 같은 도메인을 쓰는 것 자체가 서비스 제공자의 도메인 기반 차단을 어렵게 만드는 방어막이었는데, 별도 도메인으로 분리되면 그 위장이 사라져 disposable 주소를 손쉽게 골라 차단할 수 있게 되는 부작용이 지적됐다.**

## 핵심 포인트

- **원래 계획 (2026-06-15 공지)** — 개발자 노트 원문: ***"Later this summer, Apple will unify the email domains used by Sign in with Apple and iCloud+ Hide My Email under a single, shared domain: private.icloud.com."*** 두 서비스 모두 새 도메인으로 이전할 예정이었다.
- **반발의 핵심 — 위장이 곧 방어였다** — Hide My Email 주소가 일반 `icloud.com` 이메일과 **구별 불가능한 도메인**을 공유한다는 사실 자체가, 서비스가 "disposable 주소"만 골라 도메인 단위로 차단하는 것을 실질적으로 막아왔다. `private.icloud.com`으로 분리되는 순간 그 구별 불가능성이 사라져, **가입 시 실제 이메일을 밝히지 않으려는 사용자의 프라이버시 기능을 플랫폼이 손쉽게 무력화**할 길이 열린다는 게 지적의 골자.
- **철회 후 실제 변경 사항** — Hide My Email은 `icloud.com` 유지. **Sign in with Apple의 새 비공개 이메일 주소만** 연내(2026년 말부터) `private.icloud.com`으로 발급.
- **하위 호환성** — 기존 `privaterelay.appleid.com` 주소는 중단 없이 계속 작동하며 이메일을 사용자에게 전달.
- **개발자 영향** — Apple 로그인을 쓰는 앱·웹사이트는 이메일 검증 로직과 도메인 허용 목록(allowlist)을 손봐야 한다. 전환기 동안은 **`private.icloud.com`과 `privaterelay.appleid.com`을 모두 허용**해야 신규·기존 사용자 양쪽이 막히지 않는다.
- **이례적인 대응 속도** — 발표 후 약 두 달 만에 커뮤니티 피드백을 반영해 계획을 뒤집은 것 자체가, 제품 결정을 잘 재검토하지 않는 것으로 알려진 Apple치고는 드문 행보로 여러 매체가 평했다.

## 인상 깊은 문장

> "Later this summer, Apple will unify the email domains used by Sign in with Apple and iCloud+ Hide My Email under a single, shared domain: private.icloud.com."
> (developer.apple.com 원문 — 지금은 철회된 계획이지만, 이 문장이 여전히 게시돼 있다는 사실 자체가 "출처 한계"에서 지적한 갱신 지연을 보여준다.)

> "Using the same domain for iCloud and Hide My Email makes it hard for services to block the disposable iCloud addresses because doing so would also block legitimate users."
> (WebSearch로 재구성한 논지 요약 — 원문 그대로의 인용은 아니지만, 여러 매체가 공통으로 짚은 철회 사유의 핵심을 담고 있다.)

## 댓글

**hada 댓글 수·논지는 확인하지 못했다** — `news.hada.io` 접근이 이 세션에서 차단됐다. GeekNews 경유 글(topic id 32873)이라는 것은 매니페스트로만 확인된다. 다수 매체가 같은 사실관계를 보도하고 있어 사실관계 자체의 신뢰도는 높지만, **1차 자료(Apple 공식 철회 발표 원문)를 직접 읽지 못했다는 한계**는 그대로 남는다.

## 내 생각 · 적용점

이 가든에 정확히 겹치는 과거 노트는 없다. 굳이 연결하자면 **[[2026-08-20-apple-eu-app-policy-changes]]**와 구조적으로 얕은 패턴이 겹친다 — 그 노트도 "Apple의 정책 발표 하나가 개발자 쪽에 컴플라이언스·로직 변경을 강제한다"는 점을 다뤘다(그쪽은 수수료 로직, 이쪽은 이메일 검증 로직). 다만 프라이버시 vs 수익모델이라는 주제 자체는 완전히 다르므로, **이건 "같은 발신자가 반복하는 패턴" 정도의 가벼운 전이지 진짜 논지의 연결은 아니다.**

이 글에서 더 눈여겨볼 원칙은 따로 있다: **프라이버시 기능의 실효성은 종종 "다르게 보이지 않는 것"에서 나온다.** 별도 도메인·별도 IP 대역·별도 헤더처럼 "구분을 명확히 하는" 설계는 관리 편의성 관점에서는 자연스러운 선택이지만, 익명화·프라이버시 기능에서는 그 구분 가능성 자체가 공격 표면(여기서는 "차단 표면")이 된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다가 자체적으로 이런 이메일 릴레이 서비스를 운영하지는 않는다. 다만 전이 가능한 원칙은 하나 있다: **Sign in with Apple을 지원하는 B2C 접점(고객용 예약 사이트 등)이 있다면, 이번처럼 도메인이 바뀌는 이벤트에 대비해 이메일 검증 로직의 허용 목록을 하드코딩이 아니라 설정값으로 분리해 두는 게 안전하다** — 공급자(여기선 Apple)의 도메인 정책은 예고 없이, 혹은 예고했다가 번복되며 바뀔 수 있다.

## 연관 자료

- [[2026-08-20-apple-eu-app-policy-changes]] — 같은 발신자(Apple)가 반복하는 "정책 발표 → 개발자 쪽 로직 갱신 강제" 패턴의 다른 사례(주제는 수수료로 무관하지만 패턴만 가볍게 겹친다).

## 한 달 뒤 회고

- 2026-09-26 즈음: `developer.apple.com` 공지 페이지가 철회 내용을 반영해 갱신됐는지 확인.
- Sign in with Apple의 `private.icloud.com` 전환이 실제로 언제(연내 몇 월) 시작되는지 확정 일정 확인.
- news.hada.io 접근이 가능해지면 hada 댓글의 실제 논지(개발자 반응 vs 프라이버시 옹호자 반응 비중 등)를 보강.
