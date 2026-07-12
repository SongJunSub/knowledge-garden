---
title: "12개 AI 모델로 같은 앱 4개 만들기 — '최신·최고가 플래그십이 자동 정답은 아니다'와 원샷 벤치마크의 한계"
source_title: "GPT-5.6, Grok 4.5, Claude, and Muse Spark build the same 4 apps"
source_url: "https://www.tryai.dev/blog/gpt-5.6-build-off-12-models"
source_name: "tryai.dev"
referrer_url: "https://news.hada.io/topic?id=31342"
published_at: "2026-07-09"
summarized_at: "2026-07-12"
category: "ai"
tags: ["model-selection", "benchmarking", "benchmark-gaming", "open-weight-vs-frontier", "task-model-fit", "one-shot-limitation", "ai-writing-tone"]
---

# 12개 AI 모델로 같은 앱 4개 만들기 — '최신·최고가 플래그십이 자동 정답은 아니다'와 원샷 벤치마크의 한계

> 출처: [GPT-5.6, Grok 4.5, Claude, and Muse Spark build the same 4 apps](https://www.tryai.dev/blog/gpt-5.6-build-off-12-models) (TryAI) · 정리일 2026-07-12

## 한 줄 요약

**12개 AI 모델이 같은 앱 4종(레이캐스터 미로, 3D 루빅스 큐브, 계산기, 콘웨이의 라이프 게임)을 각 5회씩 만든 결과를 비교했다. 복잡한 태스크에서는 GPT-5.6 Sol과 Claude Fable 5가 리더십을 공유했고, 오픈웨이트 모델은 잘 문서화된(학습 데이터가 풍부한) 태스크에서는 경쟁력이 있었다. 저자는 승자를 선언하는 대신 모든 원본 시도를 공개하며 결론짓는다 — "가장 새롭고 비싼 플래그십이 자동 승자는 아니다. 모델 선택은 태스크 복잡도에 맞춰라."**

## 핵심 포인트

- **태스크-모델 적합성** — 레이캐스터(GPT-5.6 Sol 5/5), 루빅스 큐브(Claude Fable 5 단독 5/5), 계산기(Claude Opus 4.8·Fable 모두 5/5), 라이프 게임(오픈소스 Qwen/GLM이 동급).
- **프런티어 vs 오픈웨이트 격차는 "신규성"에서 갈린다** — 진짜 신규·복잡 문제는 프런티어가 압도, 학습 데이터가 풍부한 기성 문제는 오픈소스가 따라붙는다.
- **가성비 대안** — Grok 4.5는 "일부 태스크에서 진짜 Opus급"으로 세컨더리 실행 모델로 쓸 만함. 속도/비용은 GPT-5.6 Luna가 최속.
- **투명성으로서의 원본 공개** — 판정 대신 raw attempt 전부를 공개해 독자가 비용·속도·품질을 직접 판단하게 함(단 프롬프트 미공개는 재현성의 구멍으로 비판).
- **주관성 인정** — "과학적 판정을 내리는 게 아니다"라는 선제적 방어.

## 인상 깊은 문장

> "The frontier still wins the hard tasks, and it is not particularly close on the complex ones."

> "The newest, most expensive flagship is not the automatic winner."

> "The OSS models hold their own... just do not lean on them generally, because the other tasks show they still struggle with the hard stuff."

## 댓글 — GN⁺의 HN 큐레이션(12클러스터) + 원 스레드(87댓글, 14클러스터) 전수 확인

**GeekNews 자체 댓글 1개(= GN⁺의 HN 큐레이션, 12클러스터). 원 스레드(HN item 48865093, 87댓글)를 펼쳐 14개 오피니언 클러스터로 재분류해 확인.**

- **AI 생성 글쓰기 톤 피로(가장 큰 클러스터)** — "정보 덤프일 뿐 어느 문장이 더 중요한지(강약)와 진짜 의견이 없다", "모두가 같은 목소리를 써서 아무리 좋아도 지겹다", Anthropic/Claude의 "honestly" 틱. 반론: "그게 저자의 자연스러운 목소리일 수도."
- **원샷 벤치마크의 한계** — "무작위 앱 원샷 = 실제 SW 엔지니어링과 다르다. 진짜 궁금한 건 기존의 지저분한 코드베이스에서 어려운 문제를 어떻게 푸는가." "기본 앱을 만든 뒤 기능을 하나씩 추가하면 아키텍처·유지보수성을 평가하는 명백한 방법."
- **벤치마크 게이밍** — "GLM은 benchmaxxed되어 수치만큼 최첨단이 아니다." LMArena도 프롬프트 분포에 맞춰 juice 가능(OpenAI 직원 본인이 "우린 juice 안 한다"고 인정하면서도 가능성은 시인).
- **지식 검색 ≠ 추론** — "시각적 벤치마크 성능은 추론력이 아니라 학습 데이터 풍부함을 반영할 수 있다."
- **HN 냉소주의 메타** — 모더레이터(dang)까지 등장해 "이런 disclaimer를 안 달면 최상단 댓글은 늘 'P값 안 냈으니 진짜 과학 아님'이 된다"는 자조.
- 그 외 가격표 오류(저자 수정), 모델명이 진열대 SKU 같다는 유머, 압축→팽창이 아니라 팽창→압축을 벤치마킹해야 한다는 방향 비판 등.

## 내 생각 · 적용점

### 핵심 전이 1 — "최신·최고가가 자동 정답 아니다" = 태스크-모델 적합성 원칙

이 글의 결론은 도구 선택 전반에 전이된다. **기본값으로 프리미엄을 쓰는 게 아니라 태스크 복잡도에 맞춰 "충분히 좋은 최적점"을 찾는 사고** — Grok 4.5를 세컨더리 실행 모델로, 저비용 오픈소스를 기성 문제에. CRS의 기능 구현·벤더 선정에도 오버킬 대신 적합성을 보라는 것. [[2026-06-08-switching-to-open-models]]·[[2026-07-06-ai-margin-collapse-glm-5-2]]와 함께 읽으면 모델 포트폴리오 전략이 잡힌다.

### 핵심 전이 2 — 원샷 벤치마크의 한계 = "데모용 그린필드에 현혹되지 말라"

"무작위 앱 원샷 ≠ 실제 SW 엔지니어링"이라는 지적은 핵심이다. 진짜 가치는 **기존 레거시 위에 기능을 하나씩 얹으며 아키텍처·유지보수성을 평가**하는 것이다. AI 도입 효과 측정 시 화려한 그린필드 데모가 아니라 실제 워크플로 개선을 기준으로 삼아야 한다 — 마침 같은 날 정리한 [[2026-07-12-write-code-like-a-human-will-maintain-it]]의 "유지보수 가능성"과, [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]]의 "측정이 틀리는 법"과 정확히 같은 경고.

### 핵심 전이 3 — 벤치마크 게이밍과 "AI 글쓰기 단일 목소리 피로"

"GLM benchmaxxed", "LMArena도 juice 가능"은 **모든 벤치마크 수치를 측정 대상과 게이밍 인센티브를 의심하며 읽으라는 데이터 리터러시 원칙**이다([[2026-05-17-amazon-token-burning-goodharts-law]]의 굿하트 법칙과 같은 축). 그리고 "LLM 글은 정보 덤프일 뿐 강약·의견이 없다"는 비판은 이 knowledge-garden 작업 자체에 직접 적용된다 — 원문 톤을 그대로 복붙하지 않고 사람의 판단·강약(무엇이 중요한지)을 넣는 것이 큐레이션의 차별점이다([[2026-07-10-llm-burnout]]의 "문체 피로"와 연결).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-12-write-code-like-a-human-will-maintain-it]] — *그린필드가 아니라 레거시 유지보수성이 진짜 기준*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] — *AI 코딩 측정이 틀리는 12가지*
- [[2026-05-17-amazon-token-burning-goodharts-law]] — *지표가 목표가 되면(굿하트) 게이밍된다*
- [[2026-07-06-ai-margin-collapse-glm-5-2]] — *오픈웨이트 모델의 비용 우위와 위치*

## 한 달 뒤 회고
*(2026-08-12 즈음 — CRS/개인 프로젝트에서 모델을 태스크 복잡도에 맞춰 골랐는지(프리미엄 기본값 지양), AI 효과를 그린필드 데모가 아니라 레거시 워크플로 개선으로 측정했는지 기록.)*
