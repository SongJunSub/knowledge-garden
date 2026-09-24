---
title: "Amazon, Meta의 Muse가 자사 쇼핑몰에서 쇼핑하지 못하도록 차단 — 판례로 못 이기니 이용약관으로 막는다"
source_title: "Amazon blocks Meta's Muse AI assistant in new standoff over agentic shopping (외 다수 매체 종합)"
source_url: "https://www.geekwire.com/2026/amazon-blocks-metas-muse-ai-assistant-in-new-standoff-over-agentic-shopping/"
source_name: "GeekWire·Bloomberg·Forbes·TechTimes 등 종합, GeekNews(id=34181) 경유, WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=34181"
published_at: "2026-09-20~21 (미국 동부시각 일요일 밤 차단 시행)"
summarized_at: "2026-09-24"
category: "ai"
tags: ["meta-muse", "amazon", "agentic-commerce", "terms-of-service", "perplexity-comet", "cfaa", "platform-war"]
---

# Amazon, Meta의 Muse가 자사 쇼핑몰에서 쇼핑하지 못하도록 차단

> 출처: [Amazon blocks Meta's Muse AI assistant in new standoff over agentic shopping](https://www.geekwire.com/2026/amazon-blocks-metas-muse-ai-assistant-in-new-standoff-over-agentic-shopping/) (GeekWire) 외 Bloomberg·Forbes·TechTimes 종합 · GeekNews 경유 [id=34181](https://news.hada.io/topic?id=34181) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`geekwire.com`·`bloomberg.com` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. Slack 발췌(4개 불릿, 마지막이 "Amazon은 자체 *Alexa for Shopping*으로 구매 과정을 연…"에서 잘림)와 WebSearch(GeekWire, Bloomberg, Forbes, TechTimes, MediaPost, thenextweb 등 다수 매체) 교차확인으로 재구성했다. 핵심 사실(차단 시점, 법원 판단, 항소 기각, Amazon·Meta 각각의 주장)은 여러 매체에서 일관되게 확인된다.

## 한 줄 요약

**Amazon이 일요일 밤(9/20~21)부터 Meta의 개인 AI 에이전트 Muse가 Amazon.com에서 쇼핑하지 못하도록 차단했다 — Perplexity의 쇼핑 에이전트 Comet에 대한 금지 명령이 항소심(9th Circuit)에서 뒤집혀 "해킹" 논리(CFAA)를 더는 쓸 수 없게 되자, 대신 "고객이 이미 동의한 이용약관 위반"이라는 계약 근거로 방향을 튼 것이다. 다만 Amazon 자신의 쇼핑 에이전트 Buy for Me도 사전 동의 없이 제3자 사이트를 돌아다닌다는 점에서 ***이중잣대***라는 지적이 함께 나온다.**

## 핵심 포인트

- **차단 시행과 고지 문구** — 일요일 밤부터 Muse로 Amazon.com에 접근하면 ***"승인되지 않은 AI 에이전트의 지속적인 접근은 고객이 동의한 Amazon 이용약관(Conditions of Use) 위반"***이라는 팝업이 뜬다. Amazon은 Meta에 Muse를 아마존 쇼핑 경험에서 빼 달라고 먼저 요청했으나 받아들여지지 않자 직접 차단했다.
- **항소심 패소가 전략을 바꿨다** — 앞서 Perplexity의 Comet을 막았던 하급심 금지 명령이 ***9th Circuit 항소법원에서 뒤집혔다*** — Milan Smith 판사는 "금지 명령은 소비자 선택을 해치고 신생 기술의 발전을 불필요하게 제한할 것"이라며, "Amazon 서버에 접근하는 주체는 에이전트가 아니라 사용자"라고 판시했다(재심 요청도 기각). ***CFAA(컴퓨터 사기 및 남용 방지법)를 근거로 한 "무단 침입" 논리가 막히자, Amazon은 이번엔 계약(이용약관 동의) 근거로 옮겨간 것***으로 해석된다.
- **Amazon이 문제 삼은 지점** — Muse가 에이전트임을 밝히지 않고 활동했다는 점(신원 미표시), 사전 통지 없이 접근했다는 점, 그리고 ***고객 로그인 정보를 수집·저장하는 것으로 보인다는 점***을 문제로 든다. Meta는 이에 대해 ***"비밀번호와 결제수단을 에이전트가 볼 수 없는 구조"***라고 반박했다 — [[2026-09-09-muse-meta-personal-ai-agent]]에서 정리했던 Muse의 자격증명 분리·일회용 결제 카드 설계가 바로 이 반박의 근거다.
- **"이중잣대" 지적(WebSearch 보강)** — TechTimes 등은 ***Amazon 자체 쇼핑 에이전트 "Buy for Me"도 제3자 소매 사이트에서 사전 승인 없이 활동한다***는 점을 짚으며, Muse에게 요구하는 기준(사전 통지·신원 공개)을 Amazon 자신은 지키지 않는다는 모순을 지적한다. Amazon은 자체 Alexa for Shopping으로 구매 과정을 자사 생태계 안에 묶어두려는 것으로 보인다(발췌 절단으로 세부 미확인).
- **맥락 — Muse는 출시 일주일 만에 앱스토어 1위** — Muse는 출시 직후 미국 앱스토어 무료 앱 1위(ChatGPT를 제침)에 올랐을 정도로 빠르게 확산됐다 — Amazon이 신속하게 대응에 나선 배경으로 보인다.

## 인상 깊은 문장

> "[The injunction] would impair consumer choice and needlessly limit development of a nascent technology."
> (Circuit Judge Milan Smith, 9th Circuit 항소심 판결문, WebSearch 교차확인 인용)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). Hacker News에 별도 스레드(`news.ycombinator.com/item?id=49789982`)가 존재함은 WebSearch로 확인했으나 정확한 포인트·댓글 수·논조는 확인하지 못했다. **읽을 때 감안**: 이 사안은 Amazon·Meta·Perplexity 세 회사의 이해관계가 정면으로 부딪히는 플랫폼 전쟁이라, 각 언론사·각 회사의 공식 입장 모두 자기 진영의 논리를 강조하고 있을 가능성이 높다 — "이중잣대" 프레이밍도 비판적 매체의 해석이라는 점을 염두에 둬야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-23-meta-muse-filesystem-export-6-8gb]]에 이어, Muse 신뢰 위기가 "보안"에서 "플랫폼 접근권"으로 번짐

바로 전날 정리한 노트가 Muse의 실행 환경 파일시스템이 통째로 유출될 수 있다는 보안 문제를 다뤘다면, 이 글은 ***"신뢰할 수 없는 에이전트를 플랫폼 차원에서 원천 차단한다"***는 다른 층위의 대응이다. 같은 제품(Muse)에 대해 하루 이틀 사이 "보안 결함"과 "타사 플랫폼의 접근 거부"라는 서로 다른 방향의 압박이 동시에 쌓이고 있다는 점에서, Muse가 처한 신뢰 위기가 다면적이라는 걸 보여준다.

### 핵심 전이 2 — [[2026-09-09-muse-meta-personal-ai-agent]]가 강조한 "결제수단 설계"가 실전에서 처음 시험대에 오름

Muse 런칭 노트는 "에이전트가 결제수단 원본을 절대 보지 못하게 하는 보안 저장소"를 CRS 관점에서 가장 눈여겨볼 설계로 꼽았다. 이번 Amazon의 반박("고객 로그인 정보를 수집·저장하는 것으로 보인다")은 바로 그 설계의 실효성에 대한 최초의 실전 이의 제기다 — 설계도가 아무리 정교해도, 플랫폼 상대방이 "그렇게 안 보인다"고 주장하면 신뢰는 다시 원점에서 검증돼야 한다는 걸 보여준다.

### 핵심 전이 3 — [[2026-05-08-the-dark-marketplace]]가 예고한 "에이전트 vs 플랫폼" 힘겨루기의 실제 사례

엔지니어링 카테고리의 다크 마켓플레이스 노트가 이론화했던 "에이전트가 플랫폼을 대신 방문할 때 플랫폼이 통제력을 잃는다"는 긴장이, 이번엔 법정·이용약관을 무대로 한 실제 힘겨루기로 나타났다. 법원이 "해킹이 아니다"라고 판시하자 플랫폼은 곧바로 "그럼 계약 위반"이라는 다음 방어선으로 옮겨간다는 점에서, 에이전트 커머스를 둘러싼 법적 공방이 한 번의 판결로 끝나지 않고 계속 새로운 근거를 찾아 이어질 것임을 시사한다.

## 호스피탈리티 / CRS 적용 포인트

- **채널 접근권 정책을 지금 정해둬야 한다** — 온다 CRS·채널사 사이트에 외부 예약 에이전트(가상의 "여행판 Muse")가 접근을 시도할 경우를 대비해, "에이전트는 반드시 신원을 밝히고 사전 동의를 받아야 한다"는 원칙을 이용약관 차원에서 미리 못박아 두는 게, 사후에 법적 근거를 찾아 헤매는 것보다 훨씬 유리한 위치다.
- **"우리 자체 에이전트에는 다른 기준을 적용하지 않는가"를 먼저 점검** — Amazon이 받은 "이중잣대" 비판은 CRS에도 그대로 적용될 수 있는 질문이다 — 온다가 자체 AI 기능(요금 추천, 자동 응대)을 파트너 채널·OTA 사이트에 붙일 때, 외부 에이전트에게 요구할 기준(신원 공개, 사전 동의)을 자사 에이전트에도 동일하게 적용하고 있는지 미리 점검할 가치가 있다.
- **결제·자격증명 분리 설계는 여전히 유효한 참고 기준** — [[2026-09-09-muse-meta-personal-ai-agent]]에서 짚은 "에이전트가 결제수단 원본을 못 보게 하는 구조"는 이번 분쟁으로 무효화된 게 아니라, 오히려 "그런 설계만으로는 플랫폼의 신뢰를 얻기에 충분하지 않다"는 걸 보여준 사례에 가깝다 — 기술 설계와 플랫폼 간 신뢰는 별개 문제라는 원칙을 다시 확인한다.

## 연관 자료

- [[2026-09-23-meta-muse-filesystem-export-6-8gb]] — 하루 전 정리한 Muse 보안 결함 사례, 같은 제품에 겹치는 다른 층위의 신뢰 위기
- [[2026-09-09-muse-meta-personal-ai-agent]] — Muse의 결제·자격증명 분리 설계 원조 소개, 이번 공방의 핵심 쟁점
- [[2026-05-08-the-dark-marketplace]] — "에이전트가 플랫폼 통제력을 침식한다"는 긴장을 먼저 이론화한 글, 이번엔 법정 공방으로 실현된 사례

## 한 달 뒤 회고

*(2026-10-24 즈음 — Meta가 Amazon 차단에 대응해 항소·기술적 우회를 시도했는지, Amazon Alexa for Shopping의 구체적 확장 계획, "이중잣대" 비판에 대한 Amazon의 공식 대응 여부 점검.)*
