---
title: "Google 검색, 목적지를 읽을 수 없는 google.com/goto 리디렉션 확대 (Search Engine Roundtable 외) — 검색 결과 링크를 protobuf로 감싸 스크래퍼·순위추적 도구의 SERP 파싱 비용을 500~1,000배로 밀어올리다"
source_title: "Google confirms google.com/goto search links"
source_url: "https://www.relevantaudience.com/seo/google-search-goto-passthrough-urls-confirmed/"
source_name: "relevantaudience.com 외 다수 SEO/마케팅 매체(ppc.land, on-page.ai, Search Engine Roundtable 인용 보도)"
referrer_url: "https://news.hada.io/topic?id=33571"
published_at: "2026-08-26 (Google 공식 확인일 기준, 테스트 시작은 2026-07)"
summarized_at: "2026-09-12"
category: "backend"
tags: ["search-infrastructure", "web-scraping", "seo", "rank-tracking", "protobuf", "bot-vs-defender", "google", "url-obfuscation"]
---

# Google 검색, 목적지를 읽을 수 없는 google.com/goto 리디렉션 확대 (Search Engine Roundtable 외)

> 출처: [Google confirms google.com/goto search links](https://www.relevantaudience.com/seo/google-search-goto-passthrough-urls-confirmed/) (relevantaudience.com, ppc.land·on-page.ai 등 복수 SEO 매체가 Search Engine Roundtable의 Google 공식 확인 보도를 인용) · GeekNews(id=33571) 경유 · 정리일 2026-09-12

> **출처 한계**: 이 세션에서 `news.hada.io`는 물론 `en.wikipedia.org`까지 포함해 시도한 모든 도메인이 네트워크 egress 정책으로 차단되어, GeekNews 원문 페이지도, relevantaudience.com·ppc.land·on-page.ai 등 1차 보도로 지목한 매체도 단 하나도 직접 열어보지 못했다. 아래 내용은 전부 WebSearch가 반환한 스니펫을 교차 검증해 재구성한 것이다 — "Google이 Search Engine Roundtable에 8월 26일 공식 확인했다", "Nozzle의 Derek Perkins가 거의 100% 롤아웃을 관측했다", "500~1,000회 요청" 같은 구체 수치가 여러 독립 매체 스니펫에서 일관되게 반복돼 사실관계 신뢰도는 낮지 않다고 판단하지만, 원문 기사 전체·Google 스포크스퍼슨 발언의 전후 맥락·hada 자체 댓글 수·HN/Lobsters 큐레이션 여부는 전혀 확인하지 못했다.

## 한 줄 요약

**Google이 검색 결과 링크를 `google.com/goto`라는 서버사이드 리디렉션으로 감싸는 기능을 2026년 7월 테스트를 거쳐 8월 26일 공식 확인·확대했다 — 목적지 URL은 protobuf로 인코딩돼 링크 자체에서 로컬로 디코딩할 수 없고, 실제 주소를 알려면 Google 서버를 거쳐 리디렉션을 직접 따라가야 한다.** 일반 검색 사용자는 클릭하면 그대로 같은 페이지에 도착해 체감 변화가 없지만, 검색 결과 페이지를 프로그램으로 파싱해온 순위추적 도구·SERP API·경쟁사 분석 툴·사내 스크립트는 결과 페이지 하나를 해석하는 데 링크 수백 개마다 리디렉션을 개별로 따라가야 해 요청량이 500~1,000배로 뛴다.

## 핵심 포인트

- **무엇이 바뀌었나** — 검색 결과 링크가 목적지로 직접 연결되던 것에서, ***"모든 검색 결과가 이제 google.com/goto라는 서버사이드 리디렉션을 통과한다"***는 방식으로 바뀌었다. 목적지 URL은 **protobuf로 인코딩**돼 있어 링크 문자열만 보고는 실제 주소를 복원할 수 없다.
- **롤아웃 경과** — **2026년 7월 테스트 시작 → 8월 26일 Google이 Search Engine Roundtable에 공식 확인.** Nozzle의 Derek Perkins는 ***"여러 주거용 IP 공급자 전반에서 거의 100% 롤아웃"***을 관측했다고 밝혔다.
- **누가 영향을 받나** — 일반 검색 사용자는 클릭 시 동일한 페이지에 도착해 **체감 변화가 없다.** 영향은 **결과 페이지를 프로그램적으로 읽는 쪽** — 순위추적 플랫폼, SERP API, 경쟁사 인텔리전스 도구, 사내 파싱 스크립트 — 에 집중된다.
- **비용 폭증의 구체 수치** — Nozzle은 ***"5페이지 분량의 순위를 해석하는 데 500~1,000회 요청"***이 필요해졌다고 추산했다 — 결과 페이지 하나에 있는 링크 수백 개마다 리디렉션 체인을 개별로 따라가야 하기 때문이다.
- **Google의 공식 입장** — Google 스포크스퍼슨은 ***"We have a long history of deploying technical measures against evolving forms of abuse, and we regularly take steps to protect our services and users"***라고만 밝혔다 — 스크래퍼·순위추적 도구·AI 기업 등 특정 대상을 명시적으로 지목하지는 않았다.
- **SEO/마케팅 업계의 대응** — SerpApi 같은 서드파티 SERP API 제공업체는 자사 고객에게 직접 URL을 계속 제공하기 위해 리디렉션을 대신 해석해주는 방식으로 대응했다는 보도가 있다(추가 컴퓨팅 비용을 서드파티가 흡수하는 구조).

## 인상 깊은 문장

> "We have a long history of deploying technical measures against evolving forms of abuse, and we regularly take steps to protect our services and users." (Google 스포크스퍼슨, Search Engine Roundtable 인용 · WebSearch 재구성)

> "500 to 1,000 requests to resolve a five-page ranking." (Derek Perkins, Nozzle · WebSearch 재구성 인용)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다** — `news.hada.io` 접근이 이 세션 내내 차단됐다. 다만 SEO/마케팅 업계 블로그 다수가 거의 동시에 이 소식을 다뤘다는 사실(WebSearch 결과에 잡힌 것만 relevantaudience, ppc.land, on-page.ai, susodigital, symphonicdigital, decodo, softhints, crestodigital, inimino.org, rapiddigitalgrowth 등 10개 이상)은 SEO 업계 내부에서는 상당히 큰 반향이 있었다는 정황 증거다. **다만 이 매체들 전부가 SEO/마케팅 대행사·툴 벤더의 블로그이고, 순위추적 도구를 파는 쪽 입장에서 "우리 비즈니스가 얼마나 타격받는가"를 강조할 유인이 있다는 점을 감안해야 한다** — 즉 "500~1,000배" 같은 수치가 업계의 위기감을 정확히 반영한 것일 수도, 다소 과장된 것일 수도 있다. Google 측의 1차 성명도 매체를 통한 재인용일 뿐 원문 인터뷰 전체를 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이건 방어자-공격자 군비경쟁의 방향이 뒤집힌 사례다

[[2026-08-30-ai-crawlers-overwhelm-git-servers]]와 [[2026-08-08-patronview-bot-scraper-war]]는 둘 다 "**소규모 사이트 운영자가 대형 AI 크롤러의 스크래핑 트래픽으로부터 자신을 방어**"하는 구도였다 — 방어자는 약자, 스크래퍼는 대형 AI 기업이었다. 이번 사건은 정확히 반대다. **Google이 자기 검색 결과를 파싱해가는 SEO 툴·순위추적 업체(대체로 중소 규모 SaaS)를 상대로 같은 방어 전술(디코딩 불가능한 인코딩, 리졸브 비용 강제 상승)을 편다.** 세 사례를 겹치면 "봇 차단"이라는 기법 자체는 방향과 무관하게 동일하다는 걸 알 수 있다 — **누가 더 큰 인프라를 갖고 있느냐가 누가 방어자이고 누가 공격자로 불리는지를 결정할 뿐, 기술적 패턴(요청 비용을 상대에게 전가한다)은 대칭적이다.**

### 핵심 전이 2 — "정당한 사용자는 영향 없다"는 방어 설계 원칙이 여기서도 반복된다

[[2026-08-02-how-to-block-some-bots]]가 강조한 핵심 경고 — ***"1~3년치 로그를 먼저 분석하지 않으면 정상 사용자까지 함께 차단한다"*** — 와 대조하면 이번 Google의 조치는 오히려 그 원칙을 잘 지킨 사례로 보인다. **일반 검색 사용자의 클릭 경험은 리디렉션을 거쳐도 동일한 목적지에 도착해 체감 변화가 없다** — Google은 "사람이 하는 행동(클릭 한 번)"과 "프로그램이 하는 행동(결과 페이지 전체를 대량 파싱)"을 리디렉션 체인을 강제로 따라가야 하는 비용 차이로 구분해낸 셈이다. 다만 이 구분이 완벽하지는 않다 — 접근성 도구·스크린리더·브라우저 확장 프로그램처럼 프로그램적으로 링크를 미리 읽어야 하는 정당한 사용 사례도 같은 비용을 떠안을 수 있는데, 이 부분은 이번 조사에서 확인하지 못했다.

### 핵심 전이 3 — "링크 미리보기로 신뢰 판단"이라는 습관이 무력화된다는 점에서 다른 신뢰 신호 위조 사례와 같은 축

[[2026-06-08-aur-supply-chain-malware]]는 **"git 커밋의 author 이름은 검증 없는 자기 신고라 위조될 수 있다"**는 교훈을 남겼다. google.com/goto도 비슷한 방향의 신뢰 신호 상실을 만든다 — 지금까지는 검색 결과에 마우스를 올리면 브라우저 상태 표시줄에 뜨는 실제 목적지 URL을 보고 피싱·스팸 사이트를 미리 걸러내는 습관이 있었는데, 이제 그 자리에는 `google.com/goto?...`만 보인다. **차이는 이번엔 "위조"가 아니라 "Google 자신이 공식적으로 불투명하게 만든 것"이라는 점** — 의도는 어뷰징 방지지만, 결과적으로 사용자가 클릭 전에 목적지를 스스로 판단할 수단 하나가 사라졌다는 부작용은 정직하게 짚어야 한다.

## 호스피탈리티 / CRS 적용 포인트

온다가 직접 검색 결과 리디렉션을 다루는 건 아니라 직접 적용은 멀지만, 전이 가능한 원칙 두 가지는 있다.

- **자사 API·웹 서비스의 요청 로그를 "누가 대량으로 프로그램적 접근을 하는가" 기준으로 주기적으로 재분류한다.** OTA·PMS 파트너의 정당한 배치 조회와, 악의적이거나 무분별한 스크래핑을 구분하는 기준으로 "응답을 실제 최종 사용자에게 전달하는가"([[2026-08-08-patronview-bot-scraper-war]]가 제시한 "방문자를 전혀 보내지 않는 크롤러는 차단" 원칙)를 CRS API 게이트웨이 정책에 참고할 수 있다.
- **외부 파트너(메타서치, 채널)가 우리 API 응답 구조에 과도하게 의존해 우리도 모르는 사이 우리 서비스가 "사실상 공개 데이터 소스"가 되지 않았는지 점검한다.** google.com/goto가 보여주듯, 한 번 프로그램적 파싱을 허용하면 그 파싱이 원래 의도(사람의 검색)를 훨씬 넘어서는 규모로 자라날 수 있다.

## 연관 자료

- [[2026-08-30-ai-crawlers-overwhelm-git-servers]] — 방향이 반대인 거울상 사례: 소규모 인프라가 대형 AI 크롤러를 방어. 이번 사건은 대형 인프라(Google)가 중소 SEO 툴을 상대로 같은 종류의 비용 전가 방어를 편다
- [[2026-08-08-patronview-bot-scraper-war]] — "방문자를 보내지 않는 크롤러는 차단"이라는 실전 원칙, 사람의 행동과 프로그램의 행동을 비용 차이로 구분하는 발상이 이번 사건과 통한다
- [[2026-08-02-how-to-block-some-bots]] — "정당한 사용자까지 함께 차단하지 않으려면 로그를 먼저 분석하라"는 경고, 이번 조치가 그 원칙을 어느 정도 지켰는지 대조할 기준
- [[2026-06-08-aur-supply-chain-malware]] — "검증 없는 신뢰 신호는 위조된다"는 다른 맥락의 신뢰 상실 사례. 이번엔 위조가 아니라 공식적 불투명화라는 점이 다르다

## 한 달 뒤 회고

*(2026-10-12 즈음 — SerpApi·Nozzle 등 SEO 툴 업계가 리디렉션 해석 비용을 실제로 어떻게 흡수했는지, Google이 이 조치의 대상으로 "AI 학습 크롤러"를 명시적으로 지목했는지, 접근성 도구에 대한 부수 피해 보고가 나왔는지 확인.)*
