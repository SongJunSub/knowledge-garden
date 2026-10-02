---
title: "Cloudflare, 의사결정 모델 Clef·Clef-flash 공개 (Cloudflare) — Jev와 API까지 호환되는 오픈소스 대안을 내놓으며, 신생 카테고리를 빠르게 플랫폼이 흡수하는 패턴이 실제로 벌어졌다"
source_title: "Introducing Clef: our open-source decision models, and new RL fine-tuning platform"
source_url: "https://blog.cloudflare.com/clef-decision-models/"
source_name: "Cloudflare 공식 블로그 (blog.cloudflare.com, developers.cloudflare.com), 다수 매체 교차보도"
referrer_url: "https://news.hada.io/topic?id=34621"
published_at: "2026-10-01"
summarized_at: "2026-10-02"
category: "ai"
tags: ["jev", "decision-model", "cloudflare", "workers-ai", "qwen", "rl-fine-tuning", "open-source", "tool-routing"]
---

# Cloudflare, 의사결정 모델 Clef·Clef-flash 공개 (Cloudflare)

> 출처: [Introducing Clef: our open-source decision models, and new RL fine-tuning platform](https://blog.cloudflare.com/clef-decision-models/) (Cloudflare 공식 블로그) · GeekNews(id=34621) 경유 · 정리일 2026-10-02

> **출처 한계**: `news.hada.io`, `blog.cloudflare.com`, `developers.cloudflare.com`, `huggingface.co`, `dev.to`, `theregister.com`, `flaviocopes.com` 모두 이 세션에서 egress 차단돼 1차 소스를 직접 열람하지 못했다. WebSearch로 Slashdot, 01net.it, dev.to(벤치마크 재현 글), MarkTechPost, Hyper.ai, nxcode.io, aicoder.com 등 다수 매체·블로그의 스니펫을 교차확인해 재구성했다. 핵심 수치(파라미터 수, 지연시간, 가격, Jev와의 벤치마크 비교)는 여러 독립 소스에서 일치해 신뢰도가 높지만, **이 수치들의 1차 출처가 결국 Cloudflare 자신이 공개한 벤치마크 리포트라는 점**은 감안해야 한다 — 독립 재현 검증은 아니다. hada 댓글 수·HN/Lobsters 큐레이션 유무는 확인하지 못했다.

## 한 줄 요약

**Cloudflare가 TypeSafe의 Jev를 정조준한 오픈소스 의사결정 모델 Clef(27B, Qwen3.8 기반)와 Clef-flash(9B, Qwen3.5 기반)를 Apache 2.0으로 공개했다 — 문장을 생성하는 대신 스키마로 정의된 선택지마다 확률을 반환하고, 이미지 입력과 64K 컨텍스트를 지원하며 Jev API와 호환돼 기존 통합을 그대로 쓸 수 있다. 10개 의사결정 벤치마크 중 7개에서 Jev를 이겼고 Clef-flash의 응답 시간 중앙값은 38.8ms로 Jev의 524.1ms보다 13배 이상 빨랐지만, 가격은 토큰당 Jev의 약 6배이고 When2Call·BRIGHT 두 벤치마크에서는 오히려 Jev에 뒤졌다.**

## 핵심 포인트

- **동결된 Qwen 백본 + 2단계 어텐션 라우팅으로 선택지를 병렬 평가** — 모델이 답변 문장을 토큰별로 생성하는 과정을 생략하고, prefill 한 번만 거친 뒤 스키마에 정의된 선택지들의 확률을 ***한 번에 병렬로*** 뽑아낸다. Clef는 Qwen3.8-27B, Clef-flash는 Qwen3.5-9B에서 시작했고 둘 다 Qwen의 비전 인코더를 그대로 유지해 ***이미지 입력***도 지원한다. 컨텍스트는 64K로 Jev(32K)의 두 배다.
- **속도 — Clef-flash 38.8ms, Clef 209.3ms, Jev 524.1ms (중앙값)** — Clef-flash는 Jev보다 ***약 13배*** 빠르다. 다만 이 수치는 Cloudflare 자체 평가 환경에서 나온 것으로, 비교 조건(네트워크 경로, 하드웨어)이 공정했는지는 제3자가 재현하지 않았다.
- **10개 벤치마크 중 7개 승리, 그러나 2개는 패배** — Clef·Clef-flash가 여러 도구 선택·분류 벤치마크에서 Jev를 앞섰지만, ***When2Call(Jev 80.97 vs Clef 72.37)과 BRIGHT(Jev 47.52 vs Clef 45.91)에서는 Jev가 더 높았다*** — "전면 우위"가 아니라 워크플로별로 갈린다.
- **가격은 오히려 Jev보다 비싸다 — $0.24/M vs $0.042/M** — 속도·컨텍스트·멀티모달에서 앞서지만, ***토큰당 가격은 Jev의 약 6배***다. "더 빠르고 더 똑똑하지만 더 비싼" 트레이드오프라는 뜻이다.
- **Jev 호환 API + RL 미세조정 서비스 동시 공개** — 기존 Jev 통합 코드를 거의 그대로 재사용할 수 있는 Jev 호환 API와 함께, 자체 데이터로 결정 모델을 강화학습으로 미세조정하는 서비스도 같은 날 공개됐다. Workers AI에 호스팅되며 Hugging Face에서 가중치를 무료로 받을 수 있다.

## 인상 깊은 문장

> "Clef scores choices in parallel after a prefill-only pass" (WebSearch 재인용, nxcode.io/aicoder.com 등 복수 매체 공통 표현)

## 댓글

**hada 댓글 수는 확인하지 못했다**(원문 차단). **정직하게 감안할 점**: (1) 벤치마크 10개 중 7개 승리라는 헤드라인 숫자는 Cloudflare 자체 평가이며, [[2026-09-30-jeeves-jev-reasoning-before-deciding]] 때도 반복됐던 "저자 자체 측정"이라는 한계가 똑같이 적용된다. (2) "13배 빠르다"는 Clef-flash 단독 수치이고, Clef(27B) 자체는 209.3ms로 격차가 그보다 훨씬 작다 — 어느 모델을 기준으로 말하느냐에 따라 체감이 크게 달라진다. (3) 가격이 Jev보다 비싸다는 점은 "빠르고 정확한 대신 비싸다"는 트레이드오프를 Cloudflare 스스로 숨기지 않았다는 점에서는 정직하지만, "Jev의 밥그릇을 빼앗는다"는 서사와는 다소 어긋난다 — 순수 비용 경쟁에서는 Jev가 여전히 유리하다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-23-openai-jev-tool-router]]가 예측한 "플랫폼이 틈새를 흡수한다"가 OpenAI가 아니라 Cloudflare로 먼저 실현됐다

그 노트는 ***"더 큰 경쟁은 독립 분류 API를 복제하는 게 아니라, 플랫폼이 이 기능을 자기 안에 흡수하는 것"***이라는 예측을 담았고, 당시엔 "OpenAI가 이걸 할 수 있는 기반을 갖추고 있다"는 추측 수준이었다. Clef는 그 예측이 실제로 벌어진 첫 구체적 사례다 — 다만 예측과 다르게 ***LLM 내부에 흡수된 게 아니라, 독립된 오픈소스 모델로 플랫폼(Cloudflare)이 직접 내놓은 형태***다. 그것도 모델 벤더가 아니라 ***인프라/엣지 컴퓨팅 플랫폼***이 뛰어들었다는 게 흥미롭다 — Workers AI 생태계 확장이라는 Cloudflare 자신의 유인이 걸려 있다.

### 핵심 전이 2 — Jev 재구현 계보에 "같은 API, 다른 가격대·워크플로 특화" 갈래가 추가된다

[[2026-09-30-jeeves-jev-reasoning-before-deciding]](추론 단계 추가로 정확도↑ 지연시간↑), [[2026-09-28-glm-5-3-flash-jev-like-decision-model]](프롬프트 설계만으로 파인튜닝 생략), [[2026-09-22-kev-open-source-jev-decision-model]](오픈소스 독립 구현)까지 이어진 계보에, Clef는 ***"같은 Jev API를 쓰면서, 워크플로에 따라 더 빠르거나(Clef-flash) 더 정확하되(Clef) 더 비싸다"***는 또 다른 변주를 더한다. Jeeves가 "속도 대신 정확도를 산다"는 선택지였다면, Clef는 그 선택지에 "가격"이라는 세 번째 축을 명시적으로 얹었다 — 지금까지의 Jev 대안들은 대개 "더 싸다"는 쪽이었는데 Clef는 당당하게 "더 비싸다"를 인정하면서 속도·컨텍스트·멀티모달로 그 비용을 정당화하려 한다.

## 호스피탈리티 / CRS 적용 포인트

CRS의 문의 분류·에이전트 다음 행동 선택에 Jev류 모델을 검토 중이라면, 이번 사례는 "선택지가 하나 더 생겼다"는 것 이상의 의미가 있다. ①**워크플로별로 다른 모델을 혼용하는 설계가 합리적이다** — 지연시간이 중요한 실시간 고객 응대 분류는 Clef-flash(38.8ms)로, 정확도가 더 중요한 백오피스 배치 판단(예: 환불 분쟁 분류)은 Clef(27B)나 Jev로 나눠 쓰는 식이다. ②**가격은 반드시 워크로드 규모로 환산해서 비교한다** — Jev보다 6배 비싸다는 숫자 자체는 크지만, 분류 1건당 절대 비용은 여전히 작을 수 있어 "속도 개선이 그 비용 차를 상쇄하는가"를 실측해야 한다. ③**Jev API 호환이라는 점의 실무적 가치** — 이미 Jev로 통합 코드를 짜둔 상태라면 교체 비용이 작다는 뜻이므로, 벤더 락인 우려 없이 두 모델을 A/B 테스트해볼 수 있다는 게 이번 배치 중 가장 실용적인 시사점이다.

## 연관 자료

- [[2026-09-23-openai-jev-tool-router]] — "플랫폼이 Jev 틈새를 흡수할 것"이라는 예측, Clef는 그 예측이 실현된 사례(다만 예측한 주체 OpenAI가 아니라 Cloudflare)
- [[2026-09-30-jeeves-jev-reasoning-before-deciding]] — Jev 재구현 계보, "속도 대신 정확도를 산다"는 트레이드오프의 선행 사례
- [[2026-09-28-glm-5-3-flash-jev-like-decision-model]] — 프롬프트 설계만으로 파인튜닝을 생략한 다른 갈래, Clef(직접 파인튜닝)와 대조
- [[2026-09-22-kev-open-source-jev-decision-model]] — 오픈소스 독립 구현 갈래, Clef와 같은 "오픈 가중치" 노선이지만 플랫폼 벤더가 직접 낸 것이 다름

## 한 달 뒤 회고

*(2026-11-02 즈음 — Clef의 10개 벤치마크 승률에 대한 독립 재현 검증이 나왔는지, 실제 가격 대비 성능으로 Jev에서 Clef로 이동한 사례가 보고됐는지, TypeSafe(Jev)가 이 경쟁에 가격·성능으로 대응했는지, OpenAI 등 다른 플랫폼도 유사한 자체 결정 모델을 내놓았는지 확인.)*
