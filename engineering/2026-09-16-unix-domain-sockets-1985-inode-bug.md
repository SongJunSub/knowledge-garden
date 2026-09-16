---
title: "UNIX 도메인 소켓에 어떻게 낭만을 느끼지 않을 수 있을까? (DEFCON 34) — iOS 크래시를 쫓다가 1985년 4.3BSD 커밋까지 거슬러 올라가는 40년 된 inode 재사용 버그를 찾았다"
source_title: "How can you not be romantic about UNIX domain sockets?"
source_name: "개인 블로그 (원문 URL·저자 미확정, Lobsters 경유 재구성)"
referrer_url: "https://news.hada.io/topic?id=33754"
summarized_at: "2026-09-16"
category: "engineering"
tags: ["커널버그", "DEFCON", "UNIX소켓", "GeekNews"]
---

# UNIX 도메인 소켓에 어떻게 낭만을 느끼지 않을 수 있을까?

> 출처: [How can you not be romantic about UNIX domain sockets?](https://lobste.rs/s/uauns9/how_can_you_not_be_romantic_about_unix) (개인 블로그, Lobsters 경유) · 정리일 2026-09-16

## 한 줄 요약
**iOS 기반 SSH/VM 프로젝트 데모 중 발생한 크래시를 추적하다가, BSD/XNU 커널의 `uipc_sense()` 함수에서 1985년 4.3BSD 커밋까지 거슬러 올라가는 40년 된 inode 재사용 버그를 DEFCON 34에서 발표했다.**

## 핵심 포인트
- 원인은 커널 함수 `uipc_sense()`에서 `unp_ino++`(후위 증가)를 써야 할 자리의 로직 실수 — ***갓 부팅된 시스템에서 최초로 fstat()되는 UNIX 도메인 소켓이 inode 0을 할당받고***, 커널이 이를 "미초기화" 상태로 오인해 다음 호출 시 재할당하면서 inode 불일치가 발생
- 이 결함 로직은 ***1985년 5월 28일 4.3BSD 커밋***에서 UNIX 도메인 소켓용 가짜 inode 번호를 처음 도입하며 생겼고, inode 일관성 로직은 ***1985년 12월 20일 커밋***에서 확정됨
- 같은 결함이 NeXTSTEP, 2001년 최초 XNU 기반 Mac OS X 10.0, 그리고 ***현재의 iOS/macOS까지 40년간 거의 변형 없이 그대로 존속***
- 소켓의 "정체성"이 (device, inode) 쌍으로 정의되는데, Linux 등 다른 커널에서도 rebind 시 inode를 재사용하는 유사 이슈가 관련 GitHub 이슈로 병기됨
- 기기를 재부팅한 뒤 첫 실행에서만 문제가 재현된다는 점이 디버깅을 특히 까다롭게 만든 요인

## 인상 깊은 문장
> "the first UNIX domain socket ever fstat()'d on a freshly booted system gets inode 0"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Lobsters에 크로스포스트됨(lobste.rs/s/uauns9)이나 lobste.rs 자체 접근도 차단되어 정확한 포인트·댓글 수는 미확인. Hacker News 크로스포스트 존재 여부는 검색으로 확정하지 못했다. 원문 URL과 저자명도 특정하지 못해(daily.dev/Lobsters 스니펫으로만 재구성) 이번 노트 중 출처가 가장 불확실한 축에 속한다 — 저자 추정(Matt Oswalt)은 검증되지 않아 표기하지 않았다.

## 내 생각 · 적용점
**[[2026-09-15-e-reader-stripes-eink-waveform-fix]]**와 같은 계열의 이야기다 — 표면적 증상(줄무늬 화면, 앱 크래시)의 원인이 자신이 작성한 코드 층이 아니라 훨씬 아래(전압 파형, 커널 40년 묵은 로직)에 있었다는 것. "재부팅 후 첫 실행에서만 재현"이라는 단서를 끝까지 물고 늘어진 디버깅 태도가 핵심이지, 도구나 기법이 특별한 게 아니다. **[[2026-09-05-jane-street-asic-reverse-engineering-challenge]]**처럼 표준 도구가 안 통할 때 원시적인 방법(로그 대조, 커밋 히스토리 추적)으로 파고드는 자세도 비슷하다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다. 다만 "특정 조건(재부팅 후 첫 실행)에서만 재현되는 버그"라는 패턴은 CRS의 캐시 워밍업·커넥션 풀 초기화 직후에 발생하는 간헐적 오류를 조사할 때, 증상 발생 시점의 시스템 상태(콜드 스타트인지 아닌지)를 먼저 구분해보는 원칙으로 전이 가능하다.

## 연관 자료
- [[2026-09-15-e-reader-stripes-eink-waveform-fix]] — 같은 "문제가 소프트웨어 층이 아니라 훨씬 아래에 있었다"는 디버깅 서사
- [[2026-09-05-jane-street-asic-reverse-engineering-challenge]] — 표준 도구 없이 원시적으로 파고드는 리버싱 태도의 다른 사례

## 한 달 뒤 회고
2026-10-16 즈음, 이 버그의 실제 커널 패치가 Apple/오픈소스 BSD 계열에 반영됐는지, DEFCON 발표 영상·슬라이드가 공개돼 원문 검증이 가능해졌는지 점검.
