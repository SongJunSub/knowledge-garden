---
title: "새로운 HTTP QUERY 메소드 (RFC 10008) — 'GET처럼 안전·멱등하면서 요청 본문 포함', 복잡한 검색 쿼리의 GET/POST 딜레마를 표준으로 해결"
source_title: "The New HTTP QUERY Method Explained"
source_url: "https://kreya.app/blog/new-http-query-method-explained/"
source_name: "kreya.app"
referrer_url: "https://news.hada.io/topic?id=30846"
summarized_at: "2026-06-26"
category: "backend"
tags: ["http", "rest-api", "query-method", "rfc-10008", "idempotency", "api-design", "caching", "web-standards"]
---

# 새로운 HTTP QUERY 메소드 (RFC 10008) — 'GET처럼 안전·멱등하면서 요청 본문 포함', 복잡한 검색 쿼리의 GET/POST 딜레마를 표준으로 해결

> 출처: [The New HTTP QUERY Method Explained](https://kreya.app/blog/new-http-query-method-explained/) (kreya.app) · 정리일 2026-06-26

## 한 줄 요약

**RFC 10008로 표준화된 HTTP QUERY 메소드는 "GET처럼 안전하고 멱등하면서 요청 본문을 포함할 수 있는" 메소드다. 복잡한 검색 쿼리를 GET(URL 길이 한계·로그 노출)이나 POST(비멱등·캐싱 불가)로 억지로 구현하던 문제를 의미론적으로 올바르게 해결한다. 단, 완전한 정착까지는 상당한 시간이 필요하다.**

## 핵심 포인트

- **GET의 한계** — URL이 지나치게 길어짐 + 배열·중첩 구조 표현 미표준화 + 민감 데이터가 URL 로그에 기록됨.
- **POST의 의미론적 문제** — 비멱등(non-idempotent)으로 정의되어 자동 재시도가 안전하지 않음 + 캐싱 최적화 불가 + 검색 용도로 사용하기에 의미론적으로 부적절.
- **QUERY의 해법** — 안전(Safe) + 멱등(Idempotent) + 요청 본문 허용. 읽기 전용 요청에서 POST를 대체하는 것이 핵심 목적.
- **적합한 사용 사례** — 복잡한 검색 필터(다중 조건, 중첩 구조), GraphQL-like 쿼리, OpenSearch `_search` 엔드포인트 패턴.
- **현실적 한계** — 클라이언트·프록시·서버의 지원이 아직 제한적. 완전 정착까지 상당한 시간 필요.

## 인상 깊은 문장

> "GET처럼 안전하고 멱등하면서, 요청 본문을 포함할 수 있는 새로운 HTTP 메소드."

> "POST로 검색을 구현하는 것은 의미론적으로 틀렸다 — QUERY는 그 의미론적 공백을 채운다."

## 댓글 전수 확인 (5개 확인)

*GeekNews 한국 커뮤니티 댓글 5개 모두 확인.*

1. **jongyeol**: 프록시·방화벽·브라우저마다 앞으로 10년쯤은 QUERY 메소드가 적용되지 않을 수 있다는 도입 난제 지적.
2. **click**: POST 요청 시에도 URL 파라미터를 함께 요구하는 호환성 문제 경험. *"국내에서 PUT/DELETE 정착도 아직 미흡한데, QUERY 도입은 더 오래 걸릴 것."*
3. **sea715**: "모든 걸 POST로 통일하면 된다"는 풍자적 의견.
4. **savvykang**: "POST가 보안에 유리하다"는 잘못된 인식을 풍자.
5. **ultimategamer**: RFC 문서 링크 제시. GET의 URL 공유 가능 장점 언급. 브라우저 주소창에 적는다는 관례 때문에 정착에 시간이 필요할 것으로 전망.

## 내 생각 · 적용점

### 핵심 전이 1 — 지금 당장 쓰기보다 "왜 생겼는가"를 이해하는 게 핵심

QUERY 메소드의 실용적 도입은 아직 이르다(국내 인프라·프록시 현실 고려). 하지만 *"왜 이게 필요했는가"*를 이해하면 지금 API를 설계할 때도 도움이 된다: **복잡한 검색 요청을 GET으로 만들어야 할지 POST로 만들어야 할지 망설일 때, QUERY가 해결하려는 문제가 바로 그 딜레마다.** 현재는 POST + 명확한 네이밍(`/search`, `/query`)이 현실적 대안.

### 핵심 전이 2 — 멱등성(Idempotency)은 API 설계의 핵심 원칙

QUERY가 강조하는 "안전 + 멱등"은 단순히 HTTP 메소드 선택의 문제가 아니다. **멱등하지 않은 요청이 자동 재시도될 때 생기는 문제(중복 결제, 중복 예약 등)는 CRS 같은 예약 시스템에서 치명적이다.** 메소드 선택이 재시도 정책·캐싱·로그 처리와 연결된다는 것을 항상 인지해야 한다.

### 핵심 전이 3 — 표준보다 먼저 관례(Convention)가 정착한다

GET이 "브라우저 주소창에 적는다는 암묵적 관례" 때문에 쓰이듯, 새 표준이 아무리 좋아도 관례와 인프라 지원이 따라오지 않으면 채택되지 않는다. **새 기술·표준을 평가할 때 "이게 좋은가"만큼 "실제로 쓰이게 될 환경이 준비됐는가"를 함께 봐야 한다.** [[2026-05-29-choose-boring-technology-2015]]의 검증된 기술 선택 원칙과 같은 맥락.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-05-29-choose-boring-technology-2015]] — *"검증되지 않은 새 표준보다 안정적인 기존 방식 선호"의 맥락*
- OpenSearch `_search` API — *이미 QUERY 패턴과 동일한 방식으로 POST + request body를 사용하는 실제 사례*

## 한 달 뒤 회고
*(2026-07-26 즈음 — CRS나 PickMe API에서 복잡한 검색 엔드포인트를 설계할 일이 생겼을 때 이 원칙을 어떻게 적용했는지, QUERY 메소드 지원 현황이 어떻게 변했는지 기록.)*
