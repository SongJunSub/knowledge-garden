---
title: "Firefox iOS, 확장 없이 브라우저 내장 광고 차단 정식 도입 — iOS의 확장 생태계 부재가 오히려 네이티브 차단을 낳다"
source_title: "Reduce clutter and distractions with Ad Blocker for Firefox on iOS"
source_url: "https://blog.mozilla.org/en/firefox/ad-blocker-on-ios/"
source_name: "The Mozilla Blog · MacRumors/Neowin/gHacks/Thurrott/The Register 등 교차검증"
referrer_url: "https://news.hada.io/topic?id=33136"
published_at: "2026-09-01 (매체마다 표기가 갈림)"
summarized_at: "2026-09-02"
category: "frontend"
tags: ["firefox", "ios", "adblock", "webkit", "content-blocker", "easylist", "browser-extensions", "mobile", "enhanced-tracking-protection"]
---

# Firefox iOS, 확장 없이 브라우저 내장 광고 차단 정식 도입

> 출처: [Reduce clutter and distractions with Ad Blocker for Firefox on iOS](https://blog.mozilla.org/en/firefox/ad-blocker-on-ios/) (Mozilla 공식 블로그, GeekNews 경유) · 정리일 2026-09-02

## 한 줄 요약

**iOS Firefox에 별도 확장 없이 켜고 끄는 내장 Ad Blocker가 생겼다** — Apple의 WebKit Content Blocker API와 EasyList 필터를 써서 서드파티 광고·트래커를 로드 전에 차단하지만, 사이트 자체 광고·검색결과 광고·Firefox 자신의 후원 콘텐츠는 건드리지 않는다.

## 핵심 포인트

- **활성화 경로**: Settings > Browsing > Ad Blocker. 기본값은 **비활성화(OFF)**.
- **기술 기반**: Apple의 **WebKit Content Blocker** 콘텐츠 차단 API + **EasyList** 필터 리스트.
- **iOS가 특별한 이유**: iOS는 Apple 정책상 모든 브라우저가 WebKit 렌더링 엔진을 강제로 써야 하고, **확장 프로그램을 설치할 방법 자체가 없다**. 그래서 Mozilla는 확장이 아니라 브라우저 자체에 차단 기능을 박아넣는 선택을 했다.
- **차단 예외 3가지**: ① 방문 사이트가 직접 제공하는 광고, ② 검색 결과 광고, ③ Firefox 새 탭의 Sponsored shortcuts.
- **기존 기능과의 관계**: 기존 Enhanced Tracking Protection을 대체하지 않고 함께 작동한다.
- **비판적 시선**: The Register는 이 기능을 ***"Firefox helps iPhone users bypass ads on web sites while making money showing its own ads"***라는 제목으로 다뤘다.

## 인상 깊은 문장

> "Firefox helps iPhone users bypass ads on web sites while making money showing its own ads" — The Register 기사 제목(WebSearch로 확인한 실제 헤드라인)

## 댓글

- **GeekNews(hada) 댓글**: news.hada.io 접속이 차단되어 댓글 수·내용 확인 불가.
- **HN**: 관련 스레드가 최소 2개 존재하는 것으로 검색됨(실험 단계 보도, 정식 발표). 둘 다 원문 열람은 못 했고, uBlock Origin 완전판을 계속 돌릴 수 있는 유일한 메이저 브라우저가 Firefox라는 취지의 댓글 하나만 재구성으로 확인.
- **출처 한계 정직 고지**: news.hada.io, blog.mozilla.org 등 시도한 1차 소스가 전부 egress 프록시에 차단됐다. 이 노트는 WebSearch가 반환한 교차 요약을 짜맞춘 것으로, 정확한 게시일·버전 번호·수치는 재구성된 값이라 오차 가능성이 있다.

## 내 생각 · 적용점

- **핵심 전이 ①**: [[2026-06-08-chrome-mv3-end-of-adblockers]]와 정확히 반대 방향의 사례다. 그 노트의 핵심은 "광고 회사가 만든 브라우저(Chrome)에 광고 차단을 의존하는 통제권 역설"이었는데, 여기는 **비영리 재단이 만든 브라우저(Firefox)가 오히려 플랫폼 제약(iOS의 확장 부재)을 자체 기능으로 메워 사용자 편의를 확대**한 경우다.
- **핵심 전이 ②**: [[2026-09-01-chrome-web-store-removes-mv2-extensions]]는 Chrome이 확장 기반 광고 차단의 배포 경로 자체를 없앤 시점의 기록이다. 거의 같은 시기에 Firefox iOS는 "애초에 확장이 없던 플랫폼에서 확장 없이 되는 길"을 보여줘, 확장 의존 구조 자체가 취약점이라는 걸 반대 방향에서 재확인시켜준다.
- 일반화하면: **플랫폼이 확장성을 제한하거나 회수할 수 있는 구조에서는, 핵심 기능을 확장이 아니라 코어에 내장하는 쪽이 더 견고하다**는 원칙.

## 호스피탈리티 / CRS 적용 포인트

온다 맥락에 광고 차단 자체는 직접 적용점이 거의 없다. 다만 **파트너/벤더 플랫폼(OTA API, PMS 웹훅, 채널 매니저)이 확장·커스터마이징 경로를 제한하거나 언제든 회수할 수 있다면, 그 경로에 의존하는 핵심 기능은 우리 쪽 코어(자체 미들웨어·폴백 로직)에 내장해두는 편이 안전하다**는 정도가 전이 가능한 원칙이다.

## 연관 자료

- [[2026-06-08-chrome-mv3-end-of-adblockers]] — 같은 "브라우저 벤더 vs 광고 차단" 주제의 거울상. Chrome은 이해관계 충돌로 회수, Firefox는 비영리라 오히려 확대.
- [[2026-09-01-chrome-web-store-removes-mv2-extensions]] — 거의 같은 시기, 반대 플랫폼(Chrome)에서 확장 기반 차단의 배포 경로가 막힌 사건.
- [[2026-08-27-firefox-jpeg-xl-default-support]] — 같은 시즌 Firefox가 연이어 내놓은 사용자 편의/표준 기능.

## 한 달 뒤 회고

- 2026-10월 초 즈음, GeekNews/hada 접속이 풀렸으면 원문 댓글 수와 실제 반응을 다시 확인해 이 노트의 "출처 한계" 상태를 갱신한다.
- Chrome의 MV2 확장 완전 삭제 이후 iOS Firefox의 사용자 유입이 실제로 늘었는지 점검.
