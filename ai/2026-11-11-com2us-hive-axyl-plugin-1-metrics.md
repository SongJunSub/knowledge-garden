---
title: "[게임빌컴투스플랫폼] 자연어로 게임 지표를 조회하고 변화 확인하기: Hive Axyl Plugin 활용 1편 — 맥락을 기억하는 질의가 분석의 진입장벽을 낮춘다"
source_title: "자연어로 게임 지표를 조회하고 변화 확인하기: Hive Axyl Plugin 활용 1편"
source_url: "https://on.com2us.com/tech/hive-axyl-plugin-kpi-analysis/"
source_name: "Com2uS ON (Tech)"
referrer_url: "https://on.com2us.com/tech/hive-axyl-plugin-kpi-analysis/"
published_at: "2026-11"
summarized_at: "2026-11-11"
category: "ai"
tags: ["hive", "com2us", "natural-language-query", "kpi", "chatgpt-plugin", "game-analytics"]
---

# 자연어로 게임 지표를 조회하고 변화 확인하기: Hive Axyl Plugin 활용 1편(게임빌컴투스플랫폼)

> 출처: [자연어로 게임 지표를 조회하고 변화 확인하기](https://on.com2us.com/tech/hive-axyl-plugin-kpi-analysis/) (Com2uS ON Tech) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-11
>
> **출처 한계**: `on.com2us.com` 전면 차단. WebSearch로 Hive Axyl(컴투스플랫폼의 AI 게임 분석 플러그인)의 존재와 "자연어로 요청하면 AI가 조회·연동한다"는 일반적 방식은 교차확인했지만, "자연어 지표 조회, 맥락 유지" 기능 자체를 원문 보도에서 특정하지는 못했다.

## 한 줄 요약

**ChatGPT에 Hive Axyl Plugin을 설치하면, 이전 질문의 맥락(국가, 마켓, 상품 등 조건)이 유지된 채로 자연어 대화만으로 게임 KPI 분석 범위를 단계적으로 좁혀갈 수 있다. 매번 조건을 다시 입력하지 않아도 된다는 점이 핵심이다.**

## 핵심 포인트

- **ChatGPT 플러그인 설치로 시작**: "ChatGPT에 Hive Axyl Plugin을 설치하여 자연어로 게임 지표를 조회하고 분석 범위를 단계적으로 확장." 별도 대시보드 UI 없이 ChatGPT 대화창이 곧 분석 인터페이스가 된다.
- **대화 맥락 유지가 핵심 차별점**: "이전 질문의 맥락이 유지되어 국가, 마켓, 상품 등 상세 조건을 매번 다시 설정할 필요가 없음." 전통적 BI 대시보드는 필터를 매번 새로 거는 반면, 대화형 질의는 "그중에서 한국만" 같은 후속 질문이 자연스럽게 이어진다.
- **조직 내 권한 설정으로 데이터 접근 범위 제어**: "조직 내 프로젝트 권한을 설정하여 데이터 접근 범위를 제어하고 효율적인 KPI 변화 분석 가능." 누구나 모든 게임, 프로젝트 데이터를 볼 수 있는 게 아니라, 프로젝트 단위 권한이 자연어 질의에도 그대로 적용된다는 뜻.

## 인상 깊은 문장

*(Slack 발췌가 불릿 세 개로 축약되어, 완결된 인용문은 남아 있지 않다.)*

## 댓글

GeekNews를 거치지 않은 기술 블로그 직링크라 hada 댓글은 없다. **이해관계**: 자사 제품(Hive Axyl) 소개 글이므로, 실사용 난점(오탐 조회, 권한 설정의 번거로움 등)은 다뤄지지 않았을 가능성이 높다.

## 내 생각 · 적용점

### 핵심 전이 — 대화형 BI는 이 가든에서 이미 "구조화 강제"와 "자유 질의" 두 진영으로 나뉘어 있었다

[[2026-11-05-sutura-metric-query-engine-for-ai-agents]]는 "에이전트가 자유 SQL을 쓰면 지표가 흔들리니, 미리 정의된 지표 정의로만 조회하게 강제해야 한다"는 입장이었다. 이번 Hive Axyl 1편은 그 반대처럼 보인다. 자연어로 자유롭게 조회 범위를 좁혀간다. 다만 "조직 내 프로젝트 권한으로 접근 범위를 제어"한다는 세 번째 포인트를 보면, Hive Axyl도 완전 자유 질의가 아니라 **권한이라는 틀 안에서의 자유**다. [[2026-10-02-line-a2a-conversational-bi]](대화형 BI)와도 같은 계열이며, [[2026-08-20-hive-common-metric-standard]]가 이미 다진 "Hive의 지표 정의 표준화" 기반 위에서 자연어 질의가 돌아간다고 추정하면, sutura식 "지표 고정"과 Hive Axyl식 "자유 대화"가 실은 **지표는 고정, 조회 경로만 자유화**하는 같은 설계일 가능성이 높다.

### Claude 사용자 관점의 적용점

Claude(또는 MCP 연동)로 사내 지표를 조회할 때, 매 질문마다 조건을 다시 명시하지 않고 대화 맥락으로 필터를 누적시키는 패턴은 그대로 가져다 쓸 수 있는 UX 아이디어다. 다만 이 편의성이 권한 설정이라는 안전장치 없이는 위험할 수 있다는 점도 함께 기억해둘 만하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 온다 CRS에서도 "이번 달 A호텔 ADR 어때?" 다음에 "그중 주말만" 같은 대화형 질의로 맥락을 유지하며 지표를 좁혀가는 인터페이스를 설계할 수 있다. 다만 지표 정의 표준화([[2026-08-20-hive-common-metric-standard]] 계열 작업)가 먼저 돼 있어야 자연어 질의가 엉뚱한 집계를 내놓지 않는다는 전제가 붙는다.

## 연관 자료

- [[2026-11-11-com2us-hive-axyl-plugin-2-dashboard]] — 같은 Hive Axyl Plugin의 2편(차트, 대시보드 구성), 짝 글
- [[2026-11-05-sutura-metric-query-engine-for-ai-agents]] — 자유 질의 대신 지표 정의 고정을 주장한 반대 축 사례
- [[2026-08-20-hive-common-metric-standard]] — 같은 Hive 플랫폼의 지표 정의 표준화 선행 작업
- [[2026-10-02-line-a2a-conversational-bi]] — 대화형 BI 설계의 다른 사례

## 한 달 뒤 회고

*(2026-12-11 즈음 — on.com2us.com 접근이 풀리면 "맥락 유지"가 실제로 몇 턴까지 유지되는지, 권한 설정이 질의 결과를 어떻게 필터링하는지 원문으로 확인.)*
