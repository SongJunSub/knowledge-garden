---
title: "Foundation Models framework — 온디바이스·클라우드 LLM을 같은 Swift API로(이번 배치 중 신뢰도 최상위, Apple 공식 문서로 직접 교차확인)"
source_title: "Foundation Models framework - 온디바이스와 클라우드 LLM을 통합하는 Swift API"
source_url: "https://news.hada.io/topic?id=37098"
source_name: "GeekNews, 원문 미확인이나 Apple 공식 문서로 핵심 사실 직접 확인"
referrer_url: "https://news.hada.io/topic?id=37098"
published_at: "확인 불가(서버 모델 확장은 iOS 27 베타 단계로 추정)"
summarized_at: "2026-11-14"
category: "ai"
tags: ["apple", "foundation-models", "swift", "on-device-ai", "model-routing", "developer-api"]
---

# Foundation Models framework — 온디바이스·클라우드 LLM을 같은 Swift API로

> 출처: [Foundation Models framework - 온디바이스와 클라우드 LLM을 통합하는 Swift API](https://news.hada.io/topic?id=37098) (GeekNews, 원문 미확인) · 정리일 2026-11-14
>
> **출처 한계**: `news.hada.io` 자체는 차단되어 hada 댓글·원문 발행일은 확인하지 못했다. 다만 핵심 내용은 Apple 공식 개발자 페이지로 직접 교차확인됐다 — 이번 배치 중 신뢰도가 가장 높은 글에 속한다. 단, "Claude·Gemini 등 서버 모델을 같은 Swift API로 연결"하는 확장 기능이 **현재 출시판이 아니라 iOS 27 베타 단계**에 묶여 있다는 제3자 가이드의 기술이 있어, "지금 당장 쓸 수 있는가"는 별도로 확인이 필요하다.

## 한 줄 요약

**Apple의 Foundation Models framework는 온디바이스 Apple Intelligence 모델(약 30억 파라미터, 2비트 양자화)뿐 아니라 Claude·Gemini 같은 서버 모델까지 "같은 Swift API"로 호출할 수 있게 확장됐다는 Slack 발췌는 Apple 공식 개발자 문서로 사실로 확인되지만, 서버 모델 확장 기능 자체는 iOS 27 베타에 한정된다는 시차가 있다.**

## 핵심 포인트

- **같은 Swift API로 온디바이스·클라우드·Claude·Gemini 통합(공식 문서로 확인)** — Apple 공식 개발자 페이지는 "이 프레임워크가 이제 Claude, Gemini 등 서버 모델까지 같은 Swift API로 확장됐으며, 어떤 모델 제공사든 Language Model 프로토콜을 따르는 Swift 패키지를 만들 수 있다"고 명시한다.
- **온디바이스 모델 규모(공식 문서로 확인)** — 약 30억 파라미터, 2비트 양자화된 온디바이스 모델에 직접 접근 가능. iOS/iPadOS/macOS 26과 Apple Intelligence 지원 기기가 필요.
- **텍스트·이미지 동시 입력, Vision OCR·바코드(미확인)** — 프롬프트에 텍스트와 이미지를 함께 넣을 수 있고 Vision의 OCR·바코드 읽기 도구는 기기에서 실행된다는 설명은 Slack 발췌 수준이며 독립 확인하지 못했다.
- **Dynamic Profiles(미확인)** — 대화 기록을 유지한 채 모델·도구·지침을 바꾸는 기능으로, 같은 세션에서 간단한 분석은 온디바이스 모델에, 더 깊은 추론은 클라우드 모델에 맡길 수 있다는 설명은 Slack 발췌가 유일한 근거다. 다만 이 발상 자체는 Apple 공식 문서가 확인한 "온디바이스+서버 모델 통합 API"의 자연스러운 활용법이라 신빙성은 낮지 않다.
- **타이밍 유의점(제3자 가이드로 확인)** — 서버 모델 연동은 iOS 27 베타에서 이미지 입력, 요청 단위 도구 호출 제어와 함께 확장됐다는 설명이 있어, 공식 출시판과 베타판 기능 차이를 구분해야 한다.

## 인상 깊은 문장

> "The Foundation Models framework now extends to server models — like Claude, Gemini, and more — all through the same Swift API, with full support for features like tool calling and guided generation." (Apple 공식 개발자 페이지)

## 댓글

hada 댓글 수는 원문 차단으로 미확인. **정직성 노트**: 이 글은 "원문 미확인" 카테고리이지만, 핵심 주장(같은 API로 온디바이스+서버 모델 통합)이 Apple 공식 1차 자료로 직접 검증된 드문 경우다. 다만 세부 기능(Vision OCR, Dynamic Profiles)은 Slack 발췌 수준에 머문다는 걸 구분해서 다뤄야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — Apple도 "깊은 추론 모델 + 빠른 실행 모델" 자동 분기 대열에 합류.** Dynamic Profiles가 "간단한 분석은 온디바이스, 깊은 추론은 클라우드"로 나눈다는 설명은 [[2026-11-13-google-antigravity-orchestrator-carbon-hydrogen]](Carbon/Hydrogen 자동전환)·[[2026-11-12-kb-securities-context-tier-routing]](Context Tier-Routing)과 완전히 같은 아키텍처 패턴이다. 이제 모델 제공사(Google)·플랫폼 벤더(Apple)·적용사(KB증권) 세 레벨 모두에서 이 패턴이 수렴하고 있다 — 업계 표준 아키텍처로 굳어지는 중이라는 어제 노트의 추정이 한 번 더 강화된다.

**핵심 전이 2 — "모델 중립 API" 전략의 Apple식 버전.** Claude·Gemini를 같은 Swift API로 호출하게 한다는 건, Apple이 Siri나 자사 모델에 개발자를 묶어두지 않고 "어떤 모델을 쓸지는 앱이 고를 수 있게" 설계를 열어준다는 뜻이다. 이는 벤더 종속을 줄이는 방향의 선택이라, 여러 AI 도구를 혼용하는 [[2026-11-12-atuin-threads-agent-session-search]]의 "세션 포터블리티" 문제의식과 궤가 비슷하다 — 플랫폼 레벨에서 모델 중립성을 보장하려는 시도들이 늘고 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 챗봇/에이전트 아키텍처에서 "간단한 FAQ성 문의는 저비용·빠른 모델(온디바이스에 준하는 경량 모델)에, 복잡한 다단계 예약 변경·요금 협상은 고성능 모델에" 자동 분기하는 설계는 Dynamic Profiles와 같은 방향이다. [[2026-11-12-kb-securities-context-tier-routing]]에서 이미 검토한 Tier-Routing 적용 검토에 참고 사례로 추가할 만하다.

## 연관 자료

- [[2026-11-13-google-antigravity-orchestrator-carbon-hydrogen]] — 같은 "빠른/깊은 모델 자동전환" 아키텍처, Google 버전
- [[2026-11-12-kb-securities-context-tier-routing]] — 같은 패턴의 국내 금융권 적용 사례
- [[2026-11-12-atuin-threads-agent-session-search]] — 모델/도구 혼용 시 벤더 종속을 줄이려는 같은 방향의 시도

## 한 달 뒤 회고

*(2026-12-14 즈음 — 서버 모델(Claude·Gemini) 연동이 iOS 27 정식 출시 후에도 유지되는지, Dynamic Profiles가 실제로 출시됐는지 확인.)*
