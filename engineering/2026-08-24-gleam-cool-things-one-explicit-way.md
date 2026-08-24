---
title: "Gleam의 멋진 점들 (Alejandro Baez, \"A Bit\") — 기능을 안 늘리고 하나의 명시적 방식에 수렴시켜서 얻는 단순함"
source_title: "The cool things of Gleam"
source_url: "https://a.baez.link/3mtdbbp2dmc27"
source_name: "A Bit (Alejandro Baez 개인 뉴스레터/블로그)"
referrer_url: "https://news.hada.io/topic?id=32783"
summarized_at: "2026-08-24"
category: "engineering"
tags: ["gleam", "functional-programming", "type-system", "pattern-matching", "language-design", "beam", "result-type", "developer-experience"]
---

# Gleam의 멋진 점들 (Alejandro Baez, "A Bit")

> 출처: [The cool things of Gleam](https://a.baez.link/3mtdbbp2dmc27) (A Bit · Alejandro Baez 개인 뉴스레터) · 정리일 2026-08-24
> **출처 한계**: 이 세션의 네트워크 egress 정책상 `a.baez.link`·`news.hada.io`·`lobste.rs` 등의 도메인 전부 직접 열람이 막혀(`EGRESS_BLOCKED`) 원문 전체 텍스트를 확인하지 못했다. 아래 내용은 **검색엔진(WebSearch)이 반환한 스니펫을 짜맞춰 재구성**한 것이며, "인상 깊은 문장"은 원문 그대로의 축자 인용이 아니라 **검색 스니펫에 나온 표현을 최대한 보존한 재구성**임을 명시한다. 저자(Alejandro Baez)의 신원·이력도 검색으로 확인되지 않았다(동명이인만 다수 검색됨).

## 한 줄 요약

**Gleam은 폐기 예정 표시(`@deprecated`)·미완성 작업(`todo`)·제네릭·패턴 매칭·오류 처리라는, 보통 다섯 개의 서로 다른 관용구·라이브러리·컨벤션으로 흩어져 있는 것들을 전부 언어 문법 하나로 통일해서 제공한다 — 기능을 더해 유연성을 늘리는 대신 "이 문제는 이렇게 푼다"는 방식 하나로 좁혀서 단순함과 가독성을 얻는다는 게 이 글의 축.**

## 핵심 포인트

- **`@deprecated`가 컴파일러 차원의 이주 경로다** — 함수에 폐기 예정 속성을 달면 "새 API로 어디로 가야 하는지"를 코드 자체에 남길 수 있다. 문서·릴리스 노트에 흩어지는 대신 호출부에서 바로 경고가 뜨는 구조.
- **`todo`가 언어 기본 구성 요소다** — 미완성 함수를 `todo`(또는 `todo as "설명"`)로 표시하면 *타입 체크는 통과*하되 컴파일 경고가 뜬다. TODO 주석과 달리 컴파일러가 존재를 계속 상기시킨다.
- **제네릭이 함수 타입 표기에 자연스럽게 녹아 있다** — 구체 타입 대신 타입 변수를 쓰는 방식으로, 표기가 간결하다. 다만 그 대가로 **제약된 제네릭(constrained generics) 같은 강력한 기능 일부를 포기**했다고 글은 인정한다 — 단순함이 공짜가 아니라는 걸 저자 스스로 밝히는 대목.
- **`case` 표현식 하나로 값 비교·목록 분해·별칭 지정을 전부 처리한다** — Gleam엔 `if`문이 따로 없고 흐름 제어가 사실상 `case`로 수렴한다. 별칭은 `as` 연산자로 서브패턴에 이름을 붙이는 방식.
- **Elixir와의 대비가 핵심 논지다** — 같은 BEAM 계열이지만 Elixir는 여러 함수 헤드(다중 함수 정의 + 가드 + 패턴 매칭)를 조합해 같은 문제를 푸는 반면, Gleam은 "한 가지 명시적인 방식"(`case` 하나)에 집중한다. Elixir는 `=` 표현식이 값을 반환하는 걸로 서브패턴 이름 문제를 풀었는데, 저자는 이 방식이 다소 어색(awkward)하다고 평가한다.
- **예외 없음, null/nil 없음** — 실패 가능한 연산은 전부 `Result(a, e)` 타입(`Ok`/`Error`)으로 반환하고, 값이 없을 수 있는 자리는 `Option`으로 표현한다. Gleam 값은 애초에 nullable하지 않다 — 타입이 `Nil`이면 그 값은 `Nil`이고, 다른 타입이면 `Nil`일 수 없다는 식으로 "부재"를 타입 시스템 안으로 끌어들인다.

## 인상 깊은 문장

> (검색 스니펫 재구성) *"Gleam takes the approach of being meticulous on doing things one simple way"* — 여러 방법을 허용하는 대신 하나의 정확한 방법을 고집한다는 이 글 전체를 관통하는 태도.
>
> (검색 스니펫 재구성) *"Values in Gleam are not nullable — if the type of a value is Nil then it is the value Nil, and if it is some other type then the value is not Nil."* — null 문제를 별도 검사가 아니라 타입 정의로 없애버리는 화법.

## 댓글

**GeekNews 원문 페이지는 이번 세션 egress 정책상 접근 불가**(`news.hada.io` 프록시 차단) — hada 댓글 수·논조는 전혀 확인하지 못했다. HN·Lobsters에 이 글("The cool things of Gleam", Alejandro Baez) 자체가 올라왔는지 검색으로 찾아봤지만 **직접 매치되는 스레드는 발견하지 못했다** — 있을 수도 있지만 확인 실패로 처리한다.

**주의할 혼동 지점 하나**: 검색 중 제목이 매우 비슷한 **다른 글** — Erika Rowland의 2023년 개인 블로그 글 "Things I like about Gleam's Syntax" — 가 계속 함께 검색됐다. 이쪽은 실제로 HN·Lobsters에 올라간 적이 있는 별개 글이다. 두 글은 저자·발행 매체·URL이 다르므로 **이 노트는 GeekNews 32783이 가리키는 "A Bit" 뉴스레터 글만을 대상으로 하고, Erika Rowland 글의 반응·댓글을 이 글의 것처럼 섞지 않았다** — 다만 검색 스니펫 자체가 두 출처를 혼합해서 반환하는 경우가 있어, 핵심 포인트 문구 중 일부가 미세하게 어느 쪽 출처인지 완전히 분리되지 않았을 가능성은 남는다.

## 내 생각 · 적용점

### 핵심 전이 1 — "선택지를 늘리는 대신 보증을 늘린다" 축에 언어 설계 사례가 하나 더 붙는다

[[2026-08-18-jep-540-simple-json-api]]에서 정리한 JEP 540의 핵심 문장 *"선택지를 늘리는 대신 보증을 늘립니다"*와 이 글의 논지가 형태가 같다. JEP 540은 파서 설정 옵션(주석 허용·느슨한 숫자 등)을 아예 안 만들어서 보증을 얻었고, Gleam은 `if`/여러 함수 헤드/가드 조합 대신 `case` 하나로 좁혀서 같은 보증을 얻는다. **Elixir라는 사촌 언어가 바로 옆에서 "여러 기능을 조합하는" 반대쪽 선택을 보여준다는 점이 이 사례를 더 선명하게 만든다** — JEP 540 노트가 세웠던 "무엇을 안 할지 정하는 게 무엇을 할 수 있는지 늘리는 것보다 강한 보증을 만든다"는 규칙이, 언어 설계 레벨에서도 그대로 반복된다. 다만 이 글 스스로 제네릭에서 그 대가(제약된 제네릭 포기)를 인정한다는 점이 JEP 540엔 없던 정직함이라 더 눈에 띈다.

### 핵심 전이 2 — Result/Option으로 부재·실패를 타입에 넣는 것은 Mercury Haskell 노트의 "타입에 운영 지식을 인코딩" 원칙과 계열이다

[[2026-05-04-mercury-couple-million-lines-of-haskell]]가 이미 세운 규칙 — *"조용한 손상을 막는 불변식만 타입에 박고, 명백히 실패할 위반은 런타임 검증으로 남긴다"* — 을 Gleam은 언어 차원의 기본값으로 강제한다는 차이가 있다. Haskell·Gleam 둘 다 BEAM/타입 계열에서 "예외를 던지지 않고 실패를 값으로 돌려준다"는 같은 결론에 도착한다는 게, 서로 다른 두 글이 독립적으로 같은 설계를 정당화한다는 뜻이라 신뢰도가 올라간다.

### 핵심 전이 3 — `@deprecated`/`todo`가 컴파일러 강제라는 점이 "경험을 팀 자산으로 남긴다"는 문제의식과 다른 해법이다

[[2026-06-08-java-to-kotlin-woowahan]] 노트의 인상 깊은 문장 *"그 기술을 어떻게 받아들이고 변화시켰는지의 경험은 팀의 자산으로 남는다"*는 마이그레이션 경험을 문서·회고로 보존하자는 이야기였다. Gleam의 `@deprecated`/`todo`는 그 경험(마이그레이션 경로, 미완성 이유)을 **문서가 아니라 코드 자체에, 컴파일러가 계속 상기시키는 형태로** 박아 넣는다는 점에서 같은 문제("나중에 아는 사람이 없어진다")에 대한 다른 층위의 해법이다. 문서는 안 읽히지만 컴파일 경고는 안 읽을 수가 없다는 게 차이.

## 호스피탈리티 / CRS 적용 포인트

**Gleam 자체를 온다 B2B 백엔드에 실무 도입할 가능성은 낮다고 정직하게 인정한다.** 온다 스택은 Kotlin/Spring + TypeScript이고, BEAM 타깃 신규 함수형 언어를 채택할 이유(팀 숙련도·생태계·채용 풀 어느 쪽도)가 없다 — [[2026-05-04-mercury-couple-million-lines-of-haskell]] 노트에서 Haskell에 대해 이미 같은 결론을 낸 것과 같은 자리다. 다만 전이 가능한 설계 원칙만 남기면:

- **Result/Option을 "명시적으로" 쓰는 습관은 지금 코드에도 바로 적용 가능하다.** Kotlin은 `sealed class`/`Result<T>`가 이미 있는데도 실무에선 `null` 반환이나 예외로 실패를 처리하는 경로가 여전히 섞여 있다 — [[2026-05-04-mercury-couple-million-lines-of-haskell]]의 CRS 체크리스트(도메인 에러 sealed class 시범 도입)와 정확히 같은 액션이다.
- **`@deprecated`의 "새 API로 가는 경로를 메시지에 남긴다"는 습관은 Kotlin의 `@Deprecated(message, replaceWith)`로 이미 지원된다** — 문제는 언어 기능 부재가 아니라 **관행 부재**다. 사내 API 폐기 시 `replaceWith`를 채워 넣는 걸 리뷰 체크리스트에 명시하는 정도가 현실적인 전이.
- **`todo`처럼 "컴파일은 통과하되 존재를 계속 상기시키는" 장치는 Kotlin `TODO()` 함수(런타임에 `NotImplementedError`)로 흉내낼 수는 있지만 Gleam처럼 컴파일 경고를 강제하진 않는다** — 정적 분석(detekt 커스텀 룰 등)으로 `TODO()` 잔존 개수를 CI 게이트에 걸면 비슷한 효과를 낼 여지는 있으나, 이건 언어 기능이 아니라 별도 인프라 투자가 필요해 "직접 적용은 멀다"고 밝힌다.
- **`case` 하나로 수렴시키는 설계 원칙 자체는 언어를 넘어 적용된다.** 파트너/OTA 연동 코드에서 조건 분기를 `if`/`when`/예외 처리로 흩어놓지 않고 하나의 명시적 분기 지점(sealed class + `when` 전수 커버리지)으로 모으는 리뷰 기준 정도가, Gleam 사례에서 가져올 수 있는 가장 현실적인 교훈이다.

## 연관 자료

- [[2026-08-18-jep-540-simple-json-api]] — "선택지를 늘리는 대신 보증을 늘린다"는 같은 설계 원칙을 JSON API 레벨에서 보여준 사례, Elixir/Gleam 대비와 정확히 같은 축
- [[2026-05-04-mercury-couple-million-lines-of-haskell]] — Result/타입으로 실패·부재를 표현하는 원칙이 이미 프로덕션 규모로 검증된 계열 사례, CRS 도메인 에러 sealed class 액션이 그대로 이어짐
- [[2026-06-08-java-to-kotlin-woowahan]] — "경험을 팀 자산으로 남긴다"는 문제의식에 대한 대조적 해법(문서·회고 vs 컴파일러 강제 경고)

## 한 달 뒤 회고

*(2026-09-24 즈음 — ①이 세션에서 egress 차단으로 못 읽은 `a.baez.link` 원문·GeekNews 댓글을 실제로 열람해 재구성 내용과 대조했는지 ②사내 Kotlin 코드에서 `@Deprecated(replaceWith=...)` 사용률을 실제로 점검해봤는지 ③detekt로 `TODO()` 잔존 게이트를 검토했는지 기록.)*
