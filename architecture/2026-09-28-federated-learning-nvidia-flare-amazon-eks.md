---
title: "Amazon EKS와 NVIDIA FLARE로 구현하는 연합학습 (AWS) — 원본 데이터는 그대로 두고 모델 가중치만 오간다"
source_title: "Amazon EKS와 NVIDIA FLARE로 구현하는 연합학습 (Federated Learning)"
source_url: "https://aws.amazon.com/ko/blogs/tech/federated-learning-in-action-with-nvidia-flare-on-amazon-eks/"
source_name: "AWS 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/federated-learning-in-action-with-nvidia-flare-on-amazon-eks/"
published_at: "확인 불가"
summarized_at: "2026-09-28"
category: "architecture"
tags: ["federated-learning", "nvidia-flare", "amazon-eks", "privacy-preserving-ml", "cross-site-evaluation", "kubernetes"]
---

# Amazon EKS와 NVIDIA FLARE로 구현하는 연합학습 (AWS)

> 출처: [Amazon EKS와 NVIDIA FLARE로 구현하는 연합학습 (Federated Learning)](https://aws.amazon.com/ko/blogs/tech/federated-learning-in-action-with-nvidia-flare-on-amazon-eks/) (AWS 기술 블로그) · Slack #개발-뉴스-dev-news(TechArticles 봇) 경유 · 정리일 2026-09-28
>
> **출처 한계**: `aws.amazon.com` 전체가 이번 세션 egress 정책으로 차단되어 원문을 열람하지 못했다. WebSearch로 NVIDIA FLARE의 일반 아키텍처(cross-site evaluation이 클라이언트들끼리 서로의 모델을 평가하는 클라이언트 제어형 워크플로라는 점, gRPC 위 TLS 암호화 통신, 유사 사례인 Apheris Gateway가 EKS 클러스터 안에서만 S3 접근권을 갖는 구조)는 교차 확인했지만, 이 AWS 한국 블로그 고유의 저자·구체 수치·실제 배포 사례는 확인하지 못했다. 아래 일부 내용은 NVIDIA FLARE 공식 문서 기준 일반론이며, 그렇게 명시했다.

## 한 줄 요약

**여러 기관이 원본 데이터를 한 곳으로 모으지 않고도 공동으로 모델을 학습시킬 수 있도록, Amazon EKS 위에 NVIDIA FLARE 연합학습 플랫폼을 구축 — 오가는 것은 데이터가 아니라 모델 가중치뿐이고, 사이트마다 다른 데이터 분포에서도 실제로 잘 작동하는지는 교차 사이트 평가로 검증한다.**

## 핵심 포인트

- **연합학습의 기본 전제** — 의료·금융처럼 데이터를 기관 밖으로 못 내보내는 도메인에서, 원본 데이터는 각 사이트(병원·지점 등)에 남겨두고 ***모델 가중치(파라미터 업데이트)만 중앙 오케스트레이터와 주고받는다.*** 일반적인 NVIDIA FLARE 아키텍처에서는 이 통신이 gRPC 위에 TLS로 암호화되어 오간다.
- **Amazon EKS가 오케스트레이션 레이어** — 쿠버네티스 기반 EKS 클러스터가 FLARE의 서버(오케스트레이터)·클라이언트 워크로드를 컨테이너로 배치·스케줄링한다. [[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]] 계열과 같은 "EKS = AI 워크로드의 표준 오케스트레이션 레이어"라는 흐름의 연장선.
- **교차 사이트 평가(cross-site evaluation)** — 한 사이트에서 학습한 모델을 다른 사이트의 로컬 데이터로 평가해, ***사이트마다 데이터 분포가 다른 상황(non-IID)에서도 모델이 일반화되는지*** 검증한다. NVIDIA FLARE의 클라이언트 제어형 워크플로 기능 중 하나로, 서버가 아니라 클라이언트들끼리 서로의 모델을 평가하는 구조다(일반 NVIDIA FLARE 문서 기준 — 이 AWS 글의 구체 구현 방식은 원문 미확인).
- **프라이버시와 운영 복잡도의 트레이드오프** — 원본 데이터를 안 보내는 대신, 통신 오버헤드·학습 라운드 수·비동기 참여 사이트 처리 같은 운영 복잡도가 늘어나는 게 연합학습 아키텍처의 일반적 특징이다.

## 인상 깊은 문장

> "원본 데이터는 이동하지 않고, 모델 가중치만 공유한다." (Slack 발췌 요지)

## 댓글

AWS 공식 기술 블로그의 아키텍처 소개 글로, hada 댓글 수는 확인 불가(GeekNews 경유가 아니라 Slack TechArticles 봇 직접 게시). AWS·NVIDIA 양사가 자사 제품(EKS·FLARE)을 조합한 레퍼런스 아키텍처이므로, 실제 프로덕션 배포 사례라기보다 "이렇게 구성할 수 있다"는 레퍼런스 성격일 가능성을 감안해야 한다 — 실운영 규모(참여 기관 수·데이터 볼륨)는 원문 미확인이라 알 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "EKS는 AI 워크로드의 표준 오케스트레이션 레이어"라는 흐름에 연합학습이 합류

[[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]]가 추론 서빙(vLLM)을, [[2026-09-21-devocean-kubernetes-ai-inference-infra]]가 추론 인프라 전반을 EKS 위에 얹었다면, 이 글은 학습(그것도 다자간 협업 학습)까지 EKS 위에 얹는다. 이 가든에서 반복 확인되는 패턴 — ***쿠버네티스가 AI 워크로드의 학습부터 서빙까지 전 구간의 기본 레이어가 되고 있다*** — 의 또 다른 사례다.

### 핵심 전이 2 — 프라이버시 보존 학습의 진짜 난제는 "실제로 일반화되는가"로 귀결

교차 사이트 평가가 흥미로운 건, 연합학습의 진짜 난제가 "데이터를 안 모으고도 학습이 되는가"가 아니라 ***"사이트마다 데이터 분포가 다른데도 한 모델이 다 통하는가"***라는 걸 드러내기 때문이다. 모으지 않고 학습해도, 검증은 결국 각 사이트의 실측 데이터로 따로 해야 한다는 점이 이 아키텍처의 핵심 통찰이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 상당히 멀다 — 온다는 병원 간 협업 학습 같은 다자간 프라이버시 보존 학습 시나리오가 당장 없다. 다만 전이 가능한 원칙 하나는 남는다: **숙박사업자마다 예약·정산 데이터의 분포가 다르므로, 한 고객사 데이터로 학습·튜닝한 로직이 다른 고객사에도 통하는지는 별도로 검증해야 한다**는 "교차 사이트 평가"의 발상은 멀티테넌트 B2B SaaS 일반에 유효하다 — 고객사 A의 패턴으로 만든 자동화 규칙을 고객사 B에 그대로 적용하기 전에, B의 실데이터로 먼저 검증하는 절차로 옮겨볼 수 있다.

## 연관 자료

- [[2026-09-10-aws-eks-gemma4-vllm-part1-cold-start]] — 같은 EKS 기반 AI 워크로드 오케스트레이션 계열, 추론 서빙 축
- [[2026-09-21-devocean-kubernetes-ai-inference-infra]] — 쿠버네티스가 AI 인프라 표준 레이어가 되는 같은 흐름

## 한 달 뒤 회고

*(2026-10-28 즈음 — egress 차단이 풀려 원문의 실제 참여 기관 수·성능 수치를 확인할 수 있는지, 이 아키텍처가 레퍼런스 수준을 넘어 실제 프로덕션 사례로 이어졌는지 확인.)*
