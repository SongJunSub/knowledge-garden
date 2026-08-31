---
title: "Inter 대신 UI 글꼴을 고르는 두 가지 기준 (Yep! Type Foundry) — CSS로 보정 가능한 vertical metrics가 아니라, 보정 불가능한 x-height가 진짜 결정 기준이다"
source_title: "How to choose a UI font (and 10 Inter alternatives)"
source_url: "https://yeptype.com/article/inter-alternatives"
source_name: "yeptype.com"
referrer_url: "https://news.hada.io/topic?id=33057"
published_at: "2026-07-26"
summarized_at: "2026-08-31"
category: "frontend"
tags: ["typography", "ui-design", "inter-font", "vertical-metrics", "x-height", "css"]
---

# Inter 대신 UI 글꼴을 고르는 두 가지 기준 (Yep! Type Foundry)

> 출처: [How to choose a UI font (and 10 Inter alternatives)](https://yeptype.com/article/inter-alternatives) (Yep! Type Foundry, 추정 저자 Roman Shamin) · 정리일 2026-08-31
> **출처 확보**: yeptype.com 세션 내 egress 차단으로 직접 fetch 불가(Bash curl도 `403`). 아래 내용은 WebSearch 스니펫 교차검증으로 재구성했다 — 인용은 검색 요약을 통한 재구성이라 원문 정확한 문장과 다를 수 있다. 저자명도 파운드리 창립자 정보로 역추정한 것으로, 이 글의 실제 바이라인은 확인하지 못했다.

## 한 줄 요약

**Inter가 UI에서 쓰기 편한 진짜 이유는 "깔끔해서"가 아니라 두 가지 폰트 메트릭 때문이다 — ① 대문자 높이가 글자 상자 정중앙에 오는 vertical metrics, ② 대문자 대비 70~75%(이상적으로 75%)에 이르는 x-height.** 이 글의 핵심은 그 두 기준의 서열이다: 첫 번째(vertical metrics)는 이제 CSS `text-box-trim`으로 어느 정도 보정할 수 있게 됐지만, 두 번째(x-height)는 폰트 설계 자체에 박혀 있어 CSS로 고칠 수 없다 — 그래서 "Inter 대신 쓸 폰트"를 고를 때 실제로 확인해야 할 결정적 기준은 x-height 쪽이다.

## 핵심 포인트

- **첫 번째 기준: cap-centered vertical metrics** — 글자 상자(em box)의 위아래 여백이 균형을 이루어 대문자 높이가 상자 정중앙에 오면, 버튼 안의 텍스트가 별도 보정 없이 자연스럽게 중앙에 놓이고 아이콘과도 어긋남 없이 정렬된다. Inter는 이 metrics가 잘 잡혀 있어 "그냥 놓기만 해도 맞는" 폰트로 통한다.
- **CSS가 첫 번째 기준을 이미 어느 정도 구제한다** — `text-box-trim`(예: `trim-both`, `cap`~`alphabetic`)을 쓰면 브라우저가 폰트의 여백을 잘라내 대문자 높이·기준선(baseline)에 맞춰 상자를 다시 계산해준다. 즉 vertical metrics가 나쁜 폰트라도 이 CSS 속성으로 어느 정도 보정이 가능해졌다 — 버튼·칩·태그·헤딩처럼 한 줄 텍스트가 고정된 모양 안에 들어가는 곳에 특히 유효하다.
- **두 번째 기준(진짜 결정적): x-height** — 소문자 높이(x-height)가 대문자의 70~75%, 이상적으로는 75% 정도여야 소문자로 이루어진 단어 전체가 하나의 시각적 덩어리로 보여, 상자 중앙 정렬이 "그냥 봐도 자연스럽게" 느껴진다.
- **x-height는 CSS로 고칠 수 없다** — `text-box-trim`은 폰트의 바깥 여백(metrics)만 잘라낼 뿐, 소문자 자체의 형태 비율(x-height)은 건드리지 못한다. 이건 폰트 설계 단계에서 이미 확정된 값이라, CSS 레이어에서는 원천적으로 손댈 수 없다.
- **두 기준의 논리적 서열** — 첫 번째 기준(vertical metrics)은 이제 CSS로 상당 부분 구제 가능해졌으므로, Inter의 대안을 고를 때 폰트 자체의 metrics가 나쁘다고 무조건 탈락시킬 필요는 없어졌다. 대신 CSS로 절대 고칠 수 없는 두 번째 기준(x-height)이 실질적인 선택 기준으로 남는다 — 이게 이 글이 "Inter 대신 고를 폰트의 두 가지 기준"이라는 제목 아래 실제로 하고 있는 논증이다.
- **추천 대안** — 이 두 기준을 만족하는 독립 폰트 파운드리의 대안 폰트 10종을 제시한다(Inter의 라이선스·생태계 종속에서 벗어나려는 실무 수요에 대응하는 구성).

## 인상 깊은 문장

> "a good alternative to Inter should match Inter on the two things that make it work for UI: cap-centered vertical metrics and a tall x-height (around 75%)" — WebSearch 스니펫 기준 재구성 인용(원문 정확한 문장 대조는 못했음을 밝힌다).

## 댓글

**GeekNews(hada.io) 댓글 수는 이번 세션에서 확인하지 못했다** — hada.io 접속이 egress 정책으로 전면 차단됨. **HN·Lobsters에서 이 특정 아티클(`yeptype.com/article/inter-alternatives`)을 다루는 별도 토론 스레드는 WebSearch로 찾지 못했다.** **편향 유의**: 원문이 폰트 파운드리(Yep! Type Foundry) 자체 블로그이고, 저자로 추정되는 인물이 그 파운드리의 창립자다 — 추천하는 대안 폰트 10종 중 일부가 자사 상품일 가능성을 배제할 수 없으나, 원문을 직접 대조하지 못해 정확히 확인하지는 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 규칙에서 원리로: x-height가 왜, 얼마나 커야 하는지

[[2026-07-24-ui-design-tips-dannaway]]는 UI 타이포그래피 규칙 목록에 "단일 산세리프(예: Inter)"·"큰 x-height 폰트"를 이미 나열형으로 담고 있었다. 이 글은 그 나열형 규칙에 **왜** x-height가 커야 하는지(중앙 정렬의 시각적 자연스러움)와 **얼마나** 커야 충분한지(70~75%, 이상적으로 75%)라는 구체적 메커니즘과 수치를 채워 넣는다 — 규칙 목록이 원리로 한 단계 깊어지는 연결이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 조심스럽다는 점을 먼저 밝힌다.** 이 글의 논증(x-height 70~75%)은 라틴 알파벳 기준이고, 온다 CRS 관리자 화면·파트너 대시보드가 실제로 쓰는 한글 UI 폰트(Pretendard 등)에 같은 비율 기준이 그대로 적용되는지는 별도 검증이 필요하다. 다만 원칙 수준에서는 전이 가능하다: 디자인 시스템에서 UI 폰트를 교체하거나 새로 정의할 때 "x-height 비율"을 체크리스트 항목으로 명시해둘 수 있고, `text-box-trim` CSS 속성이 vertical metrics 문제를 상당 부분 구제해준다는 점은 버튼·칩 등 고정 컨테이너 안 텍스트 정렬 이슈에 바로 참고할 수 있는 실무 지식이다.

## 연관 자료

- [[2026-07-24-ui-design-tips-dannaway]] — "큰 x-height 폰트"·"단일 산세리프(Inter)"를 규칙으로만 담고 있던 노트에, 이 글이 왜·얼마나라는 메커니즘을 채워 넣음

## 한 달 뒤 회고

*(2026-09-30 즈음 — CRS 디자인 시스템의 폰트 토큰 정의 논의가 있었다면 x-height 기준을 실제로 참고했는지, 한글 폰트(Pretendard 등)에도 이 라틴 알파벳 기준이 유효하다는 근거를 별도로 찾았는지 확인. `text-box-trim`의 브라우저 지원 현황도 그새 바뀌었는지 점검.)*
