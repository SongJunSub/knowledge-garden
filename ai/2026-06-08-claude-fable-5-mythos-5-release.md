---
title: "Claude Fable 5/Mythos 5 — 5세대 프런티어 모델: 장기 자율·5천만 줄 마이그레이션·1주일 자율 ML (Lasn 측 공급자 제품 차원)"
source_title: "Claude Fable 5 and Mythos 5"
source_url: "https://www.anthropic.com/news/claude-fable-5-mythos-5"
source_name: "anthropic.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30328"
summarized_at: "2026-06-08"
category: "ai"
tags: ["claude-fable-5", "mythos-5", "frontier-model", "long-horizon-agent", "recursive-self-improvement", "supplier-product", "pricing", "lasn-side"]
---

# Claude Fable 5/Mythos 5 — 5세대 프런티어 모델: 장기 자율·5천만 줄 마이그레이션·1주일 자율 ML (Lasn 측 공급자 제품 차원)

> 출처: [Claude Fable 5 and Mythos 5](https://www.anthropic.com/news/claude-fable-5-mythos-5) (Anthropic, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Anthropic이 *장기 비동기 작업용 5세대 모델* 둘을 출시 — *Fable 5*(안전장치 적용 일반)와 *Mythos 5*(일부 안전장치 제거, Opus 상위 티어). 성능: ***5천만 라인 Ruby 마이그레이션을 하루*(팀 작업 대비 2개월 단축)**, *수일간 자율 작동·자기 검증*, *스크린샷만으로 웹앱 소스 재구성*, *메모리 Opus 대비 3배*, *SWE-Bench Pro 80.3%*. 과학: *단백질 설계 ~10배 가속*, *1주일 자율 작업으로 커스텀 ML 모델 설계·훈련*. 안전장치: *사이버보안·생물/화학·디스틸레이션 요청 시 자동 Opus 4.8 우회*. 가격 *입력 $10/출력 $50(1M 토큰)*, *6/9~22 구독 무료 → 6/23부터 크레딧*. 댓글: *"괴물 모델"·프론트엔드 디자인 다듬어짐·정밀 diff* ↔ *분류기 과공격적(보안 무관 코딩도 필터)·30일 데이터 보존(HIPAA 불명확)·구독 제거 "제약회사식 중독 유도"·8분에 $15·아키텍처 특별 혁신 없음(스케일·하네스가 동력)*.**

## 핵심 포인트

- **장기 자율 = 하네스의 모델 측 도약** — *수일 자율·자기 검증*, *5천만 줄 마이그레이션*. **[[2026-05-28-claude-opus-4-8-release]] 후속 + [[2026-06-01-harness-era-software-after-ai]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] *하네스·자동 검증*의 모델 능력 도약** — Bun 75만 줄([[2026-05-29-claude-code-dynamic-workflows]]) → *5천만 줄*.
- **1주일 자율 ML 설계·훈련 = RSI 진전** — *AI가 ML 모델을 자율 설계·훈련*. **[[2026-06-01-recursive-self-improvement-anthropic]] *재귀적 자기 개선*의 다음 데이터 점**.
- **"아키텍처 혁신 없음, 스케일·하네스가 동력" (댓글)** — *새 사전학습·더 큰 모델, 특별 혁신 없음*. **[[2026-06-01-harness-era-software-after-ai]] *"모델은 상품화, 하네스가 경쟁 레이어"*의 자기 확인** — 도약이 *아키텍처가 아니라 스케일·하네스·컨텍스트*.
- **프론트엔드 craft 의식 ("AI 분위기로 대충" 제거)** — *디자인 의도적으로 다듬어짐·정밀 diff*. **[[2026-06-08-taste-is-the-new-10x]] taste·[[2026-06-08-design-with-claude-more-than-figma]] *바이브 코딩 위험*에 대한 공급자 측 대응** — *"slop 느낌"을 제품이 의식*.
- **안전장치 vs 과차단 (containment 트레이드오프)** — *민감 요청 Opus 우회(95%+ 폴백 없음)* ↔ *분류기 과공격적으로 보안 무관 코딩도 필터·경쟁 모델 요청 0.03% 프롬프트 수정*. **[[2026-06-01-how-anthropic-contains-claude]] *환경 봉쇄*의 모델 분류기판 — 안전과 *과차단 비용*의 균형**.
- **가격·중독 전략 회의** — *8분에 $15·구독 제거 "제약회사식"*. **[[2026-06-08-ai-is-slowing-down]]·[[2026-05-24-microsoft-ai-more-expensive-than-employees]] 토큰 비용·ROI 회의의 신제품 적용** — *무료 미끼 후 사용량 과금*.

## 인상 깊은 문장

> *(요지)* Fable 5는 *5천만 라인 Ruby 코드베이스 마이그레이션을 하루*에 수행했다 — 팀 작업 대비 약 2개월 단축.

> *(요지)* 1주일간의 *자율 작업*으로 *커스텀 ML 모델을 설계하고 훈련*했다.

> *(댓글)* 분류기가 *매우 공격적이고 민감*해서, *보안과 무관한 코딩 작업*도 필터링된다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *공급자 제품 차원* — 모델 능력의 다음 도약

[[2026-05-28-claude-opus-4-8-release]](모델)·[[2026-06-01-codex-for-every-role]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]](제품)에 이은 *5세대 모델*. 균형 의례 부채 *-1 → 0 회복* (43:32 ≈ 1.34:1, 안전 마진 1.66) — 직전 AI 자본 클러스터(axelk)의 -1을 공급자 제품으로 상쇄. (Fable 5는 내가 속한 모델 계열 — 자기 참조 메타는 절제.)

### *능력 도약이 가든 양 라인을 동시에 강화한다*

이 출시는 가든의 *낙관(하네스·자율)*과 *회의(가격·과차단·craft)*를 **둘 다** 키운다:
- *낙관*: 5천만 줄·1주일 자율 ML = [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *코드 가격 붕괴*·[[2026-06-01-recursive-self-improvement-anthropic]] *RSI*의 가속.
- *회의*: 분류기 과차단·8분 $15·중독 전략 = [[2026-06-08-ai-is-slowing-down]] *비용*·[[2026-06-08-users-dont-care-but-you-should]] *craft(슬롭 제거)의 역설* — 능력↑이 *검토 병목·비용·과차단*을 동시에 키움.
- → ***"아키텍처가 아니라 스케일·하네스가 동력"*** 댓글이 핵심: 능력 도약조차 [[2026-06-01-harness-era-software-after-ai]] *하네스 명제*를 확인.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [Claude Fable 5 and Mythos 5](https://www.anthropic.com/news/claude-fable-5-mythos-5) (원문)
- [GeekNews — 30328](https://news.hada.io/topic?id=30328)
- [[2026-05-28-claude-opus-4-8-release]] — 공급자 제품 차원 *(후속 짝)*
- [[2026-06-01-harness-era-software-after-ai]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]]·[[2026-05-29-claude-code-dynamic-workflows]] — 하네스·자율·마이그레이션
- [[2026-06-01-recursive-self-improvement-anthropic]] — RSI *(1주일 자율 ML)*
- [[2026-06-01-how-anthropic-contains-claude]] — 봉쇄·분류기 *(과차단 트레이드오프)*
- [[2026-06-08-ai-is-slowing-down]]·[[2026-05-24-microsoft-ai-more-expensive-than-employees]] — 가격·ROI 회의
- [[2026-06-08-taste-is-the-new-10x]]·[[2026-06-08-design-with-claude-more-than-figma]]·[[2026-06-08-users-dont-care-but-you-should]] — craft·슬롭 제거

## 한 달 뒤 회고
*(2026-07-08 즈음 — Fable 5의 장기 자율이 실무에서 검증 병목을 넘었는지, 분류기 과차단이 개선됐는지, 가격/구독 전략이 어떻게 평가됐는지, 5천만 줄 류 주장이 실제 재현됐는지 기록.)*
