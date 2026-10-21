---
title: "광고 없는 Android TV 만들기 (Cretezy) — 런처·YouTube 앱·DNS 세 지점을 ADB로 각각 교체해야 광고가 전부 사라진다"
source_title: "An ad-free Android TV"
source_url: "https://cretezy.com/2026/ad-free-android-tv"
source_name: "cretezy.com (필명 Cretezy)"
referrer_url: "https://news.hada.io/topic?id=35697"
published_at: "2026-10-19"
summarized_at: "2026-10-21"
category: "engineering"
tags: ["android-tv", "adb", "ad-blocking", "jellyfin", "self-hosted", "pi-hole", "degoogling"]
---

# 광고 없는 Android TV 만들기 (Cretezy)

> 출처: [An ad-free Android TV](https://cretezy.com/2026/ad-free-android-tv) (cretezy.com, 필명 Cretezy) · GeekNews(id=35697) 경유 · 정리일 2026-10-21

> **출처 한계**: `news.hada.io`와 `cretezy.com` 둘 다 이 세션에서 egress 차단으로 직접 열람하지 못했다. WebSearch로 daily.dev 요약·Android Authority("vibe hacking" 관련 기사)·TechPP·Notebookcheck 등을 교차확인했는데, 핵심 사실(Projectivy Launcher + SmartTube + Button Mapper + Wholphin 조합, Chromecast 2대·Hisense TV 환경, ADB로 기본 런처 교체, Pi-hole/Private DNS로 보완)은 Slack 발췌와 일치했다. 다만 ***TechPP는 "YouTube 자체 영상 광고는 영상과 같은 서버에서 오기 때문에 이 방식으로는 못 없앤다"고 명시***하는데, 이 글(Slack 발췌)이 SmartTube의 영상 내 협찬 구간 건너뛰기와 YouTube 네이티브 광고 자체 제거를 명확히 구분해서 설명하는지는 원문 직접 대조를 못해 확인하지 못했다 — "광고가 전부 없어진다"는 제목의 기대와 실제 작동 범위 사이에 간극이 있을 수 있다는 점을 밝혀둔다.

## 한 줄 요약

**Android TV의 광고·추천 UX를 없애려면 홈 화면(런처)·YouTube 재생 앱·DNS 세 지점을 각각 다른 도구로 교체해야 한다 — Projectivy Launcher로 홈 배너를, SmartTube로 YouTube 광고·협찬 구간을, Pi-hole/AdGuard DNS로 다른 앱의 추적 도메인을 막는 조합이며, 전부 ADB로 기본 런처·앱 자체를 바꿔 끼우는 구조다.**

## 핵심 포인트

- **런처 교체가 구조적으로 필요한 이유** — Projectivy Launcher를 깔기만 해서는 안 되고, ***ADB로 기본 런처를 비활성화하고 Projectivy를 홈 액티비티로 지정***해야 한다. 그렇게 하지 않으면 리모컨 홈 버튼을 누를 때마다 다시 기본 Google TV 런처로 돌아간다 — "설치"와 "기본값 전환"이 분리된 두 단계라는 점이 핵심이다.
- **YouTube는 앱 자체를 지우고 대체한다** — `adb uninstall com.google.android.youtube.tv`로 공식 YouTube 앱을 지우고 SmartTube로 대체한다. SmartTube는 SponsorBlock 통합으로 영상 내 협찬 구간을 건너뛰지만, ***영상과 같은 서버에서 오는 YouTube 네이티브 광고 자체는 이 방식의 한계 밖***이라는 게 WebSearch로 교차확인한 TechPP의 지적이다.
- **리모컨 버튼까지 다시 매핑한다** — Button Mapper로 리모컨의 전용 YouTube 버튼을 SmartTube로 연결한다. 하드웨어에 새겨진 버튼이라도 소프트웨어 레벨에서 목적지를 바꿀 수 있다는, 디바이스 자체의 "기본 경로"를 전부 가로채는 접근이다.
- **Jellyfin 재생에는 별도 클라이언트(Wholphin)** — 자체 호스팅한 Jellyfin 미디어 서버 영상을 보기 위한 전용 플레이어다. ***"스트리밍 대신 자체 호스팅"이라는 전제가 이 설정 전체의 배경***이라는 점에서, 이 글 자체가 셀프호스팅 생태계의 연장선에 있다.
- **범위 밖 광고는 DNS로 보완** — Pi-hole이나 AdGuard DNS로 광고·추적 도메인을 차단해, 런처·YouTube 앱 교체가 못 잡는 다른 앱의 광고·추적을 보완한다. 즉 이 글의 설계는 ***"하나의 만능 차단"이 아니라 계층별로 다른 도구를 겹쳐 쓰는 구조***다.
- **검증된 하드웨어 — Chromecast 2대 + Hisense TV** — 저자가 실제로 테스트하고 복구 방법까지 제공한 기기가 명시돼 있어, "이론상 될 것"이 아니라 ***n=1이지만 실제 재현된 사례***라는 점이 이 글의 신뢰도를 받친다.

## 인상 깊은 문장

> "홈 화면과 YouTube 앱을 교체해, Android TV의 홈 배너와 YouTube 광고를 없애는 방법" (Slack GN⁺ 발췌)

## 댓글

GeekNews 댓글 수·HN/Lobsters 큐레이션 유무를 이번 세션에서 확인하지 못했다. 다만 WebSearch 결과로, 비슷한 시기(2026년 10월) Android Authority가 "사람들이 Android TV 광고·블로트웨어를 없애려고 vibe coding(AI 코딩 도구)까지 쓴다"는 기사를 냈다는 걸 확인했다 — ***이 글과 똑같은 동기(광고·추천 UX 거부)를 가진 사례가 같은 시기에 여러 곳에서 독립적으로 나타나고 있다는 정황***이다. 정직하게 짚을 한계: 이 설정은 ADB로 패키지 상태를 바꾸는 작업이라 기기별로 결과가 다를 수 있고, 저자 본인이 검증한 건 Chromecast 2대·Hisense 1대뿐이다. "YouTube 네이티브 광고까지 전부 없앤다"는 기대가 있다면 TechPP가 지적한 한계(같은 서버에서 오는 영상 광고는 못 막음)를 먼저 확인해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-15-n100-mini-pc-selfhosting-28-services]]와 똑같은 "넛지를 피하려는" 동기, 심지어 같은 도구(Jellyfin)로 이어진다

그 노트의 셀프호스팅 전환은 ***"스트리밍 비용이 아니라 끊임없는 추천·자동재생이라는 UX 설계를 피하려는" 동기***에서 시작됐다. 이 글은 정확히 같은 동기를 Android TV라는 다른 지점에서 반복한다 — 다만 이번엔 "서버를 셀프호스팅"하는 쪽이 아니라 ***"재생 기기(TV 런처) 쪽의 추천·광고 UX를 갈아치우는"*** 쪽이다. 흥미로운 건 두 글이 Jellyfin이라는 같은 소프트웨어로 실제로 맞물린다는 점이다 — N100 노트가 서버를, 이 글이 그 서버를 재생할 클라이언트(Wholphin)를 각각 다루는 셈이라, 한 사람의 셀프호스팅 스택이 "서버→클라이언트"로 완성되는 그림을 겹쳐 볼 수 있다.

### 핵심 전이 2 — [[2026-06-08-chrome-mv3-end-of-adblockers]]가 세운 "플랫폼 소유자가 광고 차단 권한 자체를 쥐고 있다"는 구조와 정반대 쪽 사례

Chrome MV3 노트는 광고 회사(Google)가 만든 브라우저에 광고 차단을 의존하는 역설, 즉 ***플랫폼이 차단 기능 자체를 통제***하는 구조를 다뤘다. Android TV는 OS 레벨에서 ADB 접근이 허용되는 한 ***사용자가 플랫폼의 기본 구성요소(런처·기본 앱)를 통째로 갈아 끼울 수 있다*** — 같은 Google 생태계 기기인데도, 모바일 Chrome(MV3로 확장 API가 제한됨)보다 Android TV(ADB로 시스템 앱 교체 가능)가 사용자에게 훨씬 큰 통제권을 열어준다는 대조가 있다. "플랫폼이 이긴다"는 원칙이 디바이스 종류·접근 계층에 따라 꼭 균일하게 적용되지는 않는다는 반증 사례다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — CRS는 B2B 소프트웨어고 이 글은 개인용 TV 셀프호스팅/언락 가이드라 제품 자체와는 무관하다.** 다만 전이 가능한 원칙 하나는 남긴다 — ***"하나의 만능 차단"이 아니라 계층별로 다른 도구를 겹쳐 쓴다***는 설계(런처/앱/DNS를 각각 다른 수단으로)는, CRS 어드민 콘솔에서 알림·추천·업셀 UX를 설계할 때도 참고할 만하다. 특정 UX 요소(추천 배너, 자동 업셀 팝업)를 없애려는 운영자 요구가 있을 때, 한 곳의 플래그만으로는 다 못 잡고 화면별·채널별로 여러 설정을 조합해야 하는 경우가 실제 CRS 운영에서도 흔하다.

## 연관 자료

- [[2026-10-15-n100-mini-pc-selfhosting-28-services]] — "추천·자동재생 넛지를 피하려는" 같은 동기의 선행 노트, 심지어 같은 소프트웨어(Jellyfin)로 서버-클라이언트 양쪽이 맞물림
- [[2026-06-08-chrome-mv3-end-of-adblockers]] — "플랫폼이 차단 권한을 쥔다"는 원칙과 대조되는, 디바이스 접근 계층에 따라 통제권이 달라지는 반증 사례

## 한 달 뒤 회고

*(2026-11-21 즈음 — cretezy.com 원문에 직접 접근 가능해지면, YouTube 네이티브 광고까지 실제로 사라지는지 저자가 명확히 구분해 설명하는지 확인. Android Authority가 보도한 "vibe coding으로 Android TV 디블로트"가 이 흐름과 실제로 얼마나 겹치는지도 점검.)*
