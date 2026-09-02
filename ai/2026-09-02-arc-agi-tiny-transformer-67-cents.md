---
title: "67센트로 학습한 소형 트랜스포머가 ARC-AGI-1 44%를 찍다 (Mithil Vakde) — 프론티어 스케일링과 정반대 방향에서 샘플 효율성을 공략한 실험"
source_title: "44% on ARC-AGI-1 in 67 cents"
source_url: "https://mvakde.github.io/blog/44-on-arc-1/"
source_name: "mvakde.github.io (Mithil Vakde)"
referrer_url: "https://news.hada.io/topic?id=33126"
published_at: "2026-09"
summarized_at: "2026-09-02"
category: "ai"
tags: ["arc-agi", "sample-efficiency", "small-models", "transformer-from-scratch", "low-cost-training", "kaggle-competition"]
---

# 67센트로 학습한 소형 트랜스포머가 ARC-AGI-1 44%를 찍다

> 출처: [44% on ARC-AGI-1 in 67 cents](https://mvakde.github.io/blog/44-on-arc-1/) (mvakde.github.io · Mithil Vakde) · 정리일 2026-09-02
> **출처 한계**: `mvakde.github.io`·`news.hada.io`·`news.ycombinator.com` 모두 이 세션 네트워크 egress 정책상 직접 열지 못했다. 아래 내용은 Slack 발췌(잘려 있음)와 WebSearch가 여러 질의에 걸쳐 일관되게 재현한 스니펫을 교차 검증해 재구성한 것이다. 저자 Mithil Vakde는 이전 글 "New Pareto Frontier on ARC-AGI"로 화제가 됐고, ARC-AGI-2 Kaggle 리더보드($450K 상금)에서 상위권으로 확인된다.

## 한 줄 요약

**RTX 5090 한 장에서 소형 트랜스포머를 처음부터 학습·추론까지 전부 마쳐 ARC-AGI-1 44%, ARC-AGI-2 7%를 기록했고, 여기 든 비용은 ***"1.5시간·67센트"*** 뿐이다.** 대형 모델을 더 크게 만들어 점수를 올리는 흐름과 정반대로, 저자는 **샘플 효율성(sample efficiency)**을 오늘날 AI에서 가장 중요한 문제로 놓고 실험한다.

## 핵심 포인트

- **비용·시간** — 학습부터 전체 평가셋 추론까지 총 ***"1.5시간, 67센트"***, GPU는 RTX 5090 1장.
- **성능** — ARC-AGI-1 **44%**(여러 LLM을 상회한다고 저자는 주장), ARC-AGI-2 **7%**.
- **입력 처리** — 입력·출력 격자를 토큰화하고, **과제(task)별 임베딩**·**3D RoPE**·**색상 치환 및 이면체(dihedral) 변환 증강**을 결합해 여러 퍼즐을 동시에 학습.
- **제출 방식** — 테스트 출력 후보 중 **가장 빈번한 2개**를 제출.
- **아키텍처 개선으로 40%→44%** — SwiGLU 게이트 FFN, RMSNorm, **8개 계층**, **NorMuon + 보조 AdamW** 옵티마이저, 가변 길이 FlashAttention 도입. 손실을 **출력 토큰에만** 적용.
- **연구 맥락** — 벤치마크가 아직 포화되지 않았으니(unsaturated) 비용을 계속 낮춰 전 세계 누구나 이 문제에 뛰어들 수 있게 하려는 의도를 명시한다.

## 인상 깊은 문장

> "beats many LLMs, despite needing only 67 cents to train it (from scratch!)"
> (WebSearch가 여러 질의에서 일관되게 재현한 구절이나, 원문 문장 부호까지 대조 검증하지는 못했다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단).
- **HN에 별도 스레드가 있었다**(item?id=49519939) — WebSearch 기준 ***30점·댓글 8개***로, "이 67센트 결과가 실제로 무엇을 증명하는가"를 둘러싼 짧고 기술적인 논쟁이었다고 한다.
- **정직하게 감안할 점** — ①ARC-AGI-1은 이미 프론티어 LLM들이 추론을 곁들이면 80~90%대까지 올라가는 벤치마크라, "여러 LLM을 앞선다"는 표현의 정확한 비교 조건은 원문 미확인. ②HN 댓글의 논쟁 자체가 이 수치를 곧이곧대로 "돌파"로 해석하면 안 된다는 신호. ③저자가 같은 대회의 상금 상위권 참가자라는 점에서 경쟁 포지셔닝 동기가 있을 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-08-deepseek-v4-flash-arc-agi-results]]와 같은 벤치마크의 정반대 극단

DeepSeek V4 Flash 노트는 **프론티어급 모델이 최대 추론으로 ARC-AGI-1 89.0%·ARC-AGI-2 61.4%**를 찍은 이야기였다. 이번 글은 정반대 — **얼마나 작고 싸게** 같은 벤치마크에 도전하는가다. 같은 벤치마크가 스케일의 양쪽 끝 모두에서 실험대로 쓰이고 있다는 대조.

### 핵심 전이 2 — [[2026-05-07-llm-from-scratch-workshop]]과 같은 "from scratch" 행위, 완전히 다른 목적

워크숍 노트는 교육 목적의 10M 파라미터 장난감 GPT였던 반면 이번 글은 $450K 상금이 걸린 실전 리더보드 경쟁이다.

### 핵심 전이 3 — [[2026-08-28-small-models-era]]가 짚은 "작은 게 이긴다" 흐름의 학습 단계 버전

그 노트는 추론 비용 절감을, 이번 글은 학습 비용 절감을 다룬다 — 같은 "AI 실험의 진입장벽을 낮춘다"는 상위 흐름의 두 축.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다.** ARC-AGI는 메타러닝·추상 패턴 인식을 겨냥한 연구용 벤치마크다.
- 다만 저자가 반복 강조하는 **"비용을 극한까지 낮춰야 반복 실험 속도가 빨라진다"**는 태도는, 내부에서 AI 기능 프로토타입을 검증할 때 저비용 반복으로 가설을 빠르게 좁히는 습관과 방향이 같다.

## 연관 자료

- [[2026-08-08-deepseek-v4-flash-arc-agi-results]] — 같은 ARC-AGI 벤치마크를 프론티어 모델·최대 추론으로 공략한 반대쪽 극단
- [[2026-05-07-llm-from-scratch-workshop]] — 같은 "트랜스포머를 처음부터 학습"이지만 교육용 vs 실전 경쟁
- [[2026-08-28-small-models-era]] — "작은 모델이 비용 장벽을 낮춘다"는 흐름의 추론 단계 버전

## 한 달 뒤 회고

*(2026-10-02 즈음 — ①mvakde.github.io·HN 원문 접근이 가능해지면 ARC-AGI-2 수치와 비교 대상을 대조해 확정, ②저자의 후속 글이 나왔는지, ③HN 댓글의 회의적 논점이 무엇이었는지 확인.)*
