---
title: "Movie Scene Map — 영화·TV·게임·애니·만화의 실제 촬영지와 배경을 탐색하는 지도, Wikidata 구조화 데이터를 색으로 구분된 지도로 재구성"
source_title: "Movie Scene Map — The Filming Locations Map for Film & TV"
source_url: "https://moviescenemap.com/"
source_name: "moviescenemap.com"
referrer_url: "https://news.hada.io/topic?id=33153"
published_at: "2026-09-02"
summarized_at: "2026-09-03"
category: "frontend"
tags: ["side-project", "wikidata", "interactive-map", "resource"]
---

# Movie Scene Map — 영화·TV·게임·애니·만화의 실제 촬영지와 배경을 탐색하는 지도, Wikidata 구조화 데이터를 색으로 구분된 지도로 재구성

> 출처: [Movie Scene Map](https://moviescenemap.com/) · GeekNews(id=33153) 경유 · 정리일 2026-09-03

## 한 줄 요약

**166개국 15,565곳의 실제 촬영지와 게임·애니·만화가 배경으로 삼은 실제 장소 약 13,000개를 연결한 무료 대화형 지도. 영화·TV는 Wikidata의 "촬영지(P915)" 속성을, 게임·애니·만화는 "서사적 장소(P840)" 속성을 각각 다르게 매핑해 성격이 다른 두 종류의 "장소-작품 관계"를 구분한다.**

## 핵심 포인트

- **규모** — 166개국 15,565개 실제 촬영지, 9,295개 영화·시리즈 페이지, 2,153개 비디오게임, 407개 애니메이션, 365개 만화.
- **데이터 구조의 구분** — 촬영지(영화·드라마)는 Wikidata의 "filming location(P915)"에, 설정(게임·애니·만화가 그린 세계의 실제 모델이 된 장소)은 "narrative location(P840)"에 각각 기록되며, 지도는 이 둘을 별도로 표시한다.
- **시각적 구분** — 국가/지역(주황), 랜드마크/건물(파랑), 도시(에메랄드), 자연경관(초록), 성/궁전(보라), 도로/광장(빨강)으로 색상 코드화.
- **무료·무가입** — 제목이나 장소를 검색하면 촬영지 또는 그곳에서 제작된 작품을 볼 수 있고, 광고·가입 절차 없이 무료로 제공.

## 인상 깊은 문장

> "The 'Movie Scene Map' separates filming locations for movies and dramas from settings for games, anime, and manga." (GIGAZINE 보도 요약)

## 댓글

**출처 한계 부분적.** news.hada.io는 접속 차단. WebSearch로 GIGAZINE 보도와 moviescenemap.com 자체 About 페이지 스니펫을 교차확인했으며, HN에도 같은 프로젝트를 다룬 스레드(news.ycombinator.com/item?id=49524320)가 있다는 것을 확인했으나 news.ycombinator.com 접속 차단으로 포인트·댓글 수는 확인하지 못했다.

## 내 생각 · 적용점

이 글은 리소스·유머 계열의 가벼운 사이드 프로젝트 소개다. CLAUDE.md의 품질 기준대로, 억지로 깊은 핵심 전이를 만들지 않고 가볍게 남긴다. 굳이 하나 꼽자면, **Wikidata의 서로 다른 속성(P915 vs P840)을 구분해 매핑한다는 데이터 모델링 선택**이 흥미롭다 — 하나의 지도 UI 아래 의미적으로 다른 두 관계(실제로 거기서 촬영했다 vs 그곳을 배경으로 그렸다)를 섞지 않고 명시적으로 분리한 점은, 일반적인 데이터 모델링에서 "겉보기엔 비슷한 두 관계를 하나의 필드에 욱여넣지 말라"는 흔한 교훈의 좋은 예시다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 "촬영지 지도"라는 컨셉 자체는 여행/호스피탈리티 마케팅에서 종종 쓰이는 포맷(영화 속 장소를 찾아가는 여행 콘텐츠)과 맞닿아 있어, 온다 고객사(호텔·리조트)가 콘텐츠 마케팅에 참고할 만한 아이디어 정도로만 남긴다.

## 연관 자료
*(이번 배치에서 직접 연결되는 기존 노트 없음 — 리소스성 사이드 프로젝트 소개로, 억지 연결은 하지 않는다.)*

## 한 달 뒤 회고
*(2026-10-03 즈음 — 이런 지도형 리소스 사이트가 CRS 파트너 마케팅 콘텐츠 아이디어로 실제 논의된 적이 있었는지 확인.)*
