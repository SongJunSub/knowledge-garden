---
title: "CLM (Contrastive-LM) — 문장을 생성하지 않고 상태-행동을 벡터로 대조 학습해, Jev보다 최대 9배 빠르게 다음 행동을 고른다"
source_title: "CLM-8B: An Open System One Model That Scores Agent Actions Up to 9x Faster Than Jev"
source_url: "https://github.com/Contrastive-LM/CLM"
source_name: "Contrastive-LM(GitHub·HuggingFace), MarkTechPost·explainx.ai, WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=34240"
published_at: "2026-09-23"
summarized_at: "2026-09-25"
category: "ai"
tags: ["jev", "contrastive-learning", "decision-model", "system-one-model", "bi-encoder", "open-source", "agent-tooling"]
---

# CLM (Contrastive-LM) — 문장을 생성하지 않고 상태-행동을 대조 학습해 다음 행동을 고른다

> 출처: [Contrastive-LM/CLM](https://github.com/Contrastive-LM/CLM) (GitHub · HuggingFace) · GeekNews(id=34240) 경유 · 정리일 2026-09-25

## 한 줄 요약

**CLM(Contrastive Language Model)은 Contrastive-LM이 공개한 오픈 모델로, 상태(state)와 후보 행동(action)을 각각 별도 인코더로 벡터화한 뒤 대조 학습(bidirectional InfoNCE)으로 정렬시켜, 문장을 생성하는 대신 주어진 후보들의 점수·확률만 반환한다. 자체 평가에서 컴퓨터 조작·게임 조작·도구 선택 과제는 Jev와 동등한 성능을 최대 9배 빠르게 냈고, Opus 5·Fable 5가 만든 코딩 후보 중 최적을 고르는 평가에서는 SOTA를 기록하며 Jev보다 4.1~5.7배 빨랐다.**

## 핵심 포인트

- **아키텍처를 처음부터 공개한다** — 고정된(frozen) Qwen3-8B 인코더 위에 상태 헤드·행동 헤드라는 두 개의 작은 프로젝션 헤드만 얹고, 양방향 InfoNCE 손실로 그 두 헤드만 학습한다. ***"현재 상황과 후보 행동을 각각 벡터로 변환하고, 올바른 조합은 가깝게 잘못된 조합은 멀어지도록 학습"***하는 구조로, Jev처럼 내부 구조가 블랙박스로 남지 않는다.
- **생성 없이 주어진 후보만 채점** — "CLM only scores the candidates you give it"(WebSearch) — 후보 자체를 만들어내는 능력은 없고, 후보를 직접 제시해야 그 안에서 순위를 매긴다. 문장을 길게 생성하지 않고 후보별 점수와 확률만 계산하는 구조라, Jev의 noul/choice/score 같은 자유 판단 질의와는 인터페이스가 다르다.
- **후보 행동 임베딩을 미리 계산해 재사용 가능** — 상태 인코더와 행동 인코더가 분리된 이중 인코더(bi-encoder) 구조라, **같은 후보 집합이 반복되는 작업에서는 행동 임베딩을 한 번만 계산해두고 상태가 바뀔 때마다 재사용**할 수 있다. 고정된 도구 목록·게임 조작 후보·정형화된 분류 카테고리처럼 선택지가 자주 반복되는 작업에서 특히 유리하다.
- **벤치마크 수치** — zero-shot 기준 computer-use·게임·tool-calling 과제에서 Jev와 견줄 만한 성능을 최대 9배 낮은 지연으로 냈다고 주장한다. 코딩 평가에서는 Opus 5가 만든 DeepSWE 후보(best-of-4), Fable 5가 만든 Terminal-Bench 2.1 후보(best-of-5) 중 CLM이 최적을 골라 각각 81.6%, 87.6%로 SOTA를 기록했고, 이 과정이 Jev 대비 4.1~5.7배 빨랐다고 보고한다.
- **공개 방식** — GitHub(`Contrastive-LM/CLM`)와 HuggingFace(`Contrastive-LM/CLM-v0.1-8B`)에 가중치와 코드를 공개했다.

## 인상 깊은 문장

> "CLM only scores the candidates you give it, so it produces no prose, no rationale, no draft, and no code."
> (아키텍처 설명, WebSearch 발췌)

> "CLM-8B is pre-trained on internet-scale data and delivers up to 9× faster inference than Jev while achieving comparable performance across computer-use, gaming, and tool-calling tasks."
> (공개 발표문, WebSearch 발췌)

## 댓글

**확인 불가.** `news.hada.io`가 이 세션에서 egress 차단돼 hada 댓글 수·큐레이션 여부를 직접 확인하지 못했다. GitHub·HuggingFace·MarkTechPost·explainx.ai 등을 WebSearch로 교차확인해 핵심 포인트를 재구성했다. **가장 중요한 한계는 SOTA·9배·4.1~5.7배라는 수치 전부가 Contrastive-LM 자체 벤치마크라는 점이다.** 이 가든이 [[2026-09-21-jev-field-guide-system-one-model]]에서 Jev의 자체 평가표를 다룰 때 반복해서 경고했던 것과 똑같은 주의가 그대로 적용된다 — 벤더 자체 측정치는 비교 기준(어떤 모델·어떤 워크플로 구성과 견줬는지)을 뜯어보기 전까지는 액면 그대로 받아들이면 안 된다. 이 노트 작성 시점에는 제3자 재현 검증이 확인되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 계열에 다른 경로로 도달한 새 갈래가 붙는다

이 가든에는 이미 [[2026-09-21-jev-field-guide-system-one-model]](Jev 원조), [[2026-09-22-kev-open-source-jev-decision-model]](Qwen3.5 기반 재현), [[2026-09-18-jevlike-open-source-jev-probability-model]] 등 판단 전용 소형 모델 계열 노트가 쌓여 있다. 이 노트들 대부분은 Jev의 **입출력 형태(noul/choice/score)를 그대로 재현**하는 방식이었다. CLM은 접근이 다르다 — 대조 학습 기반 이중 인코더는 정보검색의 dense retrieval과 같은 원리로, Jev를 모방한 게 아니라 **"빠른 판단"이라는 같은 목적지에 다른 계열의 방법으로 도착**했다. 같은 문제에 두 갈래 길이 동시에 열려 있다는 뜻이다.

### 핵심 전이 2 — Jev가 프로빙으로 추정해야 했던 것을, CLM은 처음부터 공개한다

[[2026-09-20-jevs-architecture-unmasked]]가 짚었듯 Jev의 내부 구조는 비공개 API에 약 1만 번을 던져 **관측으로 추정**해야 했다. CLM은 이 문제를 애초에 겪지 않는다 — 고정 인코더 위에 얹은 두 개의 프로젝션 헤드라는 구조를 공개 문서로 명시한다. 판단 모델 시장이 "블랙박스 상용 API"(Jev)와 "공개 아키텍처 오픈 웨이트"(CLM, 그리고 앞서의 Kev·Laya) 두 축으로 갈라지는 흐름을, CLM이 후자 쪽에 아키텍처까지 투명하게 공개한 사례로 더한다.

### 핵심 전이 3 — [[2026-09-24-tokens-too-cheap-to-meter]]의 "저가 판단 호출 인프라화"와 캐싱 구조가 정확히 맞물린다

그 글은 Jev급 초저가 판단 모델을 jgrep 같은 devtool에 촘촘히 박아 넣는 흐름을 다뤘다. CLM의 "후보 행동 임베딩을 미리 계산해 재사용"하는 구조는 이 흐름을 한 단계 더 밀어붙인다 — **후보 집합이 고정돼 있고 반복적으로 판단해야 하는 작업일수록, CLM류 이중 인코더 구조의 경제성이 커진다.** 판단 호출의 단가가 이미 낮아진 상황에서, 반복되는 후보 집합을 캐싱까지 할 수 있다면 그 단가는 한 번 더 내려간다.

## 호스피탈리티 / CRS 적용 포인트

CRS 문의 분류나 업무 라우팅처럼 **후보 집합(담당 부서, 처리 유형, 룸 카테고리)이 고정돼 있고 반복적으로 판단해야 하는 작업**에 구조적으로 잘 맞는다. 문의 내용(상태)만 바뀌고 담당 부서·처리 유형(후보) 자체는 자주 바뀌지 않는다면, 후보 임베딩을 미리 계산해두고 상태만 대조하면 되므로 새 후보가 추가되지 않는 한 재계산 비용이 거의 없다. 다만 [[2026-09-21-jev-field-guide-system-one-model]]이 Jev 계열 전체에 걸어둔 경고가 CLM에도 그대로 적용된다 — 제작사 자체 벤치마크(SOTA, 9배 등)는 제3자 재현 전까지 그대로 믿을 근거가 아니고, 한국어 판단 성능 실측이 전혀 없다는 한계도 이 계열 전체에 공통이다. 도입 검토를 시작한다면 가장 먼저 필요한 것은 실제 한국어 문의 데이터로 만든 자체 평가셋이다.

## 연관 자료

- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 원조, CLM에도 그대로 적용되는 "벤더 자체 측정" 경고의 출처
- [[2026-09-22-kev-open-source-jev-decision-model]] — Jev의 입출력을 재현한 오픈소스 대안(CLM과는 다른 접근)
- [[2026-09-18-jevlike-open-source-jev-probability-model]] — Jev 첫 오픈소스 재현 시도
- [[2026-09-20-jevs-architecture-unmasked]] — Jev의 비공개 구조를 프로빙으로 추정한 분석, CLM은 이 문제를 겪지 않음
- [[2026-09-24-tokens-too-cheap-to-meter]] — 저가 판단 호출을 devtool에 박아넣는 흐름, CLM의 캐싱 구조가 그 다음 단계

## 한 달 뒤 회고

*(2026-10-25 즈음 — CLM의 SOTA·배수 주장에 대한 제3자 재현이 나왔는지, 한국어 판단 성능 실측이 나왔는지, CRS 문의 분류에 고정 후보 캐싱 구조를 실제로 검토할 만한지 점검.)*
