---
title: "기업용 AI가 마침내 SaaS의 약속을 실현하고 있다 (Emily Man) — 실행 기록에 전문가 평가와 사업 성과를 연결해야 다음 판단이 개선된다"
source_title: "Enterprise AI is finally delivering on the promise SaaS made"
source_url: "https://www.primary.vc/articles/enterprise-ai-is-finally-delivering-on-the-promise-saas-made"
source_name: "Primary Venture Partners (Emily Man), GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=34394"
published_at: "확인 불가 (2026-09 추정)"
summarized_at: "2026-09-28"
category: "ai"
tags: ["enterprise-ai", "saas", "agent-evaluation", "execution-traces", "expert-grading", "vertical-ai", "vc-thesis"]
---

# 기업용 AI가 마침내 SaaS의 약속을 실현하고 있다 (Emily Man)

> 출처: [Enterprise AI is finally delivering on the promise SaaS made](https://www.primary.vc/articles/enterprise-ai-is-finally-delivering-on-the-promise-saas-made) (Emily Man, Primary Venture Partners) · GeekNews(id=34394) 경유 · 정리일 2026-09-28
>
> **출처 한계**: `news.hada.io`와 `primary.vc`(원문), `emilyman.substack.com`(저자 개인 크로스포스트) 모두 이번 세션 egress 차단으로 원문을 직접 열지 못했다. WebSearch가 반환한 검색 스니펫(원문 문장 일부 포함)과 저자 프로필(Primary Venture Partners 소속 투자자)로 재구성했다. 정확한 게시일, hada 댓글 수, HN/Lobsters 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**SaaS는 25년간 업무 전문성을 제품에 담겠다고 약속했지만 실제로는 그 전문성을 컨설턴트와 구축(implementation) 담당자에게 떠넘겨왔다 — 기업용 AI는 에이전트의 실행 기록(무엇을 봤고 어떤 도구를 썼고 결과가 무엇이었는지)에 전문가 평가와 실제 사업 성과를 연결함으로써, 처음으로 그 간극을 제품 자체 안에서 메울 수 있다.**

## 핵심 포인트

- **SaaS의 약속과 실제 구현의 간극** — ***"SaaS는 25년간 전문성에 대한 접근을 팔았지만, 그 전문성을 제품 자체에 담아낸 적은 거의 없다"***는 것이 이 글의 출발점. 실제로는 컨설턴트나 구축 담당자가 그 간극을 메워왔다.
- **사내 문서 제공만으로는 부족하다** — 회사의 모든 문서를 AI에 넘겨주는 것만으로는 부족하며, ***어떤 판단이 실제로 효과가 있었는지***를 알아야 한다는 게 저자의 핵심 구분 — 정보 접근과 판단력은 다른 문제라는 것.
- **에이전트 평가의 세 층위** — 저자가 제시하는 프레임워크는 ① **실행 기록(execution traces)**: 에이전트가 무엇을 봤고 어떤 단계·도구를 거쳐 어떤 산출물을 냈는지, 사람이 수정·재시도한 내역까지 포함 ② **전문가 평가(expert grading)**: 내부 전문가가 그 판단에서 무엇이 중요했고 무엇을 놓쳤는지, 예외 처리가 타당했는지 채점 ③ **사업 성과(business outcomes)**: 그 판단 이후 실제로 무슨 일이 일어났고, 결과적으로 옳은 판단이었는지 — 이 셋을 연결해야 다음 판단이 개선된다.
- **한 고객의 예외가 전체 제품을 개선한다** — 한 고객의 예외 상황을 해결하며 얻은 지식을 다른 고객에게도 적용하면 제품과 구축 과정이 함께 개선되는 선순환이 만들어진다는 게 저자의 주장.
- **원본 데이터 공유 없이도 노하우는 축적된다** — 고객사의 원본 데이터 자체를 공유하지 않아도, 업무 절차와 예외 처리 노하우(즉 "판단 패턴")는 벤더 쪽에 축적될 수 있다는 것이 이 모델의 핵심 전제.

## 인상 깊은 문장

> "SaaS spent 25 years selling access to expertise but rarely embedded that expertise in the product itself."
> (WebSearch로 확인한 원문 발췌 — 전체 문맥은 원문 미확보.)

## 댓글

**확인 불가.** hada 댓글 수, HN/Lobsters 큐레이션 여부 모두 원문 차단으로 확인하지 못했다. **저자 이해관계를 분명히 밝혀야 한다** — Emily Man은 Primary Venture Partners의 투자자로, 기업용 AI 스타트업에 투자하는 입장에서 이 글을 썼다. "기업용 AI가 SaaS의 약속을 실현한다"는 낙관적 프레임은 투자 대상 카테고리 자체를 정당화하는 VC 특유의 담론일 가능성이 크다 — [[2026-06-08-saaspocalypse-vertical-ai]] 노트에서 이미 짚었듯 VC의 bull case는 명제(실행 기록·전문가 평가·사업 성과 연결이라는 구조)는 취하되 낙관의 크기는 거리를 두고 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 — "에이전트가 늘어나면 결국 평가·거버넌스 계층 문제가 된다"는 패턴과 같은 계보

[[2026-09-24-stripe-kai-internal-ai-platform]]에서 Stripe의 Kai가 4,000개 이상 중복 마이크로 에이전트를 공용 API·부서별 거버넌스(AgentStudio)·공유 실행 환경 3층으로 정리한 사례를 다뤘는데, 이 글의 "실행 기록 + 전문가 평가 + 사업 성과" 프레임은 바로 그 거버넌스 계층이 구체적으로 무엇을 측정해야 하는지에 대한 답으로 읽힌다. Kai가 "어떻게 조직할 것인가"의 답이라면, 이 글은 "무엇을 기준으로 그 조직을 개선할 것인가"의 답이다 — 같은 문제를 다른 층위에서 다룬 짝으로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**CRS가 가진 예약·요금·재고 데이터가 바로 이 글이 말하는 "업무 노하우가 쌓이는 자리"다.** 온다가 AI 기능(요금 최적화, 초과예약 처리, 고객 문의 응대 등)을 구축할 때, 단순히 "어떤 답을 냈는지"만 기록하지 말고 이 글의 3층 프레임을 그대로 적용할 수 있다 — 에이전트가 어떤 근거로 판단했는지(실행 기록), 실제 운영자가 그 판단을 어떻게 평가했는지(전문가 평가), 그 판단이 실제 매출·고객 만족에 어떤 영향을 미쳤는지(사업 성과)를 연결해야 다음 판단이 나아진다. 한 호텔에서 해결한 예외 처리 노하우(예: 특정 채널의 초과예약 패턴)를 원본 예약 데이터 공유 없이 다른 호텔 고객에게도 적용 가능한 "패턴"으로 축적하는 것이 이 글의 가장 직접적으로 전이 가능한 원칙이다.

## 연관 자료

- [[2026-09-24-stripe-kai-internal-ai-platform]] — 같은 "에이전트 늘어남 → 거버넌스 계층 필요"의 조직 구조 답, 이 글은 그 계층이 측정해야 할 기준을 제시
- [[2026-06-08-saaspocalypse-vertical-ai]] — SaaS 종말론에 대한 또 다른 VC bull case, "독점 데이터·도메인 맥락이 진짜 해자"라는 결론이 이 글의 "노하우 축적" 논지와 공명

## 한 달 뒤 회고

*(2026-10-28 즈음 — `primary.vc`·`emilyman.substack.com` 원문에 직접 접근해 "83%" 류의 구체적 수치나 실제 고객 사례가 언급됐는지, HN 등에서 이 프레임에 대한 비판적 반응이 있었는지 확인.)*
