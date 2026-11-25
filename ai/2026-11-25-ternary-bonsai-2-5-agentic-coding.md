---
title: "Ternary Bonsai 2.5 27B, 5.9GB를 유지하며 에이전트 코딩 강화 (GeekNews, PrismML) — 전작 Bonsai 2의 '9배 압축·98.2% 유지' 공식을 에이전트 작업축으로 재검증"
source_title: "Ternary Bonsai 2.5 27B - 5.9GB 크기를 유지하며 에이전트 코딩을 강화한 로컬 AI 모델"
source_url: "https://news.hada.io/topic?id=37796"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37796"
published_at: "확인 불가"
summarized_at: "2026-11-25"
category: "ai"
tags: ["prismml", "ternary-bonsai", "quantization", "qwen", "swe-bench", "appworld", "agentic-coding", "local-llm"]
---

# Ternary Bonsai 2.5 27B, 5.9GB를 유지하며 에이전트 코딩 강화 (GeekNews, PrismML)

> 출처: [Ternary Bonsai 2.5 27B - 5.9GB 크기를 유지하며 에이전트 코딩을 강화한 로컬 AI 모델](https://news.hada.io/topic?id=37796) (GeekNews) · 정리일 2026-11-25

> **출처 한계**: `news.hada.io`가 세션 egress 차단으로 원문 미열람. PrismML·Ternary Bonsai 프로젝트 자체는 WebSearch로 Hugging Face·Together.ai·LM Studio 등 복수 소스로 실존 확인된다. 다만 ***이번 글이 말하는 "Ternary Bonsai 2.5"라는 정확한 버전명은 WebSearch로 못 찾았다*** — 확인되는 것은 "Ternary Bonsai 2 27B"(2026-09-17 공개, [[2026-09-18-bonsai-2-27b-ternary-compression]]에서 이미 다룸)와 "Ternary Bonsai 27B"(1세대) 두 버전뿐이다. SWE-bench Verified 60.8→75.6, AppWorld 51.2→90.5라는 구체 수치도 이번 WebSearch로 독립 재확인하지 못했다. Qwen3.8 27B라는 베이스 모델명은 이 레포에 이미 여러 노트([[2026-09-09-qwen3-8-27b-quantization-benchmark]] 등)가 다룰 만큼 실존이 확고하다.

## 한 줄 요약

**PrismML이 Qwen3.8 27B 기반 3진(ternary) 양자화 모델의 최신판("2.5"로 추정)을 공개해, 5.9GB 크기를 유지하면서 에이전트 코딩 벤치마크(SWE-bench Verified, AppWorld)에서 큰 폭의 향상을 주장한다 — 다만 "2.5"라는 버전명과 구체 수치는 WebSearch로 독립 확인되지 않았고, 확인되는 건 전작 "Bonsai 2"가 20개 벤치마크 종합 98.2% 성능 유지라는 비슷한 종류의 주장을 이미 했다는 전례뿐이다.**

## 핵심 포인트

- **같은 회사·같은 공식의 반복** — PrismML은 [[2026-09-18-bonsai-2-27b-ternary-compression]]에서 이미 "−1/0/+1 3진 가중치, 1.76비트, 9배 압축, 20개 벤치마크 98.2% 유지"를 주장했다. 이번 글은 같은 압축 기법을 ***일반 벤치마크 축에서 에이전트 코딩 축으로 좁혀 재검증***하는 후속편으로 보인다.
- **크기는 그대로, 과제 성격이 바뀜** — 5.9GB라는 크기는 전작과 동일하게 유지하면서 "연속 도구 호출 해석·실패 대응·작업 목표 유지"라는 ***장기 에이전트 과제 전용 성능***을 개선했다는 주장. 압축 자체의 기술적 진전이 아니라 같은 압축 모델을 에이전트 워크로드에 맞게 추가 튜닝한 것으로 읽힌다.
- **LiveCodeBench 하락은 트레이드오프의 증거** — SWE-bench·AppWorld는 오르고 LiveCodeBench v6는 소폭 하락했다는 서술은, ***특정 벤치마크 축에 맞춰 양자화 이후 파인튜닝하면 다른 축이 희생될 수 있다***는 양자화 모델의 일반적 트레이드오프와 일치해 그럴듯하다.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함.)

## 댓글

hada 댓글 수 확인 불가. ***"PASS" 아님을 명시***: PrismML과 Ternary Bonsai 계열 자체는 실존하지만, "2.5"라는 버전과 이번 벤치마크 수치는 독립 확인하지 못한 채로 남긴다 — 벤더 자체 발표라는 이해관계도 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 "9배 압축" 서사가 벤치마크 축만 바꿔 반복된다

[[2026-09-18-bonsai-2-27b-ternary-compression]](일반 벤치마크 98.2% 유지)와 이 글(에이전트 벤치마크 대폭 상승)을 나란히 읽으면, PrismML이 ***하나의 압축 기법을 여러 벤치마크 축에서 차례로 검증·홍보***하는 패턴이 보인다. [[2026-09-09-qwen3-8-27b-quantization-benchmark]]가 서드파티 관점에서 "4비트는 무손실, 2비트부터 갈라짐"을 측정했던 것과 비교하면, PrismML의 3진(1.76비트) 압축이 그보다 더 공격적인 압축률에서도 비슷한 무손실 주장을 반복한다는 점이 흥미롭다 — 다만 벤더 자체 벤치마크와 서드파티 벤치마크의 신뢰도 차이는 유지해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 로컬/엣지에서 돌려야 하는 소규모 상담·코딩 보조 에이전트가 있다면, "크기는 유지하되 특정 작업축(도구 호출·다단계 실행)에 맞춰 재튜닝"하는 이 접근은 ***온프레미스 PMS 연동 에이전트를 가벼운 로컬 모델로 돌리면서 특정 반복 작업(예약 변경 다단계 처리)에만 성능을 집중시키는 전략***으로 참고할 만하다.

## 연관 자료

- [[2026-09-18-bonsai-2-27b-ternary-compression]] — 같은 회사·같은 압축 기법의 전작, 일반 벤치마크 축
- [[2026-09-09-qwen3-8-27b-quantization-benchmark]] — 같은 베이스 모델(Qwen3.8 27B)의 서드파티 양자화 벤치마크, 비교 기준점

## 한 달 뒤 회고

2026-12-25 즈음 — "Ternary Bonsai 2.5"라는 버전명이 Hugging Face 등에 정식 등록됐는지, SWE-bench/AppWorld 수치가 제3자 재현 결과와 일치하는지 확인.
