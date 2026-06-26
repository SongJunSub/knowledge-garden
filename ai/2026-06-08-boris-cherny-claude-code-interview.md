---
title: "Boris Cherny (Claude Code 책임자) 대담 — '내 코드 100%를 Claude Code가, 휴대폰으로', 추상화가 코드→에이전트→루프(고차함수)로·병목은 연쇄 이동·역할은 지휘자로 (AI 도구 설계·제품 라인, 친 극·벤더 시각 유의)"
source_title: "Boris Cherny (Anthropic, Claude Code lead) on the present & future of AI coding"
source_url: "https://www.youtube.com/watch?v=uvg9UmI0PuQ"
source_name: "Boris Cherny 인터뷰 (YouTube) · Harvest 요약 경유"
referrer_url: "https://harvest.pub/shared/1cd0e5b1-4fb9-447b-85ad-eab074ed9bdc"
published_at: "2026-06-26"
summarized_at: "2026-06-08"
category: "ai"
tags: ["claude-code", "loops", "co-work", "test-time-compute", "roi-not-cost", "bottleneck-chain", "role-shift", "vendor-view"]
---

# Boris Cherny (Claude Code 책임자) 대담 — '내 코드 100%를 Claude Code가, 휴대폰으로', 추상화가 코드→에이전트→루프(고차함수)로·병목은 연쇄 이동·역할은 지휘자로 (AI 도구 설계·제품 라인, 친 극·벤더 시각 유의)

> 출처: [Boris Cherny 인터뷰 (YouTube)](https://www.youtube.com/watch?v=uvg9UmI0PuQ) · Harvest 요약 경유 · 정리일 2026-06-08

## 한 줄 요약

**Anthropic의 Claude Code 책임자 *Boris Cherny* 가 (Meta 제품 디렉터와) AI 코딩의 현재·미래를 말한 대담. 충격적 주장들: ***"작년 11월 Opus 4.5 이후 내 코드의 100%는 Claude Code가 작성", "코딩의 대부분이 휴대폰으로"*** (올해 +40만 줄·−25만 줄·8B 토큰), *Anthropic 내부 엔지니어 1인당 코드량 8배*. 프레임: ***추상화가 "소스코드=구문 → 에이전트=함수 → 루프(Loops)=고차 함수(에이전트가 코드 짜는 에이전트를 프롬프팅)"*** 로 올라가고(Boris 코드의 ~30%가 이미 루프), *비엔지니어용 Co-work*("clouds talking to clouds"로 상태 수집·여행 예약 자율), *Fable은 "던져줄 어려운 문제를 못 찾을 정도"*. 핵심 명제: ***병목은 연쇄 이동(코딩→코드리뷰→보안→아이디어 생성), 비용이 아니라 ROI로 평가, 역할은 코더→지휘자(감독·아이디어·프롬프트)***, 그리고 *Auto Mode·Output Styles(learning)*. ⚠️ **단, Anthropic 임원의 홍보성 대담 — 100%·8x·Fable 같은 주장은 벤더 시각·낙관 편향을 감안해 읽는다(이번 세션의 회의 글들과 함께 저울질).**

## 핵심 포인트

- **"내 코드 100%·휴대폰 코딩·8x"** — ***"Opus 4.5 이후 내 코드 100%는 Claude Code", "대부분 휴대폰으로"***, *Anthropic 내부 1인당 코드량 8배*. (인상적이나 *벤더 자기보고* — [[2026-06-08-claude-tag-slack]] "65%"처럼 회의적으로.)
- **추상화의 진화: 코드 → 에이전트 → 루프(고차 함수)** — ***"소스코드=구문, 에이전트가 코드 짜는 것=함수, 루프=고차 함수(에이전트가 코드 짜는 에이전트를 프롬프팅)."*** *Boris 코드 ~30%가 이미 루프, 곧 업계 전반 폭증 예측*. → [[2026-06-08-the-coming-loop]] *하네스 레벨 루프*·[[2026-06-08-harness-engineering-jaehong]]의 **인사이더 1차 확인**.
- **Co-work = 비엔지니어용 (Claude Tag의 사촌)** — *Claude Code 인프라 + VM·안전장치로 비엔지니어 사용*. *PM 자동화(스프레드시트·Slack로 상태 수집 — "clouds talking to clouds"), 여행 예약 자율(이메일·캘린더 스캔 → 항공·호텔, Boris 무개입)*. → [[2026-06-08-claude-tag-slack]] *멀티플레이어 비동기 팀원*의 같은 비전.
- **병목의 연쇄 이동 + ROI not cost** — *코딩 해결 → "아이디어를 더 빨리/시장에 더 빨리"*. ***비용이 아니라 ROI*** — *전 직원에게 토큰 주고 자유 실험*, *"약간의 비용 절감이 수천% 잠재 수익을 무효화하니 최고 모델(Fable)을 기본으로"*. → [[2026-06-08-who-prices-intelligence]] *services-as-software*·[[2026-06-08-the-untrainable]] *"병목은 측정 밖(아이디어)"*. (단 이건 *오픈/비용 절감*([[2026-06-08-glm-5-2-local-run]]·[[2026-06-08-switching-to-open-models]])과 정면 대립하는 벤더 입장.)
- **코드리뷰·보안 병목 + 테스트 타임 컴퓨팅(4번째 확장 법칙)** — *Claude Code Review(인간 전 98~99% 버그 발견), Claude Security(코드베이스 스캔, 전문가도 놓친 취약점)*. ***Test Time Compute = "4번째 확장 법칙"*** — *CI 최적화 프롬프트 → 수십~수백 하위 에이전트를 동적 조직, 수 시간 분석 → CI 50% 단축 PR 4개*. → [[2026-06-08-agentic-code-review]]·[[2026-06-08-hacking-google-with-ai-bug-bounty]] *"검증 하네스"*와 정합.
- **역할 전환 + 나태함 방지** — *코드 직접 작성 → 에이전트 감독·아이디어/프롬프트 기획(지휘자)*. *프롬프트 피로(맹목적 Yes) → **Auto Mode**(맥락으로 모델이 승인 결정)*, *Output Styles를 `exploratory`/`learning`으로 → 정답 코드만 주지 말고 원리 설명·자체 수정 가이드*. → [[2026-06-08-redesigning-expertise-ai-era]] *생산→검증·운영 책임자*, [[2026-06-08-is-ai-eroding-our-skills-nature]] *디스킬링 방어*.

## 인상 깊은 문장

> "작년 11월 Opus 4.5 모델이 나온 이후로, 제가 작성하는 코드의 100%는 Claude Code가 작성하고 있습니다." (Boris Cherny — 단 벤더 임원의 자기보고)

> "소스 코드가 프로그래밍의 '구문'이라면, 에이전트가 코드를 작성하는 것은 '함수', 루프는 '고차 함수'와 같습니다."

> "가끔은 엔지니어들의 개인 Claude가 답변을 하기도 해요 — 말 그대로 '클로드들끼리 서로 대화(clouds talking to clouds)'를 나누는 셈이죠."

> "매번 묻는 대신, 대화의 맥락을 바탕으로 모델이 스스로 승인 여부를 결정하게 만들었습니다." (Auto Mode)

## 댓글 (전수 확인)

> Harvest(영상 AI 요약 플랫폼)의 공유 페이지 — **댓글 기능 없음**(YouTube 원본 영상의 댓글은 별개). 아카이브용 메타로만 남김.

## 내 생각 · 적용점

### AI 도구 설계·제품 라인 (친(AI 코딩 낙관) 극에 근접, 벤더 시각 유의 — 라인 자산으로 카운팅 무관)

이 대담은 ***친(AI 코딩 자동화 낙관) 극에 가장 가까운 인사이더 시각*** — Anthropic Claude Code 책임자의 홍보성 입장이다. 균형 의례 카운팅 규칙 확정이 어려워 라인 자산으로 두고 수치 보존(사용자 재카운팅 가능)하되, *100%·8x·Fable·"비용 절감 말고 최고 모델"* 같은 주장은 벤더 인센티브를 감안해 [[2026-06-08-glm-5-2-local-run]]·[[2026-06-08-switching-to-open-models]] *통제권/비용*, [[2026-06-08-the-coming-loop]] *품질 회의*와 함께 저울질. 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — "루프=고차 함수" 프레임의 인사이더 확인

가장 전이력 높은 통찰: ***"소스코드=구문, 에이전트=함수, 루프=고차 함수"*** + *Boris 코드 ~30%가 루프* — 이번 세션의 [[2026-06-08-the-coming-loop]](Armin)·[[2026-06-08-harness-engineering-jaehong]]를 **만든 쪽(Claude Code 책임자)이 같은 그림을 확인**한 셈. 단 Armin의 경계(*루프는 포팅·탐색엔 OK, 오래 가는 코드엔 독*)를 Boris의 낙관과 **반드시 함께** 읽는다. 내 적용: *루프를 "고차 추상화"로 의식적으로 다루되(어떤 작업에 루프를 걸지 설계), human-in-loop·검증을 게이트로*.

### 핵심 전이 2 — "비용이 아니라 ROI"는 절반의 진실 (벤더 입장 vs 통제권)

***"비용 절감 말고 최고 모델을 기본으로(작은 절감이 수천% 수익을 무효화)"*** 는 *토큰을 파는 Anthropic의 입장*이다. 정직한 양면: *ROI 관점(생산성 폭증 시 모델비는 작다)은 맞을 수 있으나*, [[2026-06-08-glm-5-2-local-run]]·[[2026-06-08-switching-to-open-models]] *"오픈/통제권·락인 회피"*·[[2026-06-08-noise-bottleneck]] *"벤더 통계 거르기"* 와 **정면 대립**. 내 판단: *고가치·핵심 작업엔 최고 모델, 민감/대량/실험엔 오픈·저비용 — "ROI vs 통제권"을 둘 다 본다*. CRS는 ROI도 크지만 데이터 주권·락인도 1급.

### 핵심 전이 3 — "병목 연쇄 이동" + "지휘자로의 역할 전환" = 세션의 종합

***코딩→코드리뷰→보안→아이디어 생성*** 으로 병목이 옮겨가고, *역할이 코더→지휘자(감독·아이디어·검증)* 로 — 이건 [[2026-06-08-redesigning-expertise-ai-era]] *"생산→검증·운영 책임자"*·[[2026-06-08-the-untrainable]] *"병목은 측정 밖(아이디어·판단)"*·[[2026-06-08-agentic-code-review]]·[[2026-06-08-hacking-google-with-ai-bug-bounty]] *"검증/보안 하네스"* 를 인사이더가 한 줄로 묶은 것. **내 역량 투자는 "코드 생산력"이 아니라 "아이디어·검증·도메인 판단(지휘)" + 디스킬링 방어(Output Styles `learning`처럼 "왜"를 배우며 쓰기)**.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건(Boris의 구문/함수/루프·4번째 확장 법칙은 *대담의 내용*). *AI 도구 설계·제품 라인*(친 극 근접, 벤더 시각 유의, 라인 자산으로 카운팅 무관). 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Boris Cherny 인터뷰 (YouTube) · Harvest 요약 · [공유 링크](https://harvest.pub/shared/1cd0e5b1-4fb9-447b-85ad-eab074ed9bdc)
- [[2026-06-08-the-coming-loop]]·[[2026-06-08-harness-engineering-jaehong]] — *"루프=고차 함수"(인사이더 확인, Armin의 경계와 함께)*
- [[2026-06-08-claude-tag-slack]] — *"Co-work=비엔지니어용 비동기 팀원(clouds talking to clouds)"*
- [[2026-06-08-agentic-code-review]]·[[2026-06-08-hacking-google-with-ai-bug-bounty]] — *"코드리뷰·보안 하네스·테스트 타임 컴퓨팅"*
- [[2026-06-08-redesigning-expertise-ai-era]]·[[2026-06-08-the-untrainable]] — *"생산→검증·역할은 지휘자·병목은 아이디어"*
- [[2026-06-08-glm-5-2-local-run]]·[[2026-06-08-switching-to-open-models]]·[[2026-06-08-noise-bottleneck]] — *"ROI not cost의 대립항: 통제권·비용·벤더 통계 회의"*
- [[2026-06-08-is-ai-eroding-our-skills-nature]] — *"Output Styles learning=디스킬링 방어"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — 루프를 "고차 추상화"로 의식적으로 설계하되 검증 게이트를 뒀는지, "ROI vs 통제권"을 둘 다 보고 모델을 배치했는지, 역량을 "코드 생산"이 아닌 "아이디어·검증·지휘"로 재투자했는지, Output Styles `learning`처럼 "왜"를 배우며 썼는지 기록. 그리고 벤더 낙관(100%·8x)을 1년 뒤 실제와 대조.)*
