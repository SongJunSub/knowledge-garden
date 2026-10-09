---
title: "일러스트레이터에게 우리 집을 그려 달라고 했다, 이제 그게 내 Home Assistant 대시보드다 (Anton Frolov) — 코딩보다 어려웠던 건 그림을 '배치 가능한 자산'으로 만드는 요구사항 정리"
source_title: "I hired an illustrator to draw my house. Now it's my Home Assistant dashboard"
source_url: "https://antonfrolov.substack.com/p/i-hired-an-illustrator-to-draw-my"
source_name: "Anton Frolov, Substack (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=35031"
published_at: "2026-10-07"
summarized_at: "2026-10-09"
category: "frontend"
tags: ["home-assistant", "picture-elements", "smart-home-ux", "illustration", "diy", "dashboard-design"]
---

# 일러스트레이터에게 우리 집을 그려 달라고 했다, 이제 그게 내 Home Assistant 대시보드다

> 출처: [I hired an illustrator to draw my house. Now it's my Home Assistant dashboard](https://antonfrolov.substack.com/p/i-hired-an-illustrator-to-draw-my) (Anton Frolov, Substack) · GeekNews(id=35031) 경유 · 정리일 2026-10-09

> **출처 한계**: `news.hada.io`와 `antonfrolov.substack.com` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. 대신 Hacker News 토론(id=49986882)을 다룬 제3자 큐레이션 저장소(`thevibeworks/claude-reads-hn`)가 작성한 다국어 요약을 GitHub 코드검색으로 확보해 저자·일러스트레이터 이름·구현 디테일(picture-elements, state_image, Browser Mod)을 교차확인했다. 이 요약은 **367점·55댓글** 스냅샷(이후 다른 집계 시점에서는 400~500점대로도 관측돼, HN 점수가 계속 올라가는 중이라는 뜻이다)을 명시한다. Slack 발췌가 언급한 "벽난로 불꽃·정원 조명·에어컨 바람 애니메이션", "모든 그림을 같은 캔버스로 받아 배치 작업을 줄임", "가족이 기기를 직접 제어" 같은 구체적 서술은 이 제3자 요약에서 전부 확인되지는 않았다 — 요약은 에어컨이 켜질 때 정지 이미지를 애니메이션 WebP로 바꾸는 `state_image` 예시 하나만 명시했고, 벽난로·정원 조명 애니메이션과 가족의 반응은 Slack 발췌에만 있는 내용이라 원문 직접 대조 없이는 단정하지 않는다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**Anton Frolov가 환경 아티스트 Owen Yeconiel에게 자기 집을 손그림으로 그려 달라 의뢰하고, 그 그림을 Home Assistant의 기본 `picture-elements` 카드에 꽂아 넣어 실시간으로 기기 상태가 반영되는 평면도 대시보드로 만들었다 — 그림 자체보다 "모든 자산을 같은 좌표의 공통 캔버스에, 요소마다 실제 위치에 맞춰, 낮/밤 두 버전과 기기별 온/오프 레이어까지 나눠 받는다"는 발주 명세가 작업의 핵심이었다.**

## 핵심 포인트

- **일러스트레이터에게 넘긴 건 그림이 아니라 명세였다** — 건축 도면, 참고 사진, 페인트 색상 코드를 전달하고, ***모든 자산을 하나의 공통 캔버스에, 각 요소가 집 안 실제 위치에 오도록*** 내보내 달라고 요구했다. 이 요구사항 하나가 이후 모든 요소를 좌표만으로 겹쳐 배치할 수 있게 만들어, 수작업 보정을 크게 줄였다.
- **낮/밤, 온/오프를 처음부터 레이어로 분리 발주** — 모든 그림을 ***낮 버전과 밤 버전, 기기별 켜짐/꺼짐 상태의 별도 레이어***로 받았다. 구현 단계에서 레이어를 새로 쪼개는 게 아니라, 애초에 그 구조로 그림을 받는 것이 작업량을 줄이는 지점이다.
- **구현은 Home Assistant 기본 카드 하나로 충분** — 별도 프레임워크 없이 ***`picture-elements` 카드*** 위에 기기 엔티티를 좌표로 꽂았다. 에어컨이 켜지면 `state_image`가 정지 프레임을 애니메이션 WebP로 바꿔 보여주고, helper 엔티티가 일출·일몰 시각에 낮/밤 레이어를 전환하며, 커스텀 팝업은 Browser Mod로 처리한다.
- **비용은 공개되지 않았다** — 원문이 일러스트레이터 섭외 비용을 언급하지 않았다는 점을 제3자 요약도 명시한다. 이 작업이 얼마나 접근 가능한 선택지인지는 비용 정보 없이는 가늠하기 어렵다.

## 인상 깊은 문장

> "The brief mattered more than the art: architectural plans, reference photos, paint colour codes, and a requirement that every asset export on a shared canvas with elements positioned exactly where they sit in the house."
> (HN 요약 발췌 — 원문 직접 인용이 아니라 제3자가 영어로 재구성한 요약 문장임을 밝힌다.)

## 댓글

hada 댓글 수는 확인 불가. HN 토론(id=49986882)은 한 스냅샷 기준 367점·55댓글로, 이후 다른 집계에서는 400~500점대로 올라가 있어 공개 후 계속 주목받고 있는 것으로 보인다. 이 노트의 근거는 hada나 원문이 아니라 HN을 읽고 요약한 제3자 저장소이므로, "일러스트레이터 섭외가 코딩보다 어려웠다"는 식의 Slack 발췌 뉘앙스는 원문을 직접 읽어야 완전히 검증된다.

## 내 생각 · 적용점

### 핵심 전이 1 — Home Assistant를 "연결 가능하게" 만드는 것과 "가족이 쓰게" 만드는 것은 다른 문제

[[2026-10-04-muse-gadgets-connect-your-own-device]]는 Meta Muse의 Linux SDK가 셸 명령 실행·파일 읽기/쓰기·상태 보고라는 4개 명령으로 Home Assistant 연동 "다리"를 만드는 과정을 다뤘다 — 기술적으로 연결 가능하다는 것 자체가 그 글의 결론이었다. 오늘 글은 그 다리가 실제로 건너지는지는 전혀 다른 질문이라는 걸 보여준다. Slack 발췌대로 "기존 Home Assistant 앱을 쓰려 하지 않던 가족들"이 있었다면, 문제는 연동의 존재가 아니라 인터페이스가 집처럼 안 생겼다는 것이었다는 뜻이다. 프로토콜·SDK가 갖춰진 뒤에도 "이걸 누가 실제로 쓰는가"는 완전히 별개의 설계 과제로 남는다.

### 핵심 전이 2 — "차분한 기술"의 극단적 구현: 앱이 아니라 그림

[[2026-07-24-calm-technologies]]는 범용 스마트폰 앱이 모든 걸 떠안으면서 "Distractor 5000"이 됐다는 비판과, 단일 목적 기기가 의도성을 되살린다는 주장을 다뤘다. 오늘 글의 대시보드는 그 원칙을 인터페이스 레벨에서 구현한 사례로 읽힌다 — 범용 Home Assistant 앱의 메뉴·탭 대신, 내 집을 그대로 닮은 그림 한 장이 전체 화면을 차지한다. 조작 가능한 요소가 무엇인지 설명할 필요가 없다는 점에서, 이것은 calm-technologies가 말한 "도와주고 물러나는 기술"의 시각적 버전이다.

## 호스피탈리티 / CRS 적용 포인트

CRS 자체에 "건물을 손그림으로 그려 넣는" 방식을 직접 적용하기는 어렵다. 다만 전이 가능한 원칙은 분명하다 — 프런트 직원이나 비개발 운영 인력이 매일 쓰는 대시보드에서, 범용 데이터 테이블보다 실제 공간(객실 평면도, 층별 배치)을 그대로 닮은 시각화가 채택률을 크게 바꿀 수 있다. 특히 "같은 좌표의 공통 캔버스로 자산을 받는다"는 발주 원칙은, 여러 지점·여러 객실 타입의 평면도 자산을 외주로 받을 때 그대로 쓸 수 있는 체크리스트다.

## 연관 자료

- [[2026-10-04-muse-gadgets-connect-your-own-device]] — Home Assistant 연동을 가능케 하는 기술적 다리(SDK)를 다룬 선행 노트, 오늘 글은 그 다리 위에 놓일 인터페이스의 문제를 보여줌
- [[2026-07-24-calm-technologies]] — "도와주고 물러나는 기술" 원칙, 오늘의 그림 기반 대시보드가 그 원칙의 시각적 구현 사례

## 한 달 뒤 회고

*(2026-11-09 즈음 — `antonfrolov.substack.com` 접근이 가능해지면 원문을 직접 읽어 벽난로·정원 조명 애니메이션과 가족 반응 서술을 1차 소스로 재검증.)*
