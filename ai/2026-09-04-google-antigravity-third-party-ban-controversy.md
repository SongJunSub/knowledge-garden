---
title: "Google Antigravity의 서드파티 사용 금지와 계정 정지 약관 논란 — 'your account' 문구 하나가 'Google 계정 전체 정지'로 읽히면서 터진 OAuth 단속의 파열음"
source_title: "Google Suspends OpenClaw Users from Antigravity AI After OAuth Token Abuse"
source_url: "https://cybersecuritynews.com/google-suspends-openclaw-users/"
source_name: "cybersecuritynews.com (원문 추정, 확인 못함)"
referrer_url: "https://news.hada.io/topic?id=33209"
published_at: "2026-09-04"
summarized_at: "2026-09-04"
category: "ai"
tags: ["google-antigravity", "openclaw", "oauth", "terms-of-service", "account-suspension", "gemini-cli"]
---

# Google Antigravity의 서드파티 사용 금지와 계정 정지 약관 논란

> 출처: GeekNews 정리 (원문 추정: [Google Suspends OpenClaw Users from Antigravity AI After OAuth Token Abuse](https://cybersecuritynews.com/google-suspends-openclaw-users/) 등 복수 매체 보도) · 정리일 2026-09-04

## 한 줄 요약

**Google Antigravity의 이용약관이 OpenClaw 같은 서드파티 도구에서 Antigravity OAuth를 쓰는 것을 위반으로 규정하고 계정을 정지할 수 있다고 명시했는데, 최초 약관 문구가 "your account"로만 적혀 있어 "Google 계정 전체가 정지될 수 있다"는 공포가 커졌다. Antigravity 책임자는 Antigravity 계정만을 뜻한다고 해명했고, 논란 당일 약관을 "Antigravity and/or Gemini CLI accounts"로 수정했다.**

## 핵심 포인트

- **약관의 서드파티 금지 조항** — Antigravity 약관은 OpenClaw 등에서 Antigravity OAuth를 사용하는 행위를 위반으로 규정하고, ***Antigravity와 Gemini CLI 이용을 정지할 수 있다***고 명시했다.
- **모호한 문구가 부른 공포** — 최초 약관에 제재 대상이 단순히 `your account`로만 적혀 있어, ***Google 계정 전체(Gmail·Workspace 포함)가 정지될 수 있다***는 논란이 일었다.
- **해명과 신속한 수정** — Antigravity 책임자는 "Google 계정 전체가 아니라 Antigravity 계정을 뜻한다"고 해명했고, 논란 당일 약관 문구를 `Antigravity and/or Gemini CLI accounts`로 수정했다.
- **배경: 보조금 토큰 남용** — WebSearch로 교차 확인한 배경에 따르면, OpenClaw는 219,000개 이상의 GitHub 스타를 받은 오픈소스 에이전트 도구로, OAuth 플러그인을 통해 Antigravity의 보조금(subsidized) Gemini 토큰에 무단으로 접근해 백엔드 부하를 일으킨 것이 단속의 계기였다. 실제로 유료 AI Pro/Ultra 구독자들이 사전 경고·유예 없이 영구 정지당했고, 일부는 Gmail·Workspace 등 수십 년치 계정 이력까지 함께 잠긴 사례가 보고됐다.

## 인상 깊은 문장

> "최초 약관에는 제재 대상이 단순히 `your account`로 적혀 있어 Google 계정 전체가 정지될 수 있다는 논란이 일어남" (Slack 발췌 요약)

## 댓글

**출처 한계 명시.** `news.hada.io`는 이 세션에서 WebFetch가 egress 프록시에 차단됐다. WebSearch로 이 사건 자체는 cybersecuritynews.com, secure.com, MLQ News, GitHub `google-gemini/gemini-cli` 디스커션 등 ***복수의 독립 매체·커뮤니티가 교차 보도***해 사실관계(OAuth 남용→계정 정지→약관 문구 논란→수정)는 신뢰도 높게 확인했다. 다만 GeekNews가 실제로 어느 원문을 링크했는지는 hada.io 접근 불가로 특정하지 못해, `source_url`은 검색으로 찾은 가장 근접한 보도 하나를 추정으로 표기했다(정확한 원문과 다를 수 있음). GeekNews 댓글 수·HN/Lobsters 큐레이션 여부도 확인 불가. OpenClaw 창작자(Peter Steinberger, 이후 OpenAI 합류)는 이번 단속을 "draconian(가혹하다)"이라 평했다는 점도 함께 기록해둔다 — 을(Google)과 병(OpenClaw 생태계) 양측 다 이해관계자라는 점에서 한쪽 서사만 보지 않도록 주의.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 도구(Antigravity)를 다룬 이전 실무 후기와의 연결

[[2026-07-14-antigravity-ai-qa-agent-review]]는 Antigravity를 QA 에이전트로 실제 써본 실무 후기였다("결함을 발견하는 게 아니라 왜 안 되는지 분석하는 순간 도구가 동료가 된다"). 이번 글은 같은 도구가 ***약관·계정 관리 측면에서 신뢰를 잃은 사건***이라는 점에서, 도구 자체의 능력과 벤더의 신뢰성은 별개 축이라는 대비를 보여준다.

### 핵심 전이 2 — 보조금 토큰의 유사화폐화가 부른 남용, 같은 계열의 반복

[[2026-08-17-ai-credit-resale-token-brokers]]는 "토큰이 유사 화폐가 됐고, 사는 쪽 위험이 가격보다 크다"고 짚었다. 이번 사건은 정확히 그 유사화폐(보조금 토큰)를 ***서드파티 도구로 우회 접근해 대량 소비한 사례***다 — 토큰 경제가 성숙할수록 이런 우회·남용 시도와 벤더의 단속이 반복되는 패턴으로 읽을 수 있다.

### 핵심 전이 3 — 계정 종속이 만드는 락인 리스크의 극단적 사례

[[2026-08-02-session-portability-inference-api-lockin]]은 "내 기기의 대화 기록이 더 이상 내 세션이 아니라, 운영 상태가 나에게 속하지 않은 세션의 부분적 사본"이라며 추론 API 계정 종속의 위험을 짚었다. 이번 사건에서 계정 정지가 Gmail·Workspace까지 볼모로 잡은 사례는 ***그 락인 리스크가 실제로 발현된 극단적 형태***다 — 단일 계정에 여러 서비스를 묶는 구조는 서비스 하나의 약관 위반이 전체를 인질로 잡을 수 있다는 경고다.

## 호스피탈리티 / CRS 적용 포인트

**부분적으로 직접 적용 가능하다.** 온다가 벤더 API·서드파티 도구를 OAuth로 연동할 때(예: PMS-CRS 통합, 결제 게이트웨이 연동), "계정 정지 범위가 서비스 단위인지 조직 전체인지"를 약관에서 명확히 확인해야 한다는 실무 원칙이 이 사건에서 직접 나온다. 특히 B2B로 여러 호텔 고객사의 운영이 걸린 상황에서, 벤더 한쪽의 약관 집행이 온다 전체 서비스를 인질로 잡는 구조는 절대 피해야 한다 — 계약·SLA 검토 시 체크리스트로 남길 만하다.

## 연관 자료
- [[2026-07-14-antigravity-ai-qa-agent-review]] — *같은 도구(Antigravity)의 실무 능력 후기, 이번 신뢰성 논란과 대비*
- [[2026-08-17-ai-credit-resale-token-brokers]] — *토큰의 유사화폐화·남용이라는 같은 배경 구조*
- [[2026-08-02-session-portability-inference-api-lockin]] — *계정 종속 락인 리스크가 실제로 발현된 사례*

## 한 달 뒤 회고
*(2026-10-04 즈음 — news.hada.io 접근이 가능해지면 GeekNews가 실제 링크한 원문·댓글 반응을 확인해 source_url을 보정했는지, Google이 약관 집행 방식을 추가로 완화했는지, 온다의 서드파티 OAuth 연동 계약에 계정 정지 범위 조항을 점검했는지 기록.)*
