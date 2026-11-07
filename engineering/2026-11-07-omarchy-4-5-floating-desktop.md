---
title: "Omarchy 4.5 - 플로팅 데스크톱, 50개 언어와 Mac 네이티브 설치 지원 (Omarchy/DHH) — 타일링 전용이던 배포판이 '선택 가능한 레이아웃'으로 바뀌며 하이엔드 취향에서 범용 쪽으로 이동한다"
source_title: "Omarchy 4.5 Release Candidate Adds Floating Windows, a Dock, and 50 Languages"
source_url: "https://starryhope.com/linux/omarchy-4-5-whats-new"
source_name: "StarryHope (starryhope.com), GitHub basecamp/omarchy 릴리스 노트 교차확인"
referrer_url: "https://news.hada.io/topic?id=36729"
published_at: "2026-10-20 (RC 기준, starryhope.com 추정)"
summarized_at: "2026-11-07"
category: "engineering"
tags: ["omarchy", "linux", "desktop-environment", "tiling-wm", "floating-mode", "dhh", "basecamp", "macos-native-install", "localization"]
---

# Omarchy 4.5 - 플로팅 데스크톱, 50개 언어와 Mac 네이티브 설치 지원

> 출처: [Omarchy 4.5 Release Candidate Adds Floating Windows, a Dock, and 50 Languages](https://starryhope.com/linux/omarchy-4-5-whats-new) (StarryHope) · GeekNews 경유 · 정리일 2026-11-07

## 한 줄 요약
**타일링 전용 철학을 고수하던 DHH의 Linux 배포판 Omarchy가 4.5에서 작업 공간 단위로 타일링·스크롤링·플로팅을 선택할 수 있는 독(dock)과 플로팅 모드를 더하고, M1~M3/Neo MacBook에 macOS와 공존하는 네이티브 설치 앱, 50개 언어 지원까지 얹으며 "하드코어 타일러용 도구"에서 "일반 사용자도 받아들일 수 있는 배포판"으로 범위를 넓히고 있다.**

## 핵심 포인트
- ***플로팅 모드 + 독 추가***: `Super+L`로 작업 공간을 플로팅으로 전환하면 창을 자유롭게 드래그·겹쳐 배치할 수 있고 화면 하단에 독이 생김. 독 위치(좌/우/상/하)와 자동 숨김은 메뉴 또는 `omarchy dock position`, `omarchy dock autohide` 명령으로 설정
- ***작업 공간별 레이아웃 선택***: 타일링, 스크롤링, 플로팅 방식을 작업 공간마다 따로 지정할 수 있어, 기존 "전역 타일링 강제" 방식에서 벗어남
- ***Mac 네이티브 설치***: M1/M2/M3/Neo MacBook에서 macOS를 지우지 않고 네이티브 설치가 가능한 설치 앱 제공 — USB나 터미널 명령 없이 설치. M4 이후 기종 지원은 아직 개발 중
- ***50개 언어 지원***: 메뉴·데스크톱 다국어화, 설치 단계에서부터 한국어를 포함한 동아시아 입력기 5종과 글꼴을 설정 가능
- ***패키지 설치 방식 변화***: 하나씩 설치하던 방식에서 사전 제작한 시스템(이미지/번들) 방식으로 전환 중 — Slack 발췌가 이 지점에서 절단되어 구체 메커니즘은 확인 불가
- (공식 발표 기준) 2026-10-20 기준 RC1(`4.5.0rc1-1`)이며, 저자 자신이 "최종 릴리스 전 세부사항이 바뀔 수 있다"고 명시 — 아직 정식 릴리스가 아님

## 인상 깊은 문장
> "Super L turns a workspace into floating windows with a dock... Titlebars appear only on floating workspaces." (StarryHope, Omarchy 4.5 RC 가이드 요약)

> "개발자용 Linux 배포판 Omarchy에 창을 자유롭게 겹쳐 배치하는 플로팅 모드와 독이 추가됨." (Slack 발췌)

## 댓글
GeekNews(news.hada.io) 댓글 수는 **이번에도 egress 차단(getaddrinfo ENOTFOUND)으로 확인 불가**. WebSearch로는 StarryHope의 RC 가이드와 GitHub `basecamp/omarchy` 릴리스 이력으로 "플로팅 모드+독+50개 언어"가 2026-10-20 RC1 기준 실존 기능임을 교차확인했지만, **Slack 발췌 본문은 중간에 절단**되어 패키지 설치 방식 변화의 구체 내용, Mac 네이티브 설치 앱의 세부 절차는 원문(hada 토픽)에서만 확인 가능한 상태로 남았다. HN/Lobsters 큐레이션 여부도 미확인.

## 내 생각 · 적용점
### 핵심 전이 1 — "하드코어 전용 도구"가 범용으로 넓어질 때는 항상 선택권을 추가하는 방식을 쓴다
Omarchy는 원래 "타일링을 강제해서 마우스 의존을 끊는다"는 하드코어 철학으로 시작했는데, 이번 업데이트는 그 철학을 지우는 게 아니라 **작업 공간 단위로 선택지를 늘리는 방식**(타일링 그대로 두고 플로팅을 "옵션"으로 추가)으로 범용성을 확보했다. 이 레포의 [[2026-09-13-omarchy-power-grab]]에서 다룬 거버넌스 논쟁(후원 결정권을 한 사람이 쥐는 문제)과는 별개로, 제품 설계 차원에서는 "기존 사용자층을 안 밀어내면서 새 사용자층을 받는" 전형적인 패턴이다.
### 핵심 전이 2 — 로캘라이제이션은 "언어 추가"가 아니라 "설치 단계 입력기/글꼴까지"가 완성형이다
50개 언어 지원 자체보다 "설치 단계부터 한국어 입력기 5종과 글꼴을 설정할 수 있다"는 디테일이 더 중요하다. 메뉴 번역만 하고 입력기 설정을 사용자에게 떠넘기는 로컬라이제이션과, 설치 마법사 안에서 끝내는 로컬라이제이션은 체감 완성도가 다르다.

## 호스피탈리티 / CRS 적용 포인트
적용 멀다 — 데스크톱 OS/윈도우 매니저는 CRS 운영 환경과 직접 접점이 없다. 다만 "기존 사용자층을 유지하며 작업 모드 선택지를 늘린다"는 설계 원칙은, PMS/CRS 화면에서 숙련 사용자용 단축키 중심 UI와 신규 사용자용 마우스 중심 UI를 공존시키는 문제에 참고할 수 있는 정도.

## 연관 자료
- [[2026-09-13-omarchy-power-grab]] — 같은 배포판(Omarchy)의 거버넌스·후원 구조 논쟁, 이 글은 반대로 순수 기능 업데이트라는 점에서 대조
- [[2026-11-02-kwi-kde-terminal-libghostty]] — 같은 시기 Linux 데스크톱 생태계(터미널/WM) 변화 트렌드

## 한 달 뒤 회고
- 2026-12-07 즈음 점검: Omarchy 4.5가 RC를 벗어나 정식 릴리스됐는지, M4 이후 기종 Mac 네이티브 설치 지원이 추가됐는지 확인.
