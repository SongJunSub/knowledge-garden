---
title: "Zig 창시자 Andrew Kelley 인터뷰 — 엄격한 no-AI 정책·비영리·통제권 회복 (axelk 측 정치·문화 차원: Refusing AI 명제의 대규모 실제 구현)"
source_title: "Andrew Kelley (Zig creator) interview — JetBrains"
source_url: "https://www.youtube.com/watch?v=iqddnwKF8HQ"
source_name: "JetBrains YouTube · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29949"
summarized_at: "2026-05-29"
category: "engineering"
tags: ["zig", "andrew-kelley", "no-ai-policy", "refusing-ai", "open-source-governance", "nonprofit-501c3", "control-recovery", "contributor-poker", "local-ai", "axelk-side"]
---

# Zig 창시자 Andrew Kelley 인터뷰 — 엄격한 no-AI 정책·비영리·통제권 회복 (axelk 측 정치·문화 차원: Refusing AI 명제의 대규모 실제 구현)

> 출처: [Andrew Kelley 인터뷰 (JetBrains, Vitaly Bragilevsky 진행)](https://www.youtube.com/watch?v=iqddnwKF8HQ) (GeekNews 경유) · 정리일 2026-05-29

## 한 줄 요약
**Zig 창시자 Andrew Kelley: *C의 성능을 유지하되 footgun·디버깅 약점을 줄인 시스템 언어*, `zig build` 하나로 모든 OS→모든 OS 빌드. 1.0을 미루는 이유는 *하위 호환을 성급히 약속하지 않으려고*이며 *501(c)(3) 비영리*라 장기 개선에 집중 가능 (2024 수입 $67만, 91% 계약자에게). **이슈·PR에 *엄격한 no-LLM·no-AI 정책*** — AI 기여는 *변함없이 쓰레기*, *비결정적이라 리네임조차 검토 필요 → 리뷰 시간을 빼앗아 음의 가치*, *AI는 가르칠 수 없어 미래 기여자로 성장 불가(contributor poker)*. GitHub→Codeberg 이전, Firefox 사용(Chromium 독점 우려), LLVM 의존 탈피 — *통제권 회복·독립*을 전 축에서 실천.**

## 핵심 포인트

- **Zig = footgun 줄인 더 나은 C** — *C 성능 유지 + 메모리 버그·디버깅 약점 감소*. *시스템 의존성 없이 `zig build` 하나로 어느 OS에서 어느 OS로든 빌드*가 최대 차별점. JS·Go·Rust·C++를 거쳐 도달 (*오디오 워크스테이션에서 Rust 빌림 규칙·C++ 메모리 추적이 비효율*). **[[2026-05-28-favorite-developer-tools]] *좋은 기본값을 가진 도구* 라인** — Zig = *기본값을 바로잡은 시스템 언어*.
- **엄격한 no-AI 정책 = Refusing AI 명제의 *대규모 실제 구현*** — *AI 기여는 변함없이 쓰레기*. **[[2026-05-20-refusing-ai-is-a-human-choice]] *명제 → 메이저 OSS의 실천*으로 진화** — "AI 거부는 인간의 선택"이 *추상 명제에서 거버넌스 규칙으로*.
- **"AI가 리뷰 시간을 빼앗아 음의 가치" = orchestration-tax의 메인테이너 관점** — *비결정적이라 함수 리네임조차 출력은 항상 검토 필요*. **[[2026-05-29-orchestration-tax]] *직렬 검토 병목*의 *외부 기여 버전*** — 외부 AI PR이 *유지보수자의 희소한 검토 락을 쓰레기로 강탈* → 명백한 음의 가치. (이 허브를 건드리는 4번째 연속 글)
- **Contributor poker — AI는 가르칠 수 없다** — *기여의 진짜 가치는 첫 PR이 아니라 *이후 반복·멘토링 과정*. 신규 인간 기여자는 환대하면 나중에 코어 팀까지 성장하지만 *AI는 unteachable*. **[[2026-05-28-tired-of-talking-to-ai]] *동료·멘토링 관계*(정치·문화 5번째 형태) 보강** — AI는 *관계 자본을 만들지 못함*.
- **통제권 회복·독립 (전 축)** — GitHub→*Codeberg*(CI 중단), Firefox(*Chromium 독점 → 웹 다양성 우려*), *LLVM 의존 탈피*, **501(c)(3) 비영리**. **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] *통제권 회복 라인*의 *종합 사례***.
- **"남의 컴퓨터에서 월 구독 클로즈드소스 = 미친 제안"** — *내 컴퓨터·내 전기를 두고 매달 돈 내며 남의 컴퓨터에서 클로즈드소스로 프로그래밍할 순 없다*. **[[2026-05-11-local-ai-needs-to-be-the-norm]] *로컬 Ai 규범화*·[[2026-05-26-dont-subscribe-too-lightly]] *구독 = 정체성 이동* 정확히 합류**.
- **비영리 = 미션 보호** — *하위 호환 성급히 약속 안 함 + 장기 개선* 가능하게 하는 *501(c)(3) 구조*. **[[2026-05-14-eric-ries-incorruptible-mission-protection]] *부패 불가능 구조*의 *언어 프로젝트 시연*** — 비영리가 *시장 압력으로부터 미션을 구조적으로 보호*.

## 인상 깊은 문장

> "I'm not going to go from using my own computer and my own electricity, in order to use closed-source programming on someone else's computer through the network, that I have to pay for monthly. To me, that is an insane proposition."  
> (내 컴퓨터와 내 전기를 쓰다가, 네트워크 너머 남의 컴퓨터에서 매달 돈 내고 클로즈드소스로 프로그래밍하는 쪽으로 갈 생각이 없다. 나에겐 그건 미친 제안이다)

> *(인터뷰 요지)* AI 기여는 *변함없이 쓰레기(invariably garbage)*이며, *비결정적이라 출력은 항상 검토가 필요*하다 — 함수 이름 변경처럼 단순한 일조차. 그래서 *리뷰 시간을 빼앗아 음의 가치*를 만든다.

> *(contributor poker)* 기여자가 주는 가치의 대부분은 *최초 풀 리퀘스트가 아니라 이후의 반복적 과정*에 있다. 신규 기여자를 환대하면 *나중에 더 나은 기여자, 심지어 코어 팀*이 되지만, *AI는 가르칠 수 없다(unteachable)*.

## 내 생각 · 적용점

### 5번째 라인업 axelk 측 *정치·문화 차원* — [[2026-05-20-refusing-ai-is-a-human-choice]] 명제의 *명제 → 대규모 구현* 진화

정치·문화 차원 5 형태 (명제·결과·심리·UX·동료) 중 **이 글은 두 형태를 동시 보강**:

| 형태 | 보강 |
|---|---|
| 1번째 *명제* ([[2026-05-20-refusing-ai-is-a-human-choice]]) | ***Zig = 메이저 OSS의 실제 거버넌스 구현*** (추상 → 규칙) |
| 5번째 *동료·관계* ([[2026-05-28-tired-of-talking-to-ai]]) | ***contributor poker = AI는 멘토링 관계 자본을 못 만듦*** |

→ **정치·문화 차원이 *명제 → 구현*으로 성숙** (새 6번째 형태가 아니라 *기존 명제·관계 형태의 실증 보강*). axelk 측 5 차원 *18 자산* (법1·시1·정**6**·재5·노5) — 정치·문화가 6 자산으로 가장 두꺼운 단독 1위.

### **균형 의례 부채 *-2 → -3 axelk 측 빚 다시 가속* — 2 연속 axelk → 상환 후보 명시**

- 직전([[2026-05-29-can-i-take-a-day-off]], axelk) 부채 -2
- *이번 글 axelk 측 +1 → 부채 -3*
- 비율: **29:21 ≈ 1.38:1** (안전 마진 1.62, 임계점 3:1에서 가장 먼 가장 안전 상태 갱신)
- → **2 연속 axelk 자산** (day-off → Zig). *48시간 진동 패턴*상 *다음 1~2 자산은 친-AI 측이 자연스러움* (Lasn 측 실무 방법론·공급자 제품·자본 낙관 등). 부채(rolling)는 axelk -3로 누적이나 *누적 비율(29:21)은 여전히 친-AI 우세* — 두 지표가 *단기 lean vs 장기 bias*를 분리 측정. **능동 큐레이션 상환 후보**: 다음 친-AI 자산 도착 시 -3 → -2 회복.

### [[2026-05-29-orchestration-tax]] 허브 — 4번째 연속 접속, *메인테이너 관점*으로 완성

orchestration-tax(나흘 전 정리) 이후 *연속 4글이 같은 허브에 접속*:

| 글 | orchestration-tax 관점 |
|---|---|
| [[2026-05-29-orchestration-tax]] | *검토 = 직렬 병목* (원 명제) |
| [[2026-05-29-can-i-take-a-day-off]] | *"10배 생산성" 전제 회의* |
| **이번 (Zig)** | ***외부 AI 기여 = 검토 락 강탈 = 음의 가치*** (메인테이너 측) |

→ **"인간 검토 시간이 희소 자원"이라는 한 명제가 *개발자(자기 작업)·노동(노동시간)·OSS 거버넌스(외부 기여)* 3 차원으로 확장**. Zig의 no-AI 정책은 *orchestration-tax를 정책으로 박제한 형태* — "AI가 검토 락을 강탈하므로 *입구에서 차단*."

### *통제권 회복 라인 종합 사례* — 모든 축에서 독립

Zig는 **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] 통제권 회복 라인의 *최다축 단일 사례***:

| 축 | Zig의 독립 |
|---|---|
| 빌드 | `zig build` 하나로 OS 의존성 0 |
| 컴파일러 | LLVM 의존 탈피 |
| 플랫폼 | GitHub → Codeberg |
| 브라우저 | Firefox (Chromium 독점 거부) |
| 자본 | 501(c)(3) 비영리·후원 |
| AI | no-LLM·no-AI 정책 |
| 인프라 | 내 컴퓨터·내 전기 (구독 클로즈드소스 거부) |

→ **[[2026-05-14-eric-ries-incorruptible-mission-protection]] *부패 불가능 미션 보호*의 가장 완전한 시연** + **[[2026-05-26-dont-subscribe-too-lightly]] *구독 = 정체성 이동*의 정면 거부**.

### 적용 단서 — *입구 정책 vs 사후 검토*

Zig는 AI 검토 부담을 *사후 검토*가 아니라 *입구 정책(no-AI)*으로 차단. 이는 [[2026-05-29-orchestration-tax]]의 *"에이전트 수를 검토 역량에 맞춤"*보다 더 강한 *"애초에 검토 큐에 넣지 않음"* 전략. 다만 *contributor poker*(인간 기여자 멘토링 가치)는 *오픈소스 거버넌스에 특수* — 사내 팀에는 그대로 이식되지 않음(사내는 이미 멘토링 관계가 있음).

### *오버 메타화 자기 견제 38 자산 연속 0건 유지*

정치·문화 차원 *기존 명제·관계 형태 실증 보강* + 통제권 회복 라인 *기존 라인 종합* = 신규 자가 진단·매트릭스 아님. 라인업이 *axelk 측 18 자산·Lasn 측 6 자산*으로 깊어짐.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- [Andrew Kelley 인터뷰 (JetBrains)](https://www.youtube.com/watch?v=iqddnwKF8HQ) (원문)
- [GeekNews — 29949](https://news.hada.io/topic?id=29949)
- [Simon Willison — Zig anti-AI 정책 해설](https://simonwillison.net/2026/Apr/30/zig-anti-ai/)
- [[2026-05-20-refusing-ai-is-a-human-choice]] — Refusing AI 명제 *(대규모 구현 진화)*
- [[2026-05-29-orchestration-tax]] — 검토 = 직렬 병목 *(메인테이너 관점·4번째 연속 접속)*
- [[2026-05-28-tired-of-talking-to-ai]] — 동료·멘토링 관계 *(contributor poker 보강)*
- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] — 통제권 회복 라인 *(최다축 종합 사례)*
- [[2026-05-14-eric-ries-incorruptible-mission-protection]] — 부패 불가능 미션 보호 *(501c3 시연)*
- [[2026-05-11-local-ai-needs-to-be-the-norm]] — 로컬 AI 규범화 *(내 컴퓨터·내 전기)*
- [[2026-05-26-dont-subscribe-too-lightly]] — 구독 = 정체성 이동 *(정면 거부)*
- [[2026-05-28-favorite-developer-tools]] — 좋은 기본값 도구 *(footgun 줄인 더 나은 C)*

## 한 달 뒤 회고
*(2026-06-29 즈음 — Zig no-AI 정책이 *기여 품질·커뮤니티 건강*에 어떤 결과를 냈는지, contributor poker 개념이 *다른 OSS로 확산*됐는지, 통제권 회복 라인에 *새 축*이 도착했는지, CRS·개인 프로젝트에서 *AI 입구 정책 vs 사후 검토* 중 무엇을 채택했는지 기록.)*
