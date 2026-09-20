---
title: "Laya - 직접 실행하고 학습할 수 있는 Jev의 오픈소스 대안 (Convai Innovations) — 421M 파라미터로 TypeSafe의 공개 벤치마크(0.727)를 넘어선 0.766을 주장하지만, 검증은 아직"
source_title: "Laya is a 421M open-weights answer to Jev"
source_url: "https://techaiwire.com/articles/laya-open-weights-jev-typed-decisions/"
source_name: "Tech AI Wire · GitHub(NandhaKishorM/laya)"
referrer_url: "https://news.hada.io/topic?id=33944"
published_at: "확인 불가"
summarized_at: "2026-09-20"
category: "ai"
tags: ["jev", "laya", "typed-judgments", "open-source", "modernbert", "rlcd", "small-model", "apache-2.0"]
---

# Laya - 직접 실행하고 학습할 수 있는 Jev의 오픈소스 대안 (Convai Innovations)

> 출처: [Laya is a 421M open-weights answer to Jev](https://techaiwire.com/articles/laya-open-weights-jev-typed-decisions/) (Tech AI Wire) · GeekNews(id=33944) 경유 · 정리일 2026-09-20
>
> **출처 한계**: `news.hada.io` 접근이 egress 정책으로 차단돼 원문을 직접 읽지 못했다. Slack GN⁺ 발췌(4개 불릿, 마지막 불릿 "업무 데이터로 미세조정…"에서 잘림)와 WebSearch로 확보한 dev.to·GitHub(`NandhaKishorM/laya`)·Tech AI Wire·gadgetpilipinas.net 스니펫을 교차해 재구성했다. 눈에 띄는 건 WebSearch 결과에 "Laya's Jev claim needs a repo-first reality check"라는 회의적 제목의 별도 글(kenashe.ai)이 함께 잡힌다는 점 — 즉 발표 직후부터 Laya의 벤치마크 주장에 의문을 제기하는 목소리가 있었다는 정황이나, 그 글 본문은 확보하지 못했다.

## 한 줄 요약

**Convai Innovations가 텍스트 생성 대신 선택지별 확률·점수·예아니오 확률을 반환하는 비자기회귀형 의사결정 모델 Laya를 Apache-2.0으로 공개했다 — 421M 파라미터(ModernBERT-large 인코더 위에 소형 판단 헤드)로 자체 GPU에서 질문 1개당 32.8ms, 배치 처리 시 질문당 7.2ms를 기록했고, 자체 평가에서는 파인튜닝 체크포인트가 0.766점으로 TypeSafe가 공개한 Jev의 0.727을 웃돈다고 주장한다.**

## 핵심 포인트

- **동작 원리 — 비자기회귀형 의사결정 모델** — 텍스트를 생성하는 대신 ***선택지별 확률, 점수, 참일 확률***을 반환하는 모델군으로, ***하나의 입력에 대한 여러 질문을 한 번의 순전파(forward pass)로 처리***한다.
- **사용 사례** — 고객 문의 담당 부서 배정, ***피싱 판별***, ***긴급도 평가***처럼 긴 답변보다 빠른 판단이 필요한 작업에 쓰도록 설계.
- **속도 — 32.8ms / 7.2ms** — 양방향 인코더 기반으로 자체 GPU 측정에서 질문 하나를 ***32.8ms***, 질문 10개를 배치 처리할 때 질문당 ***7.2ms***에 평가.
- **아키텍처 세부(WebSearch 확인)** — ***ModernBERT-large가 421M 중 395M을 차지***하고, 그 위에 두 개의 트랜스포머 레이어·답변 옵션 스코어러·행동/에스컬레이션 판단 헤드로 구성된 소형 결정 헤드를 얹은 구조 — 완전히 새로운 아키텍처가 아니라 검증된 인코더 위에 작은 스택을 쌓은 형태.
- **학습·재현성** — 영어용, 다국어용, 업무 특화 모델과 코드를 ***Apache-2.0***으로 공개해 자체 서버에서 실행·업무 데이터로 미세조정할 수 있다. WebSearch로 확인한 바로는 ***Kaggle의 무료 2×T4 GPU***에서 데이터셋 구축부터 RLCD(proper-scoring-rule 보상 + GRPO 스타일 정책 경사) 학습, 보정 온도(calibration temperature) 조정, 평가, Hub 업로드까지 전체 루프를 돌릴 수 있다고 한다.
- **벤치마크 주장 — Jev의 공개 수치를 넘어섰다는 주장** — typed-decisions 벤치마크에서 기본 체크포인트는 제로샷 기준 거의 우연 수준이지만, ***파인튜닝 체크포인트는 동일 2,000개 판단에서 0.766점을 기록해 TypeSafe Jev의 공개 수치 0.727을 웃돈다***고 주장한다 — 다만 이 비교가 동일한 평가 조건·데이터셋인지는 확인되지 않았다.

## 인상 깊은 문장

> "Laya returns typed decisions in 32.8 milliseconds from 421M parameters under Apache 2.0. ... the fine-tuned checkpoint reaches 0.766 on the same 2,000 decisions — above TypeSafe Jev's published 0.727."
> (WebSearch로 확보한 원문 취지의 재구성.)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: "Jev를 넘어섰다"는 주장은 오픈소스 프로젝트 자체의 벤치마크이고, WebSearch에서 발견된 별도 글의 제목("repo-first reality check")이 시사하듯 발표 직후부터 검증 요구가 있었던 것으로 보인다. 421M의 소형 모델이 상용 프런티어급 System One 모델의 공개 벤치마크를 넘어선다는 주장은 인상적이지만, 같은 평가 세트·방법론을 썼는지, 제3자 재현이 있었는지는 이 정보만으로 확인할 수 없다 — 축배를 들기 전에 재현부터 확인해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — jevlike와는 다른 오픈소스 재구현, 검증 가능성의 두 번째 후보

[[2026-09-18-jevlike-open-source-jev-probability-model]]은 vinnylarouge의 `jevlike`를 다뤘다 — 옵션-주의(attention) 헤드로 확률을 계산하는 다른 메커니즘의 재구현이었다. Laya는 ***ModernBERT + 판단 헤드***라는 또 다른 아키텍처로 같은 목표(Jev와 같은 입출력 형태)에 도달한 세 번째 독립 시도(TypeSafe 원조, jevlike, Laya)다 — 다만 Laya는 jevlike과 달리 처음부터 ***정량 벤치마크 수치를 공개하고 Jev와 직접 비교***했다는 점에서 "외부 검증 가능성을 연다"는 jevlike 노트의 지적을 한 걸음 더 실행에 옮긴 사례로 볼 수 있다.

### 핵심 전이 2 — "작은 특화 모델이 프런티어를 이긴다" 패턴이 이번엔 상용 모델의 공개 수치 자체를 정조준한다

[[2026-08-02-500-dollar-finetune-beats-frontier-models]]가 세운 "변하지 않는 판단 기준만 작은 모델에 새기면 프런티어를 이길 수 있다"는 패턴을, Laya는 범용 LLM이 아니라 ***같은 카테고리의 상용 전문 모델(Jev)의 공개 벤치마크***를 상대로 재현하려 시도한다 — 비교 대상이 한 단계 더 좁고 구체적이 됐다는 점에서 이 패턴의 검증 난도도 함께 올라간다.

## 호스피탈리티 / CRS 적용 포인트

[[2026-09-18-jevlike-open-source-jev-probability-model]]에서 이미 짚은 "예약 요청 분류, 리뷰 감성 점수화, 채널 메시지 라우팅" 같은 CRS 반복 판단 작업의 오픈소스 후보가 하나 더 늘었다는 점에서 실질적 진전이다. ***피싱 판별·긴급도 평가***라는 이 프로젝트의 명시적 사용 사례는 CRS의 스팸/이상 예약 탐지와 정확히 겹친다. 다만 벤치마크 주장 자체가 제3자 검증 전이므로, 지금은 골든셋으로 직접 재현 벤치마크를 돌려보는 프로토타입 단계로 접근해야 한다.

## 연관 자료

- [[2026-09-18-jevlike-open-source-jev-probability-model]] — 같은 목표의 다른 오픈소스 재구현(옵션-주의 메커니즘), 이 노트는 세 번째 독립 시도
- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Laya가 직접 벤치마크를 겨냥한 상용 원조
- [[2026-08-02-500-dollar-finetune-beats-frontier-models]] — "작은 특화 모델이 이긴다"는 같은 패턴의 선행 사례

## 한 달 뒤 회고

*(2026-10-20 즈음 — "0.766 vs 0.727" 비교의 평가 조건이 동일했는지 제3자 검증이 나왔는지, kenashe.ai의 회의적 분석 본문을 확보해 반박 근거를 확인, GitHub 스타·이슈로 실사용 정황을 점검.)*
