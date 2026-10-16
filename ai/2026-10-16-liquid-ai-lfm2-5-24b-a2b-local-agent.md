---
title: "LFM2.5-24B-A2B (Liquid AI) — 240억 파라미터 중 20억대만 쓰는 로컬 에이전트 모델이, 도구 호출 벤치마크에서 더 큰 Qwen3.6-35B-A3B를 3배 이상 앞섰다고 자체 보고했다"
source_title: "Liquid AI Releases LFM2.5-24B-A2B for Local AI Workflows"
source_url: "https://www.techrepublic.com/article/news-liquid-ai-lfm25-24b-a2b-local-ai/"
source_name: "TechRepublic, 복수 2차 매체 교차확인(ecosistemastartup.com, orcarouter.ai)"
referrer_url: "https://news.hada.io/topic?id=35398"
published_at: "2026-10-13 (WebSearch 교차확인)"
summarized_at: "2026-10-16"
category: "ai"
tags: ["liquid-ai", "lfm", "local-ai", "on-device-ai", "moe", "tool-calling", "agentic-model", "open-weights"]
---

# LFM2.5-24B-A2B (Liquid AI)

> 출처: [Liquid AI Releases LFM2.5-24B-A2B for Local AI Workflows](https://www.techrepublic.com/article/news-liquid-ai-lfm25-24b-a2b-local-ai/) (TechRepublic) · GeekNews(id=35398) 경유 · 정리일 2026-10-16

> **출처 한계**: `news.hada.io`와 `techrepublic.com` 등 1차 소스 모두 이 세션에서 WebFetch가 전면 차단됐다(이 세션은 `en.wikipedia.org`까지 막혀 세션 전체의 egress 제약으로 판단한다). WebSearch로 TechRepublic 기사 요지와 스페인어 2차 보도(ecosistemastartup.com)·orcarouter.ai를 교차확인했다. 아키텍처(24B 중 활성 파라미터)는 매체 간 "약 2.45B"와 "약 2B"로 소폭 다르게 보도돼 그대로 밝혀둔다. Slack 발췌의 AutomationBench 수치(Qwen3.6-35B-A3B 8.72점 대비 27.69점)는 이번 WebSearch에서 직접 재확인하지 못했지만, WebSearch가 찾은 또 다른 벤치마크(LiveClaw, Liquid AI 자체 보고: 48.09 대 38.19)는 ***같은 방향(LFM2.5가 더 큰 비교 모델을 앞선다)의 독립적 수치***라 정합성은 있다. 다만 둘 다 벤더 자체 보고이고, "당시 제3자 독립 평가가 없었다"는 점도 한 매체가 명시적으로 지적했다.

## 한 줄 요약

**Liquid AI가 기기 안에서 빠르게 도구를 호출하고 여러 단계의 작업을 수행하도록 설계한 공개 가중치 모델 LFM2.5-24B-A2B를 2026-10-13 공개했다 — 전체 240억 파라미터 중 토큰당 약 20~24.5억 개만 활성화하는 MoE 구조로, 최종 답변 전에 사고 과정을 생성하며 컨텍스트를 이전 버전 대비 4배인 131,072토큰으로 확대했다. 사전학습 토큰을 크게 늘리고 OpenClaw·Hermes Agent·Pi·OpenCode 같은 실제 에이전트 실행 환경에서 강화학습으로 후학습했다. 자체 평가에서 도구 호출과 지시 이행에 강점을 보여 AutomationBench 27.69점(Qwen3.6-35B-A3B의 8.72점 대비, Slack 발췌 기준) · LiveClaw 48.09점(같은 비교 모델의 38.19점 대비, WebSearch 교차확인 기준)을 기록했다고 주장하지만, 지식 중심 작업과 코딩에서는 더 큰 비교 모델들이 여전히 우세하다고 스스로 인정한다.**

## 핵심 포인트

- **아키텍처** — 전체 240억 파라미터, 토큰당 활성 약 20~24.5억(보도마다 ***소폭 다름***) — [[2026-10-08-strands-decider-2b-decision-model]]류의 초소형 판단 모델과는 다른 "완전한 에이전트형 생성 모델"이면서도 활성 파라미터 비율이 매우 낮은 MoE라는 점은 결정 모델 계열의 "생성 대신 채점" 철학과 느슨하게 공명한다.
- **사고 과정 + 긴 컨텍스트** — 최종 답변 전에 ***명시적 사고 과정(chain-of-thought)을 생성***하며, 컨텍스트를 32,768 → 131,072토큰(4배)으로 확대했다. 사전학습 토큰도 크게 늘렸다는데 매체별로 표기 단위가 엇갈려(1.7조/3.3조 또는 17조/33조) ***정확한 스케일은 이번 세션에서 확정하지 못했다.***
- **실제 에이전트 환경에서 후학습** — OpenClaw·Hermes Agent·Pi·OpenCode 같은 ***실제 도구 호출 프레임워크 안에서 강화학습*** — 벤치마크용 합성 데이터가 아니라 실행 환경 자체를 학습 루프에 넣었다는 게 차별점이다. [[2026-10-15-opencode-2-0-code-mode-background-agents]]가 다룬 바로 그 OpenCode를 학습 환경으로 쓴다는 점에서 가든의 또 다른 노트와 접점이 있다.
- **벤치마크** — AutomationBench 27.69점(Qwen3.6-35B-A3B의 8.72점 대비, Slack 기준) · LiveClaw 48.09점(같은 비교 모델의 38.19점 대비, WebSearch 기준) — ***두 벤치마크 모두 벤더 자체 보고***이고 독립 재현은 확인되지 않았다. 지식 중심 작업·코딩에서는 더 큰 비교 모델이 우세하다는 점을 Liquid AI 스스로 명시한다.
- **하드웨어 문턱** — Q4_K_M 양자화 기준 약 14.5GB(3자 추정치) — 소비자 GPU 한 장이나 통합메모리 맥에서도 충분히 돌아갈 수준으로, [[2026-09-22-m5-ultra-mac-studio-review-local-ai-agents]]급 하드웨어까지는 필요 없는 체급이다.

## 인상 깊은 문장

> (WebSearch 스니펫 재구성) "no third party had independently scored the checkpoint when it was written." — 벤더 자체 벤치마크 외 독립 검증 부재를 명시한 한 매체의 지적

## 댓글

**hada 댓글 수 확인 불가.** 2차 보도가 스페인어·독일어·베트남어 등 다국어로 거의 동시에 번역돼 퍼진 걸 보면(orcarouter.ai 등) 업계 관심도는 있는 편으로 보이나, HN/Lobsters 자체 큐레이션 여부는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "로컬 AI 대전환" 명제에 가장 구체적으로 들어맞는 사례

[[2026-10-12-local-ai-models-cloud-shift-catalyst]]가 주장한 "MoE가 소비자 하드웨어에서도 대전환을 가능케 한다"는 명제에 가장 구체적으로 들어맞는 사례다 — 다만 그 노트 자체가 1차 소스를 확보 못한 추정성 글이었던 데 비해, 이번 LFM2.5는 TechRepublic 등 복수 매체가 사실관계(파라미터·컨텍스트·공개일)를 비교적 일관되게 보도해 신뢰도가 더 높다.

### 핵심 전이 2 — 전용 소형 엔진들의 조합이냐, 범용 로컬 에이전트 모델 하나냐

[[2026-09-29-nobodywho-on-device-inference-engine]]·[[2026-09-10-desert-ant-labs-local-ai-models]]가 "함수 시그니처만 읽고 도구 호출 문법을 자동 생성"하거나 "클라우드 API 호출을 로컬 소형 모델로 대체"하려 했던 방향과 LFM2.5는 ***모델 하나로 도구 호출·에이전트 실행을 통째로 끌어안으려 한다는 점에서 체급이 다르다*** — 전용 소형 엔진들의 조합이냐, 범용 로컬 에이전트 모델 하나냐의 갈림길에서 이번 글은 후자를 택한 사례다.

### 핵심 전이 3 — 실제 실행 환경 강화학습이 과신 문제의 답이 될 수 있을까

"실제 에이전트 실행 환경에서 강화학습"이라는 후학습 방식은, [[2026-10-12-qwen-decision-model-build]]가 보여준 "정적 벤치마크의 신뢰도 과신" 문제에 대한 하나의 답일 수 있다 — 다만 그 답이 실제로 calibration 문제를 해결하는지는 벤더 자체 보고로만 알 수 없고, 가든이 이미 반복해온 "독립 검증 부재" 패턴이 여기서도 그대로 재현된다.

## 호스피탈리티 / CRS 적용 포인트

로컬에서 도구 호출·다단계 작업을 수행하는 소형 에이전트 모델이라는 점에서, 예약·문의 처리 파이프라인의 일부(PII가 외부로 나가지 않아야 하는 분류·라우팅 작업)를 자체 호스팅으로 돌리는 후보가 될 수 있다 — [[2026-09-29-jeff-jev-compatible-decision-model]]이나 [[2026-09-28-glm-5-3-flash-jev-like-decision-model]]이 이미 짚은 "고객 문의 데이터를 외부로 안 보내는" 동기와 같은 선상이다. 다만 지식 중심 작업·복잡한 코딩에서는 더 큰 모델이 우세하다는 벤더 자신의 인정을 감안해, CRS 적용 전 과제별 실측이 선행돼야 한다는 원칙은 유지한다.

## 연관 자료

- [[2026-10-12-local-ai-models-cloud-shift-catalyst]] — "로컬 AI 대전환" 명제, 이 글이 가장 구체적인 실증 사례로 보강
- [[2026-09-29-nobodywho-on-device-inference-engine]] — 전용 소형 엔진 조합 접근, LFM2.5의 범용 모델 접근과 대비
- [[2026-09-10-desert-ant-labs-local-ai-models]] — 클라우드 API를 로컬 소형 모델로 대체하려는 같은 동기, 다른 체급
- [[2026-10-15-opencode-2-0-code-mode-background-agents]] — LFM2.5의 후학습 실행 환경 중 하나(OpenCode)를 다룬 선행 노트
- [[2026-10-12-qwen-decision-model-build]] — 정적 벤치마크의 과신 문제, 이 글의 실제환경 강화학습이 답이 될 수 있는지는 미확인
- [[2026-09-29-jeff-jev-compatible-decision-model]]·[[2026-09-28-glm-5-3-flash-jev-like-decision-model]] — 고객 데이터를 외부로 안 보내려는 같은 동기의 다른 체급 사례

## 한 달 뒤 회고

*(2026-11-16 즈음 — ①독립 3자(Artificial Analysis 등)의 LFM2.5 재평가가 나왔는지, ②사전학습 토큰 수 단위 혼선이 공식 모델카드로 해소됐는지, ③OpenCode·Hermes Agent 등에서 실사용 사례가 보고됐는지 점검.)*
