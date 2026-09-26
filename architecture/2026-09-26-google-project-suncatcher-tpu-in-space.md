---
title: "구글 Project Suncatcher — TPU를 우주로 쏘아 올려 AI 인프라의 다음 병목(방열·방사선)을 시험하다 (Google)"
source_title: "Learn about Google's Project Suncatcher to put ML infrastructure in space"
source_url: "https://blog.google/innovation-and-ai/models-and-research/google-research/google-project-suncatcher-facts/"
source_name: "Google (blog.google)"
referrer_url: "https://news.hada.io/topic?id=34256"
published_at: "2026-09-24"
summarized_at: "2026-09-26"
category: "architecture"
tags: ["project-suncatcher", "google", "tpu", "space-infrastructure", "data-center", "radiation-hardening", "thermal-design"]
---

# 구글 Project Suncatcher — TPU를 우주로 쏘아 올려 AI 인프라의 다음 병목을 시험하다

> 출처: [Learn about Google's Project Suncatcher to put ML infrastructure in space](https://blog.google/innovation-and-ai/models-and-research/google-research/google-project-suncatcher-facts/) (Google 공식 블로그) · GeekNews(id=34256) 경유 · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io`, `es.news.hada.io`, `blog.google` 모두 이번 세션 egress 차단이라 원문을 직접 열어 대조하지 못했다. Google이 2026-09-24에 올린 업데이트 내용을 WebSearch로 다수 매체(Interesting Engineering, Data Center Dynamics, Gizmodo, Futurum Group 등)와 교차확인해 재구성했다. hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**Google이 10월 1일 SpaceX Transporter-18 편으로 Trillium TPU 4개를 실은 프로토타입 위성을 쏘아 올려, ML 인프라를 우주로 확장할 수 있는지 실측한다 — 관건은 연산 성능이 아니라 방사선·열·발사 충격이라는 "물리적 병목"이다.**

## 핵심 포인트

- **목표는 궤도 위 TPU 클러스터** — 2025년 11월 처음 발표된 Project Suncatcher는 태양광 위성 여러 대에 TPU와 자유공간 광통신 링크를 실어, 장기적으로 ***81개 위성이 1km 간격으로 편대비행하는 컴퓨트 클러스터***를 구상한다. 위성 회사 Planet과 공동 개발.
- **방사선 내구성은 이미 지상 실험으로 확인** — UC Davis Crocker Nuclear Laboratory 양성자 빔으로 ML 워크로드를 실제로 돌리며 테스트한 결과, ***Trillium TPU가 5년 우주 임무 동안 받을 총 이온화 방사선량보다 더 큰 양을 견뎠다***.
- **진짜 난제는 냉각** — TPU는 좁은 면적에서 열을 많이 내는데, 우주엔 공기가 없어 대류 냉각이 불가능하다. 히트파이프+라디에이터 조합을 열진공 챔버에서 시험 중 — 지구와는 다른 냉각 설계가 필요하다는 뜻.
- **10월 1일 발사, 4개 TPU 탑재** — 내부명 "MVP"(Minimum Viable Product) 프로토타입 위성이 SpaceX Transporter-18 라이드셰어 편으로 발사, 발사 충격·방사선·극한 온도 조건에서의 실측이 목적.
- **다음 단계는 2027년 위성 간 통신** — 두 위성 간 고대역폭 레이저 링크 시험이 2027년 예정 — 궁극적으로는 개별 위성이 아니라 "긴밀히 조율된 클러스터"가 목표라는 뜻.
- **왜 우주인가** — 궤도에서는 태양광 패널이 지상 대비 최대 8배 생산적이고 거의 끊김 없이 전력을 받아 배터리 의존이 줄어든다는 게 Google의 기본 논리.

## 인상 깊은 문장

> "Trillium TPU가 5년 우주 임무 동안 받을 것보다 더 큰 총 이온화 방사선량을 견뎠다." (WebSearch 교차확인, Google 발표 요지)

## 댓글

**hada 댓글 수·큐레이션 여부 확인 불가**(원문 차단). Google 자사 발표문이므로 "방사선 내구성 확인" 같은 긍정적 결과는 자사 선정 프레이밍일 가능성을 감안해야 한다 — 발사(10/1) 자체는 아직 일어나지 않은 시점의 사전 홍보성 업데이트다. 실제 궤도 상 작동 여부는 이 노트 시점에는 검증되지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — 병목이 또 한 번 "연산"에서 "물리적 제약"으로 넘어간다

[[2026-09-17-inference-hardware-revolution-2026]]에서 이미 "추론 병목이 연산에서 메모리 대역폭으로 옮겨갔다"고 정리했는데, Suncatcher는 그 병목 이동의 다음 단계를 보여준다 — 궤도라는 환경에서는 **방사선 내구성과 방열**이 새로운 1급 제약이 된다. [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]가 "해자는 물리적 제약이거나 전환비용"이라고 했던 원칙이 그대로 재현된다 — Suncatcher가 성립하려면 결국 냉각이라는 물리 문제를 풀어야 하고, 그걸 먼저 푸는 쪽이 해자를 갖는다.

### 핵심 전이 2 — 이건 아직 "가능성 실증"이지 "인프라"가 아니다

이 가든이 반복해서 짚어온 패턴 — 자사 발표문은 임팩트를 실측치처럼 제시하지만 실제 운영 사례는 훨씬 늦게 온다 — 이 여기서도 그대로 적용된다. 4개 TPU를 실은 프로토타입 위성 하나는 "우주 데이터센터"가 아니라 "우주에서 TPU가 안 죽는지 확인하는 실험"이다. 이 간극을 유지하며 읽어야 한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 매우 멀다 — 온다는 위성이나 방사선 내구 하드웨어를 다루지 않는다. 다만 전이 가능한 원칙 하나는 남는다: **AI 인프라의 물리적 제약(전력·냉각·희소 하드웨어)이 결국 클라우드 AI API의 가격과 가용성으로 하방 전이된다.** CRS가 AI 기능(요금 최적화·수요 예측 등)을 벤더 API에 의존해 설계할 때, 이런 상류의 물리적 병목 뉴스는 장기 비용 곡선을 가늠하는 선행 지표로만 참고할 가치가 있다.

## 연관 자료

- [[2026-09-17-inference-hardware-revolution-2026]] — 추론 병목이 연산에서 메모리 대역폭으로 이동했다는 같은 계열의 하드웨어 병목 논의
- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — "해자는 물리적 제약"이라는 원칙의 데이터센터 버전, Suncatcher는 그 제약이 우주로 확장된 사례

## 한 달 뒤 회고

*(2026-10-26 즈음 — 10월 1일 발사가 실제로 성공했는지, 초기 궤도상 TPU 원격측정 데이터가 공개됐는지 확인.)*
