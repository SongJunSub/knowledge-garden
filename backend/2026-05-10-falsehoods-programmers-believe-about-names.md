---
title: "이름에 대한 프로그래머의 오해들 (2010)"
source_title: "Falsehoods Programmers Believe About Names"
source_url: "https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/"
source_name: "Patrick McKenzie (patio11, kalzumeus.com)"
referrer_url: "https://news.hada.io/topic?id=29350"
published_at: "2010-06-16"
summarized_at: "2026-05-10"
category: "backend"
tags: ["이름처리", "국제화", "i18n", "DB설계", "유니코드", "호스피탈리티", "글로벌게스트"]
---

# 이름에 대한 프로그래머의 오해들 (2010)

> 출처: [Patrick McKenzie — Falsehoods Programmers Believe About Names](https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/) · 레퍼러: [GeekNews 29350](https://news.hada.io/topic?id=29350) · 정리일 2026-05-10

## 한 줄 요약
2010년에도, 2026년에도 *여전히 유효한* 클래식 — 이름에 대한 **40가지 오해**. 핵심 메시지: *"어떤 컴퓨터 시스템도 이름을 제대로 처리하지 못한다."* 호스피탈리티처럼 *글로벌 고객 이름*을 다루는 산업에 직격.

## 영향력 큰 오해들 (선별)

### 구조 가정 오해
1. 사람은 *하나의* 정식 이름을 가진다
2. *성(family name)* 이 존재한다 — 일부 문화는 성 없음
3. 이름은 *first/middle/last* 3분할로 충분하다
4. 이름은 *전 세계적으로 고유*하다

### 형식·문자 오해
5. 이름은 *특정 길이* 안에 들어맞는다
6. 모든 이름이 *ASCII*로 작성된다
7. 이름이 *유니코드*로 모두 매핑된다 — 일부는 매핑 불가
8. 이름은 *대소문자를 구분*한다
9. 이름에 *숫자가 없다*

### 변경·시점 오해
10. 이름은 *변하지 않는다* — 결혼·이혼·개명·종교적 변경
11. *특정 알고리즘*으로 손실 없이 이름을 변환할 수 있다 (예: 음역)

### 시스템 간 일치 오해
12. *다양한 시스템이 같은 사람의 이름을 같게 표기*한다
13. *이름 규칙*은 사회마다 표준화되어 있다

### 마지막 오해 (가장 무거운 것)
> "사람들은 이름을 가진다."

— *이름이 없거나, 임시이거나, 비공개인 경우*가 분명 존재. 시스템은 *그 가능성*을 처리해야 한다.

## 짧은 인용

> "어떤 컴퓨터 시스템도 이름을 제대로 처리하지 못한다."

> "이 모든 가정은 틀렸다."

> "이름은 우리의 정체성에 중심적이다."

## 내 생각 · 적용점

### 가든 *backend/ 운영 위생 시리즈* 4번째
- 1번: [신용카드 브루트포스](2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 외부 공격 표면
- 2번: [이메일 deep dive](2026-05-04-email-addresses-deep-dive.md) — 입력 처리 / 계정 위생
- 3번: [취약점 공개 문화](2026-05-09-ai-breaking-vulnerability-cultures.md) — 운영 패치 위생
- **4번: 이 글** — ***입력 데이터의 *현실 인정*: 이름***

이메일 글과 짝이 됨 — *이메일 형식 = 기술 표준의 회색지대*, *이름 = 사회적 표준의 회색지대*.

### 호스피탈리티 = *이름 처리의 최전선*
호텔은 *전 세계 고객 이름*을 매일 다룬다. 이 글의 40가지 오해가 *모두 일상 문제*:

| 오해 | 호스피탈리티 실제 사례 |
|------|---------------------|
| 성이 존재한다 | 미얀마·인도네시아·아이슬란드 — 성 없거나 다른 구조 |
| ASCII 충분 | 한국어·일본어·중국어·아랍어·키릴 게스트 이름 |
| 유니코드 매핑 | 일부 한자·티베트 문자 등은 유니코드 미할당 |
| 길이 제한 | 미얀마·태국 이름이 50자 초과 빈번 |
| first/last 3분할 | 한국 이름 *김·이·박* 분할은 OTA마다 다름 |
| 시스템 간 일치 | 동일 게스트가 OTA·PMS·여권·결제에서 *다르게 표기* |
| 이름 변경 없음 | 결혼·종교적 개명·법적 개명 |
| 이름 보유 가정 | 일부 문화권 종교 행사 중 *공개 거부* |

**→ CRS·PMS의 게스트 데이터 모델이 *얼마나 많은 오해를 가정*하고 있는지 점검할 가치 있음.**

### 호스피탈리티 즉시 점검 포인트 5가지

1. **DB 스키마**: `first_name + last_name`이 default인가? → *full_name* + 선택적 분할 필드로 재설계 검토
2. **길이 제한**: 50자, 100자 제한이 *실제 사용자*를 거절하는 사례가 있는가? → DB 컬럼·UI·여권 OCR 통합 점검
3. **여권명 vs 표시명**: 여권명(국제 표준)과 *호텔 내 호칭*은 다를 수 있음 — 분리 필드
4. **OTA 통합**: 같은 게스트의 이름이 *Booking.com·Agoda·자사*에서 다르게 와도 *동일 인물 식별*이 작동하는가? — [다크 마켓플레이스 Memory 해자](../engineering/2026-05-08-the-dark-marketplace.md)와 결합
5. **이름 변경 이력**: 결혼·개명·정정 시 *과거 예약과의 연결*이 유지되는가?

### 이름은 *PII + 신뢰 자산*의 교차점
- [개인정보 보호법](2026-05-04-email-addresses-deep-dive.md): 이름 = PII
- [No One's Happy 신뢰 자산](../ai/2026-05-07-appearing-productive-in-the-workplace.md): 정확한 이름 표기 = *호텔 신뢰의 작은 신호*
- *VIP에게 잘못된 이름·호칭으로 이메일 보내기* = 신뢰 자산 손상의 흔한 사례

### *오해의 *마지막* 항목*이 가장 무서운 진단
> "사람들은 이름을 가진다."

이게 틀렸다는 인식이 *시스템 사고의 깊이*를 결정. *이름 보유*조차 *옵션*으로 다뤄야 한다 = **모든 필드를 *현실의 부분집합*으로 가정해야 한다**는 일반 원칙. CRS의 다른 필드(전화번호·주소·생년월일·이메일)에도 모두 적용되는 *겸손함의 디시플린*.

### MangoLove 적용 — *Falsehoods 시리즈를 진단 도구로*
가든 인덱스에 *Falsehoods 시리즈* 영역 만들 가치:
- 이름 (이 글)
- 시간/달력 (검색하면 동일 클래식 존재)
- 주소 (검색하면 존재)
- 전화번호 (존재)
- 통화·금액 (존재)

**→ CRS의 *글로벌 데이터 필드*에 *Falsehoods 체크리스트*를 표준 절차로 추가** 후보. PR 헤더 스키마에 *글로벌 필드 변경 = Falsehoods 체크* 9번째 항목 후보.

### 가든 *위험 인덱스*에 추가
[어제 메모한 위험 인덱스 시범](../engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md)에 새 항목:
- *기본값 신뢰 가정의 함정* — 이름·시간·주소 등 *익숙한 데이터 형식의 단순화*
- *세대를 넘어 반복되는 위험* — 2010년에 진단된 게 2026년에도 유효

### *2010년 글이 2026년에도 유효*한 이유
이 글의 *영속성*이 핵심 메시지 — *이름의 사회적 복잡성*은 기술 발전으로 해결되지 않는다. AI 시대에도 *이름 정규화*는 *근본 풀 수 없는 문제*. **AI가 풀어줄 거라는 가정 자체가 현재의 오해**.

### 반론·균형점
- *모든 필드를 무한 길이·임의 문자 허용*하면 *DB·인덱싱·검색* 효율 손상
- *현실 인정*과 *실용적 제약* 사이에 *합리적 절충점*이 필요
- 핵심: ***기본값으로 가정하지 말고 *명시적으로 선택*하라***

## 즉시 시도할 액션 3가지
1. **CRS·PMS 게스트 데이터 모델 *Falsehoods 8개 점검*** 1페이지 메모 (위 표의 8가지)
2. **OTA 통합에서 *동일 게스트 식별 정확도*** 측정 — Booking·Agoda·자사 표기 차이로 인한 누락 비율
3. **가든에 *Falsehoods 시리즈* 인덱스** 만들기 — 이름·시간·주소·전화·통화 5개

## 연관 자료
- [`backend/2026-05-04-email-addresses-deep-dive.md`](2026-05-04-email-addresses-deep-dive.md) — 이메일 = 기술 표준 회색지대 / 이 글 = 사회 표준 회색지대 (짝)
- [`backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md`](2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 백엔드 운영 위생 시리즈 1
- [`backend/2026-05-09-ai-breaking-vulnerability-cultures.md`](2026-05-09-ai-breaking-vulnerability-cultures.md) — 백엔드 운영 위생 시리즈 3
- [`engineering/2026-05-08-the-dark-marketplace.md`](../engineering/2026-05-08-the-dark-marketplace.md) — 동일 게스트 식별이 Memory 해자
- [`ai/2026-05-07-appearing-productive-in-the-workplace.md`](../ai/2026-05-07-appearing-productive-in-the-workplace.md) — 정확한 이름 표기 = 신뢰 자산
- [`engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md`](../engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md) — 위험 인덱스에 *Falsehoods* 추가 후보

## 한 달 뒤 회고
- [ ] CRS 게스트 데이터 모델 Falsehoods 8개 점검 메모 작성했는가
- [ ] OTA 통합 *동일 게스트 식별 정확도* 측정을 시도했는가
- [ ] 가든 *Falsehoods 시리즈 인덱스*를 만들었는가
- [ ] *기본값 신뢰 가정 함정*을 한 번이라도 실무 의사결정에서 인지했는가
