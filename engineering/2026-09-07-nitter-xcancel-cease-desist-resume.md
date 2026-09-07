---
title: "Nitter와 XCancel, 법률 자문 후 서비스 재개 — X Corp의 중단 요청에도 오픈소스 대체 프론트엔드는 법률 자문을 거쳐 계속 운영을 택했다"
source_title: "Nitter and XCancel resume after legal consultation"
source_url: "https://www.theregister.com/legal/2026/08/26/nitter-no-more-x-sends-in-the-lawyers-to-shut-down-open-source-project/"
source_name: "The Register 등 복수 보도"
referrer_url: "https://news.hada.io/topic?id=33294"
published_at: "2026-08-26 (중단), 2026-09 (재개)"
summarized_at: "2026-09-07"
category: "engineering"
tags: ["nitter", "xcancel", "open-source", "cease-and-desist", "scraping", "api-terms", "x-corp"]
---

# Nitter와 XCancel, 법률 자문 후 서비스 재개

> 출처: [X shuts down seven-year-old Nitter with cease-and-desist letters](https://www.theregister.com/legal/2026/08/26/nitter-no-more-x-sends-in-the-lawyers-to-shut-down-open-source-project/) (The Register 등 복수 보도) · GeekNews(id=33294) 경유 · 정리일 2026-09-07

> **출처 한계**: `news.hada.io`는 egress 차단으로 hada 댓글·본문을 확인하지 못했다. The Register, TechCrunch, Forbes, Hacker News 토론(item?id=49446210) 등을 WebSearch로 교차 확인했다. "재개" 시점 이후의 최신 상태(2026-09 시점 Slack 발췌 기준)는 8월 26일 중단 보도만큼 폭넓게 확인하지 못했다 — 재개 소식 자체는 Slack 발췌가 유일한 직접 근거다.

## 한 줄 요약

**X Corp가 개인정보 보호·성능에 초점을 둔 무료 오픈소스 Twitter 대체 프론트엔드 Nitter·XCancel에 8월 24일 영구 폐쇄를 요구하는 중지 요청서를 보냈고(2024년에도 한 차례 API 차단·재개를 겪은 전력이 있음), 두 프로젝트는 서비스를 일시 중단했다가 법률 자문을 거쳐 클라이언트가 X와 직접 통신하지 않도록 모든 요청을 백엔드로 전달하는 방식으로 서비스를 재개하기로 했다.**

## 핵심 포인트

- **중지 요청의 법적 근거** — X Corp의 법률 서한은 Nitter가 X의 API와 관련 데이터를 "불법적으로 사용·우회"했다고 주장하며, 데이터를 스크래핑하고 계정·세션 토큰에 접근한 증거가 있다고 밝혔다. 근거 법률로 텍사스 컴퓨터 부정접근법(Texas Harmful Access by Computer Act)과 연방 상표법(Lanham Act)을 인용했다.
- **8월 25일 오후 5시(동부시간) 마감, 즉시 중단** — X는 8월 25일 오후 5시까지 영구 폐쇄를 요구했고, Nitter.net은 오프라인 상태가 됐으며 개발도 중단됐다. 가장 잘 알려진 Nitter 기반 서비스인 XCancel도 함께 운영을 멈췄다.
- **2024년에도 한 차례 겪은 일 — 전례가 있는 갈등** — 2024년 2월에도 X가 Nitter가 게시물에 접근하던 여러 방법을 차단해 플래그십 인스턴스가 다운된 적이 있다. 이후 운영자들이 실제 X 계정에 인스턴스를 연결하는 방식으로 대응해 2025년 서비스를 재개했던 전력이 있다 — ***이번이 같은 구도의 두 번째 라운드***인 셈이다.
- **모든 요청을 백엔드로 전달하는 방식으로 재개** — Slack 발췌에 따르면 Nitter는 법률 자문을 거쳐 서비스를 계속 진행하기로 했으며, 개인정보 보호와 성능에 초점을 둔 무료 오픈소스 Twitter 대체 프론트엔드로서 ***모든 요청을 백엔드로 전달해 클라이언트가 X와 직접 통신하지 않도록*** 하는 구조를 취했다. README에는 RSS 피드의 인스턴스별 지원 여부와 악용에 따른 비활성화 주의사항을 추가하고, JavaScript 불필요·광고 없음을 별도 항목으로 정리했으며, 로드맵에서 임베드를 완료 표시하고 사용 가이드를 연결했다고 언급된다.

## 인상 깊은 문장

> (WebSearch 종합 재인용) "The letter accuses Nitter of the 'unlawful use and circumvention of X's Application Programming Interface (API) and associated data,' saying X has evidence it scraped data and accessed accounts and session tokens."

## 댓글

hada 댓글은 확인하지 못했다. Hacker News에 "XCancel and Nitter are receiving C&D letters from XCorp"라는 별도 토론 스레드가 존재함을 확인했으나 정확한 내용은 egress 차단으로 미확인이다. **출처 한계**: "법률 자문 후 재개"라는 Slack 발췌의 최신 정황은 이 노트 작성 시점에 대형 매체 보도로 아직 폭넓게 확인되지 않은 상태다 — 상황이 유동적일 수 있다는 점을 명시해둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "허가받지 않은 API 접근"을 둘러싼 반복되는 법적 갈등의 최신 사례

오픈소스 프로젝트가 대형 플랫폼의 비공식 API·데이터를 활용하다 법적 조치를 받는 패턴은 업계에서 반복돼왔다. 이번 사례가 흥미로운 지점은, ***폐쇄 통보에도 완전히 물러나지 않고 "법률 자문 → 아키텍처 변경(클라이언트-X 직접 통신 제거)"으로 대응했다***는 것이다 — 법적 리스크를 완전히 회피하기보다 리스크를 낮추는 기술적 완화책(요청을 백엔드로 우회)을 택한 셈이다.

### 핵심 전이 2 — 플랫폼 종속을 우회하려는 시도와 그 대가라는 오래된 긴장

가든에 정리된 소버린 AI·로컬 우선 도구 계열([[2026-09-04-own-your-intelligence-sovereign-ai-guide]] 등)이 "공급자 종속에서 벗어나려는 시도"를 다뤄온 것과 같은 축에서, Nitter는 소셜 미디어 도메인의 같은 시도(플랫폼 공식 클라이언트 없이 콘텐츠에 접근)를 대표한다. 다만 이 사례는 그 시도가 ***플랫폼의 법적 대응이라는 실제 대가를 수반할 수 있다***는 걸 구체적으로 보여준다 — 종속을 벗어나려는 시도 자체가 항상 안전한 것은 아니라는 균형 잡힌 시각이 필요하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS/PMS가 소셜 미디어 API 스크래핑 이슈에 노출될 일은 드물다. 다만 원칙만 전이하면, ***"공식적으로 허용되지 않은 방식으로 외부 플랫폼(채널 매니저, OTA 등) 데이터를 자동 수집·연동하는 경우, 그 플랫폼의 이용약관·API 정책이 바뀌면 서비스 연속성이 법적으로 위협받을 수 있다"***는 리스크는 CRS가 다수의 OTA·채널과 연동하는 구조에서 실제로 유의해야 할 지점이다. 공식 API·파트너십 경로를 우선하고, 비공식 연동에는 항상 "플랫폼이 차단하면 어떻게 대응할 것인가"의 플랜 B를 준비해두는 게 이 사례의 실무적 교훈이다.

## 연관 자료

- [[2026-09-04-own-your-intelligence-sovereign-ai-guide]] — 플랫폼 종속에서 벗어나려는 시도라는 같은 축, Nitter 사례는 그 시도의 법적 대가를 보여줌

## 한 달 뒤 회고

*(2026-10-07 즈음 — Nitter·XCancel 재개가 실제로 안정적으로 유지됐는지, X Corp의 추가 법적 조치가 있었는지 점검.)*
