---
title: "Kimi K3는 Fable과 경쟁하며, 두 모델의 조합은 최고 성능을 낸다 (Fireworks AI) — 1,030개 실제 에이전트 작업에서 K3(오픈)가 5개 작업군 모두 더 저렴(장기 루프 최대 50배), Fable은 웹·시각화·다국어에서 우월. 작업별 오라클 라우팅이 93%로 단일 모델을 넘는다. 단 오라클은 실현 불가능한 상한이고, Fireworks는 K3를 호스팅해 이해관계가 있다"
source_title: "Kimi K3 competes with Fable, and combining them is state-of-the-art"
source_url: "https://fireworks.ai/blog/kimik3-fable"
source_name: "Fireworks AI"
referrer_url: "https://news.hada.io/topic?id=31689"
published_at: "2026-07-22"
summarized_at: "2026-07-23"
category: "ai"
tags: ["model-routing", "kimi-k3", "task-fit", "cost-efficiency", "prompt-caching", "open-weights", "oracle-routing", "fireworks"]
---

# Kimi K3 vs Fable, 그리고 라우팅 (Fireworks AI) — 1,030개 태스크로 정량화된 '태스크-모델 적합성'

> 출처: [Kimi K3 competes with Fable, and combining them is SOTA](https://fireworks.ai/blog/kimik3-fable) (Fireworks AI · Series D·$1B ARR · GeekNews GN⁺ 요약 + HN 큐레이션) · 정리일 2026-07-23

## 한 줄 요약

**추론 플랫폼 Fireworks가 약 1,030개 실제 에이전트 작업(SWE 460·Terminal 89·Algorithmic 100·Multi-Language 225·Legal 120)으로 K3와 Fable 5를 붙였다. 결과: 작업별로 "각 모델 실행 후 가장 싼 정답을 고르는" 오라클 라우팅이 93% 정확도로 두 모델 어느 것보다 높고, 오라클이 트래픽의 72~96%를 K3로 보낸다. K3(오픈)는 5개 작업군 모두에서 더 저렴하고 장기 에이전트 루프에선 최대 50배 비용 효율적이며(프롬프트 캐싱 덕에 토큰을 10배 읽어도 더 쌈), 터미널·기호수학에서 강하다. Fable은 웹·데이터 시각화·다국어 폭(Java/Python/C++)에서 우월하다. Fireworks의 결론: "단일 모델·토큰 쥐어짜기 시대는 끝, 모델은 매우 다른 가격의 전문가이고 최고 AI는 단일 랩이 아니라 혼합에서 나온다 — 오픈을 기본값으로, 라우터가 경쟁력." 단 오라클 라우팅은 실현 불가능한 상한(실제 라우터는 추측)이고, Fireworks는 K3를 호스팅·라우팅을 파는 이해당사자다.**

## 핵심 포인트

- **셋업** — ~1,030개 실제 에이전트 작업 5군: **SWE 460**(실제 저장소 버그수정)·**Terminal 89**(보안·암호·리버스엔지니어링·시스템관리 장기작업)·**Algorithmic 100**(LeetCode/AtCoder)·**Multi-Language 225**(6개 언어)·**Legal 120**(변호사 채점).
- **오라클 라우팅 93%** — *"각 모델 실행 후 가장 저렴한 정답을 고르는"* 이론적 상한(cost/perf ceiling). **5개 작업군 모두에서 라우팅이 단일 모델 초과**(SWE는 K3 92.4%·Fable 92.6%인데 라우팅 후 둘보다 높음). 오라클이 **72~96% 작업을 K3로** 보냄.
- **K3 강점** — Terminal(89개 중 K3 11개 독점 해결 vs Fable 7개; *"Fable이 절대 못 깬 배치"* — 7z 해시·FEAL 암호분석·유출 비밀·라이브 취약점·폭주 async 통과), 기호수학·개발도구, Rust/JS 동등.
- **Fable 강점** — 웹·데이터 시각화(SWE 도메인), 다국어 폭(Java·Python·C++에서 K3 능가), Legal 경쟁력.
- **비용: K3가 5개 군 모두 저렴, 장기 루프 최대 50배** — Terminal이 가장 극적(Fable이 64턴·1.5M 토큰으로 나선 증가). SWE: K3 ~55턴·1.3M 토큰(더 많은 노력) vs Fable 21턴·130K 토큰(더 빠름). ***프롬프트 캐싱이 대부분을 함 — K3가 토큰 10배 읽어도 캐시 히트로 SWE 비용이 Fable보다 낮음.*** 트레이드오프: K3는 턴 많음 = 벽시계 느림(2초 응답엔 부담, 배경 에이전트엔 청구액 일부).
- **결론·제안** — *"단일 모델 공급자·토큰 쥐어짜기 시대 끝, 모델은 매우 다른 가격의 전문가, 최고 AI는 단일 랩 아닌 혼합."* ①**오픈을 기본값으로**(50배 싼 K3를 base case), ②**라우터가 경쟁력**(워크로드 맞춤·작업/모델 분류 연속 학습).
- **한계** — 오라클 ≠ 실제 라우터(실제는 추측, *"근완벽 라우터 가능하나 단언하려면 라우팅 데이터가 1자릿수 배 더 필요"*), 응답시간 vs 비용, 워크로드별 맞춤 라우터.

## 인상 깊은 문장

> "단일 모델 공급자의 시대, 토큰을 마지막까지 쥐어짜는 시대는 끝났다. 모델은 매우 다른 가격의 전문가다."

> "최고의 AI는 더 이상 단일 랩에서 나오지 않는다 — 모델의 혼합에서 나온다."

> "프롬프트 캐싱이 대부분의 일을 한다 — K3가 토큰을 10배 더 읽어도 캐시 히트 덕에 SWE 비용이 Fable보다 낮다."

> "오라클은 모든 옵션을 시도한 후 고를 수 있지만, 실제 라우터는 추측에 의존한다." (93%는 상한이지 실측이 아니다)

## 댓글

**hada 댓글 1개 + HN 큐레이션 있음.** **읽을 때 반드시 감안 — Fireworks는 K3를 호스팅하고 멀티모델 라우팅을 파는 이해당사자다.** 글 전체가 자기 상품("오픈 기본 + 라우터")이 최적이라는 논증이고, 핵심 숫자 93%는 **실현 불가능한 오라클(상한)**이지 실제 라우터가 내는 값이 아니다. HN도 짚음: 벤치 과적합, Fireworks 이익 충돌, 오라클의 비현실성, **Kimi의 학습 제외(opt-out) 부재 vs Claude의 명확한 정책**, Claude Sonnet 5·GPT 5.5·Qwen 3.7 Max 등과의 비교 부족. **취할 것**: 태스크별로 모델 우열·비용이 실제로 갈린다는 정량 증거. **버릴 것**: "93%"를 달성 가능한 성능으로, "라우터만 있으면 된다"를 무조건으로.

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 주 Kimi 스레드의 정량적 결론: 태스크-모델 적합성이 증명됐다

이 글은 내가 며칠째 반복한 명제 — *"어느 모델이 싸냐는 태스크·워크플로 없이는 답이 없다"*([[2026-07-14-migrating-production-agent-provider-assumptions]]·[[2026-07-21-frontier-lab-economics-anthropic-cracks]]) — 을 **1,030개 태스크로 정량화**한다. [[2026-07-12-twelve-models-build-same-four-apps]]의 *"모델은 태스크 적합성으로 봐야"*가 이제 데이터를 얻었다: K3는 터미널·암호·기호수학, Fable은 웹·시각화·다국어. 그리고 내가 [[2026-07-21-frontier-lab-economics-anthropic-cracks]]에서 표시한 긴장 — *"완료 작업당 3배 비싸다(Gryc)" vs "Fable이 3분에 끝냈다(Kimi moment)"* — 이 여기서 **해소**된다: K3는 턴·토큰이 더 많아 **느리지만**(벽시계), 프롬프트 캐싱 덕에 **더 싸다**(청구액). "느림"과 "쌈"이 동시에 참이고, 배경 에이전트냐 대화형이냐가 갈림. 내가 추적하던 루프가 닫혔다.

### 핵심 전이 2 — "라우터가 경쟁력" = 하네스/가치포획 논제의 제품화, 그리고 Fireworks가 곧 Red Hat

*"최고 AI는 단일 랩 아닌 혼합, 라우터가 경쟁력"*은 이번 주 하네스 논제의 **제품 형태**다 — [[2026-07-18-state-of-open-source-ai-2026-mozilla]]의 *"하네스가 모델을 이긴다"*, [[2026-07-21-frontier-lab-economics-anthropic-cracks]]의 *"하네스가 언번들링·가치 포획"*이 여기선 **라우팅 레이어**로 구체화된다. 그리고 Fireworks(추론 인프라 + 라우팅, $1B ARR)는 정확히 [[2026-07-15-hardware-eating-software-value-migration]]의 *"Linux는 가치를 못 잡고 Red Hat이 잡았다"*의 Red Hat이다 — 모델이 상품화되면 값은 그 위 서빙·라우팅 플랫폼이 가져간다. **오픈웨이트가 이겨도 돈은 Fireworks 같은 층이 번다**([[2026-07-21-american-ai-locked-down-losing]]의 "채택≠포획"의 실물).

### 핵심 전이 3 — "오픈을 기본값으로"에 데이터가 붙었다, 단 "오픈이 다 이긴다"는 아니다

오라클이 72~96%를 K3로 보낸다는 건 [[2026-07-21-american-ai-locked-down-losing]]·[[2026-07-20-the-kimi-k3-moment]]의 *"오픈이 온다"*에 **정량 근거**를 준다. 그러나 정확히 그 방식으로 Werdmuller의 과장을 **정정**한다 — 오픈이 *다* 이기는 게 아니라 **기본값**이고, Fable(폐쇄)이 여전히 웹·시각화·다국어·법률에서 이긴다. 즉 정확한 명제는 *"오픈이 이긴다"*가 아니라 **"오픈이 기본값, 폐쇄는 특정 고가치 태스크"**다 — 이건 [[2026-07-22-gemini-3-6-flash-release]]에서 본 "상품 태스크는 최저가"와 같은 결이고, 태스크형이 모델을 정한다.

### 핵심 전이 4 — 프롬프트 캐싱이 비용을 뒤집는다 = 계측 축의 재확인

*"K3가 토큰 10배 읽어도 캐시 히트로 더 싸다"*는 [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]의 *"캐시 적중률=마진"*·[[2026-07-14-migrating-production-agent-provider-assumptions]]의 *"캐시 오설정이 비용 격차의 전부였다"*를 재확인한다 — **비용은 모델 단가가 아니라 캐시 구조가 정한다.** 그래서 "K3가 싸다"조차 *"이 플랫폼의 캐싱이 잘 될 때"*라는 조건부다(Fireworks 캐싱을 파는 이유). 온다가 총비용을 볼 땐 단가·토큰이 아니라 **캐시 히트율까지** 실측해야 한다.

## 호스피탈리티 / CRS 적용 포인트

- **라우팅은 매력적이나 오라클 93%는 상한이다.** 온다가 멀티모델 라우팅을 쓴다면 실제 라우터가 내는 값은 훨씬 낮다 — build-vs-buy(Fireworks가 팜)를 실측으로 판단하고, 라우팅 복잡성 비용을 계산에 넣는다.
- **태스크형으로 모델 매핑.** CRS 태스크를 배경 에이전트(문서·정산 자동화, K3류 저비용·다턴 OK)와 대화형(즉시 응답, Fable류 빠름)로 나눠 매핑 — 벽시계 vs 비용 트레이드오프(전이 1).
- **총비용은 캐시 히트율까지 실측(전이 4).** 단가 비교는 함정 — 온다 워크로드에서 프롬프트 캐싱이 실제로 되는지 본다.
- **Kimi 학습 opt-out 부재는 PII 경로 배제 사유.** HN이 짚은 대로 K3는 학습 제외가 불명확 — 예약·고객 데이터 경로엔 명확한 no-training 정책 모델만(방법론 §5, [[2026-07-20-the-kimi-k3-moment]]).

## 연관 자료
- [[2026-07-20-the-kimi-k3-moment]] · [[2026-07-21-moonshot-pauses-kimi-k3-subscriptions]] — *Kimi 스레드를 1,030개 태스크로 정량화, "느림·쌈 동시" 해소*
- [[2026-07-21-frontier-lab-economics-anthropic-cracks]] — *"완료 작업당 3배 vs 3분" 긴장 해소 + 라우터=하네스 가치포획*
- [[2026-07-18-state-of-open-source-ai-2026-mozilla]] — *"하네스가 모델을 이긴다"의 라우팅 제품판*
- [[2026-07-21-american-ai-locked-down-losing]] — *"오픈이 기본값·폐쇄는 특정 태스크"로 과장 정정, 채택≠포획(Fireworks=Red Hat)*
- [[2026-07-12-twelve-models-build-same-four-apps]] · [[2026-07-22-gemini-3-6-flash-release]] — *태스크-모델 적합성에 데이터가 붙음*
- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] · [[2026-07-14-migrating-production-agent-provider-assumptions]] — *캐시 히트율이 비용을 정함*
- [[2026-07-15-hardware-eating-software-value-migration]] — *Fireworks = 오픈 위에서 가치를 잡는 Red Hat*

## 한 달 뒤 회고
*(2026-08-23 즈음 — 온다가 실제 라우터를 쓴다면 오라클 93% 대비 실측이 얼마였는지, 태스크형(배경/대화형)으로 모델을 매핑했는지, 총비용을 캐시 히트율까지 실측했는지, Kimi를 PII 경로에서 배제했는지 기록.)*
