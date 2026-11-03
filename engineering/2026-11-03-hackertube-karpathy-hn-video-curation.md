---
title: "HackerTube, Karpathy가 만든 Hacker News 추천 영상 모음(GeekNews) — 추천 알고리즘 불만을 댓글 큐레이션으로 우회했다"
source_title: "HackerTube - Karpathy가 만든 Hacker News 추천 영상 모음"
source_url: "https://news.hada.io/topic?id=36351"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36351"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "engineering"
tags: ["hacker-news", "curation", "youtube", "karpathy", "llm-filtering"]
---

# HackerTube, Karpathy가 만든 Hacker News 추천 영상 모음(GeekNews)

> 출처: [HackerTube - Karpathy가 만든 Hacker News 추천 영상 모음](https://news.hada.io/topic?id=36351) (GeekNews) · 정리일 2026-11-03
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 "HackerTube"를 특정하는 1차 출처를 찾지 못해(검색 결과는 무관한 TheirTube·Karpathy 채널 소개 등), 이 글의 수치·사실은 Slack 발췌에만 의존한 가장 낮은 확인 수준이다.
>
> **가벼운 리소스**: 개인 사이드 프로젝트 성격의 글이라 억지로 무겁게 연결 짓지 않는다.

## 한 줄 요약

**YouTube의 과장된 썸네일과 추천 알고리즘에 대한 불만에서 출발해, Opus 5.5와 Sonnet으로 Hacker News 댓글 약 4만 개를 필터링해 영상 6,454개·주제 150개를 추려낸 큐레이션 사이트를 Karpathy가 만들었다.**

## 핵심 포인트

- **불만의 출발점** — YouTube의 ***과장된 썸네일과 반복적인 추천***에 대한 불만에서 시작해, HN 댓글에서 추천된 영상만 모아 보는 사이트를 만들었다.
- **LLM으로 거른 4만 개 댓글** — ***Opus 5.5와 Sonnet***으로 HN 댓글을 필터링하고 스팸 등을 걸러내, 추천 댓글 약 4만 개에서 ***영상 6,454개와 주제 150개***를 추려냈다.
- **썸네일도 다르게** — 업로더가 지정한 썸네일 대신 ***영상 중간 지점의 이미지***를 사용해, 애초 문제였던 "과장된 썸네일"을 우회했다.
- **계정 없는 개인화** — 계정 없이 브라우저에 저장한 상태를 바탕으로 ***ForYou 맞춤 추천***을 제공하며, 키보드 단축키와 데이터 내보내기도 지원한다.
- **내보낸 데이터를 에이전트에** — 내보낸 데이터를 에이전트에 전달해 활용하는 용도까지 염두에 둔 것으로 보이나, 발췌가 "자신…"에서 끊겨 구체적 활용 방식은 확인하지 못했다.

## 인상 깊은 문장

*(Slack 발췌가 말줄임으로 끊겨 완결된 인용문이 남아 있지 않다.)*

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. WebSearch로도 1차 출처(사이트 자체나 Karpathy의 발표)를 특정하지 못해, 이 노트는 이번 배치 중 확인 수준이 가장 낮다 — 수치(4만 개, 6,454개 등)는 Slack 발췌 단일 출처 그대로다.

## 내 생각 · 적용점

**핵심 전이 — "커뮤니티의 집단 큐레이션을 가공해 새 도구로 재구성한다"는 계열.** [[2026-06-26-hacker-news-18-year-tech-trends]]가 HN 데이터를 트렌드 분석으로 가공했다면, HackerTube는 같은 원재료(HN 댓글)를 "영상 추천"이라는 전혀 다른 용도로 가공한다. LLM이 수만 개 댓글에서 노이즈를 거르는 필터 역할을 한다는 점도, AI가 "크기 때문에 수작업으론 불가능했던 큐레이션"을 가능하게 만든 사례로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 없음.** 개인용 콘텐츠 큐레이션 사이드 프로젝트로, CRS/호스피탈리티 도메인과 연결할 지점이 없다.

## 연관 자료

- [[2026-06-26-hacker-news-18-year-tech-trends]] — 같은 HN 데이터를 다른 방식으로 가공한 큐레이션 도구
- [[2026-11-03-wikihack-hn-wikipedia-curation]] — 같은 날 올라온, 같은 HN 댓글 원재료를 다른 미디어(위키백과)로 가공한 자매 프로젝트

## 한 달 뒤 회고

*(2026-12-03 즈음 — 특별히 재확인할 내용 없음, 가벼운 사이드 프로젝트 노트.)*
