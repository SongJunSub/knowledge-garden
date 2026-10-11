---
title: "Bun, TypeScript를 네이티브 코드로 선행 컴파일하는 AOT 컴파일러 실험 공개 (Jarred Sumner) — 타입을 지우는 게 아니라 JIT 없이 기계어로 굳히는 실험, Claude Code CLI에서 시작속도 24%·메모리 48% 개선"
source_title: "[JSC] Ahead-of-time compilation, a static heap, and sound types"
source_url: "https://github.com/oven-sh/WebKit/pull/757"
source_name: "GitHub oven-sh/WebKit PR #757 (Jarred Sumner) / X 발표 포스트 교차확인"
referrer_url: "https://news.hada.io/topic?id=35124"
published_at: "2026-10-04"
summarized_at: "2026-10-11"
category: "engineering"
tags: ["bun", "aot-compilation", "typescript", "javascriptcore", "jit", "compiler", "runtime-performance"]
---

# Bun, TypeScript를 네이티브 코드로 선행 컴파일하는 AOT 컴파일러 실험 공개

> 출처: [[JSC] Ahead-of-time compilation, a static heap, and sound types](https://github.com/oven-sh/WebKit/pull/757) (Jarred Sumner, oven-sh/WebKit PR) · X 발표 포스트·DraganSr 블로그·es.news.hada.io 미러로 교차확인 · 정리일 2026-10-11

> **출처 한계**: 이번 세션에서 WebFetch가 전면 차단되어 `news.hada.io`·`bun.sh`·`bun.com`·`x.com` 전부 직접 열람하지 못했다. 아래 내용은 WebSearch 스니펫 재구성이며, Jarred Sumner의 X 발표 글(인용문 포함), `oven-sh/WebKit` PR #757의 제목·설명, DraganSr 블로그의 AOT vs JIT 비교 글, GeekNews 스페인어 미러(`es.news.hada.io/topic?id=35124`, 같은 토픽 ID로 교차 확인됨)가 핵심 사실(플래그 존재, 메커니즘, 벤치마크 수치)에서 서로 일치해 골격은 신뢰할 만하다고 판단한다. 다만 hada 댓글 수·HN 큐레이션 여부, Bun 공식 블로그 4부작 시리즈의 전체 본문은 확인하지 못했다. 과업 지시에 주어진 플래그명(`--compile --aot`)과 WebKit PR에서 확인한 플래그명(`--compile --compile-aot`)이 달라, 이 노트는 실제 PR에서 확인한 쪽을 기준으로 적었다 — 실험 단계 기능이라 플래그명 자체가 최종 확정이 아닐 수 있다.

## 한 줄 요약

**Bun 창시자 Jarred Sumner가 TypeScript를 파싱 시점에 타입을 지우는 게 아니라, JavaScriptCore(JSC)의 바이트코드·B3 컴파일러를 거쳐 기계어로 선행 컴파일하는 실험적 AOT 모드(`bun build --compile --compile-aot`)를 공개했다. 결과 실행파일은 JIT을 끈 채로 돌며, Claude Code의 CLI를 대상으로 시작속도 24%·메모리 48%·CPU 46% 개선을 보였다 — 대신 바이너리 크기는 거의 2배로 늘었다. 기존 `--compile`(런타임을 통째로 묶는 번들링)·`--bytecode`(파싱만 빌드 타임으로 당기는 최적화)와는 다른, 완전히 새로운 축의 실험이다.**

## 핵심 포인트

- **기존 두 옵션과의 구분** — Bun은 이미 `--compile`(소스+Bun 런타임을 단일 실행파일로 묶음, 실행 시 여전히 JIT)과 `--bytecode`(파싱 작업을 런타임에서 빌드 타임으로 이동, 시작속도 개선)를 지원한다. 이번 AOT는 ***이 둘과 별개로, 타입 정보를 활용해 기계어까지 선행 컴파일하는 세 번째 축***이다.
- **메커니즘** — Bun의 번들러·파서로 TypeScript를 파싱 → "typecheck bytecode intrinsic"을 통해 타입 정보를 JavaScriptCore에 태깅 → 그 바이트코드를 ***B3(JSC의 최적화 컴파일러 백엔드)가 기계어로 컴파일***. 결과 실행파일은 **JIT이 꺼진 채로 실행**된다.
- **정적으로 잡히는 타입 오류는 빌드 타임에 거부** — 기존 TypeScript의 "타입은 지워지고 런타임에는 아무 보장도 없다"는 모델과 달리, AOT 빌드는 ***정적으로 알 수 있는 타입 오류를 빌드 자체에서 reject***한다.
- **그러나 전부는 아니다** — `JSON.parse()`처럼 ***정적으로 알 수 없는 값은 런타임에 타입 체크***를 수행한다. `as` 캐스트도 기존 TS처럼 컴파일 타임에만 존재하는 눈가림이 아니라 ***실제 런타임 변환으로 동작***한다 — 타입 시스템의 의미 자체가 달라진다는 뜻.
- **빌드가 못 보는 코드는 인터프리터로 후퇴** — `eval`, `new Function` 같은 동적 코드 경로는 AOT가 선행 컴파일할 수 없으므로 ***인터프리터로 실행***된다. 전면 네이티브화가 아니라 "볼 수 있는 만큼만" 네이티브화하는 설계.
- **실측 벤치마크(자체 보고)** — Claude Code CLI 대상 ***시작속도 24% 개선, 메모리 48% 감소, CPU 46% 감소***. 대가는 ***바이너리 크기 약 2배 증가*** — 기계어로 펼쳐진 코드가 번들된 JS+런타임보다 더 크다.
- **아직 실험 단계** — PR 제목이 "static heap, sound types"까지 포함하는 것으로 보아, 단순 컴파일러 백엔드 교체가 아니라 ***힙 레이아웃·타입 건전성(soundness)까지 손대는 더 근본적인 실험***으로 추정된다. Bun 공식 블로그가 현 1.4와 실험판을 비교하는 4부작을 냈다는 보도가 있으나 전문은 확인하지 못했다.

## 인상 깊은 문장

> "An early preview of experimental Bun + JSC with ahead-of-time compilation. For Claude Code's CLI: 24% faster startup, 48% lower memory, 46% lower CPU, and nearly 2x larger binary size." (Jarred Sumner, X, WebSearch 재구성)

## 댓글

**hada 댓글 수 확인 불가**(WebFetch 전면 차단). HN/Lobsters 큐레이션 여부도 확인하지 못했다. 다만 GeekNews 스페인어 미러(`es.news.hada.io/topic?id=35124`)의 존재로 같은 토픽 ID가 실재함을 교차 확인했다. **감안할 점**: ①수치는 전부 Sumner 자신의 1차 보고이고 ***단일 워크로드(Claude Code CLI)***에 대한 결과라 일반화에 신중해야 한다. ②"약 2배 바이너리 크기"는 배포 환경(컨테이너 이미지 크기, 콜드스타트와 무관한 디스크 비용)에 따라 trade-off 평가가 달라진다. ③실험 단계 기능이라 API·플래그명이 바뀔 수 있고, 프로덕션 채택 판단은 지금은 시기상조다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-09-typescript-7-0-announcement]]와 같은 흐름이지만 방향이 다르다

TypeScript 7.0은 ***도구체인을 Go 네이티브로 이식***해 "같은 결과를 더 빠르게 계산"하는 데 집중했다(빌드 8~12배 속도). 이번 Bun AOT는 "결과물 자체를 기계어로 만든다"는 ***실행 시점의 네이티브화***다 — 둘 다 "JS/TS 생태계가 네이티브 코드로 수렴한다"는 같은 거시 흐름의 다른 단면이다. 다만 TS 7.0은 타입 체커의 의미(semantics)를 바꾸지 않았고, Bun AOT는 ***`as` 캐스트를 실제 런타임 변환으로 바꾸는 등 타입 시스템의 의미 자체를 건드린다*** — 더 과감한 실험이라는 뜻이다.

### 핵심 전이 2 — [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]에서 본 "엔지니어링 집요함"의 연속

Zig→Rust 재작성 노트에서 나는 Jarred Sumner의 동기가 ***"성능이 아니라 메모리 안전(크래시 걱정 없이 잠들기)"***였다고 적었다. 이번 AOT 실험은 반대로 ***순수하게 성능을 노린 실험***이지만, 접근 방식의 공통점이 있다 — 표준적인 해법(JIT, 타입 지우기)을 그대로 받아들이지 않고, JSC 내부(바이트코드·B3)까지 직접 뜯어고치는 쪽을 택한다. Bun이라는 프로젝트의 일관된 태도 — ***"표준 경로가 느리면 런타임 내부를 직접 바꾼다"*** — 가 두 사건에서 동일하게 드러난다.

### 핵심 전이 3 — [[2026-10-10-deno-team-joins-cloudflare]]와 겹쳐 보면 JS 런타임 경쟁 구도가 보인다

같은 주(10월 9~11일)에 Deno 팀은 자체 런타임 개발을 접고 Cloudflare workerd에 합류한다고 발표했다. Bun은 정반대 방향으로 ***런타임 내부(JSC 포크)까지 직접 건드리는 투자를 늘리고 있다*** — 한쪽은 "독자 런타임 유지비용이 너무 크다"는 결론, 다른 쪽은 "독자 런타임이기 때문에 이런 실험이 가능하다"는 반대 증거다. 같은 생태계 안에서 "직접 만들 것인가, 플랫폼에 합류할 것인가"의 선택이 정반대로 갈리는 사례를 나란히 보는 게 흥미롭다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다의 백엔드 스택이 Bun 런타임에 의존한다는 전제가 없다면 이 실험 자체를 프로덕션에 들일 이유가 없다. 다만 전이 가능한 원칙 하나: **"정적으로 검증 가능한 것만 빌드 타임에 강제하고, 나머지는 런타임에서 체크한다"는 AOT의 설계는 CRS의 요금·재고 계산 로직에도 적용 가능한 원칙이다** — 예약 요금 규칙처럼 입력 스키마가 고정된 영역은 빌드/배포 타임에 정합성을 강제하고, 외부 OTA·GDS에서 들어오는 예측 불가능한 페이로드(JSON.parse에 해당)만 런타임 검증 대상으로 좁히는 식의 경계 설정이 그 원칙의 실무 번역이다.

## 연관 자료

- [[2026-07-09-typescript-7-0-announcement]] — 같은 "JS/TS 툴체인의 네이티브화" 흐름, 단 타입 체커 의미는 바꾸지 않은 쪽
- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — 같은 프로젝트(Bun)의 앞선 엔지니어링 결정, "표준 경로 대신 런타임 내부를 직접 바꾼다"는 태도의 연속
- [[2026-10-10-deno-team-joins-cloudflare]] — 같은 시기 JS 런타임 경쟁 구도에서 정반대 방향(독자 런타임 포기 vs 런타임 내부 투자 확대)

## 한 달 뒤 회고

*(2026-11-11 즈음 — ①Bun 공식 블로그 4부작 전문을 확인했는지, ②AOT 모드가 실험 플래그를 벗어나 안정 릴리스 로드맵에 올랐는지, ③Claude Code CLI 외의 다른 워크로드에서도 비슷한 개선폭(24%/48%/46%)이 재현됐다는 독립 보고가 있는지 기록.)*
