---
title: "Java → Kotlin 환승연애 (우아한형제들, 배민페이) — '테스트부터·작은 단위·점진 전환'으로 45,000줄/0장애, 그리고 '경험은 팀의 자산' (도구 철학·실무 방법론 라인)"
source_title: "Java야…, 우리 그만 헤어져. Kotlin으로 환승연애"
source_url: "https://techblog.woowahan.com/22586/"
source_name: "우아한형제들 기술블로그 (주지민)"
referrer_url: "https://techblog.woowahan.com/22586/"
published_at: "2025-07-22"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["kotlin", "java-to-kotlin", "migration", "tech-debt", "incremental-migration", "testing", "kotest", "spring", "refactoring"]
---

# Java → Kotlin 환승연애 (우아한형제들, 배민페이) — '테스트부터·작은 단위·점진 전환'으로 45,000줄/0장애, 그리고 '경험은 팀의 자산' (도구 철학·실무 방법론 라인)

> 출처: [Java야…, 우리 그만 헤어져. Kotlin으로 환승연애](https://techblog.woowahan.com/22586/) (우아한형제들 기술블로그, 주지민) · 정리일 2026-06-08

## 한 줄 요약

**배민페이플랫폼팀이 2018년부터 운영하던 *Java 기반 레거시 포인트 시스템*을 약 3개월에 걸쳐 Kotlin으로 전환한 경험기. 단순 언어 교체가 아니라 ***테스트 기반 강화 + 기술 부채 해소 + 팀 언어 통일***을 함께 담은 변화. 핵심 전략은 ***①운영 로직에 영향 없는 "테스트 코드부터" 전환(안전 영역) → ②작은 기능/패키지 단위 점진 배포(대규모 병합 회피) → ③전환하며 기술 부채를 함께 정리***. 결과: *45,000줄 수정, SonarQube Code Smells 330→4(98.8%↓), 테스트 커버리지 61.5→76.7%, 82개 티켓·10번 배포·**장애 0건***. 메시지: ***"기술은 언제나 바뀔 수 있지만, 그 기술을 어떻게 받아들이고 변화시켰는지의 경험은 팀의 자산으로 남는다."***

## 핵심 포인트

- **왜 전환했나** — *2018년 이후 코드베이스가 무거워지고 의도 파악이 어려워짐 + 팀 내 다른 시스템은 이미 Kotlin*이라 *언어 불일치 비용(문맥 전환·리뷰 시간·테스트 품질 불균형)* 누적. Kotlin의 *간결한 문법·null 안정성·높은 가시성*이 레거시 개선에 적합. **언어 "통일" 자체가 협업 비용 절감** — [[2026-05-29-choose-boring-technology-2015]] *"팀이 이미 아는 기술"*의 결.
- **정량 결과** — *LoC 수정 ~45,000 · Code Smells 330→4(98.8%↓) · 커버리지 61.5→76.7%(+15.2%p) · 82티켓/10배포/**0장애***. **"전환 + 테스트 개선을 함께"** 해서 나온 수치.
- **1단계: 테스트부터** — *운영 로직 영향 없는 안전 영역*. **Kotest**(FreeSpec·ShouldSpec 선언형으로 의도 명확화) + **MockK**(Kotlin 최적 목킹)로 스타일 통일, 부족하던 커버리지 보완.
- **2단계: 점진 배포** — *작은 기능/패키지 단위*로 쪼개 *장애 가능성·영향 범위 최소화*. **빅뱅 병합 회피**가 0장애의 핵심.
- **3단계: 기술 이슈 해소(= 곧 내 스택 체크리스트)** — *nullable/non-null 명확 구분 + `requireNotNull` 검증* · *Lombok 제거 → `data class`* · *Stream API → Kotlin 컬렉션 함수(목적이 함수명으로 드러남)* · *Optional 제거 → `?.`/`?:`* · *정적 유틸 클래스 → 확장 함수*.
- **함정 모음(전환 실무에서 꼭 밟는 것들)** — *git 히스토리 유실 방지: IntelliJ "Extra commit for .java > .kt renames" 켜기(단 squash 머지면 유지 불가)* · *Lombok+Kotlin 빌드 순서: kapt → Kotlin → java annotation processor → java* · *QueryDSL: `Projections.constructor()` 사용(`fields()`는 data class 불변성과 충돌)* · *역직렬화: `jackson-module-kotlin`·`kotlin-reflect` 추가, 커스텀 ObjectMapper엔 `KotlinModule` 명시 등록* · *예외/트랜잭션: Kotlin은 모든 예외가 unchecked → checked 전파 의도면 `@Throws` 필수*.

## 인상 깊은 문장

> "단순한 언어 변경이 아니라, 테스트 기반 강화, 기술 부채 해소, 팀 내 개발 언어 통일 등 다양한 목표를 함께 담은 변화였습니다."

> "기술은 언제나 바뀔 수 있다고 생각합니다. 하지만 그 기술을 어떤 방식으로 받아들이고, 변화시켜 나갔는지에 대한 경험은 팀의 자산으로 남습니다."

> "작은 단위로 점진적으로 전환하고 각 단계를 검증해가며 진행한 경험은, 앞으로 유사 프로젝트에도 안전하게 개선할 수 있다는 자신감을 주었습니다."

## 댓글 (전수 확인)

> 기술블로그 직접 글 — **공개 댓글 섹션 없음**(아카이브용 메타로만 남김).

## 내 생각 · 적용점

### 도구 철학·실무 방법론 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반이 아니라 레거시 전환 방법론·Kotlin 실무*. [[2026-06-08-prefer-duplication-over-wrong-abstraction]](설계 판단)과 같은 비AI 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1). **다만 이 글은 내 주력 스택(Kotlin+Spring)이라 "전이 가능한 관점"이 아니라 "직접 실행 체크리스트"로 흡수**.

### 핵심 전이 1 — "테스트부터 → 작은 단위 → 점진"이 0장애를 만든다 (Strangler식)

가장 전이력 높은 실무 원칙: ***운영 로직에 손대기 전에 "안전 영역(테스트 코드)"부터 옮기고, 빅뱅 병합 대신 작은 기능 단위로 배포하며 매 단계 검증***. 82티켓/10배포/0장애가 이 전략의 증거다. 이건 [[2026-06-08-prefer-duplication-over-wrong-abstraction]] *"역방향 리팩터링(인라인 후 재추출)"*·[[2026-06-01-code-is-cheaper]] *"빼기·절제"*와 같은 절제의 리듬 — **CRS·stock-autotrader 같은 내 프로젝트의 리팩터링/마이그레이션도 "테스트 보강 → 작은 PR → 점진 배포"로**. 자기검증·잦은 커밋 습관과도 정합(작은 단위 = 잔디 + 안전).

### 핵심 전이 2 — Kotlin 전환 = 곧장 쓸 수 있는 체크리스트

내 스택이라 그대로 실행 항목: *nullable/non-null 명확 구분 + `requireNotNull`로 비즈니스 불변식 검증* · *Lombok→`data class`* · *Stream→컬렉션 함수(가독성)* · *Optional→`?./?:`* · *유틸 클래스→확장 함수*. 그리고 **함정 4종 미리 방지**: *QueryDSL은 `Projections.constructor()`(불변 data class), 역직렬화는 `jackson-module-kotlin`+`KotlinModule` 등록, 빌드 순서 kapt→Kotlin→java, checked 전파엔 `@Throws`*. CRS/PickMe에 Java 잔재가 있으면 이 목록이 PR 템플릿이 된다. (KDoc 주석은 한국어로.)

### 핵심 전이 3 — "경험이 팀의 자산"은 Naur '이론 구축'의 실증

***"기술은 바뀌어도, 그 기술을 어떻게 받아들이고 변화시켰는지의 경험은 팀의 자산으로 남는다"*** — 이건 [[2026-05-14-naur-programming-as-theory-building]] *"프로그램의 진짜 가치는 코드가 아니라 사람·팀이 가진 '이론(왜 이렇게 됐는가)'에 있다"*의 정확한 실증. **언어 전환의 산출물(45k줄 Kotlin)보다, "어떻게 안전하게 옮겼는가"라는 방법론적 이론이 더 오래 남는 자산**. → 전환을 할 때 *결과 코드뿐 아니라 "왜·어떻게"를 문서/회고로 남기는 것*이 진짜 ROI. 가든에 이 글을 남기는 행위 자체가 그 실천.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건(비AI 실무 방법론). *도구 철학·실무 방법론 라인* — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43). AI 경제 2연속([[2026-06-08-the-untrainable]]·[[2026-06-08-who-prices-intelligence]]) 뒤 비AI 실무로 전환 — 라인업 다양성 회복.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- 우아한형제들 기술블로그 (원문) · [techblog.woowahan.com/22586](https://techblog.woowahan.com/22586/)
- [[2026-05-14-naur-programming-as-theory-building]] — *"경험·이론이 팀의 자산"의 원형*
- [[2026-06-08-prefer-duplication-over-wrong-abstraction]] — *"역방향 리팩터링·점진 개선"의 설계 판단*
- [[2026-05-29-choose-boring-technology-2015]] — *"팀이 이미 아는 기술로 통일"의 복잡성 절감*
- [[2026-06-01-code-is-cheaper]] — *"Lombok/Optional/Stream 제거 = 빼기·절제"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — CRS/PickMe의 Java 잔재를 "테스트부터·작은 단위" 원칙으로 Kotlin화했는지, 함정 체크리스트(QueryDSL·Jackson·@Throws·빌드 순서)를 실제로 PR 템플릿화했는지, 전환 "왜·어떻게"를 회고로 남겼는지 기록.)*
