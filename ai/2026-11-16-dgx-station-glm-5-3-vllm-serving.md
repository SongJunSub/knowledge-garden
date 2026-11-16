---
title: "DGX Station 2대에서 vLLM으로 GLM-5.3 로컬 서빙하기 — 464GB 체크포인트를 CPU 오프로딩 없이 GPU에만"
source_title: "확인 불가 (hada 접속 차단, 정확히 일치하는 원문 미확인)"
source_url: "https://www.storagereview.com/review/dgx-station-gb300-cluster-two-towers-two-400g-dacs (가장 근접한 교차확인 자료, 완전 일치 아님)"
source_name: "GeekNews 경유 + StorageReview 교차확인"
referrer_url: "https://news.hada.io/topic?id=37221"
published_at: "2026 (StorageReview 테스트 기준 추정)"
summarized_at: "2026-11-16"
category: "ai"
tags: ["vllm", "glm-5.3", "dgx-station", "nvfp4", "local-llm", "tensor-parallel", "rdma"]
---

# DGX Station 2대에서 vLLM으로 GLM-5.3 로컬 서빙하기

> 출처: 원문 미확인, StorageReview 유사 구성 테스트로 교차확인 (GeekNews 경유, id=37221) · 정리일 2026-11-16

## 한 줄 요약
**464GB GLM-5.3 NVFP4 체크포인트를 DGX Station 2대에 텐서 병렬(TP=2)로 나눠 올려, CPU 오프로딩 없이 단일 OpenAI 호환 API로 서빙하는 로컬 인프라 구성기.**

## 핵심 포인트
- GLM-5.3 NVFP4의 약 464GB 체크포인트를 두 대의 DGX Station(GB300) GPU에 나눠 올리고, ***CPU 가중치 오프로딩 없이*** 하나의 OpenAI 호환 API로 서빙한다.
- ***텐서 병렬화(TP=2)***로 두 GPU가 가중치와 연산을 분담하며, 모든 요청의 토큰 생성 과정에서 ***ConnectX-8 RDMA 연결로 부분 결과를 교환***한다 — WebSearch로 확인한 유사 구성(StorageReview의 2-스테이션 클러스터)에서는 GPUDirect RDMA가 레일당 392Gb/s, 8바이트 RDMA write 평균 1.46µs를 기록했다.
- ***다중 토큰 예측(MTP)***으로 단계당 토큰 4개를 미리 생성·검증하고, FP8 KV 캐시와 프리픽스 캐싱으로 캐시 메모리와 반복 프롬프트 처리 부담을 줄인다.
- SPEED-Bench Coding에서 동시 요청 16개일 때 처리량이 크게 향상된다는 수치가 Slack 발췌에 있으나 구체 숫자는 끊겨 확인 불가.

## 인상 깊은 문장
> "텐서 병렬화(TP=2)로 두 GB300 GPU가 가중치와 연산을 분담하며, 모든 요청의 토큰 생성 과정에서 ConnectX-8 RDMA 연결로 부분 결과를 교환함" — Slack 발췌 (원문 직접 인용 아님)

## 댓글
hada 원문은 이 세션에서 **접속 차단**이라 정확한 저자·매체를 확인하지 못했다. WebSearch로 "DGX Station GLM-5.3 vLLM"을 찾았을 때 정확히 일치하는 블로그는 없었고, 대신 (1) NVIDIA 공식 vLLM 서빙 플레이북(Qwen3-235B 예시, GLM-5.3은 목록에 없었음), (2) Petronella Technology의 단일 DGX Station GB300(TP=1) 서빙 가이드, (3) StorageReview의 2-스테이션 RDMA 클러스터 벤치마크(GLM-5.2/5.3/MiniMax-M3 혼합 테스트, "27배 향상" 주장이지만 벤더/리뷰어 자체 테스트라 독립 검증 아님)를 확인했다. **즉 이 노트의 수치(392Gb/s, 1.46µs 등)는 원문이 아니라 유사 구성의 제3자 벤치마크에서 가져온 참고치**이며, 원문이 실제로 보도한 숫자와 다를 수 있다. 하나의 벤더 리뷰에만 의존했다는 n=1 한계도 명시.

## 내 생각 · 적용점
로컬 AI 시리즈([[2026-05-12-rapid-mlx-apple-silicon-local-ai]], [[2026-05-12-running-local-models-on-m4-24gb]], [[2026-06-08-glm-5-2-local-run]])가 "개인 워크스테이션 한 대에서 어디까지 가능한가"를 다뤘다면, 이 글은 **그 다음 단계 — 멀티 노드로 확장했을 때 네트워크(RDMA)가 새로운 병목·새로운 최적화 축이 된다**는 걸 보여준다. GLM-5.2 로컬 실행 노트에서 짚었던 "기술적 가능 ≠ 경제적 효율"이 여기서도 유효하다: 2대의 DGX Station + ConnectX-8 스위치 구성 비용은 결코 작지 않다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다 — 온다 CRS가 464GB급 로컬 LLM을 멀티 GPU로 서빙할 유스케이스는 현재 없다. 전이 가능한 원칙: **"텐서 병렬 + 고속 인터커넥트"는 결국 상태를 여러 노드에 쪼갤 때의 일반 패턴**이며, CRS가 멀티 리전·멀티 테넌트 데이터를 분산 처리할 때 "노드 간 교환 비용이 최종 처리량을 좌우한다"는 교훈만 참고할 수 있다.

## 연관 자료
- [[2026-06-08-glm-5-2-local-run]] — 같은 Z.ai GLM 계열의 직전 세대, "기술적 가능 vs 경제적 효율" 프레임의 원전
- [[2026-05-12-rapid-mlx-apple-silicon-local-ai]] — 로컬 AI 3부작 중 "초고속 단일 머신" 축, 이 글의 "멀티 노드" 축과 대조
- [[2026-05-12-running-local-models-on-m4-24gb]] — 로컬 AI 실측의 다른 극단(24GB 단일 머신)

## 한 달 뒤 회고
2026-12-16 즈음: hada 접속 재확인 가능해지면 원문 교차검증. GLM-5.3 NVFP4 vLLM 공식 레시피(recipes.vllm.ai)가 Station급 TP=2 구성을 지원하는지 후속 확인.
