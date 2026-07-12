---
title: "당신의 '앱'은 웹페이지여도 됐다 — 매체는 콘텐츠를 따라야 하고, 앱의 유일한 차별점이 추적·광고라면 그건 반(反)기능이다"
source_title: "Your 'App' Could Have Been a Webpage (so I fixed it for you…)"
source_url: "https://danq.me/2026/07/09/your-app-could-have-been-a-webpage/"
source_name: "danq.me"
referrer_url: "https://news.hada.io/topic?id=31338"
published_at: "2026-07-09"
summarized_at: "2026-07-12"
category: "architecture"
tags: ["medium-selection", "native-vs-web", "pwa", "anti-features", "accessibility", "user-agency", "app-bloat"]
---

# 당신의 '앱'은 웹페이지여도 됐다 — 매체는 콘텐츠를 따라야 하고, 앱의 유일한 차별점이 추적·광고라면 그건 반(反)기능이다

> 출처: [Your 'App' Could Have Been a Webpage (so I fixed it for you…)](https://danq.me/2026/07/09/your-app-could-have-been-a-webpage/) (Dan Q) · 정리일 2026-07-12

## 한 줄 요약

**여행사 Travelbound 앱은 실제로는 텍스트·이미지·PDF 링크를 웹으로 전달할 뿐이었고, 앱만의 기능은 추적과 광고라는 "반(反)기능"뿐이었다. 저자는 앱을 리버스 엔지니어링해 내부 JSON API를 찾아내고, 광고를 제거한 가벼운 웹페이지로 되돌려 이를 증명한다. 앱 43MB(설치 후 124MB) → 웹페이지 0.05MB. 핵심은 도구 스펙이 아니라 "기능의 본질이 문서 전달이면 문서(웹)가 정답"이라는 매체 선택의 원칙이다.**

## 핵심 포인트

- **앱이 웹 대비 가진 기능 = 딱 두 가지**: 사용자 데이터 추적과 광고 노출(anti-features).
- **웹이 우월한 점**: 복사·인쇄·저장·북마크·검색·기기 보편성·접근성. 앱화(化)는 이 공짜 가치를 도로 빼앗는다.
- **취약한 인증** — 앱 콘텐츠 전체가 자격증명이 박힌 단순 URL 하나로 접근됐다(`.../itineraries/{username}-{password}`).
- **"앱 문화"가 지속되는 이유** — 네이티브 앱은 브라우저에 없는 광범위한 기기 권한·데이터 접근·추적 능력을 기업에 준다.
- **PWA/홈 화면 바로가기라는 대안** — 기술적으로 존재하지만 플랫폼이 눈에 띄지 않게 만들어 앱 설치를 유도한다.
- **소유권 회복** — "적어도 이제 우리 그룹은 이 콘텐츠에 어떻게 접근할지 선택권을 갖게 됐다."

## 인상 깊은 문장

> "Why do you want me to install a(nother) shitty app just to tell me something that could have been a (smaller, faster, more universally-accessible) document?"

> "This app is literally text, images, and links to PDF files, delivered via the Web."

> "There are (some) tasks for which an 'app' is absolutely the right choice of medium. Travelbound is not one of them."

## 댓글 — GN⁺의 Lobste.rs 큐레이션 4개 클러스터 전수 확인

**GeekNews 자체 댓글 1개(= GN⁺의 Lobste.rs 큐레이션, 최상위 3개 + 중첩 1개, 총 4개 클러스터).**

- **앱 비대화 피로 공감** — "본질적으로 웹페이지에 불과한 서비스가 앱으로 배포되는 데 질렸다." 다만 Android는 웹페이지 바로가기 만들기가 잘 드러나지 않아 기업이 앱을 선호하는 것도 이해는 됨.
- **"보통 사용자에게 앱과 웹의 차이 = 사실상 홈 화면 바로가기뿐"** — 바로가기를 곧바로 배포할 수만 있으면 아주 저렴한 앱 개발법이 됐을 것.
- **iOS "Add to Home Screen"** — Safari 공유 → Add to Home Screen으로 독립 실행 창을 만들 수 있고, App Store 없이 직접 만든 가족용 도구를 이렇게 배포한 사례.
- **초기 iPhone의 "웹 = 앱 플랫폼" 비전** — 원래 웹을 앱 플랫폼으로 삼으려던 방향이 결국 지금의 폐쇄적 앱 생태계로 귀결됐다는 회고.

## 내 생각 · 적용점

### 핵심 전이 1 — "매체는 콘텐츠를 따라야 한다"는 매체 선택의 원칙

텍스트·이미지·PDF를 전달할 뿐인데 앱을 강요하는 건 매체 선택의 실패다. **기능의 본질이 문서 전달이면 문서(웹)가, 진짜 상호작용·오프라인·기기 접근이 필요할 때만 앱이 정답**이다. "앱부터 만들자"는 기본값을 의심하라는 것 — 이건 [[2026-05-21-susam-dont-roll-your-own-web-ui]]·[[2026-06-01-what-matters-when-anyone-can-build]]의 "필요 이상으로 짓지 말라"와 같은 축이다.

### 핵심 전이 2 — 기술 결정 뒤에 숨은 유인(incentive)을 읽는 관점

앱이 웹 대비 제공하는 유일한 차별점이 "추적과 광고"라면, 그 아키텍처 선택은 사용자가 아니라 데이터 수집·락인을 위한 것이다. **기술 결정의 진짜 목적이 사용자 편익인지 기업 편익인지 구분하는 것** — [[2026-06-08-chrome-mv3-end-of-adblockers]]·[[2026-06-01-age-verification-end-of-free-internet]]의 "누구를 위한 설계인가" 논의와 정확히 겹친다. 마침 같은 날 정리한 [[2026-07-12-month-with-windows-11-defaults-as-philosophy]]의 "강제 온라인 계정·텔레메트리"와도 같은 계열.

### 핵심 전이 3 — 접근성·보편성이 곧 사용자 경험 (호스피탈리티 직결)

복사·인쇄·저장·검색·기기 보편성은 웹이 공짜로 주는 가치인데 앱화는 이를 빼앗는다. 이건 여행/호스피탈리티 고객 여정에 정확히 직결된다 — **투숙객에게 일정표·바우처·예약 확인서를 "앱 설치" 대신 링크 하나로 주는 편이 우월**하다. "화려한 전용 앱"보다 "어디서나 열리는 문서"가 실사용자에겐 낫다. [[2026-06-08-json-ld-personal-websites]]의 웹 우선 철학과 같은 방향.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-05-21-susam-dont-roll-your-own-web-ui]] — *필요 이상으로 짓지 말라, 웹 기본기 존중*
- [[2026-06-08-chrome-mv3-end-of-adblockers]] — *추적·광고와 "누구를 위한 설계인가"*
- [[2026-07-12-month-with-windows-11-defaults-as-philosophy]] — *강제 온라인 계정·사용자 자율 침식과 같은 계열*
- [[2026-06-01-what-matters-when-anyone-can-build]] — *누구나 만들 수 있을 때 무엇이 중요한가*

## 한 달 뒤 회고
*(2026-08-12 즈음 — CRS/여행 도메인에서 게스트에게 무언가를 "앱 설치"로 요구한 적이 있는지, 링크·웹으로 대체 가능한 것을 앱으로 강요하고 있진 않은지, 바우처/일정 전달 UX를 웹 우선으로 점검했는지 기록.)*
