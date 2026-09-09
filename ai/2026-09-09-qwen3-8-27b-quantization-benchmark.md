---
title: "Qwen3.8 27B 양자화 벤치마크 (Quesma) — 4비트는 원본과 구분 안 되고 2비트는 코딩에서만 새고 1비트는 추론할수록 더 나빠진다"
source_title: "Benchmarking Qwen3.8 27B quantizations: 4-bit holds up, 1-bit collapses"
source_url: "https://quesma.com/blog/qwen38-27b-quantizations-benchmarked/"
source_name: "Quesma Blog · GeekNews(id=33396) 경유"
referrer_url: "https://news.hada.io/topic?id=33396"
published_at: "2026-09 (정확한 게시일 미확인)"
summarized_at: "2026-09-09"
category: "ai"
tags: ["quantization", "qwen", "local-llm", "gguf", "benchmark", "gpqa", "tool-calling", "consumer-gpu"]
---

# Qwen3.8 27B 양자화 벤치마크 (Quesma)

> 출처: [Benchmarking Qwen3.8 27B quantizations: 4-bit holds up, 1-bit collapses](https://quesma.com/blog/qwen38-27b-quantizations-benchmarked/) (Quesma Blog) · GeekNews(id=33396) 경유 · 정리일 2026-09-09
> **출처 한계**: `news.hada.io`·`quesma.com`·`huggingface.co`·`kaitchup.substack.com`·`news.ycombinator.com` 전부 이 세션 egress 정책으로 직접 열람하지 못했다. 아래 내용은 WebSearch가 반환한 여러 검색엔진 요약·스니펫(Quesma 원문을 인용한 2차 소스 다수, 서로 다른 질의로 3회 이상 교차 확인)과 Slack 사전 발췌를 대조해 재구성했다. 핵심 수치(17GB/10.7GB 크기, 4비트 무손실 체감, 1비트 무작위 추측 수준)는 여러 소스에서 일관되게 재현돼 신뢰도가 높다고 판단하지만, 정확한 벤치마크 원표(수치 소수점 단위)와 저자 신원, Quesma라는 회사의 이해관계(검색·관측성 관련 회사로 추정되나 확인 못함)는 원문을 못 읽어 확인 불가하다. hada 댓글 수·논조도 전혀 확인하지 못했다.

## 한 줄 요약

**55GB짜리 Qwen3.8 27B를 Unsloth Dynamic 양자화로 4비트(Q4_K_M, 17GB)까지 줄여도 과학·지시준수·에이전트 코딩 벤치마크에서 원본과 체감 차이가 없지만, 2비트(UD-Q2_K_XL, 10.7GB)부터는 과학·코딩이 갈라지기 시작하고 1비트(UD-IQ1_S)는 과학 문제에서 무작위 추측 수준으로 완전히 무너지며, 심지어 "더 오래 추론하게" 하면 오히려 더 나빠진다.** "몇 비트까지 줄일 수 있는가"에 대한 감을 세 단계 GGUF로 실측한 서드파티 벤치마크다.

## 핵심 포인트

- **테스트 대상 3단계** — BF16 원본(~55GB) 대비 ***Q4_K_M(약 17GB, 소수점 기준 17.11GB)***, ***UD-Q2_K_XL(약 10.7GB, Unsloth Dynamic 2비트)***, ***UD-IQ1_S(Unsloth Dynamic 1비트, 정확한 크기는 이 세션에서 미확인)*** 세 GGUF 양자화판을 GPQA Diamond(과학), IFBench(지시 준수), Terminal-Bench 2.1(에이전트 코딩) 세 벤치마크로 비교했다.
- **4비트 = 사실상 무손실** — Q4_K_M은 세 벤치마크 전부에서 원본과 ***"눈에 띄는 차이가 없다(you won't notice a difference)"***. 이 크기는 ***24GB RTX 4090 한 장에 약 64k 토큰 컨텍스트와 함께*** 올라간다 — 소비자용 GPU 한 장으로 원본급 작업 성능을 낼 수 있다는 뜻.
- **2비트 = 능력별로 다르게 샌다** — UD-Q2_K_XL(10.7GB)은 IFBench(지시 준수)는 유지했지만 GPQA Diamond(과학)와 Terminal-Bench(코딩)에서는 점수가 떨어졌다. 게다가 ***같은 코딩 작업을 풀 때 출력 토큰을 약 25% 더 쓴다*** — 정답에 도달은 하더라도 "더듬거리며" 더 길게 추론한다는 신호로 읽힌다.
- **1비트 = 붕괴, 그것도 "더 생각할수록 악화"** — UD-IQ1_S는 GPQA Diamond에서 ***무작위 추측 수준까지 떨어졌고***, 흥미롭게도 추론 강도를 올릴수록(xhigh > low) 오히려 점수가 더 낮아졌다 — 토큰 예산을 다 쓸 때까지 추론만 하다 빈 답을 반환하는 실패 패턴이 더 자주 나온 결과로 설명된다. "추론을 더 시키면 나아진다"는 통념이 극한 양자화 앞에서는 반대로 뒤집힌다.
- **양자화 방식** — Unsloth의 Dynamic 양자화(UD 접두사)로, 레이어마다 민감도에 따라 비트를 달리 배분하는 방식이라 단순 균일 양자화보다 저비트에서 유리하다고 알려져 있다.

## 인상 깊은 문장

> "With a 4-bit quantization Q4_K_M (17GB), you won't notice a difference on these benchmarks." (WebSearch로 확인된 Quesma 원문 인용 — 2차 소스 재인용, 원문 문단 직접 대조는 못함)

> "While 2-bit quantizations work to some extent, even the best 1-bit model is useless for these benchmarks." (위와 동일 조건)

## 댓글

**hada 댓글 수·논조 확인 불가.** `news.hada.io` 접근이 이 세션 내내 차단됐다. Hacker News에도 동일 제목("Benchmarking Qwen3.8 27B quantizations: 4-bit holds up, 1-bit collapses")의 스레드가 검색 결과 제목으로는 확인됐으나, 직접 접속이 막혀 점수·댓글 수·논조는 확보하지 못했고, 별도 조회에서는 해당 스레드 ID 자체가 "no such item"으로 뜨는 등 조회 결과가 엇갈려 존재 여부조차 확신 있게 말하기 어렵다. **출처가 벤더(Qwen/Unsloth) 자체가 아니라 제3자 블로그라는 점은 신뢰도에 유리하지만**, Quesma가 어떤 회사이고 이 벤치마크를 왜 돌렸는지(자사 제품 홍보 맥락인지, 순수 커뮤니티 기여인지) 원문을 못 읽어 확인하지 못했다 — 이 점은 정직하게 미확인으로 남긴다.

## 내 생각 · 적용점

1. [[2026-08-24-local-llm-feels-dumber-than-benchmarks]]가 세운 "같은 가중치라도 서빙 스택(어텐션 백엔드·KV 캐시 정밀도)이 다르면 사실상 다른 모델이 된다"는 축에, 이 글은 **가중치 자체의 양자화 비트수**라는 네 번째 변수를 더한다. 그 노트는 INT8은 도구 호출 오류에서 복구했지만 INT4는 복구하지 못했다고 봤는데, 이 글의 "2비트에서 코딩만 새고 출력 토큰이 25% 늘어난다"는 관찰과 방향이 정확히 일치한다 — **저정밀도로 갈수록 먼저 무너지는 능력이 일관되게 "구조화된 다단계 작업(코딩·도구 호출)"이고, 지시를 그냥 따르는 것과 "복잡한 작업을 정확히 완수하는 것"은 양자화 앞에서 별개의 능력이라는 그림이 두 노트를 겹치면 뚜렷해진다.**
2. [[2026-09-04-qwen-3-8-27b-cerebras]]가 강조한 "공개 API에는 프루닝하지 않은 원본을 올린다"는 Cerebras의 정책이 왜 의미 있는 선택인지, 이 벤치마크가 반대편에서 증명한다 — 이 글의 4비트 결과를 보면 "체감상 무손실"이 실제로 가능한 압축 폭이 꽤 넓다는 뜻이지만, 그건 어디까지나 **원본을 기준으로 삼아 비교했을 때만** 검증 가능한 주장이다. Cerebras처럼 "우리는 원본을 서빙한다"고 명시하는 벤더가 있어야, 이런 서드파티 양자화 벤치마크가 비교할 기준선을 가질 수 있다.
3. [[2026-09-04-m4-pro-mac-mini-local-llm]]의 이원화 전략(무거운 작업엔 Qwen3.6-35B-A3B, 가벼운 대화엔 Gemma-4-E4B)에 이 글은 구체적인 "어느 비트까지"라는 숫자를 보탠다 — 48GB 통합 메모리 Mac이라면 4비트(17GB)는 여유 있게 올라가고, 굳이 2비트로 더 줄여 메모리를 아낄 이유가 코딩·과학 작업에는 없다는 근거가 된다.

## 호스피탈리티 / CRS 적용 포인트

온다가 로컬/온프레미스 오픈웨이트 모델을 예약·요금 관련 도구 호출(tool calling)에 쓰는 시나리오를 검토한다면, 이 글의 구도는 실무적으로 꽤 직접적이다: **지시를 그냥 따르는 수준(IFBench형 작업)이라면 2비트까지 내려가도 버틸 수 있지만, 요금 계산·재고 조회처럼 "정확한 다단계 절차를 수행"해야 하는 작업(코딩·도구 호출형)은 4비트 밑으로는 위험 신호가 뚜렷하다.** 특히 "2비트에서 같은 작업에 출력 토큰을 25% 더 쓴다"는 관찰은 비용 계산에도 영향을 준다 — 메모리를 아끼려고 저비트로 내렸다가 추론 토큰 수가 늘어 실제 지연시간·비용이 오히려 나빠질 수 있다는 뜻이다. [[2026-08-24-local-llm-feels-dumber-than-benchmarks]]에서 남긴 "골든셋으로 KV 캐시 정밀도별 재검증" 원칙에, 이제 "가중치 양자화 비트수별 재검증"도 같은 목록에 추가해야 한다.

## 연관 자료
- [[2026-08-24-local-llm-feels-dumber-than-benchmarks]] — 서빙 스택(어텐션·KV 캐시)이 만드는 체감 성능 차이의 형제 격, 저정밀도에서 먼저 무너지는 게 "구조화된 다단계 작업"이라는 결론이 겹친다
- [[2026-09-04-qwen-3-8-27b-cerebras]] — 같은 Qwen3.8 27B, "원본 무손실 서빙"이라는 정반대 극단의 서빙 정책
- [[2026-09-04-m4-pro-mac-mini-local-llm]] — 이 벤치마크가 제시하는 "4비트면 충분하다"는 구체적 기준이 적용될 실제 로컬 셋업

## 한 달 뒤 회고
*(2026-10-09 즈음 — `quesma.com`·`news.hada.io` 접근이 풀렸다면 원문 벤치마크 표 전체와 hada/HN 댓글 논조를 직접 대조. Quesma라는 회사의 이해관계도 이때 확인. 1비트 UD-IQ1_S의 정확한 파일 크기도 원문에서 확인.)*
