---
title: "아마존 메커니컬 터크 영구 종료, 2026-09-30 (Amazon) — '가짜 인공지능'이라 불리던 크라우드워크 플랫폼이, 진짜 AI와 AI를 쓰는 워커 양쪽에 밀려 21년 만에 문을 닫는다"
source_title: "Amazon service Bezos once called 'artificial artificial intelligence' is shutting down"
source_url: "https://www.cnbc.com/2026/08/25/amazon-service-that-jeff-bezos-called-artificial-ai-is-shutting-down.html"
source_name: "CNBC"
referrer_url: "https://news.hada.io/topic?id=32944"
published_at: "2026-08-25"
summarized_at: "2026-08-28"
category: "career"
tags: ["mechanical-turk", "amazon", "gig-work", "crowdwork", "data-labeling", "ai-displacement", "labor-market", "human-in-the-loop"]
---

# 아마존 메커니컬 터크, 21년 만에 영구 종료

> 출처: [Amazon service Bezos once called "artificial artificial intelligence" is shutting down](https://www.cnbc.com/2026/08/25/amazon-service-that-jeff-bezos-called-artificial-ai-is-shutting-down.html) (CNBC, 2026-08-25 · GeekNews 경유, id=32944) · 정리일 2026-08-28
>
> **출처 한계(중요)**: 이 세션에서는 `news.hada.io`(GeekNews 토픽 페이지 자체)뿐 아니라, 조사 과정에서 시도한 사실상 모든 외부 도메인 — CNBC, TechTimes, TechStartups, Yahoo Finance, qz.com, ibtimes.sg, mturk.com/help, docs.aws.amazon.com, en.wikipedia.org, news.ycombinator.com까지 — 이 네트워크 egress 정책으로 WebFetch가 전부 차단됐다. 그래서 이 노트는 원문 페이지를 직접 열어 읽은 게 아니라, **WebSearch가 여러 매체를 종합해 돌려준 스니펫**에 근거해 재구성했다. 종료일(9/30)·승인기한(10/30)·자동승인·7/30 신규가입 중단 같은 핵심 사실은 CNBC·TechTimes·TechStartups·ibtimes.sg·Programming Helper Tech 등 복수 매체에서 일관되게 확인돼 신뢰도가 높지만, **hada 댓글 수·논지는 전혀 확인하지 못했고**, HN에 관련 스레드(`id=49457545`, "Mechanical Turk shutting down September 30")가 있다는 사실만 확인했을 뿐 포인트·댓글 수·개별 댓글 내용은 검증하지 못했다.

## 한 줄 요약

**아마존이 2005년부터 운영해 온 인간 크라우드워크 중개 서비스 Mechanical Turk(MTurk)를 2026년 9월 30일부로 영구 종료한다.** HIT(사람이 판단해야 하는 소단위 작업) 제출은 9/30 마감, 요청자는 10/30까지 승인·거절해야 하며 ***미처리 시 자동승인***된다. 이미 7/30부터 신규 요청자·워커 가입은 막힌 상태였다. 아마존의 공식 사유는 "프로그램·서비스에 대한 내부 검토 결과"라는 원론적 문구뿐이지만, 복수 매체는 ***AI 모델의 발전이 사람이 하던 단순 판단 업무 상당수를 잠식했고, Scale AI·Mercor·Prolific 같은 AI 학습 데이터 전문 플랫폼이 워커와 수요 양쪽을 흡수했다***는 정황을 짚는다. 여기에 2023년 학계 연구가 밝힌 ***"MTurk 워커의 최대 46%가 작업 수행에 AI를 사용했다"***는 사실까지 더해지면, "가짜 인공지능"이라 불리던 서비스가 진짜 AI와, AI를 쓰는 워커 양쪽에 동시에 밀려난 셈이다.

## 핵심 포인트

- **종료 일정** — HIT 제출은 **2026-09-30 마감**. 요청자는 표준 승인 정책에 따라 **10월 30일까지 30일간** 완료된 HIT를 승인·거절할 수 있고, ***아무 조치 없으면 자동승인***된다. 신규 요청자·워커 가입은 이미 **7월 30일부로 중단**돼 AWS의 "maintenance" 단계로 들어간 상태였다.
- **연쇄 종료** — SageMaker Ground Truth와 Amazon Augmented AI(A2I)의 "MTurk Worker" 워크포스 유형도 9/30부로 함께 폐지된다 — MTurk가 다른 AWS AI 서비스의 라벨링 인력 공급원 역할도 겸했다는 뜻.
- **결제 안내, 전환 지원은 없음** — 완료·승인된 작업 보상은 ***기존 정산 일정대로 지급***되지만, 워커는 종료 전 Worker Portal에서 결제수단·정산 주기를 스스로 확인·설정해야 한다. 세브란스, 대체 플랫폼 추천, 보상 등 별도 전환 지원은 발표되지 않았고 안내는 FAQ 페이지가 전부다.
- **역사와 이름의 아이러니** — 2005년 출시, 전성기 워커 50만 명 이상. 베조스가 2007년 NYT 인터뷰에서 ***"artificial artificial intelligence"(인공적인 인공지능)***라 부른 것으로 유명하다 — 컴퓨터가 못 하는 일을 사람이 대신하면서 "AI인 척"한 서비스였다.
- **공식 사유 vs 언론의 정황 해석 — 구분해서 읽어야 한다** — 아마존이 직접 "AI가 우리를 대체했다"고 밝힌 적은 없다(공식 문구는 "내부 검토 결과"). 복수 매체가 짚는 배경은 ①AI 모델 발전으로 데이터 라벨링·분류·요약 같은 저난이도 판단 업무를 AI가 더 싸게 처리, ②Scale AI·Mercor·Prolific 등 AI 학습 데이터 전문 플랫폼이 등장해 워커와 수요를 함께 흡수, ③플랫폼 자체가 수년간 "쇠퇴 중"이었고 아마존의 투자·개선도 줄었다는 것.
- **두 번째 아이러니 — 인간 워커가 AI를 썼다** — 2023년 학계 연구는 **MTurk 워커의 최대 46%가 작업 수행에 ChatGPT 등 AI 모델을 사용**한 것으로 추정했다. "사람의 판단"을 파는 게 존재 이유인 플랫폼에서, 파는 쪽마저 AI를 쓰면서 **데이터 품질에 대한 근본적 의문**이 제기됐다 — 요청자(주로 AI 학습 데이터 구매자)가 신뢰도 검증이 더 까다로운 경쟁 플랫폼으로 옮겨갈 유인이 된 셈이다.

## 인상 깊은 문장

> "artificial artificial intelligence" — 제프 베조스, 2007년 뉴욕타임스 인터뷰 (CNBC·TheNextWeb 등이 반복 인용)
> (이 세션에서 NYT 원문을 직접 확인하지는 못했지만 널리 알려진 역사적 인용구다. "사람이 하는데 AI인 척한다"는 이 표현이, 21년 뒤 "진짜 AI에게 밀려 문을 닫는다"는 이번 뉴스와 정확히 대구를 이룬다.)

> "up to 46% of Mechanical Turk workers used AI models to complete tasks" — 2023년 학계 연구 인용 (techstartups.com 등 WebSearch 스니펫 재구성, 연구 원문 미확인)
> (플랫폼의 핵심 전제 — "이건 사람만 할 수 있는 판단이다" — 가 안에서부터 무너지고 있었다는 뜻이라, 종료 서사에서 가장 반직관적인 대목이다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 자체가 egress 차단).
- **HN 스레드 존재는 확인, 내용은 미확인** — "Mechanical Turk shutting down September 30"(`id=49457545`)이라는 스레드가 있다는 사실은 WebSearch로 확인했지만, 포인트·댓글 수·실제 댓글 내용은 news.ycombinator.com 자체가 차단돼 직접 읽지 못했다. WebSearch 종합 결과가 "AI가 이제 웬만한 단순 업무를 사람보다 싸게, 검증 비용 없이 처리해서 굳이 사람에게 하청 줄 유인이 없다"는 취지의 논의가 있었다고 알려주지만, 이건 직접 인용이 아니라 재구성이라 신뢰도를 낮게 잡아야 한다.
- **Lobsters 큐레이션 여부**: 확인하지 못함.
- **이해관계 유의점**: 아마존 공식 발표는 이유를 구체적으로 밝히지 않는 원론적 문구뿐이다. "AI가 MTurk를 대체했다"는 서사는 언론이 정황(경쟁사 등장, 플랫폼 쇠퇴, 46% 연구)을 엮어 구성한 해석이지, 아마존이 직접 인정한 사실이 아니라는 점을 분리해서 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — MTurk가 잃은 자리는 "AI"가 아니라 "태스크 경제"가 가져갔다

[[2026-07-20-task-economy-data-trillion-dollar-market]]에서 다룬 Mercor(4개월 만에 ARR $1B→$2B)가 정확히 이 자리를 대체한 후속 세대다. MTurk는 "누구나 할 수 있는 저단가 크라우드소싱"이었던 반면, 이를 대체한 플랫폼들은 "검증 가능한 전문가 암묵지를 보상 신호로 인코딩하는" 고부가 RL 데이터 인프라로 격상됐다. ***"컴퓨터가 못 하는 일을 사람이 대신한다"는 원리는 그대로인데, 그 일의 단가와 검증 수준이 20년 사이 완전히 달라졌다*** — MTurk의 종료는 이 업그레이드에서 밀려난 구세대가 문을 닫는 사건으로 읽는 게 더 정확하다.

### 핵심 전이 2 — 사람이 라벨링한 데이터가, 그 사람을 대체하는 모델의 원료가 됐다

[[2026-08-02-500-dollar-finetune-beats-frontier-models]]는 17만여 개의 인간 검수 에피소드로 만든 "디지털 트윈"에 GRPO 미세조정을 걸어, $500짜리 소형 모델이 프런티어 모델을 이긴 사례를 다뤘다. MTurk가 인터넷 역사 내내 대량으로 공급해 온 것이 바로 이런 "사람이 반복 판단한 라벨 데이터"다. ***자신이 만든 데이터가 자신을 대체하는 모델의 훈련 원료가 됐다는 재귀적 구조*** — 카탈로그 검수건 이미지 분류건, MTurk형 업무가 사라지는 방식은 대부분 "해고"가 아니라 "그 업무 자체가 데이터로 흡수돼 자동화"였을 가능성이 높다.

### 핵심 전이 3 — 진입장벽 없는 마지막 일자리가 사라졌다는 점에서, 신입 채용 위축과 같은 축

[[2026-08-27-ai-entry-level-jobs-shrink-most]]가 다룬 스탠포드 연구는 "AI가 해고가 아니라 신입 채용을 조용히 줄인다"는 게 핵심이었다. MTurk는 이력서도 경력도 필요 없는, 노동시장에서 사실상 가장 낮은 진입장벽이었다 — 그 최후의 안전망이 사라진다는 것은 같은 현상의 극단값이다. 다만 이 둘을 동일시하면 과장이다: 스탠포드 연구는 정규직 채용 데이터, MTurk는 긱워크 플랫폼 하나의 폐쇄다. ***"진입 경로가 좁아진다"는 방향은 공유하지만, 스케일과 성격이 다른 사례로 나란히 두는 정도가 정직하다.***

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다** — 온다는 크라우드워크 플랫폼 사업자가 아니고, MTurk 같은 외부 긱워커 마켓플레이스를 정식 업무 프로세스에 쓰고 있지도 않다.
- 다만 전이 가능한 원칙은 있다 — **만약 앞으로 예약 데이터 정합성 검수·QA 라벨링 같은 업무에 외부 크라우드(또는 아웃소싱 인력)를 쓸 계획이 생긴다면**, 이번 사례가 주는 두 가지 교훈을 설계에 반영할 필요가 있다: ①검증 없는 저단가 크라우드소싱은 AI 자동화에 가장 먼저 잠식되므로, "지금 사람이 하는 이 판단 업무의 로그가 곧 그 업무를 대체할 모델의 훈련 데이터가 된다"는 전제로 데이터 소유·노출을 관리해야 한다([[2026-07-20-task-economy-data-trillion-dollar-market]]의 CRS 적용점과 같은 축). ②사람에게 맡긴 작업이라도 "그 사람이 AI를 써서 처리했을 가능성"을 품질 검증 설계에 넣어야 한다(MTurk의 46% 사례가 보여준 함정).

## 연관 자료
- [[2026-07-20-task-economy-data-trillion-dollar-market]] — MTurk가 잃은 자리를 가져간 후속 세대(Mercor 등 태스크 경제) 데이터 인프라 시장
- [[2026-08-02-500-dollar-finetune-beats-frontier-models]] — 사람이 라벨링한 데이터가 그 사람을 대체하는 소형 모델의 훈련 원료가 되는 구체적 메커니즘
- [[2026-08-27-ai-entry-level-jobs-shrink-most]] — "해고가 아니라 진입 경로 축소"라는 같은 방향, 다른 스케일의 사례

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①이 세션에서 막혀 있던 원문(mturk.com/help, GeekNews 댓글, HN 스레드)에 직접 접근해 hada·HN 댓글 논지와 정확한 수치를 확인, ②9/30 종료가 실제로 예정대로 진행됐는지, ③Scale AI·Mercor·Prolific 등 후속 플랫폼으로의 워커 이동 규모가 보도됐는지, ④"46% AI 사용" 연구의 원문·방법론을 직접 확인해 인용의 정확성을 검증.)*
