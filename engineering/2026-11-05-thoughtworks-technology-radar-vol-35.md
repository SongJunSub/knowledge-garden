---
title: "Thoughtworks Technology Radar, Volume 35 공개 — 하네스 엔지니어링이 개별 에이전트 설정을 넘어, 조직 차원의 지속 평가 체계가 됐다"
source_title: "Technology Radar Vol. 35"
source_url: "https://www.thoughtworks.com/en-us/radar"
source_name: "Thoughtworks"
referrer_url: "https://news.hada.io/topic?id=36623"
published_at: "2026-11-04"
summarized_at: "2026-11-05"
category: "engineering"
tags: ["thoughtworks", "technology-radar", "agentic-engineering", "harness-engineering", "open-weight-models", "local-coding-models", "ai-economics"]
---

# Thoughtworks Technology Radar, Volume 35 공개

> 출처: [Technology Radar Vol. 35](https://www.thoughtworks.com/en-us/radar) (Thoughtworks) · 정리일 2026-11-05

## 한 줄 요약

**Thoughtworks가 2026년 11월 4일 Technology Radar Vol.35를 공개했다. 4대 테마는 "대규모 하네스 엔지니어링", "더 많은 에이전트를 일하게 하기", "프런티어 모델을 넘어서", "AI를 대규모로 운영하는 경제학"이며, 공개 가중치 모델과 로컬 코딩 모델의 선택지가 늘면서 작업별로 품질·비용·지연·데이터 보관 조건에 맞춰 모델을 고르는 일이 중요해졌다고 짚는다.**

## 핵심 포인트

- 4대 테마: ***하네스 엔지니어링을 대규모로(Harness engineering at scale)***, ***더 많은 에이전트를 일하게 하기(Putting more agents to work)***, ***프런티어 모델을 넘어서(Beyond frontier models)***, ***AI를 대규모로 운영하는 경제학(The economics of running AI at scale)***.
- ***LiteLLM***이 Platforms 사분면으로 옮겨가며 Trial 단계에 올랐다 — 올해만 25건 이상의 CVE가 보고된 보안 우려가 이유 중 하나로 꼽혔다.
- ***OpenCode***는 Tools 사분면에서 Adopt(도입 권장) 단계에 올랐다.
- (GN+ 요약 기준, 공식 페이지로 직접 재확인은 못함) 117개 항목을 "도입 권장/시험 사용/평가/주의"의 4단계로 분류하며, **하네스 엔지니어링**이 개별 에이전트 설정을 넘어 조직이 스킬과 가드레일을 배포하고 지속적으로 평가하는 일로 확장됐다고 설명한다.
- ***공개 가중치 모델과 로컬 코딩 모델***의 선택지가 늘면서, 작업별 품질·비용·지연·데이터 보관 조건에 맞춰 모델을 고르는 일이 중요해졌다.
- (GN+ 요약) 에이전트 세션을 병렬로 돌리거나 밤새 작업을 맡길 수 있지만, 사람의 리뷰와 배포 파이프라인이 처리할 수 있는 속도가 여전히 상한선이라는 점이 강조됐다.

## 인상 깊은 문장

> "Less than a week to go! Technology Radar Vol. 35 launches on November 4!" (Thoughtworks 공식 X 계정, 사전 공지)

## 댓글

**출처 한계**: news.hada.io 차단으로 GeekNews 원문·hada 댓글 수를 직접 확인하지 못했다. 다만 이 글은 Thoughtworks 공식 발표문이라 **WebSearch로 공식 소스를 독립 확인**할 수 있었다 — 공개일(2026-11-04), 4대 테마 명칭, LiteLLM·OpenCode의 사분면 배치는 Thoughtworks 자사 페이지·소셜 공지·팟캐스트 설명을 통해 직접 확인됐다. 다만 "117개 항목" 집계와 세부 블립(blip) 목록은 GN+ 요약에만 있고 공식 페이지에서 직접 재확인하지 못했으므로 그 부분은 미확인으로 표시했다. HN/Lobsters 큐레이션 유무는 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "하네스 엔지니어링"이 산업 표준 용어가 된 흐름의 공식 인증

이 레포에서 [[2026-06-01-harness-era-software-after-ai]], [[2026-10-20-harness-engineering-101-python-300-lines]] 등으로 계속 추적해온 "하네스 엔지니어링"이라는 개념이 이제 **Thoughtworks Technology Radar의 공식 테마**로 올라왔다는 게 이번 호의 가장 큰 의미다. 이는 개별 블로그·커뮤니티 담론이던 용어가 **업계 표준 용어로 굳어지는 순간**을 보여준다.

### 핵심 전이 2 — "사람의 리뷰·배포 파이프라인이 상한선"은 이 가든의 반복 테마와 일치

에이전트를 병렬·밤새 돌릴 수 있어도 사람의 리뷰 속도가 상한이라는 지적은 [[2026-08-31-agentic-awakening-10x-coding-org-productivity-gap]]("개인 속도 10배 향상에도 조직 생산성은 25~30%")과 정확히 같은 구조이며, 오늘 같이 정리한 [[2026-11-05-how-i-use-ai-october-2026]](Stolovitz의 "검증 병목으로 재배치")와도 같은 날 세 번째로 반복된 패턴이다 — **업계 전체가 동시에 같은 결론에 도달하고 있다**는 신호로 읽을 수 있다.

### 핵심 전이 3 — Thoughtworks/martinfowler.com 저자가 쓴 데이터 준비 글과 한 매체 안에서 연결

[[2026-09-14-preparing-data-for-agentic-ai]]는 Thoughtworks 소속 Pramod Sadalage가 martinfowler.com에 쓴 글이다 — 같은 조직이 "에이전트를 위한 데이터 준비"와 "에이전트 시대의 기술 선택 지도"를 각각 다른 매체로 내놓은 셈이며, Thoughtworks가 에이전트 시대 엔지니어링 담론을 체계적으로 선도하고 있다는 그림이 그려진다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능** — "공개 가중치 모델과 로컬 코딩 모델을 작업별 품질·비용·지연·데이터 보관 조건에 맞춰 선택"하는 원칙은 온다가 CRS에 AI 기능을 넣을 때(예: 고객 데이터 보관 요건이 민감한 B2B 도메인) 그대로 참고할 수 있다. 다만 Radar 자체는 범용 기술 지도라 CRS 도메인 특화 시사점은 제한적이다.

## 연관 자료
- [[2026-06-01-harness-era-software-after-ai]] — "하네스 엔지니어링"이라는 용어 자체의 레포 내 출발점
- [[2026-10-20-harness-engineering-101-python-300-lines]] — 하네스 엔지니어링의 실무 입문서, 같은 개념의 다른 층위
- [[2026-08-31-agentic-awakening-10x-coding-org-productivity-gap]] — "사람의 리뷰 속도가 상한선"이라는 동일 결론
- [[2026-11-05-how-i-use-ai-october-2026]] — 같은 날 정리한, 같은 결론(검증 병목)의 개인 사례
- [[2026-09-14-preparing-data-for-agentic-ai]] — 같은 조직(Thoughtworks)의 다른 매체 기고

## 한 달 뒤 회고
*(2026-12-05 즈음 — Radar Vol.35의 전체 블립 목록을 공식 PDF로 재확인했는지, 온다 개발팀이 로컬/공개가중치 모델 도입을 작업별 기준으로 검토했는지 점검.)*
