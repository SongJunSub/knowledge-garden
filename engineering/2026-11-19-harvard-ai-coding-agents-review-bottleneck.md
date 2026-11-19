---
title: "Harvard 연구진, AI 코딩 에이전트가 병목을 코드 리뷰로 옮겼음을 확인(GeekNews, 수치는 소스간 두 버전)"
source_title: "Harvard working paper on AI coding agents and code review bottleneck"
source_url: "https://www.beri.net/article/harvard-jellyfish-study-ai-coding-agents-code-review-bottleneck-output-employment-engineering-org-design"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37405"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "engineering"
tags: ["ai-coding", "code-review", "productivity", "research", "source-limitation"]
---

# Harvard 연구진, AI 코딩 에이전트가 병목을 코드 리뷰로 옮겼음을 확인

> 출처: [Harvard working paper](https://www.beri.net/article/harvard-jellyfish-study-ai-coding-agents-code-review-bottleneck-output-employment-engineering-org-design) (하버드 연구진, GeekNews 경유) · 정리일 2026-11-19
>
> **출처 한계**: 하버드 워킹페이퍼 1차 원문은 열람하지 못했다. 아래 수치는 beri.net 2차 보도 기준이며, 다른 매체(forkast, techradar 등)는 "718개 기업·코드량 +30%·커밋 +20%·에픽 +23%·병합시간 +49%"로 다른 버전을 보도해, 같은 연구의 리비전 차이인지 별개 집계인지 불명확하다.

## 한 줄 요약

**AI 코딩 에이전트 도입 후 코드 작성량은 크게 늘었지만 실제 완료·배포까지 이어지는 증가 폭은 훨씬 작았고, 늘어난 코드는 그대로 코드 리뷰 단계의 병목으로 옮겨갔다.**

## 핵심 포인트

- 하버드 연구진이 655개 기업, 근로자 720,542명의 업무 데이터를 분석했다(beri.net 보도 기준). AI 코딩 에이전트 도입 후 코드 작성량은 44.0% 증가했지만, 배포까지 완료한 작업의 증가 폭은 훨씬 작았다.
- 완료한 Jira 이슈는 13.7%, 대규모 프로젝트·기능을 나타내는 에픽은 18.0% 증가했으나, ***두 추정치 모두 통계적 유의성 기준에는 조금 못 미쳤다***.
- PR 제출부터 병합까지 걸리는 시간은 56.1% 증가했다. 리뷰를 기다리는 시간뿐 아니라 실제 리뷰가 진행되는 시간도 길어졌고, PR당 리뷰 댓글은 38.6% 늘었다.
- 핵심 결론은 복수 매체가 공통으로 보도한다: 코드 출력 증가의 혜택을 실제로 누리려면 하류의 리뷰 역량에도 함께 투자해야 한다.

## 인상 깊은 문장

> "realizing the benefits of AI adoption requires complementary investments in downstream review capacity, rather than simply increasing code output."

## 댓글

GeekNews 댓글 수는 확인하지 못했다(원문 미확인). 하버드 워킹페이퍼 1차 원문을 못 찾아 beri.net 2차 보도에 의존했는데, 다른 매체는 기업 수·증가율이 다른 버전을 보도한다 — 같은 연구의 서로 다른 리비전인지 확인이 더 필요하다. 다만 "코드량 증가가 완료량 증가로 직결되지 않고 리뷰가 병목이 된다"는 핵심 논지 자체는 모든 보도가 일치한다.

## 내 생각 · 적용점

### 핵심 전이 — 이미 레포가 같은 결론을 2026-08-20에 선행 관찰했다

[[2026-08-20-code-outruns-review]]가 이미 "코드가 리뷰를 앞지른다"는 동일한 주제를 다뤘다. 이번 하버드 연구는 그 직관을 **대규모 실증 데이터(655개 기업)**로 뒷받침하는 후속 확인이다. 같은 배치의 [[2026-11-16-com2us-jira-auto-agent-pr-review-workflow]]가 보여준 "코딩이 아니라 Jira 일감~PR 검토까지 자동화 범위를 넓히는" 접근은, 이 연구가 지목한 "리뷰 역량 투자"의 구체적인 한 형태로 읽을 수 있다.

### 대비 — PR 자동승인을 좁히는 반대 방향 사례

[[2026-10-31-small-change-pr-auto-approval]]은 "작은 변경만 자동 승인"으로 리뷰 부담을 줄이는 좁은 자동화를 보여주는데, 이 연구가 지목한 문제(리뷰가 못 따라간다)에 대한 실제 대응 사례로 나란히 놓을 만하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 온다에서도 AI 코딩 도구로 커밋·PR 양이 늘어난다면, 리뷰어 역량·시간에 투자하지 않으면 이 연구가 보여준 것과 같은 병목이 그대로 재현될 수 있다. PR 양이 늘기 전에 리뷰 프로세스(자동 1차 필터, 리뷰어 배정 기준)를 먼저 점검하는 게 안전하다.

## 연관 자료

- [[2026-08-20-code-outruns-review]] — 같은 주제의 선행 관찰, 이번 연구가 실증적으로 뒷받침
- [[2026-11-16-com2us-jira-auto-agent-pr-review-workflow]] — 리뷰 역량 투자의 구체적 형태(일감~PR 검토 자동화)
- [[2026-10-31-small-change-pr-auto-approval]] — 리뷰 부담을 줄이는 반대 방향의 좁은 자동화

## 한 달 뒤 회고

2026-12-19 즈음 — 하버드 워킹페이퍼 1차 원문이 공개됐는지, 655개 vs 718개 기업 수치 차이가 해소됐는지 확인.
