---
title: "Diagram Design (Cathryn Lavery) — 둥근 상자와 화살표 대신 위계와 읽는 순서를 강제하는 에이전트 다이어그램 스킬"
source_title: "diagram-design: 38 editorial diagram types for Claude Code, Codex, and Pi"
source_url: "https://github.com/cathrynlavery/diagram-design"
source_name: "GitHub (cathrynlavery/diagram-design)"
referrer_url: "https://news.hada.io/topic?id=33664"
summarized_at: "2026-09-14"
category: "ai"
tags: ["agent-skills", "diagramming", "claude-code", "design-system", "developer-tools", "harness-extension"]
---

# Diagram Design (Cathryn Lavery) — 둥근 상자와 화살표 대신 위계와 읽는 순서를 강제하는 에이전트 다이어그램 스킬

> 출처: [diagram-design](https://github.com/cathrynlavery/diagram-design) (Cathryn Lavery, GitHub) · 레퍼러: [GeekNews 33664](https://news.hada.io/topic?id=33664) · 정리일 2026-09-14

## 한 줄 요약

**Claude Code·Codex·Pi 등에서 자연어로 "다이어그램 그려줘"라고 요청하면, 모두 비슷비슷한 둥근 상자·화살표 대신 ***"단일 액센트 색, 4의 배수 그리드, 1px 헤어라인, 밀도 4/10"*** 같은 구체적 편집 디자인 규칙을 강제 적용해주는 스킬이다. 39종(README 목록 기준. 저장소 부제는 "38 editorial diagram types"로 숫자가 하나 어긋난다)의 다이어그램 유형을 다루고, 별도 빌드 없이 자체 완결된 HTML+SVG로 출력된다.**

## 핵심 포인트

- **핵심 철학은 "삭제"** — README가 명시한 태도는 ***"가장 높은 품질의 움직임은 보통 삭제다"***. 불필요한 요소·연결선을 줄이고 강조색은 핵심 요소 1~2개에만 쓰라는 Slack 발췌의 설명과 정확히 일치한다.
- **구체적 디자인 규칙 4가지** — ① 색상: 액센트 색 **단 하나만** ② 배치: 좌표·너비·간격이 전부 **4의 배수** ③ 선: **1px 헤어라인**, 그림자 없음, 모서리 반경 최대 10px ④ 밀도 목표 **10점 만점에 4점**(과밀 방지). 타이포그래피는 제목에 Instrument Serif, 노드에 Geist Sans, 기술 표기에 Geist Mono로 역할을 분리한다.
- **유형 스펙트럼이 넓다** — 아키텍처·IT 현황·순서도·시퀀스·상태머신·ER부터 타임라인·조직도·사용자여정·Wardley 맵·Sankey·생선뼈도·UML 클래스·DB 스키마·바/꺾은선/레이더/히트맵 차트까지 39개 카테고리로 분류돼, "내용에 맞는 표현 방식을 선택"한다는 Slack 발췌 설명대로 범용 다이어그램 도구가 아니라 **유형별 문법을 갖춘 편집 디자인 시스템**에 가깝다.
- **브랜드 온보딩 + 마이그레이션** — 웹사이트를 분석해 색상·글꼴을 60초 만에 자동 추출하고, draw.io·Mermaid·Excalidraw로 만든 기존 다이어그램을 이 규칙으로 다시 그려주는 가져오기 기능이 있다.
- **Claude Code·Codex·Pi·Copilot에 공통 설치** — `/plugin marketplace add cathrynlavery/diagram-design` (Codex는 `codex plugin marketplace add`, Pi는 `pi install <repo url>`) 한 줄로 여러 하네스에 동일하게 붙는다. 별 39.6k·포크 2.5k(2026-09-14 확인 기준)로 커뮤니티 채택이 상당히 넓다.
- **Claude Code 사용에 바로 도움되는 글** — 이 노트를 쓰는 세션(Claude Code) 자체가 마크다운 리포트가 아니라 시각 자료가 필요할 때 쓸 수 있는 실용 도구라, 이번 배치의 다른 "읽고 생각하는" 글들과 달리 **설치해서 바로 써먹을 수 있는 성격**의 정리다.

## 인상 깊은 문장

> "38 editorial diagram types for Claude Code, Codex, and Pi. Self-contained HTML + SVG. No shadows. No Mermaid slop."
> (저장소 부제 — Mermaid의 "성의 없는" 기본 렌더링을 직접 겨냥한 문구)

## 댓글

hada 원문(`news.hada.io/topic?id=33664`)은 이 세션의 egress 프록시에 `EGRESS_BLOCKED`로 차단돼 댓글 수·큐레이션 여부를 직접 확인하지 못했다. WebSearch로 GitHub 저장소 README, YouTube 소개 영상, 블로그 사용기(bswen.com, explainx.ai) 등을 교차 확인해 핵심 포인트를 재구성했다 — hada 댓글 스레드 자체의 반응(찬반·비판)은 이 노트에 담지 못한 출처 한계로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — Pi의 "미니멀 코어 + 필요할 때 확장" 철학이 실제로 동작하는 모습

[[2026-08-06-pi-minimalism-coding-harness]]에서 Pi 사용자가 HN 댓글로 남긴 ***"에이전트에게 요청하면 20초 만에 확장을 작성해준다"***는 관찰을 정리하며, 그 구체적 실물을 못 봤다는 아쉬움을 남겼었다. diagram-design이 Pi 설치를 `pi install <repo url>` 한 줄로 지원한다는 사실이 바로 그 패턴의 실물이다 — **기본 도구 4개짜리 하네스에 다이어그램이라는 무거운 기능을 통째로 넣는 대신, 필요할 때만 39종짜리 확장을 얹는다.** "핵심을 최소화하고 나머지는 그때그때 확장으로"라는 그 노트의 결론이 여기서 그대로 확인된다.

### 핵심 전이 2 — "범용 스킬 컬렉션보다 직접 만든 스킬이 살아남는다"는 명제와 정면으로 부딪히는 반례

[[2026-09-08-ask-hn-agent-skill-file-management]]가 정리한 HN 스레드의 결론은 ***"범용 스킬 모음보다 각자 업무에 맞춰 직접 만든 스킬이 살아남는다"***였다. diagram-design은 그 반대 사례처럼 보인다 — **특정 회사·프로젝트 업무가 아니라 "다이어그램"이라는 범용 카테고리 하나를 39종으로 세분화한 범용 스킬**인데도, 별 39.6k라는 채택 규모를 보면 범용 스킬도 **디자인 규칙이 구체적이고 결과물 품질이 검증 가능하면 살아남을 수 있다**는 걸 보여준다. 두 사례를 나란히 놓으면, 그 스레드의 명제는 "범용은 죽는다"가 아니라 "막연한 범용은 죽고, 품질 기준이 명확한 범용은 산다"로 다듬어야 정확해 보인다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 높은 글이다.** 온다 CRS 문서화·온보딩 자료에 바로 시험해볼 만하다 — ① **예약 플로우 시퀀스 다이어그램**(검색→요금계산→확정→결제) ② **CRS·PMS·채널매니저 통합 아키텍처 다이어그램**(파트너 호텔 기술 문서용) ③ **게스트 예약 사용자 여정(user journey)** 유형이 이미 39종 목록에 포함돼 있어 그대로 매칭된다 ④ 조직도·릴리스 타임라인 같은 사내 문서에도 바로 활용 가능. 다만 브랜드 온보딩이 "웹사이트를 분석해 자동으로 색상·글꼴을 추출"하는 기능이라 **사내망에 있는 비공개 디자인 시스템에는 수동 설정이 필요**할 수 있다는 점은 실제 도입 전에 확인이 필요하다.

## 연관 자료
- [[2026-08-06-pi-minimalism-coding-harness]] — "핵심 최소화 + 필요시 확장"이라는 하네스 철학이 이 스킬로 실물화된 사례
- [[2026-09-08-ask-hn-agent-skill-file-management]] — "직접 만든 스킬이 범용보다 낫다"는 명제와 부딪히는 반례로 대조
- [[2026-04-28-agent-harness-engineering]] — 하네스의 "도구 계층"에 스킬 레지스트리가 포함된다는 원 논의

## 한 달 뒤 회고
*(2026-10-14 즈음 — ①실제로 CRS 문서에 diagram-design을 설치해 예약 플로우·아키텍처 다이어그램을 만들어봤는지 ②hada 원문 접근이 복구돼 댓글 반응(비판·한계)을 소급 확인할 수 있는지 ③저장소 star 수·다이어그램 유형 수가 어떻게 늘었는지 점검.)*
