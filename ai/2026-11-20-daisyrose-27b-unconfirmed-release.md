---
title: "DaisyRose-27B(GeekNews, n=2 스페인어 매체 단독 보도, 1차 소스 미확인) — Terminal-Bench 5.6%→12.0%라는 수치를 신뢰 등급 '미확인'으로 남긴다"
source_title: "확인 불가 (1차 모델 카드/릴리스 노트 미발견)"
source_url: "확인 불가"
source_name: "GeekNews (1차 소스 미확인, 2차 보도: ecosistemastartup.com)"
referrer_url: "https://news.hada.io/topic?id=37459"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "ai"
tags: ["daisyrose-27b", "radixark", "reinforcement-learning", "terminal-bench", "unconfirmed"]
---

# DaisyRose-27B (GeekNews, 1차 소스 미확인)

> 출처: GeekNews 발췌 · [GeekNews](https://news.hada.io/topic?id=37459) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 egress 차단 재확인. RadixArk 공식 모델 카드·릴리스 노트를 WebSearch로 찾지 못했고, 유일한 출처가 스페인어 2차 매체(ecosistemastartup.com) 2건뿐이다 — **n=2 단독 보도**로 이 글 전체를 "미확인 소식" 등급으로 취급한다.

## 한 줄 요약

**RadixArk가 공개했다는 DaisyRose-27B는 Qwen3.8-27B 기반으로 Terminal-Bench 4.1 pass@1을 5.6%에서 12.0%로 올렸다고 보도됐지만, 1차 소스(모델 카드·릴리스 노트)를 전혀 찾지 못해 수치 전체를 미확인 등급으로 남긴다.**

## 핵심 포인트

- RadixArk가 **DaisyRose-27B**를 공개했다는 보도. Qwen3.8-27B를 기반으로 선별한 작업 1,200개를 사용해 H200 GPU 144대(트래젝토리 생성 128대 + 학습 16대)로 18일간 강화학습했다고 한다.
- **Terminal-Bench 4.1 pass@1이 5.6%에서 12.0%로 상승**했다고 보도되나, 이 점수는 태스크당 8회 실행 평균이고 내부 mini-swe-agent 하네스·요약 활성화 조건에서 측정돼 공정 비교에 영향을 줄 수 있는 조건이다.
- 학습 프레임워크는 **Miles**(RadixArk의 오픈소스 RL 프레임워크)로, ***완전 비동기 학습***을 사용했다고 한다(Slack 발췌와 일치).
- 학습 데이터는 기반 모델이 실제로 저지르는 오류를 겨냥했고, 실제 문제를 풀지 않고 보상을 얻는 작업은 수정하거나 제거했다고 한다.
- **대조 정보**: 같은 Qwen3.8-27B 기반으로 텐센트 계열 논문은 "2회의 자체 검증 학습 사이클로 51.70%→86.52%"를 보고한다 — 전혀 다른 벤치마크 버전(Terminal-Bench 2.1)이라 직접 비교는 불가하지만, 같은 베이스 모델로 전혀 다른 수치가 돈다는 점에서 벤더 수치 단독 신뢰는 위험하다는 걸 보여준다.

## 인상 깊은 문장

> (2차 소스 재인용, 1차 확인 못함) "DaisyRose-27B: modelo abierto sube Terminal-Bench a 12%."

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: 이 노트는 "확인했다"가 아니라 "확인하지 못했다"는 사실 자체를 기록한다. RadixArk라는 회사/프레임워크(Miles) 자체 실재는 HuggingFace 페이지로 간접 확인되나, DaisyRose-27B 모델 자체의 1차 출처는 없다.

## 내 생각 · 적용점

### 적용점

벤더(또는 2차 매체)가 제시하는 벤치마크 수치는 실행 횟수·하네스·요약 활성화 여부 같은 측정 조건을 반드시 먼저 확인해야 하고, 그 조건을 확인할 1차 소스가 없다면 수치 자체를 "참고 불가"로 다뤄야 한다는 원칙을 재확인한다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 오픈 모델 벤치마크 소식이고 1차 확인도 안 된 상태라 적용 판단을 보류한다. "벤더 자체 벤치마크 조건을 반드시 확인한다"는 원칙만 참고할 수 있다.

## 연관 자료

- [[2026-11-17-qwen4-max-long-context-agentic-model]] — 같은 Qwen 계열, 에이전트 지향 모델
- [[2026-11-17-aws-sglang-multimodal-decision-model]] — SGLang 서빙 연결점
- [[2026-11-18-mai-code-2-code-2-flash-release]] — 같은 주 코딩/에이전트 모델 출시 계열

## 한 달 뒤 회고

2026-12-20 즈음 — RadixArk 공식 모델 카드가 공개됐는지, DaisyRose-27B의 1차 소스를 확보했는지 점검.
