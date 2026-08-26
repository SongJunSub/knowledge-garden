---
title: "OpenAI Jalapeño — Broadcom과 공동설계한 추론 전용 ASIC, 초기 A0 실리콘으로 Blackwell을 앞선 전력당 처리량"
source_title: "Jalapeño's first results show industry-leading speed and efficiency in AI inference"
source_url: "https://openai.com/index/jalapeno-first-results/"
source_name: "OpenAI (openai.com), TechCrunch·VentureBeat·Tom's Hardware·SemiAnalysis 뉴스레터·the-decoder 교차검증"
referrer_url: "https://news.hada.io/topic?id=32892"
published_at: "2026-08-25"
summarized_at: "2026-08-26"
category: "ai"
tags: ["openai", "asic", "inference-chip", "broadcom", "hardware", "llm-inference"]
---

# OpenAI Jalapeño — Nvidia Blackwell을 앞선 LLM 추론 전용 ASIC

> 출처: [Jalapeño's first results show industry-leading speed and efficiency in AI inference](https://openai.com/index/jalapeno-first-results/) (OpenAI) · 정리일 2026-08-26
> **출처 한계**: `openai.com`, `techcrunch.com`, `venturebeat.com`, `tomshardware.com`, `news.hada.io`가 이 세션에서 전부 egress 차단돼 원문을 직접 읽지 못했다. 아래 내용은 **WebSearch로 여러 매체 스니펫을 교차검증해 재구성**한 것이다 — 벤치마크 수치는 전부 **OpenAI가 직접 제공**했고, SemiAnalysis가 InferenceX 벤치마크의 **일부만 온사이트 검증**했다는 점을 명확히 짚어둔다.

## 한 줄 요약

**OpenAI가 Broadcom(플랫폼 산업화는 Celestica와 협업)과 함께 설계 착수부터 테이프아웃까지 9개월 만에 만든 첫 자체 칩 Jalapeño는, 범용 AI 가속기가 아니라 처음부터 LLM 추론만을 겨냥해 설계된 ASIC이다. 초기 A0 실리콘 단계임에도 SemiAnalysis의 공개 InferenceX 벤치마크에서 여러 오픈 모델 기준 Nvidia Blackwell보다 높은 전력당 처리량을 기록했고, 아직 공개되지 않은 Rubin의 결과도 앞섰다고 주장한다. 다만 이 수치는 OpenAI가 제공했고, Jalapeño는 멀티토큰 예측·추측 디코딩 같은 최적화 기법 없이 낸 결과인 반면 비교 대상 시스템 일부는 그 기법을 썼다는 점에서, 완전히 동일 조건의 비교는 아니라는 단서가 붙는다.**

## 핵심 포인트

- **정체성 — "추론 전용" ASIC** — 학습용 가속기를 재활용하거나 범용 AI 프로세서를 튜닝한 게 아니라, ***처음부터 OpenAI의 LLM 로드맵·커널·서빙 시스템·제품 요구를 반영해 설계된 추론 전용 칩***이라는 게 OpenAI의 프레이밍이다.
- **개발 속도 자체가 뉴스** — 설계 착수부터 **테이프아웃까지 9개월** — OpenAI는 이를 첨단 반도체 역사상 가장 빠른 ASIC 개발 주기 중 하나라고 주장한다. **OpenAI 자체 모델을 설계·최적화 과정 가속에 활용**했다는 점도 함께 강조된다(재귀적 루프: AI가 자신을 서빙할 칩 설계를 돕는다).
- **설계축 = 토큰/MW** — HBM4, **단순화한 메모리·네트워크 구조**, 작은 행렬 연산에서도 효율적인 코어, 하드웨어·소프트웨어 공동설계를 결합해 "전력당 토큰 처리량" 최적화에 집중했다.
- **벤치마크 수치(OpenAI 제공, SemiAnalysis InferenceX)** — DeepSeek R1 670B는 동시성 1에서 사용자당 **700토큰/초 이상**, GPT-OSS 120B는 약 **1,400토큰/초**. 전체적으로 GPT-OSS 120B·DeepSeek R1·Kimi K2.5 1T 기준 **전력당 처리량 1.5~1.9배, 종단 지연 1.7~3.6배 개선**을 Blackwell 대비 주장하며, 동일 디코딩 속도 기준으로는 kW당 토큰 처리량이 **최대 54~104배**라는 수치까지 제시된다(과감한 주장이라 재검증 필요).
- **검증 범위의 명시적 한계** — Slack 발췌가 짚은 대로 이 결과는 **OpenAI가 제공한 수치**이고, **단일 턴 8k1k InferenceX 시나리오**에 한정된다. 또한 Jalapeño는 멀티토큰 예측·추측 디코딩을 쓰지 않은 결과인데 비교 대상 일부는 그런 최적화를 사용했다는 비대칭이 있다 — "완전히 동일 조건" 비교로 읽으면 안 된다.
- **배포 일정** — 다세대 컴퓨팅 플랫폼의 첫 단계로, **2026년 말 초기 배포**, 더 넓은 배포는 2027년으로 언급된다.

## 인상 깊은 문장

> "1.5 to 1.9 times more AI work per watt at peak throughput and 1.7 to 3.6 times lower end-to-end latency."
> (WebSearch로 재구성한 수치 요약 — 원문 그대로의 인용은 확보하지 못했지만 여러 매체가 공통으로 인용하는 핵심 수치다.)

> "Jalapeño posted these numbers without using techniques like multi-token prediction or speculative decoding, while some of the comparison systems did rely on those optimizations."
> (the-decoder 등이 짚은 비교 조건의 비대칭 — 이 한 줄이 벤치마크 전체를 어떻게 읽어야 할지를 정한다.)

## 댓글

**hada 댓글 수·논지는 확인하지 못했다** — `news.hada.io` 접근이 차단됐다. 원문이 OpenAI 자체 발표라는 점에서 **이해관계가 최대치인 1차 자료**임을 분명히 해둔다 — "Blackwell을 이겼다"는 프레이밍은 경쟁사 대비 우위를 알리려는 동기가 있는 발표사 본인의 주장이고, SemiAnalysis의 독립 검증은 전체가 아니라 일부에 그친다.

## 내 생각 · 적용점

- **[[2026-07-13-how-an-ai-token-travels-through-a-data-center]]** — 이 노트가 다뤘던 "추론은 매출원가(COGS), 프리필은 연산 바운드·디코드는 메모리 대역폭 바운드"라는 경제학이 Jalapeño에서 **하드웨어 설계로 그대로 육화**된 사례다. "토큰/MW" 최적화라는 표현 자체가 그 노트의 결론(가격이 붕괴해도 병목은 물리적 대역폭·전력에 남는다)과 정확히 같은 지점을 겨냥한다.
- **[[2026-05-24-memory-two-thirds-ai-chip-bom]]** — HBM이 AI 칩 부품 비용의 63%까지 치솟았다는 그 노트의 주장을, Jalapeño가 "HBM4 + 단순화한 메모리 구조"를 핵심 설계축으로 삼은 사실이 하드웨어 설계 관점에서 재확인해준다 — **메모리가 병목이자 원가의 핵심이라는 두 노트의 결론이 서로를 뒷받침**한다.
- **[[2026-06-28-ai-rfic-chip-design]]** — "OpenAI 자체 모델을 칩 설계 가속에 썼다"는 대목이, 그 노트가 다룬 "AI가 인간 템플릿 없이 칩을 설계한다"는 흐름과 같은 축에 있다(다만 그쪽은 RF 회로, 이쪽은 추론 ASIC이라 도메인은 다르다 — 가볍게만 연결).

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다가 자체 ASIC을 설계·양산할 이유는 없다. 다만 전이 가능한 원칙은 있다: **LLM API를 헤드라인 가격만으로 고르지 말라는 원칙**([[2026-07-13-how-an-ai-token-travels-through-a-data-center]]와 동일한 교훈) — 실질 비용은 캐시 적중률·p99 지연·처리량이 좌우한다는 게, 이번 사례에서는 "칩 하나가 그 처리량 곡선 자체를 바꿀 수 있다"는 형태로 한 겹 더 확인된다. 온다가 사용하는 LLM 공급자의 인프라 선택(자체 서빙 vs API)이 장기적으로 이런 하드웨어 경쟁의 영향을 받는다는 정도의 거시적 참고점.

## 연관 자료

- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — 이 하드웨어 발표가 실물로 증명하려는 추론 경제학(프리필/디코드 병목, 토큰당 원가)을 다룬 선행 노트.
- [[2026-05-24-memory-two-thirds-ai-chip-bom]] — HBM 비중 급증이라는 배경 수치, Jalapeño의 HBM4·메모리 단순화 설계 선택과 직결.
- [[2026-06-28-ai-rfic-chip-design]] — "AI가 자신을 서빙할 하드웨어 설계에 관여한다"는 재귀적 흐름의 다른 사례(도메인은 다름).

## 한 달 뒤 회고

- 2026-09-26 즈음: SemiAnalysis 등 제3자의 독립 검증 범위가 늘었는지, "OpenAI 제공 수치"를 벗어난 외부 재현 벤치마크가 나왔는지 확인.
- Nvidia Rubin의 공식 벤치마크가 공개된 뒤 "Rubin도 앞섰다"는 주장이 실제로 유지되는지 재비교.
- 2026년 말 초기 배포가 실제로 이뤄졌는지, 배포 규모(어떤 서비스에 우선 투입되는지)를 확인.
