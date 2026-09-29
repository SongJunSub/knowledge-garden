---
title: "Jeff - 집에서 학습한 Jev 호환 0.8B 의사결정 모델 (firelex) — GPU 한 장으로 2시간, 클라우드도 폐쇄형 모델 출력도 쓰지 않았다"
source_title: "Jeff — Jev-compatible 0.8B decision models, trained at home, ~30ms"
source_url: "https://github.com/firelex/jeff"
source_name: "GitHub (firelex/jeff)"
referrer_url: "https://news.hada.io/topic?id=34459"
published_at: "2026-09-28"
summarized_at: "2026-09-29"
category: "ai"
tags: ["jev", "decision-model", "qwen3-5", "gemma4", "zero-shot-classification", "local-training", "logprobs"]
---

# Jeff - 집에서 학습한 Jev 호환 0.8B 의사결정 모델 (firelex)

> 출처: [Jeff](https://github.com/firelex/jeff) (firelex, GitHub) · Hacker News("Jeff – Jev-compatible 0.8B decision models, trained at home, ~30ms") · GeekNews(id=34459) 경유 · 정리일 2026-09-29
>
> **출처 한계**: `news.hada.io`, GitHub 저장소 본문, HN 스레드 원문 모두 직접 페치는 egress 차단으로 막혔다. WebSearch로 확보한 AI 다이제스트 사이트(ai-tldr.dev, explainx.ai)와 HN 아이템 메타데이터를 교차해 재구성했다. HN 포인트·댓글 수는 정리 시점에 따라 스니펫마다 수치가 달라(한쪽은 322pt·131댓글로 언급) 정확한 최종 수치로 확정하지 못했다. Gemma 4는 실제로는 "Gemma 4 E2B" 체크포인트로 보인다.

## 한 줄 요약

**Jeff는 Qwen3.5(0.8B/2B)와 Gemma 4 E2B를 파인튜닝해 Jev와 같은 요청 형식으로 상황·선택지를 받아 문장 대신 선택지별 확률을 반환하는 소형 의사결정 모델로, 학습·합성 데이터 생성·테스트를 전부 개인 워크스테이션에서(클라우드 GPU도 폐쇄형 모델 출력도 쓰지 않고) 끝냈다는 게 핵심 주장이다.**

## 핵심 포인트

- **Jev와 같은 요청 형식, 다른 학습 경로** — 상황과 선택지를 자연어로 넣으면 문장을 생성하는 대신 ***선택지별 확률을 한 번의 순전파로 반환***한다. 고객 문의 분류, 사용자 의도 파악, 음성 명령 처리 같은 반복 판단에 바로 붙일 수 있는 형식이다.
- **속도**: 0.8B 모델이 M4 Max에서 28ms, RTX PRO 6000에서 22ms. 2B 모델은 공개 벤치마크 5종 평균 83.1%로 Jev가 공개한 83.0%와 대등하다고 주장한다.
- **작은 모델이 더 잘한 역설적 사례** — 저자들이 자체 테스트한 Pac-Man류 게임 플레이에서는 오히려 ***0.8B가 57.0포인트, 2B가 41.2포인트로 더 큰 모델이 더 신중하고 약한 플레이어였다***는 결과가 나왔다고 언급된다. 표준 벤치마크 정확도와 실제 순차적 의사결정 능력이 반드시 같이 가지 않는다는 신호로 읽을 수 있다.
- **완전 자급 학습** — 학습·합성 데이터 생성·테스트를 모두 로컬 장비에서 수행했고, ***클라우드 GPU나 폐쇄형(closed) 모델의 출력을 학습 데이터로 쓰지 않았다.*** 0.8B 모델 학습에는 GPU 한 장으로 약 2시간, 2B는 약 3.5시간이 걸렸다고 언급된다.
- **라이선스·배포** — 3개 체크포인트(Jeff-Qwen3.5-0.8B/2B, Jeff-Gemma4-E2B)를 Hugging Face에 Apache 2.0으로 공개, GitHub 저장소는 공개 첫날 기준 수백 개 스타를 받았다고 언급된다(정확한 수치는 시점마다 다름).

## 인상 깊은 문장

> "Jeff – Jev-compatible 0.8B decision models, trained at home, ~30 ms" (Hacker News 게시 제목, WebSearch로 확인)

## 댓글

**HN 스레드가 존재한다는 것은 여러 스니펫으로 교차확인했으나, 정확한 포인트·댓글 수는 확정하지 못했다**(한 소스는 322pt·131댓글로 언급하나 다른 트래킹 사이트 수치와 불일치할 수 있다고 스스로 단서를 달았다). HN에서는 "이거 그냥 로그확률 읽는 거 아니냐"는 질문이 나왔고 저자가 저장소에서 답했다는 언급이 있다 — [[2026-09-28-glm-5-3-flash-jev-like-decision-model]]에서 본 "로그확률 읽기" 트릭과 같은 종류의 의심이 이번에도 제기된 셈이다. Lobsters 언급은 찾지 못했다. **정직하게 감안할 점**: (1) "GPU 한 장, 2시간, 클라우드/폐쇄형 모델 미사용"이라는 서사는 검증하기 어려운 자기 신고 수치다. (2) 벤치마크 5종·Pac-Man 테스트 모두 저자 자체 선정·자체 실행이라 제3자 재현 전까지는 유보적으로 봐야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 재구현 계보에 "완전 독립 파인튜닝" 갈래가 추가된다

이 가든은 [[2026-09-16-typesafe-ai-jev-typed-judgments]](원조)부터 [[2026-09-21-jev-field-guide-system-one-model]], [[2026-09-27-jev-single-function-vision-wrapper]], 바로 전날 정리한 [[2026-09-28-glm-5-3-flash-jev-like-decision-model]]까지 Jev 재구현을 계속 추적해왔다. 전날 사례(GLM-5.3-Flash)는 ***기존 상용 모델에 프롬프트 설계만 얹어 파인튜닝을 생략***한 반면, Jeff는 정반대로 ***직접 파인튜닝하되 학습 과정 전체를 개인 장비로 독립시켰다.*** "Jev급 성능에 도달하는 경로가 하나가 아니라 최소 두 갈래(프롬프트 설계 vs 로컬 파인튜닝)로 수렴하고 있다"는 패턴이 이틀 연속으로 확인된 셈이다.

### 핵심 전이 2 — 벤치마크 정확도와 순차적 판단 능력의 괴리

Pac-Man 테스트에서 더 큰 2B가 더 작은 0.8B보다 약한 플레이어였다는 관찰은, [[2026-09-28-normalization-of-unexplainable-failure]]가 짚은 "evals·ground-truth 없이는 신뢰도 수치가 아무것도 보장하지 않는다"는 경고와 같은 방향이다. 공개 벤치마크 5종 평균 정확도가 같아도 실제 순차 의사결정(게임 플레이처럼 상태가 바뀌는 반복 판단)에서는 뒤집힐 수 있다는 사례가 하나 더 쌓였다.

## 호스피탈리티 / CRS 적용 포인트

CRS 문의 분류·조항 판별처럼 "정해진 선택지 중 하나"를 반복 판단하는 유스케이스는 이 가든이 Jev 계열 노트마다 짚어온 것과 동일하다. 이번 사례에서 새로 챙길 점은 두 가지다. 첫째, ***완전 로컬 학습이 가능하다면*** 온다처럼 고객사별 문의 데이터가 민감한 환경에서 그 데이터를 외부로 내보내지 않고 판단 모델을 직접 파인튜닝할 수 있다는 선택지가 열린다. 둘째, Pac-Man 역설처럼 표준 벤치마크만으로 판단 모델을 고르면 안 되고, ***실제 배포 시나리오(순차적 문의·상태 변화)와 최대한 비슷한 자체 evals***로 재검증해야 한다는 경고로 삼을 만하다.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Jev 원조, "System One 모델" 개념 최초 소개
- [[2026-09-28-glm-5-3-flash-jev-like-decision-model]] — 바로 전날 정리한 Jev 재구현, 파인튜닝 없이 프롬프트만으로 대등한 성능을 낸 반대 접근
- [[2026-09-28-normalization-of-unexplainable-failure]] — 벤치마크 신뢰도 수치가 실사용 신뢰를 보장하지 않는다는 경고와 같은 축

## 한 달 뒤 회고

*(2026-10-29 즈음 — GitHub 스타·HN 포인트 최종 수치가 안정됐는지, 독립 재현 벤치마크나 Pac-Man류 순차 판단 테스트가 제3자에 의해 검증됐는지 확인.)*
