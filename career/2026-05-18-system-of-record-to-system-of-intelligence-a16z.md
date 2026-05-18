---
title: "System of Record → System of Intelligence — 가든의 *5층 추상화*에 *내부/외부 차원*을 더하는 a16z 가설"
source_title: "From System of Record to System of Intelligence: The AI Reasoning Layer on Top of CRM"
source_url: "https://a16z.com/system-of-intelligence-crm"
source_name: "Andreessen Horowitz (a16z) 블로그"
referrer_url: "https://news.hada.io/topic?id=29604"
published_at: "2026-05-18"
summarized_at: "2026-05-18"
category: "career"
tags: ["a16z", "system-of-intelligence", "crm", "salesforce", "ai-agents", "enterprise-saas", "value-shift", "orchestration", "market-structure"]
---

# System of Record → System of Intelligence — 가든의 *5층 추상화*에 *내부/외부 차원*을 더하는 a16z 가설

> 출처: [From System of Record to System of Intelligence — a16z](https://a16z.com/) · GeekNews 경유 [news.hada.io/topic?id=29604](https://news.hada.io/topic?id=29604) · 정리일 2026-05-18

## 🔖 한 줄 요약
a16z의 시장 가설 — 엔터프라이즈 소프트웨어의 *가치 자리*가 *데이터 저장소 CRM(System of Record)*에서 *AI 추론 계층(System of Intelligence)*으로 *위로 이동* 중. *Facebook 친구 네트워크 → 뉴스피드 알고리즘 입력*이라는 정확한 역사적 유추로 *Salesforce·HubSpot도 새 추론 계층의 *데이터 소스 중 하나*로 변환*된다는 명제. **가든의 [Luca Valli *플랫폼 품질 = AI 가치 배수*](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md)가 *엔터프라이즈 SaaS 시장 차원*에서 어떻게 보이는가의 답**.

## 🧩 핵심 포인트

- **System of Record → System of Intelligence의 *3가지 이동 축***.
  - **가치 자리 이동**: 데이터 *저장*에서 데이터 *추론*으로. *Salesforce는 여전히 데이터를 소유*하지만 *가치 창출은 그 위 추론 계층*에서.
  - **전환 비용 원천 이동**: *데이터 축적*에서 *오케스트레이션(다중 시스템 통합)*으로. CRM 데이터를 *옮기는 비용*보다 *통합된 워크플로를 재구성하는 비용*이 더 큰 시대.
  - **GTM 지출 구성 이동**: *기존 5~10%*에 머물던 *소프트웨어 비중*이 확대되며 *전체 시장 규모 자체가 성장*. 새 카테고리에 *기존 SaaS가 잠식되지 않고 *추가 지출*로 들어옴.
- **AI 에이전트의 *영업 업무 확장 범위***. 리서치·통화 코칭·자동 기록 — *영업 사원의 시간*을 *직접* 흡수하는 영역. *제도적 지식 보존·실시간 우선순위 판단·신입 직원 역량 제고* 등 ***조직의 노하우를 *모델 차원*에 *외화*하는** 새 자리.
- ***Facebook 친구 네트워크 → 뉴스피드*** 라는 역사적 유추의 정확성. *입력 데이터의 형태가 가치 단위가 아니다*. *그 위*에 *추론·정렬·제공*하는 계층이 *진짜 가치 단위*. CRM에 같은 변환이 진행 중 — *데이터*는 입력이 되고, *추론*이 가치가 됨. **30년 SaaS 산업의 *가장 큰 가치 이동* 중 하나일 수 있음**.
- **이 변화의 *시점적 위협*** — 기존 CRM 카테고리가 *부가 기능 버킷으로 강등될 위험*. [OnlyCFO 2026 Procurement](2026-05-14-2026-procurement-playbook-onlycfo.md)의 *4 버킷 양극화*가 *AI 추론 계층 등장에 의해 강제 재분류*되는 정확한 메커니즘.
- **가치는 *위로 가는데 데이터는 아래에 남는다*** — *Salesforce·HubSpot가 죽지 않는다는* 미묘함. 데이터 소유는 그대로이지만 *마진과 차별점*이 *위 계층*으로 흡수. CRM 회사들이 *스스로 System of Intelligence가 되려*는 시도와 *AI 네이티브 신생 기업*의 시도가 *경합*. **[Ries Cloudflare 신뢰 자산](2026-05-14-eric-ries-incorruptible-mission-protection.md)이 *결정 인자*** — *AI 추론 계층의 신뢰 자산*을 *누가 먼저 쌓는가*.

## 📜 인상 깊은 문장

> Facebook의 친구 네트워크가 *뉴스피드 알고리즘의 입력*이 된 것처럼, CRM도 *지능 시스템의 여러 정보원 중 하나*로 변환된다.

> 전환 비용의 원천이 *데이터 축적*에서 *오케스트레이션*으로 이동했다.

> Salesforce·HubSpot은 여전히 데이터를 소유하나, *가치 창출은 상위 추론 계층*에서 발생한다.

## 💭 내 생각 · 적용점

**가든의 *5층 추상화*에 *내부/외부 차원*을 더한다 — 10칸 매트릭스 발견.**
어제 [Luca Valli 플랫폼 엔지니어링](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md)에서 박은 5층:
- *Model → Harness → Platform → Organization → Governance*

이번 글이 *각 층에 *내부(in-house) vs 외부(market)* 두 변형*이 있음을 드러낸다:

| 층 | 내부(In-house) | 외부(Market = SaaS 카테고리) |
|---|---|---|
| **Model** | 자체 LLM 학습 (대기업만) | LLM API 구매 (Claude·OpenAI·로컬) |
| **Harness** | [무신사 query-engineer](../ai/2026-05-18-musinsa-query-engineer-harness.md) 내부 자산 | LangChain·LlamaIndex 프레임워크 |
| **Platform** | 회사 자체 IDP (Backstage 자체 구축) | Vercel·Heroku·Backstage as a Service |
| **Organization** | Conway's Law 자체 적용 | **System of Intelligence — *이번 글*** |
| **Governance** | LTBT·Industrial Foundation 자체 설계 | PBC 인증·B Corp 등 외부 표준 |

**이번 글의 결정적 위치 — *Organization 층의 *외부(시장) 변형* 정의***. 회사의 *조직적 노하우*가 *외부에 SaaS 카테고리로 외화*되는 자리. *영업 사원의 시간·노하우·우선순위 판단*이 *조직 안*에 갇혀 있던 시대에서, *그것이 *제품 카테고리*가 되는 시대*로의 이동.

**[GN#358 우선순위 1순위 #29486 *AI 다음 해자 = 조직*]의 *시장 측 답***.
어제 *#29486*을 *플랫폼이 *조직의 차별점*이 되는 메커니즘*으로 1순위 후보로 박았다. 이번 글이 *그 차별점이 *어떻게 시장 카테고리로 외화*되는지*의 답. **조직의 노하우가 *내부에 머무르는 시대*에서 *외부 SaaS 카테고리로 *수출*되는 시대*로 이동**. 이게 *AI 시대 가치 자리의 *시장적 형태***.

**[OnlyCFO 2026 Procurement](2026-05-14-2026-procurement-playbook-onlycfo.md)의 *강제 재분류 메커니즘***.
OnlyCFO는 *4 버킷 양극화* (매출 증대 / 미션 크리티컬 / 효율성 / 부가 기능)를 진단했다. 이번 글이 *그 재분류가 어떻게 일어나는가*의 정확한 답 — *System of Intelligence가 새 카테고리로 등장*하면서 *기존 CRM이 *부가 기능 버킷으로 강등 위험***. **[Bartlett 10년 펀드의 소멸](2026-05-14-disappearance-of-the-ten-year-fund.md)의 *상위 1% 집중*이 *AI 추론 계층 카테고리에 *재집중**되는 정확한 메커니즘 — *중간이 사라지는* 것의 다음 라운드.

**[Ptacek Emacsification](../ai/2026-05-14-emacsification-of-software-ptacek.md)의 *기업 차원 짝***.
Ptacek은 *1인 빌더 30분 앱*에서 *개인 차원의 System of Intelligence*를 본다. a16z는 *기업 차원의 System of Intelligence*를 본다. **두 글이 *같은 가치 이동의 *개인 vs 기업* 짝***. 어떤 기능이 *내부 도구*로 만들어지면 [Ptacek], *SaaS 카테고리*로 만들어지면 [a16z]. 분기점: *오케스트레이션 비용*과 *신뢰 자산*이 *기업 차원에서만 정당화*되는가, 그렇지 않은가.

**[Anthropic Code w/ Claude Managed Agents](../ai/2026-05-14-code-with-claude-recap-19-sessions.md)의 *시장 카테고리 정체*.**
Anthropic의 *Managed Agents*는 *Anthropic이 직접 System of Intelligence에 진입*하는 시도. *모델 회사가 시장 카테고리로 위 계층까지 흡수*하려는 움직임. **이게 *모델 회사의 가치 자리 방어 전략*** — Salesforce가 *데이터 → 추론*으로 가치를 빼앗기듯, Anthropic도 *모델 → System of Intelligence*로 가치 자리를 직접 차지하려 함. 가든의 *6/15 월간 크레딧 정책 변경*도 *이 흐름의 일부* — *대화형 사용은 유지*하면서 *비대화형 자동화에 별도 과금*은 *System of Intelligence 카테고리의 가격 분리*.

**MangoLove·CRS·BugSip 적용 후보 — *시장 카테고리 차원***.
- **MangoLove의 *System of Intelligence 진입 가능성 진단 도구***. 클라이언트가 *기존 SaaS 위에 추론 계층*을 *얹을 수 있는가*를 진단. *데이터 보유 + 워크플로 표준화 + 도메인 지식*이 *3가지 필요 조건*. 충족되면 *내부 자동화에서 시작 → SaaS 카테고리로 외화* 경로가 열림.
- **CRS의 *System of Intelligence 자가 진단***. 호텔 예약·결제 데이터를 *위 추론 계층*에서 어떻게 쓸 수 있는가? *동적 가격·고객 행동 예측·자동 운영 보고서*가 후보. **이미 CRS가 가진 데이터가 *System of Intelligence의 입력*이 될 수 있는가**가 6월 중순 점검 항목.
- **BugSip의 *System of Intelligence 포지셔닝***. *코드 리딩 데이터*(어떤 코드를 누가 얼마나 깊이 읽었는가)가 *조직의 *코드 학습 추론 계층*에 입력이 될 수 있다. 학습 과정 자체가 *제도적 지식*. 무신사 [a16z 인용처럼 *제도적 지식 보존*]이 BugSip의 *기업판 가치 제안* 가능. **개인용 = Ptacek 변형, 기업용 = a16z 변형** 두 갈래로 BugSip을 *처음부터 설계*할 수 있는가?
- ***Anthropic 6/15 정책 변경*에 대한 *내 답의 v3***. 5월 15일 사용자 질문에 *가격만* 답했고(v1), 어제 [무신사 query-engineer]를 거쳐 *교차 사용*까지 갔다(v2). 이번 글의 답: **(v3) *비대화형 자동화 가격 분리는 *System of Intelligence 카테고리의 가격 분리 신호***. Anthropic이 *대화형은 일반화, 비대화형은 *System of Intelligence 가격*으로 분기*하는 중. *코덱스로 옮길까* 질문은 *어떤 카테고리에서 운영하느냐*에 따라 답이 다르다 — *대화형 인터랙티브 사용*은 옮길 필요 없고, *내부 System of Intelligence 자동화*는 *공급자 다중화 + 로컬 모델 보조* 가 더 정확한 답.

**가든 자체에 대한 자가 적용 — *내부/외부 차원의 자가 인식***.
가든은 *내부 자산* — *나의 머릿속 이론*을 *글 형태로 외화*한 것. 그러나 *공개 리포지토리*이기에 *외부에서 접근 가능*. **가든이 *System of Intelligence의 어느 자리*에 있는가?** 솔직한 답:
- *나의 *개인 추론 계층* — 글을 정리하면서 내 가설이 *추론으로 강화*됨
- *외부 사용자에게는 *내가 어떤 가설을 가지고 있는가*의 *데이터 소스*가 될 수 있음
- **즉 가든은 *나에게는 System of Intelligence, 외부에게는 System of Record* 의 *이중 역할***

*외부 사용자가 가든을 자신의 추론 계층에 *입력*으로 쓸 수 있게* 하려면, *frontmatter 구조화*와 *연결성*이 그 자체로 가치. 이게 가든의 *얇은 CLAUDE.md / 메타데이터 레지스트리* 자가 진단 결과와 *동일한 처방*으로 모인다.

## 🔗 연관 자료
- [Luca Valli — 플랫폼 엔지니어링 End-to-End](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md) — *내부 플랫폼 가치 배수*의 *시장 차원 짝*
- [무신사 query-engineer](../ai/2026-05-18-musinsa-query-engineer-harness.md) — *내부 하네스 자산*이 *외부 카테고리로 외화*되기 직전의 사례
- [GN#358 #29486 *AI 다음 해자 = 조직*](../weekly/2026-W20-geeknews-358.md) — *조직 해자의 *시장 측 답***
- [OnlyCFO 2026 Procurement](2026-05-14-2026-procurement-playbook-onlycfo.md) — *4 버킷 양극화*가 *System of Intelligence 등장에 의해 강제 재분류*
- [Bartlett & Ramella — 10년 펀드의 소멸](2026-05-14-disappearance-of-the-ten-year-fund.md) — *상위 1% 집중*이 *AI 추론 계층에 재집중*되는 다음 라운드
- [Ptacek — Emacsification](../ai/2026-05-14-emacsification-of-software-ptacek.md) — *System of Intelligence의 개인 차원 짝*
- [Code w/ Claude SF — Managed Agents](../ai/2026-05-14-code-with-claude-recap-19-sessions.md) — *Anthropic 자신이 System of Intelligence에 직접 진입*
- [Claude 월간 크레딧 정책](../ai/2026-05-14-claude-programmatic-monthly-credits.md) — *비대화형 자동화 가격 분리*가 *System of Intelligence 카테고리의 가격 분리 신호*
- [Eric Ries — Incorruptible Cloudflare](2026-05-14-eric-ries-incorruptible-mission-protection.md) — *AI 추론 계층 신뢰 자산*의 결정 인자

## 📝 한 달 뒤 회고
<!-- 6월 중순:
- 가든의 *5층 × 2(내부/외부) = 10칸 매트릭스* 가 *실제로* 다른 글 정리·자문·의사결정에 *쓰였는가*?
- MangoLove에 *System of Intelligence 진입 가능성 진단 도구*가 들어갔는가?
- CRS의 *호텔 데이터 → 추론 계층 후보* 점검을 *실제로* 수행했는가?
- BugSip 기획에 *개인용(Ptacek) vs 기업용(a16z) 두 갈래 설계 결정*이 박혔는가?
- *Anthropic 6/15 정책에 대한 답 v3*가 사용자 또는 자문 클라이언트와의 *실제 대화*에 *인용*되었는가?
- 가든 자체의 *이중 역할(내부 System of Intelligence + 외부 System of Record)* 인식이 *frontmatter 또는 README* 에 *명시적*으로 박혔는가?
-->
