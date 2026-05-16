---
title: "Mitchell Hashimoto: '많은 기업이 AI 집단 광기에 빠져 있다' — Agent-Default Posture에 대한 *시니어 시각의 반격*"
source_title: "지금 많은 기업이 AI 집단 광기에 빠져 있다고 믿는다"
source_url: "https://x.com/mitchellh"
source_name: "Mitchell Hashimoto (X 스레드, HashiCorp 공동창업자)"
referrer_url: "https://news.hada.io/topic?id=29549"
published_at: "2026-05-15"
summarized_at: "2026-05-16"
category: "ai"
tags: ["ai-coding", "agent-default", "architecture-rot", "mttr", "contrarian", "hashimoto", "senior-judgment", "test-coverage"]
---

# Mitchell Hashimoto: '많은 기업이 AI 집단 광기에 빠져 있다' — Agent-Default Posture에 대한 *시니어 시각의 반격*

> 출처: [Mitchell Hashimoto (@mitchellh) X 스레드](https://x.com/mitchellh) · GeekNews 경유 [news.hada.io/topic?id=29549](https://news.hada.io/topic?id=29549) · 정리일 2026-05-16

## 🔖 한 줄 요약
HashiCorp 공동창업자 Mitchell Hashimoto의 도발적 진단 — 지금 많은 기업이 *"에이전트가 버그를 빠르게 고치니까 버그를 출시해도 된다"* 식의 *MTTR 만능주의*에 빠져 있고, 그 결과 *기저 아키텍처가 부식*하는데 *테스트 커버리지·버그 감소 같은 지표 왜곡*과 *대화 차단*으로 *문제 제기 자체*가 봉쇄된다. 가든의 [Agent-Default Posture](2026-05-14-code-with-claude-recap-19-sessions.md)·[Ratchet](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Jay Gup 경험=세금](../career/2026-05-14-experience-is-now-a-tax.md) 라인에 *시니어 시각에서 정면 반대*하는 글.

## 🧩 핵심 포인트

- **MTTR 만능주의 = AI 집단 광기의 정확한 진단명.** Hashimoto의 가장 무거운 한 줄 — *"에이전트가 빠르게 고칠 거니까 버그를 그냥 내보내도 된다"*. 이게 *합리적 트레이드오프*처럼 들리지만 사실은 *복구 시간이 낮으면 사고 빈도가 올라도 된다* 는 *공급 측 환상*. *사고 빈도*가 올라가는 동안 *기저 아키텍처가 부식*하고, 그 부식은 MTTR 지표에 *전혀 나타나지 않는다*.
- **변화 속도가 *진단 자체*를 차단한다.** 변경이 빠를수록 *각 변경의 컨텍스트*가 흐려진다. *아키텍처 부식*은 *느린 누적 현상*인데 *빠른 변화는 그 누적을 사람의 시야 밖으로 밀어낸다*. *문제가 있다는 신호*를 *시그널 노이즈에 묻어버리는 메커니즘*.
- **지표 왜곡 — 더 좋아 보이는데 더 나빠지는 사례.** *테스트 커버리지 증가*와 *버그 보고 감소*가 자동으로 *안전성 증가*를 뜻하지 않는다. AI가 *통과하기 쉬운 테스트를 대량 추가*하면 커버리지 숫자는 올라가지만 *진짜 위험은 그대로 남는다*. *실제로 보고되지 않는 버그*는 *발견되지 않은 것*일 수 있다. [Garry Tan의 "85~95% knee point"](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)가 *지표 자체가 보이지 않게 부식할 때* 무엇을 보장하는가의 질문.
- **대화 차단 메커니즘.** 시니어가 *"이건 아키텍처 문제"*라고 제기하면 *"테스트 커버리지 100%잖아"·"버그 신고 줄었잖아"* 로 *반박이 차단*된다. 이게 *기술적 반박*이 아니라 *대화 종료 도구*로 사용된다는 점이 핵심. *조직이 광기 상태인지 아닌지*의 판정 기준 한 줄.
- **이해 불가능한 복잡도.** AI가 생성한 코드가 *인간이 이해할 수 없는 수준*으로 복잡해지는 현상. [Naur의 "프로그램의 본체는 머릿속 이론"](../engineering/2026-05-14-naur-programming-as-theory-building.md)이 *조직 차원의 디스토피아*로 현실화된 것 — *어떤 사람도 이론을 가지고 있지 않은 코드*가 *돌아간다*는 상태. 이게 가능한 이유는 *돌아가기*까지의 임계점이 *이해 가능성*보다 낮기 때문.

## 📜 인상 깊은 문장

> "에이전트가 빠르게 고칠 테니까 버그를 출시해도 된다"는 MTTR 만능주의

> 테스트 커버리지가 100%라는 답으로 *아키텍처 문제에 대한 대화 자체*가 차단된다.

## 💭 내 생각 · 적용점

**가든의 두 번째 *의도적 반대 명제 자산*.** [Jay Gup 경험=세금](../career/2026-05-14-experience-is-now-a-tax.md)이 *시니어 옹호 라인에 반대*했다면, Hashimoto는 *Agent-Default Posture 라인에 반대*한다. 두 글이 가든 안에서 *대각선*에 놓인다 — Jay Gup은 시니어를 의심하고 Agent를 옹호, Hashimoto는 Agent를 의심하고 시니어를 옹호. **두 글을 같은 자리에 두는 것이 가든의 보수 편향 또는 진보 편향 어느 쪽도 굳지 않게 만드는 *균형 메커니즘***. 어느 한 쪽으로만 글이 쌓이면 나의 머릿속 모델이 굳는다 — 두 명제를 *둘 다 그럴듯하게 들리는 상태*로 유지하는 게 정리의 진짜 목적이다.

**[Garry Tan Ratchet](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)과 *처방이 정반대로 도출*되는 흥미로운 충돌.** 두 사람 모두 *AI 코딩이 복잡도를 누적시킨다*는 같은 *관찰*에서 출발한다. **하지만 처방이 완전히 갈린다** — Garry Tan은 *테스트·평가·문서를 *더* 누적해서 후퇴 불가 래칫을 만들자*고 한다. Hashimoto는 *그 테스트·지표 자체가 부식을 가린다*고 한다. 어느 쪽이 맞는가는 *조직의 *지표 신뢰성*과 *대화 가능성*에 달려 있다*. 지표를 *조작 불가*하게 박을 수 있는 조직(예: Anthropic처럼 *왜를 가르치는* 일관성 있는 거버넌스)에선 Garry Tan이 맞고, 지표가 *반박 도구*로 변질되는 조직에선 Hashimoto가 맞다. **같은 도구가 거버넌스 품질에 따라 *안전망*이 되거나 *광기 가속기*가 된다**는 게 두 글의 종합 명제.

**[Code w/ Claude SF의 Agent-Default Posture](2026-05-14-code-with-claude-recap-19-sessions.md)에 *사용자 측면 견제 시각*.** Anthropic이 *제품 라인업으로* 공식화한 Agent-Default Posture에 대해, 사용자 측 시니어가 *실제 조직 운영에서 일어나는 일*을 보고하는 글. Anthropic은 *Effort·Outcomes·Managed Agents* 같은 *통제 장치*를 함께 제시하지만, Hashimoto의 진단은 *그 통제 장치들이 사용자 조직 안에서 *제대로 작동하지 않을 수 있다*는 경고*. **제품의 안전 기능이 *조직의 거버넌스*보다 더 안전해질 수는 없다**. 가든이 Anthropic 발표를 무비판 수용하지 않게 하는 안전핀.

**[Naur의 *프로그램의 죽음*이 *조직 차원에서 실시간으로 일어나는 모습*.** Naur는 *팀이 해산해서 이론이 사라진다*고 했다. Hashimoto는 *팀이 멀쩡히 있는데도 *처음부터 이론이 형성되지 않는다*는 새로운 죽음의 형태를 본다. 두 죽음의 차이: Naur 죽음은 *시간이 지나서* 일어나고, Hashimoto 죽음은 *생산 속도가 이해 속도를 초과해서* 일어난다. **AI 시대의 새로운 *프로그램 사산(死産)*** — 살아 본 적 없는 죽음.

**MangoLove·CRS·BugSip 적용 후보.**
- **대화 차단 신호 인식 체크리스트.** 우리 팀의 회의에서 *아키텍처 문제 제기*에 *"테스트 통과했잖아"·"버그 신고 없잖아"* 식 *반박*이 나오면 *기술적 반박이 아니라 대화 종료 도구*로 작동하는지 즉시 확인. MangoLove `strict.md`에 *"문제 제기를 지표로 반박하는 패턴을 금지"* 한 줄.
- **MTTR 지표 *단독 사용 금지*.** CRS 운영에서 MTTR이 *유일한 안정성 지표*가 되지 않도록 *사고 빈도·심각도·아키텍처 부채 지표*와 *짝*으로 운용. Hashimoto의 진단을 *우리 KPI 설계의 가드레일*로.
- ***이해 가능성 지표*를 KPI에 박기.** *어떤 새 합류자가 이 코드의 *왜*를 N시간 안에 설명할 수 있는가* 같은 *이해 가능성 측정*을 *분기 1회*로 의례화. Naur·[Anthropic Why 정렬](2026-05-14-teaching-claude-why-alignment-training.md)·Hashimoto가 *같은 방향*을 가리키는 이 지표가 *조직의 광기 여부 1차 진단*.
- **BugSip 자체에 *광기 방지 절*.** *우리 코드를 우리도 이해 못 하게 되는 시점*을 *명시적 알람 임계*로 박기. 30분 1인 빌더가 가능한 시대 ([Ptacek](2026-05-14-emacsification-of-software-ptacek.md))일수록 *나 자신*이 *AI 광기*에 빠지기 쉽다는 인식. *내가 만든 코드를 내가 일주일 뒤에 이해하는가*를 정기적으로 자가 진단.

**나 자신에 대한 가장 어려운 적용.** 지금 *가든 자체*가 *내 광기 가능성*을 시험한다. 매일 새 글을 정리하면서 *내가 이해 못 한 글*도 *그럴듯한 가든 자산*으로 정리할 수 있다. *Hashimoto의 *대화 차단 신호*가 *나 자신에게* 나타나는지* 확인 — 누군가가 *"이 정리 너무 빠른 것 아니야?"* 라고 말했을 때 *"GitHub에 다 있고 인덱스도 잘 정렬돼 있어"* 로 답하면 그게 정확히 *지표 왜곡*의 사례. 정리 *건수*가 *이해 깊이*의 대리지표가 되면 안 된다.

## 🔗 연관 자료
- [Code w/ Claude SF — Agent-Default Posture](2026-05-14-code-with-claude-recap-19-sessions.md) — Hashimoto가 *정확히 반대*하는 자세의 공식 발표
- [Garry Tan — 복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — 같은 관찰, *처방이 정반대*인 짝 자산
- [Jay Gup — 경험은 이제 세금이다](../career/2026-05-14-experience-is-now-a-tax.md) — 가든 *대각선* 반대 명제 (Jay Gup ↔ Hashimoto)
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *프로그램의 사산(死産)* 이라는 새 죽음의 형태
- [Anthropic — Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — *왜 정렬*이 조직 차원에서 실패할 때 Hashimoto 디스토피아가 발생
- [Tuhin Nair — 시니어 전수 실패](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md) — *시니어가 비즈니스 언어로 번역에 실패*하는 메커니즘이 Hashimoto의 *대화 차단*에서 정점

## 📝 한 달 뒤 회고
<!-- 6월 중순: 우리 팀 회의에서 *지표 반박으로 대화 차단*이 일어난 사례를 *몇 건* 식별했는가? CRS KPI에 MTTR과 짝이 되는 *사고 빈도·아키텍처 부채 지표*가 들어갔는가? *이해 가능성 지표* (N시간 내 새 합류자의 *왜* 설명) 의례를 분기 1회로 잡았는가? 가든 자체에 *광기 자가 진단* (정리 *건수* ≠ *이해 깊이*) 절을 만들었는가? -->
