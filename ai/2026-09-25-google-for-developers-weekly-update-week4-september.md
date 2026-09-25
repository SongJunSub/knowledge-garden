---
title: "Antigravity SDK 로컬 AI 모델 지원 등 9월 넷째 주 Google for Developers 위클리 업데이트 (Google) — '어떤 에이전트를 쓸지'와 '어디서 돌릴지'를 둘 다 개발자에게 넘기는 주"
source_title: "Antigravity SDK 로컬 AI 모델 지원 등 9월 넷째 주 Google for Developers 위클리 업데이트를 지금 확인하세요!"
source_url: "http://developers-kr.googleblog.com/2026/09/weeklyupdate-week.html"
source_name: "Google for Developers Korea 공식 블로그 · Slack #개발-뉴스-dev-news 경유(TechArticles 봇, GeekNews 아님)"
referrer_url: "http://developers-kr.googleblog.com/2026/09/weeklyupdate-week.html"
published_at: "2026-09 넷째 주 (정확한 게시일 미확인)"
summarized_at: "2026-09-25"
category: "ai"
tags: ["google", "weekly-digest", "antigravity", "on-device-ai", "android-studio", "agent-choice", "android-auto", "dart", "resource"]
---

# Antigravity SDK 로컬 AI 모델 지원 등 9월 넷째 주 Google for Developers 위클리 업데이트

> 출처: [9월 넷째 주 Google for Developers 위클리 업데이트](http://developers-kr.googleblog.com/2026/09/weeklyupdate-week.html) (Google for Developers Korea 공식 블로그) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-09-25
>
> **성격**: 여러 소식을 묶은 **롤업(digest) 글**이다. [[2026-09-18-google-developers-weekly-update-week3-september]]·[[2026-09-12-google-for-developers-weekly-adk-kotlin]]·[[2026-09-04-gemini-weekly-update-sept-week1]]와 같은 시리즈 형식이라, 이 노트도 항목 전부를 균등하게 다루지 않고 확인 가능했던 항목 위주로 정리한다.
>
> **출처 한계**: `developers-kr.googleblog.com`·`developers.googleblog.com` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. Antigravity SDK 로컬 모델 지원은 Google Developers Blog 공식 포스트("Introducing Support for Local AI Models in the Antigravity SDK")와 daily.dev 미러로, Android Studio의 "원하는 AI 에이전트 자유 선택" 기능은 android-developers.googleblog.com의 "Build your way: Use any AI agent of your choice in Android Studio" 포스트(2026년 9월)로 WebSearch를 통해 제목·핵심 내용을 교차 확인했다. 안드로이드 게임의 차량용 디스플레이 확장, 동남아 시장 진출 창구 프로그램, 풀스택 Dart 전환 사례 세 항목은 WebSearch로도 독립된 1차 소스를 특정하지 못해 Slack 발췌 한 줄 수준 이상은 확인하지 못했다.

## 한 줄 요약

**이번 주 롤업의 두 헤드라인은 결이 같다 — ①Antigravity SDK가 Gemma 4·LiteRT와 Ollama/llama.cpp/vLLM 호환 엔드포인트로 기기 내 로컬 AI 모델을 직접 연동하게 했고, ②Android Studio는 개발자가 원하는 AI 에이전트를 자유롭게 골라 통합할 수 있게 했다. "어떤 모델을 쓸지"와 "어디서 실행할지"를 둘 다 벤더가 아니라 개발자가 정하게 하는 방향으로, 같은 주 두 발표가 같은 축("개발자에게 선택권을 넘긴다")에서 움직인다.**

## 핵심 포인트

- **Antigravity SDK, 기기 내 로컬 AI 모델 직접 연동** — `pip install google-antigravity litert-lm`으로 ***Gemma 4(26B)와 LiteRT를 이용해 완전 오프라인 에이전트 워크플로***를 구성할 수 있게 됐다. 클라우드 API 호출 없이 기기에서 추론이 끝나므로 ***토큰 비용이 발생하지 않고, 오프라인 환경에서도 데이터가 외부로 나가지 않는다***는 프라이버시 이점이 핵심 메시지다.
- **로컬뿐 아니라 하이브리드 오케스트레이션도 지원** — Ollama·llama.cpp·vLLM 같은 ***OpenAI 호환 엔드포인트***도 붙일 수 있어, 로컬 모델과 클라우드 모델을 상황에 따라 섞어 쓰는 하이브리드 구성이 가능하다(WebSearch 교차확인, 세부 라우팅 로직은 원문 미확인).
- **Android Studio, "당신이 원하는 AI 에이전트를 쓰라"** — 같은 주 Android Developers Blog는 ***"Build your way: Use any AI agent of your choice in Android Studio"***라는 제목으로, 특정 벤더 에이전트에 묶이지 않고 개발자가 선호하는 AI 에이전트를 골라 Android Studio 개발 환경에 통합할 수 있게 하는 변화를 발표했다(제목·주제만 교차확인, 구체 통합 방식은 원문 미확인).
- **안드로이드 게임의 차량용 디스플레이 확장 + 적응형 개발로 Play 배포 지원** — Slack 발췌 수준. 안드로이드 게임을 차량용(Android Auto/Automotive) 디스플레이로 확장하고, 적응형(adaptive) 레이아웃 개발로 Google Play 배포를 지원한다는 내용이나, 구체 API·대상 기기 범위는 원문 미확인.
- **동남아 시장 진출 창구 프로그램 + 풀스택 Dart 전환 사례** — Slack 발췌 수준. 동남아 시장 진출을 지원하는 프로그램의 현장 소식과, 풀스택 개발에 Dart를 전면 채택한 사례가 함께 언급됐으나 구체 기업명·수치는 원문 미확인.

## 인상 깊은 문장

> "Introducing Support for Local AI Models in the Antigravity SDK" (Google Developers Blog 포스트 제목)

> "Build your way: Use any AI agent of your choice in Android Studio" (Android Developers Blog 포스트 제목)

## 댓글

GeekNews를 거치지 않아 hada 댓글은 없다(Slack TechArticles 봇의 공식 블로그 직링크). HN/Lobsters 큐레이션 여부는 확인하지 못했다. **이해관계**: Google 자사 공식 블로그의 자사 제품(Antigravity, Android Studio) 홍보성 다이제스트이므로, "로컬 모델이 실제로 클라우드 모델 대비 어느 정도 품질을 내는지", "에이전트 자유 선택이 실제로 얼마나 벤더 종속 없이 동작하는지"에 대한 비판적 검증은 원문에도 기대하기 어렵다. 롤업 특성상 다섯 항목 중 뒤의 세 항목(차량용 디스플레이, 동남아 창구 프로그램, Dart 전환)은 이번 세션에서 1차 소스를 찾지 못해 정직하게 얇게 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 롤업의 두 헤드라인은 "개발자에게 선택권을 넘긴다"는 같은 문장의 두 버전이다

Antigravity SDK의 "어떤 모델을 로컬에서 돌릴지 개발자가 고른다"와 Android Studio의 "어떤 에이전트를 쓸지 개발자가 고른다"는 표면적으로 다른 발표지만 구조가 같다 — 플랫폼이 특정 벤더의 모델·에이전트를 강제하지 않고 개방형 표준(OpenAI 호환 엔드포인트, 에이전트 선택 인터페이스)으로 여러 선택지를 흡수하는 흐름이다. [[2026-09-10-desert-ant-labs-local-ai-models]]가 보여준 "클라우드 API 호출을 자체 소형 모델로 대체"하는 실전 사례와, 이번 Antigravity의 "로컬 모델을 기본 지원 경로로 편입"이 같은 방향(온디바이스·저비용 추론의 정상화)을 가리킨다.

### 핵심 전이 2 — 같은 시리즈의 "롤업이 헤드라인을 묻는다"는 패턴이 이번에도 반복된다

[[2026-09-18-google-developers-weekly-update-week3-september]]와 [[2026-08-29-google-developers-weekly-update-week4-august]]가 지적한 것처럼, 롤업 형식은 진짜 신호(이번엔 차량용 디스플레이 확장, 동남아 창구 프로그램, Dart 전환)를 헤드라인 두 개(Antigravity, Android Studio) 뒤로 밀어낸다. 이번에도 뒤 세 항목은 원문 확인이 막혀 이 노트에서도 얇게 남을 수밖에 없었다 — 롤업 노트의 구조적 한계가 매주 같은 방식으로 반복된다는 걸 스스로 재확인한다.

## 호스피탈리티 / CRS 적용 포인트

**Antigravity의 로컬 모델 지원은 CRS 워크로드에 원칙적으로 접점이 있다.** 문의 요약·내부 문서 검색처럼 민감한 고객 데이터를 다루는 기능을 로컬/오프라인 경로로 돌리면 외부 API 호출 없이 비용과 프라이버시 리스크를 동시에 낮출 수 있다는 원칙은 [[2026-09-23-xiaomi-mimo-v2-6-pro-cost-analysis]]에서도 짚은 "자체 호스팅 후보"의 맥락과 같다. 다만 이번 발표는 Antigravity SDK라는 특정 개발 도구 생태계에 종속돼 있어, 온다가 실제로 이 SDK를 채택할 근거는 이 노트만으로는 약하다 — 도입 여부는 별도 평가가 필요하다. Android Studio·차량용 게임 확장·동남아 진출 프로그램·Dart 전환은 CRS 제품과 접점이 없어 참고 수준에 그친다.

## 연관 자료

- [[2026-09-18-google-developers-weekly-update-week3-september]] — 같은 시리즈 전주(9월 셋째 주) 롤업
- [[2026-09-12-google-for-developers-weekly-adk-kotlin]] — 같은 시리즈(9월 둘째 주), "에이전트를 짓는 도구"의 성숙이라는 같은 흐름
- [[2026-09-04-gemini-weekly-update-sept-week1]] — 같은 시리즈(9월 첫째 주)
- [[2026-08-29-google-developers-weekly-update-week4-august]] — "롤업이 헤드라인을 묻는다"는 패턴을 먼저 지적한 노트
- [[2026-09-10-desert-ant-labs-local-ai-models]] — 클라우드 API를 로컬 소형 모델로 대체하는 실전 사례, 이번 Antigravity 로컬 지원과 같은 방향

## 한 달 뒤 회고

*(2026-10-25 즈음 — `developers-kr.googleblog.com` 접근이 풀리면 이번 롤업 원문을 직접 대조해 이 노트의 재구성이 정확했는지 확인. Android Studio "에이전트 자유 선택" 기능이 실제로 Claude Code 등 서드파티 에이전트를 통합하는 사례로 이어졌는지, Antigravity SDK 로컬 모델 지원이 온다 사내 워크플로 평가 후보로 실제 검토됐는지 기록.)*
