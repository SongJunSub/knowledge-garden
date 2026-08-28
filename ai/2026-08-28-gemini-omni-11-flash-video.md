---
title: "Gemini Omni 1.1 Flash (Google) — '4K 출력 강화'의 실체는 네이티브 생성이 아니라 업스케일이고, 진짜 개선은 360p 초안을 싸게 반복한 뒤에만 비싼 해상도로 확정하는 파이프라인이다"
source_title: "Gemini Omni 1.1 Flash lets you build with more control"
source_url: "https://blog.google/innovation-and-ai/technology/developers-tools/build-with-gemini-omni-1-1-flash/"
source_name: "Google Blog (blog.google)"
referrer_url: "https://news.hada.io/topic?id=32964"
published_at: "2026-08-27"
summarized_at: "2026-08-28"
category: "ai"
tags: ["gemini", "google", "generative-video", "video-generation", "multimodal", "model-release", "pricing"]
---

# Gemini Omni 1.1 Flash (Google) — '4K 출력 강화'의 실체는 업스케일

> 출처: [Gemini Omni 1.1 Flash lets you build with more control](https://blog.google/innovation-and-ai/technology/developers-tools/build-with-gemini-omni-1-1-flash/) (Google Blog · GeekNews 경유) · 정리일 2026-08-28
> **출처 한계**: 이 세션에서 `blog.google`, `ai.google.dev`, `news.hada.io`, `news.ycombinator.com`, `the-decoder.com`, `xenospectrum.com` 등 관련 도메인이 전부 egress 차단돼 공식 문서·hada 댓글·HN 스레드를 직접 열람하지 못했다. 아래 내용은 WebSearch가 반환한 the-decoder, implicator.ai, fonearena, techbriefly, buildfastwithai, artlist 등 제3자 보도의 스니펫을 교차 검증해 재구성한 것이다 — 공식 발표문 원문 인용은 아니다. HN에 별도 스레드(item id 49467922, "Gemini Omni 1.1 Flash")가 존재하는 것은 검색으로 확인했으나 점수·댓글 수는 확인하지 못했다.

## 한 줄 요약

**Google이 2026-08-27 프로덕션용 생성형 영상 모델 Gemini Omni 1.1 Flash를 Gemini API·AI Studio·Gemini Enterprise Agent Platform으로 공개했다. 핵심 개선은 세 가지다 — ① ***장면 연장***: 기존엔 마지막 1초만 참조하던 것을 최대 10초 문맥 분석으로 바꿔, 10초 단위로 누적 최대 40초까지 이어붙인다. ② ***키프레임/참조 제어***: 시작·종료 프레임 지정과 최대 3초 참조 영상으로 카메라 이동·반복 클립·캐릭터 일관성을 만든다. ③ ***해상도-가격 4단계 분리***: 360p($0.03/초)는 720p($0.10/초) 대비 최대 60% 빠르고 비용은 1/3, 위로는 1080p($0.15/초)·4K($0.30/초)가 있다. 다만 여러 매체가 공통으로 짚는 지점은, 이 모델이 ***네이티브로 생성하는 해상도는 최대 720p이고 1080p·4K는 업스케일 결과***라는 것 — 즉 "4K 출력 강화"는 새로운 생성 품질이 아니라 "싸게 반복(360p) → 방향이 정해지면 업스케일(4K)"이라는 워크플로우 개선에 가깝다. Google은 이 모델을 형제 제품 Veo와 역할로 분리한다 — Veo는 최대 1080p 단일 패스 프로덕션용, Omni Flash는 720p대에서 자연어로 재편집하며 빠르게 반복하는 이터레이션용.**

## 핵심 포인트

- **장면 연장 — 1초 참조 → 10초 참조, 최대 40초** — 기존 모델은 이전 클립의 마지막 1초만 보고 이어 그려 연속성이 자주 끊겼다. 1.1 Flash는 최대 10초의 이전 문맥을 분석해 10초 단위로 이어 붙이며 최대 40초까지 확장한다.
- **키프레임·참조 영상 제어** — 시작·종료 프레임을 지정하면 그 사이를 보간해 카메라 오빗·줌 전환·반복(loop) 클립을 만든다. 여기에 ***최대 3초의 외부 참조 영상***을 스타일/캐릭터 레퍼런스로 얹어 시각적 일관성을 유지할 수 있다.
- **해상도 4단계와 초당 과금 — 360p $0.03 · 720p $0.10 · 1080p $0.15 · 4K $0.30** — 360p 초안 모드는 720p 대비 ***시스템 처리량 기준 최대 60% 빠르고 비용은 1/3***이라고 밝혔다(Slack 발췌의 "추정"은 제3자 보도로 확인됨 — 공식 수치).
- **"4K 강화"의 실체는 업스케일** — 복수 매체가 "final assets support native upscaling to 1080p and 4K"라고 짚는다. 즉 모델이 실제로 생성(diffusion/denoise)하는 최대 해상도는 720p이고, 1080p·4K는 그 결과물을 업스케일한 것 — 순수 생성 품질의 도약이라기보다 ***싼 해상도로 여러 번 시도하고, 고른 뒤에만 비싼 해상도로 확정***하는 파이프라인 설계에 가깝다.
- **Veo와의 역할 분리** — "Gemini Omni Flash generates at up to 720p and is built for speed and iteration... while Google Veo is built for production-grade video output at up to 1080p in a single pass." Omni Flash는 자연어로 이미 만든 영상을 재프롬프트 없이 부분 수정할 수 있다는 게 Veo에 없는 차별점으로 소개된다.
- **배포 범위** — Gemini API·Google AI Studio·Gemini Enterprise Agent Platform에 즉시 제공되고, Adobe Firefly 파트너 모델로 통합됐으며 Google Vids에도 탑재됐다. 소비자용은 Google AI Plus/Pro/Ultra 구독자 대상 Google Flow로 순차 확장 중.

## 인상 깊은 문장

> "Gemini Omni 1.1 Flash is our newest multimodal model for video generation and editing. It delivers a new suite of creative capabilities and controls for developers 🎥 With this update you can: 🎬 Extend your scenes 🎯 Specify starting and ending frames of a shot ➕ Add video"
> (Google 공식 X 계정 발표문 — 이번 업데이트를 "품질"이 아니라 "제어(control)" 프레임으로 스스로 규정한 문장.)

> "Gemini Omni Flash generates at up to 720p and is built for speed and iteration... while Google Veo is built for production-grade video output at up to 1080p in a single pass."
> (buildfastwithai.com의 Veo 대비 정리 — Omni Flash와 Veo가 같은 회사 제품군 안에서 "반복용 vs 완성용"으로 명확히 분업돼 있다는 걸 압축한다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단). HN에 별도 스레드(item 49467922)가 존재함은 검색으로 확인했지만, 점수·댓글 수·논지는 이 세션에서 열람하지 못했다.
- **관점상 유의점**: 이번 정리에서 인용한 수치(가격, 처리량 비교, 해상도별 특성)는 전부 Google 공식 발표를 인용·재구성한 제3자 매체 보도이며, 이 세션은 그 어느 것도 원문·독립 벤치마크로 직접 검증하지 못했다. "4K가 업스케일"이라는 지적도 복수 매체가 동일하게 짚고 있어 신뢰도는 있지만, 공식 발표문 원문의 정확한 문구는 이 세션에서 확인하지 못했다. 또한 이는 ***제작사 자체 발표***이고 경쟁 생성형 영상 모델(Sora, Kling, Runway 등)과의 정면 비교는 이 발표 자체엔 없다 — Veo와의 비교도 "제품 라인업 내 역할 분리" 설명이지 품질 우위 주장은 아니다.

## 내 생각 · 적용점

### 핵심 전이 1 — "값싼 초안을 대량으로 뽑게 해준다"는 것과 "그중 뭐가 좋은지 판단할 능력"은 다른 문제다

[[2026-07-18-ai-music-video-arena-fable-vs-sol]]에서 다룬 실험의 결론은 "자율 에이전트가 생성형 영상 클립을 만드는 데는 성공했지만, 어느 클립도 스스로 검증하지 않았고 예산을 2배 줘도 클립 수만 늘 뿐 창의성은 그대로였다"는 것이었다 — ***미적 품질처럼 값싼 평가 함수가 없는 과제에서는 자율성이 '더 많은 평균'만 만든다***는 논지다. 이번 Omni 1.1 Flash의 "360p 초안을 60% 빠르고 1/3 비용으로 대량 생성 → 방향이 정해지면 업스케일"이라는 설계는 정확히 그 논지가 가리키는 인프라를 제공한다 — 즉 "많이 뽑고 사람이 고른다"는 워크플로우를 값싸게 만들어주는 것이지, "무엇이 좋은 영상인가"를 모델이 대신 판단해주는 게 아니다. 두 노트를 나란히 놓으면, 생성형 영상 모델의 발전 방향이 ***평가 문제를 풀기보다 반복 비용을 낮추는 쪽***으로 가고 있다는 게 더 뚜렷해진다.

### 핵심 전이 2 — Google의 "3주 만에 후속" 리듬이 텍스트 Flash 라인을 넘어 영상 라인에서도 반복된다

[[2026-08-14-gemini-3-7-flash]]에서는 Gemini 3.6 Flash 출시 3주 만에 3.7 Flash가 나왔고, 그 발표의 진짜 숫자는 성능이 아니라 "가격 만료일"이었다고 짚었다. 이번 Omni 1.1 Flash 역시 카테고리(텍스트 Flash가 아니라 영상 생성)만 다를 뿐, ***"기존 모델의 한계(마지막 1초만 참조)를 정면으로 인정하고 빠르게 다음 버전을 낸다"는 동일한 반복 리듬***을 보여준다. Google의 출시 속도 자체가 특정 제품 라인에 국한된 전략이 아니라 회사 전체의 패턴이라는 걸 이번 사례가 한 번 더 확인시켜준다.

## 호스피탈리티 / CRS 적용 포인트

- **CRS 제품 코어(예약·재고·요금 엔진)에는 직접 적용점이 없다** — 이건 정직하게 밝혀둔다. 생성형 영상 모델은 예약 로직이나 데이터 파이프라인과는 다른 층위의 도구다.
- **마케팅·콘텐츠 제작 쪽엔 참고 가치가 있다.** 온다가 다루는 숙박 파트너(호텔 등)에게 프로퍼티 쇼케이스 영상·숏폼 소셜 광고 제작을 지원하는 시나리오를 생각하면, "360p로 여러 컨셉을 싸고 빠르게 시도한 뒤 확정본만 업스케일"하는 이번 파이프라인 구조는 [[2026-07-13-short-form-video-b2b-search-and-ai-answers]]에서 다룬 "숏폼 영상이 B2B 검색·AI Overview 노출에 직결된다"는 논지와 맞물린다 — 숙박 파트너가 검색·AI 답변에 노출될 숏폼 영상을 저비용으로 실험할 수 있는 도구가 될 가능성은 있다. 다만 이는 어디까지나 ***콘텐츠 마케팅 도구로서의 참고***이지, 온다 제품 자체에 통합할 기능은 아니다.

## 연관 자료

- [[2026-07-18-ai-music-video-arena-fable-vs-sol]] — 생성형 영상 에이전트의 "자체 평가 부재" 문제를 다룬 선행 노트. 이번 모델의 "값싼 반복" 설계가 그 문제를 우회하는 인프라라는 걸 보여주는 짝.
- [[2026-08-14-gemini-3-7-flash]] — Google Gemini 라인의 "빠른 후속 출시 + 가격 프레임" 패턴을 다룬 노트. 이번 영상 모델도 동일한 반복 리듬의 또 다른 사례.
- [[2026-07-13-short-form-video-b2b-search-and-ai-answers]] — 숏폼 영상과 B2B 검색·AI 답변 노출의 연결을 다룬 노트. CRS 파트너 마케팅 콘텐츠 적용점의 근거.

## 한 달 뒤 회고

*(2026-09-28 즈음 — ① 독립 매체·실사용자의 화질 평가(특히 "4K가 업스케일"이라는 지적에 대한 실측 비교)가 나왔는지, ② Adobe Firefly·Google Vids 통합 이후 실사용 채택 사례가 보이는지, ③ Veo와의 역할 분리(반복용 vs 완성용)가 실제로 사용자들에게 그렇게 받아들여지는지 아니면 화질 격차로 인한 불만이 나오는지, ④ hada·HN 원문 접근이 가능해지면 이 노트의 "확인 불가" 표시를 실제 댓글 논지로 교체.)*
