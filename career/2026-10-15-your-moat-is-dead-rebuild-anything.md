---
title: "당신의 경쟁 해자는 죽었다, 누구나 당신의 제품을 다시 만들 수 있다 (Mathias Klenk 추정, Tech Founder Stack) — PhotoCraft는 '재구현 비용 하락'의 증거이자, '기능 패리티가 CI 작업이 됐다'는 더 날카로운 주장의 근거로 재활용된다"
source_title: "Your Moat Is Dead. Anyone Can Rebuild Your Product. (추정 원문, GeekNews 한글 제목 역번역)"
source_url: "https://news.hada.io/topic?id=35384"
source_name: "GeekNews(id=35384) 경유. 원문은 Mathias Klenk, Tech Founder Stack(techfounderstack.com)의 동명 글(\"Your Moat Is Dead. Anyone Can Rebuild Your Product.\")로 WebSearch 교차확인으로 추정했으나, 직접 열람은 실패해 원문 대조는 못했다"
referrer_url: "https://news.hada.io/topic?id=35384"
published_at: "확인 불가 (2026년 10월 추정, 검색 인덱스상 발표 시점 자체가 불명확)"
summarized_at: "2026-10-15"
category: "career"
tags: ["competitive-moat", "photocraft", "ai-agents", "seat-based-pricing", "software-defensibility", "vc-thesis"]
---

# 당신의 경쟁 해자는 죽었다, 누구나 당신의 제품을 다시 만들 수 있다

> 출처: GeekNews 토픽 [id=35384](https://news.hada.io/topic?id=35384) · 추정 원문 [Your Moat Is Dead. Anyone Can Rebuild Your Product.](https://www.techfounderstack.com/p/your-moat-is-dead-anyone-can-rebuild) (Mathias Klenk, Tech Founder Stack) · 정리일 2026-10-15

> **출처 한계**: `news.hada.io`와 `techfounderstack.com` 모두 이 세션에서 egress 차단으로 직접 열지 못했다. WebSearch(extended 모드)로 Slack 발췌의 PhotoCraft·좌석당 과금·방어력 이동 서술과 거의 정확히 일치하는 글(Mathias Klenk, "Your Moat Is Dead. Anyone Can Rebuild Your Product.", Tech Founder Stack)을 찾아 그 요지를 재구성했다. **다만 이것이 GeekNews id=35384의 실제 원문이라는 확정 근거는 없다** — 제목 역번역과 내용 일치도가 높아 추정의 신뢰도는 높지만, 원문을 직접 대조하지 못했다. 검색 인덱스가 이 글의 발표일을 "7일 전"이라 표시하면서 동시에 매체 홈페이지는 "3월 29일"로 표기하는 등 ***발표 시점 자체도 WebSearch로 확정하지 못했다***. hada 댓글 수도 확인 불가.

## 한 줄 요약

**AI 에이전트가 관찰 가능한 소프트웨어를 재구현하는 비용을 크게 낮추면서, 기능 수·UX·파일 형식 같은 전통적 소프트웨어 해자가 약화되고 있다는 주장이다. Photoshop을 클린룸 방식으로 재구현한 PhotoCraft가 그 증거로 제시되는데, "기능 패리티는 이제 CI 작업이 됐다"는 식의 날카로운 표현으로 제시된다. 방어력은 서버사이드 로직·호스팅된 AI 기능·엔터프라이즈 보안 심사 같은, 에이전트가 쉽게 베끼지 못하는 지점으로 옮겨가고 있으며, 좌석당 과금 모델도 에이전트가 사람 대신 일하면서 압박받아 완료된 작업·제거된 리스크 기준 과금 같은 대안이 제안된다.**

## 핵심 포인트

- **기능 해자의 붕괴 — "기능 패리티가 CI 작업이 됐다"** — PhotoCraft가 자신의 명령 레지스트리를 Photoshop의 메뉴 구조와 대조해가며 기능을 맞춰간다는 사실을 들어, ***더 이상 "경쟁사가 우리만큼 많은 기능을 만들기는 어려울 것"이라는 가정이 성립하지 않는다***고 주장한다. 다만 가든의 [[2026-10-09-photocraft-rust-photoshop-clone]]이 이미 짚었듯, 실제로는 약 20개 도구가 빠져 있고 전문 워크플로 완성도는 Photoshop의 절반에도 못 미친다는 추정이 있어 — "CI 작업이 됐다"는 표현은 **방향성에 대한 비유**로 읽는 게 안전하다.
- **포맷 해자의 붕괴** — PhotoCraft가 테스트 코퍼스 대부분을 라운드트립(PSD 열고 다시 저장)한다고 주장한 걸 근거로, ***독점 파일 형식도 문서화·관찰되면 더는 전환 비용을 만들어내지 못한다***고 본다.
- **좌석당 과금 모델의 압박** — 에이전트가 사람이 하던 작업을 대신하면 ***좌석(seat) 수와 매출이 같이 줄어든다***는 구조적 문제를 짚고, 대안으로 ***완료된 작업·제거된 리스크·회수한 금액 기준 과금***을 제시한다.
- **방어력이 옮겨가는 곳 — 서버사이드 로직과 엔터프라이즈 신뢰** — 저자는 관찰·복제가 어려운 지점(서버 쪽 로직, Adobe Firefly 같은 호스팅된 AI 기능, Fortune 500급 보안 심사 통과 같은 엔터프라이즈 신뢰 축적)으로 방어력이 이동한다고 본다. ***모델 자체가 최후의 해자라는 통념에는 동의하지 않는다***는 입장도 밝힌 것으로 확인된다.
- **Slack 발췌의 "책임 부담·지속적 갱신"과의 연결(추정)** — Slack 발췌가 말줄임으로 끊은 "방어력은 책임 부담, 지속적 갱…"은, WebSearch로 확인한 "Fortune 500 보안 심사를 에이전트가 대신 통과시킬 수는 없다"는 주장과 같은 축(엔터프라이즈가 요구하는 책임·신뢰·지속적 유지보수)을 가리키는 것으로 추정되나, 정확한 문구는 확인하지 못했다.

## 인상 깊은 문장

> "Feature parity has become a CI job." (WebSearch로 종합한 2차 요약의 재구성 — 원문 축자 인용인지 패러프레이즈인지는 대조하지 못했다.)

## 댓글

**확인 불가.** `news.hada.io` 원문 전면 차단으로 hada 댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. **감안할 점**: ①이 글의 논증이 거의 전적으로 PhotoCraft 단일 사례에 의존한다 — n=1 사례를 "경쟁 해자 전반이 죽었다"는 일반 명제로 확장하는 논리적 비약의 위험이 있다. ②PhotoCraft README 자체가 "일상적 전문 작업 대체 수준 아님"이라 자인하고 있다는 사실([[2026-10-09-photocraft-rust-photoshop-clone]] 참고)과, 이 글의 "기능 패리티는 CI 작업이 됐다"는 낙관적 수사 사이에는 간극이 있다 — 재구현 *비용*이 낮아졌다는 것과 재구현 *완성도*가 높아졌다는 것은 다른 주장인데, 이 글은 둘을 다소 섞어 쓰는 것으로 보인다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-09-photocraft-rust-photoshop-clone]]이 "어떻게 만들었는가"를 다뤘다면, 이 글은 같은 PhotoCraft 사례를 "그래서 무엇을 의미하는가"로 확장한다

가든의 PhotoCraft 노트는 "500개 명령을 UI·CLI·JSON·MCP가 공유한다"는 **설계 자체**에 집중했고, CRS 적용점도 "운영 콘솔의 명령을 레지스트리로 통일하라"는 기술적 지침이었다. 이 글은 같은 사실(관찰된 동작을 클린룸으로 재현할 수 있다는 것)을 가져와 **"그래서 소프트웨어 해자가 무너진다"는 비즈니스 함의**로 한 단계 확장한다. 같은 사례를 다루는 두 노트가 서로 다른 몫 — 하나는 엔지니어링적 서술, 하나는 그 서술이 함의하는 해자론 — 을 맡고 있다는 점에서 중복이 아니라 상호 보완적이다.

### 핵심 전이 2 — [[2026-10-13-vibe-coded-photoshop-clones]]의 "검증 오라클 없는 영역" 지적과 정반대 톤으로, 같은 사례군을 바라본다

vibe-coded-photoshop-clones 노트는 "Adobe와 똑같이 동작하는가"에 명확한 패스/페일 오라클이 없어서 PhotoCraft 계열의 전문 기능 완성도가 느리게 수렴한다고 비관적으로 짚었다. 이 글은 반대로 "기능 패리티는 이제 CI 작업"이라는 낙관적 수사를 쓴다. **같은 PhotoCraft 사례를 보고 가든 안에 정반대 톤의 두 결론이 쌓인 셈** — 나란히 읽으면 "겉모습·기능 목록의 복제는 빨라졌지만, 전문가 기준의 완성도는 여전히 오라클 없는 영역이라 느리다"는 더 균형 잡힌 그림이 완성된다. 이 글이 가리키는 "해자 붕괴"는 전자(겉모습·기능 목록)에 대한 것이고, 후자(전문가 완성도)까지 붕괴했다고 보기엔 아직 이르다.

### 핵심 전이 3 — [[2026-09-28-moats-and-babelization-of-software]]와 정면으로 다른 결론을 내리면서, "어느 유형의 소프트웨어인가"가 그 차이를 설명할 수 있다

Mike Vernal의 글은 "카피 가능 = 해자 소멸이 아니다"라며 매일 재투자해 쌓은 제품 규모가 새 해자라고 주장했다. 이 글(Klenk)은 더 비관적으로 "기능·UX·형식의 해자는 실제로 약해지고 있다"고 본다. 이 간극은 ***소프트웨어의 종류 차이***로 설명될 여지가 있다 — Vernal이 말한 바벨 상단(업종별 대형 B2B 시스템)은 [[2026-09-21-competitive-moats-and-barriers-to-entry]]가 짚은 "system of record"형 전환 비용을 갖지만, PhotoCraft가 겨냥한 데스크톱 창작 도구는 사용자 데이터가 얽혀 있지 않고 관찰 가능한 UI·기능이 전부인 소프트웨어다. 세 노트를 겹치면 "데이터·업무흐름이 얽힌 system-of-record형 소프트웨어는 상대적으로 안전하고, 관찰 가능한 UI·기능이 가치의 전부인 소프트웨어는 실제로 위험하다"는 조건부 종합이 가능해진다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 온다의 CRS가 이미지 편집 소프트웨어처럼 순수 UI·기능 복제로 가치가 끝나는 제품은 아니다.** 다만 이 글의 논리를 CRS에 대입해 스스로 점검해볼 가치는 있다 — ***CRS의 해자가 정말로 [[2026-09-21-competitive-moats-and-barriers-to-entry]]가 말한 "system of record"(예약·재고·정산 데이터가 여러 채널·업무흐름에 얽힌 구조)에 있는지, 아니면 상당 부분이 관찰 가능한 UI·기능 목록에 있는지***를 솔직하게 나눠봐야 한다. 후자 비중이 크다면 이 글이 경고하는 "에이전트가 겉모습을 베낀다"는 위협에 그만큼 노출된 것이다. 좌석당 과금 압박 논의도, 온다의 과금 모델에 사용자 수·좌석 기반 요소가 있다면 장기적으로 점검해볼 만한 참고점이다.

## 연관 자료

- [[2026-10-09-photocraft-rust-photoshop-clone]] — 같은 PhotoCraft 사례의 엔지니어링적 서술(명령 레지스트리 설계), 이 글이 그 사실을 해자론으로 확장하는 원재료
- [[2026-10-13-vibe-coded-photoshop-clones]] — 같은 PhotoCraft 계열 사례를 "검증 오라클 없음"이라는 정반대 톤으로 바라본 노트, 둘을 겹치면 균형이 맞는다
- [[2026-09-28-moats-and-babelization-of-software]] — "카피 가능 ≠ 해자 소멸"이라는 반대 결론, 소프트웨어 유형(system-of-record vs 관찰 가능한 UI)의 차이로 두 결론의 간극을 설명할 수 있다
- [[2026-09-21-competitive-moats-and-barriers-to-entry]] — "system of record"형 전환 비용 개념, 이 글이 경고하는 해자 붕괴가 적용되지 않는 소프트웨어 유형을 짚어준다

## 한 달 뒤 회고

*(2026-11-15 즈음 — ①`techfounderstack.com` 접근이 가능해지면 원문을 직접 대조해 이 노트의 추정이 맞았는지 재검증. ②PhotoCraft 계열이 실제로 "기능 패리티"를 CI 작업처럼 자동 검증하는 단계까지 갔는지. ③온다 CRS 해자를 system-of-record 비중과 UI·기능 비중으로 나눠 솔직하게 점검해봤는지.)*
