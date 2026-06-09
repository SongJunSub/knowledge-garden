---
title: "Linear는 어떻게 이렇게 빠른가 — 로컬 우선·필드 단위 반응성·키보드 affordance (기술 노트 + 성능 craft)"
source_title: "How is Linear so fast? A technical breakdown"
source_url: "https://performance.dev/how-is-linear-so-fast-a-technical-breakdown"
source_name: "performance.dev · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30276"
summarized_at: "2026-06-08"
category: "frontend"
tags: ["performance", "local-first", "optimistic-ui", "indexeddb", "fine-grained-reactivity", "keyboard-ux", "perceived-speed", "craft"]
---

# Linear는 어떻게 이렇게 빠른가 — 로컬 우선·필드 단위 반응성·키보드 affordance (기술 노트 + 성능 craft)

> 출처: [How is Linear so fast? A technical breakdown](https://performance.dev/how-is-linear-so-fast-a-technical-breakdown) (performance.dev, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Linear의 속도는 여러 계층의 의도적 설계에서 온다 — ①*데이터*: 브라우저 *IndexedDB 로컬 DB*에 *변경을 로컬에 먼저 적용 후 서버로 비동기 전송*(optimistic, 네트워크 지연을 숨김), ②*초기 로드*: *JavaScript 50% 감소* + *공격적 코드 분할·modulepreload·서비스 워커 프리캐시*로 병렬 로딩, ③*동기화 엔진*: *MobX 객체 풀 + 필드 단위 관찰*로 *필요한 셀만 리렌더*(50개 이슈 업데이트 = 목록 전체가 아니라 50개 셀), ④*UI/UX*: *키보드 중심·전역 명령 팔레트·GPU 친화 애니메이션·짧은 전환(100~350ms)*으로 *체감 속도* 향상. 댓글: *실제론 검색 느림·UI 둔탁·30초 로드*, *DB 단일 리전 → 대다수 100ms+ 물리 한계*, *CPU 100%·파이어폭스 메모리 누수* — 즉 *체감과 실측은 다르고 최적점이 있다*.**

## 핵심 포인트 (전이 가능한 성능·craft 원칙)

- **로컬 우선(local-first) = 지연을 숨긴다** — *변경을 로컬에 먼저, 서버는 비동기*. *사용자는 즉각 반응을 본다*. **[[2026-06-01-my-software-north-star]] *사용자 효용이 목적*의 성능 구현** — 진짜 빠름이 아니라 *체감 빠름*도 효용.
- **빼기 = JS 50% 감소** — *덜 보내는 게 빠름*. **[[2026-06-01-code-is-cheaper]] *빼는 엔지니어* + [[2026-05-29-choose-boring-technology-2015]] *단순화*의 번들 차원**.
- **필드 단위 반응성 = 필요한 것만** — *50개 셀만 리렌더*. *낭비를 제거하는 craft*. **[[2026-06-08-taste-is-the-new-10x]] *"9개 제거"* 의 렌더링 차원**.
- **키보드·명령 팔레트 = "보지 않고도 쓰기"** — *촉각·근육 기억의 affordance*. **[[2026-05-29-proven-design-over-looking-futuristic]] *중요 조작은 보지 않고도 쓸 수 있어야* + [[2026-05-28-favorite-developer-tools]] *좋은 기본값*과 정확히 같은 원칙** — 전문가 생산성은 *직접 조작*에서.
- **체감 ≠ 실측, 최적점이 있다 (댓글)** — *Linear도 검색 느림·물리 한계*. **[[2026-06-08-users-dont-care-but-you-should]] *품질이 결과를 만들되 최적점이 있다*의 실증** — 완벽이 아니라 *대부분의 상호작용을 빠르게 느끼게 하는 우선순위*.

## 인상 깊은 문장

> *(요지)* 변경은 *로컬에 먼저 적용*된 뒤 서버로 비동기 전송된다 — 그래서 네트워크 지연이 숨겨진다.

> *(요지)* 50개 이슈를 업데이트해도 *목록 전체가 아니라 50개 셀만* 리렌더된다.

> *(댓글)* 데이터베이스는 *한 리전에만* 있어야 하므로, 지구상 대다수 사용자는 *100ms 이상 떨어져* 있다 — 물리적 한계는 남는다.

## 내 생각 · 적용점

기술 노트지만 *성능 craft의 모범 사례* — 방금 정리한 [[2026-06-08-users-dont-care-but-you-should]] *"안 보이는 품질이 결과를 만든다"*의 **실증 짝**. Linear의 속도는 *우연이 아니라 모든 계층의 의도적 빼기·로컬 우선·직접 조작*. 두 줄: **① 체감 속도는 *실제 속도가 아니라 우선순위* — 로컬 우선·optimistic으로 *대부분의 상호작용을 즉각*으로**(물리 한계는 숨기되 인정). **② 전문가 UX = 보지 않고도 쓰기**([[2026-05-29-proven-design-over-looking-futuristic]] 키보드·명령 팔레트). **친·반 AI 균형 카운팅 무관한 기술 노트** (부채 0 유지). **CRS 직접 적용**(crs-admin-web·crs-be-web React): *optimistic UI·코드 분할·키보드/명령 팔레트·필요한 것만 리렌더*로 운영자 도구의 체감 속도를 높임.

## 연관 자료
- [How is Linear so fast?](https://performance.dev/how-is-linear-so-fast-a-technical-breakdown) (원문)
- [GeekNews — 30276](https://news.hada.io/topic?id=30276)
- [[2026-06-08-users-dont-care-but-you-should]] — 품질이 결과를 만든다 *(실증 짝)*
- [[2026-05-29-proven-design-over-looking-futuristic]]·[[2026-05-28-favorite-developer-tools]] — 키보드·보지 않고 쓰기·좋은 기본값
- [[2026-06-01-my-software-north-star]] — 사용자 효용(체감 속도)
- [[2026-06-01-code-is-cheaper]]·[[2026-05-29-choose-boring-technology-2015]]·[[2026-06-08-taste-is-the-new-10x]] — 빼기·단순화·9개 제거

## 한 달 뒤 회고
*(2026-07-08 즈음 — CRS admin web에 optimistic UI·코드 분할·키보드 UX·필드 단위 리렌더를 적용해 체감 속도를 높였는지, 체감과 실측을 함께 측정했는지 기록.)*
