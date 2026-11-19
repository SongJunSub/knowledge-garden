---
title: "Tencent Hy4 Flash, 100만 토큰 컨텍스트의 저비용 멀티모달 모델(GeekNews, 파라미터·성능 수치 출처간 불일치)"
source_title: "Tencent Hy4 Flash release"
source_url: "https://www.eesel.ai/blog/tencent-hy4"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37434"
published_at: "2026-11-19"
summarized_at: "2026-11-19"
category: "ai"
tags: ["tencent", "hy4", "llm-release", "multimodal", "source-limitation"]
---

# Tencent Hy4 Flash, 100만 토큰 컨텍스트의 저비용 멀티모달 모델

> 출처: [Tencent Hy4 Flash](https://news.hada.io/topic?id=37434) (GeekNews) · 정리일 2026-11-19
>
> **출처 한계**: 2026-11-16 출시와 네이티브 멀티모달·100만 토큰 컨텍스트는 교차확인되나, 파라미터 수치("2200억 중 120억 활성" vs 다른 매체의 "총 224B, 활성 12B")와 성능 비교(Tencent 자체 WorkIndex 기준 우위 vs 한 매체의 "오히려 하회" 보도)가 출처마다 상충한다.

## 한 줄 요약

**Hy4 Flash는 KV 캐시 축소와 RL 기반 출력 단축으로 비용을 큰 폭으로 낮췄지만, 성능이 기존 Hy4보다 우위인지는 출처마다 다르게 보도되는 전부 Tencent 자체 평가 기준의 주장이다.**

## 핵심 포인트

- Tencent가 Hy4 flash를 2026-11-16 공개했다. 네이티브 멀티모달과 100만 토큰 컨텍스트를 지원한다 — 출시 자체는 교차확인됨.
- API 요금은 100만 토큰당 입력 0.070달러, 출력 0.281달러로 Hy4보다 크게 낮다 — 다만 2026년 11월 30일까지 적용되는 프로모션가일 가능성이 있어 정가인지는 불명확하다.
- 하이브리드 어텐션, LatentMoE, Engram으로 KV 캐시를 Hy4의 1/6로 줄이고, 강화학습으로 평균 종단 간 출력 토큰 수를 50% 줄였다고 소개된다.
- Tencent 내부 WorkIndex 평가에서 Hy4 preview를 소폭 웃돈다는 주장과 달리, ***한 매체는 오히려 Flash가 42.1점으로 Hy4(51.4점)보다 낮다고 보도해 정면으로 상충한다***. 비용은 작업당 Hy4의 1/20이라는 주장도 Tencent 자체 평가 기준이다.
- 가중치 공개 여부·일정·라이선스도 소스마다 다르게 서술된다.

## 인상 깊은 문장

> "장시간 코딩 작업에는 Flash 대신 Hy4를 쓰라"고 Tencent가 직접 권고한다는 보도 — 저비용 모델의 성능 트레이드오프를 벤더 스스로 인정한 셈이다.

## 댓글

GeekNews 댓글 수는 확인하지 못했다(원문 미확인). 성능 우위 주장이 Tencent 내부 평가(WorkIndex)에 전적으로 의존하고, 외부 매체 중 하나는 오히려 반대 결론을 보도한다는 점에서 **벤더 자체 벤치마크를 그대로 받아쓰지 않는 게 중요**하다는 걸 다시 확인한다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 Hy4 계보의 세 번째 기록

레포에는 이미 [[2026-08-30-tencent-hy4-preview-release]](프리뷰)와 [[2026-11-05-tencent-hy4-official-release-visual-computer-use]](정식 공개, 컴퓨터 조작 소구점)가 있다. 이번 Flash는 같은 계보의 "저비용 경량 티어" 추가로, Hy4 시리즈가 성능 경쟁에서 가격 경쟁으로 소구점을 넓혀가는 흐름을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 벤더 비교 시 "장시간 코딩에는 쓰지 말라"는 벤더 스스로의 권고처럼, 저비용 티어 모델을 쓸 때는 적용 범위를 벤더가 명시한 한계 안으로 제한해야 한다는 원칙만 참고할 수 있다.

## 연관 자료

- [[2026-08-30-tencent-hy4-preview-release]] — 같은 Hy4 계보, 프리뷰 단계
- [[2026-11-05-tencent-hy4-official-release-visual-computer-use]] — 같은 Hy4 계보, 정식 공개(컴퓨터 조작)

## 한 달 뒤 회고

2026-12-19 즈음 — Hy4 Flash의 정가(프로모션 종료 후)와 WorkIndex 외 독립 벤치마크 결과를 재확인.
