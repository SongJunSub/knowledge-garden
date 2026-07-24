---
title: "로드맵: AI 데이터센터 스택 (Bessemer) — GPU는 더 이상 병목이 아니다. 건설은 12~18개월인데 전력망 연결은 5~7년, 변압기 리드타임은 5년(코로나 전 1년), 랙은 500~600kW로 폭증. 그래서 BYOP(자체 발전)가 지배 전략이 됐고, 값은 전력·인허가·냉각이라는 물리 하위층으로 내려갔다 — 에너지가 AI 시대의 '강철'이다"
source_title: "Roadmap: The AI Data Center Stack"
source_url: "https://www.bvp.com/atlas/roadmap-the-ai-data-center-stack"
source_name: "Bessemer Venture Partners (bvp.com)"
referrer_url: "https://news.hada.io/topic?id=31740"
published_at: "2026-07-24"
summarized_at: "2026-07-24"
category: "ai"
tags: ["ai-infrastructure", "data-center", "power", "byop", "transformer-shortage", "cooling", "value-migration", "capex", "bessemer"]
---

# 로드맵: AI 데이터센터 스택 (Bessemer) — GPU가 아니라 전력·인허가가 병목, 값은 물리 하위층으로

> 출처: [Roadmap: The AI Data Center Stack](https://www.bvp.com/atlas/roadmap-the-ai-data-center-stack) (Bessemer Venture Partners · GeekNews GN⁺ 요약) · 정리일 2026-07-24

## 한 줄 요약

**Bessemer의 AI 인프라 시장 지도. 핵심 명제: GPU 확보는 더 이상 1차 제약이 아니고, 전력과 인허가가 병목이다 — 데이터센터 건설은 12~18개월인데 전력망 연결은 5~7년, 변압기 리드타임은 5년(코로나 전 1년), 랙 전력밀도는 클라우드 20~40kW에서 AI 학습 500~600kW로 폭증(NVIDIA 목표 1MW). 190GW·777개 프로젝트가 발표됐고, 그리드 대기열을 피하려 BYOP(Bring Your Own Power, 자체 발전)가 용량 기준 절반에 육박하는 지배 전략이 됐다. 그래서 값은 모델이 아니라 인허가·발전·송전/변압·오케스트레이션·건설/노동·냉각이라는 물리 하위층으로 내려갔고, Bessemer는 "에너지 인프라가 AI 시대의 강철(steel)"이라 부른다. 이건 이번 주 '가치가 자본집약 하위층으로 내려간다'는 논지의 물리적 전체 지도다.**

## 핵심 포인트

- **시간 불균형(병목의 실체)** — 건설 12~18개월 vs **전력망 연결 5~7년**. 2025년 온라인 예정 110개 중 25%+가 전력·인허가·건설 제약으로 지연.
- **규모 수치** — **190GW·777개 프로젝트** 발표(~148GW 계획·~21GW 건설·~12GW 운영). 전세계 DC 전력소비 2030년까지 2배+. **변압기 수요 +119%(2019~2025), 리드타임 5년**(코로나 전 ~1년), 스위치기어 60주+. **랙: 20~40kW → 500~600kW → NVIDIA 목표 1MW**. 2025년에만 **BTM 가스발전 ~50GW** 발표. 데이터센터가 2025년 건설환경 VC의 **78%($5.7B 중 $4.5B)**. 인허가에 연 $5B+ 지출·$1.5T 자본이 인허가 파이프라인에 묶임. 그리드 혼잡 비용 미국 연 $11.5B. 건설 인력 부족 ~439,000명·크루 750→4,000~5,000명·평균 연령 53세.
- **BYOP가 지배 전략** — 프로젝트 수로는 그리드 연결 45%지만, **용량 기준 자체발전+하이브리드가 ~50%**. 동기: 그리드 대기열 회피·신뢰성·확실성(용량·일정·배출).
- **6개 스택 영역** — ①**인허가·부지선정**(Lorica·Paces, "고객이 3배 더 많은 딜 성사") ②**발전/BYOP**(Boom Superpower 42MW 가스터빈·Arbor 초임계CO₂·Calibrant 배터리·Exowatt·American Terawatt HVDC·Inertia 융합[Jeff Lawson]) ③**송전·전력변환**(변압기 위기 해결 Ayr Energy·고체상태변압기 Heron Power·DG Matrix가 800V DC로·GridAstra·TS Conductor 재도체화로 기존 회랑 2배) ④**소프트웨어/오케스트레이션**(Emerald AI·Verse·Senpilot·ThinkLabs) ⑤**건설·노동·로보틱스**(Bedrock·Built·DroneDeploy·Gecko·Molg) ⑥**냉각**(액체냉각 지배: direct-to-chip·침수, Corintis 미세유체 콜드플레이트·Phaidra AI 냉각).
- **핵심 통찰: Tiered SLA(계약 경직성 vs 워크로드 유연성)** — AI 워크로드는 유연한데(학습은 pause/resume, 배치 추론은 지역 shift, 저우선순위는 지연 허용) 계약은 firm·rigid로 취급 → *"막대한 그리드 용량이 조용히 stranding된다."* **Emerald AI**가 GPU 워크로드 수요반응(그리드 타이트하면 배치 학습을 pause/throttle).
- **Bessemer 프레임** — 에너지 인프라 = AI 시대의 **강철**(헨리 베서머의 철강 대량생산 비유). 승자: 모듈식·공급망 회복력·IT↔물리 양방향 번역·capex 붐 후 **운영 해자(operational moat)**. 결론: *"Tokens → Energy → Infrastructure."*

## 인상 깊은 문장

> "건설은 12~18개월이지만, 그리드 연결은 5~7년이 걸린다." (물리 병목의 실체)

> "데이터센터에 도달하는 모든 전자는 먼저 변압기를 통과한다." (변압기 리드타임 5년 = 진짜 병목)

> "계약의 경직성과 워크로드의 유연성 사이 불일치가, 막대한 그리드 용량을 조용히 stranding하고 있다." (Tiered SLA)

> "다음 10년의 에너지 인프라를 정의할 기업은, 전자를 더 싸고 빠르고 똑똑하게 만드는 소프트웨어·하드웨어·시스템을 짓는 곳이다."

## 댓글

**GN⁺가 원문(Bessemer)을 요약, hada 댓글·HN 큐레이션 없음.** **읽을 때 감안** — 이건 **Bessemer(VC)의 시장 지도**라 관심 있는 스타트업을 홍보하는 성격(NFX·데이터해자·Fireworks와 같은 "논지=파이프라인" 구조)이고, 프레이밍은 강세(bullish)·논지 주도다. 다만 수치(190GW·변압기 리드타임 5년·랙 500~600kW·78% VC)는 출처 있는 실데이터라 방향성이 견고하고, 무엇보다 **"GPU가 아니라 전력이 병목"이라는 물리적 사실은 VC 입장과 무관하게 참**이다. 미국 중심(그리드·인허가) 관점임은 감안.

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 주 '가치는 하위층으로 내려간다'의 물리적 전체 지도다

[[2026-07-15-hardware-eating-software-value-migration]]가 *"가치는 자본집약·물리제약 하위층(반도체·전력·데이터)에 쌓인다 — 질량처럼 못 움직이는 곳에"*라고 했다면, **이 로드맵이 그 하위층의 실제 지도**다. 그리고 "못 움직인다"의 궁극이 여기 있다 — **전력망 연결 5~7년, 변압기 5년, $1.5T가 인허가에 묶임.** 소프트웨어는 초 단위로 복제되지만 변압기·송전선·인허가는 년 단위다. 그래서 값이 거기 응집한다. [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]의 *"추론=COGS, 토큰이 데이터센터를 여행"*의 **물리적 하부구조** — 그 토큰의 전자가 통과하는 변압기·냉각·전력이 이 글의 주인공이다.

### 핵심 전이 2 — "인프라 소유가 마진"이 실제로 무엇을 뜻하는지: BYOP·발전·냉각

어제 [[2026-07-21-frontier-lab-economics-anthropic-cracks]]는 *"인프라를 소유한 쪽이 추론을 고정비로 바꿔 마진으로 이긴다"*고 했다. **이 로드맵이 "인프라 소유"의 실체를 보여준다** — 이제 그건 데이터센터 임대가 아니라 **자체 발전(BYOP)·가스터빈·배터리·800V DC 변환·액체냉각**을 소유·운영하는 것이다. 그리고 [[2026-07-22-gemini-3-6-flash-release]]에서 내가 세운 *"인프라 소유는 필요조건이지 충분조건 아님"*이 여기서 더 선명하다 — 인프라 소유가 **전력·인허가·변압기·인력이라는 거대하고 파편화된 물리 스택 전체**를 뜻하니, 자본과 실행이 압도적으로 든다. GPU 살 돈이 아니라 **전력을 확보할 능력**이 새 진입장벽이다.

### 핵심 전이 3 — 병목이 모델→데이터→전력로 이동: "the bottleneck isn't the model"의 최종 형태

이번 주 병목의 계보가 완성된다 — [[2026-07-17-wes-mckinney-ai-arrow-future-of-software]] "판단이 병목" → [[2026-07-20-task-economy-data-trillion-dollar-market]] "데이터가 병목(암묵지)" → **이 글 "전력이 병목."** AI의 비용 바닥은 프롬프트도 모델도 아니라 **전자를 확보·변환·냉각하는 물리 능력**이 정한다. Tiered SLA 통찰(*"AI 워크로드는 유연한데 계약이 경직돼 용량이 stranding"*)은 특히 우아하다 — **소프트웨어(유연성)와 물리(전력)의 불일치가 낭비를 만들고, 그걸 잇는 오케스트레이션이 값진 층**이다(Emerald AI). 이건 하네스/오케스트레이션 논제([[2026-07-18-state-of-open-source-ai-2026-mozilla]] "하네스가 모델을 이긴다")가 **IT↔물리 경계로 확장**된 것 — Bessemer 왈 *"IT 스택과 물리 스택을 동시에 잇는 소프트웨어가 가장 값진 교차점."*

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 얕다** — 온다는 데이터센터를 짓지 않는다. 정직하게, 이 글은 CRS 실무 지침이 아니라 **거시 배경 지식**이다. 전이 가능한 것만:

- **온다가 내는 모델 가격의 바닥은 여기서 정해진다.** [[2026-07-21-frontier-lab-economics-anthropic-cracks]]·[[2026-07-21-moonshot-pauses-kimi-k3-subscriptions]]의 용량·가격 변동은 결국 이 전력·인프라 제약의 하류다 — AI 비용이 왜 요동치는지의 근원. 장기 계약·용량 계획 시 이 물리 제약이 배경.
- **워크로드 유연화 아이디어의 미시 버전은 CRS에도.** Tiered SLA(유연한 워크로드는 유연하게 스케줄)의 미시판이 [[2026-07-23-fireworks-kimi-k3-fable-routing]]에서 본 "배경 에이전트(저비용·다턴) vs 대화형(즉시)" 분리다 — 온다 AI 작업도 배치성(정산·문서)과 실시간(예약 응답)을 나눠 저렴한 시간·모델에 배치.
- **그 외는 배경으로.** 냉각·변압기·BYOP는 온다와 무관 — 억지 적용하지 않는다.

## 연관 자료
- [[2026-07-15-hardware-eating-software-value-migration]] — *"가치는 물리 하위층에 쌓인다"의 실제 지도*
- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — *토큰의 전자가 통과하는 물리 하부구조(변압기·냉각·전력)*
- [[2026-07-21-frontier-lab-economics-anthropic-cracks]] · [[2026-07-22-gemini-3-6-flash-release]] — *"인프라 소유가 마진"의 실체 = BYOP·발전·냉각, 필요조건이지 충분조건 아님*
- [[2026-07-20-task-economy-data-trillion-dollar-market]] — *병목이 모델→데이터→전력으로 이동*
- [[2026-07-18-state-of-open-source-ai-2026-mozilla]] — *"IT↔물리 잇는 소프트웨어가 값진 층" = 하네스 논제의 물리 확장*
- [[2026-07-13-i-love-llms-i-hate-hype]] — *VC 시장 지도의 강세 프레임 경계*

## 한 달 뒤 회고
*(2026-08-24 즈음 — "GPU 아니라 전력이 병목"이 AI 가격·가용성에 어떻게 나타났는지, 온다가 배치성/실시간 AI 작업을 유연하게 나눴는지, 이 거시 배경이 장기 모델 계약 판단에 쓰였는지 기록.)*
