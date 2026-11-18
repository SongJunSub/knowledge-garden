---
title: "Claude Code 팀이 검증을 바라보는 방식 (Anthropic) — 사람이 모든 diff를 보는 대신, 에이전트가 실행 결과로 증명하게 만든다"
source_title: "Building verification loops in Claude Code with skills"
source_url: "https://claude.com/blog/building-verification-loops-in-claude-code-with-skills"
source_name: "Anthropic (Claude 공식 블로그)"
referrer_url: "https://news.hada.io/topic?id=37359"
published_at: "확인 불가 (WebSearch에서 2026-07-22 게시로 보이는 동일 제목 글 발견, GeekNews 공유 시점(2026-11-18)과 불일치 — 재공유 혹은 개정판일 가능성)"
summarized_at: "2026-11-18"
category: "ai"
tags: ["claude-code", "verification-loop", "agentic-coding", "e2e-testing", "property-based-testing", "differential-testing", "anthropic"]
---

# Claude Code 팀이 검증을 바라보는 방식 (Anthropic)

> 출처: [Claude Code 팀이 검증을 바라보는 방식](https://news.hada.io/topic?id=37359) (GeekNews) · 정리일 2026-11-18
>
> **출처 한계**: news.hada.io 차단으로 원문을 직접 열람하지 못했다. 다만 WebSearch로 Anthropic 공식 블로그의 동일 주제 글("Building verification loops in Claude Code with skills")을 찾아 핵심 주장(90% 코드를 Claude가 작성·리뷰, `/code-review`·`/simplify`·`/verify` 3종 스킬 패턴, `/verify`가 변경된 앱을 실제로 실행해 확인)은 교차 확인했다. 다만 WebSearch 결과의 게시일(2026-07-22)이 GeekNews 공유 시점(2026-11-18)과 어긋나 재공유·개정판 여부는 확정하지 못했고, "검사 실패 3회 수정 후 사람에게 이관"·"커밋에 검증 방식 기록" 디테일은 2차 매체에서만 확인돼 원문 대조는 못 했다.

## 한 줄 요약

**Claude Code 팀은 코드의 약 90%를 Claude가 작성·리뷰하게 하면서, 사람이 모든 diff를 직접 확인하는 대신 에이전트가 실행 결과로 작업을 증명하는 검증 루프(`/code-review` → `/simplify` → `/verify`)를 표준 워크플로우로 굳혔다 — 신뢰는 "AI가 맞게 짰다"는 가정이 아니라 "실행해서 확인했다"는 절차에서 나온다.**

## 핵심 포인트

- **90% 작성·리뷰, 검증은 실행 결과 기반** — 사람이 매 변경을 눈으로 확인하는 비용을 포기하고, 에이전트가 자기 작업을 실행 증거로 증명하는 쪽으로 전환.
- **우선순위: E2E > 속성 기반 > 차등 테스트** — 실제 사용자 흐름, 깨지면 안 되는 불변 제약, 기존 시스템과의 동작 비교. 단위 테스트만으로는 ***놓칠 수 있는 오류를 잡기 위한 순서***라는 점이 핵심.
- **`/verify` 스킬 — 변경한 앱을 실제로 실행** — WebSearch 교차확인: Anthropic 블로그는 `/verify`를 "builds, runs, and observes the changes in your application"으로 설명. 검사·읽기만으로는 충분하지 않다는 입장.
- **3회 수정 실패 시 사람에게 이관** — Slack 발췌와 2차 매체 공통 주장(원문 직접 대조는 못함). 무한 자동 재시도를 막는 안전장치.

## 인상 깊은 문장

> "builds, runs, and observes the changes in your application" (Anthropic 공식 블로그, `/verify` 스킬 설명 — WebSearch 2차 인용, 원문 직접 대조 못함)

## 댓글

hada 원문 접속 차단으로 GeekNews 댓글 수·논조 확인 불가. HN/Lobsters 큐레이션 여부도 미확인. 다만 **핵심 주장 자체는 Anthropic 1차 소스(공식 블로그)로 교차확인**돼 다른 "원문 미확인" 노트들보다는 신뢰도가 높다. 다만 발표 당사자(Anthropic)가 자사 팀·자사 도구의 워크플로우를 설명하는 글이라는 이해관계는 감안해야 한다 — "효과가 있다"는 주장 자체가 자사 제품 홍보와 겹친다.

## 내 생각 · 적용점

### 핵심 전이 1 — 지금 이 노트를 쓰는 작업 자체가 이 글의 주장을 실시간으로 검증하는 사례다

오늘 이 knowledge-garden 다이제스트도 Claude Code 환경에서 읽기 전용 리서치→파일 작성→위키링크 실재 확인→git 커밋이라는 순서로 진행됐다. 사람(사용자)이 모든 노트를 한 줄씩 읽고 검증하는 대신, "위키링크가 dead link 없이 전부 resolve되는가" 같은 실행 결과로 작업을 증명하는 구조다. 이 글이 말하는 "실행 결과로 증명"을 이 가든 자동화 파이프라인도 축소판으로 따라 하고 있다.

### 핵심 전이 2 — E2E 우선순위는 [[2026-10-16-addy-osmani-agentic-verification-e2e-property-tests]]와 완전히 같은 결론이다

Addy Osmani의 "mock 기반 단위 테스트는 에이전트와 같은 오해를 공유한 채 통과할 수 있다"는 경고와, 이 글의 "단위 테스트만으로는 놓칠 수 있는 오류"라는 표현이 정확히 같은 지점을 가리킨다. 서로 다른 저자(Anthropic 공식 vs 개인 연구자)가 독립적으로 같은 결론에 도달했다는 점에서 신뢰도가 더 올라간다.

### 핵심 전이 3 — [[2026-09-10-coding-agents-test-verification-techniques]]의 경고와 긴장 관계

Dan Luu의 연구는 "기법 이름을 알려줘도 정확도는 안 오른다, 자기가 만든 테스트를 통과해도 실제 버그를 못 잡는다"고 경고했다. Anthropic의 이 글은 그 위험을 알면서도 `/verify`(실제 실행)로 "자기 테스트 통과"가 아니라 "실제 동작 관찰"을 강제해 그 함정을 피하려는 설계로 보인다 — 다만 `/verify` 자체도 결국 에이전트가 관찰·판단하므로, Dan Luu의 경고가 완전히 해소됐다고 보기는 어렵다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능.** CRS/PMS에서 AI 에이전트가 생성한 요금 변경·예약 수정 코드나 설정을 배포할 때, "사람이 diff를 읽는 대신 실제 스테이징 환경에서 실행해 결과를 관찰"하는 `/verify` 패턴을 그대로 가져올 수 있다. 다만 3회 실패 후 사람 이관 같은 안전장치는 CRS처럼 고객 영향이 직접적인 시스템에서는 더 엄격한 기준(예: 1회 실패 시 즉시 이관)으로 보수적으로 조정해야 한다.

## 연관 자료

- [[2026-10-16-addy-osmani-agentic-verification-e2e-property-tests]] — 같은 결론(E2E가 공모를 깨는 오라클), 독립 저자의 교차확인.
- [[2026-09-10-coding-agents-test-verification-techniques]] — "검증 기법을 안다고 정확도가 오르지 않는다"는 반대쪽 경고, 긴장 관계로 함께 읽어야 함.
- [[2026-11-02-openqodex-separate-agent-code-review]] — 저작 에이전트와 검증 에이전트를 분리하는 같은 축의 다른 해법.

## 한 달 뒤 회고

*(2026-12-18 즈음 — Anthropic 블로그 원문을 직접 열람해 게시일 불일치(07-22 vs 11-18 공유)를 해소했는지, 이 가든 자동화 파이프라인에 `/verify`에 준하는 검증 단계를 더 명시적으로 추가했는지 점검.)*
