---
title: "Andrew Kelley(Zig 창시자) 인터뷰 — no-AI 정책·프로그래밍의 미래·오픈소스 동기 (axelk 측 정치·문화 차원: Refusing AI 명제의 대규모 실제 구현)"
source_title: "Andrew Kelley interview — JetBrains"
source_url: "https://www.youtube.com/watch?v=iqddnwKF8HQ"
source_name: "JetBrains YouTube · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29949"
summarized_at: "2026-05-29"
category: "engineering"
tags: ["no-ai-policy", "refusing-ai", "future-of-programming", "open-source-governance", "nonprofit-501c3", "developer-motivation", "control-recovery", "contributor-poker", "local-ai", "axelk-side"]
---

# Andrew Kelley(Zig 창시자) 인터뷰 — no-AI 정책·프로그래밍의 미래·오픈소스 동기 (axelk 측 정치·문화 차원: Refusing AI 명제의 대규모 실제 구현)

> 출처: [Andrew Kelley 인터뷰 (JetBrains, Vitaly Bragilevsky 진행)](https://www.youtube.com/watch?v=iqddnwKF8HQ) (GeekNews 경유) · 정리일 2026-05-29
>
> *(이 글은 Zig 언어 스펙이 아니라 **AI 정책·개발 도구 철학·프로그래밍의 미래·개인 동기·오픈소스 관점**의 전이 가능한 주장만 추렸다.)*

## 한 줄 요약
**Zig 창시자 Andrew Kelley가 한 메이저 OSS 프로젝트를 *엄격한 no-LLM·no-AI 정책*으로 운영하는 이유: *AI 기여는 변함없이 쓰레기*, *비결정적이라 함수 리네임조차 항상 검토가 필요해 리뷰 시간을 빼앗아 음의 가치*, 그리고 ***contributor poker*** — 기여의 진짜 가치는 첫 PR이 아니라 *이후 반복·멘토링 과정*에 있는데 *AI는 가르칠 수 없다(unteachable)*. 프로그래밍의 미래를 *인간 관계·결정성·검토 가능성* 위에 두고, *501(c)(3) 비영리*로 미션을 시장 압력에서 보호하며, *"내 컴퓨터·내 전기를 두고 매달 돈 내며 남의 컴퓨터에서 클로즈드소스로 프로그래밍하는 건 미친 제안"*이라고 본다.**

## 핵심 포인트

### ① AI 정책 — "변함없이 쓰레기, 음의 가치"
- **엄격한 no-LLM·no-AI 정책** (이슈·PR 전면) — *AI 기여는 변함없이 쓰레기(invariably garbage)*. **[[2026-05-20-refusing-ai-is-a-human-choice]] *명제 → 메이저 OSS 거버넌스 규칙*으로 진화** ("AI 거부는 인간의 선택"의 대규모 실증).
- **비결정성 → 항상 검토 필요 → 리뷰 시간 강탈 = 음의 가치** — *함수 이름 변경처럼 단순한 일조차 출력은 늘 검토 대상*. **[[2026-05-29-orchestration-tax]] *검토 = 직렬 병목*의 메인테이너 관점** — 외부 AI PR이 *희소한 검토 락을 쓰레기로 강탈* → 명백한 음의 가치. no-AI 정책 = *orchestration-tax를 입구에서 차단하는 정책*.

### ② 프로그래밍의 미래 — contributor poker, 인간이 자라는 시스템
- **Contributor poker** — *기여자 가치의 대부분은 최초 PR이 아니라 이후의 반복적 과정*. 신규 인간 기여자를 환대하면 *나중에 더 나은 기여자, 심지어 코어 팀*이 되지만 *AI는 unteachable*. → **프로그래밍의 미래를 *코드 생산량*이 아니라 *사람이 자라는 관계 자본* 위에 둠**. **[[2026-05-28-tired-of-talking-to-ai]] *동료·멘토링 관계*가 AI 프록시로 붕괴되는 것의 정면 대척**.
- **결정성·검토 가능성이 미래의 축** — *비결정적 도구는 신뢰의 기반을 흔든다*. 미래 프로그래밍의 가치 척도를 *속도/생산량*에서 *검토 가능성·책임·관계*로 이동.

### ③ 개발 도구 철학 — "도구는 사람의 실수를 줄여야 한다 / 좋은 기본값"
- **도구의 역할 = 사람의 footgun(자기 발 쏘기)을 줄이는 것** — 성능을 희생하지 않으면서도 *디버깅·실수 비용을 낮추는 게 도구의 책무*. **[[2026-05-28-favorite-developer-tools]] *나이 들수록 좋은 기본값을 가진 도구에 취향을 맞춘다* 메타 패턴과 합류** (도구를 나에게 맞추기보다, 실수를 구조적으로 줄여주는 도구를 택함).
- *(언어 선택 여정·빌드 체인 같은 Zig 고유 기술 세부는 생략 — 전이 가능한 도구 철학만.)*

### ④ 개인 동기·오픈소스 관점 — 비영리·통제권 회복·반(反)구독
- **501(c)(3) 비영리 = 미션 보호** — *하위 호환을 성급히 약속하지 않고 장기 개선에 집중*할 수 있는 구조. 재무 투명성(2024 수입 $67만, *91%를 계약자에게* 지급). **[[2026-05-14-eric-ries-incorruptible-mission-protection]] *부패 불가능 미션 보호*의 실제 시연** — 비영리가 *시장 압력으로부터 미션을 구조적으로 방어*.
- **"남의 컴퓨터에서 월 구독 클로즈드소스 = 미친 제안"** — *내 컴퓨터·내 전기*를 두고 *매달 돈 내며 네트워크 너머 남의 컴퓨터에서 클로즈드소스*로 프로그래밍하지 않겠다. **[[2026-05-11-local-ai-needs-to-be-the-norm]] *로컬 AI 규범화*·[[2026-05-26-dont-subscribe-too-lightly]] *구독 = 정체성 이동* 정면 합류**.
- **통제권 회복 — 플랫폼·웹 독립** — GitHub→*Codeberg*(독립 플랫폼), *Firefox 사용*(Chromium 독점 → 웹 다양성 우려). **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] 통제권 회복 라인의 가치 차원 종합 사례**.

## 인상 깊은 문장

> "I'm not going to go from using my own computer and my own electricity, in order to use closed-source programming on someone else's computer through the network, that I have to pay for monthly. To me, that is an insane proposition."  
> (내 컴퓨터와 내 전기를 쓰다가, 네트워크 너머 남의 컴퓨터에서 매달 돈 내고 클로즈드소스로 프로그래밍하는 쪽으로 갈 생각이 없다. 나에겐 그건 미친 제안이다)

> *(인터뷰 요지)* AI 기여는 *변함없이 쓰레기*이며, *비결정적이라 출력은 항상 검토가 필요*하다 — 함수 리네임처럼 단순한 일조차. 그래서 *리뷰 시간을 빼앗아 음의 가치*를 만든다.

> *(contributor poker)* 기여자가 주는 가치의 대부분은 *최초 풀 리퀘스트가 아니라 이후의 반복적 과정*에 있다. 신규 기여자를 환대하면 *나중에 더 나은 기여자, 심지어 코어 팀*이 되지만, *AI는 가르칠 수 없다(unteachable)*.

## 내 생각 · 적용점

### 5번째 라인업 axelk 측 *정치·문화 차원* — [[2026-05-20-refusing-ai-is-a-human-choice]] 명제의 *명제 → 대규모 구현* 진화

정치·문화 차원 5 형태 (명제·결과·심리·UX·동료) 중 **이 글은 두 형태를 동시 보강**:

| 형태 | 보강 |
|---|---|
| 1번째 *명제* ([[2026-05-20-refusing-ai-is-a-human-choice]]) | ***메이저 OSS의 실제 거버넌스 구현*** (추상 → 규칙) |
| 5번째 *동료·관계* ([[2026-05-28-tired-of-talking-to-ai]]) | ***contributor poker = AI는 멘토링 관계 자본을 못 만듦*** |

→ **정치·문화 차원이 *명제 → 구현*으로 성숙** (새 6번째 형태가 아니라 *기존 명제·관계 형태의 실증 보강*). axelk 측 5 차원 *18 자산* (법1·시1·정**6**·재5·노5) — 정치·문화가 6 자산으로 가장 두꺼운 단독 1위.

### **균형 의례 부채 *-2 → -3 axelk 측 빚 다시 가속* — 2 연속 axelk → 상환 후보 명시**

- 직전([[2026-05-29-can-i-take-a-day-off]], axelk) 부채 -2
- *이번 글 axelk 측 +1 → 부채 -3*
- 비율: **29:21 ≈ 1.38:1** (안전 마진 1.62, 임계점 3:1에서 가장 먼 가장 안전 상태 갱신)
- → **2 연속 axelk 자산** (day-off → 이번). *48시간 진동 패턴*상 *다음 1~2 자산은 친-AI 측이 자연스러움*. 부채(rolling)는 axelk -3로 누적이나 *누적 비율(29:21)은 여전히 친-AI 우세* — *단기 lean vs 장기 bias* 분리 측정. **능동 큐레이션 상환 후보**: 다음 친-AI 자산 도착 시 -3 → -2 회복.

### [[2026-05-29-orchestration-tax]] 허브 — 4번째 연속 접속, *메인테이너 관점*으로 완성

orchestration-tax(원 명제: 인간 검토 = 직렬 병목) 이후 *연속 4글이 같은 허브에 접속*:

| 글 | orchestration-tax 관점 |
|---|---|
| [[2026-05-29-orchestration-tax]] | *검토 = 직렬 병목* (원 명제) |
| [[2026-05-29-can-i-take-a-day-off]] | *"10배 생산성" 전제 회의* |
| **이번 (Kelley)** | ***외부 AI 기여 = 검토 락 강탈 = 음의 가치*** (메인테이너 측) |

→ **"인간 검토 시간이 희소 자원"이라는 한 명제가 *개발자(자기 작업)·노동(노동시간)·OSS 거버넌스(외부 기여)* 3 차원으로 확장**. no-AI 정책 = *orchestration-tax를 정책으로 박제* ("AI가 검토 락을 강탈하므로 입구에서 차단").

### *적용 단서 — 입구 정책 vs 사후 검토*

AI 검토 부담을 *사후 검토*가 아니라 *입구 정책(no-AI)*으로 차단하는 전략. [[2026-05-29-orchestration-tax]]의 *"에이전트 수를 검토 역량에 맞춤"*보다 강한 *"애초에 검토 큐에 넣지 않음"*. 다만 *contributor poker*(인간 기여자 멘토링 가치)는 *오픈소스 거버넌스에 특수* — 사내 팀은 이미 멘토링 관계가 있어 그대로 이식되진 않음(사내는 *AI를 멘티가 아니라 도구로* 포지셔닝).

### *오버 메타화 자기 견제 38 자산 연속 0건 유지*

정치·문화 차원 *기존 명제·관계 형태 실증 보강* = 신규 자가 진단·매트릭스 아님. 라인업이 *axelk 측 18 자산·Lasn 측 6 자산*으로 깊어짐.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [Andrew Kelley 인터뷰 (JetBrains)](https://www.youtube.com/watch?v=iqddnwKF8HQ) (원문)
- [GeekNews — 29949](https://news.hada.io/topic?id=29949)
- [Simon Willison — Zig anti-AI 정책 해설](https://simonwillison.net/2026/Apr/30/zig-anti-ai/)
- [[2026-05-20-refusing-ai-is-a-human-choice]] — Refusing AI 명제 *(대규모 구현 진화)*
- [[2026-05-29-orchestration-tax]] — 검토 = 직렬 병목 *(메인테이너 관점·4번째 연속 접속)*
- [[2026-05-28-tired-of-talking-to-ai]] — 동료·멘토링 관계 *(contributor poker 보강)*
- [[2026-05-14-eric-ries-incorruptible-mission-protection]] — 부패 불가능 미션 보호 *(501c3 시연)*
- [[2026-05-11-local-ai-needs-to-be-the-norm]] — 로컬 AI 규범화 *(내 컴퓨터·내 전기)*
- [[2026-05-26-dont-subscribe-too-lightly]] — 구독 = 정체성 이동 *(정면 거부)*
- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] — 통제권 회복 라인 *(가치 차원 종합)*
- [[2026-05-28-favorite-developer-tools]] — 좋은 기본값 도구 *(도구는 실수를 줄여야)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — no-AI 정책이 *기여 품질·커뮤니티 건강*에 어떤 결과를 냈는지, contributor poker 개념이 *다른 OSS로 확산*됐는지, "AI 입구 정책 vs 사후 검토" 중 무엇을 내 프로젝트·CRS에 채택했는지 기록.)*
