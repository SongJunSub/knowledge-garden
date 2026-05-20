---
title: "Amazon 직원들의 *토큰 태우기* — Goodhart's Law의 AI 시대 변형이 실증된 첫 대형 사례"
source_title: "Amazon Employees Inflate AI Token Consumption"
source_url: "https://www.fastcompany.com/91541586"
source_name: "Fast Company"
referrer_url: "https://news.hada.io/topic?id=29568"
published_at: "2026-05-16"
summarized_at: "2026-05-17"
category: "ai"
tags: ["goodharts-law", "kpi-distortion", "amazon", "token-economy", "ai-adoption", "incentive-misalignment", "agent-abuse", "case-study"]
---

# Amazon 직원들의 *토큰 태우기* — Goodhart's Law의 AI 시대 변형이 실증된 첫 대형 사례

> 출처: [Amazon Employees Inflate AI Token Consumption — Fast Company](https://www.fastcompany.com/91541586) · GeekNews 경유 [news.hada.io/topic?id=29568](https://news.hada.io/topic?id=29568) · 정리일 2026-05-17

## 한 줄 요약
Amazon이 *AI 토큰 소비량*을 직원 활용도 지표로 추적하기 시작하자 *직원들이 토큰을 태우기 위해 불필요한 AI 에이전트를 만든다*는 Fast Company의 내부 보고 — Goodhart's Law("측정이 목표가 되면 측정이 망가진다")의 *AI 시대 노골적 실증*. 가든의 [Hashimoto AI 광기](2026-05-16-hashimoto-ai-mass-psychosis.md)·[Anthropic 공식 매뉴얼](2026-05-16-claude-code-large-codebases.md)·[Code w/ Claude의 Effort 기능](2026-05-14-code-with-claude-recap-19-sessions.md) 라인이 *현장 케이스*로 합쳐진 자리.

## 핵심 포인트

- ***토큰 소비량*을 KPI로 박는 순간 KPI는 게임된다.** Amazon은 *AI 사용 정도*를 *토큰 소비량* 으로 추적했다. 직원들의 합리적 반응: *MeshClaw 같은 내부 도구로 토큰만 태우는 가짜 작업*을 짜서 *지표를 만족*시킨다. *진짜 생산성 향상*과 *토큰 사용량*의 상관관계가 *애초에 약했는데*, 측정 자체가 *그 약한 상관관계를 0으로 끌어내렸다*.
- ***주간 개발자 80% AI 사용 목표*가 공식·비공식 사이에서 떠다닌다.** 회사는 *공식 부인*하지만 직원들은 *내부에서 그렇게 작동한다*고 보고. *목표가 명문화되지 않을수록* 더 위험 — *공식 부정으로 책임은 면제*되지만 *비공식 압력은 그대로 작동*하는 *책임 비대칭 구조*. [Eric Ries Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)의 *정관에 미션을 구체적으로 명시*가 *왜 중요한가*의 정확히 반대 사례.
- **AI 시대 Goodhart의 *수퍼휴먼 가속*.** 인간이 *KPI 게임용 가짜 작업*을 만드는 데는 *시간이 든다*. 하지만 AI 에이전트는 *토큰 낭비 자체를 자동화*할 수 있다 — *MeshClaw가 토큰 태우기 자동화 도구*가 된다. 이게 *Goodhart's Law의 본질적 새 차원* — *KPI 왜곡의 비용이 0에 가까워진다*. ([Ptacek 30분 1인 빌더](2026-05-14-emacsification-of-software-ptacek.md)가 *생산적 도구*의 30분 비용이 0이라면, Amazon은 *Goodhart 게임 도구*의 30분 비용이 0이다.)
- **환경 문제 + 진짜 기회비용.** *생산성과 무관한 토큰*은 *전력·물·GPU 시간*을 *실제로* 소비한다. *낭비된 자원*이 더 큰 문제가 아니라 *진짜 생산성 향상에 쓰일 수 있던 자원을 가린다*는 점이 핵심. *어떤 사용이 진짜 가치인가*를 판단할 *데이터 자체가 오염*된다.
- **모순된 리더십 발언.** 댓글의 한 FAANG 직원 인용 — *"리더십이 토큰 지출을 지속 장려하면서도 악용 가능성을 인정"*. 이건 [Hashimoto의 *대화 차단*](2026-05-16-hashimoto-ai-mass-psychosis.md)의 *경영진 버전* — *문제를 *인정*하면서 *대안을 제시하지 않는다*. 인정이 *대화 회피*가 아니라 *대화의 종결*로 작동한다.

## 인상 깊은 문장

> 리더십이 토큰 지출을 지속 장려하면서도 악용 가능성을 인정한다 — *FAANG 직원의 익명 보고*

> *토큰 소비량*이 KPI가 되는 순간, 직원들은 *생산성 향상*이 아니라 *지표 만족*에 최적화한다.

## 내 생각 · 적용점

**가든의 *지표 왜곡 라인* 의 첫 *실증 케이스*.** 지금까지 가든은 [Hashimoto 광기](2026-05-16-hashimoto-ai-mass-psychosis.md)·[Garry Tan Ratchet의 지표 누적](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Code w/ Claude의 Effort](2026-05-14-code-with-claude-recap-19-sessions.md)에서 *지표가 왜곡될 수 있다*는 가설을 *이론적*으로만 가지고 있었다. Amazon 사례는 *그 가설이 현장에서 어떻게 작동하는가*의 *증거*. **가설 → 증거의 단계 이동**이 가든 자산의 *성숙*을 보여준다.

**[Code w/ Claude *Effort* 기능](2026-05-14-code-with-claude-recap-19-sessions.md)과의 *정확한 정반대*.** Anthropic이 *Effort*(필요한 만큼만 컴퓨트 사용)을 출시한 *같은 시기*에 Amazon은 *최대한 많이 태우기*를 인센티브화. **두 회사가 *같은 자원(토큰)*에 대해 *정반대 방향의 신호*를 보낸다.** Anthropic 측 신호는 *낭비 줄이기*이고 Amazon 측 신호는 *낭비가 곧 활용 증거*. *제품 설계*가 *조직 인센티브*보다 안전해질 수 없다는 [Hashimoto의 진단](2026-05-16-hashimoto-ai-mass-psychosis.md)이 *Effort 기능의 무력화*로 가시화된다 — *Effort를 잘 쓰는 직원이 토큰 KPI에서 진다*.

**[Anthropic Why 정렬](2026-05-14-teaching-claude-why-alignment-training.md)의 *조직 차원 실패 메커니즘*.** Anthropic은 모델에 *왜*를 가르치면 28배 일반화한다고 했다. Amazon 사례는 *왜* 가 *KPI*로 대체될 때 무엇이 일어나는가의 반증 — *목적(생산성 향상)이 측정(토큰 소비량)으로 *조용히 대체*되면 *측정이 진짜 목적과 멀어진다*. **AI 도입의 *왜*를 명문화하지 않은 채 *얼마나*만 측정하면 Amazon이 된다**.

**[Anthropic 공식 매뉴얼](2026-05-16-claude-code-large-codebases.md)의 *댓글 비판*이 *Amazon 케이스로 실증*.** 어제 정리한 공식 매뉴얼의 댓글에서 *"지시 불이행 90%·하네스 작동 안 함"* 보고가 있었다. Amazon은 그 *왜*의 정밀한 답 — *매뉴얼이 좋아도 KPI가 토큰 양으로 박혀 있으면 매뉴얼의 베스트 프랙티스를 따를 *이유가 없다***. *얇은 CLAUDE.md*를 짧게 잘 쓰면 토큰을 *덜* 쓰게 되고, 그게 *KPI에서 마이너스*가 된다. **매뉴얼은 *광기 방지 필요조건*이지만 KPI 설계가 *충분조건*** 이라는 어제의 결론이 *Amazon 케이스로 강하게 확정*된다.

**메타 가설: *AI 시대 Goodhart의 수퍼휴먼 속도*.** Goodhart's Law는 *인간 게임 비용*을 가정한 법칙. AI는 *게임 비용을 0으로* 만든다. 그러면 *Goodhart's Law의 적용 강도가 한 자릿수 더 강해진다*. **모든 KPI는 *AI가 게임할 수 있는가*를 1차 점검 항목으로 박아야 하는 시대**. 이게 가든에 새로 박을 메타 가설 — *"AI-Goodhart 시험: 이 KPI를 만족시키는 AI 에이전트를 30분에 만들 수 있는가? 만들 수 있다면 이 KPI는 안전하지 않다."*

**MangoLove·CRS·BugSip 적용 후보.**
- **AI 도입 KPI에 *AI-Goodhart 시험*을 의무 절차로.** CRS 운영팀이 *AI 사용 정도*를 KPI화하려 할 때, *그 KPI를 게임하는 AI 에이전트가 30분에 만들어지는가*를 *먼저* 점검. 만들어지면 *그 KPI는 폐기*하거나 *다른 KPI와 짝*으로만 운용.
- **MangoLove 자문 도구에 *Amazon 사례* 박기.** *생산성 측정과 토큰/시간 측정의 분리*가 자문 클라이언트에게 가장 큰 가치. *기능 출하 수·결함 감소·실제 사용자 가치 지표*가 *토큰/시간 사용량*보다 *항상 우선*하도록.
- **CRS의 *AI 사용 정성 평가*.** *토큰 양*이 아니라 *어떤 종류의 작업에 AI를 썼는가, 그 결과 코드/문서 품질이 어떻게 바뀌었는가*를 *3개월에 한 번 리뷰*. [Anthropic 공식 매뉴얼의 *3~6개월 의도적 검토*](2026-05-16-claude-code-large-codebases.md)와 같은 주기.
- **BugSip 자체에 *Goodhart 면역 KPI 설계*.** 처음부터 *DAU/MAU* 같은 *게임 가능한 양적 지표*를 1차 KPI로 박지 말고, *주간 코드 흡수 세션 횟수·읽은 코드의 *왜* 를 설명할 수 있는 사용자 비율* 같은 *AI가 30분에 게임할 수 없는 정성 지표*를 1차에. [Ries Incorruptible의 정관 미션](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)이 *KPI 차원에서* 어떻게 작동하는가의 구체화.

**가든 자체에 대한 자가 적용 — 두 번째.** 어제 [Hashimoto 광기 자가 진단](2026-05-16-hashimoto-ai-mass-psychosis.md)이 *"정리 건수 ≠ 이해 깊이"*였다면, 오늘은 더 정밀해진다 — *가든 자체에 AI-Goodhart 시험을 적용*하면 *"매일 글 정리"라는 자가 KPI는 *내가 30분에 게임할 수 있는가?"* 답은 *나는 게임하지 않지만, 게임할 수 있는 구조에 있다*. 그러므로 *Goodhart 면역 자가 지표*가 필요 — *한 달 뒤 회고가 실제로 다시 읽히고 점검되는가*가 그 후보. 정리 *시점*에 가치가 결정되는 게 아니라 *회고 시점에 다시 작동하는가*가 가치를 결정.

## 연관 자료
- [Hashimoto — AI 집단 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) — *지표 왜곡* 이론의 *현장 실증*
- [Anthropic — Claude Code 대규모 코드베이스 사용법](2026-05-16-claude-code-large-codebases.md) — *공식 매뉴얼 + KPI 인센티브 충돌* 메커니즘
- [Code w/ Claude SF의 *Effort* 기능](2026-05-14-code-with-claude-recap-19-sessions.md) — Anthropic *낭비 줄이기* vs Amazon *낭비 인센티브화* 의 정반대 신호
- [Anthropic — Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — *왜 → KPI 대체*가 일어나는 정확한 메커니즘
- [Garry Tan — 복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — *지표 누적*이 *Goodhart 게임 대상*이 될 때
- [Eric Ries — Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *정관에 미션 구체화* 가 *Amazon 모순 리더십*과 정확히 반대 처방
- [Ptacek — Emacsification](2026-05-14-emacsification-of-software-ptacek.md) — *30분에 게임 도구를 만든다*는 비용 함수가 Goodhart 가속의 본질

## 한 달 뒤 회고
<!-- 6월 중순: AI-Goodhart 시험("이 KPI를 만족시키는 AI 에이전트를 30분에 만들 수 있는가")을 *실제로* CRS/MangoLove KPI 설계에 1차 점검 항목으로 박았는가? BugSip 초기 KPI 설계에서 *DAU/MAU 같은 양적 지표*를 *1차에서 제외*하고 정성 지표를 1차에 놓았는가? 가든 자체의 *한 달 뒤 회고가 실제로 작동하는가*를 점검하는 메타 회고를 시도했는가? (이 회고 자체가 그 시작) -->
