---
title: "Hister (asciimoo) — 브라우저 기록이 제목·URL만 남길 때, 방문 페이지와 로컬 파일의 본문 전체를 색인해 '읽었던 문장'으로 다시 찾는 개인 검색엔진"
source_title: "Hister: Your own search engine"
source_url: "https://github.com/asciimoo/hister"
source_name: "GitHub (asciimoo/hister)"
referrer_url: "https://news.hada.io/topic?id=33094"
published_at: "확인 불가 — Show HN 스레드가 최소 두 시점(2026-02-11 추정 최초 게시, 2026-08-26 추정 재게시)으로 검색돼 최초 공개일 특정 어려움"
summarized_at: "2026-09-01"
category: "engineering"
tags: ["personal-search-engine", "self-hosted", "full-text-search", "browser-extension", "mcp", "local-first", "privacy"]
---

# Hister — 방문한 웹페이지와 로컬 파일을 다시 찾는 개인 검색엔진

> 출처: [Hister: Your own search engine](https://github.com/asciimoo/hister) (asciimoo, GitHub) · 정리일 2026-09-01
> **출처 한계**: `news.hada.io`가 이번 세션 내내 egress 차단돼 GeekNews 페이지·댓글을 전혀 못 읽었다. 다행히 `github.com`은 이번 세션에서 유일하게 접근 가능해 공식 저장소는 직접 확인했다. Hacker News(`news.ycombinator.com`)는 차단돼 정확한 포인트·댓글 수는 확인 못했고, WebSearch로 최소 세 차례(id=46901321, 46977485, 49351802) 게시 이력과 저자 AMA 스레드(id=49402473) 존재만 교차확인했다.

## 한 줄 요약

**Hister는 방문한 웹페이지와 로컬 파일의 본문 전체를 색인해, 브라우저 기록이 남기는 "제목·URL"이 아니라 "그 페이지 안에서 실제로 읽었던 문장"으로 다시 찾을 수 있게 하는 자체 호스팅 개인 검색엔진이다.** Firefox/Chrome 확장이 새 방문 페이지를 자동으로 색인하고, 웹·터미널·HTTP API·MCP 네 가지 경로에서 같은 인덱스를 검색할 수 있다.

## 핵심 포인트

- **문제의식** — 브라우저 기록은 제목과 URL만 남긴다. Hister는 방문 페이지·보관 파일의 **본문 전체를 색인**해 "그 안에서 읽었던 문장과 정보"를 검색 대상으로 삼는다.
- **자동 수집** — Firefox/Chrome 확장이 새로 방문한 페이지를 자동으로 Hister 서버에 저장. 기존 브라우저 기록을 가져오거나, 크롤러로 특정 사이트를 통째로 색인하는 것도 가능.
- **로컬 파일도 색인 대상** — 문서·PDF 등 로컬 파일을 추가하면 웹 브라우징 이력과 개인 지식 베이스를 한 인덱스 안에 둘 수 있다.
- **쿼리 기능** — 필드 필터, 정확한 문구, 와일드카드, 제외 조건, 별칭, 결과 우선순위 지정을 지원하는 자체 쿼리 언어.
- **선택적 의미 검색** — 사용자가 직접 설정한 임베딩 엔드포인트(Ollama, llama.cpp 등)로 문서 텍스트를 보내는 방식 — 강제되는 클라우드 서비스가 없다.
- **네 가지 접근 경로, 같은 인덱스** — 웹 인터페이스, 터미널 클라이언트, HTTP API, 그리고 **MCP 서버**로 Claude 같은 AI 어시스턴트와 직접 연동 가능.
- **기술/라이선스** — Go 1.26 기반, AGPL-3.0 이상. 저자 asciimoo, GitHub 약 3.5k star. 다중 사용자 지원.

## 인상 깊은 문장

> "Full text indexer for websites and local files which automatically saves all the visited pages rendered by your browser." — GitHub/AlternativeTo 소개 문구 기준 재구성(정확한 원문 그대로의 인용은 확인 못함).

## 댓글

**hada 댓글 수 확인 불가** — `news.hada.io` 접근 전면 차단. WebSearch로 확인한 바로는 Hacker News에 최소 세 차례 게시된 이력이 있다 — "Show HN: Hister – fast, content-based search for visited websites"(id=46901321, 초기 공개 추정), "Hister – Web History on Steroids"(id=46977485), 그리고 최근(id=49351802, "6 days ago"로 검색돼 2026-08-26 전후 추정) 재게시. 저자 asciimoo가 별도 AMA 스레드(id=49402473)에서 직접 질문에 답하며 활발히 참여한 정황도 확인. **다만 각 스레드의 정확한 포인트·댓글 수는 news.ycombinator.com 직접 접속이 차단돼 확인하지 못했다.** Privacy Guides 커뮤니티 포럼에 프로젝트 쇼케이스로도 소개됐고, 일본 IT 매체 GIGAZINE도 별도 기사를 냈다 — 프라이버시·로컬퍼스트 커뮤니티에서 반복적으로 회자되는 도구로 보인다.

## 내 생각 · 적용점

가벼운 도구 소개 글이라 억지로 여러 갈래를 엮지 않는다. 다만 연결점 하나는 실제로 있다 — "브라우저 기록엔 제목·URL만 남는다"는 이 글의 출발점은, [[2026-08-31-mu-personal-server-with-embedded-agent]]가 강조한 "에이전트가 일할 데이터를 벤더 API로 흩어놓지 않고 내 도메인·디스크에 직접 모은다"는 원칙과 결이 같다. mu가 메일·파일·연락처를 자체 서버로 흡수한다면, Hister는 "내가 이미 본 것"을 흡수해 검색 가능하게 만드는, 같은 방향을 더 좁은 문제(개인 검색)에 적용한 버전으로 읽을 수 있다. 다만 두 프로젝트가 실제로 연결된다는 근거는 없고, 비슷한 시기 로컬퍼스트 커뮤니티에서 나온 평행한 사례로만 놓는다 — 그 이상 엮으면 억지다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 개인 브라우징·로컬 파일 검색 도구를 B2B CRS 제품에 그대로 옮길 이유는 없다. 다만 "표준 메타데이터(제목·URL)만 남기지 않고 본문 전체를 색인해 나중에 의미 있게 다시 찾는다"는 아이디어 자체는, 사내 CS 상담 로그나 내부 위키처럼 "제목은 기억나는데 본문 내용은 검색이 안 되는" 자료의 검색 개선에 참고할 만한 정도로 남긴다.

## 연관 자료

- [[2026-08-31-mu-personal-server-with-embedded-agent]] — "에이전트용 데이터를 API가 아니라 자기 도메인에 직접 모은다"는 같은 방향의 원칙을 다른 영역(메일/파일 vs 검색)에서 구현한 평행 사례.

## 한 달 뒤 회고

*(2026-09-30 즈음 — HN 실제 포인트·댓글 수를 확인할 수 있게 됐는지, GitHub 스타 수 변화로 채택 규모가 어떻게 바뀌었는지 점검.)*
