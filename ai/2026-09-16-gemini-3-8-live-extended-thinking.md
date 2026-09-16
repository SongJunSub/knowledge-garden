---
title: "Google, 대화하며 추론하는 Gemini 3.8 Live와 Extended Thinking 출시 (Google) — 실시간 음성 응대용 모델과 다단계 추론용 모델을 쌍으로 나눠, '빠름'과 '깊음'을 애초에 한 모델에 욱여넣지 않았다"
source_title: "Gemini 3.8 Live and Extended Thinking"
source_url: "https://blog.google/"
source_name: "Google 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=33755"
published_at: "2026-09-15"
summarized_at: "2026-09-16"
category: "ai"
tags: ["Gemini", "음성AI", "추론모델", "GeekNews"]
---

# Google, 대화하며 추론하는 Gemini 3.8 Live와 Extended Thinking 출시

> 출처: [Gemini 3.8 Live and Extended Thinking](https://blog.google/) (Google 공식 블로그) · 정리일 2026-09-16

## 한 줄 요약
**Google이 비용 효율적 실시간 대화용 Gemini 3.8 Live와 고난도 다단계 추론용 Extended Thinking을 동시에 출시했다 — 음성으로 대화하면서도 내부적으로는 "확인해 볼게요" 이후 여러 단계 작업을 진행하며 상황을 음성으로 알려주는 구조다.**

## 핵심 포인트
- Gemini 3.8 Live(비용 효율형 실시간 대화)와 Extended Thinking(다단계 추론 강화형) 두 모델을 동시 출시, Gemini API·AI Studio·Gemini Enterprise·Search Live·Workspace 등에 순차 적용
- Extended Thinking이 Artificial Analysis의 Speech-to-Speech Quality Index에서 ***82.6점으로 1위*** 기록
- 에이전틱 과업 완수율 τ-Voice ***68.6%***, Sierra 뱅킹 벤치마크 τ-Voice-banking ***35.1%***, Big Bench Audio 추론 벤치마크 ***97.7%***
- 실시간 시각 입력 처리 + ***97개 언어를 대화 도중 자동 감지해 전환*** — 도구·API를 실행하는 동안에도 대화가 끊기지 않고 이어짐
- Extended Thinking은 "확인해 볼게요"라고 응답한 뒤 여러 단계의 작업을 진행하면서 상황을 음성으로 알려주는 방식으로 ***추론과 발화를 동시에 수행***

## 인상 깊은 문장
> (2차 보도 표현) "built for high-complexity tasks, with increased intelligence and multi-step reasoning"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. HN/Lobsters 크로스포스트 여부는 확인하지 못했다. Google 공식 블로그 원문은 WebFetch 실패로 9to5google·Thurrott·MarkTechPost 등 2차 보도의 스니펫으로 재구성했다 — 벤치마크 수치는 전부 벤더 자체 발표라 마케팅 편향을 감안해야 하고, 독립 검증은 아직 없다.

## 내 생각 · 적용점
"빠른 응답 모델"과 "깊은 추론 모델"을 별도 제품으로 쪼갠 건 Claude Code의 fast mode/Extended Thinking 구분이나 OpenAI의 모델 티어링과 같은 방향이다 — ***음성 인터페이스에서는 지연시간이 곧 UX***이기 때문에 이 분리가 텍스트 챗봇보다 훨씬 절실하다. **[[2026-09-11-google-gemini-windows-app]]**과 함께 보면 Google이 Gemini를 "쓰는 자리"를 텍스트에서 음성·OS 레벨로 계속 넓히는 흐름이 보인다.

## 호스피탈리티 / CRS 적용 포인트
전화 예약·컨시어지 음성 응대처럼 실시간성이 중요한 채널에 "빠른 확인 응답 + 백그라운드 다단계 처리"라는 패턴은 직접 참고할 만하다 — 고객이 전화로 예약 변경을 요청했을 때 즉시 "확인해 보겠습니다"라고 답하고 실제 PMS 조회·재고 확인은 비동기로 처리하는 흐름 설계에 응용 가능.

## 연관 자료
- [[2026-09-11-google-gemini-windows-app]] — 같은 시기 Gemini의 플랫폼 확장, 음성 대신 OS 통합 축
- [[2026-09-04-gemini-weekly-update-sept-week1]] — Gemini 최근 업데이트 흐름의 앞선 지점

## 한 달 뒤 회고
2026-10-16 즈음, Extended Thinking의 벤치마크 수치가 독립 평가로 검증됐는지, 실제 음성 에이전트 제품(콜센터·컨시어지)에 채택된 사례가 나왔는지 점검.
