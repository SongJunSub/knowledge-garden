---
title: "[Ceph 뜯어먹기 - Part 01] CRUSH(하이퍼엑셀) — 중앙 메타데이터 서버 없이 클라이언트가 직접 데이터 위치를 계산한다"
source_title: "[Ceph 뜯어먹기 - Part 01] CRUSH"
source_url: "https://hyper-accel.github.io/posts/ceph-crush/"
source_name: "하이퍼엑셀 기술 블로그"
referrer_url: "https://hyper-accel.github.io/posts/ceph-crush/"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "architecture"
tags: ["ceph", "crush", "distributed-storage", "object-storage", "failure-domain"]
---

# [Ceph 뜯어먹기 - Part 01] CRUSH(하이퍼엑셀)

> 출처: [[Ceph 뜯어먹기 - Part 01] CRUSH](https://hyper-accel.github.io/posts/ceph-crush/) (하이퍼엑셀 기술 블로그) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-03
>
> **출처 한계**: hyper-accel.github.io 접근이 이 세션에서 egress 차단으로 원문을 직접 열람하지 못했다. Slack 본문 발췌와 스레드 1개 답글(CRUSH 약어 전개 포함)을 근거로 했고, WebSearch로는 이 시리즈 원문을 특정하지 못했다(일반적인 Ceph CRUSH 설명 자료만 확인됨).

## 한 줄 요약

**Ceph의 핵심 알고리즘 CRUSH(Controlled Replication Under Scalable Hashing)는 중앙 메타데이터 서버 없이 클라이언트가 직접 데이터 위치를 계산하게 함으로써, 중앙 서버의 병목·단일 장애점 문제를 해시 기반 분산 계산으로 해결한다.**

## 핵심 포인트

- **CRUSH의 정식 명칭** — ***CRUSH는 'Controlled Replication Under Scalable Hashing'의 약자***다. Ceph 같은 객체 기반 스토리지가 수많은 데이터를 여러 디스크(OSD)에 분산 저장할 때, 데이터 위치를 효율적으로 관리하는 문제를 푼다.
- **중앙 메타데이터 서버를 없앤다** — 기존의 메타데이터 테이블 방식은 ***중앙 서버의 병목 현상과 단일 장애점 문제***를 안고 있었지만, CRUSH는 ***클라이언트가 직접 계산을 통해 데이터 위치를 파악***함으로써 이를 해결한다.
- **장애 도메인을 고려한 배치** — 단순히 데이터를 분산하는 것을 넘어, ***랙(Rack)이나 전원 공급 장치 같은 '장애 도메인(Failure Domain)'을 고려해 데이터를 배치***함으로써 시스템의 가용성을 극대화한다.
- **장비 변경 시 최소 이동으로 재조정** — 클러스터에 장비가 추가되거나 제거될 때, ***최소한의 데이터 이동만으로 균형 잡힌 분산을 유지하는 동적 리밸런싱 기능***을 제공한다. 결과적으로 CRUSH는 중앙 집중식 메타데이터 없이도 확장 가능하고 안정적인 분산 환경을 구축하는 Ceph의 핵심 엔진 역할을 한다.

## 인상 깊은 문장

> "CRUSH는 중앙 집중식 메타데이터 없이도 확장 가능하고 안정적인 분산 환경을 구축하는 Ceph의 핵심 엔진 역할을 수행합니다." — Slack TechArticles 봇 스레드 답글(원문 발췌 재구성)

## 댓글

GeekNews를 거치지 않아 hada 댓글은 없다(Slack TechArticles 봇의 기업 블로그 직링크). HN/Lobsters 큐레이션 여부는 확인하지 못했다. **이해관계**: GPU/AI 인프라 기업(하이퍼엑셀)의 기술 학습 시리즈 1부로 보이며, 자사 제품 홍보보다는 오픈소스 기술 해설에 가깝다. "Part 01"이라는 표기로 보아 후속편이 있을 시리즈물이다.

## 내 생각 · 적용점

이 글은 분산 스토리지의 고전적 알고리즘을 다루는 기술 학습 자료로, 가든에 아직 Ceph·분산 스토리지 전용 선행 노트가 없어 억지로 연결 짓지 않는다. 다만 "중앙 조정자 없이 각 노드가 같은 규칙으로 독립적으로 계산해 합의에 이른다"는 CRUSH의 설계 철학은, 중앙 조율자를 두지 않는 분산 시스템 설계 일반의 원칙과 느슨하게 맞닿아 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** CRS는 Ceph 같은 자체 분산 오브젝트 스토리지를 운영할 규모가 아니며 클라우드 관리형 스토리지(S3 등)를 쓰는 것이 합리적이다. 다만 "장애 도메인을 고려한 배치"라는 개념 자체는, 멀티 리전/가용영역 구성 시 데이터센터·가용영역 단위로 장애 도메인을 분리하는 일반 원칙으로 참고할 수 있다.

## 연관 자료

직접 연결 노트 없음(가든에 Ceph·분산 오브젝트 스토리지 전용 선행 노트 없음, 억지 연결 금지 원칙에 따름).

## 한 달 뒤 회고

*(2026-12-03 즈음 — hyper-accel.github.io 접근이 풀리면 Part 02 이후 후속편과 함께 읽어 시리즈 전체 맥락으로 보강.)*
