---
title: "HTTP에서 가장 못생긴 부분, Vary를 정면으로 지원하다 (Cloudflare) — 캐시 무효화가 아니라 캐시 키를 어떻게 접을지가 진짜 문제였다"
source_title: "We just shipped support for the ugliest part of HTTP: Vary"
source_url: "https://blog.cloudflare.com/vary-support/"
source_name: "Cloudflare Blog"
referrer_url: "https://news.hada.io/topic?id=34282"
published_at: "2026-09-22"
summarized_at: "2026-09-26"
category: "backend"
tags: ["http", "caching", "cdn", "cloudflare", "vary-header", "cache-key", "content-negotiation"]
---

# HTTP에서 가장 못생긴 부분, Vary를 정면으로 지원하다 (Cloudflare)

> 출처: [We just shipped support for the ugliest part of HTTP: Vary](https://blog.cloudflare.com/vary-support/) (Cloudflare Blog) · GeekNews 경유(https://news.hada.io/topic?id=34282) · 정리일 2026-09-26

## 한 줄 요약

**Vary 헤더는 20여 년간 캐시 사업자마다 제각각으로 처리해온 HTTP의 골칫거리였는데, Cloudflare가 이를 "정규화(normalize) / 원본 그대로 통과(passthrough) / 캐시 안 함(bypass)"이라는 세 가지 명시적 정책으로 다루는 Cache Rules를 무료 플랜까지 포함해 전체 플랜에 공개했다.**

## 핵심 포인트

- Vary는 원 서버가 "이 요청 헤더 값에 따라 응답이 달라질 수 있다"고 캐시에 알리는 메커니즘인데, 캐시 사업자마다 처리 방식이 달라 ***"끔찍하고 조잡한 메커니즘"이며 중간 캐시들 사이 상호운용성이 형편없다***는 게 Cloudflare 스스로의 표현이다.
- 이번에 추가된 3가지 액션: **normalize**(같은 의미의 값을 정규화해 캐시 키를 합침 — 예: `Accept-Language` 값을 소문자화하고 품질값 기준으로 정렬해 `en-US,fr;q=0.8`과 `fr;q=0.8,en-GB`가 같은 캐시 엔트리를 공유), **passthrough**(원본 바이트 그대로 보존해 캐시 매칭에 사용), **bypass**(Cookie처럼 카디널리티가 높은 헤더는 아예 캐싱을 건너뜀).
- `Accept`, `Accept-Language`, `Accept-Encoding`처럼 협상용 헤더는 원본이 raw 값을 요구하지 않는 한 ***normalize를 기본으로 쓰라***고 권장한다 — 클라이언트가 헤더 순서를 다르게 보내도 캐시 히트가 유지된다.
- 대시보드, Rulesets API, Terraform으로 모두 설정 가능해 인프라 코드에 캐시 정책을 그대로 편입할 수 있다.
- 세밀한 캐시 제어를 ***무료 플랜까지 전 플랜에 개방***했다는 점이 이례적 — 보통 이 정도의 캐시 키 커스터마이징은 엔터프라이즈 전용 기능인 경우가 많다.
- 일부 논평은 이 기능을 AI가 생성하는 동적 콘텐츠(사용자별로 조금씩 다른 응답)의 캐싱 장벽을 낮추는 업그레이드로 평가한다 — 레이턴시·추론 비용 절감 관점.

## 인상 깊은 문장

> "Vary is a horrible, kludgy mechanism... with pretty abysmal interoperability across intermediaries." (Cloudflare Blog, 요약 인용)

## 댓글

**출처 한계**: news.hada.io는 이 환경에서 egress 전면 차단(본문·미러 포함)되어 GeekNews 원문 댓글 수·큐레이션 여부를 직접 확인하지 못했다. blog.cloudflare.com 자체도 WebFetch가 차단되어 WebSearch 스니펫 교차확인으로만 내용을 재구성했다. Hacker News에 "We just shipped support for the ugliest part of HTTP: Vary"라는 제목으로 스레드가 있고(item id=49823195), 검색 집계 기준으로는 79포인트·13댓글 수준으로 보고되나, HN 페이지도 직접 열람이 차단되어 이 수치를 1차 검증하지는 못했다(다소 조용한 반응이었을 가능성). Lobsters 큐레이션 여부는 확인 불가. 벤더(Cloudflare) 자사 발표 글이라는 점도 감안해야 한다 — "우리가 문제를 풀었다"는 톤의 자사 블로그이므로 실사용자의 실제 캐시 히트율 개선 사례는 별도로 찾아봐야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 회사, 다른 최적화 축

[[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]]와 [[2026-09-19-cloudflare-pingora-ketama-100tb-ram]]이 "캐시 항목 하나를 얼마나 작게 저장할까"(바이트 절감)를 다뤘다면, 이 글은 "애초에 캐시 키를 어떻게 접어서 항목의 개수(카디널리티) 자체를 줄일까"를 다룬다. 같은 회사가 같은 시기에 규모의 문제를 세 가지 다른 각도(자료구조 크기, 해시 상수, 캐시 키 설계)에서 계속 재검토하고 있다는 점 자체가 흥미롭다.

### 핵심 전이 2 — 캐시 적중률의 반대쪽 실패 모드

[[2026-09-21-postgresql-caching-basics-and-extras]]는 "캐시 적중률이 높아도 CPU는 포화될 수 있다"는 지점을 짚었다. Vary를 잘못 다루면 그 반대의 실패도 벌어진다 — 캐시 키 카디널리티가 폭발해 적중률 자체가 바닥을 치는 경우다. 두 노트를 겹쳐 보면 "캐시는 켜는 것과 잘 설계하는 것 사이에 별도의 작업이 필요하다"는 그림이 완성된다.

## 호스피탈리티 / CRS 적용 포인트

온다 CRS/예약 엔진에도 사용자 언어·통화·디바이스에 따라 응답이 달라지는 API가 있다면 정확히 같은 캐시 키 카디널리티 문제를 겪을 수 있다. 파트너사별로 응답이 갈리는 엔드포인트를 무작정 "Vary: *"로 캐시 자체를 우회시키기보다, "정규화해도 되는 헤더"와 "원본 그대로 보존해야 하는 헤더"를 구분해 캐시 정책을 설계한다는 원칙은 바로 전이 가능하다.

## 연관 자료

- [[2026-08-28-cloudflare-1111-dns-cache-100tb-savings]] — 같은 Cloudflare, 같은 "100TB 절감" 계열이지만 항목 크기 축.
- [[2026-09-19-cloudflare-pingora-ketama-100tb-ram]] — 역시 Cloudflare 캐시/해싱 상수 재계산 계열.
- [[2026-09-21-postgresql-caching-basics-and-extras]] — 캐시 적중률과 실제 성능의 반대쪽 문제 제기.

## 한 달 뒤 회고

*(2026-10-26 즈음 — Cache Rules의 Vary 지원이 실사용자 사례(캐시 히트율 개선 후기)로 퍼졌는지, 온다 API 중 언어·디바이스별로 응답이 갈리는 엔드포인트의 캐시 정책을 점검할 계기가 있었는지 확인.)*
