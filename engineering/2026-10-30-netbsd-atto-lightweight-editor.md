---
title: "NetBSD, 48KB 경량 텍스트 편집기 atto를 기본 시스템에 추가 (GeekNews) — vi 모드 전환에 익숙하지 않은 사람을 위한 2,000줄짜리 선택지"
source_title: "NetBSD, 48KB 경량 텍스트 편집기 atto를 기본 시스템에 추가"
source_url: "https://news.hada.io/topic?id=36245"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-30"
category: "engineering"
tags: ["netbsd", "text-editor", "minimalism", "vi", "emacs", "recovery-system"]
---

# NetBSD, 48KB 경량 텍스트 편집기 atto를 기본 시스템에 추가 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36245) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 발췌 불릿이 마지막에 "C 코드 2,000줄 미만으로 최소한의 Emacs 기능을 구현하는 것을 목표…"에서 끊긴다. hada 댓글·HN 반응 확인 불가. 가벼운 OS/도구 소식이라 WebSearch 교차확인은 생략했다.

## 한 줄 요약

**NetBSD-current가 기본 시스템에 48KB짜리 경량 편집기 atto를 추가했다 — vi의 모드 전환에 익숙하지 않은 신규 사용자를 위해 입력/명령 모드 구분이 없는 Emacs 계열 키 바인딩 편집기를 선택지로 넣은 것으로, 2,000줄 미만의 C 코드로 최소한의 기능만 구현하는 것을 목표로 한다.**

## 핵심 포인트

- **선택지 추가의 동기** — NetBSD-current 기본 시스템에 atto를 추가해 ***vi와 xedit 외의 편집기 선택지***를 제공한다. 신규 사용자의 적응을 돕기 위한 변경이라고 밝힌다.
- **모드 없는 편집기** — ***입력 모드와 명령 모드가 분리되지 않은*** 터미널 편집기로, Emacs 계열 키 바인딩을 쓴다 — vi의 모드 전환에 익숙하지 않은 사용자를 위한 대안.
- **복구 시스템에도 적합한 크기** — 공식 공지 기준 ***크기가 48KB***에 불과해 복구 시스템에 포함하기에도 적합하다.
- **최소주의 설계 목표** — UTF-8, 여러 파일 편집, 화면 분할, 검색·바꾸기, 기본 구문 강조를 지원하면서도 ***C 코드 2,000줄 미만***으로 최소한의 Emacs 기능만 구현하는 것을 목표로 한다.

## 인상 깊은 문장

> (Slack 발췌가 마지막 불릿에서 끊겨 완결된 인용을 확보하지 못했다.)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가(원문 접근 차단). vi 진영과 Emacs 진영의 "에디터 전쟁" 농담이 댓글에 있을 법하지만 확인된 사실은 아니다.

## 내 생각 · 적용점

**핵심 전이 — "2,000줄 미만으로 최소 기능만"이라는 설계 목표는 [[2026-05-17-ascetic-computing-ratfactor]]에서 다룬 "제약이 깊이를 만든다"는 금욕적 컴퓨팅 철학의 구체적 구현 사례다.** atto는 Emacs의 방대한 기능을 흡수하지 않고 "모드 전환이 낯선 사용자를 돕는다"는 좁은 목표 하나에 2,000줄을 전부 쓴다 — 선택지를 늘리면서도 각 선택지는 의도적으로 작게 유지하는 방식이다. 같은 NetBSD 생태계를 다룬 [[2026-10-29-alpinebsd-netbsd-alpine-userland]](NetBSD 커널 + Alpine 사용자공간)와는 "최소 커널을 다양한 사용자공간과 조합한다"는 결이 통한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 "새 사용자의 적응 장벽을 낮추기 위해 기존 도구를 통째로 바꾸지 않고 작은 대안을 하나 더 추가한다"는 접근은, CRS의 복잡한 운영 화면에 익숙하지 않은 신규 직원을 위한 "경량 모드/간소화 뷰"를 별도로 추가하는 패턴과 멀게나마 연결된다.

## 연관 자료

- [[2026-05-17-ascetic-computing-ratfactor]] — "제약이 깊이를 만든다"는 금욕적 컴퓨팅 철학, atto의 2,000줄 제약 설계가 그 구체적 사례.
- [[2026-10-29-alpinebsd-netbsd-alpine-userland]] — 같은 NetBSD 생태계, 최소 커널 위에 사용자공간을 조합하는 접근.

## 한 달 뒤 회고

*(2026-11-30 즈음 — 특별히 재점검할 내용 없음. 가벼운 OS 도구 소식.)*
