---
title: "Kev — 직접 학습하고 실행할 수 있는 Jev 방식 의사결정 모델 (Qwen3.5 기반 오픈소스)"
source_title: "Kev: Tiny Jev-like family of decision models built on top of Qwen3.5"
source_url: "https://github.com/singzhou/kev"
source_name: "GitHub, WebSearch(Hacker News·explainx.ai) 교차확인, GeekNews(id=34065) 경유"
referrer_url: "https://news.hada.io/topic?id=34065"
published_at: "확인 불가(2026-09 공개 추정)"
summarized_at: "2026-09-22"
category: "ai"
tags: ["jev", "decision-model", "qwen3.5", "structured-output", "open-source", "fine-tuning"]
---

# Kev — 직접 학습하고 실행할 수 있는 Jev 방식 의사결정 모델

> 출처: [GeekNews 토픽](https://news.hada.io/topic?id=34065) · [GitHub(kev)](https://github.com/singzhou/kev) (WebSearch 교차확인) · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io`와 GitHub 상세 페이지 egress 차단으로 원문 접근 불가. WebSearch 결과 동일 설명("tiny Jev-like family of decision models built on top of Qwen3.5 you can train and run on your own")을 가진 레포가 `singzhou`, `mobailabs`, `cyanheads` 등 다수 계정에 동시 존재해(가든의 다른 Jev 계열 노트에서도 반복 관찰된 패턴) 원저작자를 완전히 확정하지 못했다. Slack GN⁺ 발췌 + WebSearch(Hacker News, explainx.ai) 로 재구성했다.

## 한 줄 요약

**Kev는 Jev의 오픈소스 대안으로, 긴 문장을 생성하는 대신 Qwen3.5 기반으로 예/아니요 확률·선택지별 확률·평가 점수라는 세 가지 구조화된 판단만 반환하는 0.8B~9B 크기의 의사결정 모델 패밀리이며, 가중치·학습 코드·평가 데이터를 전부 공개해 직접 파인튜닝할 수 있다.**

## 핵심 포인트

- **세 가지 질문 유형으로 판단을 구조화** — Jev의 원조 방식을 그대로 따라 ***noul(예/아니요 확률), choice(최대 255개 선택지 확률), score(순서가 있는 평가 점수)*** 세 가지 질문 유형만 제공한다(WebSearch 확인).
- **하나의 문의를 여러 독립 질문으로 분해** — 고객 문의 하나에서 ***담당 부서, 긴급 대응 여부, 고객의 불만 정도***를 함께 판단할 수 있으며, 각 질문은 다른 질문의 답에 영향을 받지 않도록 분리 설계됐다.
- **3개 크기 전부 가중치·학습 코드·평가 데이터 공개** — 0.8B, 4B, 9B 모델의 ***가중치와 학습 코드, 평가 데이터를 공개***해, 필요한 정확도와 메모리 여유에 따라 크기를 선택할 수 있다.
- **자체 체크포인트에서 이어 학습 가능(WebSearch 보강)** — `kev.train --init_from`으로 배포된 체크포인트의 LoRA 어댑터를 불러와 이어 학습할 수 있는데, ***베이스 모델에서 새로 시작하면 noul/choice/score 질문 형식 자체를 다시 배워야 해 성능이 떨어진다*** — 실제로 836개 고객지원 판단 데이터로 베이스부터 파인튜닝한 사례는 held-out 평가에서 0.33점에 그쳤다.
- **CUDA·Apple Silicon 실행, TypeSafe System One 호환 API** — CUDA와 Apple Silicon에서 실행되며, TypeSafe System One 호환 API를 제공해 기존 Python SDK의 연결 주소를 로컬로 바꾸기만 하면 되는 것으로 보인다(발췌 절단으로 세부 미확인).

## 인상 깊은 문장

> "kev.train --init_from ... starting from the base model discards everything the released checkpoint already learned about the noul/choice/score question format itself, not just domain knowledge."
> (Kev README, WebSearch 발췌)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. Kev-9B가 새 출처 문제의 4.0%에서 오답에 0.9 이상 확신을 보인다는 수치(Jev 3.7%)는 Jev 대비 캘리브레이션이 약간 떨어진다는 뜻이라 — "오픈소스라 Jev와 동등하다"고 단순히 받아들이면 안 된다.

## 내 생각 · 적용점

### 핵심 전이 — Jev 계열 9번째 노트: "구조화된 판단"이라는 원칙이 오픈소스로도 재현 가능함을 보여주지만, 캘리브레이션 격차는 그대로 드러남

가든에는 이미 [[2026-09-21-jev-field-guide-system-one-model]], [[2026-09-20-jevs-architecture-unmasked]], [[2026-09-20-jev-structured-output-interesting-again]], [[2026-09-16-typesafe-ai-jev-typed-judgments]], [[2026-09-18-jevlike-open-source-jev-probability-model]], [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-laya-mac-offline-realtime-decision-ai]] 등 Jev 계열 노트가 쌓여 있다. Kev는 이 계열의 9번째 사례로, "긴 텍스트 생성 대신 구조화된 확률·점수를 반환한다"는 Jev의 핵심 아이디어가 ***오픈소스로도 재현 가능하다***는 것을 보여준다. 다만 [[2026-09-21-prompts-dont-exist]]가 지적한 "벤치마크 과적합" 경고처럼, `--init_from`으로 이어 학습하지 않으면 형식 자체를 잃어버려 held-out 성능이 급락한다는 점은 "공개된 가중치를 그대로 베이스로 오해하면 안 된다"는 실무 함정을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

CRS 고객 문의 트리아지에 정확히 들어맞는 사례다 — 문의 하나를 "담당 부서(choice), 긴급 대응 여부(noul), 불만 정도(score)"로 동시에 분해 판단하는 구조는 예약 변경·환불·컴플레인 처리 자동 분류에 그대로 적용할 수 있다. 다만 위 "0.33점" 사례처럼, 사내 데이터로 파인튜닝할 때는 반드시 배포된 체크포인트에서 `--init_from`으로 이어 학습해야 하며, 베이스 모델부터 새로 학습하면 판단 형식 자체를 잃는다는 함정을 팀에 공유해야 한다.

## 연관 자료

- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 원조 아키텍처와 벤치마크 과적합 경고
- [[2026-09-18-jevlike-open-source-jev-probability-model]] — Jev의 첫 오픈소스 대안 시도
- [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-laya-mac-offline-realtime-decision-ai]] — 또 다른 오픈소스 Jev 대안(Laya) 계열

## 한 달 뒤 회고

*(2026-10-22 즈음 — Kev의 실제 메인테이너를 특정할 수 있는지, 사내 CRS 데이터로 `--init_from` 파인튜닝을 테스트해볼 가치가 있는지 확인.)*
