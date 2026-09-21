---
title: "ChatGPT, 이제 광고 코드를 통해 다른 웹사이트에서 하는 일도 알게 됨 (보안 연구자 발견) — 마케팅 동의를 꺼도 '분석용'으로 분류돼 추적이 계속된다"
source_title: "ChatGPT's __obi cookie follows you to other websites"
source_url: "https://www.notebookcheck.net/ChatGPT-s_obi-cookie-follows-you-to-other-websites.1404436.0.html"
source_name: "Notebookcheck (보안 연구자 Buchodi 조사 인용)"
referrer_url: "https://news.hada.io/topic?id=34025"
published_at: "2026-09월 (정확한 날짜 확인 불가)"
summarized_at: "2026-09-21"
category: "ai"
tags: ["openai", "chatgpt", "ad-tracking", "privacy", "cookie", "cross-site-tracking"]
---

# ChatGPT, 이제 광고 코드를 통해 다른 웹사이트에서 하는 일도 알게 됨

> 출처: [ChatGPT's __obi cookie follows you to other websites](https://www.notebookcheck.net/ChatGPT-s_obi-cookie-follows-you-to-other-websites.1404436.0.html) (Notebookcheck, 보안 연구자 Buchodi 조사 인용) · GeekNews(id=34025) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "해당 쿠키는 분석용으로 분류돼 마케팅 동의…"에서 잘림)와 WebSearch로 확보한 Notebookcheck, daily.dev, 36Kr 등 2차 보도를 교차해 재구성했다. 1차 조사자(Buchodi)의 원 기술 리포트는 직접 확인하지 못했다.

## 한 줄 요약

**OpenAI 광고 코드(`__obi` 쿠키)가 설치된 웹사이트를 방문하면 ChatGPT 계정과 연결된 식별자와 페이지 정보가 OpenAI로 전송되며, 이 쿠키는 "분석용"으로 분류돼 사용자가 광고 추적을 꺼도 계속 작동하는 것으로 확인됐다.**

## 핵심 포인트

- **광고주 사이트 방문만으로 데이터 전송** — OpenAI 광고 코드가 설치된 웹사이트를 방문하면 ***ChatGPT 계정과 연결된 식별자와 페이지 정보가 OpenAI로 전송되는 동작***이 확인됐다. WebSearch로 확인: 로그인하지 않은 상태에서도 익명이지만 안정적인 식별자로 지속 추적이 가능하다.
- **스크립트 로드 시점부터 쿠키 전송, 12개 사이트에서 확인** — 광고 코드가 실행되기 전 스크립트를 불러오는 요청부터 ***`__obi` 쿠키가 전달***되며, 한 기기에서 쇼핑몰과 교육 서비스 등 ***12개 사이트에 걸쳐 같은 값이 전송***됐다. WebSearch로 확인한 구체 사례로는 Chewy, Wayfair, HelloFresh, Coursera 등이 포함된다.
- **민감 정보까지 수집 범위에 포함** — 광고주가 직접 제공한 정보 외에 ***폼 입력값, 페이지 내용과 태그 관리자 데이터에서도 식별 정보를 수집***하며, 방문한 페이지 경로에는 ***질환이나 채무 관련 내용도 포함***됐다.
- **분석용 분류로 동의 회피, WebKit은 예외** — 해당 쿠키는 ***"분석용" 카테고리로 분류돼 있어 사용자가 광고 추적 설정을 꺼도 추적이 계속***되는 것으로 확인됐다(WebSearch로 보강 — 설정에서 광고 추적을 꺼도 데이터 분석 카테고리로 분류돼 있어 차단되지 않는다). 다만 iPhone·iPad의 모든 브라우저는 WebKit 기반이라 서드파티 쿠키를 차단하는 트래킹 방지 기능 때문에 이 메커니즘이 도달하지 못한다.

## 인상 깊은 문장

> "Even if the user does not log in to ChatGPT, OpenAI can still continuously track their behavior on websites installed with advertising pixels through this anonymous but stable identifier."
> (WebSearch로 확보한 2차 보도 취지의 재구성)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: 1차 조사자(보안 연구자 Buchodi)의 원 기술 리포트를 직접 확인하지 못해 방법론(어떻게 12개 사이트를 특정했는지, 데이터 전송을 어떻게 검증했는지)을 검증하지 못했다. "분석용으로 분류돼 동의를 우회한다"는 주장은 OpenAI의 공식 해명 없이 조사자 측 해석일 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 — Apple의 상시 청취 경고, 디스토피아적 감시 노트와 같은 "광고 추적 정상화" 계열

[[2026-09-14-apple-always-listening-warning]](Apple 상시 청취 경고)와 [[2026-09-16-dystopian-surveillance-becoming-reality]](디스토피아적 감시가 현실이 되고 있다)는 이미 "기기 소유자를 보호하는 기술적 안전장치와 상시 청취가 사회적으로 정상화되는 문제는 별개"라는 결론을 내렸다. 이번 ChatGPT `__obi` 쿠키 사례는 같은 패턴이 **AI 챗봇의 광고 비즈니스 모델**에서도 반복됨을 보여준다 — AI 서비스가 광고 수익을 확보하는 과정에서, 사용자가 설정으로 끌 수 있다고 믿는 추적이 실제로는 분류 트릭으로 우회되는 구조적 문제가 플랫폼을 가리지 않고 나타난다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 CRS가 향후 AI 챗봇 기반 고객 응대(예약 상담 등)를 도입할 때, 자사 웹사이트에 AI 벤더의 광고·분석 스크립트를 설치하게 되면 고객의 예약 여정 데이터가 벤더로 흘러갈 수 있다는 리스크를 계약·개인정보 처리방침 검토 시 체크리스트에 추가할 만한 참고 사례다.

## 연관 자료

- [[2026-09-16-dystopian-surveillance-becoming-reality]] — "안전장치와 정상화는 별개"라는 같은 결론의 선행 노트
- [[2026-09-14-apple-always-listening-warning]] — 다른 플랫폼(Apple)에서의 같은 패턴

## 한 달 뒤 회고

*(2026-10-21 즈음 — OpenAI의 공식 해명이나 정책 변경이 있었는지, 1차 조사자의 원 리포트를 확인할 수 있는지 확인.)*
