---
title: "Claude Fable 5.1·Mythos 5.1 출시 (Anthropic) — 벤치마크보다 캐시 읽기 75% 인하가 실질적인 변화다"
source_title: "Introducing Claude Fable 5.1 and Claude Mythos 5.1"
source_url: "https://www.anthropic.com/claude-fable-and-mythos-5-1"
source_name: "anthropic.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=33129"
published_at: "2026-09-01"
summarized_at: "2026-09-02"
category: "ai"
tags: ["claude-fable-5-1", "mythos-5-1", "model-release", "pricing", "prompt-caching", "coding-agent", "cybersecurity-policy", "benchmarks"]
---

# Claude Fable 5.1·Mythos 5.1 출시 (Anthropic) — 벤치마크보다 캐시 읽기 75% 인하가 실질적인 변화다

> 출처: [Introducing Claude Fable 5.1 and Claude Mythos 5.1](https://www.anthropic.com/claude-fable-and-mythos-5-1) (Anthropic 공식 발표) · 정리일 2026-09-02
> **출처 한계**: `news.hada.io`·`www.anthropic.com` 모두 이번 세션 egress 차단됐다. 아래 내용은 Slack 발췌 + WebSearch로 교차검증한 다수 매체를 재구성한 것이다. 핵심 수치는 여러 출처에서 일관되게 재현돼 신뢰도가 높지만, 원문을 직접 대조하지는 못했다.

## 한 줄 요약

**같은 기반 모델에 보호장치만 다르게 씌운 두 모델 — 일반 공개용 Fable 5.1과, 검증된 사이버보안·생명과학 전문가 전용 Mythos 5.1.** 코딩·지식노동·장기 에이전트·과학 연구 성능이 올랐고(Terminal-Bench-Science 0.1: 52.6% — Fable 5 24.7%, Opus 5 29.0%), 근본 원인을 찾는 방향으로 튜닝됐다는 게 발표문 서술이다. 하지만 진짜 헤드라인은 가격이다 — 기본 입출력 가격은 $10/$50로 동일하게 유지하면서, **캐시 읽기 가격을 $1.00 → $0.25/MTok로 75% 인하**했다. Anthropic 자체 추산으로 일반 작업은 약 25%, 에이전트형 작업은 최대 약 45% 저렴해진다.

## 핵심 포인트

- **두 모델, 하나의 기반 모델, 다른 보호장치** — Fable 5.1은 모든 API 고객에게 공개, Mythos 5.1은 Trusted Access Program을 거친 검증된 전문가로 접근이 제한된다.
- **캐시 읽기 75% 인하가 이번 발표의 실질적 핵심** — $1.00 → $0.25/MTok. 일반 작업 약 25%, 에이전트 작업 최대 약 45% 절감.
- **벤치마크** — Terminal-Bench-Science 0.1에서 52.6%.
- **엔터프라이즈 파트너 사례** — Jane Street, Cognition, MongoDB, Datadog, Millennium 등이 초기 파트너로 언급됐다.
- **API 파괴적 변경** — 강제 `tool_choice`(`any`/`tool`)가 400 에러로 막힌다. thinking 블록은 생성한 모델에만 귀속된다.
- **HN 반응은 미미하지만 방향은 긍정적** — 67포인트·댓글 1개, "다른 Claude 모델처럼 정형화된 느낌이 덜하고 훨씬 자연스러운 문체"라고 평함.

## 인상 깊은 문장

> "문제를 임시로 우회하기보다 근본 원인을 찾는 능력을 강화함." (Slack 발췌 원문)

> "sounds a lot less stereotypically like other Claude models, has (imho) a much more natural style." (HN 댓글)

## 댓글

**hada 댓글 수는 확인 불가.** HN 스레드는 67포인트·댓글 1개로 참여가 많지 않다. **한계**: 벤치마크 수치는 전부 Anthropic 자체 측정, 엔터프라이즈 파트너 사례는 벤더가 고른 홍보성 인용, 원문을 직접 열지 못해 매체 간 인용이 갈리는 세부 수치는 검증 유보.

## 내 생각 · 적용점

### 핵심 전이 1 — 이번에도 진짜 축은 성능이 아니라 가격 방어다

[[2026-07-25-claude-opus-5-release]]에서 짚었던 "성능으로 못 벌리면 같은 능력을 더 싸게 준다" 패턴이 이번엔 Fable 라인 내부에서 반복된다.

### 핵심 전이 2 — 캐시 절감은 "말"이 아니라 `cache_read_input_tokens`로 재는 것

[[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]가 강조한 "내 경계의 토큰을 직접 계측하라"가 이번에도 적용된다. "최대 약 45%"는 상한선이지 평균이 아니다.

### 핵심 전이 3 — 강제 `tool_choice` 제거는 조용한 파괴적 변경, 버전업마다 반복되는 교훈

[[2026-07-14-migrating-production-agent-provider-assumptions]]가 강조한 "모델 교체는 한 줄 변경이 아니다"가 이번에도 적용된다.

### 핵심 전이 4 — 두 티어 구조(Fable/Mythos)는 세대가 바뀌어도 그대로

이게 일회성 실험이 아니라 Anthropic의 표준 배포 방식으로 굳어졌다는 뜻이다.

## 호스피탈리티 / CRS 적용 포인트

- **캐시 비용 재계산은 직접 참고 가치가 있다.** 시스템 프롬프트·툴 정의가 큰 장기 세션이 있다면, 캐시 읽기 가격 인하를 우리 실제 토큰 믹스에 대입해 월 비용 델타를 뽑아보는 게 가장 빨리 회수되는 작업이다.
- **강제 `tool_choice`를 쓰는 내부 하네스가 있다면 마이그레이션 전 점검 대상.**
- **Mythos 5.1은 온다 맥락에는 직접 적용이 없다.** 억지로 연결하지 않는다.

## 연관 자료
- [[2026-07-25-claude-opus-5-release]] — "가격 곡선 방어" 포지셔닝의 선례
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — 캐시 절감을 실측할 지표
- [[2026-07-14-migrating-production-agent-provider-assumptions]] — 모델 버전업 시 하네스 가정 재점검 습관

## 한 달 뒤 회고
*(2026-10-02 즈음 — 우리 워크로드에서 `cache_read_input_tokens` 기준 실제 절감률이 25~45% 범위에 들었는지, 강제 `tool_choice`를 쓰던 코드가 있었다면 마이그레이션이 매끄러웠는지 기록.)*
