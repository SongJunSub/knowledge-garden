---
title: "GitHub Copilot 런타임, 80만 줄 TypeScript를 14.5주 만에 Rust로 이식한 이유와 방법 (GitHub/InfoQ) — Node.js·V8 의존성을 걷어내 CLI·앱·SDK가 공유하는 네이티브 에이전트 하네스를 만들었다"
source_title: "GitHub migrates Copilot runtime to Rust"
source_url: "https://www.infoq.com/news/2026/10/github-copilot-rust-migration"
source_name: "InfoQ"
referrer_url: "https://news.hada.io/topic?id=36687"
published_at: "2026-10-01"
summarized_at: "2026-11-06"
category: "engineering"
tags: ["rust", "typescript", "migration", "strangler-fig", "github-copilot", "runtime", "incremental-rewrite", "n-api"]
---

# GitHub Copilot 런타임, 80만 줄 TypeScript를 14.5주 만에 Rust로 이식한 이유와 방법 (GitHub/InfoQ)

> 출처: [GitHub migrates Copilot runtime to Rust](https://www.infoq.com/news/2026/10/github-copilot-rust-migration) (InfoQ, 2026-10월 보도 · GeekNews GN⁺ 경유) · 정리일 2026-11-06
> **출처 한계**: news.hada.io가 이 환경에서 접근 차단돼 GN⁺ 자체 글(영상 포함)은 열지 못했다. GitHub 공식 블로그(1차 소스)도 WebSearch 결과에는 나오지 않았다. 대신 InfoQ 기사와, 같은 내용을 재게시한 LinkedIn 포스트 다수를 교차확인했다 — **InfoQ 외 수치(특히 비용 $120,000, 메모리 절감 91%)는 LinkedIn 2차 재게시 글에서만 나와 1차 소스로 확인되지 않았다.** GN⁺가 "영상"이라고 표시한 원본 영상 자체는 특정하지 못했다.

## 한 줄 요약

**GitHub은 Copilot CLI·앱·SDK의 공통 런타임을 지탱하던 약 80만 줄 TypeScript/Node.js 코드를, 서비스 중단 없이 128개의 PR과 약 14.5주에 걸쳐 Rust 네이티브 바이너리로 점진 교체했다 — 목적은 "Rust를 쓰고 싶어서"가 아니라 Node.js·V8 의존성을 걷어내고 여러 제품이 공유할 수 있는 공통 에이전트 하네스를 만드는 것이었다.**

## 핵심 포인트

- **동기는 언어가 아니라 아키텍처** — Rust 도입 자체가 목적이 아니라, ***Node.js와 V8 의존성을 벗어나 여러 제품에 내장할 수 있는 공통 에이전트 하네스***를 만드는 것이 목적이었다. 기존 구조는 SDK 클라이언트마다 각자 Node.js 프로세스를 띄우고 JSON-RPC로 통신해야 했다.
- **스트랭글러 방식의 점진 교체** — 병렬로 전부 새로 짠 뒤 한 번에 컷오버하는 방식이 아니라, **TypeScript 구성요소를 하나씩 Rust로 교체**하며 임시 N-API 상호운용 계층으로 신·구 코드를 연결했다. 이 호환 계층은 N-API export 2,019개·TypeScript 호출지점 3,356곳에 도달한 뒤 제거됐다.
- **멈추지 않고 교체** — 개발과 배포를 멈추지 않고 약 14.5주 동안 점진적으로 교체했고, 이 과정에서 PR 약 128회를 출시했다. 작은 변경 단위 배포로 회귀 문제의 원인을 빠르게 좁힐 수 있었다.
- **성능 수치(InfoQ 보도)** — 클라이언트 시작·세션 생성·단일 턴 처리 시나리오가 **5.25초 → 292밀리초**로 줄었다(런타임을 프로세스 내부에 임베드했을 때 측정).
- **결과물의 형태** — Rust 런타임은 네이티브 바이너리로 노출되며, C ABI를 통해 프로세스 내부(in-process)로 실행하거나 기존 JSON-RPC 서버 뒤에서 프로세스 외부(out-of-process)로 실행할 수 있다 — 즉 "하나의 코어, 여러 통합 방식"이라는 구조로 귀결됐다.
- **(미확인) 비용·메모리 수치** — LinkedIn 재게시 글은 토큰 비용 약 $120,000(엔지니어링 시간 별도), 인프로세스 10클라이언트 벤치마크에서 메모리 추가분 약 91% 감소를 언급하지만, 1차 소스로 확인되지 않아 참고 수치로만 남긴다.

## 인상 깊은 문장

> "The migration replaced more than 800,000 lines of production code through an AI-assisted rewrite... delivered through 128 pull requests while GitHub continued releasing the runtime." (InfoQ 보도 재구성)

## 댓글

GN⁺ 글의 hada 댓글 수는 news.hada.io 접근 차단으로 확인하지 못했다. HN·Lobsters 큐레이션 여부도 미확인.

## 내 생각 · 적용점

### 핵심 전이 1 — "언어 교체"가 아니라 "공유 가능한 코어" 만들기가 진짜 목적이었다

이 글의 진짜 교훈은 Rust의 성능이 아니라, **여러 제품(CLI·앱·SDK)이 각자 런타임을 들고 다니는 구조를 하나의 코어로 합쳤다**는 아키텍처 결정이다. 똑같은 "TS→네이티브 이식" 동기를 가진 [[2026-10-21-tsrs-typescript-compiler-rust-port]](tsrs, TypeScript 컴파일러의 Rust 이식)와 나란히 놓고 보면, 2026년 하반기 들어 "AI 코딩 에이전트가 반복적인 대규모 재작성을 가능케 하자, 그동안 손대지 못했던 핵심 런타임까지 네이티브로 되돌리는" 흐름이 반복되고 있다는 게 보인다.

### 핵심 전이 2 — 스트랭글러 패턴 + N-API 임시 계층은 "점진 전환" 방법론의 모범 사례다

[[2026-06-08-java-to-kotlin-woowahan]](우아한형제들의 "테스트부터·작은 단위·점진 전환" 4만 5천 줄 무중단 전환)와 **같은 방법론 계열**이다. 둘 다 "전부 새로 짜고 한 번에 스위치"가 아니라, 호환 계층을 두고 작은 단위로 교체하며 배포를 멈추지 않는다. 언어(Java→Kotlin vs TS→Rust)도 다르고 규모도 다르지만, "큰 재작성은 작은 단위로 쪼개고, 신·구 코드가 공존하는 다리를 놓아라"는 원칙은 그대로 전이된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음(제한적).** 온다의 CRS가 여러 제품(예약 콘솔, 채널매니저, 파트너 API)에 공통 로직을 중복 구현하고 있다면, "공유 런타임/코어를 만들고 각 제품이 얇은 클라이언트로 붙는다"는 설계 방향은 참고할 가치가 있다. 다만 이번 사례의 규모(80만 줄, 14.5주, 전담 팀)는 CRS 조직 규모에 바로 대입하기엔 과도하다 — **"점진적으로, 작은 PR 단위로, 서비스 중단 없이" 교체한다는 방법론 원칙만** 떼어와야 한다.

## 연관 자료

- [[2026-10-21-tsrs-typescript-compiler-rust-port]] — 같은 "TS→네이티브 이식" 동기, 다른 대상(컴파일러)
- [[2026-06-08-java-to-kotlin-woowahan]] — 같은 점진 전환 방법론(테스트부터·작은 단위·무중단)의 다른 언어 사례

## 한 달 뒤 회고

*(2026-12-06 즈음 — GitHub 공식 블로그(1차 소스)를 확인해 비용·메모리 수치를 검증했는지, CRS 내부에 공통 런타임/코어로 합칠 만한 중복 로직이 실제로 있는지 점검.)*
