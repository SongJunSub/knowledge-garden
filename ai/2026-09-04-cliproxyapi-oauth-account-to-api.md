---
title: "CLIProxyAPI (router-for-me) — 구독 계정을 API로 바꿔주는 오픈소스 프록시, 그리고 README에 없는 ToS 회색지대"
source_title: "router-for-me/CLIProxyAPI"
source_url: "https://github.com/router-for-me/CLIProxyAPI"
source_name: "GitHub (router-for-me/CLIProxyAPI, MIT)"
referrer_url: "https://news.hada.io/topic?id=33206"
published_at: "2026-09-04"
summarized_at: "2026-09-04"
category: "ai"
tags: ["oauth", "reverse-proxy", "tos-gray-area", "claude-code", "chatgpt-codex", "gemini", "open-source", "vendor-lockin"]
---

# CLIProxyAPI (router-for-me)

> 출처: [router-for-me/CLIProxyAPI](https://github.com/router-for-me/CLIProxyAPI) (GitHub · GeekNews 경유) · 정리일 2026-09-04

## 한 줄 요약

**CLIProxyAPI는 ChatGPT Codex·Claude Code·Gemini·Grok Build·Antigravity 등의 구독 계정 OAuth 로그인을 로컬 프록시에 물려, 별도 API 키 없이 OpenAI/Gemini/Claude/Codex 호환 형식으로 호출할 수 있게 해주는 오픈소스 도구다.** 스타 5만 개를 넘긴 인기 프로젝트지만, 이 도구의 존재 이유 자체가 "구독 요금제를 API 요금제처럼 쓴다"는 각 서비스 이용약관의 회색지대에 걸쳐 있고, README에는 그 리스크에 대한 언급이 전혀 없다.

## 핵심 포인트

- **핵심 기능** — ChatGPT Codex·Claude Code·Gemini·Grok Build·Antigravity의 OAuth 계정을 로컬 프록시에 연결해, 기존 SDK·API 클라이언트·코딩 에이전트가 구독 계정의 모델을 그대로 호출하게 만든다.
- **형식 변환** — OpenAI Responses, Gemini Interactions, Claude Messages 형식으로 들어온 요청을 실제 제공자가 요구하는 형식으로 바꾸고, 응답도 클라이언트 형식에 맞춰 돌려준다. 스트리밍·일반 응답·WebSocket, 도구 호출, 텍스트·이미지 입력을 지원.
- **다중 계정 로드밸런싱** — 여러 계정을 라운드로빈으로 돌려 요금제 한도를 우회하는 기능도 포함.
- **규모** — GitHub 스타 50.3k, 포크 7.7k, 커밋 3,633개, MIT 라이선스.
- **ToS 관련 고지 없음** — README를 확인한 결과 법적 위험이나 약관 준수에 대한 공식 경고·면책 문구가 전혀 없다. "구독 계정을 API로 재판매/노출"하는 행위는 대부분의 AI 서비스 약관에서 금지되거나 최소한 명시적으로 허용되지 않은 영역이다.

## 인상 깊은 문장

> "Wrap Antigravity, ChatGPT Codex, Claude Code, Grok Build as an OpenAI/Gemini/Claude/Codex compatible API service, allowing you to enjoy the free Gemini 3.1 Pro, GPT 5.6 Series, Grok 4.5, Claude model through API" (GitHub 리포지토리 설명)

## 댓글

**출처 한계 명시.** `news.hada.io`가 이 세션에서 egress 차단돼 hada 댓글 수·논조는 확인하지 못했다. GitHub README는 직접 열람해 확인했으며, 별도 HN 스레드 존재 여부는 WebSearch로 특정하지 못했다(검색 결과가 일반 HN FAQ·무관한 스레드로 흩어짐). **가장 중요한 정직성 지점은 이것이다 — 이 프로젝트는 각 AI 서비스의 구독 약관을 우회하는 도구이고, 계정 정지·법적 조치 리스크를 사용자가 전적으로 떠안는데도 README는 이를 경고하지 않는다.** 스타 5만 개라는 인기가 곧 안전함이나 지속가능성을 뜻하지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 배치에서 정리한 Antigravity 서드파티 금지 논란과 정확히 같은 긴장의 양면

[[2026-09-04-google-antigravity-third-party-ban-controversy]]가 다룬 "Google이 Antigravity 계정의 서드파티 도구 사용을 막았다"는 논란은, 바로 이 CLIProxyAPI 같은 도구를 겨냥한 조치로 읽힌다. **한쪽(벤더)은 구독 계정이 API처럼 재판매되는 걸 막으려 하고, 다른 쪽(커뮤니티)은 그 벽을 프록시로 우회하는 도구를 5만 명이 스타 찍을 만큼 원한다.** 이 대립은 한 번 정리되고 끝날 문제가 아니라 반복될 패턴이다 — 벤더가 막으면 우회 도구가 나오고, 우회가 인기를 끌면 벤더가 더 강하게 막는 순환.

### 핵심 전이 2 — 세션·계정 소유권 논쟁의 실전판

[[2026-08-02-session-portability-inference-api-lockin]]은 "추론 API가 세션·상태의 실질적 소유권을 가져가면서 사용자가 다른 모델로 갈아탈 수 없게 만든다"는 락인 구조를 경고했다. CLIProxyAPI는 그 락인에 대한 커뮤니티의 실전 대응이다 — 구독 계정 자체를 표준 API 형식으로 추상화해 벤더 종속을 낮추려는 시도. **다만 이 대응은 락인을 기술적으로는 풀지만 계약적으로는 어긴다** — 문제를 해결하는 게 아니라 다른 종류의 리스크(계정 정지)로 치환한 것에 가깝다.

## 호스피탈리티 / CRS 적용 포인트

**온다 내부에서 이런 도구를 프로덕션에 절대 쓰지 않아야 한다는 원칙만 명확히 하면 된다.** 개인 개발자의 사이드 프로젝트·실험 환경에서는 매력적일 수 있지만, B2B 고객에게 서비스를 제공하는 회사가 벤더 약관을 우회하는 프록시에 의존하면 ①계정 일괄 정지 시 서비스 전체가 멈추는 단일 장애점이 되고 ②고객과의 계약(가용성 SLA)이 벤더와의 계약 위반 위에 서 있는 셈이 된다. **정식 API 키·엔터프라이즈 계약 경로만 사용한다는 원칙**이 이 도구가 주는 유일하게 실질적인 CRS 교훈이다.

## 연관 자료
- [[2026-09-04-google-antigravity-third-party-ban-controversy]] — 이 도구가 우회하려는 바로 그 벽(서드파티 도구 금지)의 반대편 사례
- [[2026-08-02-session-portability-inference-api-lockin]] — 이 도구가 기술적으로 대응하려는 락인 구조의 원 논의

## 한 달 뒤 회고
*(2026-10-04 즈음 — router-for-me/CLIProxyAPI가 벤더로부터 실제 차단 조치(계정 정지 대응, 우회 방지)를 받았는지, Google Antigravity 논란이 이 도구 종류에 대한 업계 차원의 정책 변화로 이어졌는지 확인.)*
