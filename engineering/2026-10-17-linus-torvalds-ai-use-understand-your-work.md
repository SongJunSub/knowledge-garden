---
title: "Linus Torvalds \"AI 사용을 금지하지 않겠다. 자신이 하는 일을 이해해야 한다\" — 도구가 아니라 이해 수준이 기준"
source_title: "확인 불가 (Linux 커널 메일링리스트 또는 인터뷰로 추정)"
source_url: "확인 불가"
source_name: "GeekNews (원문 외부 링크 이번 세션에서 미확인)"
referrer_url: "https://news.hada.io/topic?id=35504"
published_at: "확인 불가"
summarized_at: "2026-10-17"
category: "engineering"
tags: ["linus-torvalds", "linux-kernel", "ai-policy", "open-source", "contribution-norms"]
---

# Linus Torvalds "AI 사용을 금지하지 않겠다. 자신이 하는 일을 이해해야 한다"

> 출처: GeekNews 토픽 [id=35504](https://news.hada.io/topic?id=35504) (원문 미확인) · 정리일 2026-10-17
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 열지 못했다. WebSearch로 교차확인한 결과, Torvalds가 2026년 7월경 "Linux는 안티-AI 프로젝트가 아니다. 문제 있으면 포크해서 각자 갈 길 가라"는 취지로 발언했다는 복수의 보도(TheRegister, TechRadar, virtualizationreview 등)를 확인했다. 이번 Slack 발췌는 그와 맥락은 같지만 ***"특정 작업에 AI 사용을 금지하는 규칙을 만들지 않겠다"는 더 구체적인 표현***을 담고 있어, 7월 발언과 동일한 발언인지 그 이후의 새로운 발언인지는 확정하지 못했다. 또한 "Assisted-by 태그"를 둘러싼 정책은 "유지관리자 서밋에서 폐지 합의"와 "여전히 공시 요구"라는 서로 다른 보도가 있어 현재 상태가 무엇인지 확정하지 못했다.

## 한 줄 요약

**Linus Torvalds가 Linux 커널 기여에서 특정 작업에 AI 사용을 금지하는 규칙을 만들지 않겠다고 밝혔다 — 기여자에게 요구하는 것은 어떤 도구를 쓰느냐가 아니라 자신이 제출하는 코드를 실제로 이해하고 있느냐다.**

## 핵심 포인트

- **금지 규칙을 만들지 않는다** — Linux 커널 기여에서 특정 작업에 AI 사용을 금지하는 규칙을 만들지 않겠다고 밝힘. 기여자의 역량을 "도구 사용 여부"로 판단하는 접근에 강하게 반발했다.
- **기준은 이해, 도구는 무관** — 기여자에게 기대하는 것은 ***최선을 다하고 자신이 하는 일을 이해하는 것***이다. 어떤 도구를 사용하느냐와 실제 이해 수준은 관련이 매우 적다는 관점.
- **풍자적 비유** — "기계의 동작을 이해한다는 증거로 컴파일러 없이 어셈블리를 직접 작성하라"는 가상의 규칙을 제시해, 도구의 도움을 받았다는 이유로 이해를 입증하지 못한다고 보는 논리 자체를 풍자했다.
- **(WebSearch 교차확인) 책임은 사람에게 남는다** — AI 에이전트는 `Signed-off-by` 태그를 달 수 없으므로, 결국 사람이 생성된 코드를 검토하고 책임을 진다는 구조는 AI 사용 여부와 무관하게 그대로 유지된다.
- **(WebSearch 교차확인) 공시 규칙은 유동적** — "Assisted-by 태그로 모델명·버전·전문 도구를 공시해야 한다"는 가이드라인과 "유지관리자 서밋에서 그 태그를 폐지하기로 합의했다"는 두 보도가 공존해, 실제 정책이 지금 어느 쪽인지는 확정할 수 없다.

## 인상 깊은 문장

> "Linux is not one of those anti-AI projects, and if somebody has issues with that they can do the open-source thing and fork it." (WebSearch로 확인된 실제 발언, 2026-07)

## 댓글

GeekNews 댓글 수 확인 불가(원문 차단). 다만 WebSearch로 확인되는 반응은 뚜렷하게 갈린다 — 한쪽은 "코드 품질과 기여자 책임이 핵심이라면 도구는 중요하지 않다"는 Torvalds의 논리에 동의하고, 다른 쪽은 "이해 여부를 리뷰 과정에서 어떻게 검증할 것인가"라는 실무적 우려를 제기한다. [[2026-10-13-linus-torvalds-claude-code-kernel-folio-refcount]]가 보여준 실제 사례(Torvalds 본인이 Claude Code로 커널 버그를 고친 일)가 이 입장의 실천적 증거로 함께 언급되는 경향이 있다.

## 내 생각 · 적용점

[[2026-07-17-linus-torvalds-llm-in-kernel-development]]에서 이미 다룬 "커널 개발에 LLM을 쓰는 것 자체를 반대하지 않는다"는 입장의 연장선이자, [[2026-10-13-linus-torvalds-claude-code-kernel-folio-refcount]](Torvalds 본인이 Claude Code로 실제 버그를 고친 사례)로 이미 실천까지 보여준 뒤에 나온 재확인 발언으로 읽힌다. 핵심 전이는 ***"도구 사용 여부를 규칙으로 금지하는 것"과 "결과물에 대한 이해·책임을 요구하는 것"은 완전히 다른 축이라는 구분***이다 — 전자를 금지하면서 후자를 느슨하게 둘 수도 있고, 전자를 허용하면서 후자를 엄격하게 요구할 수도 있다. Torvalds는 후자(이해·책임)만 엄격하게 유지하고 전자(도구)는 완전히 열어두는 쪽을 택했다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성이 있다 — 온다 내부에서 "AI 코딩 도구 사용을 허용/금지할 것인가"를 정책으로 논의한다면, 이 발언의 구조를 그대로 가져올 수 있다. ***"어떤 도구를 썼는가"를 금지·허용의 기준으로 삼지 말고, "제출한 코드를 작성자가 실제로 이해하고 설명할 수 있는가"를 코드 리뷰의 기준으로 삼는다*** — 이 기준은 도구가 바뀌어도(Claude Code든 다른 무엇이든) 그대로 유지되는 장점이 있다. [[2026-06-08-agentic-code-review]]가 다룬 "사람이 위험 판단에 집중하는 리뷰"와도 같은 방향이다.

## 연관 자료

- [[2026-07-17-linus-torvalds-llm-in-kernel-development]] — 같은 입장의 이전 발언, 커널 개발에서 LLM 사용 자체를 반대하지 않는다는 선행 기록
- [[2026-10-13-linus-torvalds-claude-code-kernel-folio-refcount]] — Torvalds 본인이 Claude Code로 실제 커널 버그를 고친 실천 사례
- [[2026-06-08-agentic-code-review]] — "도구가 아니라 위험 판단·이해에 집중하는 리뷰"라는 같은 방향의 조직적 실천

## 한 달 뒤 회고

2026-11-17 즈음, 이 발언이 7월 발언의 재인용인지 새로운 발언인지, Assisted-by 태그 정책이 실제로 어느 쪽으로 정리됐는지 확인.
