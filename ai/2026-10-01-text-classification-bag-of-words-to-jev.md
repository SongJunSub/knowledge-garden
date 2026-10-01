---
title: "텍스트 분류를 위한 언어 모델: Bag-of-Words에서 Jev까지 (Sebastian Raschka) — IMDb 25,000건을 파인튜닝 없이 96.47%, 0.65달러에 분류했지만 '이게 ChatGPT 모멘트'라는 주장은 아직 벤치마크 오염 여부를 모른 채 하는 말이다"
source_title: "Language Models for Text Classification: From Bag-of-Words to Jev"
source_url: "https://magazine.sebastianraschka.com/p/classifier-history-and-jev"
source_name: "Sebastian Raschka (Substack)"
referrer_url: "https://news.hada.io/topic?id=34551"
published_at: "2026-09-29 (추정, HN 게시일 기준)"
summarized_at: "2026-10-01"
category: "ai"
tags: ["jev", "text-classification", "bag-of-words", "rnn", "transformer", "imdb-benchmark", "sebastian-raschka", "decision-model"]
---

# 텍스트 분류를 위한 언어 모델: Bag-of-Words에서 Jev까지 (Sebastian Raschka)

> 출처: [Language Models for Text Classification: From Bag-of-Words to Jev](https://magazine.sebastianraschka.com/p/classifier-history-and-jev) (Sebastian Raschka, Substack) · GeekNews(id=34551) 경유 · 정리일 2026-10-01

> **출처 한계**: `news.hada.io`와 `magazine.sebastianraschka.com` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. WebSearch로 HN 스레드(item?id=49891203)·daily.dev·ai-tldr.dev 등 복수 매체의 일치하는 재인용을 교차확인해 재구성했다. Slack 발췌(4개 불릿, 마지막이 "Jev와 비슷한 API를 만드는 것과..."에서 잘림)의 뒷부분, 즉 저자가 "다양한 작업에 잘 작동하는 API를 직접 만드는 법"을 어떻게 결론짓는지는 확인하지 못했다. hada 댓글 수도 미확인.

## 한 줄 요약

**Sebastian Raschka(딥러닝 교육자, 전 Lightning AI)가 텍스트 분류의 역사를 Bag-of-Words → RNN → CNN → Transformer 순으로 훑은 뒤, TypeSafe의 Jev API로 IMDb 25,000개 리뷰를 파인튜닝 없이 분류해 96.47%(Choice API) 정확도, 총비용 0.65달러, 처리 시간 22분 24초를 기록했다고 보도됐다 — 그는 이를 "분류의 ChatGPT 모멘트"라 부르지만, 이 가든이 이미 추적한 Jev 벤치마크 과적합·정확도-지연 트레이드오프 논쟁을 감안하면 액면 그대로 받아들이기엔 이르다.**

## 핵심 포인트

- **역사적 궤적 — Bag-of-Words가 생각보다 강하다** — WebSearch로 확인한 바로는, 단순 Bag-of-Words + 로지스틱 회귀가 균형 IMDb 감성 데이터셋에서 ***약 89.9% 정확도***를 내며, 처음부터 학습한 LSTM RNN(85.66%)보다 오히려 높았다고 한다. ***단순한 방법이 여전히 유효한 베이스라인***이라는 메시지다.
- **Jev 결과 — 96.47%, 0.65달러, 22분 24초** — Choice API 기준 IMDb 25,000개 리뷰 전량을 별도 미세조정 없이 분류해 이 수치를 냈다. Noul API로는 96.20%로 약간 낮다.
- **"분류의 ChatGPT 모멘트"라는 주장** — 저자는 Jev를 "파인튜닝 없이 많은 분류 작업을 하나의 API로 처리하고, 보정된 확률까지 돌려준다"는 점에서 분류 작업의 전환점으로 평가한다고 전해진다.
- **테스트 데이터 오염 여부는 공개되지 않음** — Slack 발췌가 명시한 한계다. IMDb는 2011년부터 공개된 초유명 벤치마크라, Jev의 사전학습 데이터에 테스트 세트 자체나 그 레이블이 섞여 있었는지 확인할 방법이 없다. 96%대 수치를 "일반화 성능"으로 읽을지 "암기 가능성이 있는 벤치마크 성적"으로 읽을지가 갈린다.
- **"좁고 명확한 작업에는 전용 분류기가 여전히 유효하다"** — Slack 발췌가 전하는 저자의 절제된 결론이다. Jev 같은 범용 판단 모델이 모든 분류 작업을 대체한다는 주장이 아니라, 작업이 안정적이고 라벨이 많다면 ***전용 분류기가 더 싸고 더 적합할 수 있다***는 조건을 남겨둔다.

## 인상 깊은 문장

> "Jev classifies all 25,000 reviews in 22 minutes 24 seconds for $0.65." (WebSearch로 교차확인된 재인용, 원문 직접 대조는 못함)

> (Slack 발췌, 문장 중간에서 끊김) "Jev와 비슷한 API를 만드는 것과 다양한 작업에서 잘 작동하는…"

## 댓글

**hada 댓글 수는 확인 불가**(원문 차단). HN 스레드(`item?id=49891203`)가 존재한다는 것은 WebSearch로 확인했지만, 포인트·댓글 수·논쟁 내용은 이 세션에서 열람하지 못했다. **정직하게 감안할 점**: (1) 이 노트의 모든 수치는 2차 재인용의 교차확인이고, 원문이 직접 밝힌 조건(어떤 프롬프트를 썼는지, Choice와 Noul의 선택지 구성이 어땠는지)은 확인하지 못했다. (2) 저자 Sebastian Raschka는 딥러닝 교육 콘텐츠로 유명한 인물이라 이 글도 "교육적 서사 구성"의 성격이 있을 수 있다 — 역사를 깔끔한 선형 진보로 그리는 경향 자체를 경계할 필요가 있다. (3) "ChatGPT 모멘트"라는 표현은 저자 자신의 과장일 가능성이 있다 — 이 가든이 이미 확인한 Jev 벤치마크의 워크플로별 jaggedness(한 워크플로에서 1위, 다른 워크플로에서 8/9위)를 감안하면 단일 벤치마크(IMDb) 성적으로 "모멘트"를 선언하는 건 섣부르다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 가든의 Jev 재구현/평가 계열에 "역사적 맥락화" 버전이 추가된다

이 가든은 [[2026-09-16-typesafe-ai-jev-typed-judgments]](원조), [[2026-09-21-jev-field-guide-system-one-model]](벤더 평가표 재계산, "Jev가 파는 건 정확도가 아니라 0.4초"), [[2026-09-24-jev-25-lines-of-python]](패러디성 로컬 재구현), [[2026-09-30-jeeves-jev-reasoning-before-deciding]](추론 단계를 더한 파인튜닝 갈래)까지 다양한 각도에서 Jev를 다뤄왔다. 이 글은 그 모든 사례와 다른 축을 더한다 — ***"이게 역사적으로 어디서 왔는가"***라는 계보학적 맥락이다. Bag-of-Words(89.9%)가 LSTM(85.66%)보다 높았다는 사실 하나만으로도, "최신 아키텍처가 항상 이긴다"는 가정이 텍스트 분류 역사 내내 깨져왔음을 보여준다. Jev의 96.47%도 그 연장선 — 새 아키텍처라서가 아니라, 결국 "이 작업에 이 정도 자원을 투입하면 이 정도 성능이 나온다"는 반복되는 패턴의 최신 사례로 읽어야 한다는 게 이 글이 주는 절제다.

### 핵심 전이 2 — "테스트 데이터 오염 미공개"는 이번 배치의 "Pi" 노트([[2026-10-01-pi-mcp-codemode]])와 묶어 읽을 가치가 있는 방법론적 교훈

Jev의 IMDb 성적을 그대로 믿기 어려운 이유(사전학습 데이터 오염 여부 불명)는, [[2026-09-21-jev-field-guide-system-one-model]]이 이미 세운 습관 — ***"표를 열어 대조군을 찾아야 한다"*** — 을 "표가 아예 없을 때는 어떻게 하는가"로 한 단계 더 끌고 간다. 답은 "확인할 수 없다는 사실 자체를 기록해두고, 그 수치를 액면 그대로 전제로 쓰지 않는다"이다. 이번 세션에서 직접 WebFetch가 막혀 2차 재인용에 의존한 것과 구조적으로 같은 문제다 — ***검증 불가능성을 감추지 않고 명시하는 것이 요약의 최소 의무***라는 원칙이 이 가든의 Jev 계열 전체와 이 노트의 출처 한계 서술 모두에 동일하게 적용된다.

## 호스피탈리티 / CRS 적용 포인트

CRS 적용은 [[2026-09-30-jeeves-jev-reasoning-before-deciding]]에서 이미 자세히 다룬 "문의 분류·감정 점수화" 유스케이스와 겹치므로 여기서는 이 글이 더하는 특유의 교훈만 남긴다. **벤치마크 역사를 알면 벤더 주장에 대한 기본 회의 수준이 높아진다** — "최신 모델이 IMDb에서 96%를 냈다"는 숫자는, 그 벤치마크가 2011년부터 공개돼 누구나 레이블을 알고 있다는 역사를 모르면 더 인상적으로 들린다. CRS가 향후 판단 모델 벤더를 평가할 때도 마찬가지다 — 벤더가 제시하는 벤치마크가 ***공개된 지 오래됐고 레이블이 널리 알려진 것인지, 아니면 우리 도메인 데이터로 실측한 것인지***를 구분하는 습관이 필요하다. 전용 분류기가 "작업이 안정적이고 라벨이 충분하면" 더 적합할 수 있다는 저자의 절제된 결론도, CRS의 반복적이고 안정적인 문의 분류 작업에는 오히려 비싼 범용 판단 모델보다 저렴한 전용 분류기가 나을 수 있다는 걸 다시 확인해준다.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Jev 원조 소개, 이 글이 역사적으로 도달하는 종착점
- [[2026-09-21-jev-field-guide-system-one-model]] — "Jev가 파는 건 정확도가 아니라 0.4초"라는 벤치마크 재계산, "표 안의 대조군을 찾으라"는 습관의 원 출처
- [[2026-09-24-jev-25-lines-of-python]] — 같은 핵심 트릭(로짓 → 확률)의 패러디성 로컬 재구현, 이 글과 달리 벤치마크 수치 없이 작동 원리만 보여준 사례
- [[2026-09-30-jeeves-jev-reasoning-before-deciding]] — 추론 단계를 더해 Jev보다 정확도를 올린 갈래, CRS 적용점을 이미 상세히 다룬 선행 노트

## 한 달 뒤 회고
*(2026-11-01 즈음 — HN 스레드 실제 반응(점수·댓글)을 확인할 수 있는지, IMDb 테스트 데이터 오염 여부에 대한 저자나 제3자의 후속 해명이 나왔는지, "분류의 ChatGPT 모멘트"라는 평가에 대한 반박이 있었는지 확인.)*
