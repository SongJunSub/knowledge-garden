---
title: "Well-Known URI를 정의하고 싶다면 (mnot) — '실제 URL을 줄 수 있으면 쓰지 말라'는 발견 메커니즘의 절제 (도구 실무 라인)"
source_title: "If You Want to Define a Well-Known URI"
source_url: "https://www.mnot.net/"
source_name: "Mark Nottingham · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30659"
published_at: "2026-06-16"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["well-known-uri", "rfc-8615", "discovery", "web-standards", "restraint", "tooling-line"]
---

# Well-Known URI를 정의하고 싶다면 (mnot) — '실제 URL을 줄 수 있으면 쓰지 말라'는 발견 메커니즘의 절제 (도구 실무 라인)

> 출처: Mark Nottingham (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**RFC 8615 저자 Mark Nottingham이 *`.well-known/` URI 사용의 실무 기준*을 제시. ***적절한 경우***: 클라이언트가 *이미 사이트를 알고 있고, 사이트 전체에 필요한 중앙 정책(`robots.txt`류)을 찾을 때*. ***잘못된 적용***: ***실제 URL을 전달할 수 있는데도 쓰면, 서비스-사이트를 1:1로 묶어 배포 유연성을 해친다***. 발견 메커니즘은 *시작 호스트명·리다이렉트·다중 게시자 구조 같은 운영 복잡성*을 간과하기 쉽고, *중앙 위치 정책이 개별 사용자(`~username/`)엔 비실용적*일 수 있다.**

## 핵심 포인트

- **"실제 URL을 줄 수 있으면 well-known을 쓰지 말라"** — *발견 메커니즘은 배포를 1:1로 묶음*. **꼭 필요할 때만 쓰는 절제** — [[2026-06-08-reuse-less-software]] *"덜 쓰기"*·[[2026-06-08-static-types-and-the-shovel]] *"용도가 맞을 때만"*과 같은 줄기.
- **적절한 경우 = 중앙 정책** — *robots.txt처럼 "사이트 전체에 필요하고 클라이언트가 사이트를 아는" 경우*.
- **운영 복잡성** — *호스트명·리다이렉트·다중 게시자를 간과 말 것*.

## 인상 깊은 문장

> "If you can hand out the actual URL, don't use a well-known URI — discovery couples the service to the site."
> (실제 URL을 줄 수 있다면, well-known URI를 쓰지 마라 — 발견 메커니즘은 서비스를 사이트에 묶는다.)

## HN 토론 (댓글 전수 확인)

> GN⁺가 Hacker News를 큐레이션. **10개 의견 확인:**
- ***"새 표준을 루트 네임스페이스에 만들지 말고 well-known을 따랐으면(llms.txt가 루트를 더럽힘)"***. 답글: *"llms.txt는 주요 AI 업체 미채택이라 의미 없음"*.
- *"이 글은 별 도움 안 됨·뻔한 사실·예시 없음"* vs ***"핵심은 robots.txt류를 임의로 두지 말고 어디 있는지 알리라는 것"***.
- *"왜 이렇게 구체적? 범용 링크 트리를 두면" vs "자체 명세는 남이 안 씀"·Discord 도메인 검증이 IANA 미등록*.
- ***".well-known은 깔끔하게 시작했으나 조용히 웹 루트의 잡동사니 서랍이 됨"***·*"한 도메인에 well-known 여러 개 가능은 자주 간과"*.

→ **무게중심**: *(1) **"루트 네임스페이스를 더럽히지 말고 well-known으로"**(llms.txt 비판). (2) **"임의로 두지 말고 표준 위치를 알리라"**가 글의 핵심. (3) **".well-known이 잡동사니 서랍이 됐다"**는 자조. (4) 본문이 "뻔하다"는 평도.*

## 내 생각 · 적용점

### 5번째 라인업 *도구 실무 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *웹 표준 실무·발견 메커니즘*. 라인 자산(카운팅 무관). 부채 *−1 유지* (53:42 ≈ 1.27:1).

### 핵심 전이 — "발견 메커니즘은 꼭 필요할 때만(절제)"

가장 전이력 높은 원칙: ***"실제 URL을 줄 수 있으면 발견 메커니즘을 쓰지 말라"*** — *추상화·표준은 결합(coupling)을 만들므로 꼭 필요할 때만*. 이는 [[2026-06-08-reuse-less-software]] *"의존성을 덜"*·[[2026-06-08-static-types-and-the-shovel]] *"용도가 맞을 때 채택"*과 같은 절제 철학 — **모든 것에 표준·발견을 두지 말고, "중앙 정책이 진짜 필요한가"를 먼저**. 그리고 *llms.txt 비판*은 [[2026-06-01-geo-seo-claude-skill]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]] *AI 검색 표준*의 거버넌스 경고 — *"채택 안 되면 표준은 무의미"*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *도구 실무 라인* 가벼운 사례. 부채 *−1 유지* (53:42).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Mark Nottingham (원문) · [GeekNews — 30659](https://news.hada.io/topic?id=30659)
- [[2026-06-08-reuse-less-software]]·[[2026-06-08-static-types-and-the-shovel]] — *"꼭 필요할 때만(절제)·용도가 맞을 때 채택"*
- [[2026-06-08-cli-auth-rfc8628-device-flow]]·[[2026-06-08-future-of-email-authentication]] — *웹 표준·발견 메커니즘*
- [[2026-06-01-geo-seo-claude-skill]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]] — *"llms.txt·AI 검색 표준의 거버넌스(채택 안 되면 무의미)"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "발견 메커니즘은 꼭 필요할 때만"을 실무에 적용했는지, llms.txt류 AI 표준이 채택됐는지 기록.)*
