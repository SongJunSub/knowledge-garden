---
title: "더 나은 모델, 더 나빠진 도구 (Armin Ronacher) — 'Opus 4.8·Sonnet 5가 Claude Code 하네스에 과적합돼 다른 도구 스키마에서 실패한다', strict 모드가 유일한 해결책"
source_title: "Better Models: Worse Tools"
source_url: "https://lucumr.pocoo.org/2026/7/4/better-models-worse-tools/"
source_name: "lucumr.pocoo.org (Armin Ronacher)"
referrer_url: "https://news.hada.io/topic?id=31148"
summarized_at: "2026-07-06"
category: "ai"
tags: ["claude", "tool-calling", "schema", "overfitting", "reinforcement-learning", "strict-mode", "agent-harness", "json-schema", "vendor-lock-in", "pi-editor"]
---

# 더 나은 모델, 더 나빠진 도구 (Armin Ronacher) — 'Opus 4.8·Sonnet 5가 Claude Code 하네스에 과적합돼 다른 도구 스키마에서 실패한다', strict 모드가 유일한 해결책

> 출처: [Better Models: Worse Tools](https://lucumr.pocoo.org/2026/7/4/better-models-worse-tools/) (Armin Ronacher) · 정리일 2026-07-06

## 한 줄 요약

**Claude의 최신 모델(Opus 4.8, Sonnet 5)이 Pi 에디터의 파일 편집 도구를 호출할 때, 스키마에 정의되지 않은 필드(`requireUnique`, `oldText2`, `matchCase` 등)를 임의로 추가하는 회귀 현상이 발견됐다. 저자는 이를 Claude Code라는 폐쇄형 하네스의 평탄한 편집 구조에 모델이 강화학습으로 과적합된 결과로 분석한다 — "약간 잘못된 호출도 보상을 받으면 모델은 그 행동을 학습한다." Strict 모드(스키마 외 키를 애초에 샘플링 못 하게 막음)만이 이 문제를 완전히 해결한다.**

## 핵심 포인트

- **발견된 문제** — Opus 4.8·Sonnet 5가 Pi의 파일 편집 도구 호출 시 스키마에 없는 필드를 추가. 핵심 데이터(`oldText`, `newText`)는 정확했지만 불필요한 필드가 붙음. **다중 턴 대화에서 약 20% 실패율.**
- **과적합 가설** — 구형 모델은 도구 훈련이 제한적이었지만, 신형 모델은 **Claude Code 같은 구체적 하네스에서 강화학습.** Claude Code 편집 도구는 평탄한 구조(`file_path`, `old_string`, `new_string`)인데, 새 모델이 이 구조에 최적화되면서 Pi의 중첩 구조(`edits[]` 배열)에 대응하는 능력이 저하됨.
- **핵심 메커니즘** — "약간 잘못된 도구 호출도 작업을 완료하고 보상을 받을 수 있다면, 모델은 그 행동을 학습한다." 관대한 하네스(Claude Code처럼 Unicode 복구·파라미터 별칭·키 필터링을 해주는)가 오히려 의도치 않은 습관을 강화한다.
- **Strict 모드의 역할** — 비strict 모드: 매개변수 별칭·예상치 못한 키 필터링 등 관대한 처리. **Strict 모드: JSON 스키마를 엄격 적용해 스키마 외 키를 애초에 샘플링하지 못하게 방지** — 이것이 유일하게 완전한 해결책.
- **저자의 입장 변화** — 이전엔 문법 제약 샘플링(grammar-constrained sampling)에 회의적이었으나, "이 버그가 내 사전 판단을 상당히 바꿨다."
- **하네스 설계자를 위한 교훈**:
  1. 도구 스키마는 중립적이지 않다 — 모델이 학습한 형태와 거리가 멀수록 성능 저하
  2. 인코딩 형태(최상위 문자열 vs 중첩 JSON)에 따라 샘플링 난이도가 다름
  3. 관대한 하네스의 보상 구조가 의도치 않은 행동을 학습시킴

## 인상 깊은 문장

> "약간 잘못된 도구 호출도 작업을 완료하고 보상을 받을 수 있다면, 모델은 그 행동을 학습한다."

> "이 버그가 내 사전 판단을 상당히 바꿨다."

## 댓글 — HN + Lobste.rs 전수 확인 (GN⁺ 큐레이션)

- **HN 관점**: 좋은 오류 메시지로 해결 가능하다는 의견 / curl 명령 기반 skill Markdown 파일 활용 사례 / 닫힌 소스 클라우드 LLM 비판 / MOO/MUSH 클라이언트와의 유사성 지적 / 캐시 읽기 비용 절감 방안 / Pi 편집 오류 분류·자동 보정 확장 개발 사례 / **모델별 시스템 프롬프트 필요성** / 의도적 락인 가능성 언급.
- **Lobste.rs 관점**: Fable의 명시적 다운그레이드 알림 정책 언급 / 도구 호출 안정성의 광범위한 영향 / vibecoding vs ai 태그 분류 논의 / **벤더 종속 우려** / 모델이 학습된 환경에서의 최적화 현상 / 긴 문맥에서의 성능 저하 사례 / **강화학습으로 인한 다른 환경에서의 퇴행 현상** 확인.

## 내 생각 · 적용점

### 핵심 전이 1 — 이것이 지난주 정리한 [[2026-06-30-artificial-adventures-ai-tools-reality]]의 근본 원인일 수 있다

지난번 저자가 겪은 "Claude Code/Codex는 형편없다, Pi만 안정적" 평가의 기술적 근거가 바로 이 글이다. **Claude Code 자체 하네스에는 최적화됐지만, Pi 같은 다른 도구 형식에서는 오히려 퇴행하는 현상 — 이는 "어떤 도구가 좋다/나쁘다"의 문제가 아니라 "어떤 하네스에 그 모델이 최적화됐는가"의 문제임을 명확히 한다.**

### 핵심 전이 2 — CRS에서 자체 AI 에이전트 도구를 설계한다면 "Strict 모드"를 기본값으로

CRS·PickMe가 AI 에이전트에게 도구(함수 호출)를 제공할 때, 이 사례는 명확한 실무 지침을 준다: **JSON 스키마 검증을 관대하게(파라미터 별칭 허용, 알 수 없는 키 무시) 설계하면 당장은 편하지만, 장기적으로 모델이 스키마를 벗어나는 습관을 학습하게 만들 위험이 있다.** [[2026-06-30-yagni-hidden-costs]]의 "선택권 비용"과 유사하게, 관대함이 단기 편의와 장기 안정성의 트레이드오프임을 보여준다.

### 핵심 전이 3 — "벤더가 학습한 하네스에 최적화됐다"는 것이 새로운 형태의 락인이다

Lobste.rs 댓글의 "벤더 종속 우려"가 핵심이다. **Anthropic이 Claude Code용으로 모델을 강화학습하면, 그 모델은 자연스럽게 Claude Code 형태의 도구 호출에 가장 뛰어나고 다른 도구(Pi, 커스텀 CRS 에이전트)에는 상대적으로 취약해진다.** 이는 "Claude Code를 계속 쓰는 것이 최선의 선택이 되도록" 구조적으로 유도하는 효과를 낳는다 — [[2026-06-28-physical-media-ownership]]에서 다룬 통제권 문제의 새로운 변주다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-30-artificial-adventures-ai-tools-reality]] — *"Claude Code가 형편없다"는 평가의 기술적 근거를 제공하는 후속 발견*
- [[2026-07-03-agent-autonomy-levels]] — *도구 신뢰성이 자율성 수준 설계의 전제 조건임을 재확인*
- [[2026-06-30-yagni-hidden-costs]] — *"관대한 스키마" 설계의 단기 편의 vs 장기 안정성 트레이드오프*
- [[2026-06-28-physical-media-ownership]] — *벤더 학습 환경 종속=새로운 형태의 통제권 상실*

## 한 달 뒤 회고
*(2026-08-06 즈음 — CRS·PickMe AI 에이전트 도구 설계에 strict 스키마 검증을 적용했는지, Claude Code 외 다른 하네스(Pi 등)에서 도구 호출 안정성을 실제로 비교해봤는지 기록.)*
