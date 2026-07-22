---
title: "구글 제미나이 새 모델 출시 (3.6 Flash·3.5 Flash-Lite·3.5 Flash Cyber) — 인프라를 가진 구글이 내놓은 게 Pro 없는 Flash 3종에, 벤치는 자사끼리만 비교하고 가격은 GLM-5.2보다 비싼데 성능은 낮다는 평. 인프라 소유가 자동 승리는 아니라는 어제 논지의 반증이자, 폐쇄 가격이 오픈에 밀리는 이번 주 그림의 실물"
source_title: "Gemini 3.6 Flash, 3.5 Flash-Lite, and 3.5 Flash Cyber"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-6-flash-3-5-flash-lite-3-5-flash-cyber/"
source_name: "blog.google"
referrer_url: "https://news.hada.io/topic?id=31662"
published_at: "2026-07-22"
summarized_at: "2026-07-22"
category: "ai"
tags: ["gemini", "model-release", "model-economics", "price-competition", "open-weights", "flash", "benchmark", "task-fit"]
---

# 구글 제미나이 새 모델 출시 (3.6 Flash·3.5 Flash-Lite·3.5 Flash Cyber) — Pro 없는 Flash 3종, 자사끼리 벤치, 오픈보다 비싼 가격

> 출처: [Gemini 3.6 Flash, 3.5 Flash-Lite, 3.5 Flash Cyber](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-6-flash-3-5-flash-lite-3-5-flash-cyber/) (blog.google · GeekNews GN⁺ 요약 + HN 큐레이션) · 정리일 2026-07-22

## 한 줄 요약

**구글이 에이전트 개발용 Gemini Flash 3종을 냈다 — 3.6 Flash(워크호스, 출력토큰 −17%, $1.50/$7.50), 3.5 Flash-Lite(초당 350토큰·최저가 $0.3/$2.5, 고처리량 에이전트 검색·문서처리), 3.5 Flash Cyber(보안 취약점 탐지·패치, CodeMender 연동, 정부·신뢰 파트너 전용 제한 파일럿). Pro는 없고, "3.5 Pro는 파트너 테스트 중, Gemini 4는 역대 가장 야심 찬 사전학습 시작"이라 예고했다. 스펙은 견실하지만 HN 반응이 이번 주 경제 논지의 실물이다 — "GLM-5.2보다 덜 똑똑하고 더 비싸며 가중치도 비공개", "자사 모델끼리만 벤치마크", "2.5 Flash-Lite에서 DeepSeek v4 Flash로 갈아탐(이미 더 저렴)". 인프라를 가진 구글조차 오픈 모델에 가격으로 밀린다는 건, 어제 Gryc의 '인프라 소유가 승리'를 '필요조건이지 충분조건은 아님'으로 정정한다.**

## 핵심 포인트

- **Gemini 3.6 Flash (워크호스)** — 코딩·지식·멀티모달. *"Artificial Analysis Index에서 3.5 Flash 대비 출력토큰 17% 감소"*, 더 적은 추론 단계·툴 호출. 벤치: DeepSWE 49%(vs 37%)·MLE Bench 63.9%(vs 49.7%)·OSWorld 83.0%(vs 78.4%)·GDPval 1421(vs 1349). **가격 $1.50/$7.50**(입력/출력, 백만 토큰당).
- **Gemini 3.5 Flash-Lite (최저가·최고속)** — **초당 350토큰**, 저지연·고처리량(에이전트 검색·문서처리·영수증 요약·특성 추출). Terminal-Bench 2.1 54%(vs 31%)·SWE-Bench Pro 54.2%. **가격 $0.3/$2.5**. thinking level로 지연·비용 조절.
- **Gemini 3.5 Flash Cyber (보안 특화)** — 취약점 탐지·검증·패치, **CodeMender** 내 다중 에이전트 협업으로 단일 보고서 생성, CyberGym SOTA. **이중용도라 정부·신뢰 파트너 전용 제한 파일럿.**
- **프레이밍** — *"프로덕션 AI 에이전트엔 더 높은 토큰 효율·낮은 지연·신뢰성이 필요"*, 컴퓨터 사용이 클라이언트 측 내장 도구.
- **Pro 부재 + 예고** — Pro 미출시. *"3.5 Pro는 파트너와 테스트 중, 준비되는 대로 폭넓게 제공"*, *"Gemini 4를 위한 역대 가장 야심 찬 사전학습 시작."*

## 인상 깊은 문장

> "프로덕션 AI 에이전트를 만드는 개발자는 더 높은 토큰 효율, 낮은 지연, 더 신뢰할 수 있는 성능이 필요하다." (Flash 시리즈 프레이밍)

> "GLM-5.2보다 덜 똑똑하고 더 비싸며, 가중치도 비공개다." (HN)

> "이제는 다른 모델이 아니라 자사 모델끼리만 벤치마크하는데, 이것만으로도 상황이 드러난다." (HN)

> "Gemini 4를 위한 역대 가장 야심 찬 사전학습을 시작했다." (다음 큰 모델에 베팅)

## 댓글

**hada 댓글 2개 + HN 큐레이션 있음.** hada: neo가 *"Pro 부재·지연·AI 리더십 이탈 같은 나쁜 소식만 는다"*, openpgc가 *"성능 떨어져도 openclaw처럼 '이건 좀 획기적인데' 방향이면 사람들이 쓸 텐데"*(혁신 방향 부족). HN 핵심: ①**Pro 부재**(대형 모델이 GPT-5.6·Fable, 심지어 K3·GLM보다 못해 보류한다는 추측), ②**가격**(비용 대비 성능으로 ~10개 모델에 밀림, DeepSeek v4 Flash로 이미 이전), ③**제품 전략**(소비자/기업 인위적 분리, Flash-Lite EOL로 비용↑, *"Firebase 이후 GCP 의존 안 함"* — 구글이 제품을 잘 죽임), ④**벤치 vs 실무**(자사끼리 벤치, 에이전트 코딩은 훨씬 떨어짐). **읽을 때 감안** — HN은 반(反)구글 편향이 있고 일화적이다. 벤치는 구글 자체 수치(자기 선택). **Flash-Lite $0.3/$2.5·350 tok/s는 고처리량에선 실제로 경쟁력 있다** — HN의 조롱과 별개로 스펙은 견실하다. 균형: 견실한 워크호스 + 경제·전략의 부정적 신호.

## 내 생각 · 적용점

### 핵심 전이 1 — 인프라 소유가 자동 승리는 아니다: 어제 Gryc 논지의 정정

어제 [[2026-07-21-frontier-lab-economics-anthropic-cracks]]는 *"인프라를 소유한 쪽(Meta·SpaceX·Google급)이 추론을 고정비로 바꿔 마진으로 이긴다"*고 했다. 그런데 **구글은 자체 데이터센터·TPU를 가진 대표 인프라 소유자인데, Flash 가격이 오픈 모델(GLM-5.2·DeepSeek v4)에 밀린다.** 이건 Gryc를 정정한다 — **인프라 소유는 필요조건이지 충분조건이 아니다.** 고정비 우위가 있어도 (a) 과금을 오픈보다 비싸게 매기거나, (b) 대형 모델이 뒤처지면 소용없다. 즉 승리는 "인프라 소유 × 경쟁력 있는 가격 × 프론티어 성능"의 곱이고, 구글은 첫 항만 강하다. HN의 *"자사끼리만 벤치마크"*가 둘째·셋째 항의 약함을 드러낸다.

### 핵심 전이 2 — 폐쇄 가격이 오픈에 밀리는 이번 주 그림의 실물

*"GLM-5.2보다 덜 똑똑하고 더 비싸며 가중치 비공개"*·*"DeepSeek v4 Flash로 이미 이전"*은 오늘·어제 정리한 [[2026-07-21-american-ai-locked-down-losing]](폐쇄가 오픈에 진다)·[[2026-07-20-the-kimi-k3-moment]](오픈이 1/3 가격)의 **구글 버전 실물**이다. 다만 여기서 내가 세운 경계가 다시 유효하다 — HN 사용자가 Flash-Lite → DeepSeek로 *쉽게* 갈아탄 건 **고처리량 상품(commodity) 작업**이라서다([[2026-07-14-migrating-production-agent-provider-assumptions]]의 "교체는 상품 영역에선 쉽고 복잡 에이전트에선 어렵다"). 문서처리·추출 같은 상품 태스크에선 락인이 없고 최저가가 이긴다 — 그래서 구글의 Flash-Lite 프리미엄이 특히 취약하다.

### 핵심 전이 3 — "다음 큰 모델(Gemini 4)에 베팅" = Gryc 생존 경로 ①의 실행

*"Gemini 4 역대 가장 야심 찬 사전학습"* 예고와 Pro 보류는 [[2026-07-21-frontier-lab-economics-anthropic-cracks]]의 생존 경로 ①(**재귀적 자기개선·AGI로 경쟁사를 멀리 떠나기**)의 실행이다 — 지금 Flash로 속도·효율을 방어하면서 판돈을 다음 대형 모델에 건다. 이건 [[2026-07-13-i-love-llms-i-hate-hype]]의 하이프 경계 대상이고, "지금 밀리니 다음 세대로 이긴다"는 서사는 검증 전까지 신뢰 유보. HN의 *"성능 떨어져도 획기적 방향이면 쓸 텐데"*(openpgc)는 정확히 이 공백을 짚는다 — 점진 Flash엔 [[2026-07-18-state-of-open-source-ai-2026-mozilla]]가 말한 *"하네스가 모델을 이긴다"*식 새 방향이 없다.

### 핵심 전이 4 — Flash Cyber: 게이트된 이중용도 = 폐쇄 랩의 차별화 시도이자 주권 축

**보안 특화 Flash Cyber를 "정부·신뢰 파트너 전용"으로 게이트**한 건 두 가지를 동시에 보여준다 — (a) Gryc 생존 경로 ③(**복제 불가·게이트된 제품**)의 시도, (b) 이중용도 기술의 접근 통제 = [[2026-07-21-american-ai-locked-down-losing]]의 규제·주권 축(Claude Fable 차단과 같은 계열). 보안 취약점 탐지·패치 모델은 방어에도 공격에도 쓰이므로, **게이트가 곧 차별화이자 리스크 관리**다. 온다처럼 보안이 중요한 CRS엔 이런 게이트된 보안 특화 모델의 등장이 방향성 신호(단 접근 불가).

### 핵심 전이 5 — 제품 신뢰가 모델 스펙보다 먼저 무너진다

HN의 *"Firebase 이후 GCP 의존 안 함, 구글이 제품을 잘 죽인다"*·*"Flash-Lite EOL로 비용 상승"*은 **모델 성능과 무관한 신뢰 문제**다. 이건 [[2026-07-21-moonshot-pauses-kimi-k3-subscriptions]]에서 본 *"용량 정직성 = 신뢰 신호"*·Weekly #367의 *"요금제 변경 → 신뢰 하락"*과 같은 축이다 — **엔터프라이즈에선 모델 벤치보다 "이 제품이 2년 뒤에도 있고 가격이 예측 가능한가"가 채택을 정한다.** 구글은 스펙 경쟁 이전에 이 신뢰를 잃고 있다. 이것이 [[2026-07-20-supabase-state-of-startups-2026]]에서 Claude Code가 도구층을 장악한 이유의 이면 — 스펙이 아니라 신뢰·통합이 채택을 정한다.

## 호스피탈리티 / CRS 적용 포인트

- **고처리량 상품 태스크는 최저가로, 락인 걱정 없이(전이 2).** CRS의 문서처리·추출·번역·요약은 상품 태스크라 Flash-Lite($0.3/$2.5)·DeepSeek·GLM 중 **총비용 최저를 쓰고 쉽게 갈아탄다** — 벤치가 아니라 우리 태스크로 실측.
- **벤치마크에 취하지 말 것(전이 1).** "자사끼리 벤치"의 우수 수치가 실무·비용 효율을 보장하지 않는다 — 온다 태스크에서 완료당 비용·신뢰성으로 판단([[2026-07-12-twelve-models-build-same-four-apps]]).
- **엔터프라이즈 채택은 신뢰·예측가능성으로(전이 5).** 온다가 모델·플랫폼을 고를 때 스펙만큼 "지속성·가격 예측가능성·EOL 정책"을 본다 — 구글이 잃고 있는 그것.
- **보안 특화 모델은 방향성만 참고(전이 4).** Flash Cyber류는 게이트되어 당장 못 쓰되, CRS 보안 자동화의 미래 방향으로 기록.

## 연관 자료
- [[2026-07-21-frontier-lab-economics-anthropic-cracks]] — *"인프라 소유가 마진" ↔ 구글은 인프라 소유인데 밀림 = 필요조건이지 충분조건 아님*
- [[2026-07-21-american-ai-locked-down-losing]] — *폐쇄 가격이 오픈에 밀리는 그림의 구글 실물 + Flash Cyber 게이트=주권 축*
- [[2026-07-20-the-kimi-k3-moment]] · [[2026-07-14-migrating-production-agent-provider-assumptions]] — *오픈이 싸다 + 교체는 상품 태스크에선 쉬움*
- [[2026-07-18-state-of-open-source-ai-2026-mozilla]] — *"하네스가 모델을 이긴다" = 점진 Flash엔 새 방향이 없음(openpgc)*
- [[2026-07-12-twelve-models-build-same-four-apps]] — *태스크-모델 적합성으로 평가, 벤치 아님*
- [[2026-07-13-i-love-llms-i-hate-hype]] — *자사 벤치·"다음 세대로 이긴다" 서사 경계*
- [[2026-07-21-moonshot-pauses-kimi-k3-subscriptions]] · [[2026-07-20-supabase-state-of-startups-2026]] — *신뢰·예측가능성이 스펙보다 채택을 정함*

## 한 달 뒤 회고
*(2026-08-22 즈음 — Gemini 3.5 Pro·Gemini 4가 실제로 나와 경쟁력을 회복했는지, 구글 Flash가 오픈 대비 가격 경쟁력을 되찾았는지, 온다가 상품 태스크를 총비용 최저로 골랐는지, 벤치가 아니라 실측·신뢰로 판단했는지 기록.)*
