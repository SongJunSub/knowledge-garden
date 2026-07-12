---
title: "사람이 유지보수할 것처럼 코드를 작성하라 — LLM은 진공에서 코드를 쓰지 않고 '당신의 코드베이스를 읽는다'"
source_title: "Write code like a human will maintain it"
source_url: "https://unstack.io/write-code-like-a-human-will-maintain-it"
source_name: "unstack.io"
referrer_url: "https://news.hada.io/topic?id=31307"
published_at: "2026-07-10"
summarized_at: "2026-07-12"
category: "engineering"
tags: ["maintainability", "llm-coding", "technical-debt", "code-review", "self-reinforcing-loop", "code-smell", "ai-discipline"]
---

# 사람이 유지보수할 것처럼 코드를 작성하라 — LLM은 진공에서 코드를 쓰지 않고 '당신의 코드베이스를 읽는다'

> 출처: [Write code like a human will maintain it](https://unstack.io/write-code-like-a-human-will-maintain-it) (Scott Robinson) · 정리일 2026-07-12

## 한 줄 요약

**LLM을 "유지보수 불가능한 코드를 써도 되는 핑계"로 삼으면 안 된다. 개발자가 지름길과 코드 스멜을 저장소에 병합하면 LLM이 그 패턴을 흡수해 다음 세대 코드에서 영속화한다. 유지보수를 AI에 외주 주는 것처럼 보이지만, 실제로는 AI를 점점 더 나쁜 습관으로 "훈련"시키는 자기강화 루프를 만들고 나중의 리팩터링을 더 어렵게 만든다.**

## 핵심 포인트

- **LLM은 기존 코드베이스에서 패턴을 학습해 새 코드에서 반복한다.** 중복된 조건문이 네 개 있으면 다섯 번째 복사가 곧 온다는 신호다.
- **지름길 병합 = "여기선 이렇게 한다"는 신호.** 차선책이 병합될 때마다 코드 스멜이 복리로 누적된다.
- **나쁜 패턴은 일회성 실수가 아니라 코드베이스의 "스타일"이 된다.** 그래서 나중 리팩터링이 쉬워지는 게 아니라 더 어려워진다.
- **"유지보수를 LLM에 위임한다"는 착각.** 실제로는 모델을 점점 나쁜 습관으로 훈련시키는 미끄럼틀이다.
- **LLM은 스펀지다.** 당신이 하는 모든 것을 빨아들여 그대로 되비춘다 → 처음부터 유지보수 가능한 코드를 쓰는 것이 값비싼 기술 부채를 예방한다.

## 인상 깊은 문장

> "Every shortcut you merge into your codebase is a signal about how things are done here."

> "I thought I was outsourcing maintenance to the LLM, but the slippery slope I found myself on was actually training it to have ever-worsening habits."

> "LLMs are sponges that soak up everything you do and repeat it back to you."

## 댓글 — GN⁺의 HN 큐레이션 10개 클러스터 전수 확인

**GeekNews 자체 댓글 1개(= GN⁺의 HN 큐레이션). 그 안에 10개 최상위 의견 클러스터 + 다수 대댓글.** 실무 프롬프트 노하우가 많아 요약해 남긴다.

- **`/review` 커스텀 명령** — `.claude/commands/review.md`에 체크리스트를 쌓아 리뷰시키는 실천. 단, 항목이 200개로 비대해지면 오히려 성능이 나빠지고 조용히 놓친다는 반례가 붙음(규칙의 과잉 ≠ 통제).
- **"그냥 코드를 직접 쓴다"** — 가장 큰 흐름. "코드는 읽는 것으로 부족하고 고통스럽게 겪어야 내면화된다", "에이전트는 기존 경로가 필요한지 묻기보다 방어적으로 감싸 러시아 인형처럼 겹겹이 쌓는다".
- **"최종 코드 점검" 프롬프트** — "관심사 분리를 지키는가? 더 이상 참이 아닌 가정을 하고 있지 않은가? 이전 실험의 잔재가 남아있지 않은가? 문서는 현재 코드를 반영하는가?"
- **결정론적 도구 우선** — SonarQube/Rubocop 같은 AST 기반 정적 분석기는 토큰 없이 중복·복잡도를 "결정적으로" 잡는다. AI에 맡기기 전에 결정론적으로 풀 수 있는 건 결정론적으로.
- **균형 잡힌 반론** — "사람이 20년 유지보수한 코드도 원래 더 나빴다. 문제의 근원은 AI가 아니라 일정·예산 압박이 만드는 나쁜 습관이며 LLM은 그것을 학습했을 뿐."

## 내 생각 · 적용점

### 핵심 전이 1 — 코드베이스는 이제 "미래의 AI 세대"를 향한 학습 신호다

이 글의 통찰은 강력하다. **코드 품질 관리는 "미래의 나/동료"뿐 아니라 "미래의 AI 세대"를 향한 투자**가 됐다. 지름길을 병합하는 것 = AI에게 나쁜 습관을 가르치는 것. [[2026-06-08-ai-demands-more-engineering-discipline]]("AI는 더 많은 엔지니어링 규율을 요구한다")과 [[2026-05-25-lawson-better-code-slower-with-ai]]("AI로 더 좋은 코드를 더 느리게")의 결론을 한 문장으로 압축한다.

### 핵심 전이 2 — CRS 같은 장수 백엔드에서 반복 생성의 오염이 특히 위험

조선호텔 CRS처럼 오래 유지되는 예약·요금 도메인에서 AI로 라우트/핸들러(접근 제어, 요금 계산 로직)를 반복 생성하면, 중복 패턴이 "표준"으로 굳어 이후 세대까지 오염된다. [[2026-06-08-prefer-duplication-over-wrong-abstraction]]·[[2026-06-30-yagni-hidden-costs]]와 함께, "복사가 네 개면 다섯 번째가 온다"는 신호를 리뷰에서 잡아야 한다. 댓글의 "최종 코드 점검" 프롬프트와 정적 분석기 병행이 바로 채택할 만한 실천.

### 핵심 전이 3 — "코드는 직접 써야 내면화된다"는 장인정신 vs 위임의 경계

댓글의 강한 흐름("고통스럽게 겪어야 배운다")은 [[2026-05-14-naur-programming-as-theory-building]]("프로그래밍 = 이론 구축")과 정확히 같다. 코드는 산출물이 아니라 개발자 머릿속 이론의 표현이고, 그 이론을 AI에 통째로 위임하면 이론 자체가 사라진다. [[2026-06-30-code-review-purpose-maintainability]]의 "리뷰의 목적은 유지보수성"과 연결해, "무엇을 명시하고 무엇을 맡길 것인가"의 경계를 CRS 팀 규약(CLAUDE.md)에 명문화할 근거.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-08-ai-demands-more-engineering-discipline]] — *AI가 더 많은 규율을 요구한다는 같은 결론*
- [[2026-05-25-lawson-better-code-slower-with-ai]] — *AI로 품질을 지키면 오히려 느려진다*
- [[2026-05-14-naur-programming-as-theory-building]] — *코드 = 이론 구축, 위임 시 이론 소실*
- [[2026-06-08-prefer-duplication-over-wrong-abstraction]] — *중복 vs 잘못된 추상화, 반복 패턴 관리*

## 한 달 뒤 회고
*(2026-08-12 즈음 — CRS에서 AI 생성 코드의 반복 패턴을 리뷰에서 잡았는지, 정적 분석기(중복/복잡도)를 파이프라인에 한 번이라도 붙였는지, "최종 코드 점검" 프롬프트를 팀 규약에 넣었는지 기록.)*
