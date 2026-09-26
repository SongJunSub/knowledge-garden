---
title: "Ollaya (ollaya-dev, 오픈소스) — Jev 계열 오픈소스 의사결정 모델들에 마침내 'Ollama'라는 유통망이 생겼다"
source_title: "Ollaya – Ollama for open-source, Jev-style decision models"
source_url: "https://github.com/ollaya-dev/ollaya"
source_name: "GitHub (ollaya-dev/ollaya) / ollaya.dev"
referrer_url: "https://news.hada.io/topic?id=34288"
published_at: "2026-09-26"
summarized_at: "2026-09-26"
category: "ai"
tags: ["jev", "ollama", "decision-model", "onnx", "local-ai", "open-source", "laya", "kev", "typesafe-compatible"]
---

# Ollaya — Jev 계열 오픈소스 의사결정 모델을 위한 Ollama

> 출처: [ollaya-dev/ollaya (GitHub)](https://github.com/ollaya-dev/ollaya) · ollaya.dev · GeekNews(id=34288) 경유 · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io`가 이 세션에서 egress 차단돼 원문 토픽 페이지·hada 댓글을 직접 확인하지 못했다. GitHub 저장소 본문(WebFetch로 직접 확보)과 Hacker News 다이제스트 미러(`luoyunchong/actions#850`, `meixger/hackernews-daily#1475`), WebSearch로 교차확인해 재구성했다. HN 점수·댓글 수는 소스마다 356점/102댓글, 377점/105댓글로 약간 다르게 보고돼(스냅샷 시점 차이로 추정) 범위로만 밝힌다. 원저작자(ollaya-dev 계정)의 실명·소속은 확인하지 못했다.

## 한 줄 요약

**Ollaya는 Laya·Kev·NLI(DeBERTa)·GLiClass·Qwen3Guard 등 여러 오픈소스 "Jev 계열" 의사결정 모델을 하나의 CLI/데몬으로 묶어 로컬에서 서빙하는 러너다 — Ollama가 LLM에 한 일을 판단 전용 소형 모델에 그대로 적용해, TypeSafe(Jev)와 동일한 API 형태로 SDK 접속 주소만 로컬로 바꾸면 그대로 동작하게 만든다.**

## 핵심 포인트

- **CLI가 Ollama를 그대로 베낀다** — `serve`, `run`, `pull`, `list`, `ps`, `show`, `rm`, `cp`, `stop`, `create` 등 ***Ollama와 동일한 명령어 체계***를 그대로 채택해 학습 비용을 없앴다.
- **TypeSafe(Jev) API와 와이어 호환** — `POST /v1/systemone`, `/v1/decisions`, `GET /v1/models`가 TypeSafe의 요청·응답 형식과 동일해, 환경변수 `TYPESAFE_BASE_URL=http://localhost:11435`만 바꾸면 ***기존 TypeSafe 공식 Python SDK가 그대로 로컬 서버에 붙는다***.
- **가중치는 재호스팅하지 않는다** — 배포되는 것은 약 3MB짜리 ONNX 그래프뿐이고, 실제 가중치(`model.safetensors`)는 원저자의 Hugging Face 레포에서 ***커밋 고정 + SHA256 검증***으로 직접 읽어온다.
- **Jev 계열 오픈소스 모델을 한자리에 모았다** — 라이브러리에 **Laya, decider, NLI, GLiClass, Qwen3Guard, Kev, Von**을 올려두고 있는데, 이 중 Laya와 Kev는 이 가든이 이미 각각 별도 노트로 추적해온 "Jev 오픈소스 재구현" 계보의 당사자들이다.
- **로컬 벤치마크 — RTX 4090에서 질문 5개당 8~10ms** — `laya:en`(ModernBERT-large 기반) 모델이 ***RTX 4090에서 질문 5개를 8~10ms에 처리***한다고 자체 보고한다. fp32 내보내기 검증은 체크포인트당 2,383개 질문 중 ***100% PyTorch 참조값과 일치***했다고 밝힌다(자체 검증, 제3자 재현 미확인).
- **런타임 다중화 — ONNX Runtime, llama.cpp, Apple Silicon Metal** — CPU/CUDA(ONNX Runtime), GGUF(llama.cpp), Apple Silicon(Metal)까지 지원해 서버·로컬 데스크톱 양쪽에 걸친다.
- **라이선스는 대체로 Apache-2.0** — 프로젝트 자체와 대부분 모델이 Apache-2.0이며, `nli:deberta-v3-large`(Moritz Laurer 제공)만 MIT다.

## 인상 깊은 문장

> "Ollama for decision models." (GitHub 저장소 타이틀/설명, 다수 소스에서 동일하게 반복 확인)

## 댓글

**정확한 수치 미확정.** hada 댓글 수는 원천 차단으로 확인 못 했다. HN 반응은 오늘(2026-09-26) HN Top10/Top30 다이제스트 기준 4위에 올랐고, 교차확인한 소스에 따라 ***356점·102댓글*** 또는 ***377점·105댓글***로 약간 다르게 보고된다(둘 다 "9월 25~26일 스냅샷"이라 시간차로 추정, 정확한 최종값은 확정 못 함). 이해관계 노트: 나는 이 프로젝트를 직접 설치·실행해보지 않았고, 벤치마크(8~10ms, 100% 일치)는 전부 프로젝트 저장소의 자체 보고이며 제3자 재현은 확인하지 못했다. HN 스레드 안에서 구체적으로 어떤 비판이 나왔는지(성능 재현성, 원저작자 확인, 라이선스 이슈 등)는 원문 스레드 접근이 막혀 파악하지 못했다는 점도 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 계열에 드디어 "유통망"이 생겼다: 개별 재구현에서 통합 런타임으로

이 가든은 이미 [[2026-09-16-typesafe-ai-jev-typed-judgments]](Jev/TypeSafe 원조 발표)를 시작으로 [[2026-09-18-jevlike-open-source-jev-probability-model]], [[2026-09-20-laya-open-source-jev-alternative]], [[2026-09-21-laya-mac-offline-realtime-decision-ai]], [[2026-09-21-jev-field-guide-system-one-model]], [[2026-09-22-kev-open-source-jev-decision-model]]까지 "Jev의 오픈소스 재구현"이 릴레이처럼 이어지는 흐름을 계속 추적해왔다. 이 재구현들은 전부 **개별 레포·개별 실행 방법**을 가진 산발적 프로젝트였다. Ollaya의 의미는 새로운 모델이 아니라, 이 산발적 재구현들을 **하나의 표준 CLI·API 뒤로 모으는 유통 계층**이 처음 생겼다는 데 있다 — 정확히 Ollama가 흩어진 오픈 웨이트 LLM들에 해준 일이다. [[2026-09-21-jev-field-guide-system-one-model]]이 결론으로 남긴 "재구현이 나온 뒤 Jev의 방어선은 아키텍처도 인터페이스도 아니고 데이터·보정 품질과 관리형 서비스로서의 지연(0.4초)뿐"이라는 진단을, Ollaya의 등장이 한 단계 더 밀어붙인다 — 이제는 **그 관리형 지연(0.4초) 우위마저 로컬 RTX 4090의 8~10ms 앞에서 무색해지는 구간**이 생겼기 때문이다.

### 핵심 전이 2 — Kev·Laya가 "제품"이 아니라 "라이브러리 항목"이 되는 전환점

[[2026-09-22-kev-open-source-jev-decision-model]] 노트는 Kev를 "Jev 계열의 9번째 사례"로, [[2026-09-21-laya-mac-offline-realtime-decision-ai]]는 Laya의 Core ML 이식을 "8번째 사례"로 각각 개별 조명했다. Ollaya의 라이브러리 목록에 이 둘이 나란히 오르는 순간, 이 모델들은 더 이상 독립적으로 평가받는 "제품"이 아니라 하나의 러너 안에서 서로 교체 가능한 "라이브러리 항목"으로 지위가 바뀐다 — 이는 개별 모델의 품질 경쟁이 이제 러너 생태계 안의 경쟁으로 옮겨간다는 뜻이고, 동시에 [[2026-09-22-kev-open-source-jev-decision-model]]가 지적한 "`--init_from` 없이 베이스부터 학습하면 판단 형식을 잃는다"는 함정이나 Laya의 "제3자 검증 부재" 경고가, Ollaya를 통해 손쉽게 pull 가능해질수록 오히려 더 눈에 띄지 않게 될 위험도 함께 커진다.

## 호스피탈리티 / CRS 적용 포인트

[[2026-09-22-kev-open-source-jev-decision-model]]가 짚은 CRS 트리아지 적용점(문의 하나를 담당부서·긴급도·불만도로 동시 분해 판단)은 여기서도 그대로 유효하다. Ollaya가 더하는 것은 **운영 편의성**이다 — 여러 후보 모델(Laya, Kev, NLI 등)을 개별 레포·개별 실행 방식으로 따로 운영하지 않고 하나의 CLI/데몬으로 pull·교체·비교할 수 있다면, CRS 트리아지 파이프라인에 어떤 판단 모델을 붙일지 실험하는 비용이 크게 줄어든다. 다만 **가중치를 재호스팅하지 않고 제3자 Hugging Face 레포에서 직접 당겨온다**는 설계는, 프로덕션에 넣기 전 그 업스트림 레포의 가용성·유지보수 상태를 별도로 점검해야 한다는 공급망 리스크를 남긴다 — 특히 [[2026-09-22-kev-open-source-jev-decision-model]]가 이미 지적했듯 동일 설명을 가진 레포가 여러 계정에 동시 존재하는 "레포 팜" 패턴이 이 생태계에 실재하므로, Ollaya로 pull하기 전 원저작자·라이선스를 개별 확인하는 절차가 필요하다.

## 연관 자료

- [[2026-09-22-kev-open-source-jev-decision-model]] — Ollaya 라이브러리에 포함된 Kev 자체의 상세 분석, `--init_from` 파인튜닝 함정
- [[2026-09-21-laya-mac-offline-realtime-decision-ai]] — Ollaya 라이브러리에 포함된 Laya의 온디바이스 이식판, 제3자 검증 부재 경고
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 계열 전체를 관통하는 가장 깊은 해설, "재구현 이후 방어선은 데이터·보정·관리형 지연뿐"이라는 결론

## 한 달 뒤 회고

*(2026-10-26 즈음 — Ollaya의 HN 스레드에서 나온 구체적 비판(성능 재현 실패 사례, 라이선스 분쟁 등)을 확인. 라이브러리에 새로 추가된 모델이 있는지, TypeSafe 측이 이 오픈소스 유통망에 대응하는 움직임(가격 인하, API 변경 등)을 보였는지 점검.)*
