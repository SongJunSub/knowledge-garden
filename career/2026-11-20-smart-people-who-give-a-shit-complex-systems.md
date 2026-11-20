---
title: "우리에겐 진심으로 신경 쓰는 똑똑한 사람들이 필요하다 (GeekNews) — 복잡계는 결함을 이해하고 선제 대응하는 경험자들이 겨우 돌아가게 만든다"
source_title: "We Need Smart People Who Give a Shit"
source_url: "https://violetpixel.com/blog/2026-11-17-we-need-smart-people-who-give-a-shit/"
source_name: "GeekNews (저자 신원 소스 간 불일치: Justin Michael / Liam Proven)"
referrer_url: "https://news.hada.io/topic?id=37446"
published_at: "2026-11-17"
summarized_at: "2026-11-20"
category: "career"
tags: ["complex-systems", "sre", "deskilling", "organizational-resilience", "ach"]
---

# 우리에겐 진심으로 신경 쓰는 똑똑한 사람들이 필요하다 (GeekNews)

> 출처: [We Need Smart People Who Give a Shit](https://violetpixel.com/blog/2026-11-17-we-need-smart-people-who-give-a-shit/) · [GeekNews](https://news.hada.io/topic?id=37446) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 egress 차단 재확인. 저자 신원이 소스 간 불일치(Justin Michael vs Liam Proven)해 확정하지 못했다.

## 한 줄 요약

**복잡하고 취약한 시스템을 실제로 지탱하는 것은 시스템을 깊이 이해하고 끝까지 신경 쓰는 사람들인데, 생성형 AI로 그 인력을 점검역으로만 돌리면 팀 전체의 시스템 이해가 약화된다.**

## 핵심 포인트

- 복잡하고 취약한 시스템을 실제로 지탱하는 것은 ***시스템을 깊이 이해하고 끝까지 신경 쓰는 사람들***이다.
- 오래된 미국 은행 간 이체 시스템 ACH가 안전하고 저렴하게 작동하는 데에는, 결함을 고치거나 우회하고 예외를 수동으로 처리하는 사람들의 역할이 있다.
- Microsoft 365와 항공 관제, 은행 등에서 잇따른 장애는 ***시스템을 잘 알고 끝까지 책임지는 인력이 줄어드는 문제***와 연결될 수 있다고 본다 — 다만 각 장애의 원인으로 확인된 것은 아니라고 저자도 인정한다.
- 경영진이 사람의 작업과 생성형 AI를 단순한 "산출물"로 비교하면, 이상 상황을 알아채고 선제 대응하는 역량 자체가 측정 범위 밖으로 빠진다는 지적.
- 사례로 Microsoft 365, United Airlines, NSA, 주요 은행, Apple, 항공 관제 장애를 든다 — 인과관계를 전수 입증한 것은 아니고 예외도 인정한다.

## 인상 깊은 문장

> (원문 미접속 — Slack 발췌 수준에서 가장 핵심적인 표현은 제목 자체 "We Need Smart People Who Give a Shit"이다.)

## 댓글

GeekNews 댓글 수(449점/230댓글 수준으로 보도)는 원문 집계 기준이고 hada 자체 댓글 수는 별도 확인하지 못했다. **"PASS" 아님을 명시**: 저자 신원이 소스 간 불일치하고, 장애 사례들의 인과관계는 저자 본인도 전수 입증하지 않았다고 밝힌다.

## 내 생각 · 적용점

### 핵심 전이 — 레포에 이미 쌓인 "탈숙련화" 주장을 SRE에서 복잡계 전반으로 확장한 버전

[[2026-10-31-ai-erodes-sre-skill-not-replacing]]와 [[2026-09-06-ai-sre-skill-atrophy]]가 "AI가 SRE를 대체하는 게 아니라 숙련도를 깎아먹는다"는 주장을 다뤘는데, 이번 글은 같은 주장을 SRE라는 특정 직군에서 금융·항공·은행 같은 복잡계 전반으로 확장한 버전이다. 세 노트를 모아보면 이 주제가 레포에서 반복적으로 확인되는 패턴임을 알 수 있다.

### 적용점

경영진이 "사람의 작업"과 "생성형 AI 산출물"을 같은 저울에 올려 비교하면, 이상 징후를 미리 알아채는 암묵적 역량은 그 저울에 안 잡힌다는 지적은 조직 설계에 바로 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 장애 대응·운영 인력을 AI 점검역으로만 돌리면, 평소엔 드러나지 않는 희귀 장애(요금 동기화 오류, PMS 연동 장애 등)에 대한 대응력이 서서히 침식될 수 있다는 경고로 직접 적용 가능하다. AI 도입 로드맵에 "핵심 운영자의 시스템 이해를 유지하는 장치"를 별도로 넣어야 한다.

## 연관 자료

- [[2026-10-31-ai-erodes-sre-skill-not-replacing]] — 같은 "AI가 대체가 아니라 탈숙련화를 일으킨다"는 주장, SRE 축
- [[2026-09-06-ai-sre-skill-atrophy]] — 같은 주장, 더 이른 시점의 선행 노트

## 한 달 뒤 회고

2026-12-20 즈음 — 저자 신원이 명확히 확인됐는지, 온다 CRS 운영팀의 핵심 인력 유지 설계를 실제로 점검했는지 추적.
