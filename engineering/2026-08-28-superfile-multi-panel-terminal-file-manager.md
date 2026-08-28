---
title: "superfile — 멀티 패널을 지원하는 터미널 파일 관리자 (yorukot) — 2년 전에 이미 완성된 도구가 이제야 GeekNews에 도착했다"
source_title: "yorukot/superfile: Pretty fancy and modern terminal file manager"
source_url: "https://github.com/yorukot/superfile"
source_name: "GitHub (yorukot)"
referrer_url: "https://news.hada.io/topic?id=32965"
summarized_at: "2026-08-28"
category: "engineering"
tags: ["tui", "cli-tools", "file-manager", "go", "bubbletea", "developer-tools", "terminal"]
---

# superfile — 멀티 패널을 지원하는 터미널 파일 관리자 (yorukot)

> 출처: [yorukot/superfile](https://github.com/yorukot/superfile) (GitHub · yorukot) · 정리일 2026-08-28
> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단(`EGRESS_BLOCKED`)돼 GeekNews 원문 페이지·댓글을 직접 열람하지 못했다. **GitHub 저장소는 직접 열람**했고, 아래 기능·통계 서술은 그 원문(README·저장소 메타데이터)을 근거로 한다. `superfile.dev`·`news.ycombinator.com`·`brianlovin.com`도 이 세션에서 모두 차단돼 공식 소개 문구의 정확한 워딩과 HN 스레드의 포인트·댓글 수는 WebSearch 스니펫으로만 간접 확인했다.

## 한 줄 요약

**Go + Bubble Tea로 만든 MIT 라이선스 오픈소스 TUI 파일 관리자로, 여러 파일 패널을 동시에 열어 디렉터리 사이를 오가며 복사·이동·압축 같은 일반적인 파일 작업을 전부 키보드로 처리한다.** star 22.9k·fork 837(2026-08-28 기준)로 이미 널리 쓰이는 성숙한 프로젝트이며, **WebSearch로 확인한 HN 스레드(`item?id=40318714`, "Superfile – A fancy, pretty terminal file manager")는 2024년 5월 게시분** — 즉 이번 GeekNews 소개는 신작 발표가 아니라 **2년 넘게 검증된 도구를 뒤늦게 재조명**하는 성격에 가깝다.

## 핵심 포인트

- **멀티 패널이 핵심 차별점** — 파일 패널을 여러 개 열어 서로 다른 디렉터리를 동시에 띄워두고, 소스 코드 디렉터리와 빌드 출력 디렉터리를 나란히 열어둔 채 경로를 계속 바꾸지 않고 파일을 옮길 수 있다. 자주 쓰는 폴더는 사이드바에 고정 가능.
- **한 화면에 정보 밀도를 높였다** — 사이드바·파일 목록·작업 진행 상황·파일 메타데이터·클립보드·명령 실행창을 동시에 배치한 레이아웃으로, 전통적인 `ranger`류 TUI 파일 관리자보다 시각 정보량이 많다.
- **기본 파일 작업 전부를 키보드로** — 정렬(이름/크기/수정 날짜), 현재 디렉터리 검색, 숨김 파일 토글, 파일 미리보기, 생성/이름 변경/복사/잘라내기/붙여넣기/압축/해제까지 마우스 없이 처리하도록 설계됐다. Vim 스타일 키바인딩을 지원한다.
- **테마·플러그인으로 확장 가능** — nerd font 아이콘·커스텀 테마를 지원해 "1980년대 스타일"이 아닌 현대적 외관을 낸다는 게 저장소 설명(***"Pretty fancy and modern terminal file manager"***)의 요지.
- **GitHub 신뢰도 지표** — star 22.9k · fork 837 · open issues 194 · PR 66, 총 커밋 2,278개(main 브랜치), MIT 라이선스. macOS·Linux 지원, Windows는 부분 지원. 설치는 셸 스크립트·Homebrew·Winget·Scoop 등 다양한 경로를 제공.

## 인상 깊은 문장

> "Pretty fancy and modern terminal file manager"
> (GitHub 저장소 상단 한 줄 설명 — 화려하고 현대적이라는 자평을 star 수·2년 이상의 생존 기간이 뒷받침한다.)

*(공식 소개 페이지 `superfile.dev`는 egress 차단으로 직접 열람하지 못해, README 밖의 마케팅 문구는 이 노트에 인용하지 않았다.)*

## 댓글

- **hada 댓글 수·논조 확인 불가**(news.hada.io 세션 내 차단) — GeekNews 이번 토픽(id=32965)에서 실제로 어떤 반응이 나왔는지는 이 노트에서 재구성하지 못했다.
- **HN에는 2024년 5월 스레드(`item?id=40318714`, "Superfile – A fancy, pretty terminal file manager")가 존재**한다는 것은 WebSearch로 확인했으나, 포인트·댓글 수·구체적 논조는 이 세션에서 열람 불가해 확인하지 못했다. WebSearch 스니펫상으로는 설치 시 실행 파일 이름(`spf`)에 대한 혼란과, 찾은 뒤의 호평이 언급된 정도만 파악된다.
- Lobsters 큐레이션 여부는 검색으로 확인되지 않았다(없다는 뜻은 아니고 단순 미확인).
- **읽을 때 감안** — 2024년 출시 이후 22.9k star를 쌓은, 이미 검증이 끝난 도구라는 점에서 "새 도구 발굴"보다는 "익숙한 좋은 도구의 재확인" 성격이 강하다.

## 내 생각 · 적용점

### 핵심 전이 — "터미널 르네상스"에 파일 관리자 사례가 하나 더 추가됐다

[[2026-05-28-favorite-developer-tools]]에서 Lobsters 토론이 짚은 ***"WezTerm·Ghostty·kitty·tmux"*** 같은 **터미널 앱들의 현대화 트렌드**에, superfile은 파일 관리자 카테고리의 사례를 하나 보탠다. 다만 이 글은 도구 소개 성격이 짙어 깊은 전이를 억지로 늘리기보다, **같은 트렌드가 반복해서 여러 카테고리(에뮬레이터→멀티플렉서→파일 관리자)로 번지고 있다는 점만 가볍게 기록**해둔다. 참고로 같은 시기 다룬 [[2026-08-02-superlogical-multiplexer]]와 비교하면 야심의 규모가 대조적이다 — superlogical은 "로컬~프로덕션을 하나의 지속 세션으로" 묶겠다는 큰 그림인 반면, superfile은 파일 탐색·복사·이동이라는 좁은 문제 하나를 잘 푸는 데 집중한다. 억지로 더 엮을 연결은 없어 보인다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** superfile은 로컬 개발 환경에서 파일을 다루는 개인 생산성 도구이고, 온다의 CRS(B2B 호스피탈리티) 제품 로직과 접점이 없다. 굳이 남기자면 팀 개발 환경 표준화 논의가 있을 때 "터미널 안에서 GUI급 파일 탐색이 필요한가"를 판단하는 참고 사례 정도이며, 이마저도 억지로 CRS에 붙이지 않는다.

## 연관 자료

- [[2026-05-28-favorite-developer-tools]] — Lobsters의 "터미널 르네상스"(WezTerm·Ghostty·kitty·tmux) 흐름에 파일 관리자 카테고리를 보태는 사례
- [[2026-08-02-superlogical-multiplexer]] — 같은 시기의 또 다른 TUI 개발자 도구지만, 야심의 규모(세션 이식성 vs 파일 탐색 하나)가 대조적

## 한 달 뒤 회고

*(2026-09-28 즈음 — ①이번 세션에서 막혔던 hada 댓글·HN 포인트/댓글 수를 나중에 확인할 수 있으면 실제 반응이 어땠는지 보완. ②"터미널 르네상스" 트렌드에 카테고리가 더 추가됐는지 — 다음엔 어떤 종류의 CLI 도구가 화려한 TUI로 재단장해 나타나는지 관찰.)*
