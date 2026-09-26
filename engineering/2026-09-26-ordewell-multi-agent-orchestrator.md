---
title: "Ordewell — 코딩 에이전트를 위한 멀티 러너 작업 오케스트레이션 (ordewell) — Paseo·Orca·Proliferate 삼파전에 합류한 네 번째 도구"
source_title: "ordewell/ordewell — Multi-agent task orchestration for coding agents"
source_url: "https://github.com/ordewell/ordewell"
source_name: "GitHub (ordewell/ordewell)"
referrer_url: "https://news.hada.io/topic?id=34290"
published_at: "2026-09-25"
summarized_at: "2026-09-26"
category: "engineering"
tags: ["multi-agent-orchestration", "coding-agents", "claude-code", "codex", "opencode", "developer-tools", "open-source", "vscode-extension"]
---

# Ordewell — 코딩 에이전트를 위한 멀티 러너 작업 오케스트레이션

> 출처: [ordewell/ordewell](https://github.com/ordewell/ordewell) (GitHub) · GeekNews(id=34290) 경유 · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io` egress 차단으로 원문 페이지를 직접 열람하지 못했다. GitHub 저장소 README는 WebFetch로 직접 확인했고(egress 차단 없음), GeekNews 요약 내용은 저장소 설명과 blackas/InsightFlow의 자동 수집 이슈(#1171)로 교차확인했다. hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**Ordewell은 개발 목표 하나를 의존성 그래프가 있는 작업 계획으로 바꿔, 병렬 가능한 작업은 병렬로 Claude Code·Codex·OpenCode 등 서로 다른 러너·모델에 분산 실행시키고 검증까지 맡기는 오케스트레이션 플랫폼이다.** VS Code 확장·TUI·CLI·HTTP API 네 가지 인터페이스를 제공하며, 25개 이상의 API 프로바이더를 인식한다.

## 핵심 포인트

- **플래너가 먼저 저장소를 읽기 전용으로 탐색** — 모호한 목표는 질문으로 명확히 하고, ***실행 전 전부 수정 가능한 계획 파일***을 만든다. 각 작업마다 러너·모델·추론 노력(thinking effort)이 표시된다.
- **의존성 그래프 기반 병렬 실행** — 독립적인 작업은 병렬로, 의존관계가 있는 작업은 순서대로 실행. **작업 완료는 마커 감지 방식**(모델 자기평가 방식이 아님)으로 검증한다.
- **멀티 러너 지원** — Claude Code·Codex·OpenCode 내장 지원 + 플러그인으로 커스텀 CLI 에이전트 통합 가능. 25개+ API 프로바이더(OpenRouter·Anthropic·OpenAI·Gemini·xAI·Groq·DeepSeek 등) 인식.
- **네 가지 인터페이스** — VS Code 확장(실시간 타임라인·TTY 캡처), 터미널 UI(tmux 기반, SSH 지원), CLI(완전 스크립트 가능), 로컬 HTTP API(127.0.0.1:3742).
- **고급 계획 기능** — `/grilling`(최소 3개 질문으로 목표 명확화), `/prd`(제품 명세 작성), `/tdd`(작업 augmentation) 같은 딥 인터뷰형 계획 모드.
- **오픈소스, Apache 2.0** — TypeScript로 완전 오픈소스 구현, `npm install -g ordewell`로 설치.

## 인상 깊은 문장

> "Turn one goal into an ordered plan of tasks — each with its own runner, model and mode — then execute and verify the results." (GitHub 저장소 설명)

## 댓글

**hada 댓글 수 확인 불가**(원문 차단). HN/Lobsters 큐레이션 여부도 확인하지 못했다. 저장소 자체는 직접 열람했으므로 기능 설명의 정확도는 높지만, **실채택 규모나 사용자 후기는 확인하지 못했다** — GitHub README 수준의 자기소개 이상의 검증은 없다는 뜻이다.

## 내 생각 · 적용점

### 핵심 전이 1 — Paseo·Orca·Proliferate 삼파전에 합류한 네 번째 진영

이 가든은 이미 같은 니치("여러 코딩 에이전트를 어떻게 오케스트레이션할 것인가")에서 경쟁하는 세 도구를 추적해 왔다 — [[2026-08-08-orca-parallel-coding-agents-ade]](병렬 worktree+비교·병합, MIT), [[2026-08-08-paseo-coding-agent-orchestrator]](크로스플랫폼+프라이버시, AGPL-3.0), [[2026-09-10-proliferate-parallel-coding-agents-ide]](YC 벤처자금+실제 CLI 바이너리 spawn, AGPL-3.0). Ordewell은 여기에 **"의존성 그래프 기반 계획+마커 검증"**이라는 차별점을 들고 합류한다 — 앞의 세 도구가 주로 "병렬 실행 자체"에 초점을 맞췄다면, Ordewell은 **계획 단계(플래너가 먼저 읽기 전용 탐색+질문)와 검증 단계(마커 감지)를 명시적 1급 기능으로 승격**시킨 점이 다르다. 네 도구가 거의 동시에 같은 문제를 다른 각도로 풀고 있다는 사실 자체가, "여러 에이전트 조율"이 이 시점 개발자 커뮤니티의 뚜렷한 공통 니즈라는 걸 다시 한번 확인해준다.

### 핵심 전이 2 — "마커 감지" 검증 방식은 이 가든이 반복 경고해온 "자기평가 함정"을 피하려는 시도다

[[2026-09-19-harness-design-empirical-study-ablation]]가 지적한 "에이전트는 자기가 만든 테스트를 통과해도 실제 버그를 못 잡는다"는 문제의식과 같은 선상에서, Ordewell은 **작업 완료 여부를 모델의 자기평가가 아니라 명시적 마커 감지**로 판정한다. 완전한 해결책은 아니지만("마커를 찍었다"가 "실제로 올바르게 완료했다"를 보장하진 않는다), 적어도 모델이 스스로 "다 됐다"고 말하는 것을 그대로 믿지 않겠다는 설계 의도는 방향이 맞다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 아직 이르다** — 4개 경쟁 도구(Orca·Paseo·Proliferate·Ordewell) 중 어느 것도 이 가든 기준으로는 충분히 검증된 실채택 사례가 없다. 다만 원칙은 참고할 만하다: 사내에서 여러 코딩 에이전트를 병렬 운용하게 되면 ① 의존성 그래프로 작업을 미리 쪼개고 ② 완료 판정을 모델 자기평가가 아닌 명시적 기준(마커·테스트 통과·리뷰어 승인)으로 못박는 두 원칙을, 어느 도구를 쓰든 먼저 팀 워크플로에 세워두는 것이 순서상 맞다.

## 연관 자료

- [[2026-08-08-orca-parallel-coding-agents-ade]] — 같은 니치의 경쟁 도구, 병렬 worktree+비교·병합(MIT)
- [[2026-08-08-paseo-coding-agent-orchestrator]] — 같은 니치, 크로스플랫폼+프라이버시(AGPL-3.0)
- [[2026-09-10-proliferate-parallel-coding-agents-ide]] — 같은 니치, YC 벤처자금+실제 CLI 바이너리 spawn(AGPL-3.0)
- [[2026-09-19-harness-design-empirical-study-ablation]] — "자기 테스트 통과해도 버그 못 잡는다"는 문제의식, Ordewell의 마커 검증 설계 배경

## 한 달 뒤 회고

*(2026-10-26 즈음 — Orca·Paseo·Proliferate·Ordewell 중 어느 도구가 실제로 더 넓게 채택됐는지, Ordewell의 "마커 감지" 검증이 실사용에서 오탐/누락 없이 작동하는지 사용 후기가 나왔는지 확인.)*
