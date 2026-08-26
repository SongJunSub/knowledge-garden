---
title: "Rust의 never 타입 `!`, 10년 5차 시도 끝에 안정화 (WaffleLapkin) — 무엇을 바꿔야 하는지는 오래전에 알았다, 안전하게 바꿀 방법을 찾는 데 10년이 걸렸다"
source_title: "stabilize never type (rust-lang/rust#155499)"
source_url: "https://github.com/rust-lang/rust/pull/155499"
source_name: "GitHub rust-lang/rust (WaffleLapkin)"
referrer_url: "https://news.hada.io/topic?id=32888"
published_at: "2026-08-24"
summarized_at: "2026-08-26"
category: "engineering"
tags: ["rust", "type-system", "language-design", "stabilization", "backward-compatibility"]
---

# Rust의 never 타입 `!`, 10년 5차 시도 끝에 안정화

> 출처: [stabilize never type — rust-lang/rust#155499](https://github.com/rust-lang/rust/pull/155499) (GitHub, WaffleLapkin) · 정리일 2026-08-26
> **출처 한계**: GeekNews 토픽 페이지(`news.hada.io/topic?id=32888`)와 안정화 작업자 본인의 블로그(`blog.ihatereality.space`), 그리고 이 소식이 올라온 Lobsters 스레드(`lobste.rs`) 모두 이 세션에서 차단됐다. 대신 병합된 GitHub PR #155499 본문·타임라인은 직접 확인했고, WaffleLapkin의 블로그 글 제목("I stabilized never type")과 "5차 시도·10년"이라는 배경은 WebSearch로 재구성했다 — 원문 전체 서술(작업자의 소회 등)은 확인하지 못했다.

## 한 줄 요약

**RFC 1216으로 추적되던 Rust의 never 타입 `!`이 2026년 8월 24일 PR #155499 병합으로 안정화됐다. 어려웠던 건 `!`이라는 개념 자체가 아니라 ***"기존 코드가 암묵적으로 의존해온 fallback 동작을 건드리는 것 자체가 breaking change"***라는 하위 호환성 문제였고, 그 매듭을 푸는 데 10년·다섯 차례의 시도가 걸렸다.**

## 핵심 포인트

- **never 타입이 표현하는 것** — 값이 절대 만들어지지 않는 상황. `panic!()`, 무한 루프, 프로세스 종료처럼 ***호출자에게 값을 반환하지 않는*** 코드를 타입 시스템으로 정확히 표현한다.
- **안정화가 어려웠던 진짜 이유는 fallback** — 컴파일러가 타입을 추론할 수 없을 때, `!`을 안전한 기본값인 `()`로 처리해온 기존 동작(*unit never type fallback*)이 있었다. 오래된 코드가 이 동작에 암묵적으로 의존해왔기 때문에, ***fallback을 `!`로 바꾸는 것 자체가 하위 호환성을 깨는 변경***이었다.
- **최종 PR의 두 가지 변경** — ①**모든 에디션의 fallback을 `!`로 통일**(2024 에디션은 이미 별도 PR로 앞서 전환돼 있었고, 이번 PR로 나머지 에디션까지 완결). ②**`std::convert::Infallible`을 `!`의 타입 별칭으로 변경** — SemVer 상으로는 기술적 변경이지만 의도된 개선으로 간주.
- **breaking change를 어떻게 승인했나** — crater(전체 크레이트 대상 회귀 테스트) 실행 결과 **3,277건의 회귀**가 보고됐지만, 이는 fallback 변경이 의도한 breaking change로 판단돼 최종 승인됐다. **"정답을 아는 것"과 "안전하게 배포할 방법을 찾는 것"이 별개의 난이도라는 걸 숫자로 보여준다.**
- **관련 린트 정리** — unit never type fallback이 더 이상 발생하지 않으므로, 이를 경고하던 future-compatibility 린트들이 정리됐다(Rust 1.92에서 이미 이 린트들이 deny-by-default로 격상된 바 있다 — WebSearch로 확인, InfoWorld 보도).
- **작업자 본인의 표현** — 검색으로 확인한 블로그 글 제목이 ***"I stabilized never type"*** — 이번이 다섯 번째 시도였고, 이전 시도들은 모두 fallback 하위 호환성 문제 앞에서 좌초했다는 게 이 분야에서 반복적으로 회자되는 배경이다.

## 인상 깊은 문장

> "This PR stabilizes the never type, sets the never type fallback to `!` on all editions, and makes `Infallible` an alias of `!`."
> (PR #155499 본문 요약 — 세 가지 변경을 한 문장에 압축한다)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 전면 차단). Lobsters 스레드("I stabilized never type")가 존재한다는 것은 WebSearch로 확인했지만, 그 안의 개별 댓글 논점은 접근하지 못했다.
- **출처 한계 재확인**: 이 노트의 가장 신뢰할 수 있는 정보는 병합된 GitHub PR 본문·타임라인(직접 접근)이고, "10년·5차 시도"라는 배경 서사는 Slack 발췌 + WebSearch 스니펫으로 보강한 것이라 작업자 본인의 상세한 소회·이전 4차 시도들이 구체적으로 왜 실패했는지는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "도구/개념의 품질"과 "채택을 막는 하위 호환성"은 다른 축이다

[[2026-06-08-static-types-and-the-shovel]]는 ***"도구의 채택은 이념이 아니라 도구가 실제로 얼마나 좋은가가 결정한다"***는 명제를 다뤘다. 이 PR은 그 명제에 한 겹을 더한다 — never 타입이라는 ***개념*** 자체는 애초부터 옳았고 RFC 1216으로 오래전에 합의됐다. 안정화를 막은 건 개념의 품질이 아니라 ***"이미 배포된 동작을 어떻게 안전하게 바꾸는가"***라는, 완전히 다른 종류의 난이도였다. 좋은 도구도 하위 호환성이라는 별도 관문을 통과해야 한다.

### 핵심 전이 2 — "정답이 있는 이식"도 검증 비용은 여전히 사람의 몫

[[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]는 ***"이식(port)에는 정답지가 있어서 AI로 11일에 끝났다"***는 사례였다. 이 PR의 3,277건 crater 회귀는 비슷한 그림을 반대편에서 보여준다 — fallback 변경도 어떤 의미에서는 "정답이 있는" 규칙 변경이지만, ***그 규칙이 실제로 안전한지 검증하는 비용***(전체 생태계 회귀 테스트, breaking change 여부 판단)은 여전히 사람이 최종 판단해야 하는 영역으로 남는다. "정답지가 있다"는 게 "검증이 공짜"라는 뜻은 아니다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — Rust 언어 내부의 타입 시스템 변경이라 CRS 도메인과 접점이 없다. 다만 전이 가능한 원칙 하나는 남는다: **CRS의 API·데이터 포맷을 바꿀 때도 "새 동작이 옳은가"와 "기존 연동을 깨지 않고 옮길 방법이 있는가"는 별개의 질문**이라는 것 — 특히 채널 매니저·PMS 연동처럼 다수 파트너가 암묵적으로 기존 동작에 의존하는 인터페이스를 변경할 때, breaking change 여부를 회귀 테스트로 정량화하고 명시적으로 승인하는 절차([[2026-08-19-google-hotel-ads-third-party-rates-sunset]]의 "공지했다 vs 도달했다" 구도와 같은 축)가 참고할 만하다.

## 연관 자료
- [[2026-06-08-static-types-and-the-shovel]] — 타입 시스템의 "개념 품질"과 "하위 호환성 관문"이 서로 다른 축임을 보여주는 짝
- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — Rust 생태계의 다른 사건, "정답이 있어도 검증은 여전히 비용"이라는 대구
- [[2026-08-19-google-hotel-ads-third-party-rates-sunset]] — 기존 연동을 깨는 변경을 다루는 절차(공지·유예·검증)의 CRS 쪽 사례

## 한 달 뒤 회고
*(2026-09-26 즈음 — ①이 fallback 변경이 실제 배포된 크레이트들에서 얼마나 많은 breaking을 유발했는지, ②`Infallible` = `!` 별칭 전환이 다운스트림 라이브러리에서 마찰을 일으켰는지, ③이번 세션에서 못 읽은 원저자 블로그·Lobsters 댓글을 나중에라도 확인해 "5차 시도"의 구체적 배경을 보강할 수 있는지 점검.)*
