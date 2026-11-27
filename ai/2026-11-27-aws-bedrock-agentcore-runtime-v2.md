---
title: "새로운 Amazon Bedrock AgentCore Runtime(플랫폼 버전 V2) 소개 - 스냅샷 기반 cold start와 탄력 메모리 (AWS) — 컨테이너를 매번 초기화하지 않고 준비된 스냅샷을 복원해 콜드 스타트를 1.9~2.0초로 줄인다"
source_title: "새로운 Amazon Bedrock AgentCore Runtime(플랫폼 버전 V2) 소개 – 스냅샷 기반 cold start와 탄력 메모리"
source_url: "https://aws.amazon.com/ko/blogs/tech/agentcore-runtime-v2/"
source_name: "AWS 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "ai"
tags: ["amazon-bedrock", "agentcore", "cold-start", "serverless", "aws"]
---

# 새로운 Amazon Bedrock AgentCore Runtime(플랫폼 버전 V2) 소개 (AWS)

> 출처: [새로운 Amazon Bedrock AgentCore Runtime(플랫폼 버전 V2) 소개](https://aws.amazon.com/ko/blogs/tech/agentcore-runtime-v2/) (AWS 기술 블로그) · 정리일 2026-11-27

> **출처 한계**: `aws.amazon.com`이 egress 차단되어 원문을 직접 열람하지 못했다. WebSearch로 AWS 공식 개발자 가이드(`docs.aws.amazon.com/bedrock-agentcore`)와 3rd-party 분석(dev.classmethod.jp, unite.ai 등)을 교차확인해 스냅샷 기반 동작 방식과 성능 수치는 상당 부분 확인했다. 단, 3rd-party 분석에서 지적된 "V2의 단위 요금이 상승했다"는 비용 측면은 AWS 공식 자료로 확인하지 못했다.

## 한 줄 요약

**AgentCore Runtime V2는 세션마다 컨테이너 환경을 처음부터 초기화하는 대신, 한 번 준비한 환경의 스냅샷을 각 세션에 복원하는 방식으로 콜드 스타트를 기존 5.4~30초에서 1.9~2.0초로 줄이고, 쓰지 않는 메모리를 자동 회수하는 탄력 메모리 기능까지 더했다.**

## 핵심 포인트

- **스냅샷 복원 방식** — 컨테이너를 세션마다 초기화하지 않고, 환경을 한 번 준비해 스냅샷으로 저장한 뒤 새 세션마다 그 스냅샷을 복원한다. WebSearch로 확인한 AWS 공식 설명과 일치하는 구조.
- **탄력 메모리로 비용 절감** — 세션 중 사용하지 않는 메모리를 자동으로 회수하는 탄력 메모리 기능을 통해 불필요한 과금을 줄이고 비용 효율성을 높였다는 서술.
- **콜드 스타트 수치** — WebSearch로 확인된 AWS 발표 기준 P75 콜드 스타트는 200MB~2GB 이미지 범위에서 약 ***1.9~2.0초***이며, V1은 ***5.4~30초***였다. 한 개발자의 단일 측정(도쿄 리전)에서는 V1 13.6초, V2 1.8초로 나타났으나 측정 횟수가 적어 참고용이다.
- **주요 리전에 기본 적용** — 서울 리전을 포함한 주요 리전에서 V2가 기본값으로 적용됐으며, 필요시 플랫폼 버전을 명시해 기존 환경을 마이그레이션할 수 있다.
- **코드 작성 시 주의점(WebSearch로 보완)** — 공식 문서에 따르면 시작 시 수행한 작업이 스냅샷에 포함되어 복원된 모든 인스턴스가 공유하므로, 모듈 스코프에서 생성한 난수·시각 값도 세션 간 공유될 수 있어 초기화 작업을 init 단계로 옮기는 것이 권장된다.

## 인상 깊은 문장

> "AgentCore Runtime prepares your environment once and takes a snapshot of it, then restores that snapshot for each new instance instead of initializing your environment on each start." — AWS 공식 문서 (WebSearch로 확인).

## 댓글

AWS 기술 블로그 신기능 소개 글이라 hada 댓글 생태계 밖. 벤더 발표이므로 성과 수치는 AWS에 유리한 조건(이미지 크기, 리전)에서 측정됐을 가능성에 유의. 3rd-party 분석이 지적하는 비용 상승 여부는 공식 자료로 확인되지 않았다는 점도 같이 봐야 한다.

## 내 생각 · 적용점

### 핵심 전이 — AgentCore 생태계 보도의 연속

[[2026-11-22-aws-agentcore-cli]], [[2026-11-24-aws-ops-qa-bedrock-agentcore-part1]], [[2026-11-23-hankookilbo-nci-neptune-agentcore]], [[2026-11-24-bedrock-managed-agents-powered-by-openai]]로 이어지는 이 레포의 AgentCore 관련 보도 체인에 플랫폼 런타임 성능 개선이라는 조각이 더해진다. AWS가 AgentCore를 에이전트 실행 표준 플랫폼으로 밀고 있다는 그림이 점점 뚜렷해지는데, 이번엔 "기능 확장"이 아니라 "실행 속도·비용 효율화"라는 성숙 단계의 투자로 읽힌다.

### 적용점

세션 단위로 짧게 뜨고 사라지는 에이전트 워크로드(상담 봇 등)에서 콜드 스타트가 사용자 체감 지연의 핵심 요인이라면, 스냅샷 기반 복원 방식을 직접 벤치마크해볼 가치가 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 상담 에이전트처럼 사용자 요청마다 새 세션이 뜨는 구조라면, 콜드 스타트가 5초 이상 걸리는 것과 2초 이내인 것의 체감 차이는 고객 응대 품질에 직결된다. AgentCore 기반 에이전트를 도입한다면 V2 마이그레이션은 바로 검토할 가치가 있다.

## 연관 자료

- [[2026-11-22-aws-agentcore-cli]] — AgentCore 생태계의 CLI 도구화
- [[2026-11-24-aws-ops-qa-bedrock-agentcore-part1]] — AgentCore Gateway로 운영 조회 도구를 노출하는 사례
- [[2026-11-23-hankookilbo-nci-neptune-agentcore]] — Neptune+AgentCore 결합 사례
- [[2026-11-24-bedrock-managed-agents-powered-by-openai]] — AgentCore와 다른 벤더(OpenAI) 모델 결합 시도

## 한 달 뒤 회고

2026-12-27 즈음 — V2 단위 요금이 실제로 V1보다 높은지, 서울 리전 기준 실측 콜드 스타트 체감을 확인한다.
