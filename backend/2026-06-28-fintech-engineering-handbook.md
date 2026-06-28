---
title: "핀테크 엔지니어링 핸드북 (pitula.me) — '데이터 생성 금지·손실 금지·무조건 신뢰 금지', 돈을 다루는 소프트웨어의 3원칙과 실전 체크리스트"
source_title: "Fintech Engineering Handbook"
source_url: "https://w.pitula.me/fintech-engineering-handbook/"
source_name: "pitula.me"
referrer_url: "https://news.hada.io/topic?id=30892"
summarized_at: "2026-06-28"
category: "backend"
tags: ["fintech", "payment", "double-entry-bookkeeping", "idempotency", "bigdecimal", "reconciliation", "financial-systems", "api-design", "webhook"]
---

# 핀테크 엔지니어링 핸드북 (pitula.me) — '데이터 생성 금지·손실 금지·무조건 신뢰 금지', 돈을 다루는 소프트웨어의 3원칙과 실전 체크리스트

> 출처: [Fintech Engineering Handbook](https://w.pitula.me/fintech-engineering-handbook/) (pitula.me) · 정리일 2026-06-28

## 한 줄 요약

**돈을 다루는 소프트웨어는 일반 CRUD와 근본적으로 다르다. 세 원칙(데이터 생성 금지·손실 금지·무조건 신뢰 금지)을 기반으로, 부동소수점 금지·복식부기·멱등성·재시작 가능성·raw payload 저장·대사(Reconciliation)가 필수다. 중요한 조작에는 4-eyes 승인까지.**

## 핵심 포인트

- **3원칙** — ①데이터 생성 금지(중복 처리·임의 잔액 변경 불가) ②데이터 손실 금지(모든 거래 영속화) ③무조건 신뢰 금지(외부 제공자·내부 컴포넌트·현실 모두 검증).
- **금액 표현** — 부동소수점(float/double) 절대 금지 → `BigDecimal`, 최소 단위 정수(€12.34 → 1234), 유리수. JSON 직렬화 시에도 IEEE-754 문제 주의.
- **복식부기(Double-Entry)** — 잔액을 직접 저장하지 않고 거래 로그에서 파생. value time·booking time·settlement time 세 타임스탬프 분리 필수.
- **멱등성(Idempotency)** — 분산 시스템에서 중복 전달 방지. 멱등성 키로 재시도 시 동일 결과 보장.
- **재시작 가능성(Restartable)** — 중단된 흐름이 처음부터 다시 실행되어도 안전해야 한다.
- **외부 API** — 스키마를 신뢰하지 말고, 모든 요청·응답 raw payload를 저장(감사 추적·재처리용).
- **웹훅** — 순서를 가정하지 말고, 유효성 검증 필수, raw payload 저장.
- **대사(Reconciliation)** — 외부 데이터와의 일관성을 주기적으로 확인하는 독립 프로세스.
- **4-eyes 승인** — 민감한 작업(대량 이체, 잔액 조정)은 두 명 이상 승인.

## 인상 깊은 문장

> "금융 시스템에서 부동소수점을 쓰는 것은 예측 불가능한 정밀도 손실을 허용하는 것이다."

> "잔액은 거래 로그에서 파생하는 것이지, 저장하는 것이 아니다."

> "외부 API를 신뢰하지 마라 — raw payload를 저장하라."

## 댓글 — HN 논쟁 (부동소수점·이벤트 소싱 실무 토론)

- **부동소수점 절대 금지에 대한 반론**: 많은 금융 기관이 double을 세심한 정밀도 관리와 함께 사용하며 문제가 없다는 실무 경험. 컨텍스트에 따른 엔지니어링 판단이 더 중요하다는 지적.
- **이벤트 소싱의 필요성**: 복식부기를 이벤트 소싱으로 구현하는 것의 장단점 토론.

## 내 생각 · 적용점

### 핵심 전이 1 — CRS 예약 시스템은 "돈을 다루는 소프트웨어"다

CRS에서 객실 요금 계산·예약 확정·환불 처리는 정확히 이 핸드북의 대상이다. **지금 당장 체크해야 할 것들:**
- 요금 계산에 `double`/`float` 쓰고 있는가? → `BigDecimal`로 교체 필요
- 예약 생성 API가 멱등성을 보장하는가? → 중복 예약 방지
- Opera PMS·OTA 연동 요청/응답을 raw로 저장하는가? → 분쟁 시 증거·재처리용

### 핵심 전이 2 — value time·booking time·settlement time 분리

호텔 예약에서 이 세 시간은 명확히 다르다:
- **value time**: 투숙 날짜 (체크인~체크아웃)
- **booking time**: 예약이 시스템에 기록된 시각
- **settlement time**: 실제 결제가 완료된 시각 (카드 승인·환불 완료)

이 세 타임스탬프를 혼동하면 취소 수수료 계산·정산 오류가 생긴다. **CRS DB 스키마에 세 컬럼을 명확히 분리해서 설계해야 한다.**

### 핵심 전이 3 — 대사(Reconciliation)는 독립 프로세스여야 한다

Opera PMS·OTA 채널과의 예약 상태 동기화는 주기적으로 "우리 DB vs 외부 시스템"을 비교하는 독립 대사 프로세스가 필요하다. 실시간 연동만 믿으면 네트워크 오류·타임아웃으로 인한 불일치를 놓친다. **PickMe의 토스 결제 연동에서도 같은 원칙이 적용된다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-26-new-http-query-method]] — *멱등성 관련: HTTP 메소드 선택이 재시도 정책과 연결된다*
- [[2026-06-08-java-to-kotlin-woowahan]] — *Kotlin `requireNotNull`, data class 불변성이 금융 로직 안전성과 연결*

## 한 달 뒤 회고
*(2026-07-28 즈음 — CRS 코드베이스에서 BigDecimal 미사용·멱등성 미보장·raw payload 미저장 부분을 실제로 찾아 개선했는지, 세 타임스탬프 분리를 DB에 반영했는지 기록.)*
