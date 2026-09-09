---
title: "GPT-6 Astra를 위한 스킬과 프롬프트 다시 생각하기 (Eric Provencher, OpenAI) — 모델이 똑똑해질수록 지시는 짧아져야 한다, 판단은 모델에게 맡겨라"
source_title: "Rethinking skills and prompts for GPT-6 Astra"
source_url: "https://x.com/pvncher/article/2095991462416490862"
source_name: "eric provencher (@pvncher), X · GeekNews(id=33404) 경유"
referrer_url: "https://news.hada.io/topic?id=33404"
published_at: "2026-09-04~05 (X 게시, 정확한 시각 미확인)"
summarized_at: "2026-09-09"
category: "ai"
tags: ["agent-skills", "agents-md", "gpt-6-astra", "prompt-engineering", "context-engineering", "codex", "claude-code"]
---

# GPT-6 Astra를 위한 스킬과 프롬프트 다시 생각하기 (Eric Provencher, OpenAI)

> 출처: [Rethinking skills and prompts for GPT-6 Astra](https://x.com/pvncher/article/2095991462416490862) (eric provencher, OpenAI Codex DX) · GeekNews(id=33404) 경유 · 정리일 2026-09-09

> **출처 한계**: `x.ai`·`x.com`·`news.hada.io` 모두 이번 세션 egress 정책으로 차단돼 원문 X 아티클과 GeekNews 토픽 페이지를 직접 열람하지 못했다. 이 노트는 Slack 발췌 4줄과, WebSearch로 확보한 the-decoder·explainx.ai·gpt88.cc 등 2차 보도의 인용문·요약, 그리고 이 글을 리트윗하며 남긴 여러 X 사용자의 코멘트를 종합해 재구성했다. 저자가 "eric provencher, OpenAI Codex DX 담당"이라는 점과 발행 시점(2026-09-04~05)은 복수 독립 출처에서 일치해 비교적 신뢰도가 높지만, 원문 전체 문장 순서·논지 전개는 확인하지 못했다.

## 한 줄 요약

**OpenAI Codex DX 소속 Eric Provencher가 "GPT-6 Astra는 이전 세대보다 판단력이 훨씬 좋아졌으니, 약한 모델을 다루려고 쌓아온 스킬·AGENTS.md·작업 프롬프트의 장황한 지시(전체 리포 강제 열람, 반복 테스트 지시, 가상의 리스크에 대한 안전 경고)를 걷어내고 '언제·무엇을·완료 기준이 무엇인지'만 명확히 남기라"고 제안한 실전 감사 가이드로, 발표 직후 Codex/Astra 사용자들 사이에서 "이 글 읽고 내 프로젝트 스킬·AGENTS.md 전부 감사해줘"라는 프롬프트가 그대로 바이럴하게 공유됐다.**

## 핵심 포인트

- **문제의식** — 코딩 에이전트가 릴리스마다 좋아지면서, 과거 모델을 위해 정교하게 짜둔 유도·보조 절차(핸드홀딩)의 필요성이 계속 줄어들고 있다. 매 릴리스마다 그 가정을 재검토할 가치가 있었지만, GPT-6 Astra에서는 그 재검토가 ***"더욱 중요해졌다"***는 게 출발점이다.
- **스킬 설명은 짧고 트리거 조건이 명확해야 한다** — 여러 워크플로우를 한꺼번에 다루는 스킬은, 필요한 문서·스크립트만 그때그때 찾아 읽도록 구성해야 한다는 원칙. Anthropic의 스킬 가이드가 말하는 "점진적 공개(progressive disclosure)"와 결이 같다.
- **AGENTS.md 다이어트** — "매번 전체 문서를 읽어라", "편집할 때마다 테스트를 반복 실행해라" 같은 상시 지시는 컨텍스트를 갉아먹고 작업을 늦춘다. ***"많은 사람이 기본적으로 프로젝트에 스킬을 잔뜩 다운로드해 넣는데, 그건 실수"***라고 못박는다. AGENTS.md는 로컬 테스트 스위트처럼 "안전하다고 이미 검증된 특정 워크플로우"에 권한을 부여하는 용도로 쓰라는 게 대안이다.
- **GPT-6 Astra의 성격 변화** — 모델이 철저해졌지만 동시에 판단력이 좋아져 경계를 진지하게 지킨다. 그 결과 사람은 계속 진행되길 원하는 지점에서 모델이 스스로 멈추는 경우가 생겨, 오히려 "계속 밀어붙이라"는 지시가 새로 필요해지는 역설이 생긴다.
- **가상의 리스크에 기반한 경고문 삭제** — 근거 없는 경고·디스클레이머·안전 체크리스트를 프롬프트에서 걷어내라는 게 반복 강조된다.
- **잘 작동하는 프롬프트의 3원칙** — ***모델이 되묻기 전에 모호성을 미리 제거하고, reasoning effort 레벨을 명시하고, "완료"가 무엇인지 정의하라.***
- **스킬의 정의를 다시 못박음** — 스킬 파일은 "번들 스크립트를 곁들인, 마크다운으로 저장된 프롬프트"이며, 매번 필요한 게 아니라 특정 작업에서만 필요한 워크플로우 안내나 플러그인 사용법에 가장 유용하다고 재정의한다.
- **확산과 온도차** — Joe Devon, Dan McAteer 등 여러 X 인플루언서가 "Codex에 이 글을 읽히고 스킬/AGENTS.md 전체를 감사시켜라"는 프롬프트를 그대로 리트윗했다. 반면 중국어권 커뮤니티(threads.com 인용)에서는 ***"이 논점은 GPT-5.6 Sol 출시 때도 이미 봤다"***는 회의적 반응도 있어, 완전히 새로운 통찰이라기보다 모델 세대마다 반복되는 정리 작업이라는 시각도 공존한다.

## 인상 깊은 문장

> "If you've been using agents in your projects over the last year, you've likely accumulated a lot of bloated instructions as you worked to steer the models toward good outcomes. With each release, it's been worth revisiting those assumptions, but with GPT-6 Astra, that's more important than ever."

> "Many people default to downloading a lot of skills into their projects, but that's a mistake."

> "GPT-6 Astra can work out what it needs to read without being pushed to review the whole project before every change. Prompting the model to read files before every edit is a great way to burn context and slow work down."

## 댓글

`news.hada.io`·`x.com` 모두 접근 차단으로 GeekNews 댓글 수·hada 논조, X 원문 스레드의 정확한 답글 수는 확인하지 못했다. 다만 WebSearch로 확인한 확산 양상 자체가 일종의 "댓글"을 대신한다 — Codex/Astra 실사용자들의 리트윗은 대체로 실전 조언에 대한 호응이었고, 일부 회의적 목소리는 "새로운 통찰이 아니라 매 세대 반복되는 이야기"라는 피로감에 가까웠다. HN/Lobsters 별도 큐레이션 여부는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-08-ask-hn-agent-skill-file-management]]와 정반대 방향에서 만나 같은 결론에 도달한다

그 Ask HN 스레드는 "스킬을 어떻게 관리·구성할까"라는 **구축자 관점**에서 "AGENTS.md엔 상시 규칙, 스킬엔 상황부 절차"라는 역할 분담을 이야기했다. 이 글은 그 반대편, **감사자 관점**에서 "모델이 강해졌으니 이미 쌓인 지시를 걷어내라"고 말한다. 둘을 겹쳐보면 스킬/AGENTS.md 설계는 한 번 만들고 끝나는 게 아니라, **모델 세대가 바뀔 때마다 재감사가 필요한 살아있는 자산**이라는 게 이 가든이 같은 달에 두 번 확인한 원칙이 된다.

### 핵심 전이 2 — [[2026-06-08-anthropic-skills-building-guide]]의 설계 원리와 벤더가 달라도 수렴한다

Anthropic의 스킬 가이드가 강조한 "`description`이 트리거를 결정한다"와 "점진적 공개로 토큰을 아낀다"는 원칙이, OpenAI 진영 내부자의 조언("스킬 설명은 짧고 트리거 조건이 명확해야, 필요한 문서만 찾아 읽도록")과 사실상 동일하다. 서로 다른 회사가 독립적으로 같은 설계 결론에 도달했다는 건, 이게 특정 벤더의 취향이 아니라 **에이전트 컨텍스트 관리의 일반 원칙**에 가깝다는 신호로 읽힌다.

### 핵심 전이 3 — 이 저장소 자체가 감사 대상이다

이 knowledge-garden의 `CLAUDE.md`도 정확히 이 글이 경고하는 대상이 될 수 있다. 예를 들어 "5단계 링크 검증"처럼 매 요약마다 반복 수행해야 하는 절차가 자연어 지시로 남아있는데, Provencher의 기준을 그대로 적용하면 **"이미 안전하다고 검증된 반복 작업은 언어 지시가 아니라 스크립트로 넘겨라"**는 결론이 나온다 — [[2026-06-08-anthropic-skills-building-guide]]가 말한 "검증은 결정적 코드로, 언어 해석에 맡기지 마라"는 원칙과 같은 방향이다. 다음에 이 저장소의 워크플로우를 손볼 기회가 있다면, 링크 검증 단계를 스크립트화하는 게 이 글이 주는 가장 구체적인 다음 행동이다.

## 호스피탈리티 / CRS 적용 포인트

온다 내부에서 Claude Code 등 에이전트 하네스를 CRS 개발·운영에 쓰고 있고, 그 안에 반복 지시가 쌓인 CLAUDE.md·스킬·프롬프트가 있다면, **"모델이 새 버전으로 바뀔 때마다 그 지시들을 재감사한다"는 루틴을 정례화할 근거**가 이 글이다. 특히 "가상의 리스크에 대한 안전 경고를 걷어내라"는 조언은 CRS 코드베이스에도 그대로 적용해볼 만하다 — 예약/결제처럼 실제로 위험한 작업에 대한 확인 절차는 남기되, 막연한 불안감으로 넣어둔 장황한 경고문·전체 리포 강제 열람 지시는 모델 판단력이 좋아진 만큼 걷어내도 되는지 주기적으로 점검할 가치가 있다. 다만 이건 원칙 차원의 전이이고, 실제로 온다가 GPT-6 Astra/Codex 계열을 CRS 개발에 쓰는지는 확인된 바 없어 직접 적용 여부는 별도 확인이 필요하다.

## 연관 자료

- [[2026-09-08-ask-hn-agent-skill-file-management]] — 같은 "스킬/AGENTS.md 역할 분담" 주제를 구축자 관점에서 다룬 대조 사례, 이 글은 그 반대편 감사자 관점
- [[2026-06-08-anthropic-skills-building-guide]] — 벤더가 다른데도 "설명이 트리거를 결정, 점진적 공개, 검증은 코드로"라는 같은 설계 원칙에 독립적으로 도달한 1차 자료
- [[2026-09-09-i-have-adhd-coding-agent-skill]] — 같은 배치, 정반대로 보이지만 실은 다른 축(무엇을 하라 vs 어떻게 말하라)의 스킬 설계 조언

## 한 달 뒤 회고

*(2026-10-09 즈음 — `x.ai`/GeekNews 접근이 풀렸다면 원문 전체를 직접 읽어 재구성 내용과 대조하고, 이 저장소 `CLAUDE.md`의 링크 검증 단계를 실제로 스크립트화했는지, GPT-6 Astra류 모델로 이 조언을 실전 적용해본 사례가 있는지 점검.)*
