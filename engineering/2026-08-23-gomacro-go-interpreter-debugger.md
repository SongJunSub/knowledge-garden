---
title: "gomacro — Generics·Lisp식 매크로를 지원하는 인터랙티브 Go 인터프리터/디버거 (cosmos72) — Go는 원래 컴파일 언어라 REPL이 없는데, 그 공백을 9년째 유지보수 중인 개인 프로젝트가 메우고 있다"
source_title: "gomacro: Interactive Go interpreter and debugger with REPL, Eval, generics and Lisp-like macros"
source_url: "https://github.com/cosmos72/gomacro"
source_name: "GitHub (cosmos72)"
referrer_url: "https://news.hada.io/topic?id=32785"
summarized_at: "2026-08-23"
category: "engineering"
tags: ["go", "repl", "interpreter", "debugger", "developer-tools", "macros", "generics", "open-source", "scripting"]
---

# gomacro — Generics·Lisp식 매크로를 지원하는 인터랙티브 Go 인터프리터/디버거 (cosmos72)

> 출처: [gomacro](https://github.com/cosmos72/gomacro) (GitHub · cosmos72) · 정리일 2026-08-23

## 한 줄 요약

**순수 Go로 구현된 거의 완전한 Go 인터프리터로, 대화형 REPL·스크립트 실행·소스 레벨 디버거·"Eval() 라이브러리로 임베드" 네 가지 사용법을 모두 지원한다.** 2017년에 시작해 지금도 활발히 유지보수되는(최근 push 2026-08-02) 개인 프로젝트라는 점이, 컴파일 언어인 Go에 동적 언어의 편의(즉석 평가·런타임 스크립팅)를 끼워 넣으려는 커뮤니티 수요가 꾸준했다는 걸 보여준다.

## 핵심 포인트

- **일반 REPL 사용에는 Go 툴체인이 필요 없다** — ***"does not require a Go toolchain at runtime (except in one very specific case: import of a 3rd party package at runtime)"***. 즉 `gomacro` 바이너리 하나만 있으면 툴체인 설치 없이 Go 문법·표준 라이브러리를 즉석에서 실험할 수 있고, 서드파티 패키지를 런타임에 import할 때만 예외적으로 툴체인이 필요하다.
- **REPL과 스크립트 실행을 모두 지원** — `gomacro`로 대화형 REPL, `gomacro FILENAME.go`로 스크립트 직접 실행(Unix 계열은 shebang으로 `./FILENAME.go` 실행도 가능). 라인 편집·Tab 자동완성도 갖췄다.
- **버전 2.6부터 Go Source Debugger 내장** — 실행 중 CTRL+C, `:debug` 명령, 코드 내 `"break"` 문 세 가지 방법으로 진입해 step/next/finish/continue 등 표준 디버거 명령을 쓸 수 있다.
- **Eval() 라이브러리로 임베드 가능** — ***"a library that adds Eval() and scripting capabilities to your Go programs in few lines of code"***. 컴파일된 Go 애플리케이션 안에 인터프리터를 심어 런타임 스크립팅·플러그인 로직을 붙일 수 있다. 실제로 gophernotes(Go용 Jupyter 커널)가 내부 엔진으로 gomacro를 쓴다.
- **제네릭·매크로 지원** — "CTI"(Contracts are Interfaces) 방식의 실험적 제네릭(C++ 템플릿을 모델로 함)과, 일반 함수와 동일한 언어(Go)로 작성되는 Lisp 스타일 매크로를 지원해 `go generate` + 외부 코드생성기 조합 없이 소스 내부에서 반복 코드를 생성할 수 있다.
- **GitHub 신뢰도 지표** — star 2,291·fork 102·open issues 49, MPL-2.0 라이선스. 2017-02-15 생성 이후 9년 넘게 단일 메인테이너(cosmos72)가 유지보수 중이며, 경쟁 프로젝트 yaegi와 함께 Go 인터프리터 생태계의 대표 주자로 HN에서도 비교 대상으로 거론된다.

## 인상 깊은 문장

> "gomacro is an almost complete Go interpreter, implemented in pure Go. It offers both an interactive REPL and a scripting mode, and does not require a Go toolchain at runtime (except in one very specific case: import of a 3rd party package at runtime)."
> (gomacro는 순수 Go로 구현된 거의 완전한 Go 인터프리터다. 대화형 REPL과 스크립팅 모드를 모두 제공하며, 런타임에 Go 툴체인이 필요 없다 — 단 하나의 예외, 런타임에 서드파티 패키지를 import하는 경우만 빼고.)

```go
package main
import (
    "fmt"
    "reflect"
    "github.com/cosmos72/gomacro/fast"
)
func RunGomacro(toeval string) reflect.Value {
    interp := fast.New()
    vals, _ := interp.Eval(toeval)
    return vals[0].ReflectValue()
}
```

## 댓글

**GeekNews 원문 페이지는 이번 세션의 네트워크 egress 정책상 접근 불가**(`news.hada.io` 도메인 자체가 프록시에서 차단, `EGRESS_BLOCKED`) — hada 댓글 수·논조는 전혀 확인하지 못했다. HN에는 이 프로젝트를 다룬 스레드가 최소 두 건 존재함을 검색으로 확인했다(`item?id=19271393` "Gomacro: Interactive Go interpreter and debugger with generics and macros", `item?id=20518791` "is gomacro better for repl on golang comparing to yaegi?" — 둘 다 2019년경). 다만 HN 도메인도 이 세션에서 직접 열람은 안 돼 포인트 수·댓글 논조는 확인 불가 — **존재만 검색으로 확인했고 내용은 재구성하지 못했다는 한계를 명시한다.** Lobsters 큐레이션 여부는 검색으로 확인되지 않았다(없다는 뜻은 아니고 단순 미확인).

## 내 생각 · 적용점

### 핵심 전이 — "Go가 AI 코딩에 이상적"이라는 논증이 나열한 표준 도구 일체에 REPL은 없다

[[2026-08-12-why-go-for-ai-assisted-engineering]]에서 정리한 Google 공식 블로그의 논증은 gofmt·govulncheck·gopls·퍼즈 테스트·pprof·PGO를 "플랫폼 수준 도구 일체"로 꼽으며 Go 툴체인이 AI 에이전트 코드에 자동 안전망을 제공한다고 주장했다. **그런데 그 목록 어디에도 REPL이나 즉석 평가 도구는 없다** — Go는 애초에 컴파일 언어로 설계돼 파이썬·Node 같은 동적 언어의 "표현식 하나 즉시 확인" 워크플로가 표준 툴체인 밖에 있다. gomacro는 그 공백을 **Google이 아니라 개인 메인테이너가 9년째 커뮤니티 프로젝트로** 메우고 있다는 점이 대조적이다. Go의 검증 강점(정적 타입·강제 포매팅)이 "생성물을 얼마나 빨리 확인하는가"라는 반복 루프의 속도까지 보장하진 않는다는 걸, 이 프로젝트의 존재 자체가 보여준다 — 에이전트가 표현식 하나를 검증하려고 매번 전체 컴파일·실행 사이클을 돌 필요가 없다는 뜻이기도 하다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다 스택은 Kotlin/Spring과 TypeScript이고 Go 도구를 가져올 이유는 없다. 다만 Kotlin은 이미 `kotlinc` 대화형 REPL과 Kotlin Scripting(`.kts`, `ScriptEngine`)으로 gomacro가 채우는 공백(즉석 평가·런타임 스크립팅 임베드)이 기본 툴체인 안에 있다 — 그래서 이 프로젝트가 지적하는 "컴파일 언어의 REPL 공백" 문제 자체가 우리 스택에는 덜 해당된다. 전이 가능한 원칙만 남기면: **컴파일 언어를 고를 때 "정적 검증"과 "즉석 검증 루프 속도"는 별개 축**이라는 것 — 요금·재고 계산 로직처럼 자주 손으로 검증해야 하는 규칙을 다룰 땐, 매번 전체 빌드·배포 없이 표현식 단위로 즉시 확인할 수 있는 경로(Kotlin Scripting이든 REPL이든)가 있는지 점검할 가치는 있다.

## 연관 자료

- [[2026-08-12-why-go-for-ai-assisted-engineering]] — Go 표준 툴체인을 AI 코딩의 안전망으로 꼽은 논증에서 REPL/즉석 평가가 빠져 있다는 대조점
- [[2026-05-28-favorite-developer-tools]] — "좋은 기본값을 가진 도구" 담론과 겹치는, 니치하지만 오래 유지되는 개인 개발자 도구 프로젝트 사례

## 한 달 뒤 회고
*(2026-09-23 즈음 — ①gomacro가 GeekNews·HN에서 실제로 어떤 반응을 받았는지(이번엔 접근 차단으로 확인 못함) ②Kotlin Scripting을 CRS 요금 규칙 검증 같은 곳에 실제로 검토해봤는지 기록.)*
