---
title: "이론 형성으로서의 프로그래밍 — Naur의 1985년 논문이 AI 코딩 시대에 더 날카로워지는 이유"
source_title: "Programming as Theory Building"
source_url: "https://gwern.net/doc/cs/algorithm/1985-naur.pdf"
source_name: "Peter Naur (gwern.net 호스팅)"
referrer_url: "https://news.hada.io/topic?id=29501"
published_at: "1985-01-01"
summarized_at: "2026-05-14"
category: "engineering"
tags: ["programming", "theory-building", "naur", "soft-skill", "tacit-knowledge", "ai-coding", "classic"]
---

# 이론 형성으로서의 프로그래밍 — Naur의 1985년 논문이 AI 코딩 시대에 더 날카로워지는 이유

> 출처: [Programming as Theory Building (1985, PDF)](https://gwern.net/doc/cs/algorithm/1985-naur.pdf) · GeekNews 경유 [news.hada.io/topic?id=29501](https://news.hada.io/topic?id=29501) · 정리일 2026-05-14

## 🔖 한 줄 요약
프로그래밍의 본체는 *코드*도 *문서*도 아니라 프로그래머의 머릿속에 살아 있는 "이론(theory)" 이며, 이론을 가진 사람들이 흩어지면 그 프로그램은 텍스트가 멀쩡해도 사실상 죽은 것 — 41년 전 글이지만 AI가 텍스트만 잘 만들어 주는 지금 가장 무겁게 읽혀야 하는 문장이다.

## 🧩 핵심 포인트

- **프로그램 = 이론, 코드 = 이론의 부산물.** Naur는 Ryle의 "지식의 유형" 구분을 빌려 프로그래밍을 "특정 문제 영역에 대해 *왜* 그렇게 만들었는지를 설명·정당화·확장할 수 있는 능력"으로 정의한다. 코드 라인 수가 아니라 **설명·정당화·확장 능력**이 프로그래머가 "이론을 가지고 있다"는 증거다.
- **문서는 이론을 *대신* 할 수 없다.** 문서는 이론을 *지원*할 뿐, 새 사람이 문서만 읽고 원래 설계자의 이론을 복원할 수는 없다. 문서가 있어도 "왜 이 함수가 여기 있는가"는 원작자의 머릿속에만 있다.
- **유지보수의 진짜 비용은 텍스트 편집이 아니라 이론 재구축이다.** 새 요구가 들어왔을 때 어디를 고쳐야 할지, 그 변경이 어떤 가정과 충돌하는지 판단하려면 *기존 이론*을 머릿속에 다시 세워야 한다. 그래서 큰 시스템에 새 인력이 투입되면 코드 분량이 작아도 시간이 갑자기 늘어난다.
- **프로그램의 "죽음"이라는 개념.** Naur는 충격적인 표현을 쓴다: 원래 이론을 가진 팀이 해산되면 프로그램은 죽었고, 텍스트로부터 이론을 *재구축*하는 것은 거의 항상 *원래 작성보다 비용이 크다*. 그래서 기업이 흔히 하는 "옛 시스템을 분석해서 재작성하자"는 결정은 보통 잘못된 가격을 매기고 시작한다.
- **세대 전수는 도제식으로만 가능.** 이론은 글로 압축되지 않으므로, 후임이 이론을 갖게 하려면 *기존 이론 보유자와 함께 일하면서* 결정 과정을 보고, 반론을 듣고, 작은 변경을 해 보는 *수련* 외에는 길이 없다.

## 📜 인상 깊은 문장

> "Programming properly should be regarded as an activity by which the programmers form or achieve a certain kind of insight, a theory, of the matters at hand. This suggests that program text and documentation are merely indirect expressions of this insight."

> "The death of a program happens when the programmer team possessing its theory is dissolved."

> "A revival of a program is the rebuilding of its theory by a new programmer team."

## 💭 내 생각 · 적용점

**AI 코딩이 일반화되면서 1985년의 이 글이 오히려 *더* 무거워졌다.** 코드 생성 속도가 100배가 되어도 *이론*은 똑같이 사람 머릿속에서만 자란다. 텍스트가 폭증하지만 그 텍스트를 *정당화*할 수 있는 사람의 밀도는 오히려 옅어지는 구조 — 이것이 이번 달에 정리한 [복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)이 작동하는 정확한 메커니즘이다. AI가 *코드를 쓰지만 이론을 만들지는 못한다*. 시니어가 사라지는 게 아니라 *유일하게 이론을 가진 자*로서 더 비싸진다는 [Tuhin Nair의 진단](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md)이 Naur 위에 그대로 얹힌다.

**Anthropic의 *Why* 정렬과 직접 호응.** [Teaching Claude Why](../ai/2026-05-14-teaching-claude-why-alignment-training.md)에서 Anthropic이 발견한 것 — 결과 행동이 아니라 *이유*를 가르치면 28배 효율로 일반화한다 — 는 Naur가 1985년에 사람에 대해 말한 것을 LLM에 대해 다시 발견한 것이다. *이론을 갖는다*는 게 사람과 모델 양쪽에서 일반화 능력의 본체다.

**가든 운영의 정확한 정당화.** 이 가든이 *기사 링크 모음*이 아니라 *왜 이 글이 가든의 어느 가설과 연결되는가*를 매번 적게 만드는 이유가 Naur로 설명된다. 링크만 모아두면 가든은 텍스트지만, 매 글마다 "[Speed/Scale 분리]"·"[Ratchet 시리즈]"·"[Agent-Default Posture]"로 묶어 두면 *내 머릿속 이론*이 매번 한 줄씩 보강된다. 이게 6개월 뒤 큐레이션이 *재구축 가능*하게 만드는 메커니즘이다.

**팀 운영(MangoLove, CRS) 적용 후보.**
- **사람을 갈아끼우는 비용은 코드 라인 수가 아니라 *이론 보유자* 기준으로 계산하자.** "이 모듈은 작으니 신입에게 맡기자"는 거의 항상 *이론 재구축 비용*을 무시한 견적이다. 신입에게 맡길 때는 *이론 보유자와의 페어 시간*을 비용의 일부로 명시적으로 잡아야 한다.
- **레거시 시스템 재작성은 *이론이 살아 있을 때*만 의미가 있다.** 원작자 팀이 이미 해산했다면 "재작성"은 사실상 *새 시스템 작성*이고, 견적이 그렇게 되어야 한다. 종종 *이론 재구축이 가능한 마지막 1~2명을 다시 모셔 오는 비용* 이 새 팀의 6개월 분 인건비보다 싸다.
- **문서화의 정확한 한계.** "문서를 잘 남기면 사람이 바뀌어도 된다"는 위안은 Naur가 정확히 부정한 명제다. 문서는 *이론 보유자가 옆에 있을 때* 그의 설명 비용을 줄여 주는 보조 도구지, *이론의 대체재가 아니다*. 따라서 인수인계의 핵심 KPI는 *문서 완성도*가 아니라 *새 사람이 변경 결정을 정당화할 수 있게 되기까지의 시간*이다.

**BugSip 기획에 그대로 박힌다.** [BugSip](../README.md)이 "코드 리딩 앱"인 이상, 우리가 제공해야 하는 것은 *코드 라인*이 아니라 *그 라인이 왜 거기 있는가에 관한 이론 형성 보조*다. "이 PR이 어떤 가정을 깨고 있는가", "이 함수가 호출되는 *상황의 의미*" — Naur가 말하는 *이론*을 모바일 5분짜리 세션으로 *주입*하는 게 BugSip의 진짜 가치 제안이고, 그게 단순한 코드 뷰어와 갈리는 분기점이다.

## 🔗 연관 자료
- [복잡성 래칫 — Garry Tan](../ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — AI 생성 코드가 *이론 없는 코드*를 폭증시키는 구조적 이유
- [시니어 개발자가 전문성을 전달하지 못하는 이유 — Tuhin Nair](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md) — *이론을 가진 자*가 도제식 전수에 실패하는 메커니즘
- [Teaching Claude Why — Anthropic](../ai/2026-05-14-teaching-claude-why-alignment-training.md) — *Why*를 가르치면 28x 일반화: Naur의 사람 이론을 LLM에 적용한 동형 발견
- [Code w/ Claude SF 19개 세션 정리](../ai/2026-05-14-code-with-claude-recap-19-sessions.md) — Agent-Default Posture가 *이론 없는 코드*를 더 빨리 양산할 위험
- [중국 AI 연구소 내부에서 얻은 교훈 — Nathan Lambert](../ai/2026-05-14-notes-from-inside-chinas-ai-labs.md) — "엔지니어 vs 변호사" 카테고리 차이도 *어떤 이론이 조직 안에서 자라는가*의 차이

## 📝 한 달 뒤 회고
<!-- 6월 중순: MangoLove 인수인계 또는 CRS 신규 합류 케이스에 "이론 보유자 페어 시간 명시" 견적 방식을 시도해 보고 결과를 기록한다. BugSip MVP 기획서에 "코드 라인 → 이론 보조" 문구를 1차 가치 제안으로 박았는지 확인. -->
