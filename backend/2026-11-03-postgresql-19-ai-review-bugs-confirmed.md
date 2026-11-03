---
title: "Postgres 19 출시가 늦어지는 건 AI 때문이다 - 버그 발견이 수정을 앞지르다(GeekNews) — 3주 전 '소문'이라 판단했던 인과관계를 커미터 본인이 확인했다"
source_title: "Postgres 19 출시가 늦어지는 건 AI 때문이다 - 버그 발견이 수정을 앞지르다"
source_url: "https://news.hada.io/topic?id=36491"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36491"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "backend"
tags: ["postgresql", "release-management", "ai-code-review", "software-quality", "open-source"]
---

# Postgres 19 출시가 늦어지는 건 AI 때문이다 - 버그 발견이 수정을 앞지르다(GeekNews)

> 출처: [Postgres 19 출시가 늦어지는 건 AI 때문이다 - 버그 발견이 수정을 앞지르다](https://news.hada.io/topic?id=36491) (GeekNews) · 정리일 2026-11-03
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. Slack 발췌는 "보안 문제와 버…"에서 끊긴다. WebSearch로 Phoronix 등 복수 매체를 교차확인했다 — **이번에는 PostgreSQL 커미터 Robert Haas·Peter Eisentraut 본인이 LLM 보조 리뷰가 지연·기능 철회에 영향을 줬다고 직접 확인한 내용까지 나온다.** 다만 "백포트 커밋 60%·74% 증가"라는 구체적 수치는 Slack 발췌에만 있고 WebSearch로는 교차확인하지 못했다.

## 한 줄 요약

**[[2026-10-17-postgresql-19-release-delay-ai-review-bugs]]에서 "소문 수준"이라며 사실 서술과 분리해뒀던 "AI 리뷰가 Postgres 19 지연의 원인"이라는 인과관계를, 3주 뒤 PostgreSQL 커미터 Robert Haas와 Peter Eisentraut가 직접 확인하면서 의심이 검증으로 넘어갔다.**

## 핵심 포인트

- **커미터 본인의 확인** — WebSearch로 찾은 Phoronix 기사에 따르면 Robert Haas가 자신의 블로그에서 PostgreSQL 19 지연에 AI가 영향을 줬다고 밝혔고, Peter Eisentraut는 기능 철회의 원인을 ***LLM 보조 코드 리뷰*** 로 지목했다 — 이전 노트에서 "미검증 추측"으로만 처리했던 주장이 이번엔 1차 관계자 증언 수준으로 격상됐다.
- **버그 발견은 쉬워졌지만 수정은 그대로** — ***"버그 발견은 훨씬 쉬워졌지만 수정은 같은 만큼 쉬워지지 않음"*** 이라는 발췌의 핵심 문장. AI가 작성한 수정안도 정확성과 프로젝트 기준 준수 여부를 사람이 검토·커밋해야 해, 발견 비용은 줄어도 검증 비용은 그대로 사람에게 남는다는 이전 노트의 해석과 정확히 겹친다.
- **백포트 부담까지 증가 주장** — ***"출시 준비 버전에 반영한 백포트 커밋은 60% 이상, 적어도 하나의 이전 버전까지 반영한 커밋은 74% 이상 증가함"*** — 신규 버그뿐 아니라 기존 버전에 소급 적용해야 하는 수정까지 늘어, 신규 개발과 유지보수 양쪽에서 동시에 부담이 커졌다는 뜻이다. 이 수치 자체는 WebSearch로 교차확인하지 못했다.
- **베타 후반 기능 철회 수가 이전 노트와 다름** — 이번 Slack 발췌는 ***"베타 후반에 대형 기능 3개도 철회됨"*** 이라 쓰지만, [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]]는 WebSearch로 "8~10개 기능 철회"를 확인했었다 — "대형 기능만 센 수"와 "전체 철회 수"의 차이일 가능성이 있으나 이번 세션에서 재확인하지 못했다. 정직하게 불일치를 남겨둔다.

## 인상 깊은 문장

> "PostgreSQL 19 is running behind schedule... AI is at fault." — Robert Haas, Phoronix 인용(WebSearch 교차확인)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. **이해관계**: "AI가 오픈소스 품질 기준을 끌어올린다"는 서사는 AI 도구 업계에 유리한 결론이라, 이전 노트에서처럼 "사실(지연·철회)"과 "원인 해석(AI 탓)"을 분리해서 보는 습관을 이번에도 유지한다 — 다만 이번엔 커미터 본인 발언이라는 점에서 이전보다 확인 수준이 분명히 높아졌다.

## 내 생각 · 적용점

**핵심 전이 — 의심에서 검증으로 넘어간 사례를 가든에 직접 기록한다.** [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]]는 "지연은 사실, 원인은 추측"이라고 신중하게 선을 그었고, 그 노트의 "한 달 뒤 회고" 항목이 바로 "AI 리뷰가 원인이라는 주장을 뒷받침하는 공식 발표나 커미터 증언이 나왔는지 확인"이었다. 이번 글이 그 회고 질문에 대한 조기 답이 됐다 — 3주 만에 Phoronix 보도로 그 증언이 실제로 나온 것이다. 이는 [[2026-10-30-zombie-statistics-ai-citation-provenance]](AI가 인용한 숫자의 출처 추적)와도 닮은 교훈을 준다: 처음엔 "소문"이었던 인과관계도 시간이 지나며 검증될 수 있으니, 의심스러운 주장을 무시하지 말고 날짜를 찍어 추적해두는 습관이 가치 있다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용.** CRS 내부 코드 리뷰에 AI를 도입할 때, "발견되는 이슈 수가 늘었다"가 "품질이 나빠졌다"가 아니라 "발견 시점이 당겨졌다"는 이전 노트의 원칙은 여전히 유효하다. 여기에 더해, 이번 글의 "백포트 부담 증가"는 CRS에도 그대로 적용된다 — AI 리뷰로 신규 버그를 많이 찾아낼수록 과거 출시 버전에 소급 적용해야 하는 패치 작업량도 함께 늘어날 수 있다는 점을 CRS 유지보수 일정에 미리 반영할 가치가 있다.

## 연관 자료

- [[2026-10-17-postgresql-19-release-delay-ai-review-bugs]] — 3주 전 같은 사건을 "소문 수준"으로 신중하게 다룬 선행 노트, 이번 글이 그 회고 질문에 대한 답
- [[2026-10-30-zombie-statistics-ai-citation-provenance]] — AI 관련 주장의 출처·검증 수준을 따지는 같은 정직성 원칙
- [[2026-10-31-can-ai-data-agents-do-real-analysis]] — "AI가 실무를 완전히 대체하긴 어렵다"는 같은 결의 사례(발견은 쉽지만 검증·수정은 사람 몫)

## 한 달 뒤 회고

*(2026-12-03 즈음 — 2026-11-19 GA가 실제로 그 날짜에 이뤄졌는지, 그리고 "백포트 커밋 60%·74% 증가" 수치의 1차 출처를 PostgreSQL 공식 통계에서 확인.)*
