---
title: "Project Valhalla, 10년 작업이 JDK 28에 — '하드웨어-소프트웨어 격차'와 점진적 진화의 인내 (도구 철학 라인)"
source_title: "Project Valhalla: How 10 Years of Work Landed in JDK 28"
source_url: "https://jvm-weekly.com/"
source_name: "JVM Weekly · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30653"
published_at: "2026-06-16"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["java", "project-valhalla", "value-class", "hardware-software-gap", "incremental-evolution", "long-term", "tooling-line"]
---

# Project Valhalla, 10년 작업이 JDK 28에 — '하드웨어-소프트웨어 격차'와 점진적 진화의 인내 (도구 철학 라인)

> 출처: JVM Weekly (GeekNews 경유) · 정리일 2026-06-08
> ※ 사용자(Java/Kotlin) 관심에 맞춰 *value class 문법·128비트 인코딩 등 언어 세부 스펙은 가볍게* 두고 *전이 가능한 주제* 중심.

## 한 줄 요약

**2014년 시작된 *Project Valhalla*(객체를 "클래스처럼 코딩하고 int처럼 동작"하게)가 *JEP 401로 JDK 28(2027년 3월)*에 포함된다 — *1,816개 파일·19만 7천 줄 변경*. 핵심 동기: ***1995년 이후 메모리와 CPU 속도 격차가 확대*되어, 기존 Java 객체의 힙 산재가 CPU 캐시 효율을 떨어뜨리는데, value class는 ***연속 메모리 배치로 그 격차를 메운다***. 단 *JDK 28은 기본 기능만(null-restricted·전문화 제네릭·128비트는 향후)* — ***10년에 걸친 점진적·신중한 진화***. (사용자가 쓰는 Kotlin도 JVM 위에서 이 혜택을 받게 된다.)**

## 핵심 포인트 (전이 가능한 주제 중심)

- **하드웨어-소프트웨어 격차** — *메모리·CPU 속도 격차로 escape analysis만으론 부족 → value class의 연속 배치*. **언어가 하드웨어 현실을 따라잡는 일** ([[2026-06-08-birth-and-death-of-javascript]] *"하드웨어 따라잡기 경쟁"*과 정합).
- **10년의 점진적 진화** — *"코끼리를 한입에 못 먹는다"·기본만 먼저, 나머지는 후속 JEP*. **[[2026-06-08-static-types-and-the-shovel]] *"좋은 도구는 시간이 걸린다"*·SQLite 26년·ClickHouse 10년과 같은 줄기** — *큰 변화는 인내로*.
- **하위호환성의 제약** — *"==가 substitutability 검사로"·기존 코드와의 통합*. *호환성은 "150피트 알바트로스"(C++ 비유)이지만 Java가 값 타입을 우아하게 통합*.

## 인상 깊은 문장

> "Memory and CPU speeds diverged since 1995 — value classes lay out data contiguously to close that gap."
> (1995년 이후 메모리와 CPU 속도가 벌어졌다 — value class는 데이터를 연속 배치해 그 격차를 메운다.)

## HN 토론 (댓글 전수 확인 — 전이 논점만)

> GN⁺가 HN을 큐레이션 + click 직댓글. **확인:**
- *click: "Project Loom의 가상 스레드처럼 Valhalla도 '공짜 점심'에 가깝게 최종 릴리스되면 좋겠다"*.
- ***다수 "이 글이 AI 작성 냄새·게으른 글·자기 목소리 없으면 읽을 이유 없음·2문단 읽고 그만둠"*** — **AI 작성 기술 블로그에 대한 거부감**.
- *"점진적 출시는 정상(JEP도 명시)·null 표시자도 후속 JEP"·".NET 구조체와 비교"·"Oracle이 방치 끝내고 자금 댐·2026 JVM은 건강한 포식자"*.
- ***"머신러닝이 하드웨어 따라잡기 경쟁 — C#·Swift·Java·Rust 모두"***.

→ **무게중심**: *(1) **"AI 작성 글" 거부감**이 본문 평가를 압도(원문 문서가 더 명확). (2) **점진적 진화는 정상**(한입에 못 먹는 코끼리). (3) **하드웨어 따라잡기는 여러 언어 공통 과제**. (4) JVM/Oracle 재평가(방치 끝남).*

## 내 생각 · 적용점

### 5번째 라인업 *도구 철학 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *언어 진화·도구 철학*. 라인 자산(카운팅 무관). 부채 *−1 유지* (53:42 ≈ 1.27:1).

### 핵심 전이 1 — "큰 변화는 10년의 점진적 인내로"

가장 전이력 높은 교훈: ***Valhalla 10년·SQLite 26년·ClickHouse 10년처럼, 진짜 좋은 것은 단기간에 안 만들어진다***([[2026-06-08-sqlite-richard-hipp-interview]] *"뛰어난 SW는 단기간에 안 만들어짐"*). *"기본만 먼저, 나머지는 후속"의 점진적 출시*가 큰 변화를 안전하게 — [[2026-06-08-static-types-and-the-shovel]] *"도구는 충분히 좋아질 때 채택"*. 사용자의 stock-autotrader·CRS 같은 장기 프로젝트도 *"한입에 코끼리" 대신 점진적*으로.

### 핵심 전이 2 — "AI 작성 글에 대한 거부감" (메타)

HN이 본문보다 *"AI가 쓴 것 같다"*에 더 반응한 것은 [[2026-06-08-consumers-reject-ai-branding]] *"AI 라벨 거부감"*·[[2026-06-08-human-attention-human-effort]] *"검토 없는 AI 출력 전가"*의 기술 블로그 버전 — **AI 슬롭 시대에 "자기 목소리 없는 글"은 읽히지 않는다**. *원문 JEP 문서가 더 명확*하다는 게 핵심: *정보는 1차 출처로, 글은 사람의 목소리로*. 이 가든도 *AI 요약이 아니라 큐레이션·연결·판단*에 가치.

### 사용자 직결 — Kotlin도 JVM 혜택

사용자가 쓰는 *Kotlin은 JVM 위에서 Valhalla의 메모리 효율을 받게 된다* — *value class·연속 배치가 데이터 집약 작업(stock-autotrader의 시세 배열 등)의 캐시 효율을 높임*. 단 *JDK 28은 preview라 실무 적용은 신중히*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *도구 철학 라인* 사례(언어 진화). 부채 *−1 유지* (53:42).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- JVM Weekly (원문) · [GeekNews — 30653](https://news.hada.io/topic?id=30653)
- [[2026-06-08-sqlite-richard-hipp-interview]] — *"큰 변화는 10년의 인내"(장기 진화)*
- [[2026-06-08-static-types-and-the-shovel]]·[[2026-06-08-birth-and-death-of-javascript]] — *"도구 진화·하드웨어 따라잡기"*
- [[2026-06-08-consumers-reject-ai-branding]]·[[2026-06-08-human-attention-human-effort]] — *"AI 작성 글 거부감(자기 목소리 없으면 안 읽힘)"*
- [[2026-06-08-formal-methods-future-of-programming]] — *"하위호환성·신중한 통합"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — Valhalla가 JDK 28에서 실제 성능으로 나타났는지, Kotlin이 그 혜택을 받았는지, "점진적 진화의 인내"를 장기 프로젝트에 적용했는지, "AI 작성 글 거부감"이 기술 글쓰기를 어떻게 바꿨는지 기록.)*
