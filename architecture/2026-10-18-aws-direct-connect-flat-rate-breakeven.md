---
title: "AWS Direct Connect 정액 요금제 손익분기점 분석 (AWS) — 고정비로 바꾸는 선택은 'Tier 안에 머무를 수 있는가'에 전부 걸려 있다"
source_title: "AWS Direct Connect Flat-rate 요금제 손익분기점 분석"
source_url: "https://aws.amazon.com/ko/blogs/tech/aws-direct-connect-flat-rate-breakeven-analysis/"
source_name: "AWS 한국 기술 블로그 (Slack #개발-뉴스-dev-news 발췌 경유, 원문 직접 열람 실패)"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/aws-direct-connect-flat-rate-breakeven-analysis/"
summarized_at: "2026-10-18"
category: "architecture"
tags: ["aws", "direct-connect", "pricing", "flat-rate", "cost-optimization", "networking", "breakeven-analysis"]
---

# AWS Direct Connect 정액 요금제 손익분기점 분석

> 출처: [AWS Direct Connect Flat-rate 요금제 손익분기점 분석](https://aws.amazon.com/ko/blogs/tech/aws-direct-connect-flat-rate-breakeven-analysis/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-10-18

> **출처 한계**: `aws.amazon.com`은 이 세션에서 egress가 막혀(`ENOTFOUND`) 원문을 직접 열람하지 못했다. GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 자체가 해당되지 않는다. WebSearch로 교차확인한 결과, AWS는 2026년 9월 10Gbps·100Gbps 전용 연결에 대한 Direct Connect 정액(Flat-rate) 요금제를 공식 발표했고([aws.amazon.com/about-aws/whats-new](https://aws.amazon.com/about-aws/whats-new/2026/09/aws-direct-connect-announces-flat-rate-pricing/) 정황 확인), 이 글은 그 발표를 다루는 후속 손익분기점 분석 글로 보인다. 다만 **정확한 요금 숫자(정액 월 단가, Tier별 경계값)는 이 세션에서 공식 가격표(`aws.amazon.com/directconnect/pricing/flat-rate/`)도 열지 못해 확인하지 못했다** — 아래 수치는 Slack 발췌 + WebSearch로 찾은 서드파티 추정치(기존 종량제 기준, 정액제 발표 이전 추정이라 그대로 적용하면 안 됨)를 "방법론 참고용"으로만 쓴 것이고, 저자/발행일도 확인하지 못했다.

## 한 줄 요약

**AWS Direct Connect 정액 요금제는 포트 시간 요금과 데이터 전송 비용을 시간당 고정 단가 하나로 묶어, 트래픽이 많고 예측 가능한 환경에서 비용을 고정시키고 이중화(대기 포트) 구성까지 효율적으로 지원한다 — 다만 그 이득은 "선택한 Tier(지리적 범위) 안에 트래픽이 머무르는가"에 전부 걸려 있고, Tier를 벗어난 트래픽은 표준 종량 요금으로 되돌아간다.**

## 핵심 포인트

- **포트 시간 + 데이터 전송을 하나의 시간당 고정 단가로 통합** — 기존 종량제는 포트 시간당 요금(예: 1Gbps $0.30/hr ~ 400Gbps $85.00/hr 수준, WebSearch 교차확인한 참고값)과 GB당 데이터 전송 비용(지역 내 $0.02/GB 수준)을 별도로 과금했다. ***정액 요금제는 이 둘을 시간당 고정 단가 하나로 통합***해, 선택한 Tier 범위 안에서는 데이터를 얼마나 전송하든 추가 전송 비용이 붙지 않는다.
- **비용 예측 가능성 — 트래픽이 많을수록 유리해지는 구조** — 종량제는 트래픽이 늘수록 청구서가 그만큼 커지지만, 정액제는 ***Tier 안에서는 트래픽량과 무관하게 고정비***다. 트래픽이 많고 꾸준한 환경일수록 정액제의 고정비가 종량제의 변동비보다 유리해지는 손익분기점을 넘기 쉽다.
- **이중화 구성을 효율적으로 지원 — 대기 포트가 추가 비용 없이 포함** — Direct Connect의 포트 쌍(port-pair) 구성에서 ***대기(standby) 포트가 추가 비용 없이 포함***된다는 점(WebSearch 교차확인)이 정액제의 이중화 효율성 주장과 맞닿아 있다 — 가용 용량은 포트 하나 분량이지만, 장애 대응용 대기 회선을 별도 요금 없이 유지할 수 있다는 뜻이다.
- **전환 전 반드시 검토할 것 — Tier 범위와 부가 서비스** — 정액제는 ***5개의 지리적 Tier(같은 메트로~글로벌 범위, WebSearch 교차확인)***로 나뉘어 있고, ***선택한 Tier 범위를 벗어나는 트래픽은 표준 데이터 전송 요금으로 별도 과금***된다. 또한 정액제에 포함되지 않는 ***부가 서비스 항목(예: 특정 부가 기능이나 연결 옵션)***이 있을 수 있어, 전환 전 자신의 실제 트래픽 분포가 Tier 안에 들어오는지, 어떤 항목이 별도 과금되는지를 먼저 확인해야 한다는 게 이 글의 핵심 경고로 보인다.
- **손익분기점 계산의 기본 골격(WebSearch로 보강, 원문 수치는 미확인)** — 일반적인 손익분기 계산은 "(정액 월 요금 − 종량제 포트 요금) ÷ 종량제 데이터 전송 단가"로 손익분기 트래픽량을 구하는 형태다. 다만 이 식은 ***트래픽이 선택한 Tier 안에 머무른다는 전제***에서만 성립한다 — Tier를 벗어나는 트래픽이 섞이면 실제 손익분기점은 이보다 더 높아진다.

## 인상 깊은 문장

> "AWS Direct Connect 정액 요금제는 포트 시간과 데이터 전송 비용을 시간당 고정 단가로 통합합니다."
> (Slack 발췌 인용)

> "전환 전 Tier 범위 내 포함 여부와 별도 과금되는 부가 서비스 항목을 면밀히 검토해야 합니다."
> (Slack 발췌 인용)

## 댓글

GeekNews를 거치지 않은 AWS 자사 블로그라 hada 댓글·HN/Lobsters 큐레이션 자체가 해당되지 않는다. **정직하게 밝힐 한계**: 이 글은 AWS가 직접 내놓은 자사 신규 요금제 분석이라, "손익분기점을 넘기면 유리하다"는 결론으로 수렴할 수밖에 없는 벤더 콘텐츠의 구조적 편향을 감안해야 한다 — 실제로 손익분기점을 넘는 트래픽 규모의 조직이 전체 Direct Connect 고객 중 얼마나 되는지, Tier를 넘나드는 트래픽이 흔한 멀티리전 조직에게 정액제가 실제로 유리한지는 이 발췌만으로 확인할 수 없다. 공식 가격표(`aws.amazon.com/directconnect/pricing/flat-rate/`)에 직접 접근하지 못해 정확한 Tier 경계·월 단가도 검증하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "경계를 넘을 때마다 비용이 생긴다"는 가든의 AWS 네트워크 비용 3부작 원칙에 "경계를 고정비로 미리 사버린다"는 네 번째 선택지를 더함

가든에는 이미 [[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]]·[[2026-09-21-aws-network-data-transfer-part2-intra-region]]·[[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] 3부작이 "인터넷 경계 → AZ 경계 → 리전 경계, 경계를 넘을 때마다 비용이 생긴다"는 원칙을 쌓아뒀다. 이 글의 정액 요금제는 **그 경계 자체를 없애는 게 아니라, 경계를 넘는 비용을 미리 고정가로 사버리는** 네 번째 선택지를 더한다 — 다만 그 선택이 유리해지는 조건은 정확히 3부작이 말한 "경계"와 같다. ***Tier라는 새로운 경계***를 또 하나 만들고, 이번엔 그 경계를 넘으면 다시 종량제로 돌아간다는 점에서, "경계를 없앤다"가 아니라 "경계의 위치와 모양을 재협상한다"는 게 더 정확한 설명이다.

### 핵심 전이 — Run:ai의 "정적 할당과 실사용 간극"과 정반대 방향의 자원 전략

[[2026-10-17-nvidia-runai-kubernetes-gpu-scheduling]]은 "정적 할당량이 실사용과 간극을 만들면 그 유휴분을 동적으로 회수"하는 쪽이 효율적이라는 결론이었다. Direct Connect 정액제는 **정반대 방향**이다 — 트래픽이 변동하는 환경에서는 동적 과금(종량제)이 실사용에 맞춰 비용도 따라가지만, ***트래픽이 꾸준히 많은 환경에서는 오히려 "변동 비용을 없애고 고정비로 못박는 것"이 더 유리***해진다. 두 글을 나란히 보면 "동적 배분이 항상 낫다"가 아니라, ***사용 패턴의 변동성이 큰가 작은가***가 동적 과금과 고정 과금 중 어느 쪽이 유리한지를 가르는 축이라는 일반 원칙이 드러난다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 PMS·OTA 등 외부 시스템과 상시 대량의 트래픽을 주고받는 하이브리드 연결(온프레미스 데이터센터↔AWS)을 운영한다면, 이 글의 분석 틀 자체는 직접 적용 가능하다 — ***①*** 현재 Direct Connect 트래픽이 종량제 대비 손익분기점을 넘는 규모인지 먼저 계산하고, ***②*** 그 트래픽이 정액제가 커버하는 Tier(지리적 범위) 안에 실제로 머무르는지(멀티리전으로 흩어져 있다면 Tier를 자주 벗어날 수 있다) 확인하는 순서는 CRS의 네트워크 비용 검토에도 그대로 쓸 수 있는 체크리스트다. 다만 온다가 Direct Connect급 전용 회선을 쓰는 규모인지는 이 세션에서 확인할 수 없어, 적용 여부는 실제 트래픽 규모 데이터로 따로 검증해야 한다.

## 연관 자료

- [[2026-09-21-aws-network-data-transfer-part1-pricing-boundary]] — "경계를 넘을 때마다 비용이 생긴다"는 원칙의 1부(인터넷 경계)
- [[2026-09-21-aws-network-data-transfer-part3-vpc-hybrid]] — 같은 원칙의 3부(VPC 간·하이브리드 연결), Direct Connect와 가장 인접한 경계
- [[2026-10-17-nvidia-runai-kubernetes-gpu-scheduling]] — "정적 할당 대 동적 회수"라는 반대 방향의 자원 전략, 트래픽/사용 패턴의 변동성이 둘 중 어느 쪽이 유리한지를 가르는 축이라는 대비

## 한 달 뒤 회고

*(2026-11-18 즈음 — `aws.amazon.com` 접근이 가능해지면 공식 가격표로 정확한 Tier 경계·월 단가를 검증하고, 온다의 실제 네트워크 트래픽 규모가 Direct Connect 손익분기점 분석을 적용할 만한 수준인지 확인.)*
