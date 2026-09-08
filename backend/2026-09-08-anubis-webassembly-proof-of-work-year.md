---
title: "Anubis에 WebAssembly 작업증명을 넣는 데 1년이 걸린 이유 (Techaro) — 핵심 구현은 며칠, 구형 브라우저 호환이 나머지 1년"
source_title: "It took a year to ship WebAssembly in Anubis"
source_url: "https://anubis.techaro.lol/blog"
source_name: "Techaro 공식 블로그 (anubis.techaro.lol) · GeekNews(id=33323) 경유"
referrer_url: "https://news.hada.io/topic?id=33323"
published_at: "2026-09-06 (정확한 게시일 미확인 — 관련 매체 동시 보도일 기준)"
summarized_at: "2026-09-08"
category: "backend"
tags: ["anubis", "webassembly", "proof-of-work", "anti-bot", "argon2id", "browser-compatibility"]
---

# Anubis에 WebAssembly 작업증명을 넣는 데 1년이 걸린 이유

> 출처: [It took a year to ship WebAssembly in Anubis](https://anubis.techaro.lol/blog) (Techaro 공식 블로그) · GeekNews(id=33323) 경유 · 정리일 2026-09-08

> **출처 한계(큼)**: hada.io 토픽 페이지와 원문 `anubis.techaro.lol` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다(정확한 게시글 URL 슬러그도 확인 못해 블로그 최상위 경로로 대체 표기). WebSearch로 Hacker News·Lobsters·TechPlanet 등 다수 교차 보도(Chrome 66 지원, wasm2js 폴백, Argon2id SIMD 자동 폴백 등 구체 항목)를 확인했고, GitHub 저장소(`TecharoHQ/anubis`)로 프로젝트 개요는 직접 확인했다. hada 댓글 수·논조는 확인하지 못했다.

## 한 줄 요약

**AI 크롤러·과도한 스크래핑을 막는 봇 차단 도구 Anubis가 WebAssembly 기반 작업증명(proof-of-work)을 1년 걸려 출시했는데, 핵심 구현 자체는 며칠 만에 끝났지만 Chrome 66급 구형 브라우저까지 지원하는 폴백 체계를 만드는 데 나머지 시간이 들었다.**

## 핵심 포인트

- **1년 대부분이 "핵심 구현"이 아니라 "호환성"에 소요** — 수백 개의 커밋, 5세대에 걸친 PR, 다수의 테스트, Rust로의 일부 재작성을 거쳤다(WebSearch 교차 확인). 새 방식을 되게 만드는 것과, ***구형 브라우저·보안 설정이 제한된 환경까지 깨지지 않게 만드는 것*** 사이의 격차가 이 프로젝트의 실제 난이도였다.
- **CPU뿐 아니라 메모리도 요구하는 Argon2id 도입** — 기존 SHA-256 기반 작업증명은 GPU로 대량 병렬 풀이가 가능했다. Argon2id는 메모리 사용량도 함께 요구해(메모리 하드) GPU 대량 풀이의 경제성을 떨어뜨리려는 목적으로 도입됐다.
- **Chrome 66까지 지원해야 하는 폴백 체계** — WebAssembly를 지원하지 않거나 의도적으로 차단한 구형/보안 강화 브라우저 환경을 지원하기 위해, 같은 로직을 ***wasm2js로 JavaScript로 변환***해 제공한다. WebAssembly를 끈 클라이언트는 보통 JavaScript JIT도 함께 꺼두는 경우가 많아, 이 JS 폴백 경로는 원래보다 느려지는 트레이드오프를 그대로 감수한다(WebSearch 교차 확인).
- **브라우저·서버가 동일 바이너리로 풀이·검증** — 클라이언트(브라우저)와 서버가 같은 WebAssembly 바이너리로 문제를 풀고 검증해, 구현이 어긋나 생기는 버그 표면을 줄인다. SIMD를 지원하는 브라우저에서는 하드웨어 가속을 활용해 모바일 사용자 대기 시간을 줄이려 한다.

## 인상 깊은 문장

원문 미열람으로 직접 인용은 생략한다. WebSearch로 확인된 핵심 사실(수백 커밋·5세대 PR·Rust 재작성·Chrome 66 지원·wasm2js 폴백)만 위 핵심 포인트에 반영했다.

## 댓글

hada 댓글 수·논조는 이번 세션에서 확인하지 못했다(hada.io 접근 차단). 다만 이 글은 Hacker News(item id=49590611)와 Lobsters(`anubis.techaro.lol` 도메인) 양쪽에 별도로 큐레이션된 것으로 WebSearch에서 확인됐다 — 봇 차단·프록시 우회 기술에 관심 있는 커뮤니티에서 널리 소비된 글로 보인다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 노트를 쓰는 과정 자체가 Anubis류 봇 차단의 "반대편 경험"이었다

이번 배치의 원문 조사 과정에서 `news.hada.io`, `austinhenley.com`, `anubis.techaro.lol`, `hackaday.com`, `en.wikipedia.org`, `news.ycombinator.com`, `lobste.rs` 등 거의 모든 외부 도메인이 이 세션의 egress 프록시에 막혀 WebFetch가 실패했다(GitHub 계열 도메인만 예외적으로 열렸다). 정확한 차단 사유는 이 세션의 네트워크 정책이지 Anubis 같은 봇 차단 도구가 아니지만, 결과적으로 겪은 상황은 이 글이 다루는 문제와 ***정확히 같은 모양***이다 — "정상적인 요청조차 접근이 막혀, 대체 경로(캐시·미러·검색 스니펫)로 우회해야 정보를 얻을 수 있었다." AI 에이전트가 늘어날수록 이런 차단·우회의 줄다리기가 봇 운영자뿐 아니라 정보를 조사하려는 에이전트 쪽에서도 일상적인 마찰이 된다는 걸 이번 조사 자체가 보여준 셈이다.

### 핵심 전이 2 — "핵심 로직은 금방, 폴백·호환성이 진짜 비용"이라는 패턴은 소프트웨어 전반에 반복된다

이 글의 교훈("핵심 구현은 며칠, 나머지 1년은 구형 환경 지원")은 이 저장소에서도 반복 관찰되는 패턴이다. 신기술 도입의 실제 리드타임을 추정할 때, "새 기능이 되게 만드는 시간"이 아니라 ***"기존 사용자층이 깨지지 않게 만드는 시간"***을 기준으로 잡아야 한다는 일반 원칙으로 남길 만하다.

## 호스피탈리티 / CRS 적용 포인트

**부분적으로 적용 가능하다.** CRS/PMS는 다양한 채널 연동사(OTA, GDS)의 봇/크롤러성 트래픽과 정상적인 채널 연동 트래픽을 구분해야 하는 경우가 있는데, Anubis류 작업증명 방식(클라이언트에 계산 비용을 부여해 대량 요청의 경제성을 낮추는 것)은 API 남용 방지에 참고할 만한 원칙이다. 다만 CRS의 채널 연동은 보통 인증된 파트너 간 API 계약이라 익명 크롤러 차단과는 위협 모델이 다르므로, Anubis를 그대로 가져다 쓰기보다는 "정상 트래픽까지 막히지 않는 폴백 설계에 1년이 걸렸다"는 ***호환성 비용을 과소평가하지 말라***는 교훈 쪽이 더 직접적으로 옮겨온다.

## 연관 자료

- 없음(이번 배치 내 직접 연결되는 다른 노트는 없음).

## 한 달 뒤 회고

*(2026-10-08 즈음 — `anubis.techaro.lol`·hada.io 접근이 정상화되면 원문을 직접 열람해 이번 노트의 wasm2js 폴백·Argon2id 세부 설명이 정확했는지, hada 댓글 논조는 어땠는지 점검. 이 세션에서 겪은 egress 차단이 일회성이었는지도 다음 배치에서 확인.)*
