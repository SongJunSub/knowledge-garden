---
title: "Wayback Machine, 대량 봇 트래픽 차단 중 정상 사용자도 차단 (Internet Archive) — HTTP 429 오류 문구를 다시 쓴 것뿐인데, 그 자체로 '이 보호조치가 때때로 정상 이용자를 오탐 차단한다'는 자인이다"
source_title: "An Update on Wayback Machine Access"
source_url: "https://blog.archive.org/2026/09/15/an-update-on-wayback-machine-access/"
source_name: "Internet Archive 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33752"
published_at: "2026-09-15"
summarized_at: "2026-09-16"
category: "architecture"
tags: ["레이트리밋", "봇차단", "가용성", "GeekNews"]
---

# Wayback Machine, 대량 봇 트래픽 차단 중 정상 사용자도 차단

> 출처: [An Update on Wayback Machine Access](https://blog.archive.org/2026/09/15/an-update-on-wayback-machine-access/) (Internet Archive) · 정리일 2026-09-16

## 한 줄 요약
**Internet Archive가 대량 자동화 트래픽으로부터 Wayback Machine을 지키기 위한 속도 제한·IP 차단 정책을 유지하면서, 그 정책이 때때로 정상 사용자까지 오탐 차단한다는 사실을 429 오류 메시지를 다시 쓰는 방식으로 스스로 인정했다.**

## 핵심 포인트
- IA는 "Wayback Machine은 사람 독자를 위해 만들어졌다"며 속도 제한·필터링·모니터링으로 남용적 접근을 막고 있다고 명시
- 요청이 속도 제한을 초과하면 ***HTTP 429(Too Many Requests)*** 응답, 1분 이상 429를 무시하고 계속 요청하면 해당 IP를 방화벽 레벨에서 ***1시간 차단***, 위반이 반복될 때마다 ***차단 시간이 2배씩 증가***
- 이번 업데이트의 핵심은 429 에러 메시지 문구를 다시 써서, 이 보호 조치가 ***때때로 실제 정상 사용자를 오탐 차단한다는 점을 IA 스스로 인정***한 것
- 배경 맥락: AI 스크레이핑 우려로 NYT·Guardian·FT·Gannett 계열 등 ***341개 뉴스사이트가 IA 크롤러 최소 1개를 차단***했고(87%가 USA Today Co. 계열), robots.txt를 넘어선 "하드 블록"까지 시행하는 곳도 있음 — 이는 IA가 봇을 막는 것과 반대 방향(출판사가 IA를 막는) 이슈이므로 혼동 주의
- 역사학자·연구자·저널리스트 등 정당한 이용자들이 오탐 차단의 부수 피해를 겪고 있으며, "합법적 아카이빙 vs 악의적 스크레이핑"을 구분할 프레임워크 부재가 논쟁거리로 지적됨

## 인상 깊은 문장
> "the Wayback Machine is built for human readers. We use rate limiting, filtering, and monitoring to prevent abusive access..."

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 크로스포스트됨(item id=49716176, 게시 약 10시간 전)이나 정확한 포인트·댓글 수는 접근 차단으로 미확인. blog.archive.org 원문도 직접 WebFetch는 실패해 WebSearch 스니펫으로 재구성 — IA 자체 공지이므로 "얼마나 많은 정상 사용자가 오탐 차단됐는지"에 대한 정량 수치는 원문에도 없을 가능성이 높다(비공개 지표).

## 내 생각 · 적용점
**[[2026-08-30-ai-crawlers-overwhelm-git-servers]]**가 다룬 kernel.org 사례와 같은 축 — 봇을 막으려는 규칙이 정교해질수록 정상 트래픽과의 경계가 흐려지고, 결국 "완벽한 차단은 없고 오탐률을 얼마나 감내할지의 트레이드오프만 있다"는 결론에 수렴한다. 다른 점은 kernel.org는 ASN 차단 후 주거용 IP로 분산되는 공격자 적응을 다뤘고, 이번 글은 방어 측이 자신의 오탐을 공개적으로 인정했다는 점 — 가용성 설계에서 드문 정직함이다.

## 호스피탈리티 / CRS 적용 포인트
CRS나 예약 API에 레이트리밋을 걸 때, 차단 임계값을 넘긴 요청이 실제로는 정당한 OTA 연동/채널매니저 폴링일 수 있다는 걸 전제하고 오탐 차단 시 명확한 오류 메시지(재시도 시점, 문의 경로)를 제공하는 설계 원칙으로 바로 적용 가능하다.

## 연관 자료
- [[2026-08-30-ai-crawlers-overwhelm-git-servers]] — 같은 "봇 트래픽 방어의 트레이드오프" 문제, 공격자 적응 관점의 거울상
- [[2026-09-15-miridih-external-api-outage-cascade]] — 외부 의존성/접근 제어 정책이 정상 사용자 경험에 전이되는 문제라는 점에서 느슨하게 연결

## 한 달 뒤 회고
2026-10-16 즈음, IA가 오탐 차단을 줄이기 위한 구체적 정책 변경(화이트리스트, CAPTCHA 등)을 발표했는지, 뉴스사이트의 IA 차단 흐름이 확대됐는지 점검.
