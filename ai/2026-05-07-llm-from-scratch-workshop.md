---
title: "LLM-from-Scratch — 1시간짜리 GPT 학습 워크숍"
source_title: "Train Your Own LLM From Scratch"
source_url: "https://github.com/angelos-p/llm-from-scratch"
source_name: "github.com/angelos-p/llm-from-scratch"
referrer_url: "https://news.hada.io/topic?id=29218"
published_at: "2026-05"
summarized_at: "2026-05-07"
category: "ai"
tags: ["LLM", "GPT", "Transformer", "교육자료", "사이드프로젝트후보", "주말프로젝트"]
---

# LLM-from-Scratch — 1시간짜리 GPT 학습 워크숍

> 출처: [angelos-p/llm-from-scratch](https://github.com/angelos-p/llm-from-scratch) (1.4k★) · 레퍼러: [GeekNews 29218](https://news.hada.io/topic?id=29218) · 정리일 2026-05-07

## 🔖 한 줄 요약
**노트북에서 1시간 안에 ~10M 파라미터 GPT를 직접 만들어보는 워크숍** — Karpathy nanoGPT의 *교육 친화 버전*. 토크나이저 → 트랜스포머 → 학습 → 생성까지 6단계 직접 구현.

## 🧩 워크숍 구성

### 6단계 커리큘럼
| Part | 주제 | 핵심 개념 |
|------|------|-----------|
| 1 | 토크나이저 | 문자 단위 인코딩, vocabulary |
| 2 | 트랜스포머 | embedding, self-attention, layer norm, MLP |
| 3 | 학습 파이프라인 | loss, AdamW, gradient clipping, LR 스케줄 |
| 4 | 텍스트 생성 | temperature, top-k 샘플링, autoregressive decode |
| 5 | 통합·실험 | loss curve, 스케일링 |
| 6 | 콘테스트 | 데이터셋·모델 스케일 탐색 |

### 모델 스펙
| Config | 파라미터 | Layers | Heads | Embed | M3 Pro 학습 시간 |
|--------|---------|--------|-------|-------|------------------|
| Tiny | ~0.5M | 2 | 2 | 128 | ~5분 |
| Small | ~4M | 4 | 4 | 256 | ~20분 |
| **Medium (기본)** | **~10M** | 6 | 6 | 384 | **~45분** |

- 데이터셋: 셰익스피어 텍스트 (문자 단위, vocab 65)
- 의존성: PyTorch + NumPy + tqdm + tiktoken (옵션)
- 자동 GPU 감지: Apple Silicon MPS / NVIDIA CUDA / CPU 폴백
- 환경: Python 3.12+, Mac/Linux/Windows

### 비교 자료
- **Andrej Karpathy nanoGPT** — 원조, 더 압축적
- **Stanford CS336** — 정식 수업 분량
- **Sebastian Raschka — *Build a Large Language Model (From Scratch)*** — 책 형태

### 댓글 논점
- *"PyTorch 의존하니까 진짜 from scratch는 아니지 않나"* — 맞는 지적. *교육 목적의 from scratch* 정도로 이해
- *"10M = LLM이라 부를 만한가"* — *Large*는 마케팅. 학습 목적엔 *작은 게 정답*

## 📜 인상 깊은 문장

> "A working GPT model trained from scratch on your MacBook, capable of generating Shakespeare-like text."

> "Andrej Karpathy's nanoGPT... completely changed how I thought about AI and inspired me to go deeper into the space."

> "BPE tokenization (GPT-2's 50k vocab) doesn't work on small datasets." — 소규모 학습의 핵심 페다고지

## 💭 내 생각 · 적용점

### 가든 내 *주말 프로젝트 후보*로 기록
대부분의 가든 글이 *깊은 아이디어 큐레이션*이라면 이 글은 **"실제 해볼 만한 자료 포인터"**. 가든이 *읽기*만이 아니라 *행동 후보*도 보유하도록 의도적으로 추가.

### 왜 이 자료인가 — 3가지 제약 만족
[Jordan Lord의 3 제약](../engineering/2026-04-28-three-constraints-before-i-build-anything.md) 관점에서:
- ✅ **One-pager**: 6단계가 1페이지에 들어감
- ✅ **Core tech**: 트랜스포머·attention의 *코드 수준 이해*가 분리 가능 자산
- ✅ **Defining constraint**: *1시간 / M3 / 셰익스피어* — 매우 명확한 정체성

### *생산적 미루기 vs 진짜 학습* 자가 진단
[어제 정리한 생산적 미루기](../career/2026-05-07-productive-procrastination.md)의 *자가 진단 질문* 적용:
- *이 워크숍을 끝내면 *주요 가설*이 검증되는가?*
- 가설: *"트랜스포머 코드 수준 이해가 호스피탈리티 AI 적용 사고에 영향을 준다"*
- 답: **부분적 yes** — 작동을 *느끼는* 것과 *글로 읽는* 것은 다르고, [YC RFS #15 AI OS](../engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md)·[Hotel Brain](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md) 같은 사고에 *해상도*가 더 들어옴

### 우선순위 평가 (다른 후보들 대비)
- **mattpocock skills 도입** (CONTEXT.md, /grill, /diagnose) — *즉시 일에 적용 가능*. 우선순위 ★★★★
- **CRS·Connectivity team-skills repo 시작** ([Glaser 글](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md)) — *조직 차원 영향 가능*. ★★★★
- **이 워크숍 (LLM from scratch)** — *개인 이해 향상, 주말 프로젝트*. ★★★

→ **이번 분기엔 후순위**, 다만 *주말 1회 슬롯*으로 BugSip 일정 사이에 끼워볼 만함.

### 호스피탈리티 적용 가능성
직접적인 적용은 거의 없음 (호텔 시스템에 GPT를 직접 *학습*시킬 일 X).
다만 *간접적 사고 향상*은 분명:
- 토크나이저 단계 → *호텔명·OTA명 같은 도메인 토큰*의 *vocab 설계* 사고
- attention → *예약 컨텍스트*에서 어떤 정보가 중요한지의 비유적 이해
- 학습 파이프라인 → *fine-tuning 시 데이터·loss 설계*의 의사결정 어휘 확보

### 반론·균형점
- 이 자료는 *재미를 위한 학습*이고, *실무 ROI*는 낮음. 정직하게 인정.
- *Karpathy 영상 시청*만으로 충분한 사람도 많음. 직접 코드 작성은 *시간 비용 4-8시간*.
- 대안: *Sebastian Raschka 책*이 *책 한 권 분량*으로 더 깊지만 시간 투자 배가됨.

## 🎯 구체적 결정
**이번 달엔 도입 X / Q3 *주말 실험 슬롯* 후보로 보관**.

[확률적 창업자의 70% 실험](../career/2026-05-05-rise-of-the-probabilistic-founder.md) 프레임 적용:
- *주요 로드맵* (CRS·BugSip): 80%
- *실험 슬롯*: 20% — 이 안에 *team-skills repo* + *LLM workshop* 같은 후보 경쟁
- 이 글은 *2-3개 실험 후보 중 우선순위 ★★★* 으로 기록 후 *분기 회고에서 재평가*

## 🔗 연관 자료
- [`engineering/2026-04-28-three-constraints-before-i-build-anything.md`](../engineering/2026-04-28-three-constraints-before-i-build-anything.md) — 3 제약 모두 만족하는 좋은 워크숍
- [`career/2026-05-07-productive-procrastination.md`](../career/2026-05-07-productive-procrastination.md) — *진짜 학습 vs 생산적 미루기* 자가 진단 적용
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — 20% 실험 슬롯 후보로 평가
- 비교 자료: [Karpathy nanoGPT](https://github.com/karpathy/nanoGPT), Stanford CS336, *Build a Large Language Model (From Scratch)* — Sebastian Raschka

## 📝 한 달 뒤 회고
- [ ] 워크숍 1단계라도 시도했는가
- [ ] 시도하지 않았다면 *이유가 우선순위 변경 때문인가, 미루기인가* 정직하게 점검
