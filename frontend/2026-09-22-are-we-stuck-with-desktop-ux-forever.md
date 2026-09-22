---
title: "정말 같은 데스크톱 UX를 영원히 사용할 것인가? — 도구를 따로 고치지 말고 작업의 맥락 자체를 보존하자 (Scott Jenson)"
source_title: "Are we stuck with the same Desktop UX forever? (Ubuntu Summit 25.10)"
source_url: "https://app.daily.dev/posts/are-we-stuck-with-the-same-desktop-ux-forever-ubuntu-summit-25-10-lolskoqe5"
source_name: "daily.dev 요약(Ubuntu Summit 25.10 발표, Scott Jenson 추정), GeekNews(id=34080) 경유"
referrer_url: "https://news.hada.io/topic?id=34080"
published_at: "2025-12(WebSearch 추정, Ubuntu Summit 25.10 기준)"
summarized_at: "2026-09-22"
category: "frontend"
tags: ["desktop-ux", "working-memory", "linux", "window-management", "clipboard", "scott-jenson"]
---

# 정말 같은 데스크톱 UX를 영원히 사용할 것인가?

> 출처: [daily.dev 요약](https://app.daily.dev/posts/are-we-stuck-with-the-same-desktop-ux-forever-ubuntu-summit-25-10-lolskoqe5) (Ubuntu Summit 25.10 발표, Scott Jenson 추정) · GeekNews(id=34080) 경유 · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io` egress 차단으로 원문 직접 접근 불가. Slack GN⁺ 발췌 + WebSearch(daily.dev 요약)로 재구성했다. WebSearch 결과 Apple·Google·Symbian에서 일한 UX 디자이너(Scott Jenson으로 추정)의 2025년 12월 Ubuntu Summit 25.10 발표와 논지가 정확히 일치하나, GeekNews 토픽이 이 발표 자체를 다루는지 후속 기사를 다루는지는 확정하지 못했다.

## 한 줄 요약

**데스크톱으로 하는 일은 다양해졌지만 UX는 지난 20년간 겹치는 창·상태 없는 클립보드 같은 낡은 가정 위에 머물러 있다 — Linux 커뮤니티가 Apple·Microsoft의 혁신을 기다리는 대신, 개별 도구를 따로 고치기보다 "무슨 자료로 무슨 작업을 했는지"라는 작업의 맥락(작업 기억) 자체를 보존하는 방향으로 데스크톱을 다시 설계해야 한다.**

## 핵심 포인트

- **20년간 정체된 데스크톱 UX** — 데스크톱으로 하는 일은 다양해졌지만 UX는 지난 20년간 거의 정체됐으며, ***Linux 커뮤니티가 Apple과 Microsoft를 기다리기보다 직접 새로운 사용 방식을 탐색***할 필요가 있다 — 게다가 두 회사도 요즘은 혁신 대신 실수를 반복하고 있다는 지적이 함께 나온다(WebSearch).
- **도구는 강력해졌지만 맥락은 사라진다** — 창, 파일, 클립보드를 빠르게 조작하는 기능은 강력하지만 ***어떤 자료로 무슨 작업을 했는지는 기억해 주지 못한다*** — 개별 도구를 따로 개선하기보다 작업의 맥락을 함께 보존하는 접근이 필요하다.
- **"작업 기억" 세 층위로 재설계 제안(WebSearch 보강)** — 공간적(대형 모니터를 위한 유기적 창 관리), 연상적(문서에 묶인 지속적 클립보드·파일 모음), 일화적(사용자의 작업 이력을 재구성하는 프라이버시 보존형 주의 텔레메트리) ***세 층위의 "작업 기억(working memory)"*** 개념으로 데스크톱 인터랙션을 다시 설계하자는 프레임워크를 제시한다.
- **세 가지 프로토타입으로 탐색** — 화면 옆으로 보내면 작아지는 창, 문서와 함께 보관되는 참고 자료, 자료의 출처와 작업 이력을 보여주는 ***세 가지 프로토타입***으로 다른 데스크톱 사용 방식을 탐색한다.

## 인상 깊은 문장

> "desktop interaction is limited by decades-old assumptions like overlapping windows and stateless clipboards."
> (daily.dev 요약, WebSearch 발췌)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. Linux 데스크톱 커뮤니티를 대상으로 한 컨퍼런스 발표라는 맥락상, 실제 배포판에 이 아이디어가 채택될지는 아직 불투명한 초기 제안 단계로 보인다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 UX 원칙 계열에 "도구가 아니라 맥락을 설계하라"는 구체적 프레임을 더함

가든에는 [[2026-04-30-laws-of-ux]], [[2026-08-05-ten-gui-widgets-uxtigers]] 등 UX 원칙을 다룬 노트가 있다. 이 발표가 더하는 통찰은 ***"개별 위젯이나 창을 개선하는 것과, 사용자의 작업 맥락 전체를 보존하는 것은 다른 문제"***라는 구분이다 — 창 관리·클립보드·파일 시스템을 각각 따로 고도화해온 지난 20년의 접근이 왜 "체감상 큰 변화가 없었는지"를 설명하는 유용한 진단이다.

## 호스피탈리티 / CRS 적용 포인트

CRS·PMS 백오피스 도구를 설계할 때 참고할 만한 원칙이다 — 프런트 데스크 직원이 예약 하나를 처리하며 여러 창(고객 정보, 결제, 객실 배정)을 오가는 과정에서 "무슨 예약 건으로 무슨 작업을 했는지"라는 맥락이 화면 전환마다 사라지는 문제는 실제로 흔하다. 개별 화면을 따로 개선하기보다, 작업 세션 전체의 맥락(어떤 예약을 왜 열었는지, 무엇을 확인했는지)을 유지해주는 설계가 실질적인 생산성 개선으로 이어질 수 있다.

## 연관 자료

- [[2026-04-30-laws-of-ux]] — UX 기본 원칙 모음
- [[2026-08-05-ten-gui-widgets-uxtigers]] — GUI 위젯 설계 원칙

## 한 달 뒤 회고

*(2026-10-22 즈음 — 이 프로토타입 세 가지가 실제 Linux 배포판(GNOME/KDE)에 반영 논의가 있었는지 확인.)*
