---
title: "만들기 전에 고려해야 할 3가지 제약"
source_title: "3 constraints before I build anything"
source_url: "https://jordanlord.co.uk/blog/3-constraints/"
source_name: "Jordan Lord's Blog"
referrer_url: "https://news.hada.io/topic?id=28954"
published_at: "2026-04"
summarized_at: "2026-04-28"
category: "engineering"
tags: ["제약", "제품설계", "원페이저", "core-tech", "디자인", "스코프관리"]
---

# 만들기 전에 고려해야 할 3가지 제약

> 출처: [Jordan Lord — 3 constraints before I build anything](https://jordanlord.co.uk/blog/3-constraints/) · 레퍼러: [GeekNews 28954](https://news.hada.io/topic?id=28954) · 정리일 2026-04-28

## 한 줄 요약
무언가 만들기 전에 **① one-pager로 압축할 수 있는가 ② 제품과 분리 가능한 코어 기술이 있는가 ③ 사용자가 계속 마주하는 단 하나의 제약을 정의했는가** — 셋 중 하나라도 실패하면 만들지 않는다.

## 핵심 포인트

저자(Jordan Lord)는 10년간 건축을 한 경험을 바탕으로, **창의성을 막는 게 아니라 활성화하는** 3가지 제약을 제시한다.

> "Constraints help us collapse the search space, and figure out innovative solutions to problems."

---

### 제약 1. One Page or it doesn't get built
**한 페이지에 못 담으면 만들지 않는다.**
- 적용 대상: 비전, 투자자 메모, 팀 공지, 제품 결정 — 모든 커뮤니케이션
- 1페이지 초과 = 너무 복잡함 / 1페이지가 비어 있음 = 아직 준비 안 됨
- 분쟁이 생기면 **"1페이지에 없으면 싸울 가치가 없다"** 가 단일 판정 규칙
- 효용: 1페이지가 모든 의사결정의 기준점(reference)이 된다

> "If you can't fill one page, don't fill the gaps with fluff, it means you're not ready to build."

### 제약 2. Core Tech Must Be Separable
**제품과 분리 가능한 핵심 기술이 있어야 한다.**
- "제품을 지원하지만, 제품 없이도 살아남을 수 있는" 자산
- 형태: 방법론·스킬·도구·라이브러리·언어 등
- 사례: **Linus의 Git**(Linux를 위해 만들었지만 Linux를 넘어섬), **HashiCorp의 HCL**, **Google의 Kubernetes**
- 의의: **장기 컴파운딩 자산** — 제품이 피벗해도 코어 기술은 살아남는다

> "Your core tech is your long term commitment. It is independent of your product's direction."

### 제약 3. One Defining Constraint Shapes Product
**사용자가 계속 마주치는 *단 하나의* 정의적 제약이 있어야 한다.**
- 사용자 경험 전반에 스며들어 제품의 "느낌(feel)"을 만든다
- 의사결정 공간을 압축해 정말 중요한 문제에 집중하게 한다
- 사례:
 - **Minecraft** = 블록 기반 구성
 - **IKEA** = 조립식 가구
 - **Notion** = 블록 (뒤에서 다룬 product primitive 논점과 연결)

> "A good constraint gives your product a feel, it permeates through all parts of the user experience."

### 통합 규칙
> "When it comes to deciding what to build, if it fails any of these constraints, then I don't build it."

세 제약 중 하나라도 통과 못하면 **빌드하지 않는다**. 거절 기준이 명확해야 시작이 빠르다.

### 커뮤니티 반응 (긱뉴스 / HN)
- **Product Primitives**: Notion의 블록, Excel의 셀처럼 "조합 가능한 깊이 있는 primitive"를 3개 이하로 유지해야 한다는 보강 의견
- **Alexandrian Centers와의 유사성**: 크리스토퍼 알렉산더의 후기 이론(*The Nature of Order*)과 비교
- **반론**: 제약이 좋아도 *"우리가 틀린 걸 만들고 있었다"* 수준의 발견을 막진 못한다 — 즉, 제약은 **방향성**을 보장하지 *진실성*을 보장하진 않는다
- **보편성**: 주방 리모델링 같은 비-소프트웨어 디자인에도 동일하게 적용 가능

## 인상 깊은 문장

> "Constraints help us collapse the search space, and figure out innovative solutions to problems."

> "If you can't fill one page, don't fill the gaps with fluff, it means you're not ready to build."

> "Your core tech is your long term commitment. It is independent of your product's direction."

> "A good constraint gives your product a feel, it permeates through all parts of the user experience."

> "When it comes to deciding what to build, if it fails any of these constraints, then I don't build it."

## 내 생각 · 적용점

- **세 제약은 사실상 "Spec / Asset / Identity"의 3-차원 점검**이다. 빌드 결정을 다음 한 문장으로 압축할 수 있다 — *"한 페이지로 적을 수 있고(Spec), 만들면서 분리 가능한 자산이 남고(Asset), 사용자에게 일관된 느낌을 주는(Identity) 일이 아니면 시작하지 않는다."* MangoLove Spec 템플릿의 수용 기준 옆에 같이 박아두기 좋은 체크리스트.
- **"1페이지에 없으면 싸울 가치가 없다"** 가 가장 즉시 쓸모 있다. 디자인 미팅에서 끝없이 도는 논쟁의 90%는 *공식 문서에 적혀 있지 않은 합의*에 대한 것. 한 페이지 안에 들어가지 못한 안건은 *그 자체로 이미 경고 신호*.
- **Core Tech 분리 가능성**은 사이드 프로젝트(BugSip 등)와 회사 제품 양쪽에 적용된다. 제품 단위가 아니라 **남는 자산** 단위로 시간을 쓰면 같은 작업이 복리로 쌓인다. *내가 BugSip을 만들면서 만들어지는 코어 자산은 무엇인가?* 를 한 줄로 답할 수 있어야 한다.
- **Defining Constraint = 제품 정체성**: 어제 정리한 [Koshy John의 글](../ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md)의 "사용 *방식*" 분리와 같은 결. 좋은 제품은 무엇을 하는지보다 *무엇을 거부하는지*가 분명하다.
- **YAGNI / 성공 기준 내면화 / Defining Constraint가 한 가족**: [Lynagh의 글](2026-04-27-overthinking-scope-creep-structural-diffs.md)이 "성공 기준 내면화"를 강조했고, 이 글은 그 기준을 만드는 *형식*(1페이지·코어 기술·정의 제약)을 제시한다. 두 글을 묶어서 *"무엇이 끝인지를 정의하는 형식"* 모음을 만들어볼 만하다.
- **반론 메모**: 댓글의 지적처럼 제약은 *방향*을 압축하지 *진실성*은 보장하지 않는다. 1페이지에 잘 적힌 잘못된 비전도 그럴듯하게 보인다. **"이게 맞는 문제인가?"는 별도 질문**으로 따로 검증해야 한다 (사용자 인터뷰·시장 신호 등).
- **즉시 적용 후보**: 다음 BugSip 마일스톤 또는 사이드 프로젝트 시작 시 README의 첫 1페이지에 (1) 한 줄 비전 (2) 코어 자산 (3) 정의 제약 — 세 항목을 강제로 쓰게 한다.

## 연관 자료
- [`engineering/2026-04-27-overthinking-scope-creep-structural-diffs.md`](2026-04-27-overthinking-scope-creep-structural-diffs.md) — 성공 기준 내면화의 *형식*을 이 글이 채운다
- [`engineering/2026-04-23-laws-of-software-engineering.md`](2026-04-23-laws-of-software-engineering.md) — YAGNI / KISS / Gall's Law와 직접 통한다
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](2026-04-24-technical-cognitive-intent-debt.md) — 1페이저는 의도 부채에 대한 가장 단순한 백신
- [`ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md`](../ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — 제품도 *무엇을 안 하는지*가 정체성

## 한 달 뒤 회고
<!-- BugSip / 사이드 프로젝트 시작 시 README 첫 1페이지에 3-제약을 강제 적용해본 결과를 나중에 덧붙인다. -->
