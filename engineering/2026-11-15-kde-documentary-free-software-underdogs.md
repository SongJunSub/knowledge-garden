---
title: "KDE: The Documentary — Free Software Underdogs (CultRepo) — Qt 라이선스 분쟁이 GNOME을 낳고, KHTML이 오늘의 웹을 낳았다"
source_title: "KDE: The Documentary — The Story of Free Software Underdogs"
source_url: "https://www.youtube.com/watch?v=1Vyzla9mx4g"
source_name: "YouTube, CultRepo (제작)"
referrer_url: "https://news.hada.io/topic?id=37168"
published_at: "2026-10-14 (추정, KDE 30주년 즈음 공개)"
summarized_at: "2026-11-15"
category: "engineering"
tags: ["kde", "linux-desktop", "open-source-history", "qt-licensing", "khtml", "webkit", "documentary", "governance"]
---
# KDE: The Documentary — Free Software Underdogs (CultRepo)

> 출처: [KDE: The Documentary — The Story of Free Software Underdogs](https://www.youtube.com/watch?v=1Vyzla9mx4g) (CultRepo 제작 · YouTube) · 정리일 2026-11-15
>
> **출처 한계**: news.hada.io 이번 세션 egress 차단, 영상 트랜스크립트도 직접 확보하지 못해 WebSearch로 교차확인된 2차 보도(LWN, Tux Machines, PCGamesHardware 등)와 Slack 발췌로 재구성했다. 정확한 공개일은 "KDE 30주년(1996년 설립)" 기념 공개라는 복수 보도의 타이밍(2026년 10월 중순, Plasma 6.8 릴리스와 동시)에서 추정한 값이며, LWN 기사 자체의 날짜는 확인하지 못했다. 다큐 속 정확한 인용문은 확보하지 못해 생략한다.

## 한 줄 요약

**1996년 "쓰기 어려운 Linux를 누구나 쓸 수 있게 만들자"는 학생의 Usenet 글에서 시작한 KDE 30년사는, Qt의 초기 독점 라이선스가 GNOME 분열을 촉발한 사건과 자원봉사자들이 만든 KHTML 엔진이 돌고 돌아 Safari·WebKit·Blink로 오늘의 웹을 떠받치게 된 계보, 그리고 2008년 KDE4 재설계가 남긴 "라벨과 기대치 불일치"의 교훈까지 압축한다.**

## 핵심 포인트

- **기원(1996)** — Matthias Ettrich(당시 튀빙겐대 학생)가 Usenet에 "쓰기 쉬운 Linux 데스크톱이 필요하다"는 글을 올린 것이 KDE의 시작. 이후 소프트웨어를 통한 사용자 통제권·자유를 추구하는 커뮤니티로 성장.
- **Qt 라이선스가 쪼갠 자유 소프트웨어 진영** — Qt 툴킷은 소규모 팀이 완성도 높은 그래픽 환경을 빠르게 만들 기반이었지만, ***초기의 비자유 라이선스가 자유 소프트웨어 진영의 우려를 낳아 GNOME 탄생을 촉발***했다. 갈등은 이후 KDE와 Trolltech이 "KDE Free Qt Foundation"을 세우며 봉합됐다.
- **KHTML → WebKit → Blink 계보** — 1998년 Konqueror 브라우저용으로 시작한 KHTML/KJS 엔진을 ***Apple이 2001~2002년경 포크해 WebKit을 만들었고***, 2013년 Google이 WebKit을 다시 포크해 Blink를 만들었다. 오늘날 대다수 브라우저 엔진이 결국 KDE 자원봉사자들의 작업에서 갈라져 나온 셈.
- **KDE 4.0(2008) 논란** — 릴리스 노트에 "개발자용 릴리스"라고 명시했음에도 다수 사용자가 완성품으로 받아들여 ***버그가 기능보다 많다는 거센 반발***이 일었고, 내부 개발자(Aaron Seigo)마저 "아직 충분히 좋지 않다"며 비판에 가세했다 — 릴리스 매니저 측은 이 서사를 반박했다. 라벨(개발자 릴리스)과 실제 받아들여진 기대치(완성품) 사이의 간극이 핵심 교훈으로 남았다.

## 인상 깊은 문장

> (영상 트랜스크립트·직접 인용문 확보 실패 — 인용 생략. Slack 발췌에도 직접 인용문은 없었다.)

## 댓글

원문(hada) 접근 차단으로 GeekNews 댓글 수는 확인 불가. LWN 등에서 이 다큐를 다뤘다는 보도는 확인했으나 HN/Lobsters 등 별도 큐레이션 존재 여부는 확인하지 못했다. **이 노트는 다큐멘터리 자체(영상)를 1차 확인하지 못한 채 2차 보도로 재구성했다는 한계를 명시한다.**

## 내 생각 · 적용점

Qt 라이선스 분쟁 → GNOME 탄생은 "라이선스 조항 하나가 수십 년짜리 생태계 분기를 만든다"는 사례로, [[2026-09-09-mit-to-eupl-license-switch]]에서 Henri Bergius가 "허용적 라이선스가 결국 대기업에만 유리했다"며 EUPL로 전환한 결정과 같은 축의 반대편 사례다(이쪽은 분열, 저쪽은 뒤늦은 강화). 다만 라이선스를 바꾸거나 강하게 설계해도 실제 집행은 또 다른 문제라는 점은 [[2026-08-27-bambu-lab-agpl-violation]](AGPL 명시했는데도 벤더가 수년째 위반)이 반증해준다 — "좋은 라이선스"와 "집행 가능한 라이선스"는 다른 문제라는 걸 KDE사(史)·Bambu Lab 사례가 양쪽에서 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 다큐 자체는 CRS/호스피탈리티와 무관한 OSS 역사물이다. 다만 전이 가능한 원칙 하나: 핵심 인프라(결제·연동 라이브러리 등)를 오픈소스로 선택할 때, ***그 컴포넌트의 라이선스 조항이 장기적으로 벤더 lock-in이나 생태계 분기를 만들 수 있다는 걸 미리 점검***해야 한다 — KDE/Qt 사례처럼 "지금은 문제없어 보이는 라이선스"가 몇 년 뒤 프로젝트 전체의 방향을 가를 수 있다.

## 연관 자료

- [[2026-09-09-mit-to-eupl-license-switch]] — 라이선스 선택이 생태계 권력관계를 바꾼다는 같은 주제의 최신 사례(계열)
- [[2026-08-27-bambu-lab-agpl-violation]] — "강한 라이선스"도 집행이 안 되면 무력하다는 대조 사례
- [[2026-10-12-problems-with-github]] — 오픈소스 거버넌스·플랫폼 종속을 다루는 같은 engineering 계열

## 한 달 뒤 회고

*(2026-12-15 즈음 — 이 다큐멘터리의 실제 트랜스크립트나 조회수·커뮤니티 반응을 재확인하고, "KDE Free Qt Foundation" 같은 라이선스 분쟁 봉합 구조가 이후에도 유지되는지, Blink/WebKit 분기 이후 KHTML 계보가 실무에 남긴 교훈이 더 있는지 점검.)*
