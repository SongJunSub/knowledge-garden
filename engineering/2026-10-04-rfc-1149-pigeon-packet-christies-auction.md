---
title: "비둘기가 나른 첫 RFC 1149 패킷, 크리스티 경매에 출품되다 — 만우절 농담으로 쓰인 프로토콜을 실제로 구현해버린 사람들의 흔적이 역사적 유물이 됐다"
source_title: "The first packet sent via RFC1149 avian carrier is up for auction at Christie's"
source_url: "https://news.ycombinator.com/item?id=49932911"
source_name: "Hacker News(id=49932911), 원 경매는 Christie's Online Only"
referrer_url: "https://news.hada.io/topic?id=34692"
published_at: "확인 불가"
summarized_at: "2026-10-04"
category: "engineering"
tags: ["rfc-1149", "ip-over-avian-carriers", "internet-history", "april-fools-rfc", "christies", "bergen-linux-user-group"]
---

# 비둘기가 나른 첫 RFC 1149 패킷, 크리스티 경매에 출품되다

> 출처: [The first packet sent via RFC1149 avian carrier is up for auction at Christie's](https://news.ycombinator.com/item?id=49932911) (Hacker News 토론, 원 출처는 Christie's Online Only 경매 리스팅) · GeekNews(id=34692) 경유 · 정리일 2026-10-04

> **출처 한계**: `news.hada.io`, `christies.com`/`onlineonly.christies.com`, `news.ycombinator.com`, `lobste.rs`, `en.wikipedia.org`, `blug.linux.no`(2001년 실험 당사자인 Bergen Linux User Group의 1차 기록 페이지) 전부 이번 세션 egress 차단으로 직접 열람하지 못했다. 이 노트는 전부 **WebSearch 스니펫의 교차확인**으로 재구성한 것이다 — RFC 1149 자체의 작성자·연도, 2001년 노르웨이 실험의 존재와 대략적 수치(거리·패킷 수·응답 수·지연시간)는 Wikipedia·Teldat 블로그·HN·lobste.rs 제목 등 다수 독립 소스가 일관되게 확인해 신뢰도가 높다. 다만 **경매 로트 번호·추정가·정확한 경매 일자·"41×210mm", "David Waitzman에게 2002년 선물"이라는 세부 사실은 Slack 힌트 외의 독립 소스로 재확인하지 못했다** — 크리스티 사이트를 직접 열 수 없었기 때문이다. 또한 거리 수치에 소스 간 약간의 차이가 있다(Slack 힌트 4.8km vs WebSearch 종합 결과 "5km") — 반올림 차이로 보이지만 어느 쪽이 정확한지 이 세션에서는 확정하지 못했다.

## 한 줄 요약

**1990년 만우절 농담으로 쓰인 RFC 1149("조류 매개체를 통한 IP 데이터그램 전송 표준")를 2001년 노르웨이 Bergen Linux User Group이 실제로 구현해 비둘기 다리에 16진수로 인쇄한 핑 패킷을 묶어 날렸다. 그때 실제로 전송되고 돌아온 패킷 인쇄물 한 점이 2026년 10월 크리스티 온라인 경매에 출품됐다 — 농담으로 쓰인 표준 문서가 25년 뒤 물리적 역사 유물로 거래되는 드문 사례다.**

## 핵심 포인트

- **RFC 1149의 출발은 순수한 농담이었다** — 1990년 4월 1일 David Waitzman이 발표한 이 RFC는 비둘기 같은 날아다니는 매개체로 IP 데이터그램을 전송하는 방법을 기술한 만우절 RFC 시리즈의 하나다. 핵심 사양은 패킷을 16진수로 작은 종이 두루마리에 인쇄해 비둘기 다리 한쪽에 감고 테이프로 고정하는 것.
- **2001년, 노르웨이에서 농담이 현실이 됐다** — Bergen Linux User Group이 이 사양을 문자 그대로 구현해 실제 ICMP 핑 패킷을 비둘기로 날렸다. 한쪽 컴퓨터에서 핑 요청을 인쇄해 비둘기 다리에 묶어 반대편으로 보내고, 도착하면 스캐너로 읽어 되돌리는 방식이었다. Slack 힌트에 따르면 약 4.8km 거리에서 9개를 보내 4개의 응답을 받았다고 하며, WebSearch로 교차확인한 일부 소스는 비슷한 사건을 "5km, 4개 응답, 왕복 지연 약 55분~100분"으로 전한다.
- **경매에 나온 건 바로 그 물리적 패킷** — 크리스티 경매 리스팅은 이 실험에서 실제로 비둘기 다리에 묶여 전송된 IP/ICMP 핑 패킷 인쇄물 한 점을 출품했으며, RFC 1149 저자(David Waitzman)의 서명이 있다고 HN 토론 요약이 전한다. Slack 힌트는 이 종이가 41×210mm 크기에 비둘기 다리에 묶였던 주름이 남아 있고, 실험 이듬해인 2002년 Waitzman에게 선물됐다고 설명한다 — 이 세부는 1차 소스로 대조하지 못한 채 전달만 한다.
- **"장난으로 쓰인 표준 문서"가 실물 경매 유물이 되는 드문 궤적** — 만우절 RFC는 매년 여러 편이 나오지만, 그중 "실제로 구현해 물리적 증거물이 남고, 그 증거물이 수십 년 뒤 경매에 오르는" 사례는 극히 드물다. 농담의 진지한 재현이 쌓이면 그 자체로 역사적 기록물의 지위를 얻을 수 있다는 걸 보여준다.

## 인상 깊은 문장

> "The first packet sent via RFC1149 avian carrier is up for auction at Christie's."
> (Hacker News 토론 제목, WebSearch로 확인)

## 댓글

**hada 댓글 수, HN(id=49932911)의 정확한 포인트·댓글 내용, lobste.rs 토론 모두 egress 차단으로 직접 확인하지 못했다.** 이 노트는 "그런 경매 리스팅이 존재하고 HN·lobste.rs에서 함께 다뤄졌다"는 사실까지만 복수 소스로 확인했을 뿐, 논쟁의 구체적 내용(가격 추정에 대한 반응, 진위 논란 여부 등)은 전달할 근거가 없다. 가벼운 리소스성 글인 만큼 전이도 억지로 늘리지 않는다.

## 내 생각 · 적용점

### 핵심 전이 — 패킷의 "여정"을 추적하면 그 시대 인프라가 보인다는 점은 같지만, 걸린 시간의 자릿수가 완전히 다르다

[[2026-07-13-how-an-ai-token-travels-through-a-data-center]]는 AI 토큰 하나가 데이터센터 안에서 거치는 15개 정거장을 추적하면 그 자체로 인프라 경제학이 드러난다고 짚었다. 이 비둘기 패킷도 똑같이 "하나의 데이터 단위가 거치는 여정을 끝까지 따라가면 그 시대의 기술적 제약이 드러난다"는 틀에 들어맞는다 — 다만 토큰의 여정은 수십 밀리초, 비둘기 패킷의 왕복은 수십 분~한 시간대다. 같은 "경로 추적"이라는 틀로 두 글을 나란히 읽으면, 인프라의 병목이 "메모리 대역폭"에서 "새의 비행 속도"로 바뀌는 것만으로 지연시간이 6자리 수만큼 벌어진다는 게 체감된다 — 억지 연결은 아니고, 그냥 재미로 남겨두는 대비다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 전혀 없다.** 이 글은 인터넷 역사의 농담이 실물 유물이 된 사례일 뿐, CRS/호스피탈리티 도메인으로 전이할 원칙이 없다는 걸 정직하게 밝힌다.

## 연관 자료

- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — 데이터 단위의 "여정"을 끝까지 추적한다는 같은 틀, 걸리는 시간의 자릿수만 극단적으로 다른 가벼운 대비

## 한 달 뒤 회고

*(2026-11-04 즈음 — christies.com 접근이 풀리면 실제 낙찰가·정확한 로트 설명을 원문으로 확인하고, 이 노트의 "확인 불가" 표시들을 교체.)*
