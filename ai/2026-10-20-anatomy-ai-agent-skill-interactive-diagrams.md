---
title: "Anatomy — 캐시·연결 풀 같은 개념을 움직이는 기계로 번역하는 에이전트 스킬, 공개 4일에 별 6,500개를 모았지만 완성에는 2시간이 걸린다"
source_title: "Anatomy for Claude Code: Interactive SVGs for Documentation"
source_url: "https://wavect.io/blog/anatomy-claude-code-interactive-svg/"
source_name: "wavect.io (WebSearch로 교차확인, GeekNews 원문은 직접 열람 못함)"
referrer_url: "https://news.hada.io/topic?id=35670"
published_at: "2026-10-12 (wavect.io 블로그 게시일 기준, Anatomy 자체 출시일은 별도)"
summarized_at: "2026-10-20"
category: "ai"
tags: ["agent-skills", "diagramming", "claude-code", "svg", "interactive-visualization", "technical-writing", "developer-tools"]
---

# Anatomy

> 출처: [Anatomy for Claude Code: Interactive SVGs for Documentation](https://wavect.io/blog/anatomy-claude-code-interactive-svg/) (wavect.io) · GeekNews 토픽 [id=35670](https://news.hada.io/topic?id=35670) 경유 · 정리일 2026-10-20
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 못 열었다. WebSearch로 wavect.io 블로그(2026-10-12 게시)와 kunalganglani.com의 별도 리뷰("Anatomy Claude Code Skill: 6,500 Stars in 4 Days")를 찾아 교차확인했고, 핵심 사실(패키지명 `wheresryan22/anatomy`, SVG+JS+WebGL 조합, Node.js 요구사항)은 두 출처가 일치한다. 다만 ***"불꽃·배기가스·물·빛 반사" 같은 Slack 발췌의 구체 시각 효과 예시***는 wavect.io 글 요약에서 직접 확인하지 못해 Slack 발췌 단독 근거로 남긴다. "완성까지 약 2시간" 수치와 "같은 프롬프트를 두 번 넣어도 결과물이 달라진다"는 재현성 지적은 kunalganglani.com 리뷰에만 있어 검증 강도가 더 낮다.

## 한 줄 요약

**Anatomy는 캐시·연결 풀·요청 제한 같은 기술 개념을 실제로 움직이는 기계·장치에 비유해 인터랙티브 SVG 입체 도해로 만들어주는 Claude Code 등용 에이전트 스킬로, 공개 나흘 만에 별 6,500개를 모았을 만큼 반응이 뜨거웠지만 결과물 하나당 약 2시간의 에이전트 작업 시간이 들고 같은 요청에도 매번 다른 결과가 나온다는 재현성 한계가 있다.**

## 핵심 포인트

- **"기계로 번역"하는 비유 설계** — 캐시·연결 풀·요청 제한 같은 추상적 소프트웨어 개념을 ***실제로 움직이는 기계나 장치***로 시각화한다. 설명할 개념·수치·출력 형식을 지정해 요청하면, 마우스·키보드 조작에 따라 움직임과 표시 수치가 함께 바뀌는 인터랙티브 결과물을 만든다.
- **SVG + JS + (베타) WebGL** — 결과물은 SVG로 기하 구조를, JavaScript로 동작을, WebGL로 물·빛 반사 같은 추가 효과를 구현한다(WebSearch 확인). 독립형 HTML, SVG 단독, React/Next.js 컴포넌트까지 여러 출력 형식을 README가 문서화한다. 3D 모드는 아직 베타다.
- **설치 문턱과 요구사항** — `npx skills add wheresryan22/anatomy -g -a claude-code` 한 줄로 설치되고, `/anatomy` 다음 설명을 붙이면 호출된다. Node.js 버전 요구사항이 출처마다 다르게 적혀 있다(자체 빌드·검사는 20.10+, CLI 버전은 22.20+). 브라우저 검증에 Chrome/Chromium이 필요하다.
- **빠른 채택, 그러나 품질·재현성 경고도 함께** — 공개 4일 만에 별 6,500개를 모았다는 급속 채택 수치가 있는 한편, kunalganglani.com 리뷰는 ***"완성된 도해 하나에 약 2시간의 능동적 에이전트 작업 시간이 걸리고, 같은 프롬프트를 두 번 넣으면 서로 다른 결과물(기계)이 나온다"***고 지적한다. 또 다른 출처는 "정교한 엔진 도해가 나와도 공학적 정확성·제조 적합성·검증된 시뮬레이션을 보장하지 않는다"고 선을 긋는다 — 겉보기 완성도와 내용 정확성은 별개라는 경고다.

## 인상 깊은 문장

> "A finished figure takes roughly two hours of active agent time... feeding it the same prompt twice gives you two different machines." (kunalganglani.com 리뷰, WebSearch 요약)
> 빠른 채택 수치(별 6,500개/4일)만 보면 "즉시 완성되는 도구"로 오해하기 쉽지만, 실제로는 상당한 작업 시간과 결과물 비일관성을 감당해야 하는 도구라는 걸 이 인용이 바로잡아준다.

## 댓글

GeekNews 댓글 수·HN 큐레이션 유무 확인 불가. wavect.io와 kunalganglani.com 둘 다 이 스킬을 홍보성으로 다루는 블로그 글에 가까워, "실제로 써본 사람의 중립적 비판"보다는 "써보니 좋았다/흥미롭다" 톤에 가깝다는 점을 감안해야 한다 — 재현성 문제를 지적한 것은 그나마 균형 잡힌 지점이다.

## 내 생각 · 적용점

**핵심 전이 1: [[2026-09-14-diagram-design-skill-for-agents]]·[[2026-09-25-archify-agent-skill-system-diagrams]]와 함께 놓으면, "에이전트 다이어그램 스킬"이 이제 적어도 세 갈래 철학으로 분화됐다는 게 보인다.** diagram-design은 "편집 디자인 규칙"(단일 액센트 색, 4의 배수 그리드)으로 미적 일관성을 강제하고, Archify는 "타입드 JSON IR + 스키마 검증"으로 구조적 정합성을 강제한다. Anatomy는 이 둘과 다른 세 번째 축 — ***추상적 개념을 "비유"(기계·장치)로 번역***하는 데 집중한다. 세 스킬을 나란히 보면, "다이어그램"이라는 하나의 범주 안에서도 무엇을 최적화할지(미적 일관성 vs 구조적 정합성 vs 비유의 직관성)가 서로 다른 설계 선택이라는 걸 확인할 수 있다.

**핵심 전이 2: "완성에 2시간 걸리고 재현성이 낮다"는 한계가, 이 가든의 글쓰기 작업에도 그대로 적용될 질문을 던진다.** 이 가든의 노트들은 지금 텍스트와 위키링크로만 구성되는데, Anatomy 같은 스킬을 "핵심 개념 하나를 시각화해 노트에 곁들인다"는 식으로 써볼 여지가 있다 — 다만 2시간이라는 비용과 매번 다른 결과물이 나온다는 비일관성을 감안하면, ***"가끔 핵심 개념 하나를 위해 투자"*** 수준으로 써야 하고 노트 작성 루틴 전체에 넣기는 아직 무리라는 게 정직한 평가다.

## 호스피탈리티 / CRS 적용 포인트

**부분적으로 적용 가능하지만 비용을 감안해야 한다.** 온다 CRS의 ① **예약 흐름(검색→요금계산→확정→결제)을 파이프라인/배관 비유로 시각화**해 비개발자(세일즈·고객지원)에게 설명하거나 ② **캐시·연결 풀·요청 제한 같은 CRS 내부 인프라 개념을 파트너 호텔 기술 문서에 직관적으로 보여주는** 용도로는 diagram-design·Archify보다 "비유적 직관"이 강점이라 더 적합할 수 있다. 다만 ***결과물 하나에 2시간이 걸리고 같은 요청에도 다른 결과가 나온다***는 한계는, "한 번 만들고 계속 재사용"하는 공식 문서보다는 "한 번 보여주고 끝나는" 발표·데모 자료에 더 맞는 용도라는 걸 시사한다 — CRS 공식 아키텍처 문서라면 재현성이 보장되는 Archify 쪽이 더 적합해 보인다.

## 연관 자료

- [[2026-09-14-diagram-design-skill-for-agents]] — 같은 "에이전트 다이어그램 스킬" 범주, 미적 일관성(편집 디자인 규칙) 축의 비교 대상
- [[2026-09-25-archify-agent-skill-system-diagrams]] — 같은 범주, 구조적 정합성(스키마 검증) 축의 비교 대상이자 "재현성"에서 Anatomy와 대조되는 지점

## 한 달 뒤 회고

- 2026-11-20 즈음: Anatomy를 실제로 설치해 CRS 개념 하나(예: 예약 요청 제한)를 시각화해봤는지, "2시간·낮은 재현성"이라는 리뷰 지적이 실제 사용에서도 확인되는지, 별 6,500개 수치가 그 뒤로 어떻게 늘었는지 점검.
