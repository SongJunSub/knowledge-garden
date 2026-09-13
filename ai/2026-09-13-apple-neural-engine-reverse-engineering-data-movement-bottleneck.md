---
title: "Apple Neural Engine 역공학하기 (Eileen Yoon) — LLM의 병목은 연산이 아니라 데이터 이동"
source_title: "Retrospectively Reverse-Engineering Apple's Neural Engine"
source_url: "https://eiln.github.io/posts/ane.html"
source_name: "개인 블로그(eiln.github.io) — 저자 Eileen Yoon, ANE 리눅스 드라이버(eiln/ane, anecc) 개발자"
referrer_url: "https://news.hada.io/topic?id=33583"
published_at: "2026-09-11 추정 (Lobsters 게시일 기준, 원문 자체의 발행일 표기는 확인 못함)"
summarized_at: "2026-09-13"
category: "ai"
tags: ["apple-silicon", "neural-engine", "llm-inference", "memory-bandwidth", "on-device-ai", "reverse-engineering", "hardware"]
---

# Apple Neural Engine 역공학하기 — LLM의 병목은 연산이 아니라 데이터 이동

> 출처: [Retrospectively Reverse-Engineering Apple's Neural Engine](https://eiln.github.io/posts/ane.html) (Eileen Yoon 개인 블로그) · 정리일 2026-09-13
> **출처 한계**: `news.hada.io`가 이 세션 내내 egress 전면 차단돼 GeekNews 원문·댓글을 열지 못했다. WebSearch로 원문 저자(Eileen Yoon, GitHub `eiln` — ANE용 리버스 엔지니어링 리눅스 드라이버 `eiln/ane`·컴파일러 `anecc`의 개발자)와 정확한 URL(`eiln.github.io/posts/ane.html`)까지는 특정했지만, `eiln.github.io` 자체도 이 세션에서 egress 차단되어 **직접 열람은 실패**했다(`example.com`조차 막혀 있어 이번엔 이 세션의 WebFetch가 사실상 전면 불통이었다). 아래 내용은 ①과제에 주어진 Slack 발췌(마지막 문장이 "입력 읽기 경…"에서 잘림) ②WebSearch가 반환한 GitHub 이슈·소셜 스니펫의 원문 요약을 교차 대조해 재구성한 것이다. **가중치 읽기 대역폭 "~38GB/s"는 Slack 발췌 원문 그대로이고, 이어지는 입력 읽기 대역폭 수치는 끝내 확인하지 못했다.**

## 한 줄 요약

**ANE의 연산기(FP16 MAC 레인)는 트랜스포머가 필요로 하는 행렬곱을 계산하는 데 아무 문제가 없지만, 그 주변의 메모리 계층·가중치 로드 경로는 A11 Bionic 시절 CNN(같은 가중치를 여러 공간 위치에서 반복 재사용)에 맞춰 설계됐다 — 그런데 LLM의 오토리그레시브 디코드는 토큰 하나를 낼 때마다 가중치 전체를 재사용 없이 한 번씩 훑어야 하는 정반대 패턴이라, 결국 ANE의 최대 연산 성능(TOPS)이 아니라 가중치를 메모리에서 얼마나 빨리 끌어올 수 있는지가 속도의 상한을 정한다는 게 저자 개인(ANE 리눅스 드라이버 개발자)의 n=1 역공학 결론이다.**

## 핵심 포인트

- **ANE의 정체성** — A11 Bionic부터 탑재된 고정 함수(fixed-function) 매트릭스 가속기. Core ML을 거쳐야만 접근 가능한 블랙박스였고, 원래 목적은 Face ID·카메라 ISP 같은 CNN 기반 이미지 처리였다.
- **연산기는 범용, 주변 구조는 특화** — ***M1 ANE의 MAC 레인 자체는 트랜스포머 연산도 수행할 수 있지만, 주변 데이터 경로는 같은 가중치를 반복 사용하는 CNN에 맞춰져 있다*** — 저자는 "하드웨어의 특화는 MAC 유닛이 아니라 데이터 이동과 스케줄링에 있었다"는 취지로 정리한다.
- **CNN의 가중치 재사용 vs LLM의 무재사용** — 컨볼루션은 같은 커널(가중치)을 이미지의 여러 위치에 반복 적용(weight-stationary)해 재사용률이 높다. LLM 토큰 생성(배치=1, 오토리그레시브 디코드)은 토큰마다 대형 모델의 가중치 세트를 처음부터 끝까지 한 번씩만 읽어야 해 재사용이 거의 없다.
- **실측 병목 — 가중치 읽기 경로 ~38GB/s (M1)** — Slack 발췌가 전한 핵심 수치다. 이어지는 "입력 읽기 경로는…" 문장은 잘려서 정확한 값을 확인하지 못했지만, 문맥상 두 경로 모두 ANE의 이론적 최대 연산 성능에 한참 못 미치는 대역폭이라는 방향성은 분명하다.
- **결과 — TOPS 스펙과 실제 토큰/s의 간극** — 연산 성능(TOPS)을 자랑하는 Apple의 발표 스펙과 달리, LLM 디코드처럼 가중치를 반복 재사용하지 못하는 워크로드에서는 메모리 대역폭이 실질 처리량을 정한다. 이게 왜 오픈소스 LLM 추론 스택 대부분이 ANE를 건드리지 않고 GPU(Metal/MLX)로 우회하는지의 하드웨어적 근거가 된다.
- **큰 흐름 — GPU로의 흡수** — 최근 세대(M5 이후)에서 Apple이 ANE 유사 기능을 GPU 쪽 "Neural Accelerator(NAX)"로 접어넣는 추세가 보이는데, 이를 저자는 "더 유연한 메모리 구조를 가진 GPU가 결국 자리를 넘겨받는 전략적 진화"로 읽는다. 다만 이 프레이밍에는 HN에서 반론이 있다(아래 댓글 항목 참고).

## 인상 깊은 문장

> "하드웨어의 특화는 MAC 유닛 자체가 아니라 데이터 이동과 스케줄링에 있었다."
> (WebSearch로 확보한 2차 파생 요약을 재구성 — 원문 그대로의 인용문 대조는 `eiln.github.io` 접근 차단으로 하지 못했다.)

> "ANE의 가중치 읽기 경로는 약 38GB/s, 입력 읽기 경…" — 과제에 주어진 Slack 발췌, 마지막 문장이 여기서 끊겼다.

## 댓글

**Hacker News**(item id=49670032)**와 Lobsters**(2026-09-11, `ai`/`hardware`/`reversing` 태그)에 **양쪽 모두 크로스포스팅**됐다는 것은 WebSearch로 확인했다. 다만 이 세션에서 두 스레드 모두 직접 열람은 실패했고(egress 차단), WebSearch 스니펫으로 확보한 것은 댓글 한 건뿐이다 — **저자가 글 서두에서 ANE와 M5+ GPU 내부의 별도 하드웨어인 "Neural Accelerator(NAX)"를 혼용해 서술했다는 정정 지적**이 있었고, 같은 댓글은 "Apple이 ANE를 포기하는 게 아니라 M6·A20에서 ANE 블록 자체를 두 배로 늘릴 예정"이라는 반박 정보도 덧붙였다고 한다. 즉 **"메모리 구조가 CNN에 맞춰져 있어 LLM 디코드에 불리하다"는 핵심 논지 자체는 반박되지 않았지만, "ANE가 GPU에 흡수되며 소멸하는 추세"라는 후반부 프레이밍에는 이견이 있다**는 걸 감안해야 한다. hada 자체 댓글 수·GN⁺ 큐레이션 여부는 `news.hada.io` 전면 차단으로 확인하지 못했다. 저자 본인이 ANE 리눅스 드라이버 개발자라는 점에서 "역공학으로 뭘 밝혀냈다"는 서사에 개인적 투자(이해관계)가 있다는 점도 정직하게 짚어둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-01-ai-chip-architecture-domain-specific-inference]]가 말한 GEMM/GEMV 구분이 ANE라는 구체 실패 사례로 육화된다

그 노트는 "Transformer의 prefill은 연산 집약적인 GEMM, decode는 가중치·KV 캐시를 반복 읽는 대역폭 집약적인 GEMV"라는 구분이 최근 도메인 특화 아키텍처(DSA) 경쟁 전체를 가른다고 정리했다. 이 글의 ANE는 정확히 그 구분에서 **잘못된 쪽에 최적화된 DSA의 실물 사례**다 — CNN의 weight-stationary 패턴에 맞춘 메모리 구조가 GEMV 성격의 LLM 디코드를 만나 병목으로 드러난 것. NVIDIA·TPU·Cerebras가 "처음부터" 프리필/디코드 트레이드오프를 설계에 반영한 것과 달리, ANE는 **트랜스포머가 존재하기 전에 설계된 DSA가 사후적으로 불리해진** 사례라는 점에서 그 노트의 지형도에 다섯 번째 축(설계 당시 워크로드와 실제 워크로드의 시차)을 더한다.

### 핵심 전이 2 — [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]가 경제학으로 정리한 "디코드=메모리 대역폭 바운드"를, 이 글은 개인 역공학 실측으로 하드웨어 내부에서 재확인한다

그 노트는 데이터센터 단위에서 "디코드는 메모리 대역폭 바운드로 토큰당 속도와 비용의 상한을 정한다"고 짚었다. 이 글은 같은 명제를 **단일 칩(M1 ANE) 내부**에서, 가중치 읽기 경로의 실측 대역폭(~38GB/s)이라는 훨씬 작은 스케일로 보여준다 — 데이터센터의 서빙 전략 얘기가 아니라 **실리콘 안 배선의 문제로서도 똑같은 물리 법칙이 적용된다**는 걸 확인시켜준다.

### 핵심 전이 3 — [[2026-08-26-openai-jalapeno-asic]]과 대조하면 "처음부터 LLM을 겨냥한 설계"와 "사후적으로 불리해진 설계"의 차이가 뚜렷해진다

Jalapeño는 처음부터 "토큰/MW"를 설계축으로 삼아 HBM4·단순화된 메모리 구조를 갖춘 추론 전용 ASIC이다. ANE는 반대다 — A11 Bionic 시절 CNN 워크로드에 최적화된 뒤, 트랜스포머라는 전혀 다른 워크로드가 나중에 등장하면서 같은 하드웨어가 불리한 위치로 밀려난 것. 두 노트를 겹쳐 보면 "메모리 구조가 워크로드에 맞아야 한다"는 원칙은 같지만, **하나는 사전 설계로 그 원칙을 지켰고 하나는 사후에 그 원칙에 걸려 넘어졌다**는 대비가 선다.

### 핵심 전이 4 — [[2026-09-04-m4-pro-mac-mini-local-llm]]이 실무에서 이미 증명한 회피 경로

그 노트가 정리한 로컬 LLM 서버 구성은 ***oMLX***(Apple MLX 프레임워크, GPU/Metal 기반)로 추론을 돌리고 ANE는 아예 등장하지 않는다. 이 글을 읽고 나면 그 선택이 우연이 아니라는 게 분명해진다 — **ANE의 메모리 구조가 LLM 디코드에 안 맞는다는 하드웨어적 이유가, 실무에서 다들 GPU 경로로 우회하는 이유의 근거**다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다가 Apple 실리콘 위에서 온디바이스 LLM을 서빙할 계획은 없고, ANE 같은 특정 가속기의 내부 대역폭을 다룰 일도 없다. 다만 전이 가능한 원칙은 하나 있다: **가속기·인프라 벤더가 내세우는 "연산 성능(TOPS/FLOPS)" 스펙과, 실제 워크로드(우리 경우엔 배치가 작고 반복 요청이 잦은 LLM 추론 API 호출)가 그 성능을 실제로 뽑아낼 수 있는 재사용 패턴인지는 다른 질문**이라는 것 — [[2026-09-01-ai-chip-architecture-domain-specific-inference]]에서 이미 정리한 "벤더가 광고하는 속도가 프리필인지 디코드인지 구분해서 읽으라"는 습관과 정확히 같은 결이다. 이번 글은 그 습관이 클라우드 API 선택뿐 아니라 "어떤 하드웨어가 왜 특정 세대에 뒤처지는가"를 이해하는 데도 같은 틀로 적용된다는 걸 한 겹 더 보여준다.

## 연관 자료

- [[2026-09-01-ai-chip-architecture-domain-specific-inference]] — GEMM(프리필)/GEMV(디코드) 구분과 DSA 경쟁의 지형도, ANE는 이 구분에서 잘못된 쪽에 최적화된 구체 실패 사례
- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — "디코드=메모리 대역폭 바운드"라는 경제학적 명제를 칩 내부 실측으로 재확인
- [[2026-08-26-openai-jalapeno-asic]] — 처음부터 LLM을 겨냥해 설계된 추론 ASIC과의 대조(사전 설계 vs 사후적 불리함)
- [[2026-09-04-m4-pro-mac-mini-local-llm]] — 실무에서 ANE 대신 GPU(MLX)로 로컬 LLM을 돌리는 이유의 하드웨어적 근거

## 한 달 뒤 회고

*(2026-10-13 즈음 — ①`eiln.github.io` 접속이 가능해졌다면 원문을 직접 읽어 입력 읽기 대역폭 정확한 수치와 인용문을 확인·보강했는지, ②HN 댓글이 짚은 "ANE vs NAX 혼용" 정정과 "M6/A20에서 ANE 블록 2배 확대" 주장이 다른 소스로 재확인되는지, ③이 논지가 이 가든의 다른 온디바이스 AI 노트들의 실무 선택(왜 다들 MLX/GPU를 쓰는지)과 계속 부합하는지 점검.)*
