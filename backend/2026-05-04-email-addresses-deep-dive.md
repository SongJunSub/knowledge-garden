---
title: "이메일 주소 심층 분석 — RFC와 현실, 검증 함정, 두 발신자"
source_title: "A Deep Dive into Email Addresses"
source_url: "https://lasans.blog/articles/misc/email-addresses-deep-dive/"
source_name: "Lasan's Blog"
referrer_url: "https://news.hada.io/topic?id=29144"
published_at: "2026"
summarized_at: "2026-05-04"
category: "backend"
tags: ["이메일", "RFC", "보안", "Gmail", "SPF-DMARC", "검증버그", "호스피탈리티"]
---

# 이메일 주소 심층 분석 — RFC와 현실, 검증 함정, 두 발신자

> 출처: [Lasan — A Deep Dive into Email Addresses](https://lasans.blog/articles/misc/email-addresses-deep-dive/) · 레퍼러: [GeekNews 29144](https://news.hada.io/topic?id=29144) · 정리일 2026-05-04

## 한 줄 요약
이메일 주소는 *username@domain* 보다 훨씬 복잡하다 — **RFC와 실무의 차이 / Gmail의 침묵 정규화 / 두 개의 발신자(envelope vs From) / 검증기 버그**가 모두 보안 사고로 이어진다.

## 핵심 개념

### 1. RFC 5321 vs 5322 — 두 표준
| RFC | 역할 |
|-----|------|
| **5321** | SMTP 전송 — `MAIL FROM`, `RCPT TO` 명령 |
| **5322** | 메시지 형식 — `From`, `To` 헤더, 표시 이름·인용·주석 허용 |

### 2. 로컬 파트의 다양한 유효 형식
- **표준**: `user@example.com`
- **점 주소**: `john.doe@example.com`
- **서브어드레싱(RFC 5233)**: `user+tag@example.com`
- **인용 형식**: `"john doe"@example.com` (공백·@ 포함 가능)
- **댓글**: `(note)user@example.com` (괄호 내용 무시)
- **국제화(EAI, RFC 6530~6532)**: `用户@example.com`

> "Most people think an email address is just a username and a domain. It is a lot more than that."

### 3. Gmail의 *침묵* 정규화
```
johndoe@gmail.com
john.doe@gmail.com
j.o.h.n.d.o.e@gmail.com
→ 모두 같은 받은편지함
```

**보안 위험**: 공격자가 점 변형으로 *가입*하면, 일부 서비스가 *다른 계정으로 인식*해 **계정 복제·무료 체험판 악용·비밀번호 재설정 가로채기** 가능.

> "A user signs up with johndoe@gmail.com. An attacker signs up with john.doe@gmail.com. Many services treat those as two different accounts even though both deliver to the same Gmail inbox. **This is a real attack vector.**"

### 4. 두 개의 발신자 (스푸핑의 근본 원인)

#### Envelope Sender (`MAIL FROM`)
- SMTP 명령에서 설정
- **반송 경로** (bounce 받는 곳)
- **SPF 검증 대상**
- *메시지 본문에 안 보임*

#### From 헤더
- **사용자 화면에 표시되는 주소**
- **DMARC 보호 대상**
- 발신자가 자유롭게 설정 가능

**핵심**: 두 주소는 *완전히 다를 수 있다*. ESP 발송, 메일링 리스트, 도메인 위장이 전부 이 분리에서 나온다.

### 5. VERP & SRS

#### VERP (Variable Envelope Return Path)
대량 발송에서 *어느 수신자가* 반송시켰는지 추적:
```
bounces+alice=gmail.com@newsletter.com
 ↑ @ 기호를 = 로 치환
```
*Mailchimp, SendGrid, Amazon SES 등 ESP 표준*.

#### SRS (Sender Rewriting Scheme)
메일 포워딩 시 SPF 통과시키기 위해 발신자 재작성:
```
SRS0=HASH=TT=originaldomain.com=originaluser@forwardingdomain.com
```
HMAC으로 위조 방지·유효기간 제한.

### 6. 흔한 검증기 버그 (자주 있음)

| 버그 | 영향 | 정답 |
|------|------|------|
| `+` 거부 | `user+tag@gmail.com` 실패 | RFC 허용 — *받아라* |
| `_` 거부 | `user_name@...` 실패 | 유효 |
| `%` 거부 | percent-hack 우려 | percent-hack은 deprecated, 문자는 유효 |
| TLD 길이 4~6자 제한 | `.photography`·`.international` 거부 | 동적 검증 필요 |
| 고정 TLD 리스트 | 신규 gTLD 미지원 | **Public Suffix List** 사용 |
| 총 길이 255/256 | 254 초과 수용 | RFC 3696 errata #1690: **254** |
| 대문자 거부 | `User@example.com` 실패 | 실무 모든 제공자가 case-insensitive |
| `.co.uk` 거부 | 다중 수준 도메인 실패 | 두 번째 수준 gTLD 지원 |

> "Many websites have broken email validators that reject `+` in a local part even though it is a perfectly valid RFC character."

### 7. 보안 위협
- **표시 이름 스푸핑**: 클라이언트 일부가 *display name만* 보여줌
 ```
 "PayPal Security <paypal@paypal.com>" <attacker@evil.com>
 ```
- **호모그래프 공격(Punycode)**: 시각적 동일 도메인. 브라우저는 경고하지만 **이메일 클라이언트는 방어 부족**.
- **Gmail 점 우회**: 위 #3
- **주소 재할당**: Gmail 외 일부 제공자는 *미사용 주소를 새 사용자에게 재할당* → **비밀번호 재설정 이메일 가로채기 위험**

### 8. Role-Based 주소 (RFC 2142)
- **필수**: `postmaster@domain`
- **권장**: `abuse@`, `security@`, `hostmaster@`, `noc@`

### 9. 도메인 검증 시 알아둘 것
- **MX 레코드**: 실제 메일 서버. **Null MX (`MX 0 .`)** 는 *메일 수신 불가* 선언
- **Public Suffix List (PSL)**: 조직 도메인 식별 (`co.uk`, `github.io` 등). 표준은 아니지만 사실상 표준
- **EAI**: 2026 기준 *미흡한 채택* — SMTPUTF8 + 양쪽 서버 지원 필요

### 10. "완전한 RFC 준수 < 실용적 검증"
1. 기본 구조 확인 (`local@domain`)
2. 합리적 문자 집합 검증
3. 선택적 MX 조회
4. **최종 신뢰는 *실제 배달*로만** — 확인 이메일이 진짜 검증

## 인상 깊은 문장

> "Most people think an email address is just a username and a domain. It is a lot more than that."

> "RFC 5321 technically says the local part is case-sensitive. In practice, every major email provider treats local parts as case-insensitive."

> "An attacker can write: \"PayPal Security <paypal@paypal.com>\" <attacker@evil.com>. In many email clients, only the display name is shown."

> "One common frustration: many websites have broken email validators that reject + in a local part even though it is a perfectly valid RFC character."

> "This is a real attack vector." (Gmail 점 변형 가입에 대해)

## 호스피탈리티/CRS 적용 분석

*전제: CRS·부킹엔진·PickMe·OTA Connectivity가 회원가입·비밀번호 재설정·예약 확정·OTA 알림에서 이메일을 운영 계층의 핵심으로 사용.*

### 직접 점검 포인트 5가지

#### A. **Gmail 점·플러스 정규화 정책 결정**
- 회원 가입 시 `john.doe@gmail.com` ≠ `johndoe@gmail.com`으로 *별도 계정*을 만들고 있는가?
- 이게 가능하면 [신용카드 브루트포스 글](2026-05-03-credit-cards-vulnerable-to-brute-force.md)에서 본 *계정 침해 → 결제 정찰* 1단계가 더 쉬워진다.
- **권고**: 가입 단계에서 Gmail 점 제거·플러스 태그 제거를 *백엔드에서 정규화한 키*를 unique 키로 사용. 사용자에게 보여주는 주소는 원본 유지.

#### B. **이메일 검증기 버그 감사**
- 회원가입·예약·문의·메일링 모든 입력 폼의 검증 로직 점검
- 특히 *`+` 거부 / TLD 4-6자 제한 / 254 초과 / 대문자 거부* 4가지가 가장 흔한 버그
- B2B(여행사·법인) 주소에 `_`·`+`·새 gTLD를 쓰는 비율이 높음 — *놓친 가입·예약*이 직접 매출 손실

#### C. **DMARC + SPF + DKIM 강제**
- 두 발신자(envelope vs From) 분리는 *우리도 당하고 우리 이름으로 누가 보낼 수도 있다*
- 우리 도메인(*.shilla.net, *.josunhotel.com 등)에 **DMARC `p=reject` 정책** 적용 여부 확인
- 미적용이면 *호스피탈리티 브랜드 사칭 피싱*에 무방비
- *호텔·항공* 같은 산업은 피싱 표적 1순위 — 같은 해(2026)에 GeekNews에서도 호스피탈리티 피싱 사례가 자주 나옴

#### D. **이메일 변경 = 보안 사건으로 취급**
- 사용자가 이메일을 변경할 때 *기존 이메일 + 새 이메일*에 *둘 다* 변경 알림 + 일정 시간 *동시 유효*
- *이메일 가로채기 공격*에서 가장 핵심 가드레일

#### E. **Role-Based 주소 운영 위생**
- 우리 도메인에 `postmaster@`·`abuse@`·`security@` 가 *작동*하는가?
- 이게 없으면 *해외 보안 연구자가 우리 취약점을 알려주려 해도 길이 없다*

### 우리 회사 운영 액션 후보

1. **회원 이메일 정규화 유닛** 도입 — Gmail 점·서브어드레싱 제거를 한 곳에서. *DB의 unique key는 정규화된 형태*, *표시는 원본*.
2. **이메일 검증 라이브러리 표준화** — 사내 모든 폼이 같은 검증 함수 호출. RFC 5321/5322 합리적 부분집합 + 254 길이 + Public Suffix List 동적 조회.
3. **DMARC/SPF/DKIM 정책 매트릭스 1회 감사** — 사용 중인 모든 발송 도메인 점검. ESP·트랜잭션·마케팅 분리.
4. **이메일 변경 워크플로 강화** — 다층 알림 + 24시간 grace period + 의심 IP 차단.
5. **`abuse@` / `security@` 메일박스 활성화** — 외부 신고 채널 보장.

### 가든 내부 연결
- [`backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md`](2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 계정 침해 → 결제 정찰 1단계가 이 글의 Gmail 점 우회와 정확히 결합. **백엔드 운영 위생 시리즈** 두 번째.
- [`frontend/2026-04-30-laws-of-ux.md`](../frontend/2026-04-30-laws-of-ux.md) — Postel's Law(*입력 관대 / 출력 보수적*)는 이메일 검증의 정확한 가이드. *`+`도 받고 `.co.uk`도 받되, 실제 배달 검증으로 마지막 게이트*.
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — Hyrum's Law: *문서화되지 않은 동작에 모두가 의존* — Gmail 점 정규화가 그 자체로 Hyrum 사례.
- [`engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md`](../engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md) — *경계의 출력은 보수적*이라는 Mercury Pattern 1과 직접 통한다.

## 내 생각 · 적용점

- **"두 개의 발신자" 개념이 가장 중요**하다. 우리 백엔드 메일 발송 코드를 한 번 점검할 때 *envelope sender와 From 헤더가 의도적으로 분리되어 있는지* 명시적으로 확인할 가치가 있다. 무의식적으로 같은 주소로 두는 게 *오히려* 문제일 수 있다 (반송 처리·DMARC 정합성·ESP 룰).
- **Gmail 점 우회는 호스피탈리티에서 더 위험**: 호텔 예약은 *예약자 = 결제자 = 투숙자*가 다를 수 있고, 이메일은 *유일한 비대면 식별자*다. 점 변형으로 *동일 사용자가 두 계정*을 만들면 *프로모션 중복 사용*은 기본이고 *환불·민원* 추적이 끊긴다.
- **검증기 버그 = 매출 손실**: B2B 영업에 새 gTLD(`.travel`, `.hotel`, `.luxury`)를 쓰는 파트너가 늘고 있다. 검증기가 4-6자 TLD만 통과시키면 *그 파트너의 가입 자체가 실패*. 직접 매출 손실로 이어진다.
- **이메일 운영 위생 = 백엔드 시리즈의 한 축**: [신용카드 브루트포스](2026-05-03-credit-cards-vulnerable-to-brute-force.md) → 이 글 → (다음 글: CVE-2026-31431 또는 Apple CLAUDE.md 누출) 의 *시스템 위생 시리즈* 형성을 시도해볼 가치.
- **반론·균형점**: 너무 깊게 RFC 따르면 *실용성 잃음*. 저자도 강조하듯 *완전한 RFC 준수보다 실용적 검증이 낫다*. 우리 컨텍스트에서 *지원해야 할 부분집합*을 명시하고 *나머지는 명시적으로 거부 사유 안내*가 답.
- **개인 적용**: 새 서비스 가입 시 `+서비스명` 태그 사용 습관. 유출 추적이 한 줄로 가능 — 가든·BugSip·CRS 등 개인 프로젝트별로 분리해두면 spam 추적도 쉽다.

## 우리 회사 즉시 적용 액션 5가지
1. **이메일 정규화 유닛** 도입 (Gmail 점·서브어드레싱) → DB unique key는 정규화 / 표시는 원본
2. **사내 이메일 검증 라이브러리 표준화** → +/_/대문자/254/PSL/`.co.uk` 모두 통과
3. **DMARC/SPF/DKIM 정책 감사** → 모든 발송 도메인 매트릭스 점검
4. **이메일 변경 워크플로 강화** → 다층 알림 + grace period
5. **`abuse@` / `security@` 활성화** → 외부 신고 채널 보장

## 연관 자료
- [`backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md`](2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 시리즈 첫 글, 계정 침해 1단계와 결합
- [`frontend/2026-04-30-laws-of-ux.md`](../frontend/2026-04-30-laws-of-ux.md) — Postel's Law 가이드
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — Hyrum's Law 사례
- [`engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md`](../engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md) — 경계의 출력 보수성

## 한 달 뒤 회고
- [ ] 회원 이메일 정규화 유닛 시범 적용했는가
- [ ] 사내 이메일 검증 라이브러리 통일 진행 여부
- [ ] DMARC/SPF/DKIM 정책 매트릭스 도큐먼트가 있는가
- [ ] 이메일 변경 워크플로 강화 검토했는가
- [ ] `abuse@`·`security@`가 작동하는가
