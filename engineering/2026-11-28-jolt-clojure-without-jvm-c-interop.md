---
title: "Jolt — C와 대화하는 Clojure (yogthos, GitHub으로 프로젝트 자체는 특정 확인) — JVM을 걷어내는 방식으로 콜드 스타트 문제를 해결한다는 점에서 CRaC의 '체크포인트 복원'과 정반대 해법이다"
source_title: "Jolt: Clojure Compiler Runs on Chez Scheme / Runs Clojure Without the JVM and Binds C Libraries Natively"
source_url: "https://github.com/yogthos/jolt"
source_name: "GitHub (yogthos) · yogthos.net 블로그 병행"
referrer_url: "https://news.hada.io/topic?id=37979"
published_at: "2026-07-02"
summarized_at: "2026-11-28"
category: "engineering"
tags: ["clojure", "jvm-alternative", "chez-scheme", "c-interop", "single-binary", "cold-start", "language-runtime"]
---

# Jolt — C와 대화하는 Clojure (yogthos)

> 출처: [Jolt (yogthos/jolt)](https://github.com/yogthos/jolt) · [원 블로그 글](https://yogthos.net/posts/2026-07-02-jolt.html) · GeekNews [id=37979](https://news.hada.io/topic?id=37979) 경유 · Slack `#개발-뉴스-dev-news` 채널(원문 링크봇) 경유 · 정리일 2026-11-28
>
> **출처 한계(대체로 확인됨)**: news.hada.io는 egress 차단으로 미열람. 그러나 WebSearch로 **github.com/yogthos/jolt와 yogthos.net 블로그 글을 찾아 Slack 발췌와 거의 일치하는 내용을 확인**했다 — "JVM 없이 동작하는 새 Clojure 구현체", "Chez Scheme을 기본 타깃으로 컴파일", "C 라이브러리 네이티브 바인딩", "Gambit 타깃으로 JavaScript 출력 가능", "기존 Clojure 라이브러리 대부분이 JVM 호스트 인터롭에 의존해 포팅에 제약이 있다"는 저자 본인의 설명까지 교차확인됐다. 다만 SQLite·PostgreSQL·OpenSSL과의 구체적인 연결 데모, `jolt build`의 정확한 패키징 동작은 저자 블로그·저장소 수준에서만 확인했고 독립된 3자 벤치마크는 찾지 못했다.

## 한 줄 요약

**Jolt는 JVM 없이 Clojure를 실행하는 새 구현체로, Clojure 함수를 호출하듯 SQLite·PostgreSQL·OpenSSL 같은 기존 C 라이브러리를 직접 불러 쓸 수 있고, `jolt build`로 앱·런타임·의존성을 단일 실행 파일에 묶어 배포할 수 있다 — Clojure 코드를 Scheme으로 컴파일해 Chez Scheme 기반 네이티브 실행 또는 Gambit 기반 JavaScript 출력을 지원한다. GitHub 저장소와 저자 블로그로 핵심 주장 대부분을 독립 확인했다.**

## 핵심 포인트

- **JVM 제거, Chez Scheme으로 대체** — ***JVM 없이 Clojure를 실행***하고, C 라이브러리를 Clojure 함수처럼 직접 불러 쓰는 언어 구현체다. Clojure 소스를 호스트 중립적 IR로 분석한 뒤 Scheme으로 컴파일해 실행한다.
- **기존 C 라이브러리와 직접 연결** — SQLite, PostgreSQL, OpenSSL 등 ***기존 C 라이브러리와 연결***해 데이터베이스·네트워크 기능을 활용한다.
- **단일 실행 파일 패키징** — `jolt build`로 ***앱과 런타임, 의존성을 실행 파일 하나에 묶어 배포***한다. 실행할 컴퓨터에 JVM이나 Chez Scheme을 따로 설치할 필요가 없다.
- **두 가지 백엔드** — Chez Scheme 기반 네이티브 실행과 Gambit 기반 JavaScript 출력을 지원한다.
- **(저자 본인 언급) 포팅의 현실적 제약** — 기존 Clojure 라이브러리 대부분이 **JVM 호스트와의 인터롭에 의존**하고 있어, 이것이 Jolt로의 포팅에서 현실적인 제약이 된다고 저자는 밝힌다.

## 인상 깊은 문장

> "most existing Clojure libraries end up relying on some interop with the JVM host" — 저자(yogthos)가 밝힌, Jolt의 가장 현실적인 한계.

## 댓글

**hada 댓글 수 확인 불가** (원문 접속 차단). GitHub 저장소 자체는 실재하며 설명이 Slack 발췌와 상세히 일치해, 프로젝트 존재와 핵심 주장의 신뢰도는 높다고 판단한다. 다만 Janet 기반의 동명 "jolt-lang" 프로젝트가 별도로 존재해 검색 시 혼동할 수 있다는 점을 적어둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — 콜드 스타트 문제에 대한 정반대 해법: 체크포인트 복원 vs JVM 제거

[[2026-11-04-jvm-crac-startup-time-330s-to-3s]]에서 정리했던 CRaC는 **"워밍업을 마친 JVM 프로세스 상태를 저장해두고 복원"**해 330초를 2~3초로 줄이는 방식이다. 하지만 그 노트의 한계로 "CPU 명령어 불일치로 장애가 발생할 수 있다"는 운영 리스크를 지적했다. Jolt는 **같은 문제(JVM 시작의 무거움)를 정반대 방향에서 풀어낸다** — 워밍업을 빠르게 하는 게 아니라 JVM 자체를 걷어낸다. 둘을 나란히 두면 "콜드 스타트 문제"에 **"기존 런타임을 최적화한다" vs "그 런타임을 안 쓴다"**는 두 갈래 해법이 뚜렷하게 대조된다.

### 핵심 전이 2 — 단일 실행 파일 배포라는 이번 주 반복되는 테마

[[2026-11-27-minipg-postgresql-single-executable]]의 "SQLite처럼 쓰는 Postgres, 서버·클라이언트를 .pgdb 폴더 하나에 내장"과 이 글의 "`jolt build`로 앱·런타임·의존성을 실행 파일 하나에 묶는다"는 **같은 설계 철학의 다른 언어 버전**이다. [[2026-08-25-self-sqlite-executable-file-format]]의 "실행 파일 자체를 SQLite 데이터베이스로 쓴다"는 더 극단적인 사례까지 포함하면, **"런타임 의존성을 설치 단계가 아니라 빌드 단계로 끌어오려는" 흐름이 여러 생태계(Postgres, SQLite, Clojure)에서 독립적으로 반복**되고 있다는 걸 알 수 있다.

### 핵심 전이 3 — C 라이브러리 안전 바인딩이라는 Zig 노트와의 접점

[[2026-11-14-zig-vs-c-systems-programming]]에서 다룬 "C의 정리 누락·범위 밖 읽기를 언어 차원에서 막는다"는 문제의식과, Jolt가 Clojure 함수처럼 C 라이브러리를 직접 불러 쓴다는 설계는 **방향은 다르지만(Zig는 안전성 강화, Jolt는 편의성 확대) 같은 질문("C와 어떻게 안전하게/편하게 대화할 것인가")**을 다루고 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적)**: CRS·PMS 레거시 배포 환경(특히 온프레미스 호텔 서버, 네트워크가 불안정한 현지 지점)에서는 JVM·Node 같은 런타임을 별도로 설치·관리하는 부담이 실무적으로 크다. Jolt·minipg 같은 **"런타임 의존성 없는 단일 실행 파일" 패턴**은, 현지 설치 인력이 제한적인 해외 매장([[2026-11-27-oliveyoung-us-offline-store-system]]류의 상황)에 경량 에이전트나 로컬 동기화 도구를 배포할 때 참고할 만한 설계 원칙이다.

## 연관 자료

- [[2026-11-04-jvm-crac-startup-time-330s-to-3s]] — *같은 콜드 스타트 문제에 대한 정반대 해법(체크포인트 복원 vs JVM 제거)*
- [[2026-11-27-minipg-postgresql-single-executable]] — *단일 실행 파일 패키징 철학의 다른 언어 버전*
- [[2026-08-25-self-sqlite-executable-file-format]] — *런타임 의존성을 빌드 단계로 끌어오는 더 극단적인 사례*
- [[2026-11-14-zig-vs-c-systems-programming]] — *"C와 안전하게/편하게 대화하는 법"이라는 같은 질문의 다른 답*

## 한 달 뒤 회고

*(2026-12-28 즈음 — Jolt의 SQLite/PostgreSQL 연결 데모를 직접 실행해봤는지, `jolt build`로 만든 실행 파일의 실제 크기·시작 시간을 CRaC 사례와 비교해봤는지 기록.)*
