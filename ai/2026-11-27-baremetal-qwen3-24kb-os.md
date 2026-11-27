---
title: "베어메탈 Qwen - 순수 어셈블리 24KB OS에서 Qwen3-0.6B 실행 (GeekNews) — 모델 추론에 필요한 최소 단위가 OS 전체일 필요는 없다는 것을 극단적으로 보여준 프로젝트"
source_title: "Bare-metal Qwen - running Qwen3-0.6B on a 24KB pure-assembly OS"
source_url: "https://news.hada.io/topic?id=37891"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37891&utm_source=slack&utm_medium=bot&utm_campaign=T02M82VMZ"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "ai"
tags: ["local-llm", "qwen3", "bare-metal", "assembly", "edge-inference", "minimalism"]
---

# 베어메탈 Qwen - 순수 어셈블리 24KB OS에서 Qwen3-0.6B 실행 (GeekNews)

> 출처: [베어메탈 Qwen](https://news.hada.io/topic?id=37891) (GeekNews) · 정리일 2026-11-27

> **출처 한계**: `news.hada.io`가 egress 차단되어 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 이 정확한 프로젝트("24KB 순수 어셈블리로 Qwen3-0.6B를 부팅"하는 OS)를 특정하지 못했다 — 어셈블리 기반 x86-64 OS인 `BareMetal OS`는 실존을 확인했으나 LLM 포팅 여부는 확인되지 않았고, Qwen3-0.6B의 통상 GGUF 파일 크기(수백 MiB)와 "24KB"라는 수치의 관계(커널만의 크기인지)는 Slack 발췌로만 추정한다.

## 한 줄 요약

**Linux나 Windows 없이 C·Rust·libc조차 쓰지 않고 순수 어셈블리로 작성된, 커널 크기 24KB의 x86-64 OS가 614MiB 양자화 모델을 RAM에 올려 Qwen3-0.6B를 CPU로 직접 추론하는, 로컬 LLM 실행의 극단적 미니멀리즘 실험이다.**

## 핵심 포인트

- **부팅 가능한 x86-64 OS 자체를 직접 구현** — Linux나 Windows 없이 동작하며, ***C, Rust, libc를 전혀 쓰지 않은*** 순수 어셈블리 기반.
- **24KB는 커널만의 크기** — 모델을 제외한 ***커널 크기가 24KB***이며, 614MiB 크기의 별도 Q8 양자화 모델을 RAM에 올려 CPU로 추론한다는 구조 — 즉 "24KB OS에서 모델이 통째로 돈다"는 것이 아니라 "24KB짜리 극소 커널이 별도 로드된 모델을 구동하는 레이어" 라는 뜻으로 읽힌다.
- **74~94ms 콜드 부팅** — 부팅 후 바로 대화 가능하며, 턴 사이에 ***KV 캐시를 유지***해 이전 대화를 다시 계산하지 않는 다중 턴 채팅을 지원.
- **벤치마크 수치** — AMD EPYC 7642의 QEMU KVM 환경에서 16 vCPU로 ***초당 약 134.9토큰***을 기록. 1~32 vCPU 구간에서 기존 Linux용 어셈블리 구현과 생성 토큰·출력 바이트를 비교 검증했다는 서술.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함. Slack 발췌: "Qwen3-0.6B를 직접 실행하는 부팅 가능한 x86-64 OS로, Linux나 Windows 없이 동작하며 C, Rust, libc를 사용하지 않음")

## 댓글

GeekNews 댓글 수·반응 확인 불가(egress 차단). 극단적 미니멀리즘 프로젝트는 보통 "실용성보다 가능성 증명"이라는 평가를 받는 경향이 있는데, 이 글에 대한 실제 커뮤니티 반응은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 이번 주 반복되는 "로컬·엣지 LLM 압축" 축

[[2026-11-24-local-ai-guide-inkling-qwen-unsloth]], [[2026-11-25-nariq-qwen3-8-27b-ternary-quantization]], [[2026-11-25-ternary-bonsai-2-5-agentic-coding]]과 같은 축의 연장선이다. 다만 이 글은 "모델을 더 작게 압축한다"가 아니라 ***"모델을 구동하는 환경(OS·런타임) 자체를 극한까지 깎는다"***는 다른 차원의 미니멀리즘이다. 압축은 모델 쪽, 이 글은 인프라 쪽에서 같은 목표(최소 자원으로 로컬 추론)에 도달하려는 시도로 읽을 수 있다.

### 적용점

프로덕션에 바로 쓸 기술은 아니지만, "런타임 오버헤드를 걷어내면 추론 자체의 최소 자원 요구량이 얼마나 낮아지는지"를 보여주는 하한선 참고 자료로서 의미가 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 극단적 하드웨어 제약 환경(임베디드 키오스크 등)에서 로컬 LLM을 돌려야 하는 미래 시나리오가 생긴다면 참고할 하한선 정도이지, 현재 CRS 상담/추천 에이전트 설계에 바로 쓸 패턴은 아니다.

## 연관 자료

- [[2026-11-24-local-ai-guide-inkling-qwen-unsloth]] — 로컬 LLM 실행 가이드, 같은 Qwen 계열
- [[2026-11-25-nariq-qwen3-8-27b-ternary-quantization]] — 모델 압축 축에서 같은 미니멀리즘 지향
- [[2026-11-25-ternary-bonsai-2-5-agentic-coding]] — 압축하면서도 능력 보존을 우선하는 같은 흐름

## 한 달 뒤 회고

2026-12-27 즈음 — 원문이 열리면 프로젝트 GitHub 저장소와 실제 사용 모델 양자화 방식(Q8 포맷의 구체 사양)을 확인한다.
