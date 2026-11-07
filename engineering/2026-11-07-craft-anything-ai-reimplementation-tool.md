---
title: "Craft Anything - 웹사이트, 앱, 게임을 분석하고 AI로 재구현하는 도구 (ArtCraft 추정) — 284개 리버스 엔지니어링 도구를 MCP로 코딩 에이전트에 쥐여주고 분석→구현→비교→개선을 자동 반복시킨다"
source_title: "Craft Anything (추정, ArtCraft/Storytold)"
source_url: "https://news.hada.io/topic?id=36730"
source_name: "ArtCraft (추정)"
referrer_url: "https://news.hada.io/topic?id=36730"
published_at: "확인 불가"
summarized_at: "2026-11-07"
category: "engineering"
tags: ["reverse-engineering", "ai-coding-agent", "mcp", "clean-room", "decompilation", "game-preservation"]
---

# Craft Anything - 웹사이트, 앱, 게임을 분석하고 AI로 재구현하는 도구

> 출처: [Craft Anything (추정)](https://news.hada.io/topic?id=36730) (ArtCraft 추정 · GeekNews) · 정리일 2026-11-07

## 한 줄 요약
**Craft Anything은 웹사이트·앱·게임의 화면과 동작을 분석해 원본 코드를 읽지 않고도("Clean room" 모드) AI 코딩 에이전트가 새 프로젝트로 재구현하도록 분석→구현→비교→개선을 반복시키는 도구로, 별도 바이너리 분석이 필요하면 "Deep" 모드로 전환할 수 있다.**

## 핵심 포인트
- 원본과 원하는 결과를 지정하면 ***분석 → 구현 → 비교 → 개선***을 거쳐 새 프로젝트를 만들어 줌 — "이 웹사이트를 재현해 줘", "이 게임을 Rust로 만들어 줘"처럼 요청 가능
- 원본과 다른 부분을 찾아 반복 수정 — 웹사이트는 ***세 화면 너비에서 레이아웃, 시각적 유사성, 메뉴 동작***을 비교
- 기본 ***Clean room 모드***는 원본 코드나 파일을 읽지 않고 화면·배치·색상 등 겉으로 드러난 동작만으로 작업 — 운영체제 수준 샌드박스는 아니며 에이전트 자체 권한은 별도 적용
- Deep 모드는 바이너리 분석까지 들어가는 것으로 추정(Slack 발췌 절단으로 세부 미확인)
- WebSearch 교차확인 결과 ArtCraft(Storytold)의 오픈소스 프로젝트로 추정되며, ***284개 도구로 구성된 리버스 엔지니어링 엔진***(네이티브 프로그램·.NET·Java·Android·Electron·JS·펌웨어·게임 파일 지원)이 핵심 — 각 도구가 CLI 서브커맨드이자 MCP 도구로도 동작해 에이전트가 전체 재구현을 수행할 수 있음
- 웹사이트 검증은 오늘 기준 동작하고, 게임 재구현은 Unity·Unreal·Godot을 지원하지만 앱·게임의 ***동작 검증은 아직 부분적***이라는 점도 WebSearch에서 확인됨 — 즉 "완성형 도구"가 아니라 진행형 프로젝트

## 인상 깊은 문장

> "기본 Clean room 모드는 원본 코드나 파일을 읽지 않고 화면과 배치, 색상 등으로 작업함." (Slack 발췌)

## 댓글

GeekNews 댓글 수는 `news.hada.io` 차단으로 확인 불가. 공식 저장소나 사이트도 직접 열람하지 못해(도메인 미상, 추가 차단 가능성) WebSearch 2차 자료(소개 기사)로만 교차확인했다. **법적·저작권 쟁점은 Slack 발췌에도, WebSearch 결과에도 명시적으로 다뤄지지 않아** 이 노트에서는 판단을 유보한다 — "Clean room 재구현"이라는 표현 자체가 법적 방어선을 의식한 설계로 보이지만, 실제 소송 리스크에 대한 논의는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-11-rea-reverse-engineer-anything]]의 "분석 대상 확장판"
REA가 코딩 에이전트에게 MCP로 디컴파일러를 직접 쥐여줘 "이게 뭘 하는 코드인가"를 되묻게 하는 도구였다면, Craft Anything은 거기서 한 단계 더 나아가 "그래서 그걸 처음부터 다시 만들어봐"까지 자동화한다. 분석(REA)과 재구현(Craft Anything)이 같은 리버스 엔지니어링 파이프라인의 앞뒤 단계로 이어진다는 걸 보여준다. 다만 REA는 "원본을 읽고 이해"하는 쪽이고 Craft Anything의 기본 모드는 "원본을 안 읽고 겉모습만 보고 재구현"하는 쪽이라 접근 철학은 반대다.

### 핵심 전이 2 — [[2026-10-12-vibe-coding-classic-game-ports]]가 보여준 "밤새 이식"의 범용 도구화
Kotaku가 보도한 Halo·GTA 브라우저 이식 사례가 "AI 디컴파일이 수개월 걸린 작업을 밤새 처리로 압축한다"는 개별 성공 사례였다면, Craft Anything은 그 작업 방식을 범용 도구로 패키징한 것에 가깝다. 개별 해커의 바이브 코딩 성공담이 도구로 수렴하는 흐름.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다가 경쟁사 PMS·CRS를 "재구현"할 이유나 권한이 없다. 다만 "원본 코드 없이 화면 동작만 보고 재현을 시도하는 Clean room 접근"이라는 발상은, 레거시 백오피스 화면을 문서화되지 않은 채 재구축해야 할 때 화면 동작 명세를 뽑아내는 보조 기법 정도로 참고할 만하다.

## 연관 자료
- [[2026-10-11-rea-reverse-engineer-anything]] — 같은 리버스 엔지니어링 파이프라인의 "분석" 단계, 접근 철학은 반대(원본을 읽음 vs 안 읽음)
- [[2026-10-12-vibe-coding-classic-game-ports]] — 같은 유형의 작업(AI를 이용한 게임 이식)이 도구화되기 전 개별 성공 사례

## 한 달 뒤 회고
- 2026-12-07 즈음 점검: Craft Anything의 저작권 관련 논쟁이나 법적 이슈가 불거졌는지, Deep 모드의 구체적 동작 방식을 확인했는지.
