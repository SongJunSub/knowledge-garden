---
title: "Qwen 3.8 27B, Cerebras에서 초당 1,500토큰 — Sol Ultrafast(750tok/s)를 두 배 웃도는 오픈 가중치 dense 모델의 추론 속도"
source_title: "Qwen 3.8 27B available on Cerebras at 1500 tok/sec"
source_url: "https://www.cerebras.ai"
source_name: "Cerebras (공개 API 카탈로그)"
referrer_url: "https://news.hada.io/topic?id=33201"
published_at: "2026-09-04"
summarized_at: "2026-09-04"
category: "ai"
tags: ["cerebras", "qwen", "inference-speed", "open-weights", "dense-model", "multimodal", "wafer-scale"]
---

# Qwen 3.8 27B, Cerebras에서 초당 1,500토큰

> 출처: [Qwen 3.8 27B available on Cerebras at 1500 tok/sec](https://www.cerebras.ai) (Cerebras 공개 API 카탈로그 · GeekNews 경유) · 정리일 2026-09-04

## 한 줄 요약

**Cerebras가 공개 API에 Qwen 3.8 27B를 추가해 웨이퍼 스케일 엔진으로 약 초당 1,500토큰을 낸다.** 지난달 정리한 Cerebras의 GPT-5.6 Sol Ultrafast Mode(750tok/s)보다 두 배 빠른 수치이지만, 이번엔 훨씬 작은 270억 매개변수 dense 모델이라는 점에서 단순 비교는 조심스럽다. 코딩 에이전트·도구 사용·리서치·장시간 워크플로를 겨냥한 모델로, 텍스트·이미지 입력과 조절 가능한 추론을 지원한다.

## 핵심 포인트

- **속도** — Cerebras 공개 API 카탈로그 등재, **약 초당 1,500토큰** 처리량. 웨이퍼당 SRAM에 가중치를 올려 HBM 대역폭 병목을 우회하는 Cerebras 아키텍처가 여기서도 그대로 적용된다.
- **모델 성격** — 270억 매개변수 **Dense 멀티모달** 모델. 에이전트 코딩·도구 사용·리서치·장시간 워크플로를 겨냥하며 텍스트·이미지 입력, 조절 가능한 추론 수준을 지원.
- **컨텍스트·기능** — 무료 체험은 64K, 종량제는 128K 컨텍스트. 스트리밍, 도구 호출, 병렬 도구 호출, 구조화 출력 지원.
- **원본 무손실 서빙** — 공개 엔드포인트에는 **프루닝하지 않은 원본 모델**을 올리고, 저장 시 일부 가중치만 양자화하며 활성값·어텐션·KV 캐시는 별도 정밀도로 관리한다고 문서화돼 있다.

## 인상 깊은 문장

> "the models served on public endpoints are the original, unpruned versions" (Cerebras 공식 문서)

## 댓글

**출처 한계 명시.** `news.hada.io`·`cerebras.ai` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. WebSearch로 imasters.com, iMasters(포르투갈어), rootclub.it(이탈리아어) 등 다국어 2차 보도가 동일한 핵심 수치(1,500tok/s, 128K 컨텍스트)를 일관되게 재현해 신뢰도는 높다고 판단한다. **HN에 별도 스레드(item id 49554520)가 확인됐으나, 이 세션에서는 점수·댓글 논조까지는 확보하지 못했다.** hada 댓글 수도 미확인이다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]]에서 세운 "무엇의 속도인가" 질문이 그대로 걸린다

그 노트에서 정리한 핵심 원칙 — **토큰 생성 속도 / 응답 시간 / 작업 완료 시간은 전부 다른 값이고, 벤더가 내세우는 배수는 대개 가장 앞의 것을 잰다** — 이 이번에도 유효하다. "1,500tok/s"는 순수 토큰 생성 속도이지, 실제 에이전트 워크로드(도구 호출·검색·사람 승인 포함)의 종단 간 완료 시간이 아니다. 다만 이번엔 그 노트가 짚었던 27억(Sol)급이 아니라 27B라는 훨씬 작은 모델이라, **모델 크기와 온칩 추론 유불리가 함께 작동한 결과일 가능성이 크다** — 그 노트의 전이 5에서 "웨이퍼당 44GB면 모델이 클수록 불리하다"고 정리했던 예측이 이번 사례(27B로 더 빠른 속도)와 방향이 일치한다.

### 핵심 전이 2 — [[2026-08-13-qwen38-2-4t-a95b-open-weights]]와 정반대 크기의 같은 Qwen3.8 패밀리

그 노트가 다룬 Qwen3.8 2.4T A95B는 BF16 기준 5TB, FP8 기준 2.5TB로 서빙 자체가 난제인 초대형 MoE 모델이었다. 이번 27B dense는 같은 세대 이름을 쓰면서도 정반대 극단의 크기다 — **같은 패밀리 내에서 "서빙 난이도"와 "추론 속도"가 크기에 따라 정반대로 갈리는 흐름**이 두 노트를 나란히 놓으면 뚜렷해진다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 제한적이나, 참고할 판단 축은 있다.** 온다 워크로드 중 실시간 응답이 중요한 자리(고객 채팅 응대 등)라면, 대형 프론티어 모델 대신 **이런 소형 dense 모델을 특화된 하드웨어(Cerebras 등)에 올려 지연을 줄이는 선택지**가 점점 현실적인 대안이 되고 있다는 흐름은 눈여겨볼 만하다. 다만 도입 판단 전에는 [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]]에서 정리한 "품질 동등 주장을 벤더 형용사만으로 받아들이지 않는다"는 원칙이 여기서도 그대로 적용돼야 한다 — 우리 골든셋으로 재확인 없이는 속도 수치만으로 판단하지 않는다.

## 연관 자료
- [[2026-08-14-cerebras-gpt-5-6-sol-ultrafast]] — 같은 Cerebras 인프라, "무엇의 속도인가" 질문의 원 논의
- [[2026-08-13-qwen38-2-4t-a95b-open-weights]] — 같은 Qwen3.8 패밀리의 정반대 극단(2.4T MoE vs 27B dense)
- [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]] — 같은 Qwen 계열의 비용 효율 아키텍처 논의

## 한 달 뒤 회고
*(2026-10-04 즈음 — 이 모델의 실제 벤치마크 점수(코딩·도구사용)가 공개됐는지, 가격이 확정됐는지, HN 스레드의 회의적 논점이 무엇이었는지 원문으로 재확인.)*
