---
title: "United Airlines, AI 에이전트의 여행객 대리 항공편 예약 금지 — 조회는 허용하고 결제 완결은 금지하는 경계선을 긋는다"
source_title: "United is restricting AI agents from booking flights"
source_url: "https://www.engadget.com/2314121/united-is-restricting-ai-agents-from-booking-flights/"
source_name: "Engadget 외 복수 매체"
referrer_url: "https://news.hada.io/topic?id=37014"
published_at: "2026-11-11"
summarized_at: "2026-11-12"
category: "ai"
tags: ["united-airlines", "ai-agent", "agentic-commerce", "travel-industry", "contract-of-carriage", "booking-policy"]
---

# United Airlines, AI 에이전트의 여행객 대리 항공편 예약 금지

> 출처: [United is restricting AI agents from booking flights](https://www.engadget.com/2314121/united-is-restricting-ai-agents-from-booking-flights/) (Engadget 외 복수 매체) · GeekNews(id=37014) 경유 · 정리일 2026-11-12

## 한 줄 요약

**United Airlines가 운송약관을 개정해, 자사 웹·앱은 물론 여행사·메타서치 경유까지 포함해 서드파티 AI 에이전트가 항공편을 대리로 예약·변경·결제하는 것을 전면 금지했다. 요금 조회·비교는 허용하되, 자율적으로 거래를 완결하는 에이전트만 막는다는 경계선이 핵심이다.**

## 핵심 포인트

- United이 운송약관(contract of carriage)을 개정(2026년 11월 11일자)해 ***서드파티 AI 에이전트의 예약·변경·결제 대리 수행을 금지***(신설 Rule 6.J.6), 이런 에이전트가 처리한 예약을 취소할 권리도 명시(Rule 5.H)
- 금지 범위는 United 자사 웹/앱뿐 아니라 ***여행사·메타서치(aggregator) 경유까지 포함***
- 금지 근거: 계정·고객 정보 보안, 그리고 항공 안전 규정 준수 — 예컨대 위탁수하물에 금지물질이 없음을 ***본인이 직접 확인해야 하는 체크인 절차***를 AI가 대리할 수 없다는 점을 예로 든다
- 허용되는 선은 명확하다: ***요금을 조회·비교해 사람이 검토·확인하는 도구는 허용***, 자율적으로 거래를 완결하는 에이전트만 금지
- 집행 한계: 약관에 쓴다고 탐지가 보장되지는 않는다는 지적이 있으나, United은 예약 소스를 식별할 수 있다고 주장. WSJ는 현재 AI 에이전트를 통한 예약 비중이 매우 적다고 보도
- 업계 맥락: 미국 항공사 중 처음으로 명시적 금지를 둔 사례로 보도되며, JPMorgan Chase·Amazon 등 앞서 자사 서비스에서 에이전트를 차단한 흐름과 같은 선상

## 인상 깊은 문장

> (직접 인용 아님, 보도 패러프레이즈) "가격을 보여주고 사람이 확인·승인하는 도구"와 "에이전트가 자율적으로 거래를 완결하는 것" 사이의 경계가 United 정책의 핵심 구분선이다.

## 댓글

원문 미열람으로 hada 댓글 수 확인 못함.

## 내 생각 · 적용점

이 정책의 핵심은 [[2026-09-24-amazon-blocks-meta-muse-agent]](Amazon이 Meta Muse 에이전트를 자사 쇼핑몰에서 차단한 선행 사례)와 같은 "자율 에이전트 커머스를 플랫폼이 막는다"는 패턴이다. 다만 [[2026-09-25-ai-agents-hack-after-blocked-access]](접근이 막히자 스스로 우회·공격을 시도한 에이전트들)를 함께 보면, United의 금지도 결국 "약관 선언"과 "기술적 집행" 사이의 간극이 핵심 과제라는 게 드러난다 — 계약서에 금지 조항을 쓰는 것과 실제로 에이전트 트래픽을 탐지·차단하는 것은 별개의 문제다. [[2026-08-30-cats-txt-llms-txt-geo-fake-standard]](크롤러 접근 표준의 허점)과도 "표준을 선언해도 실제 집행은 기술이 따라와야 한다"는 같은 결이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** 이 글은 이번 배치에서 온다 CRS/B2B 호스피탈리티와 가장 직결된다. "사람이 확인·승인하는 조회 도구"와 "자율적으로 결제까지 끝내는 에이전트"를 구분하는 United의 정책 라인은, CRS의 OTA·메타서치 연동 약관과 향후 "AI 비서가 대신 호텔을 예약하는" 에이전틱 예약 시나리오에 선제적으로 참고할 수 있다. 특히 "AI가 대리할 수 없는 법적 절차"(위탁수하물 확인)라는 구체적 예시처럼, CRS에도 투숙객 본인확인·결제수단 본인인증처럼 에이전트가 대리할 수 없는 지점을 약관에 미리 정의해두는 작업이 지금 바로 시작할 수 있는 실무다.

## 연관 자료

- [[2026-09-24-amazon-blocks-meta-muse-agent]] — 같은 계열, 자율 에이전트 커머스를 막은 선행 사례
- [[2026-09-25-ai-agents-hack-after-blocked-access]] — 차단당한 에이전트의 반응, "선언"과 "집행"의 간극
- [[2026-08-30-cats-txt-llms-txt-geo-fake-standard]] — 크롤러/에이전트 접근 표준의 집행 허점

## 한 달 뒤 회고

*(2026-12-12 즈음 — 다른 항공사·OTA가 유사 정책을 따라갔는지, United의 "에이전트 소스 식별" 기술이 실제로 작동했다는 보도가 나왔는지, 온다 CRS 약관에 에이전트 예약 조항 검토를 시작했는지 확인.)*
