---
title: "Muse Spark Open (Meta) — Zuckerberg가 8월에 '곧'이라 했던 오픈 웨이트 약속이 두 달 넘어 지켜졌다, 다만 M5 Ultra Mac Studio 두 대가 있어야 돌아가는 '로컬'이다"
source_title: "확인 불가 (Meta 공식 발표로 추정, 원문 대조 못함)"
source_url: "미확인 (GeekNews 링크로 대체)"
source_name: "미확인 — 1차 소스 확보 실패"
referrer_url: "https://news.hada.io/topic?id=35431"
published_at: "확인 불가"
summarized_at: "2026-10-16"
category: "ai"
tags: ["meta", "muse-spark", "open-weights", "moe", "local-ai", "coding-agent", "multimodal"]
---

# Muse Spark Open (Meta)

> 출처: 원문 특정 실패 — GeekNews(id=35431) 경유 · 정리일 2026-10-16

> **출처 한계**: `news.hada.io`와 Meta 공식 발표 모두 이 세션에서 WebFetch가 전면 차단됐다(이 세션은 `en.wikipedia.org`까지 막혀 세션 전체의 egress 제약으로 판단). WebSearch로 이번 공개의 핵심 수치(전체 8,160억 파라미터, 토큰당 활성 420억, MCP-Atlas 89.2점)를 1차로 확인하지 못했다. 다만 맥락은 뚜렷하게 교차확인된다 — officechai.com 보도(WebSearch 스니펫)는 Mark Zuckerberg가 2026-08에 "Muse Spark의 오픈 웨이트 버전을 곧 내놓겠다"고 밝혔다고 전하고, epoch.ai는 Muse Spark 1.1·1.2를 10월 기준까지도 비공개(closed-weights)로 분류해왔다. 즉 "곧"이라던 약속이 최소 두 달 넘게 지켜지지 않았다는 선행 사실은 확인되지만, 이번 "Muse Spark Open"이 그 약속의 실제 이행인지, 1.2/1.3과 같은 체크포인트인지는 이번 세션에서 확정하지 못했다.

## 한 줄 요약

**Meta가 코딩과 여러 단계의 에이전트 작업에 특화된 대형 모델 Muse Spark의 오픈 웨이트 버전 "Muse Spark Open"을 공개했다 — 전체 8,160억 파라미터 중 토큰당 420억 개만 활성화하는 MoE 구조로 약 100만 토큰 컨텍스트를 지원하며, 메모리 512GB짜리 M5 Ultra Mac Studio 두 대에서 MLX로 NVFP4 양자화 모델을 실행할 수 있다고 소개됐다. 이번 세션 WebSearch로는 이 816B/42B 수치와 MCP-Atlas 89.2점이라는 자체 평가를 1차로 확인하지 못했지만, Alexandr Wang이 8월에 밝혔던 "곧 오픈 웨이트로 풀겠다"는 약속이 10월까지도 지켜지지 않았다는 선행 기록([[2026-08-11-zuckerberg-open-model-return-closed-ai-critique]])과 맞춰보면, 두 달 넘게 미뤄졌던 그 약속이 이제야 이행된 것으로 보인다.**

## 핵심 포인트

- **모달리티와 용도** — 텍스트·이미지·영상·오디오 입력으로 ***소프트웨어 개발·도구 사용·멀티모달 추론***에 쓰도록 설계. Muse Code와 연결해 iOS 앱 수정·빌드, DaVinci Resolve 영상 편집까지 로컬에서 수행한다고 소개됐다.
- **아키텍처 — Glimmer의 27배 규모** — 전체 8,160억 파라미터 MoE, 토큰당 활성 파라미터 420억(약 5%), 컨텍스트 ***약 100만 토큰***. [[2026-08-11-meta-muse-glimmer-30b-local-agentic]]의 30B 증류 모델과 비교하면 ***규모가 27배*** 차이 나는, Glimmer의 "교사 모델"에 해당하는 몸통이다.
- **실행 요구사항 — "로컬"의 실제 문턱** — 메모리 512GB M5 Ultra Mac Studio ***두 대***에서 MLX로 NVFP4 모델 실행. [[2026-09-22-m5-ultra-mac-studio-review-local-ai-agents]]가 "로컬 에이전트의 꿈의 맥"이라 리뷰했던 바로 그 하드웨어지만, 그 리뷰는 단일 대수 기준이었다 — 이번엔 두 대를 묶어야 하는 수준이라는 게 "로컬 실행 가능"이라는 표현의 실제 문턱을 보여준다.
- **자체 평가** — MCP-Atlas 89.2점(Slack 발췌는 뒤가 잘려 추가 벤치마크 수치를 확인하지 못했다) — 1차 소스 미확보로 ***벤더 자체 보고 수치임을 감안해야 한다.***
- **약속의 타임라인** — WebSearch로 교차확인한 바, Wang은 8월에 "오픈 웨이트 Muse Spark가 곧 온다"고 밝혔지만 epoch.ai는 10월 기준까지 1.1·1.2를 모두 비공개로 분류해왔다. ***"곧"이 실제로는 두 달 넘게 걸린 셈***이고, 이번 "Open" 버전이 1.2/1.3과 같은 체크포인트인지 또 다른 신규 빌드인지는 이번 세션에서 확인하지 못했다.

## 인상 깊은 문장

> (WebSearch 스니펫 재인용) "Meta will release an open weights version of its flagship AI model Muse Spark 'soon'." — Mark Zuckerberg, officechai.com 2026-08 보도 재인용

## 댓글

**hada 댓글 수 확인 불가.** 이 분야 전반이 벤더 자체 발표에 크게 의존한다는 패턴([[2026-10-11-typesafe-ai-jev-series-a]]·[[2026-10-11-microsoft-decision-1-decision-model]])과 같은 결이라는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "오픈소스로 돌아온다던 Meta"에 대한 지연된 답

[[2026-08-11-zuckerberg-open-model-return-closed-ai-critique]]에서 비판받았던 "오픈소스로 돌아온다던 Meta가 실제로는 폐쇄적"이라는 지적에 대한 지연된 응답으로 읽힌다. 약속과 실행 사이의 간극이 두 달 넘게 벌어졌다는 사실 자체가, [[2026-08-03-us-open-model-paradox]]가 짚은 "오픈웨이트 과점 재편" 서사에서 Meta의 위치를 다시 묻게 한다.

### 핵심 전이 2 — Glimmer와 Spark Open, 같은 회사가 "로컬"이라 부르는 두 극단

Glimmer(30B, 20GB 미만 양자화, 소비자 GPU 한 장)와 Spark Open(816B, Mac Studio 두 대, 512GB×2)은 ***같은 회사가 "로컬 실행"이라는 말로 가리키는 두 극단***이다. [[2026-10-12-local-ai-models-cloud-shift-catalyst]]가 주장한 "미니PC에서도 최첨단과 격차가 6개월 미만"이라는 낙관과, 512GB×2대가 필요한 모델이 동시에 "로컬 AI"로 묶이는 상황이 공존한다는 건 그 낙관의 전제 자체를 다시 보게 만든다 — "로컬"이라는 단어가 하드웨어 문턱을 가리지 못하면 마케팅 용어로 전락한다.

### 핵심 전이 3 — 비공개 API에서 열린 가중치로

[[2026-09-03-meta-muse-spark-1-3-release]](도구 호출 20%·토큰 25% 감소)가 추구하던 "긴 작업 지구력" 축의 연장선이지만, 그 노트는 비공개 API 기준이었고 이번엔 가중치 자체가 열렸다는 게 다르다 — 처음으로 독립 재현·검증이 가능해졌다는 의미다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 매우 멀다** — 온다 규모의 B2B 회사가 M5 Ultra Mac Studio 두 대(수천만 원대 하드웨어)를 돌릴 이유가 없고, 100만 토큰 컨텍스트·영상 편집 같은 용도도 CRS 도메인과 거리가 있다. 다만 "오픈 웨이트 공개가 독립 검증·온프레미스 실행 가능성을 여는 것처럼, 벤더 선정 시 이 모델/API가 닫힌 블랙박스인가 열려있는가"를 체크리스트 항목으로 유지하는 원칙만 전이한다.

## 연관 자료

- [[2026-08-11-meta-muse-glimmer-30b-local-agentic]] — 반대 극단의 로컬 모델, Spark Open과의 27배 규모 대비
- [[2026-09-03-meta-muse-spark-1-3-release]] — 비공개 API 시절의 Muse Spark, 이번 공개로 가중치가 열리며 비교가 가능해짐
- [[2026-09-22-m5-ultra-mac-studio-review-local-ai-agents]] — 이번 공개가 요구하는 바로 그 하드웨어, 다만 단일 대수 기준이던 리뷰
- [[2026-10-12-local-ai-models-cloud-shift-catalyst]] — "로컬 AI가 격차를 좁힌다"는 낙관, 이번 공개의 하드웨어 문턱과 대조
- [[2026-08-11-zuckerberg-open-model-return-closed-ai-critique]] — 8월의 오픈 웨이트 약속, 이번 공개로 지연 이행됐을 가능성
- [[2026-08-03-us-open-model-paradox]] — 오픈웨이트 과점 재편 서사에서 이번 공개가 갖는 위치

## 한 달 뒤 회고

*(2026-11-16 즈음 — ①이 공개가 실제 Meta 공식 발표였는지, MCP-Atlas 89.2점이 독립 재현됐는지, ②Muse Spark 1.2/1.3과의 체크포인트 관계가 명확해졌는지, ③단일 Mac이나 더 낮은 하드웨어 문턱으로 실행 가능한 양자화 버전이 나왔는지 점검.)*
