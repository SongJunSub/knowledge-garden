---
title: "Fable 필드 가이드: 나의 미지(Unknowns) 찾기 (x.com/trq212) — '지도와 영토의 간극을 좁히는 것', 문제가 비싸지기 전에 저렴하게 미지를 발견하라"
source_title: "Fable Field Guide: Finding My Unknowns"
source_url: "https://x.com/trq212/status/2073100352921215386"
source_name: "x.com (trq212)"
referrer_url: "https://news.hada.io/topic?id=31107"
summarized_at: "2026-07-03"
category: "ai"
tags: ["ai-coding", "prompt-engineering", "requirements-gathering", "implementation-planning", "claude-fable", "unknown-unknowns", "spec-driven-development"]
---

# Fable 필드 가이드: 나의 미지(Unknowns) 찾기 (x.com/trq212) — '지도와 영토의 간극을 좁히는 것', 문제가 비싸지기 전에 저렴하게 미지를 발견하라

> 출처: [Fable Field Guide: Finding My Unknowns](https://x.com/trq212/status/2073100352921215386) (x.com/trq212) · 정리일 2026-07-03

## 한 줄 요약

**Claude Fable을 효과적으로 쓰기 위한 실용 가이드. 핵심은 "지도(프롬프트)와 영토(현실)의 간극인 미지(Unknowns)를 찾아 좁히는 것"이다. 미지를 4가지로 분류하고, 구현 전·중·후 단계별로 미지를 저렴하게 발견하는 전략을 제시한다.**

## 핵심 포인트

- **미지의 4가지 분류**:
  - Known Knowns: 프롬프트에 포함된 것
  - Known Unknowns: 모르는 걸 아는 것
  - Unknown Knowns: 보면 아는 당연한 것(암묵지)
  - Unknown Unknowns: 전혀 고려하지 않은 것
- **구현 전 전략** — Blind Spot Pass로 unknown unknowns 식별 / 브레인스토밍·프로토타입으로 unknown knowns 가시화 / 인터뷰로 모호함 해소 / 레퍼런스 제공(소스 코드가 최고) / 구현 계획 검토.
- **구현 도중** — `implementation-notes.md` 유지로 편차 기록.
- **구현 후** — 피치 문서로 동의 확보 / **퀴즈로 변경사항 이해도 검증**.
- **핵심 원칙** — "모든 설명·브레인스토밍·프로토타입은 문제가 비싸지기 전에 저렴하게 미지를 발견하는 수단." 다음 프로젝트는 Claude에게 미지 찾기 요청으로 시작해야 함.

## 인상 깊은 문장

> "지도(프롬프트)와 영토(현실)의 간극인 미지를 찾아 좁히는 것이 핵심이다."

> "모든 설명·브레인스토밍·프로토타입은 문제가 비싸지기 전에 저렴하게 미지를 발견하는 수단이다."

## 댓글 전수 확인

**댓글 없음** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — "Unknown Unknowns 식별"이 [[2026-06-30-yagni-hidden-costs]]의 선택권 비용을 줄이는 실무 방법

YAGNI 글에서 다룬 "추측 기반 구조화"의 위험을 줄이는 구체적 방법이 바로 이 Blind Spot Pass다. **CRS 기능 설계 전에 "우리가 전혀 고려하지 못한 것이 무엇인가"를 AI에게 명시적으로 물어보는 단계를 추가하면, 나중에 비싸지는 미지를 미리 저렴하게 발견할 수 있다.**

### 핵심 전이 2 — "레퍼런스로 소스 코드가 최고"라는 조언이 [[2026-06-30-towards-understandable-software]]와 직결

문서보다 소스 코드가 최고의 레퍼런스라는 것은, 코드 자체가 실행 가능한 명세라는 의미다. **CRS·PickMe에서 새 기능을 AI에게 요청할 때, 설명보다 "이 기존 코드와 비슷하게"라는 참조가 더 정확한 결과를 낸다는 실무 팁.**

### 핵심 전이 3 — "퀴즈로 이해도 검증"이 코드 리뷰의 새로운 형태

[[2026-06-30-code-review-purpose-maintainability]]의 "이해해보고 막히는 부분을 표시하라"는 원칙을, 이 글은 한 단계 더 구체화한다 — **AI가 구현한 코드를 팀원에게 리뷰시키기 전에 "이 변경사항을 설명해보라"는 퀴즈를 통과시키는 것이 실무적 검증 방법이 될 수 있다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-30-yagni-hidden-costs]] — *"Unknown Unknowns 식별"=선택권 비용을 줄이는 구체적 실천*
- [[2026-06-30-towards-understandable-software]] — *"소스 코드가 최고의 레퍼런스" — 코드=실행 가능한 명세*
- [[2026-06-30-code-review-purpose-maintainability]] — *"퀴즈로 이해도 검증"=이해 가능성 확인의 새로운 형태*

## 한 달 뒤 회고
*(2026-07-03 즈음 — CRS 기능 설계 전 "Blind Spot Pass"를 실제로 시도했는지, 소스 코드 레퍼런스 방식으로 프롬프트를 개선했는지 기록.)*
