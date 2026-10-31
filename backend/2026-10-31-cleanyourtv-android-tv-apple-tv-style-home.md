---
title: "CleanYourTV, Android TV의 불필요한 앱을 끄고 Apple TV 스타일 홈 화면으로 바꾸는 도구(GeekNews) — 지우지 않고 꺼서 되돌릴 수 있게 만든다"
source_title: "CleanYourTV - Android TV의 불필요한 앱을 끄고 Apple TV 스타일 홈 화면으로 바꾸는 도구"
source_url: "https://news.hada.io/topic?id=36315"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36315"
summarized_at: "2026-10-31"
category: "backend"
tags: ["android-tv", "debloat", "adb", "self-hosting", "ai-agent-automation"]
---

# CleanYourTV, Android TV의 불필요한 앱을 끄고 Apple TV 스타일 홈 화면으로 바꾸는 도구(GeekNews)

> 출처: [CleanYourTV - Android TV의 불필요한 앱을 끄고 Apple TV 스타일 홈 화면으로 바꾸는 도구](https://news.hada.io/topic?id=36315) (GeekNews) · 정리일 2026-10-31

> **출처 한계**: news.hada.io는 egress 차단으로 원문 열람 불가. WebSearch로 원 프로젝트를 찾았다 — GitHub `Gathin23/cleanyourtv`로, cybernews·techcrunch·propakistani 등 여러 매체가 다뤘다. 다만 **스타 수가 보도마다 3.4천, 5.4천, 3.67만으로 크게 달라** 정확한 숫자는 신뢰하지 않는 게 맞다. 이 노트는 Slack 발췌와 WebSearch로 확인한 매체 보도를 함께 사용했다.

## 한 줄 요약

**CleanYourTV는 Android TV·Google TV에서 제조사 광고/텔레메트리 앱을 삭제 대신 비활성화하고 Apple TV 스타일의 간결한 홈 화면을 설치하는 도구로, 코딩 에이전트에 프롬프트를 넘기면 조사부터 복구 스크립트 준비까지 대신 해준다.**

## 핵심 포인트

- **삭제가 아니라 비활성화** — 루팅이나 펌웨어 교체 없이 ADB로 동작하며, ***앱을 삭제하지 않고 사용 중지하는 방식이라 변경 전 상태를 기록하고 복구 스크립트로 되돌릴 수 있다.*** 되돌릴 수 없는 변경을 피한 설계가 핵심이다.
- **Apple TV 스타일의 경량 런처로 교체** — Java로 작성한 약 572KB 런처가 앱 독·목록·HDMI 입력 등을 간결하게 보여준다. (WebSearch 확인) GitHub 저장소는 `Gathin23/cleanyourtv`.
- **AI 코딩 에이전트에게 작업을 위임하는 흐름** — ***제공된 프롬프트를 코딩 에이전트에 전달하면 TV 모델과 설치 앱을 조사하고, 사용자 확인을 거쳐 정리와 런처 설치를 진행한다.*** AI 없이 직접 실행하는 방법도 별도로 제공한다.
- **(WebSearch 확인) 플랫폼별 제약** — Fire TV는 비활성화만 가능하고 서드파티 런처로 홈 화면을 교체할 수 없다(Fire OS 정책). 일부 사용자는 스톡 Google TV 런처를 끌 때 부트루프를 겪어 공식 가이드가 "스톡 런처는 끄지 말 것"을 경고한다.

## 인상 깊은 문장

> "People are using AI to make their smart TVs dumb again." (TechCrunch 기사 제목, WebSearch로 확인)

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. 다만 WebSearch로 cybernews·techcrunch·techno-edge 등 복수 매체의 독립 보도를 확인해, 이 노트는 Slack 단일 발췌보다 확인 수준이 높다.

## 내 생각 · 적용점

**핵심 전이 1 — "되돌릴 수 있는 변경"을 기본값으로 설계하는 습관.** 앱을 지우지 않고 끄는 선택, 변경 전 상태를 기록해 복구 스크립트를 만드는 선택 모두 "실수해도 되돌릴 수 있게 만든다"는 같은 원칙이다. 자동화 스크립트를 짤 때 삭제보다 비활성화를, 일방향 변경보다 기록 가능한 변경을 기본으로 삼을 만하다.

**핵심 전이 2 — AI 에이전트에게 "조사부터 확인까지"를 위임하는 패턴이 일반화되고 있다.** 코딩 에이전트가 TV 모델을 조사하고, 설치된 앱을 분석하고, 사람 확인을 받은 뒤에만 실행하는 흐름은 [[2026-10-31-cursor-marketplace-claude-code-ssh-backdoor]]에서 다룬 "확장이 확인 없이 즉시 실행되는" 위험한 패턴과 정확히 대조된다. ***사용자 확인 단계를 중간에 끼워 넣는 설계가 바로 그 차이를 만든다.***

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** 가정용 Android TV 기기를 다루는 도구라 CRS 운영과 직접 겹치지 않는다. 다만 ***"AI 에이전트에게 조사·실행을 위임하되 실행 직전에 반드시 사용자 확인을 끼워 넣는다"***는 설계 원칙은, 온다가 AI 에이전트로 운영 작업(설정 변경, 배치 작업 등)을 자동화할 때 참고할 수 있는 수준의 원칙으로만 남긴다.

## 연관 자료

- [[2026-10-31-cursor-marketplace-claude-code-ssh-backdoor]] — AI/확장이 확인 없이 즉시 실행될 때의 위험과 정반대되는, "확인 단계를 끼워 넣는" 설계 사례

## 한 달 뒤 회고

*(2026-11-30 즈음 — 프로젝트의 실제 GitHub 스타 수·커뮤니티 반응이 안정화됐는지, Fire TV 등 플랫폼 제약이 바뀌었는지 재확인.)*
