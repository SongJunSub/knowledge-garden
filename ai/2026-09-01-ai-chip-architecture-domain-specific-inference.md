---
title: "AI 칩 아키텍처 — 단일 스레드 성능 증가율이 연 52%에서 3%로 떨어지며 시작된 도메인 특화 아키텍처 경쟁, GEMM(프리필)과 GEMV(디코드)가 서로 다른 승자를 요구한다"
source_title: "AI Chip Architectures (원문 정확한 특정 실패 — 후보: Jacob Peake, jepeake.com/ai-chip-architectures)"
source_url: "확인 불가 — hada.io 원문 링크를 열지 못해 정확한 출처를 확정하지 못함"
source_name: "확인 불가 (WebSearch 교차확인 기반 재구성)"
referrer_url: "https://news.hada.io/topic?id=33096"
published_at: "확인 불가"
summarized_at: "2026-09-01"
category: "ai"
tags: ["ai-hardware", "domain-specific-architecture", "gemm-gemv", "cuda", "tpu", "cerebras", "groq", "llm-inference"]
---

# AI 칩 아키텍처 — 도메인 특화 아키텍처 경쟁의 세 갈래 길

> 출처: GeekNews [id=33096](https://news.hada.io/topic?id=33096) 경유 원문 (정확한 원문 URL·저자 특정 실패) · 정리일 2026-09-01
> **출처 한계**: `news.hada.io`가 이번 세션 내내 egress 차단돼 원문 링크 자체를 확인하지 못했다. WebSearch로 유사한 논지(NVIDIA·TPU·Cerebras·Groq 비교, GEMM/GEMV 구분, CUDA vs 컴파일러 스케줄링)를 다루는 글을 여러 번 찾았고, 그 중 Jacob Peake의 "AI Chip Architectures"(jepeake.com)가 가장 근접한 후보로 반복 등장했지만 **직접 fetch가 egress 차단으로 실패해 이 글이 실제 원문인지 확정하지 못한다.** 아래 내용은 **Slack 발췌 3줄(마지막 문장 말줄임표로 잘림)**을 뼈대로 하고, 단일 스레드 CPU 성능 증가율(1980년대 연 52%→2018년 3%)과 그로 인한 도메인 특화 아키텍처(DSA) 부상이라는 배경은 Hennessy·Patterson의 2018년 튜링상 강연/논문 "A New Golden Age for Computer Architecture"(ACM CACM, DOI 10.1145/3282307)에서 유래한 잘 알려진 수치임을 WebSearch로 별도 확인했다 — 이 배경 수치 자체는 신뢰도가 높으나, Slack이 인용한 원문이 이 수치를 정확히 어떤 맥락으로 재인용했는지는 확인하지 못했다.

## 한 줄 요약

**단일 스레드 CPU 성능 증가율이 1980년대 연 52%에서 2018년 3%로 떨어지면서(Hennessy·Patterson의 유명한 진단), 범용 컴퓨팅으로 AI 연산을 감당하기 어려워졌고 그 자리를 NVIDIA GPU·Google TPU·AMD Instinct·Cerebras WSE·AWS Trainium·Groq LPU 같은 도메인 특화 아키텍처(DSA)가 서로 다른 데이터 이동 방식으로 채우고 있다는 글이다. 핵심은 Transformer의 학습·프리필이 요구하는 GEMM(연산 집약)과 디코드가 요구하는 GEMV(대역폭 집약, 가중치+KV 캐시 반복 읽기)가 서로 다른 병목을 가져서, 칩 경쟁력이 순수 행렬곱 성능이 아니라 메모리 배치와 데이터 이동 설계에서 갈린다는 것이다.**

## 핵심 포인트

- **배경 — 범용 컴퓨팅의 한계** — 단일 스레드 CPU 성능 증가율이 1980년대 연 52%에서 2018년 3%로 낮아지면서, AI 연산은 ***도메인 특화 아키텍처*** 경쟁의 중심이 됐다. NVIDIA GPU부터 TPU, AMD Instinct, Cerebras WSE, Trainium, Groq LPU까지 서로 다른 데이터 이동 방식을 택한다.
- **프리필(GEMM) vs 디코드(GEMV)** — Transformer의 학습·prefill은 연산 집약적인 ***GEMM***이 중심이고, decode는 모든 가중치와 KV 캐시를 반복해서 읽는 대역폭 집약적인 GEMV가 중심이다. 그래서 칩 경쟁력은 행렬곱 성능뿐 아니라 **메모리 배치와 데이터 이동**에서 갈린다.
- **세 갈래 설계 철학** — NVIDIA는 CUDA의 ***프로그래밍 가능성과 동적 지연 은폐***, Google TPU와 AWS Trainium은 ***컴파일러 스케줄링***과 systolic array, Cerebras와 Groq는 ***대용량 온칩 SRAM***과 각각 dataflow·결정론적 실행을 선택한다.
- **(Slack 발췌가 여기서 잘려)** 이어지는 구체적 성능 비교·수치·저자의 결론은 확인하지 못했다.

## 인상 깊은 문장

> "단일 스레드 CPU 성능 증가율이 1980년대 연 52%에서 2018년 3%로 낮아지면서, AI 연산은 도메인 특화 아키텍처 경쟁의 중심이 됨" — Slack 발췌 요약 (원문 직접 인용은 확보하지 못했으나, 이 수치 자체는 Hennessy·Patterson 2018년 튜링상 강연에서 유래한 것으로 별도 확인됨)

> "NVIDIA는 CUDA의 프로그래밍 가능성과 동적 지연 은폐, Google TPU와 AWS Trainium은 컴파일러 스케줄링과 systolic array, Cerebras와 Groq는 대용량 온칩 SRAM과 각각 dataflow·결정론적 실행을 선택함" — Slack 발췌 요약

## 댓글

**확인 불가.** `news.hada.io` 접속이 이번 세션 내내 차단돼 댓글 수·HN/Lobsters 큐레이션 여부를 전혀 확인하지 못했다. 원문 자체도 특정하지 못했으므로 원문 쪽 댓글도 조회 불가하다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]가 경제학으로 짚은 구분이 이 글에서 하드웨어 설계 언어로 재등장한다

그 노트는 ***"프리필은 연산 바운드로 최초 토큰 시간을 결정하고, 디코드는 메모리 대역폭 바운드로 토큰당 속도와 비용의 상한을 정한다"***며 "그래서 분리형 서빙(둘을 분리된 풀로 쪼개기)"이 답이라고 정리했다. 이 글의 GEMM(프리필)/GEMV(디코드) 구분은 정확히 같은 병목을 **칩 설계 관점**에서 다시 말한 것이다 — 소프트웨어 서빙 전략(분리형 서빙)과 하드웨어 아키텍처 선택(NVIDIA vs TPU vs Cerebras/Groq)이 결국 같은 물리적 제약(연산 vs 대역폭)에서 갈라져 나온 두 개의 답이라는 걸 두 노트를 겹쳐보면 알 수 있다.

### 핵심 전이 2 — [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]]가 이 글이 말한 "온칩 SRAM" 설계의 실물 증거이자 한계를 동시에 보여준다

그 노트는 Cerebras의 웨이퍼 스케일 엔진이 ***"웨이퍼당 44GB SRAM에 가중치를 상주시켜 메모리 계층 사이 이동을 없애"***는 방식으로 GPT-5.6 Sol을 가속했다고 정리했다 — 이 글이 개념으로 말한 "대용량 온칩 SRAM" 전략의 실제 제품 사례다. 그런데 그 노트는 동시에 한계도 짚었다: ***"웨이퍼당 44GB면 2.4조 파라미터 모델은 웨이퍼가 수십 장 필요하다 — 이 구조는 모델이 클수록 불리하다."*** 즉 이 글이 말하는 "서로 다른 데이터 이동 방식"은 무료가 아니라 **각 방식마다 서로 다른 트레이드오프(Cerebras/Groq는 모델 크기 제약, NVIDIA는 유연성 대신 대역폭 병목)**를 감수하는 선택이라는 걸 실물 사례가 보강한다.

### 핵심 전이 3 — [[2026-08-26-openai-jalapeno-asic]]은 이 세 갈래 경쟁에 네 번째 선택지(추론 전용 커스텀 ASIC)를 더한다

이 글이 그린 지형도(NVIDIA CUDA / TPU·Trainium 컴파일러 스케줄링 / Cerebras·Groq 온칩 SRAM)에, OpenAI가 Broadcom과 공동 설계한 Jalapeño는 "토큰/MW"라는 축을 앞세운 또 다른 갈래를 더한다 — 범용 가속기를 재활용하는 게 아니라 처음부터 자사 LLM 로드맵에 맞춰 설계된 추론 전용 칩이라는 점에서, 이 글의 분류 어디에도 완전히 속하지 않는 "빅테크가 직접 칩을 설계하는" 네 번째 흐름을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다가 자체 AI 칩을 설계·선택할 이유는 없다. 다만 전이 가능한 원칙은 하나 있다: **LLM API·추론 서비스를 고를 때 "어떤 워크로드(프리필이 많은 긴 프롬프트 vs 디코드가 많은 긴 생성)인지"에 따라 실제로 유리한 벤더/모드가 달라질 수 있다**는 것 — [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]가 이미 정리한 "헤드라인 가격이 아니라 입력:출력 비율·캐시 적중률·p99 지연을 봐야 한다"는 원칙과 같은 결이다. 칩 자체를 다룰 일은 없어도, 벤더가 광고하는 "속도" 수치가 프리필 속도인지 디코드 속도인지 구분해서 읽는 습관 정도는 CRS 팀의 LLM 도입 판단에 실제로 쓸 수 있다.

## 연관 자료

- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — 프리필=연산 바운드/디코드=메모리 대역폭 바운드라는 같은 구분을 경제학·서빙 전략 관점에서 먼저 정리한 노트
- [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]] — 이 글의 "온칩 SRAM" 전략이 실제 제품에서 어떻게 구현됐는지, 그리고 그 트레이드오프(모델 크기 제약)
- [[2026-08-26-openai-jalapeno-asic]] — 이 글의 세 갈래 지형도에 더해지는 네 번째 흐름(빅테크의 추론 전용 커스텀 ASIC)

## 한 달 뒤 회고

*(2026-10-01 즈음 — hada.io 접속이 가능해졌다면 원문을 특정해 이 노트의 "출처 미확정" 상태를 해소했는지, Slack 발췌 이후 이어지는 원문의 구체 결론(어떤 워크로드에 어떤 아키텍처가 유리한지)을 확인해 보강했는지 점검.)*
