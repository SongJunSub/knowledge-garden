---
title: "단일 함수로 재현한 Jev 스타일 래퍼, 비전 모델까지 확장되다 (Allan) — 텍스트 판단 계열에 이미지 입력이 처음 얹혔다"
source_title: "A single function Jev-like wrapper for LLMs, including vision models"
source_url: "https://allanrbo.blogspot.com/2026/09/a-jev-like-wrapper-for-llms-including.html"
source_name: "Allan's Blog (Blogspot)"
referrer_url: "https://news.hada.io/topic?id=34327"
published_at: "2026-09-26"
summarized_at: "2026-09-27"
category: "ai"
tags: ["jev", "vision-model", "logprobs", "decision-model", "webcam", "llm-classifier"]
---

# 단일 함수로 재현한 Jev 스타일 래퍼, 비전 모델까지 확장되다 (Allan) — 텍스트 판단 계열에 이미지 입력이 처음 얹혔다

> 출처: [A single function Jev-like wrapper for LLMs, including vision models](https://allanrbo.blogspot.com/2026/09/a-jev-like-wrapper-for-llms-including.html) (Allan, Allan's Blog) · GeekNews(id=34327) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `news.hada.io`와 원문 `allanrbo.blogspot.com` 둘 다 이 세션에서 egress 차단돼 직접 열람하지 못했다. Hacker News에 같은 제목(id=49853175)으로 게시된 흔적을 WebSearch로 확인했으나 HN 항목 자체를 직접 조회하면 "No such item"으로 나와, 검색엔진 캐시와 실시간 조회가 어긋난다 — 그래서 점수·댓글 수(101pt·29댓글로 언급됨)는 확정치가 아니라 참고치로만 다룬다. 원문 그대로의 인용문도 확보하지 못해 아래 인용은 검색 스니펫 기반 재구성임을 밝힌다.

## 한 줄 요약

**Jev 계열의 핵심 트릭(선택지 문자 하나만 생성시켜 그 토큰의 로그확률을 읽는 것)을 `score()` 함수 하나로 재현한 글인데, 이번에는 텍스트를 넘어 이미지 입력(`attachments` 필드)까지 얹어 웹캠 프레임에 자연어 질문을 던지는 실험으로 확장했다 — 지금까지 텍스트 판단에만 머물던 이 가든의 Jev 재구현 추적 목록에 처음 등장한 비전 확장 사례다.**

## 핵심 포인트

- **트릭은 동일, 포장만 다름** — 질문과 A/B/C 선택지를 주고 모델이 긴 답 대신 ***선택지에 해당하는 문자 토큰 하나만 생성***하게 한 뒤, 그 위치의 로그확률(logprobs)을 읽어 분류 결과·참일 확률·단계별 점수를 계산한다. [[2026-09-24-jev-25-lines-of-python]]과 완전히 같은 핵심 메커니즘이다.
- **noul/choice/score 세 질문 유형** — [[2026-09-22-kev-open-source-jev-decision-model]]이 처음 명시적으로 정리한 예/아니오·다지선다·점수형 프레임을 그대로 재현했다.
- **비전 확장 — `attachments` 필드 추가** — 원래 텍스트/JSON만 받던 요청 포맷에 이미지(base64/경로)를 태울 수 있는 필드를 얹어, OpenCV로 캡처한 웹캠 프레임에 "사람이 보이는가", "실내/실외인가", "얼마나 밝은가" 세 질문을 자연어로 던지는 예제 스크립트를 공개했다.
- **로컬 성능 — RTX 3090의 Gemma 4 12B로 약 1FPS** — 프레임당 질문 3개 처리 기준. 같은 코드를 OpenAI API(`gpt-6-luna`)로 돌리면 오히려 ***약 0.2FPS로 더 느리다*** — 네트워크 왕복 비용이 로컬 추론보다 크다는 뜻.
- **트레이드오프를 스스로 인정** — 전용 컴퓨터비전 모델(사람 감지기 등)이 속도상 유리하다는 걸 저자도 알고 있고, 이 방식의 장점은 ***질문 문구만 바꾸면 판별 조건을 즉시 바꿀 수 있는 유연성***이라고 못박는다.
- **"단일 함수"가 제목의 요지** — 별도 SDK 없이 `score()` 함수(+ vision 확장) 하나로 Jev API 형태를 재현했다는 것 자체가 셀링 포인트다.

## 인상 깊은 문장

> "adding an attachments field for images ... capturing webcam frames, sending base64 JPEGs, and printing a table showing whether a person is visible, whether the scene is indoors or outdoors, and how bright the scene is." — WebSearch 요약 스니펫 기반 재구성. 원문 그대로의 인용은 egress 차단으로 확보하지 못했다.

## 댓글

**정확한 수치 미확정.** hada 댓글 수는 원천 차단으로 확인 못 했다. HN에 같은 제목으로 게시된 흔적(id=49853175)은 WebSearch로 확인했지만, HN 항목을 직접 조회하면 "No such item"이 떠 검색엔진 인덱스와 실시간 상태가 어긋난다 — 101pt·29댓글이라는 수치는 참고치일 뿐 확정으로 보지 않는다. Lobsters 언급은 검색에서 발견하지 못했다. 이해관계 노트: 나는 이 스크립트를 직접 실행해보지 않았고, 1FPS·0.2FPS 성능 수치는 저자 본인의 단일 실험 보고(n=1)이며 제3자 재현은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 재구현 계보에 처음 등장한 "비전" 갈래

이 가든은 [[2026-09-16-typesafe-ai-jev-typed-judgments]](원조)부터 [[2026-09-18-jevlike-open-source-jev-probability-model]], [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-jev-field-guide-system-one-model]], [[2026-09-22-kev-open-source-jev-decision-model]], [[2026-09-24-jev-25-lines-of-python]], [[2026-09-26-ollaya-ollama-for-decision-models]]까지 텍스트 판단 재구현의 릴레이를 추적해왔다. 이번 글은 같은 트릭을 **텍스트에서 이미지로 처음 옮긴 사례**라는 점에서 계보상 의미가 있다 — 다만 아직은 개인 블로그의 실험적 스크립트 수준이고, [[2026-09-26-ollaya-ollama-for-decision-models]]처럼 여러 모델을 묶는 유통 계층으로 발전한 단계는 아니다.

### 핵심 전이 2 — "로컬이 API보다 빠르다"는 역전이 반복해서 확인됨

RTX 3090 로컬 1FPS vs OpenAI API 0.2FPS라는 수치는, 판단 하나에 필요한 건 큰 모델이 아니라 **낮은 지연**이라는 [[2026-09-21-jev-field-guide-system-one-model]]의 결론("관리형 지연 0.4초가 방어선")과 같은 방향을 가리킨다. 프레임 단위 실시간 판단처럼 지연에 민감한 워크로드일수록 로컬 소형 모델의 우위가 커진다는 걸 또 하나의 독립적인 실험이 보여준 셈이다.

## 호스피탈리티 / CRS 적용 포인트

텍스트 축(score() 패턴 자체)은 이미 [[2026-09-22-kev-open-source-jev-decision-model]]·[[2026-09-26-ollaya-ollama-for-decision-models]]에서 CRS 문의 트리아지 적용점을 짚었으므로 반복하지 않는다. **비전 확장 쪽은 직접 적용은 멀다는 걸 정직하게 밝혀야 한다** — 저자의 실험은 웹캠 기반 실시간 사람/실내외/밝기 판별로, CRS·호스피탈리티 운영 시나리오와 맞닿는 유스케이스가 아니다. 원칙만 억지로 뽑아보면: 객실·시설 사진의 상태(청결도, 파손 여부, 조도)를 호스트 업로드 시점에 자연어 질문 세트로 스코어링하거나, 리뷰에 첨부된 사진이 텍스트 내용과 일치하는지 검증하는 배치성 파이프라인 정도가 원용 가능한 방향이다. 다만 이 글이 강조하는 핵심(실시간 1FPS 처리)은 CRS의 배치성 사진 검수 시나리오에는 굳이 필요 없는 속도 제약이라, 전이 가치는 낮다고 보는 게 정직하다.

## 연관 자료

- [[2026-09-24-jev-25-lines-of-python]] — 동일한 핵심 트릭(선택지 로짓 읽기)을 로컬 Qwen3-0.6B로 재현한 직전 사례
- [[2026-09-22-kev-open-source-jev-decision-model]] — noul/choice/score 세 질문 유형 프레임을 먼저 명시한 노트
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 계열 전체를 관통하는 해설, "관리형 지연 0.4초가 방어선" 결론
- [[2026-09-26-ollaya-ollama-for-decision-models]] — 가장 최근작, 여러 판단 모델을 하나의 러너로 묶는 유통 계층

## 한 달 뒤 회고

*(2026-10-27 즈음 — 이 비전 확장 방식을 실제로 시도해본 후속 프로젝트가 나왔는지, Jev 계열 재구현에 비전 갈래가 더 이어지는지, HN 논의의 실제 내용(수치가 왜 조회 불가였는지 포함)을 확인.)*
