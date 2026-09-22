---
title: "Cloudflare Python Workers 정식 출시 — JavaScript 연결 코드 없이 FastAPI·Django·Flask가 엣지에서 직접 R2·D1을 부른다 (Cloudflare)"
source_title: "Python Workers are now generally available"
source_url: "https://blog.cloudflare.com/python-workers-ga/"
source_name: "Cloudflare 공식 블로그, WebSearch 교차확인, GeekNews(id=34087) 경유"
referrer_url: "https://news.hada.io/topic?id=34087"
published_at: "2026-09-21(WebSearch 확인)"
summarized_at: "2026-09-22"
category: "backend"
tags: ["cloudflare", "python", "serverless", "fastapi", "edge-computing", "hyperdrive"]
---

# Cloudflare Python Workers 정식 출시

> 출처: [Cloudflare 공식 블로그](https://blog.cloudflare.com/python-workers-ga/) · GeekNews(id=34087) 경유 · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io`와 `blog.cloudflare.com` egress 차단으로 원문 직접 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "PostgreSQL/MySQL 연결…"에서 잘림) + WebSearch(AI Weekly, GitHub PR, daily.dev)로 재구성했다.

## 한 줄 요약

**Python이 Cloudflare 개발자 플랫폼의 정식 지원 언어가 되어, FastAPI·Django·Flask를 별도 웹 서버 없이 엣지에서 그대로 실행하면서 JavaScript 연결 코드 없이 R2·D1·Queues·Durable Objects 같은 플랫폼 바인딩을 Python에서 직접 호출할 수 있게 됐다 — TCP 소켓 지원 개선으로 Hyperdrive를 통한 PostgreSQL/MySQL 연결까지 가능해졌다.**

## 핵심 포인트

- **Python이 TypeScript·JavaScript와 동급의 정식 언어로** — Python이 Cloudflare 개발자 플랫폼의 ***정식 지원 언어***가 되어, 익숙한 코드와 라이브러리로 웹 애플리케이션과 AI 에이전트를 개발·배포할 수 있다.
- **FastAPI·Django·Flask를 별도 서버 없이 엣지에서 실행** — FastAPI, Django, Flask를 실행할 수 있으며, ***별도 웹 서버를 운영하지 않아도 Workers가 요청 처리와 전 세계 트래픽에 따른 확장***을 담당한다. `workers.asgi`가 비동기 프레임워크(FastAPI)를, `workers.wsgi`가 동기 프레임워크(Django)를 처리한다(WebSearch).
- **JavaScript 연결 코드 없이 플랫폼 바인딩 직접 호출** — JavaScript 연결 코드 없이 ***R2, D1, Queues, Durable Objects, Workflows*** 등을 Python에서 사용하며, 객체 타입 변환도 런타임이 자동으로 처리한다.
- **OpenAI·LangChain·MCP 라이브러리가 네이티브로 동작(WebSearch 보강)** — `openai`, `langchain`, `mcp` 라이브러리가 ***네이티브로 실행***되며, `langchain-cloudflare` 패키지로 JavaScript 글루 코드 없이 Workers AI에 체인을 연결할 수 있다.
- **TCP 소켓 지원으로 PostgreSQL/MySQL 직접 연결** — TCP 소켓과 HTTP 클라이언트 지원을 개선해 ***PostgreSQL/MySQL 연결…*** (발췌 절단) — WebSearch로는 새로운 Workers Connect API를 통해 `aiomysql`, `asyncpg`가 Hyperdrive로 PostgreSQL·MySQL에 접속할 수 있게 됐다고 확인했다.

## 인상 깊은 문장

> "You can run FastAPI, Django, or Flask on the same edge runtime that already hosts JavaScript Workers."
> (WebSearch, 관련 보도 발췌)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. Cloudflare 자사 발표라, 실제 프로덕션 워크로드(콜드 스타트, 패키지 크기 제한 등)에서의 한계는 커뮤니티 검증을 더 기다려봐야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 Cloudflare 인프라 계열에 "언어 장벽 제거"라는 새로운 축을 더함

가든에는 [[2026-09-19-cloudflare-pingora-ketama-100tb-ram]], [[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]] 등 Cloudflare 인프라의 규모·효율성을 다룬 노트가 있다. 이 발표는 인프라 성능이 아니라 ***"엣지 플랫폼에 접근할 수 있는 언어의 폭"***을 넓혔다는 점에서 결이 다르다 — Python·AI 생태계(FastAPI, LangChain, MCP)가 JavaScript 글루 코드 없이 엣지에 바로 배포될 수 있게 되면서, AI 에이전트 백엔드를 엣지에 직접 올리는 선택지가 넓어졌다.

## 호스피탈리티 / CRS 적용 포인트

CRS 연동 API나 AI 에이전트 백엔드가 Python 생태계(FastAPI + LangChain)로 구축돼 있다면, 이를 엣지에 배포해 지역별 응답 지연을 줄이는 옵션을 검토할 수 있다 — 특히 예약 조회처럼 전 세계 파트너사에서 호출되는 API는 엣지 배포로 얻는 지연 시간 이점이 클 수 있다. 다만 Hyperdrive를 통한 DB 연결의 실제 처리량·비용은 별도 검증이 필요하다.

## 연관 자료

- [[2026-09-19-cloudflare-pingora-ketama-100tb-ram]] — Cloudflare 인프라 효율화 사례
- [[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]] — Cloudflare 캐시 최적화 사례
- [[2026-09-19-cloudflare-quick-tunnels]] — Cloudflare 개발자 도구 계열

## 한 달 뒤 회고

*(2026-10-22 즈음 — Python Workers의 실제 프로덕션 도입 사례, 콜드 스타트·패키지 크기 제한 관련 커뮤니티 피드백 확인.)*
