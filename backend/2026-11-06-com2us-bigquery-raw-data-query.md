---
title: "BigQuery에서 애널리틱스 원본 데이터 조회하기 (게임빌컴투스플랫폼 Hive) — 집계 지표만 보지 말고, 권한을 받아 SQL로 원본 로그까지 직접 들어가게 하라"
source_title: "[게임빌컴투스플랫폼] BigQuery에서 애널리틱스 원본 데이터 조회하기"
source_url: "https://on.com2us.com/tech/event-bigquery-raw-data-query/"
source_name: "게임빌컴투스플랫폼 Hive 애널리틱스 (Com2uS ON Tech)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-06"
category: "backend"
tags: ["analytics", "hive", "bigquery", "event-logging", "sql", "data-access-control", "game-ops", "source-limitation"]
---

# BigQuery에서 애널리틱스 원본 데이터 조회하기 (게임빌컴투스플랫폼 Hive)

> 출처: [BigQuery에서 애널리틱스 원본 데이터 조회하기](https://on.com2us.com/tech/event-bigquery-raw-data-query/) (게임빌컴투스플랫폼, Com2uS ON Tech) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, GeekNews 아님) · 정리일 2026-11-06

## 한 줄 요약

**Hive 애널리틱스가 집계된 대시보드 지표만 보여주는 데서 그치지 않고, 권한 신청 후 Google Cloud 프로젝트를 연결하면 이벤트 원본 데이터를 BigQuery에서 SQL로 직접 조회할 수 있게 열어줘, 집계 지표로는 알기 어려운 문제의 근본 원인을 직접 분석할 수 있게 한다.**

## 핵심 포인트

- **핵심 기능**: Hive 애널리틱스의 이벤트 원본 데이터를 BigQuery를 통해 SQL로 직접 조회 가능.
- **접근 절차**: 관리자 페이지에서 권한을 신청하고 Google Cloud 프로젝트를 연결하면, 수집된 로그를 SQL로 자유롭게 탐색 가능.
- **활용 사례**: 이벤트 수집 오류 점검, 집계 수치의 차이 원인 파악, 매출 데이터와 정산액 대조 등 정밀한 데이터 검증.
- **전처리 지원**: ***UTC 기준 시간을 KST로 변환***하거나 `checksum`을 활용해 중복을 제거하는 등 데이터 전처리를 직접 수행할 수 있어, 단순 지표 확인만으로는 알기 어려운 문제의 근본 원인을 구체적으로 분석할 수 있음.
- **권한 관리**: 데이터 보안을 위해 업무상 필요한 계정과 환경에 한해 권한을 관리하며, 효율적인 데이터 활용을 지원.

## 인상 깊은 문장

> "단순 지표 확인만으로는 알기 어려운 문제의 근본 원인을 구체적으로 분석할 수 있습니다." (Slack 발췌, thread reply)

## 댓글

TechArticles 봇이 Com2uS ON Tech 블로그 글을 Slack에 직접 공유한 글로, GeekNews(hada.io) 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. 원문은 **WebFetch로 접근 시도했으나 `on.com2us.com`이 이 세션의 네트워크 정책상 egress 차단(getaddrinfo ENOTFOUND)**되어 직접 열람하지 못했다. WebSearch로도 1차 소스를 찾지 못해, 이 노트는 **Slack 발췌(본문 + thread reply)만을 근거**로 작성했다. 권한 신청 절차의 구체적 화면이나 SQL 예시 쿼리 등 발췌에 없는 세부 내용은 확인 불가로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — "집계 지표 + 원본 접근" 2단 구조는 데이터 플랫폼 설계의 성숙 신호

대시보드 집계 지표만 제공하면 "왜 이 수치가 나왔는가"를 설명할 수 없는 순간이 반드시 온다. Hive가 집계 지표(대시보드)와 원본 데이터(BigQuery SQL) 접근을 함께 제공하는 구조는, [[2026-07-14-on-data-quality-basics]]의 품질 사다리로 보면 **"개별(unit-level) 검증 없이는 목적 적합성·사업 성과 단의 신뢰도도 담보되지 않는다"**는 원리를 그대로 구현한 것이다. 같은 날 정리한 [[2026-11-06-com2us-market-estimated-proceeds]]의 '예상 수익금' 추정 지표도, 의심스러울 때는 이 BigQuery 원본 조회로 내려가 검증할 수 있는 안전망이 있어야 신뢰할 수 있다.

### 핵심 전이 2 — 권한을 기본 차단, 필요시 신청으로 여는 것이 데이터 보안의 기본값

"업무상 필요한 계정과 환경에 한해 권한을 관리"한다는 발췌 문구는, 데이터 접근을 기본적으로 닫아두고 필요할 때만 범위를 좁혀 여는 최소 권한 원칙(least privilege)의 실천이다. 이 가든에는 같은 Hive 애널리틱스 시리즈로 [[2026-10-22-com2us-hive-event-template-collection-structure]](이벤트 템플릿으로 수집 구조 정의), [[2026-10-22-com2us-hive-test-log-validation]](배포 전 테스트 로그 검증), [[2026-10-29-com2us-hive-event-log-storage-rescue-part4]](적재 실패 데이터 복구)가 이미 있는데, 이번 글은 그 시리즈의 "완성된 데이터를 최종적으로 어떻게 소비하는가" 단계에 해당해 전체 파이프라인의 마지막 조각을 채운다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS/PMS 운영에서도 "예약 전환율이 떨어졌다", "특정 채널의 매출이 집계상 안 맞는다" 같은 질문은 대시보드 집계만으로는 답할 수 없고 결국 원본 예약·요금·재고 변경 로그를 직접 조회해야 풀리는 경우가 많다. **BigQuery(또는 Snowflake 등)에 원본 이벤트를 적재하고, 권한 신청 기반으로 SQL 직접 조회를 운영팀 일부에 열어주는 구조**는 CRS 데이터팀이 바로 참고할 수 있는 패턴이다. 다만 PII(투숙객 개인정보)가 포함된 예약 로그는 게임 이벤트 로그보다 민감도가 높으므로, 권한 신청·마스킹·감사로그를 더 엄격히 적용해야 한다.

## 연관 자료

- [[2026-11-06-com2us-market-estimated-proceeds]] — *같은 Hive 애널리틱스 시리즈, 추정 지표를 검증할 때 내려가는 원본 데이터 레이어*
- [[2026-10-22-com2us-hive-event-template-collection-structure]] — *같은 시리즈의 앞단, 이벤트 수집 구조를 템플릿으로 정의*
- [[2026-10-22-com2us-hive-test-log-validation]] — *같은 시리즈, 배포 전 테스트 로그로 수집 구조를 미리 검증*
- [[2026-10-29-com2us-hive-event-log-storage-rescue-part4]] — *같은 시리즈, 적재 실패 데이터를 격리·복구하는 단계*
- [[2026-07-14-on-data-quality-basics]] — *집계 지표의 신뢰는 개별(unit-level) 원본 검증 없이는 담보되지 않는다는 품질 사다리 원리*

## 한 달 뒤 회고

*(2026-12-06 즈음 — Com2uS Hive 애널리틱스 시리즈 후속 글이 더 나왔는지, 온다 CRS에서 원본 예약 로그 SQL 직접 조회 권한 체계를 실제로 설계했는지 점검.)*
