---
title: "브라우저의 메인 스레드는 비싸다 (이선협/kciter) — 60Hz에서 프레임당 예산은 실측하면 10ms 안팎, 그 좁은 창 안에서 쪼개고(Splitting) 묶고(Batching) 우선순위 매기고(Prioritizing) 미루는(Deferring) 네 가지가 전부다"
source_title: "The Browser's Main Thread Is Expensive"
source_url: "https://kciter.so/posts/the-expensive-main-thread/en/"
source_name: "kciter.so"
referrer_url: "https://news.hada.io/topic?id=33205"
published_at: "2026-07-11"
summarized_at: "2026-09-04"
category: "frontend"
tags: ["web-performance", "main-thread", "web-worker", "compositor-thread", "rendering", "frontend-optimization"]
---

# 브라우저의 메인 스레드는 비싸다 (이선협/kciter)

> 출처: [The Browser's Main Thread Is Expensive](https://kciter.so/posts/the-expensive-main-thread/en/) (이선협/kciter · GeekNews 경유) · 정리일 2026-09-04

## 한 줄 요약

**브라우저는 이벤트 핸들러·타이머·네트워크 콜백 같은 JavaScript 실행과 DOM·스타일 업데이트(화면 그리기)를 같은 메인 스레드 하나에서 처리한다. 60Hz 디스플레이에서 프레임당 예산은 16.6ms지만 브라우저 자체 처리 비용을 빼면 실질 가용 시간은 10ms 안팎이고, 120Hz에서는 그마저 절반이다. 이 좁은 예산 안에서 프론트엔드 성능 문제 대부분을 다루는 전략은 딱 두 갈래로 갈린다 — 메인 스레드 안에서 작업을 효율적으로 배분하는 것(분할·배치·우선순위화·지연)과, 작업을 메인 스레드 밖으로 아예 옮기는 것(Web Worker, Compositor 스레드).**

## 핵심 포인트

- **프레임 예산은 이론치가 아니라 실측치** — 60Hz의 16.6ms 중 브라우저 자체 처리 비용을 빼면 개발자가 실제로 쓸 수 있는 시간은 ***10ms 안팎***이고, 120Hz 디스플레이에서는 그 예산이 다시 절반으로 줄어든다.
- **분할(Splitting)이 나머지 세 전략의 전제** — 작업에 경계가 있어야 뒤로 미루거나 다른 작업을 그 사이에 끼워 넣을 수 있다. 쪼갤 수 없는 긴 작업은 애초에 스케줄링 대상이 될 수 없다.
- **배치(Batching)** — `classList.add('a', 'b', 'c')`를 한 번 호출하는 것이 세 번 따로 호출하는 것보다 싸다. 스타일 재계산이 3번이 아니라 1번으로 압축되기 때문.
- **우선순위화·지연(Prioritizing/Deferring)** — "이 작업이 지금 당장 실행돼야 하는가"를 재질문한다. 초기 페이지 로드는 지연이 가장 큰 이득을 주는 전형적인 지점이다.
- **쪼갤 수 없는 무거운 작업은 전제를 바꿔야 한다** — 분할·배치·지연으로 해결 안 되는 무거운 연산은 Web Worker로 메인 스레드 밖에 완전히 옮긴다. ***Compositor 스레드는 transform·opacity처럼 합성만으로 처리되는 CSS 속성만 맡아 레이아웃·페인트 단계 자체를 건너뛴다*** — 렌더링 파이프라인 전반부는 여전히 메인 스레드 책임이고, 마지막 합성 단계만 넘겨받는 구조다.

## 인상 깊은 문장

> "Heavy work that can't be split must change the premise and not be done on the main thread at all." (원문 요지)

## 댓글

**출처 한계 있음.** GeekNews 원문 페이지(news.hada.io)는 이 세션에서 egress 자체가 차단돼 hada 댓글 수를 확인하지 못했다. 다만 이 글은 원저자의 개인 devlog(kciter.so)에 발행된 뒤 **Hacker News에 등록**돼 있음을 WebSearch로 확인했다(HN item id=49522137, "The Browser's Main Thread Is Expensive | Hacker News"). 다만 HN 자체도 이 세션에서 직접 열람이 막혀 포인트·댓글 수·논쟁 내용까지는 확인하지 못했다 — "HN에 올라간 사실" 이상은 정직하게 미확인으로 남긴다. 저자는 국내 프론트엔드 개발자 이선협(kciter, 필명)으로, 별도 X 게시(7/20)에서 같은 글을 "브라우저의 메인 스레드는 비싸다"라는 한글 제목으로 직접 공유한 것도 교차 확인했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Compositor 전용 속성(transform·opacity)이라는 같은 주장이 [[2026-08-02-10-levels-of-building-a-data-grid]]에도 그대로 등장한다

데이터 그리드 구축기의 Lv6는 정확히 같은 명제를 "***컴포지터에서 도는 CSS 속성은 정확히 두 개, transform과 opacity뿐이다 — 그 외는 전부 메인스레드를 깨운다***"로 표현했다. 서로 다른 저자가 서로 다른 문제(데이터 그리드 스크롤 vs 일반 프론트엔드 성능론)에서 독립적으로 같은 병목·같은 해법에 도달했다는 것은, 이 지식이 이미 프론트엔드 성능 최적화의 표준 어휘로 자리 잡았다는 신호다.

### 핵심 전이 2 — "체감 속도"를 만드는 [[2026-06-08-how-is-linear-so-fast]]의 실전 전략들은 이 글의 원칙을 구체 사례로 채운 것

Linear가 필드 단위 반응성(리렌더 범위 최소화)·짧은 GPU 친화 애니메이션으로 체감 속도를 만든 것은, 이 글의 "분할해서 리렌더 범위를 줄이고, 컴포지터가 처리 가능한 속성만 애니메이션에 쓴다"는 원칙의 실제 적용 사례다. 다만 Linear 노트의 댓글이 지적했듯 **체감과 실측(초기 로드 30초, DB 리전 지연)은 다를 수 있다** — 이 글의 원칙도 만병통치약이 아니라 예산 안에서의 트레이드오프임을 함께 새겨둘 만하다.

## 호스피탈리티 / CRS 적용 포인트

온다 CRS의 예약 캘린더·요금 그리드처럼 **행×열이 많고 실시간 갱신이 잦은 화면**은 이 글의 원칙이 직접 적용되는 영역이다 — 특히 대량 셀 업데이트 시 `classList` 배치 호출, 애니메이션은 transform/opacity로 제한, 무거운 요금 계산·검증 로직은 Web Worker로 분리하는 식. [[2026-08-02-10-levels-of-building-a-data-grid]]가 이미 이 가든에 남긴 실전 체크리스트와 함께 CRS 프런트엔드 성능 튜닝 시 1차 참고 자료로 묶어둘 만하다.

## 연관 자료
- [[2026-08-02-10-levels-of-building-a-data-grid]] — *"컴포지터는 transform·opacity만" 같은 주장이 독립적으로 재확인되는 계열*
- [[2026-06-08-how-is-linear-so-fast]] — *이 글의 원칙을 실전 제품 사례로 채운 "체감 속도" 설계*

## 한 달 뒤 회고
*(2026-10-04 즈음 — GeekNews 접근이 가능해지면 hada 댓글 수·HN 포인트/논쟁을 보완했는지, CRS 예약 캘린더 화면에 이 원칙(배치·컴포지터 전용 속성)을 실제로 적용해봤는지 기록.)*
