---
title: "약 135만원으로 3.8B LLM을 처음부터 학습해 GPT-2를 넘기기(little-lm) — 개별 연산이 아니라 전체 처리량과 메모리가 승부를 갈랐다"
source_title: "One Engineer Trained a 3.8B Parameter LLM from Scratch for $998"
source_url: "https://blog.gopenai.com/one-engineer-trained-a-3-8b-parameter-llm-from-scratch-for-998-7ef5cd7809b7"
source_name: "GoPenAI (Hugo Vergnes의 little-lm 프로젝트)"
referrer_url: "https://news.hada.io/topic?id=36269"
summarized_at: "2026-10-31"
category: "ai"
tags: ["llm-pretraining", "little-lm", "muon-optimizer", "core-benchmark", "cost-efficiency"]
---

# 약 135만원으로 3.8B LLM을 처음부터 학습해 GPT-2를 넘기기(little-lm)

> 출처: [One Engineer Trained a 3.8B Parameter LLM from Scratch for $998](https://blog.gopenai.com/one-engineer-trained-a-3-8b-parameter-llm-from-scratch-for-998-7ef5cd7809b7) (GoPenAI, Hugo Vergnes) · [GeekNews](https://news.hada.io/topic?id=36269) 경유 · 정리일 2026-10-31

> **출처 한계**: news.hada.io는 egress 차단됐다. WebSearch로 GoPenAI·DEV Community·PromptZone 등 여러 재보도를 교차 확인했는데, **매체 간 세부 숫자가 서로 어긋난다** — 어떤 글은 B200 8대·43시간을, 다른 글(PromptZone)은 "소비자용 GPU·RTX 4090"을 언급해 하드웨어 서술이 충돌한다. 컨텍스트 길이별 성능 차이(1024 토큰 0.338 vs 2048 토큰 0.384)를 적은 스페인어 보도도 다른 매체에서는 확인되지 않았다. 숫자는 **"자기 보고(self-reported)"로 다뤄야 한다**는 전제를 달아둔다.

## 한 줄 요약

**개인 프로젝트 little-lm(3.848B 파라미터)이 무작위 초기화부터 653억 토큰을 사전학습해 DCLM CORE 0.384를 달성했다. B200 GPU 8대로 약 43시간, 998달러(약 135만원)가 들었고 GPT-2(0.2565)와 nanochat d32(0.310)를 넘어섰다.**

## 핵심 포인트

- **998달러로 GPT-2를 넘는 벤치마크 달성** — 혼자 진행한 개인 프로젝트치고는 매우 작은 예산으로 공개 벤치마크(CORE)에서 과거 유명 모델을 넘어선 수치를 보였다.
- **최적화 조합이 핵심이었다** — ***Muon 옵티마이저(행렬 파라미터용)와 AdamW(나머지용)를 섞은 하이브리드, 사다리꼴 학습률 스케줄, ClimbMix 데이터, FP8(어휘 패딩 포함), 융합 교차엔트로피*** 등을 적용했다.
- **개별 연산 최적화보다 전체 처리량·메모리가 더 중요했다** — 융합 손실 함수는 같은 배치 크기에서는 약 6% 느려졌지만, 절약된 메모리로 배치를 더 키우자 전체 처리량이 오히려 높아졌다. ***"한 연산이 빨라지는가"보다 "전체 파이프라인이 얼마나 많은 데이터를 단위 시간에 처리하는가"가 최종 성능을 갈랐다.***
- **최종 학습에서는 평가 손실이 끝까지 감소했다** — 초기 실험의 성능 저하 문제를 위 기법들로 해결한 뒤, 마지막 학습 단계까지 성능이 계속 개선되는 곡선을 얻었다.
- **컨텍스트 길이가 CORE 점수에 영향을 줬을 가능성** — 한 보도에 따르면 2048 토큰 컨텍스트가 1024 토큰보다 더 높은 점수를 냈다고 하나, 이는 다른 매체에서 확인되지 않아 미확정으로 남긴다.

## 인상 깊은 문장

> "the model scores 0.384 on CORE, surpassing GPT-2 and nanochat d32" — [GoPenAI](https://blog.gopenai.com/one-engineer-trained-a-3-8b-parameter-llm-from-scratch-for-998-7ef5cd7809b7)

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. 이 프로젝트는 DEV Community·PromptZone·zeli.app(다국어 번역본 포함) 등 여러 채널에서 재보도돼 관심 자체는 확인되지만, **재보도마다 하드웨어·컨텍스트 길이 서술이 엇갈려 "경쟁적으로 베껴 쓰며 디테일이 흔들린" 전형적인 사례**로 보인다. 1차 블로그(혹은 GitHub 저장소) 자체를 직접 열람하지 못해 원 저자의 정확한 서술은 확인하지 못했다.

## 내 생각 · 적용점

**핵심 전이 1 — "저비용 LLM 학습"의 핵심은 GPU 시간 단가가 아니라 처리량 설계다.** 이 프로젝트가 보여주는 교훈은 "더 저렴한 GPU를 쓴다"가 아니라 "같은 GPU 시간 안에 더 많은 유효 토큰을 처리하게 만드는 메모리·배치 설계"다. 이건 추론 비용 최적화에서도 반복되는 원칙과 같은 축이다 — [[2026-10-30-claude-code-30-second-conversation-sync]]에서 다룬 "패널 상태줄 하나가 토큰 15~20%를 먹는다"는 사례도 결국 "보이지 않는 반복 처리가 전체 효율을 깎아먹는다"는 같은 문제의식이다.

**핵심 전이 2 — 1인 프로젝트가 대기업 수준 벤치마크를 따라잡는 사례가 늘고 있다.** 998달러라는 숫자 자체보다, **오픈 레시피(Muon, ClimbMix, FP8 조합)가 공개되면서 개인도 재현 가능한 수준까지 사전학습 난이도가 낮아지고 있다**는 트렌드가 더 중요하다. 이는 거대 모델 벤더에 대한 의존도를 낮출 수 있는 선택지가 늘어난다는 뜻이기도 하다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** 온다가 범용 LLM을 자체 사전학습할 이유는 없고, 이는 Claude/GPT 같은 기성 모델 API를 쓰는 현재 방향과 맞지 않는다. 다만 ***"전체 파이프라인 처리량이 개별 최적화보다 중요하다"***는 원칙은, CRS의 배치 작업(대량 예약 동기화, 채널 매핑 처리)을 설계할 때 "개별 요청 지연시간"보다 "전체 처리량과 메모리 사용의 균형"을 먼저 보라는 참고 원칙으로만 전이 가능하다.

## 연관 자료

- [[2026-10-30-claude-code-30-second-conversation-sync]] — 보이지 않는 반복 처리가 전체 효율을 깎아먹는다는 같은 축(패널 상태줄 토큰 낭비)

## 한 달 뒤 회고

*(2026-11-30 즈음 — little-lm 원문 블로그·GitHub를 직접 확인했는지, 하드웨어·컨텍스트 길이 서술 불일치가 해소됐는지 점검.)*
