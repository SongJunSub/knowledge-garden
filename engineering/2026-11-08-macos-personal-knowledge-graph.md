---
title: "Mac은 누구를 가족으로 추정할까 — macOS가 2022년부터 쌓아온 개인 지식 그래프"
source_title: "I Built a Personal Knowledge Graph. Apple Had Already Built One on My Laptop (및 관련 분석 — 정확한 원문 1편 특정은 실패)"
source_url: "https://dev.to/niclydon/i-built-a-personal-knowledge-graph-apple-had-already-built-one-on-my-laptop-54l8"
source_name: "DEV Community 등 (GeekNews 경유, 정확한 1차 원문 특정 못함)"
referrer_url: "https://news.hada.io/topic?id=36748"
published_at: "확인 불가"
summarized_at: "2026-11-08"
category: "engineering"
tags: ["macos", "privacy", "knowledgec-db", "biome", "personal-knowledge-graph", "reverse-engineering", "on-device-ai"]
---

# Mac은 누구를 가족으로 추정할까

> 출처: [I Built a Personal Knowledge Graph. Apple Had Already Built One on My Laptop](https://dev.to/niclydon/i-built-a-personal-knowledge-graph-apple-had-already-built-one-on-my-laptop-54l8) 외 관련 분석 (주제는 교차확인, 정확한 1차 원문 1편은 특정 못함) · 정리일 2026-11-08

> **출처 한계.** news.hada.io·dev.to·8rank.ai 모두 이 세션에서 egress 차단(getaddrinfo ENOTFOUND)으로 직접 열람 불가, WebSearch 스니펫만으로 교차확인했다. **주제 자체(macOS가 연락처·사진·일정·통신기록을 연결해 온디바이스 개인 지식 그래프를 만들고, 2022년부터 쌓였다는 것)는 복수의 독립 리서치(dev.to의 niclydon 글, 스페인어 dev.to 분석, 8rank.ai 분석)로 상당히 신뢰도 높게 교차확인된다.** 다만 Slack 발췌의 **구체 수치(144개 특징, XGBoost 분류기 2개, macOS 26.6.2에서 확인)** 는 이번 WebSearch 스니펫에서 독립적으로 확인하지 못했다 — 8rank.ai 분석이 `iCloudFamilyMember` 같은 피처를 언급한다는 것까지는 확인했으나 모델 종류(XGBoost)나 피처 총개수까지는 확인 못했다.

## 한 줄 요약

**macOS는 2022년(macOS 13+)부터 ~/Library/IntelligencePlatform 등에 연락처·사진 속 얼굴·일정·통신기록을 엮은 개인 지식 그래프(수백 개의 엔티티 클래스·predicate)를 온디바이스로 쌓고 있으며, 이를 바탕으로 가족·친구 관계를 추정한다 — 다만 이 글의 "144개 특징, XGBoost 2개" 같은 구체 수치는 이번 조사에서 독립 확인하지 못했다.**

## 핵심 포인트

- 독립 리서치에 따르면 macOS 13+(2022년) 이후 버전들이 `~/Library/IntelligencePlatform`에 그래프 데이터(`graph.db`)를 기록하며, 한 분석은 **181개 엔티티 클래스, 278개 predicate**를 발견했다고 보고한다 — Slack 발췌의 "2022년 이후"·"관계를 기기 안에 기록"과 시기·메커니즘이 일치한다.
- 더 오래된 `knowledgeC.db`(CoreDuet 프레임워크)도 "pattern of life" 데이터를 담는 유사 저장소로, forensics 연구자 Sarah Edwards(mac4n6)가 일찍이 문서화했다. 최신 macOS/iOS에서는 이 역할 상당 부분이 **Biome 프레임워크**로 이동했다는 보고도 있다.
- 한 분석(8rank.ai)은 가족 관계 추정에 쓰이는 피처 중 `iCloudFamilyMember` 같은 식별 그룹을 언급한다 — Slack 발췌의 "연락 빈도·사진 공동출현으로 가족·친구를 추정"과 방향이 일치하나, **XGBoost 모델이나 144개 피처라는 정확한 숫자까지는 이번 조사로 확인하지 못했다.**
- Slack 발췌는 데이터가 **전체 디스크 접근 권한으로 보호되는 평문 SQLite 파일**에 저장된다고 서술한다 — `knowledgeC.db`가 SQLite 형식이라는 것은 forensics 자료로 널리 확인된 사실이라 이 부분은 신빙성이 높다.
- 마지막 불릿(원본 정보를 지워도 추론 결과…)은 Slack 발췌가 "…"로 절단돼 전체 주장을 확인할 수 없다.

## 인상 깊은 문장

> "Apple had already built one on my laptop." (niclydon, dev.to — 글 제목 자체가 핵심 주장)

## 댓글

GN⁺ 댓글 수 확인 불가(news.hada.io 차단).

## 내 생각 · 적용점

### 핵심 전이 1 — 온디바이스 추론 vs 클라우드 기반 개인화 광고의 거울상

[[2026-10-24-google-gmail-photos-personal-intelligence-targeted-ads]]가 "Google이 Gmail·Photos의 개인 데이터를 타겟 광고에 쓴다"는 사례였다면, 이 글의 Apple 그래프는 **같은 종류의 개인 데이터(사진·연락처·통신기록)를 온디바이스에만 저장하고 전체 디스크 접근 권한으로 보호한다는 점에서 설계 철학이 정반대다.** 같은 "플랫폼이 당신의 사적 관계를 추론한다"는 현상이라도, **데이터가 기기를 떠나는지 여부가 신뢰도를 가르는 핵심 변수**라는 걸 두 노트를 나란히 놓고 보면 알 수 있다.

### 핵심 전이 2 — [[2026-09-01-hister-personal-search-engine]], [[2026-08-25-reverse-engineering-my-peripherals-ownership]]와의 계열: "내 기기가 나에 대해 무엇을 알고 있는가"를 역공학하는 흐름

Hister(개인 검색 엔진)가 "내 데이터를 내가 통제하는 도구를 직접 만든다"는 방향이었다면, 이 글은 "플랫폼이 이미 나에 대해 무엇을 알고 있는지를 역공학해서 드러낸다"는 방향이다. 두 흐름 모두 **"내 기기 안의 내 데이터에 대한 소유권·가시성을 되찾으려는 움직임"의 다른 두 얼굴**로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(개념적으로).** CRS·PMS에서도 "동반 투숙객·가족 구성원 자동 추정"(공동 예약 빈도, 같은 결제수단, 체크인 시점 근접도 등으로 관계 추론)은 실무적으로 유용한 기능이다. 이 글이 보여주는 **"온디바이스·로컬 처리로 개인정보 노출 최소화, 전체 권한 보호"** 설계 원칙은 CRS가 같은 추론 기능을 만들 때 참고할 만한 기준선이다 — 단, Apple의 구체 알고리즘을 그대로 벤치마크하진 말고 원칙만 가져온다.

## 연관 자료

- [[2026-10-24-google-gmail-photos-personal-intelligence-targeted-ads]] — 같은 "플랫폼이 개인 데이터를 추론"하지만 설계 철학이 정반대인 거울상 사례
- [[2026-09-01-hister-personal-search-engine]] — 내 데이터에 대한 통제권을 되찾으려는 같은 결의 다른 접근
- [[2026-08-25-reverse-engineering-my-peripherals-ownership]] — 내 기기가 나에 대해 무엇을 알고 있는지 역공학하는 같은 계열

## 한 달 뒤 회고

*(2026-12-08 즈음 — 원문을 재검색해 144개 피처·XGBoost 모델 수치의 1차 확인이 가능한지, 그리고 CRS 쪽에 실제로 유사 피처를 적용해볼 여지가 있는지 점검.)*
