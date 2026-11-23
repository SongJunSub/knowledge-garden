---
title: "[네이버] Spark 배치 파이프라인 Distributed Tracing 도입 (Naver D2, 원문 접속 차단) — 비즈니스 로직을 건드리지 않고 플러그인으로 전체 흐름을 추적했다"
source_title: "Spark 배치 파이프라인 Distributed Tracing 도입"
source_url: "https://d2.naver.com/helloworld/2526679"
source_name: "Naver D2 (d2.naver.com) · Slack #개발-뉴스-dev-news 경유(TechArticles 봇, GeekNews 아님)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (원문 접근 차단으로 미확인, Slack 게시 2026-11-23 20:10 KST)"
summarized_at: "2026-11-23"
category: "backend"
tags: ["naver-d2", "spark", "distributed-tracing", "opentelemetry", "observability", "source-limitation"]
---

# [네이버] Spark 배치 파이프라인 Distributed Tracing 도입

> 출처: [Spark 배치 파이프라인 Distributed Tracing 도입](https://d2.naver.com/helloworld/2526679) (Naver D2 · Slack 경유) · 정리일 2026-11-23
> **출처 한계를 먼저 밝힌다.** 이 세션에서 `d2.naver.com` 도메인이 완전히 차단되어(WebFetch 실패) 원문을 한 줄도 읽지 못했다. WebSearch로도 이 글 자체를 찾지 못했고, 대신 Spark에 OpenTelemetry를 붙이는 일반적인 방법(Microsoft 엔지니어링 블로그의 `StreamingQueryListener` 활용 사례 등)만 참고 정황으로 확인했다. 아래 핵심 포인트는 **Slack 발췌 3줄이 유일한 근거**다.

## 한 줄 요약

**네이버가 Apache Spark 배치 파이프라인에 분산 추적(distributed tracing)을 도입해, 비즈니스 로직 수정 없이 플러그인 형태로 전체 데이터 흐름을 관측 가능하게 만든 사례.**

## 핵심 포인트 (Slack 발췌 기반, 원문 고유 디테일 아님)

- Apache Spark 배치 파이프라인에 분산 추적 기술을 도입해 시스템 관측성을 확보했다.
- ***비즈니스 로직 수정 없이 플러그인 형태로 OpenTelemetry를 적용해 전체 흐름을 추적***했다고 밝힌다 — 기존 코드를 침습적으로 바꾸지 않았다는 점이 핵심 주장이다.
- 관측된 데이터를 기반으로 성능 최적화는 물론, AI 에이전트의 진단 기능까지 고도화했다고 언급한다 — 관측 데이터를 에이전트 입력으로 재사용하는 흐름.

## 인상 깊은 문장

**없음.** 원문에 접근하지 못해 직접 인용을 제공할 수 없다.

## 댓글

GeekNews가 아니라 Slack TechArticles 봇 직링크라 hada 댓글·HN/Lobsters 큐레이션 개념이 해당하지 않는다. 원문 차단으로 저자·구체 아키텍처(어떤 span을 끊었는지, 수집기로 무엇을 썼는지)를 전혀 확인하지 못했다.

## 내 생각 · 적용점

Spark의 구조적 특성상(executor가 분산돼 있고, 배치 작업은 재시작·재시도가 흔함) "어디서 느려졌는지"를 추적하는 일이 로그만으로는 어렵다. 이 글이 강조하는 "비즈니스 로직을 안 건드리고 플러그인으로 붙인다"는 접근은 [[2026-09-29-naver-hive-spark-get-table-rpc-recovery]]에서 본 것과 같은 네이버 데이터 플랫폼 팀의 일관된 태도로 읽힌다 — 레거시 호환성과 운영 안정성을 최우선으로 두고, 관측 계층을 비침습적으로 쌓아 올리는 방식.

## 호스피탈리티 / CRS 적용 포인트

적용 가능성 있음 — CRS의 야간 배치(요금 정산, 재고 동기화, 채널 매핑 업데이트 등)도 동일하게 "어느 단계에서 지연·실패가 났는지"를 사후에만 로그로 재구성하는 경우가 많다. 비즈니스 로직을 안 건드리는 플러그인형 트레이싱을 배치 잡에 먼저 붙여보는 것이 낮은 리스크로 관측성을 얻는 길이 될 수 있다.

## 연관 자료
- [[2026-09-29-naver-hive-spark-get-table-rpc-recovery]] — 같은 네이버 D2 Spark 계열, 레거시 호환성을 비침습적으로 다루는 같은 태도.
- [[2026-10-17-salesforce-data360-spark-resource-waste]] — Spark 리소스·관측 문제를 다룬 다른 회사 사례.

## 한 달 뒤 회고
*(2026-12-23 즈음 — d2.naver.com 접근이 가능해지면 이 노트를 원문 기반으로 교정할 수 있는지 확인. 어떤 추적 수집기·span 설계를 썼는지, "AI 에이전트 진단 기능"이 구체적으로 무엇인지 검증.)*
