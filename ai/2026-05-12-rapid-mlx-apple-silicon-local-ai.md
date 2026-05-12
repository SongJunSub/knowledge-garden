---
title: "Rapid-MLX — Apple Silicon 전용 초고속 로컬 AI 엔진"
source_title: "Rapid-MLX"
source_url: "https://github.com/raullenchai/Rapid-MLX"
source_name: "github.com/raullenchai/Rapid-MLX"
referrer_url: "https://news.hada.io/topic?id=29410"
published_at: "2026-05"
summarized_at: "2026-05-12"
category: "ai"
tags: ["로컬AI", "Apple-Silicon", "MLX", "Ollama-대안", "추론엔진", "OpenAI-API호환", "행동후보"]
---

# Rapid-MLX — Apple Silicon 전용 초고속 로컬 AI 엔진

> 출처: [raullenchai/Rapid-MLX](https://github.com/raullenchai/Rapid-MLX) (2.1k ⭐, Apache 2.0) · 레퍼러: [GeekNews 29410](https://news.hada.io/topic?id=29410) · 정리일 2026-05-12

## 🔖 한 줄 요약
Apple Silicon Mac에서 **Ollama 대비 4.2배 빠른** 로컬 AI 추론 엔진. **OpenAI API 호환 드롭인 대체**로 Claude Code·Cursor·Aider 등에 *즉시 연결 가능*. 어제 정리한 [*로컬 AI가 표준*](2026-05-11-local-ai-needs-to-be-the-norm.md)의 **실행 도구**.

## 🧩 핵심 사실

### 성능 수치 (RAM별)
| 환경 | 모델 | 속도 |
|---|---|---|
| 16GB MacBook Air | Qwen3.5-4B | **160 tok/s** |
| 32GB Mac Mini | Nemotron-Nano 30B | 141 tok/s |
| 64GB Mac Studio | Qwen3.5-35B | 83 tok/s |

- **TTFT 0.08s** (cached) — KV 캐시 트리밍 + DeltaNet 상태 스냅샷 (하이브리드 RNN)

### 핵심 기능
- **17개 도구 호출 파서** — 양자화 모델 품질 저하 시 자동 복구
- **추론 분리** (chain-of-thought 모델의 사고 과정을 별도 필드로)
- **프롬프트 캐싱** — 멀티턴 대화 간 유지
- **스마트 클라우드 라우팅** — 고토큰 요청은 클라우드로 자동 위임
- **비전·음성(TTS/STT)·임베딩** — 옵션 확장

### 통합
- **OpenAI 호환 엔드포인트**: `localhost:8000/v1`
- 네이티브 지원: **Cursor·Claude Code·Aider·PydanticAI·LangChain** 외 9+ 에이전트 프레임워크
- 설치: `brew` / `pip` / 자동 스크립트
- 실행: `rapid-mlx serve qwen3.5-4b`

### 메타
- **라이선스**: Apache 2.0
- **요구사항**: Python 3.10+
- **플랫폼**: Apple Silicon (Intel Mac·Windows·Linux X)

## 💭 내 생각 · 적용점

### 가든 그래프 — *이론 → 도구* 연결
어제([로컬 AI 표준](2026-05-11-local-ai-needs-to-be-the-norm.md))가 *왜* 였다면 오늘은 *무엇으로*. 두 글이 짝:
- 이론: **클라우드 의존 = 제품 본질 변경, 로컬이 답**
- 도구: **Rapid-MLX로 즉시 시작 가능**

가든이 *행동까지 갈 수 있는 형태*로 진화하는 신호.

### *내 노트북에서 즉시 시도 가능*
환경 점검:
- 내 M3 Pro MacBook (32GB RAM) → **Nemotron-Nano 30B @ 141 tok/s** 후보
- 또는 *Qwen3.5-14B 수준*도 충분히 돌아갈 것
- → **이번 주말 실험 슬롯 1번 후보로 격상**

[LLM-from-Scratch 워크숍](2026-05-07-llm-from-scratch-workshop.md)이 *학습 자료* 행동 후보였다면, Rapid-MLX는 **실용 도구** 행동 후보. 둘은 다른 결.

### *OpenAI API 호환 드롭인*이 핵심 변수
이 한 가지 특성이 *도입 비용을 거의 0*으로 낮춘다:
- Claude Code·Cursor·Aider가 *코드 변경 없이* 로컬 모델로 라우팅 가능
- 환경 변수 `OPENAI_API_BASE=http://localhost:8000/v1` 하나로 전환
- → **A/B 테스트가 *분 단위*로 가능**

### MangoLove 적용 — *외부 API 필요한가?* 자문의 실행 도구
어제 도출한 *MangoLove `/strict`에 외부 API 필요한가? 자문 추가* 후보가 *답이 No여도 갈 곳이 있어진다*:
- 단순 변환·요약·분류 = 로컬 (Rapid-MLX)
- 복잡한 추론·코드 생성 = 클라우드 (Claude API)
- *스마트 클라우드 라우팅* = 자동 처리

→ MangoLove의 *로컬 우선 라우팅*이 *실현 가능 옵션*이 됨.

### 호스피탈리티 적용 — *PoC 비용 0*에 가까움

| 시도 | 비용·시간 |
|---|---|
| Rapid-MLX 설치 | brew 한 줄, 10분 |
| OTA 메시지 분류 PoC | 환경 변수 변경 + 기존 코드 그대로 |
| 여권 OCR + 정규화 | 비전 모델 옵션 추가 |
| 운영 리포트 요약 | 캐시 활용으로 0.08s TTFT |

→ **PoC 진입 장벽이 *분기 예산 승인*에서 *오후 한 번*으로 감소**.

### *스마트 클라우드 라우팅*은 중요한 *현실 인정*
로컬 100% 강요 X, *고토큰 요청은 클라우드*로 자동 위임. [Ding의 Camry/Ferrari](2026-05-07-claude-code-not-making-your-product-better.md) 라인 분리가 *자동화*된 형태. **로컬 우선 + 클라우드 폴백**이 현실적 모델.

### 가든 *행동 후보* 결 두 번째 글
- 1번: [LLM-from-Scratch](2026-05-07-llm-from-scratch-workshop.md) — 학습 (우선순위 ★★★)
- **2번: 이 글 (Rapid-MLX)** — **실용** (우선순위 ★★★★)

차이: 학습 워크숍은 *시간 투자 4-8시간*, Rapid-MLX는 *10분 설치 + A/B 즉시 가능*. **우선순위 더 높음**.

### 가든의 *큐레이션 → 실행* 사이클 짧아짐
4월 23일 시작 → 50개 글 누적 → 이제 *행동 후보*가 *명확하고 작은* 형태로 생성. 가든이 *읽기 자산*에서 *행동 트리거*로 진화하는 신호.

### 잠재 위험·반론
- *Apple Silicon 전용* = Windows·Linux 동료는 동등 도구 별도 필요
- *모델 다운로드 용량* = Qwen3.5-4B만 해도 ~3GB
- *벤치마크 수치* = 제조사 공개 — 실제 워크로드에서 검증 필요
- 핵심: ***시도 비용이 너무 낮아서 검증 안 하는 게 손해***

## 🎯 즉시 시도할 액션 3가지
1. **이번 주말 실험 슬롯 — Rapid-MLX 설치 + Qwen3.5-14B 가동** (10분-1시간)
2. **MangoLove `/strict`에 *로컬 우선 라우팅* 후보 도입 검토** — `OPENAI_API_BASE` 환경 변수 전환만으로 가능
3. **CRS Admin 로컬 AI PoC 1개 시범** — OTA 메시지 1차 분류 같은 *Camry 라인* 작업

## 🔗 연관 자료
- [`ai/2026-05-11-local-ai-needs-to-be-the-norm.md`](2026-05-11-local-ai-needs-to-be-the-norm.md) — *이론*: 로컬 AI가 표준이 되어야 한다
- [`ai/2026-05-07-llm-from-scratch-workshop.md`](2026-05-07-llm-from-scratch-workshop.md) — 가든 *행동 후보* 결의 1번
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](2026-05-07-claude-code-not-making-your-product-better.md) — Camry/Ferrari 라인 분리의 *자동 실현*
- [`engineering/2026-05-08-lean-analytics-reconsidered.md`](../engineering/2026-05-08-lean-analytics-reconsidered.md) — *성공 태스크당 비용* 변동 → 고정 전환
- 비교 도구: Ollama, LM Studio, Apple FoundationModels

## 📝 한 달 뒤 회고
- [ ] Rapid-MLX 설치·가동 시도했는가
- [ ] MangoLove에 *로컬 우선 라우팅* 옵션이 들어갔는가
- [ ] CRS·PickMe에서 *Camry 라인 작업*을 로컬로 옮긴 PoC가 있는가
- [ ] *시도 비용 낮음 = 즉시 시도* 원칙이 의사결정에 반영됐는가
