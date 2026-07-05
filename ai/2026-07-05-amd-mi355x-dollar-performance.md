---
title: "달러당 성능이 더 빠르고 저렴해지고 있음 (wafer.ai) — 'AMD MI355X가 NVIDIA B300 대비 2.75배 저렴', 하드웨어보다 소프트웨어 생태계가 진짜 과제"
source_title: "Dollar-per-Performance Is Getting Faster and Cheaper"
source_url: "https://www.wafer.ai/blog/glm52-amd"
source_name: "wafer.ai"
referrer_url: "https://news.hada.io/topic?id=31123"
summarized_at: "2026-07-05"
category: "ai"
tags: ["amd", "nvidia", "gpu-inference", "cost-optimization", "quantization", "sglang", "hardware-competition", "inference-infrastructure", "moe"]
---

# 달러당 성능이 더 빠르고 저렴해지고 있음 (wafer.ai) — 'AMD MI355X가 NVIDIA B300 대비 2.75배 저렴', 하드웨어보다 소프트웨어 생태계가 진짜 과제

> 출처: [Dollar-per-Performance Is Getting Faster and Cheaper](https://www.wafer.ai/blog/glm52-amd) (wafer.ai) · 정리일 2026-07-05

## 한 줄 요약

**AMD MI355X GPU가 NVIDIA B300 대비 약 2.75배 저렴하면서도 경쟁력 있는 추론 성능을 낸다. Wafer가 GLM-5.2를 AMD 하드웨어에서 최적화한 결과, 커스텀 커널 없이 프레임워크 버그 수정·양자화·speculative decode·MoE 커널 튜닝만으로 B200 대비 80% 성능에 2배 이상 저렴한 비용을 달성했다. AMD의 진짜 과제는 하드웨어가 아니라 소프트웨어 지원 생태계다.**

## 핵심 포인트

- **성능 측정 결과** — 집계 처리량(20k 입력/1k 출력, 60% 캐시 히트율): 최고 **2626 tok/s/node**, B200 대비 약 80% 성능에 **2배 이상 저렴**. 단일 스트림(10k 입력/1.5k 출력): **213 tok/s** — 리더보드 최고점은 아니지만 성능당 비용 우위.
- **기술적 최적화 과정**:
  1. **양자화**: bf16 모델을 AMD Quark의 MXFP4로 양자화 — FP8 대비 거의 무손실 정확도
  2. **추론 프레임워크**: sglang 선택 — vLLM·ATOM 대비 최고 성능·호환성
  3. **Speculative Decode 활성화**: 모듈명 불일치·CUDA 헤더 호환성 문제 해결 → 단일 스트림 처리량 **3배** 증가
  4. **MoE 커널 튜닝**: 집계 병목(prefill) 개선, TP8→TP4×DP2 구성 변경
- **핵심 평가** — "커스텀 커널 없이 프레임워크 버그 수정, 양자화, speculative decode, MoE 커널 선택 튜닝으로 나온 결과." AMD의 과제는 하드웨어 성능이 아니라 **소프트웨어 지원 생태계 구축**.

## 인상 깊은 문장

> "AMD의 과제는 하드웨어 성능보다 소프트웨어 지원 생태계 구축에 있다."

## 댓글 — HN 논점 전수 확인 (GN⁺ 큐레이션)

- **와트당 성능 지표 필요성**: AMD의 소프트웨어 지원·공급망 이점 함께 논의.
- **전력 소비 분석**: DGX B200 비용 대비 전력소비, 데이터센터 전력 공급 한도의 실질적 중요성.
- **채택 사례**: Meta·OpenAI 등이 이미 AMD 활용 중.
- **FP4 양자화 비판**: "사실상 무손실인 경우는 거의 없음" — 모델 기능성 절제 우려. MXFP6 양자화 대안 제안.
- **Wafer의 과거 서비스 중단 사례** 언급하며 구현 신뢰성 우려.
- **역사적 관점**: "달러당 성능"의 지수적 개선 추이 제시. NVIDIA Rubin 세대의 추론 최적화 가능성 의문.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-06-29-compute-adjusted-ltv]]의 "완전 부담 비용"에 하드웨어 선택이 직접 영향

CRS·PickMe가 자체 AI 인프라를 운영하는 시나리오라면, AMD vs NVIDIA 선택이 지난번 정리한 Compute-adjusted LTV 계산의 "추론 비용" 항목을 크게 바꾼다. **다만 이 글이 강조하듯, 저렴한 하드웨어도 소프트웨어 최적화 작업(양자화·프레임워크 튜닝) 비용을 함께 고려해야 진짜 비용이 나온다** — 하드웨어 비용만 보고 판단하면 안 된다는 경고.

### 핵심 전이 2 — "커스텀 커널 없이 기존 도구 조합만으로" 최적화한 것이 YAGNI 원칙과 일치

MoE 커널 튜닝·프레임워크 선택만으로 큰 성과를 낸 것은, [[2026-06-30-yagni-hidden-costs]]의 "검증된 도구 재발명 위험"과 정확히 반대되는 성공 사례다. **직접 커스텀 커널을 만들지 않고 기존 생태계(sglang, Quark) 조합을 최적화한 것이 AMD 진영에서도 검증된 전략.**

### 핵심 전이 3 — 벤더 락인 회피 관점에서 참고할 사례

[[2026-06-29-weekly-364]]에서 다룬 "규제 역설"과 유사하게, NVIDIA 단일 의존을 줄이려는 시도(AMD 대안 검증)는 향후 CRS가 AI 인프라를 직접 운영하게 될 경우 벤더 다변화 전략의 참고 사례가 된다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-29-compute-adjusted-ltv]] — *하드웨어 선택이 "완전 부담 비용" 계산에 미치는 영향*
- [[2026-06-30-yagni-hidden-costs]] — *커스텀 커널 대신 기존 도구 조합 최적화=검증된 전략*
- [[2026-06-29-weekly-364]] — *벤더 다변화가 규제·공급망 리스크 대응 전략이 되는 패턴*

## 한 달 뒤 회고
*(2026-08-05 즈음 — CRS·PickMe가 자체 AI 인프라를 검토하게 될 경우 AMD 대안을 실제로 비교했는지 기록.)*
