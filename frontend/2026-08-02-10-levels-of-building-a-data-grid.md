---
title: "데이터 그리드 구축의 10단계 (visualeaf.com) — 1년에 걸친 로그. 1백만 행을 40개 DOM 노드로 접는 양축 가상화부터 '아이콘을 SVG data URI 배경으로 바꾸면 사실상 공짜'라는 한 줄까지. 그리고 Canvas가 60fps를 주는데도 DOM을 택한 이유: '텍스트·선택·접근성·개발 속도를 원했고, 그 트레이드오프에 만족한다'"
source_title: "The 10 Levels of Building a Data Grid"
source_url: "https://visualeaf.com/blog/the-10-levels-of-building-a-data-grid/"
source_name: "visualeaf.com"
referrer_url: "https://news.hada.io/topic?id=31892"
published_at: "2026-07-28"
summarized_at: "2026-08-02"
category: "frontend"
tags: ["data-grid", "virtualization", "dom-performance", "css-compositor", "scroll-optimization", "canvas-vs-dom", "shadow-table", "object-pooling"]
---

# 데이터 그리드 구축의 10단계 (visualeaf.com) — 매 단계가 발견이었고, 그 발견의 결함이 다음 문제였다

> 출처: [The 10 Levels of Building a Data Grid](https://visualeaf.com/blog/the-10-levels-of-building-a-data-grid/) (visualeaf.com · GeekNews GN⁺ 요약) · 정리일 2026-08-02

## 한 줄 요약

**MongoDB·PostgreSQL용 데이터베이스 GUI를 만들며 **약 1년간 단속적으로** 테이블 렌더링을 최적화한 기록이다. 10단계로 구성되는데, 앞 절반은 **"무엇을 렌더링할지 줄이기"**이고 뒤 절반은 **"렌더링을 어떻게 값싸게 만들지"**다. Lv1(무차별 렌더링, 1,000행×20열에서 브라우저 크래시) → Lv2(**섀도 테이블** — 원본과 별도로 표시 문자열·타입·평탄화 경로를 사전 계산해두는 중간 표현) → Lv3(**수직 가상화**, 100만 행을 40개 DOM 노드로) → Lv4(**수평 가상화**, prefix-sum + 이진 탐색으로 500열도 12개만 렌더) → Lv5(**스크롤 경로 규율**, passive listener + rAF 응축 + 히스테리시스 버퍼 + 속도 추적으로 "빠르게 넘기면 렌더링을 아예 멈춘다") → Lv6(***"컴포지터에서 도는 CSS 속성은 정확히 두 개, transform과 opacity뿐이다"*** — 그 외는 전부 메인스레드를 깨운다) → Lv7(***"셀당 아이콘 엘리먼트"를 SVG data URI 배경 이미지로 바꾸면 브라우저가 한 번만 래스터화하고 GPU 캐시에서 blit한다*** — 저자가 "이 글에서 하나만 가져간다면 이것"이라 부른 트릭) → Lv8(**DOM 객체 풀링** — 스크롤은 아무것도 할당하지 않고, 같은 40개의 데운 DOM 노드에 값만 다시 쓴다) → Lv9(장인정신 단계: 드래그 정렬의 픽셀 정합, 위임된 툴팁 리스너, 서브픽셀 베이스라인 진동 수정) → Lv10(**다른 라이브러리 읽기** — AG-Grid류의 우선순위 작업 큐·컬럼 뷰포트 해싱과, **Canvas 그리드**의 트레이드오프 분석). 결론은 성능 승리 선언이 아니라 **의식적 트레이드오프 선언**이다: ***"좋은 텍스트, 진짜 선택, 진짜 접근성, 개발 속도를 원했다. Canvas 테이블만큼 매끄럽진 않은 테이블을 렌더링하는 데 1년을 썼지만, 나는 그 거래에 만족한다."***

## 핵심 포인트

- **Lv1 — 무차별 렌더링의 붕괴** — 10,000행×30열 = 300,000 DOM 노드, 노드당 약 1KB. ***"중첩 반복문 두 개는 그냥 안 되고, 수백 행·열을 넘어서면 브라우저가 크래시한다."***
- **Lv2 — 섀도 테이블** — 원본 문서와 분리된 **렌더링 전용 중간 데이터 구조**. ***"원본은 데이터가 무엇인지의 진실이고, 섀도 테이블은 테이블이 무엇을 표시하는지의 진실이다."*** 표시 문자열(truncated)·해석된 타입(아이콘·에디터 결정)·평탄화 경로(`"address.geo.lat"` → 키)를 미리 계산해 둔다.
- **Lv3 — 수직 가상화** — **Phantom**(전체 높이의 가상 컨테이너, 100만 행×40px = 4천만 px) + **Window Math**(`firstRow = floor(scrollTop / rowHeight)`) + **Slab**(버퍼 포함, 실제로 보이는 행만). DOM 노드 300,000 → **40개**. ***"사용자는 100만 행 테이블을 인지하지만, DOM은 40행만 쥐고 있다."***
- **Lv4 — 수평 가상화 (다들 놓치는 축)** — ***"거의 모든 개발자가 행은 최적화하면서 열은 무시한다."*** **Prefix Sums**로 O(1) 위치 조회 + **이진 탐색**으로 스크롤 오프셋에서 열 찾기(1,000열 기준 마이크로초). 500열 컬렉션도 **12개**만 렌더. 너비 변경 시에만 재구성(스크롤 중엔 안 함), 양쪽 200px 버퍼. ***"양 축을 윈도잉하면 렌더링 표면은 상수다 — 대략 40행×12열."***
- **Lv5 — 스크롤 경로 규율** — 프레임 예산 16.7ms(60fps). ①**Passive listener**(`preventDefault` 금지 선언 → 컴포지터가 독립 실행) ②**rAF로 프레임당 단일 업데이트**로 스크롤 이벤트 응축 ③**Fast-draw exit**(보이는 범위가 버퍼 안이면 정수 2개 비교로 즉시 반환) ④**히스테리시스 버퍼**(경계 40px 접근 시에만 재구성, 반복 피격 방지) ⑤**속도 추적** — ***"스크롤 이벤트 간 픽셀/밀리초를 추적한다. 임계값을 넘으면 사용자가 휙 넘긴 것이니, 렌더링을 아예 멈춘다."***
- **Lv6 — 레이아웃 속성은 세금이다** — ***"컴포지터에서 애니메이션되는 속성은 정확히 두 개, transform과 opacity뿐이다. 나머지는 전부 메인스레드를 깨운다."*** `top` 동기화 대신 `translate3d`(메인스레드 비용 0), 줄무늬 배경은 `repeating-linear-gradient`(2행 타일 1회만 래스터화), 열 구분선 높이를 phantom이 아니라 slab으로 제한.
- **Lv7 — 아이콘, 놀라운 최적화** — 셀당 아이콘 엘리먼트 = DOM 노드 수천 개 추가. 해법: **아이콘을 SVG data URI로 만들어 `background-image`로**, 같은 타입의 모든 셀이 **같은 URI를 참조**해 브라우저가 딱 한 번만 래스터화하고 GPU 캐시에서 blit. ***"각 아이콘은 사실상 공짜가 된다. 이 글에서 딱 하나만 가져갈 거라면, 이걸 가져가라."*** 편집기는 하이브리드 렌더링 — 평상시엔 순수 텍스트 span, 더블클릭 시에만 타입별 에디터 컴포넌트를 1개 마운트.
- **Lv8 — 재사용 vs 식별성** — 스크롤마다 요소를 생성·삭제하는 건 프레임워크에서 **가장 비싼 작업**. 해법은 **DOM 객체 풀**: 위치 기반 추적 함수(React `key`, Angular `trackBy`)로 같은 40개 행 요소를 **재바인딩만** 한다. ***"스크롤은 아무것도 할당하지 않는다 — 같은 데운 DOM 노드에 새 값만 써넣는다."***
- **Lv9 — 사소한 것들 (장인정신)** — 드래그 재정렬의 픽셀 단위 정합, 셀별 바인딩 대신 위임 리스너 1개로 처리하는 지연 툴팁, 서브픽셀 텍스트 베이스라인 진동 수정, DOM 위치가 아니라 절대 행 인덱스로 동기화하는 얼룩(zebra stripe) 색상 패리티.
- **Lv10 — 거인의 어깨** — **DOM 그리드(AG-Grid류)**: 우선순위 작업 큐로 DOM 작업 시간분할, 컬럼 뷰포트 해싱(no-op 스크롤 = 문자열 비교 1회), 스크롤 방향으로 행을 구성해 콘텐츠가 목표 지점에 먼저 나타나게, 셀 리스너 대신 위임 이벤트. **Canvas 그리드**: 장점은 60fps 유지·레이아웃/스타일 계산 0. 단점은 흐릿한 텍스트(래스터화 오프셋), 제한된 선택(셀 단위), 타원 없는 자르기, **셀당 기능 = draw 코드 + hit-test 코드를 직접 구현**해야 함.
- **결론 = 트레이드오프 선언** — ***"좋은 텍스트, 진짜 선택, 진짜 접근성, 개발 속도를 원했다. Canvas 테이블만큼 매끄럽지 않을 테이블 렌더링에 1년을 썼지만, 그 거래에 만족한다."***

## 인상 깊은 문장

> "Two nested loops just doesn't work and would just crash your browser after several hundreds rows and columns."

> "The user perceives a million-row table. The DOM holds forty rows."

> "With both axes windowed, the rendered surface is constant: roughly forty rows by twelve columns."

> "Track pixels per millisecond between scroll events. When it crosses a threshold the user flicked, so stop rendering entirely."

> "Exactly two properties animate on the compositor, transform and opacity. Everything else wakes up the main thread."

> "Each icon is now essentially free. If you take one trick from this post, take this one."

> "Scrolling never allocates anything, the same warm DOM nodes just get new values written into them."

> "I wanted nice text, real selections, real accessibility, and development speed. Even though I spent a year optimizing the rendering of a table that won't get as smooth as a canvas table, I'm at peace with that trade."
> (이 글 전체의 결론. 성능 최적화 글의 결말이 "이겼다"가 아니라 "이 거래를 받아들인다"인 게 드물고 정직하다)

> "Every stage felt like a discovery. I would find a technique would solve a problem, then a flaw in that technique would become the next problem."

## 댓글

**hada 댓글 정보 없음** — GeekNews 페이지에 댓글 입력 폼만 있고 게시된 댓글은 확인되지 않는다.

**읽을 때 감안** — ①**저자 개인 실무 기록**이고 벤치마크 수치(예: "DOM 노드 40개")는 **저자 자신의 구현에 대한 자기 보고**다 — 다른 그리드 라이브러리와의 정량 비교는 없다. ②**1년이라는 기간이 "on-and-off"**라고 명시돼 있어 실제 순수 작업 시간은 알 수 없다. ③**Canvas vs DOM 논의는 저자 관점에서만** 서술됐다 — Canvas 그리드를 실제로 만들어 비교한 게 아니라 **DOM을 택한 이유의 서술**이다. 반대 선택(예: 게임 엔진급 데이터 그리드가 필요한 트레이딩 앱)을 한 팀의 관점은 없다. ④댓글이 없어 **동료 검증이 전혀 없다.**

## 내 생각 · 적용점

### 핵심 전이 1 — Lv2(섀도 테이블)는 [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]·[[2026-07-24-everyone-should-know-simd]]가 반복해 온 원칙의 UI 렌더링판이다

***"원본은 데이터가 무엇인지의 진실, 섀도 테이블은 테이블이 무엇을 표시하는지의 진실"*** — 이건 **원본 데이터와 표시 계층을 분리**하는 원칙이고, 이미 이 가든에 여러 형태로 있다. 백엔드에서는 도메인 엔티티와 DTO/뷰 모델의 분리로, 이번 주 SIMD 노트에서는 "핫루프를 명시적으로 다루기 위한 자료구조 준비"로 반복됐다. 공통점: **매 프레임/매 요청마다 재계산하는 대신, 변경 시점에 한 번 계산해서 저장해 둔다.** 여기서는 그게 표시 문자열의 truncation, 아이콘 타입 결정, 경로 평탄화다 — 스크롤할 때마다 다시 계산하면 그 순간 프레임 예산이 깨진다.

**실무 규칙: "매 렌더/매 스크롤에 걸리는 계산인가, 데이터 변경 시에만 걸리는 계산인가"를 먼저 나눈다.** 후자를 앞당겨 캐시해두는 게 이 글의 Lv2~Lv4 전체를 관통하는 단일 원칙이다.

### 핵심 전이 2 — Lv6·Lv7은 "측정되지 않는 비용은 관리되지 않는다"는 이번 시즌의 명제를 프레임 예산으로 증명한다

***"컴포지터에서 도는 속성은 transform과 opacity뿐"***이라는 문장은 CSS 스펙을 아는 사람에겐 새롭지 않지만, **왜 이게 "세금"인지를 프레임 예산(16.7ms)이라는 구체적 숫자와 연결**시킨 게 이 글의 가치다. [[2026-07-25-why-software-factories-fail]]에서 반복한 *"측정되는 것만 최적화된다"*를 이 글은 뒤집어서 보여준다 — **저자는 프레임 예산을 실제로 측정하고 있었기 때문에, "top 동기화가 메인스레드를 깨운다"는 사실을 발견할 수 있었다.** 측정 없이는 이 최적화 자체가 존재할 수 없다.

그리고 Lv7의 아이콘 트릭이 이 시즌 반복해서 나온 *"돈 되는 최적화는 화려한 게 아니라 값싼 것"* 패턴의 완벽한 예시다 — **아키텍처 변경이 아니라, "엘리먼트를 배경 이미지로 바꾼다"는 한 줄이 전체 최적화 목록 중 저자가 가장 강조한 항목**이다. 화려함과 효과는 반비례하는 경우가 많다.

### 핵심 전이 3 — 결론의 문장이 이 노트 전체의 존재 이유다: **트레이드오프를 명시적으로 진술하는 것 자체가 엔지니어링**

***"Canvas 테이블만큼 매끄럽지 않을 걸 알면서도 그 거래에 만족한다"*** — 이건 [[2026-07-23-sharpening-knives-for-the-wrong-fight]]가 말한 *"만들 수 있다고 만들어야 하는 건 아니다"*의 거울상이다. 저자는 **더 빠른 선택지(Canvas)를 알면서도 의도적으로 포기**했고, 그 이유(텍스트 품질·선택·접근성·개발 속도)를 명시했다. 이게 [[2026-07-24-everyone-should-know-simd]] HN 댓글의 *"측정과 자료구조가 먼저"*와 짝을 이루는 **"목표를 먼저 정하고 그 목표에 맞는 기술을 고른다"**는 원칙이다 — 60fps가 항상 목표는 아니다.

**실무로 옮기면**: 성능 작업을 시작하기 전에 *"우리가 정말 원하는 게 뭔가 — 최대 fps인가, 접근성인가, 개발 속도인가"*를 먼저 적어두면, 이후의 모든 트레이드오프 판단이 훨씬 빨라진다. 이 글의 Lv1~Lv9는 전부 이 질문에 대한 답("DOM을 유지하겠다")이 정해진 뒤의 **집행**이었다.

### 핵심 전이 4 — 정직한 급소: **이 글의 최적화 대부분은 "가상 스크롤 그리드가 필요한 규모"에서만 값이 있다**

10,000행 미만의 테이블이라면 Lv3~Lv8 전체가 불필요한 복잡성이다. [[2026-07-24-everyone-should-know-simd]]의 HN 반론(*"모두가 이걸 알아야 한다는 건 과장, 측정이 먼저"*)이 여기에도 그대로 적용된다 — **행 수를 재보지 않고 이 글의 기법을 전부 적용하면 YAGNI 위반**이다. 저자 자신도 이걸 *발견의 연쇄*로 서술했다("한 기법이 문제를 풀면, 그 기법의 결함이 다음 문제였다") — 즉 **각 레벨은 이전 레벨이 실제로 병목이 됐을 때만 등장했다**는 뜻이다. 순서대로 다 구현하는 체크리스트가 아니라, **병목이 확인될 때 다음 카드를 꺼내는 순서도**로 읽어야 한다.

## 호스피탈리티 / CRS 적용 포인트

CRS 프런트엔드에는 대량 행 테이블(예약 목록, 룸 인벤토리, 요금 캘린더, 거래 내역)이 실제로 있어 **직접 적용 가능성이 높은 글**이다.

- **먼저 "몇 행인가"부터 잰다(전이 4).** 사업자 대시보드의 예약/거래 테이블이 수백 행이면 이 글의 기법 대부분은 과잉이다. **수만 행 이상**(대형 프로퍼티의 장기 거래 내역, 멀티 프로퍼티 통합 뷰)에서만 가상화가 값을 낸다.
- **섀도 테이블 패턴은 지금도 값이 있다(전이 1).** 요금 상태·예약 상태 표시용 아이콘/라벨을 매 렌더마다 도메인 객체에서 계산하고 있다면, **상태 변경 시에만 계산되는 표시 전용 캐시**로 분리하는 게 첫 번째로 저렴한 개선이다.
- **아이콘/상태 배지는 Lv7 트릭을 그대로 쓸 수 있다.** 예약 상태별 아이콘(확정/대기/취소)을 개별 DOM 엘리먼트로 그리고 있다면 SVG background-image + 공유 URI로 전환하는 게 리스크 없는 개선이다.
- **직접 만들기 전에 Lv10처럼 기존 라이브러리를 먼저 읽는다.** AG-Grid·TanStack Table 같은 성숙한 라이브러리가 이미 이 글의 Lv1~Lv9를 구현해 뒀다 — **온다 규모에서 자체 그리드 엔진을 1년 들여 만드는 건 대개 정당화되지 않는다.** 이 글은 "어떻게 만드는가"의 레퍼런스로 쓰고, "우리가 만들어야 하는가"는 별개로 판단([[2026-07-23-sharpening-knives-for-the-wrong-fight]]).
- **성능 목표를 먼저 명시(전이 3).** 사업자용 CRS는 접근성·정확한 선택(복사/붙여넣기, 셀 선택)이 게임처럼 매끄러운 스크롤보다 중요할 가능성이 높다 — 이 글의 저자와 같은 결론(DOM 선택)에 도달할 확률이 높지만, **그 이유를 먼저 적어두는 습관** 자체가 이 글의 진짜 교훈이다.

## 연관 자료
- [[2026-07-24-everyone-should-know-simd]] — *"측정이 먼저" 원칙이 이 글의 프레임 예산 계측과 같은 실천*
- [[2026-07-25-why-software-factories-fail]] — *"측정되지 않는 것은 관리되지 않는다"의 프레임 단위 증명*
- [[2026-07-23-sharpening-knives-for-the-wrong-fight]] — *"만들 수 있다고 만들어야 하는 건 아니다" — Canvas를 알면서도 DOM을 택한 것의 거울상*
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — *"내 경계를 직접 계측하라"는 다른 도메인(토큰)에서의 같은 규율*
- [[2026-07-24-software-factories-light-and-dark]] — *"이 글은 발견의 연쇄였다"의 계획 없는 반복 버전. 매 단계가 다음 문제를 드러냈다는 서술의 짝*

## 한 달 뒤 회고
*(2026-09-02 즈음 — ①우리 CRS 대시보드 테이블 중 실제로 수만 행 규모인 게 있는지 재봤는지, ②있다면 자체 가상화 대신 AG-Grid/TanStack Table 도입을 검토했는지, ③상태 아이콘을 SVG background-image 트릭으로 바꿔봤는지, ④성능 목표(접근성 vs fps)를 명시한 뒤 판단을 내린 사례가 있었는지 기록.)*
