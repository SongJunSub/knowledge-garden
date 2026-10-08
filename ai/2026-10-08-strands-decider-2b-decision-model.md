---
title: "Strands Decider 2B (AWS Strands Labs) — Qwen3.5-2B의 언어모델 헤드를 떼고 포인터 헤드를 붙여, 도구를 부르기 전에 '정말 근거가 있는가'를 한 번의 순전파로 묻는 오픈소스 결정 모델"
source_title: "strands-decider"
source_url: "https://github.com/strands-labs/strands-decider"
source_name: "GitHub (strands-labs/strands-decider), Hugging Face"
referrer_url: "https://news.hada.io/topic?id=34934"
published_at: "2026-10-01"
summarized_at: "2026-10-08"
category: "ai"
tags: ["strands-decider", "decision-model", "jev", "aws", "qwen", "pointer-head", "tool-routing", "lora"]
---

# Strands Decider 2B (AWS Strands Labs)

> 출처: [strands-decider (GitHub)](https://github.com/strands-labs/strands-decider) (AWS Strands Labs) · GeekNews([news.hada.io/topic?id=34934](https://news.hada.io/topic?id=34934)) 경유 · 정리일 2026-10-08

> **출처 한계**: news.hada.io와 huggingface.co 모두 이 세션에서 egress 차단으로 직접 열지 못했지만, GitHub 저장소 README는 raw.githubusercontent.com을 통해 직접 확보(1차 출처)해 아키텍처·학습 방법·JevBench 성능표·사용 예시·라이선스까지 전문을 확인했다. 날씨 도구 호출 예시(사용자가 도시를 말하지 않았을 때)의 구체적 질문 2개와 코드는 README가 `examples/strands/README.md`로 위임해 직접 확인하지 못했다. hada 댓글 수·HN/Lobsters 큐레이션 유무도 확인 불가.

## 한 줄 요약

**Strands Decider 2B는 문장을 생성하는 대신 선택지·점수·신뢰도만 반환하는 20억 파라미터 오픈소스 "결정 모델"로, Qwen3.5-2B의 언어모델 헤드를 떼고 약 100만 파라미터짜리 포인터 헤드를 붙여 한 번의 순전파로 판단한다 — 사용자가 도시를 말하지 않았는데 에이전트가 날씨 도구를 호출하려 할 때, 그 인자가 실제 대화에 근거하는지 확인해 되묻게 만드는 용도로 쓸 수 있다.**

## 핵심 포인트

- ***아키텍처*** — Qwen3.5-2B-Base 디코더를 토대로 쓰되 언어모델 헤드를 버리고, `<answer>` 위치의 hidden state와 각 선택지 마지막 토큰의 hidden state를 비교해 점수를 매기는 ***포인터 헤드(약 100만 파라미터)***를 붙인다. 생성이나 디코딩 루프 없이 ***forward pass 한 번***으로 끝난다. torso에는 rank-16 LoRA를 적용하고, 헤드는 fp32로 돈다. 선택지별 전용 파라미터가 없어 ***선택지 수에 제한이 없고***, 레이블 집합을 요청마다 자유롭게 정의할 수 있다.
- ***세 가지 질문 유형*** — 같은 masked softmax를 `noul`(예/아니오), `choice`(N개 중 하나), `score`(순서가 있는 척도)로 읽는다. 날씨 도구 호출 전 "사용자가 도시를 언급했는가" 같은 예/아니오 판단으로 `before_tool_call` 개입을 걸어, 임의로 추측하는 대신 "어느 도시인가요"를 되묻게 만드는 것이 README가 드는 예시다.
- ***성능 — JevBench 공개셋 231문항 중 72.3%(v19) → 76.2%(v21, 6개 시드 평균 75.8%)***. 다만 README는 ***v19-v21 비교를 "측정된 개선이 아니라 단일 실행 두 개로 읽으라"***고 자체 경고한다. 과제 수가 적어 10개 이하 차이는 해석이 불확실하다고도 명시한다. 경쟁 오픈모델 Mapika decider-2b v11이 76%로 비슷한 수준이라는 보도가 있다.
- ***지연시간*** — RTX 3090에서 중앙값 115ms·p95 299ms, M3 Pro 웜 상태 중앙값 153ms. 짧은 분류 과제에서 신뢰도 0.9 이상 응답의 약 95%가 맞다고 주장하며, 0.9 미만이면 사람 확인을 권한다.
- ***학습·공개*** — Apache 2.0, `pip install strands-decider`로 설치. 학습은 RTX 3090 1장에서 약 11시간, H100 8장(FAST 모드)에서 약 1시간 10분. v9 이후 모든 학습 실행은 사전에 예측·실패 조건을 명시하고 결과를 기존 기록에 덧붙이기만 하는 연구 규칙을 둔다.

## 인상 깊은 문장

> "Type safety is not factual correctness. Would you say a linear classifier hallucinates?" (Jev 창업자 CompleteSkeptic, [[2026-09-21-jev-field-guide-system-one-model]]이 인용한 HN 발언 — Strands Decider와 같은 결정 모델 계열 전체에 적용되는 경고)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다. README 자체가 정직한 편이다 — v19 대비 v21의 개선폭을 "노이즈일 수 있다"고 스스로 깎아 말하고, 신뢰도 임계값(0.9)을 "확인되지 않은 추정"으로 다루라고 권한다. 다만 72~76%라는 수치는 ***JevBench라는 TypeSafe Jev 생태계 벤치마크*** 위에서 측정된 것이라, Strands Decider가 Jev류 모델의 "경쟁작"이라는 틀 안에서 스스로를 채점하고 있다는 점은 감안해야 한다 — 독립 벤치마크나 제3자 재현은 이 세션에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 계보에 "같은 시장을 노리는 빅테크판 재구현"이 하나 더 늘었다

[[2026-09-16-typesafe-ai-jev-typed-judgments]]가 처음 정리한 TypeSafe Jev("System One 모델") 이후, 이 가든에는 [[2026-09-20-laya-open-source-jev-alternative]](421M 오픈웨이트, 독립 스타트업)과 [[2026-10-02-cloudflare-clef-decision-model]](27B/9B, 인프라 플랫폼이 직접 공개)까지 서로 다른 체급·주체의 Jev 대안이 쌓여 있다. Strands Decider 2B는 ***"빅테크 클라우드 업체가 작은 체급(2B)으로 낸 Jev 대안"***이라는 세 번째 변주다 — Laya가 "작은 체급을 독립 개발자가", Clef가 "큰 체급을 플랫폼이" 냈다면, Amazon은 그 중간에서 "작은 체급을 플랫폼이" 내놓은 셈이다. 이 가든에 쌓인 계보로 보면, 결정 모델이라는 새 카테고리가 체급·주체 두 축으로 빠르게 세분화되고 있다는 그림이 또렷해진다.

### 핵심 전이 2 — Jev 필드 가이드의 "분해가 모델 교체보다 큰 이득"이라는 결론이 여기서도 유효할 가능성이 크다

[[2026-09-21-jev-field-guide-system-one-model]]은 Jev의 벤더 평가표를 직접 계산해 "같은 정책을 프롬프트 한 방으로 묻는 것과 코드로 쪼갠 워크플로로 묻는 것" 사이의 차이(+5~+35포인트)가 모델을 더 비싼 걸로 바꾸는 이득보다 크다고 결론 냈다. Strands Decider 2B의 JevBench 72~76%라는 수치도 ***분해되지 않은 질문 설계에서 나온 것인지, 분해된 질문에서 나온 것인지***를 README가 명시하지 않는다. 이 가든의 교훈을 그대로 적용하면, Strands Decider를 도입하기 전에 먼저 "질문을 더 좁게 쪼개면 같은 모델로도 점수가 오르는가"를 측정하는 게 모델 선택보다 우선한다.

## 호스피탈리티 / CRS 적용 포인트

도구 호출 게이트·모델 라우팅에는 접점이 있지만, CRS 프로덕션에 바로 넣기엔 이르다.

- README의 날씨 도구 예시(도시를 말하지 않았는데 도구를 호출하려 할 때 되묻게 만드는 것)는 CRS 에이전트에도 그대로 적용 가능한 패턴이다 — 예를 들어 "객실 가격을 묻는 요청에 체크인 날짜가 실제로 언급됐는가"를 `before_tool_call`로 검사해, 날짜를 추측해서 요금 조회 API를 잘못 호출하는 사고를 막을 수 있다.
- 다만 [[2026-09-21-jev-field-guide-system-one-model]]이 LangChain `AutoModeMiddleware`(Jev 기반 실행 게이트)에서 실측한 교훈 — 벤더 발표 차단율 89% vs 독립 연구자 60~80% 우회 — 이 그대로 경고가 된다. ***판단 모델을 유일한 실행 게이트로 쓰면 그 게이트 자체가 공격 표면이 된다.*** Strands Decider를 도구 호출 전 검증에 쓴다면 OS 권한·허용 경로 검사 같은 최종 경계와 병행해야 하고, 단독 방어선으로 삼지 않아야 한다.
- 2B라는 체급과 Apache 2.0 라이선스는 자체 호스팅 비용·데이터 외부 전송 우려가 pg-jev([[2026-10-08-pg-jev-postgres-natural-language-extension]])보다 낮다는 장점이 있다. 다만 한국어 실측 자료는 README·보도 어디에도 없어, 한국어 CRS 문의에 쓰기 전에는 반드시 자체 평가셋으로 먼저 측정해야 한다.

## 연관 자료

- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — Strands Decider가 겨냥하는 원형 "System One 모델" Jev의 출시 정리.
- [[2026-09-21-jev-field-guide-system-one-model]] — Jev 벤더 평가표를 직접 계산해 "분해가 모델 교체보다 이득이 크다"는 결론과, 실행 게이트로 썼을 때의 우회 사례를 정리한 가이드.
- [[2026-09-20-laya-open-source-jev-alternative]] — 더 작은 체급(421M)의 독립 개발자판 Jev 대안, Strands Decider와 "오픈웨이트 Jev 재구현" 계보를 함께 이룬다.
- [[2026-10-02-cloudflare-clef-decision-model]] — 더 큰 체급(27B/9B)의 플랫폼 벤더판 Jev 대안, Strands Decider와 체급·주체 양쪽에서 대조된다.
- [[2026-10-08-pg-jev-postgres-natural-language-extension]] — 같은 2026-10-08 수집분, TypeSafe Jev를 SQL 레이어로 감싼 사례. 결정 모델이 적용되는 또 다른 인터페이스.

## 한 달 뒤 회고

*(2026-11-08 즈음) v21 이후 버전에서 JevBench 점수가 추가로 움직였는지, 독립 제3자가 Strands Decider·Laya·Clef·Jev를 동일 조건에서 비교한 벤치마크가 나왔는지, 그리고 `before_tool_call` 게이트 방식이 실전에서 우회된 사례가 보고됐는지 확인한다.*
