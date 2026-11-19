---
title: "네이버, Jetpack Compose 기반 커스텀 3D 캐러셀 개발기(NAVER D2, Slack 발췌 뒤섞임에서 복원)"
source_title: "Jetpack Compose 기반 커스텀 3D 캐러셀 개발기"
source_url: "https://d2.naver.com/helloworld/2957037"
source_name: "NAVER D2"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "frontend"
tags: ["jetpack-compose", "android", "ui-engineering", "naver", "source-limitation", "feed-anomaly"]
---

# 네이버, Jetpack Compose 기반 커스텀 3D 캐러셀 개발기

> 출처: [Jetpack Compose 기반 커스텀 3D 캐러셀 개발기](https://d2.naver.com/helloworld/2957037) (NAVER D2) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-19
>
> **출처 한계 + 피드 이상 소견**: `d2.naver.com` 전면 차단. 이 글의 본문 발췌는 Slack 다이제스트 봇에서 **다른 메시지(같은 시각 올라온 "Third Brain" 글)에 잘못 첨부**되어 있었다. 제목("3D 캐러셀")과 그 메시지에 붙은 발췌(LazyRow·3D 카드덱·Paging3)가 정확히 일치해, 발췌가 제목이 다른 메시지로 밀려 붙은 것으로 판단하고 복원해서 썼다. 같은 배치에서 "Third Brain" 글(아래 연관 자료)도 거울상으로 같은 문제를 겪었다.

## 한 줄 요약

**LazyRow만으로는 구현하기 어려운 3D 카드 덱 UI를 Jetpack Compose로 직접 만들며, 리컴포지션 최적화·3D 터치 판정 오류·Paging3 연동까지 복잡한 인터랙션을 하나씩 풀어낸 개발기다.**

## 핵심 포인트

- LazyRow로 구현하기 어려운 3D 카드 덱 UI를 Jetpack Compose로 직접 개발한 과정을 상세히 설명한다.
- 리컴포지션 최적화와 3D 터치 판정 오류 해결, Paging3 연동 등 복잡한 인터랙션 구현 기술을 다룬다.
- (Slack 발췌가 여기서 끝나 나머지 세부는 원문 미확인이다.)

## 인상 깊은 문장

*(Slack 발췌가 짧은 불릿 두 개로 끝나, 완결된 인용문은 남아 있지 않다.)*

## 댓글

TechArticles 봇이 NAVER D2 블로그 글을 직접 공유한 것으로, GeekNews 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. **d2.naver.com 접속이 이 세션에서 차단**되어 원문을 직접 열람하지 못했고, 위에 적은 출처 한계대로 Slack 발췌 자체가 다른 메시지에 잘못 붙어 있던 것을 복원해 썼다 — 복원이 맞다는 근거는 제목-내용 일치뿐이라, 100% 확신할 수는 없다.

## 내 생각 · 적용점

### 핵심 전이 — 플랫폼은 다르지만 "복잡한 인터랙션을 기본 컴포넌트로 못 담을 때"의 선택

LazyRow라는 표준 컴포넌트의 한계를 커스텀 구현으로 돌파하는 이 글의 구조는, 웹 프론트엔드에서 표준 라이브러리가 감당 못하는 인터랙션을 직접 구현하는 선택과 같은 축이다. 플랫폼(Android/Compose vs 웹)이 달라도 "표준 컴포넌트 확장이냐 처음부터 새로 짜느냐"라는 판단 기준은 동일하게 적용된다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 모바일 앱의 3D 카드덱 UI는 CRS 운영 도메인과 직접 연결점이 약하다. "표준 컴포넌트의 한계를 만나면 리컴포지션·성능 비용을 먼저 측정하고 커스텀 구현을 결정한다"는 원칙 정도만 가볍게 참고할 수 있다.

## 연관 자료

- [[2026-11-19-naver-third-brain-team-knowledge-layer]] — 같은 Slack 배치에서 거울상으로 발췌가 뒤섞인 글

## 한 달 뒤 회고

2026-12-19 즈음 — d2.naver.com 접속이 가능해지면 원문으로 발췌 복원이 맞았는지, 3D 터치 판정 오류의 구체 해법을 확인.
