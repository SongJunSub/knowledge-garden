---
title: "우리에게는 훨씬 더 많은 수학자가 필요할 것이다 (Amit Sahai) — AI 증명이 안전을 보였다는 사실보다, 그 전제를 인간 공동체가 이해하는 일이 먼저다"
source_title: "We're gonna need a lot more mathematicians"
source_url: "https://terrytao.wordpress.com/2026/09/24/were-gonna-need-a-lot-more-mathematicians/"
source_name: "Terence Tao's blog \"What's new\" (게스트 포스트, 필자 Amit Sahai)"
referrer_url: "https://news.hada.io/topic?id=34313"
published_at: "2026-09-24"
summarized_at: "2026-09-27"
category: "ai"
tags: ["mathematics", "ai-safety", "formal-verification", "understanding", "research-community"]
---

# 우리에게는 훨씬 더 많은 수학자가 필요할 것이다 (Amit Sahai) — AI 증명이 안전을 보였다는 사실보다, 그 전제를 인간 공동체가 이해하는 일이 먼저다

> 출처: [We're gonna need a lot more mathematicians](https://terrytao.wordpress.com/2026/09/24/were-gonna-need-a-lot-more-mathematicians/) (Amit Sahai, Terence Tao 블로그 게스트 포스트) · GeekNews(id=34313) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `terrytao.wordpress.com`, `news.ycombinator.com`, `news.hada.io` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. WebSearch 스니펫으로 교차확인해 재구성했고, 핵심 인용문 하나는 검색 결과에서 원문 그대로 확보했지만 핵융합 비유 부분의 정확한 문장 배치는 재구성임을 밝힌다. 필자가 Terence Tao 본인이 아니라 UCLA 암호학자 Amit Sahai의 게스트 포스트라는 점도 착각하기 쉬워 명시해둔다.

## 한 줄 요약

**AI 속도를 따라가지 못한다고 수학 공동체를 줄이면 안 되고 오히려 키워야 한다 — 가상의 1테라와트 핵융합 발전소 비유처럼, AI가 아무리 정교한 설계·증명을 내놓아도 그걸 실제로 짓고 가동하려면 인간 공동체가 작동 원리와 안전성의 "전제" 자체를 독립적으로 이해하고 검증할 수 있어야 하기 때문이다.**

## 핵심 포인트

- **인재 유출에서 출발한 문제의식** — Sahai는 AI 속도를 따라잡지 못해 수학을 떠난 재능 있는 학부생들을 회고하며, 해법은 연구자 공동체를 줄이는 게 아니라 ***크게 확대***하는 것이라고 진단한다.
- **"배치 가능한 지적 예비군(deployable intellectual reserves)"** — AI가 내놓은 아이디어를 이해하는 데만 한 학기~1년을 쓰는 연구팀들을 상시 운영하자는 제안. 이런 "해석 작업"도 새 정리 증명과 동등한 진짜 수학 연구로 인정해야 한다는 것.
- **1테라와트 핵융합 발전소 비유** — 미래 AI가 인간이 전혀 생각해본 적 없는 방식으로 핵융합을 제어·유지하는 발전소 설계를 내놓는 가상 시나리오. 자동화 시스템이 공학 설계도는 뽑아낼 수 있어도, 실제로 그걸 짓고 가동하려면 인간 공동체가 그 수학을 독립적으로 검증하고 실패 모드를 평가하며 안전 프로토콜을 세워야 한다.
- **"증명됐다"와 "전제가 맞다"는 별개 문제** — 설령 AI가 안전성을 수학적으로(formally) 증명했다 해도, 그 증명이 딛고 선 전제(premise) 자체가 실제 물리적 조건과 맞는지는 여전히 검증되지 않은 채 남는다. Formal verification은 증명 내부의 논리적 타당성만 보장할 뿐, ***전제가 현실을 정확히 모델링했는가는 인간 공동체의 이해와 판단 몫***이다.
- **결론 — "이해를 포기하지 말라"** — ***"We must respond by building thriving human communities that can understand them together. We're gonna need a lot more mathematicians."*** AI 속도를 못 따라가더라도 수학계가 이해하는 일 자체를 포기해서는 안 된다.

## 인상 깊은 문장

> "We must respond by building thriving human communities that can understand them together. We're gonna need a lot more mathematicians."

## 댓글

**대형 화제작.** Hacker News(약 364점·466댓글, 소스별로 363~364점/464~466댓글로 약간 차이)와 Lobsters(게시 확인, 수치 미확인) 양쪽에 오른 것으로 확인된다. hada 댓글 수는 원천 차단으로 확인 못 했다. 가상의 핵융합 시나리오라는 점 — 실제 사건이 아니라 사고실험이라는 점을 정리에 분명히 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — "이해를 위임하지 말라"는 이 가든의 반복 주제와 정확히 같은 구조

[[2026-09-26-clankers-made-me-build-a-second-brain]]의 결론("이해를 위임하지 말고 스스로 쌓아야 그 배당을 받는 건 당신이다")과 이 글의 "AI 증명의 전제를 인간이 직접 이해해야 한다"는 주장은 표현·논지가 거의 겹친다. 개인 워크플로 대 사회적 규모(핵융합 발전소 안전성)라는 스케일 차이가 있을 뿐, "이해 위임 금지"라는 원칙은 동일하다 — 개인 차원의 습관이 사회 인프라 차원으로 그대로 확장되는 걸 보여주는 좋은 짝이다.

### 핵심 전이 2 — 필즈상 수상자 공동성명과의 동형 관계

[[2026-09-12-fields-medalists-ai-math-misalignment]]의 "문제 풀이는 이해를 위한 도구일 뿐"이라는 핵심 문장은 이 글의 논지와 거의 동형(isomorphic)이다 — 결과(증명·정리)를 얻는 것과 그것을 인간이 이해하는 것은 별개의 목표이고, AI 시대일수록 후자가 희소해진다는 것.

### 핵심 전이 3 — 같은 저자 계열 노트와의 연결, 그리고 미확정 연결고리

[[2026-09-22-why-do-we-still-need-human-mathematicians]] 노트는 원문 매체 특정에 실패한 채 남아 있는데, Po-Shen Loh의 "Why Do We Need Human Mathematicians Anymore?"(Tao 블로그에도 교차 게재)일 가능성이 있다 — 정확한 확인은 다음 회고 때 마저 하기로 한다. [[2026-09-11-terence-tao-childlike-curiosity]], [[2026-09-09-tao-ai-mining-unsolved-math-problems]]도 같은 Tao 블로그권 계열이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 다소 거리가 있다 — 핵융합 발전소급 물리적 안전성 문제와 B2B 소프트웨어 요금 로직은 리스크 규모가 다르다. 다만 원칙만 전이하면: CRS의 AI 기반 요금·재고 최적화 로직이 "왜 이 가격을 이 순간 이 채널에 내놓아야 하는가"를 사람이 설명 못 하는 블랙박스로 굳어지면, 이 글이 지적한 함정과 같다 — 모델이 통계적으로 최적이라고 "증명"해도, 그 최적화가 딛고 선 전제(수요 예측 가정, 경쟁사 반응 모델링 등)가 실제 시장과 맞는지는 사람이 별도로 이해하고 검증해야 한다. Sahai의 "배치 가능한 지적 예비군" 개념을 축소 적용하면, AI가 짜낸 프라이싱 로직 변경을 프로덕션에 반영하기 전 별도 인력·시간을 들여 "왜 이렇게 동작하는지" 이해하고 재현하는 검증 절차를 상시 운영하자는 제안 정도로 옮겨볼 수 있다 — 다만 이건 원칙의 유비일 뿐, 원문이 CRS를 겨냥한 논의는 전혀 아니라는 점을 밝혀둔다.

## 연관 자료

- [[2026-09-26-clankers-made-me-build-a-second-brain]] — "이해를 위임하지 말라"는 동일 원칙의 개인 워크플로 버전
- [[2026-09-12-fields-medalists-ai-math-misalignment]] — "문제 풀이는 이해를 위한 도구일 뿐"이라는 동형 주장, 필즈상 수상자 공동성명
- [[2026-09-22-why-do-we-still-need-human-mathematicians]] — 같은 주제군, 원문 매체 특정 미완료
- [[2026-09-11-terence-tao-childlike-curiosity]] — 같은 Tao 블로그 계열

## 한 달 뒤 회고

*(2026-10-27 즈음 — Po-Shen Loh 원문 연결 확정 여부, HN 466댓글 중 실제로 어떤 반론이 나왔는지(가상 시나리오라는 비판이 있었는지), "배치 가능한 지적 예비군" 개념을 실제로 시도한 연구 조직이 나왔는지 점검.)*
