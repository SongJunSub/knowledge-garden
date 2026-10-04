---
title: "Cloudflare, 사용자 IP를 숨기는 OHTTP 게이트웨이 공개 — 릴레이는 누가 요청했는지만, 게이트웨이는 무엇을 요청했는지만 알게 역할을 쪼갠다"
source_title: "Announcing Cloudflare OHTTP Gateway"
source_url: "https://blog.cloudflare.com/announcing-cloudflare-ohttp-gateway/"
source_name: "Cloudflare Blog"
referrer_url: "https://news.hada.io/topic?id=34719"
published_at: "2026-10-02"
summarized_at: "2026-10-04"
category: "backend"
tags: ["cloudflare", "ohttp", "privacy", "oblivious-http", "relay-gateway-separation", "ip-privacy"]
---

# Cloudflare, 사용자 IP를 숨기는 OHTTP 게이트웨이 공개

> 출처: [Announcing Cloudflare OHTTP Gateway](https://blog.cloudflare.com/announcing-cloudflare-ohttp-gateway/) (Cloudflare Blog) · GeekNews(id=34719) 경유 · 정리일 2026-10-04

> **출처 한계**: `news.hada.io`와 `blog.cloudflare.com` 모두 이 세션에서 egress 차단으로 직접 열지 못했다(미러 사이트인 daily.dev, techreport.ngo, infrastructure-now.co.uk, techbytes.app도 전부 같은 이유로 차단됐다). 이 노트는 WebSearch가 반환한 복수의 독립 요약(daily.dev·techreport.ngo·infrastructure-now.co.uk의 재배포, Wikipedia의 Oblivious HTTP 일반 설명, Cloudflare 공식 OHTTP Relay 문서 페이지 스니펫)을 교차확인해 재구성했다 — OHTTP 릴레이/게이트웨이 역할 분리, 기존 Privacy Gateway의 명칭 변경(OHTTP Relay로), 비공개 베타 발표라는 핵심 사실관계는 여러 소스가 일관되게 확인해 신뢰도가 높다고 판단한다. 다만 Cloudflare 엣지 네트워크에서의 구체적 암호화 처리 방식, 자동 확장·키 관리 메커니즘의 세부 구현, 비공개 베타 신청 절차는 원문을 직접 읽지 못해 확정하지 못했다. hada 댓글 수, HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**Cloudflare가 앱 서버가 사용자의 실제 IP 주소를 전혀 알지 못한 채로 요청을 처리할 수 있게 하는 관리형 OHTTP(Oblivious HTTP) Gateway의 비공개 베타를 시작했다. OHTTP는 요청을 서로 다른 운영자가 맡는 두 홉으로 나눈다 — 릴레이(relay)는 사용자의 IP만 보고 요청 내용은 못 보며, 게이트웨이(gateway)는 암호화를 풀어 요청 내용은 보지만 누가 보냈는지는 모른다. 이번 발표로 Cloudflare는 기존 "Privacy Gateway"를 "Cloudflare OHTTP Relay"로 이름을 바꾸고, 그 반대쪽 역할인 게이트웨이 기능을 신규 상품으로 내놓아 OHTTP의 두 역할을 모두 자사 상품으로 갖추게 됐다.**

## 핵심 포인트

- **OHTTP의 핵심 원리 — 두 운영자가 각자 반쪽만 안다** — Oblivious HTTP는 요청이 **릴레이**와 **게이트웨이**라는 독립적으로 운영되는 두 홉을 거치게 설계된 IETF 표준이다. 릴레이는 암호화된 요청을 그대로 전달하며 **누가(어느 IP가) 요청했는지는 알지만 무엇을 요청했는지는 모른다.** 게이트웨이는 암호화를 해독해 **요청 내용은 알지만 누가 보냈는지는 모른다.** 이 둘이 서로 다른 운영자이기 때문에, 어느 한쪽도 "누가 무엇을 요청했는지"를 동시에 알 수 없다.
- **명칭 재정리 — Privacy Gateway가 "OHTTP Relay"로** — Cloudflare는 기존에 운영하던 **Privacy Gateway**(관리형 OHTTP 릴레이 서비스)를 **Cloudflare OHTTP Relay**로 공식 개명했다. 이 개명 자체가 이번 발표의 핵심 메시지를 담고 있다 — "릴레이"와 "게이트웨이"라는 OHTTP 구조상의 두 역할을 헷갈리지 않게 구분하려는 것이다.
- **신규 상품: Cloudflare OHTTP Gateway** — 이번에 비공개 베타로 새로 공개된 건 반대쪽 역할인 **게이트웨이**다. 앱 서버가 OHTTP 요청을 암호화 해독·캡슐화 작업 없이 **일반 HTTP 요청처럼 그대로 처리**할 수 있게 해주는 게 핵심 가치 제안이다 — 즉 앱 서버 개발팀이 OHTTP 암호화 프로토콜을 직접 구현할 필요가 없다.
- **Cloudflare CDN·Workers와의 통합 가능성** — Cloudflare의 CDN이나 Workers를 쓰는 앱이라면 **외부(제3자) 릴레이와 연결**해 OHTTP를 도입할 수 있는 구조로 보인다 — 즉 게이트웨이는 Cloudflare가, 릴레이는 독립된 다른 운영자가 맡아야 "한쪽이 양쪽을 다 알게 되는" OHTTP의 신뢰 분리 모델이 실제로 성립한다.
- **엣지 네트워크에서의 처리** — Cloudflare의 전 세계 엣지 네트워크에서 암호화 관련 작업(HPKE 키 관리, 암호화 해독)을 처리해 지연시간을 낮추고, 자동 확장과 키 관리를 관리형으로 제공한다는 게 여러 소개 매체의 공통된 설명이다. 다만 **이 자동 확장·키 관리의 구체적 메커니즘은 원문을 직접 읽지 못해 세부까지는 확인하지 못했다.**
- **릴레이 출처 검증 — Cloudflare 자신이 신뢰 모델을 어기지 않으려는 설계** — 여러 소스에 따르면 Cloudflare OHTTP Gateway는 **Cloudflare Workers나 Cloudflare 프록시를 거친 요청으로부터 오는 디크립션은 거부**하도록 설계됐다고 한다 — 만약 릴레이 역할까지 Cloudflare가 몰래 겸하면 "누구도 양쪽을 다 알 수 없다"는 OHTTP의 핵심 전제가 깨지기 때문에, 이 거부 규칙이 신뢰 분리 모델을 실제로 지키기 위한 장치로 보인다.

## 인상 깊은 문장

> (WebSearch로 교차확인한 매체 재구성, Cloudflare 원문 직접 대조는 아님) "An OHTTP relay blindly forwards encrypted requests to hide client identifiers from app servers, and an OHTTP gateway performs the cryptographic work of decapsulating encrypted requests and encapsulating responses such that app servers can handle OHTTP requests as if they were plain HTTP."
> (릴레이와 게이트웨이의 역할 분리를 한 문장으로 정리한 핵심 문장 — "누가"와 "무엇을"이 구조적으로 분리된다는 OHTTP의 본질.)

## 댓글

**hada 댓글 수, HN/Lobsters 큐레이션 여부 모두 이번 세션에서 확인하지 못했다**(`news.hada.io` 전면 차단, 전용 HN 스레드도 이번 조사에서 특정하지 못함). **정직하게 감안할 점**: (1) 이 발표는 Cloudflare의 **Birthday Week 2026** 행사 기간 중 나온 여러 발표 중 하나로 보인다 — 매년 이 시기에 다수의 신규 상품·기능을 한꺼번에 공개하는 Cloudflare의 관례상, 이 기능 하나에 대한 깊이 있는 단독 분석보다는 "여러 발표 중 하나"로 가볍게 다뤄졌을 가능성이 있다. (2) Cloudflare는 OHTTP의 **게이트웨이이자 때로는 릴레이 서비스(OHTTP Relay)까지도 제공**하는 회사다 — "릴레이와 게이트웨이는 반드시 다른 운영자여야 신뢰 분리가 성립한다"는 원칙을 Cloudflare 스스로 강조하면서도, 한 회사가 두 상품을 모두 파는 구조이므로 **실제 도입 사례에서 릴레이와 게이트웨이를 정말 독립된 조직이 운영하는지**는 도입하는 쪽이 직접 확인해야 할 지점이다(원문에서 이 긴장을 어떻게 다루는지는 확인하지 못했다). (3) 비공개 베타 단계라 가격, 실제 지연시간 영향, 일반 공개(GA) 일정은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Android VPN IP 유출 사건과 정확히 반대 방향에서 "IP를 신호로 다루는" 같은 주제

[[2026-09-13-android-vpn-tiny-udp-cannon-ip-leak]]는 VPN이 IP를 숨기기로 돼 있는데 하드웨어 오프로드 경로가 그 검사를 건너뛰어 **실제 IP가 새어나가는** 결함을 다뤘다. 이 글은 정반대 방향에서 같은 목표(IP를 숨긴다)를 다른 아키텍처로 접근한다 — VPN은 "클라이언트가 중간 서버를 거쳐 목적지에 도달"하는 **단일 신뢰 지점** 모델인 반면, OHTTP는 릴레이·게이트웨이라는 **두 개의 서로 다른 신뢰 지점으로 일부러 쪼개** 어느 한쪽도 전체 그림을 못 보게 만든다. VPN 사건이 "검사 지점이 하나면 그 지점이 뚫리는 순간 전부 노출된다"는 단일 장애점의 위험을 보여줬다면, OHTTP는 애초에 **단일 장애점 자체를 구조적으로 없애려는 설계**다 — 같은 문제(IP 프라이버시)에 대한 "방어를 강화한다"와 "애초에 한 곳이 전체를 알 수 없게 설계한다"는 서로 다른 전략적 층위를 대조해볼 수 있다.

### 핵심 전이 2 — Cloudflare 자신의 다른 "역할 분리" 설계 패턴과 같은 철학

[[2026-10-02-cloudflare-k2-serverless-event-streams]]가 다룬 Cloudflare K2는 "브로커가 데이터를 소유하지 않게" R2 위에 로그를 쌓는 설계였다 — 메시지 브로커라는 단일 주체가 가진 책임(저장·전달)을 쪼개 객체 스토리지(R2)에 위임한다는 점에서, "한 주체가 너무 많은 걸 알거나 책임지지 않게 쪼갠다"는 철학을 이번 OHTTP Gateway와 공유한다. 다만 K2는 **효율·내구성**을 위해 책임을 쪼개고, OHTTP는 **프라이버시**를 위해 지식(knowledge)을 쪼갠다는 목적의 차이가 있다 — Cloudflare라는 한 회사가 "단일 주체 집중을 구조적으로 분산시킨다"는 같은 설계 패턴을 서로 다른 문제 영역(스트리밍 인프라, 프라이버시 프로토콜)에 반복해서 적용하고 있다는 관찰이 흥미롭다.

### 핵심 전이 3 — "자사가 양쪽 역할을 다 팔아도 신뢰 모델이 성립하는가"라는 정직한 긴장

이 노트의 댓글 섹션에서 짚었듯, Cloudflare가 OHTTP Relay와 OHTTP Gateway를 **모두** 상품으로 파는 구조는 "독립된 두 운영자"라는 OHTTP의 핵심 전제와 긴장 관계에 있다. 이건 [[2026-06-01-how-anthropic-contains-claude]]에서 확인했던 "커스텀 구성요소가 가장 취약하다"는 보안 원칙과 다른 각도에서 비슷한 경계심을 요구한다 — 기술적으로는 역할이 분리돼 있어도, **상업적으로 같은 벤더가 양쪽을 제공하면 신뢰 분리의 실효성은 도입자가 직접 두 서비스를 서로 다른 조직에 분산시켜야만 완성**된다는 걸 이번 사례가 보여준다. 설계가 아무리 건전해도 실제 배포 선택이 그 설계의 효과를 결정한다는 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 다소 거리가 있다** — 온다 CRS는 사용자(여행자) IP를 숨겨야 하는 소비자용 프라이버시 제품이 아니라 B2B 예약·채널 관리 플랫폼이다. 다만 전이 가능한 원칙 둘은 남는다. ①**"한 주체가 너무 많은 걸 알지 못하게 역할을 구조적으로 쪼갠다"는 OHTTP의 설계 철학은, CRS가 멀티테넌트 환경에서 민감한 고객 데이터(결제 정보, 예약 패턴)를 다룰 때 참고할 수 있는 아키텍처 원칙이다** — 예를 들어 결제 처리와 예약 데이터 조회를 서로 다른 서비스/권한 경계로 쪼개, 한쪽이 뚫려도 다른 쪽 정보와 결합되지 못하게 하는 설계는 같은 사고방식의 적용이다. ②**"기술적 역할 분리가 상업적으로 같은 벤더에 묶이면 실효성이 흐려진다"는 교훈은 벤더 선정에 그대로 쓸 수 있다** — CRS가 보안·프라이버시를 이유로 역할을 분리한 서비스(예: 로그 수집과 로그 분석을 다른 벤더로)를 도입할 때, 그 분리가 계약상으로도 독립적인지 확인할 가치가 있다.

## 연관 자료

- [[2026-09-13-android-vpn-tiny-udp-cannon-ip-leak]] — IP를 숨기려다 실패한 단일 신뢰 지점 사례, 이 글의 "두 지점으로 쪼개 애초에 전체를 못 보게 한다"는 설계와의 대조
- [[2026-10-02-cloudflare-k2-serverless-event-streams]] — Cloudflare가 다른 영역(스트리밍 인프라)에서도 반복하는 "단일 주체 집중을 구조적으로 분산시킨다"는 같은 설계 철학
- [[2026-06-01-how-anthropic-contains-claude]] — "구성요소가 분리돼 있어도 실제 배포·운영 선택이 안전성을 결정한다"는 비슷한 경계심

## 한 달 뒤 회고

*(2026-11-04 즈음 — ①OHTTP Gateway가 비공개 베타에서 공개 베타·GA로 전환됐는지, 가격·지연시간 수치가 공개됐는지. ②실제 도입 사례에서 릴레이와 게이트웨이를 서로 다른 조직이 운영하는 구성이 실제로 얼마나 흔한지. ③`blog.cloudflare.com` 접근이 가능해지면 원문을 직접 읽어 엣지 암호화 처리·키 관리의 구체적 메커니즘을 재검증.)*
