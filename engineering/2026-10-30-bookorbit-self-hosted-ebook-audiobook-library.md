---
title: "BookOrbit - 전자책과 오디오북을 여러 기기에서 이어 읽는 셀프 호스팅 도서관 (GeekNews) - 읽기 위치를 서버가 들고 있으면 기기는 그냥 창이 된다"
source_title: "BookOrbit - 전자책과 오디오북을 여러 기기에서 이어 읽는 셀프 호스팅 도서관"
source_url: "https://news.hada.io/topic?id=36261"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-30"
category: "engineering"
tags: ["self-hosted", "ebook", "audiobook", "koreader", "sync", "personal-tool"]
---

# BookOrbit - 전자책과 오디오북을 여러 기기에서 이어 읽는 셀프 호스팅 도서관 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36261) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). GeekNews 자동봇이 Slack에 올린 불릿 5개 중 마지막 문장이 "듣기…"에서 말줄임표로 끊겨 있어 그 뒤 내용(글-낭독 연동 EPUB의 나머지 설명)은 확인하지 못했다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인 불가. 가벼운 셀프호스팅 도구 소개 글이라 WebSearch 교차확인은 시도하지 않았다.

## 한 줄 요약

**BookOrbit은 전자책·PDF·만화·오디오북을 자신의 서버에 모아두고, 웹·전자책 단말기(Kobo·KOReader)·모바일 앱 사이에서 읽은 위치와 하이라이트를 양방향 동기화하는 셀프 호스팅 독서 플랫폼이다.**

## 핵심 포인트

- **서버 중심 라이브러리** - 전자책·PDF·만화·오디오북을 자신의 서버에 모아두고 웹, 전자책 단말기, 모바일에서 읽고 듣는 구조.
- **양방향 동기화** - 웹 리더와 ***Kobo, KOReader 사이에서 읽은 위치와 하이라이트를 양방향 동기화***해 기기를 바꿔도 이어 읽기 가능.
- **KOReader 플러그인** - 서버의 책을 직접 검색·다운로드하고, 읽기 상태와 평점까지 기기에서 관리.
- **공식 모바일 앱** - iPhone/iPad 앱으로 오프라인 다운로드, Apple Watch에서 오디오북 재생 지원.
- **읽어주는 문장 표시(TTS 연동 추정)** - 글과 낭독을 연결한 EPUB에서 현재 읽어주는 문장을 표시한다는 설명까지는 확인했으나, 그 뒤는 발췌가 끊겨 확인 못함.

## 인상 깊은 문장

*(원문 미확보, Slack 발췌 자체가 인용문 형태가 아니라 생략)*

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가(원문 접근 차단). "PASS"로 보고하지 않고 확인 못한 상태 그대로 남긴다.

## 내 생각 · 적용점

가벼운 셀프호스팅 도구 소개라 억지로 핵심 전이를 만들지 않는다. 다만 "읽은 위치·하이라이트를 서버가 들고 있어 기기가 바뀌어도 이어진다"는 구조는, 이 가든의 engineering 카테고리에 쌓인 다른 셀프호스팅 도구들([[2026-10-15-n100-mini-pc-selfhosting-28-services]], [[2026-10-04-cogsend-self-hosted-social-scheduler]], [[2026-10-07-octop-self-hosted-ai-assistant]])과 같은 결의 "내 데이터는 내 서버에, 클라이언트는 창일 뿐"이라는 셀프호스팅 철학의 또 다른 사례로만 가볍게 묶어둔다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 개인용 독서 도구이고 CRS 도메인과 접점이 없다. 억지 연결은 하지 않는다.

## 연관 자료

- [[2026-10-15-n100-mini-pc-selfhosting-28-services]] - 같은 "내 서버에 내 데이터" 셀프호스팅 철학.
- [[2026-10-07-octop-self-hosted-ai-assistant]] - 같은 결의 개인용 셀프호스팅 도구.

## 한 달 뒤 회고

*(2026-11-30 즈음 - news.hada.io 접근이 풀렸다면 TTS 연동 EPUB 설명의 나머지 부분을 확인한다. 실제로 이 도구를 써봤다면 KOReader 동기화 경험을 덧붙인다.)*
