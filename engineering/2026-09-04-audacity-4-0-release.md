---
title: "Audacity 4.0 출시 — wxWidgets를 20여 년 만에 Qt로 갈아엎고 '클립'을 1급 편집 단위로 승격시킨 재작성"
source_title: "Audacity 4.0.0 released"
source_url: "https://github.com/audacity/audacity/releases/tag/Audacity-4.0.0"
source_name: "github.com (Audacity 공식 릴리스 노트)"
referrer_url: "https://news.hada.io/topic?id=33192"
published_at: "2026-09-04"
summarized_at: "2026-09-04"
category: "engineering"
tags: ["audacity", "open-source", "audio-editing", "ui-rewrite", "qt", "release"]
---

# Audacity 4.0 출시

> 출처: [Audacity 4.0.0 릴리스 노트](https://github.com/audacity/audacity/releases/tag/Audacity-4.0.0) (GitHub, Audacity 공식) · GeekNews([news.hada.io/topic?id=33192](https://news.hada.io/topic?id=33192)) 경유 · 정리일 2026-09-04

## 한 줄 요약

**오랜 무료 오디오 편집기 Audacity가 인터페이스 툴킷을 wxWidgets에서 Qt6로 전면 재구축하며 4.0을 출시했다. 핵심 변화는 "클립"을 직접 선택·그룹화·일괄 편집할 수 있는 1급 단위로 승격시킨 새 편집 모델과, 프로젝트 포맷을 `.aup4`로 교체한 것 — 다만 Time Track·MIDI·Macro Manager·VAMP/LADSPA 플러그인 등 일부 기능은 아직 이 버전에 없다.**

## 핵심 포인트

- **UI 전면 재구축** — wxWidgets 기반이던 인터페이스를 ***Qt6 기반***으로 갈아엎고 네이티브 고해상도(High-DPI) 렌더링을 지원. 밝음/어두움/고대비 테마, Home 화면(최근 프로젝트 표시) 추가.
- **클립 중심 편집 모델** — 클립을 헤더 클릭으로 직접 선택하거나 Shift-클릭으로 여러 개를 동시 선택. ***이동, 트리밍, 시간 늘이기를 선택된 여러 클립에 한꺼번에 적용*** 가능하고, 클립을 그룹화하면 이동·복사·붙여넣기 시 그룹이 함께 유지된다.
- **작업 공간(Workspace)** — 도구 모음·패널을 자유롭게 이동·도킹·플로팅할 수 있고, 이 배치를 Workspace로 저장. Modern·Classic·Music 세 가지 기본 제공.
- **새 프로젝트 포맷** — `.aup4`로 전환. 기존 `.aup3` 프로젝트는 열어서 변환할 수 있으며 원본 파일은 유지된다.
- **재생·녹음 개선** — 재생을 멈추지 않고 다른 위치로 이동하거나 타임라인 중간에서 녹음 시작 가능, Punch and Roll 재구성, Windows용 ASIO 지원.
- **미포함 기능(정직하게 명시)** — Time Track, MIDI 트랙, Macro Manager, VAMP/LADSPA 플러그인은 4.0.0 시점에 아직 지원되지 않는다.

## 인상 깊은 문장

> "Clips can be selected directly. Click a clip header to select it, or Shift-click to select multiple clips." (Audacity 4.0.0 릴리스 노트)

## 댓글

**출처 한계 명시.** news.hada.io는 이 세션에서 egress 차단으로 GeekNews 댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. 대신 Audacity 공식 GitHub 릴리스 노트를 직접 열람해 기능 목록을 1차 출처로 확보했고, WebSearch로 Phoronix·9to5Linux·Linuxiac·OMG Ubuntu 등 리눅스/오픈소스 매체의 스니펫과 대조해 일치를 확인했다(본문 전문 열람은 대부분 차단). "미포함 기능" 목록도 릴리스 노트 원문에서 직접 확인한 것으로, 이 가든의 정직성 기준에 따라 함께 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — 오래된 오픈소스 도구의 툴킷 재작성은 "부채를 20년 뒤에 갚는" 결정이다

wxWidgets는 Audacity가 2000년대 초부터 써온 툴킷이다. Qt로의 전환은 단순 UI 개편이 아니라 20여 년 쌓인 기술 부채를 한꺼번에 정리하는 결정이고, 그 과정에서 MIDI·플러그인 지원처럼 기존 사용자가 의존하던 기능이 일시적으로 빠지는 트레이드오프를 감수했다. 이는 [[2026-08-26-rust-never-type-stabilized]]류의 "오래된 결정을 되돌리는 비용"이나 [[2026-08-02-refactoring-economic-benefit]]의 "리팩터링의 경제적 정당화" 논의와 같은 축에서 읽을 수 있다 — 재작성은 항상 회귀를 동반하고, 그 회귀를 발표문에서 숨기지 않는 것이 신뢰의 문제다.

### 핵심 전이 2 — "여러 개체를 동시에 선택해 일괄 편집"은 편집 도구 전반의 공통 패턴

클립을 그룹화하고 여러 클립에 이동·트리밍·시간 늘이기를 한 번에 적용하는 이번 모델은, 디자인 도구·코드 에디터의 다중 커서·다중 선택 패턴과 본질적으로 같은 UX 문제다. "단일 대상 편집 → 다중 대상 일괄 편집"으로의 전환은 도구 성숙도의 공통 이정표로 보인다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 오디오 편집 도구는 온다 CRS 제품과 직접 접점이 없다. 다만 "오래된 UI 프레임워크를 통째로 갈아엎으면서 일부 기능을 일시적으로 포기하고 그 사실을 발표문에 명시한다"는 태도는, 온다가 레거시 CRS 화면을 재작성할 때 참고할 만한 커뮤니케이션 원칙으로 남긴다 — 회귀를 숨기지 않고 로드맵으로 명시하는 것.

## 연관 자료
- [[2026-08-02-refactoring-economic-benefit]] — 리팩터링·재작성의 경제적 정당화 논의, Audacity의 툴킷 전환도 같은 계산이 필요한 결정
- [[2026-08-26-rust-never-type-stabilized]] — 오래된 언어/툴킷 결정을 뒤늦게 되돌리는 비용이라는 같은 계열

## 한 달 뒤 회고
*(2026-10-04 즈음 — Time Track·MIDI·Macro Manager 등 미지원 기능이 후속 패치(4.0.x)로 돌아왔는지, 기존 사용자 커뮤니티의 반응이 긍정적인지 부정적인지 원문 접근이 가능해지면 확인.)*
