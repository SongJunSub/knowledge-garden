---
title: "Three.js로 브라우저에서 LLM 실행하기 - Three-LLM (bhouston) — 3D 렌더링 라이브러리의 GPU 연산 기능을 빌려 추론 서버 없이 GPT-2·Qwen·Phi를 구동한다"
source_title: "Three-LLM — WebGPU LLM Inference Engine"
source_url: "https://github.com/bhouston/three-llm"
source_name: "bhouston (GitHub, OSS)"
referrer_url: "https://news.hada.io/topic?id=34018"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "engineering"
tags: ["three.js", "webgpu", "llm-inference", "browser", "tsl", "compute-shader", "client-side-ai"]
---

# Three.js로 브라우저에서 LLM 실행하기 - Three-LLM (bhouston)

> 출처: [Three-LLM (GitHub)](https://github.com/bhouston/three-llm) · GeekNews(id=34018) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "토큰 하…"에서 잘림)와 WebSearch로 확보한 GitHub 저장소·공식 데모 사이트(three-llm.ben3d.ca)·블로그 스니펫을 교차해 재구성했다. 실제 추론 속도(토큰/초) 수치는 확인하지 못했다.

## 한 줄 요약

**3D 그래픽 렌더링에 쓰이는 Three.js의 WebGPU 컴퓨트 기능을 빌려, 별도 추론 서버나 WebAssembly 바이너리 없이 브라우저 안에서 GPT-2·SmolLM2·Qwen·Phi 같은 언어 모델을 직접 구동하는 오픈소스 엔진 Three-LLM이 공개됐다 — Hugging Face 모델 파일을 그대로 읽어 행렬 곱·어텐션 연산을 TSL 컴퓨트 셰이더로 실행한다.**

## 핵심 포인트

- **렌더링 라이브러리를 연산 엔진으로 전용** — 3D 그래픽에 쓰이는 Three.js의 GPU 연산 기능으로 언어 모델을 실행하는 Three-LLM을 구현했다. ***별도 추론 서버 없이 브라우저에서 GPT-2, SmolLM2, Qwen, Phi 등을 구동***한다. WebSearch로 확인: Three.js는 렌더링 라이브러리로 알려져 있지만 WebGPU 렌더러가 스토리지 버퍼, 컴퓨트 디스패치, 워크그룹 메모리, 원자적 연산까지 노출한다는 점을 이용했다.
- **모델 파일을 그대로 읽어 셰이더로 실행** — Hugging Face의 모델 파일을 직접 읽고, 행렬 곱과 어텐션 같은 연산을 ***TSL 컴퓨트 셰이더로 구성해 실행***하며 ***모델별 사전 변환이나 별도 WebAssembly 바이너리가 필요 없다.***
- **여러 디코더 아키텍처를 한 엔진으로 지원** — 텍스트를 토큰으로 바꾸고 다음 토큰을 선택하기까지의 과정을 구현하며, ***GPT-2의 기본 구조부터 Phi의 병렬 블록, Qwen의 고정 크기 순환 메모리까지 다룬다.*** WebSearch로 보강하면 GPT-2, Llama 스타일, Gemma 3, Phi, Qwen 3.5 디코더 아키텍처와 GPT-2 BPE·Qwen BPE·유니그램 등 여러 토크나이저를 지원한다. 모델 규모는 300만 파라미터 스토리 생성기부터 8억 파라미터 챗 모델까지.
- **npm 설치·라이브 데모 제공** — three-llm.ben3d.ca에서 라이브 챗 데모를 체험할 수 있고, npm으로 설치하거나 GitHub 소스를 직접 확인할 수 있다.

## 인상 깊은 문장

> "Three.js is known as a rendering library, but its WebGPU renderer also exposes storage buffers, compute dispatches, workgroup memory, atomics, and GPU readback."
> (WebSearch로 확보한 프로젝트 소개 취지의 재구성)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: GitHub 이슈 목록에서 "checkpoint browser GPU test failures (RangeError + timeouts)" 같은 브라우저 GPU 테스트 실패 이슈가 확인돼, 아직 안정성이 완전히 검증된 프로덕션 도구는 아닌 것으로 보인다. 실사용 벤치마크(토큰/초, 다른 WebGPU 추론 엔진 대비 속도)는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "브라우저에서 로컬 AI" 계열에 렌더링 라이브러리 전용이라는 새로운 접근이 추가됨

가든에는 이미 브라우저·로컬 환경에서 LLM을 돌리는 노트들이 쌓여 있다 — [[2026-08-22-huggingface-speech-to-speech-local-voice-agent]](로컬 음성 에이전트), [[2026-05-12-rapid-mlx-apple-silicon-local-ai]](Apple Silicon 로컬 AI). Three-LLM은 이들과 달리 **범용 AI 프레임워크가 아니라 3D 렌더링 라이브러리(Three.js)의 GPU 접근 능력을 재활용**했다는 점이 독특하다 — WebGPU라는 새 표준이 등장하면서 "GPU 연산이 필요한 도구"라면 원래 용도(렌더링)와 무관하게 서로의 인프라를 빌려 쓸 수 있게 된 사례로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

CRS 고객용 웹 프론트엔드에 간단한 분류·추천 작업(예: 객실 추천 랭킹, FAQ 응답)을 서버 호출 없이 브라우저에서 처리하려는 실험적 시도에 참고할 만하다. 다만 아직 안정성 이슈(GPU 테스트 실패)가 확인돼 프로덕션 적용은 이르고, 모델 크기가 작아(최대 8억 파라미터) CRS의 복잡한 판단 업무에는 부족할 가능성이 크다.

## 연관 자료

- [[2026-05-12-rapid-mlx-apple-silicon-local-ai]] — 로컬 하드웨어에서 AI를 구동하는 인접 사례, 대상 플랫폼(Apple Silicon vs 브라우저 WebGPU)이 다름

## 한 달 뒤 회고

*(2026-10-21 즈음 — GitHub 이슈(브라우저 GPU 테스트 실패)가 해결됐는지, 실사용 속도 벤치마크가 공개됐는지 확인.)*
