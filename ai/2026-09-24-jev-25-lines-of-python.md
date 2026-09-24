---
title: "Python 25줄로 구현한 Jev (Duarte O. Carmo, NobodyWho) — 진짜 배워야 할 건 API가 아니라 로짓 한 번 읽는 법"
source_title: "Jev in 25 lines of Python"
source_url: "https://www.nobodywho.ai/posts/jev-in-25-lines/"
source_name: "NobodyWho (Duarte O. Carmo), GeekNews(id=34167) 경유, WebSearch(Hacker News, HyperAI, ai-tldr.dev) 교차확인"
referrer_url: "https://news.hada.io/topic?id=34167"
published_at: "확인 불가 (NobodyWho 블로그 게시일 미확인, Hacker News 게재는 2026-09-23)"
summarized_at: "2026-09-24"
category: "ai"
tags: ["jev", "qwen3", "logprobs", "local-inference", "classification", "open-source", "satire"]
---

# Python 25줄로 구현한 Jev (Duarte O. Carmo, NobodyWho)

> 출처: [Jev in 25 lines of Python](https://www.nobodywho.ai/posts/jev-in-25-lines/) (Duarte O. Carmo, NobodyWho) · GeekNews 경유 [id=34167](https://news.hada.io/topic?id=34167) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`nobodywho.ai` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. Slack 발췌(5개 불릿, 마지막이 "실제 Jev의 합성 데이터 학습과 확률 보…"에서 잘림)와 WebSearch(Hacker News `item?id=49812769`, HyperAI, ai-tldr.dev) 교차확인으로 재구성했다. **결이 다른 점 하나**: WebSearch로 확인한 여러 매체가 이 글을 "TypeSafe의 Jev 하이프에 대한 패러디/풍자"로 소개한다 — 진지한 재구현이라기보다, "다들 Jev 얘기만 한다"는 과열에 대한 응답으로 쓰인 글이라는 맥락은 원문 톤을 읽는 데 중요하다.

## 한 줄 요약

**NobodyWho의 Duarte O. Carmo가 TypeSafe의 화제작 Jev(선택지별 확률을 반환하는 "System One" 모델, 설계 비공개)를 겨냥한 패러디 성격의 글에서, 로컬 소형 모델 Qwen3-0.6B-Q8_0(llama.cpp)에 A/B/C 선택지를 주고 마지막 토큰의 로짓만 읽어 소프트맥스로 확률화하는 25줄짜리 구현을 공개했다 — 수상한 급여 안내 이메일을 ***피싱 88.5%, 스팸 8.4%, 정상 3.1%***로 분류해, 거창한 API 호출 없이도 로컬에서 확률 판단이 된다는 걸 보여준다.**

## 핵심 포인트

- **동작 원리 — 텍스트 생성이 아니라 로짓 한 번 읽기** — GGUF로 양자화된 Qwen3-0.6B를 llama.cpp로 로드하고, "A) 정상 B) 스팸 C) 피싱" 형태의 프롬프트를 준 뒤 ***모델이 답을 한 글자씩 생성하게 하는 대신, 마지막 토큰 위치에서 A/B/C 각각의 로짓만 추출***해 소프트맥스로 정규화한다. 한 번의 forward pass로 확률 벡터를 얻는 방식이라 Jev·jevlike·Kev 등 이 가든의 Jev 계열 재구현들과 같은 핵심 트릭을 공유한다.
- **실제 분류 결과 — 피싱 88.5%** — 수상한 급여 안내 이메일을 정상/스팸/피싱 세 선택지로 분류한 예제에서 ***피싱 88.5%, 스팸 8.4%, 정상 3.1%***라는 확률을 출력했다.
- **로컬 실행, 데이터 외부 전송 없음** — 거창한 모델 이름도 API 호출도 없이 ***데이터를 외부로 보내지 않고 로컬에서 분류와 확률 출력을 처리***한다 — 0.6B급 소형 모델 하나로 충분하다는 게 이 글의 요지다.
- **기술적 함정(WebSearch 보강)** — 만약 로컬 llama.cpp 대신 OpenAI 호환 chat API의 `top_logprobs`를 쓰면, 반환되는 후보 토큰 목록에 정작 원하는 선택지(A/B/C) 글자가 아예 빠질 수 있어 `logit_bias`만으로는 확률을 제대로 재정규화할 수 없다는 주의점이 있다 — 이 글이 API 대신 로컬 모델의 로짓에 직접 접근하는 방식을 택한 이유로 짐작된다(원문 직접 확인은 못 함).
- **패러디라는 맥락, 그런데 실제로 작동함** — 여러 매체가 이 글을 "Jev 열풍에 대한 풍자"로 소개하지만, 코드 자체는 실제로 동작하는 최소 구현이다 — ***과장된 서사를 걷어내면 핵심 트릭은 25줄 안에 다 들어간다***는 게 이 글의 진짜 메시지에 가깝다.

## 인상 깊은 문장

> "Everyone and their mom is talking about Jev. Jev this, Jev that. [...] We don't really think so. So here's Jev in 25 lines of Python local[ly]."
> (관련 GitHub 저장소 `WhoJoshi69/jev-but-without-api-calls`의 설명, WebSearch로 확인 · 원문 블로그 본문과 정확히 같은 문구인지는 미확인이나 같은 정서를 공유)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). Hacker News 스레드(`news.ycombinator.com/item?id=49812769`, "Jev in 25 Lines of Python")는 WebSearch로 ***약 631포인트·197댓글***이라는 수치를 확인했다 — 이번 배치 4편 중 가장 뜨거운 반응이다. "이런 범용의 확률 판단 능력이 새로운 개발 기본 요소(primitive)가 될 수 있다"는 긍정 평가와 실무 구현상의 난점 지적이 공존한다고 하나, 이 역시 **2차 요약의 요약**이라 정확한 뉘앙스·비중은 보증하지 못한다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 Jev 계열, 이번엔 "패러디"라는 다른 톤으로 같은 결론에 도달

가든에는 이미 [[2026-09-21-jev-field-guide-system-one-model]], [[2026-09-20-jevs-architecture-unmasked]], [[2026-09-16-typesafe-ai-jev-typed-judgments]], [[2026-09-18-jevlike-open-source-jev-probability-model]], [[2026-09-22-kev-open-source-jev-decision-model]], [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-laya-mac-offline-realtime-decision-ai]], [[2026-09-20-jev-structured-output-interesting-again]], [[2026-09-20-jev-evaluates-every-essay-in-0-7-seconds]], [[2026-09-23-openai-jev-tool-router]] 등 열 개 안팎의 Jev 계열 노트가 쌓여 있다 — 이 노트는 그 뒤를 잇는 또 하나의 사례다. [[2026-09-18-jevlike-open-source-jev-probability-model]]과 [[2026-09-22-kev-open-source-jev-decision-model]]이 "진지하게" TypeSafe의 상용 모델을 독립 재구현하려 했다면, 이 글은 ***패러디로 시작해서 "거창한 이름을 걷어내면 결국 로짓 하나 읽는 게 전부"라는 걸 보여주는 것으로 오히려 더 냉소적인 결론***에 도달한다. 톤은 다르지만 세 글 모두 "Jev의 핵심은 비밀스러운 아키텍처가 아니라 단순한 트릭"이라는 같은 지점을 가리킨다는 게, 이 정도로 반복해서 재발명되는 아이디어 자체가 보내는 신호다.

## 호스피탈리티 / CRS 적용 포인트

[[2026-09-18-jevlike-open-source-jev-probability-model]]에서 이미 짚었듯, 예약 문의 분류(정상/이상 패턴), 리뷰 감성 점수화, 채널 메시지 라우팅 같은 CRS의 반복 판단 작업이 정확히 이 모델 클래스의 표적이다. 이번 글이 더하는 것은 ***"25줄"이라는 압도적으로 낮은 구현 장벽***이다 — 별도 프레임워크나 벤더 API 계약 없이, 사내 개발자가 하루 안에 프로토타입을 돌려볼 수 있다는 뜻이다. 예약 사기 탐지·문의 유형 분류 같은 저위험·고반복 판단을 사내망 안에서 직접 실험해볼 진입 장벽이 사실상 없다는 걸 이 글이 다시 확인해준다. 다만 (패러디성 최소 구현이라는 한계상) 실제 프로덕션에 넣으려면 캘리브레이션·정확도 검증이 별도로 필요하다는 건 다른 Jev 계열 노트들과 동일하게 적용된다.

## 연관 자료

- [[2026-09-18-jevlike-open-source-jev-probability-model]] — 같은 핵심 트릭(선택지 로짓 → 확률)을 "진지하게" 재구현한 선행 사례, CRS 적용점을 먼저 정리해둠
- [[2026-09-22-kev-open-source-jev-decision-model]] — Jev 계열 오픈소스 재구현의 또 다른 축(Qwen3.5 기반, 파인튜닝 가능)
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 원조 아키텍처와 벤치마크 과적합 경고, 이 계열 전체의 출발점

## 한 달 뒤 회고

*(2026-10-24 즈음 — 이 25줄 구현이 실제로 사내 프로토타입에 쓰인 사례가 나왔는지, Jev 계열 재구현들 사이에서 정확도·캘리브레이션 비교가 이뤄졌는지, `news.hada.io` 접근이 풀렸다면 원문·hada 댓글 직접 확인.)*
