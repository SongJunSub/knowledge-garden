---
title: "Gemini 3.5 Transcribe 등 8월 넷째 주 Google for Developers 위클리 업데이트 — 롤업 글이지만 AAOS SDV의 'deny-by-default' 보안 설계가 눈에 띄는 항목이다"
source_title: "Gemini 3.5 Transcribe 등 8월 넷째 주 Google for Developers 위클리 업데이트를 지금 확인하세요!"
source_url: "http://developers-kr.googleblog.com/2026/08/weeklyupdate-week4.html"
source_name: "Google for Developers Korea Blog"
referrer_url: "http://developers-kr.googleblog.com/2026/08/weeklyupdate-week4.html (Slack #개발-뉴스-dev-news 직공유, GeekNews 아님)"
published_at: "2026-08"
summarized_at: "2026-08-29"
category: "ai"
tags: ["google", "weekly-digest", "gemini", "speech-to-text", "android", "aaos", "flutter", "passkeys", "resource"]
---

# Gemini 3.5 Transcribe 등 8월 넷째 주 Google for Developers 위클리 업데이트

> 출처: [Gemini 3.5 Transcribe 등 8월 넷째 주 Google for Developers 위클리 업데이트](http://developers-kr.googleblog.com/2026/08/weeklyupdate-week4.html) (Google for Developers Korea Blog) · Slack `#개발-뉴스-dev-news` 직공유(GeekNews 아님) · 정리일 2026-08-29
> **성격**: 여러 소식을 묶은 **롤업(digest) 글**이다. 단일 주장을 다루는 글이 아니라 한 주간의 발표를 나열하므로, 이 노트도 항목 전부를 균등하게 다루지 않고 확인 가능했던 1~2개 항목 위주로 깊이 있게, 나머지는 짧게 남긴다.
> **출처 한계**: `developers-kr.googleblog.com` 자체가 이 세션에서 egress 전면 차단이라 원문을 직접 열지 못했다. 아래 내용은 WebSearch로 개별 발표(Gemini 3.5 Transcribe 공식 발표, AAOS SDV 보안 블로그, Android 메모리·패스키 관련 개발자 블로그)를 교차 확인해 재구성한 것이고, **"딥러닝 기반 우주 신호 해독"·"Flutter 데스크톱 창 관리 API"** 두 항목은 대응하는 원문을 특정하지 못해 Slack 발췌 이상의 정보를 확보하지 못했다 — 이 두 항목은 짧게, 정직하게 미확인 상태로 남긴다.

## 한 줄 요약

**Google for Developers 코리아 블로그의 8월 넷째 주 다이제스트로, Gemini 3.5 Transcribe(음성 인식 강화)부터 Android 메모리·보안, AAOS(차량용 Android)의 보안 설계, Flutter 데스크톱 창 관리 API까지 한 주간의 발표를 묶었다.** 이 노트는 그중 이미 이 가든에 별도 전용 노트가 있는 Gemini 3.5 Transcribe는 짧게 링크로 처리하고, **AAOS SDV의 "deny-by-default(기본 거부)" 보안 설계**를 이번 배치에서 상대적으로 더 깊이 다룬다 — 소비자 대상 발표들과 달리 이 항목은 아키텍처 원칙 자체가 명시적이고 검증 가능해서다.

## 핵심 포인트

- **Gemini 3.5 Transcribe (음성-텍스트)** — 이미 [[2026-08-28-gemini-35-transcribe]]에서 전용 노트로 다뤘다. 요지만 재확인: 스트리밍용 `gemini-3.5-transcribe-live`(Live API, 1초 미만 지연)와 녹음용 `gemini-3.5-transcribe`(Interactions API, 화자 구분·타임스탬프) 두 갈래, Artificial Analysis 측정 WER 스트리밍 4.0%/비스트리밍 2.6%, 85개+ 언어 지원. **비교 대상이 여전히 자사 이전 모델(Chirp 3)뿐**이라는 한계도 그 노트에서 이미 짚었다.
- **AAOS SDV — Secure by Design(WebSearch로 원 발표 `android-developers.googleblog.com/2026/08/aaos-sdv-secure-by-design.html` 특정, 본문은 미확인·스니펫 기준)** — 차량용 Android(AAOS)를 소프트웨어 정의 차량(SDV)으로 확장하며, ***가상화 기반 도메인 격리***로 여러 VM을 병렬로 돌리되 공유는 명시적으로만 허용하고 격리를 기본값으로 삼는다. 접근 정책은 ***"deny-by-default"*** — 허용 목록에 없으면 기본적으로 막는다. 실행 코드의 무결성은 하드웨어 기반 실시간 검증으로, 신원 증명은 **DICE(Device Identifier Composition Engine)**로 하드웨어에 뿌리를 둔다. 앱별 격리는 기존 Android의 UID 기반 샌드박스 모델을 그대로 따른다. Renault Trafic e-Tech가 2026년 하반기 양산에 이 플랫폼을 쓴다는 파트너십도 함께 보도됐다(WebSearch 교차확인, 원문 직접 미확인).
- **Android 앱 메모리 최적화·보안 강화(Slack 발췌, 추정 대응 글 `android-developers.googleblog.com/2026/08/app-quality-memory-optimization-secure-onboarding.html`로 보이나 확정 못함)** — 같은 시기 Android 블로그에는 Android 17부터 기기 총 RAM 기준으로 앱 메모리 한도를 강제하고, 초과 시 스택 트레이스 없이 프로세스를 종료한다는 내용, R8 최적화·LeakCanary 통합 등 메모리 누수 탐지 도구 소식이 있었다(WebSearch로 확인한 관련 글, 이번 위클리 업데이트가 정확히 이 글을 가리키는지는 미확정).
- **패스키 로그인 개선(Slack 발췌, 대응 글 추정 미확정)** — 같은 시기 Android 개발자 블로그에 WhatsApp이 10억 사용자 대상으로 패스키 기반 로그인으로 전환한 사례가 소개됐다(WebSearch 확인) — 비밀번호 대신 생체인증·화면 잠금으로 로그인하는 방식이 SMS OTP가 불안정한 지역에서도 안정적으로 동작한다는 것이 요지다. 다만 이 위클리 업데이트가 이 글을 가리키는지는 확정하지 못한다.
- **딥러닝 기반 우주 신호 해독 / Flutter 데스크톱 창 관리 API** — 두 항목 모두 대응하는 원문을 WebSearch로 특정하지 못했다. Slack 발췌 한 줄 이상의 정보가 없어 이 노트는 이 두 항목을 확인 불가로 남긴다 — 다만 Flutter 진영에서는 데스크톱(Windows/macOS/Linux)의 다중 창 지원이 오랫동안 커뮤니티 플러그인(`desktop_multi_window`, `window_manager`) 의존이었고 공식 멀티 윈도우 API가 설계 논의 중이었다는 배경은 WebSearch로 확인했다 — 이번 업데이트가 그 공식화 진행 상황을 가리킬 가능성이 있으나 추정이다.

## 인상 깊은 문장

**원문 인용 없음** — `developers-kr.googleblog.com`을 직접 열지 못해 정확한 문장을 옮길 수 없다. 대신 AAOS SDV 발표를 다룬 WebSearch 스니펫에서 반복 확인된 설계 원칙 하나만 남긴다: **"가상화로 도메인을 격리하고, deny-by-default 접근 정책을 강제한다"** — 허용을 나열하는 게 아니라 차단을 기본값으로 두고 허용을 예외로 만드는 구조.

## 댓글

- **hada 댓글 없음** — GeekNews 경유가 아니라 Slack `#개발-뉴스-dev-news` 봇이 Google Korea 공식 블로그를 직접 공유한 것이라 hada 토픽 자체가 없다.
- **HN/Lobsters 큐레이션 확인 안 됨** — 위클리 다이제스트 성격의 글이라 해외 큐레이션 대상이 되기 어렵고, WebSearch로도 찾지 못했다.
- **롤업 글 특성상 "댓글로 검증할 단일 주장"이 없다** — 개별 항목(특히 Gemini 3.5 Transcribe)의 반응·한계는 각 항목의 전용 노트에서 다루는 게 맞고, 이 노트는 그 항목들을 묶어 보여주는 색인 성격이 강하다.

## 내 생각 · 적용점

이 다이제스트에서 가장 눈에 띄는 건 개별 발표 하나하나가 아니라, **"보안"이 이번 주 Android 생태계 발표 세 갈래(AAOS SDV, 메모리·보안 강화, 패스키)에 공통으로 관통한다는 점**이다. AAOS SDV의 deny-by-default·DICE, 메모리 강제 종료(초과 시 예외 없이 kill), 패스키의 피싱 내성은 형태는 다르지만 전부 **"예외를 허용하지 않는 기본값"**을 설계 축으로 삼는다 — 개발자가 신경 쓰지 않아도 안전한 쪽이 기본이 되도록 만든다는 것. 이건 [[2026-07-23-passkeys-consumer-psychology]]가 패스키를 비판했던 지점과 정확히 대칭적으로 붙는다 — 그 노트는 "기술적으로 옳은 문제(피싱 내성)를 풀었지만 사용자가 정신 모델을 못 세운다"는 UX 실패를 지적했는데, 이번 주 발표들은 여전히 그 UX 문제를 해결했다는 근거 없이 같은 기술적 방향(예외 없는 기본 보안)을 계속 밀어붙이고 있다. **즉 "안전을 기본값으로"라는 설계 원칙 자체는 옳지만, 그 원칙이 소비자에게 실제로 이해 가능한 형태로 도달하는지는 이번 다이제스트로는 확인할 수 없다.**

## 호스피탈리티 / CRS 적용 포인트

이 글은 여러 주제를 다루는 롤업이라 억지로 전부 연결하지 않는다 — **직접 적용은 AAOS SDV·Flutter 데스크톱 항목에는 없다**(온다는 차량용 OS도 데스크톱 앱도 다루지 않는다). 유일하게 원칙 수준의 전이가 있는 항목은 **"deny-by-default" 접근 정책**이다: 온다 CRS의 파트너·직원 권한 체계를 설계할 때 "허용 목록을 계속 추가하는" 방식보다 "기본 차단, 필요한 것만 명시적으로 허용"하는 방향이 구조적으로 더 안전하다는 원칙은 이 가든에서 이미 [[2026-08-26-cilium-ebpf-under-the-hood]]가 Identity 기반 정책으로 다룬 것과 같은 방향이다. Gemini 3.5 Transcribe의 콜센터 적용점은 이미 전용 노트에서 다뤘으므로 여기서 반복하지 않는다.

## 연관 자료
- [[2026-08-28-gemini-35-transcribe]] — 이 다이제스트가 언급한 Gemini 3.5 Transcribe를 별도로 깊게 다룬 전용 노트, 중복 없이 이쪽을 참고.
- [[2026-07-23-passkeys-consumer-psychology]] — "기술적으로 옳지만 사용자 정신 모델을 못 세운다"는 패스키 비판, 이번 주 보안 강화 발표들과 대칭적으로 붙는다.
- [[2026-08-26-cilium-ebpf-under-the-hood]] — "예외를 나열하지 않고 기본값을 차단으로 두는" 같은 설계 원칙이 쿠버네티스 네트워크 정책에서도 반복되는 사례.

## 한 달 뒤 회고 (2026-09-29 즈음)
- `developers-kr.googleblog.com` 접속이 풀렸다면 원문을 직접 읽어 이 노트가 추정으로 연결한 개별 발표(메모리·패스키·Flutter·우주 신호 해독)가 실제로 어떤 글을 가리키는지 확정.
- "딥러닝 기반 우주 신호 해독" 항목의 실체(어떤 프로젝트·어떤 신호인지)를 파악해 이 노트의 확인 불가 상태를 해소.
