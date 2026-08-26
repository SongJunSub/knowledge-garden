---
title: "Nitter, X Corp.의 영구 중단 서한 하루 만에 서비스·개발 전면 중단 — 오픈소스 대안 프론트엔드의 생존은 결국 플랫폼의 관용에 달려 있었다"
source_title: "X sends cease-and-desist to open source project Nitter over alleged scraping"
source_url: "https://techcrunch.com/2026/08/25/x-sends-cease-and-desist-to-open-source-project-nitter-over-alleged-scraping/"
source_name: "TechCrunch"
referrer_url: "https://news.hada.io/topic?id=32886"
published_at: "2026-08-25"
summarized_at: "2026-08-26"
category: "engineering"
tags: ["open-source", "legal", "api-access", "scraping", "platform-governance"]
---

# Nitter, X Corp.의 영구 중단 서한 하루 만에 서비스·개발 전면 중단

> 출처: [X sends cease-and-desist to open source project Nitter over alleged scraping](https://techcrunch.com/2026/08/25/x-sends-cease-and-desist-to-open-source-project-nitter-over-alleged-scraping/) (TechCrunch) · 정리일 2026-08-26
> **출처 한계**: `news.hada.io`·`techcrunch.com`·`pxlnv.com`·`mezha.net`·`opensourceforu.com`·`news.ycombinator.com` 전부 이 세션에서 직접 접근이 막혔다. 아래 내용은 이들 매체·GitHub 저장소(직접 접근 성공)를 인용·요약한 WebSearch 스니펫을 교차 확인해 재구성한 것이다. 특히 GitHub 저장소 상단 공지와 archived 상태는 직접 확인했다.

## 한 줄 요약

**X Corp.가 2026년 8월 24일 오픈소스 X(트위터) 대체 프론트엔드 Nitter와 공개 인스턴스들에 ***서비스·저장소의 영구 중단을 요구하는 cease-and-desist 서한***을 보냈다. Nitter가 ***"X의 API 접근 통제와 사용량 제한을 우회해 데이터를 스크래핑하고, 계정·세션 토큰을 규칙에 어긋나게 사용해 데이터를 재공개했다"***는 주장이다. 공식 인스턴스 nitter.net은 즉시 운영을 중단했고, 개발자 zedeus는 법률 자문을 받는 동안 개발도 중단한다고 밝혔다. GitHub 저장소는 삭제되지 않고 ***"2026년 8월 25일 소유자에 의해 archived — 이제 읽기 전용"***으로 남았다.**

## 핵심 포인트

- **서한 발송** — X Corp.가 2026-08-24, Nitter와 nitter.net을 포함한 공개 인스턴스들에 ***"서비스 및 프로젝트 저장소의 영구 중단"***을 요구하는 cease-and-desist 서한 발송. **마감 시한은 2026-08-25 오후 5시(동부시간)**였다(mezha.net발 WebSearch 스니펫 기준).
- **법적 근거** — **텍사스 Harmful Access by Computer Act**와 **Lanham Act**를 근거로 제시. X 측 주장은 ***"unlawful use and circumvention of X's Application Programming Interface (API) and associated data"*** — API 접근 통제·사용량 제한 우회, X 계정·세션 토큰의 규칙 위반적 사용, 그렇게 얻은 데이터의 재공개.
- **즉각 대응** — **nitter.net 운영 중단**. 개발자 **zedeus**는 TechCrunch에 ***"다른 Nitter 인스턴스들도 비슷한 서한을 받았다"***고 밝히며, ***법률 자문을 받는 동안 프로젝트 개발도 중단***한다고 발표.
- **저장소는 삭제가 아니라 archive** — `github.com/zedeus/nitter` 저장소는 삭제되지 않았고, ***"This repository was archived by the owner on Aug 25, 2026. It is now read-only."*** 상단에 cease-and-desist 서한을 받았다는 공지가 그대로 남아 있다(GitHub 직접 확인).
- **일부 자체 호스팅 인스턴스는 지속** — 공식 채널과 무관하게 운영되던 일부 셀프 호스팅 Nitter 인스턴스는 계속 남아 있는 것으로 보이나, 공식 프로젝트와의 관계는 불분명.
- **연쇄 영향** — Nitter 인프라에 의존하던 XCancel 등 다른 프로젝트도 함께 영향을 받았다는 보도가 있다.

## 인상 깊은 문장

> "On 24 August 2026 cease and desist letters were sent by X Corp. demanding a permanent takedown of Nitter instances and the project's repository."
> (GitHub 저장소 상단 공지, 직접 확인 — 프로젝트 자신의 공식 언어로 남긴 마지막 기록)

> "This repository was archived by the owner on Aug 25, 2026. It is now read-only."
> (GitHub 저장소 상태, 직접 확인 — 삭제가 아니라 "동결"이라는 점이 이 사건의 성격을 보여준다)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단).
- **Hacker News에 별도 스레드 존재를 WebSearch로 확인**(`news.ycombinator.com/item?id=49437283`, "Nitter project received cease and desist")했지만 직접 접근은 막혀 개별 댓글 수·정확한 표결 순위는 파악 못 했다. WebSearch로 재구성한 취지는 ***"기업이 이런 커뮤니티 프로젝트를 ToS 위반 주장으로 부수기보다 지원해야 한다"***는 비판적 반응이 있었다는 것 — 다만 이건 다수 댓글 중 하나를 요약한 것이라 커뮤니티 전체 정서를 대표한다고 보긴 어렵다.
- programming.dev, ResetEra 등에도 관련 스레드가 있다는 것을 WebSearch로 확인했으나 내용은 미확인.
- **이해관계 고지**: 이 사건은 본질적으로 **X Corp.의 일방적 주장**(법적 서한)과 **zedeus 측의 제한된 공개 대응**(GitHub 공지 한 줄)만 있고, 양측의 상세한 법적 다툼 근거(Nitter가 실제로 무엇을 어떻게 했는지)는 아직 공개 검증되지 않았다. "스크래핑으로 API를 우회했다"는 X의 주장을 그대로 받아 적었을 뿐, 사실관계 자체를 이 노트가 판정하는 것은 아니다.

## 내 생각 · 적용점

### 핵심 전이 1 — "스크래핑을 막는 쪽"과 "스크래핑하다 막힌 쪽"이 같은 시즌 가든에 함께 있다, 거울상 구조

[[2026-08-08-patronview-bot-scraper-war]]에서 다룬 PatronView는 ***"방문자를 전혀 안 보내는 크롤러는 차단"***이라는 원칙으로 스크래퍼와 1년간 싸운 쪽이었다. Nitter는 정확히 반대편 배역이다 — ***스크래핑(또는 X 주장에 따르면 API 우회)을 하다가, 플랫폼 소유자에게 법적으로 차단당한 쪽***이다. 두 사건을 나란히 놓으면 "스크래핑이 나쁜가"라는 이분법이 아니라, ***"누가 그 판단의 권한을 쥐고 있는가"***라는 더 근본적인 질문이 보인다 — PatronView는 자기 서버의 소유자로서 방어할 권리가 있었고, X Corp.도 자기 플랫폼의 소유자로서 같은 논리를 쓴다. 오픈소스 대체 프론트엔드의 생존이 결국 ***"플랫폼이 이 사용 방식을 얼마나 오래 묵인해 주는가"***에 달려 있었다는 게, Nitter가 2013년경부터 살아남다가 지금에서야 끊긴 이유다.

### 핵심 전이 2 — "공지했다"가 아니라 "차단할 수 있다"가 플랫폼 종속의 진짜 위험

[[2026-08-19-google-hotel-ads-third-party-rates-sunset]]은 플랫폼(Google)이 서드파티 접근 경로를 **비즈니스 정책으로 예정된 일정에 따라** 종료하는 사례였다. Nitter는 그보다 훨씬 급진적인 버전이다 — **예고 없이, 법적 강제력을 동원해, 하루짜리 마감 시한**으로 접근을 끊는다. 두 사건을 나란히 두면 서드파티 의존의 위험도가 스펙트럼으로 보인다: **①정책 변경(유예 기간 있음, Google) → ②법적 강제(유예 없음, X/Nitter)**. **서드파티 API·데이터에 의존하는 어떤 프로젝트도, 그 접근권이 "허가"가 아니라 "묵인"이었을 가능성을 늘 염두에 둬야 한다**는 게 이 스펙트럼이 주는 교훈이다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다** — CRS/PMS/OTA 생태계에서 온다가 다루는 API 연동은 대부분 계약 기반 파트너십이라, Nitter처럼 플랫폼의 명시적 허가 없이 데이터를 끌어오는 구조와는 성격이 다르다.
- 다만 전이 가능한 원칙 하나는 있다 — **[[2026-08-19-google-hotel-ads-third-party-rates-sunset]]과 함께 보면, "제3자 플랫폼(OTA·메타서치·GDS)에 대한 데이터 접근이 계약이 아니라 관행/묵인에 의존하고 있는 연동이 있는지" CRS 통합 목록을 주기적으로 점검할 가치가 있다.** 묵인에 의존한 접근은 정책 변경보다 훨씬 급하게, 법적 형태로 끊길 수 있다는 게 이번 사건의 극단적 사례가 보여주는 하한선이다.

## 연관 자료
- [[2026-08-08-patronview-bot-scraper-war]] — 스크래핑을 막는 쪽의 시점, Nitter는 그 거울상(막힌 쪽)
- [[2026-08-19-google-hotel-ads-third-party-rates-sunset]] — 플랫폼이 서드파티 접근을 끊는 스펙트럼의 온건한 쪽(정책 변경+유예), Nitter는 급진적인 쪽(법적 강제+무유예)
- [[2026-08-04-devtools-must-be-open-source]] — 오픈소스 개발 도구의 통제권 논의와 대비: 소스가 열려 있어도 그 프로젝트가 의존하는 대상 플랫폼의 허가 자체가 통제 밖에 있을 수 있음

## 한 달 뒤 회고
*(2026-09-26 즈음 — ①zedeus의 법률 자문 결과와 프로젝트 재개 여부, ②X Corp.의 실제 소송 제기 여부, ③다른 X 스크래핑 기반 오픈소스 프로젝트(Xcancel 등)의 후속 상황, ④이 노트에서 확인 못 한 hada·HN 댓글 논지를 나중에 보강할 수 있는지 점검.)*
