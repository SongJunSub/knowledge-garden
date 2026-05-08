---
title: "SQLite는 미국 의회도서관 권장 저장 형식이다"
source_title: "SQLite As An Application File Format — Recommended Storage Format"
source_url: "https://sqlite.org/locrsf.html"
source_name: "sqlite.org"
referrer_url: "https://news.hada.io/topic?id=29264"
published_at: "2018-05-29"
summarized_at: "2026-05-08"
category: "backend"
tags: ["SQLite", "데이터보존", "아카이빙", "장기보관", "파일포맷", "호스피탈리티-데이터"]
---

# SQLite는 미국 의회도서관 권장 저장 형식이다

> 출처: [SQLite — Recommended Storage Format](https://sqlite.org/locrsf.html) · 레퍼러: [GeekNews 29264](https://news.hada.io/topic?id=29264) · 정리일 2026-05-08

## 🔖 한 줄 요약
미국 의회도서관(Library of Congress)이 *데이터셋 장기 보존*을 위한 **단 4개 권장 저장 형식**(XML, JSON, CSV, **SQLite**) 중 하나로 SQLite 채택 — *데이터베이스가 아카이브 형식*으로 인정받은 사례.

## 🧩 평가 기준 7가지

의회도서관이 *수십 년 단위 보존* 관점에서 평가한 항목:

| # | 기준 | SQLite의 충족 방식 |
|---|------|-----------------|
| 1 | **공개성** (Openness) | 완전한 기술 사양 공개, public domain |
| 2 | **채택도** (Adoption) | 전 세계 *수십억 개*가 배포된 가장 흔한 DB |
| 3 | **투명성** (Transparency) | 파일 포맷이 *직접 분석 가능* |
| 4 | **자기기술성** (Self-documentation) | *메타데이터 내장* (스키마·인덱스·제약) |
| 5 | **외부 의존성 최소화** | 단일 파일, OS·하드웨어 비의존 |
| 6 | **특허 영향 부재** | 특허·로열티 없음 |
| 7 | **기술적 보호 장치 부재** | 암호화·DRM 없음 → 장기 접근 보장 |

## 핵심 메시지
- **SQLite는 *임베디드 DB*가 아니라 *애플리케이션 파일 포맷*** 이다 — 의회도서관이 *XML·JSON·CSV*와 동급으로 분류한 이유
- *가장 오래 살아남을 형식*에 들어간 것 → **수십 년 후에도 읽힐 가능성이 가장 높은 데이터베이스**

## 💭 내 생각 · 적용점

### 가든 *기술 자산* 글의 위치
지금까지 가든 *비판 시리즈*가 9개 누적되며 *어떻게 위험을 다룰까* 위주였다. 이 글은 다른 결 — **"무엇이 시간을 견디는가"**. 두 시리즈가 가든의 *균형 축*이 됨:
- **비판** (단기 위험) ← 9개
- **기술 자산** (장기 가치) ← 이 글이 한 점

### 호스피탈리티 데이터 보존 관점

호스피탈리티는 *법적·운영적 데이터 보존 의무*가 큰 산업:
- **개인정보 보호법**: 회원 데이터 *5년+* 보관 의무
- **세무**: 거래·결제 기록 *10년* 보관
- **OTA 컨트랙트·정산 증빙**: 계약 기간 + α
- **호텔 운영 로그**: 분쟁 시 *10년 단위* 소환 가능성

→ *SQLite를 보존 포맷으로 활용*할 영역:

| 영역 | 활용 방식 |
|------|----------|
| **거래·결제 아카이브** | Postgres에서 *분기·연 단위 SQLite 스냅샷*으로 콜드 아카이브 |
| **법적 증빙 데이터** | *변경 불가 단일 파일*로 봉인, 해시 + 타임스탬프 |
| **호텔 운영 로그** | 운영 종료된 호텔의 *전체 운영 기록*을 SQLite 한 파일로 압축 보존 |
| **마이크로서비스 산출물** | 분석 결과·리포트를 SQLite로 *재조회 가능한 형태*로 |

### *"파일이지만 쿼리 가능"* 이 핵심 가치
- CSV: 쿼리 불가
- JSON: 검색 가능하나 *대용량 비효율*
- Postgres dump: 복원 인프라 필요
- **SQLite: *복원 없이 직접 SQL 실행 가능***

→ 10년 후 *그 시스템이 사라져도* SQLite 파일 하나만 있으면 *그 시점 데이터를 정확히 재현* 가능.

### 가든 다른 글과의 연결
- [Sara cron job 우화](../career/2026-05-08-programming-still-sucks.md): *기관 지식이 사람에게만 있다*는 위험
- → SQLite 아카이브는 *기관 지식의 *기계 가독 형태***로 보존하는 도구
- [의도 부채](../engineering/2026-04-24-technical-cognitive-intent-debt.md): *왜* 그 결정을 했는지 메타데이터로 함께 보존
- [신뢰 자산](../ai/2026-05-07-appearing-productive-in-the-workplace.md): *데이터 무결성 + 장기 접근성*이 호스피탈리티 신뢰 자산의 한 축

### CRS·Connectivity 적용 후보
- **Cold Storage 전환**: Postgres에서 *2년 이상 된* 거래 데이터를 SQLite 파일로 분기 아카이브 → S3 Glacier
- **호텔 폐업 시 데이터 인계**: 운영 종료 호텔의 전체 기록을 *단일 SQLite 파일*로 인수인계
- **OTA 정산 증빙 봉인**: 분기 정산 완료 후 *변경 불가 SQLite 봉인본*으로 5년 보관

### MangoLove 적용
- 가든 자체가 *Markdown 파일 + git*으로 보존되지만, **재검색 가능성**이 약함
- *분기마다 가든 전체를 SQLite로 export*하면 *FTS(Full-Text Search) + 메타데이터*로 *재참조* 효율화
- [Willison 글](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md)의 *재참조 횟수 트래킹*과 결합 — SQLite가 트래킹 도구

### 반론·균형점
- *대규모 동시 쓰기*가 필요하면 SQLite 부적합 — *단일 작성자/다중 읽기* 패턴에 최적
- *클라우드 네이티브 분석*(BigQuery·Athena)에 비해 *통합 도구 부족*
- *권장 형식이라는 사실*이 *반드시 좋은 선택*을 보장하진 않음 — 워크로드 특성이 우선

## 🎯 즉시 시도할 수 있는 액션 3가지
1. **가든 분기 SQLite export 시범** — 재참조·재검색 효율화 도구
2. **CRS *Cold Storage 후보 데이터* 식별** — 2년 이상 미접근 + 보존 의무 있는 데이터
3. **OTA 정산 *봉인 아카이브* 정책 검토** — 변경 불가 SQLite로 분기 봉인

## 🔗 연관 자료
- [`career/2026-05-08-programming-still-sucks.md`](../career/2026-05-08-programming-still-sucks.md) — Sara cron 같은 *기관 지식*의 기계 가독 보존 수단
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — 의도 메타데이터 함께 보존
- [`ai/2026-05-07-appearing-productive-in-the-workplace.md`](../ai/2026-05-07-appearing-productive-in-the-workplace.md) — 신뢰 자산의 한 축 = 데이터 무결성·접근성
- [`backend/2026-05-04-email-addresses-deep-dive.md`](2026-05-04-email-addresses-deep-dive.md) / [`backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md`](2026-05-03-credit-cards-vulnerable-to-brute-force.md) — 백엔드 운영 위생 시리즈
- 비교 형식: XML, JSON, CSV (의회도서관 권장 4종)

## 📝 한 달 뒤 회고
- [ ] 가든 분기 SQLite export 시도했는가
- [ ] CRS Cold Storage 후보 데이터 식별 메모를 작성했는가
- [ ] *권장 형식 ≠ 좋은 선택* 균형 감각을 의사결정에 적용했는가
