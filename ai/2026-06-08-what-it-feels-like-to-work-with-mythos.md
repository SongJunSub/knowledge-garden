---
title: "Mythos와 일하는 느낌 (Ethan Mollick) — '마법사'에서 '후원자'로, 그러나 검증 없이는 판정도 불가 (경계 자산)"
source_title: "What it feels like to work with Mythos"
source_url: "https://www.oneusefulthing.org/p/what-it-feels-like-to-work-with-mythos"
source_name: "oneusefulthing.org (Ethan Mollick) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30368"
summarized_at: "2026-06-08"
category: "ai"
tags: ["mythos", "fable-5", "wizard-to-patron", "blackbox-agent", "verification", "token-cost", "ethan-mollick", "boundary-asset"]
---

# Mythos와 일하는 느낌 (Ethan Mollick) — '마법사'에서 '후원자'로, 그러나 검증 없이는 판정도 불가 (경계 자산)

> 출처: [What it feels like to work with Mythos](https://www.oneusefulthing.org/p/what-it-feels-like-to-work-with-mythos) (Ethan Mollick, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Wharton 교수 Ethan Mollick의 Fable 5/Mythos 체험기 — *단일 프롬프트와 한 번의 피드백으로 지금껏 AI가 만든 것 중 가장 정교한 학술 사회과학 논문*, *모든 단어가 's'로 시작하는 10페이지 운율시*, *2,200개 항공편 데이터로 9시간+ 등시선 지도*, *9시간 30분 자율 소프트웨어 개발*. 핵심 변화: 사용자가 *직접 작업하는 "마법사"*에서 *결과를 판정하는 "후원자(patron)"*로 전환되고, *모델이 자체 에이전트를 운영하며 과정은 불가시적(블랙박스)*. 한계: *Opus 대비 2배 비싼 토큰*, *보안 관련 사소한 기미에도 가드레일이 작동해 성능 저하*, *들쭉날쭉한 frontier 구간*. 댓글의 정곡: *"생성 코드의 품질·실질 내용이 거의 없고 문서·테스트·안전성 검증 부재"*, *"위험도 낮은 프로젝트엔 강하나 장기 유지보수·진화 요구사항엔 한계"*, *"40분 리뷰에서 주간 한도 16% 소모"*, ***"모든 데이터가 검증돼야 한다고 프롬프트한 후에도 그냥 믿어버림."*****

## 핵심 포인트

- **[[2026-06-08-claude-fable-5-mythos-5-release]]·[[2026-06-08-claude-fable-hidden-capability-limiting]]의 1인칭 체험 짝** — *출시(주장)·숨은 제한(비판)* 다음의 *실사용 느낌*. *보안 사소한 기미에도 가드레일* = [[2026-06-08-claude-fable-hidden-capability-limiting]] *과차단·오탐*의 체감.
- **"마법사 → 후원자" = orchestration-tax의 lived experience** — *직접 만들지 않고 결과를 판정*. **[[2026-05-29-orchestration-tax]] *"하나의 조율된 답으로 돌아온다"* + [[2026-06-08-loop-engineering]] *"에이전트를 프롬프트하는 시스템 설계, 검증은 사람"*의 *교수 1인칭 실증*** — 역할이 *생산자에서 판정자로*.
- **그러나 — 검증 없이는 판정도 불가** — *"데이터 그냥 믿음·코드 품질 없음·검증 부재"*. **[[2026-06-01-domain-expertise-is-the-real-moat]] *검증=해자* + [[2026-06-08-users-dont-care-but-you-should]] *안 보이는 품질*의 경고** — *"후원자"가 되려면 *판정할 능력(검증)*이 있어야 하는데, 블랙박스 + 검증 부실이면 *판정 불가*.*
- **위험도 낮은 작업에만 강함 (댓글)** — *장기 유지보수·진화 요구사항엔 한계*. **[[2026-06-01-ask-hn-why-anti-ai]] docmars *"프로토타입 vs 견고 시스템"* + [[2026-06-01-code-is-cheaper]] *이해 비용*의 교수 vs 엔지니어 관점 차이** — *교수는 유지보수 안 함 → 위험도 낮은 작업 편향*.
- **토큰 비용 (40분에 16%)** — **[[2026-06-08-ai-is-slowing-down]]·[[2026-06-08-claude-fable-5-mythos-5-release]] *8분 $15*의 체감 데이터** — *후원자 모델은 비싸다*.

## 인상 깊은 문장

> *(Mollick, 요지)* 당신은 *직접 작업하는 마법사*가 아니라, *결과를 판정하는 후원자(patron)*가 된다 — 모델이 자체 에이전트를 운영하고, 과정은 *블랙박스*다.

> *(댓글)* 모든 데이터가 *실제이고 검증돼야 한다*고 프롬프트한 뒤에도, 모델은 *그냥 믿어버렸다*.

> *(댓글)* LLM은 *위험도 낮은 프로젝트*엔 강하지만, *장기 유지보수와 진화하는 요구사항* 환경에선 한계가 있다.

## 내 생각 · 적용점

### *경계 자산* — 경외(후원자 도약)와 회의(검증·비용·위험)의 공존

Mollick의 *"괴물 같은 생산성"*(긍정)과 댓글의 *"검증 부재·비용·위험도 낮은 작업 편향"*(회의)이 공존하는 **경계·문화 자산**. 선례([[2026-06-01-ask-hn-genai-oh-shit-moments]]·[[2026-06-08-design-with-claude-more-than-figma]])대로 *친·반 균형 카운팅 보류*, 부채 *0 유지*.

### *"후원자의 역설" — 판정하려면 검증할 수 있어야 한다*

이번 세션 핵심의 가장 또렷한 1인칭 확인: **"마법사→후원자"는 [[2026-05-29-orchestration-tax]]·[[2026-06-08-loop-engineering]]가 처방한 *바로 그 역할 이동*이다.** 그러나 *후원자의 역설*: ***결과를 판정하려면 판정할 능력(검증·도메인)이 있어야 하는데, 과정이 블랙박스이고 검증이 부실하면 "후원자"는 *판정 못 하는 거수기*가 된다.*** Mollick이 *위험도 낮은 작업*에서 빛난 건, *그 영역에선 판정 실패 비용이 낮기* 때문. → 처방: *후원자가 되려면 [[2026-06-08-30x-ai-engineer-with-taste]] taste·[[2026-06-01-domain-expertise-is-the-real-moat]] 도메인 검증 능력*을 *먼저* 갖추고, *고위험 영역엔 검증 게이트*를. 그렇지 않으면 [[2026-06-08-users-dont-care-but-you-should]] *안 보이는 품질*이 *후원자 모르게* 결과를 망친다.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [What it feels like to work with Mythos](https://www.oneusefulthing.org/p/what-it-feels-like-to-work-with-mythos) (원문)
- [GeekNews — 30368](https://news.hada.io/topic?id=30368)
- [[2026-06-08-claude-fable-5-mythos-5-release]]·[[2026-06-08-claude-fable-hidden-capability-limiting]] — 출시·숨은 제한 *(1인칭 체험 짝)*
- [[2026-05-29-orchestration-tax]]·[[2026-06-08-loop-engineering]] — 마법사→후원자 *(lived experience)*
- [[2026-06-01-domain-expertise-is-the-real-moat]]·[[2026-06-08-30x-ai-engineer-with-taste]]·[[2026-06-08-users-dont-care-but-you-should]] — 검증·taste *(후원자의 역설)*
- [[2026-06-01-ask-hn-why-anti-ai]]·[[2026-06-01-code-is-cheaper]] — 위험도 낮은 작업 vs 견고 시스템
- [[2026-06-08-ai-is-slowing-down]] — 토큰 비용
- [[2026-06-01-ask-hn-genai-oh-shit-moments]]·[[2026-06-08-design-with-claude-more-than-figma]] — 경외·블랙박스 *(경계 선례)*

## 한 달 뒤 회고
*(2026-07-08 즈음 — "후원자"로서 실제로 결과를 판정할 검증 능력이 있었는지, 블랙박스·검증 부실이 판정을 거수기로 만들지 않았는지, 고위험 작업에 검증 게이트를 뒀는지, 토큰 비용이 후원자 모델을 정당화했는지 기록.)*
