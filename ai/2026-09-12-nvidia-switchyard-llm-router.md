---
title: "Switchyard (NVIDIA NeMo) — API는 그대로 두고 모델만 골라주는 라우터, 그런데 최고 성적도 정확도 75.7%에 비용 13% 절감이 전부다"
source_title: "GitHub - NVIDIA-NeMo/Switchyard"
source_url: "https://github.com/NVIDIA-NeMo/Switchyard"
source_name: "GitHub (NVIDIA-NeMo/Switchyard, Apache-2.0)"
referrer_url: "https://news.hada.io/topic?id=33566"
published_at: "2026-09-02"
summarized_at: "2026-09-12"
category: "ai"
tags: ["model-routing", "llm-proxy", "nvidia-nemo", "openai-compatible", "anthropic-compatible", "cost-optimization", "open-source", "rust"]
---

# Switchyard (NVIDIA NeMo)

> 출처: [GitHub - NVIDIA-NeMo/Switchyard](https://github.com/NVIDIA-NeMo/Switchyard) (NVIDIA NeMo · GitHub · GeekNews(id=33566) 경유) · 정리일 2026-09-12

## 한 줄 요약

**NVIDIA NeMo 팀이 낸 Rust 기반 오픈소스 프록시 Switchyard는 클라이언트가 쓰는 OpenAI/Anthropic API 형식을 그대로 유지한 채, 요청마다 "일을 해낼 수 있는 가장 싼 모델"로 트래픽을 나눠 보낸다 — 다만 자체 공개한 Terminal-Bench 2.1 벤치마크에서도 가장 잘 나온 라우팅 전략(Escalation)조차 Opus 4.8 단독 대비 정확도 75.7%·비용 13.3% 절감에 그쳐, "모델을 갈아타도 API는 안 바꿔도 된다"는 편의성과 "그래서 실제로 얼마나 이득인가"는 별개 질문임을 프로젝트 스스로 드러낸다.**

## 핵심 포인트

- **핵심 제안** — README의 표현을 그대로 옮기면 ***"Switchyard routes each LLM call to the cheapest model that can still do the job"***(스위치야드는 각 LLM 호출을 "그 일을 해낼 수 있는 가장 싼 모델"로 라우팅한다). 클라이언트는 OpenAI Chat, OpenAI Responses, Anthropic Messages 세 형식 중 기존에 쓰던 것을 그대로 쓰고, 실제 어느 모델·제공자로 보낼지는 Switchyard가 판단한다.
- **네 가지(문서상 최대 여섯 가지) 라우팅 전략** — passthrough(라우팅 없음, 단일 모델 통과)·random(균등/가중 무작위, 베이스라인용)·LLM classifier(첫 요청을 LLM이 판단해 분류, 71.2% 정확도·$79.32)·stage router(도구 호출 응답 등 대화 진행 신호를 패턴매칭 또는 LLM으로 판단해 다음 모델 결정, 72.7% 정확도·$68.19)까지가 기본 제공이고, 문서는 escalation(효율 모델로 시작해 필요시 상향, 75.7%·$85.00)과 advisor gate(강한 모델이 약한 모델의 계획을 승인, 43.8%→54.7% 개선) 같은 확장 전략도 함께 소개한다.
- **세 가지 배포 형태** — ①기존 게이트웨이에 얹는 NeMo Relay 플러그인, ②자체 인프라에 심는 라이브러리 임베딩, ③OpenAI/Anthropic SDK 클라이언트가 바로 붙는 독립 프록시(`switchyard-server`) — 라이브러리로만 쓰면 실제 호출·인증·재시도는 기존 애플리케이션이 맡고 Switchyard는 "어느 모델로 보낼지"만 판단하는 하이브리드 구조다.
- **벤치마크는 Terminal-Bench 2.1, 기준선은 Opus 4.8 단독** — README가 명시한 데이터셋은 ***"the v0.2.0 Terminal-Bench 2.1 results"***이며, 가장 좋은 성적을 낸 escalation 라우팅도 Opus 4.8 기준선($98.06) 대비 정확도 75.7%·비용 13.3% 절감에 그친다. 즉 최선의 결과조차 "약간 싸지는 대신 정확도를 일부 포기하는" 트레이드오프이지, 압도적 우위가 아니다.
- **개발 단계가 컴포넌트마다 다르고, 서버는 데모용** — 라우팅 로직 라이브러리(`switchyard-libsy`)는 베타, `switchyard-llm-client`·`switchyard-runner`는 알파, 독립 프록시 `switchyard-server`는 ***"Demos and evaluation only. Not for production."***라고 스스로 명시한다. 전체 프로젝트도 ***"Pre-1.0 software. APIs, configuration, and routing behavior can change between releases"***라는 경고가 붙어 있다.
- **커뮤니티 규모** — GitHub 스타 2.9k, 포크 262, 활성 이슈 44개, PR 31개(WebFetch 확인 시점 기준). Apache-2.0 라이선스.

## 인상 깊은 문장

> "Switchyard routes each LLM call to the cheapest model that can still do the job."

> "A standalone OpenAI- and Anthropic-compatible proxy. Demos and evaluation only. Not for production."

## 댓글

이 노트는 GeekNews 토픽(id=33566)을 경유해 발견했지만, **이번 세션 egress 정책상 `news.hada.io`(및 스페인어 미러 `es.news.hada.io`)에 접근하지 못해 hada 댓글 수·논조는 확인할 수 없었다.** WebSearch로 GeekNews 스페인어판 미러의 존재("Switchyard: router de LLM que permite cambiar de modelo sin modificar las API de OpenAI/Anthropic")는 확인했으나 본문·댓글은 열람 불가였다. HN·Lobsters 별도 제출·큐레이션 여부도 검색으로 특정하지 못했다. 대신 GitHub README(원문 직접 열람) 및 WebSearch로 교차 확인한 MarkTechPost·Sudo Scout 등 3차 매체 요약을 근거로 삼았다 — MarkTechPost 원문 자체는 이번 세션에서 egress 차단이라 직접 대조하지 못했고, 그 매체가 GitHub 내용을 정확히 옮겼는지는 WebSearch 스니펫을 통한 간접 확인이다. **이해관계**: NVIDIA NeMo 팀이 자사 프로젝트를 소개하는 README이므로, 경쟁 라우터(LiteLLM, OpenRouter 등) 대비 장단점 비교는 원문에 없고 이 노트도 직접 비교하지 못했다. **n=1 벤치마크**: 공개된 정확도·비용 수치는 Terminal-Bench 2.1이라는 단일 벤치마크, Opus 4.8이라는 단일 기준 모델에 대한 결과로, 다른 태스크·다른 기준 모델에서도 같은 폭의 개선이 나올지는 검증되지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — Fireworks의 "오라클 라우팅 93%"라는 상한과 비교하면, Switchyard의 실측 71~76%가 그 격차를 구체적 숫자로 보여준다

[[2026-07-23-fireworks-kimi-k3-fable-routing]]는 "각 모델을 다 돌려본 뒤 가장 싼 정답을 고르는" 이론적 상한(오라클 라우팅)이 93% 정확도를 낸다고 했고, 그 노트는 동시에 ***"오라클은 실현 불가능한 상한이지 실제 라우터가 내는 값이 아니다"***라고 못박았다. Switchyard는 바로 그 "실제 라우터"의 실측치를 공개한 사례다 — LLM classifier 71.2%, stage router 72.7%, escalation 75.7%. 오라클 상한 93%와 실제 최선 75.7% 사이의 약 17%p 격차가, "라우팅은 이론적으로 매력적이지만 실전 구현은 아직 그 상한에 한참 못 미친다"는 두 노트 공통의 결론을 숫자로 잇는다.

### 핵심 전이 2 — Breunig의 "감으로 하던 작업별 모델 배치"를 자동화하려는 시도이지만, 아직 그 자동화가 감보다 낫다는 증거는 없다

[[2026-08-25-fable-end-of-free-lunch-model-routing]]는 Drew Breunig가 "설계는 비싼 모델(Fable), 반복 실행은 싼 모델(GLM)"로 사람이 직접 작업을 나눠 배치하는 워크플로를 소개했고, 그 노트는 ***"감으로 정한 라우팅이 실제로 맞았나"***라는 물음을 열어뒀다. Switchyard는 정확히 그 "감"을 알고리즘(LLM classifier, stage router, escalation)으로 대체하려는 시도다. 하지만 Switchyard 자신의 벤치마크가 보여주듯 자동 라우팅의 최선(75.7%·13.3% 절감)이 사람의 직관적 분업보다 확실히 낫다는 비교 데이터는 이 프로젝트에도, Breunig의 글에도 없다 — 두 접근 다 "검증된 라우팅"이 아니라는 점에서 아직 같은 선 위에 있다.

### 핵심 전이 3 — CLIProxyAPI와 "API 형식을 유지한다"는 동일한 표면이지만, 목적과 정당성이 정반대다

[[2026-09-04-cliproxyapi-oauth-account-to-api]]도 "클라이언트는 기존 API 형식을 그대로 쓰고, 뒤에서 실제 제공자를 바꿔 부른다"는 같은 기술적 패턴을 쓴다. 하지만 CLIProxyAPI는 구독 계정의 OAuth를 API처럼 재판매해 각 서비스의 이용약관을 우회하는 회색지대 도구였던 반면, Switchyard는 정식 API 키·정식 계약 경로를 전제로 비용·성능을 최적화하는 라우터다. 같은 "API 호환 프록시"라는 기술 형태가 한쪽은 벤더와의 계약을 어기는 방향으로, 다른 쪽은 벤더 관계를 그대로 둔 채 비용만 줄이는 방향으로 쓰일 수 있다는 대비가 뚜렷하다.

## 호스피탈리티 / CRS 적용 포인트

**원칙은 유용하지만 지금 이 프로젝트 자체를 도입할 단계는 아니다.** "요청마다 그 일을 해낼 수 있는 가장 싼 모델로 보낸다"는 설계 사상은 온다 CRS의 AI 기능(예약 문의 자동 응답, 채널 매핑 코드 생성, 정산 이상치 설명 등)에도 그대로 적용해볼 만하다 — 반복적이고 실패 비용이 낮은 요청은 저비용 모델로, 예약 상태 전이처럼 실패 비용이 큰 요청은 상위 모델로 escalation하는 구조는 [[2026-08-25-fable-end-of-free-lunch-model-routing]]에서 이미 짚은 CRS 적용점과 같은 방향이다. 다만 Switchyard 자체는 `switchyard-server`가 스스로 "데모·평가용, 프로덕션 아님"이라 밝히고 있고, 벤치마크도 Terminal-Bench 2.1 단일 태스크군에 국한돼 예약·정산처럼 도메인이 다른 워크로드에 그대로 옮길 근거가 부족하다. 프로덕션에 라우팅 레이어를 넣는다면 이미 성숙한 LiteLLM 같은 프록시나 OpenRouter([[2026-08-20-openrouter-joining-stripe]]) 같은 상용 애그리게이터와 먼저 비교하고, Switchyard는 "라우팅 전략 설계"를 배우는 참고 자료 정도로 취급하는 편이 정직하다.

## 연관 자료

- [[2026-07-23-fireworks-kimi-k3-fable-routing]] — "오라클 라우팅 93%"라는 이론적 상한, Switchyard의 실측 71~76%가 그 상한과의 격차를 보여줌
- [[2026-08-25-fable-end-of-free-lunch-model-routing]] — 사람이 감으로 하던 "작업별 모델 배치"를 Switchyard가 알고리즘으로 자동화하려는 대상
- [[2026-09-04-cliproxyapi-oauth-account-to-api]] — 같은 "API 형식 유지 프록시" 패턴이지만 약관 우회(CLIProxyAPI) vs 정식 라우팅 최적화(Switchyard)로 갈리는 대비
- [[2026-08-20-openrouter-joining-stripe]] — 같은 "모델 라우팅" 문제를 오픈소스 자체 호스팅(Switchyard)이 아니라 상용 애그리게이터로 푸는 대안

## 한 달 뒤 회고

*(2026-10-12 즈음: ①`news.hada.io` 접근이 풀리면 hada 댓글 수·논조와 HN/Lobsters 큐레이션 여부를 재확인했는지 ②Switchyard가 pre-alpha를 벗어나 프로덕션 권장 단계로 올라섰는지, v1.0 로드맵에 진전이 있었는지 ③Terminal-Bench 2.1 외 다른 벤치마크·다른 기준 모델로 확장된 결과가 나왔는지 확인.)*
