---
title: "Microsoft-Decision-1 (Microsoft) — 선택지별 확률만 반환하는 저비용 의사결정 모델이 Jev 계보에 빅테크 중에서는 처음으로 합류했다, 그런데 36개 벤치마크 1위라는 숫자의 1차 출처는 결국 Microsoft 자신이다"
source_title: "Microsoft-Decision-1"
source_url: "https://runtimewire.com/article/microsoft-decision-1-achint-srivastava-agent-workflows"
source_name: "복수 매체 교차보도(runtimewire.com, testingcatalog.com, cryptobriefing.com, windowsreport.com 등)"
referrer_url: "https://news.hada.io/topic?id=35100"
published_at: "2026-10-09"
summarized_at: "2026-10-11"
category: "ai"
tags: ["decision-model", "jev", "microsoft", "qwen", "model-routing", "classification", "foundry"]
---

# Microsoft-Decision-1 (Microsoft)

> 출처: [Microsoft-Decision-1](https://runtimewire.com/article/microsoft-decision-1-achint-srivastava-agent-workflows) (복수 매체 교차보도) · GeekNews(id=35100) 경유 · 정리일 2026-10-11

> **출처 한계**: `news.hada.io`와 Microsoft 공식 발표(Achint Srivastava 작성 추정) 모두 이번 세션에서 egress 차단으로 직접 열람하지 못했다. `runtimewire.com`, `testingcatalog.com`, `cryptobriefing.com`, `windowsreport.com`, `digitaltoday.co.kr`, `digg.com` 등도 전부 차단돼 WebSearch 스니펫으로만 교차확인했다. **핵심 수치(36개 벤치마크 1위, 147,137문항, 83.5% 정확도, 가격, 지연시간 배수)는 여러 독립 매체에서 일관되게 보도되지만, 그 매체들의 1차 출처가 결국 Microsoft 자신이 공개한 벤치마크 리포트라는 점은 감안해야 한다** — 독립 재현 검증은 확인하지 못했다. hada 댓글 수·HN/Lobsters 큐레이션 유무도 확인하지 못했다.

## 한 줄 요약

**Microsoft가 Qwen3.5-9B를 후속 학습(post-training)한 저비용 의사결정 모델 Microsoft-Decision-1을 2026-10-09 Foundry에 공개했다 — 문장을 생성하는 대신 고정된 선택지마다 보정된 확률을 반환하는 구조로, 분류·모델 라우팅·우선순위 지정·검증·에이전트 제어에 쓰도록 설계됐다. Microsoft 자체 평가로 36개 벤치마크·약 14.7만 문항에서 평균 정확도 83.5%로 비교 모델 중 1위를 기록했고, GPT-6 Sol 대비 P50 지연시간 35배, 2위 모델 대비 4.5배 빠르다고 주장한다. 입력 $0.042/백만 토큰·출력 무료라는 가격 구조는 이 가든에 이미 쌓인 Jev류 모델들과 거의 동일하다.**

## 핵심 포인트

- **구조 — 생성 대신 채점** — 자유 텍스트를 생성하지 않고, 고정된 선택지 집합을 받아 각 선택지에 보정된 확률을 매기는 단일 패스 구조다. 용도는 ***분류, 모델 라우팅, 우선순위 지정, 검증, 에이전트 제어***로 보도된다 — 이 가든에 쌓인 Jev 계보([[2026-09-16-typesafe-ai-jev-typed-judgments]])의 Noul/Choice/Score 세 가지 판단 타입과 설계 철학이 거의 같다.
- **베이스 모델과 향후 계획** — Alibaba의 오픈웨이트 Qwen3.5-9B를 후속 학습한 버전이며, Microsoft는 추후 자사 MAI·OpenAI 모델 기반으로 재구축할 계획이라고 보도된다.
- **벤치마크 — 36개·약 14.7만 문항에서 83.5%, 그러나 1차 출처는 Microsoft 자신** — 학습 데이터에서 제외된(withheld) 36개 벤치마크·약 147,137문항 평가에서 평균 정확도 83.5%로 비교 대상 중 1위라고 보도된다. 다만 재현에 필요한 전체 데이터셋·지연시간 측정 조건은 공개되지 않았다는 지적이 여러 매체에서 공통으로 나온다.
- **속도 — P50 기준 2위 대비 4.5배, GPT-6 Sol 대비 35배** — 이 역시 Microsoft 자체 평가 환경 수치다. 가격은 입력 $0.042/백만 토큰, 출력은 무료 — ***Jev의 공개 가격과 숫자 단위까지 동일***하다.
- **내부 활용 사례** — Xbox 리서치가 플레이어 피드백 1만여 건을 기존 방식보다 약 14배 빠르게 라벨링했고, Copilot 팀이 품질 검증에 활용했다고 보도된다. X(트위터)에서는 "Qwen3.5-9B 베이스에 용량 하나뿐이고 텍스트만 지원한다"는 회의적 반응도 있었다고 전해진다.

## 인상 깊은 문장

> "achieved the highest accuracy in a 36-benchmark evaluation covering nearly 150,000 questions withheld from training" (WebSearch 교차확인 스니펫 재인용, 복수 매체 공통 서술)

## 댓글

**hada 댓글 수는 확인하지 못했다**(원문 차단). **정직하게 감안할 점**: (1) 36개 벤치마크 1위·83.5%라는 헤드라인 수치는 Microsoft 자체 평가이고, 같은 유형의 한계가 이 가든의 [[2026-10-02-cloudflare-clef-decision-model]]·[[2026-09-21-jev-field-guide-system-one-model]]에서도 반복 확인됐다 — "저자 자체 측정"이라는 꼬리표는 이 카테고리 전체에 공통이다. (2) 재현에 필요한 전체 데이터셋·지연시간 측정 조건(하드웨어, 네트워크 경로)이 공개되지 않았다는 지적이 복수 매체에서 공통으로 나왔다는 점은, Cloudflare Clef 발표 당시 벤치마크 조건 비공개 지적이 반복됐던 것과 같은 패턴이다. (3) X의 회의적 반응("Qwen 베이스 하나뿐, 텍스트만")은 단일 플랫폼 코멘트 수준이라 비중을 과장하면 안 되지만, Jev 계보 전체가 받아온 "독립 재현이 아직 없다"는 비판과 결이 같다.

## 내 생각 · 적용점

### 핵심 전이 1 — Jev 계보에 "빅테크가 직접 낸 두 번째 사례"가 더해졌고, 체급·주체 지도가 한 칸 더 채워졌다

[[2026-10-08-strands-decider-2b-decision-model]]은 Jev 대안들을 체급(모델 크기)×주체(독립 개발자/플랫폼 벤더) 두 축으로 분류했다 — Laya(작은 체급·독립 개발자), Clef(큰 체급·플랫폼), Strands Decider(작은 체급·플랫폼). Microsoft-Decision-1은 Qwen3.5-9B 기반이라 체급은 Clef-flash(9B)와 같은 급이고, 주체는 Clef와 마찬가지로 ***플랫폼 벤더가 직접 낸 것***이다. 즉 "큰 체급을 플랫폼이 냈다"는 자리에 Cloudflare 다음으로 Microsoft가 두 번째로 들어온 셈이다 — ***이 신생 카테고리를 빅테크들이 거의 동시에 흡수하고 있다***는 그림이 Cloudflare 단독 사례였을 때보다 훨씬 또렷해진다.

### 핵심 전이 2 — "가격·숫자 단위까지 Jev와 동일"은 독자적 설계가 아니라 명시적 벤치마킹의 증거다

Microsoft-Decision-1의 가격(입력 $0.042/백만 토큰, 출력 무료)은 [[2026-09-21-jev-field-guide-system-one-model]]이 정리한 Jev의 공개 가격과 ***소수점까지 완전히 같다***. 이건 우연이 아니라 Microsoft가 Jev를 직접 겨냥한 가격 책정을 했다는 뜻으로 읽는 게 합리적이다 — Cloudflare Clef가 "더 빠르지만 6배 비싸다"는 차별화 전략을 택했다면, Microsoft는 반대로 ***가격에서는 아예 차별화하지 않고 속도·벤치마크 우위만 주장***하는 전략을 택한 셈이다. 같은 틈새 시장에 뛰어든 두 빅테크가 서로 다른 포지셔닝(가격 경쟁 vs 가격 동일+성능 우위)을 택했다는 점이, 이 시장이 아직 "표준 가격"으로 수렴하지 않았다는 신호다.

### 핵심 전이 3 — "분해가 모델 교체보다 이득이 크다"는 가든의 결론이 Microsoft-Decision-1 도입 판단에도 그대로 적용돼야 한다

[[2026-09-21-jev-field-guide-system-one-model]]이 Jev의 공개 평가표를 직접 재계산해 내린 결론은 ***"같은 정책을 프롬프트 한 방으로 묻는 것과 코드로 쪼갠 워크플로로 묻는 것 사이의 차이가, 더 비싼 모델로 바꾸는 이득보다 크다"***였다. Microsoft-Decision-1의 83.5%·36개 벤치마크 수치도 이 분해 여부를 분리해서 보여주지 않는다 — "분해된 질문에서 나온 숫자인지, 단일 프롬프트 질문에서 나온 숫자인지"가 공개되지 않았다는 뜻이다. 도입을 검토한다면 Microsoft-Decision-1을 Jev나 Clef와 바로 비교하기 전에, ***지금 쓰는 모델로 먼저 질문을 분해했을 때 점수가 얼마나 오르는지***부터 측정해야 한다는 가든의 반복되는 원칙이 여기도 그대로 적용된다.

## 호스피탈리티 / CRS 적용 포인트

CRS의 문의 분류·에이전트 다음 행동 선택에 저비용 판단 모델을 검토 중이라면, 이번 사례는 "선택지가 하나 더 늘었다" 이상의 의미가 있다.

- **벤더 선택의 폭이 넓어졌다는 것은 역으로 "먼저 분해를 측정하라"는 원칙이 더 중요해졌다는 뜻이다.** Jev, Clef, Strands Decider, Microsoft-Decision-1까지 선택지가 늘수록 "어느 모델이 가장 정확한가"로 먼저 비교하고 싶은 유혹이 커지지만, [[2026-09-21-jev-field-guide-system-one-model]]의 결론대로 ***모델 선택보다 질문 분해가 더 큰 변수***라는 게 반복 확인된 이상, 벤더 비교에 들어가는 시간을 분해 규율을 세우는 데 먼저 쓰는 게 합리적이다.
- **가격이 Jev와 동일하다는 점은 벤더 락인 비용을 낮춘다.** 이미 Jev 호환 API로 통합해둔 코드가 있다면(또는 Clef처럼 호환 API를 낸 벤더가 더 나온다면), Microsoft-Decision-1로의 교체 비용도 낮아질 가능성이 있다 — 다만 API 호환 여부는 이번 보도에서 확인되지 않았으므로 추측이다.
- **한국어 실측은 여전히 공백이다.** [[2026-09-21-jev-field-guide-system-one-model]]이 짚었듯 이 계열 모델 전체가 한국어 검증 자료를 공개하지 않고 있다 — Microsoft-Decision-1도 마찬가지로 한국어 성능에 대한 언급이 보도에 없다. 도입 검토의 첫 단계는 벤치마크 비교가 아니라 실제 한국어 CRS 문의 수백 건으로 만든 자체 평가셋이어야 한다는 원칙은 이 모델에도 변함없이 적용된다.

## 연관 자료

- [[2026-10-08-strands-decider-2b-decision-model]] — Jev 대안을 체급×주체로 분류한 지도, Microsoft-Decision-1이 그 지도에서 Cloudflare Clef와 같은 "빅테크 플랫폼 직접 출시" 칸에 들어간다.
- [[2026-10-02-cloudflare-clef-decision-model]] — "플랫폼이 신생 카테고리를 흡수한다"는 패턴의 선행 사례, 가격 전략(더 비싸게 차별화)이 Microsoft와 대조된다.
- [[2026-09-21-jev-field-guide-system-one-model]] — "분해가 모델 교체보다 이득이 크다", "판단 모델을 유일한 실행 게이트로 쓰면 그 게이트가 공격면이 된다"는 이 계열 전체에 적용되는 핵심 원칙들.
- [[2026-09-16-typesafe-ai-jev-typed-judgments]] — 이 카테고리의 원형 "System One 모델" Jev의 출시 정리.

## 한 달 뒤 회고

*(2026-11-11 즈음 — Microsoft-Decision-1의 36개 벤치마크 수치에 독립 재현 검증이 나왔는지, Jev API와의 호환 여부가 공개됐는지, 한국어 실측 자료가 하나라도 나왔는지, 그리고 Jev·Clef·Strands Decider·Microsoft-Decision-1 네 모델을 동일 조건에서 비교한 제3자 벤치마크가 등장했는지 확인.)*
