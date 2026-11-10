---
title: "게임듀오, Amazon EC2 기반 ClickStack으로 게임 서버 관측성 비용을 절반 이하로 (AWS, 원문 미확인) — 이 가든의 세 번째 ClickStack/ClickHouse 채택 사례"
source_title: "게임듀오가 Amazon EC2 기반 ClickStack으로 게임 서버 관측성 비용을 절반 이하로 줄인 방법"
source_url: "https://aws.amazon.com/ko/blogs/tech/gameduo-clickstack-on-amazon-ec2/"
source_name: "AWS 기술 블로그(한국)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (aws.amazon.com 차단으로 미확인)"
summarized_at: "2026-11-10"
category: "backend"
tags: ["clickstack", "clickhouse", "observability", "cost-optimization", "distributed-tracing", "gaming-infra", "aws-ec2", "log-retention"]
---

# 게임듀오, Amazon EC2 기반 ClickStack으로 게임 서버 관측성 비용을 절반 이하로 (AWS)

> 출처: [게임듀오가 Amazon EC2 기반 ClickStack으로 게임 서버 관측성 비용을 절반 이하로 줄인 방법](https://aws.amazon.com/ko/blogs/tech/gameduo-clickstack-on-amazon-ec2/) (AWS 기술 블로그) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, GeekNews 아님) · 정리일 2026-11-10

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단되어 원문을 열람하지 못했다. WebSearch로 "게임듀오 ClickStack"을 직접 검색했으나 이 사례를 찾지 못했다 — 대신 ClickStack(ClickHouse 기반 관측성 스택, 로그·트레이스·메트릭·세션 통합) 자체의 일반 설명과, ClickHouse 공식 자료가 주장하는 "컬럼 지향 설계로 OTel 데이터 스토리지를 최대 90%까지 절감"이라는 벤더 자체 주장만 교차확인했다. **게임듀오라는 회사의 구체적 전환 규모·절감 비율의 1차 근거는 확인하지 못했고**, 이 노트의 핵심 포인트는 Slack 발췌 수준에 머문다.

## 한 줄 요약

**게임듀오가 자체 운영하던 게임 서버 로그·트레이싱 인프라를 Amazon EC2 위의 ClickStack(ClickHouse 기반 관측성 스택)으로 전환해, 기존 SaaS 관측성 도구 대비 비용을 절반 이하로 줄이고 로그 보존 기간을 15일에서 180일로 12배 늘렸다고 주장하는 사례다.**

## 핵심 포인트

- **비용**: 기존 SaaS 관측성 도구 대비 ***비용을 절반 이하로 절감***. 구체적인 절감율(%)이나 월간 비용 수치는 발췌에 없어 미확인.
- **보존 기간 대폭 연장**: 로그 보존 기간을 ***15일 → 180일로 12배 연장***. 비용 때문에 짧게 유지하던 보존 기간을 늘릴 수 있게 됐다는 건 관측성 비용 구조가 근본적으로 바뀌었다는 신호.
- **포기했던 기능 복원**: ***비용 문제로 포기했던 분산 트레이싱 기능을 구현***. SaaS 시절엔 트레이싱이 "너무 비싸서 끈 기능"이었다는 뜻으로 읽힌다.
- **쿼리 효율**: ***SQL 기반 ClickHouse***를 활용해 로그 파싱 효율을 높이고 다양한 게임 로그를 유연하게 검색. 서버 증설에도 비용 부담이 적은 구조를 구축했다고 설명(구체 아키텍처는 미확인).

## 인상 깊은 문장

> "로그 보존 기간을 15일에서 180일로 대폭 연장하고 비용 문제로 포기했던 분산 트레이싱 기능을 구현함." (Slack 발췌)

## 댓글

GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글·HN/Lobsters 큐레이션 대상이 아니다. AWS 자사 기술 블로그이므로 AWS(EC2·파트너 ClickHouse Cloud)를 홍보하려는 이해관계가 있을 수 있다. "절반 이하로 절감"이라는 표현의 분모(기존 SaaS가 정확히 무엇이었는지, Datadog인지 다른 도구인지)가 밝혀지지 않아 숫자의 의미를 그대로 믿기는 어렵다.

## 내 생각 · 적용점

### 핵심 전이 1 — 카카오페이증권의 ClickStack 도입과 같은 패턴, 다른 산업

[[2026-06-08-kakaopay-clickstack-log-platform]]는 하루 41TB·200억 건 로그를 ClickStack(OpenTelemetry + ClickHouse + HyperDX)으로 재설계해 비용을 85.6% 절감한 사례였다. 게임듀오 사례는 ***같은 스택(ClickStack)을 게임 서버 로그·트레이싱이라는 다른 산업 축에서 반복***한다 — "실제 조회 패턴에 맞는 컬럼형 OLAP을 고르면 SaaS 대비 비용이 수배 차이 난다"는 이 가든의 반복 결론이 세 번째 산업(핀테크→게임)으로 확장되는 사례.

### 핵심 전이 2 — "포기했던 기능을 비용 절감 후 되살린다"는 패턴

[[2026-07-03-clickhouse-winning-observability-wars]]가 다룬 "ClickHouse가 Datadog 대비 1/30 비용"이라는 압축률 논리를 이 사례에 대입하면, ***비용이 낮아지는 순간 "꺼뒀던 기능(분산 트레이싱)"을 다시 켜는 것***이 자연스러운 다음 단계임을 보여준다 — 관측성 비용 절감은 끝이 아니라 그동안 못 샀던 가시성을 사는 시작점이 된다는 교훈.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS가 멀티 호텔/파트너 트래픽의 API 로그·예약 트랜잭션 트레이싱을 SaaS 관측성 도구(예: Datadog)로 운영하며 보존 기간을 비용 때문에 짧게 잡고 있다면, ClickStack(EC2 자체 운영) 전환으로 보존 기간을 늘리고 분산 트레이싱(예약→결제→PMS 연동 체인 추적)을 비용 부담 없이 켜는 선택지를 검토할 만하다. 단, [[2026-06-08-kakaopay-clickstack-log-platform]] 노트가 강조했듯 ***실제 조회 패턴(시간범위+필드 검색이 몇 % 인지)을 먼저 분석***하는 게 전제다.

## 연관 자료

- [[2026-06-08-kakaopay-clickstack-log-platform]] — 같은 ClickStack 스택을 핀테크 축에서 먼저 보여준, 비용 절감률까지 구체적으로 공개한 선행 사례
- [[2026-07-03-clickhouse-winning-observability-wars]] — "ClickHouse가 왜 관측성 전쟁에서 이기는가"를 비용 압축률 논리로 설명한 배경 노트

## 한 달 뒤 회고

- 2026-12-10 즈음 점검: aws.amazon.com 접속이 풀리면 원문에서 절감 비율의 분모(기존 SaaS 도구명)와 구체 아키텍처를 보강한다.
