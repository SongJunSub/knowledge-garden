---
title: "Edge0-145B — 개인 컴퓨터에서 실행하는 1,450억 매개변수 AI 모델(Edge0 공식 라인업은 35B/8B까지만 확인, 145B 티어는 미확인)"
source_title: "Edge0-145B - 개인 컴퓨터에서 실행하는 1,450억 매개변수 AI 모델"
source_url: "https://news.hada.io/topic?id=37100"
source_name: "GeekNews, 원문 미확인"
referrer_url: "https://news.hada.io/topic?id=37100"
published_at: "확인 불가"
summarized_at: "2026-11-14"
category: "ai"
tags: ["edge0", "local-llm", "qwen", "moe", "on-premise-inference", "benchmark"]
---

# Edge0-145B — 개인 컴퓨터용 1,450억 매개변수 모델(공식 라인업은 35B/8B까지만 확인)

> 출처: [Edge0-145B - 개인 컴퓨터에서 실행하는 1,450억 매개변수 AI 모델](https://news.hada.io/topic?id=37100) (GeekNews, 원문 미확인) · 정리일 2026-11-14
>
> **출처 한계**: `news.hada.io` 차단으로 원문 미확인. WebSearch로 확인되는 Edge0 프로젝트의 공식 공개 라인업은 **35B(MoE)·8B 티어까지**이며(Apple Silicon·MLX 백엔드, Apache 2.0), "145B" 티어의 존재 자체는 이번 검색으로 독립 확인하지 못했다. Slack 발췌가 유일한 근거다. 다만 베이스 모델로 언급된 "Qwen3.8-Flash-Next"는 같은 패밀리의 ~125B 버전을 소비자 GPU 1장에서 돌리는 [[2026-10-05-strata-qwen38-flash-next-local-inference]](Strata)로 이미 독립 확인된 적 있어, Edge0-145B가 같은 베이스 모델의 다른 양자화/변형일 가능성은 있다.

## 한 줄 요약

**Slack 발췌는 Edge0이 Qwen3.8-Flash-Next 기반 145B/120B 모델 가중치와 로컬 추론 엔진을 공개해 RTX 5090 D 24GB 한 장으로 초당 약 100토큰을 낸다고 전하지만, Edge0 프로젝트의 독립 확인 가능한 공식 라인업은 35B/8B까지뿐이라 "145B" 티어와 벤치마크 수치(DeepSWE 1.1 64.6%, Terminal-Bench 2.1 86.52%)는 전부 미확인 상태로 다뤄야 한다.**

## 핵심 포인트

- **(미확인) 145B/120B 가중치 공개** — Qwen3.8-Flash-Next 기반 145B/120B 모델 가중치, 로컬 추론 엔진, 배포 도구를 공개했다는 내용.
- **(미확인) 단일 GPU 실행** — Linux/Windows에서 NVIDIA GPU 한 장으로 실행 가능, RTX 5090 D 24GB·Q3_K 빌드로 채팅 응답 초당 약 100토큰 생성이라는 자체 측정치.
- **(미확인) 벤치마크 비교** — DeepSWE 1.1 64.6%, Terminal-Bench 2.1 86.52%, 같은 조건에서 Qwen3.8-Flash-Next 83.3%·Claude Opus 4.6(Max) 78.2%라는 수치는 Slack 발췌가 유일한 근거이며 Terminal-Bench 2.1 자체의 공식 결과도 교차확인하지 못했다.
- **베이스 모델 계열은 확인됨** — Qwen3.8-Flash-Next는 [[2026-10-05-strata-qwen38-flash-next-local-inference]]를 통해 이미 1,250억 파라미터 MoE 모델로서 소비자 GPU 로컬 추론이 검증된 적 있는 실존 모델이다.

## 인상 깊은 문장

> (원문 미열람 — 인용 생략. Slack 발췌는 수치 중심 요약이라 그대로 인용할 서술형 문장이 없다.)

## 댓글

원문 미열람으로 hada 댓글 수 확인 불가. **이번 노트의 핵심 한계**: "145B"라는 파라미터 숫자와 Claude Opus 4.6과의 벤치마크 비교라는, 가장 눈에 띄는 주장 두 가지가 모두 미확인이다. 특히 자사 제품이 Claude와 경쟁 모델 대비 우위에 있다는 비교 수치는 이해관계가 명백하므로 추가 검증 없이는 신뢰도를 낮게 잡아야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — 같은 베이스 모델, 다른 로컬 추론 접근.** [[2026-10-05-strata-qwen38-flash-next-local-inference]](Strata)는 Qwen3.8-Flash-Next의 24,576개 전문가를 RAM에 두고 자주 쓰는 것만 GPU에 캐싱하는 ***계층별 오프로딩***으로 12GB VRAM급 GPU에서 실행했다. Edge0-145B가 같은 베이스 모델 계열이라면, "전문가 오프로딩으로 저가 GPU에서 돌리기"와 "더 큰 GPU 한 장에 통째로 올려 속도를 끌어올리기"라는 서로 다른 트레이드오프를 택한 것으로 읽을 수 있다 — 다만 145B 자체가 미확인이라 이 비교는 가설 수준이다.

**핵심 전이 2 — 로컬 AI 진입장벽 하락의 연속선.** [[2026-11-12-apple-harbor-mac-cluster-local-ai]]·[[2026-09-04-m4-pro-mac-mini-local-llm]]이 보여준 "로컬 AI 단위가 계속 낮아진다"는 흐름과, "이젠 1,450억(주장) 파라미터급 모델도 개인 GPU 한 장으로"라는 이번 주장은 같은 방향이다. 수치의 진위와 별개로, "더 큰 모델을 더 적은 하드웨어로"라는 업계 전반의 압력 방향은 일관되게 확인된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다의 CRS는 클라우드 기반 멀티테넌트 SaaS로, 개인용 로컬 추론과는 거리가 있다. 다만 "민감한 예약·고객 데이터를 다루는 기능은 온프레미스/프라이빗 추론 옵션이 계속 저렴해지고 있다"는 흐름 정도는 장기적으로 참고할 수 있다.

## 연관 자료

- [[2026-10-05-strata-qwen38-flash-next-local-inference]] — 같은 베이스 모델(Qwen3.8-Flash-Next)의 다른 로컬 추론 접근(계층별 오프로딩)
- [[2026-11-12-apple-harbor-mac-cluster-local-ai]] — 로컬 AI 단위가 계속 낮아지는 같은 흐름
- [[2026-09-04-m4-pro-mac-mini-local-llm]] — 저가 하드웨어로 로컬 LLM 진입장벽이 낮아지는 선행 사례

## 한 달 뒤 회고

*(2026-12-14 즈음 — Edge0-145B의 실존 여부, 벤치마크 수치가 독립적으로 재현됐는지 확인.)*
