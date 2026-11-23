---
title: "금융 규제 환경에서 AWS Glue로 GA4 데이터를 API 직접 호출로 수집하기 (AWS 한국 기술 블로그, 원문 세션 네트워크 차단) — 네이티브 커넥터가 막히면 프록시와 서비스계정으로 우회한다"
source_title: "금융 규제 환경에서 AWS Glue로 Google Analytics 4 데이터를 API 직접 호출로 수집하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/ingest-ga4-data-in-regulated-environments-using-aws-glue/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-23"
category: "backend"
tags: ["aws-glue", "ga4", "data-pipeline", "regulated-environment", "kms", "forward-proxy"]
---

# 금융 규제 환경에서 AWS Glue로 GA4 데이터를 API 직접 호출로 수집하기 (AWS 한국 기술 블로그)

> 출처: [금융 규제 환경에서 AWS Glue로 Google Analytics 4 데이터를 API 직접 호출로 수집하기](https://aws.amazon.com/ko/blogs/tech/ingest-ga4-data-in-regulated-environments-using-aws-glue/) (AWS 한국 기술 블로그) · Slack TechArticles 경유 · 정리일 2026-11-23

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 차단되어 원문을 직접 읽지 못했다. WebSearch로 이 기사 자체는 찾지 못했지만, AWS Glue 공식 문서로 배경 기술사실(GA4는 Glue 커넥터에서 소스로만 지원되고 타깃으로는 쓸 수 없다는 점, API v1 beta 사용, Secrets Manager에 OAuth 2.0 클라이언트 자격증명을 저장한다는 점)은 확인했다. "금융 규제 환경"이라는 맥락의 구체적 요건은 교차검증하지 못했다.

## 한 줄 요약

**AWS Glue의 네이티브 GA4 커넥터가 금융 규제 환경의 네트워크·인증 요건을 충족하지 못하자, 프라이빗 서브넷에서 포워드 프록시를 경유해 GA4 API를 직접 호출하고 서비스 계정+KMS로 인증 정보를 관리하는 우회 아키텍처를 만들었다.**

## 핵심 포인트

- 금융 규제 환경의 AWS Glue에서 외부 GA4 데이터를 안전하게 수집하는 아키텍처를 제시한다.
- ***프라이빗 서브넷에서 포워드 프록시를 경유***해 외부 API를 호출함으로써 네트워크 보안 요건(아웃바운드 트래픽 통제)을 충족한다.
- 사용자 계정 대신 ***서비스 계정과 AWS KMS***로 인증 정보를 안전하게 관리하고 자동화한다.
- 네이티브 커넥터의 제약(소스 전용, 세부 설정 한계)을 극복하기 위해 Python 라이브러리로 GA4 API를 직접 호출하는 방식을 선택했다.

## 인상 깊은 문장

> (원문 직접 접속이 차단되어 1차 인용을 확보하지 못했다. 확인된 건 AWS Glue 공식 문서상 "GA4 connector is a source-only connector" 수준의 배경 사실뿐이다.)

## 댓글

TechArticles 채널의 AWS 공식 블로그 직공유. 댓글·커뮤니티 큐레이션 확인 불가. 금융 규제 환경의 구체 규정(어떤 망분리 기준인지)은 명시되지 않아 일반화에 주의가 필요하다.

## 내 생각 · 적용점

관리형 커넥터가 "규제 환경"이라는 비기능 요구를 못 채울 때, 결국 선택지는 둘 중 하나다 — 커넥터를 포기하고 직접 호출로 내려가거나, 규제를 느슨하게 해석하거나. 이 글은 전자를 택했고, 그 대가로 "프록시 경유 + 서비스계정 + KMS"라는 세 겹의 보완 계층을 추가로 설계해야 했다. 관리형 서비스의 추상화가 주는 편의와, 규제 환경이 요구하는 통제력은 자주 충돌한다는 걸 보여주는 사례다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 완전한 금융 규제급은 아니지만, PCI-DSS가 적용되는 결제 데이터 환경에서 외부 분석 API(GA4, 광고 플랫폼 API 등)를 당겨와야 할 때 이 패턴(프라이빗 서브넷+포워드 프록시+서비스계정)을 그대로 참고할 수 있다. 특히 사용자 계정이 아닌 서비스 계정으로 인증을 관리해 사람이 퇴사해도 파이프라인이 끊기지 않게 하는 설계는 운영 안정성 측면에서 CRS 데이터 파이프라인에도 바로 쓸 만하다.

## 연관 자료

연결 없음 — 레포에 "규제 환경 데이터 파이프라인"을 전용으로 다룬 선행 노트가 없다. 억지로 엮기보다 정직하게 비워둔다.

## 한 달 뒤 회고

2026-12-23 즈음 — aws.amazon.com 차단이 풀려 원문의 구체 네트워크 다이어그램을 확인했는지, CRS 결제 데이터 환경에 유사 패턴 도입을 실제로 검토했는지 점검.
