---
title: "Anthropic, Claude Code에 기존 게임 재구현을 제한하는 규칙 추가(GeekNews) — 이름을 바꿔도, 독창적이라 불러도 안 된다"
source_title: "Anthropic, Claude Code에 기존 게임 재구현 제한 추가"
source_url: "https://news.hada.io/topic?id=36384"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36384"
published_at: "2026-11-02"
summarized_at: "2026-11-02"
category: "ai"
tags: ["anthropic", "claude-code", "game-dev", "ip-infringement", "usage-policy"]
---

# Anthropic, Claude Code에 기존 게임 재구현을 제한하는 규칙 추가(GeekNews)

> 출처: [Anthropic, Claude Code에 기존 게임 재구현 제한 추가](https://news.hada.io/topic?id=36384) (GeekNews) · 정리일 2026-11-02
>
> **중복 제출 안내**: 같은 날 올라온 [Anthropic, Claude의 게임 재구현 제한 시작…모딩과 역공학 작업 거절 사례도 보고](https://news.hada.io/topic?id=36377)(id=36377, 10:11 KST)가 같은 소식을 다루는 별도 hada 토픽이다. 이 노트는 더 상세한 id=36384(09:41 KST, 플래그명·날짜·제외 범위까지 포함)를 기준으로 작성하고, id=36377의 추가 서술(모딩·역공학 거절 사례, "탈…")을 핵심 포인트에 함께 반영했다.
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. Slack 발췌(둘 다 말줄임으로 끊김)를 WebSearch로 Game Developer·Kotaku·Magica·Crypto Briefing 등 복수 매체와 교차확인했다.

## 한 줄 요약

**Anthropic이 2026년 10월 27일 Claude Code에 "특정 기존 게임을 이름을 바꾸거나 독창적이라 불러도 재구현하지 말라"는 서버 측 규칙을 추가했고, Addy Osmani가 Opus 5.5 프롬프트에 두 문장을 더했다고 확인했지만, 이 확인 자체를 다른 매체들은 "공식 발표가 아니다"라며 엇갈리게 보도하고 있다.**

## 핵심 포인트

- **10월 27일 추가, 서버 측 플래그로 전달** — WebSearch 교차확인 결과 이 규칙은 ***2026년 10월 27일*** 추가됐고, Kotaku 보도에 따르면 Anthropic 서버에서 ***`tengu_heron_brook`*** 플래그로 전달되며 ***끄는 설정이 없다***. 즉 사용자가 로컬 설정으로 비활성화할 수 없는, 서버 측에서 강제되는 정책이다.
- **"이름을 바꿔도, 독창적이라 불러도" 막는다** — Slack 발췌는 ***"기존 게임을 재구현하는 경우 이름을 바꾸거나 독창적인 게임이라고 불러도 제작하지 않도록 지시"***한다고 전한다. 즉 특정 게임의 재구현임이 명백하면 포장만 바꾸는 우회를 막는다는 의도로 보인다.
- **제외 범위는 명확하다** — ***"독창적인 게임, 특정 장르의 게임, 사용자 자신의 디자인과 에셋을 활용한 게임은 계속 제작할 수 있도록 규정"***한다. 규칙이 막는 것은 "이미 존재하는 특정 게임의 복제"이고, 장르 자체나 독창적 콘텐츠는 영향받지 않는다.
- **Osmani의 확인, 그리고 엇갈린 보도** — ***"Anthropic의 Addy Osmani는 Opus 5.5를 사용하는 Claude Code의 프롬프트에 두 문장을 추가했다고 확인했다"***는 Slack 서술은 Game Developer의 보도와 일치한다(지식재산권 침해 방지가 목적이라는 설명도 일치). 그런데 WebSearch로 확인한 Crypto Briefing은 ***"Anthropic이 게임 재구현 제한에 대해 공식 성명을 내지 않았다"***고 보도했고, 이 규칙이 2026년 11월 12일 발효되는 Anthropic의 전체 사용 정책 업데이트 문서에도 명시되지 않았다고 전한다. 즉 "Osmani가 확인했다"는 사실과 "회사 차원의 공식 발표가 있었다"는 것은 다른 이야기로, 매체들 사이에 보도 수준이 엇갈린다.
- **모딩·역공학·일반 게임 개발 거절 사례** — id=36377은 ***"사용자들은 모딩과 역공학, 일반적인 게임 개발 작업에서도 거절 사례를 보고했다"***고 덧붙인다. 규칙의 의도(특정 게임 복제 방지)보다 넓게 적용돼, 의도하지 않은 작업까지 거절되는 부수 효과가 발생했다는 뜻이다.

## 인상 깊은 문장

> "Claude Code에 특정 기존 게임의 재구현을 제한하는 규칙이 10월 27일에 추가됨 … Anthropic 서버에서 `tengu_heron_brook` 플래그로 전달되며, 이 규칙을 끄는 설정은 없음"

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. **정직성 체크**: 이 사건의 가장 중요한 불확실성은 "Anthropic이 공식적으로 확인했는가"다. Game Developer는 Osmani의 발언을 공식 확인으로 보도했지만, Crypto Briefing·FourWeekMBA 등은 회사 차원의 성명이나 Claude Code 체인지로그, GitHub 이슈(#106167)에서 확인되지 않았다고 보도했다 — 이 노트는 어느 쪽이 맞는지 판정하지 않고 양쪽 보도를 모두 남긴다.

## 내 생각 · 적용점

**핵심 전이 1 — AI의 게임 이식·모딩 능력 확대가 저작권 경계를 시험하는 흐름의 연장이다.** [[2026-10-12-vibe-coding-classic-game-ports]]와 [[2026-10-16-xbox-labs-ai-game-porting-remix]]가 다룬 "AI가 게임을 이식·재창작하기 쉬워진다"는 흐름의 반작용으로 이 규칙을 읽을 수 있다 — 플랫폼(Anthropic)이 커뮤니티의 비공식 활용 흐름에 대응해 정책으로 선을 긋는 것은, Microsoft Xbox Labs가 같은 흐름을 "공식 랩으로 흡수"한 것과 대조되는 다른 대응 방식(차단 vs 흡수)이다.

**핵심 전이 2 — 서버 측에서 끌 수 없는 정책 플래그라는 설계는 [[2026-09-10-addy-osmani-joins-anthropic]]이 예고한 변화의 구체적 사례다.** Osmani가 Anthropic에 합류한 뒤 실제로 Claude Code의 정책·프롬프트 설계에 관여하고 있다는 사실을 이번 사례가 확인해준다.

## 호스피탈리티 / CRS 적용 포인트

**적용 없음.** 게임 재구현·저작권이라는 소재 자체가 CRS/호스피탈리티 도메인과 직접 접점이 없다. 다만 "서버 측에서 끌 수 없는 정책 플래그로 특정 사용을 제한한다"는 설계 패턴 자체는, 온다가 Claude Code 등 AI 코딩 도구를 조직 차원에서 쓸 때 벤더가 예고 없이 사용 범위를 제한할 수 있다는 리스크를 보여주는 참고 사례로는 쓸 수 있다.

## 연관 자료

- [[2026-10-12-vibe-coding-classic-game-ports]] — AI 게임 이식·복제의 품질 경계를 다룬 선행 노트
- [[2026-10-16-xbox-labs-ai-game-porting-remix]] — 같은 흐름에 "흡수"로 대응한 Microsoft의 대조적 사례
- [[2026-09-10-addy-osmani-joins-anthropic]] — 이 정책 변경의 당사자인 Addy Osmani의 Anthropic 합류 소식

## 한 달 뒤 회고

*(2026-12-02 즈음 — 11월 12일 발효되는 Anthropic 사용 정책 업데이트 전문을 확인해, 이 게임 재구현 규칙이 공식 정책 문서에 명시됐는지, 그리고 모딩·역공학 거절 사례가 이후 완화됐는지 재확인.)*
