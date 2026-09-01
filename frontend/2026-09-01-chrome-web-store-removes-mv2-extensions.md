---
title: "Google, Chrome 웹 스토어에서 uBlock Origin 등 모든 MV2 확장 프로그램 삭제 — 새로 막은 게 아니라 검색·재설치 경로 자체를 없앤 것"
source_title: "Chrome users are losing their best ad-blocker"
source_url: "https://www.androidauthority.com/chrome-manifest-v2-extensions-removed-3678445/"
source_name: "Android Authority (교차 확인: gHacks, PCWorld, TechRadar, Aroged)"
referrer_url: "https://news.hada.io/topic?id=33086"
published_at: "2026-09-01 (또는 2026-08-31 — 매체마다 게시일 표기가 하루 갈림, 정확한 시각 확인 불가)"
summarized_at: "2026-09-01"
category: "frontend"
tags: ["chrome", "manifest-v2", "manifest-v3", "ublock-origin", "browser-extensions", "platform-power", "web-platform"]
---

# Google, Chrome 웹 스토어에서 uBlock Origin 등 모든 MV2 확장 프로그램 삭제

> 출처: [Chrome users are losing their best ad-blocker](https://www.androidauthority.com/chrome-manifest-v2-extensions-removed-3678445/) (Android Authority 등) · 정리일 2026-09-01
> **출처 한계**: `news.hada.io`·`androidauthority.com`이 이 세션 내내 egress 차단되어 원문을 직접 읽지 못했다. Slack 발췌와 WebSearch로 확보한 복수 매체(Android Authority, gHacks, PCWorld, TechRadar, Aroged, Digital Trends)의 2차 요약을 교차 대조했다. 이번 삭제 조치 전용 HN 스레드는 검색으로 특정하지 못했다 — 찾은 HN 스레드(id=44804553)는 "Chrome 139에서도 uBlock Origin이 여전히 작동한다"는 더 이전 시점의 별개 논의였다.

## 한 줄 요약

**Google이 Manifest V2(MV2) 지원 중단의 마지막 단계로, uBlock Origin을 포함해 Chrome 웹 스토어에 남아 있던 모든 MV2 확장 프로그램을 삭제했다.** Chrome 139 이상에서는 이미 2025년 7월부터 MV2 확장이 작동을 멈춘 상태였으므로, 이번 조치가 새로 무언가를 막은 건 아니다 — **검색해서 찾고 재설치할 수 있는 경로 자체를 없앤 것**이다. Chrome 138 이하에 남아있는 MV2 확장은 계속 설치돼 있지만 업데이트를 받을 수 없고, 한 번 삭제하면 스토어에서 다시 받을 수 없다.

## 핵심 포인트

- **몇 년에 걸친 전환의 마지막 이정표** — Google은 2024년 10월부터 MV2를 단계적으로 퇴출해 왔고, 이번이 **Chrome 웹 스토어에서 MV2 확장을 완전히 없앤 최종 단계**.
- **"새로 비활성화"가 아니라 "경로 삭제"** — Chrome 139 이상에서는 이미 오래전부터 MV2 확장이 실행되지 않았다. 이번 조치는 **검색·재설치 자체가 불가능**해졌다는 뜻.
- **Chrome 138 이하 사용자 영향** — 설치돼 있던 MV2 확장은 남아있지만 **업데이트 불가**, 삭제하면 **스토어에서 다시 설치 불가**.
- **마지막 남은 우회 경로도 소멸 예정** — Chrome 150(2026년 6월 30일 스테이블 채널 예정)에서 `ExtensionManifestV2Disabled` 플래그가 제거되면, **기업 관리자가 정책으로 MV2를 유지시키던 마지막 수단**도 사라진다.
- **다른 Chromium 브라우저 파급** — Chrome 웹 스토어에 의존하는 다른 Chromium 기반 브라우저도 영향을 받음. **Brave는 자체적으로 uBlock Origin·uMatrix·NoScript·AdGuard 등 4종의 MV2 확장을 자사 백엔드에서 직접 호스팅**하기로 결정해 대응.
- **대안** — uBlock Origin 개발자 Raymond Hill이 만든 **uBlock Origin Lite**(MV3 호환)가 있지만, 지원 필터 목록이 적고 **콘텐츠 제거형 필터링(cosmetic filtering)을 지원하지 못해** 현대적 광고 기법 다수를 막지 못한다는 한계가 지적됨.

## 인상 깊은 문장

> "Manifest V2 extensions installed on Chrome 138 or earlier will remain installed, but will be unable to receive any updates and cannot be reinstalled from the Chrome Web Store once removed."
> (2차 매체 종합 요약 — Google 공식 발표문 원문 대조는 못 함)

## 댓글

**이번 9월 1일 삭제 조치를 다루는 전용 HN 스레드는 이 세션에서 특정하지 못했다.** 검색으로 발견한 HN 스레드(id=44804553)는 "Chrome 139에서도 uBlock Origin이 여전히 작동한다"는 **더 이전 시점의 별개 논의**라 이번 사건과 혼동하지 않도록 구분해 둔다. Brave Community 포럼에 관련 스레드가 있는 것은 확인했으나 세부 논조는 열람하지 못했다. **hada 자체 댓글 수·GN⁺ 큐레이션 여부도 확인 불가**(news.hada.io 차단).

## 내 생각 · 적용점

### 핵심 전이 1 — 이건 새 사건이 아니라 3개월 전 정리한 사건의 "마지막 장"이다

[[2026-06-08-chrome-mv3-end-of-adblockers]]에서 이미 이 전환의 핵심 구조를 짚었다 — ***"세계 최대 광고 회사가 만든 브라우저에 광고 차단을 의존한다"***는 통제권의 역설, 그리고 그 노트가 다룬 시점(Chrome 150·151에서 우회 플래그 제거 예고)이 바로 이번 삭제로 이어지는 흐름의 앞부분이었다. 그 노트에서 인용했던 PoPETS '26 논문의 "MV3 차단 성능이 MV2보다 유의미하게 낮지 않다"는 기술적 반론도 여전히 유효하다 — **이번 사건에서 진짜 잃는 건 차단 성능이 아니라 "검색해서 설치할 수 있는 경로", 즉 신규 사용자의 접근성**이다. 기존 사용자는 이미 3개월 전에 실질적으로 잃었고, 이번엔 **아직 MV2를 안 써본 사람이 앞으로도 영영 못 쓰게 되는** 단계다.

### 핵심 전이 2 — uBlock 팀 자신도 이미 "전선을 유지할 수 없다"고 선언한 바 있다

[[2026-08-13-ublock-origin-stops-chasing-facebook-ads]]에서 정리했듯, uBlock Origin 팀은 이미 8월에 **"Facebook의 끊임없는 회피를 따라가는 건 지속 가능하지 않다"**며 Facebook 광고 필터 유지보수를 스스로 중단한 바 있다. 그 노트에서 짚었던 원칙 — ***"수천만 사용자를 소수 자원봉사자가 떠받치는 구조"*** — 이 이번 사건에서는 **더 근본적인 층위(플랫폼 자체의 배포 채널)에서 되풀이된다.** 그때는 uBlock이 자원 부족으로 스스로 물러났다면, 이번엔 **플랫폼(Google)이 그 도구가 새 사용자에게 닿을 통로 자체를 끊었다.** 같은 프로젝트가 두 층위(기능 유지·배포 채널)에서 동시에 압박받고 있는 셈이다.

### 핵심 전이 3 — 정직한 급소: "통제권 역설"은 감정적 프레임일 수 있다

[[2026-06-08-chrome-mv3-end-of-adblockers]]가 인용한 ***"광고 회사가 광고 차단기를 없앤다 — 누가 상상이나 했겠나"***라는 반응은 강렬하지만, 그 노트가 인용한 PoPETS 논문처럼 **기술적으로는 MV3 기반 대안(uBlock Origin Lite 등)이 "충분하다"는 반론도 동시에 존재한다.** 이번 삭제로 실제로 잃는 것(신규 설치 경로)과 감정적으로 느껴지는 상실(광고 차단이 사라진다는 인상) 사이에는 간극이 있을 수 있다 — 다만 uBlock Origin Lite가 콘텐츠 제거형 필터링을 지원하지 못한다는 한계는 실질적 기능 저하이므로, 이번 건은 순수히 "정서적 통제권 상실"만은 아니라는 점도 함께 밝혀둔다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 브라우저 확장 생태계·광고 차단 군비경쟁은 온다 CRS 제품과 도메인이 다르다. 전이 가능한 원칙만 남기면: [[2026-06-08-chrome-mv3-end-of-adblockers]]에서 이미 짚은 **"핵심 기능을 이해관계가 충돌하는 플랫폼에 의존하면 언젠가 회수된다"**는 원칙이 이번 사건으로 다시 한번 확인된다. 온다가 브라우저 확장·플랫폼 API(예: 특정 OTA·GDS의 전용 커넥터)에 크게 의존하는 통합이 있다면, **그 플랫폼의 사업 모델이 우리 기능과 충돌할 가능성**을 미리 점검해 둘 가치가 있다.

## 연관 자료

- [[2026-06-08-chrome-mv3-end-of-adblockers]] — 이번 삭제로 이어지는 전환의 앞선 단계(우회 플래그 제거 예고), "통제권 역설" 프레이밍의 원 출처
- [[2026-08-13-ublock-origin-stops-chasing-facebook-ads]] — 같은 프로젝트(uBlock Origin)가 자원 부족으로 스스로 전선을 축소한 사례, 이번엔 플랫폼이 배포 채널 자체를 끊음

## 한 달 뒤 회고

*(2026-10-01 즈음 — ①egress 차단이 풀려 Google 공식 발표문·이번 사건 전용 HN 스레드를 확인했는지, ②Brave의 자체 호스팅 확장이 실제로 안정적으로 작동하는지, ③uBlock Origin Lite 채택률이 어떻게 변했는지 기록.)*
