---
title: "openTPU (FeSens) - AI가 설계부터 ISA·시뮬레이터·컴파일러까지 짜고, 그 출력이 실제 FPGA와 토큰 단위로 비트 일치한다"
source_title: "openTPU: An open-source AI accelerator, developed by AI"
source_url: "https://github.com/FeSens/openTPU"
source_name: "GitHub (FeSens/openTPU)"
referrer_url: "https://news.hada.io/topic?id=34903"
published_at: "확인 불가"
summarized_at: "2026-10-07"
category: "ai"
tags: ["ai-chip-design", "fpga", "open-source-hardware", "inference-hardware", "quantization", "moe-offload", "systemverilog"]
---

# openTPU (FeSens)

> 출처: [openTPU: An open-source AI accelerator, developed by AI](https://github.com/FeSens/openTPU) (GitHub README 직접 확보) · 정리일 2026-10-07

> **출처 한계**: news.hada.io 원문은 egress 차단으로 접근하지 못했지만, GitHub 저장소 README는 직접 확보(1차 출처)했다. 다만 README 자체는 "AI가 설계했다"는 슬로건과 저장소명 외에 어떤 AI 에이전트가, 어떤 과정으로 설계했는지 구체적 근거를 제시하지 않는다. hada 댓글 수·HN 큐레이션 유무는 확인 불가.

## 한 줄 요약

**"AI가 만든 오픈소스 AI 가속기"라는 openTPU는 하드웨어 설계(SystemVerilog)부터 ISA·시뮬레이터·컴파일러·호스트 소프트웨어까지 한 저장소에 담고, 실제 FPGA 카드의 출력이 시뮬레이터와 토큰 단위로 비트 일치하는 것을 검증 기준으로 못박았다.**

## 핵심 포인트

- 단일 모노레포에 하드웨어 설계(SystemVerilog RTL), ISA(명령어 집합), Python 기반 비트 정확도 시뮬레이터, 커널 언어(ol)와 컴파일러, 호스트 소프트웨어(otpu-chat·otpu-smi·otpu-lens)까지 전부 들어 있다.
- 실제 가중치를 쓰는 모델 10종(LFM2.5-230M, Qwen3-0.6B, Qwen3.5-0.8B, LFM2-2.6B, SmolLM3-3B, Phi-4-mini, Qwen3.5-2B, Qwen3.5-4B, Gemma 4 E2B, Gemma 4 E4B)을 Xilinx Kintex-7 xc7k480t 기반 FPGA 카드(Inspur YPCB-00338, DDR3 2채널)에서 실행하고, ***카드의 출력이 시뮬레이터와 토큰 단위로 비트 일치***한다는 걸 핵심 검증 기준으로 세웠다.
- 호스트 처리 시간을 포함해 LFM2.5-230M은 초당 82.1토큰(4비트), Qwen3-0.6B는 초당 30.7토큰(4비트)을 생성한다. int8 대비 ***4비트 양자화(FP4, 2단계 블록 스케일, 가중치당 4.25비트)***로 디코딩 속도가 40~45% 빨라졌다.
- 카드의 4GiB 메모리보다 큰 MoE 모델(LFM2.5-8B-A1B, Qwen3.5-35B-A3B)도 필요한 전문가 가중치만 호스트에서 스트리밍해 실행하는데, 당연히 속도는 떨어져 10.6tok/s, 3.95tok/s 수준이다.
- Apache-2.0 라이선스로 공개됐고, 확인 시점 기준 344개 스타·19개 포크를 모았다. DRAM 대역폭 활용률이 디코딩 시 82~94%에 달해 메모리 대역폭을 거의 끝까지 끌어쓰는 설계라는 점도 눈에 띈다.

## 인상 깊은 문장

> "An open-source AI accelerator, developed by AI: RTL, ISA, simulator, compiler and profiler in one repo." (GitHub 저장소 설명, 원문 그대로)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다. "AI가 설계했다"는 주장 자체는 저장소 설명문 수준에서만 확인됐고, 설계 과정에 대한 제3자 검증·감사는 찾지 못했다 - 이 노트의 가장 큰 정직성 한계다.

## 내 생각 · 적용점

### 핵심 전이 1 - OpenAI Jalapeño와 "AI가 자기 추론용 칩을 설계한다"는 같은 흐름

[[2026-08-26-openai-jalapeno-asic]]와 [[2026-09-20-openai-jalapeno-llm-chip-design-process]]는 OpenAI가 자체 LLM으로 Broadcom과 함께 추론 전용 ASIC(Jalapeño)의 프론트엔드 설계를 맡긴 사례였다. openTPU는 그 축소판을 ***완전히 공개된 형태***로, 그것도 개인/소규모 팀 수준에서 FPGA로 실제 구현했다는 점이 다르다. 상업 ASIC 한 개 회사의 비공개 프로젝트와, 오픈소스 리포 하나로 전체를 공개하는 접근의 대비가 선명하다.

### 핵심 전이 2 - "GPU로 만든 모델이 GPU보다 좋은 칩을 만든다"는 역설의 작은 증거

[[2026-09-08-hyperaccel-llm-inference-chip-jalapeno]]는 "GPU로 학습한 모델이 GPU보다 좋은 칩을 설계한다"는 역설을 제목으로 내걸었다. openTPU는 그 역설을 검증 가능한 형태(시뮬레이터-실물 비트 일치)로 가장 작은 스케일에서 보여주는 사례로 볼 수 있다. 다만 "AI가 설계했다"는 주장의 구체적 근거가 약하다는 점에서, 전이는 조심스럽게 다뤄야 한다.

### 핵심 전이 3 - 추론 하드웨어의 병목이 메모리 대역폭으로 이동한다는 진단과 맞물림

[[2026-09-17-inference-hardware-revolution-2026]]는 "병목이 연산에서 메모리 대역폭으로 옮겨가며 칩 설계 문법 자체가 바뀌고 있다"고 진단했다. openTPU가 DRAM 대역폭을 82~94%까지 끌어쓰고, MoE 모델은 호스트 스토리지에서 전문가를 스트리밍해야 하는 상황이 바로 그 병목 이동을 가장 작은 FPGA 스케일에서 체감하게 해준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. CRS는 하드웨어 설계와 거리가 먼 B2B SaaS 영역이다. 다만 "시뮬레이터 출력과 실제 하드웨어 출력이 토큰 단위로 비트 일치해야 검증됐다고 본다"는 검증 철학은, CRS에서 "스테이징 환경 결과와 프로덕션 결과가 완전히 일치하는지"를 재현성 기준으로 삼는 테스트 설계에 원칙 수준으로만 참고할 수 있다.

## 연관 자료

- [[2026-08-26-openai-jalapeno-asic]] - OpenAI가 자체 LLM으로 추론 전용 ASIC을 설계한 상업 버전, openTPU의 공개판 대조 사례.
- [[2026-09-20-openai-jalapeno-llm-chip-design-process]] - Jalapeño의 설계 과정 상세, openTPU가 훨씬 작은 스케일에서 공개적으로 재현한 흐름.
- [[2026-09-08-hyperaccel-llm-inference-chip-jalapeno]] - "GPU로 만든 모델이 GPU보다 좋은 칩을 만든다"는 같은 역설을 다룬 선행 노트.
- [[2026-09-17-inference-hardware-revolution-2026]] - 추론 하드웨어 병목이 연산에서 메모리 대역폭으로 옮겨간다는 배경 진단.

## 한 달 뒤 회고

*(2026-11-07 즈음) "AI가 설계했다"는 주장에 대한 구체적 과정 공개(커밋 로그, 프롬프트, 설계 결정 기록 등)가 저장소에 추가됐는지, 그리고 스타 수·실사용 사례가 늘었는지 확인한다.*
