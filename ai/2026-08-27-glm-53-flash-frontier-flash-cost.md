---
title: "GLM-5.3-Flash: 프론티어급 지능, Flash급 비용 — 320B 중 18B만 활성화, 정체를 숨긴 'ox-alpha'가 주간 인기 1위였다"
source_title: "GLM-5.3-Flash"
source_url: "https://docs.z.ai/guides/vlm/glm-5.3-flash"
source_name: "Z.ai 공식 문서/블로그"
referrer_url: "https://news.hada.io/topic?id=32912"
published_at: "2026-08-26"
summarized_at: "2026-08-27"
category: "ai"
tags: ["glm", "z-ai", "moe", "multimodal", "open-weight", "cost-efficiency", "stealth-model"]
---

# GLM-5.3-Flash: 프론티어급 지능, Flash급 비용

> 출처: [GLM-5.3-Flash](https://docs.z.ai/guides/vlm/glm-5.3-flash) (Z.ai 공식 문서/블로그) · 정리일 2026-08-27
> **출처 한계**: `docs.z.ai`·`news.hada.io`가 이 세션에서 전부 egress 차단돼 공식 문서·hada 댓글을 직접 읽지 못했다. 아래 내용은 MarkTechPost, officechai, kingy.ai, testingcatalog 등이 원문을 인용·재구성한 WebSearch 스니펫과 Slack 발췌를 교차해 재구성한 것이다. 벤치마크 수치는 Z.ai 자체 발표 및 Artificial Analysis Intelligence Index 기준으로, 이 세션에서 독립 재현은 하지 못했다.

## 한 줄 요약

**Z.ai가 GLM-5 시리즈 최초의 ***네이티브 멀티모달 모델*** GLM-5.3-Flash를 공개했다. 총 320B 파라미터 중 ***18B만 활성화(320B-A18B)***하면서 GLM-5.2보다 뛰어난 성능을 내고, 가격은 GLM-5.3의 ***10분의 1 수준***(입력 $0.15/M·출력 $0.50/M vs GLM-5.3의 $1.40/$4.40)이다. 코딩·에이전트 벤치마크에서는 ***Claude Opus 4.8에 근접***한다(Z.ai Code Bench v1.0 Max 효율에서 29.0 vs Opus 4.8의 29.5). 출시 전에는 `ox-alpha`라는 이름으로 정체를 숨긴 채 OpenCode·OpenRouter에서 익명 테스트됐고 그 상태로 ***주간 인기 1위***에 올랐다는 점이 화제였다. 전 트래픽을 ***중국산 AI 칩***으로 처리하며 서빙 성능도 초기 대비 3배 향상됐다고 밝혔다. ***선형/희소 어텐션 하이브리드, mHC, 30T 토큰 멀티모달 사전학습***을 적용해 긴 컨텍스트(1M 토큰)의 계산량·메모리 비용을 크게 낮췄고, Artificial Analysis Intelligence Index(AAII) v4.1.1에서 57점으로 파레토 프론티어를 밀어올렸다 — 이전에는 약 10배 비용에서만 가능했던 지능 수준이라는 평가다.**

## 핵심 포인트

- **스펙 — 320B 총합 / 18B 활성, 최초의 네이티브 멀티모달** — GLM-5 시리즈 중 처음으로 이미지·비디오를 텍스트와 함께 네이티브로 입력받는다. MoE 구조로 활성 파라미터는 총합의 약 5.6%에 불과.
- **가격 — GLM-5.3의 1/10** — 표준 API 기준 입력 $0.15/M·캐시 입력 $0.03/M·출력 $0.50/M로, GLM-5.3($1.40/$4.40)의 약 10분의 1 수준. 출시 초기 한정 할인가는 이보다도 더 낮았다(약 $0.07/$0.22 보도).
- **"ox-alpha" 스텔스 테스트 → 정체 공개** — 정식 브랜드 없이 `ox-alpha`라는 이름으로 OpenCode·OpenRouter에 올라와 익명으로 테스트됐고, 그 상태로 ***주간 인기 1위***를 기록한 뒤 Z.ai가 이를 GLM-5.3-Flash라고 공식 확인했다 — 브랜드 없이도 실사용 인기로 검증받은 드문 사례.
- **벤치마크 — Opus 4.8에 근접** — DeepSWE v1.1 63.4점, Terminal-Bench 2.1 84.3점, AutomationBench 48.8점. Z.ai Code Bench v1.0(Claude Code 2.1.207 환경에서 측정)에서는 GLM-5.2를 모든 노력(effort) 수준에서 능가하고, Max 효율에서 Claude Opus 4.8과 거의 동률(29.0 vs 29.5)을 기록했다고 보고됨.
- **AAII 파레토 프론티어** — Artificial Analysis Intelligence Index v4.1.1에서 57점을 기록해, "이전에는 대략 10배 비용에서만 접근 가능했던" 지능 수준을 이 가격대로 끌어내렸다는 평가.
- **인프라 — 중국산 AI 칩 전량 서빙 + 서빙 성능 3배 향상** — 전체 트래픽을 중국산 AI 칩으로 처리한다고 밝혔고, 서빙 성능(추론 처리량 등)이 초기 대비 3배 향상됐다고 보고됨 — 서구 GPU 공급망 의존 없이 대규모 서빙이 가능하다는 걸 보여주는 사례로 읽힌다.
- **아키텍처 — 선형/희소 어텐션 하이브리드 + mHC + 30T 토큰 멀티모달 사전학습** — 긴 컨텍스트(1M 토큰)에서 계산량·메모리 비용을 낮추는 설계이며, Z.ai는 장문맥 서빙 비용이 GLM-5.3의 약 3분의 1이라고 주장한다.

## 인상 깊은 문장

> "GLM-5.3-Flash pushes the Pareto frontier at 57 points [on AAII v4.1.1], a level of intelligence previously only available at roughly 10x the cost per task."
> (WebSearch로 재구성한 원문 취지 — "같은 지능을 1/10 비용에"라는 이번 발표 전체의 핵심 주장을 지수 하나로 압축한다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단).
- **관점상 유의점**: 벤치마크 수치는 대부분 Z.ai 자체 발표(Z.ai Code Bench는 자체 벤치마크)이거나 Artificial Analysis라는 제3자 지수를 인용한 것으로, "Opus 4.8에 근접"이라는 평가는 특정 벤치마크·특정 effort 수준에서의 근접이지 전 영역에서의 동급을 뜻하지는 않는다는 점을 감안해야 한다. "ox-alpha 주간 인기 1위"의 정확한 집계 기준(OpenRouter 트래픽 순위인지 OpenCode 내부 지표인지)도 이 세션에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 오픈웨이트가 프론티어를 따라잡는다는 서사의 다음 단계, 그리고 Fable의 모델 라우팅 논지를 다시 확인시켜준다

[[2026-06-08-glm-5-2-local-run]]에서 이미 "GLM-5.2가 벤치마크상 Opus 4.8급까지 따라왔지만 기술적 가능과 경제적 효율은 다르다"는 논지를 다뤘는데, GLM-5.3-Flash는 그 간극을 다시 한번 좁힌 후속 데이터포인트다 — 이번에는 벤치마크 근접뿐 아니라 ***가격이 이전 세대의 1/10로 떨어졌다는 점***이 다르다. 더 직접적으로는 [[2026-08-25-fable-end-of-free-lunch-model-routing]]에서 인용된 "GLM 5.2 비용은 Fable의 1/9·Opus 5의 1/5"이라는 수치가, GLM-5.3-Flash 발표(가격이 GLM-5.3의 1/10)로 ***같은 저비용-고성능 추세가 세대를 넘어 계속되고 있다***는 걸 실증한다. "모델 라우팅으로 비용을 낮춘다"는 그 노트의 전략이, GLM 쪽에서는 매 세대 더 저렴한 옵션이 계속 나오는 형태로 뒷받침되는 셈이다.

## 호스피탈리티 / CRS 적용 포인트

- **모델 라우팅·비용 최적화 관점에서 참고 가치가 있다.** 사내 AI 코딩·에이전트 도구의 비용 구조를 설계할 때, "코딩·에이전트 작업에서 프론티어급에 근접하면서 가격이 1/10인 옵션"이 계속 등장한다는 추세 자체는 [[2026-08-25-fable-end-of-free-lunch-model-routing]]이 제안한 "작업 난이도별 모델 배치" 전략의 선택지를 넓혀준다.
- 다만 **중국산 AI 칩 기반 서빙·데이터 거버넌스(모델 제공사의 데이터 처리 정책)는 별도로 검토해야 할 사안**이라, 이 노트만으로 도입 가능성을 판단하기는 이르다.

## 연관 자료
- [[2026-06-08-glm-5-2-local-run]] — GLM 이전 세대(5.2)의 "프론티어 근접 vs 경제적 효율" 논지, 이번 5.3-Flash가 가격 측면에서 그 간극을 더 좁힌 후속 사례
- [[2026-08-25-fable-end-of-free-lunch-model-routing]] — GLM의 저비용 포지셔닝을 실측 비용 수치(1/9)로 뒷받침한 모델 라우팅 전략 노트

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①GLM-5.3-Flash의 제3자 독립 벤치마크·실사용 리뷰가 축적됐는지, ②"ox-alpha" 스텔스 테스트 방식이 다른 모델 제공사에서도 반복되는 관행이 됐는지, ③중국산 AI 칩 기반 서빙의 실제 신뢰성·지연시간 데이터가 나왔는지, ④원문·hada 댓글 직접 접근이 가능해지면 이 노트의 "추정" 표시를 확정 사실로 교체.)*
