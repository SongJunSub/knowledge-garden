---
title: "ChatGPT 공유 링크 하나로 계정을 탈취한 방법(GeekNews) — 미리보기가 읽기전용이 아니었다"
source_title: "ChatGPT 공유 링크 하나로 계정을 탈취한 방법"
source_url: "https://news.hada.io/topic?id=36338"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36338"
published_at: "확인 불가"
summarized_at: "2026-11-01"
category: "ai"
tags: ["chatgpt", "xss", "account-takeover", "shared-link", "csp-bypass", "llm-security"]
---

# ChatGPT 공유 링크 하나로 계정을 탈취한 방법(GeekNews)

> 출처: [ChatGPT 공유 링크 하나로 계정을 탈취한 방법](https://news.hada.io/topic?id=36338) (GeekNews) · 정리일 2026-11-01

> **출처 한계**: news.hada.io는 이 세션에서 egress 차단(getaddrinfo ENOTFOUND)으로 원문 열람이 불가했다. WebSearch로 "ChatGPT shared link account takeover XSS MathLive JSONP"를 검색했지만, **MathLive·YouTube JSONP를 결합한 이번 공격 체인과 정확히 일치하는 1차 보도(연구자 블로그, 발견자명, 패치 시점)를 찾지 못했다.** 가장 가까운 유사 사례는 Imperva의 "XSS Marks the Spot" 연구로, 공유 대화(shared conversation) 기능을 숨겨진 iframe에 띄워 citation 클릭을 same-origin 요청으로 둔갑시켜 XSS를 계정 탈취로 체인업한 건이다 — 다만 그 글은 MathLive·JSONP를 다루지 않아 **동일 사건인지는 확인하지 못했다.** 이 노트는 Slack 발췌를 1차 자료로 쓰고, Imperva 사례는 "공유 기능이 공격 표면이 된다"는 배경 패턴으로만 인용한다.

## 한 줄 요약

**악성 ChatGPT 공유 링크를 열기만 해도(자동 미리보기 버전은 클릭조차 없이) 로그인한 사용자의 권한으로 공격자 코드가 chatgpt.com 출처에서 실행되고, 피해자의 인증된 API로 비공개 대화와 데이터에 접근할 수 있었다 — "미리보기"라는 이름이 읽기전용을 보장하지 않았다.**

## 핵심 포인트

- **클릭 없이도 실행** — 악성 공유 링크를 열면 로그인한 사용자의 권한으로 JavaScript가 실행되는 취약점이 발견됐다. ***자동 미리보기를 이용하는 버전에서는 추가 클릭조차 필요하지 않았다.***
- **수식 렌더러가 신뢰 경계를 뚫은 지점** — 격리된 HTML 미리보기가 보낸 `postMessage`를 수학 라이브러리 **MathLive가 발신자 검증 없이 처리**하면서, 메인 ChatGPT 페이지에 공격자 HTML을 삽입할 수 있었다. 격리(iframe)는 있었지만 그 격리를 넘나드는 메시지에 발신자 확인이 없었던 것이 핵심 결함이다.
- **CSP를 우회한 경로가 교묘하다** — 삽입된 HTML로 샌드박스 없는 프레임을 만들고, ***CSP가 허용 목록에 넣어둔 YouTube의 JSONP 응답을 이용해 `chatgpt.com` 출처에서 코드를 실행했다.*** CSP가 신뢰한 도메인(YouTube) 자체가 우회 경로가 됐다.
- **탈취 범위는 "읽기"를 넘어선다** — 피해자의 인증된 API를 통해 비공개 대화 목록과 메시지에 접근 가능했다는 데서 발췌가 끊기지만, 세션 토큰 없이도 API 호출 권한 자체를 가로챘다는 뜻이다.

## 인상 깊은 문장

*(Slack 발췌가 "피해자의 인증된 API로 비공개 대화 목록과 메…"에서 끊겨, 직접 인용할 완결된 문장이 남아 있지 않다. 원문 접근이 가능해지면 보강한다.)*

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. 이 노트는 **1차 보도(발견자, 패치 시점, CVE)를 특정하지 못한 채 Slack 발췌에만 의존한 낮은 확인 수준**임을 분명히 밝힌다.

## 내 생각 · 적용점

**핵심 전이 1 — "미리보기"·"읽기 전용 뷰"라는 이름이 실제 격리를 보장하지 않는다.** [[2026-10-22-meta-muse-shared-conversations-dns-exposure]]에서 다룬 Meta Muse 사고도 "추측 불가능한 링크"라는 보안 모델의 전제 자체가 깨진 사례였다 — 이번 건은 "격리된 미리보기"라는 전제가 발신자 검증 부재로 깨졌다. ***두 사고 모두, 기능 이름(미리보기·공유 링크)이 암시하는 안전 수준과 실제 구현 사이의 간극이 공격 표면이 됐다.***

**핵심 전이 2 — 신뢰하는 외부 도메인이 CSP 우회 경로가 될 수 있다.** CSP 허용 목록에 YouTube를 넣은 것 자체는 합리적인 결정이었을 것이다. 하지만 그 신뢰가 "YouTube의 JSONP 엔드포인트가 임의 코드 실행 경로로 쓰일 수 있다"는 가능성까지 차단하지는 못했다. 허용 목록 기반 보안은 허용한 각 항목이 가진 모든 하위 기능까지 함께 검토해야 한다는 교훈이다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능하다.** 온다 CRS/호스피탈리티 SaaS에도 "예약 공유 링크", "고객 공유용 견적서·청구서 뷰어" 같은 기능이 있다면 같은 패턴(격리됐다고 믿는 미리보기가 postMessage 등으로 메인 세션과 통신할 때 발신자 검증 누락)을 점검할 가치가 있다. ***공유 기능을 설계할 때 "이 뷰는 읽기 전용"이라는 가정을 코드 레벨에서 실제로 강제하는지(발신자 검증, CSP 허용 목록의 하위 기능까지) 별도로 확인해야 한다.*** 다만 이번 사건의 구체적 공격 벡터(MathLive, YouTube JSONP)는 온다 스택과 직접 겹치지 않아, 원칙 수준의 참고에 가깝다.

## 연관 자료

- [[2026-10-22-meta-muse-shared-conversations-dns-exposure]] — "공유 기능의 안전 전제가 깨졌다"는 같은 축, 공유 링크가 공격 표면이 된 사례
- [[2026-06-01-instagram-meta-ai-account-takeover]] — AI 제품의 기본 가드레일 부재가 계정 탈취로 이어진 같은 계열의 사고
- [[2026-10-31-cursor-marketplace-claude-code-ssh-backdoor]] — "로드/실행되는 순간 이미 침해가 시작된다"는 같은 긴급성

## 한 달 뒤 회고

*(2026-12-01 즈음 — WebSearch로 발견자·CVE·OpenAI 공식 패치 공지가 나왔는지 재확인하고, 공격 체인 서술을 1차 출처로 교정.)*
