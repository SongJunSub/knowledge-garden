---
title: "Tenfold (Ink & Switch) — 10주년을 캔버스 위 살아있는 타이포그래피로 자축하며, 자신들이 정의한 '로컬퍼스트'를 다시 한 번 손으로 만져지는 물건으로 증명하다"
source_title: "Tenfold"
source_url: "https://www.inkandswitch.com/project/tenfold/story/"
source_name: "Ink & Switch"
referrer_url: "https://news.hada.io/topic?id=34277"
published_at: "2026-09-24"
summarized_at: "2026-09-26"
category: "frontend"
tags: ["ink-and-switch", "local-first", "creative-coding", "interactive-web", "canvas", "tools-for-thought"]
---

# Tenfold (Ink & Switch)

> 출처: [Tenfold](https://www.inkandswitch.com/project/tenfold/story/) (Ink & Switch, 인터랙티브 작품 본체는 tenfold.inkandswitch.com) · GeekNews 경유(https://news.hada.io/topic?id=34277) · 정리일 2026-09-26

## 한 줄 요약

**로컬퍼스트 소프트웨어 연구소 Ink & Switch가 창립 10주년을 기념해 "Tenfold"라는 인터랙티브 홈페이지/아트 작품을 공개했다 — 10년·10글자를 2D 캔버스 위에서 드래그·조작 가능한 살아있는 타이포그래피로 구현했고, Ivy Reese가 그 기술적·사회적 설계 과정을 별도 글로 공개했다.**

## 핵심 포인트

- "Tenfold: ten letters, ten years" — 랩의 홈페이지 전체를 클릭·드래그 가능한 캔버스 기반 인터랙티브 아트로 재구성했다.
- 2D canvas를 직접 감싼 ***커스텀 드로잉 API*** 위에서 글자를 만들려면 JavaScript 코드를 직접 써야 하는 구조로, Ivy Reese는 이를 "JS를 한 번도 써본 적 없는 사람에게도 좋은 입문 경험이 될 것"이라고 설명한다.
- "카오스 모드"에는 ***리사주 도형(Lissajous curve)***을 활용한 그리드/컨트롤 서피스가 들어간다 — 먼저 놀이용 플레이그라운드("도구를 만드는 도구")를 만들고 그 위에서 실제 결과물을 반복 개발하는 방식이었다.
- 방문자가 정해진 사용법이 아니라 자유롭게 클릭·드래그하며 ***의도된 규칙을 벗어난 장난스러운 표현***을 하도록 설계된 점을, Reese는 스스로 "기술적 설계이자 사회적 설계"라는 표현으로 정리해 별도로 공개했다.
- Ink & Switch는 2019년 "Local-first software" 에세이로 로컬퍼스트라는 용어 자체를 사실상 정의한 연구소다 — 이번 작품은 그들의 연구 결과물(예: Patchwork)에서 나온 기술을 실제로 얹어 만든 것이라, 연구소의 정체성을 그 자체로 증명하는 프로젝트다.

## 인상 깊은 문장

> "Play with it — click and drag everywhere." (Tenfold 소개 문구, 요약 인용)

## 댓글

**출처 한계**: news.hada.io와 inkandswitch.com 모두 이 환경에서 WebFetch가 egress 차단되어 원문 전체·GeekNews 원 댓글 수를 직접 확인하지 못했고, WebSearch 스니펫(HN 게시물, 타 블로그의 인용)으로만 내용을 재구성했다. Hacker News에 "Ink and Switch Interactive Homepage"라는 제목으로 스레드가 있다(item id=49842270). 검색 집계 기준으로는 다수의 댓글이 달린 것으로 보이나 정확한 포인트/댓글 수는 HN 페이지 직접 열람이 막혀 교차검증하지 못했다. 창작물 공개 글의 특성상 비판적 논조보다는 감상·기술적 호기심 위주일 가능성이 높다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 연구소, "철학을 도구로 구현"하는 반복된 패턴

[[2026-07-23-geoffrey-litt-explain-diff]]는 같은 Ink & Switch 소속 연구자 Geoffrey Litt이 "이해가 병목"이라는 자신의 에세이를 explain-diff라는 실제 도구로 직접 구현한 사례였다. Tenfold도 동일한 패턴이다 — Ink & Switch는 연구·철학을 말로만 남기지 않고 항상 손으로 만져지는 물건으로 증명하는 조직이라는 점이 이번에도 반복해서 확인된다.

### 핵심 전이 2 — 로컬퍼스트 계열의 원류

[[2026-08-29-syncular-offline-first-sqlite-sync-engine]], [[2026-09-08-apache-maka-agent-local-first-workspace]] 같은 최근 노트들이 "로컬퍼스트" 도구들을 다뤄왔는데, Ink & Switch는 이 흐름의 원류 연구소다. 최근 반 년간 이 가든에 쌓인 로컬퍼스트 도구들은 사실상 이들이 2019년에 던진 질문("클라우드에 종속되지 않고 내 데이터를 소유하는 소프트웨어")의 후속타에 가깝다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS는 인터랙티브 아트/캔버스 작업과는 거리가 있다. 다만 두 가지 원칙은 전이 가능하다: (1) 리서치 조직이 자기 철학을 실제로 만져지는 프로토타입으로 증명한다는 태도는 CRS 팀에도 적용할 만한 습관이고, (2) 로컬퍼스트 원칙(서버가 불안정해도, 오프라인이어도 핵심 기능은 동작) 자체는 호텔 프런트 데스크가 네트워크 불안정 상황에서도 체크인·객실 배정을 처리할 수 있어야 한다는 CRS의 오래된 요구와 직접 맞닿아 있다.

## 연관 자료

- [[2026-07-23-geoffrey-litt-explain-diff]] — 같은 Ink & Switch 소속, "철학을 도구로 구현"하는 동일한 패턴.
- [[2026-08-29-syncular-offline-first-sqlite-sync-engine]] — 로컬퍼스트 계열.
- [[2026-09-08-apache-maka-agent-local-first-workspace]] — 로컬퍼스트 계열.

## 한 달 뒤 회고

*(2026-10-26 즈음 — Tenfold 같은 "인터랙티브 홈페이지" 포맷이 다른 스튜디오/개인 사이트에도 유행처럼 번지는지, Ink & Switch가 이 캔버스 드로잉 API를 오픈소스로 공개하는지 확인.)*
