---
title: "Java 27 출시 (Oracle) — 언어 자체는 거의 안 바뀌었는데, G1을 전 환경 기본 GC로, 객체 헤더를 64비트로 줄이고, TLS 1.3에 양자내성 키교환까지 조용히 들어왔다"
source_title: "The Arrival of Java 27"
source_url: "https://blogs.oracle.com/java/"
source_name: "Oracle 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33740"
published_at: "2026-09-15"
summarized_at: "2026-09-16"
category: "backend"
tags: ["Java", "JVM", "GC", "GeekNews"]
---

# Java 27 출시

> 출처: [The Arrival of Java 27](https://blogs.oracle.com/java/) (Oracle) · 정리일 2026-09-16

## 한 줄 요약
**JDK 27이 P1 버그 없이 RC 빌드 그대로 GA로 채택돼 정식 출시됐다 — 언어 문법 변화는 거의 없지만 G1을 전 환경 기본 GC로, 객체 헤더를 64비트로 압축, TLS 1.3에 포스트양자 하이브리드 키 교환까지 조용히 기본값으로 들어왔다.**

## 핵심 포인트
- GA일자 ***2026-09-15***, RC2/빌드 35가 P1 버그 없이 그대로 GA 빌드로 채택됨
- ***JEP 523: G1을 모든 환경의 기본 GC로 지정*** — JDK 9부터 서버 환경 기본값이었던 G1이 이제 클라이언트 포함 전 환경에서 Serial GC를 대체
- ***JEP 534: Compact Object Headers 기본 활성화*** — 객체 헤더를 96비트→64비트로 축소, 배포 밀도·데이터 지역성 향상, JDK 24부터 안정성 검증을 거쳐 기본값 전환
- ***TLS 1.3용 포스트양자 하이브리드 키 교환*** 신규 지원 — 양자컴퓨터 내성 암호화로의 이행 시작
- 이 외 총 ***9개 JEP***: Lazy Constants, Structured Concurrency, Primitive Types in Patterns/instanceof/switch, JFR In-Process Data Redaction, Vector API, PEM Encodings of Cryptographic Objects

## 인상 깊은 문장
> (HN 댓글 재구성) "in 'Java 27' there are exactly 0 language changes and 1 minor feature addition to the TLS library"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 크로스포스트됨(item id=49712041, "Java 27 goes GA with nine JEPs...")에서 ***331 포인트*** 확인, 대표 댓글은 언어 자체 변화가 없다는 냉소적 반응 — JVM/런타임 개선 위주라는 평가. Oracle 1차 발표문 원문은 접근 차단돼 InfoQ/InfoWorld/Phoronix 등 2차 보도로 재구성했다.

## 내 생각 · 적용점
언어 문법은 정체돼 있지만 GC·메모리 레이아웃·암호화 기본값이 매 릴리스마다 조용히 개선되는 게 Java의 실제 진화 방식이라는 걸 다시 확인한다. 특히 ***TLS 1.3 포스트양자 하이브리드 키 교환***이 별도 마이그레이션 프로젝트 없이 언어 런타임 업그레이드만으로 딸려 들어온다는 점은 **[[2026-08-24-pqc-ml-kem-developer-guide]]**가 강조한 "지금 도청된 암호문이 미래에 열린다"는 시간차 공격 대응을 가장 낮은 비용으로 시작하는 경로다.

## 호스피탈리티 / CRS 적용 포인트
CRS·PMS 백엔드가 Java/JVM 기반이라면, JDK 27로 업그레이드하는 것만으로 예약 데이터 전송 구간의 암호화가 양자내성 방향으로 한 걸음 나아간다 — 별도 프로젝트 없이 런타임 업그레이드 일정에 끼워 넣을 수 있는 저비용 보안 개선.

## 연관 자료
- [[2026-08-24-pqc-ml-kem-developer-guide]] — 이번 릴리스가 조용히 들여온 포스트양자 암호화의 배경 원리와 위협 모델

## 한 달 뒤 회고
2026-10-16 즈음, 주요 CRS/PMS 벤더가 JDK 27로 업그레이드했는지, Compact Object Headers 기본 활성화로 인한 실제 메모리 절감 사례가 보고됐는지 점검.
