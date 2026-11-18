---
title: "모델별로 가장 좋은 하네스는 무엇일까? (FrontierHarness Eval v1.1) — 세 번째 독립 벤치마크에서도 Claude Code가 가장 비싼 하네스로 반복 확인된다"
source_title: "FrontierHarness Eval v1.1 (원문 미확인, WebSearch로 v1.0 세대만 교차확인)"
source_url: "https://news.hada.io/topic?id=37362"
source_name: "GeekNews (news.hada.io)"
referrer_url: "https://news.hada.io/topic?id=37362"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "ai"
tags: ["coding-agents", "harness-design", "benchmark-methodology", "claude-code", "codex-cli", "cost-per-pass", "frontierharness"]
---

# 모델별로 가장 좋은 하네스는 무엇일까? (FrontierHarness Eval v1.1)

> 출처: [모델별로 가장 좋은 하네스는 무엇일까?](https://news.hada.io/topic?id=37362) (GeekNews) · 정리일 2026-11-18
>
> **출처 한계**: news.hada.io 차단으로 Slack 발췌(22개 하네스 구성×5개 모델, v1.1)만 근거로 작성했다. WebSearch로 찾은 FrontierHarness Eval 관련 2차 보도는 모두 **9개 하네스×단일 모델(Kimi K3)** 구성을 다뤄, Slack이 말하는 "22개 구성·5개 모델·v1.1"과 1:1로 대응하지 않는다 — 같은 프로젝트의 확장판(v1.1)일 가능성이 높지만 확정하지 못했다. "GLM-5.3+Codex CLI 조합이 뚜렷한 우위"라는 구체 수치도 독립 확인하지 못했다.

## 한 줄 요약

**FrontierHarness Eval이 모델을 고정하고 하네스만 바꿔 비교했을 때, "가장 좋은 하네스"는 모델마다 다르고 같은 모델도 하네스에 따라 작업당 비용이 최대 5배(이전 세대 검색 결과로는 17배까지) 벌어지지만, 더 비싼 하네스가 더 높은 성공률을 보장하지는 않는다 — 그리고 이 패턴은 이제 세 번째 독립 벤치마크(HarnessTax, Composio, FrontierHarness)에서 똑같이 재현된다.**

## 핵심 포인트

- **모델마다 최적 하네스가 다르다** — 22개 구성×5개 모델 비교에서 GLM-5.3+Codex CLI만 뚜렷한 우위를 보였고, 나머지 4개 모델은 최적 후보와 경쟁 후보 결과가 근접했다고 함(Slack 발췌, 구체 수치 미확인).
- **같은 모델도 하네스에 따라 비용 1.8~5.0배 차이** — 더 비싼 하네스가 더 높은 통과율을 보장하지 않는다는 결론은 ***[[2026-09-18-harnesstax-coding-agent-harness-cost-study]]의 "성공률 차이는 통계적으로 유의하게 입증되지 않는다"는 결론과 정확히 일치***한다.
- **WebSearch로 확인한 v1.0 세대(9개 하네스×Kimi K3 단일모델) 결과** — cost per pass가 $1.05(Exo Harness)~$18.34(Claude Code)로 17배 차이, Codex가 66.7% 통과율로 최고 성능이면서 비용은 $3.47에 불과. ***Claude Code가 63.3% 성능에 $18.34로 가장 비싼 하네스***였다는 점은 HarnessTax(평균 2배 더 비쌈)·Composio(DeepSeek V4 Pro 기준으로도 최고가)에서도 반복 확인되는 패턴이다.
- **"하네스 품질보다 하네스-모델 적합도"** — FrontierHarness 제작자 본인이 밝힌 해석(WebSearch 교차확인)으로, 절대적으로 좋은 하네스는 없고 모델과의 조합이 핵심이라는 뜻.

## 인상 깊은 문장

> "much of what we observed points to harness-model fit rather than harness quality" (FrontierHarness Eval 제작자, WebSearch로 찾은 2차 정리 인용)

## 댓글

hada 원문 접속 차단으로 댓글 수·논조 확인 불가, HN 교차포스트 여부도 확인 못함. **"PASS" 아님을 명시**: Slack이 전하는 "v1.1·22구성·5모델·GLM-5.3" 조합은 이 노트 작성 시점에 독립 확인하지 못한 n=1 주장이다. 다만 "하네스가 비용을 크게 흔들고 성능차는 통계적으로 약하다"는 핵심 결론 자체는 세 개의 서로 다른 독립 연구팀(Arena/HarnessTax, Composio, FrontierHarness)에서 일관되게 나와 신뢰도가 높다.

## 내 생각 · 적용점

### 핵심 전이 1 — "Claude Code가 제일 비싼 하네스"는 이제 반복 재현된 패턴이다

[[2026-09-18-harnesstax-coding-agent-harness-cost-study]]가 처음 지적한 "Claude Code 평균 2배 비쌈, 초기 컨텍스트 Pi의 10배"는 n=1 연구가 아니라, 이번 FrontierHarness와 Composio까지 포함해 **세 개의 독립 벤치마크가 같은 결론**에 도달한 것이다. 내가(온다) Claude Code를 계속 쓰는 선택은 "비용"이 아니라 다른 가치(통합성·생태계·신뢰성) 때문이라는 걸 분명히 인지하고 있어야 한다 — 비용 최적화가 목적이라면 Pi·Codex류 경량 하네스가 구조적으로 유리하다.

### 핵심 전이 2 — 이 리서치를 수행한 나 자신도 "하네스-모델 적합도" 문제의 사례다

지금 이 요약 노트를 쓰는 작업도 Claude(하네스: Claude Code 환경)로 동작한다. [[2026-09-10-coding-agents-test-verification-techniques]]와 함께 읽으면, "에이전트가 검증 루프로 신뢰를 쌓는다"는 주장과 "하네스 선택이 비용·성능을 좌우한다"는 주장이 같은 리서치 축(에이전틱 코딩의 실제 신뢰 기반)을 이룬다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 코딩 에이전트 하네스 선택은 온다 개발팀의 도구 선택 문제이지 CRS 제품 기능은 아니다. 다만 "같은 모델도 둘러싼 구조(하네스/워크플로우)에 따라 비용이 수 배 벌어진다"는 원칙은, CRS에서 같은 LLM으로 상담 에이전트를 돌릴 때도 프롬프트 구조·컨텍스트 재전송 설계에 따라 비용이 크게 갈릴 수 있다는 경고로는 전이 가능하다.

## 연관 자료

- [[2026-09-18-harnesstax-coding-agent-harness-cost-study]] — 같은 주제의 선행 연구, 핵심 결론(비용 격차 大, 성공률차 유의하지 않음)이 정확히 일치.
- [[2026-09-19-harness-design-empirical-study-ablation]] — 하네스 설계를 요소별로 분해한 실증 연구, 같은 결의 보충.
- [[2026-10-20-aws-ai-agent-token-economics-bedrock]] — 하네스/에이전트의 토큰 비용 구조를 관리형으로 통제하자는 제안, 비용 격차 문제의 대응책 축.

## 한 달 뒤 회고

*(2026-12-18 즈음 — FrontierHarness Eval v1.1의 22구성·5모델 결과를 frontierharness.org에서 직접 확인했는지, 온다 내부 세션 비용 구조를 하네스 선택 관점에서 재점검했는지 기록.)*
