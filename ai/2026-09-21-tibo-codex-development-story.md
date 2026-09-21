---
title: "Tibo와 함께 살펴보는 Codex 개발 이야기 (OpenAI, 영상) — 하네스는 모델의 부족함을 메우는 목발이라 모델이 좋아질수록 스스로 줄어드는 방향으로 설계했다"
source_title: "Building Codex with Tibo Sottiaux"
source_url: "https://newsletter.pragmaticengineer.com/p/building-codex-with-tibo-sottiaux"
source_name: "Pragmatic Engineer (Gergely Orosz) / OpenAI Codex 헤드 Tibo Sottiaux 인터뷰 영상"
referrer_url: "https://news.hada.io/topic?id=34014"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "ai"
tags: ["codex", "openai", "coding-agent", "harness", "rust", "agent-design", "tibo-sottiaux"]
---

# Tibo와 함께 살펴보는 Codex 개발 이야기 (OpenAI, 영상)

> 출처: [Building Codex with Tibo Sottiaux](https://newsletter.pragmaticengineer.com/p/building-codex-with-tibo-sottiaux) (Gergely Orosz, Pragmatic Engineer) · GeekNews(id=34014) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`와 영상 원본(YouTube/OpenAI Forum) 모두 이 세션에서 직접 재생·열람하지 못했다. Slack GN⁺ 발췌(4개 불릿, 마지막이 "O…"에서 잘림)와 WebSearch로 확보한 Pragmatic Engineer 뉴스레터, OpenAI 개발자 커뮤니티, Dev Interrupted 팟캐스트 스니펫을 교차해 재구성했다. Codex 헤드 Tibo Sottiaux의 여러 인터뷰(Matthew Berman, Gergely Orosz, Dev Interrupted 등)가 비슷한 시기 동시에 나와 있어, Slack이 정확히 어느 인터뷰를 가리키는지는 확정하지 못했다.

## 한 줄 요약

**OpenAI Codex의 핵심 에이전트 로직은 정확성·보안·효율을 위해 Rust로 구현해 제품 인터페이스와 분리했고, 모델을 보완하는 "하네스"(행동 지침·안전장치·보완 로직)는 모델이 개선될수록 오히려 줄이는 방향으로 설계한다는 게 Tibo Sottiaux가 밝힌 Codex 개발 철학의 핵심이다.**

## 핵심 포인트

- **출발점 — 내부 연구·인프라 가속 실험** — Codex는 OpenAI 내부 연구와 인프라 개발을 가속하던 모델/에이전트 실험에서 출발했으며, ***연구 조직과 엔지니어링 조직이 모델과 하네스를 함께 설계***하는 방식으로 발전했다.
- **Rust로 분리된 에이전트 핵심부** — 에이전트 핵심 로직은 ***Rust로 구현해 정확성, 보안, 효율성을 추구하고 제품 인터페이스와 분리***했으며, 하네스를 오픈소스로 공개해 ***다른 회사의 모델도 사용할 수 있게*** 했다(WebSearch로 확인: Codex CLI는 실제로 모델 provider를 선택할 수 있는 구조다).
- **하네스 = 모델의 부족함을 메우는 목발, 모델이 좋아지면 줄어듦** — 하네스는 모델의 부족한 능력을 보완하고 안전성·제어 가능성을 제공하지만, ***모델이 개선되면 행동 지침과 보완 로직 일부를 줄이는 방향으로 개발***한다. WebSearch로 확인한 Dev Interrupted 팟캐스트 발언과 일치한다 — "Scaffolding is coping, not scaling"(스캐폴딩은 극복 수단이지 확장 수단이 아니다).
- **에이전트 자율성 확대 방향** — Codex 팀은 수동 스캐폴딩을 걷어내고 컨텍스트 압축을 모델 레벨에서 해결하는 방향으로, 진짜 자율적인 에이전트(true agentic autonomy)를 지향한다(WebSearch로 보강).

## 인상 깊은 문장

> "Scaffolding is coping, not scaling."
> (Dev Interrupted 팟캐스트에서 Tibo Sottiaux 발언 취지, WebSearch로 확보)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: Codex 헤드 본인의 발언이라 자사 제품(Codex)의 설계 철학을 긍정적으로 서술하는 방향으로 편향될 수 있다. "하네스를 줄이는 게 목표"라는 주장은 아직 모델 능력이 그 목표에 도달했다는 증거는 아니다 — 현재도 Codex는 상당한 하네스에 의존하고 있을 가능성이 크다.

## 내 생각 · 적용점

### 핵심 전이 — "하네스는 임시 목발"이라는 관점이 가든의 하네스 엔지니어링 노트들과 정확히 대칭

[[2026-08-06-harness-engineering-for-self-improvement]]와 [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]는 하네스를 "지금 당장 필요한 보완 장치"로 다뤘는데, 이번 인터뷰는 그 하네스의 최종 목표를 명시적으로 뒤집어 보여준다 — **좋은 하네스란 영구히 두터워지는 게 아니라, 모델이 좋아질수록 스스로 얇아지도록 설계된 하네스**라는 것. 이 관점은 [[2026-09-19-hacktron-openai-heif-sso-chain]]이 짚은 "보안 장치는 계속 쌓이기만 한다"는 반대 방향의 현실과도 대조된다 — 안전장치는 줄이기 어렵고, 행동 지침만 줄이는 게 Codex의 실제 방향일 가능성이 높다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 자체 코딩 에이전트 워크플로(Claude Code 등)에 프롬프트·정책 문서를 쌓아갈 때, "이 지침이 모델의 부족함을 메우는 임시 목발인지, 영구히 필요한 안전장치인지"를 구분하는 습관은 직접 적용할 만하다. 모델이 업그레이드될 때마다 목발형 지침은 제거 후보로 재검토하는 프로세스를 두면, CLAUDE.md 같은 지침 문서가 무한정 비대해지는 것을 막을 수 있다.

## 연관 자료

- [[2026-08-06-harness-engineering-for-self-improvement]] — 하네스를 다룬 선행 노트, "임시 목발" 관점의 대비 지점
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — 하네스의 토큰 비용을 다룬 노트, 하네스가 줄어들면 이 비용도 줄어드는지가 관전 포인트

## 한 달 뒤 회고

*(2026-10-21 즈음 — 이 인터뷰의 정확한 출처(어느 매체·영상)를 특정할 수 있는지, Codex 하네스가 실제로 축소된 사례가 공개됐는지 확인.)*
