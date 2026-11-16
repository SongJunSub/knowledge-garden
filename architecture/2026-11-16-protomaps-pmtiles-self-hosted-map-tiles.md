---
title: "Protomaps PMTiles — 지도 타일 셀프 호스팅이 저렴하고 쉬워졌다"
source_title: "Protomaps PMTiles self-hosting (GeekNews 발췌 기반, 1차 블로그 미열람)"
source_url: "https://news.hada.io/topic?id=37239"
source_name: "GeekNews (news.hada.io)"
referrer_url: "https://news.hada.io/topic?id=37239"
summarized_at: "2026-11-16"
category: "architecture"
tags: ["지도", "CDN", "셀프호스팅", "스토리지", "PMTiles"]
---
# Protomaps PMTiles — 지도 타일 셀프 호스팅이 저렴하고 쉬워졌다

> 출처: [Protomaps: 지도 타일 셀프 호스팅이 저렴하고 쉬워졌다](https://news.hada.io/topic?id=37239) (GeekNews · hada 차단으로 Slack 발췌 경유) · 정리일 2026-11-16

## 한 줄 요약
**타일서버 없이 단일 파일 + HTTP Range 요청만으로 세계 지도를 월 몇 달러에 돌릴 수 있다.**

## 핵심 포인트
- PMTiles는 전 세계 지도 타일을 ***단일 파일로 묶고*** 클라이언트가 HTTP Range 요청으로 필요한 영역만 읽어가는 포맷 — Range 요청 캐싱을 지원하는 CDN이면 정적 스토리지에 파일 하나만 올려도 배포 끝.
- 별도 타일 서버·DB 없이 Cloudflare R2, 일반 정적 호스팅, GitHub Pages에서도 서빙 가능(WebSearch 교차확인: Protomaps 공식 문서가 Byte-range + CORS 지원 스토리지면 된다고 명시).
- 세계 지도 전체를 일일 빌드로 받거나, CLI로 특정 지역·확대 수준만 추출해 파일을 크게 줄일 수 있음.
- Slack 발췌는 Bunny.net에서 139GB 세계 지도를 5개 지역에 복제했을 때 스토리지 비용이 월 약 5달러라고 전하나, **이 구체 수치(Bunny.net·139GB·5지역)는 WebSearch로 독립 확인하지 못했다.**
- 다른 사례(Pinball Map, NPR)로 교차확인한 수치: 111GB를 S3/R2류에 올렸을 때 스토리지 비용이 월 1.67달러 수준이라는 보고가 있어, "GB당 월 1~2센트대" 라는 수량감은 일치함. 대역폭(전송) 비용은 스토리지와 별도로 발생한다는 점도 공통.

## 인상 깊은 문장
> "지도 로딩당 5MB를 전송하는 예…" (Slack 발췌, 문장이 중간에 끊김 — 원문 전체 미확인)

## 댓글
hada 접속이 이 환경에서 차단되어(getaddrinfo ENOTFOUND) 원문 댓글 수·논조를 확인할 수 없음. HN/Lobsters 등 타 사이트에서의 큐레이션 여부도 확인 못함. WebSearch로 찾은 2차 사례(Pinball Map, NPR, muckrock)는 모두 "PMTiles가 실제로 싸다"는 쪽으로 일치해 과장은 아닌 것으로 보이나, Bunny.net 구체 수치는 이 글만의 주장이라 n=1로 남겨둔다.

## 내 생각 · 적용점
핵심은 "서버를 없애는 게 아니라 **상태를 없앤다**"는 패턴이다. 타일 서버가 원래 하던 일(요청마다 어느 영역을 읽을지 계산)을 HTTP Range 헤더로 클라이언트와 CDN에 넘기면, 그 사이의 애플리케이션 서버 계층 전체가 증발한다. 이건 지도뿐 아니라 "큰 바이너리 파일 + 부분 읽기"가 되는 모든 워크로드(로그 아카이브, 타임시리즈 덤프)에 적용 가능한 일반 원칙. [[2026-10-30-bookorbit-self-hosted-ebook-audiobook-library]]의 "읽은위치를서버가들고있으면기기는창이된다"와는 반대 방향 — 여긴 상태를 서버에서 뺐고 거긴 상태를 서버에 모았다. 두 선택 중 무엇을 상태로 둘지가 셀프호스팅 설계의 진짜 분기점.

## 호스피탈리티 / CRS 적용 포인트
적용 가능성 있음(제한적). CRS/PMS가 호텔·목적지 지도(객실 배치도, 리조트 맵, 주변 POI)를 서빙할 때 보통 Google Maps·Mapbox API 호출로 처리하는데, 정적이고 자주 안 바뀌는 지도(캠퍼스 배치도 등)라면 PMTiles 방식으로 벤더 API 호출 비용과 레이트리밋을 완전히 없앨 수 있다. 다만 실시간 교통·검색 같은 동적 기능은 포기해야 해서, "정적 배치도 뷰어" 같은 좁은 범위에만 들어맞는 원칙.

## 연관 자료
- [[2026-10-30-bookorbit-self-hosted-ebook-audiobook-library]] — 같은 "셀프호스팅으로 벤더 종속 제거" 축, 상태 보관 위치가 반대.
- [[2026-10-15-n100-mini-pc-selfhosting-28-services]] — 셀프호스팅 비용 절감이라는 같은 결의 사례.

## 한 달 뒤 회고
2026-12-16 즈음: Bunny.net 139GB/5지역/$5 수치를 Protomaps 공식 블로그나 Bunny.net 가격표로 직접 재확인할 기회가 있었는지, CRS 쪽에 "정적 지도" 후보가 실제로 있는지 점검.
