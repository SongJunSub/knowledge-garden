---
title: "Qwen3.8-Flash-Next: 비용 효율을 높인 새로운 아키텍처 — GDN·QSA 하이브리드 어텐션과 4개 병렬 잔차 경로로 훈련 비용을 1/9로"
source_title: "Qwen3.8-Flash-Next: A New Architecture, Towards..."
source_url: "https://qwen.ai/blog?id=qwen3.8-flash-next"
source_name: "qwen.ai 공식 블로그 (Alibaba/Qwen Team)"
referrer_url: "https://news.hada.io/topic?id=32911"
published_at: "2026-08-26"
summarized_at: "2026-08-27"
category: "ai"
tags: ["qwen", "moe", "linear-attention", "sparse-attention", "training-efficiency", "model-architecture"]
---

# Qwen3.8-Flash-Next: 비용 효율을 높인 새로운 아키텍처

> 출처: [Qwen3.8-Flash-Next: A New Architecture, Towards...](https://qwen.ai/blog?id=qwen3.8-flash-next) (qwen.ai 공식 블로그, Alibaba/Qwen Team) · 정리일 2026-08-27
> **출처 한계**: `qwen.ai`·`news.hada.io`가 이 세션에서 전부 egress 차단돼 공식 블로그 원문·hada 댓글을 직접 읽지 못했다. 아래 내용은 LMSYS(SGLang) 블로그, NVIDIA 기술 블로그, the-decoder, officechai 등이 원문을 인용·재구성한 WebSearch 스니펫과 Slack 발췌를 교차해 재구성한 것이다. 벤치마크 수치는 Qwen 팀 자체 발표 기준이며, 이 세션에서 독립 재현·검증은 하지 못했다.

## 한 줄 요약

**Qwen3.8-Flash-Next는 차기 Qwen4에 적용할 설계를 먼저 공개한 멀티모달 MoE 모델로, 125B 본체와 51B N-gram 임베딩 테이블 가운데 ***토큰당 6B 파라미터만 활성화***한다(48개 레이어 중 36개는 Gated DeltaNet, 12개는 Qwen Sparse Attention, 512개 전문가 중 top-10 라우팅). ***GDN(Gated DeltaNet)이 과거 정보를 압축하고 QSA(Qwen Sparse Attention)의 경량 인덱서가 중요한 문맥을 마이크로 블록 단위로 검색***하는 하이브리드 구조로, 1M 토큰 문맥에서 Attention Kernel의 Prefill·Decode를 각각 최대 7.6배·4.9배까지 가속한다. 여기에 ***잔차 스트림을 4개 병렬 경로로 넓히고 동적 게이트로 읽기/쓰기를 제어하는 Gated Residual***, 호스트 메모리로 비동기 오프로딩 가능한 N-gram 임베딩, 개선된 Muon 최적화가 더해져 용량·정보 흐름·훈련 안정성을 함께 확장한다. ***Qwen3.7-Plus(397B/활성 17B) 대비 훈련 비용을 약 1/9로 낮추면서도*** 코딩·사무 작업(DeepSWE 58.7점, SWE-bench Pro 62.5점)에서 DeepSeek-V4-Flash와 Claude Opus 4.6을 능가한다고 보고됐다.**

## 핵심 포인트

- **위치 — Qwen4의 아키텍처 프리뷰** — 정식 Qwen4 발표에 앞서, 차세대 아키텍처의 핵심 설계를 실물 모델로 먼저 공개해 추론 엔진(SGLang·vLLM·llama.cpp 등)이 day-0 지원을 준비할 시간을 준다는 목적이 명시적이다.
- **스펙 — 125B 본체 + 51B N-gram, 활성 6B** — MoE 본체 125B와 별도의 51B 규모 N-gram 임베딩 테이블을 합쳐 두되, 토큰당 실제 활성화되는 파라미터는 6B에 불과하다. 48개 레이어 중 36개는 GDN(선형 어텐션 계열), 12개는 QSA(희소 어텐션)이고, MoE 전문가는 512개 중 top-10을 라우팅한다.
- **GDN + QSA 하이브리드 어텐션** — Gated DeltaNet이 과거 문맥을 압축해 저장하고, Qwen Sparse Attention은 경량 인덱서로 마이크로 블록 단위 중요 문맥만 정밀 검색한다. 이 조합으로 ***1M 토큰 문맥에서 Attention Kernel의 Prefill을 최대 7.6배, Decode를 최대 4.9배 가속***한다.
- **Gated Residual — 잔차 스트림 4분기** — 잔차 스트림을 4개 병렬 경로로 넓히고 동적 게이트로 각 경로의 읽기/쓰기를 제어해, 레이어 간 정보 흐름을 강화한다.
- **N-gram 임베딩의 오프로딩 가능성** — 51B 규모의 N-gram 룩업 메모리는 로컬 문맥 기반 조회로 흔한 구문·패턴에 대한 추가 표현력을 제공하며, ***토큰당 연산량은 거의 늘리지 않고*** 호스트 메모리로 비동기 오프로딩할 수 있게 설계됐다 — 서빙 비용을 낮추는 구체적 장치.
- **개선된 Muon 최적화 + 훈련 비용 1/9** — Muon 최적화 개선으로 훈련 안정성을 확보하면서, Qwen3.7-Plus(총 397B/활성 17B) 대비 ***훈련 비용을 약 1/9로 낮췄다***고 Qwen 팀이 밝혔다. 벤치마크상 DeepSWE 58.7점·SWE-bench Pro 62.5점으로 DeepSeek-V4-Flash와 Claude Opus 4.6을 앞선다고 보고됨(자체 발표 수치, 제3자 검증 없음).

## 인상 깊은 문장

> "Compared with Qwen3.7-Plus, Qwen3.8-Flash-Next substantially reduces both training and inference cost — training takes only about 1/9 as much, yet it delivers superior capabilities in coding and office tasks."
> (the-decoder·officechai가 인용한 원문 취지를 재구성 — 활성 파라미터를 17B에서 6B로 줄이면서도(약 1/3) 벤치마크 성능은 오히려 앞선다는, "작을수록 약해진다"는 통념을 정면으로 반박하는 주장이다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단).
- **관점상 유의점**: 훈련 비용 절감·벤치마크 우위 수치는 전부 Qwen 팀 자체 발표이며, 이 세션에서 독립 벤치마크나 제3자 재현 결과는 확인하지 못했다. NVIDIA 기술 블로그가 GB300 NVL72 환경에서 이 모델을 실험한 사례는 확인했으나, 이 역시 Qwen과 NVIDIA 양측의 협력성 콘텐츠일 가능성을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 날 같은 모델의 "티저"와 "본편"이 이 가든에 나란히 남는다

바로 어제 정리한 [[2026-08-26-qwen38-flash-next]]는 HF 모델 카드가 처음 공개된 시점(8/26)의 스펙 유출을 다룬 노트로, 그때는 "벤치마크 부재·스펙 자체도 커뮤니티 사전 확인 수준"이라고 정직하게 한계를 명시했다. 이 노트가 다루는 qwen.ai 공식 아키텍처 블로그는 ***같은 모델에 대한 공식적이고 훨씬 상세한 후속 발표***로, GDN·QSA 하이브리드 어텐션·Gated Residual·Muon 최적화·훈련비용 1/9 같은 구체적 설계 근거와 벤치마크 수치가 처음으로 나온다. 두 노트를 이어 읽으면 "모델 카드 유출 → 공식 아키텍처 공개"라는 **AI 모델 발표의 전형적인 2단계 패턴**을 하루 간격으로 관찰할 수 있다는 점에서, 단순 중복이 아니라 같은 사건의 서로 다른 해상도 기록이다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다.** 이 노트가 다루는 것은 프리트레이닝 단계의 아키텍처 혁신(선형/희소 어텐션 하이브리드, 잔차 스트림 설계)으로, CRS/PMS 애플리케이션 레이어에서 결정할 수 있는 사안이 아니다.
- 다만 활성 파라미터 6B 수준·서빙 비용 최적화(N-gram 오프로딩)를 겨냥한 설계라는 점에서, [[2026-08-26-qwen38-flash-next]]에서 짚은 "온프렘 배치를 고려할 수 있는 체급"이라는 원칙은 이번 공식 발표로 더 뒷받침된다 — 다만 여전히 독립 벤치마크가 부재해 시기상조라는 판단은 유지한다.

## 연관 자료
- [[2026-08-26-qwen38-flash-next]] — 같은 모델의 전날 "티저" 노트(HF 모델 카드 유출 시점), 이 노트는 그 다음 단계인 공식 아키텍처 상세 공개를 다룸
- [[2026-08-13-qwen38-2-4t-a95b-open-weights]] — 같은 Qwen3.8 세대의 "Max급" 오픈웨이트, 이번 Flash-Next와 정반대 체급(2.4T/A95B vs 125B/A6B)

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①제3자 독립 벤치마크가 Qwen 팀 자체 발표 수치를 재현하는지, ②SGLang·vLLM·llama.cpp의 day-0 지원이 실제 서빙 성능으로 이어졌는지, ③Qwen4 정식 공개 시 이 아키텍처(GDN+QSA, Gated Residual)가 그대로 유지됐는지, ④원문·hada 댓글 직접 접근이 가능해지면 이 노트의 "추정" 표시를 확정 사실로 교체.)*
