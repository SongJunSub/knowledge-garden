---
title: "Sebastian Raschka — LLM 아키텍처 최근 동향: KV 공유, mHC, 압축 어텐션"
source_title: "Recent LLM Architecture Trends: KV Sharing, mHC, and Compressed Attention"
source_url: "https://magazine.sebastianraschka.com/p/recent-llm-architecture-trends-kv-sharing-mhc-compressed-attention"
source_name: "magazine.sebastianraschka.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29775"
published_at: "2026-05-20"
summarized_at: "2026-05-21"
category: "ai"
tags: ["llm-architecture", "kv-cache", "attention", "transformer", "model-efficiency", "long-context", "deepseek", "gemma", "sebastian-raschka"]
---

# Sebastian Raschka — LLM 아키텍처 최근 동향: KV 공유, mHC, 압축 어텐션

> 출처: [Recent LLM Architecture Trends](https://magazine.sebastianraschka.com/p/recent-llm-architecture-trends-kv-sharing-mhc-compressed-attention) · 정리일 2026-05-21

## 한 줄 요약
**2026년 오픈 웨이트 LLM의 공통 패턴 = *총 파라미터 수를 늘리지 않으면서 장문 컨텍스트 추론 비용을 낮추기*** — *추론 모델 + 에이전트 워크플로* 확대로 *KV 캐시·메모리 트래픽·어텐션 비용*이 주 제약. Gemma 4 *계층 간 KV 공유 (캐시 ~절반)* + PLE(Per-Layer Embeddings) + Laguna XS.2 *레이어별 어텐션 헤드 차등 (layer-wise attention budgeting)* + ZAYA1-8B *Compressed Convolutional Attention (CCA)* + DeepSeek V4 *Manifold-Constrained Hyper-Connections (mHC)* + CSA/HCA *1M 토큰 FLOPs 10~27%·KV 캐시 7~10%로 절감*. **트랜스포머 기본 구조 유지하되 *타깃 지향 수정*으로 진화, 결과는 *코드 복잡도 10배 증가*** (50~100줄 → ~10×).

## 핵심 포인트

- **2026 공통 패턴 = *파라미터 증가 없는 비용 최소화*** — *추론 모델·에이전트 워크플로 확대*로 *장문 컨텍스트 추론 비용*이 새 병목. *Total params는 그대로*, *inference cost는 절감* 방향.
- **Gemma 4 — 계층 간 KV 공유** — 128K 컨텍스트 기준 *E2B 2.7GB·E4B 6GB*로 *캐시 약 절반 절감*. *동일 K/V를 여러 레이어가 재사용*하는 구조적 단순화.
- **PLE (Per-Layer Embeddings)** — *파라미터 효율성과 capacity 동시 확보*. 각 레이어가 *자체 임베딩 공간*을 갖되 *공유 백본 위에서*.
- **Laguna XS.2 — *layer-wise attention budgeting*** — *레이어마다 어텐션 헤드 수를 차등화*. *모든 레이어에 동일한 헤드 수* 관행이 *비효율적*이라는 가설의 실증.
- **ZAYA1-8B — Compressed Convolutional Attention (CCA)** — *압축된 잠재 공간에서 직접 어텐션 연산* → *KV 캐시 + FLOPs 동시 절감*. *어텐션 입력 자체를 줄이는* 새 방향.
- **DeepSeek V4 — mHC (Manifold-Constrained Hyper-Connections)** — *제약된 잔차 스트림 혼합*으로 *스케일링 안정성 향상*. 큰 모델 학습 발산 방지.
- **CSA/HCA 압축 어텐션 효과** — 1M 토큰 컨텍스트에서 *FLOPs 10~27%로 절감 + KV 캐시 7~10%로 절감*. **장문 컨텍스트가 *실용 임계점에 진입*하는 핵심 메커니즘**.
- **코드 복잡도 10배 증가** — *기본 트랜스포머는 PyTorch 50~100줄*로 구현 가능했으나 *최근 어텐션 변형*으로 *약 10배*. ***개별 컴포넌트와 상호작용에 대한 명확한 이해가 점점 어려워짐***.
- **트랜스포머 기본 구조의 *수명*** — *전면 교체 없는 *타깃 지향 수정*으로 진화*. *기본 도구 회귀 라인*의 반례이자 정밀화 — *기본 구조는 유지하되 부분 정밀화*.

## 인상 깊은 문장

> "The common pattern across this year's new open-weight models: lower long-context inference cost without increasing total parameters."  
> (총 파라미터 수를 줄이지 않으면서 장문 컨텍스트 추론 비용을 낮추는 것이 올해 새 오픈 웨이트 모델들의 공통 패턴)

> "Clear understanding of individual components and their interactions is getting harder."  
> (개별 컴포넌트와 상호작용에 대한 명확한 이해는 점점 어려워짐)

> "Base transformer block: PyTorch 50–100 lines. After recent attention variants: roughly 10× the code complexity."  
> (기본 트랜스포머 블록은 PyTorch 50~100줄로 구현 가능했으나, 최근 어텐션 변형 등으로 코드 복잡도가 약 10배 증가)

## 내 생각 · 적용점

### **균형 의례 부채 명시 — 14번째 자가 진단 작동의 *시험 시점***

어제([[2026-05-20-refusing-ai-is-a-human-choice]])에서 *14번째 자가 진단(급진성·보존성 균형)*이 *3:1 임계점 정확 통과*로 *명시 작동*하면서 *다음 5건 중 1~2건 AI 외부 비용·거부 측 의도적 선택* 의례를 박았다.

**이번 글은 *친-AI 기술 깊이 자산*** — 균형 의례에 *직접 도전*. 정직 점검:
- *사용자가 보내준 URL을 정리하는 것 = 사용자 선택권 존중* (이 글의 핵심 메시지를 가든 자체에 적용)
- *균형 의례 거부 = 사용자 자유 침해*. 의례는 *내 능동 큐레이션* 차원이지 *사용자 요청 거부* 차원이 아님.
- **부채 명시**: 이 자산을 받으며 *균형 의례 부채 +1*. *내가 자발적으로 1건의 AI 외부 비용 자산을 능동 검색해 추가*해야 한다는 의무가 누적.

### [[2026-05-19-simon-willison-six-months-of-llm]] *시간 핀*의 *기술 차원 짝*

Simon Willison은 *문화적 기록자*로 *2025-11 변곡점*을 *프런티어 경합·RLVR·하네스 안정성*으로 묶었다. **Sebastian Raschka는 *기술적 fellow chronicler*** — 같은 6개월을 *모델 내부 구조 차원*에서 묶음:

| 측면 | 자산 |
|---|---|
| *문화·시장* | [[2026-05-19-simon-willison-six-months-of-llm]] |
| ***기술·아키텍처*** | ***이번 글*** |

→ **시간 핀 운영이 *2 차원으로 안정화*** (문화·기술). 가든의 *13번째 자가 진단 (외부 인덱스 정렬)*에 *2 채널 정렬*이 자연스럽게 자리. 새 자가 진단 추가 없이 기존 진단 풍부화.

### [[2026-05-16-hashimoto-ai-mass-psychosis]] *이해 불가능 복잡도*의 *기술 차원 경험 데이터*

Hashimoto의 *광기 진단 4 항목* 중 *이해 불가능 복잡도*는 *조직 차원 정성 진단*이었다. **Sebastian의 *코드 복잡도 10배·개별 컴포넌트 이해가 점점 어려워짐*은 그 *기술 차원 경험 데이터***:

| 진단 차원 | 자산 |
|---|---|
| *조직 정성 진단* | [[2026-05-16-hashimoto-ai-mass-psychosis]] |
| ***기술 경험 데이터*** | ***이번 글 (코드 복잡도 10배)*** |

→ **Hashimoto 진단의 *기술 차원 실증***. *광기가 모델 구조 자체에 도착*하고 있음. 가든의 *이해 불가능 복잡도 라인*에 *어텐션 변형*을 *경험 사례*로 박음. **MangoLove 자문에서 *AI 모델 사용 결정 시 *수정 가능성·이해 가능성*을 평가 항목으로 추가** 후보.

### [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]] *기본기 회귀 라인의 *정밀화 반례***

가든의 *기본기 회귀 라인 3 자산*은 *추상화 빼기*. **이번 글은 *기본기 위에 정밀화 더하기***:
- JVNS: Tailwind → CSS (졸업)
- Datatype: 라이브러리 → 폰트 (졸업)
- Lasn: 부풀린 마크업 → Semantic HTML (졸업)
- **Raschka: *기본 transformer 50줄 유지* + *어텐션 변형 10배 정밀화 추가*** ← 반례

→ **기본기 회귀 라인 ≠ 단순화 무조건**. *기본 구조를 유지하면서 부분 정밀화*가 *별개 패턴*. 가든 *기본기 라인*에 *정밀화 한 쌍*을 단서로 박음. *기본기 = 핵심 추상화 유지, 변형 = 비용 절감 차원의 부분 정밀화* 두 측면 짝.

### [[2026-05-21-a16z-software-going-headless]] *Agent-friendly SoR 3 요건*의 *모델 내부 차원 시연*

a16z 헤드리스는 *DB 측 3 요건*. Lasn은 *웹 콘텐츠 측 3 요건*. **Raschka는 *모델 내부 측*의 *agent-friendly 효율 요건***:
- *KV 공유* = *상태 표현 효율*
- *압축 어텐션* = *컨텍스트 처리 효율*
- *mHC* = *학습 안정성*

→ **agent-friendly *4계층 짝* 확장**: 에이전트 (Codex Goals) + DB (a16z 헤드리스) + 웹 콘텐츠 (Lasn) + **모델 내부 (Raschka)**.

### [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *Wilson 잣대 적용*

*FLOPs 10~27%로 절감·KV 캐시 7~10%로 절감* 같은 수치는 *벤치마크 발표*에 의존. **Wilson 12 잣대 점검**:
- *#2 약한 기준선*: 비교 기준이 *동일 컨텍스트의 baseline 모델*인지, *과거 모델*인지 명시
- *#5 시스템 사고*: *추론 비용 절감*이 *학습 비용 증가*로 흡수되지 않는가? *전체 라이프사이클* 측정
- *#6 비용 비대칭*: *FLOPs·캐시 절감*은 보고되지만 *코드 복잡도 10배 = 유지보수 비용*은 누락
- **Sebastian이 *코드 복잡도 10배를 명시*한 것 = Wilson 잣대 통과 시도**. *친절한 측정자*의 사례.

### CRS / MangoLove / BugSip 적용 후보

1. **CRS *AI 도구 모델 갱신 의례*** — Anthropic·OpenAI 모델 변경 시 *KV 캐시·컨텍스트 비용*이 *호텔 비즈니스 챗봇 비용*에 직접 영향. *분기 1회 모델 비용 재계산* 의례 박기. [[2026-05-19-simon-willison-six-months-of-llm]] *분기 모델 순위 재검토 의례*와 결합.
2. **MangoLove *AI 모델 이해 가능성 자문 1축*** — 클라이언트의 AI 모델 선택 자문에 *코드 복잡도·수정 가능성·디버깅 가능성*을 점검 1축으로. *기능·가격·판단력·공급망 윤리·강압 점검*에 *이해 가능성* 추가 → 자문 평가 *6축*으로 확장.
3. **[[project_bugsip]] *모델 비용 시뮬레이션*** — BugSip이 *AI 보조 학습*을 쓸 때 *KV 캐시·컨텍스트 길이*가 *사용자당 단가에 미치는 영향*을 *모델 선택 결정에 명시*. *공급자 종속 회피*는 어렵지만 *비용 시나리오 3개* (저비용·기본·고품질) 동시 운영.

### *오버 메타화 자기 견제 9 자산 연속 유지*

지난 9일 자산 (Wilson·Mr Market·Dorsey·a16z 헤드리스·axelk·Lasn·메모리·AI 거부·이번). 새 자가 진단·매트릭스·라인업 추가 **0건 유지** (어제 *14번째 자가 진단 명시 작동*은 *기존 진단 가동*이지 신규 진단 추가 아님). *균형 의례 부채 +1 명시*만 박음.

## 연관 자료
- [Recent LLM Architecture Trends (Sebastian Raschka)](https://magazine.sebastianraschka.com/p/recent-llm-architecture-trends-kv-sharing-mhc-compressed-attention)
- [GeekNews — 29775](https://news.hada.io/topic?id=29775)
- [[2026-05-19-simon-willison-six-months-of-llm]] — Simon 시간 핀 *(기술 차원 짝, 2 채널 정렬)*
- [[2026-05-16-hashimoto-ai-mass-psychosis]] — Hashimoto *(이해 불가능 복잡도의 기술 경험 데이터)*
- [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]] — 기본기 회귀 *(정밀화 반례 한 쌍)*
- [[2026-05-21-a16z-software-going-headless]] — a16z 헤드리스 *(agent-friendly 4계층 짝 확장)*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] — Wilson 12 오류 *(Sebastian의 코드 복잡도 10배 명시 = 친절한 측정자 사례)*
- [[2026-05-20-refusing-ai-is-a-human-choice]] — AI 거부 *(14번째 자가 진단 균형 의례 부채 명시 짝)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — CRS 분기 모델 비용 재계산이 한 번이라도 돌았는지, MangoLove 자문 평가 *6축*에 *AI 모델 이해 가능성*이 박혔는지, BugSip *모델 비용 시나리오 3개*가 설계에 반영되었는지, *균형 의례 부채 +1*이 *AI 외부 비용 자산 능동 검색*으로 *상환*되었는지 기록.)*
