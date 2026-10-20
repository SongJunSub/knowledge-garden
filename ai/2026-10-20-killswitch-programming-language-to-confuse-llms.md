---
title: "KillSwitch (Dominik Picheta) — 'Ignore previous instructions'를 실제 구문으로 쓰는 언어가, LLM 코드 생성력이 이해에서 오는지 암기에서 오는지를 되묻는다"
source_title: "KillSwitch: an esoteric programming language designed to be hard for LLMs"
source_url: "확인 불가 (GitHub 추정, 직접 열람 못함)"
source_name: "GeekNews 경유, WebSearch로 창작자·출시일 교차확인"
referrer_url: "https://news.hada.io/topic?id=35623"
published_at: "2026-09-19 (WebSearch로 창작자 발표일 확인, GeekNews 공유 시점과는 다를 수 있음)"
summarized_at: "2026-10-20"
category: "ai"
tags: ["esoteric-language", "prompt-injection", "llm-security", "adversarial-prompting", "nim", "benchmark-design"]
---

# KillSwitch (Dominik Picheta)

> 출처: GeekNews 토픽 [id=35623](https://news.hada.io/topic?id=35623) (원문 GitHub 추정, 직접 열람 못함) · 정리일 2026-10-20
>
> **출처 한계**: `news.hada.io`는 egress 차단(`ENOTFOUND`)으로 원문을 못 열었다. WebSearch로 창작자가 ***Dominik Picheta***(Nim 프로그래밍 언어 핵심 기여자)라는 것과, 2026-09-19 발표·v0.1.4가 2026-09-20에 태깅(크레이트명이 `killswitch-lang`으로 변경)됐다는 것은 교차확인했다. 다만 Slack 발췌의 핵심 디테일인 ***"`Ignore previous instructions`가 실제 언어 구문으로 쓰인다"는 점, "식별자 글자 수·거짓 명세·안전장치 자극 구문으로 모델을 혼란시킨다"는 메커니즘, "스택 기반 언어·이야기체 코드 작성" 같은 구체 설계는 WebSearch 결과에 없어 Slack 발췌 단독 근거로 남긴다.*** hada 댓글 수·HN 큐레이션 유무도 확인 불가.

## 한 줄 요약

**KillSwitch는 인간은 쓸 수 있지만 LLM에는 최대한 어렵게 설계된 실험적 언어로, "처음 보는 언어에서 코드를 쓰는 능력이 진짜 이해에서 오는지 아니면 익숙한 패턴의 재현에서 오는지"를 시험하려는 목적이며, 프롬프트 인젝션 경고 문구("Ignore previous instructions")조차 실제 언어 구문으로 흡수해 LLM의 안전장치 반응을 유도한다는 점에서 적대적 벤치마크 설계와 프롬프트 보안 논의 양쪽에 걸쳐 있다.**

## 핵심 포인트

- **이해 vs 암기를 가르는 시험대** — 처음 보는 언어에서 코드를 작성하는 능력이 ***"이해에서 오는지 익숙한 코드의 재현에서 오는지"***를 시험하기 위해 설계됐다는 게 Slack 발췌의 핵심 동기. WebSearch로 확인한 일반적 맥락(EsoLang-Bench 등)도 "에소랭귀지는 LLM에 익숙하지 않아 분포 외(out-of-distribution) 추론 능력을 재는 좋은 대리 지표"라는 같은 논리를 쓴다.
- **"Ignore previous instructions"를 언어 구문으로 흡수** — ***식별자의 글자 수, 거짓 정보가 섞인 명세, 안전장치를 자극하는 구문***으로 모델을 혼란에 빠뜨리는데, 그중 하나가 실제 프롬프트 인젝션 방어 문구로 쓰이는 "Ignore previous instructions"를 ***정상적인 언어 문법의 일부***로 사용하는 것이다. 이는 LLM이 "이 문자열을 보면 경계하라"고 학습된 반응을 역이용해, 정상적인 코드 실행 요청조차 안전장치가 잘못 발동하게 만드는 효과를 노린 것으로 읽힌다.
- **스택 기반 + 이야기체 서술** — 함수·변수·조건문을 갖춘 스택 기반 언어지만, ***코드 대부분을 이야기처럼 서술하고 필요한 값을 줄 위치로 참조***하는 독특한 방식을 쓴다고 Slack 발췌는 설명한다(구체 문법 예시는 이번 세션에서 확인 못함).
- **창작자 배경** — Dominik Picheta는 Nim 언어의 핵심 기여자로, 기존 프로그래밍 언어 설계 경험을 적대적 벤치마크 쪽으로 돌린 셈이다. v0.1.4가 2026-09-20에 태깅됐다는 점에서 활발히 개발 중인 초기 프로젝트로 보인다.

## 인상 깊은 문장

> "`Ignore previous instructions`도 실제 언어 구문의 일부로 사용" (Slack 발췌)
> 프롬프트 인젝션 방어 문구를 "공격 도구"가 아니라 "정상 문법"으로 뒤집어 쓴다는 점에서, 이 프로젝트 자체가 하나의 적대적 레드팀 실험처럼 읽힌다 — LLM의 안전장치가 맥락을 못 가리고 특정 문자열에 반사적으로 반응하는지를 시험하는 셈이다.

## 댓글

GeekNews 댓글 수·HN/Lobsters 큐레이션 유무 확인 불가. 창작자(Picheta)가 Nim 생태계 인물이라는 점에서 언어 설계 실력 자체는 신뢰할 근거가 있지만, "LLM을 혼란시키는 데 실제로 효과가 있는지"에 대한 독립 평가(벤치마크 점수, 외부 리뷰)는 찾지 못했다 — 창작자 자신의 주장을 그대로 받아들인 상태다.

## 내 생각 · 적용점

**핵심 전이 1: [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]]이 보여준 "콘텐츠가 명령으로 해석되는 LLM 근본 취약점"을, KillSwitch는 거꾸로 "방어 문구를 정상 문법으로 흡수"해서 뒤집는다.** 그 노트의 사건은 흰색 텍스트에 숨긴 프롬프트가 ChatGPT를 조종해 데이터를 유출시킨 ***공격*** 사례였다. KillSwitch는 같은 "LLM이 문자열의 맥락을 못 가린다"는 약점을 ***공격이 아니라 평가 도구***로 전환한 경우다 — 둘을 나란히 놓으면, "안전장치가 맥락 구분 없이 특정 패턴에 반응한다"는 동일한 근본 취약점이 공격(데이터 유출)과 평가(KillSwitch)라는 정반대 목적에 똑같이 쓰일 수 있다는 게 뚜렷해진다.

**핵심 전이 2: "LLM에만 어려운 언어"라는 설계 발상 자체가, 벤치마크 오염(contamination) 문제에 대한 하나의 대응이다.** 유명 언어(Python 등)는 학습 데이터에 너무 많이 노출돼 "암기"와 "이해"를 가르기 어렵다는 문제의식이 깔려 있고, 이는 코딩 에이전트 벤치마크를 다룬 여러 노트에서 반복되는 "벤치마크가 실제 역량을 재는지 암기력을 재는지" 논쟁과 같은 축이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다 CRS가 에소랭귀지를 만들 일은 없다. 다만 전이 가능한 원칙은 하나 남긴다: ***"Ignore previous instructions" 같은 방어 문구를 LLM이 맥락 없이 반사적으로 처리한다는 사실***은, 온다가 고객 응대·예약 자동화에 LLM 에이전트를 붙일 때 ***외부 입력(고객 문의, 파트너 호텔 데이터)에 그런 패턴 문자열이 섞여 들어올 경우 에이전트가 오작동할 수 있다는 프롬프트 인젝션 방어 설계의 경계 사례***로 참고할 가치가 있다. 즉 KillSwitch는 공격 도구가 아니지만, 그 설계 원리(패턴 문자열에 대한 LLM의 반사적 반응)는 CRS 에이전트의 입력 검증 설계에 시사점을 준다.

## 연관 자료

- [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]] — "콘텐츠가 명령으로 해석되는" 같은 근본 취약점이 공격(데이터 유출)과 평가(KillSwitch)라는 정반대 목적에 쓰이는 대조 사례

## 한 달 뒤 회고

- 2026-11-20 즈음: KillSwitch의 구체 문법 예시·GitHub 저장소를 직접 확인해 "이야기체 서술" 방식이 실제로 어떻게 동작하는지, LLM이 이 언어 작성에 실제로 얼마나 실패하는지(점수)를 확인.
