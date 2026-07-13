---
title: "요청 하나를 끝까지 따라가면 경제학이 보인다 — AI 토큰의 데이터센터 여행기, 그리고 '학습은 자본지출, 추론은 매출원가'"
source_title: "How an AI Token Travels Through a Data Center"
source_url: "https://www.datagravity.dev/p/how-an-ai-token-travels-through-a"
source_name: "datagravity.dev"
referrer_url: "https://news.hada.io/topic?id=31381"
published_at: "2026-07-01"
summarized_at: "2026-07-13"
category: "architecture"
tags: ["request-tracing", "cogs-vs-capex", "unit-economics", "bottleneck-analysis", "jevons-paradox", "commoditization", "inference-cost"]
---

# 요청 하나를 끝까지 따라가면 경제학이 보인다 — AI 토큰의 데이터센터 여행기, 그리고 '학습은 자본지출, 추론은 매출원가'

> 출처: [How an AI Token Travels Through a Data Center](https://www.datagravity.dev/p/how-an-ai-token-travels-through-a) (Chris Zeoli, datagravity.dev) · 정리일 2026-07-13

## 한 줄 요약

**프롬프트 하나가 데이터센터 안에서 거치는 15개 정거장(게이트웨이 → 인증 → 로드밸런서 → 라우터 → 스케줄러 → KV 캐시 → 커널 → 인터커넥트 → 스트리밍)을 끝까지 추적하면, 그 자체로 AI 인프라의 경제학이 드러난다. 핵심 구분은 하나다 — 학습은 고정자산을 만드는 일회성 자본지출(capital event)이지만, 추론은 매 요청마다 발생하는 매출원가(COGS)다. 그래서 "배관"을 이해해야 하는 이유는 호기심이 아니라 경제학이다.**

## 핵심 포인트

- **무게중심이 학습 → 추론으로 이미 넘어갔다.** 추론이 AI 컴퓨팅에서 차지하는 비중은 2023년 약 1/3 → 2026년 약 2/3이고, 배포된 모델의 **생애 컴퓨팅 비용 중 80~90%**를 차지한다.
- **같은 요청의 두 단계인데 병목이 정반대다.** 프리필(prefill)은 **연산 바운드**로 최초 토큰 시간(TTFT)을 결정하고, 디코드(decode)는 **메모리 대역폭 바운드**로 토큰당 속도와 비용의 상한을 정한다. 최적화 방향이 반대라서 결론이 **"둘을 분리된 풀로 쪼개라"**(분리형 서빙)가 된다.
- **가격이 붕괴해도 지출은 줄지 않는다 (Jevons 역설).** 동일 품질 제공 비용은 연 약 200배 하락하는데 수요는 연 약 7배 증가한다. 싸진 토큰이 지출을 줄이는 게 아니라 **새 워크로드를 열어젖힌다**.
- **캐시가 곧 원가다.** 프롬프트 캐싱은 반복 입력 비용을 최대 90%, 지연시간을 약 85% 줄인다. 출력 토큰은 입력보다 약 **4~5배 비싸다**.
- **헤드라인 가격으로 공급자를 고를 수 없다.** 실제 비용은 입력:출력 비율, 캐시 적중률, p99 꼬리 지연, SLA 바깥의 실질 가용성에 좌우된다.
- **순수 속도는 해자가 아니다.** 소프트웨어 계층의 속도 우위는 컴파일러와 벤더의 무료 툴링이 빠르게 상품화한다. 지속 가능한 가치는 물리적 병목(대역폭·전력)이나 전환비용, 유통망에 있다.
- **개방 표준은 상품화하고, 독점은 해자로 남는다.** scale-up은 닫힌 채 방어되고 scale-out은 Ethernet 계열로 열리며 상품화된다.

## 인상 깊은 문장

> "Training a model is a capital event — a one-time burn that produces a fixed asset. Inference is the *cost of goods sold*."

> "Cheaper tokens do not reduce spend; they unlock new workloads faster than price falls."

> "Be skeptical of anything whose entire pitch is raw speed, because raw speed is exactly what the compiler layer, and NVIDIA's own free tooling, are busy commoditizing."

> "Follow one token and the whole economy becomes legible."

## 댓글

**댓글 0개.** 최상위·대댓글 모두 0개이고, GN⁺의 HN/Lobste.rs 큐레이션 블록도 없다(본문 패스·댓글 전용 패스 2회 확인). 원문에 대한 HN 스레드도 존재하지 않는다.

## 내 생각 · 적용점

> *GPU·NVLink·HBM 같은 하드웨어 스펙은 내가 다루지 않는 영역이라 걷어냈다. 이 글에서 내가 가져갈 것은 아래 네 가지 보편 원칙이다.*

### 핵심 전이 1 — "요청 하나를 끝까지 따라가라"는 방법론 자체가 이 글의 진짜 가치

저자의 방법은 아키텍처 다이어그램을 그리는 게 아니라, **실제 요청 하나를 골라 15개 정거장을 통과시키는 것**이다. "Follow one token and the whole economy becomes legible." 이건 어떤 시스템에도 적용된다 — **예약 하나가 CRS에 들어와 채널 → 인증 → 라우팅 → 캐시 → DB → 외부 PMS → 응답까지 가는 경로를 끝까지 따라가면**, 구조도로는 절대 안 보이던 병목과 단위 원가가 드러난다. 추상적 구조도가 아니라 **구체적 트레이스**가 시스템을 읽게 만든다. 이건 당장 해볼 수 있는 실천이다.

### 핵심 전이 2 — 자본지출(capex)과 매출원가(COGS)를 구분하는 사고

"Training is a capital event. Inference is the cost of goods sold." 이 구분은 AI에만 해당하지 않는다. **개발 조직이 만드는 모든 것은 둘 중 하나다** — 한 번 만들고 끝나는 자산인가, 매 트래픽마다 반복해서 돈을 태우는 원가인가. 후자는 사용량에 비례해 선형으로 커지므로 **초기 설계의 1% 효율 차이가 규모가 커질수록 마진 전체를 결정**한다. 많은 팀이 기능(자본지출)만 논의하고 단위 원가는 논의하지 않는다. [[2026-06-29-compute-adjusted-ltv]]의 "컴퓨트 보정 LTV"와 [[2026-07-06-ai-margin-collapse-glm-5-2]]의 "캐시된 입력 토큰이 비용의 90%"가 이 프레임의 구체적 사례다.

### 핵심 전이 3 — 성격이 다른 워크로드를 한 풀에 섞으면 둘 다 최악이 된다

프리필(연산 바운드)과 디코드(대역폭 바운드)는 같은 요청의 두 단계인데 최적화 방향이 정반대라서, 결국 **분리된 풀로 쪼개는 것**이 답이 됐다. 이건 하드웨어 얘기가 아니라 **보편 원칙**이다 — 배치 처리와 실시간 API를 같은 인스턴스에 태우는 순간 우리는 같은 실수를 반복한다. CRS에서도 야간 정산 배치와 실시간 예약 조회가 자원을 공유하고 있다면 정확히 이 문제다. 마침 같은 주 정리한 [[2026-07-12-apple-silicon-mac-mini-on-device-ai]]의 "실행 위치 라우팅 정책 레이어"와 같은 계열의 사고다.

### 핵심 전이 4 — "지금 빠르다"는 해자가 아니다 (그리고 싸져도 지출은 안 줄어든다)

"속도만 파는 제품은 컴파일러/런타임 발전이 곧 무료로 따라잡는다"는 경고는 기술 선택과 커리어 양쪽에 적용된다. **해자는 물리적 제약이거나 전환비용이거나 유통망**이지, 벤치마크 우위가 아니다. 어제 정리한 [[2026-07-12-twelve-models-build-same-four-apps]]의 "벤치마크 게이밍"과 같은 회의를 인프라 층에서 반복하는 셈이다. 그리고 Jevons 역설 — **"AI가 비싸서 못 쓴다"는 제약은 곧 사라지지만, 그건 "아껴 쓸 필요 없다"가 아니라 "전에는 상상 못 한 규모로 쓰게 된다"는 뜻**이다. 비용 효율은 절약의 문제가 아니라 **가능한 것의 범위**를 넓히는 문제다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-06-ai-margin-collapse-glm-5-2]] — *"캐시된 입력 토큰이 비용의 90%"라는 단위 원가의 구체 사례*
- [[2026-06-29-compute-adjusted-ltv]] — *컴퓨트를 매출원가로 보는 같은 프레임*
- [[2026-07-12-apple-silicon-mac-mini-on-device-ai]] — *실행 위치·총비용 구조와 같은 계열*
- [[2026-06-29-tokenmaxxing-agentic-loops]] — *에이전트 루프의 토큰 비용*
- [[2026-06-08-who-prices-intelligence]] — *지능의 가격을 누가 정하는가*

## 한 달 뒤 회고
*(2026-08-13 즈음 — CRS에서 "예약 하나의 전체 경로"를 실제로 트레이스해봤는지, 기능 논의에 단위 원가(COGS) 항목을 넣었는지, 배치와 실시간이 같은 자원 풀을 공유하는 지점을 찾아냈는지 기록.)*
