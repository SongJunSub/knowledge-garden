---
title: "Verisign, .name 3단계 도메인 종료 — 25년 써온 도메인이 '2040년까지 비용을 냈다'는 사실과 무관하게 2027년 삭제 통보를 받는다"
source_title: "Discontinuation of third-level .name domains leaves some in a lurch"
source_url: "https://www.namepros.com/articles/discontinuation-of-third-level-name-domains-leaves-some-in-a-lurch.1397809/"
source_name: "namepros.com"
referrer_url: "https://news.hada.io/topic?id=33197"
published_at: "2026-09-02"
summarized_at: "2026-09-04"
category: "engineering"
tags: ["domain-name", "verisign", "sunset", "vendor-dependency", "internet-infrastructure"]
---

# Verisign, .name 3단계 도메인 종료

> 출처: [Discontinuation of third-level .name domains leaves some in a lurch](https://www.namepros.com/articles/discontinuation-of-third-level-name-domains-leaves-some-in-a-lurch.1397809/) (NamePros) · GeekNews([news.hada.io/topic?id=33197](https://news.hada.io/topic?id=33197)) 경유 · 정리일 2026-09-04

## 한 줄 요약

**Verisign이 이용 감소와 등록기관 지원 부족을 이유로 `.name` 3단계 도메인(`firstname.lastname.name` 형태) 등록 서비스를 종료하고, 신규 등록뿐 아니라 기존 약 2만 2천 개 도메인도 전부 삭제하기로 했다. 25년간 자기 이름 도메인을 웹사이트·이메일·API 서버에 써온 개인 사용자 Neil Fraser는 2040년까지 비용을 이미 냈음에도 2027년 2월 서비스 중단 통보를 받았다 — 돈을 냈다는 사실이 서비스 지속을 보장하지 않는다는 것을 보여주는 사례.**

## 핵심 포인트

- **종료 이유** — Verisign이 ICANN에 밝힌 사유는 ***이용 감소와 등록기관(registrar) 지원 부족***. 약 2만 2천 개의 3단계 등록 도메인이 존재하지만 그중 다수가 사실상 미사용 상태라는 것이 Verisign 측 설명.
- **종료 범위** — 신규 등록 중단뿐 아니라 ***기존 등록분도 전부 삭제*** 대상이다. `.name`의 `firstname.lastname.name`은 개인 사업자가 재판매한 하위 도메인이 아니라 2001년부터 ***공식 레지스트리를 통해 독립적으로 등록해 온 정식 도메인 상품***이라는 점이 이 사안을 더 무겁게 만든다.
- **Neil Fraser 사례** — 25년간 `neil.fraser.name`을 웹사이트·이메일·API 서버에 사용했고 ***2040년까지 비용을 이미 납부***했지만, ***2027년 2월 서비스 중단 통보***를 받았다. 장기 결제가 서비스 존속을 보장하지 않는다는 것이 이 사례의 핵심.
- **2단계 `.name`(`example.name`)은 종료 대상이 아니다** — 이번 종료는 `사람이름.성.name` 형태의 3단계 등록에 한정된다(WebSearch로 교차확인).

## 인상 깊은 문장

> "About 22,000 third-level .name registrations exist, but many of them are unused." (Verisign이 ICANN에 밝힌 요지, NamePros 인용)

## 댓글

**출처 한계 명시.** news.hada.io는 이 세션에서 egress 차단으로 GeekNews 댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. 1차 출처인 NamePros 기사 원문도 이 세션에서는 WebFetch가 차단돼 직접 열람하지 못했고, WebSearch 결과 스니펫과 Slack 발췌를 교차해 정리했다. Lobsters에 "`.name` Termination"이라는 별도 스레드가 존재하는 것을 WebSearch로 확인했으나(`lobste.rs/s/6tsncg/name_termination`) 접속이 차단돼 커뮤니티 논지는 확인하지 못했다 — 반응의 방향(분노/체념/대안 모색 등)을 이 노트는 판단하지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-19-google-hotel-ads-third-party-rates-sunset]]과 같은 "의존하던 서비스가 사라진다"는 계열, 다만 대응 가능성이 전혀 다르다

Google Hotel Ads 서드파티 요금 종료 노트에서 정리한 패턴 — "플랫폼이 기존 경로를 없앤다" — 이 여기서도 반복된다. 다만 결정적 차이가 있다: Google Hotel Ads는 ***대체 경로(자체 Hotel Center 연결)가 존재***했고 6주의 유예 기간이 있었다. `.name`은 ***대체 경로 자체가 없다*** — 25년 써온 `이름.성.name` 형태의 도메인 구조는 다른 어떤 TLD로도 동일하게 재현할 수 없고, 이메일·웹사이트·API 엔드포인트를 전부 새 도메인으로 이전해야 한다. **"돈을 미리 냈다"가 서비스 지속의 보증이 되지 못한다는 점에서, 벤더 종속의 최악 시나리오를 보여주는 사례다.**

### 핵심 전이 2 — 개인 도메인을 인프라로 쓰는 것의 취약성

Neil Fraser처럼 개인 이름 도메인을 이메일·API 서버 등 인프라로 장기 운영하는 사례는 [[2026-05-04-email-addresses-deep-dive]]가 다룬 "이메일 주소는 RFC 표준보다 훨씬 복잡하고 여러 층위에 의존한다"는 논지와 만난다 — 도메인·이메일 같은 "당연히 영속적일 것 같은" 인프라도 실제로는 특정 레지스트리·표준의 정책 결정에 종속돼 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이지만 원칙 하나는 명확히 전이된다 — **"장기 결제·계약이 서비스 지속을 보장하지 않는다"**는 것은 온다가 CRS 연동 파트너(PMS·채널 매니저·결제 게이트웨이)를 선정할 때 계약서상 SLA·해지 조항만이 아니라 "그 벤더가 사업을 접거나 특정 상품 라인을 정리할 때 우리 파트너사가 얼마나 빨리, 얼마나 큰 비용으로 이전할 수 있는가"를 이중화 설계에 반영해야 한다는 근거로 쓸 수 있다. 특히 도메인·이메일처럼 파트너사 브랜드 정체성에 묶인 인프라를 온다가 대행하는 경우, 유사한 "대체 경로 없는 종속" 리스크가 없는지 점검할 가치가 있다.

## 연관 자료
- [[2026-08-19-google-hotel-ads-third-party-rates-sunset]] — 같은 "플랫폼이 의존 경로를 없앤다" 패턴, 다만 대체 경로가 존재했다는 점에서 대비됨
- [[2026-05-04-email-addresses-deep-dive]] — 이메일·도메인 같은 "당연한 인프라"가 실은 여러 표준·정책에 종속돼 있다는 같은 통찰

## 한 달 뒤 회고
*(2026-10-04 즈음 — 2만 2천 명의 기존 등록자를 위한 유예 기간·보상안이 Verisign에서 나왔는지, ICANN이 이 결정에 개입했는지, Lobsters 스레드의 논지를 원문 접근이 가능해지면 확인.)*
