---
title: "신용카드는 브루트포스 유형 공격에 취약함"
source_title: "Credit Cards Are Vulnerable To Brute Force Kind Attacks"
source_url: "https://metin.nextc.org/posts/Credit_Cards_Are_Vulnerable_To_Brute_Force_Kind_Attacks.html"
source_name: "metin.nextc.org (Metin Ozyildirim)"
referrer_url: "https://news.hada.io/topic?id=29085"
published_at: "2026-05-01"
summarized_at: "2026-05-03"
category: "backend"
tags: ["보안", "결제", "PCI-DSS", "3D-Secure", "PG", "호스피탈리티", "CRS"]
---

# 신용카드는 브루트포스 유형 공격에 취약함

> 출처: [Metin Ozyildirim — Credit Cards Are Vulnerable To Brute Force](https://metin.nextc.org/posts/Credit_Cards_Are_Vulnerable_To_Brute_Force_Kind_Attacks.html) · 레퍼러: [GeekNews 29085](https://news.hada.io/topic?id=29085) · 정리일 2026-05-03

## 🔖 한 줄 요약
**PCI DSS가 허용한 마스킹 정보(BIN + 마지막 4자리 + 만료일)만 있으면**, PAN 중간 10자리는 단계적 PG 응답을 신호로 삼아 ~6시간만에 유도 가능 — 3D Secure는 **PAN 유도 자체를 막지 못한다**.

## 🧩 공격 파이프라인 (실제 사례)

| 단계 | 행위 | 핵심 |
|---|------|------|
| 1 | **계정 침해** | 약한 비밀번호 가진 전자상거래 계정 탈취 |
| 2 | **정보 수집** | 첫 구매 시도로 3DS 페이지 확인 → 은행명·발급사·BIN·마지막 4자리·만료일 확보 |
| 3 | **PAN 유도** | 마스킹된 10자리 무차별, **초당 6회 / 6시간** → 10,000개 조합 |
| 4 | **CVV 유도** | PAN 확정 후 CVV 1,000개 무차별 |
| 5 | **3DS 회피** | *3DS 면제 가맹점*에서 결제 (가맹점이 책임) |
| 6 | **현금화** | 전자지갑 → 현금 출금 |

### PAN 구조의 약점
PAN = `IIN(6) + 계좌 식별자(≤12) + 체크디지트(1)`

> *"1 out of 10 numbers can be a valid credit card because of the checksum."*

Luhn 체크디지트는 *유효성 1차 필터*에 불과 — **랜덤 10자리 중 10%가 형식 유효**. 그래서 **10,000번 미만 시도로 진짜 PAN 유도 가능**.

### PG 응답이 *공격을 도와준다*
```
"카드가 유효하지 않음"     → PAN이 틀림
"카드 만료됨"              → 만료일이 틀림
"모든 OK인데 CVV만 틀림"   → PAN + 만료일 정답
```
**단계적 피드백**이 공격자에게 *진행 신호*를 그대로 준다. 저자의 한 마디:

> *"The response codes from payment gateways, are something like that... The fuck? It literally helps you to brute force it."*

### 3D Secure의 한계
- **개별 거래는 보호**하지만, **PAN 유도 자체는 못 막는다**
- 3DS 면제 가맹점·PCI DSS 호환 카드 *검증 API*·$1 검증 결제 등 사전 정찰 채널이 별도로 존재
- 결과: 미국처럼 3DS 채택률 낮은 시장이 가장 취약

### 탐지 회피
- 초당 6회 (전체 합산) — *정상 범위로 위장*
- 다수 가맹점 검증 API에 *분산*
- 매 요청 IP 프록시 변경
- PAN을 매번 바꾸므로 *동일 카드에 대한 반복 시도* 시그널이 안 잡힘

## 🛡 각 주체별 방어

### 발급은행
- **CVV 무차별에 강한 rate limit** — 저자도 *"내 은행은 여전히 관대"* 라고 비판
- 다수 가맹점에 걸친 *대량 소액 검증* 패턴 탐지
- 마스킹된 정보를 매개로 한 *카드 정찰 → 전액 거래* 연쇄 탐지

### 가맹점·결제 시스템
- **PG 응답 메시지 통합** — *"어느 필드가 틀렸는지 구분 불가능"* 한 단일 거절 코드
- 검증 API 자체에 강력한 rate limit + IP/디바이스/카드 fingerprint
- 3DS 강제·면제 정책 재검토 (면제 자체가 공격 표면)

### 소비자
- **영수증 파기** — 마스킹 정보만으로도 공격이 시작된다
- 카드 한도 낮게 유지, 거래 모니터링 알림
- 가능하면 *가상 카드 / 일회용 카드 / Apple Pay·Google Pay 토큰* 사용

## 📜 인상 깊은 문장

> "PCI DSS is the widely known and implemented industry standard for defining bare-minimum security measures."

> "1 out of 10 numbers can be a valid credit card because of the checksum."

> "The response codes from payment gateways, are something like that... The fuck? It literally helps you to brute force it."

> "That rate is very hard to spot from the merchants perspective, as the source IPs are changing via proxies."

> "Honestly I'm impressed, this is a well designed pipeline, with more untraceability than I expected."

## 🏨 호스피탈리티/CRS 결제 시스템 적용 분석

*전제: 호텔 예약·결제(CRS·부킹엔진·PickMe 등)에서 PG·3DS·카드토큰을 다루는 백엔드 관점.*

### 직접 점검 포인트

#### 1. **PG 응답 코드 통합 점검** 🔴
- 우리 측 결제 API가 `INVALID_PAN / EXPIRED / CVV_MISMATCH / 3DS_FAIL` 같은 *정밀한* 거절 사유를 외부(클라이언트·OTA·앱)에 그대로 노출하는가?
- **외부 응답은 "결제 실패" 단일 사유로 통합**, 내부 로그/지표에서만 정밀 분류 유지.
- *Postel's Law*([어제 UX 글](../frontend/2026-04-30-laws-of-ux.md))의 "출력 보수적" 원칙이 여기서 보안과 직결.

#### 2. **카드 검증성 거래 패턴 탐지** 🔴
- $1·100원 같은 소액 *카드 활성성 검증* 결제가 우리 가맹점에서 가능한가?
- 그렇다면 **동일 BIN·만료일에 대해 다수 PAN을 짧은 시간에 시도하는 패턴**을 *가맹점 단위로* 탐지하는 룰이 있는가?
- *체인·호텔 단위가 아닌 BIN+만료일 그룹 단위* 탐지가 핵심.

#### 3. **3DS 적용 정책 재검토** 🟡
- 한국 환경은 ISP/3DS 채택률이 비교적 높지만, **OTA 채널·B2B 채널·외국인 카드**에서는 면제되는 경우가 많다.
- *3DS 면제 결제의 비율*과 *그 채널들의 사기율* 데이터를 한 번 뽑아볼 가치 있음.
- 면제 비율 높은 채널 = 본 글의 공격이 마지막에 활용한 *바로 그 면제 가맹점*.

#### 4. **회원 계정 침해 → 결제 정찰 연쇄 차단** 🟡
- 호텔 회원/예약 사이트의 *비밀번호 정책* + *2FA 강제 영역*
- 침해된 계정으로 *예약 시도 → 3DS 페이지 → 카드 정보 일부 수집* 시나리오 점검
- 특히 OTA 통합 로그인을 통해 들어오는 트래픽의 검증 강도

#### 5. **저장 카드(Token) 운영** 🟢
- 우리 측 토큰 vault에서 *마스킹 정보가 어디까지 보이는가*
- 직원·고객지원·관리자 화면에 BIN+last4+exp가 *함께* 노출되는 곳이 있다면 위험
- *직원 화면에서도 last4만 / 필요 시 BIN 또는 exp 별도 권한* 으로 분리

### 즉시 수행할 액션 5개

1. **결제 거절 응답 매트릭스 검토** — 외부 응답 코드 차원 축소 (CRS·crs-be-web 부킹엔진·PickMe)
2. **3DS 면제 결제 비율 + 사기율 대시보드** 1회 조사 (Linear 티켓 가치 있음)
3. **소액 카드 검증성 결제 모니터링 룰** — 가맹점 ID 무관, BIN+만료일 그룹 단위
4. **회원 계정 보안 정책 재점검** — 비밀번호·2FA·로그인 시도 잠금
5. **마스킹 정보 노출 권한 감사** — 어드민·고객지원·로그·CSV 내보내기 전수 조사

### 가든 내부 연결
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](../ai/2026-04-27-ai-agent-deleted-production-database.md) — 시스템 사고는 5겹의 실패 / 이 결제 사고도 5단계 누적. **"한 겹의 가드레일은 가드레일이 아니다"** 동일 구조.
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — Murphy's Law·Hyrum's Law·Leaky Abstraction이 모두 여기 작동: PG 응답 *"문서화되지 않은 동작"*에 공격자가 의존.
- [`frontend/2026-04-30-laws-of-ux.md`](../frontend/2026-04-30-laws-of-ux.md) — Postel's Law (입력 관대/출력 엄격)는 보안 관점에서도 동일 원칙.
- [`engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md`](../engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — 호스피탈리티 IT 위협 모델의 한 축으로 추가.

## 💭 내 생각 · 적용점

- **PG 응답 정밀도가 보안 결함이라는 통찰**이 가장 인상적이다. *디버깅 친화적 응답*이 *공격 친화적 응답*이 되는 정확한 사례. 우리 결제 시스템도 *내부용 정밀 코드*와 *외부용 통합 코드*를 분리할 명분이 분명해졌다.
- **"단일 가드레일 ≠ 가드레일"**: 이 공격은 PCI DSS도, 3DS도, Luhn 체크도 각각 *기술적으로* 작동하는데 *시스템 전체*로는 뚫린다. [9초 사고](../ai/2026-04-27-ai-agent-deleted-production-database.md)와 동일한 다층 실패 패턴.
- **호스피탈리티 특화 위험**: 호텔은 *국적·통화·OTA·B2B 채널이 많아 3DS 면제 비율이 구조적으로 높다*. 이 글에서 마지막 단계가 활용한 *3DS 면제 가맹점*이 정확히 우리 산업의 일상이다. 면제는 편의가 아니라 *위험 부담*이라는 인식 전환 필요.
- **운영 데이터 가치**: 우리 회사는 카드 거래 패턴 데이터를 *상당한 양* 갖고 있다. *"3DS 면제 결제의 사기율 대시보드"* 같은 작은 도구만 만들어도 *기술 안전 수준*과 *경영 의사결정 수준*에서 동시에 가치가 나온다.
- **연결 — UX와 보안**: Postel's Law가 *입출력 비대칭*을 강조하는 이유가 결제 보안에서 가장 잘 드러난다. UX 친화 메시지("CVV가 다릅니다") = 보안 누설. **"CVV가 다릅니다" 대신 "결제가 처리되지 못했습니다, 입력값을 확인하세요"**.
- **반론·균형점**: 응답 코드를 통합하면 *고객 지원 디버깅*이 어려워진다. 그래서 *외부 응답은 통합 / 내부 로그는 정밀* 분리가 답. 사용자 채널과 운영 채널이 같은 정보를 보면 안 된다.
- **개인 레벨**: 영수증 파기·가상카드·낮은 한도는 *나도* 즉시 적용 가능. 영수증 사진 공유 자제 (last4·만료일이 함께 보이는 사진은 특히 위험).

## 🔗 연관 자료
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](../ai/2026-04-27-ai-agent-deleted-production-database.md) — 5겹의 실패 / 동일한 다층 가드레일 구조
- [`frontend/2026-04-30-laws-of-ux.md`](../frontend/2026-04-30-laws-of-ux.md) — Postel's Law는 보안 원칙이기도
- [`engineering/2026-04-23-laws-of-software-engineering.md`](../engineering/2026-04-23-laws-of-software-engineering.md) — Murphy / Hyrum / Leaky Abstraction
- [`engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md`](../engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — 호스피탈리티 IT 위협 모델

## 📝 한 달 뒤 회고
- [ ] 결제 거절 응답 외부 통합화 검토 진행 여부
- [ ] 3DS 면제 결제 사기율 대시보드 조사 결과
- [ ] 소액 검증성 결제 모니터링 룰 도입 여부
- [ ] 회원 계정 보안 정책(2FA·잠금) 점검 결과
- [ ] 마스킹 정보 노출 권한 감사 결과
