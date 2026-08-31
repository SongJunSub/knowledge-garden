---
title: "Tether (Zack Bartel) — Mac 없이 iPhone과 Linux를 직접 잇는 오픈소스 Continuity, ANCS로 Apple Watch인 척한다"
source_title: "Tether: Linux + iPhone"
source_url: "https://zackbartel.com/blog/2026/08/tether/"
source_name: "zackbartel.com"
referrer_url: "https://news.hada.io/topic?id=33051"
published_at: "2026-08-23 (WebSearch 교차검증 추정, 원문 직접 확인 못해 최선 추정치임을 밝힌다)"
summarized_at: "2026-08-31"
category: "engineering"
tags: ["imessage", "linux", "apple-continuity", "bluetooth-ancs", "mtls", "open-source-dev-tools"]
---

# Tether — Mac 없이 iPhone과 Linux를 직접 잇는 오픈소스 Continuity

> 출처: [Tether: Linux + iPhone](https://zackbartel.com/blog/2026/08/tether/) (Zack Bartel · GitHub: [zackb/tether](https://github.com/zackb/tether)) · 정리일 2026-08-31
> **출처 한계 먼저 밝힌다**: 이 세션에서 `zackbartel.com`(저자 블로그 원문)·`news.hada.io`·`news.ycombinator.com`이 전부 차단됐다. `github.com/zackb/tether` 저장소 README만 WebFetch로 직접 확인했고, 저자 블로그의 세부 서술과 hada·HN 댓글은 WebSearch 교차검증으로만 재구성했다 — 인용 표시된 부분도 검색 스니펫에서 재구성한 취지이지 원문 그대로의 직접 인용이 아니다. 게시일도 검색 결과 종합 추정치(2026-08-23)이며 원문에서 직접 확인하지 못했다.

## 한 줄 요약

**macOS의 Continuity(iMessage 확인·알림 미러링·연락처 동기화·클립보드 공유·파일 전송)를 Linux에서 재현하는 오픈소스 도구. Mac을 중계 서버로 쓰는 BlueBubbles류와 달리 ***iPhone과 Linux를 직접 연결***하며, Apple이 Apple Watch용으로 만든 Bluetooth 프로토콜 ANCS를 이용해 마치 워치인 것처럼 iPhone에 접속한다. 메시지·알림은 Bluetooth, 클립보드·파일 전송은 상호 TLS 인증된 Wi-Fi로 나눠 처리하고, SMS·이메일 인증코드를 감지해 Linux 브라우저 입력창에 자동으로 채워준다.**

## 핵심 포인트

- **Mac-리스 아키텍처**: BlueBubbles 등 기존 도구가 macOS 서버를 중계로 세워야 했던 것과 달리, Tether는 ***iPhone과 Linux 데스크톱을 직접*** 연결한다 — Mac 자체가 필요 없는 구조 전환이 이 프로젝트의 핵심 차별점.
- **전송 채널 이원화**: 메시지·알림은 ***Bluetooth의 ANCS(Apple Notification Center Service)***를 통해 — Apple Watch 같은 액세서리가 iPhone 알림 피드를 받도록 만든 프로토콜을 Tether가 그대로 재사용해 ***"Apple Watch인 척"*** 한다. 클립보드 공유·파일 전송은 ***상호 인증 TLS(mTLS, X.509 RSA 인증서)를 쓰는 Wi-Fi***로 별도 처리한다.
- **인증코드 자동 입력**: SMS나 이메일로 도착한 OTP(일회성 인증코드)를 감지해 Linux 브라우저의 입력란에 자동으로 채워주는 기능까지 지원 — macOS Safari의 자동완성 기능을 크로스 플랫폼으로 옮긴 셈.
- **5종 클라이언트 생태계**: iOS 앱(App Store "Tether - Linux Companion"), Linux 데몬(`tetherd`), CLI(`tether`), GTK 그래픽 앱(`tether-gtk`), 브라우저 확장(Firefox/Chromium), 메일 확장(Thunderbird/Betterbird)까지 — 하나의 프로젝트가 6개 표면을 커버한다.
- **기능별 성숙도를 정직하게 공개**: 클립보드 동기화·파일 전송·iOS 앱·브라우저/메일 확장은 ***안정(Stable)***, SMS/iMessage와 알림 미러링은 ***베타***, TOTP/OTP 저장소는 ***계획 중***이라고 README 표에 명시 — "다 됩니다"가 아니라 뭐가 아직 덜 됐는지를 숨기지 않는다.
- **선행 프로젝트 위에서 독립적으로 재구현**: ANCS 리버스엔지니어링 자체는 `ancs4linux`(GPL) 같은 이전 프로젝트가 닦아놓은 길이지만, Tether는 이를 독립적인 C++ 구현으로 다시 짜서 더 관대한 ***MIT 라이선스***로 공개했다. 개발자 Zack Bartel(GitHub `zackb`) 1인 프로젝트로 시작해 현재 약 979 star, 기여자를 모집 중.

## 인상 깊은 문장

> (WebSearch로 재구성, 저자 블로그 취지) "2026년에도 블루투스 개발 환경은 여전히 엉망이다 — 이유 없이 연결이 끊기고, 엔지니어링 공수의 상당 부분이 핵심 기능이 아니라 문서화되지 않은 엣지케이스를 처리하는 데 들어간다." 새 프로토콜을 설계하는 것보다 ***기존 무선 스택의 비일관성을 견디는 게 더 큰 작업이었다***는 걸 짐작하게 하는 대목이다.

## 댓글

hada 원문은 이 세션에서 열람하지 못해 ***댓글 수·논지는 확인하지 못했다***. Hacker News에 "Tether: iMessage, SMS, etc. on Linux"(news.ycombinator.com/item?id=49415386)라는 스레드가 있고, WebSearch 종합으로는 526포인트·212댓글이라는 수치가 나왔지만 ***이 세션에서 직접 열람하지 못해 정확한 수치로 확정하지는 않는다*** — 참고치로만 취급한다. WebSearch로 파악한 논지의 중심은 "Mac을 중계로 쓰지 않는 아키텍처"가 화제성의 핵심이었다는 점 — "주말 사이 HN 최상위에 올랐다"는 표현이 나올 만큼 관심을 끌었다.

## 내 생각 · 적용점

### 핵심 전이 1 — vphone-cli와 같은 결, 반대 방향의 Apple 생태계 리버스엔지니어링

[[2026-08-30-vphone-cli-virtual-iphone-boot]]는 Apple 내부 인프라(Private Cloud Compute 연구용 VM 스택)를 재활용해 Apple Silicon Mac 위에서 iOS를 가상화하는 프로젝트였다. Tether는 정확히 반대 방향이다 — Apple 생태계 내부 인프라가 아니라 iPhone-액세서리 간 통신 프로토콜(ANCS)을 관찰·역공학해서, Apple 생태계 ***바깥***(Linux)에서 그 기능을 재현한다. 방향은 다르지만 둘 다 "Apple이 공식적으로 열어주지 않은 통로를 커뮤니티가 스스로 만든다"는 동일한 패턴의 다른 표현이다.

### 핵심 전이 2 — 표준화되지 않은 폐쇄 생태계는 개인 프로젝트가 대신 메운다

[[2026-08-26-sifive-bigsky-sf-2u870]]에서 확인했던 "표준화(RVA23)가 채택을 이끈다"는 원칙의 반대편 사례다. Continuity가 macOS 전용 폐쇄 기능으로 남아 있는 한 Apple이 이 영역을 표준화할 유인은 없고, 그 공백은 언제나 Tether 같은 개인·커뮤니티 리버스엔지니어링 프로젝트가 메운다 — 그리고 Apple의 프로토콜이 바뀔 때마다 이런 프로젝트는 처음부터 다시 쫓아가야 하는 취약한 위치에 선다.

### 핵심 전이 3 — 성숙도를 단계별로 정직하게 공개하는 설계

[[2026-08-30-vphone-cli-virtual-iphone-boot]]의 5단계 침습성 변형(least→exp)과 결이 비슷하다 — 사용자가 "얼마나 믿고 써도 되는지"를 스스로 판단할 수 있도록 기능별 성숙도(Stable/Beta/Planned)를 표로 명시하는 것. SMS/iMessage처럼 실제로 가장 매력적인 기능을 오히려 "베타"라고 낮춰 부르는 정직함이, 역설적으로 이 프로젝트에 대한 신뢰를 높이는 요소로 보인다.

## 호스피탈리티 / CRS 적용 포인트

***직접 적용은 멀다*** — 메시징 브릿지·인증코드 자동입력은 온다의 B2B CRS 도메인과 표면이 겹치지 않는다. 다만 전이 가능한 원칙 하나: **기능별 성숙도를 숨기지 않고 표로 공개하는 관행**은, CRS 연동 API 문서화(어떤 엔드포인트가 GA고 어떤 게 베타·실험 단계인지)에 참고할 만하다. 파트너사가 자기 리스크 허용 범위에 맞는 기능만 골라 쓸 수 있게 해준다는 점에서 Tether의 README 표와 같은 사고방식이다.

## 연관 자료

- [[2026-08-30-vphone-cli-virtual-iphone-boot]] — Apple 생태계를 리버스엔지니어링해 공식 미지원 영역을 커뮤니티가 여는 동일 패턴, 방향은 반대(내부 인프라 재활용 vs 외부 프로토콜 역공학).
- [[2026-08-26-sifive-bigsky-sf-2u870]] — "표준화가 채택을 이끈다"는 원칙이 성립하지 않는 반대 사례(Apple의 비표준·폐쇄 생태계라 개인 프로젝트가 계속 필요).

## 한 달 뒤 회고

*(2026-09-30 즈음 — SMS/iMessage와 알림 미러링이 Beta에서 Stable로 승격됐는지, Apple이 ANCS 활용 방식에 대응했는지 확인.)*
