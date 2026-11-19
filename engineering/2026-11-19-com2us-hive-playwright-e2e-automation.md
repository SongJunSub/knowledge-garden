---
title: "게임빌컴투스플랫폼, AI와 Playwright로 구축한 E2E 테스트 자동화(Com2uS, Hive Axyl 제품 실재는 교차확인)"
source_title: "AI와 Playwright로 구축한 E2E 테스트 자동화: 적용 경험과 확장 방향"
source_url: "https://on.com2us.com/tech/hive-playwright-e2e-test-automation/"
source_name: "게임빌컴투스플랫폼 (Com2uS ON Tech)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "engineering"
tags: ["e2e-testing", "playwright", "ai-coding", "com2us", "hive", "source-limitation"]
---

# 게임빌컴투스플랫폼, AI와 Playwright로 구축한 E2E 테스트 자동화

> 출처: [AI와 Playwright로 구축한 E2E 테스트 자동화](https://on.com2us.com/tech/hive-playwright-e2e-test-automation/) (Com2uS ON Tech) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-19
>
> **출처 한계**: `on.com2us.com` 전면 차단. Hive Axyl 콘솔 자체는 WebSearch로 실재가 교차확인된다(Com2uS Platform의 AI 백엔드 제품, 9월 30일 출시).

## 한 줄 요약

**Hive Axyl 콘솔은 AI로 Playwright 테스트 스펙을 작성해 E2E 테스트를 자동화하되, AI가 매번 추론하는 대신 QA·프론트엔드가 공유하는 저장된 스펙을 실행하는 방식을 택해 반복 업무와 테스트 효율을 함께 해결했다.**

## 핵심 포인트

- Hive Axyl 콘솔은 AI로 Playwright 테스트 스펙을 작성하고 E2E 테스트를 자동화하여 반복 업무를 줄였다.
- QA와 프론트엔드 저장소가 테스트 스펙 원본을 공유하여 제품 변경 시 검증 기준의 일관성을 유지한다.
- AI가 매번 추론하는 대신 저장된 스펙을 실행하는 방식을 택해 테스트 효율과 속도를 최적화했다.
- (Slack 발췌가 여기서 끝나 확장 방향의 구체 내용은 원문 미확인이다.)

## 인상 깊은 문장

*(Slack 발췌가 세 불릿으로 끝나, 완결된 인용문은 남아 있지 않다.)*

## 댓글

TechArticles 봇이 Com2uS ON Tech 블로그 글을 직접 공유한 것으로, GeekNews 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. **on.com2us.com 접속이 이 세션에서 차단**되어 원문을 열람하지 못했다. 다만 Hive Axyl 콘솔 자체는 복수 게임 전문 매체(invenglobal, gamemeca)로 실재가 확인되는 제품이라, 이 글이 소개하는 사례의 플랫폼적 배경은 신뢰할 만하다.

## 내 생각 · 적용점

### 핵심 전이 — "매번 추론 대신 저장된 스펙 실행"이 검증 비용을 구조적으로 줄인다

[[2026-10-16-line-ai-e2e-test-automation]]이 강조한 "통과하지만 의도를 검증 못하는 테스트를 막는 검증·리뷰 단계 분리"와 이어지는 설계다. 이 글은 한 단계 더 나아가, **AI가 스펙을 매번 새로 생성하지 않고 QA·프론트엔드가 공유하는 저장된 스펙을 그대로 실행**하게 함으로써 재현성과 일관성을 동시에 얻는다. [[2026-11-18-chrome-capture-tab-recording-tool]](실패 재현 영상 첨부)와도 "AI 테스트 자동화의 신뢰도를 높이는 보강 장치"라는 같은 맥락으로 연결된다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 예약·결제 플로우 E2E 테스트에서, AI가 매번 새 테스트 시나리오를 추론하게 하기보다 QA와 개발팀이 합의한 스펙을 저장해두고 그대로 재실행하는 구조는 그대로 가져올 만하다. 제품이 바뀔 때 스펙 원본을 공유 저장소에서 함께 갱신하는 방식도 검증 기준의 일관성을 지키는 데 유효하다.

## 연관 자료

- [[2026-10-16-line-ai-e2e-test-automation]] — 검증·리뷰 단계 분리라는 같은 원칙의 선행 사례
- [[2026-11-18-chrome-capture-tab-recording-tool]] — AI 테스트 자동화를 보강하는 같은 계열의 도구
- [[2026-10-20-musinsa-why-fast-devices-must-wait-test-automation]] — 같은 E2E 테스트 자동화 주제

## 한 달 뒤 회고

2026-12-19 즈음 — on.com2us.com 접속이 가능해지면 "확장 방향"의 구체 내용(어떤 테스트 범위로 넓혔는지)을 원문으로 확인.
