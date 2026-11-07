---
title: "DoorDash가 정확도를 유지하면서 LLM 검색 비용을 98% 줄인 방법 (DoorDash Engineering, 원문 교차확인) — 내장 웹 검색을 프로바이더 비종속 게이트웨이로 분리하고 캐시로 비용을 거의 0에 가깝게 만든다"
source_title: "How DoorDash Reduced LLM Search Costs by 98% Without Losing Accuracy"
source_url: "https://careersatdoordash.com/blog/how-doordash-reduced-llm-search-costs-by-98-without-losing-accuracy/"
source_name: "DoorDash Engineering Blog (careersatdoordash.com)"
referrer_url: "https://news.hada.io/topic?id=36733"
published_at: "확인 불가"
summarized_at: "2026-11-07"
category: "backend"
tags: ["doordash", "llm-search", "search-gateway", "caching", "cost-optimization", "ai-agent", "dsg"]
---

# DoorDash가 정확도를 유지하면서 LLM 검색 비용을 98% 줄인 방법 (DoorDash Engineering)

> 출처: [How DoorDash Reduced LLM Search Costs by 98% Without Losing Accuracy](https://careersatdoordash.com/blog/how-doordash-reduced-llm-search-costs-by-98-without-losing-accuracy/) (DoorDash Engineering Blog · GeekNews GN⁺ 경유) · 정리일 2026-11-07
> **출처 한계**: news.hada.io·careersatdoordash.com 둘 다 이 세션에서 egress 차단(getaddrinfo ENOTFOUND)돼 원문을 직접 열람하지 못했다. 다만 WebSearch로 **정확히 이 제목의 DoorDash 공식 블로그 글을 특정**했고, 검색 스니펫으로 핵심 구조(게이트웨이 이름 "DSG", 백엔드 업체 목록, 98% 수치의 정확한 평가 조건)를 교차확인했다 — Slack 발췌 수치와 WebSearch 스니펫 수치가 서로 일치해 신뢰도가 높은 편이다. 전문 열람은 못했으므로 구체 아키텍처 다이어그램·전체 코드 예시 등 세부는 확인 불가로 남긴다.

## 한 줄 요약

**DoorDash는 LLM에 내장된 웹 검색을 별도의 프로바이더 비종속 검색 게이트웨이(DSG)로 분리해, 쿼리 의도 분류(QIU) 평가에서 정확도를 유지하면서 검색 요금을 98% 이상 절감했다 — 캐시가 채워지면 비용은 사실상 0에 가까워지고 지연 시간도 68% 줄어든다.**

## 핵심 포인트

- **분리가 핵심 설계** — LLM의 ***내장 웹 검색을 별도의 검색 API(DSG)로 분리***해, 검색어의 의도를 분류하는 QIU(Query Intent Understanding) 평가에서 ***정확도를 유지하면서 검색 요금을 98% 이상 절감***했다. 베이스라인은 Gemini Flash의 내장 Google 검색 그라운딩이었다(WebSearch 교차확인). 모델 추론 비용은 제외한 수치.
- **공유 게이트웨이, 독립적 교체** — 여러 AI 에이전트가 ***하나의 검색 게이트웨이를 공유***하며, 모델과 검색 업체를 독립적으로 교체할 수 있다. 검색 결과 수, 캐시 정책, 장애 시 대체 업체(failover)도 설정으로 관리한다. 백엔드 레지스트리에는 ***Serper, BrightData, Firecrawl, Exa, Tavily***가 등록돼 있다(WebSearch 교차확인).
- **캐시가 비용을 0에 가깝게** — 같거나 의미가 비슷한 질문의 검색 결과를 ***재사용(정확 일치+의미론적 캐시)***해 중복 호출을 줄인다. 캐시가 채워진 평가에서는 초기 실행보다 ***평균 지연 시간이 68%, 검색 비용이 99% 이상 감소***했다. 더 많은 워크로드가 게이트웨이를 거칠수록 ***공유 캐시가 더 빨리 데워진다***는 네트워크 효과도 언급됨(WebSearch 교차확인).
- **관측성** — 로그에 프로바이더, 캐시 적중 여부, 검색 깊이, 지연시간, 쿼리당 비용을 전부 기록해 운영 가시성을 확보.

## 인상 깊은 문장

> "같거나 의미가 비슷한 질문의 검색 결과를 재사용해 중복 호출을 줄임. 캐시가 채워진 평가에서는 초기 실행보다 평균 지연 시간이 68%, 검색 비용이 99% 이상 감소함" (Slack 발췌)

## 댓글

GeekNews 댓글 수는 원문 차단으로 확인 불가. **98%라는 수치는 DoorDash가 자체 QIU 평가셋 하나를 기준으로 보고한 것**이며, 모든 LLM 에이전트 워크로드에 일반화되는 결과는 아니라는 점을 밝혀야 한다(WebSearch 교차확인 결과 동일 경고). DoorDash 자체 비교 기준(Gemini Flash 내장 검색)도 벤더 선택이라, 다른 내장 검색 대비 절감폭은 다를 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 검색 게이트웨이는 DoorDash 안에서 이미 반복되는 아키텍처 패턴이다

같은 회사의 [[2026-08-10-doordash-ai-agent-gateway]](AI 에이전트-도구 접근 중앙 게이트웨이, MCP 인증·권한·감사 레이어)와 정확히 같은 철학의 반복이다 — "에이전트가 직접 외부 자원(도구든 검색이든)에 붙지 못하게 하고, 공유 게이트웨이를 통해 인증·캐시·장애복구·관측성을 중앙화한다"는 원칙이 도구 접근에서 검색 접근으로 그대로 전이됐다. DoorDash는 이 패턴을 조직 전체의 기본 아키텍처로 굳힌 것으로 보인다.

### 핵심 전이 2 — 캐시가 쌓일수록 한계비용이 0에 수렴하는 구조는 멀티테넌트 플랫폼의 본질적 이점이다

[[2026-10-12-uber-mcp-gateway-platform-design]](Uber의 MCP 게이트웨이, 800개+ 서버·5000개+ 도구 중앙 운영)와 연결 — 여러 팀·에이전트가 같은 게이트웨이를 쓸수록 캐시 적중률이 올라가고 비용이 떨어지는 구조는, 개별 팀이 각자 검색/도구 접근을 구현할 때는 나오지 않는 **플랫폼화의 핵심 이점**이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 높음.** CRS·B2B 호스피탈리티 플랫폼도 LLM 기반 기능(고객 문의 응대, 리뷰 요약, 경쟁사 요금 리서치 등)에서 내장 웹 검색을 쓰면 같은 비용 구조 문제를 겪는다. ① 여러 AI 기능(챗봇, 요금 분석, 리뷰 요약)이 검색을 각자 호출하지 않고 ***공유 검색 게이트웨이***를 통해 호출하게 하고, ② 같은 호텔/지역에 대한 반복 질의는 ***의미론적 캐시***로 재사용하며, ③ 검색 프로바이더를 ***failover 가능하게 추상화***하는 설계를 그대로 참고할 수 있다. 이는 [[2026-08-10-doordash-ai-agent-gateway]] 노트에서 이미 CRS 적용 가능성을 언급했던 "Registry+Proxy+도구단위 접근제어" 원칙의 자연스러운 확장이다.

## 연관 자료

- [[2026-08-10-doordash-ai-agent-gateway]] — 같은 회사, 같은 게이트웨이 철학이 도구 접근에서 검색 접근으로 확장된 사례.
- [[2026-10-12-uber-mcp-gateway-platform-design]] — 독립적으로 같은 "중앙 게이트웨이" 구조에 수렴한 Uber 사례, 규모(800개+ 서버) 비교.
- [[2026-10-30-doordash-acquires-instacart]] — 같은 회사의 최근 비즈니스 확장(Instacart 인수) 맥락.

## 한 달 뒤 회고

- 2026-12-07 즈음 점검: careersatdoordash.com 접근이 가능해지면 원문 전문을 다시 확인해 DSG 아키텍처 다이어그램·전체 캐시 정책 세부를 보강.
