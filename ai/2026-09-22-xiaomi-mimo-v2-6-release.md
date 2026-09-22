---
title: "샤오미, MiMo-V2.6 공개 - 강화학습 과정을 실시간 공개한 멀티모달 모델 (Xiaomi)"
source_title: "Xiaomi open-sources MiMo-V2.6 models after scaling reinforcement learning"
source_url: "https://technode.com/2026/09/22/xiaomi-open-sources-mimo-v2-6-models-after-scaling-reinforcement-learning/"
source_name: "TechNode, WebSearch(VentureBeat·Hugging Face) 교차확인, GeekNews(id=34085) 경유"
referrer_url: "https://news.hada.io/topic?id=34085"
published_at: "2026-09-22(WebSearch 확인)"
summarized_at: "2026-09-22"
category: "ai"
tags: ["xiaomi", "mimo", "open-weights", "reinforcement-learning", "multimodal", "moe"]
---

# 샤오미, MiMo-V2.6 공개 - 강화학습 과정을 실시간 공개한 멀티모달 모델

> 출처: [TechNode](https://technode.com/2026/09/22/xiaomi-open-sources-mimo-v2-6-models-after-scaling-reinforcement-learning/) · GeekNews(id=34085) 경유 · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io` egress 차단으로 원문 직접 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "신…"에서 잘림) + WebSearch(VentureBeat, Hugging Face, KuCoin)로 재구성했다.

## 한 줄 요약

**샤오미가 텍스트·이미지·영상·오디오를 함께 이해하고 코딩·도구 사용·컴퓨터 조작까지 수행하는 멀티모달 모델군 MiMo-V2.6(고성능 Pro, 비용 효율적 Flash)을 공개했다 — Pro는 Artificial Analysis 지능 지수 46점대로 공개 모델 중 최상위권에 올랐고, API 가격은 이전 버전과 동일하게 유지하면서 강화학습 훈련 과정 자체를 실시간으로 공개했다.**

## 핵심 포인트

- **멀티모달 이해 + 코딩·도구 사용·컴퓨터 조작** — 텍스트, 이미지, 영상, 오디오를 함께 이해하고 ***코딩과 도구 사용, 컴퓨터 조작을 수행***하는 모델군으로, 고성능 Pro와 비용 효율적인 Flash를 공개했다.
- **공개 모델 중 지능 지수 최상위권, 가격은 동결** — Pro는 발표 기준 Artificial Analysis 지능 지수 ***46.32점으로 공개 모델 중 1위***를 기록했으며(WebSearch로는 Kimi K3 44점, GLM-5.3 45점 대비 근소 우위로 확인), API 가격은 이전 버전과 동일하게 유지했다.
- **강화학습 진행 상황을 실시간 공개** — ***강화학습 진행 상황을 실시간으로 공개***했으며, 6일 미만의 학습에서 코딩 평가 점수가 Pro는 약 14점, Flash는 약 17점 상승했다.
- **아키텍처와 학습 비용(WebSearch 보강)** — Pro는 총 1.02조 파라미터 중 약 420억 개를 활성화하는 희소 MoE, Flash는 총 309억 파라미터 중 약 150억 개를 활성화하며, 둘 다 ***최대 100만 토큰 컨텍스트***를 지원한다. 약 75만 개의 혼합 강화학습 궤적을 사용했고 학습 비용은 Pro 262만 달러, Flash 85만 달러로 추정된다(WebSearch).
- **MIT 라이선스 + 9B 증류 모델 + 7,000개 이상 RL 환경 공개(WebSearch 보강)** — 가중치를 MIT 라이선스로, ***9B 증류 모델, 기술 보고서, 7,000개 이상의 RL 환경, 학습 프레임워크***까지 함께 공개했다 — 이는 벤치마크 점수 공개를 넘어 재현 가능성을 높이는 드문 개방성이다.
- **에이전트로 3D 게임·발표자료·영상 제작** — 여러 에이전트와 도구를 활용해 ***3D 게임과 Blender 모델, 발표 자료와 영상***을 만드는 시연을 함께 공개했다.

## 인상 깊은 문장

> "MiMo-V2.6-Pro scored 46 on the Artificial Analysis Intelligence Index, ahead of Kimi K3 at 44 and GLM-5.3 at 45."
> (WebSearch, VentureBeat 계열 보도 발췌)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. 벤더 자체 벤치마크(Artificial Analysis는 제3자 지표이지만 샤오미가 유리한 시점에 발표를 골랐을 가능성)와 실제 사용자 체감 성능 사이의 간극은 별도 검증이 필요하다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 "중국 오픈 웨이트 모델 릴리스 러시" 계열에 "학습 과정 자체의 투명성"이라는 새로운 차별화 축을 더함

가든에는 [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]], [[2026-08-29-glm-5-3-open-weights-release]], [[2026-08-13-qwen38-2-4t-a95b-open-weights]] 등 중국발 오픈 웨이트 모델 공개 사례가 계속 쌓이고 있다. 이 글이 더하는 차별점은 ***"최종 가중치만이 아니라 강화학습 진행 과정 자체를 실시간 공개했다"***는 점이다 — 벤치마크 점수 경쟁이 포화 상태에 이르자, "어떻게 그 점수에 도달했는가"라는 과정의 투명성이 새로운 차별화 지점이 되고 있다는 신호로 읽을 수 있다. 이는 [[2026-09-07-artificial-analysis-aaii-v4-2]]가 다룬 벤치마크 지수 자체의 신뢰성 논의와도 연결된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 MIT 라이선스 오픈 웨이트 + 100만 토큰 컨텍스트라는 조합은, 향후 온프레미스 배포가 필요한 CRS 시나리오(고객 데이터를 외부로 보낼 수 없는 환경)에서 후보군으로 검토할 만한 모델 목록에 추가해둘 가치가 있다 — 다만 실사용 전에는 반드시 자체 벤치마크로 검증해야 한다.

## 연관 자료

- [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]] — 같은 계열의 비용 효율적 아키텍처 사례
- [[2026-08-29-glm-5-3-open-weights-release]] — 또 다른 중국발 오픈 웨이트 모델
- [[2026-09-07-artificial-analysis-aaii-v4-2]] — Artificial Analysis 지능 지수 자체에 대한 논의

## 한 달 뒤 회고

*(2026-10-22 즈음 — MiMo-V2.6의 제3자 재현 벤치마크가 나왔는지, 9B 증류 모델의 실사용 평가가 있었는지 확인.)*
