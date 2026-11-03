---
title: "WikiHack, Hacker News에서 언급된 Wikipedia 문서를 모아 보는 서비스(GeekNews) — 링크 수보다 '몇 명이 언급했는지'로 줄을 세운다"
source_title: "WikiHack - Hacker News에서 언급된 Wikipedia 문서를 모아 보는 서비스"
source_url: "https://news.hada.io/topic?id=36452"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36452"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "engineering"
tags: ["hacker-news", "wikipedia", "curation", "ranking"]
---

# WikiHack, Hacker News에서 언급된 Wikipedia 문서를 모아 보는 서비스(GeekNews)

> 출처: [WikiHack - Hacker News에서 언급된 Wikipedia 문서를 모아 보는 서비스](https://news.hada.io/topic?id=36452) (GeekNews) · 정리일 2026-11-03
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 "WikiHack"이라는 이름의 이 서비스를 특정하지 못해(검색 결과는 2014년 미국 국가기록원의 동명 해커톤 등 무관한 결과), Slack 발췌에만 의존했다.
>
> **가벼운 리소스**: 개인 사이드 프로젝트 성격의 글이라 억지로 무겁게 연결 짓지 않는다.

## 한 줄 요약

**2006년 이후 Hacker News 댓글에 링크된 영어 Wikipedia 문서를 모아, 단순 링크 수가 아니라 "서로 다른 몇 명이 언급했는지"를 기준으로 순위를 매겨 HN 이용자들이 공유해온 지식을 탐색하게 하는 서비스다.**

## 핵심 포인트

- **원재료는 20년치 HN 댓글** — ***2006년 이후 Hacker News 댓글에 링크된 영어 Wikipedia 문서***를 모아, HN 이용자들이 어떤 지식을 공유해 왔는지 탐색하게 한다.
- **순위 기준이 핵심 설계** — 단순 링크 수보다 ***서로 다른 이용자가 얼마나 많이 언급했는지***를 우선해 순위를 매긴다. 한 명이 여러 번 링크한 문서가 과대평가되지 않도록 한 설계로 보인다.
- **수록 기준** — ***서로 다른 댓글 작성자 2명 이상이 링크했거나***, 문서 자체가 HN에 제출돼 ***50점 이상***을 얻은 항목을 수록한다. 11월 1일 기준 약 ***7만 6,000개 문서***를 제공한다.
- **시의성 반영** — 무작위 탐색·역대 인기순 외에, 최근 12개월 동안 평소보다 언급이 늘어난 문서를 보여주는 기능도 있는 것으로 보이나, 발췌가 "늘어…"에서 끊겨 구체적 작동 방식은 확인하지 못했다.

## 인상 깊은 문장

*(Slack 발췌가 말줄임으로 끊겨 완결된 인용문이 남아 있지 않다.)*

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. WebSearch로도 서비스 자체를 특정하지 못해 수치(7만 6,000개 문서 등)는 Slack 발췌 단일 출처다.

## 내 생각 · 적용점

**핵심 전이 — HackerTube와 같은 날 올라온, HN 댓글을 원재료로 삼는 또 다른 큐레이션 도구.** [[2026-11-03-hackertube-karpathy-hn-video-curation]]이 YouTube 영상을 추렸다면 WikiHack은 Wikipedia 문서를 추린다 — 둘 다 "HN 댓글 속에 묻힌 추천을 꺼내 별도 인덱스로 만든다"는 같은 패턴이다. "서로 다른 이용자 수"로 가중치를 주는 설계는 [[2026-06-26-hacker-news-18-year-tech-trends]]가 다룬 "HN이 개발자 선행 지표"라는 관찰과도 느슨하게 닿아 있다 — 반복 링크보다 넓은 공감대가 신호라는 전제가 같다.

## 호스피탈리티 / CRS 적용 포인트

**적용 없음.** 개인용 지식 탐색 사이드 프로젝트로, CRS/호스피탈리티 도메인과 연결할 지점이 없다.

## 연관 자료

- [[2026-11-03-hackertube-karpathy-hn-video-curation]] — 같은 날 올라온, 같은 HN 댓글 원재료를 다른 미디어(영상)로 가공한 자매 프로젝트
- [[2026-06-26-hacker-news-18-year-tech-trends]] — HN 데이터를 가공하는 또 다른 큐레이션/분석 도구

## 한 달 뒤 회고

*(2026-12-03 즈음 — 특별히 재확인할 내용 없음, 가벼운 사이드 프로젝트 노트.)*
