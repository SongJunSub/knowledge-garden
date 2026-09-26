---
title: "고집불통 AI들 때문에 두 번째 뇌를 만들게 됐다 (Dan Cîmpianu, Jadarma's Blog) — 이해를 위임하지 말라"
source_title: "Clankers Made Me Build a Second Brain"
source_url: "https://jadarma.github.io/blog/posts/2026/09/clankers-made-me-build-a-second-brain/"
source_name: "Jadarma's Blog (Dan Cîmpianu)"
referrer_url: "https://news.hada.io/topic?id=34251"
published_at: "2026-09-24"
summarized_at: "2026-09-26"
category: "ai"
tags: ["llm-hallucination", "second-brain", "personal-knowledge-management", "ai-skepticism", "developer-workflow", "trust"]
---

# 고집불통 AI들 때문에 두 번째 뇌를 만들게 됐다 (Dan Cîmpianu)

> 출처: [Clankers Made Me Build a Second Brain](https://jadarma.github.io/blog/posts/2026/09/clankers-made-me-build-a-second-brain/) (Dan Cîmpianu, Jadarma's Blog) · GeekNews(id=34251) 경유 · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io`, `jadarma.github.io` 모두 이번 세션 egress 차단으로 원문을 직접 열람하지 못했다. WebSearch로 여러 검색 결과(Lobsters 토론 페이지, daily.dev 미러, 저자 GitHub 프로필)를 교차확인해 재구성했다. 원문 전체 구조와 정확한 문장 배치는 확인하지 못했고, 아래 인용은 검색 스니펫으로 확보한 것이다.

## 한 줄 요약

**저자는 AI 챗봇("clanker", 로봇/AI를 부르는 속어)에게 커맨드라인 플래그를 물었다가 존재하지 않는 플래그를 확신에 찬 어조로 안내받은 경험을 계기로, AI의 답을 그대로 믿는 대신 직접 검증하고 기록하는 개인 지식 시스템("두 번째 뇌")을 구축하게 됐다는 이야기다. 결론은 하나 — "이해를 위임하지 말고 스스로 쌓아야 그 배당을 자신이 받는다."**

## 핵심 포인트

- **구체적 트리거** — AI가 "이 기능을 하려면 `--do-X` 플래그를 붙이면 됩니다… 아 잠깐, 그 플래그는 실제로 존재하지 않네요"처럼 스스로 정정하는 답을 내놓은 경험이 출발점이다. 확신에 찬 어조와 실제 정확성 사이의 괴리가 문제의 핵심.
- **"Clanker"라는 표현 자체가 태도를 드러낸다** — AI를 의인화하지 않고 부품 취급하는 멸칭을 제목에 쓴 것 자체가, 이 글의 논조(AI를 신뢰할 동료가 아니라 검증이 필요한 도구로 본다)를 압축한다.
- **대응책은 금지가 아니라 자기 기록** — AI 사용을 그만두는 대신, 확인한 사실·검증된 답을 개인 지식 베이스(두 번째 뇌)에 쌓아 다음에는 AI에게 되묻지 않고 자신의 기록을 먼저 참조하는 방식으로 워크플로를 바꿨다.
- **핵심 결론 문장** — ***"자신을 예방접종하라, 이해를 위임하지 마라. 스스로 이해를 쌓으면 그 배당을 받는 건 당신이다."*** 이 문장이 글 전체의 실천적 결론으로 인용되고 있다.
- **저자 배경** — 백엔드·Android 개발자, Kotlin 애호가로 알려져 있다 — 인프라나 AI 연구자가 아니라 **일상적으로 AI 도구를 쓰는 실무 개발자의 1인칭 경험담**이라는 점이 이 글의 성격을 규정한다.

## 인상 깊은 문장

> "To inoculate yourself don't delegate understanding. If you build your own understanding you will be the one who earns the dividends."

## 댓글

**hada 댓글 수 확인 불가**(원문 차단). **Lobsters에 게재됨**(약 62점·11댓글로 확인) — 개발자 커뮤니티에서 준수한 반응을 얻은 규모지만 폭발적 화제는 아니다. **n=1 에세이·개인 경험담**이라는 점을 반드시 감안해야 한다 — 벤치마크나 다수 사례 조사가 아니라 저자 한 명의 특정 상호작용 하나에서 출발한 일반화다. 어떤 모델·어떤 CLI 도구였는지는 확인하지 못했고, 이게 특정 모델의 특성인지 LLM 전반의 문제인지 글만으로는 구분되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — Dan Luu·Martin Fowler와 같은 결론에 세 번째 경로로 도달한다

[[2026-09-19-danluu-no-point-turning-brain-off]]는 "생각을 끄면 안 된다"는 결론에 **인센티브 논증**(고용 논리)으로 도달했고, [[2026-09-18-martin-fowler-i-dont-like-llms]]는 "확신에 찬 말투로 답과 환각을 똑같이 내놓는" 태도에 대한 **불편함**에서 출발해 신뢰 문제로 갔다. 이 글은 세 번째 경로다 — **구체적으로 틀린 경험 한 건**이 계기가 되어, 결론이 아니라 **행동 변화**(개인 지식 베이스 구축)로 이어진다. 세 글 모두 "AI를 믿지 마라"가 아니라 "검증 책임을 사람이 계속 져야 한다"는 같은 지점에 다른 경로로 수렴한다는 점에서, 이 가든에 나란히 두는 의미가 있다.

### 핵심 전이 2 — "이해를 위임하지 말라"는 원칙은 정확히 검증 습관의 문제다

이 글의 실천이 danluu 글의 "어디서 내가 판단을 추가했는지 말할 수 있는가"라는 기준과 사실상 같은 것을 다른 말로 표현한다 — AI의 답을 그대로 받아쓰지 않고, 검증한 결과를 자기 것으로 남기는 습관. 다만 danluu 글이 조직·고용 수준의 논증이라면, 이 글은 **개인 워크플로 수준의 구체적 실천**(Obsidian류 도구에 기록)이라는 점에서 더 즉시 실행 가능한 결이다.

## 호스피탈리티 / CRS 적용 포인트

이 글은 개인 지식관리 워크플로 에세이라 CRS 기술 접점은 없다. 다만 팀 운영 원칙으로 옮길 여지는 있다 — **AI가 확신에 찬 어조로 틀린 답(예: 존재하지 않는 API 파라미터, 잘못된 요금 정책 해석)을 낸 사례를 팀 차원의 "검증된 지식 베이스"에 축적**하면, 같은 실수를 팀 전체가 반복하는 것을 막을 수 있다. 개인이 아니라 팀 단위로 이 원칙을 적용한다는 점만 다르다.

## 연관 자료

- [[2026-09-19-danluu-no-point-turning-brain-off]] — 같은 결론(검증은 사람이 계속 해야 한다)에 인센티브 논증으로 도달한 짝
- [[2026-09-18-martin-fowler-i-dont-like-llms]] — 같은 결론에 불편함·신뢰 문제로 도달한 또 다른 짝

## 한 달 뒤 회고

*(2026-10-26 즈음 — Lobsters 댓글 중 반론(예: "그 정도면 그냥 검색하면 되지 않나")이 있었는지 원문 접근이 풀리면 확인하고, 우리 팀 내부에서도 AI가 확신에 차서 틀렸던 사례를 기록해 공유하는 습관이 실제로 생겼는지 점검.)*
