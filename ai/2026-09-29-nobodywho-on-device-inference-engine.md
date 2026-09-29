---
title: "NobodyWho — 앱과 게임에 로컬 AI를 넣는 온디바이스 추론 엔진 — 함수 시그니처만 읽고 도구 호출 문법을 자동 생성한다"
source_title: "NobodyWho: on-device LLM inference engine"
source_url: "https://github.com/nobodywho-ooo/nobodywho"
source_name: "GitHub (nobodywho-ooo), nobodywho.ai"
referrer_url: "https://news.hada.io/topic?id=34463"
published_at: "확인 불가"
summarized_at: "2026-09-29"
category: "ai"
tags: ["on-device-ai", "local-inference", "godot", "tool-calling", "llama-cpp", "rust", "game-ai"]
---

# NobodyWho — 앱과 게임에 로컬 AI를 넣는 온디바이스 추론 엔진

> 출처: [NobodyWho](https://github.com/nobodywho-ooo/nobodywho) (nobodywho-ooo, GitHub·nobodywho.ai) · GeekNews(id=34463) 경유 · 정리일 2026-09-29
>
> **출처 한계**: `news.hada.io`는 이 세션에서 전면 차단, `nobodywho.ai` 공식 사이트도 직접 페치가 egress 차단으로 막혔다. GitHub 저장소 설명·README 스니펫과 WebSearch(HelloGitHub 오픈소스 소개, awesome-local-llms 이슈, Gadget 큐레이션)를 교차해 재구성했다. 정확한 GitHub 스타 수·라이선스 세부조항(EUPL 1.2로 언급되나 재차 확인은 못함)·HN/hada 댓글 반응은 확인하지 못했다.

## 한 줄 요약

**Rust로 짠 온디바이스 LLM 추론 엔진 NobodyWho가 GGUF 모델을 완전 오프라인으로 돌리면서, 함수 시그니처(인자 이름·타입)를 그대로 읽어 도구 호출 문법을 자동 생성하는 타입세이프 tool calling까지 Godot·Flutter·React Native·Swift·Python·Kotlin에 동일하게 제공한다.**

## 핵심 포인트

- **완전 오프라인, API 키 없음** — 모델을 한 번 내려받으면 인터넷 연결이나 API 키 없이 실행되고, 사용자 입력이 ***외부 서버로 전혀 나가지 않는다.*** llama.cpp 위에 Metal/Vulkan 가속을 얹어 Gemma·Qwen·Mistral 등 GGUF 계열 채팅 모델을 구동한다.
- **6개 플랫폼 바인딩을 한 엔진으로** — Python, Kotlin, Swift, React Native/Expo, Flutter, Godot에 퍼스트클래스 바인딩을 제공해, 데스크톱·모바일 앱과 게임에 대화·이미지 이해·음성(STT/TTS/VAD) 기능을 직접 내장할 수 있다.
- **함수 시그니처 → 도구 호출 문법 자동 생성** — 앱의 함수를 AI가 호출할 도구로 연결할 때 ***스키마를 손으로 안 써도 되고***, 인자 이름과 타입을 읽어 구조화된 grammar를 자동 구성해 호출 형식을 강제한다(타입세이프 tool calling).
- **RAG·구조화 출력·스트리밍까지 기본 지원** — 대화형 NPC 대사뿐 아니라 임베딩 검색, 스트리밍 응답, 구조화된 JSON 출력을 한 엔진에서 처리한다.
- **핵심 사용처는 게임 NPC 대사** — Godot Asset Library를 통해 배포되며, "로그인된 API 없이도 게임 속 NPC가 즉석에서 대화한다"는 게임 개발자 대상 픽스가 1차 소구점으로 보인다.

## 인상 깊은 문장

> "NobodyWho is an inference engine that lets you run LLMs locally and efficiently on any device." (GitHub 저장소 설명 그대로 인용)

## 댓글

hada 댓글 수는 페이지 차단으로 확인하지 못했다. WebSearch로는 HelloGitHub 오픈소스 소개 이슈와 awesome-local-llms 큐레이션 리스트에 이름이 오른 정도만 확인했고, HN/Lobsters 자체 토론 스레드가 있었는지는 찾지 못했다(있더라도 hada 큐레이션과 무관하게 독립 발견된 도구일 가능성이 있음). **정직하게 감안할 점**: 오픈소스 프로젝트 소개 성격의 글이라 벤더 유리 편향은 적지만, 성능 수치(추론 속도·메모리 사용량 등)를 직접 검증한 3자 벤치마크는 찾지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 가든의 "로컬 AI" 계열에 게임/앱 임베딩이라는 새 축이 붙는다

이 가든은 [[2026-09-23-dlab-frontier-ai-on-your-hardware]], [[2026-09-21-laya-mac-offline-realtime-decision-ai]], [[2026-08-11-meta-muse-glimmer-30b-local-agentic]], [[2026-05-12-running-local-models-on-m4-24gb]]까지 "내 하드웨어에서 돌리는 AI" 계열을 꾸준히 추적해왔다. 대부분은 데스크톱 워크스테이션이나 서버 환경을 전제했는데, NobodyWho는 ***게임 엔진·모바일 앱에 임베드되는 추론 엔진***이라는 배포 형태 자체가 다르다. "로컬 실행"의 이유도 프라이버시·비용이 아니라 "게임 배포 후 서버 유지비 없이 오프라인으로도 동작해야 한다"는 게임업계 특유의 요구에 가깝다.

### 핵심 전이 2 — tool calling 자동화는 OpenAI의 "라우터 흡수" 논의와 반대 방향

[[2026-09-23-openai-jev-tool-router]]는 OpenAI가 확신도 기반 판단(라우팅)을 LLM 내부로 흡수해 별도 판단 모델의 자리를 줄이는 흐름을 다뤘다. NobodyWho는 반대로 ***"앱 개발자가 스키마를 직접 안 써도 되게" 도구 정의 쪽의 마찰을 줄이는 방향***이라, 같은 "tool calling 마찰 줄이기" 문제를 서로 다른 층(모델 내부 vs 앱 개발자 인터페이스)에서 공략하는 대조가 흥미롭다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 게임이나 소비자 모바일 앱이 아니라 B2B SaaS이고, NobodyWho가 겨냥하는 "오프라인 게임/앱 배포" 시나리오와는 맥락이 다르다. 다만 원칙 하나는 참고할 만하다: 객실 배정·요금 문의처럼 민감한 게스트 데이터를 다루는 기능을 만약 온프레미스/엣지 환경(예: 인터넷이 불안정한 숙소 현장 단말)에 넣어야 한다면, "사용자 입력을 외부로 보내지 않는" 온디바이스 추론이라는 설계 선택지가 있다는 정도의 참고점이다.

## 연관 자료

- [[2026-09-23-dlab-frontier-ai-on-your-hardware]] — "내 하드웨어에서 실행하는 최첨단 AI"라는 같은 로컬 AI 계열
- [[2026-09-21-laya-mac-offline-realtime-decision-ai]] — 오프라인·온디바이스 실시간 판단이라는 같은 문제의식
- [[2026-09-23-openai-jev-tool-router]] — tool calling/라우팅 마찰을 반대 층에서 공략하는 대조 사례

## 한 달 뒤 회고

*(2026-10-29 즈음 — GitHub 스타·커뮤니티 반응이 실제로 늘었는지, Godot 개발자 커뮤니티에서 채택 사례가 나왔는지 확인.)*
