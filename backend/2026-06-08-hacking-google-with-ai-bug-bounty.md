---
title: "AI로 구글 API를 대규모 테스트해 버그바운티 $50만 (brutecat) — '정교한 익스플로잇이 아니라 인내', 반복되는 권한 검사 누락 + 검증 하네스(operation ID 재현)가 AI를 믿을 수 있게 (보안·AI 도구 라인)"
source_title: "Hacking Google with AI"
source_url: "https://brutecat.com/articles/hacking-google-with-ai/"
source_name: "brutecat.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30741"
published_at: "2026-06-22"
summarized_at: "2026-06-08"
category: "backend"
tags: ["security", "bug-bounty", "api-security", "authorization", "ai-security-testing", "agentic-testing", "verification-harness", "idor"]
---

# AI로 구글 API를 대규모 테스트해 버그바운티 $50만 (brutecat) — '정교한 익스플로잇이 아니라 인내', 반복되는 권한 검사 누락 + 검증 하네스(operation ID 재현)가 AI를 믿을 수 있게 (보안·AI 도구 라인)

> 출처: [Hacking Google with AI](https://brutecat.com/articles/hacking-google-with-ai/) (brutecat.com · GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**보안 연구자가 *Claude 기반 AI*에 API 테스트 도구를 연결해 *Google API 1,500개+를 대규모 자동 테스트*한 결과, **3개월 만에 인가된 버그바운티 ~$50만(약 7억원)** 을 획득한 (책임 공개) 사례. 기술 기반: *Android 앱 6만+개에서 API 키 수집·1,500+ API 명세 확보·FPA v2 인증 헤더 생성(유출 sourcemap의 내부 gapix 라이브러리에서)*. 발견 취약점은 *Google Voice 계정 탈취·YouTube 비공개 영상 유출·Widevine DRM 키 노출·교차 테넌트 데이터 접근·인증 없는 GraphQL* 등. 그러나 저자의 결론이 핵심: ***"Google의 버그는 정교한 익스플로잇이 아니라 인내가 핵심"*** 이고 ***"동일한 깨진 패턴이 도처에 반복된다"*** — *대부분은 **권한 검사 누락·인증 없는 API·실제 데이터를 그대로 노출한 테스트 환경*** 같은 기본 실수. 그리고 AI를 쓸모 있게 만든 결정적 장치: ***"operation ID 기반 원클릭 재현 시스템"*** (AI 출력을 검증 가능하게) + *시스템 프롬프트를 한 달 이상 다듬어 정확도 50%+* + *타 사용자 데이터 접근만 보고, 단순 존재 열거는 제외(오탐 제거)*.**

## 핵심 포인트

- **AI는 "스케일 곱셈기", 검증 하네스가 있어야 쓸모** — *명세(Discovery 문서·GraphQL SDL·Proto) 확보 → AI가 의미 있는 테스트 입력 생성*. ***"operation ID로 원클릭 재현"*** 시스템이 *AI 출력을 검증 가능하게 만드는 결정적 요소*. *Ralph Wiggum loop로 모든 엔드포인트 최소 1회 강제 테스트, 모든 키로 동일 요청 보내 응답 비교, 오류를 분류로 번역(`MISSING_REQUIRED_VISIBILITY_LABEL`)*. → [[2026-06-08-harness-engineering-jaehong]] *"백프레셔=자기검증"*·[[2026-06-08-slack-agentic-testing]] *"오탐 제거·검증"*의 보안 버전.
- **근본 원인은 정교함이 아니라 기본기 부재** — ***"권한 검사 누락(broken authz/IDOR)·인증 없는 API·스테이징에 실제 프로덕션 데이터"*** 가 반복. 예: *AdExchange 전체 계정을 단일 요청으로 덤프(스테이징 접근제어 부재), Translation Hub 공유 서비스 계정으로 교차 테넌트 데이터, Cloud Console GraphQL이 App Engine 로그를 인증 없이 노출*. **거대 조직조차 같은 실수를 도처에서 반복**.
- **인증≠인가의 분리 함정** — *"API 키로 권한(authorization)은 풀렸지만, 다수 엔드포인트는 호출자 인증(authentication)을 별도로 요구"* → FPA v2 헤더로 우회. **두 레이어(누구냐 vs 무엇을 할 수 있냐)를 각각 강제하지 않으면 한쪽만 통과해도 뚫림**.
- **AI 보안 테스팅의 부상(양날)** — *AI + 명세 + 검증 하네스* = 한 연구자가 수동으로 못 미치는 규모로 표면을 훑음. [[2026-05-09-ai-breaking-vulnerability-cultures]] *"AI가 취약점 문화를 깨뜨린다"*의 구체 사례 — **공격자도 같은 도구를 쓴다 → 방어자는 "기본기(authz·인증·데이터 격리)"를 자동 검증으로 못 박아야**.
- **정직한 스코프** — *타 사용자 데이터 접근만 취약점으로 보고, 단순 존재 열거는 제외*. **과대보고 안 함** — 신뢰의 근거.

## 인상 깊은 문장

> "Google의 버그는 정교한 익스플로잇이 아닌 인내가 핵심이다."

> "동일한 깨진 패턴이 도처에 반복된다."

> "대부분은 정교한 공격이 아니라, 권한 검사 누락·인증 없는 API·실제 데이터를 그대로 노출한 테스트 환경 같은 기본 실수다."

## 댓글 (전수 확인)

> GeekNews 제출 2시간 경과 신규 토픽 — **본문+댓글 2패스 확인, 댓글 0개**(GN⁺ HN 큐레이션 미부착). 추후 보강.

## 내 생각 · 적용점

### 보안·AI 도구 라인 (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *AI를 보안 테스팅에 어떻게 쓰나 + 반복되는 보안 근본 원인*이라는 보안 실무/도구 설계. [[2026-05-09-ai-breaking-vulnerability-cultures]]·[[2026-06-08-harness-engineering-jaehong]]·[[2026-06-08-slack-agentic-testing]]와 같은 라인. 라인 자산(카운팅 무관). 부채 *−2 유지* (53:43 ≈ 1.24:1).

### 핵심 전이 1 — "검증 하네스가 AI를 믿을 수 있게 만든다"의 또 다른 증거

가장 전이력 높은 통찰: ***"operation ID 원클릭 재현"이 AI 출력을 검증 가능하게 만든 결정적 요소*** — 이건 직전 [[2026-06-08-harness-engineering-jaehong]] *"백프레셔=자기검증이 최고 레버리지"*·[[2026-06-08-slack-agentic-testing]] *"성공은 조용히, 오탐 제거"*·[[2026-06-08-anthropic-skills-building-guide]] *"검증은 결정적 코드로"*와 **완전히 같은 원리의 보안 사례**. **AI에게 일을 시킬 땐 "재현 가능한 검증 장치(결정적)"를 먼저 만든다 — 그게 없으면 오탐 홍수**. 내 작업: *에이전트가 찾은 것(버그·이슈)은 항상 "재현/검증 스크립트"와 짝지어 신뢰*.

### 핵심 전이 2 — 방어 체크리스트: authz·인증·데이터 격리를 자동 검증으로 못 박기

저자의 근본 원인 진단이 **내 백엔드(CRS·PickMe) 방어 체크리스트** 그대로다: ***①모든 엔드포인트에 권한 검사(IDOR 방지: "내 것만" 접근) ②인증과 인가를 각각 강제(API 키만으론 부족) ③스테이징/테스트 환경에 실제 PII·프로덕션 데이터 금지 ④교차 테넌트 격리(공유 서비스 계정 주의)***. 그리고 ***"같은 깨진 패턴이 도처에 반복"*** 이니 — **개별 수정이 아니라 "모든 엔드포인트에 authz를 강제하는 구조적 장치"**(미들웨어·테스트·정책)로. [[2026-05-03-credit-cards-vulnerable-to-brute-force]]·[[2026-05-11-builtin-security-tokens]]와 정합. CRS는 *예약·결제·정산 = 고객 PII·금전*이라 IDOR/교차테넌트가 치명적.

### 핵심 전이 3 — "공격자도 AI를 쓴다" → 방어 자동화의 시급성

*AI + 명세 + 하네스로 한 명이 거대 표면을 훑는다* — [[2026-05-09-ai-breaking-vulnerability-cultures]] *"AI가 취약점 문화를 바꾼다"*의 실증. **방어자도 같은 방식(자기 API 명세 → AI로 authz/인증 자동 테스트 → operation ID 재현)으로 선제 점검**해야. 그리고 *Vertex AI Search 시스템 프롬프트 조회·프롬프트 인젝션*($30K)은 [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]] *프롬프트 인젝션 탈취*와 같은 줄기 — **AI 기능을 붙일수록 "프롬프트/시스템 프롬프트 노출·인젝션"도 공격 표면**.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *보안·AI 도구 라인* — 친/axelk 직교, 카운팅 무관. 부채 *−2 유지* (53:43).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- brutecat.com (원문) · [GeekNews — 30741](https://news.hada.io/topic?id=30741)
- [[2026-05-09-ai-breaking-vulnerability-cultures]] — *"AI가 취약점 문화를 바꾼다(공격/방어 비대칭)"*
- [[2026-06-08-harness-engineering-jaehong]]·[[2026-06-08-slack-agentic-testing]]·[[2026-06-08-anthropic-skills-building-guide]] — *"검증 하네스/오탐 제거/결정적 검증이 AI를 쓸모 있게"*
- [[2026-05-03-credit-cards-vulnerable-to-brute-force]]·[[2026-05-11-builtin-security-tokens]] — *"API 보안·인증/인가 기본기"*
- [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]] — *"프롬프트 인젝션이 공격 표면"*
- [[2026-06-08-agentic-code-review]]·[[2026-06-08-ai-demands-more-engineering-discipline]] — *"AI가 버그를 찾되 검증·규율은 필수"*

## 한 달 뒤 회고
*(2026-07-08 즈음 — CRS/PickMe 엔드포인트에 "authz·인증 분리·교차테넌트·스테이징 데이터" 방어 체크리스트를 적용했는지, AI에게 일 시킬 때 "재현 가능한 검증 장치"를 먼저 만들었는지, 자기 API 명세로 authz 자동 점검을 돌려봤는지 기록.)*
