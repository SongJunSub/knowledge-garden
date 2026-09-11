---
title: "DeepSeek-V4.1-Flash 공개 (DeepSeek 공식) — 입력·출력 활성 파라미터를 8B·16B로 쪼갠 새 아키텍처로 KV 캐시는 4분의 1, SSD는 8분의 1이 됐지만, 자체 공개 Terminal-Bench 수치는 미국 프론티어 모델에 여전히 뒤처진다"
source_title: "Introducing DeepSeek-V4.1-Flash: smarter, faster, more efficient"
source_url: "https://deepseek.com/en/news/deepseek-v4-1-flash/"
source_name: "DeepSeek 공식 블로그(deepseek.com)"
referrer_url: "https://news.hada.io/topic?id=33477"
published_at: "2026-09-10"
summarized_at: "2026-09-11"
category: "ai"
tags: ["deepseek", "open-weights", "moe", "model-release", "multimodal", "kv-cache", "mit-license", "independent-benchmark"]
---

# DeepSeek-V4.1-Flash 공개 (DeepSeek 공식)

> 출처: [Introducing DeepSeek-V4.1-Flash: smarter, faster, more efficient](https://deepseek.com/en/news/deepseek-v4-1-flash/) (DeepSeek 공식 블로그) · GeekNews(id=33477) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`·`deepseek.com` 모두 이번 세션 egress 정책으로 직접 열람하지 못했다(WebFetch `EGRESS_BLOCKED`). 아래 아키텍처 세부(CED 구조, CSA2, FP4 KV캐싱 등)와 벤치마크 수치는 WebSearch로 확보한 VentureBeat·TheNextWeb·alphaXiv·MindStudio·officechai 등 2차 보도를 교차 확인한 것이며, DeepSeek 공식 발표문 원문 문장을 직접 인용하지는 못했다. Terminal-Bench·DeepSWE 수치는 "DeepSeek이 자체 실행한 평가"라고 여러 매체가 명시하므로, 독립 재현 벤치마크가 아니라는 점을 분명히 해둔다. GeekNews(id=33477) hada 댓글 수도 확인하지 못했다.

## 한 줄 요약

**DeepSeek이 이미지·텍스트를 함께 처리하는 5,520억 파라미터 MoE 모델 V4.1-Flash를 공개하며 기존 V4-Pro를 단종시켰다.** 입력(prefill)엔 80억, 출력(decode)엔 160억 파라미터만 활성화하는 새 Causal Encoder-Decoder 구조로 KV 캐시를 이전 V4-Flash 대비 4분의 1, SSD 저장공간은 8분의 1로 줄여 긴 에이전트 작업의 비용을 낮췄다고 주장한다. 다만 **DeepSeek 자체 평가에서도 Terminal-Bench 3.0·4.0 모두 Claude Opus 5에 큰 격차로 뒤처진다**(예: Terminal-Bench 4.0에서 31.2 대 51.8) — VentureBeat 같은 매체의 "GPT-5.6 Sol·Opus 5를 능가"라는 헤드라인은 DeepSWE 1.1 같은 특정 지표에 국한된 이야기이지, 전 영역에서의 우위가 아니다.

## 핵심 포인트

- **아키텍처 전환** — 5,520억 총 파라미터의 MoE 모델이지만, ***Causal Encoder-Decoder(CED)*** 구조로 40개 레이어를 20개 인코더+20개 디코더로 나눠 **입력 처리에는 80억, 출력 생성에는 160억 파라미터만 활성화**한다. 이전 V4-Flash가 "총 2,840억 중 130억 활성화"라는 단일 활성 파라미터 수치를 썼던 것과 달리, 이번엔 입력·출력의 활성 파라미터를 아예 다르게 설계했다 — 긴 입력을 반복 처리하는 에이전트 작업(도구 호출·긴 컨텍스트 유지)에 특화된 구조다.
- **KV 캐시 압축** — 토큰당 KV 캐시가 **890바이트**로, 이전 V4-Flash 대비 약 4분의 1, SSD에 유지해야 하는 영속 캐시 공간은 8분의 1 수준. Compressed Sparse Attention 2(CSA2)로 어텐션 레이어별 모드(Full/Reindex/Reuse)를 나눠 KV 재계산을 줄이고, FP4(E2M1 포맷) KV 캐싱과 SWA Bounded Replay(최근 토큰만 재생해 SWA KV를 SSD에 영속시키지 않는 기법)를 겹쳐 썼다.
- **컨텍스트·라이선스** — 100만 토큰 컨텍스트를 지원하며, 코드와 모델 가중치를 **MIT 라이선스**로 공개해 자체 호스팅·상업적 이용이 자유롭다.
- **자체 평가 수치, 엇갈리는 그림** — DeepSWE v1.1에서 **74.2점**으로 Claude Opus 5(74.0)·GPT-5.6 Sol(73.0)을 근소하게 앞선다고 주장하지만, Terminal-Bench 3.0에서는 Opus 5가 43.3 대 30.0으로, Terminal-Bench 4.0에서는 51.8 대 31.2로 V4.1-Flash를 크게 앞선다 — **하나의 벤치마크에서의 근소한 우위가 다른 벤치마크에서의 큰 열세를 상쇄하지 못한다.** 이 모든 수치는 DeepSeek 자체 실행 결과이지 독립 검증이 아니다.
- **가격** — VentureBeat에 따르면 오프피크 캐시 입력 기준 100만 토큰당 $0.003이라는 초저가 요금제를 제시했다(정확한 전체 가격표는 원문 미확인).
- **HN 반응(대규모)** — WebSearch로 확인한 HN 스레드는 첫날 409포인트·214댓글이라는 큰 반응을 얻었다. 논점은 ①"552B짜리를 여전히 Flash라 부를 수 있나"는 로컬 배포 부담 지적, ②기존 프로덕션에서 쓰던 모델 식별자(id) 뒤에서 모델을 교체하면 회귀 테스트가 무효화된다는 실무적 우려, ③오픈웨이트 저가 모델이 폐쇄형 벤더와의 격차를 계속 좁혀 "80~90%의 소프트웨어 작업(로그 파싱, 엔티티 추출, 함수 호출 등)에 10배 비싼 폐쇄형 모델을 쓸 경제적 근거가 사라지고 있다"는 관찰, ④DeepSeek 기술 문서가 세부 사항을 상세히 공개하는 것과 대비되는 다른 벤더들의 관행.

## 인상 깊은 문장

*(WebFetch·WebSearch 모두 DeepSeek 공식 발표문의 완전한 원문 문장을 인용 가능한 형태로 반환하지 않았다. 2차 보도의 수치·기술 용어 요약만 확보했다 — "Terminal-Bench 3.0: 43.3 대 30.0", "Terminal-Bench 4.0: 51.8 대 31.2"라는 대비 수치 자체가 이 노트에서 가장 정직하게 인용할 만한 "문장"이다.)*

## 댓글

GeekNews(id=33477) hada 댓글 수는 이번 세션 egress 차단으로 확인하지 못했다. 반면 **HN 반응은 이례적으로 규모가 크게 확인됐다** — 409포인트·214댓글(WebSearch 요약 기준, 원문 대조는 못 함). **이해관계**: 1차 발표 소스가 DeepSeek 자사 공식 블로그이므로 벤치마크 선택 자체가 유리한 지표(DeepSWE 1.1) 위주일 가능성이 있고, 이 노트가 대비시킨 Terminal-Bench 열세 수치도 DeepSeek이 자체 발표에 포함시킨 것이라는 점(즉 불리한 수치를 스스로 공개했다는 점)은 오히려 투명성 측면에서 긍정적으로 읽을 수 있다. VentureBeat 같은 매체의 "Opus 5·GPT-5.6 Sol을 능가" 식 헤드라인은 이 다면적 그림을 단순화한 것으로 보여 그대로 믿지 않는 게 안전하다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 세션이 이미 정리한 V4-Flash 계열의 정확한 후속, "MoE 활성 파라미터 비율을 먼저 확인하라"는 원칙이 이번엔 입력·출력으로 쪼개져 더 정교해졌다

[[2026-08-02-deepseek-v4-flash-release]]에서 확립한 습관 — "MoE 모델을 평가할 때는 총 파라미터가 아니라 활성 파라미터 비율을 먼저 본다" — 이 이번엔 한 단계 더 세분화해야 한다는 걸 보여준다. V4-Flash는 활성 파라미터가 130억으로 단일 수치였지만, V4.1-Flash는 **입력 80억 / 출력 160억으로 아예 분리**했다. 이건 단순 규모 축소가 아니라 "긴 입력을 반복 훑는 작업(에이전트의 도구 호출 루프)"과 "출력을 생성하는 작업"의 비용 구조가 다르다는 걸 아키텍처 차원에서 인정한 설계다 — 앞으로 MoE 모델을 볼 때 "활성 파라미터가 몇 개인가"뿐 아니라 "입력·출력에 서로 다른 활성 파라미터를 쓰는가"까지 확인해야 서빙 비용을 제대로 추정할 수 있다.

### 핵심 전이 2 — [[2026-08-08-deepseek-v4-flash-arc-agi-results]]가 강조한 "벤더 자체 발표 vs 독립 재단 검증"의 구분이 이번에도 그대로 필요하다

그 노트는 ARC Prize 재단이라는 독립 기관이 V4-Flash를 직접 측정했다는 점에서 예외적으로 신뢰도 높은 사례였다. 이번 V4.1-Flash는 그 반대다 — Terminal-Bench·DeepSWE 수치 전부가 **DeepSeek 자신이 실행한 평가**이고, 이 노트를 작성하는 시점에 ARC Prize류의 독립 재검증은 확인되지 않았다. 게다가 그 자체 평가 안에서도 지표별로 결과가 엇갈린다(DeepSWE 우위, Terminal-Bench 열세)는 게 오히려 "벤더가 스스로 불리한 수치도 공개했다"는 점에서 최소한의 정직성 신호로 읽을 여지는 있다 — 다만 독립 검증이 나오기 전까지는 "GPT-5.6 Sol·Opus 5를 능가"라는 매체 헤드라인을 그대로 받아들이면 안 된다.

## 호스피탈리티 / CRS 적용 포인트

- **KV 캐시·SSD 비용 절감 아키텍처는 "긴 대화·도구 실행 기록을 유지하는 에이전트"라는 조건이 CRS 운영 지원 에이전트(장기 세션으로 여러 채널·여러 예약을 오가며 조사하는 봇 등)와 맞닿는 지점이 있다** — 다만 이게 온다가 자체 호스팅할 가능성이 있는 시나리오에서만 의미가 있고, API로 소비하는 입장이라면 이 아키텍처 디테일 자체는 체감 차이가 크지 않을 수 있다.
- **"552B를 여전히 Flash라 부를 수 있나"는 HN 지적은 로컬/온프레미스 배포를 검토할 때 그대로 적용된다.** 활성 파라미터가 작아도 전체 가중치를 메모리에 올려야 한다면 서빙 인프라 요구사항은 총 파라미터 규모를 따라간다 — 온다가 오픈웨이트 모델의 자체 호스팅을 검토한다면 "활성 파라미터가 작다"는 마케팅 문구만 보지 말고 총 파라미터 기준 인프라 요구사항을 별도로 확인해야 한다.
- **"프로덕션 모델 식별자 뒤에서 모델을 교체하면 회귀 테스트가 무효화된다"는 HN의 지적은 CRS가 특정 LLM API를 프로덕션에 물려둔 경우 그대로 위험 요인이다.** 벤더가 같은 API 엔드포인트 뒤에서 모델을 조용히 교체(V4-Flash→V4.1-Flash류)할 수 있다면, CRS 쪽에서도 모델 버전을 고정하거나 교체 시 회귀 테스트를 다시 돌리는 절차가 필요하다는 원칙 정도는 전이 가능하다. 다만 이 이상의 직접 적용(온다가 실제로 DeepSeek API를 CRS에 쓰는지)은 확인된 바 없다.

## 연관 자료

- [[2026-08-02-deepseek-v4-flash-release]] — 직계 전작. "MoE 활성 파라미터 비율을 먼저 확인하라"는 습관이 이번엔 입력·출력 분리로 더 정교해짐
- [[2026-08-08-deepseek-v4-flash-arc-agi-results]] — "벤더 발표 vs 독립 재단 검증"의 구분 기준을 세운 노트, 이번 V4.1-Flash 수치는 독립 검증이 아직 없다는 대조점

## 한 달 뒤 회고

*(2026-10-11 즈음 — deepseek.com·news.hada.io 접근이 풀리면 공식 발표문 원문을 직접 확인. ARC Prize 재단류의 독립 벤치마크 검증이 V4.1-Flash에도 나왔는지, "552B를 Flash라 부르는 게 맞나"는 HN 논쟁이 실제 로컬 배포 사례로 이어졌는지, V4-Pro 단종에 따른 실사용자 반응을 점검.)*
