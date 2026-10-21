---
title: "Google, PyTorch 모델을 TPU에서 실행하는 TorchTPU 오픈소스 공개 (Google) — 언어를 바꾼 게 아니라 'cuda를 tpu로' 한 단어만 바꾸면 되는 다리를 놓았다"
source_title: "확인 불가 (GeekNews GN+ 요약 추정)"
source_url: "확인 불가"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=35728"
published_at: "확인 불가"
summarized_at: "2026-10-21"
category: "ai"
tags: ["torchtpu", "pytorch", "tpu", "google-cloud", "cuda", "vendor-lock-in", "ml-infra", "torch-compile"]
---

# Google, PyTorch 모델을 TPU에서 실행하는 TorchTPU 오픈소스 공개

> 출처: GeekNews 토픽 [id=35728](https://news.hada.io/topic?id=35728) (원문 매체 미특정) · 정리일 2026-10-21
>
> **출처 한계**: `news.hada.io`·`developers.googleblog.com`·`docs.cloud.google.com`·`huggingface.co`·`mistral.ai` 모두 이번 세션 egress 차단(`ENOTFOUND`)으로 직접 열지 못했다. WebSearch로 교차확인한 결과 TorchTPU는 ***실제로 존재하는 프로젝트***이고 Google Cloud 공식 문서가 "Meta의 PyTorch 팀과 co-develop한 오픈소스 PyTorch 네이티브 TPU 백엔드"로 설명한다는 점까지는 확인했다. 다만 2025년 12월 Reuters 보도는 "Google이 일부를 오픈소스화하는 걸 검토 중"이라는 더 신중한 톤이었던 반면, 더 최근(The Stack 등) 보도는 "공식 확정"으로 서술한다 — ***이 사이의 정확한 전환 시점과, 실제로 코드 전체가 공개됐는지 일부만 공개됐는지는 1차 자료를 직접 열지 못해 확정하지 못한다.*** Slack 발췌의 "데이터 병렬화와…"로 끊긴 부분, 그리고 "기본적인 이전은 장치를 `cuda`에서 `tpu`로 바꾸는 것부터 시작"이라는 서술은 WebSearch 교차확인(`torch_tpu` pip 패키지, `"tpu"` device string)과 방향이 일치한다.

## 한 줄 요약

**Google이 Meta의 PyTorch 팀과 함께 개발한 TorchTPU는, 기존 PyTorch 코드의 변경을 최소화하면서(device를 `cuda`에서 `tpu`로 바꾸는 정도) Cloud TPU에서 학습·추론을 돌릴 수 있게 하는 오픈소스 백엔드다 — GPU에서 익숙한 즉시 실행(eager) 방식을 유지하면서, `torch.compile()`로 연산을 묶고 캐싱해 반복 작업의 컴파일 비용을 줄인다.**

## 핵심 포인트

- **최소 변경 이전 — device 문자열 하나** — Slack 발췌와 WebSearch 교차확인이 공통으로 짚는 핵심: ***기본적인 이전은 장치를 `cuda`에서 `tpu`로 바꾸는 것부터 시작***한다. (WebSearch 교차확인) Google Cloud 문서는 `pip install torch_tpu`로 설치하고 `"tpu"` device string을 CUDA 대신 쓰는 구조라고 설명한다 — NVIDIA 생태계에 익숙한 PyTorch 개발자의 학습 비용을 의도적으로 낮춘 설계다.
- **즉시 실행(eager) 지원 + torch.compile 캐싱** — Slack 발췌는 ***"연산을 하나씩 실행하는 즉시 실행 모드를 지원"***하며, ***"torch.compile()로 연산을 묶어 최적화하고, 컴파일 결과를 캐시해 반복 작업의 비용을 줄인다"***고 설명한다. (WebSearch 교차확인) Google 개발자 블로그는 eager + fusion 모드가 Strict Eager 대비 50~100%+ 성능 향상을 보인다고 자체 보고했다 — 다만 이는 Google 자신의 벤치마크로, 제3자 재현은 확인하지 못했다.
- **지연-합산 실행 모드도 제공** — Slack 발췌는 ***"여러 연산을 지연시켰다가 합쳐 실행하는 모드"***도 언급한다. (WebSearch 교차확인) Google 블로그 설명에 따르면 Torch Dynamo로 그래프를 캡처한 뒤 Torch Inductor가 아니라 ***XLA를 주 컴파일러 백엔드***로 삼아 내린다 — PyTorch 표준 스택(Inductor)이 아니라 Google의 기존 TPU 컴파일러 인프라(XLA)를 그대로 재사용하는 선택이다.
- **에코시스템 연동** — (WebSearch 교차확인) Google Cloud 문서는 Hugging Face, vLLM, SGLang, TorchTitan, Ray 지원을 명시한다. Slack 발췌의 "데이터 병렬화와…"는 이 지점에서 끊겨, `torch.distributed` 연동의 구체적 구현(예: `tpu_dist`)까지는 Slack 발췌만으로 확정하지 못한다.

## 인상 깊은 문장

> "기본적인 이전은 장치를 `cuda`에서 `tpu`로 바꾸는 것부터 시작." (Slack 발췌 그대로)

## 댓글

GeekNews 댓글 수·HN/Lobsters 큐레이션 여부는 원문 차단으로 확인하지 못했다. 정직하게 짚을 점: (1) 이건 Google 자신이 발표한 벤더 서술이고, 성능 비교(TPU vs NVIDIA GPU, 실제 마이그레이션 난이도)는 전부 Google 쪽 수치다 — 독립적인 제3자 벤치마크는 이번 교차확인에서 찾지 못했다. (2) "변경을 최소화한다"는 주장과 "실제로 프로덕션급 모델이 코드 수정 없이 완전히 돌아간다"는 주장은 다르다 — NCCL 전용 커스텀 커널, 특정 CUDA 전용 확장을 쓰는 코드베이스라면 이 "최소 변경"이 그대로 성립하지 않을 가능성이 있는데, 이번 교차확인으로는 그 한계의 범위를 확인하지 못했다. (3) "오픈소스 공개"의 정확한 라이선스·공개 범위(전체 스택 vs 일부 컴포넌트)도 1차 자료 미확인으로 단정하지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 (거울상) — [[2026-09-14-cuda-on-amd-gpu-windows-zluda]]와 정반대 방향에서 같은 "CUDA 종속" 문제를 겨냥한다

ZLUDA 노트는 ***"CUDA 호출을 가로채 AMD의 HIP/ROCm 런타임으로 재전달"***해, NVIDIA가 공식 지원하지 않는 방식으로 CUDA 종속을 유저 레벨에서 우회하는 "비공식 번역 계층"이었다. TorchTPU는 정확히 같은 목표("CUDA에 묶인 PyTorch 코드를 다른 하드웨어에서 돌린다")를 ***벤더(Google) 공식 지원 + 상위 프레임워크(PyTorch) 레벨에서의 최소 변경 마이그레이션***으로 달성한다. 두 사례를 나란히 놓으면 "CUDA 종속을 우회하는 힘"이 (1) 공식 벤더가 디바이스 문자열 하나로 다리를 놓는 하이레벨 접근과 (2) 비공식 커뮤니티가 런타임을 가로채는 로우레벨 접근, 두 층위에서 동시에 작동하고 있다는 구도가 보인다 — ZLUDA 노트가 짚은 "원본과 100% 동일한 거동을 보장하지 못할 가능성"이라는 경계선은, TorchTPU에도 (강도는 약하지만) XLA라는 다른 컴파일러 백엔드를 쓰는 이상 완전히 사라지지 않을 것으로 추정된다.

### 핵심 전이 2 — [[2026-09-17-nvidia-cuda-rust-gpu-kernels]]가 짚은 "벤더별 대체 코드젠 백엔드로 기존 투자 상속"과 같은 패턴, 이번엔 Google 쪽

NVIDIA의 CUDA Rust 노트에서 짚은 핵심 전이는 ***"언어가 좋아져서가 아니라 기존 벤더 인프라에 다리를 놓아서 채택이 열린다"***는 것이었다(Microsoft의 `rustc_codegen_utc`가 MSVC 백엔드에, NVIDIA의 `cuda-oxide`가 PTX에 다리를 놓은 것처럼). TorchTPU는 같은 패턴을 Google이 자기 진영에서 실행한 버전이다 — PyTorch라는 "기존 투자"(코드베이스, 생태계, 개발자 숙련도)를 그대로 상속받게 하면서, 그 아래 실행 계층만 CUDA/GPU에서 XLA/TPU로 갈아끼운다. AI 인프라 스택 전반에서 "상위 프레임워크는 그대로 두고 하위 실행 백엔드를 벤더별로 복수화한다"는 전략이 반복적으로 관찰된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다의 CRS/호스피탈리티 워크로드는 자체 GPU·TPU 인프라를 운영하지 않고 관리형 추론 API를 쓰므로, TorchTPU 같은 하드웨어 백엔드 마이그레이션 기술이 당장 쓰일 자리는 없다. 다만 전이 가능한 원칙 하나는 남긴다 — ***"인프라를 교체할 때 상위 인터페이스(코드)의 변경을 최소화하도록 설계하면, 마이그레이션 비용이 실제 기술적 난이도보다 훨씬 작게 느껴진다"***는 설계 철학이다. CRS가 특정 PMS·채널매니저·결제 벤더를 교체해야 하는 상황에서도, 내부 어댑터 레이어를 잘 설계해 "벤더 이름 하나만 바꾸면 되는" 구조를 미리 갖춰두면 벤더 종속에서 벗어나는 전환 비용을 TorchTPU가 보여준 수준으로 낮출 수 있다는 정도의 일반화다.

## 연관 자료

- [[2026-09-14-cuda-on-amd-gpu-windows-zluda]] — 같은 "CUDA 종속 우회"를 비공식·로우레벨 번역 계층으로 시도한 거울상 사례
- [[2026-09-17-nvidia-cuda-rust-gpu-kernels]] — "벤더별 대체 코드젠 백엔드로 기존 투자를 상속받는다"는 같은 패턴을 NVIDIA 진영에서 보여준 선행 노트

## 한 달 뒤 회고

2026-11-21 즈음, TorchTPU의 정확한 공개 범위(전체 스택 vs 일부)와 라이선스를 1차 자료로 확인했는지, 독립적인 제3자 벤치마크(NVIDIA GPU 대비)가 나왔는지 점검.
