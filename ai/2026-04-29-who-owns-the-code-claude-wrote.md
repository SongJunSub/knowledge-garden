---
title: "Claude Code가 작성한 코드의 소유자는 누구인가?"
source_title: "Who Owns the Code Claude Wrote?"
source_url: "https://legallayer.substack.com/p/who-owns-the-claude-code-wrote"
source_name: "Legal Layer (Sena Evren)"
referrer_url: "https://news.hada.io/topic?id=29005"
published_at: "2026-04-28"
summarized_at: "2026-04-29"
category: "ai"
tags: ["저작권", "AI코드", "오픈소스", "GPL", "고용계약", "법무", "리스크관리"]
---

# Claude Code가 작성한 코드의 소유자는 누구인가?

> 출처: [Legal Layer — Who Owns the Code Claude Wrote?](https://legallayer.substack.com/p/who-owns-the-claude-code-wrote) · 레퍼러: [GeekNews 29005](https://news.hada.io/topic?id=29005) · 정리일 2026-04-29

## 한 줄 요약
"AI가 작성한 코드는 누구 것인가?"는 단일 질문이 아니라 **저작권 성립 / 고용 관계 / 라이선스 오염** 세 축의 별개 문제이며, *오늘 당장* 실무자가 해야 할 일은 라이선스 스캔과 창작 기여 기록이다.

## 핵심 포인트

저자(Sena Evren — *"Legal architecture for AI builders and founders"*)는 AI 생성 코드 소유권을 **세 개의 독립적 법적 축**으로 분해한다.

### 축 1. 저작권 성립 — "Meaningful human authorship"
- **Thaler 판결** (DC 순회법원): *"copyright only protects work created by a human"* — 인간 저자 없이는 저작권 자체가 성립하지 않는다.
- **Zarya of the Dawn**: 저작권청이 *인간이 쓴 텍스트는 보호 / AI 생성 이미지는 거부*. 개발자에게 가장 가까운 적용 가능 선례.
- 핵심 기준어: **"meaningful human authorship"** — 그런데 Copyright Office는 이걸 *의도적으로 정량화하지 않는다*.
- 결과: **"의미 있는 수정 없이 받아들인 Claude/Cursor 출력 코드는 누구의 저작권으로도 보호되지 않을 수 있다."**

### 축 2. 고용 관계 — Work-for-hire & 계약 조항
- 근로계약의 IP 조항 *문구*가 모든 것을 결정한다:
 - **"근무 시간 중 창작"** → 좁은 범위
 - **"회사 자원 사용"** → 넓은 범위
 - **"회사 라이선스 도구 사용"** → *개인 프로젝트까지* 포함될 수 있음
- 실제 사례: 회사가 퇴근 후 개인 프로젝트의 Claude 사용까지 자기 IP라고 주장한 상황.
- 시사점: **법원 판례보다 *고용계약의 한 줄*이 먼저 결정한다**.

### 축 3. 라이선스 오염 — GPL 위험
- AI 모델이 훈련 데이터에 GPL 코드를 학습 → 출력에서 *실질적으로 재현*되면 → 개발자가 몰라도 위반 책임.
- **chardet 사건**: LGPL 코드베이스를 Claude로 재작성. AI 결과물이 "깨끗한 구현(clean room)"인지 모호 — 미해결.
- GPL의 무서운 점: 위반 시 **"내 코드도 같은 라이선스로 공개해야 한다"**.

> "'I did not know' is not a defense to a copyleft violation."

### 4가지 즉시 실무 행동
1. **라이선스 스캔**: FOSSA / Snyk / Black Duck — 출력 코드에 GPL 패턴 섞였는지 검사
2. **창작 기여 문서화**: 커밋 메시지·프롬프트 로그·ADR로 *어느 부분에 인간이 의미 있는 결정을 했는지* 남김
3. **고용계약 IP 조항 직접 확인**: 자기 계약서를 한 번 다시 읽기 (특히 "회사 라이선스 도구" 문구)
4. **AI 도구의 보상 약관 확인**: Anthropic Free/Pro vs 상용 계약의 *indemnification* 차이 인지

### 가장 위험이 구체화되는 시점
> "The place where the unsettled questions become concrete today is M&A due diligence and institutional fundraising."

평소엔 안 터지지만 **인수합병 / 투자 실사**에서 폭발한다 — 이때 "누구 코드냐"가 *조건부 합의*를 좌우한다.

## 인상 깊은 문장

> "Code that Claude Code or Cursor generated and you accepted without meaningful modification may not be copyrightable by anyone."

> "The phrase that determines whether your code is protected is 'meaningful human authorship,' and the Copyright Office has deliberately refused to quantify it."

> "'I did not know' is not a defense to a copyleft violation."

> "If neither of those applies to your situation right now, the four actions above are still worth doing, but the urgency is lower."

> "The place where the unsettled questions become concrete today is M&A due diligence and institutional fundraising."

## 내 생각 · 적용점

- **세 축이 독립 문제라는 분해가 가장 가치 있다**. 평소 "AI 코드 소유권"으로 묶여 있던 모호한 불안을 *저작권 / 고용 / 라이선스* 셋으로 쪼개면, 각각 *다른 사람이 결정권을 쥐고 있다*는 게 보인다.
- **즉시 적용 가능한 한 가지**: PR 설명·커밋 메시지에 **"AI가 만든 부분 / 내가 의미 있는 결정을 한 부분"** 을 명시하는 습관. [의도 부채 글](../engineering/2026-04-24-technical-cognitive-intent-debt.md)의 "왜를 남기는" 원칙과 정확히 같은 행동인데, 이번엔 **법적 보험**으로도 작동한다.
- **고용계약 재확인**: 한국 백엔드 환경에선 명시적 IP 조항이 강한 편이다. 회사 노트북·라이선스로 만든 사이드 프로젝트는 거의 회사 IP로 간주될 수 있음. *내 BugSip / claude-code-docs-ko / knowledge-garden* 같은 개인 프로젝트도 — 어떤 장비·도구로 만들었는지가 회색지대가 될 수 있다는 점은 다시 점검할 가치.
- **라이선스 스캔의 우선순위 격상**: 지금까지 라이선스 스캔은 "릴리스 직전 1회"였는데, AI 코드를 머지하는 PR마다 *작은 단위로* 자동 스캔이 합리적. CI에 FOSSA/Snyk를 어디까지 묶어둘지 점검 후보.
- **M&A 실사 강조가 인상적**: 평소엔 무관해 보여도 **회사가 *팔리는 순간*에 폭발**한다. 본인이 시드 단계 회사에 있다면 *지금부터* 기록을 시작해야 늦지 않는다 — 회고적으로 만들 수 없는 자산이라서.
- **Anthropic 보상 약관 정리 필요**: Free/Pro vs Enterprise/API의 indemnification 차이는 사용 중인 플랜에 따라 다르다. 회사용 Claude는 반드시 보상 조항을 *명시적으로* 확인하고 인지.
- **반론·균형점**: 저자도 인정하듯, 이 분야의 대부분은 *unsettled* 상태다. 과잉 공포는 금물 — *기록과 스캔이라는 저렴한 보험*만 들어두면 대부분 충분하다는 게 결론. M&A 같은 *고가치 이벤트*에서만 본격적으로 가시화된다.
- **연결**: [9초 사고](2026-04-27-ai-agent-deleted-production-database.md)가 *기술적 가드레일*이라면, 이 글은 *법적 가드레일*. AI 도입의 안전 인프라가 운영·법무 양쪽 모두에서 동시에 진행돼야 한다는 신호.

## 연관 자료
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](../engineering/2026-04-24-technical-cognitive-intent-debt.md) — 의도/창작 기여 *기록*은 의도 부채 백신 + 법적 보험
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](2026-04-27-ai-agent-deleted-production-database.md) — 기술적 가드레일 / 이 글 = 법적 가드레일 짝
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — *meaningful human authorship*은 사고 위임의 직접 증거
- 도구: FOSSA, Snyk, Black Duck (라이선스 스캔)

## 한 달 뒤 회고
- [ ] 고용계약 IP 조항을 다시 읽어봤는가
- [ ] 회사 / 개인 프로젝트의 라이선스 스캔이 자동화돼 있는가
- [ ] PR 설명에 *의미 있는 인간 기여* 메모 습관이 자리잡았는가
- [ ] 사용 중인 Claude 플랜의 indemnification 조항을 알고 있는가
