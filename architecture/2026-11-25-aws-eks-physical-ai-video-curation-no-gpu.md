---
title: "Amazon EKS로 GPU 없이 Physical AI 영상 큐레이션하기 (AWS, Cosmos Curator로 추정) — CPU-GPU 단계 분리는 NVIDIA 공식 설계와 일치, 이 블로그 원문 자체는 특정 못함"
source_title: "Amazon EKS로 GPU 없이 Physical AI 영상 큐레이션하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/physical-ai-video-curation-on-amazon-eks-without-gpus/"
source_name: "AWS 한국 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/physical-ai-video-curation-on-amazon-eks-without-gpus/"
published_at: "확인 불가"
summarized_at: "2026-11-25"
category: "architecture"
tags: ["aws", "eks", "physical-ai", "nvidia-cosmos", "bedrock", "video-pipeline", "cost-optimization"]
---

# Amazon EKS로 GPU 없이 Physical AI 영상 큐레이션하기 (AWS)

> 출처: [Amazon EKS로 GPU 없이 Physical AI 영상 큐레이션하기](https://aws.amazon.com/ko/blogs/tech/physical-ai-video-curation-on-amazon-eks-without-gpus/) (AWS 한국 블로그) · 정리일 2026-11-25

> **출처 한계**: `aws.amazon.com`이 세션 egress 차단으로 원문을 못 열었다. Slack 스레드 2번째 메시지에서 "Ray 기반의 Cosmos Curator를 Kubernetes 환경에서 최적화하여 실행"한다는 서술을 추가로 확보했는데, 이는 WebSearch로 확인되는 ***NVIDIA Cosmos Curator/NeMo Curator***(CPU 중심 단계(분할·필터링·전사)와 GPU 중심 단계(임베딩·분류)를 분리하는 실제 설계)와 정확히 일치해 신빙성이 높다. 다만 ***이 정확한 제목의 AWS 블로그 글 자체는 WebSearch로 독립 확인하지 못했다*** — 유사한 OSMO·Cosmos 관련 AWS 블로그들만 검색됐다. AWS 자체 발행 글이라는 벤더 이해관계도 감안해야 한다.

## 한 줄 요약

**AWS가 GPU 없이 Amazon EKS의 CPU 노드만으로 NVIDIA Cosmos Curator 기반 Physical AI 영상 큐레이션 파이프라인(분할·필터링·임베딩)을 구축하고, 캡션 생성만 Amazon Bedrock에 위임해 비용을 최적화했다는 글로 보이며, 구체 기술 스택은 업계 실제 도구와 일치하지만 이 블로그 글 원문 자체는 독립 확인하지 못했다.**

## 핵심 포인트

- **CPU-GPU 단계 분리는 실제 설계와 일치** — Cosmos Curator의 공식 아키텍처 자체가 ***CPU 집약적 단계(분할·필터링·전사)와 GPU 집약적 단계(임베딩·분류)를 분리***해 비용을 최적화하는 구조라, 이 글의 "GPU 없이 CPU 노드로 영상 큐레이션"이라는 서술과 정확히 맞아떨어진다.
- **캡션 생성은 Bedrock에 위임** — 무거운 비전-언어 모델 추론을 자체 GPU 클러스터 대신 ***완전관리형 서비스(Bedrock)에 넘겨 인프라 운영 부담을 줄이는*** 패턴. CDK와 셸 스크립트로 인프라 배포부터 데이터 검색까지 자동화했다는 서술도 AWS 블로그의 일반적인 재현 가능 아키텍처 제시 방식과 일치.
- **"Physical AI"라는 용어 사용** — 로보틱스·자율주행 영상 데이터를 가리키는 이 용어는 NVIDIA가 주도적으로 쓰는 업계 용어로, Cosmos 생태계(NVIDIA)를 AWS 인프라(EKS, Bedrock) 위에 올린 조합 글로 읽힌다.
- **원문 특정 실패** — 정확히 이 제목의 AWS 공식 블로그 글을 WebSearch로 찾지 못해, Slack 봇 발췌 외의 독립적 제3자 인용은 확보하지 못했다.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함.)

## 댓글

hada 댓글 수 해당 없음(AWS 직접 발행, GeekNews 경유 아님). AWS 자체 블로그라는 ***벤더 이해관계***를 감안해야 하며, 비용 절감폭 등 구체 수치는 확인되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 "Physical AI" 주제의 짝이 되는 노트

[[2026-09-29-aws-sagemaker-greengrass-physical-ai-pipeline]]이 Physical AI ***학습 파이프라인***(SageMaker+Greengrass)을 다뤘다면, 이 글은 그 앞 단계인 ***데이터 큐레이션 파이프라인***을 다룬다. 같은 AWS 한국 블로그, 같은 "Physical AI" 키워드, 같은 출처 차단 패턴이 반복되는 두 글을 나란히 읽으면 AWS가 로보틱스·자율주행 고객을 위해 ***"수집→큐레이션→학습"*** 전체 파이프라인을 단계별로 블로그 시리즈처럼 공개하고 있다는 그림이 보인다.

### 적용점

"비싼 자원(GPU)은 꼭 필요한 단계에만 쓰고 나머지는 저렴한 자원(CPU)으로 분리한다"는 비용 최적화 원칙을, 사내 대용량 데이터 처리 파이프라인을 설계할 때 단계별 리소스 요구사항을 먼저 분석하는 습관으로 일반화할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 온다가 대용량 이미지(객실 사진, 리뷰 첨부 이미지 등)를 배치 처리할 일이 있다면, "GPU가 꼭 필요한 추론 단계와 CPU로 충분한 전처리 단계를 분리"하는 이 원칙은 ***야간 배치 비용 최적화***에 직접 참고할 만하다. 다만 CRS 자체는 영상 데이터를 다루지 않아 이 글의 구체 내용이 직접 적용되지는 않는다.

## 연관 자료

- [[2026-09-29-aws-sagemaker-greengrass-physical-ai-pipeline]] — 같은 "Physical AI" 주제의 선행 노트(학습 파이프라인), 이 글(큐레이션 파이프라인)과 앞뒤 단계로 짝을 이룸

## 한 달 뒤 회고

2026-12-25 즈음 — aws.amazon.com 접속이 가능해지면 원문에서 비용 절감폭과 구체 처리 규모를 확인.
