---
title: "Mercury의 200만 줄 Haskell 프로덕션 엔지니어링"
source_title: "A Couple Million Lines of Haskell"
source_url: "https://blog.haskell.org/a-couple-million-lines-of-haskell/"
source_name: "Haskell Blog (Ian Duncan, Mercury)"
referrer_url: "https://news.hada.io/topic?id=29137"
published_at: "2026-03-30"
summarized_at: "2026-05-04"
category: "engineering"
tags: ["프로덕션엔지니어링", "Haskell", "타입시스템", "Temporal", "도메인모델", "관측가능성", "신뢰성"]
---

# Mercury의 200만 줄 Haskell 프로덕션 엔지니어링

> 출처: [Ian Duncan — A Couple Million Lines of Haskell](https://blog.haskell.org/a-couple-million-lines-of-haskell/) · 레퍼러: [GeekNews 29137](https://news.hada.io/topic?id=29137) · 정리일 2026-05-04

## 🔖 한 줄 요약
**Haskell의 가치는 *순수성*이 아니라 *운영 지식을 타입에 인코딩하는 능력*** — 인력이 매년 두 배가 되는 핀테크에서 컴파일러로 *제도적 지식*을 강제하는 6가지 패턴.

## 🧩 핵심 포인트

### 컨텍스트
- **Mercury**: 30만+ 비즈니스 대상 핀테크, 2025년 거래량 **$248B (~340조 원)**
- 코드베이스: **~200만 줄 Haskell**
- 엔지니어 다수는 *입사 후 Haskell 학습*
- SVB 사태와 규제 검토를 견디며 운영 — 통념과 달리 robust 입증

### 신뢰성 = 변동 흡수 능력 (Adaptive Capacity)
> "Reliability is not just the absence of failure. It is the presence of adaptive capacity."

- *실패를 막는 것*이 아니라 *변동을 흡수하고 우아하게 저하*하는 능력
- 매년 인력이 2배가 되는 조직 = *항상 절반은 신참* → **타입 시스템은 떠나는 사람의 운영 지혜를 컴파일러가 강제하는 형태로 보존**

---

### 패턴 1. 순수성은 *경계*지 *철학*이 아니다
> "Purity is a boundary you try to maintain, not that Haskell is pure."

- `bytestring`/`vector` 내부에는 **mutable 할당과 unsafe coercion**이 가득
- 핵심: **side effect가 캡슐화**되어 있다는 점. `runST`의 rank-2 타입이 가변 참조의 탈출을 막는다
- 일반화: **위험한 동작은 좁은 경계 뒤에 두면 견딜 만하다** (의도적으로 노출, 오용 어렵게)

### 패턴 2. 안전한 경로 = 쉬운 경로 (Make the Right Thing Easy)
- 운영 절차를 *타입에 박아* 문서·구두 전승 의존을 끊는다
- 예: "이벤트 발행은 DB 쓰기와 *트랜잭션*으로 묶여야 한다"
  - **나이브**: `writeTransaction` + `publishEvents` 따로 두고 *개발자가 둘 다 부르길 기대*
  - **개선**: `Transact` 모나드를 *원자 핸들러*를 통해서만 commit 가능하게 재설계 → 타입 시스템이 정합성 강제

### 패턴 3. Temporal로 지속 실행 (Durable Execution)
- 결제·정산처럼 *여러 서비스·여러 실패 지점*을 가로지르는 워크플로에 [Temporal](https://temporal.io) 채택
- Temporal은 **결정적 이벤트 히스토리를 replay**해서 크래시 후 상태 복구
- Haskell 순수성과 완벽 정렬: **워크플로 = 이벤트 히스토리에 대한 순수 함수 / activity = I/O 경계**
- Mercury가 [`hs-temporal-sdk`](https://github.com/MercuryTechnologies/hs-temporal-sdk) 오픈소스화

### 패턴 4. 도메인 에러 ≠ 전송 코드
- **안티패턴**: 도메인 로직이 HTTP 상태 코드(`StatusCodeException 409`)를 throw
- 그 로직이 cron / Temporal / 백그라운드 워커에서 재사용되면 `409`는 *맥락 없는 노이즈*
- **개선**:
```haskell
data PaymentError = InsufficientFunds | DuplicateRequest | PartnerTimeout
toHttpError      :: PaymentError -> HttpResponse
toWorkerStrategy :: PaymentError -> WorkerAction
```
- 도메인 타입으로 모델 → *경계에서* 전송 형태로 번역. 전송 계층 교체에도 살아남고 *컨텍스트별 처리* 가능

### 패턴 5. 타입 인코딩의 *균형*
모든 불변식을 타입에 박을 필요는 없다. 타입은 인지 비용을 만들고 미래 변경을 제약한다.

| 처우 | 대상 |
|------|------|
| **타입에 인코딩** | *조용한 손상*(silent corruption)을 막는 불변식 — 이벤트 없는 트랜잭션, 감사 없는 결제 |
| **런타임 검증** | 명백히 실패할 위반 — 500 에러, assertion |
| **타입 모델링 *지양*** | 비즈니스 규칙이 모순·진화하는 영역 |
| **캡슐화** | 복잡한 타입 마법은 모듈 *내부*에 — public API는 단순 |

> "If violating the constraint would cause data loss, financial errors, regulatory trouble... the cost is justified. If it's 'we currently happen to do things this way,' you have likely made your codebase harder to change."

### 패턴 6. Records of Functions = 관측 가능성
> "Libraries cannot be operated if they cannot be observed."

- Haskell엔 monkey-patching 없음 → 불투명한 함수에 *사후* 계측 불가
- 해결: **함수 레코드**

```haskell
-- ❌ Bad
sendRequest :: Request -> IO Response

-- ✅ Good
data HttpClient = HttpClient
  { sendRequest :: Request -> IO Response
  , ...
  }
```

- 런타임에 wrapping → 트레이싱·결함 주입·모킹 가능 (라이브러리 fork 없이)
- **Monoid로 인터셉터 합성**:

```haskell
appInterceptors = mconcat [retargetingInterceptor, otelInterceptor, sentryInterceptor, ...]
```

각 관심사가 독립적, 합성은 `(<>)`.

#### 라이브러리 작성자에게 보내는 부탁
1. **OpenTelemetry 계측 훅** 제공
2. **로거를 파라미터로** 받기 (stderr/stdout 직접 쓰지 말 것)
3. **`.Internal` 모듈** 노출해서 탈출구 제공

### 불편한 진실
- `unsafePerformIO`는 `bytestring`/`text`도 *내부적으로 사용* — 컨벤션과 코드 리뷰가 가드
- Hackage 라이브러리 다수가 **테스트 빈약** — 컴파일만으로는 충분 X
- Orphan instance, partial function, `error` 호출 — *살아있는 시스템은 타협이 누적된다*. 목표는 *어디에·왜* 있는지 *문서화*하는 것

### Haskell이 가치 있나?
- **첫날엔 아니다** — 온보딩 느림, 라이브러리 부족, 에러 메시지 난해
- **수개월 안에 ROI** — 특히 *데이터 무결성 실패의 비용이 큰* 금융 서비스에서:
  - **기계적 리팩터링**: 타입 변경 → 컴파일러가 *놓친 호출 사이트* 전부 알려줌
  - **온보딩 레버리지**: 신입이 타입 시그니처 읽고 계약 이해 → 질문 줄어듦
  - **사고 예방**: 불가능한 상태가 *드문 게 아니라 진짜 불가능*
- 채용: Haskell이 *큰 풀*을 끌지 않지만 **성향(disposed) 풀*을 끈다*. 다만 *순수성·타입 우아함*에 대한 이상주의는 *제품을 파는 일에 부담* — 실용주의 배양 필요

## 📜 인상 깊은 문장

> "Reliability is not just the absence of failure. It is the presence of adaptive capacity."

> "Purity is a boundary you try to maintain, not that Haskell is pure."

> "Libraries cannot be operated if they cannot be observed."

> "If violating the constraint would cause data loss, financial errors, regulatory trouble... the cost is justified."

> "I mean in the much less romantic and much more useful sense that we run this language in production, at scale, with a rapidly changing team."

## 💭 내 생각 · 적용점 (언어 무관)

이 글의 진짜 가치는 *Haskell 옹호*가 아니라 **언어 무관 운영 엔지니어링 패턴 6개**다. Java/Kotlin/TypeScript 환경에서도 그대로 적용 가능.

### Kotlin/Java 컨텍스트 (CRS·PickMe·Connectivity 적용)

#### A. 안전한 경로 = 쉬운 경로 (Pattern 2)
- "예약은 결제 트랜잭션과 *함께* 이벤트 발행되어야 한다" — Mercury의 `Transact` 패턴과 동일 문제
- Kotlin 적용: **sealed class / inline class + DSL 빌더**로 *분리해서 호출하는 길을 막는다*
- 예: `bookingService.commit { ... }` 블록 안에서만 결제·이벤트 발행이 *함께* 실행되도록 → 따로 호출하면 컴파일 에러

#### B. 도메인 에러 ≠ 전송 코드 (Pattern 4)
- 우리도 자주 마주치는 안티패턴. CRS 내부 서비스에서 `ResponseStatusException(409)`을 throw하면, *그 로직을 배치/Kafka 컨슈머에서 재사용할 때* 의미 없어짐
- Kotlin 적용:
```kotlin
sealed class BookingError {
  object DuplicateRequest : BookingError()
  data class InsufficientInventory(val roomType: String) : BookingError()
  data class PartnerTimeout(val partner: String) : BookingError()
}
fun BookingError.toHttpResponse(): ResponseEntity<*> = ...
fun BookingError.toRetryStrategy(): RetryStrategy = ...
```
- 도메인 타입을 *전송과 분리* → CRS 백엔드 ↔ OTA Connectivity ↔ Kafka 컨슈머 ↔ 배치 모두에서 *동일한 도메인 에러 정의 재사용*

#### C. 타입 인코딩의 균형 (Pattern 5)
- *조용한 손상*을 만들 수 있는 영역 — **결제·재고·환불·OTA 정산** — 만 타입으로 박는다
- *비즈니스 규칙이 자주 바뀌는* 영역 — 프로모션·할인 정책 — 은 *런타임 검증과 데이터*로 처리
- 우리 코드에서 타입으로 박혀 있는 것 중 *진짜 필요한 것*과 *과한 것*을 구분하는 감사 가치 있음

#### D. Records of Functions = 관측 가능성 (Pattern 6)
- 우리는 보통 Spring AOP나 `@Around` 어드바이스로 처리하지만, 이 글의 발상은 *인터페이스 자체가 합성 가능*하게 만드는 것
- Kotlin 적용:
```kotlin
interface OtaClient { suspend fun reserve(...): Reservation }
class TracingOtaClient(val inner: OtaClient): OtaClient by inner { ... }
class RetryOtaClient(val inner: OtaClient): OtaClient by inner { ... }
val client = TracingOtaClient(RetryOtaClient(realOtaClient))
```
- AOP가 *마법*이라면 이 패턴은 *명시적 합성* — 디버깅이 쉽다.
- *우리 OTA Connectivity 게이트웨이*에 가장 잘 맞을 패턴.

#### E. Temporal-style Durable Execution (Pattern 3)
- CRS에 부분적으로 *상태 머신*으로 구현되어 있는 것들 — 예약 라이프사이클, 환불 워크플로 — 을 Temporal 또는 유사 도구로 옮길 가치 검토
- *결정적 이벤트 히스토리 replay*는 호스피탈리티의 *예약 충돌·취소·재발급* 시나리오에 정확히 맞는다

#### F. 신뢰성 = 변동 흡수 (Pattern 0)
- 호스피탈리티에서 *변동*은 OTA 장애·채널매니저 다운·PG 장애·트래픽 스파이크
- *전부 막는 것*이 아니라 *우아하게 저하*하는 시스템 — 부분 다운 시 *읽기 전용 모드 / 캐시된 가용성으로 폴백*
- 이 프레임을 의식적으로 채택하면 *완벽한 안정* 대신 *흡수 능력*에 투자가 맞춰진다

### 메타 관찰 — 가든 그래프
- [9초 사고](../ai/2026-04-27-ai-agent-deleted-production-database.md): *위험한 동작이 좁은 경계 뒤에 있지 않았다*는 패턴 1의 정확한 반례
- [의도 부채](2026-04-24-technical-cognitive-intent-debt.md): Mercury가 *타입에 운영 지식을 보존*하는 것은 의도 부채의 가장 강력한 처방 중 하나
- [채용 글](../career/2026-04-27-how-to-hire-someone-better-than-yourself.md): *"성향 풀(disposed pool)"* 개념이 정확히 일치 — 사람을 거르는 게 아니라 *자기-선별된 풀*을 만나는 효과
- [신용카드 브루트포스](../backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md): "출력 메시지가 공격 신호"였던 것의 일반화 — *경계의 출력은 보수적이어야 한다*

## 🎯 즉시 시도할 수 있는 액션 3가지

1. **CRS 도메인 에러 sealed 계층 시범 도입** — 한 모듈(예: 환불) 골라 `RefundError` sealed class 도입 → HTTP/배치/Kafka에서 *동일한 도메인 에러 재사용* 검증
2. **OTA Connectivity 클라이언트 인터셉터 합성 패턴** — 트레이싱·재시도·서킷브레이커를 *AOP가 아닌 by-delegation 합성*으로 재구성. 디버깅 가능성 비교
3. **타입 인코딩 감사 1회** — 현재 sealed class·Result type·NonEmpty 같은 *타입 보호* 중 "진짜 silent corruption 방어"인 것과 "관습"인 것 구분. 후자는 단순화 후보

## 🔗 연관 자료
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](2026-04-24-technical-cognitive-intent-debt.md) — 타입 = 의도 부채에 대한 강한 백신
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](../ai/2026-04-27-ai-agent-deleted-production-database.md) — *위험을 좁은 경계 뒤에* 두지 않은 사례
- [`backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md`](../backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 경계 출력의 보수성
- [`engineering/2026-04-23-laws-of-software-engineering.md`](2026-04-23-laws-of-software-engineering.md) — Tesler's Law(고유 복잡성)과 직결
- 도구: [Temporal](https://temporal.io), [hs-temporal-sdk](https://github.com/MercuryTechnologies/hs-temporal-sdk)

## 📝 한 달 뒤 회고
- [ ] CRS 한 모듈에 sealed `DomainError` 계층 시범
- [ ] OTA 클라이언트 by-delegation 인터셉터 합성 시도
- [ ] 우리 타입 보호 감사 결과
- [ ] *adaptive capacity* 프레임을 운영 회고에서 한 번 사용
