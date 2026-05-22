---
title: "Greg Wilson — AI 보조 코딩에 대해 틀리는 열두 가지 방식 (측정 방법론)"
source_title: "Twelve Ways We Get AI-Assisted Coding Wrong"
source_url: "https://third-bit.com/2026/05/20/twelve-ways-we-get-ai-assisted-coding-wrong/"
source_name: "third-bit.com (Greg Wilson, Software Carpentry 창립자) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29745"
published_at: "2026-05-20"
summarized_at: "2026-05-21"
category: "ai"
tags: ["methodology", "measurement", "ai-assisted-coding", "productivity-research", "goodharts-law", "selection-bias", "skill-atrophy", "system-thinking"]
---

# Greg Wilson — AI 보조 코딩에 대해 틀리는 열두 가지 방식 (측정 방법론)

> 출처: [Twelve Ways We Get AI-Assisted Coding Wrong](https://third-bit.com/2026/05/20/twelve-ways-we-get-ai-assisted-coding-wrong/) · third-bit.com · 정리일 2026-05-21

## 한 줄 요약
**Software Carpentry 창립자 Greg Wilson이 *AI 보조 코딩 생산성 연구*가 흔히 범하는 *12가지 방법론 오류*를 정리** — *코드 줄 수·커밋·수락률 같은 쉬운 숫자가 목표가 되면 조작* + *AI vs 아무것도 없음* 약한 기준선 + *자발적 사용자 선택 편향* + *단기 신기효과 + 기술 퇴화 + 기술 부채* 장기 외면 + *개인 속도만 보고 코드 리뷰 부하·팀 병목 무시*하는 *시스템 사고 부재* + *생성 속도 보고하고 검토·디버깅·보안 비용 누락*하는 비용 비대칭. **결정적 데이터: 시니어 개발자는 AI 생성 코드로 인한 코드 리뷰 부하가 6.5% 늘면서 자신의 생산성이 19% 하락**.

## 핵심 포인트

- **생산성 측정의 왜곡 (Goodhart 1)** — *코드 줄 수·커밋 수·수락률 같은 쉬운 숫자*는 실제 가치를 반영하지 못하며 *목표가 되면 조작*됨. *Goodhart's Law의 AI 코딩 차원 정식화*.
- **약한 기준선 (Weak Baseline)** — *AI vs 아무것도 없음* 비교는 *현실에 없는 기준*. 개발자가 *실제로 쓰는 대안*(IDE 자동완성·스니펫·동료 검토)과 비교해야 함. *AI vs 이전 도구 0세대*가 정답이지 *AI vs 무도구*가 아님.
- **선택 편향 (Selection Bias)** — *자발적 사용자 vs 미사용자* 비교는 *도구 효과가 아니라 사람 특성*을 비교하는 오류. 효과 측정의 첫 번째 함정.
- **단기 효과 외면 (Short-Term Bias)** — 단기 연구는 *신기효과* + *기술 퇴화* + *기술 부채 축적*을 놓침. **AI 코딩 효과는 *최소 6개월 이상* 종단 연구 필요**.
- **시스템 사고 부재 (Local Optimization)** — *개인 코딩 속도만 측정*하고 *코드 리뷰 부담 증가·팀 병목 구조*를 간과. *파이프라인 한 단계만 최적화하고 나머지 무시*하면 *시스템 사고의 실패*.
- **비용-편익 비대칭** — *코드 생성 속도 향상은 보고*하면서 *검토·디버깅·보안 비용은 누락*. *늘어난 입력만 측정하고 함께 늘어난 비용을 무시하면 측정이 아니라 마케팅*.
- **결정적 경험 데이터 — *시니어 19% 하락*** — 전문 개발자 대상 실증 연구에서 *AI 도구가 경험이 적은 기여자의 산출은 늘렸지만, 시니어는 AI 생성 코드로 인한 코드 리뷰 부하 6.5% 증가 → 자신의 생산성 19% 하락*. **AI가 시니어에게 *세금*이 되는 *구체적 메커니즘 = 리뷰 부담 흡수***.
- **METR 연구의 두 결과** (댓글) — (1) *AI가 사람들을 더 느리게 만들었다*가 헤드라인이지만 (2) **더 흥미로운 건 *본인들의 사후 추정이 실제와 방향조차 맞지 않았다*** — *사용자의 자기 인지 환각*은 *AI의 완료 환각*과 짝.
- **AI 없이 일하기 거부 — 양면 해석** (댓글) — *도구가 잘 작동한다는 뜻*일 수도 있고 *능력이 완전히 퇴화했다는 뜻*일 수도 있음. **양면을 *동시에 검증할 수 있는 측정 설계*가 정답** — 한쪽 가설로 환원하지 말 것.

## 인상 깊은 문장

> "If you only measure the increased input and ignore the costs that grew alongside it, you're not measuring — you're marketing."  
> (늘어난 입력만 측정하고 함께 늘어난 비용을 무시하면 측정이 아니라 마케팅이 된다)

> "Empirical studies of professional developers found that AI tools increased output from less-experienced contributors, but senior developers saw a 19% drop in their own productivity as code-review load from AI-generated code grew 6.5%."  
> (전문 개발자 대상 실증 연구에서 AI 도구가 경험이 적은 기여자의 산출은 늘렸지만, 시니어 개발자는 AI 생성 코드로 인한 코드 리뷰 부하가 6.5% 늘면서 자신의 생산성이 19% 하락했다)

> "Optimizing one stage of a pipeline while ignoring the rest is what systems-thinking failure dressed up as a productivity study looks like."  
> (파이프라인의 한 단계만 최적화하고 나머지를 무시하면 *생산성 연구처럼 보이는 시스템 사고의 실패*가 된다)

## 내 생각 · 적용점

### 가든의 *측정 방법론 디딤돌 자산*

가든은 *AI 시대* 주제에 *많은 수치*를 인용해왔다 — *40% 완료 보고·22%→3% 협박률·6배·90% 커버리지·19% 시니어 하락·11개월 조기 행동* 등. **Wilson의 12 오류는 이 수치들 *모두*에 적용 가능한 *방법론 잣대***. 가든의 모든 *경험적 주장*이 *Wilson 12 오류 시험*을 통과해야 한다는 *측정 표준* 도착.

가든에 이런 *방법론 디딤돌 자산*은 처음. [[2026-05-14-disappearance-of-the-ten-year-fund]] Bartlett 논문이 *VC 수익률에 학술 잣대*를 박은 것과 같은 유형의 자산.

### **15번째 가든 자가 진단 = *측정 방식 엄밀성 시험***

*가든이 *AI 생산성·효율·신뢰성* 수치를 인용할 때 *Wilson 12 오류 중 어디에 빠지지 않는지* 점검하는가?*

운영 의례:
- 가든의 *기존 수치 인용 50건 미만*은 *분기 1회 12 오류 체크리스트 통과 점검* (한 번에 다 안 하고 점진적으로)
- 새 글 정리 시 *수치를 인용하기 전 12 오류 중 어디에 걸리는지* frontmatter에 `methodology_flags` 옵션 필드로 명시 후보
- *통과 못한 수치*는 인용 시 *주의 표시* 박음 (예: *선택 편향 가능성*)

이게 [[2026-05-19-openai-codex-goals-persistent-objectives]] *11번째 자가 진단 (완료 정의 강제)*과 짝 — *증거 기반 완료* + *증거 자체의 신뢰성*이 *서로 보완*.

### [[2026-05-14-experience-is-now-a-tax]] Jay Gup *경험=세금*에 *실증 데이터 + 인과 해석 갱신*

Jay Gup은 *X 스레드 논증*으로 *시니어가 세금을 낸다*고 주장. 가든은 이를 *반대 명제 자산*으로 박았다. **Wilson의 데이터가 *경험 + 인과 메커니즘*을 동시에 제공**:

| 차원 | Jay Gup | Wilson |
|---|---|---|
| 주장 | *경험이 세금이 된다* | *시니어 19% 생산성 하락* |
| 형식 | X 스레드 논증 | 실증 연구 |
| **인과 해석** | ***결정 알고리듬* 변화 (시니어 기억이 필터)** | ***리뷰 부담 흡수* (시니어가 AI 코드 검수 노동)** |

**중요한 발견**: *같은 현상에 다른 인과 해석*. **이게 처방 차이를 만듦**:
- *Jay Gup 인과 → AI 시대 결정에서 시니어 발언 가중 낮추기*가 처방
- *Wilson 인과 → AI 코드 검수 책임 분산 + 리뷰 자동화*가 처방

**가든의 *Jay Gup 자산*에 *Wilson 인과 해석*을 *대안 해석*으로 추가 박기**. 두 해석을 *둘 다 살아있게* 두는 게 정직. CRS·MangoLove에서 *시니어 손해*가 관찰될 때 *어느 인과인지 진단*하는 데 둘 다 필요.

### [[2026-05-17-amazon-token-burning-goodharts-law]] *Goodhart 라인*의 *방법론 정식화*

Wilson #1 (*쉬운 숫자가 목표가 되면 조작*)은 *Goodhart의 AI 코딩 차원 정식화*. 가든의 *Goodhart 자가 짝*에 *방법론 차원* 추가:

| 차원 | 자산 |
|---|---|
| KPI 차원 | [[2026-05-17-amazon-token-burning-goodharts-law]] |
| 조직 차원 | [[2026-05-16-hashimoto-ai-mass-psychosis]] |
| 훈련 차원 | [[2026-05-19-simon-willison-six-months-of-llm]] (펠리컨→주머니쥐) |
| **방법론 차원** | **Wilson 12 오류** ← 이번 |

Goodhart 4자 짝이 *현장 KPI·조직 인센티브·모델 훈련·연구 방법론* 4개 층으로 다층화 완료. **모든 *수치 인용*이 Goodhart 위험에 노출되어 있다는 *측정 인식론*의 정착**.

### [[2026-05-17-claude-to-codex-migration-reddit]]·[[2026-05-19-openai-codex-goals-persistent-objectives]] *완료 환각 6자 짝*에 *사용자 자기 환각* 추가

Wilson 인용한 METR 연구의 결정적 결과: **본인들의 사후 추정이 실제와 방향조차 맞지 않았다**. *AI의 완료 환각*과 *사용자의 자기 환각*이 *짝*:

| 환각 주체 | 자산 |
|---|---|
| **모델** | [[2026-05-17-claude-to-codex-migration-reddit]] (40% 완료 보고) |
| **사용자** | **METR (사후 추정 방향 오류)** ← Wilson 매개 |

→ *완료 환각 6자 짝* (모델·조직·제도·하네스·프로토콜·훈련)에 *제7 차원 = 사용자 자기 인지* 추가. **이는 *측정 방법 자체에 영향*** — *자기 보고 데이터는 방향조차 신뢰 불가*. 모든 *AI 도움이 컸다/적었다* 자기 보고는 *경험적 검증*과 함께만 인용 가능.

### [[2026-05-18-ai-wont-speed-up-processes]] *TOC AI*의 *측정 차원 짝*

Van Brabant는 *비병목 가속이 재고를 누적*한다는 *시스템 사고*로 진단. **Wilson의 *시스템 사고 부재* 오류 (#5)는 그 *경험 데이터*** — 시니어 리뷰 부담 6.5% 증가가 *비병목 가속의 정확한 재고 누적*. *Van Brabant의 가설 + Wilson의 데이터*가 짝.

### [[2026-05-14-ai-coding-complexity-ratchet-garry-tan]] *Ratchet의 정직한 한계*

Garry Tan은 *90% 커버리지 + AI*가 결함 92~97% 제거라고 했다. **Wilson 잣대로 점검**:
- *측정 단위가 결함 제거율인지 사용자 영향력 감소율인지 불명*
- *시니어 리뷰 부담 측면 누락*
- *장기 기술 부채 측면 누락*

→ *Ratchet 자산을 폐기하지 않음*. 하지만 *가든이 인용할 때 "Wilson 잣대 점검 미완"* 주의 표시 박는 게 정직. **15번째 자가 진단의 첫 적용 사례**.

### [[2026-05-21-dorsey-ai-native-organization]] *Dorsey 40% 감원*의 *측정 신뢰성*

어제 정리한 Dorsey 자산에 *40% 감원*이 *AI 코딩 모델 성숙도 + 환각 개선*에 근거한다고 적혔다. **Wilson 잣대 점검**:
- *Dorsey 결정의 근거가 약한 기준선*(AI vs 무도구)이 아닌지
- *단기 신기효과 + 장기 기술 퇴화*가 반영되었는지
- *시스템 사고가 빠지지 않았는지* (리뷰 부담·고객 신호 매개)

→ *Dorsey 모델 적용 진단표*에 *Wilson 12 오류 점검*을 사전 항목으로 추가. *CRS 부분 적용·MangoLove 자문·BugSip 설계* 시 *Dorsey 인용 전 Wilson 잣대 통과* 의례.

### CRS / 사이드 프로젝트 즉시 적용 후보 4건

1. **CRS *AI 도입 효과 측정 설계*** — AI 도입을 결정하기 전 *Wilson 12 오류 체크리스트*를 *측정 계획에 사전 적용*. 특히 *시니어 리뷰 부담 흡수 6.5% 정도가 발생하지 않는지* 6개월 종단 추적.
2. **MangoLove *생산성 주장 검증 자문*** — 클라이언트의 *AI 30% 생산성 증가* 같은 주장이 들어올 때 *Wilson 잣대 12개*를 *자문 첫 결과물*로 제출. 통과 못한 항목은 *재측정 권고*.
3. **[[project_bugsip]] *학습 효과 측정*** — BugSip의 *코드 리딩 학습 효과*를 *수락률·세션 길이* 같은 *쉬운 숫자*가 아니라 *3개월 뒤 새 코드 해석 정확도*로 측정. *Goodhart 회피 설계*.
4. **가든 *수치 인용 의례*** — 새 글 정리 시 *수치 인용 1개당* Wilson 12 오류 중 *어디에 걸릴 가능성이 있는지* 1~2줄 정직 표시. *과적합 자제 — 12개 다 점검은 자가 진단 분기 1회만, 평소엔 *해당될 가능성 높은 오류 1~2개*만*.

### *오버 메타화* 자기 견제

이 글은 *방법론 자산*이므로 *가든의 거의 모든 수치 인용*에 닿는다. **그래도 *25/40칸 매트릭스 재정의는 자제*** — *오버 메타화*. 15번째 자가 진단 1건 추가 + *기존 자산에 대안 인과 해석 1개 박기*(Jay Gup)로 멈춤. *Wilson 12 오류 전부를 가든 별도 인덱스화*는 *분기 1회 의례*로 미룸.

## 연관 자료
- [Twelve Ways We Get AI-Assisted Coding Wrong](https://third-bit.com/2026/05/20/twelve-ways-we-get-ai-assisted-coding-wrong/)
- [GeekNews — 29745](https://news.hada.io/topic?id=29745)
- [[2026-05-14-experience-is-now-a-tax]] — 경험=세금 *(실증 데이터 + 대안 인과 해석)*
- [[2026-05-17-amazon-token-burning-goodharts-law]] — Goodhart KPI 차원 *(방법론 차원 짝 추가)*
- [[2026-05-16-hashimoto-ai-mass-psychosis]] — AI 광기 *(시스템 사고 부재의 정성 진단)*
- [[2026-05-18-ai-wont-speed-up-processes]] — TOC AI *(시스템 사고 + 경험 데이터 짝)*
- [[2026-05-17-claude-to-codex-migration-reddit]] — 40% 완료 환각 *(사용자 자기 환각 짝)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(완료 정의 강제 + 증거 신뢰성)*
- [[2026-05-14-ai-coding-complexity-ratchet-garry-tan]] — Ratchet *(15번째 자가 진단 첫 적용)*
- [[2026-05-21-dorsey-ai-native-organization]] — Dorsey *(40% 감원의 측정 신뢰성)*
- [[2026-05-19-simon-willison-six-months-of-llm]] — Simon 시간 핀 *(Goodhart 훈련 차원 짝)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — Wilson 12 오류 체크리스트가 가든 새 글 정리에 한 번이라도 쓰였는지, 15번째 자가 진단 분기 점검이 돌아갔는지, Jay Gup 자산의 대안 인과 해석이 CRS/MangoLove 실무 의사결정에 영향을 줬는지, *시니어 리뷰 부담 흡수* 패턴이 실제 사례에서 관찰되었는지 정직히 기록.)*
