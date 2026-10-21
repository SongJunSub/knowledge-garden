---
title: "tsrs - TypeScript 컴파일러의 Rust 이식판 (Max Schwenk / Cloudflare·VoidZero) — Go 네이티브 이식(tsgo)을 다시 추월하려는 두 번째 네이티브화 레이스"
source_title: "tsrs: A drop-in replacement for the TypeScript 7 compiler and language server, written in Rust"
source_url: "https://github.com/maschwenk/tsrs"
source_name: "GitHub (maschwenk/tsrs)"
referrer_url: "https://news.hada.io/topic?id=35724"
published_at: "확인 불가"
summarized_at: "2026-10-21"
category: "engineering"
tags: ["typescript", "rust", "compiler", "cloudflare", "voidzero", "oxc", "type-checking", "performance"]
---

# tsrs - TypeScript 컴파일러의 Rust 이식판

> 출처: GeekNews 토픽 [id=35724](https://news.hada.io/topic?id=35724) (원문 매체 미특정) · GitHub [maschwenk/tsrs](https://github.com/maschwenk/tsrs) 직접 확인 · 정리일 2026-10-21
>
> **출처 한계**: `news.hada.io`는 이번 세션에서도 egress 차단(`ENOTFOUND`)으로 원문을 열지 못했다. 다행히 `github.com`은 이번 세션에서 접속이 가능해, 프로젝트 저장소의 README와 `bench/RESULTS.md`를 1차 자료로 직접 WebFetch했다 — 그 내용은 이 노트의 핵심 포인트·성능 수치의 근거다. 다만 Cloudflare·VoidZero의 공식 발표 글(Slack 발췌가 "Cloudflare와 VoidZero가 Owner.com의 Max Schwenk와 함께"라고 명시한 그 발표문 자체)은 WebSearch로 찾지 못했다 — README는 "소개에서 Cloudflare의 발표 글을 함께 링크한다"고만 확인됐고, 그 발표문의 정확한 문구·날짜는 대조하지 못했다. "TypeScript 7.1에 일부 최적화가 반영됐다"는 Slack 발췌 내용도 README·bench 문서에서는 직접 확인하지 못했다.

## 한 줄 요약

**Cloudflare와 VoidZero가 Owner.com의 Max Schwenk와 함께 개발한 tsrs는, Microsoft의 Go 네이티브 포트(tsgo, TypeScript 7.0)를 다시 한번 추월하려는 Rust 재이식판이다 — 4개 타입 검사 워커를 쓰는 비교 환경에서 tsgo 대비 4.37배~11.81배 빠르고 메모리는 2.19배~7.24배 적게 쓴다고 저장소 자체 벤치마크가 보고한다. TypeScript의 문법·동작을 독자적으로 바꾸지 않고 원본과의 호환성을 유지하는 걸 목표로 하며, Microsoft와 제휴 관계는 없다.**

## 핵심 포인트

- **"호환성 유지"가 핵심 설계 목표** — README는 tsrs를 ***TypeScript 7 컴파일러·언어 서버의 드롭인(drop-in) 대체재***로 소개하며, 100% 적합성(conformance)을 달성하면서 메모리·속도를 개선하는 게 목표라고 명시한다. ***TypeScript의 microsoft/TypeScript `main` 브랜치를 추적***하며 TypeScript 7.1 기준 안정 버전 출시를 목표로 한다 — 새 언어나 별도 문법을 만드는 게 아니라, 기존 TypeScript를 그대로 더 빠르게 실행하는 쪽이다.
- **실측 성능 — tsgo 대비 4~17배, bun check 대비 1.4~7배** — Depot CI 16 vCPU 환경에서 17개 프로젝트를 `--noEmit`으로 비교한 자체 벤치마크(`bench/RESULTS.md`)에 따르면, ***`--checkers 4`(워커 4개) 설정에서 tsgo 대비 4.37배~11.81배 빠르고 메모리는 2.19배~7.24배 적게*** 쓴다. bun check와의 비교에서는 ***1.39배~7.31배*** 빠르지만 메모리는 프로젝트에 따라 더 쓰는 경우도 있었다. 워치 모드(vscode, 8 vCPU)에서는 초기 빌드 6.68배, 타입 오류 재검사 시 최대 53배까지 빠른 사례도 보고된다.
- **아직 정확성 버그 미발견(자체 보고) + 알려진 차이점** — README는 ***기존 프로젝트 테스트에서 아직 정확성 버그를 발견하지 못했다***고 밝히지만, Go 컴파일러(tsgo)와 ***진단 순서가 다른 것 같은 알려진 문제***가 있어 가장 가까운 비교를 위해 `--checkerAssignment go --noLazyMembers` 옵션을 권장한다. `--init`·`--showConfig`는 아직 지원하지 않는다.
- **후원 구조 — Microsoft와 제휴 없음** — 포팅은 Max Schwenk가 진행했고, ***Owner.com이 초기 작업을 후원, Depot이 CI를 후원***한다. Apache-2.0 라이선스를 따르며 Microsoft와는 공식 제휴 관계가 없다고 명시한다. 기여는 버그 리포트는 받지만, ***풀 리퀘스트는 검토 인력 부족으로 닫혀 있다*** — 오픈소스지만 외부 코드 기여는 현재 받지 않는 상태다.

## 인상 깊은 문장

> "tsrs is a drop-in replacement for the TypeScript 7 compiler and language server, written in Rust." (GitHub README, 요지)

## 댓글

GeekNews 댓글 수·HN/Lobsters 큐레이션 여부는 `news.hada.io` 차단으로 확인하지 못했다. Slack 발췌에 기록된 Reactions("화아이팅" 1개)는 GeekNews 자체의 반응이 아니라 Slack 채널 내 반응으로 보인다. 정직하게 짚을 점: (1) 벤치마크 전부가 저장소 자체 보고(self-reported)이고, README도 "공유 CI 머신에서는 실행마다 몇 퍼센트 차이가 날 수 있다"고 스스로 경고한다 — 독립 제3자 재현은 확인하지 못했다. (2) tsrs는 TypeScript 7.1-dev 커밋, tsgo는 7.0.2를 기준으로 비교해 ***버전 차이로 일부 프로젝트의 오류 수가 다르다***는 조건을 README가 명시한다 — 완전히 동일한 버전 간 비교는 아니라는 뜻이다. (3) PR이 닫혀 있다는 점은 커뮤니티 기여 기반 프로젝트가 아니라 소수(Schwenk + 후원사)가 주도하는 구조라는 걸 보여준다 — 장기 유지보수의 지속성이 특정 개인·후원 관계에 의존한다는 뜻이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-09-typescript-7-0-announcement]]가 세운 기준선을 다시 추월하려는 두 번째 네이티브화 레이스

TypeScript 7.0 노트는 Microsoft의 ***Go 네이티브 이식***이 대형 프로젝트 빌드에서 8~12배(vscode 11.9배) 속도 향상을 이뤘다는 발표를 다뤘다. tsrs는 바로 그 tsgo(Go 포트)를 ***다시 한번 추월하는 Rust 재이식판***이다 — "Go로 네이티브화했더니 빨라졌다"는 1차 혁신 다음에, "그 Go 포트보다 Rust가 더 빠르다"는 2차 경쟁이 곧바로 벌어지는 구도다. 두 글을 시간순으로 이으면 TypeScript 툴체인이 (1) JS로 작성된 원본 → (2) Go 네이티브 포트(tsgo, 2026-07) → (3) Rust 재이식(tsrs, 2026-10)으로 ***계속 더 빠른 네이티브 언어로 옮겨가는 릴레이***를 벌이고 있다는 게 보인다. 다만 tsgo는 Microsoft 공식 차세대 컴파일러(TypeScript 7.0 자체)인 반면 tsrs는 그 비공식 대체 구현이라는 지위 차이는 분명히 구분해야 한다.

### 핵심 전이 2 — [[2026-10-11-bun-aot-typescript-native-compiler]]와 같은 "JS/TS 생태계의 네이티브화" 흐름, 그러나 체커 의미는 보존하는 쪽

Bun AOT 노트에서 짚었듯, TypeScript 7.0(Go 포트)은 ***"같은 결과를 더 빠르게 계산"***하는 데 집중했고 타입 체커의 의미(semantics)는 바꾸지 않았다. tsrs도 정확히 같은 보수적 축에 있다 — README가 "100% 적합성"을 목표로 명시하듯, ***타입 체커의 판단 결과를 바꾸지 않고 실행 속도만 바꾸는 쪽***을 택한다. Bun AOT가 `as` 캐스트를 실제 런타임 변환으로 바꾸는 등 ***타입 시스템의 의미 자체를 건드리는 더 과감한 실험***이었던 것과 대비하면, "TS/JS 네이티브화"라는 큰 흐름 안에도 ①의미는 보존하고 속도만 올리는 보수적 트랙(tsgo, tsrs)과 ②의미 자체를 바꾸는 실험적 트랙(Bun AOT)이 공존한다는 구도가 선명해진다.

### 핵심 전이 3 — [[2026-10-18-thank-you-deno-javascript-ecosystem-competition]]이 예찬한 "런타임 경쟁"의 컴파일러 버전

Deno·Bun 런타임 경쟁을 예찬한 글은 ***"경쟁이 생태계 전체를 더 좋은 방향으로 밀어붙인다"***는 논지였다. tsrs는 같은 역학을 컴파일러 레이어에서 보여준다 — Microsoft가 공식 tsgo를 내놓자, Cloudflare·VoidZero(Oxc 생태계를 키우는 당사자) 연합이 곧바로 "우리가 더 빠르게 만들 수 있다"며 대체 구현을 내놓는다. Cloudflare는 이미 VoidZero를 인수해 Vite·Rolldown·Oxc를 아우르는 JS/TS 툴체인을 구축 중이므로, tsrs는 단순한 취미 프로젝트가 아니라 ***Cloudflare의 JS 툴체인 전략에 타입 체커 조각을 끼워 넣는 움직임***으로 해석할 수 있다 — 다만 PR이 닫혀 있다는 점에서 지금은 Oxc처럼 완전히 커뮤니티 오픈 거버넌스는 아니라는 차이가 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 다소 멀지만, 실무적으로 검토해볼 가치는 있다.** CRS·PickMe 같은 TypeScript 프로젝트가 커질수록 CI 타입 체크 시간이 파이프라인 병목이 되는 건 흔한 패턴이다. tsrs가 보고하는 수치(4 워커 기준 tsgo 대비 4~12배, bun check 대비 1.4~7배)가 실제 CRS 코드베이스에서도 비슷하게 재현된다면, CI 타입 체크 단계의 대기 시간을 직접 줄일 수 있는 후보다. 다만 정직한 제약: (1) tsrs는 ***드롭인 대체재를 표방하지만 아직 알려진 진단 순서 차이가 있고, PR이 닫혀 있어 버그 발견 시 외부가 직접 고칠 수 없다*** — 프로덕션 CI에 바로 들이기보다는 스테이징에서 교차 검증(기존 tsc/tsgo 결과와 diff)하며 신중히 도입할 도구다. (2) Microsoft 공식 구현이 아니므로, 차후 TypeScript 언어 자체의 변경(새 문법·타입 기능)에 얼마나 빠르게 tsrs가 추적해주는지가 장기 채택의 관건이다.

## 연관 자료

- [[2026-07-09-typescript-7-0-announcement]] — tsrs가 다시 추월하려는 기준선(Go 네이티브 포트 tsgo), 같은 네이티브화 릴레이의 앞 단계
- [[2026-10-11-bun-aot-typescript-native-compiler]] — 같은 "JS/TS 네이티브화" 흐름이지만 타입 체커 의미 자체를 바꾸는 더 과감한 실험과의 대비
- [[2026-10-18-thank-you-deno-javascript-ecosystem-competition]] — "경쟁이 생태계를 밀어붙인다"는 같은 역학이 컴파일러 레이어에서 재현된 사례

## 한 달 뒤 회고

2026-11-21 즈음, tsrs가 TypeScript 7.1 안정 버전 출시 일정에 맞춰 실제로 안정화됐는지, Cloudflare·VoidZero의 공식 발표문을 직접 확인해 이 노트의 추정을 보강했는지, CRS 코드베이스에서 CI 타입 체크 시간 벤치마크를 한 번이라도 시도해봤는지 점검.
