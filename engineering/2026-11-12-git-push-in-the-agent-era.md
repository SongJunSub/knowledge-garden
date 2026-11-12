---
title: "AI 시대, git push 앞뒤에서 바뀌는 것들 (GeekNews, 부분 확인) — Anthropic은 버전관리 시스템 자체를 바꿨고 OpenAI는 서버 쪽만 바꿨다"
source_title: "AI 시대, git push 앞뒤에서 바뀌는 것들"
source_url: "https://news.hada.io/article/git-push-in-the-agent-era"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/article/git-push-in-the-agent-era"
summarized_at: "2026-11-12"
category: "engineering"
tags: ["git", "scion", "anthropic", "openai", "pando", "version-control", "agentic-coding"]
---

# AI 시대, git push 앞뒤에서 바뀌는 것들 (GeekNews)

> 출처: [AI 시대, git push 앞뒤에서 바뀌는 것들](https://news.hada.io/article/git-push-in-the-agent-era) (GeekNews) · 정리일 2026-11-12
>
> **출처 한계**: `news.hada.io` egress 차단으로 원문을 직접 열지 못했다. WebSearch로 Anthropic의 공식 엔지니어링 포스트("Redesigning source control at Anthropic", 2026년 10월)는 상세히 교차확인했다 — Scion이 사내 모노레포의 git을 대체한 서버 중심 버전관리 시스템이고, 에이전트 주도 머지가 2026년 5월 하루 약 2,500건에서 9월 30,000건 이상으로 늘어난 것이 계기였으며, 전환에 약 5개월이 걸렸고 git 미러링 대비 인프라 CPU·메모리를 약 200배 줄였다는 점까지 확인됐다. 다만 OpenAI의 "Pando"라는 신규 Git 백엔드는 이번 WebSearch로 독립 확인하지 못했다 — 이 부분은 GeekNews/Slack 발췌문에만 의존한 미확인 정보로 다룬다.

## 한 줄 요약

**Anthropic은 에이전트 주도 머지가 폭증하자 Git 자체를 자사 버전관리 시스템 Scion으로 교체했고(서버가 역사·블레임·머지·리베이스를 전부 처리), OpenAI는(전해지는 바로는) Git의 클라이언트 경험은 그대로 둔 채 서버 쪽 백엔드(Pando)만 바꿨다 — 바뀌는 부위는 다르지만 "여러 에이전트가 동시에 저장소에 걸리는 부하"라는 같은 문제에서 출발했다.**

## 핵심 포인트

- **문제의 공통 기원**: 여러 AI 에이전트가 동시에 같은 저장소에서 작업하면서 저장소에 걸리는 부하가 급증했다는 점은 두 회사가 공유하는 전제다. Anthropic의 경우 에이전트 주도 머지가 5월 약 2,500건/일에서 9월 30,000건/일 이상으로 늘었다(WebSearch로 Anthropic 공식 포스트 교차확인).
- ***"Scion의 단위는 changeset이고, 서버가 역사·블레임·커밋·머지·리베이스를 전부 처리한다"*** — git은 모든 클라이언트가 완전한 서버 역할을 할 수 있게 설계된 반면, Scion은 그 분산성을 포기하고 서버 중심으로 재설계했다(WebSearch 교차확인).
- **범용 대체재가 아니라고 명시**: Anthropic 스스로 Scion이 git을 일반적으로 대체할 만한 도구는 아니라고 밝혔고, 공개 배포 대신 설계 아이디어만 공유하는 방식을 택했다.
- **OpenAI의 선택(전언)**: OpenAI는 git clone/git push 같은 클라이언트 경험은 그대로 유지한 채, 서버 백엔드를 Pando라는 새 시스템으로 바꿔 병렬 에이전트 개발을 지원한다고 전해진다(GeekNews/Slack 발췌, 독립 확인 안 됨).

## 인상 깊은 문장

> "Agent-driven merges grew from roughly 2,500 a day in May 2026 to over 30,000 a day by September." (WebSearch로 교차확인한 Anthropic 공식 포스트 요지)

## 댓글

GeekNews 댓글 수는 이번 세션에서 확인하지 못했다(hada 차단). Anthropic 쪽은 "Redesigning source control at Anthropic"라는 자체 엔지니어링 포스트가 1차 출처로 신뢰도가 높은 반면, OpenAI Pando 관련 내용은 이번 WebSearch로 전혀 교차확인되지 않아 두 회사 서술 간 확인 수준의 격차가 크다는 점을 분명히 해둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "같은 문제, 다른 교체 범위"는 [[2026-11-03-scion-mononoke-outsider-critique]]가 이미 다룬 Scion 논쟁의 후속편이다

Scion에 대한 외부(비Anthropic) 비판적 시각을 다룬 [[2026-11-03-scion-mononoke-outsider-critique]]와 나란히 읽으면, 이 글은 "Scion이 왜 필요했는가"의 배경(에이전트 머지 폭증)을 보강해준다. Meta의 Mononoke 같은 기존 대형 모노레포 버전관리 시스템과 비교해도, "에이전트 동시성"이라는 완전히 새로운 부하 패턴이 기존 분산 VCS 설계 전제를 깨고 있다는 게 반복되는 주제다.

### 핵심 전이 2 — 클라이언트 경험을 지킨 채 서버만 바꾸는 쪽이 생태계 비용은 더 낮다

OpenAI식 접근(전해지는 바로는 git 명령어는 그대로, 백엔드만 교체)은 [[2026-09-27-atlas-source-control-for-coding-agents]]가 다룬 "코딩 에이전트 전용 소스 컨트롤" 시도들과 비교할 가치가 있다. 완전히 새 시스템을 쓰게 만드는 것(Anthropic Scion)과 기존 인터페이스를 유지하며 내부만 바꾸는 것(OpenAI Pando, 전언) 사이에는 생태계 전환 비용의 큰 차이가 있다. 같은 문제를 풀 때 "인터페이스를 지킬 것인가, 전면 교체할 것인가"는 일반화할 수 있는 설계 선택지다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS 개발 조직 규모에서 에이전트 주도 머지가 하루 수만 건에 이를 가능성은 낮아, Git 자체를 교체할 필요는 없다. 다만 "여러 Claude Code 세션이 같은 저장소에서 동시에 작업할 때 머지 충돌·리뷰 부하가 어떻게 늘어나는지"를 가볍게 관찰 지표로 남겨두는 정도의 전이만 가능하다.

## 연관 자료

- [[2026-11-03-scion-mononoke-outsider-critique]] — Scion에 대한 외부 비판적 시각, 이 글의 배경을 보강
- [[2026-09-27-atlas-source-control-for-coding-agents]] — 코딩 에이전트 전용 소스 컨트롤 시도
- [[2026-10-05-cloudflare-next-gen-git-platform-competition]] — 차세대 Git 플랫폼 경쟁 구도

## 한 달 뒤 회고

*(2026-12-12 즈음 — OpenAI Pando의 독립 출처를 찾았는지, Scion 공개 배포 소식이 있었는지, 이 가든 자체의 멀티 세션 작업에서 머지 충돌 빈도를 관찰했는지 확인한다.)*
