---
title: "2035년이 일찍 찾아왔다 (GeekNews, trynix.dev) — 'unkernel'이라는 표현은 미확인이지만, 브라우저에서 리눅스 커널을 WASM으로 통째로 실행한다는 핵심은 실재한다"
source_title: "2035년이 일찍 찾아왔다"
source_url: "https://news.hada.io/topic?id=37769"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37769"
published_at: "2026-09(trynix 공개 시점 추정, WebSearch 교차확인)"
summarized_at: "2026-11-25"
category: "engineering"
tags: ["trynix", "nix", "webassembly", "linux-kernel", "browser-emulation", "virtualization"]
---

# 2035년이 일찍 찾아왔다 (GeekNews, trynix.dev)

> 출처: [2035년이 일찍 찾아왔다](https://news.hada.io/topic?id=37769) (GeekNews) · 정리일 2026-11-25

> **출처 한계**: `news.hada.io`·`trynix.dev` 모두 세션 egress 차단으로 원문 미열람. WebSearch로 trynix 프로젝트 자체(Farid Zakaria, GitHub `fzakaria/trynix`, 2026-09 공개로 추정)는 Simon Willison 블로그·Korben·fzakaria.com 등 복수 소스로 교차확인했다. 다만 ***"unkernel"이라는 용어와 "2~32배 빠른 성능"이라는 구체 벤치마크 수치는 이번 검색에서 전혀 발견되지 않았다*** — 확인된 것은 "Linux 커널을 WebAssembly로 컴파일하고, 31만 개 이상의 Nix 패키지를 브라우저에서 서버 없이 실행한다"는 구조뿐이며, Slack 발췌가 말한 "기존 QEMU 기반 엔진을 unkernel로 교체"라는 비교 서사는 독립 확인하지 못했다.

## 한 줄 요약

**trynix.dev는 Linux 커널을 WebAssembly로 컴파일하고 공개 Nix 캐시를 브라우저에서 직접 끌어와, 설치 없이 31만 개 이상의 Nix 패키지(GUI·그래픽·사운드·네트워크 포함)를 브라우저 탭에서 그대로 실행하는 프로젝트다 — 다만 "unkernel로 교체해 2~32배 빨라졌다"는 Slack 발췌의 구체 서사는 WebSearch로 확인되지 않았다.**

## 핵심 포인트

- **구조는 3단계** — WebSearch로 확인된 Farid Zakaria(원저자)의 설명에 따르면 ***"메모리 안의 Nix 스토어, WebAssembly로 컴파일된 Linux 커널, 페이지 안의 터미널 에뮬레이터"*** 세 요소로 구성된다. 커널 작업까지 전부 에뮬레이션하던 기존 방식과 달리, 커널 자체가 WASM으로 네이티브 컴파일돼 있다는 게 핵심.
- **서버 없이 공개 캐시만으로 동작** — CORS를 허용하는 공개 Nix 캐시(`access-control-allow-origin: *`)에서 패키지 경로를 직접 가져와, 브라우저가 그 자체로 Nix 클라이언트가 된다. ***정적 파일 몇 개와 공개 캐시만으로 서버 인프라 없이 작동***한다는 점이 구조적 특징.
- **규모 — 31만 개 이상 패키지, 13년치** — 지난 13년간 공개된 Nix 패키지 버전 31만 개 이상을 설치 없이 PATH에 올려 바로 쓸 수 있다고 복수 소스가 전한다. URL로 특정 버전(예: 2017년 Python 3.6.2)을 직접 지정해 열 수도 있다.
- **용도 확장 — PR 미리보기** — GitHub Action으로 PR에 trynix 링크를 자동으로 달아, 리뷰어가 그 PR의 빌드를 브라우저에서 바로 부팅해볼 수 있게 하는 활용 사례도 확인된다 — ***리뷰 환경 재현 비용을 브라우저 탭 하나로 줄이는 용도***.
- **"unkernel"·"2~32배"는 미확인** — Slack 발췌가 강조한 "기존 QEMU 엔진 교체"와 구체 성능 수치는 WebSearch 결과 어디에도 없어, 과장이거나 이번 검색이 놓친 별도 발표일 가능성 둘 다 남겨둔다.

## 인상 깊은 문장

> "a Nix store in memory, a Linux kernel in WebAssembly, and a terminal emulator in the page" (Farid Zakaria, WebSearch로 확보한 2차 인용)

## 댓글

hada 댓글 수 확인 불가. 소스가 대부분 2026년 9월 전후 기사(Simon Willison, Korben, fzakaria.com)라, ***GeekNews에 올라온 이번 글이 신규 발표가 아니라 두 달 전 공개된 프로젝트의 재조명일 가능성***이 있다는 점을 밝혀둔다. MIT 라이선스로 공개된 개인 프로젝트라 벤더 이해관계는 낮다.

## 내 생각 · 적용점

### 핵심 전이 — "원본 바이너리를 브라우저에서 그대로" 계열의 또 다른 사례

[[2026-10-09-demoscene-recomp-classic-demos-in-browser]]가 1990년대 DOS 데모를 x86 실행 녹음→C 변환→WASM 컴파일 과정을 거쳐 브라우저에서 원본 그대로 재생했다면, 이 글은 ***범위를 "데모 하나"에서 "커널 전체+31만 개 패키지"로 확장한 같은 계열의 시도***다. 둘 다 "에뮬레이션(느림)"이 아니라 "네이티브 컴파일(대상 코드를 WASM으로 직접 번역)"을 택해 성능 격차를 줄인다는 공통 전략을 쓴다 — 데모씬 한 편 수준의 기법이 리눅스 커널 전체로 일반화될 수 있다는 걸 보여주는 사례로 읽을 수 있다.

### 적용점

"서버 없이 공개 캐시+정적 파일만으로 돌아간다"는 설계는, 재현 가능한 개발 환경을 무겁게 프로비저닝하지 않고 ***링크 하나로 공유***하는 패턴으로 일반화할 수 있다. PR 미리보기 활용 사례는 코드 리뷰 인프라 설계에 바로 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS/PMS 연동 코드는 보통 보안·네트워크 제약이 있는 내부망에서 돌아가야 해서, "공개 캐시+브라우저만으로" 라는 trynix의 전제가 그대로 옮겨지긴 어렵다. 다만 "링크 하나로 재현 가능한 실행 환경 공유"라는 아이디어는, 파트너사에 연동 버그를 재현해 보여줄 때 ***무거운 샌드박스 환경 대신 가벼운 브라우저 기반 재현***을 검토할 여지 정도로만 참고.

## 연관 자료

- [[2026-10-09-demoscene-recomp-classic-demos-in-browser]] — 원본 코드를 WASM으로 네이티브 컴파일해 브라우저에서 그대로 실행하는 같은 전략, 대상 범위만 다름

## 한 달 뒤 회고

2026-12-25 즈음 — trynix.dev 원문과 "unkernel"·"2~32배" 서사의 출처를 직접 확인할 수 있는지, GeekNews 이번 글이 신규 발표인지 재조명인지 확정.
