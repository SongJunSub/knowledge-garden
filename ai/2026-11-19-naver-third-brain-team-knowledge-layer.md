---
title: "네이버, 부족한 건 모델이 아니라 팀 문서였다: 팀 공유 지식층 Third Brain 구축기(NAVER D2, Slack 발췌 뒤섞임에서 복원)"
source_title: "부족한 건 모델이 아니라 팀 문서였다: 팀 공유 지식층 Third Brain 구축기"
source_url: "https://d2.naver.com/helloworld/2622882"
source_name: "NAVER D2"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "ai"
tags: ["team-knowledge", "ai-agent", "wiki", "naver", "source-limitation", "feed-anomaly"]
---

# 네이버, 부족한 건 모델이 아니라 팀 문서였다: 팀 공유 지식층 Third Brain 구축기

> 출처: [부족한 건 모델이 아니라 팀 문서였다](https://d2.naver.com/helloworld/2622882) (NAVER D2) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-19
>
> **출처 한계 + 피드 이상 소견**: `d2.naver.com` 전면 차단. 이 글의 본문 발췌 역시 Slack 봇에서 **다른 메시지(제목이 "보호된 글: Session Summary Test3"로 뜬 베스핀글로벌 글)에 잘못 첨부**되어 있었다. 그 메시지의 발췌("AI가 업무를 수행하지 못하는 원인을 팀 문서 부재로 파악... Third Brain으로 구축")가 이 글의 제목과 정확히 일치해 복원해서 썼다. [[2026-11-19-naver-jetpack-compose-3d-carousel]]과 거울상 관계다.

## 한 줄 요약

**AI가 업무를 제대로 수행하지 못하는 원인을 모델 성능이 아니라 팀 내부 문서의 부재로 진단하고, AI가 직접 읽고 쓸 수 있는 공유 지식층 Third Brain을 구축해 운영한 경험을 공유한다.**

## 핵심 포인트

- AI가 업무를 수행하지 못하는 원인을 모델 성능이 아닌 팀 내 문서의 부재로 파악하고 해결책을 제시한다.
- 팀 위키를 AI가 읽고 쓸 수 있는 공유 지식층인 Third Brain으로 구축하여 운영한 경험을 공유한다.
- (Slack 발췌가 여기서 끝나 구체적인 구축 방식·운영 결과는 원문 미확인이다.)

## 인상 깊은 문장

*(Slack 발췌가 짧은 불릿 두 개로 끝나, 완결된 인용문은 남아 있지 않다.)*

## 댓글

TechArticles 봇이 NAVER D2 블로그 글을 직접 공유한 것으로, GeekNews 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. **d2.naver.com 접속이 이 세션에서 차단**되어 원문을 직접 열람하지 못했고, 위 출처 한계에 적은 대로 발췌가 다른 메시지와 뒤섞여 있던 것을 제목-내용 일치로 복원했다.

## 내 생각 · 적용점

### 핵심 전이 — "회사 두뇌"라는 같은 아이디어의 또 다른 구현

[[2026-11-09-company-brain-ai-context]]가 "바뀌는 사내 지식은 파인튜닝보다 검색으로 따라잡는다"며 1~2페이지 문서로 회사 맥락을 AI에 제공하는 방법을 다뤘는데, 이 글의 "Third Brain"은 같은 문제의식(AI가 일을 못하는 건 모델이 아니라 문서 부재 때문)을 팀 위키 전체로 확장한 버전이다. [[2026-10-05-agents-need-docs-not-memory]]("에이전트는 메모리가 아니라 문서가 필요하다")와도 정확히 같은 결론선상에 있고, [[2026-08-28-line-llm-wiki-code-driven-ssot]](LINE의 코드 기반 SSOT 위키)와는 "위키를 AI의 1차 지식원으로 만든다"는 같은 접근의 다른 회사 사례다.

### Claude 사용자 관점의 적용점

Claude에게 팀 맥락을 제공할 때, 대화 기록이나 메모리보다 "팀이 함께 쓰고 AI도 읽고 쓸 수 있는 위키"를 1차 소스로 두는 게 이 세 사례(Third Brain, Company Brain, LINE SSOT) 모두가 수렴하는 방향이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** 온다의 CRS 운영 노하우·요금 정책·고객사별 예외 규정이 담당자 개인의 머릿속이나 흩어진 문서에만 있다면, AI 에이전트가 이를 활용할 수 없다. "AI가 일을 못하는 건 모델이 아니라 문서 부재 때문"이라는 이 글의 진단은, 온다 내부 지식을 AI가 읽고 쓸 수 있는 공유층으로 먼저 정리하는 게 다른 AI 도입보다 선행돼야 한다는 점을 시사한다.

## 연관 자료

- [[2026-11-09-company-brain-ai-context]] — 같은 "회사 두뇌" 개념, 1~2페이지 문서 버전
- [[2026-10-05-agents-need-docs-not-memory]] — 같은 결론("에이전트는 문서가 필요하다")
- [[2026-08-28-line-llm-wiki-code-driven-ssot]] — 같은 접근의 다른 회사(LINE) 사례
- [[2026-11-19-naver-jetpack-compose-3d-carousel]] — 같은 Slack 배치에서 거울상으로 발췌가 뒤섞인 글

## 한 달 뒤 회고

2026-12-19 즈음 — d2.naver.com 접속이 가능해지면 Third Brain의 구체 구축 방식(어떤 위키 도구, AI 쓰기 권한 범위)을 원문으로 확인.
