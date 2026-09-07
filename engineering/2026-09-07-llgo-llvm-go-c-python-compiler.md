---
title: "LLGo (XGo 프로젝트) — Go 문법으로 쓰고 C ABI로 세계와 통한다, cgo 없이 C·Python 라이브러리를 그대로 부르는 LLVM 기반 컴파일러"
source_title: "llgo: A Go compiler based on LLVM in order to better integrate Go with the C ecosystem"
source_url: "https://github.com/xgo-dev/llgo"
source_name: "GitHub (xgo-dev/llgo)"
referrer_url: "https://news.hada.io/topic?id=33302"
published_at: "2026 (지속 개발 중, 정확한 최초 릴리스일 미확인)"
summarized_at: "2026-09-07"
category: "engineering"
tags: ["go", "llvm", "cgo", "c-abi", "python-interop", "compiler", "xgo"]
---

# LLGo — Go 문법으로 쓰고 C ABI로 세계와 통한다

> 출처: [llgo: A Go compiler based on LLVM](https://github.com/xgo-dev/llgo) (GitHub · XGo 프로젝트) · GeekNews(id=33302) 경유 · 정리일 2026-09-07

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 hada 댓글·본문을 직접 열람하지 못했다. GitHub 저장소(`xgo-dev/llgo`, `github.com/goplus/llgo`)와 Go 패키지 문서는 WebSearch 스니펫으로 교차 확인했다. 프로젝트가 활발히 유지되는 정황은 확인했으나 정확한 스타 수·최초 공개일은 특정하지 못했다.

## 한 줄 요약

**Go 소스를 LLVM IR로 컴파일하면서 C ABI를 공통 호출 규약으로 삼아, `cgo`의 스택·스케줄러 전환 비용 없이 C뿐 아니라 Python·JavaScript 등 "C 생태계"(ABI 호환 언어) 전체의 라이브러리를 직접 부를 수 있게 하는 컴파일러.**

## 핵심 포인트

- **문법은 Go, 통신은 C ABI** — LLGo는 ***Go 문법(소스 코드) 호환성***과 ***C 생태계 ABI 호환성***을 동시에 만족시키는 것이 목표다. "C 생태계"에는 C/C++뿐 아니라 ABI가 C와 호환되는 Python, JavaScript, Objective-C, Swift 등이 포함된다.
- **`cgo` 대비 핵심 이점 — 스택·스케줄러 전환 비용 제거** — 일반 Go의 `cgo`는 C 함수를 호출할 때마다 고루틴 스택 전환·스케줄러 개입 비용이 든다. LLGo는 LLVM IR 레벨에서 직접 C 함수를 호출해 ***이 전환 비용 자체를 피한다***는 게 설계상 핵심 차별점이다.
- **Python 라이브러리도 바로 호출** — `llpyg` 도구로 Python 라이브러리의 Go 바인딩을 생성하면, NumPy·pandas·PyTorch 같은 Python 생태계 라이브러리를 Go 코드에서 직접 사용할 수 있다. 단, 해당 Python 패키지 자체는 별도로 설치돼 있어야 한다(런타임에 Python 인터프리터·라이브러리를 필요로 하는 구조로 보인다).
- **컴파일 파이프라인** — 핵심 모듈 `cl`이 Go 패키지를 LLVM IR 파일로 변환하며, 이는 `llgo/ssa`(Go SSA 표현)에 의존한다. SQLite·OpenSSL·raylib 같은 C 라이브러리 바인딩과 데이터베이스 접근 예제도 함께 제공된다.
- **XGo 프로젝트의 서브프로젝트** — LLGo는 독립 프로젝트가 아니라 XGo(구 Go+) 생태계의 하위 프로젝트로, "여러 언어 생태계를 Go 문법 하나로 잇는다"는 XGo의 더 큰 비전 아래 위치한다.

## 인상 깊은 문장

> "A Go compiler based on LLVM in order to better integrate Go with the C ecosystem including Python and JavaScript." (프로젝트 설명, GitHub 저장소 README)

## 댓글

이 세션에서는 news.hada.io 접근이 차단돼 hada 댓글 수·내용을 확인하지 못했다. HN·Lobsters 큐레이션 존재 여부도 WebSearch로 별도 확인하지 못했다 — 검색 결과는 GitHub 저장소·패키지 문서·미러 저장소(여러 개인 fork/mirror 존재) 위주였다. **출처 한계**: 실제 프로덕션 채택 사례나 성능 벤치마크는 이번 조사 범위에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "언어를 넘나드는 상호운용"이라는 오래된 문제에 대한 또 하나의 답, 그러나 대가는 항상 있다

이전에 정리한 [[2026-05-08-sqlite-loc-recommended-storage-format]] 계열이 "언어에 상관없이 쓸 수 있는 공통 저장 포맷"을 다뤘다면, LLGo는 "언어에 상관없이 부를 수 있는 공통 호출 규약(C ABI)"을 다룬다는 점에서 같은 문제의식(생태계 파편화를 어떤 공통 레이어로 접합할까)의 다른 축이다. 다만 이런 접합은 항상 대가가 있다 — 여기서는 "Python 패키지를 별도 설치해야 한다"는 배포 복잡성, 그리고 LLVM IR 레벨 호출이 Go의 가비지 컬렉터·타입 안전성과 어떻게 상호작용하는지가 문서만으로는 불투명하다.

### 핵심 전이 2 — 하네스/도구 선택 라인과 맞닿는 지점: "표준 도구를 버리는 이유는 항상 비용 구조에 있다"

[[2026-09-05-armature-coding-agent-tool-choice-study]]가 "코딩 에이전트도 언어 생태계 관행에 따라 다른 도구를 고른다"는 걸 실측으로 보여줬듯, LLGo도 "표준 `cgo` 대신 왜 새 컴파일러를 쓰는가"에 대한 답이 결국 ***특정 워크로드의 비용 구조(스택 전환 비용)***에 있다. 새 도구를 도입할 때 "왜 표준을 안 쓰는가"라는 질문에 구체적 비용 수치로 답할 수 있어야 한다는 원칙이 여기서도 반복된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS/PMS 스택이 Go로 고빈도 C 라이브러리 호출을 필요로 하는 상황은 현재로선 드물다. 다만 원칙만 전이하면, ***레거시 시스템(C/C++ 기반 구형 CRS 엔진 등)과 신규 스택을 잇는 브릿지가 필요할 때, "새 언어로 전면 재작성" 대신 "ABI 레벨에서 기존 자산을 그대로 호출하는" 접근이 마이그레이션 리스크를 줄이는 선택지가 될 수 있다***는 점은 기억해둘 만하다.

## 연관 자료

- [[2026-09-05-armature-coding-agent-tool-choice-study]] — "왜 이 도구를 쓰는가"에 대한 답이 결국 비용·생태계 관행 구조에 있다는 점에서 공통 원칙

## 한 달 뒤 회고

*(2026-10-07 즈음 — LLGo가 실제 프로덕션에서 채택된 사례가 나왔는지, `cgo` 대비 벤치마크 수치가 공개됐는지 확인.)*
