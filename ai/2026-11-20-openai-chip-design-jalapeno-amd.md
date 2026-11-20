---
title: "OpenAI 모델을 활용한 칩 설계 개선 (OpenAI) — 벡터 유닛 13%, 행렬 유닛 10% 면적을 줄인 RTL이 실제 양산 설계에 들어갔다"
source_title: "Advancing chip design with our models"
source_url: "https://openai.com/index/advancing-chip-design-with-our-models/"
source_name: "OpenAI (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=37441"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "ai"
tags: ["openai", "chip-design", "rtl", "ppa", "jalapeno", "amd"]
---

# OpenAI 모델을 활용한 칩 설계 개선 (OpenAI)

> 출처: [Advancing chip design with our models](https://openai.com/index/advancing-chip-design-with-our-models/) (OpenAI) · [GeekNews](https://news.hada.io/topic?id=37441) 경유 · 정리일 2026-11-20
>
> **출처 한계**: 핵심 수치는 ***OpenAI 자체 발표***이며 기준선은 AMD의 숙련 엔지니어 설계다. AMD의 "독립 검증"도 AMD 자체 검증이라 완전한 제3자 검증은 아니다. 벡터/행렬 유닛 블록명이 소스 간 일부 불일치한다.

## 한 줄 요약

**OpenAI는 자체 추론 칩 Jalapeño와 AMD 칩의 회로를 자사 모델로 재작성해 표준 셀 면적을 약 10~13% 줄였고, 일부 변경은 실제 AMD 양산 설계에 반영돼 OpenAI가 작성한 RTL이 파운드리로 간 첫 사례가 됐다.**

## 핵심 포인트

- OpenAI는 AI 모델을 활용해 자체 추론 칩 **Jalapeño**(Broadcom 협력)와 AMD 칩의 회로를 개선했으며, 실제 제품 설계에서 ***전력/성능/면적(PPA) 개선***을 확인했다.
- Jalapeño에서는 모델이 제안한 변경으로 표준 셀 면적이 ***벡터 유닛 약 13%, 행렬 유닛 약 10%*** 줄어든 것으로 추산되며, 실제 실리콘 초기 구동 과정에서도 최적화를 검증했다.
- AMD의 주력 GPU IP에서는 고도로 최적화된 기준 설계 대비 ***최대 14%의 PPA 개선***을 달성했으며, 일부 변경은 ***제조에 넘긴 설계에 이미 반영***됐다 — OpenAI가 작성한 RTL이 AMD 설계 안에 들어가 파운드리로 간 첫 사례로 소개된다.
- AMD 플래그십 CPU 주요 블록에서도 AMD가 독립적으로(자체 검증이라는 전제에서) 한 자릿수% PPA 개선을 확인했다.
- 방법: 모델이 회로를 기술하는 SystemVerilog RTL 코드를 재작성하고, Synopsys 툴로 동작 보존을 검증한다. 전용 모델 "GPT-Synopsys" 훈련도 언급된다.

## 인상 깊은 문장

> (OpenAI 공식 발표의 정확한 1차 인용은 추가 확인이 필요하다 — "모델이 제안한 변경"이라는 표현 수준으로 확보했다.)

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: 수치는 OpenAI와 AMD 양측 모두 이해관계자이고 독립 제3자의 재검증은 찾지 못했다. 벡터/행렬 유닛 블록명이 소스 간 일부 불일치한다.

## 내 생각 · 적용점

### 핵심 전이 — "AI가 검증 가능한 영역에서 전문가 설계를 보조한다"는 레포의 반복되는 결

[[2026-06-28-ai-rfic-chip-design]]와 [[2026-10-07-opentpu-ai-designed-fpga-accelerator]]가 같은 "AI가 칩/하드웨어 설계를 돕는다" 계열이다. 이번 글의 특이점은 "모델이 쓴 RTL이 실제 양산 설계에 반영된 첫 사례"라는 것 — 이전 사례들이 주로 실험·연구 단계였다면, 이번은 실제 제품에 들어간 사례라는 점에서 성숙도가 한 단계 더 나아간 증거다.

### 적용점

반도체 설계 자체는 적용점이 없지만, "Synopsys 같은 기존 검증 툴로 동작 보존을 검증한 뒤에만 AI 제안을 반영한다"는 구조는, AI가 생성한 변경을 기존 검증 파이프라인에 통과시켜야만 신뢰할 수 있다는 일반 원칙으로 가져올 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 반도체 설계는 온다 도메인과 직접 접점이 없다. "AI가 검증 가능한 영역에서 전문가 설계를 보조한다"는 원칙만 참고할 수 있다.

## 연관 자료

- [[2026-06-28-ai-rfic-chip-design]] — 같은 "AI+칩 설계" 계열
- [[2026-10-07-opentpu-ai-designed-fpga-accelerator]] — 같은 "AI+하드웨어 설계" 계열

## 한 달 뒤 회고

2026-12-20 즈음 — 독립 제3자의 PPA 개선 재검증이 나왔는지, "GPT-Synopsys" 전용 모델의 진척이 있는지 점검.
