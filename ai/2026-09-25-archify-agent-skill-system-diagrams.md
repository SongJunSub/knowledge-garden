---
title: "Archify - 코드와 설명을 탐색 가능한 시스템 다이어그램으로 만드는 에이전트 스킬 (tt-a1i) — 타입드 JSON을 렌더러가 검증하고, 그림이 아니라 탐색할 수 있는 지도를 만든다"
source_title: "archify: Agent skill for beautiful, verifiable architecture, workflow, sequence, data-flow, and lifecycle diagrams"
source_url: "https://github.com/tt-a1i/archify"
source_name: "GitHub (tt-a1i/archify)"
referrer_url: "https://news.hada.io/topic?id=34248"
published_at: "2026-09-24"
summarized_at: "2026-09-25"
category: "ai"
tags: ["agent-skills", "diagramming", "claude-code", "developer-tools", "codebase-visualization", "harness-extension", "json-ir"]
---

# Archify - 코드와 설명을 탐색 가능한 시스템 다이어그램으로 만드는 에이전트 스킬 (tt-a1i) — 타입드 JSON을 렌더러가 검증하고, 그림이 아니라 탐색할 수 있는 지도를 만든다

> 출처: [tt-a1i/archify](https://github.com/tt-a1i/archify) (GitHub) · 정리일 2026-09-25

## 한 줄 요약

**Archify는 코드베이스를 분석하거나 시스템을 말로 설명하면 아키텍처·워크플로·시퀀스·데이터 흐름·생명주기 다섯 가지 유형의 다이어그램을 만들어주는 에이전트 스킬이다. Cursor·Claude Code·Codex CLI·OpenCode에서 동작하며, 저장소 없이 자연어 설명만으로도 시작할 수 있다. 에이전트가 타입드 JSON(typed JSON IR)을 작성하면 Node.js 렌더러가 스키마·레이아웃·라우트·라벨 정합성을 전부 검증한 뒤에야 결과물을 내놓고, 완성된 HTML/SVG는 검색·경로 추적·업스트림/다운스트림 탐색이 가능한 인터랙티브 뷰어로 열린다.**

## 핵심 포인트

- **그리는 게 아니라 "검증 후 확정"한다** — 결과물을 내기 전에 ***스키마 검증·레이아웃 검증·HTML/SVG 검증·라우트 검증·라벨-경로 정합성 검증***을 모두 통과해야 "최종본"으로 교체된다(atomic validation before delivery). 다이어그램 도구 대부분이 "그럴듯하게 보이면 끝"인 것과 달리, 구조적으로 틀린 다이어그램(연결이 끊긴 노드, 라벨과 경로가 안 맞는 화살표)을 걸러내는 절차가 파이프라인에 내장돼 있다.
- **원본 데이터(JSON)가 1급 시민** — 렌더링된 그림이 아니라 ***타입드 JSON IR(중간 표현)이 진짜 소스***이고, 렌더러가 이를 결정론적으로 HTML/SVG로 컴파일한다. 대화로 결과물을 다듬을 때도 그림을 재추측하는 게 아니라 JSON을 직접 수정하는 구조라, 같은 입력이면 같은 결과가 나오는 재현성을 확보한다.
- **다섯 가지 유형 + 인터랙티브 뷰어** — 아키텍처·워크플로·시퀀스·데이터 흐름·생명주기 다이어그램을 지원하고, 완성된 결과물은 ***검색, 경로 추적(route tracing), 업스트림/다운스트림 탐색, 가이드 스토리, 테마·프레젠테이션 컨트롤***을 갖춘 뷰어로 열린다 — 정적 이미지 한 장이 아니라 클릭해서 파고드는 문서에 가깝다.
- **설치 문턱이 낮다** — `npx skills add tt-a1i/archify -g` 한 줄로 여러 하네스에 전역 설치되고, Node.js 18 이상만 있으면 동작한다. MIT 라이선스로 완전 무료·오픈소스다. 다만 "GitHub 스타 3만 6천 개, 하루 3,722개 증가"라는 급속한 채택 수치는 동일한 설명·README를 쓰는 여러 미러/포크 저장소(praxstack, farfarfun-skills, joesaby 등)가 존재한다는 점에서 스타 수 자체가 다소 부풀려졌을 가능성을 열어둬야 한다.

## 인상 깊은 문장

> "Agent skill for beautiful, verifiable architecture, workflow, sequence, data-flow, and lifecycle diagrams—self-contained HTML with motion and crisp export." — tt-a1i/archify README

> "Typed JSON IR — every renderer-backed mode has a schema and reproducible source." — Archify 기술 개요

## 댓글

GeekNews 원문(hada, id=34248)은 이 세션의 egress 프록시에서 차단돼 hada 댓글 수·큐레이션 여부를 직접 확인하지 못했다. WebSearch로 GitHub 저장소(tt-a1i/archify) README·SKILL.md·authoring-cookbook.md, DeepWiki 문서, skills.sh 등록 페이지를 교차 확인해 핵심 포인트를 재구성했다. 다만 동일 설명을 쓰는 미러 저장소가 다수 확인돼(praxstack/tt-a1i-archify, farfarfun-skills 등) **정확한 원저작자 계정과 스타 수의 신뢰도에는 물음표가 남는다** — 이 노트에서는 가장 먼저 확인되고 커밋 이력이 있는 tt-a1i/archify를 원본으로 간주했다. hada 댓글 스레드 자체의 반응(호평·비판)은 이번 조사로 담지 못한 출처 한계다.

## 내 생각 · 적용점

### 핵심 전이 1 — "편집 디자인 규칙" vs "구조적 검증", 같은 문제의 다른 해법

[[2026-09-14-diagram-design-skill-for-agents]]에서 정리한 diagram-design 스킬은 "가장 높은 품질의 움직임은 보통 삭제"라는 철학 아래 액센트 색 하나·4의 배수 그리드·1px 헤어라인 같은 ***편집 디자인 규칙***으로 다이어그램의 미적 일관성을 강제했다. Archify는 정반대 축에서 문제를 푼다 — 미적 규칙보다 ***스키마·레이아웃·라우트·라벨 정합성을 검증***해 "틀린 다이어그램"이 나가는 것을 막는다. 두 스킬을 나란히 두면 에이전트 다이어그램 도구의 품질 축이 최소 두 개(보기 좋은가 vs 구조적으로 맞는가)라는 게 뚜렷해진다. 실무에서는 둘 다 필요하다 — Archify로 구조를 검증하고, diagram-design 스타일 규칙으로 다듬는 조합이 이상적일 수 있다.

### 핵심 전이 2 — Claude Code 헤비 유저로서의 실제 활용 시나리오

이 노트를 쓰는 세션이 Claude Code에서 대규모 저장소를 탐색할 때 매번 마주치는 문제가 있다 — 파일 단위로는 이해해도 "이 컴포넌트가 저 서비스로 어떻게 연결되는지"는 텍스트로 계속 물어봐야 한다는 것. Archify를 설치해두면 ***"이 레포의 결제 플로우를 다이어그램으로 그려줘"*** 같은 요청 한 번으로, 다음 세션이 다시 물어볼 필요 없이 인터랙티브 뷰어를 열어 업스트림/다운스트림을 직접 클릭해 확인할 수 있다. 온보딩 문서·PR 설명·아키텍처 리뷰 준비에서 "말로 설명하기보다 보여주기"가 필요한 순간마다 재사용 가능한 도구다. 저장소 없이 자연어 설명만으로도 그릴 수 있다는 점은, 아직 코드가 없는 설계 단계의 아키텍처 논의에도 바로 쓸 수 있다는 뜻이다.

### 핵심 전이 3 — 검증 파이프라인이 있는 스킬이 신뢰를 얻는다

[[2026-09-08-ask-hn-agent-skill-file-management]]가 정리한 HN 결론은 "범용 스킬 모음보다 직접 만든 스킬이 살아남는다"였는데, diagram-design 노트의 핵심 전이 2에서 이미 "디자인 규칙이 구체적이고 결과물 품질이 검증 가능하면 범용 스킬도 산다"로 다듬었었다. Archify는 그 다듬어진 명제를 한 단계 더 밀어붙인다 — ***검증 가능성을 아예 파이프라인에 내장(atomic validation)***해서 "느낌상 괜찮아 보이는" 출력이 아니라 "구조적으로 검증된" 출력만 내보낸다는 것 자체가, 범용 도구가 신뢰를 얻는 방법론이 될 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 높은 글이다.** 온다 CRS 개발·문서화에 바로 시험해볼 만한 지점: ① **예약 플로우 시퀀스 다이어그램**(검색→요금계산→확정→결제) ② **CRS·PMS·채널매니저 데이터 흐름(data-flow) 다이어그램** — 파트너 호텔과의 연동 문제를 디버깅할 때 "어느 구간에서 데이터가 끊기는지"를 탐색 가능한 형태로 보여줄 수 있다 ③ **온보딩 생명주기(lifecycle) 다이어그램** — 신규 파트너 호텔이 계약부터 실연동까지 거치는 단계를 시각화. diagram-design과 달리 Archify는 검증 파이프라인이 있어 ***실제 코드베이스 구조와 다이어그램이 어긋나는 것을 스키마 단계에서 막아준다는 점***이 운영 문서로 쓸 때 특히 유용하다.

## 연관 자료
- [[2026-09-14-diagram-design-skill-for-agents]] — 같은 "에이전트 다이어그램 스킬" 카테고리, 편집 디자인 규칙 축의 대조 사례
- [[2026-09-08-ask-hn-agent-skill-file-management]] — "검증 가능한 범용 스킬은 산다"는 명제가 한 번 더 확인된 사례

## 한 달 뒤 회고
*(2026-10-25 즈음 — 온다 CRS 문서에 Archify를 실제로 설치해 예약 플로우·연동 데이터 흐름 다이어그램을 만들어봤는지, tt-a1i/archify 저장소의 스타 수·미러 저장소 정리 상황이 정리됐는지, hada 원문 접근이 복구돼 댓글 반응을 소급 확인할 수 있는지, 같은 배치에서 다뤄진 "Whiteboard"(코드 이해·검토 캔버스, GeekNews id=34245)와 실제로 용도가 겹치는지 갈리는지 비교 점검.)*
