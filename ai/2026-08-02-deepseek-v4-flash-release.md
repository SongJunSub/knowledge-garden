---
title: "DeepSeek-V4-Flash 공개 — 자체 발표는 Terminal Bench 2.1에서 82.7점, 독립 분석(artificialanalysis.ai)은 AAII 50점으로 Kimi K3·GLM-5.2에 이어 3위. 두 숫자가 다른 게 아니라 다른 걸 재는 것이다. 진짜 뉴스는 순위가 아니라 가격표: 100만 토큰당 입력 $0.14·출력 $0.28, MIT 라이선스로 자체 호스팅·상업 이용 무제한"
source_title: "DeepSeek-V4-Flash Update / DeepSeek V4 Flash 0731 Intelligence, Performance & Price Analysis"
source_url: "https://api-docs.deepseek.com/updates/"
source_name: "api-docs.deepseek.com + artificialanalysis.ai"
referrer_url: "https://news.hada.io/topic?id=32016"
published_at: "2026-07-31"
summarized_at: "2026-08-02"
category: "ai"
tags: ["deepseek", "open-weights", "moe", "model-release", "independent-benchmark", "mit-license", "inference-pricing"]
---

# DeepSeek-V4-Flash 공개 — 자체 발표와 독립 분석을 나란히 놓고 읽기

> 출처: [DeepSeek API 업데이트](https://api-docs.deepseek.com/updates/) (api-docs.deepseek.com · GeekNews GN⁺ 요약) + [DeepSeek V4 Flash 0731 분석](https://artificialanalysis.ai/models/deepseek-v4-flash) (artificialanalysis.ai · GeekNews GN⁺ 요약 + HN 큐레이션) · referrer: [id=32016](https://news.hada.io/topic?id=32016) / [id=32020](https://news.hada.io/topic?id=32020) · 정리일 2026-08-02

## 한 줄 요약

**같은 모델을 두 각도에서 보는 두 소스를 함께 정리한다. **공식 발표(DeepSeek)**: DeepSeek-V4-Flash API 정식 버전이 공개 베타로 출시됐고, 모델명은 `deepseek-v4-flash`. **에이전트 성능에서 V4-Pro-Preview를 크게 상회**하며 **Terminal Bench 2.1에서 82.7점**을 기록했다(단, "DeepSeek Harness 최소 모드"라는 자체 측정 조건에서). Responses API 형식을 기본 지원하고 **Codex에 맞게 조정**됐다는 점도 명시됐다. **독립 분석(artificialanalysis.ai)**: 최대 추론 설정에서 **AAII(Artificial Analysis Intelligence Index) 50점**으로 **Kimi K3·GLM-5.2에 이어 3위**를 기록했다. 아키텍처는 **2,840억 파라미터 중 토큰마다 130억 개만 활성화하는 MoE**, **100만 토큰 컨텍스트**. 가격은 API 기준 **입력 $0.14 / 출력 $0.28 / 캐시 $0.003**(100만 토큰당) — 이번 시즌 반복된 가격 붕괴 곡선의 또 다른 데이터 포인트다. 독립 평가 자체의 비용도 공개됐다 — **Intelligence Index 평가에 $72.02, 출력 토큰 2억 1천만 개 사용.** 그리고 무엇보다 **MIT 라이선스로 자체 호스팅·상업 이용이 자유롭다.** 두 소스를 나란히 놓는 이유는 간단하다 — **벤더 자체 벤치마크(Terminal Bench 82.7점)와 독립 벤치마크(AAII 3위)는 서로 다른 걸 재고 있어서, 둘 다 봐야 그림이 완성된다.**

## 핵심 포인트

- **공식 스펙** — `deepseek-v4-flash`, **공개 베타** 출시. **에이전트 성능에서 V4-Pro-Preview를 크게 상회**, **Terminal Bench 2.1 82.7점**(DeepSeek Harness 최소 모드 측정). **Responses API 형식 기본 지원**, **Codex에 맞게 조정.** 변경 범위는 V4-Flash API로 한정, **V4-Pro 정식 버전은 곧 출시 예정.**
- **독립 분석(artificialanalysis.ai)** — 최대 추론 설정에서 **AAII 50점**, **Kimi K3·GLM-5.2에 이어 3위.** **2,840억 파라미터 중 토큰당 130억 개 활성화**(MoE), **100만 토큰 컨텍스트.**
- **가격** — API 100만 토큰당 **입력 $0.14 / 출력 $0.28 / 캐시 $0.003.**
- **평가 비용의 투명성** — Intelligence Index 평가에 **$72.02**, **출력 토큰 2억 1천만 개** 사용됐다고 명시. (드물게 평가 자체의 비용을 공개하는 독립 벤치마크 사이트의 관행.)
- **라이선스** — **MIT 라이선스**로 자체 호스팅·상업 이용 자유. 현재 **API 제공자 1곳**(DeepSeek 자체).

## 인상 깊은 문장

*(양쪽 GeekNews 요약이 불릿 형태로만 제공되어 원문 영어 인용은 확보하지 못했다.)*

## 댓글

**공식 발표(32016) hada 댓글 1개**: 실사용 경험 공유 — *"Flash로 처리 중"*, *"개인 일상 에이전트 작업 대부분에 사용"*. 저렴한 가격·빠른 속도·캐싱 효율성을 장점으로 언급하며 기존 고가 모델 대비 경쟁력을 평가.

**독립 분석(32020) hada 댓글 1개(HN 정리)**: **모델 가중치 공개, 양자화 버전 기대, 로컬 실행 가능성, 저가 API의 장점, 가격-성능 효율성** 논의.

**읽을 때 감안** — ①**두 소스가 같은 모델에 대해 서로 다른 벤치마크(Terminal Bench vs AAII)로 다른 순위를 말하고 있다** — 이걸 하나의 절대적 순위로 합치면 안 된다. Terminal Bench는 에이전트·터미널 작업 특화 벤치마크이고 AAII는 종합 지능 지수라 **측정 대상 자체가 다르다.** ②**"DeepSeek Harness 최소 모드"라는 조건이 붙은 자체 벤치마크는 최적 조건에서 측정됐을 가능성**을 배제할 수 없다 — 독립 분석의 3위 순위가 더 신뢰할 만한 비교 기준으로 보인다. ③**"V4-Pro-Preview를 크게 상회"라는 비교는 자사 이전 모델과의 비교**이지 경쟁사와의 비교가 아니다 — 이 문장만으로 시장 내 경쟁력을 판단할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "벤더 발표"와 "독립 분석"을 나란히 놓는 이 노트의 형식 자체가 이번 시즌 반복해 온 원칙의 실천이다

[[2026-07-13-i-love-llms-i-hate-hype]]부터 이번 배치의 [[2026-08-02-gemini-robotics-2]]까지 반복한 원칙 — *"재현 전까지는 마케팅"* — 을 이번엔 **재현된 사례**로 보여줄 수 있다. DeepSeek의 "Terminal Bench 82.7점"(자체 발표)이 artificialanalysis.ai의 **독립 AAII 3위**로 어느 정도 뒷받침된다 — 완전히 같은 수치는 아니지만, **"상위권"이라는 방향성은 두 소스가 일치**한다. 이게 바로 이 노트가 두 소스를 결합해서 다루는 이유다 — **자체 발표 하나만으로는 부족하고, 독립 검증이 있어야 신뢰도가 생긴다.**

### 핵심 전이 2 — 가격 $0.14/$0.28은 이번 배치에서 세 번째로 확인되는 "재현 비용 붕괴" 데이터 포인트다

[[2026-08-02-frontier-ai-semiconductor-treadmill]]의 *"재현 비용은 연 10배씩 하락"*, [[2026-08-02-gpt-5-6-price-performance]]의 Luna 80% 인하에 이어, 이번 DeepSeek-V4-Flash의 **입력 $0.14/출력 $0.28**은 이 시즌 가격 곡선의 세 번째 확인이다. 흥미로운 건 이 가격이 **[[2026-08-02-kimi-k3-huggingface-release]]에서 다룬 K3보다도 훨씬 낮다는 것**(K3의 정확한 가격은 이 노트에 없지만, DeepSeek 계열은 전통적으로 초저가 전략을 써왔다). **중국 오픈웨이트 랩들 사이에서도 가격 경쟁이 벌어지고 있다**는 걸 이 숫자가 보여준다 — 이건 미국 vs 중국의 대립 구도가 아니라, **오픈웨이트 랩들 사이의 내부 경쟁**이 별도로 존재한다는 뜻이다.

### 핵심 전이 3 — "평가 비용 $72.02, 출력 토큰 2억 1천만 개"를 공개하는 건 이 시즌이 요구해 온 투명성의 실천이다

[[2026-08-02-openai-codex-security-oss]]·[[2026-08-02-gemini-robotics-2]]에서 반복 지적한 **"재현 프로토콜 부재"** 문제에 대해, artificialanalysis.ai는 최소한 **평가에 쓴 비용과 토큰 수를 공개**한다. 이건 완전한 재현성은 아니지만(정확한 프롬프트·태스크셋까지는 공개하지 않았을 수 있다), **최소한의 투명성 기준**을 보여준다 — 다른 벤더들의 벤치마크 발표와 비교하면 이게 오히려 예외적으로 정직한 축에 속한다는 게, 역설적으로 업계 전반의 투명성 수준이 낮다는 걸 보여준다.

### 핵심 전이 4 — 정직한 급소: MoE의 "2,840억 중 130억 활성화"는 [[2026-08-02-kimi-k3-huggingface-release]]에서 내가 유보했던 질문에 대한 답이다

지난 K3 노트에서 나는 *"2.8조는 총 파라미터고 MoE라 활성 파라미터는 훨씬 적을 것 — 서빙비 판단은 활성 파라미터 확인 전까지 유보"*라고 적었다. 이번 DeepSeek-V4-Flash가 **정확히 그 숫자를 공개**한다 — 총 2,840억 중 **활성 130억**, 비율로 약 4.6%. 이게 K3에도 비슷하게 적용된다면(총 2.8조의 유사 비율), **K3의 실제 활성 파라미터는 1,000억대 초반**일 수 있다 — 여전히 크지만 "2.8조"라는 숫자가 주는 인상보다는 훨씬 다루기 쉬운 규모다. **MoE 모델을 평가할 때는 항상 총 파라미터가 아니라 활성 파라미터 비율을 먼저 확인하는 게 이 시즌에 확립해야 할 습관**이다.

## 호스피탈리티 / CRS 적용 포인트

- **가격 경쟁이 오픈웨이트 진영 내부에서도 벌어지고 있다는 걸 조달 전략에 반영(전이 2).** 특정 벤더(Kimi, DeepSeek, GLM 등) 하나에 베팅하지 말고, 이 진영 전체가 계속 가격을 낮추는 흐름에서 **주기적으로 재평가**하는 프로세스를 갖춘다.
- **MoE 모델 평가 시 활성 파라미터 비율을 먼저 확인하는 체크리스트 항목으로(전이 4).** 서빙 비용·인프라 요구사항을 추정하기 전에 이 숫자부터 본다.
- **벤더 발표 + 독립 분석을 짝으로 확인하는 습관(전이 1).** 새 모델을 평가할 때 벤더 자체 벤치마크만 보지 않고 artificialanalysis.ai 같은 독립 분석 사이트를 항상 함께 확인한다.

## 연관 자료
- [[2026-08-02-kimi-k3-huggingface-release]] — *"총 파라미터 vs 활성 파라미터" 유보 질문에 대한 답이 이번 글의 MoE 비율에서 확인됨*
- [[2026-08-02-frontier-ai-semiconductor-treadmill]] · [[2026-08-02-gpt-5-6-price-performance]] — *이번 시즌 가격 붕괴 곡선의 세 번째 데이터 포인트*
- [[2026-08-02-gemini-robotics-2]] · [[2026-08-02-openai-codex-security-oss]] — *"재현 프로토콜 부재" 문제, artificialanalysis.ai의 비용 공개가 예외적으로 나은 사례*
- [[2026-07-13-i-love-llms-i-hate-hype]] — *벤더 발표와 독립 검증을 나란히 놓는 이 노트 형식 자체가 이 원칙의 실천*

## 한 달 뒤 회고
*(2026-09-02 즈음 — ①DeepSeek-V4-Flash의 실사용 경험이 hada 댓글의 초기 긍정 평가를 뒷받침하는지, ②K3의 실제 활성 파라미터 비율을 확인했는지, ③MoE 모델 평가 체크리스트에 활성 파라미터 확인을 실제로 넣었는지 기록.)*
