---
title: "TermDOM - HTML, CSS와 DOM으로 터미널 UI 만들기 (Brian Kim) — 별도 터미널 위젯 API를 배우는 대신 실제 DOM을 문자 셀 그리드에 구현해, React·Angular·Vue를 커스텀 리컨실러 없이 터미널에서 그대로 렌더링한다"
source_title: "TermDOM"
source_url: "https://github.com/bikeshaving/termdom"
source_name: "GitHub (bikeshaving/termdom) · Brian Kim"
referrer_url: "https://news.hada.io/topic?id=33760"
summarized_at: "2026-09-16"
category: "frontend"
tags: ["터미널UI", "DOM", "TUI", "GeekNews"]
---

# TermDOM - HTML, CSS와 DOM으로 터미널 UI 만들기

> 출처: [TermDOM](https://github.com/bikeshaving/termdom) (GitHub · Brian Kim) · 정리일 2026-09-16

## 한 줄 요약
**Crank.js 제작자 Brian Kim이 브라우저 렌더링 파이프라인을 문자 셀 그리드에 그대로 구현한 TermDOM을 공개했다 — 실제 DOM API를 구현했기 때문에 React·Angular·Vue를 커스텀 리컨실러나 전용 어휘 없이 터미널에서 표준 렌더러로 그대로 돌릴 수 있다.**

## 핵심 포인트
- 웹 개발에 익숙한 HTML, CSS와 DOM API로 ***터미널 UI와 대화형 CLI를 만드는*** JavaScript/TypeScript 라이브러리, 제작자는 Crank.js(리액트 대안 프레임워크) 제작자 ***Brian Kim***(bikeshaving 조직)
- 별도의 터미널 위젯 API를 배우는 대신, HTML 요소를 만들고 DOM을 수정하는 방식으로 화면을 구성 — CSS 1px=1행, 1ch=1열로 매핑해 박스모델·flexbox·테이블이 셀 단위로 레이아웃됨
- 동작 방식: 프레임마다 변경분에 대해 스타일·레이아웃 재계산 → 셀 버퍼에 페인트 → 이전 프레임과 diff → ***ANSI 이스케이프 시퀀스로 stdout에 차분만 출력***
- ***실제 DOM을 구현한 덕에 브라우저 라이브러리를 수정 없이 터미널에서 그대로 사용 가능*** — React 19(`react-dom/client`), Angular 22(`@angular/platform-browser`), Vue 3.5(`@vue/runtime-dom`)가 ***커스텀 리컨실러나 `<Box>/<Text>` 같은 전용 어휘 없이*** 표준 DOM 렌더러로 바로 렌더링됨(ink 등 기존 TUI 라이브러리와의 핵심 차별점)
- Node/Bun/Deno 지원, 네이티브 의존성 없어 `bun build --compile`로 단일 바이너리화 가능

## 인상 깊은 문장
> (README 요지) 별도의 컴포넌트 어휘 없이, 웹이 이미 아는 DOM을 터미널에 그대로 옮긴다.

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. 명시적 Show HN/토론 스레드는 검색상 확인되지 않았고(awesome-tuis 리스트에 PR로 등재된 것은 확인), GitHub 저장소는 직접 확인해 기능 설명의 신뢰도는 높다. 성능(대형 화면·고빈도 업데이트 시 diff 비용)이나 접근성(스크린리더 등) 관련 논의는 소스 접근 제한으로 확인하지 못했다.

## 내 생각 · 적용점
"이미 있는 렌더링 모델을 다른 출력 장치에 그대로 이식한다"는 전략은 React/Angular/Vue 생태계 전체를 공짜로 끌어온다는 점에서 영리하다. **[[2026-08-28-superfile-multi-panel-terminal-file-manager]]**같은 개별 터미널 앱과 다르게, TermDOM은 앱이 아니라 ***플랫폼***을 제공한다는 점이 다르다. **[[2026-07-24-ghost-cut-mcgugan]]**(Textualize)도 같은 문제의식(터미널을 진짜 UI 표면으로 대우)을 다른 접근(Python 전용 위젯 시스템)으로 풀었다는 대조가 흥미롭다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다. 다만 운영팀이 SSH로 접속해 쓰는 내부 CRS 관리 CLI 도구를 만들 때, 웹 프론트엔드 팀이 이미 아는 React 컴포넌트를 그대로 재사용해 터미널 대시보드를 만들 수 있다는 아이디어 정도는 참고할 만하다.

## 연관 자료
- [[2026-08-28-superfile-multi-panel-terminal-file-manager]] — 터미널 UI 생태계의 개별 완성 애플리케이션 사례, TermDOM은 그 아래 계층(프레임워크)
- [[2026-07-24-ghost-cut-mcgugan]] — 터미널을 진짜 UI 표면으로 대우하려는 같은 문제의식의 Python 진영 사례(Textualize)

## 한 달 뒤 회고
2026-10-16 즈음, 실제 프로덕션 CLI 도구가 TermDOM으로 만들어진 사례가 나왔는지, 대형 화면·고빈도 업데이트에서의 성능 벤치마크가 공개됐는지 점검.
