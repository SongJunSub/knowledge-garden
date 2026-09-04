---
title: "OpenAI, GPT-6 Astra 공개 — 사이버보안 Critical 등급 첫 모델, OSWorld 2.0 72.6%·Mind2Web 1.9배 가속, 그런데 AA 지능지수는 61로 제자리"
source_title: "GPT-6 Astra: A new generation of intelligence"
source_url: "https://openai.com/index/gpt-6-astra/"
source_name: "openai.com"
referrer_url: "https://news.hada.io/topic?id=33199"
published_at: "2026-09-03"
summarized_at: "2026-09-04"
category: "ai"
tags: ["openai", "gpt-6-astra", "model-release", "computer-use", "cybersecurity-policy", "pricing", "benchmark"]
---

# OpenAI, GPT-6 Astra 공개

> 출처: [GPT-6 Astra: A new generation of intelligence](https://openai.com/index/gpt-6-astra/) (OpenAI 공식) · 정리일 2026-09-04

## 한 줄 요약

**OpenAI가 사전학습·강화학습·정렬 연구를 결합한 차세대 모델 GPT-6 Astra를 공개했다.** 컴퓨터·브라우저를 직접 조작하는 작업의 속도·정확도를 끌어올렸고(OSWorld 2.0 72.6%, 약 40분 — Sol의 65.7%·75분보다 빠르고 정확함), Codex와 결합한 Mind2Web 작업은 1.9배 빨라졌다. 사이버보안 능력이 처음으로 "Critical" 임계점에 도달한 모델이라 코드 취약점 탐지는 허용하되 실제 익스플로잇 생성 요청은 차단하는 정책이 붙었다. 그런데 HN launch 스레드(1,000+ 댓글)가 짚은 진짜 논쟁거리는 따로 있다 — Artificial Analysis 지능지수는 61로 이전 모델들과 비슷한데, 보안·수학 벤치마크는 압도적이라는 점수 간 불일치다.

## 핵심 포인트

- **작업 대상 확장** — 코딩, 문서 제작, 과학 연구, 보안 작업까지 폭넓은 전문 업무 수행을 목표로 설계. 사용자의 의도와 허가된 범위를 더 안정적으로 따르도록 정렬에 무게를 실었다.
- **컴퓨터 사용 벤치마크** — OSWorld 2.0에서 **72.6%**(약 40분/작업), 이전 모델 GPT-5.6 Sol은 65.7%(약 75분) — 정확도와 속도 모두 개선. Codex 결합 Mind2Web 작업은 **1.9배 빠르게** 완료.
- **수학** — 소수 간격(prime gap) 상한을 240에서 186으로 개선.
- **사이버보안** — OpenAI 자체 등급에서 처음으로 **Critical 임계점**에 도달한 모델로 분류. ExploitBench에서 높은 점수를 냈다고 보도됐으나, 실제 PoC 익스플로잇 생성 요청 자체는 정책적으로 차단한다.
- **출시·가격** — 2026년 9월 3일(현지시간) 출시. Daybreak 프로그램 기업에 먼저, 이후 ChatGPT Plus/Pro/Business/Enterprise, API, AWS 순으로 확대. 표준 API 가격은 100만 토큰당 입력 $10 / 출력 $50(Fast mode는 $20/$100)로 알려졌다 — Anthropic Opus 5($5/$25)의 2배 수준.
- **Artificial Analysis 지능지수는 61** — 여러 이전·저가 모델과 비슷한 수준. HN 다수 댓글이 "보안·수학에서는 압도적인데 종합 지능지수는 제자리"라는 불일치를 가장 혼란스러운 지점으로 꼽았다.

## 인상 깊은 문장

> "with both frontier labs now at $10/$50, the option to shop between them on price quietly disappeared." (HN 댓글 취지, WebSearch 스니펫 재구성)

## 댓글

**HN launch 스레드가 1,000개 이상의 댓글을 넘겼다**(WebSearch로 확인, 별도 스레드 item id 49554273·49555691·49556147 등 벤치마크별로 나뉘어 있음). 확인된 논쟁 축은 세 가지 — ①AA 지능지수(61)와 보안·수학 벤치마크 결과의 불일치를 다수가 "가장 혼란스러운 부분"으로 지목, ②모델이 자율적으로 제로데이를 찾을 수 있다는 점에 대한 안전 우려, ③런칭 영상이 "이베이에 물건 등록하기"처럼 사소한 사례를 강조한 데 대한 마케팅 비판. **출처 한계** — `news.hada.io`·`openai.com` 모두 이 세션에서 egress 차단돼 원문·hada 댓글은 직접 읽지 못했고, 위 내용은 WebSearch가 여러 매체(CNBC, VentureBeat, The New Stack, DataCamp, Gary Marcus 서브스택 등)에서 일관되게 재현한 스니펫을 교차 검증한 것이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-04-gpt-6-astra-arc-agi-3]]와 짝을 이루는 벤치마크 상세

같은 배치에서 정리한 노트가 ARC-AGI-3(하네스에 따라 62.7%~99.9%)를 다룬다. 그 노트가 짚은 "벤치마크는 측정 조건에 따라 크게 갈린다"는 회의는, 이 노트가 짚은 "지능지수와 특화 벤치마크의 불일치"와 같은 결이다 — **단일 헤드라인 점수로 모델을 판단하면 안 된다**는 원칙이 이번 출시에서 두 방향으로 동시에 확인됐다.

### 핵심 전이 2 — [[2026-07-25-claude-opus-5-release]]와의 가격 경쟁 구도

Opus 5는 "Fable급 지능을 절반 값에"($5/$25)를 내세웠는데, 이번 Astra는 그보다 두 배 비싼 $10/$50이다. 그런데 [[2026-08-23-gpt-5-6-sol-price-cut-20-percent]]에서 OpenAI가 한 달 전 Sol 가격을 20% 인하하며 "Anthropic과의 경쟁 심화"를 이유로 들었던 흐름과 겹쳐 보면, **이번 Astra의 고가 포지셔닝은 그 인하 흐름과 반대 방향**이다 — 플래그십은 비싸게, 기존 티어는 싸게 파는 이원화 전략으로 읽힌다.

### 핵심 전이 3 — [[2026-07-10-gpt-5-6-three-tier-launch]] 이후 두 번째 세대 교체

Sol·Terra·Luna 3단계 티어 체제를 세운 지 약 두 달 만에 그 최상위 자리를 Astra가 대체하는 모양새다. "효율성 우선"을 내세웠던 Sol의 메시지가 이번엔 "컴퓨터·브라우저 조작"과 "사이버보안 Critical"로 옮겨갔다는 것은, OpenAI의 경쟁 축이 토큰 비용에서 에이전틱 작업 능력으로 이동하고 있다는 신호로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 아직 이르다.** 사이버보안 Critical 등급·자율 브라우저 조작 같은 능력은 온다의 현재 워크로드(예약·요금·CRS 데이터 처리)와 거리가 있다. 다만 전이 가능한 원칙은 있다 — **가격이 경쟁사 대비 2배로 뛴 플래그십 모델을, 지능지수 벤치마크(AA 61)가 안 오른 상태로 도입할 이유는 크지 않다.** 온다가 실제로 필요로 하는 능력(장기 워크플로 자동화, 도구 호출 정확도)에 특화된 하위 티어나 경쟁 모델을 먼저 검토하는 편이 이 발표의 실질을 반영한 판단이다.

## 연관 자료
- [[2026-09-04-gpt-6-astra-arc-agi-3]] — 같은 모델의 ARC-AGI-3 벤치마크·비용 상세, 중복 없이 짝을 이룸
- [[2026-07-25-claude-opus-5-release]] — 경쟁 모델의 가격 포지셔닝("절반 값에 Fable급"), Astra와 정반대 방향
- [[2026-08-23-gpt-5-6-sol-price-cut-20-percent]] — 한 달 전 OpenAI의 가격 인하 흐름과의 대비
- [[2026-07-10-gpt-5-6-three-tier-launch]] — Astra가 대체하는 이전 세대 3단계 티어 체제

## 한 달 뒤 회고
*(2026-10-04 즈음 — Astra의 실제 도입 사례·API 성능 리포트가 나왔는지, AA 지능지수와 특화 벤치마크 불일치에 대한 OpenAI의 공식 설명이 있었는지, 가격이 조정됐는지 확인.)*
