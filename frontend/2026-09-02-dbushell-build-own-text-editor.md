---
title: "Fine, I'll build my own text editor (dbushell) — canvas·contenteditable·textarea 세 갈래를 직접 만들어보고 확인한 '렌더링 자유도 vs 네이티브 편집 기능' 트레이드오프"
source_title: "Fine, I'll build my own text editor!"
source_url: "https://dbushell.com/2026/09/01/text-editor/"
source_name: "dbushell.com"
referrer_url: "https://news.hada.io/topic?id=33132"
published_at: "2026-09-01"
summarized_at: "2026-09-02"
category: "frontend"
tags: ["text-editor", "contenteditable", "canvas", "textarea", "accessibility", "syntax-highlighting", "tree-sitter", "dont-roll-your-own"]
---

# Fine, I'll build my own text editor (dbushell)

> 출처: [Fine, I'll build my own text editor!](https://dbushell.com/2026/09/01/text-editor/) (dbushell · GeekNews 경유) · 정리일 2026-09-02
> **출처 한계**: `news.hada.io`, `dbushell.com`, Hacker News, Lobsters 모두 이 세션에서 egress 차단되어 직접 fetch 불가. 아래 내용은 Slack 발췌와 WebSearch 스니펫 교차검증으로 재구성했다.

## 한 줄 요약
**브라우저에서 코드 에디터를 직접 만들려는 시도를 `<canvas>` → `contenteditable` → `<textarea>` 순서로 실제로 구현해보며, "렌더링 자유도"와 "네이티브 편집 기능(선택·실행취소·접근성)" 사이의 트레이드오프를 정직하게 기록**한 글. 최종적으로는 텍스트를 canvas가 아니라 `overflow` div에 네이티브로 렌더링하고 `contenteditable="plaintext-only"`로 편집 가능하게 만드는 하이브리드 접근으로 수렴했다.

## 핵심 포인트
- **`<canvas>` 시도**: 렌더링 완전 자유도가 있지만, ***선택, 실행 취소/재실행, 여러 줄 붙여넣기, 스크롤을 전부 직접 구현***해야 한다. 접근성 지원도 사실상 처음부터 새로 만들어야 하는 게 결정적 단점.
- **`contenteditable="plaintext-only"` 시도**: 선택과 실행 취소 기록을 브라우저에 위임할 수 있고 접근성 지원도 상당 부분 브라우저가 무료로 제공한다. 그러나 텍스트가 길어질수록 ***브라우저별로 예측하기 어려운 성능 저하***가 나타난다.
- **`<textarea>` 시도**: 긴 텍스트에서도 안정적이지만, 커스텀 CSS `::highlight` API를 쓸 수 없어 신택스 하이라이팅을 위한 ***별도 오버레이 레이어가 추가로 필요***해진다.
- **최종 접근**: 텍스트는 canvas가 아니라 `overflow` div에 네이티브로 렌더링해 하나의 텍스트 노드 안에 모든 콘텐츠를 유지하고, `contenteditable="plaintext-only"`로 편집 가능하게 만드는 방식.
- **성능 후속 과제**: Tree-sitter로 구문 트리를 생성하고 그 트리를 순회해 ***화면에 보이는 줄에만*** 하이라이트를 생성하는 게 더 견고한 해법이라고 제안한다(가상화와 같은 발상).

## 인상 깊은 문장
> "Ok, I'll write my own text editor" (Slack 발췌 제목 원문 뉘앙스 — WebSearch 재구성 기준 원제는 "Fine, I'll build my own text editor!")

## 댓글
- **hada 댓글 수 미확인** — `news.hada.io`가 이 세션에서 egress 차단되어 페이지를 열지 못했다.
- **Hacker News**에 동일 제목의 스레드(`item?id=49524863`)가 존재함은 확인했으나, 정확한 포인트·댓글 수는 신뢰도가 낮아 숫자를 명시하지 않는다.
- **Lobsters**에도 동일 글 스레드가 존재하며, 검색 스니펫 기준 4개 댓글에서 CSS 스타일링 제약과 `contenteditable`의 단점이 논의된 것으로 보이나 원문 대조 전이라 정확도가 낮다.
- **n=1 주의**: 저자 한 명의 개인 프로젝트 실험기다.

## 내 생각 · 적용점
**전이 1** — [[2026-08-02-10-levels-of-building-a-data-grid]]의 결론(***"좋은 텍스트, 진짜 선택, 진짜 접근성, 개발 속도를 원했다. Canvas 테이블만큼 매끄럽지 않을 테이블에 1년을 썼지만 그 거래에 만족한다"***)과 이 글의 canvas→contenteditable→textarea 탐색은 정확히 같은 축이다. 그리드와 텍스트 에디터라는 다른 도메인에서, 두 저자 모두 완전한 커스텀 렌더링의 성능 우위를 알면서도 최종적으로는 네이티브 브라우저 기능을 살리는 쪽으로 수렴했다.

**전이 2** — [[2026-05-21-susam-dont-roll-your-own-web-ui]]가 세운 "검증되지 않은 자체 구현보다 브라우저 기본 동작을 살리라"는 원칙에 비추면, 이 글의 결말은 그 원칙을 실전에서 그대로 실천한 사례다. 다만 저자는 원칙을 먼저 알고 시작한 게 아니라 canvas부터 부딪혀보고 "역으로" 그 결론에 도달했다.

**전이 3** — [[2026-08-29-gui-must-be-fully-keyboard-operable]]가 지적한 "접근성은 자체 구현 시 처음부터 다시 만들어야 하는 비용"이, 이 글에서 canvas 접근을 포기한 핵심 이유 그대로 재확인된다.

## 호스피탈리티 / CRS 적용 포인트
온다 CRS Admin에는 코드/신택스 하이라이팅이 필요한 화면이 현재 없어 이 글의 직접 적용은 멀다. 다만 전이 가능한 원칙: (1) canvas부터 시작하지 말고 `contenteditable`(가능하면 `plaintext-only`)을 먼저 검토, (2) 텍스트 규모를 먼저 재서 성능 저하 임계점을 넘는지 확인, (3) 자체 신택스 하이라이팅이 필요해지면 "가시 범위만 렌더링" 가상화 원칙을 적용할 수 있다.

## 연관 자료
- [[2026-08-02-10-levels-of-building-a-data-grid]] — Canvas vs DOM 트레이드오프를 데이터 그리드에서 겪은 동일 구도, "그 거래에 만족한다"는 결론의 짝
- [[2026-05-21-susam-dont-roll-your-own-web-ui]] — "브라우저 기본 편집 기능을 대체하지 말라"는 원칙을 시행착오 끝에 재발견한 사례
- [[2026-08-29-gui-must-be-fully-keyboard-operable]] — 자체 구현 시 접근성을 처음부터 다시 만들어야 한다는 비용이 이 글에서도 재확인됨

## 한 달 뒤 회고
*(2026-10-02 즈음 — `dbushell.com`·HN·Lobsters 접근이 가능해지면 원문 코드 예시와 정확한 댓글 수·논점, Tree-sitter 기반 후속 최적화 결과를 확인해 이 노트를 보강.)*
