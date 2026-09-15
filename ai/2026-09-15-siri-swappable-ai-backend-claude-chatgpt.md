---
title: "iOS 27 코드가 드러낸 Siri의 교체 가능성 (pdfu 리버싱, MacRumors 등 보도) — Apple이 자기 AI를 갈아 끼울 부품으로 설계했다는 사실 자체가 '하네스가 모델을 이긴다'는 명제의 소비자 버전이다"
source_title: "Apple's Siri AI Can Be Swapped Out for Claude, ChatGPT, Code Shows"
source_url: "https://www.macrumors.com/2026/09/14/siri-can-be-swapped-out-for-chatgpt-claude/"
source_name: "MacRumors (개발자 pdfu의 iOS 27/macOS Golden Gate 리버싱을 인용 보도)"
referrer_url: "https://news.hada.io/topic?id=33695"
published_at: "2026-09-14"
summarized_at: "2026-09-15"
category: "ai"
tags: ["siri", "apple", "model-delegation", "vendor-swap", "ios27", "app-intents", "harness-vs-model"]
---

# iOS 27 코드가 드러낸 Siri의 교체 가능성 (pdfu 리버싱, MacRumors 등 보도)

> 출처: [Apple's Siri AI Can Be Swapped Out for Claude, ChatGPT, Code Shows](https://www.macrumors.com/2026/09/14/siri-can-be-swapped-out-for-chatgpt-claude/) (MacRumors) · GeekNews(id=33695) 경유 · 정리일 2026-09-15

## 한 줄 요약
**개발자 pdfu가 iOS 27과 macOS Golden Gate의 비공개 프레임워크를 리버싱해, Apple이 Siri의 AI 백엔드를 갈아 끼울 수 있는 두 가지 숨은 경로 — App Intents의 Model Delegation API(확장으로 Claude 등록), Model Manager Services의 추론 제공자 프로토콜(서버 모델 자체를 GPT-5.6 Terra 등으로 교체) — 를 발견했다. 아직 사용자에게는 전혀 노출되지 않았고 Apple도 공식 발표한 적 없는 "숨겨진 배관"이지만, ***Siri를 설계 단계에서부터 모델 교체 가능한 부품으로 만들었다는 사실 자체***가 신호다.**

## 핵심 포인트
- **경로 1 — Model Delegation API(App Intents)** — Claude가 ***Siri Extension으로 등록***되어 Siri의 "Ask…" 메뉴에 나타나고, Apple 내장 ChatGPT 확장과 ***같은 하부 플로우***를 탄다. 자연어 요청을 해석해 다시 Siri에 돌려주면 Siri가 실제 동작(예: 미리 알림 생성)을 수행하는 구조.
- **경로 2 — Model Manager Services의 추론 제공자 프로토콜** — 확장이 아니라 ***Siri AI의 서버 측 모델 자체를 완전히 대체***하는 더 깊은 층위다. GPT-5.6 Terra 같은 모델이 Apple의 ***네이티브 Siri 플래너 프롬프트와 도구 정의***를 그대로 받아, 시스템 동작을 수행하는 도구 호출을 하고 개인 데이터가 담긴 도구 결과까지 받아본 뒤, Siri의 UI·음성으로(인터랙티브 요소 포함) 응답을 돌려줄 수 있다.
- **현재 상태는 "잠긴 문"** — macOS Golden Gate RC 기준 "Ask…" 구현은 ChatGPT만 지원하고, Claude는 사용자에게 노출되는 옵션이 아니다. Apple은 Model Delegation 엔타이틀먼트를 제3자 개발자에게 아직 열지 않았다. ***코드에 경로는 있지만 스위치는 꺼져 있다.***
- **왜 신호인가** — 이런 아키텍처를 짜려면 "플래너 프롬프트·도구 정의·개인 데이터 접근"을 ***모델 비종속적인 계약***으로 먼저 설계해야 한다. Apple이 자기 핵심 어시스턴트를 이 정도로 모델 교체 가능하게 짰다는 것은, 최소한 내부적으로는 "어떤 모델이 뒤에서 도느냐"를 상품의 핵심으로 보지 않는다는 뜻으로 읽힌다.
- **발견은 리버싱이지 발표가 아니다** — Apple이 공식 확인한 로드맵이 아니라, 출시 후보(RC) 빌드에 남아있던 코드 흔적을 개발자가 역공학한 것. 실제로 이 경로가 사용자에게 열릴지, 언제 열릴지는 전혀 확정되지 않았다.

## 인상 깊은 문장
> "iOS 27 and macOS Golden Gate have private hooks that let apps add Siri Extensions and replace Siri AI's server backend with third-party models." (pdfu, X 게시글 — WebSearch로 확인한 게시글 요약 재구성, 원문 트윗 전문은 직접 대조하지 못했다)

## 댓글
이 세션에서 `news.hada.io`(토픽 33695)뿐 아니라 `appleinsider.com`·`9to5mac.com`·`macrumors.com`·`forums.macrumors.com`·`iclarified.com`·`x.com`까지 이 주제를 다룬 주요 매체·1차 소스가 전부 egress 차단됐다. 위 내용은 WebSearch가 반환한 검색 스니펫으로 MacRumors·AppleInsider·9to5Mac·iClarified·PhoneWorld 등 ***5개 이상의 독립 매체 보도가 서로 일치***하는 걸 교차확인해 재구성했고, 원 발견자 pdfu의 X 게시글 두 건도 검색 스니펫으로 문구를 확인했다. 다만 ①hada 댓글 수·논조, ②MacRumors 포럼·9to5Mac 여론조사 반응은 전혀 확인하지 못했고, ③이 발견 자체가 "출시 예정 기능 확인"이 아니라 "리버싱으로 찾은 코드 흔적"이라는 점에서 실제 출시 여부·시점에 대한 불확실성이 원 보도에도 이미 내재해 있다. Apple 공식 입장 발표는 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "하네스가 모델을 이긴다"는 인프라 명제가 소비자 OS 층위에서 실물로 나타났다
[[2026-07-18-state-of-open-source-ai-2026-mozilla]]가 Terminal-Bench 벤치마크로 입증했던 "가중치는 상품 투입이 되고 가치는 조율 계층(플래너·도구 정의·권한)에 있다"는 명제를, 이 발견은 ***Apple이 자기 어시스턴트를 설계하는 방식으로*** 재확인시켜준다. Model Manager Services가 GPT-5.6에게 넘기는 건 "Apple의 네이티브 Siri 플래너 프롬프트와 도구 정의"다 — 즉 Apple이 소유하고 지키는 건 모델이 아니라 ***그 플래너·도구 계약 자체***고, 모델은 그 계약 위에서 갈아 끼우는 부품이다. 오픈소스 AI 리포트가 서버 인프라 벤치마크로 말했던 걸, Siri가 소비자 제품 아키텍처로 그대로 보여준다.

### 핵심 전이 2 — 같은 회사가 "세션 이식성"과 "모델 교체 가능성"을 다르게 다룬다
[[2026-08-02-session-portability-inference-api-lockin]]은 추론 API 제공자들이 암호화된 추론·서버 저장 ID로 세션을 벤더에 묶어두는 락인을 경고했다. 이번 발견은 정반대 방향의 설계다 — Apple은 (적어도 사설 코드 수준에서는) ***모델을 갈아 끼울 수 있게*** 설계해뒀다. 두 노트를 겹치면 락인 여부는 "AI를 쓰느냐"가 아니라 ***"누가 플래너·도구·세션 상태의 계약을 소유하느냐"***에 달려 있다는 게 더 분명해진다 — Apple은 Siri라는 자기 플랫폼에서 그 계약의 주인이라 모델을 자유롭게 스왑할 수 있지만, 그 계약을 못 가진 개발자·최종 사용자는 여전히 벤더에 묶인다.

## 호스피탈리티 / CRS 적용 포인트
CRS에서 AI 기능(예약 어시스턴트·CS 자동응답)을 설계할 때 이 아키텍처가 직접적인 참고가 된다 — ***"플래너 프롬프트·도구 정의·권한 경계"를 모델과 분리된 계약으로 먼저 설계***하면, 이후 Claude·GPT·자체 파인튜닝 모델 사이를 교체해도 통합 로직 전체를 다시 짤 필요가 없다. 반대로 이 계약을 특정 벤더 SDK·API 관례에 암묵적으로 묶어두면, Apple이 피한 바로 그 함정(모델=제품)에 빠진다. 다만 이건 "이렇게 설계하면 좋다"는 원칙 전이지, 이 리버싱 발견 자체가 온다에 실무적으로 즉시 적용될 사안은 아니다.

## 연관 자료
- [[2026-07-18-state-of-open-source-ai-2026-mozilla]] — "하네스가 모델을 이긴다"는 벤치마크 명제의 소비자 제품판
- [[2026-08-02-session-portability-inference-api-lockin]] — 반대 방향(락인)을 다룬 짝, 계약 소유권이 핵심이라는 공통 결론
- [[2026-09-11-apple-watch-siri-recap-privacy]] — 같은 시기 Apple Siri 생태계를 다룬 다른 각도(프라이버시)의 글

## 한 달 뒤 회고
*(2026-10-15 즈음 — WWDC나 iOS 27 정식 출시 발표에서 Model Delegation·Model Manager Services가 실제로 서드파티에 열렸는지, Claude가 사용자 옵션으로 등장했는지 확인. 원문 X 스레드나 MacRumors 접근이 가능해지면 인용을 원문 대조로 교체.)*
