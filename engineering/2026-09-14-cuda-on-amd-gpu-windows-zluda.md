---
title: "Windows에서 AMD GPU로 CUDA 실행하기 (Speedstu, ZLUDA) — 비공개 DLL 없이 공식 배포물만으로 RX 9060 XT에서 CUDA용 LibTorch 강화학습을 완주했지만, 검증된 GPU는 단 하나뿐이다"
source_title: "CUDA-for-AMD-Windows: Run CUDA-targeted Windows applications on AMD GPUs with ZLUDA + ROCm/HIP"
source_url: "https://github.com/Speedstu/CUDA-for-AMD-Windows"
source_name: "GitHub (Speedstu)"
referrer_url: "https://news.hada.io/topic?id=33649"
summarized_at: "2026-09-14"
category: "engineering"
tags: ["zluda", "cuda", "amd", "rocm", "gpu", "windows", "libtorch", "vendor-lock-in"]
---

# Windows에서 AMD GPU로 CUDA 실행하기 (Speedstu, ZLUDA) — 비공개 DLL 없이 공식 배포물만으로 RX 9060 XT에서 CUDA용 LibTorch 강화학습을 완주했지만, 검증된 GPU는 단 하나뿐이다

> 출처: [CUDA-for-AMD-Windows](https://github.com/Speedstu/CUDA-for-AMD-Windows) (Speedstu, GitHub) · 정리일 2026-09-14

## 한 줄 요약

**ZLUDA와 AMD HIP/ROCm을 조합해 NVIDIA CUDA 전용 Windows 프로그램을 AMD GPU에서 수정 없이 실행하는 프로젝트. 비공개 DLL 없이 공식 배포물만으로 RX 9060 XT 위에서 CUDA용 LibTorch 강화학습 모델의 학습·추론을 실제로 완주했지만, 완전한 CUDA 구현은 아니며 지금 검증된 GPU는 단 하나뿐이다.**

## 핵심 포인트

- 동작 원리: CUDA 애플리케이션 → ***ZLUDA가 CUDA 호출을 가로채 cuBLAS·cuSPARSE·cuFFT 호환 계층을 거쳐 rocBLAS·hipBLASLt·rocSPARSE·HIP로 재전달*** → AMD GPU. CUDA 바이너리는 수정 없이 그대로 실행되고, 자신이 AMD 위에서 돌고 있다는 사실 자체를 알지 못한다.
- 설치·진단·실행을 PowerShell 스크립트로 자동화: GPU·드라이버 확인 → HIP SDK·ZLUDA 다운로드 → 대상 프로그램에 호환 DLL과 실행 경로 설정까지 세 단계로 압축했다.
- 검증 사례: ***2026-09-13, Radeon RX 9060 XT(gfx1200)에서 약 220만 파라미터 규모의 PyTorch 강화학습(PPO) 네트워크의 학습·추론을 cuDNN 없이 완주*** — GEMM 위주의 LibTorch 학습은 cuDNN 의존 없이도 가능함을 보여준 실제 사례다.
- 재현성: 스크립트·문서는 MIT 라이선스이고 ZLUDA·ROCm·CUDA·LibTorch는 각자 상위 라이선스를 유지한다 — ***비공개 DLL 없이 공식 배포물만으로 재현 가능***하다는 점이 이 프로젝트의 핵심 주장이다.
- 한계가 명확하다: 검증된 GPU는 RX 9060 XT뿐이고 다른 AMD GPU는 "후보"로만 표시되어 자동 감지에 의존한다. Windows에서는 cuDNN·MIOpen이 안정된 HIP SDK 경로에서 아예 제공되지 않아 대부분의 프로덕션 신경망 아키텍처가 막힌다. NCCL·TensorRT·일부 커스텀 CUDA 확장·비표준 PTX 동작도 실패할 수 있다.
- 법적 긴장: NVIDIA는 CUDA 기반 소프트웨어에 번역 계층(translation layer)을 쓰는 것을 약관 위반으로 명시하고 있고, 원조 ZLUDA 프로젝트(vosen/ZLUDA)는 과거 AMD의 요청으로 코드가 내려간 이력이 있다 — Speedstu의 이 래퍼도 같은 법적 긴장 위에 서 있다.

## 인상 깊은 문장

> "ZLUDA는 애플리케이션이 하는 CUDA 호출을 가로채 AMD의 HIP/ROCm 런타임으로 대신 보낸다. CUDA 바이너리는 수정 없이 실행되고, 자신이 AMD GPU 위에 있다는 것을 결코 알지 못한다." — 프로젝트 README 취지를 옮긴 것(WebFetch로 직접 확인한 GitHub README 기반, 문구는 요약 번역).

## 댓글

**hada 세션 차단, GitHub README는 WebFetch로 직접 확인.** `news.hada.io`는 egress 프록시에서 도메인 단위로 차단됐지만, `github.com`은 접속이 가능해 프로젝트 README·아키텍처 문서를 1차 자료로 직접 읽었다. WebSearch로는 이 프로젝트를 다루는 HN 스레드("CUDA for AMD on Windows", item id `49684356`)의 존재까지는 확인했지만, `news.ycombinator.com` 자체가 이 세션에서 접속 차단되어 있어 실제 포인트·댓글 수·논의 내용은 확인하지 못했다 — 검색 결과 요약에 구체적 점수·댓글 수가 언급된 경우가 있었으나 1차 자료로 대조할 수 없어 이 노트에는 신뢰도 낮은 수치로 판단해 싣지 않았다. 검증이 GPU 한 종류(RX 9060 XT)에서만 이뤄진 n=1 사례라는 점, 그리고 원조 ZLUDA가 AMD의 공식 지원 철회 후 "주말 취미 프로젝트"로 축소됐다는 배경(별도 WebSearch로 교차 확인)을 감안하면, 이 래퍼 자체의 장기 유지보수 지속성도 불확실하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "하드웨어보다 소프트웨어 생태계가 과제"라는 진단이 메우려는 바로 그 틈

[[2026-07-05-amd-mi355x-dollar-performance]]는 AMD 하드웨어가 NVIDIA 대비 달러당 훨씬 저렴한데도 ***"하드웨어보다 소프트웨어 생태계가 진짜 과제"***라고 결론지었다. ZLUDA는 정확히 그 소프트웨어 격차를 유저 레벨에서 억지로 메우는 임시방편이다 — 하드웨어 가격 우위가 있어도 소프트웨어 이식성이 없으면 무용지물이라는 그 노트의 주장을, 이 프로젝트는 "그래도 어떻게든 메워보려는 시도"로 실증한다.

### 핵심 전이 2 — "번역 계층"이 원본과 동일하다는 보장은 없다

[[2026-08-24-local-llm-feels-dumber-than-benchmarks]]는 "같은 가중치라도 어텐션 백엔드·KV 캐시 양자화가 다르면 긴 문맥 후반부에서 다른 토큰을 고르고, 그 차이가 도구 호출 실패로 번진다"고 했다. ZLUDA도 번역 계층인 이상 cuDNN 부재·PTX 미지원 등으로 원본 CUDA 실행과 100% 동일한 수치·거동을 보장하지 못할 가능성이 있다 — ***"포팅됐다"와 "동일하게 작동한다"는 다른 주장***이라는 게 두 글에 공통된 경계선이다.

### 핵심 전이 3 (거울상) — 종속을 만드는 힘과 우회하려는 힘이 스택 위아래에서 동시에 작동한다

[[2026-08-02-session-portability-inference-api-lockin]]은 추론 API가 대화 세션·운영 상태를 사실상 인질로 잡아 "새로운 종속"을 만든다고 경고했다. 이 프로젝트는 정반대 방향 — 하드웨어 벤더 종속(CUDA→NVIDIA)을 소프트웨어 번역 계층으로 우회하려는 시도다. ***AI 인프라 스택은 위(추론 API)에서는 새 종속이 생기고, 아래(GPU 런타임)에서는 기존 종속을 우회하려는 힘이 동시에 작동***하고 있다는 게 흥미로운 대구다.

## 호스피탈리티 / CRS 적용 포인트

솔직히 직접 적용은 멀다. 온다의 CRS/호스피탈리티 워크로드는 GPU 추론 인프라를 직접 운영하지 않고 대개 관리형 API·클라우드 추론을 쓰기 때문에, ZLUDA류의 하드웨어 번역 계층 기술이 당장 쓰일 자리는 없다. 다만 전이 가능한 원칙은 하나 남는다 — ***벤더가 공식 지원하지 않는 조합이라도 번역·호환 계층으로 비용을 크게 낮출 수 있는지는 항상 확인해볼 가치가 있다***는 태도. 예를 들어 특정 PMS·채널매니저 연동에서 공식 커넥터가 비싸거나 아예 없을 때, 비공식 어댑터 계층으로 우회할 수 있는지 검토하는 습관 정도가 이 글에서 가져올 수 있는 전부다.

## 연관 자료

- [[2026-07-05-amd-mi355x-dollar-performance]] — "하드웨어보다 소프트웨어 생태계가 과제"라는 진단이 메우려는 바로 그 틈
- [[2026-08-24-local-llm-feels-dumber-than-benchmarks]] — 번역/백엔드 계층이 원본과 동일한 거동을 보장하지 않는다는 같은 경계선
- [[2026-08-02-session-portability-inference-api-lockin]] — 종속을 만드는 힘 vs 우회하려는 힘, 스택 위아래의 거울상

## 한 달 뒤 회고

*(2026-10-14 즈음 — 이 프로젝트의 검증 GPU 목록이 RX 9060 XT 이외로 늘었는지, 원조 ZLUDA(vosen)·AMD·NVIDIA 사이의 법적 긴장에 새 소식이 있었는지 확인.)*
