---
title: "개인 웹사이트를 위한 JSON-LD (hawksley.dev) — '구조화 데이터는 이제 SEO가 아니라 AI 인용 가능성(AEO)', 그러나 댓글은 'Google이 공생에서 착취로' (웹 플랫폼·AEO 라인)"
source_title: "JSON-LD Explained for Personal Websites"
source_url: "https://hawksley.dev/blog/json-ld-explained-for-personal-websites/"
source_name: "hawksley.dev · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30729"
published_at: "2026-06-22"
summarized_at: "2026-06-08"
category: "frontend"
tags: ["json-ld", "structured-data", "schema-org", "seo", "aeo", "geo", "ai-citation", "personal-website"]
---

# 개인 웹사이트를 위한 JSON-LD (hawksley.dev) — '구조화 데이터는 이제 SEO가 아니라 AI 인용 가능성(AEO)', 그러나 댓글은 'Google이 공생에서 착취로' (웹 플랫폼·AEO 라인)

> 출처: [JSON-LD Explained for Personal Websites](https://hawksley.dev/blog/json-ld-explained-for-personal-websites/) (hawksley.dev · GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**JSON-LD(JSON Linked Data)는 웹페이지에 *구조화 데이터*를 더해 *크롤러가 사이트의 의미 구조를 이해*하게 하는 형식 — `<head>`에 `<script type="application/ld+json">`로 삽입(JS 실행 X, 크롤러만 파싱). `@context`(Schema.org 표준) + `@graph`(라벨 붙은 방향 그래프) + 노드별 `@type`·`@id`(`#website` 해시)·속성. 개인 사이트 최소 구현: *루트에 **WebSite + ProfilePage + Person**, 블로그면 **Blog + BlogPosting**, 목록은 CollectionPage*. 핵심 변화: ***Person의 `sameAs`로 동명이인을 구분하고, "LLM 크롤러도 답변에서 누구를 인용할지 판단할 때 Person 정보를 점점 더 사용한다"*** — 즉 구조화 데이터의 목적이 *Google SEO*에서 ***AI 답변엔진의 인용 대상 판단(AEO/GEO)*** 으로 옮겨가는 중. 단, **댓글(HN)이 강하게 회의적**: ***"Google이 공생에서 착취로 변했다", "결국 Google AI를 학습시킨 것뿐", 2024년 후 콘텐츠 페이지 트래픽 85%↓, "검색 밖 목적이 없으면 허공에 외치기"*** — *OpenGraph가 링크 미리보기엔 더 잘 먹고, IndieWeb은 DRY 위반이라며 Microformats를 선호*.**

## 핵심 포인트

- **기본 구조** — `<head>`의 `<script type="application/ld+json">`. `@context`=Schema.org(유효 키-값 정의), 문서=라벨 붙은 방향 그래프(`@graph` 아래). 노드 = *`@type`(WebSite·Person 등) + `@id`(URL+`#website` 해시) + 속성*. **크롤러는 같은 `@id` 노드 속성을 페이지 간 병합하지만, 단일 페이지만 읽는 스크레이퍼·LLM은 병합 안 함** → 재사용 시 주의.
- **사이트/페이지 노드** — *WebSite*(루트는 상세: url·name·description·publisher·image, 타 페이지는 축약), *WebPage*(HTML 물리 페이지, BlogPosting 같은 콘텐츠 유형과 구분; ProfilePage·CollectionPage가 하위 타입).
- **사람 식별 = AEO의 핵심** — ***모든 페이지에 Person 노드 권장.*** *url(루트 고정)·name/givenName/familyName·image(정식 사진/로고)·`sameAs`(다른 프로필 연결)*. ***"LLM 크롤러가 누구를 인용할지 판단할 때 Person을 점점 더 쓴다"*** + *`sameAs`는 흔한 이름의 동명이인 구분·지식그래프 표현에 유용*. *ProfilePage*는 `isPartOf`로 WebSite 연결, `mainEntity`로 "누구에 관한 페이지"인지 명시.
- **프로젝트/경로/목록 노드** — *SoftwareApplication*(url=배포처, sameAs=소스 저장소; **FOSS라도 `offers` 가격 0**), *BreadcrumbList*(루트 외 페이지, 실제 URL 경로와 달라도 됨), *CollectionPage*(목록 페이지: /blog/·/elsewhere/), *Blog*(인덱스, WebSite↔BlogPosting 중간 노드, `license`로 사용 조건), *BlogPosting*(모든 글; 개인 사이트는 author·publisher가 같은 Person OK, image는 OG 이미지와 일치).
- **댓글 = 강한 회의론(전수 확인 핵심)** — ***"지난 전쟁을 다시 싸우는 느낌 — Google이 실제 글보다 오류 섞인 LLM 요약을 위에 보여줌", "microdata 잔뜩 넣었지만 결국 Google AI 학습만, 트래픽 개선 X", "검색 밖 목적 없으면 허공에 외치기", "Google이 공생에서 착취로"***. 반론·실용: *"씨를 뿌려야(인터넷 전체가 메타데이터 쓰면 경쟁자 진입 쉬워짐)", OpenGraph가 링크 미리보기엔 더 잘 먹음, 비즈니스 사이트는 지도 플랫폼(주소·영업시간) 공급에 유용, Gmail/Outlook이 항공권·배송 추적에 JSON-LD 사용, 추가 후 Google 하위 링크 표시 개선*.

## 인상 깊은 문장

> "LLM 크롤러도 답변에서 누구를 인용할지 판단할 때 Person 정보를 점점 더 사용한다." (본문 — 구조화 데이터 목적의 이동)

> "microdata 태그를 잔뜩 넣었지만, 결국 Google의 AI를 학습시킨 것뿐." (댓글 — 가치교환 회의)

> "검색 엔진 밖에서 특정 목적이 없다면 JSON-LD는 허공에 외치는 것과 비슷하다." (댓글)

## HN/GN 토론 (댓글 전수 확인)

> GN⁺가 Hacker News를 큐레이션 — **15개 세부 의견 + 추가 논쟁 4개 전수 확인:**
- **회의(다수)**: *오류 섞인 LLM 요약이 원글 위에 노출(1)·Google이 크롤링/색인 거부(4)·Googlebot에 zipbomb(5)·"Google AI 학습만, 트래픽 효과 X"(6)·"시간 낭비, OpenGraph가 미리보기엔 더 자주 지원"(8)·"검색 밖 목적 없으면 허공에 외치기"(9)·"검색 노출 vs 사용자 가두기"(13)*.
- **실용/긍정**: *"씨 뿌리기 — 인터넷 전체가 쓰면 경쟁자 진입 쉬워짐"(2)·Google 공식 JSON-LD 입문서 권장(7)·"Schema.org 어휘가 핵심, JSON-LD는 한 방법"(11)·Gmail/Outlook/iCloud가 항공권·배송에 사용(12)·추가 후 Google 하위 링크 개선(14)·비즈니스는 지도 플랫폼 데이터(주소·영업시간) 공급에 유용(15)*.
- **대안 논쟁**: *IndieWeb은 DRY 위반이라며 Microformats 선호(10)·시맨틱 HTML vs JSON-LD 중복·Microdata 비교·**2024년 후 콘텐츠 마케팅 페이지 트래픽 85% 감소**·"Google의 공생→착취 전환" 비판*.

→ **무게중심**: *본문(구조화 데이터로 AI/검색에 잘 보이기)에 대해 댓글은 "검색 트래픽 ROI는 의심스럽다(가치교환 붕괴) — 단, AI 인용·기계 판독(메일/지도)·링크 미리보기 같은 명확한 목적엔 유효"라는 균형*. 즉 **목적을 분명히 하라**가 결론.

## 내 생각 · 적용점

### 웹 플랫폼·AEO 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *구조화 데이터·AI 검색(AEO/GEO)·웹 가치교환*이라는 웹 플랫폼/정책 프레임. [[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-06-01-geo-seo-claude-skill]]·[[2026-06-08-search-market-fit-aeo-seo]]와 같은 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — 구조화 데이터의 목적이 "SEO"에서 "AI 인용 가능성(AEO)"으로 이동

가장 전이력 높은 통찰: ***"LLM이 누구를 인용할지 판단할 때 Person/sameAs를 점점 더 쓴다"*** — 구조화 데이터는 이제 *Google 순위*보다 *AI 답변엔진에 정확히 인용·식별되기 위한 것*. [[2026-05-21-trevor-lasn-aeo-geo-ai-search]] *AEO/GEO*·[[2026-06-01-geo-seo-claude-skill]] *AI 검색 최적화*의 구현 디테일이다. **내 [[2026-06-08-the-untrainable]] "좋은 답·정체성을 기록하면 인용된다"의 웹 버전** — *내가 AI에게 정확히 인용·식별되려면 author/Person/sameAs를 구조화*.

### 핵심 전이 2 — 댓글의 회의론 = "웹 가치교환의 붕괴"를 정직히 본다

댓글이 본문보다 값지다: ***"Google이 공생→착취", "AI 학습만 시킴", 트래픽 85%↓, 허공에 외치기.*** 이는 [[2026-05-29-dead-economy-theory]] *죽은 경제*·[[2026-06-08-google-lost-moral-compass-farewell]] *구글 결별*·[[2026-06-08-social-media-ceased-to-be-social]]와 같은 줄기 — **AI 답변엔진이 클릭을 대체하며 "콘텐츠 제공→트래픽 보상"의 교환이 깨지는 중**. 그래서 결론은 *"목적을 분명히 하라"*: **검색 트래픽이 목적이면 ROI 의심, "AI 인용·기계 판독(메일/지도)·링크 미리보기"가 목적이면 유효**. 무지성 구조화 X.

### 핵심 전이 3 — knowledge-garden 자기적용(최소 + DRY 경계)

이건 *내 디지털 가든(개인 사이트)에 바로 적용 가능*: 정적 사이트라도 *루트에 WebSite + Person(sameAs로 GitHub/blog 연결) + BlogPosting(author=Person)* 최소 구현이면 **AI가 내 글을 "박재홍 아닌 나(SongJunSub)"로 정확히 인용**하게 도움. 단 댓글의 *DRY 회의(Microformats·시맨틱 HTML 중복)*도 정직히 — [[2026-06-08-prefer-duplication-over-wrong-abstraction]] *과잉 추상화 경계*처럼 **최소만, 목적(AI 인용) 있을 때만**. (가든 인덱스가 README 기반 정적이라 우선순위는 낮음 — 적용 거리 한 줄로만.)

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *웹 플랫폼·AEO 라인* — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- hawksley.dev (원문) · [GeekNews — 30729](https://news.hada.io/topic?id=30729)
- [[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-06-01-geo-seo-claude-skill]]·[[2026-06-08-search-market-fit-aeo-seo]] — *"AEO/GEO·AI 검색 최적화"*
- [[2026-05-29-dead-economy-theory]]·[[2026-06-08-google-lost-moral-compass-farewell]]·[[2026-06-08-social-media-ceased-to-be-social]] — *"웹 가치교환 붕괴·클릭의 죽음"*
- [[2026-06-08-the-untrainable]]·[[2026-06-08-who-prices-intelligence]] — *"기록하면 인용된다·AI 답변엔진 시대"*
- [[2026-06-08-prefer-duplication-over-wrong-abstraction]] — *"DRY 회의·과잉 구조화 경계"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — 구조화 데이터를 "SEO 트래픽" 아닌 "AI 인용 가능성" 목적으로 봤는지, 정말 적용한다면 knowledge-garden 루트에 WebSite+Person+sameAs 최소만 넣었는지, "목적 없으면 안 넣는다"를 지켰는지 기록.)*
