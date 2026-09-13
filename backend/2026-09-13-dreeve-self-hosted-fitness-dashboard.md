---
title: "Dreeve (전 Statistics for Strava) — 운동 데이터를 벤더 API에 묶어두지 않고 내 서버에 쌓아 히트맵·리와인드로 돌아보는 셀프 호스팅 대시보드"
source_title: "Dreeve is a self-hosted, open-source dashboard for your sports and fitness data"
source_url: "https://github.com/dreeveapp/dreeve"
source_name: "GitHub (dreeveapp/dreeve, 원저자 Robin Ingelbrecht)"
referrer_url: "https://news.hada.io/topic?id=33606"
summarized_at: "2026-09-13"
category: "backend"
tags: ["self-hosted", "open-source", "strava", "fitness-data", "data-ownership", "docker"]
---

# Dreeve — 운동 데이터를 벤더 API에 묶어두지 않고 내 서버에 쌓는 셀프 호스팅 대시보드

> 출처: [Dreeve is a self-hosted, open-source dashboard for your sports and fitness data](https://github.com/dreeveapp/dreeve) (Robin Ingelbrecht · GitHub) · 정리일 2026-09-13
> **출처 한계**: `news.hada.io`가 이번 세션 내내 egress 차단이라 GeekNews 원문·hada 댓글은 전혀 확인 못했다. Slack 발췌를 기본 자료로 삼고, GitHub 공식 저장소(`dreeveapp/dreeve`)는 WebFetch로 README와 저장소 지표(스타·포크·라이선스)까지 직접 확인했다. 다만 공식 랜딩페이지 `dreeve.app`는 이번 세션에서도 egress 차단으로 열지 못해, 제품 소개 문구는 WebSearch 스니펫으로만 재구성했다. HN/Lobsters에 이 프로젝트(또는 전신 "Statistics for Strava")를 다룬 "Show HN"류 스레드를 WebSearch로 특정하지 못했다 — **크로스포스팅 여부 자체를 확인 못했다.**

## 한 줄 요약

**Dreeve(전 이름 Statistics for Strava)는 달리기·사이클링 등 운동 기록을 Strava 연동이나 FIT/TCX/GPX 파일로 직접 가져와 자신이 운영하는 서버에 쌓아두고, 통계·히트맵·연간 리와인드로 돌아보는 셀프 호스팅 오픈소스 대시보드다.** v5.0.0부터는 Strava 없이도 완전히 독립적으로 동작하게 되면서, "운동 데이터를 제3자에게 넘기지 않는다"는 지향이 이름 교체(Statistics for Strava → Dreeve)와 함께 더 뚜렷해졌다.

## 핵심 포인트

- **데이터 소스** — Strava 계정 연동 + FIT/TCX/GPX 파일 직접 업로드를 모두 지원. v5.0.0부터는 Strava 연동 없이도 완전히 동작(GitHub README에서 직접 확인: "you no longer need Strava to use Dreeve").
- **시각화** — 대시보드 통계·차트, 월간 캘린더로 운동량·추이 확인, 자주 다닌 길 히트맵, 주요 성취 타임라인(마일스톤), 연간 회고 기능 "Rewind"(원문: *"A fun way to look back on your year in motion"*).
- **장비 관리** — 자전차·신발 등 기어별 사용량과 마모(유지보수) 추적.
- **배포/기술** — Docker·Docker Compose로 배포, **AGPL-3.0** 라이선스. PHP + JavaScript 기반(저장소 파일 구조로 확인, 상세 스택 비율까지는 GitHub 웹뷰로 특정 못함). WebFetch 시점 기준 GitHub 스타 약 2.1k, 포크 131개.
- **이름 유래** — "dreeve"는 벨기에 서플란더스(West-Flanders) 방언으로 "양쪽에 나무가 늘어선 시골길"을 뜻함 — 저자의 지역적 배경이 반영된 리브랜딩.
- **정체성 전환의 핵심** — "Statistics for Strava"라는, 한 벤더의 부속물처럼 읽히는 이름에서 "Dreeve"로 바꾸며 Strava 의존을 선택 사항으로 만든 것이 이번 메이저 버전의 실질적 변화다.

## 인상 깊은 문장

> "turns every workout into beautiful charts, deep insights and stats ... without handing anything over to a third party."
> (제품 소개 문구로 WebSearch 스니펫에서 확인 — `dreeve.app` 접근이 차단돼 원문 페이지에서 직접 대조하지는 못했다.)

> "A dreeve is the West-Flemish word for a country road lined with trees on both sides."
> (GitHub README에서 WebFetch로 직접 확인.)

## 댓글

- **hada 댓글 수·논지 확인 불가** — `news.hada.io` 전면 차단.
- **HN/Lobsters 크로스포스팅 여부 확인 안 됨** — WebSearch로 "Show HN" 계열 스레드를 여러 조합으로 검색했으나 이 프로젝트(Dreeve/Statistics for Strava)를 특정해 다룬 게시물을 찾지 못했다. 있는데 검색으로 못 찾았을 가능성과, 실제로 없을 가능성 둘 다 남는다 — 어느 쪽인지 이번 세션에서는 판단할 근거가 없다.
- 리소스/도구 소개 글 특성상 원 GeekNews 댓글에 실렸을 법한 실사용 피드백(설치 난이도, 요금제 없는 완전 무료 운영의 지속가능성, 유사 대체 서비스 비교 등)을 이번 정리에는 전혀 반영하지 못했다는 한계를 정직하게 남긴다.

## 내 생각 · 적용점

가벼운 도구 소개 글이라 억지로 여러 갈래를 엮지 않는다. 그래도 실제로 있는 연결 하나는 [[2026-08-27-wsrv-nl-free-image-cdn]]과의 대구다 — wsrv.nl은 "이해 상충을 피하려 후원조차 받지 않는다"는 운영 철학으로 무료 인프라를 지속했고, Dreeve는 "운동 데이터를 제3자에게 넘기지 않는다"는 지향으로 애초에 Strava 의존 자체를 선택 사항으로 만들었다. 둘 다 "벤더가 데이터·서비스를 쥐고 있을 때 생기는 위험(요금 정책 변경, 서비스 종료, 데이터 소유권 불명확)"에 대해 **"내가 직접 호스팅한다"**는 같은 방향의 답을 내놓은 사례로 나란히 둘 만하다. 다만 두 프로젝트가 실제로 연결된다는 근거는 없고, 같은 시기 이 가든에 쌓인 "셀프 호스팅형 대안" 흐름의 평행 사례로만 놓는다 — 그 이상 엮으면 억지다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 개인 운동 데이터를 자체 호스팅하는 소비자용 도구를 B2B 호스피탈리티/CRS 제품에 그대로 옮길 지점은 없다. 다만 "핵심 데이터(운동 기록)를 원본 벤더(Strava) API 응답에만 묶어두지 않고 표준 파일 포맷(FIT/TCX/GPX)으로도 받아 자체 저장소에 두면 벤더 의존을 낮추고 이력을 길게 보존할 수 있다"는 설계 원칙 정도는 참고할 만하다 — 예약·재고 데이터를 OTA나 PMS 벤더 API 응답 형태에만 의존하지 않고 표준화된 형태로 자체 보관하는 것과 결이 비슷하다.

## 연관 자료

- [[2026-08-27-wsrv-nl-free-image-cdn]] — "벤더 의존 대신 셀프 호스팅으로 데이터·서비스를 직접 쥔다"는 같은 방향의 원칙을, 이미지 CDN이라는 다른 도메인에서 구현한 사례(가볍게 연결).
- 그 외 직접적으로 연결되는 노트는 찾지 못했다 — `backend/` 폴더에 "셀프호스팅"·"오픈소스 대시보드" 키워드로 Grep한 결과 위 wsrv.nl 노트 외에는 실질적으로 겹치는 글이 없었다.

## 한 달 뒤 회고

*(2026-10-13 즈음 — ①`dreeve.app` 접근이 가능해지면 제품 소개 문구·요금 정책(완전 무료인지, 호스팅형 유료 옵션이 있는지)을 원문으로 확정, ②HN/Lobsters 크로스포스팅 여부를 재검색으로 확인, ③GitHub 스타·포크 수 변화로 리브랜딩 이후 채택 추이 점검.)*
