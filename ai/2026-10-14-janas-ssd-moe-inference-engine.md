---
title: "Janas: SSD로 RAM보다 큰 MoE 모델을 돌리는 추론 엔진 (Maurizio Cammalleri) — expert를 그때그때 스트리밍하고 핫셋만 캐싱해, GPU 없이도 llama.cpp 대비 쓰기 속도를 8배 이상 끌어올린다"
source_title: "janas (wiki)"
source_url: "https://github.com/prabanta-dev/janas"
source_name: "GitHub (prabanta-dev/janas)"
referrer_url: "https://news.hada.io/topic?id=35298"
summarized_at: "2026-10-14"
category: "ai"
tags: ["local-ai", "moe", "ssd-offloading", "speculative-decoding", "llama.cpp", "on-device-inference", "expert-caching"]
---

# Janas: SSD로 RAM보다 큰 MoE 모델을 돌리는 추론 엔진 (Maurizio Cammalleri) — expert를 그때그때 스트리밍하고 핫셋만 캐싱해, GPU 없이도 llama.cpp 대비 쓰기 속도를 8배 이상 끌어올린다

> 출처: [janas wiki](https://github.com/prabanta-dev/janas/wiki) (Maurizio "camauri" Cammalleri · GitHub) · 정리일 2026-10-14

> **출처 한계**: GeekNews 원문(news.hada.io)은 오늘 WebFetch가 DNS 차단(ENOTFOUND)되어 직접 열람하지 못했다. 대신 GitHub 저장소 위키(`prabanta-dev/janas/wiki`)는 WebFetch로 직접 읽을 수 있어 그걸 1차 출처로 삼았다. 따라서 아래 수치·표는 위키 원문 기반이지만, GeekNews 쪽 서술(요약 발췌)과 100% 동일한 표현은 아닐 수 있다.

## 한 줄 요약

**Janas는 MoE 모델 전체를 메모리에 올리는 대신 토큰마다 필요한 expert만 NVMe SSD에서 그때그때(O_DIRECT로) 읽고, 자주 쓰는 expert만 남은 메모리에 캐싱해 RAM보다 훨씬 큰 모델(80B)을 32GB 노트북에서 실행 가능하게 만드는 로컬 추론 엔진이다. 여기에 draft 기반 생성(speculative decoding)까지 얹어, 같은 하드웨어의 llama.cpp 대비 쓰기 속도를 Qwen3-Next-80B-A3B 기준 2.8→24 tok/s(드래프트 포함 채팅 37 tok/s)까지 끌어올렸다.**

## 핵심 포인트

- ***expert 스트리밍 + 핫셋 캐싱*** — 가중치는 디스크에 두고 토큰마다 필요한 expert만 `O_DIRECT`로 최대 속도에 가깝게 읽는다. 자주 재사용되는 expert는 모델을 열 때 남은 메모리를 활용해 캐싱하며 `--cache <GiB>`로 상한을 둘 수 있다. 메모리 여유가 부족하면 데스크톱이 스왑으로 밀려 느려지거나 응답 없음 상태가 될 수 있다고 경고한다. Qwen3-Next-80B-A3B(48.4GB)는 32GB 노트북에서 약 19GB만 캐싱하고 나머지는 디스크에서 읽는다.
- ***벤치마크 수치(Core Ultra 9 185H + 내장 Arc GPU, 32GB DDR5, 1TB NVMe, llama.cpp는 Vulkan 백엔드)*** — Qwen3-Next-80B-A3B 기준 읽기 Janas 62 / llama.cpp 16 tok/s, 쓰기 Janas 24 / llama.cpp 2.8 tok/s. draft 포함 채팅 기준 쓰기는 37 tok/s까지 올라간다. Qwen3-Coder-Next(48.4GB)도 비슷한 폭(쓰기 22 vs 2.2)으로 앞선다.
- **GPU 없이도 실행 가능** — `JANAS_GPU=0`으로 GPU를 완전히 꺼도 동작한다. 다만 속도는 떨어진다(Qwen3-4B 기준 읽기 GPU 사용 220 tok/s → GPU 없음 85 tok/s).
- ***draft 기반 생성(speculative decoding)*** — 작은 draft가 다음 토큰들을 미리 추측하고 본 모델이 검증하는 방식으로, 출력 텍스트는 그대로 두고 속도만 올린다. Qwen3.5·3.6·Next의 내장 예측 블록(MTP)이나 Gemma 4의 보조 드래프팅 모델을 쓰며, 채택률은 텍스트 성격에 따라 63~89%까지 편차가 크다(이탈리아어 산문에서는 채택률 1/3 수준으로 이득이 거의 없었다는 기록도 있다).
- **양자화 제작자에 따라 우위가 뒤집히기도 한다** — 같은 Qwen3-30B-A3B라도 bartowski의 Q4_K_M은 Janas가 앞서지만(읽기 131 vs 122), unsloth의 UD-Q3_K_XL 양자화에서는 오히려 llama.cpp 읽기(112)가 Janas(100)보다 빠르다. "벤치마크는 모델이 아니라 양자화 빌드 단위로 다시 봐야 한다"는 경고로 읽힌다.
- **실험 단계임을 명시** — 단일 기기에서만 개발·측정됐고 다른 하드웨어에서는 검증되지 않았다. 공개 API·CLI 옵션이 자주 바뀌며, GPU 드라이버 리셋이 한 번 발생한 적도 있다고 위키에 스스로 적어뒀다.

## 인상 깊은 문장

> (위키 요약 재구성) "자주 다시 쓰이는 expert는 메모리에 남겨 두고, 나머지는 토큰마다 디스크에서 읽는다." — 전체 모델을 메모리에 다 올리지 않고도 동작하게 만드는 Janas의 핵심 설계를 한 문장으로 요약한 표현.

## 댓글

GeekNews 원문이 DNS 차단으로 직접 접근되지 않아 **hada 댓글 수는 확인하지 못했다.** HN·Lobsters 등 외부 큐레이션 여부도 확인 불가. 다만 벤치마크 자체는 단일 개발자가 단일 기기에서 측정한 n=1 수치이고, 위키도 "다른 하드웨어에서는 속도가 다르거나 모델을 거부하거나 불안정할 수 있다"고 스스로 한계를 명시하고 있다 — 숫자를 그대로 범용 성능으로 일반화하면 안 된다.

## 내 생각 · 적용점

### 핵심 전이 1 — "메모리보다 큰 자산을 다루는 법"은 로컬 AI를 넘어서는 일반 원리다

전체를 올리지 않고 쓰이는 부분만 그때그때 스트리밍 + 핫셋 캐싱이라는 패턴은 캐시 계층·LRU·CDN과 본질적으로 같은 구조다. [[2026-06-08-running-local-models-got-good]]가 말한 "직접 제어·관찰이 가치"라는 로컬 AI 계열 주장에, Janas는 "메모리 제약을 디스크 I/O로 우회하는 구체적 엔지니어링 해법"을 하나 더 보탠다.

### 핵심 전이 2 — "클라우드 중심 구조가 바뀐다"는 주장의 구체적 실증

[[2026-10-12-local-ai-models-cloud-shift-catalyst]]는 "GPU 부족·비용이 분산형 추론을 민다"고 주장했지만 출처가 불확실한 채였다. Janas의 "48.4GB 모델을 GPU 없이 32GB 노트북에서 24 tok/s로 돌린다"는 수치는 그 주장에 꽤 구체적인 근거를 보태준다 — 다만 n=1 벤치마크라는 점은 그대로 안고 가야 한다.

### 핵심 전이 3 — 벤치마크 숫자를 그대로 믿지 말라는 반증

[[2026-08-24-local-llm-feels-dumber-than-benchmarks]]가 지적한 "어텐션 백엔드·KV 캐시 양자화 설정 차이가 체감 성능을 바꾼다"는 경고가 Janas 자신의 벤치마크에서도 똑같이 나타난다(양자화 제작자에 따라 우위가 뒤집힘). 벤치마크는 항상 "어떤 조건에서"를 같이 봐야 한다는 교훈이 반복된다.

### 핵심 전이 4 — 온디바이스 AI의 두 갈래: 메모리 중심 vs 전용 실리콘 중심

[[2026-09-21-laya-mac-offline-realtime-decision-ai]]는 Apple Neural Engine 전용 최적화로 5ms 응답을 노리는 반면, Janas는 범용 PC + SSD라는 완전히 다른 경로로 "온디바이스"를 구현한다. 둘 다 "로컬 실행"이라는 목표는 같지만 하드웨어 전제와 트레이드오프가 다르다 — 온디바이스 AI를 하나의 범주로 뭉뚱그리면 안 된다.

## 호스피탈리티 / CRS 적용 포인트

온다는 B2B SaaS/CRS로 고객 PC에 로컬 LLM을 심을 일은 거의 없어 **직접 적용은 멀다.** 다만 "메모리/리소스보다 큰 작업을 어떻게 비용 효율적으로 처리할까"라는 패턴(필요한 부분만 그때그때 로드, 핫셋만 캐싱)은, 대형 재고·요금 테이블을 다루는 CRS 백엔드의 캐싱 전략 설계 원칙으로는 참고할 가치가 있다 — "전부 메모리에 올리기 vs 핫셋만 캐싱하고 나머지는 스트리밍"이라는 선택지는 CRS 데이터 계층에도 그대로 존재하는 질문이다.

## 연관 자료

- [[2026-10-12-local-ai-models-cloud-shift-catalyst]] — 로컬 추론이 클라우드 중심 구조를 바꾼다는 주장에 대한 구체적 수치 근거
- [[2026-06-08-running-local-models-got-good]] — "직접 제어·관찰이 가치"라는 로컬 AI·통제권 계열
- [[2026-08-24-local-llm-feels-dumber-than-benchmarks]] — 벤치마크 조건 차이가 체감 성능을 바꾼다는 같은 경고가 Janas 자신의 수치에서도 반복됨
- [[2026-09-21-laya-mac-offline-realtime-decision-ai]] — 온디바이스 AI의 다른 갈래(전용 실리콘 중심)와의 대비

## 한 달 뒤 회고

*(2026-11-14 즈음 — Janas가 다른 하드웨어에서도 검증됐는지, llama.cpp 본체에 유사한 SSD 오프로딩이 공식 병합됐는지, "로컬이 클라우드를 대체한다"는 주장이 실제로 더 힘을 얻었는지 확인.)*
