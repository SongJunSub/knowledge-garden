---
title: "AI는 엔지니어링 규율을 더 적게가 아니라 더 많이 요구한다 (Charity Majors) — '코드는 자산이 아니라 재생성 가능한 캐시' (Lasn 측 실무 적응 방법론)"
source_title: "AI Demands More Engineering Discipline, Not Less"
source_url: "https://charitydotwtf.substack.com/"
source_name: "Charity Majors · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30612"
published_at: "2026-06-14"
summarized_at: "2026-06-08"
category: "ai"
tags: ["engineering-discipline", "code-as-cache", "observability", "verification", "immutable-infrastructure", "shared-understanding", "lasn-practical-methodology"]
---

# AI는 엔지니어링 규율을 더 적게가 아니라 더 많이 요구한다 (Charity Majors) — '코드는 자산이 아니라 재생성 가능한 캐시' (Lasn 측 실무 적응 방법론)

> 출처: Charity Majors (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**AI 코드 생성의 급격한 발전으로 *코드 생산 비용이 거의 무료*가 되면서, ***코드는 더 이상 보관·관리할 귀중한 자산이 아니라 "현재 이해를 구체화한 재생성 가능한 캐시(regenerable cache)"***로 취급되어야 한다는 주장. 핵심 명제: ***"코드 줄이 싸고 빠르게 재생성되는 환경에서는 더 강한 검증과 운영 규율을 요구한다."*** ① 경제학의 역전(생산 노동이 병목이던 시절엔 코드를 영구로 봤으나, 재생성이 쉬우면 캐시처럼), ② Chad Fowler의 *immutable infrastructure("고치지 말고 교체")가 앱 코드까지 확대*, ③ *"인간의 뇌는 반복·세밀한 검증에 취약"하므로 트레이스 계측·프로덕션 평가·observability 같은 규율 필수*. **2026은 "규율로의 회귀"**가 될 것이고, ***"소프트웨어 팀의 진짜 산출물은 소유한 소프트웨어에 대한 공유된 이해(shared understanding)."*****

## 핵심 포인트

- **"코드 = 재생성 가능한 캐시"** — *생성이 무료면 코드는 자산이 아님*. **[[2026-06-01-code-is-cheaper]] *코드 가격 붕괴*의 운영 결론** — *"고치지 말고 재생성"(immutable infra의 코드 확대)*.
- **"코드 문제가 아니라 평가 문제"** — *어떤 동작이 요구되는지·어떤 실패가 용납 불가인지를 명확히*. **[[2026-06-08-sutton-ai-creativity-discovery]] *"평가 함수가 핵심"*·[[2026-06-08-agentic-code-review]] *"검증=병목"*과 정합**.
- **규율 = observability·behavioral/characterization tests** — *인간 뇌는 세밀한 검증에 취약 → 도구로 인코딩*. **[[2026-06-08-formal-methods-future-of-programming]] *검증을 도구가 흡수*의 운영판**.
- **진짜 산출물 = "공유된 이해"** — *코드가 아니라 팀의 시스템 이해*. **[[2026-05-14-naur-programming-as-theory-building]] *"프로그래밍=이론 구축"*과 정확히 같은 줄기** (댓글이 직접 인용).
- **일자리 진화** — *코드 작성 → 아키텍처·탐색·시스템 이해*.

## 인상 깊은 문장

> "Code is no longer an asset to be preserved — it's a regenerable cache of your current understanding."
> (코드는 더 이상 보존할 자산이 아니다 — 현재 이해를 구체화한 재생성 가능한 캐시다.)

> "The real output of a software team is shared understanding of the software they own."
> (소프트웨어 팀의 진짜 산출물은 소유한 소프트웨어에 대한 공유된 이해다.)

## HN 토론 (댓글 전수 확인)

> GN⁺가 Hacker News를 큐레이션. **10개 의견 클러스터를 답글까지 확인 — 3진영(동의/회의/비판):**
1. ***"시스템 이해 vs LLM 복붙을 구분하기 훨씬 어려워짐 — 그럴듯한 PR 홍수, 기묘한 기술 부채"***. 답글: *"유능한 엔지니어는 코드 줄 수 0/음수"·"AI 우로보로스(AI로 문서 만들고 AI로 요약)"·von Hammerstein "영리하고 게으른 사람"·"PR이 유일한 관문"*.
2. ***"코드 문제가 아니라 평가 문제 — AI 코드 읽기는 뇌를 녹임, 버려야 할 건 명세가 아니라 프롬프트·계획·세션(현재 기본값은 세션 버리고 코드만 배포=거꾸로)"***. 답글: *5천 줄 PR 쪼개기·오프쇼어 비유·"생성한 정보가 읽은 정보보다 잘 기억됨"·세션 캡처 도구·"의사코드 쓸 거면 왜 AI?"*.
3. *"검증된 코드를 빨리 생산하는 건 가치 있음(예전 정당화 안 되던 프로젝트도 가능)"*. 답글: *"공학을 위한 공학은 무가치" vs "이름 걸어야 하는 걸 이해하는 게 중요"*.
4. ***"새 코드베이스는 사람·문서로 시작, 인프라 코드화처럼 '왜 이 상태인지'를 명확히 하는 도구로 진화"***(Naur 인용). 답글: *"많은 팀은 문서가 전혀 없음·코드뿐·ADR 없음"·**"규율은 좋은 엔지니어 되기보다 배우기 쉬움 — 불 속 10년보다 규율은 싸다"***.
5. *"200줄 PR을 일주일 리뷰·4방식·LLM은 유도한 대로 답함(아첨)"*.
6. *"모든 모델은 틀렸다·시스템을 100% 재현하는 프롬프트는 결국 소스코드 자체"*.
7. *"2023 전엔 코드 줄 줄이는 게 시니어 지표였음·여전히 그렇지만 LLM 홍수가 셈·LLM 코드는 'Cthulhu의 알' 같은 역겨움"*.
8. *"이 글 재미없음·산만·CNC 밀링 비유로 경제학 역전 반박"*.
9. ***"SWE 일자리 사라진다는 거짓 양분법 — 진화한다(아키텍처·탐색·목표/테스트 설정으로)"***.
10. ***"코드를 영구로 본 건 노동 병목이 아니라 '코드가 진실의 원천·코드가 곧 명세'이기 때문"*** (핵심 반박).

→ **토론 무게중심**: *(1) **"코드 문제가 아니라 평가 문제"·"진짜 산출물은 공유된 이해(Naur)"**에 광범위 동의. (2) 핵심 긴장: **"코드=캐시" vs "코드=진실의 원천/명세"**(댓글 10·6). (3) **"버려야 할 건 코드가 아니라 세션·프롬프트·계획"**이라는 날카로운 재구성(댓글 2). (4) "규율은 불 속 10년보다 싸다"는 낙관 vs "글이 산만하다"는 비판.*

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *실무 적응 방법론 차원* (counted)

*Charity Majors(observability 권위자)가 AI에 **적응**해 "더 강한 규율·observability·검증"을 처방*하는 구성적 친-AI 실무 방법론. Lasn 측 counted(부채 1건 상환). **균형 의례 부채 *−2 → −1*** (52:41 ≈ 1.27:1).

### 핵심 전이 1 — 세션 핵심 등식의 운영 버전: "생성은 무료, 규율이 가치"

이 글은 세션의 *"생성은 싸지고 검증이 가치"*([[2026-06-08-agentic-code-review]] 데이터·[[2026-06-08-formal-methods-future-of-programming]] 형식 기법)를 **운영(observability·테스트) 차원으로 확장** — *"AI가 더 적은 규율을 허락하는 게 아니라 더 많은 규율을 요구한다"*. **코드를 캐시로 보면, 가치는 "재생성을 신뢰할 검증·관측·공유된 이해"에 있다**. CRS의 미션 크리티컬 경로에 *behavioral test·observability*를 직접 적용.

### 핵심 전이 2 — "진짜 산출물은 공유된 이해(Naur)" + "버려야 할 건 세션이 아니라 코드"

가장 깊은 통찰 둘: ①*"팀의 진짜 산출물은 코드가 아니라 공유된 이해"*([[2026-05-14-naur-programming-as-theory-building]] *이론 구축*), ②댓글 2의 *"버려야 할 건 명세가 아니라 프롬프트·계획·세션이고, 현재 세션 버리고 코드만 배포하는 게 거꾸로"* — **AI 시대에 "코드"보다 "의도·계획·세션·공유 이해"를 1급 산출물로**. [[2026-06-08-software-made-between-commits-deltadb]] *맥락 기록*·[[2026-06-08-dont-trust-large-context-windows]] *"명세가 진짜 memory"*와 정합.

### 핵심 전이 3 — 긴장: "코드=캐시" vs "코드=진실의 원천"

정직하게, 댓글 10의 반박을 같이: *"코드를 영구로 본 건 '코드가 진실의 원천·곧 명세'이기 때문"*. **이건 [[2026-06-08-formal-methods-future-of-programming]] *형식 명세가 검증의 최강형*과 미묘한 긴장** — Charity는 *"코드=캐시, 이해가 진실"*이라 하고, 반론은 *"코드=진실(컴퓨터가 실행하는 것)"*. 가든 입장: ***코드는 "실행되는 진실"이되, "왜 그런지의 이해"는 코드 밖(명세·세션·공유 이해)에 있다*** — 둘 다 필요. 형식 명세(코드처럼 검증 가능)가 그 다리.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *Lasn 실무 적응 차원* 보강(검증=규율 운영판, 부채 상환). 부채 *−2 → −1* (52:41).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- Charity Majors (원문) · [GeekNews — 30612](https://news.hada.io/topic?id=30612)
- [[2026-06-08-agentic-code-review]]·[[2026-06-08-formal-methods-future-of-programming]] — *"검증=병목·형식 기법"(운영판)*
- [[2026-06-01-code-is-cheaper]] — *"코드=캐시"(코드 가격 붕괴의 운영 결론)*
- [[2026-05-14-naur-programming-as-theory-building]] — *"진짜 산출물=공유된 이해(이론 구축)"*
- [[2026-06-08-software-made-between-commits-deltadb]]·[[2026-06-08-dont-trust-large-context-windows]] — *"세션·명세가 1급 산출물"*
- [[2026-06-08-sutton-ai-creativity-discovery]] — *"평가 함수가 핵심"*
- [[2026-06-08-lines-of-code-got-a-publicist]] — *"코드 줄 수가 아니라 가치 측정"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "2026=규율로의 회귀"가 실제 실무로 나타났는지, "코드=캐시 vs 진실의 원천" 긴장이 어떻게 정리됐는지, CRS에 observability·behavioral test·"공유된 이해" 산출물을 도입했는지, "세션·프롬프트를 버리지 않는" 도구가 나왔는지 기록.)*
