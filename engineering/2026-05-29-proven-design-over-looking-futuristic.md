---
title: "검증된 설계 > 미래적으로 보이기 — 물리적 affordance와 안전 (EV 멍청함 체크리스트에서 추린 설계 원칙)"
source_title: "Electric Vehicle Stupidity Checklist"
source_url: "https://hypercritical.co/2026/05/29/the-electric-vehicle-stupidity-checklist"
source_name: "hypercritical.co (John Siracusa) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30024"
summarized_at: "2026-05-29"
category: "engineering"
tags: ["design-philosophy", "physical-affordance", "proven-design", "usability", "safety", "boring-technology-line", "anti-novelty"]
---

# 검증된 설계 > 미래적으로 보이기 — 물리적 affordance와 안전 (EV 멍청함 체크리스트에서 추린 설계 원칙)

> 출처: [Electric Vehicle Stupidity Checklist](https://hypercritical.co/2026/05/29/the-electric-vehicle-stupidity-checklist) (John Siracusa, GeekNews 경유) · 정리일 2026-05-29
>
> *(전기차 자체보다 **전이 가능한 설계 원칙**만 추렸다 — 물리적 affordance, 검증된 설계, "새로워 보이려고" 사용성·안전을 희생하지 말 것.)*

## 한 줄 요약
**제품이 *"미래적으로 보이려고" 검증된 설계를 버릴 때* 사용성과 안전이 희생된다 — *매립형 도어 핸들·터치스크린 일색·디지털 후방 거울*은 "달라 보이지만" *신뢰성·안전·인지 부하* 면에서 후퇴다. 핵심 원칙: ***중요한 조작은 "보지 않고도 쓸 수 있어야" 한다***(물리적 버튼·레버·노브의 촉각 affordance). 새로움(novelty)은 *검증된 사용성을 이길 이유가 되지 못한다*.**

## 핵심 포인트 (소프트웨어로 전이)

- **"보지 않고도 사용 가능" = 촉각 affordance** — 방향지시등 레버·물리 버튼·공조 노브는 *시선을 빼앗지 않음*. 터치스크린 일색은 *주의 분산·안전 저하*. → 소프트웨어: *키보드 단축키·일관된 위치·근육 기억*이 "보지 않고도" 쓰게 함. 모든 걸 메뉴/명령 팔레트 뒤로 숨기면 인지 부하↑.
- **검증된 설계 > 새로워 보이기** — *매립형 핸들·전자식 덮개*의 "공기역학"은 약한 변명, 실은 *신뢰성·안전 희생*. → **[choose boring technology](engineering/2026-05-29-choose-boring-technology-2015.md)·[좋아하는 개발자 도구](engineering/2026-05-28-favorite-developer-tools.md) *검증된 것·좋은 기본값* 라인의 하드웨어판**.
- **화면은 만능 대체재가 아니다** — 디지털 후방 거울은 *초점 거리·동적 범위 한계*로 실물을 못 따라옴. → *추상화/디지털화가 항상 우월한 게 아니라, 물리 채널이 더 나은 영역*이 있음.
- **안전은 "달라 보임"에 희생될 수 없다** — 도어 핸들 결함으로 인한 사망 사례(댓글). *Chevrolet EV·2021 KIA eNiro는 물리 조작계 유지로 "모든 조건 충족"* — **트렌드를 거슬러 기본기를 지킨 사례**.

## 인상 깊은 문장

> *(요지)* 중요한 조작계는 *보지 않고도 사용할 수 있어야* 한다 — 방향지시등, 물리 버튼, 공조 노브.

> *(댓글)* 안전이 *"달라 보인다"는 이유로* 희생되어서는 안 된다.

## 내 생각 · 적용점

이 글은 *차에 관한 글이 아니라 설계 철학에 관한 글*이다. **소프트웨어 UX에 그대로 전이**:
- *새 인터페이스 패러다임(대화형·제스처·AI)*이 *검증된 직접 조작(버튼·단축키)*을 항상 이기지 않는다. **[[2026-05-26-users-are-visibly-frustrated]] *대화형 인터페이스의 부담* + Zed git conflict 버튼 = 네이티브 직접 조작 선호와 같은 결**.
- *"보지 않고도 쓰기"*(촉각·근육 기억)는 *전문가 생산성의 핵심* — CRS 운영 콘솔·내부 도구에서 *자주 쓰는 동작은 고정 위치·단축키*로.
- **기본기 회귀 라인의 하드웨어 사례** — [[2026-05-28-favorite-developer-tools]]의 "*좋은 기본값을 가진 도구에 취향을 맞춘다*"가 물리 제품에도 성립. *(친·반 AI 카운팅과 무관한 설계 철학 라인.)*

## 연관 자료
- [Electric Vehicle Stupidity Checklist](https://hypercritical.co/2026/05/29/the-electric-vehicle-stupidity-checklist) (원문)
- [GeekNews — 30024](https://news.hada.io/topic?id=30024)
- [[2026-05-29-choose-boring-technology-2015]] — 검증된 기술 *(설계 철학 동근)*
- [[2026-05-28-favorite-developer-tools]] — 좋은 기본값 도구 *(기본기 라인)*
- [[2026-05-26-users-are-visibly-frustrated]] — 직접 조작 선호 *(UX 전이)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — 내가 만드는 도구/UI에서 "새로워 보이려고" 검증된 직접 조작을 버린 곳이 없는지, "보지 않고도 쓰기"를 해치는 설계가 없는지 점검했는지 기록.)*
