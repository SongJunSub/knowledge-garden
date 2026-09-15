---
title: "OpenArch — LLM 아키텍처를 모델별 한 파일로 구현한 PyTorch 코드 모음 (anuj0456) — Llama부터 Grok-2.5까지, 프로덕션 코드가 숨기는 설계 선택을 나란히 비교하려고 속도를 포기한다"
source_title: "OpenArch: PyTorch implementations of modern open-source LLM architectures"
source_url: "https://github.com/anuj0456/OpenArch"
source_name: "GitHub — anuj0456/OpenArch"
referrer_url: "https://news.hada.io/topic?id=33700"
published_at: "2026-09 (추정)"
summarized_at: "2026-09-15"
category: "ai"
tags: ["llm-architecture", "pytorch", "open-source", "education", "sebastian-raschka", "moe", "attention-variants", "from-scratch"]
---

# OpenArch — LLM 아키텍처를 모델별 한 파일로 구현한 PyTorch 코드 모음 (anuj0456)

> 출처: [OpenArch](https://github.com/anuj0456/OpenArch) (anuj0456, GitHub) · GeekNews(id=33700) 경유 · 정리일 2026-09-15

> **출처 한계**: `news.hada.io`는 이 세션에서 egress 전면 차단되어 hada 토픽 페이지·댓글을 직접 열람하지 못했다. 반면 `github.com`(raw README)은 직접 접근이 가능해, 프로젝트 설명·구현 모델 목록·구조는 원문을 직접 확인했다. HN 크로스포스팅([news.ycombinator.com/item?id=49693384](https://news.ycombinator.com/item?id=49693384))은 존재를 확인했으나 검색 시점마다 점수·댓글 수가 다르게 보고돼(약 111~134점, 25~31댓글) 정확한 최종 수치는 확정하지 못했다 — 집계가 계속 갱신되는 스냅샷 차이로 추정된다.

## 한 줄 요약
**OpenArch는 Llama·Qwen·DeepSeek·Gemma·GPT-OSS·Kimi·Grok-2.5 등 최신 오픈소스 LLM 아키텍처를, Sebastian Raschka의 "LLM Architecture Gallery"를 참고 삼아 모델별로 한 파일에 처음부터 다시 구현한 PyTorch 코드 모음이다. 목표는 프로덕션 속도가 아니라 ***읽기 쉬움*** — 어텐션 변형(MHA/GQA/MQA/MLA/슬라이딩 윈도우), 정규화 방식(pre-norm/post-norm/RMSNorm/QK-Norm), 위치 인코딩(RoPE/YaRN), 디코더 방식(dense vs sparse MoE) 같은 설계 선택을 모델마다 나란히 비교할 수 있게 만들었다.**

## 핵심 포인트
- **동기** — 최신 모델들이 근본 구성요소는 공유하면서도 핵심 아키텍처 선택에서 갈라지는데, 프로덕션 코드베이스는 ***속도·호환성 최적화가 우선이라 그 선택이 무엇인지 읽어내기 어렵다***는 문제의식에서 출발.
- **구조** — text/multimodal/image 세 모달리티로 폴더를 나누고, 각 모델 폴더마다 `model.py`와 아키텍처 선택·참고자료를 설명하는 짧은 README를 둔다.
- **구현 현황** — 텍스트 16종(GPT-2 XL, Llama 2/3, OLMo 2, DeepSeek R1, Gemma 3, Mistral 3, Llama 4 Maverick, Qwen 3(4B·30B-A3B), Kimi K2, GLM 4.5, GPT-OSS, Grok-2.5 등), 멀티모달 2종(PaliGemma 완료, Qwen3-Vision 진행중), 이미지 1종(DALL-E 진행중) — Architecture Gallery 전체 ***72종 구현***을 목표로 진행중.
- **참고자료 명시** — Sebastian Raschka의 LLM Architecture Gallery, Machine Learning Mastery 자료를 근거로 직접 밝힘.
- **라이선스** — Apache 2.0(개별 모델 폴더는 원 라이선스도 존중), 미구현 아키텍처에 대한 기여를 적극적으로 환영.

## 인상 깊은 문장
> "Python implementations of modern open-source LLM architectures — written from scratch, one model at a time." (README, 직접 확인)

## 댓글
`news.hada.io` 전면 차단으로 hada 댓글 수는 확인 불가. **HN 크로스포스팅 확인** — [OpenArch – PyTorch implementations of modern LLM architectures](https://news.ycombinator.com/item?id=49693384), 검색 시점마다 다른 스냅샷(약 111~134점, 25~31댓글)이 나와 정확한 최종 수치는 확정하지 못했다. GitHub README는 직접 열람해 구현 모델 목록·프로젝트 구조·라이선스는 신뢰할 만하지만, ***코드 자체의 정확성(원 모델 출력과의 수치 대조, 테스트 커버리지)까지는 검증하지 못했다*** — "읽기 쉬움"이 목표라는 저자 주장과 실제 정확도가 일치하는지는 별개 문제로 남는다. 단일 기여자(anuj0456) 중심 프로젝트로 보이며, 조직·기업 배경은 확인되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — OpenArch가 직접 인용한 그 원전을 이 가든이 이미 정리해 두었다
[[2026-05-20-sebastian-raschka-llm-architecture-trends]]는 Raschka가 "2026년 아키텍처 트렌드"(KV 공유, mHC, 압축 어텐션)를 산문으로 정리한 노트다. OpenArch는 그 산문을 ***실행 가능한 코드***로 옮겨, "설명"과 "구현"이 짝을 이루게 만든 셈이다 — Raschka의 갤러리가 지도라면 OpenArch는 그 지도를 따라 실제로 걸어본 기록이다.

### 핵심 전이 2 — "처음부터 다시 구현해서 배운다"는 같은 철학, 다른 스케일
[[2026-05-07-llm-from-scratch-workshop]]도 같은 "처음부터 다시 구현해서 이해한다"는 철학이지만 스케일이 다르다. 그 워크숍은 1시간·~10M 파라미터 교육용 GPT 하나를 다뤘고, OpenArch는 72종의 실제 프로덕션급 아키텍처를 같은 철학으로 재구현하려는 훨씬 큰 프로젝트다. 같은 원칙이 "입문용 한 개"에서 "산업 전체를 훑는 참조 라이브러리"로 확장된 사례로 나란히 읽을 수 있다.

### 핵심 전이 3 — "이해를 위한 재구현"이 텍스트를 넘어 멀티모달로도 이어진다
[[2026-08-26-vision-transformer-implementation]]에서 다룬 ViT 구현도 "프로덕션 코드가 아니라 이해를 위한 재구현"이라는 같은 계열이었다. OpenArch의 멀티모달 폴더(PaliGemma 완료, Qwen3-Vision 진행중)는 그 계열이 텍스트 전용을 넘어 비전-언어 모델까지 확장되고 있다는 걸 보여주는 최신 사례다.

## 호스피탈리티 / CRS 적용 포인트
온다는 LLM을 직접 학습·서빙하지 않으므로 ***직접 적용은 멀다***. 다만 전이 가능한 아이디어: "프로덕션 코드는 속도·호환성 최적화 탓에 설계 의도를 숨긴다"는 이 프로젝트의 문제의식은, CRS 코드베이스에서도 "왜 이 요금 계산 로직이 지금 이 모양으로 짜였는지"를 신규 팀원이 프로덕션 코드만 보고는 읽어내기 어려운 문제와 같은 형태다 — 핵심 도메인 로직(요금 계산, 오버부킹 규칙 등)을 프로덕션 구현과 별개로 "읽기 쉬운 참조 구현"으로 한 번 더 남겨두면, 신규 인력 온보딩과 설계 의도 전달에 유용할 수 있다는 원칙 정도로 축소 적용 가능하다.

## 연관 자료
- [[2026-05-20-sebastian-raschka-llm-architecture-trends]] — OpenArch가 직접 근거로 명시한 Architecture Gallery의 저자 노트
- [[2026-05-07-llm-from-scratch-workshop]] — 같은 "처음부터 다시 구현해 배운다"는 철학의 소규모 선례
- [[2026-08-26-vision-transformer-implementation]] — 같은 "이해를 위한 재구현" 계열이 멀티모달로 이어진 사례

## 한 달 뒤 회고
*(2026-10-15 즈음 — OpenArch가 72종 목표 중 실제로 얼마나 채웠는지, 코드 정확성 검증(테스트·원 모델 출력 대조) 여부가 추가됐는지, 이 가든에서 특정 아키텍처를 이해할 때 실제로 참조한 적이 있는지 점검.)*
