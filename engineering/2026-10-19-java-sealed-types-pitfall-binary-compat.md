---
title: "Java sealed 타입의 함정 — 새 하위 타입이 기존 코드를 깨뜨릴 수 있다 (바이너리 호환이지만 소스·실행 호환은 아니다)"
source_title: "확인 불가 (Neil Madden 블로그 'Java sealed classes and exhaustive pattern matching'으로 추정)"
source_url: "https://neilmadden.blog/?p=4152"
source_name: "GeekNews 경유, WebSearch로 Neil Madden 블로그·OpenJDK JLS·메일링리스트 교차확인"
referrer_url: "https://news.hada.io/topic?id=35598"
published_at: "확인 불가"
summarized_at: "2026-10-19"
category: "engineering"
tags: ["java", "sealed-classes", "pattern-matching", "binary-compatibility", "semver", "api-design"]
---

# Java sealed 타입의 함정 - 새 하위 타입이 기존 코드를 깨뜨릴 수 있다

> 출처: 원문 자체(`news.hada.io`)는 차단됐으나, WebSearch로 거의 동일한 논지를 다루는 Neil Madden의 블로그 글 ["Java sealed classes and exhaustive pattern matching"](https://neilmadden.blog/?p=4152)과 OpenJDK JLS·메일링리스트를 교차확인 · GeekNews(id=35598) 경유 · 정리일 2026-10-19
>
> **출처 한계**: GeekNews 원문과 Neil Madden 블로그가 동일 글인지는 확정하지 못했지만(제목·논지가 매우 유사), 핵심 기술적 주장(아래 "바이너리 호환 vs 소스/실행 호환" 구분)은 OpenJDK 공식 JLS(Java Language Specification) 13장으로 독립 교차확인됐다 — 이 부분은 확신도가 높다.

## 한 줄 요약

**sealed 타입에 새 하위 타입을 추가하는 건 "바이너리 호환"이지만, 기존 switch를 재컴파일하면 컴파일 오류가 나고 재컴파일 안 하면 런타임에 `IncompatibleClassChangeError`가 난다 — 안전한 변경처럼 보이지만 실제로는 SemVer 메이저 버전급 변경이다.**

## 핵심 포인트

- Java의 ***sealed 클래스와 인터페이스***는 허용할 하위 타입을 제한해, 컴파일러가 `switch`에서 모든 경우를 처리했는지 검사할 수 있게 함.
- 모든 타입을 처리하면 ***`default` 분기 없이*** 작성할 수 있고, 빠뜨린 타입이 있으면 컴파일 오류 발생.
- 하지만 이 검사는 ***사용 코드를 컴파일할 때만*** 작동함 — 이미 컴파일된 바이너리에는 영향 없음.
- 공개 API의 sealed 타입에 새 하위 타입을 추가하면 기존 switch가 ***재컴파일에 실패***할 수 있음. SemVer를 따른다면 메이저 버전을 올려야 하는 호환성 파괴 변경.
- WebSearch로 교차확인된 정밀 구분(JLS 13장): sealed 타입에 허용된 직계 하위 클래스를 추가하는 것 자체는 ***"바이너리 호환"***(기존에 링크되던 바이너리는 계속 링크됨)이지만, "마이그레이션 비호환" 변경으로 분류됨 — 런타임에 exhaustive switch가 컴파일 시점에 몰랐던 새 하위 타입의 인스턴스를 만나면 ***`IncompatibleClassChangeError`***가 발생할 수 있음.
- 즉 문제는 세 층위로 나뉜다: (1) 라이브러리만 갱신하고 기존 사용 코드를 재컴파일하지 않으면 당장은 안 깨짐, (2) 재컴파일하면 컴파일 오류, (3) 재컴파일 안 한 채 새 타입의 인스턴스를 실제로 만나면 런타임 오류.

## 인상 깊은 문장

> "if you export a sealed type in your API then adding a new subtype is a breaking change that would require a major version bump (if you're following SemVer)." (Neil Madden, WebSearch로 확인)

## 댓글

hada 댓글 수 확인 불가. 다만 WebSearch로 찾은 OpenJDK amber-dev 메일링리스트 논의는 더 근본적인 지적을 한다 — exhaustive switch로 sealed 타입을 소비하는 순간, 그 클라이언트 코드는 해당 타입 계층과 ***긴밀하게 결합(tight coupling)***되므로, 애초에 "그 계층의 유지보수 책임을 같이 질 게 아니라면" sealed 타입의 exhaustive switch를 공개 API 경계에 쓰는 설계 자체를 재고해야 한다는 관점.

## 내 생각 · 적용점

"바이너리 호환 ≠ 안전한 변경"이라는 구분이 가장 중요한 교훈이다 — 버전 관리 도구나 CI가 "바이너리 호환성 검사만 통과하면 OK"로 착각하게 만들기 쉬운 지점이다. 핵심 전이: 공개 API에 sealed 타입을 노출할 때는 **항상 `default` 분기(또는 명시적 미래 대응 전략)를 남겨두거나, SemVer 메이저 버전을 올릴 각오**를 해야 한다 — "컴파일러가 모든 경우를 검사해준다"는 안전망이 라이브러리 경계를 넘으면 오히려 함정이 된다는 역설.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이지만(Java sealed 타입은 특정 언어 기능), 원칙은 전이 가능하다: CRS가 외부 파트너(PMS·OTA 연동사)에게 노출하는 enum류 상태값(예약 상태, 객실 타입 코드)에 새 값을 추가할 때도 똑같은 함정이 있다 — 파트너사의 switch/if-else가 새 값을 모르는 채로 돌아가다가 그 값을 실제로 만나면 예기치 못하게 실패할 수 있다. "새 값 추가는 항상 하위 호환 파괴 변경일 수 있다"는 가정으로 외부 API 버전 정책을 설계하는 게 직접 적용 가능한 교훈.

## 연관 자료

- (직접 연결되는 기존 노트 없음 — Java 타입 시스템을 다룬 선행 노트가 가든에 없어 억지로 연결하지 않는다.)

## 한 달 뒤 회고

- 2026-11-19 즈음: 유사한 "안전해 보이지만 실제로는 호환성 파괴"인 언어 기능 사례를 더 모아, 이 글과 묶어 다룰 가치가 있는지 점검한다.
