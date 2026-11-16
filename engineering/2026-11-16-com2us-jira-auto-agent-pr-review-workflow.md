---
title: "코딩만 시키기엔 아까운 AI 활용기 — Jira 일감부터 PR 검토까지 (게임빌컴투스플랫폼, 원문 접속 불가)"
source_title: "코딩만 시키기엔 아까운 AI 활용기: Jira 일감부터 PR 검토까지"
source_url: "https://on.com2us.com/tech/ai-agent-developer-workflow-beyond-coding/"
source_name: "게임빌컴투스플랫폼 (Com2uS ON Tech)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
summarized_at: "2026-11-16"
category: "engineering"
tags: ["ai-coding", "jira", "code-review", "agentic-workflow", "com2us", "source-limitation"]
---

# 코딩만 시키기엔 아까운 AI 활용기 — Jira 일감부터 PR 검토까지

> 출처: [코딩만 시키기엔 아까운 AI 활용기: Jira 일감부터 PR 검토까지](https://on.com2us.com/tech/ai-agent-developer-workflow-beyond-coding/) (게임빌컴투스플랫폼) · 정리일 2026-11-16

## 한 줄 요약

**Jira 일감 접수부터 코드 구현·검증까지의 과정을 자동화해 개발자의 반복 수작업을 줄이고, 웹 도구 `jira-auto-agent`로 작업 진행 상태를 확인하며, `Archify`로 코드 구조를 시각화해 사람이 최종 검토·의사결정에만 집중하도록 재설계한 워크플로우.**

## 핵심 포인트

- Jira 일감부터 코드 구현과 검증까지의 과정을 자동화하여 개발자의 반복적인 수작업을 최소화.
- 웹 기반 도구인 ***`jira-auto-agent`***를 통해 작업 진행 상태와 변경 전후의 화면을 직관적으로 확인 가능.
- ***`Archify`***를 연동하여 복잡한 코드 구조와 작업 흐름을 시각화함으로써 코드 리뷰의 효율성을 높임.
- AI가 생성한 결과물과 테스트 데이터를 바탕으로 개발자가 ***최종 검토와 의사결정***에 집중할 수 있도록 지원.

## 인상 깊은 문장

> "코딩만 시키기엔 아까운 AI 활용기" (원문 제목 — Slack 발췌 기준)

## 댓글

TechArticles 봇이 Com2uS ON Tech 블로그 글을 Slack에 직접 공유한 글로, GeekNews 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. **원문은 on.com2us.com 접속이 이 세션 네트워크 정책상 막혀(getaddrinfo ENOTFOUND) 직접 열람하지 못했고**, WebSearch로도 `jira-auto-agent`는 전혀 확인되지 않았다. 다만 `Archify`는 독립적으로 실재가 확인된다 — GitHub `tt-a1i/archify`, MIT 라이선스, Claude Code/Codex용 "코드베이스를 대화형 아키텍처 다이어그램으로" 바꾸는 오픈소스 에이전트 스킬이다. 즉 **Archify라는 도구 자체는 실재하지만, Com2uS가 이를 `jira-auto-agent`와 어떻게 연동했는지의 구체 내용은 Slack 발췌만으로는 확인 불가**로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 Com2uS 조직의 "완성작을 통째로 맡기지 않는다" 패턴이 세 번째로 확인됨

[[2026-11-06-com2us-claude-code-skill-backoffice-tool]]에서 이미 "Com2uS는 개발·디자인 양쪽에서 완성작을 AI에 통째로 맡기기보다, 반복·검증 가능한 특정 작업 단위에 AI를 끼워 넣는 보수적 패턴을 일관되게 보여준다"고 적었는데, 이번 글이 그 패턴의 세 번째 확인 사례다. 다른 점은 적용 범위가 "레거시 다국어 편집"(단일 화면)에서 "Jira 티켓 → 구현 → PR 검토"(개발 전체 흐름)로 넓어졌다는 것 — 같은 보수적 원칙을 유지하면서도 자동화 범위를 단계적으로 확장하는 궤적이 보인다.

### 핵심 전이 2 — "검증 주체를 누가 맡는가"의 거울상

[[2026-11-02-openqodex-separate-agent-code-review]](OpenQodex, 코딩 에이전트의 변경을 **별도 에이전트**가 검증)와 정반대 축에 있다. OpenQodex는 "쓴 사람과 검사하는 사람을 서버 안에서도 AI 대 AI로 분리"했지만, 이 Com2uS 사례는 Archify로 시각화를 거쳐도 **최종 검토·의사결정은 끝까지 사람**에게 남긴다. 같은 "코드 리뷰 효율화" 목표를 완전히 다른 검증 주체 설계로 푸는 두 사례를 나란히 두면, "검증 자동화의 끝은 AI인가 사람인가"라는 질문이 더 선명해진다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 온다 CRS 운영에서도 Jira 기반 버그·요청 티켓이 쌓이는데, "일감 접수 → 구현 → 테스트 데이터 생성 → 사람이 최종 검토"로 흐름을 재설계하는 아이디어 자체는 전이 가능하다. 다만 `jira-auto-agent`·`Archify` 연동의 구체 구현을 확인하지 못한 상태라, 지금 당장 도구를 그대로 들여오기보다는 **"자동화 대상은 반복 구현+시각화, 최종 판단은 사람"이라는 원칙만** 먼저 참고하는 게 안전하다.

## 연관 자료

- [[2026-11-06-com2us-claude-code-skill-backoffice-tool]] — 같은 Com2uS AI 도입 시리즈, "완성작 통째로 안 맡긴다" 패턴의 세 번째 확인
- [[2026-11-02-openqodex-separate-agent-code-review]] — 코드 리뷰 검증 주체를 사람 대신 별도 에이전트로 두는 정반대 접근

## 한 달 뒤 회고

2026-12-16 즈음 — on.com2us.com 접속이 가능해지면 원문으로 `jira-auto-agent`·`Archify` 연동 구체 내용 보강. 온다 CRS Jira 운영 티켓 처리에 이 워크플로우 아이디어를 실제 검토했는지 점검.
