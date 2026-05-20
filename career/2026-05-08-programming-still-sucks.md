---
title: "프로그래밍은 여전히 형편없다 — AI는 희생양, 진짜 원인은 탐욕"
source_title: "Programming Still Sucks"
source_url: "https://www.stvn.sh/writing/programming-still-sucks-fqffhyp"
source_name: "Steven Langbroek (stvn.sh)"
referrer_url: "https://news.hada.io/topic?id=29261"
published_at: "2026-04-19"
summarized_at: "2026-05-08"
category: "career"
tags: ["AI비판", "경영", "도제식성장", "기관지식", "Goodhart법칙", "주니어", "메타비판"]
---

# 프로그래밍은 여전히 형편없다 — AI는 희생양, 진짜 원인은 탐욕

> 출처: [Steven Langbroek — Programming Still Sucks](https://www.stvn.sh/writing/programming-still-sucks-fqffhyp) · 레퍼러: [GeekNews 29261](https://news.hada.io/topic?id=29261) · 정리일 2026-05-08

## 한 줄 요약
*"AI가 일자리를 가져갔다"* 는 진단을 *재배치*한다 — **AI는 희생양**, 진짜 원인은 **경영진의 탐욕과 잘못된 의사결정**. 도제식 성장은 끊어졌고, 기관 지식은 사라지고, 지표는 의미를 잃었다.

## 핵심 주장 4가지

### 1. 도제식 성장의 붕괴
- 주니어의 *진짜 가치*: 지금의 생산량이 아니라 **시니어로 자라는 과정**
- 비용 절감 = 채용 중단 → **멘토십 파이프라인 단절**
- *"나중에 정상화하면 고치면 된다"* 는 거짓말로 자기 합리화

### 2. Goodhart's Law와 지표 함정
- 지표로 삼은 모든 수치(속도·스토리 포인트·테스트 커버리지)가 *신뢰성 상실*
- 숫자가 측정 대상이 되는 순간, 그것은 더 이상 그 대상을 측정하지 않는다
- 경영진이 *숫자만 보고* 실제 코드 품질 악화를 놓침

### 3. Sara의 cron job 우화 (가장 강한 메시지)
- 50대 시니어 여성 엔지니어가 *1990년대부터 일해옴*
- 2016년부터 실행 중인 *3만 명 급여 지급 cron job*을 혼자 유지
- 그 지식은 *Ben의 USB 스틱 하나*에서 인계받음
- **Sara가 떠나면 회사 3만 명의 급여 처리 불가** — 그러나 조직은 *모른다*

> *"그녀는 당신이 만질 수 없는 것의 형태다. 변환이 이미 삭제한 모든 제도적 지식이다."*

### 4. AI는 가면, 탐욕이 본질
> *"AI가 직업을 빼앗지 않았다. 탐욕이 했다. 방글라데시 공장 이전, 콩고 코발트 광산과 같은 그 탐욕이 로봇 가면을 쓰고 있을 뿐."*

- 인력 감축의 *정당화 도구*로 AI 사용
- 그러나 결과 = *기관 지식 소실 + 도제식 성장 종료*
- 한 줄: *"주니어가 없다. 2024년에 그들의 장례식이 있었다. 아무도 오지 않았다."*

## 짧은 인용

> "AI가 직업을 빼앗지 않았다. 탐욕이 했다."

> "그녀는 당신이 만질 수 없는 것의 형태다."

> "주니어가 없다. 2024년에 그들의 장례식이 있었다. 아무도 오지 않았다."

> "그 cron 작업이 급여를 지급한다. 당신은 모른다."

> "이사회 회의에는 '가치'라는 단어가 없었다."

## 내 생각 · 적용점

### 가든 *AI 비판 시리즈 9번째* — 메타 비판
| # | 글 | 비판 대상 |
|---|---|---|
| 1 | [Trap](../ai/2026-05-05-agentic-coding-is-a-trap.md) | AI 사용 결과 (위축) |
| 2 | [Ding](../ai/2026-05-07-claude-code-not-making-your-product-better.md) | AI 효능 (기능) |
| 3 | [Glaser](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) | 조직 학습 |
| 4 | [No One's Happy](../ai/2026-05-07-appearing-productive-in-the-workplace.md) | 신호 시스템 |
| 5 | [3 역법칙](../ai/2026-05-07-inverse-laws-of-robotics.md) | 원칙 |
| 6 | [Willison 자기 고백](../ai/2026-05-07-vibe-coding-agentic-engineering-converging.md) | 내부 자백 |
| 7 | [.txt 병목](../engineering/2026-05-07-bottleneck-was-never-the-code.md) | 조직 진단 |
| 8 | [최홍찬 바닥/천장](2026-05-07-ai-floor-and-our-ceiling.md) | 한국어 시각 |
| **9** | **이 글** | ***AI 자체가 비판 대상이 아님*** — 경영 의사결정이 본질 |

이전 8개는 *AI를 어떻게 다룰까* 였다면, 이 글은 **"AI 비판 자체가 잘못된 프레임"** 이라는 메타 비판. 비판 시리즈가 자기를 *재구성*하게 만드는 글.

### *Sara의 cron job*은 가든의 핵심 개념 우화
지금까지 가든이 분리해서 다룬 개념들이 *Sara* 한 인물에 압축됨:
- [의도 부채](../engineering/2026-04-24-technical-cognitive-intent-debt.md): *왜* 이 cron이 만들어졌는지 *문서 부재*
- [.txt의 *맥락은 침투할 수 없다*](../engineering/2026-05-07-bottleneck-was-never-the-code.md): Ben → Sara *대면 인계*만 가능했던 지식
- [Glaser의 *Loop Intelligence 부재*](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md): 조직이 *Sara가 무엇을 하는지* 모른다
- [No One's Happy의 *신뢰 자산*](../ai/2026-05-07-appearing-productive-in-the-workplace.md): Sara가 떠나면 *회사 신뢰가 무너짐*

**Sara는 4개 글의 메타포를 한 인물로 압축한 우화** — 회의·1on1에서 *"우리 회사의 Sara는 누구인가?"* 질문 한 번으로 4개 진단을 동시에 수행 가능.

### *주니어가 없다* — 가장 무거운 한 줄
- [Trap](../ai/2026-05-05-agentic-coding-is-a-trap.md)·[Ding K자형](../ai/2026-05-07-claude-code-not-making-your-product-better.md)이 *주니어 측 위축*을 다뤘다면, 이 글은 *주니어 자체가 채용되지 않는다*고 한 단계 더 들어감
- [채용·관리 4부작](2026-05-04-learnings-from-1000-interviews-at-amazon.md)·[Cohen 채용](2026-04-27-how-to-hire-someone-better-than-yourself.md)이 *적임자 식별*을 다뤘다면, 이 글은 *그 식별 자체가 일어나지 않는다*고 비판

### 호스피탈리티 *Sara 식별*은 즉시 적용 가능
호스피탈리티 IT는 *Sara가 풍부한 산업*:
- 10-20년 운영된 PMS 통합 스크립트
- 특정 OTA만 아는 *비공식 컨트랙트 룰*
- 새벽 배치의 *왜 그렇게 도는지 아무도 모르는* 한 줄
- 호텔별 *예외 처리 룰*이 한두 명의 머리에만

→ **CRS·Connectivity·PickMe에서 *Sara 후보 5명* 식별**은 *분기 회고*에서 *반드시* 해야 할 작업. 식별만 해도 *조직 신뢰 자산 보호*가 시작됨.

### *경영진의 탐욕*은 호스피탈리티에서 어떻게 작동하는가?
- *분기 코스트 절감*이 KPI가 되면 → 시니어 1명이 주니어 3명을 *AI로 커버*하는 모델로 압박
- *눈앞 효율*은 보이지만 *5년 후 시니어 부재*는 안 보임
- [Lord의 *defining constraint*](../engineering/2026-04-28-three-constraints-before-i-build-anything.md)·[antirez의 *난이도 천장*](../engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md)이 작동하려면 *주니어가 시니어로 자라는 파이프라인*이 필요. 그게 끊기면 5년 후 *모든 채택 옹호 글이 무의미해짐*

### MangoLove·개인 적용
- ***Sara 식별 분기 의례*** 후보: 분기마다 *"우리 회사의 Sara는 누구인가? 그가 떠나면 무엇이 멈추는가?"* 5분 자문
- *주니어 멘토링 슬롯*을 *비용*이 아니라 *5년 투자*로 의식적 분류 — KPI 외 *멘토 시간*을 *별도 측정*
- *Goodhart's Law 자가 진단*: *내가 자랑하는 지표*가 *실제 가치를 측정*하는지 분기마다 점검 (예: 가든 commit 수 vs 가든 *재참조* 수)

### 반론·균형점
- *경영진 탐욕* 단일 원인은 *과한 단순화* — 시장 압력·투자 환경·기술 변화 등 *복합 원인*이 더 정확
- *AI는 가면일 뿐*이라는 주장도 *부분적 진실* — AI는 *진짜 능력*도 가짐. 다만 *그 능력이 *어떻게* 사용되는가*가 결정적이라는 게 더 정확한 표현
- *Sara 우화*가 *낭만화 위험* — 모든 기관 지식이 *지킬 가치*가 있는 건 아님. 일부는 *해소되어야* 할 부채

### 가든 메타 — 비판 시리즈 9개 후 정리 필요
9개가 쌓였으니 *분기 회고* 시 다음 정리 필요:
1. **9개 글의 *공통점·차이점 매트릭스*** 작성
2. *각 글의 *유효 기간*** 평가 (어떤 비판이 5년 후에도 유효할까?)
3. **MangoLove에 누적된 적용 후보** 우선순위 재정렬

이건 [생산적 미루기 자가 진단](2026-05-07-productive-procrastination.md)이 적용되는 시점 — *읽기와 쓰기는 충분하다. 한 번 멈추고 정리할 시점*.

## 즉시 시도할 액션 3가지
1. **CRS·Connectivity·PickMe *Sara 후보 5명* 식별 메모** — 누가 떠나면 *무엇이 멈추는가*
2. **분기 *Goodhart's Law 자가 진단*** — 자랑하는 지표가 *실제 가치 측정*인지 점검 (가든 commit 수 vs 재참조 수 같은 형태)
3. **AI 비판 시리즈 9개 *공통점·차이점 매트릭스*** 분기 회고 시 작성 — 가든 메타 정리

## 연관 자료
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — Sara cron의 *왜* 부재 = 의도 부채
- [`engineering/2026-05-07-bottleneck-was-never-the-code.md`](../engineering/2026-05-07-bottleneck-was-never-the-code.md) — *맥락은 침투할 수 없다* = Sara 인계 불가성
- [`engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md`](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) — *Loop Intelligence 부재*가 Sara를 못 보게 만듦
- [`ai/2026-05-07-appearing-productive-in-the-workplace.md`](../ai/2026-05-07-appearing-productive-in-the-workplace.md) — *신뢰 자산*이 Sara 한 명에 묶여 있음
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](../ai/2026-05-05-agentic-coding-is-a-trap.md) / [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](../ai/2026-05-07-claude-code-not-making-your-product-better.md) — 주니어 측 위축의 더 강한 형태
- [`career/2026-04-27-how-to-hire-someone-better-than-yourself.md`](2026-04-27-how-to-hire-someone-better-than-yourself.md) / [`career/2026-05-04-learnings-from-1000-interviews-at-amazon.md`](2026-05-04-learnings-from-1000-interviews-at-amazon.md) — *그 채용 자체가 일어나지 않는다*는 한 단계 위 비판

## 한 달 뒤 회고
- [ ] CRS·Connectivity·PickMe *Sara 후보 5명* 식별 메모 작성했는가
- [ ] *Goodhart 자가 진단*을 한 번이라도 시도했는가 (가든·BugSip·CRS 중)
- [ ] AI 비판 시리즈 9개 매트릭스 정리 시간을 잡았는가
- [ ] *주니어 멘토 시간*이 별도 측정 항목으로 들어갔는가
