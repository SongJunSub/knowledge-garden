---
title: "Qwen-Drive-1.0 공개 (Alibaba/Qwen · HUST) — 왜 멈췄는지 말은 하지만, 그 말이 실제 궤적과 항상 일치하지는 않는다고 저자들이 직접 인정한다"
source_title: "QwenLM/Qwen-Drive-1.0"
source_url: "https://github.com/QwenLM/Qwen-Drive-1.0"
source_name: "GitHub(QwenLM) · GeekNews(id=33383) 경유"
referrer_url: "https://news.hada.io/topic?id=33383"
published_at: "2026-09 (arXiv 2609.00111, 정확한 게시일 미확인)"
summarized_at: "2026-09-09"
category: "ai"
tags: ["qwen", "autonomous-driving", "vla", "vision-language-action", "motion-planning", "bev-perception", "open-weights", "apache-2.0"]
---

# Qwen-Drive-1.0 공개 (Alibaba/Qwen · HUST)

> 출처: [QwenLM/Qwen-Drive-1.0](https://github.com/QwenLM/Qwen-Drive-1.0) (GitHub) · GeekNews(id=33383) 경유 · 정리일 2026-09-09
> **출처 한계**: `news.hada.io`·`arxiv.org`·`huggingface.co`·`the-decoder.com`·`technode.com`·`www.alphaxiv.org`가 이 세션 egress 정책으로 전부 차단됐다. 다만 **GitHub 저장소(github.com/QwenLM/Qwen-Drive-1.0) README는 이 세션에서 직접 WebFetch로 확인**했으므로 아키텍처·라이선스·벤치마크 표 일부는 1차 소스 기준이다. 논문 초록·저자 소속 전체·"설명과 궤적 불일치" 관련 저자 자신의 한계 서술 원문은 the-decoder 등의 2차 보도로만 재구성했고, 이 세션에서 논문 원문 문단과 직접 대조하지는 못했다. hada 댓글 수·논조도 확인 불가.

## 한 줄 요약

**Alibaba Qwen팀과 화중과기대(HUST)가 함께 낸 Qwen-Drive-1.0-4B는 3D 공간 인식, 주행 상황 질의응답, 향후 5초 이동 경로 계획을 사전학습 단계부터 하나로 통합한 자율주행 비전-언어 모델이다.** Qwen3.5-4B의 기본 VLM 구조는 건드리지 않고 그 위에 인식·계획 모듈만 얹는 방식으로, 주행 특화 능력을 얻으면서도 일반 시각-언어 능력을 거의 그대로 유지했다고 보고한다. 다만 저자들 스스로도 인정하듯, 모델이 자연어로 내놓는 "왜 이렇게 움직였는가"라는 설명이 실제로 생성한 주행 궤적과 항상 엄밀하게 일치하지는 않는다.

## 핵심 포인트

- **아키텍처** — 공유 VLM으로 ***Qwen3.5-4B***를 그대로 쓰고, 그 위에 두 모듈을 얹는다: ① 3D 객체 탐지·시맨틱 점유 예측·BEV(조감도) 지도 분할을 함께 수행하는 ***BEV Perception Head***, ② 공유 VLM 표현을 조건으로 플로우 매칭(flow matching)을 통해 미래 자차 궤적을 생성하는 ***Planning Expert***. VLM 본체 구조는 건드리지 않았다는 점이 저장소 설명에서 강조된다.
- **경로 출력 형태** — Planning Expert는 ***50개 웨이포인트로 이뤄진 5초 구간의 궤적을 10Hz 주기***로 출력한다(x좌표, y좌표, 헤딩 각도). 데모 폴더에는 야간 교차로, 좌회전, 우회전, 주차 차량 통과 등 4개 WOD-E2E 계획 장면을 하나의 Parquet 파일에 담아, ***카메라 링·예측 궤적 대 정답·생성된 추론(reasoning)***을 함께 시각화해 모델이 주변을 어떻게 이해했는지 보여준다.
- **일반 능력 보존** — 주행 지도(supervision)와 범용 시각-언어 데이터를 함께 쓰는 단계적 학습 레시피 덕에, SFT 모델은 지식·추론·인식·공간 이해 벤치마크에서 기반 모델인 Qwen3.5-4B와 대등한 성능을 유지했다고 보고된다. GitHub README 기준 일반 VQA는 MMBench 85.5점, MMMU-Pro 62.7점, 주행 VQA는 LingoQA 77.8점·WaymoQA 74.5점으로 타 모델 대비 우수하다고 소개된다.
- **경로 계획 성능, 다만 최고 기록은 아님** — RL로 미세조정한 모델은 NAVSIM v1.1 navtest에서 ***PDMS 90.7점(best-of-6 기준 91.4점)***을 기록했다(GitHub README에서도 90.7점 확인, Waymo 데이터셋 기준 7.91점도 함께 보고됨). WebSearch로 확인한 동시기 경쟁 논문들과 비교하면 이 점수가 최고 기록은 아니다 — LaST-VLA-8B가 91.3점, ELF-VLA가 91.0점으로 근소하게 앞서고, ExploreVLA는 best-of-N 전략으로 93.7점까지 낸다고 보고된다(이 세션에서 각 논문 원문을 직접 대조하지는 못했다). Qwen-Drive-1.0의 의의는 최고 점수보다 **3D 인식·VQA·계획을 사전학습 단계부터 한 모델에 통합했다는 구조**에 있다고 읽는 게 정확하다.
- **설명-궤적 불일치라는 한계를 저자 스스로 인정** — the-decoder 보도에 따르면 논문 자체가 "모델의 텍스트 설명과 생성된 궤적 사이의 엄밀한 일관성을 보장하는 데는 개선 여지가 남아 있다"고 명시한다. 즉 모델이 "전방에 보행자가 있어 감속했다"고 말해도, 실제로 생성한 궤적이 그 설명과 정확히 대응하는 감속인지는 별개로 검증해야 한다는 뜻이다.
- **라이선스·공개 범위** — ***Apache 2.0***으로 코드·모델 가중치·데모 데이터를 공개.

## 인상 깊은 문장

> "Qwen-Drive-1.0: An Initial Step towards a Vision-Language Foundation Model for Autonomous Driving" (논문·저장소 제목 — 스스로를 "최종 해법"이 아니라 "첫걸음"으로 규정한 점이 눈에 띈다)

> "while the model shows strong initial results, there remain opportunities for improvement in ensuring strict consistency between a model's textual rationale and its generated trajectory." (the-decoder가 인용한 논문 한계 서술 — 2차 재인용, 원문 문단 직접 대조는 못함)

## 댓글

**hada 댓글 수·논조 확인 불가.** `news.hada.io` 접근이 이 세션 내내 차단됐다. 다만 the-decoder의 기사 제목("just don't expect the explanation to match the maneuver")부터가 이 모델의 한계를 정면으로 짚는 논조이고, 이는 **논문 저자 스스로 명시한 한계와 정확히 일치**한다는 점에서 신뢰할 만한 비판축으로 판단한다. VLA(비전-언어-액션) 계열 모델 전반에 대한 일반적 비판 — VQA 기반 도메인 적응이 3D 공간 이해를 엄밀하게 강제하지 못하고, 주행 데이터 특화 미세조정이 분포 밖(OOD) 상황에 대한 범용 지능을 깎아먹을 수 있다는 지적 — 도 WebSearch로 확인되나, 이건 Qwen-Drive-1.0 논문 자체가 아니라 같은 시기 다른 VLA 연구들이 공유하는 일반적 우려로 다뤄야 한다.

## 내 생각 · 적용점

1. [[2026-08-02-gemini-robotics-2]]와 나란히 놓으면, ***VLA(비전-언어-액션)라는 같은 설계 패턴이 로봇공학과 자율주행 두 도메인에 동시에 퍼지고 있다***는 흐름이 보인다. 두 모델 모두 "기존 기반 모델(Gemini 계열 / Qwen3.5-4B)의 구조는 유지한 채 행동 생성 모듈만 얹는다"는 같은 설계 선택을 했고, 둘 다 스스로 뚜렷한 한계를 인정한다 — Gemini Robotics 2는 "이동 속도와 정밀도가 더 필요하다"고, Qwen-Drive-1.0은 "설명과 궤적의 엄밀한 일관성"이 부족하다고. **자기 한계를 명시하는 발표 관행 자체가 이 시기 VLA 연구의 공통된 정직성 신호**로 읽을 만하다.
2. [[2026-09-01-korea-tesla-fsd-regulation-fta-exemption]]과는 정반대 층위에서 대구를 이룬다 — 그 노트는 "기술이 안전한가"가 아니라 "기존 법규의 운영 전제(방향지시등은 운전자가 조작한다)와 충돌하는가"가 규제 판정의 실제 기준이었다는 점을 짚었다. Qwen-Drive-1.0의 이번 한계(설명과 실제 동작의 불일치)는 바로 그 규제 맥락에서 결정적인 문제가 될 수 있다 — **사고 조사·규제 감사 상황에서 "시스템이 왜 이렇게 움직였는가"를 설명 가능해야 한다는 요구가 커지는데, 이 모델처럼 설명과 실제 동작이 어긋날 수 있다면 설명 가능성(explainability) 자체가 사후적으로 신뢰할 수 없는 서사가 될 위험**이 있다. 두 노트를 겹치면 "자율주행의 규제 장벽은 성능이 아니라 설명 가능성과 절차적 정합성에서 온다"는 그림이 더 뚜렷해진다.
3. [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]]·[[2026-09-04-qwen-3-8-27b-cerebras]]와 함께 보면, ***같은 Qwen 패밀리가 범용 대화·에이전트 코딩(3.8-27B, Flash-Next)과 특화 로보틱스/주행(Drive-1.0)으로 동시에 가지를 뻗는 중***이라는 게 보인다 — 하나의 기반 아키텍처(Qwen3.5-4B)를 그대로 두고 워크로드별로 모듈만 갈아끼우는 전략이 이 패밀리 전체의 반복되는 패턴이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 자율주행·차량 궤적 계획은 온다 CRS와 도메인이 완전히 다르다. 다만 전이 가능한 원칙 하나는 남긴다: **모델(또는 자동화 규칙)이 "왜 이런 결정을 내렸는가"를 자연어로 설명하는 기능을 만들 때, 그 설명이 실제 내부 로직·최종 출력과 항상 정확히 대응한다는 보장은 별도로 검증해야 한다**는 것 — 이건 CRS의 다이나믹 프라이싱이나 자동 오버부킹 처리 같은 기능이 "왜 이 요금을 제시했는지" 파트너에게 설명하는 기능을 붙일 때 그대로 적용되는 경계 감각이다. 설명 생성과 실제 결정 로직이 분리된 모듈이라면, 그 둘의 일관성은 저절로 보장되지 않고 명시적으로 테스트해야 한다.

## 연관 자료
- [[2026-08-02-gemini-robotics-2]] — 같은 VLA 설계 패턴이 로보틱스 도메인에 적용된 사례, 둘 다 스스로 한계를 명시
- [[2026-09-01-korea-tesla-fsd-regulation-fta-exemption]] — 자율주행 규제가 성능이 아니라 절차적 전제·설명 가능성에서 걸린다는 대구
- [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]], [[2026-09-04-qwen-3-8-27b-cerebras]] — 같은 Qwen 패밀리가 워크로드별로 가지를 뻗는 흐름

## 한 달 뒤 회고
*(2026-10-09 즈음 — `arxiv.org`·`news.hada.io` 접근이 풀렸다면 논문 원문으로 저자 소속·한계 서술 전문·NAVSIM 경쟁 모델 비교표를 직접 대조. 후속 버전이 "설명-궤적 불일치" 문제를 어떻게 개선했는지도 확인.)*
