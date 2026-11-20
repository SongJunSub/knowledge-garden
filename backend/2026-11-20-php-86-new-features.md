---
title: "PHP 8.6의 새로운 기능 (GeekNews) — 부분 함수 적용은 인수를 즉시 평가한다는 함정"
source_title: "PHP 8.6.0: New Features Overview (추정)"
source_url: "https://www.php.net/manual/en/migration86.new-features.php"
source_name: "php.net 공식 매뉴얼 (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=37476"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "backend"
tags: ["php", "php86", "partial-application", "async-io", "language-features"]
---

# PHP 8.6의 새로운 기능 (GeekNews)

> 출처: 추정 php.net 공식 매뉴얼 "PHP 8.6.0: New Features Overview" · [GeekNews](https://news.hada.io/topic?id=37476) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단이 재확인됐다. 다수 2차 소스(stitcher.io 등)가 서로 일치하지만, 전부 출시 전 커버리지라 "최종 출시 기능셋"은 미확정일 수 있다.

## 한 줄 요약

**PHP 8.6은 부분 함수 적용·`Time\Duration`·확장 가능한 `Io\Poll` 폴링 API를 도입하는데, 부분 적용은 전달 시점에 인수를 즉시 평가한다는 함정이 있고 `Io\Poll`은 "순수 PHP로 진짜 비동기 런타임을 만들 빠진 조각"이라는 평가와 "여전히 기본 동기"라는 상반된 평가가 공존한다.**

## 핵심 포인트

- **부분 함수 적용(Partial Function Application)**: `?`로 인수 하나를, `...`로 나머지 전체를 비워두면 Closure를 반환한다. `version_compare(?, '8.6', '>=')`처럼 나중에 받을 인수만 남겨, 별도 화살표 함수로 감싸던 코드를 줄인다.
- ***부분 적용 시점에 전달된 인수는 즉시 평가***된다(지연 평가가 아니다) — 실수하기 쉬운 포인트로 명시된다.
- **`Time\Duration`**: 나노초 정밀도의 `final readonly` 클래스. 단위별 팩토리 메서드, 산술 연산, ISO 8601 파싱을 지원해 느슨한 int/float로 표현하던 "경과 시간"을 표준화한다.
- **`Io\Poll`**: Linux epoll, BSD/macOS kqueue, Solaris event ports, Windows WSAPoll을 하나의 인터페이스로 감싼 확장 가능한 폴링 API로, 기존 `stream_select()`의 확장성 한계를 보완한다.
- 평가가 갈린다 — 한쪽은 "PHP는 여전히 기본적으로 동기"라 하고, 다른 쪽은 "확장 없이 순수 PHP로 진짜 비동기 런타임을 만들 수 있게 하는 빠진 조각"이라 평가한다.

## 인상 깊은 문장

> "a call in which one or more arguments are replaced by the `?` placeholder... creates a Closure that accepts the missing arguments."

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: `Io\Poll`의 실제 영향력 평가가 소스 간 엇갈려 "순수 PHP 비동기 런타임의 빠진 조각"이라는 평가는 과장일 수 있다. 레포에 PHP 신규 언어기능을 다룬 선행 노트가 없어 이번이 첫 사례다.

## 내 생각 · 적용점

### 적용점

부분 함수 적용은 콜백·파이프라인 코드를 줄이는 데 유용하지만, "인수가 즉시 평가된다"는 함정을 모르고 지연 평가를 기대하며 쓰면 버그가 날 수 있다. `Time\Duration`처럼 느슨한 숫자 타입을 전용 값 타입으로 바꾸는 흐름은 다른 언어(Go의 `time.Duration` 등)에서도 반복되는 패턴이라, PHP 코드베이스의 "경과 시간"을 다루는 곳이 있다면 마이그레이션 후보로 적어둘 만하다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 언어 신규 기능 소식으로 직접 적용점은 없다. 다만 레포가 PHP 기반 레거시 코드를 다룬다면(과거 [[2026-10-22-php-foundation-patch-delay-postmortem]], [[2026-10-22-php-critical-rce-security-release]] 참고), 버전 업그레이드 로드맵에 참고할 수준이다.

## 연관 자료

- [[2026-10-22-php-critical-rce-security-release]] — 같은 PHP 런타임 계열, 다른 주제(보안 패치)
- [[2026-10-22-php-foundation-patch-delay-postmortem]] — 같은 PHP 생태계, 거버넌스 축(약한 연결)

## 한 달 뒤 회고

2026-12-20 즈음 — PHP 8.6 정식 출시 기능셋이 이 노트의 내용과 일치하는지, `Io\Poll` 기반 비동기 런타임 사례가 실제로 등장했는지 추적.
