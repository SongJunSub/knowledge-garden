---
title: "AI Infra Summit 2026: LPU가 제시하는 AI 추론 비용 해법 (하이퍼엑셀) — GPU 대신 추론 전용 반도체로 전력·토큰당 비용을 낮춘다"
source_title: "AI Infra Summit 2026: 늘어나는 AI 추론 비용, LPU가 제시하는 새로운 해법"
source_url: "https://hyper-accel.github.io/posts/ai-infra-summit-review/"
source_name: "하이퍼엑셀 (hyper-accel.github.io)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "ai"
tags: ["lpu", "ai-infra", "inference-cost", "hyperaccel", "sovereign-ai", "hardware"]
---

# AI Infra Summit 2026: LPU가 제시하는 AI 추론 비용 해법 (하이퍼엑셀)

> 출처: [AI Infra Summit 2026: 늘어나는 AI 추론 비용, LPU가 제시하는 새로운 해법](https://hyper-accel.github.io/posts/ai-infra-summit-review/) (하이퍼엑셀 블로그) · Slack TechArticles 경유 · 정리일 2026-11-18
>
> **출처 한계**: `hyper-accel.github.io`는 이 세션에서 egress 차단(`getaddrinfo ENOTFOUND`). WebSearch로 하이퍼엑셀이 2023년 KAIST 김주영 교수가 설립한 실재 AI 반도체 팹리스 스타트업이고, 데이터센터용 LPU 가속기 'Bertha'(H100 대비 약 1/10 가격 주장)와 온디바이스용 'Bertha-Edge'를 만든다는 사실은 교차확인했다. 2026년 11월 17~19일 시카고 SC26에서 LPU 기반 AI 추론 서버를 전시한다는 보도도 확인했다. 다만 이 글이 언급하는 "AI Infra Summit 2026" 자체에 하이퍼엑셀이 실제로 참가·발표했는지는 명확히 확인하지 못했다 — 공식 스폰서 디렉터리엔 등록돼 있으나 2026년 회차 참가를 특정하는 자료는 못 찾았다. 랙스케일 통합시스템·Sovereign AI 관련 세부는 Slack 발췌(문장 끊김)에만 의존한다.

## 한 줄 요약

**AI 추론 비용이 전력·토큰당 비용 양쪽에서 계속 오르는 가운데, 하이퍼엑셀은 GPU 중심 인프라의 한계를 넘어서는 추론 전용 반도체(LPU)로의 전환이 글로벌 시장의 흐름이라고 주장하며, 랙스케일 통합 시스템과 Sovereign AI(자국산 AI 인프라 주권)를 차세대 AI 인프라 전략의 중심으로 제시한다.**

## 핵심 포인트

- **AI 추론 비용 절감의 두 축** — ***전력 효율***과 ***토큰당 비용*** 최적화를 LPU 기술의 핵심 가치로 제시한다.
- **GPU 중심 인프라의 한계 → 추론 전용 아키텍처** — 범용 GPU로 학습·추론을 모두 돌리는 방식에서, 추론만 전담하는 전용 반도체로 전환하는 흐름을 ***글로벌 시장 흐름***이라고 주장한다.
- **랙스케일 통합 시스템 + Sovereign AI** — 차세대 AI 인프라 전략의 중심축으로 두 가지를 제시한다(문장 끊김, 구체 내용 미확인). Sovereign AI는 특정 국가·기업이 외부 클라우드/모델에 의존하지 않고 자체 AI 인프라를 확보하는 흐름을 가리키는 업계 용어로, 한국 반도체 업계에서 자주 쓰는 프레이밍이다.
- **(WebSearch 교차확인)** 하이퍼엑셀은 실재하는 KAIST 출신 스타트업으로, LPU 가속기 'Bertha'(H100 대비 약 1/10 가격 주장, 누적 투자 610억원)와 온디바이스용 'Bertha-Edge'를 개발 중이며, 2026년 11월 SC26(시카고)에서 LPU 기반 추론 서버를 전시한다 — "GPU 한계를 넘는 대안"이라는 메시지는 회사의 일관된 포지셔닝이다.

## 인상 깊은 문장

> (Slack 발췌가 기능/전략 나열 위주로 끊겨 직접 인용할 저자의 표현을 확보하지 못했다 — 원문 미열람으로 인용 생략.)

## 댓글

TechArticles 채널 직공유, GeekNews 경유 아님. 블로그 자체 댓글 확인 불가. **"PASS" 아님을 명시**: 이 글이 다루는 "AI Infra Summit 2026"에 하이퍼엑셀이 실제로 참가했는지조차 독립 확인하지 못했고, 랙스케일/Sovereign AI 전략의 구체 내용도 발췌가 끊겨 확인 못 했다. 다만 회사·제품·"GPU 대안" 포지셔닝 자체는 복수 매체로 교차확인되어 n=1 수준의 홍보성 과장은 아닌 것으로 보인다.

## 내 생각 · 적용점

### 핵심 전이 — 추론 비용 절감은 소프트웨어 레이어에서도, 하드웨어 레이어에서도 동시에 진행 중이다

[[2026-11-10-flide-jev-inference-acceleration]](공통 입력 재사용으로 vLLM·SGLang 대비 최대 9.5배 가속)와 [[2026-11-17-aws-sglang-multimodal-decision-model]](Decode 생략, Prefill Logits만 사용)는 모두 소프트웨어·모델 설계 레이어에서 추론 비용을 줄이는 접근이었다. 이번 하이퍼엑셀 글은 같은 목표(추론 비용 절감)를 하드웨어 레이어(전용 반도체)에서 추구한다는 점에서 대조적이다 — 같은 압력(추론 비용 상승)이 스택의 여러 층에서 동시에 해법을 낳고 있다는 신호로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** LPU·전용 반도체 레이어는 온다가 직접 구매·운영할 계층이 아니라, AWS·Anthropic 같은 벤더가 인프라 선택에서 간접적으로 영향받는 영역이다. 다만 "AI 추론 비용이 하드웨어 레이어에서도 계속 낮아지고 있다"는 거시 흐름은, 중장기적으로 Claude API 등 벤더 비용 구조가 유리해질 수 있다는 배경 정보로만 참고할 만하다.

## 연관 자료

- [[2026-11-10-flide-jev-inference-acceleration]] — 같은 "추론 비용 절감" 목표, 소프트웨어 레이어(상태 분기)
- [[2026-11-17-aws-sglang-multimodal-decision-model]] — 같은 목표, 소프트웨어 레이어(Decode 생략)
- [[2026-09-20-laya-open-source-jev-alternative]] / [[2026-11-17-aws-laya-decision-model]] — 같은 Jev/Decision Model 생태계, 비자기회귀 모델로 추론 비용 절감

## 한 달 뒤 회고

*(2026-12-18 즈음 — hyper-accel.github.io 접속이 가능해져 랙스케일·Sovereign AI 전략의 구체 내용, 그리고 "AI Infra Summit 2026" 실제 참가 여부를 확인했는지 점검.)*
