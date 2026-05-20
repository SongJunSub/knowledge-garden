---
title: "소프트웨어 공학의 법칙들"
source_title: "Laws of Software Engineering"
source_url: "https://lawsofsoftwareengineering.com"
source_name: "lawsofsoftwareengineering.com"
referrer_url: "https://news.hada.io/topic?id=28760"
summarized_at: "2026-04-23"
category: "engineering"
tags: ["원칙", "아키텍처", "팀", "의사결정", "레퍼런스"]
---

# 소프트웨어 공학의 법칙들

> 출처: [Laws of Software Engineering](https://lawsofsoftwareengineering.com) · 레퍼러: [GeekNews 28760](https://news.hada.io/topic?id=28760) · 정리일 2026-04-23

## 한 줄 요약
팀, 계획, 아키텍처, 품질, 의사결정 전반을 관통하는 **56가지 원칙**을 한 곳에 모아둔 엔지니어링 사고의 체크리스트.

## 핵심 포인트

### 왜 읽을 가치가 있나
- 개별 법칙들은 대부분 한 번쯤 들어본 것들이지만, **한 페이지에서 카테고리별로 훑을 수 있다**는 점이 이 사이트의 진짜 가치.
- 새로운 설계/의사결정을 앞두었을 때 **체크리스트처럼 훑으며 사각지대를 찾는 용도**로 쓰기 좋다.

### 다섯 카테고리와 대표 법칙

**1. 팀 (Teams)**
- **Conway's Law** — 조직 구조가 시스템 설계에 그대로 반영된다. 팀을 나누는 방식이 곧 아키텍처다.
- **Brooks's Law** — 지연된 프로젝트에 인력을 더 투입하면 더 늦어진다.
- **Dunbar's Number** — 약 150명이 비공식 소통의 한계. 그 위로는 구조가 필요하다.

**2. 계획 (Planning)**
- **Parkinson's Law** — 일은 주어진 시간을 채우도록 확장된다.
- **Ninety-Ninety Rule** — 처음 90%에 90% 시간이 들고, 남은 10%에 또 다른 90% 시간이 든다.
- **Premature Optimization** — 성급한 최적화는 악의 근원이다. (단, 아키텍처 수준의 결정은 예외로 봐야 한다는 반론도 있음.)

**3. 아키텍처 (Architecture)**
- **Hyrum's Law** — API 사용자가 충분히 많으면 문서화되지 않은 모든 동작에도 누군가 의존한다.
- **CAP Theorem** — 분산 시스템에서 일관성·가용성·분할 내성 중 두 개만 동시에 보장 가능.
- **Gall's Law** — 작동하는 복잡한 시스템은 예외 없이 **작동하던 단순한 시스템에서 진화**한 것이다.
- **Tesler's Law** — 모든 애플리케이션에는 제거 불가능한 고유 복잡도가 있다. 어디에 둘지 선택할 뿐.
- **Leaky Abstractions** — 모든 비자명한 추상화는 어느 지점에선가 새어나온다.

**4. 품질 (Quality)**
- **Boy Scout Rule** — 발견했을 때보다 더 나은 상태로 남겨라.
- **Broken Windows Theory** — 나쁜 설계를 방치하면 더 나빠진다.
- **DRY / KISS / YAGNI** — 단순함과 중복 제거, 필요할 때까지 만들지 않기.
- **Technical Debt** — 미래의 생산성을 담보로 잡는 것. 의도적 부채와 무지에 의한 부채를 구분해야 한다.

**5. 의사결정 (Decisions)**
- **Dunning-Kruger Effect** — 잘 모를수록 자신 있다.
- **Sunk Cost Fallacy** — 이미 쓴 비용 때문에 잘못된 길을 계속 간다.
- **Pareto Principle (80/20)** — 결과의 80%는 원인의 20%에서 나온다. 레버리지 지점을 찾는 렌즈.
- **Murphy's Law** — 잘못될 수 있는 건 결국 잘못된다. 실패를 예외가 아니라 전제로 설계하라.

## 인상 깊은 문장

> "Any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure."
> — **Conway's Law**

> "A complex system that works is invariably found to have evolved from a simple system that worked."
> — **Gall's Law**

## 내 생각 · 적용점

- **체크리스트로 쓰기**: 설계 문서나 RFC를 쓸 때 이 56개를 빠르게 훑으며 "이 원칙과 충돌하는 부분은 없는가?"를 확인하면, 의사결정의 사각지대가 줄어든다. 특히 **Hyrum / Conway / Gall**은 API와 조직 경계를 넘나드는 결정에서 거의 매번 소환된다.
- **법칙 간 긴장 인지**: 이 법칙들은 상황에 따라 서로 충돌한다 (예: YAGNI vs. 초기 아키텍처 투자, DRY vs. 성급한 추상화). 실력 차이는 **법칙을 아느냐가 아니라 언제 어떤 걸 꺼내드느냐**에서 나온다는 것을 계속 의식해야 한다.
- **실무 직결**: Conway's Law는 조직 설계 논의에서, Hyrum's Law는 공개 API 수정 시에, Gall's Law는 새 시스템을 한 번에 크게 설계하려는 유혹이 생길 때마다 떠올릴 것.
- **아쉬운 점**: 각 법칙의 출처/인용이 얕다. 심도 있는 학습을 원하면 원본 논문이나 책을 따로 찾아봐야 한다.

## 연관 자료
- 원문의 **References / Further Reading** 섹션에서 각 법칙의 원 출처로 드릴다운 가능
- 관련 도서: *The Mythical Man-Month* (Brooks), *The Pragmatic Programmer* (DRY/Boy Scout), *A Philosophy of Software Design* (Ousterhout)

## 한 달 뒤 회고
<!-- 적용해본 결과를 나중에 덧붙인다. -->
