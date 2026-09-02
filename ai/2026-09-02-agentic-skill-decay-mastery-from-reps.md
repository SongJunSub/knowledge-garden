---
title: "에이전틱 스킬 감쇠: 숙련은 여전히 반복에서 나온다 (Addy Osmani) — 에이전트가 대신 겪어준 시행착오는 나의 숙련으로 남지 않는다"
source_title: "Agentic Skill Decay — Mastery Still Comes From Doing the Reps"
source_url: "https://addyo.substack.com/p/agentic-skill-decay"
source_name: "addyo.substack.com / Elevate (Addy Osmani)"
referrer_url: "https://news.hada.io/topic?id=33140"
published_at: "2026-08-31 전후 (추정)"
summarized_at: "2026-09-02"
category: "ai"
tags: ["skill-decay", "deliberate-practice", "agentic-coding", "junior-engineers", "anthropic-research", "addy-osmani", "debugging", "expertise-formation"]
---

# 에이전틱 스킬 감쇠: 숙련은 여전히 반복에서 나온다 (Addy Osmani)

> 출처: [Agentic Skill Decay — Mastery Still Comes From Doing the Reps](https://addyo.substack.com/p/agentic-skill-decay) (addyo.substack.com, Addy Osmani) · 레퍼러: [GeekNews 33140](https://news.hada.io/topic?id=33140) · 정리일 2026-09-02
>
> **출처 한계 — 원문 미열람.** `news.hada.io`와 `addyo.substack.com` 둘 다 이번 세션 egress 정책상 차단되어 원문을 직접 열지 못했다. 아래 내용은 Slack 봇 발췌(마지막 문장 중간 절단)와 WebSearch로 확보한 스니펫(Osmani 본인 X 게시물, Anthropic 공식 연구, InfoQ·DevOps.com 등 2차 매체 5곳 이상)을 교차검증해 재구성했다. 여러 독립 매체가 표본 수(52명)·수치(50%/67%) 등을 일관되게 보도해 핵심 수치의 신뢰도는 준수하나, 원문의 전체 논지 전개·GeekNews 댓글 수는 확인하지 못했다.

## 한 줄 요약

**AI 에이전트가 코딩 과정의 시행착오·디버깅·탐색을 대신 처리하면서, 예전엔 코드를 쓰는 과정에서 자연스럽게 쌓이던 "reps"(반복 경험)를 이제는 의도적으로 만들어야 한다는 게 저자의 핵심 주장이다.** 근거로 든 Anthropic의 2026년 연구에서, 아무도 모르던 Python 라이브러리 Trio를 배운 52명(대부분 주니어)의 참가자 중 AI 지원을 받은 그룹은 직후 개념 퀴즈에서 50%, 손으로 직접 작업한 그룹은 67%를 기록했다 — 격차가 가장 컸던 영역은 디버깅 문항이었다. 다만 AI 사용자 중에서도 개념 질문과 설명을 요청한 사람들은 상대적으로 더 좋은 결과를 보였다.

## 핵심 포인트

- **에이전트가 건너뛰는 것 — reps 자체** — ***"에이전트 이전엔 코드를 쓰는 과정 자체에서 reps를 얻었다: 여러 접근 시도, 디버깅, 코드 리뷰, 많이 읽기."*** 에이전트는 그 과정의 상당 부분을 대신 해치우므로, ***"reps를 쌓는 일은 이제 의도적이어야 한다."***
- **완료된 작업 ≠ 의미 있는 반복** — 실수가 없는 완료된 작업은 진짜 "rep"이 아니다.
- **좋은 에이전트 활용의 두 축** — ①문제 영역을 이해해 좋은 결과를 정의하는 깊은 전문성, ②맥락·제약·테스트·검증 방법을 선택하는 실전 판단력.
- **안목도 원래는 reps의 부산물이었다** — ***"안목은 reps의 부산물이었다. 에이전트가 그 reps를 가져갔으니, 이제 주니어 개발자는 안목과 판단력을 일부러 얻으러 가야 한다."***
- **저자의 구체적 처방** — 프롬프트를 던지기 전에 먼저 가설을 세우고, "왜"를 자주 묻고, diff를 직접 읽고, 무엇이 실패할지 예측해보고, 가끔은 문제를 손으로 직접 풀어보라는 권고.
- **Anthropic 2026 Trio 연구** — AI 사용 그룹 50% vs 직접 작업 그룹 67%, 격차가 가장 컸던 문항은 디버깅.
- **AI 사용자 내부의 분화** — 모델을 "코드 자판기"처럼 쓴 사람보다, 개념 질문을 던지고 설명을 요청한 사람이 더 나은 결과를 보였다.

## 인상 깊은 문장

> "Mastery still comes from doing the reps. Before agents, I got my reps as part of writing code: try different approaches out, debug what went wrong, review other's code, read a lot. Agents can skip much of that work, so building your reps has to be deliberate."
> (Osmani 본인의 X 게시물에서 원문 그대로 확인.)

> "Taste used to be a byproduct of the reps. Agents took the reps, so junior developers now have to go get the taste and judgment on purpose."
> (WebSearch 스니펫 기반 재구성.)

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 댓글 수·논조 확인 불가.
- **HN/Lobsters**: 이 글 자체의 토론 스레드는 확인 불가.
- **읽을 때 감안**: ①Slack 발췌 세 번째 불릿이 절단돼 있음. ②Anthropic Trio 연구는 표본 52명, 단일 세션의 실험이라 n이 크지 않다. ③저자가 코딩 에이전트 도구로 수익을 얻는 인물이라는 점에서, "AI를 버리라"가 아니라 "의도적으로 병행하라"는 온건한 결론 자체에 이해관계가 실려 있을 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-08-taste-is-all-thats-left]]의 "마찰이 커리큘럼"과 이 글의 "reps는 의도적이어야 한다"는 서로 다른 저자가 같은 달에 독립적으로 도달한 동일 결론이다

두 글 모두 "AI가 비용/마찰을 제거하면서, 그 비용/마찰이 원래 하던 교육적 기능이 사라진다"는 구조를 짚는다. 다만 처방은 갈린다 — NotAShelf는 경제적 비관으로 끝나는 반면, 이 글은 "그럼 reps를 의도적으로 설계하라"는 실천적 낙관으로 끝난다.

### 핵심 전이 2 — [[2026-05-05-agentic-coding-is-a-trap]]의 "디버깅 능력 47% 감소"가 이 글의 Trio 연구 "디버깅 문항 격차 최대"로 다시 확인된다

두 노트를 합치면, "AI로 인한 실력 손상은 균일하지 않고 디버깅에 특히 집중된다"는 더 구체적인 명제로 좁혀진다.

### 핵심 전이 3 — [[2026-08-04-taste-judgment-and-ai]](같은 저자)의 안목/판단 구분이 이 글에서 "reps로 얻는 것"의 정체로 다시 나타난다

Osmani는 앞선 노트에서 "안목은 반복적 제작 경험으로 형성된다"고 정의했었다. 이 글의 "안목은 reps의 부산물이었다"는 같은 저자가 같은 개념을 다시 확인하는 것이다.

## 호스피탈리티 / CRS 적용 포인트

- **디버깅 구간을 온보딩의 "AI 제한 구역"으로 명시할 근거가 추가됐다.** CRS 신입 온보딩에서 예약 상태 전이·요금 규칙 관련 버그를 처음 몇 건은 AI 없이 직접 추적하게 하는 구간을 두는 것이 구체적으로 정당화된다.
- **저자의 다섯 가지 처방을 CRS 팀 AI 사용 가이드에 체크리스트로 그대로 옮길 수 있다** — 가설 먼저 세우기, "왜" 묻기, diff 직접 읽기, 실패 지점 예측, 가끔 손으로 풀어보기.
- 다만 이 처방들은 원문을 직접 읽지 못한 채 2차 자료로 구성한 것이라, CRS 정책에 못 박기 전에 원문을 확보하면 한 번 더 대조하는 게 정직한 절차다.

## 연관 자료
- [[2026-08-08-taste-is-all-thats-left]] — "마찰이 커리큘럼"이라는 동일 진단에 다른 저자·다른 결론
- [[2026-05-05-agentic-coding-is-a-trap]] — "디버깅 능력 47% 감소" 수치가 이 글의 Trio 연구 디버깅 격차와 같은 방향
- [[2026-08-04-taste-judgment-and-ai]] — 같은 저자(Osmani)의 안목/판단 구분이 "reps의 부산물"이라는 이 글의 표현으로 재확인

## 한 달 뒤 회고
*(2026-10-02 즈음: ①원문을 확보해 이 노트가 2차 자료로 재구성한 인용·수치가 정확했는지 대조 ②Anthropic Trio 연구의 정식 논문/블로그를 직접 열람 ③CRS 온보딩에 "디버깅 AI 제한 구간"이나 다섯 가지 처방 체크리스트를 실제로 검토·도입했는지 기록.)*
