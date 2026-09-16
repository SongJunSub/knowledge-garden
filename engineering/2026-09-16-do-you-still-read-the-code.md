---
title: "아직도 코드를 읽나요? (zanlib.dev) — Naur의 '프로그래밍의 산출물은 코드가 아니라 이론'이라는 1985년 주장을 근거로, 이해를 유지하는 accelerator와 위임하는 vibecoder를 가른다"
source_title: "Do You Still Read the Code?"
source_url: "https://zanlib.dev/"
source_name: "zanlib.dev 개인 블로그"
referrer_url: "https://news.hada.io/topic?id=33735"
summarized_at: "2026-09-16"
category: "engineering"
tags: ["바이브코딩", "코드이해", "의도부채", "GeekNews"]
---

# 아직도 코드를 읽나요?

> 출처: [Do You Still Read the Code?](https://zanlib.dev/) (zanlib.dev) · 정리일 2026-09-16

## 한 줄 요약
**AI 시대 개발자를 "AI로 자신의 이해를 빠르게 코드로 번역하는 accelerator"와 "구현과 이후 수정까지 AI에 위임하는 vibecoder"로 나누고, Peter Naur의 1985년 논문을 근거로 코드를 읽지 않으면 요구사항과 구현 결정 사이에 "의도 부채(intent debt)"가 쌓인다고 주장한다.**

## 핵심 포인트
- AI 시대 개발자를 두 유형으로 구분: ***"accelerator"***(AI로 자신의 이해를 코드로 빠르게 번역, 설명·검증·유지보수 가능한 수준의 이해 유지)와 ***"vibecoder"***(구현과 이후 수정까지 AI에 위임, 스펙과 평가기준만 관리)
- Peter Naur의 1985년 논문 ***"Programming as Theory Building"***을 근거로, 프로그래밍의 진짜 산출물은 코드가 아니라 ***"기저 이론/멘탈모델"***이라고 주장
- 코드를 읽지 않으면 구현 결정의 근거가 요구사항과 연결이 끊기는 ***"intent debt"(의도 부채)*** 가 누적된다는 개념 제시
- 같은 팀에 accelerator와 vibecoder가 유지보수 기대치 합의 없이 섞이면 해롭다고 경고
- "accelerator에서 vibecoder로 서서히 드리프트"하는 것이 흔한 실패 패턴이라고 지적 — 처음엔 검토하다가 점차 검토를 생략하게 되는 흐름

## 인상 깊은 문장
> (재구성) "the real product of programming is the underlying theory... not the code itself"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Lobsters에 크로스포스트됨(lobste.rs/s/qiwlzz/do_you_still_read_code), daily.dev에도 큐레이션됐으나 정확한 댓글 수는 접근 차단으로 미확인. 원문·저자명·발행일 전부 WebSearch 스니펫으로만 재구성해 인용문은 원문 대조가 안 된 간접 인용이다.

## 내 생각 · 적용점
**[[2026-08-12-antirez-control-ideas-not-code]]**와 정확히 반대 방향에서 부딪힌다 — antirez는 "코드를 읽는 건 대체로 무의미하니 설계를 지시하고 동작을 질문하라"고 하는데, 이 글은 "코드를 안 읽으면 의도 부채가 쌓인다"고 한다. **[[2026-08-12-reviewing-code-is-a-skill]]**이 같은 시기 이 논쟁에 낀 세 번째 노트 — "LLM 리뷰가 놓치는 건 코드가 아니라 코드 바깥의 맥락"이라는 그 글의 결론이, accelerator/vibecoder 구분의 실질적 기준점(무엇을 놓치면 위험한가)을 더 구체적으로 보여준다.

## 호스피탈리티 / CRS 적용 포인트
예약·정산 로직처럼 되돌리기 어려운 도메인 코드는 accelerator 방식(AI로 빠르게 작성하되 반드시 이해하고 검증)을 강제하고, 반복적인 CRUD·UI 코드는 vibecoder 방식을 허용하는 식으로 팀 내 규칙을 나눠두는 게 "의도 부채"를 줄이는 실용적 타협점이 될 수 있다.

## 연관 자료
- [[2026-08-12-antirez-control-ideas-not-code]] — 정면으로 반대되는 주장(코드 대신 설계를 통제하라)
- [[2026-08-12-reviewing-code-is-a-skill]] — 같은 논쟁의 세 번째 축, LLM 리뷰가 놓치는 것이 코드 바깥 맥락이라는 실증
- [[2026-05-05-agentic-coding-is-a-trap]] — 같은 우려("위임이 늘수록 이해가 줄어든다")의 앞선 표현

## 한 달 뒤 회고
2026-10-16 즈음, "의도 부채"라는 개념이 이후 다른 글에서 재인용되는지, 팀 단위로 accelerator/vibecoder 역할을 명시적으로 나누는 실무 사례가 나왔는지 점검.
