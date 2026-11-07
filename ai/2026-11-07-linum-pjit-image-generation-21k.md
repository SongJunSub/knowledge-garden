---
title: "약 2만 달러로 학습한 이미지 생성 모델 P-JiT, 코드와 가중치 공개 (Linum) — 별도 VAE 없이 압축과 생성을 함께 학습해 더 저렴한 영상 생성 모델로 가는 디딤돌을 놓다"
source_title: "P-JiT (Pyramid-JiT) / A Text-to-Image Model Trained for $21K"
source_url: "https://huggingface.co/Linum-AI/pjit-21k"
source_name: "Linum AI (Hugging Face 모델 카드)"
referrer_url: "https://news.hada.io/topic?id=36694"
published_at: "확인 불가"
summarized_at: "2026-11-07"
category: "ai"
tags: ["image-generation", "diffusion", "linum", "open-weights", "apache-2.0", "efficient-training", "text-to-image"]
---

# 약 2만 달러로 학습한 이미지 생성 모델 P-JiT, 코드와 가중치 공개 (Linum)

> 출처: [P-JiT (Pyramid-JiT)](https://huggingface.co/Linum-AI/pjit-21k) (Linum AI · Hugging Face 모델 카드 · GeekNews) · 정리일 2026-11-07

## 한 줄 요약
**Linum이 GPU 비용 2만 1,038달러로 학습한 22억 파라미터 이미지 생성 모델 P-JiT를 Apache 2.0으로 공개했는데, 별도 VAE 없이 압축과 생성을 함께 학습하고 기존 Linum v2 대비 이미지 토큰 수를 4분의 1로 줄여 더 저렴한 영상 생성 모델을 위한 개념 검증 역할을 한다.**

## 핵심 포인트
- Linum이 ***GPU 비용 21,038달러로 학습한*** 이미지 생성 모델 P-JiT를 실험적으로 공개 — 더 저렴한 영상 생성 모델을 만들기 위한 개념 검증
- 코드와 가중치를 ***Apache 2.0으로 공개*** — 이미지 생성부는 약 22억 파라미터, 별도로 사전학습된 40억 파라미터 텍스트 인코더 사용
- ***별도 VAE 없이 압축과 생성을 함께 학습*** — 기존 Linum v2보다 이미지 토큰 수를 4분의 1로 줄여 연산 부담을 낮춤
- 초기 실험에서는 기존 모델보다 ***11배 적은 샘플로 수렴***했으며, 이번 공개 버전은 누적 약 6억 6,000만 샘플로 학습(Slack 발췌가 이 지점에서 절단됨)
- WebSearch 교차확인 결과 Hugging Face 카드는 이 체크포인트를 "***연구용 실험 아티팩트이지 프로덕션 모델이 아니다***"라고 명시 — 공개 자체가 성능 보증이 아니라는 뜻
- 관련 모델 카드·생성 스크립트는 ***Claude Code의 도움을 받아 작성***됐다고 명시되어 있다는 점도 WebSearch 결과에서 확인(Linum 측 요청에 따른 것)

## 인상 깊은 문장

> "GPU 비용 21,038달러로 학습한 이미지 생성 모델 P-JiT를 실험적으로 공개함." (Slack 발췌)

## 댓글

GeekNews 댓글 수는 `news.hada.io` 차단으로 확인 불가. Hugging Face 모델 카드(`huggingface.co`)도 이 세션에서 직접 열람은 차단됐지만, WebSearch로 `Linum-AI/pjit-21k`, `Linum-AI/pyramid-jit`, `Linum-AI/jit-ddt` 등 실제 Hugging Face 저장소 존재와 라이선스(Apache-2.0)를 교차확인했다. 다만 "11배 적은 샘플로 수렴", "누적 6억 6천만 샘플" 등 Slack이 절단한 구체 수치는 WebSearch 요약에서 재확인하지 못했고 Slack 발췌만을 근거로 남긴다 — 수치 신뢰도는 중간 정도로 본다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-06-openai-images-2-6-gif-svg]]와 반대 방향의 "공개 vs 비공개" 경쟁
어제 정리한 OpenAI Images 2.6이 비공개 API로 입력·출력 범위를 넓히는 경쟁이라면, Linum의 P-JiT는 정반대로 "학습 비용과 코드·가중치를 전부 공개해 커뮤니티가 검증하고 재현하게 하는" 경쟁이다. 같은 이미지 생성 모델 레이스 안에서 공개형과 폐쇄형 전략이 동시에 진행 중이라는 걸 나란히 보여준다.

### 핵심 전이 2 — "압축과 생성을 함께 학습"은 아키텍처 단순화를 통한 비용 절감의 반복되는 패턴
별도 VAE를 없애는 설계는 [[2026-09-22-diffusion-language-model-how-to-build]]가 다룬 "파이프라인 단계를 줄여 학습·추론 비용을 낮추는" 흐름과 같은 방향이다. 모델 성능 경쟁만큼이나 "몇 단계로 쪼개느냐"가 비용 경쟁력을 가른다는 걸 다시 보여주는 사례.

## 호스피탈리티 / CRS 적용 포인트

적용은 멀다. 온다의 CRS/PMS 도메인에는 이미지 생성 모델 자체를 학습할 유스케이스가 없다. 다만 "연구용 실험 아티팩트"라고 스스로 명시한 공개 모델을 프로덕션에 바로 쓰지 않는 태도(검증 없는 공개 = 보증 아님)는 외부 AI 벤더 도구를 사내에 들일 때 참고할 일반 원칙 정도로만 남긴다.

## 연관 자료
- [[2026-11-06-openai-images-2-6-gif-svg]] — 같은 이미지 생성 모델 경쟁의 반대 전략(폐쇄형 API 확장) 비교
- [[2026-09-22-diffusion-language-model-how-to-build]] — 파이프라인 단순화를 통한 비용 절감이라는 같은 방향의 설계 원칙

## 한 달 뒤 회고
- 2026-12-07 즈음 점검: P-JiT 기반 "더 저렴한 영상 생성 모델"이 실제로 출시됐는지, 공개 가중치의 커뮤니티 파인튜닝 사례가 나왔는지 확인.
