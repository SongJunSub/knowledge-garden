---
title: "Laya, Mac에서 오프라인으로 실행하는 실시간 의사결정 AI (mizorewww/laya-coreml) — M3 Max Neural Engine에서 짧은 질문 하나를 약 5ms에 처리한다"
source_title: "Laya-CoreML port hits 4.98 ms decisions on M3 Max Neural Engine"
source_url: "https://github.com/mizorewww/laya-coreml"
source_name: "mizorewww (GitHub, OSS, Laya의 Core ML 이식판)"
referrer_url: "https://news.hada.io/topic?id=34033"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "ai"
tags: ["jev", "laya", "core-ml", "apple-silicon", "neural-engine", "system-one-model", "offline-inference"]
---

# Laya, Mac에서 오프라인으로 실행하는 실시간 의사결정 AI (mizorewww/laya-coreml)

> 출처: [laya-coreml (GitHub)](https://github.com/mizorewww/laya-coreml) · GeekNews(id=34033) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "같은 실험의 MLX 구현…"에서 잘림)와 WebSearch로 확보한 GitHub 저장소, PyPI(`laya-coreml`), Hugging Face 모델 카드, Hacker News·AlphaSignal 등 2차 보도를 교차해 재구성했다.

## 한 줄 요약

**Jev의 오픈소스 대안 Laya를 Apple Silicon의 Core ML·Neural Engine에서 실행하는 이식 프로젝트가 공개됐다 — 모델을 한 번 내려받으면 네트워크 없이, M3 Max에서 짧은 질문 하나를 약 5ms에 처리한다.**

## 핵심 포인트

- **오프라인·로컬 실행 — 네트워크 없이 판단** — Jev의 오픈소스 대안인 Laya를 Apple Silicon에서 실행하는 Core ML 이식 프로젝트로, ***모델을 한 번 내려받으면 네트워크 없이 판단을 수행***한다.
- **텍스트 생성이 아니라 확률·점수 반환 — Jev와 동일한 설계 철학** — 문장을 한 토큰씩 생성하는 대신 ***선택지별 확률, 순서형 점수와 참일 확률을 반환***해, 긴 답변보다 빠른 선택이 필요한 작업에 활용한다. 이는 가든이 이미 여러 노트에서 확인한 Jev/System One Model의 핵심 설계(`Noul`/`Choice`/`Score` 타입 반환)와 동일하다.
- **밸 게임 데모 — 초당 약 49~50회 판단** — 밸 게임 데모에서 이동 방향을 고르고 선택 확률과 지연시간을 표시하며, 저장소의 게임 루프 측정에서는 ***초당 약 49~50회 판단***을 처리한다.
- **M3 Max에서 5ms — MLX 대비 에너지 효율 개선** — M3 Max의 Neural Engine에서 짧은 질문 하나를 약 5ms에 처리했다(WebSearch로 정확한 수치 확인: ANE L96 FP16 런타임 4.98/5.31ms P50/P95). 같은 실험의 MLX 구현(별도 저장소 `laya-mlx`) 대비 ***시스템 전체 에너지 소비가 2.78~3.19배 개선***됐다는 벤치마크가 함께 공개됐다.

## 인상 깊은 문장

> "Local Laya typed decisions on Apple Core ML and Neural Engine. Validated ports, ~5 ms short decisions on M3 Max, reproducible speed and energy benchmarks."
> (GitHub 저장소 설명 원문)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: Laya 자체가 이미 [[2026-09-20-laya-open-source-jev-alternative]]에서 확인했듯 "제3자 검증은 아직"이라는 한계를 안고 있는 모델인데, 이번 Core ML 이식판은 그 위에 또 한 겹(이식 과정에서의 정확도 손실 여부)을 더한다. 이식 시 원본 모델과 동일한 판단 정확도를 유지하는지에 대한 검증은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — Jev 계열 노트에 "온디바이스 실행"이라는 새 갈래가 추가됨

이 노트로 가든의 Jev/System One Model 계열 노트는 8개로 늘었다 — [[2026-09-16-typesafe-ai-jev-typed-judgments]](launch), [[2026-09-18-jevlike-open-source-jev-probability-model]], [[2026-09-20-jevs-architecture-unmasked]], [[2026-09-20-jev-evaluates-every-essay-in-0-7-seconds]], [[2026-09-20-jev-structured-output-interesting-again]], [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-jev-field-guide-system-one-model]]. [[2026-09-21-jev-field-guide-system-one-model]]이 짚었듯 "HN의 '닷새면 재구현된다'는 예언은 Jevlike와 Laya로 실현됐다"는 흐름이 이번엔 한 단계 더 나아가 **클라우드 API 없이 로컬 기기에서 실행**하는 지점까지 도달했다 — Jev가 관리형 서비스로서 팔던 "0.4초의 속도" 경쟁우위가, 오픈소스 파생판의 온디바이스 실행(네트워크 지연 자체가 0인)으로 정면 도전받는 흐름으로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 다루는 실시간 판단(예: 프런트데스크 단말에서의 빠른 승인/거절, 오버부킹 알림 트리거)처럼 네트워크 지연조차 허용하기 어려운 온프레미스 환경에 참고할 만하다. 다만 Laya 자체의 정확도가 아직 제3자 검증되지 않았다는 [[2026-09-20-laya-open-source-jev-alternative]]의 경고가 이 이식판에도 그대로 적용되므로, 실제 도입 전에 자체 데이터로 정확도 검증이 필수다.

## 연관 자료

- [[2026-09-20-laya-open-source-jev-alternative]] — Laya 원본 모델의 성능 주장과 제3자 검증 부재 경고
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 계열의 가장 깊은 해설 노트, "닷새면 재구현" 예언과의 직접 연결

## 한 달 뒤 회고

*(2026-10-21 즈음 — 이식 과정에서 원본 대비 정확도 손실이 있었는지, MLX 구현과의 상세 비교 수치를 확인.)*
