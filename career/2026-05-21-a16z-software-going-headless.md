---
title: "a16z — 소프트웨어가 헤드리스로 가는가? (SoI 명제의 정밀화: 해자의 부분적 죽음과 이동)"
source_title: "Is Software Going Headless?"
source_url: "https://a16z.com/is-software-going-headless/"
source_name: "a16z (Andreessen Horowitz) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29750"
published_at: "2026-05-21"
summarized_at: "2026-05-21"
category: "career"
tags: ["headless-software", "system-of-record", "system-of-intelligence", "agent-architecture", "moat", "a16z", "salesforce", "data-layer"]
---

# a16z — 소프트웨어가 헤드리스로 가는가? (SoI 명제의 정밀화: 해자의 부분적 죽음과 이동)

> 출처: [Is Software Going Headless?](https://a16z.com/is-software-going-headless/) · 정리일 2026-05-21

## 한 줄 요약
**a16z가 *System of Intelligence* 명제를 *해자 메커니즘 차원에서 정밀화*** — Salesforce 헤드리스 제품 출시 = *UI에는 가치 없고 데이터 계층에 가치*라는 베팅. *SaaS 시대 UI 사용 습관 해자는 죽지만 운영 로직·맥락 해자는 살아남는다*. 새 방어력이 *아래(데이터 모델·권한·워크플로·컴플라이언스)와 위(네트워크 효과·독점 데이터·실행 능력)로 분기 이동*하고, *agent-friendly System of Record*에는 *명시적 데이터 모델·에이전트 단위 권한·폐쇄 루프 실행* 3 요건 필요.

## 핵심 포인트

- **Salesforce 헤드리스 = *UI에는 가치 없다는 베팅*** — *데이터 계층*에 가치가 있다는 자기 인정. 기존 SaaS의 *UI 차별성* 전제가 흔들림.
- **해자의 부분적 죽음** — *UI 사용 습관 해자는 죽지만 운영 로직·맥락 해자는 살아남음*. SoR이 *통째로 죽지 않고 일부만 죽는* 정밀화. [[2026-05-18-system-of-record-to-system-of-intelligence-a16z]]의 *위로 이동*을 *완전 이동이 아닌 부분 이동*으로 보정.
- **방어력의 *아래·위 분기 이동*** — 새 해자가 *두 방향*으로 갈라짐:
  - **아래로**: *데이터 모델·에이전트 단위 권한·워크플로 로직·컴플라이언스*
  - **위로**: *네트워크 효과·독점 데이터·실세계 실행*
  - → 중간 (UI·기능 카탈로그·통합 마켓플레이스)이 *비어가는* 구조. [[2026-05-14-disappearance-of-the-ten-year-fund]] *중간이 사라진다* 가설의 *소프트웨어 스택 차원 시연*.
- **Agent-friendly System of Record 3 요건** —
  1. *명시적 데이터 모델 (machine-readable schema)*
  2. *에이전트 단위 권한 (per-agent permissions, audit)*
  3. *폐쇄 루프 실행 (action → state change → verifiable result)*
  → [[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals 6요소*와 짝 — Goals가 *에이전트 측 프로토콜*이고 이건 *DB 측 프로토콜*.
- **가장 유망 비즈니스 = *실세계 실행 + 다자 조정*** — *순수 데이터 저장*은 더 이상 차별점 아님. *오프라인 실행* (배송·예약 확정·결제 정산) + *다자 사이* (마켓플레이스·B2B 중개)가 *agent로 환원 불가능한 가치*.
- **DIY 접근의 3 제약** — *기술 역량 부족·구현 비용·거버넌스 복잡도*. *모든 회사가 자체 SoR을 가질 수 없다*는 *벤더 SoR의 존속 이유*. [[2026-05-21-dorsey-ai-native-organization]] *Dorsey 모델의 적용 영역 분기*와 짝 — 깊은 고객 신호 사업만 DIY 가능.
- **컴플라이언스 데이터의 단일 신뢰 소스** — 규제 산업에서 *컴플라이언스 데이터*는 여전히 *벤더 SoR이 단일 신뢰 소스*. *외주 가능한 부분*과 *외주 불가능한 부분*의 명확한 선.
- **데이터 생성 능력 = 핵심 차별점** — *사용할수록 데이터 축적 → 에이전트 성능 개선*의 복리. [[2026-05-18-eugene-yan-compounding-with-ai]] *개인 차원 5원칙*의 *기업 차원 짝*.

## 인상 깊은 문장

> "Agents kill the usage-habit moat, but not the operational-logic-and-context moat."  
> (에이전트가 사용 습관 해자는 죽이지만 운영 로직과 맥락 해자는 죽이지 않음)

> "The most interesting businesses extend into real-world execution or sit between multiple parties."  
> (가장 흥미로운 비즈니스는 실세계 실행으로 확장하거나 다자 사이에 위치하는 형태)

> "Data is in the background." (구세계 비즈니스 모델의 핵심이었으나 에이전트 시대엔 역할이 바뀜)

## 내 생각 · 적용점

### [[2026-05-18-system-of-record-to-system-of-intelligence-a16z]] *SoI 명제*의 *정밀화 사후 보강*

가든의 *a16z SoI* 자산은 *가치가 SoR → SoI로 위로 이동*한다고 박았다. **이번 글은 그 명제를 *해자 메커니즘 차원에서 3가지 정밀화***:

| 보강 1 | 보강 2 | 보강 3 |
|---|---|---|
| *SoR이 통째로 죽지 않음* — UI 해자만 죽고 운영 로직·맥락 해자는 살아남음 | *방어력이 아래·위 두 방향으로 분기* — 단순 위로 이동이 아닌 *상하 양극화* | *벤더 SoR 존속 이유 = DIY 3 제약* — 기술 역량·구현 비용·거버넌스 |

**가든의 *10칸 매트릭스 (5층 × 내부/외부)*에 *해자 차원*을 직교로 추가하지 않고, 기존 매트릭스 내부에 *해자의 양극화 메커니즘*만 박는다**. *오버 메타화 자제* — 매트릭스 25칸·40칸 확장 없이 *명제 정밀화 1건* 추가만.

### *중간이 사라진다*의 *소프트웨어 스택 차원 시연*

가든의 *중간이 사라진다 가설*은 다층:

| 차원 | 자산 |
|---|---|
| 금융 (펀드) | [[2026-05-14-disappearance-of-the-ten-year-fund]] |
| 조직 (관리자) | [[2026-05-21-dorsey-ai-native-organization]] |
| 인재 | [[2026-05-19-mediocre-data-scientist-ten-years]] *번역가의 자리*(중간이 살아남는 반례) |
| **소프트웨어 스택** | ***a16z 헤드리스*** ← 이번 글 |

→ **3개 차원에서 *중간 죽음*이 동시 관찰** (펀드·관리자·소프트웨어 스택), *1개 차원*에서 *번역가의 자리*로 *중간이 살아남음*. **균형 관찰**: *중간이 죽는 차원과 살아남는 차원의 식별*이 가든의 균형 자산.

### [[2026-05-19-openai-codex-goals-persistent-objectives]] *Goals 6요소* + *Agent-friendly SoR 3 요건* = *에이전트-DB 양측 프로토콜*

Codex Goals는 *에이전트 측에서 작업의 6요소*를 정의. a16z 헤드리스는 *DB 측에서 SoR의 3 요건*을 정의:

| 측 | 프로토콜 |
|---|---|
| 에이전트 측 | Goals 6요소 (Outcome·Verification surface·Constraints·Boundaries·Iteration policy·Blocked stop condition) |
| DB 측 | Agent-friendly SoR 3 요건 (명시적 데이터 모델·에이전트 단위 권한·폐쇄 루프 실행) |

→ **에이전트-DB 양측 프로토콜이 *짝으로 완성***. *공급자 간 하네스 수렴* + *데이터 계층 표준화*가 *같은 시기에 진행*. 가든의 *하네스 엔지니어링 라인*에 *DB 인프라 표준화*라는 *짝의 다른 한 축* 추가.

### [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] *판단력 가치 단위*와 *직교 보완*

어제 Mr Market 자산은 *주체 측면 (판단력으로 가치 이동)*. a16z 헤드리스는 *인프라 측면 (데이터·실행으로 가치 이동)*. **두 자산이 *직교 보완***:

- *주체 측 (Mr Market)*: 운영하는 사람의 판단력
- *인프라 측 (a16z 헤드리스)*: 데이터 모델·권한·실행·다자 조정

→ **2026 사업 모델 평가는 *주체 판단력 + 인프라 헤드리스 적합도*** 두 축. 단축 평가는 부분 진단이고, *두 축 동시 평가*가 정직.

### *적용 영역 분기 진단표 — 헤드리스 적합도* 추가

[[2026-05-21-dorsey-ai-native-organization]]에 박은 *적용 진단표*에 *헤드리스 적합도* 1축 추가:

| 사업 | Dorsey 모델 | Mr Market 판단력 | **헤드리스 적합도** |
|---|---|---|---|
| Block | 높음 | 높음 | **높음** — 결제·정산이 폐쇄 루프 실행 |
| 무신사 | 중간 | 중간 | **높음** — 다자 조정 (입점·물류·고객) |
| **CRS 조선호텔** | 낮음 | 중간 | ***중간*** — 객실 데이터·예약·정산은 헤드리스 가능, *현장 운영*은 폐쇄 루프 어려움 |
| **MangoLove** | 낮음 | 매우 높음 | **낮음** — 자문은 *데이터 축적 자체*가 어렵고 *실행 다자 조정* 약함 |
| **BugSip** | 높음 | 낮음 | **중간** — 학습 데이터 축적은 가능, 다자 조정 없음 |

→ **CRS의 *부분 헤드리스* 가능성** — *백오피스 SaaS (예약·정산·CRM)*은 헤드리스 SoR 후보, *현장 운영*은 사람 기반. Dorsey 부분 적용 진단과 *완전히 일치*. 두 자산이 같은 분기점을 가리킴.

### CRS / 사이드 프로젝트 적용 후보 3건

1. **CRS *백오피스 SaaS 헤드리스 적합도 점검*** — 예약·CRM·정산·매출 분석을 *agent-friendly SoR 3 요건* 잣대로 점검: *명시적 데이터 모델 yes/no*, *에이전트 단위 권한 yes/no*, *폐쇄 루프 실행 yes/no*. 3개 모두 *no*면 *벤더 SoR 다음 갱신 시 헤드리스 옵션 검토*.
2. **MangoLove *자문 데이터 축적 설계*** — 자문 보고서·진단 결과·후속 추적이 *재사용 가능한 데이터 모델*로 누적되도록 frontmatter 표준화. *판단력 = 1순위, 데이터 축적 = 2순위*로 우선순위 명시. [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] *판단 과정 1쪽*과 결합.
3. **BugSip *학습 데이터 SoR 설계*** — *코드 리딩 세션 결과*가 *에이전트가 다음 추천에 쓸 수 있는 데이터 모델*로 누적되도록 설계. *사용할수록 추천이 개선되는 복리* (Eugene Yan 5원칙의 BugSip 차원 적용).

### *오버 메타화 자기 견제 — 4 자산 연속*

지난 5일간(Wilson·Mr Market·Dorsey·이 글) *방법론·판단력·조직·인프라*가 각각 한 자산씩 도착. *각 자산마다 새 자가 진단 추가는 오버 메타화*. **이번 자산은 *새 자가 진단 추가 없음*** — *기존 매트릭스 정밀화 1건 + 기존 진단표 1축 추가*에서 멈춤. 15개 자가 진단·40칸 매트릭스·6자 짝 *추가 확장 자제*.

## 연관 자료
- [Is Software Going Headless? (a16z)](https://a16z.com/is-software-going-headless/)
- [GeekNews — 29750](https://news.hada.io/topic?id=29750)
- [[2026-05-18-system-of-record-to-system-of-intelligence-a16z]] — SoI *(직접 정밀화 사후 보강)*
- [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] — Mr Market *(주체-인프라 직교 보완)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(에이전트-DB 양측 프로토콜 짝)*
- [[2026-05-21-dorsey-ai-native-organization]] — Dorsey *(적용 진단표 헤드리스 적합도 1축 추가)*
- [[2026-05-14-disappearance-of-the-ten-year-fund]] — 중간이 사라진다 *(소프트웨어 스택 차원 시연)*
- [[2026-05-18-eugene-yan-compounding-with-ai]] — 복리 5원칙 *(데이터 생성 능력 = 기업 차원 짝)*
- [[2026-05-18-musinsa-query-engineer-harness]] — 무신사 하네스 *(에이전트 DB 직접 접근 실무)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — CRS 백오피스 SaaS의 *agent-friendly SoR 3 요건* 점검이 한 번이라도 돌았는지, MangoLove 자문 데이터 모델이 표준화되었는지, BugSip 학습 데이터 SoR 설계가 출시 첫날 박혔는지, *중간이 사라진다* 4 차원 시연이 한 차원 더 확장되었는지 기록.)*
