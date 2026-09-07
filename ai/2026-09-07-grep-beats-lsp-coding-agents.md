---
title: "grep이 LSP를 이긴다고? 코딩 에이전트가 더 정교한 도구를 무시하는 이유 — 정밀함보다 '다음 단계에 쓸 수 있는 형태로 반환하는가'가 채택을 가른다"
source_title: "Grep beats LSP? Why coding agents ignore your fancier tools"
source_url: "https://www.agentconnect.md/blog/grep-beat-lsp-harness/"
source_name: "AgentConnect Blog"
referrer_url: "https://news.hada.io/topic?id=33273"
published_at: "2026-09"
summarized_at: "2026-09-07"
category: "ai"
tags: ["grep", "lsp", "coding-agent", "tool-design", "context-engineering", "retrieval", "harness-engineering"]
---

# grep이 LSP를 이긴다고? 코딩 에이전트가 더 정교한 도구를 무시하는 이유

> 출처: [Grep beats LSP? Why coding agents ignore your fancier tools](https://www.agentconnect.md/blog/grep-beat-lsp-harness/) (AgentConnect Blog) · GeekNews(id=33273) 경유 · 정리일 2026-09-07

> **출처 한계**: `agentconnect.md`·`news.hada.io` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. Slack 발췌와 WebSearch 스니펫(Hacker News 토론, yage.ai의 유사 주제 글)을 교차 확인해 재구성했다. 실험 방법론의 전체 세부(정확한 태스크 수·통계적 유의성 검증 방법)는 확인하지 못했다.

## 한 줄 요약

**Claude 모델 3종을 비교한 소규모 실험에서, 코드 구조를 이해하는 LSP 기반 탐색 도구를 제공해도 단순 위치 찾기에는 대부분 grep을 썼고, LSP를 먼저 쓰도록 강제하면 오히려 성공률이 떨어졌다 — 차이는 검색 정확도가 아니라 "결과를 바로 다음 행동에 쓸 수 있는 형태로 주는가"에 있었다.**

## 핵심 포인트

- **작업 종류에 따라 갈린다** — 위치 찾기(localization)·이름 변경(rename) 같은 작업에서는 에이전트가 거의 항상 grep을 선택했고, 참조 추적처럼 "구조를 알아야 하는" 작업에서는 시키지 않아도 절반 정도는 LSP를 썼다. 즉 grep이 무조건 이기는 게 아니라 ***작업 유형별로 자연스러운 선호가 갈렸다***.
- **코드베이스 품질이 LSP의 가치를 좌우한다** — 깔끔한 TypeScript 저장소에서는 LSP 기반 탐색이 F1 점수 개선 없이 토큰만 16% 더 썼지만, ***노이즈가 많은(지저분한) TypeScript 저장소***에서는 LSP가 F1을 0.246 개선하면서 토큰도 12% 절감했다. LSP의 진짜 가치는 코드가 지저분할수록 커진다는 뜻이다.
- **결과 형태가 채택을 가른다** — 결정적 차이는 정밀도 자체가 아니라 ***"그 결과를 다음 단계에서 바로 쓸 수 있는가"***였다. grep은 매칭된 줄뿐 아니라 주변 주석·문자열까지 함께 반환해 수정 작업에 유리했던 반면, LSP는 위치만 반환해 정작 그 위치의 소스 코드를 다시 읽어야 하는 추가 단계가 필요했다.
- **위치만 반환하던 LSP에 소스 코드를 함께 넣어주자 개선** — LSP 결과에 소스 코드를 함께 포함시키자, 이름 변경 작업의 첫 시도 성공률이 67%에서 83%로 올랐고 추가 파일 읽기도 크게 줄었다. 즉 LSP 자체의 정밀도 문제가 아니라 ***인터페이스(출력 형태) 설계 문제***였다는 게 핵심 결론이다.
- **업계 수렴 패턴 — 계층화된 검색** — 검색 결과 전반에서 확인되는 패턴은 grep/rg가 넓은 범위·저비용 탐색을, LSP가 고정밀·심볼 수준 확인을 맡는 ***계층화된 검색(layered retrieval)***이다. "정밀한 도구가 곧 모델 친화적"이라는 등식은 성립하지 않으며, 도구가 반환하는 컨텍스트의 형태와 양이 모델이 실제로 다음 단계에 쓸 수 있는지를 좌우한다.

## 인상 깊은 문장

> "A tool is not friendly to a model merely because its results are precise. It must return enough context for the next step and present that context in an interface and output shape the model can use directly." (WebSearch 종합 재인용)

## 댓글

hada 댓글은 확인하지 못했으나, Hacker News에 "Grep beats LSP? Why coding agents ignore your fancier tools"라는 제목으로 별도 토론 스레드가 존재함을 WebSearch로 확인했다(정확한 포인트·댓글 내용은 egress 차단으로 미확인). **출처 한계**: 실험이 Claude 모델 3종에 한정돼 있어 다른 벤더 모델(GPT, Gemini 계열)에도 같은 결론이 적용되는지는 원문만으로 확정할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "도구의 정밀도"와 "도구를 실제로 쓰는가"는 다른 축이라는 원칙이 도구 설계 라인 전체에 반복된다

[[2026-09-03-zg-zvec-grep-local-search-infra]]가 "키워드 검색을 넘어선 로컬 검색 인프라로 도구 호출·입력 토큰을 절반 가까이 줄였다"는 성공 사례를 보여줬다면, 이 글은 정반대 실패 사례를 보여준다 — ***더 정교한 도구(LSP)를 붙였는데 오히려 성능이 나빠지거나 그대로였다***. 두 글을 함께 보면, "더 정밀한 도구를 제공하는 것"과 "모델이 그 도구를 효과적으로 쓸 수 있게 결과 형태를 설계하는 것"은 완전히 다른 작업이라는 게 명확해진다 — zg가 성공한 이유도 결국 "결과를 즉시 쓸 수 있는 형태로 압축했기 때문"일 가능성이 크다.

### 핵심 전이 2 — Anthropic 공식 대규모 코드베이스 가이드의 LSP 언급과 대조

[[2026-05-16-claude-code-large-codebases]]에서 정리한 Anthropic 공식 가이드는 LSP를 대규모 코드베이스 탐색의 권장 도구 중 하나로 소개했다. 이 글은 그 권장이 ***무조건적이지 않다***는 걸 실측으로 보여준다 — 코드베이스가 깔끔하면 LSP는 오히려 손해고, 결과 형태(소스 코드 포함 여부)를 제대로 설계하지 않으면 LSP의 이론적 우위가 실전에서 사라진다. "정교한 도구를 제공했다"는 사실만으로 하네스 설계가 끝난 게 아니라는 교훈이다.

## 호스피탈리티 / CRS 적용 포인트

**원칙 차원에서 직접 적용 가능하다.** CRS 코드베이스에 AI 코딩 에이전트를 도입하면서 "더 정교한 코드 탐색 도구(정적 분석기, 커스텀 인덱서 등)"를 붙이고 싶은 유혹이 들 수 있는데, 이 글은 그 전에 ***"이 도구가 반환하는 결과를 에이전트가 추가 단계 없이 바로 쓸 수 있는 형태인가"***부터 검증하라는 원칙을 준다. 특히 CRS처럼 레거시 코드가 섞여 있어 "노이즈가 많은 코드베이스"일 가능성이 높은 도메인에서는, 이 글의 관찰대로 LSP류 구조적 도구의 가치가 더 클 수 있으므로 도구 도입 우선순위를 정할 때 참고할 만하다.

## 연관 자료

- [[2026-09-03-zg-zvec-grep-local-search-infra]] — grep 계열 검색 도구가 결과 형태 설계로 성공한 사례, 이 글의 실패 사례와 대조
- [[2026-05-16-claude-code-large-codebases]] — Anthropic 공식 가이드의 LSP 권장, 이 글이 그 권장의 조건부성을 실측으로 보완

## 한 달 뒤 회고

*(2026-10-07 즈음 — CRS 코드베이스에서 AI 에이전트가 grep과 구조적 탐색 도구 중 실제로 무엇을 더 많이 쓰는지, 코드베이스 정돈 상태와 상관관계가 있는지 관찰.)*
