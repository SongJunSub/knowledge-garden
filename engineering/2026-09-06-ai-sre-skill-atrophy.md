---
title: "AI가 장애를 처리할수록 엔지니어는 시스템 감각을 잃는다 (Sylvain Kalache) — 평균 복구 시간은 줄지만, 그 줄어든 시간이야말로 숙련도를 만들던 연습이었다"
source_title: "AI handles incidents, engineers lose touch with their systems"
source_url: "https://www.sylvainkalache.com/blog/ai-handles-incidents-engineers-lose-touch-with-their-systems"
source_name: "Sylvain Kalache"
referrer_url: "https://news.hada.io/topic?id=33263"
summarized_at: "2026-09-06"
category: "engineering"
tags: ["sre", "ai-sre", "incident-response", "skill-atrophy", "automation-irony", "on-call"]
---

# AI가 장애를 처리할수록 엔지니어는 시스템 감각을 잃는다 (Sylvain Kalache) — 평균 복구 시간은 줄지만, 그 줄어든 시간이야말로 숙련도를 만들던 연습이었다

> 출처: [AI handles incidents, engineers lose touch with their systems](https://www.sylvainkalache.com/blog/ai-handles-incidents-engineers-lose-touch-with-their-systems) (Sylvain Kalache) · GeekNews(id=33263) 경유 · 정리일 2026-09-06

> **출처 한계**: `sylvainkalache.com`·`news.hada.io` 모두 이번 세션 egress 차단으로 원문 직접 열람 불가. WebSearch로 이 글이 Hacker News에도 올라와 논의됐다는 사실은 확인했으나(news.ycombinator.com도 이번 세션에서 egress 차단되어 스레드 내용·댓글 수는 직접 확인 못함), Slack 발췌 요약과 WebSearch 스니펫을 교차 확인해 재구성했다.

## 한 줄 요약

**AI SRE(경보 분석부터 가설 수립, 텔레메트리 조회, 배포 내역 연계, 수정까지 맡기는 자동화)가 흔한 장애를 더 빨리 처리해 평균 복구 시간(MTTR)을 낮추는 동시에, 엔지니어가 시스템의 동작 방식과 장애 패턴을 몸에 익힐 기회 자체를 줄인다는 역설을 다룬 글. 1983년 Lisanne Bainbridge의 "자동화의 아이러니" 논문을 근거로, 자동화할수록 오히려 더 높은 숙련도와 의도적인 훈련이 필요하다고 주장한다.**

## 핵심 포인트

- **자동화의 역설(1983년 논문 재조명)** — Bainbridge의 "The Ironies of Automation"은 자동화가 운영자에게서 일상적인 작업을 연습할 기회를 빼앗으면서도, 새롭고 이례적인 상황에 대한 책임은 그대로 남겨둔다고 지적했다. AI SRE는 이 아이러니를 장애 대응 영역에서 그대로 재현한다.
- **흔한 장애는 더 빨리, 드문 장애는 더 느리게** — AI가 흔한 장애 패턴을 빠르게 처리할수록, 그 반복 경험으로 시스템 감각을 쌓아온 엔지니어들은 정작 **AI가 풀지 못하는 복잡하고 낯선 장애**를 만났을 때 예전보다 **경험이 부족한 상태로 대응**하게 된다 — 대응 시간이 오히려 길어질 수 있다.
- **위험한 직무 형태** — 결과적으로 "지루하지만 매우 큰 책임"을 지는 직무가 만들어진다. 대부분의 시간은 할 일이 없다가(AI가 처리하므로), 정작 사람이 나서야 할 순간엔 숙련도가 가장 필요한데 가장 부족한 상태가 된다.
- **침식은 보이지 않는다** — 겉으로 개선되는 지표(MTTR, 알림 처리 속도)만 보이고, 그 밑에서 실제로 얼마나 이해도가 침식되고 있는지는 드러나지 않다가, 예전만큼 빠르게 디버그할 수 없는 비싸고 느린 장애로 갑자기 표면화된다.
- **항공업계의 해법 차용** — 상용 항공은 이미 이 문제를 겪었고, 조종사가 실제 비행에서 절대 겪지 않을 엔진 고장 같은 시나리오까지 정기적으로(보통 6~12개월 주기) 시뮬레이터 훈련을 받도록 의무화해 해결했다. 저자는 SRE 조직도 "MTTR 하락을 준비됐다는 증거로 읽는 대신, 정기적인 장애 시뮬레이션과 실전 연습을 온콜 준비 절차에 명시적으로 넣어야 한다"고 제안한다.

## 인상 깊은 문장

> (WebSearch 스니펫 기반 재구성, 원문 직접 인용 아님) "routine incidents are also how responders develop an intuition for how their systems behave and fail" — 흔한 장애야말로 엔지니어가 시스템의 행동과 실패 방식에 대한 직관을 기르는 통로다.

## 댓글

hada 댓글 수는 `news.hada.io` 접근 차단으로 확인하지 못했다. 이 글은 Hacker News에도 게시되어 논의된 것으로 WebSearch에서 확인했으나, `news.ycombinator.com` 접근도 이번 세션에서 차단되어 실제 댓글 논조·반박 여부는 확인하지 못했다 — **큐레이션 존재는 확인, 내용은 미확인**이라는 점을 정직하게 밝힌다. 저자가 SRE·인시던트 관리 도구(Rootly) 창업자로 알려져 있어([[2026-09-04-samsung-agentcore-aiops-02]]류 AI SRE 제품과 이해관계가 있을 수 있는 업계 종사자 관점이라는 점도 참고할 필요가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 오늘 같이 정리한 "AI가 내 두뇌를 망치고 있을까"와 정확히 같은 구조

[[2026-09-06-is-ai-ruining-my-brain-thoughtbot]]은 개인 개발자가 디버깅을 Cursor에 맡기며 문제 해결 반사를 잃어가는 걸 다뤘다. 이 글은 조직의 SRE 온콜 체계에서 똑같은 구조가 일어난다고 말한다. **"AI가 반복적인 소모 작업을 흡수하면, 그 소모 작업이야말로 숙련도를 유지시키던 연습이었다"**는 하나의 명제가 개인 차원과 조직 차원 모두에서 반복되는 걸 확인할 수 있다.

### 핵심 전이 2 — [[2026-06-01-ai-in-sre-google-reliable-operations]]의 "운영자→설계자" 전환론과 정면으로 부딪힌다

Google의 SRE-AI 방법론 노트에서 정리했던 "자율성 레벨을 단계적으로 높이며 운영자가 설계자로 진화한다"는 낙관적 프레임과, 이 글의 "자동화가 진짜 필요한 순간의 숙련도를 갉아먹는다"는 비관적 프레임은 같은 현상을 다른 각도에서 본다. 둘을 겹치면 **핵심 변수는 "자동화 수준"이 아니라 "의도적인 훈련을 병행하는가"**라는 게 드러난다 — Google 방법론도 안전 삼각축의 한 축으로 인간 검증을 요구하는데, 이 글은 그 검증 활동 자체가 훈련으로 설계되지 않으면 형식적 게이트로 전락한다고 경고하는 셈이다.

### 핵심 전이 3 — [[2026-09-04-samsung-agentcore-aiops-02]]·[[2026-09-04-sre-observer-alert-root-cause]]가 만드는 도구를 이 관점으로 재검토할 필요

최근 정리한 AI SRE 도구들(삼성 AgentCore AIOps, LY Corporation SRE Observer)은 모두 "사람과 에이전트가 같은 작업판 위에서 단계적으로 승인하며 협업"하거나 "메트릭·로그·트레이스를 자동으로 이어 원인을 찾는" 방향으로 설계됐다. 이 글의 문제의식을 적용하면, **이런 도구를 도입할 때 "사람이 승인만 누르는 수동적 관찰자가 되지 않도록, 정기적으로 실제 장애 대응을 직접 해보는 시뮬레이션 훈련을 병행하는지"가 도구 자체의 설계만큼 중요한 운영 정책 질문**이 된다.

## 호스피탈리티 / CRS 적용 포인트

온다의 온콜·장애 대응 체계에도 직접 적용 가능한 원칙이다. **CRS 장애 대응에 AI 기반 알림 분석·원인 추정 도구를 도입하더라도, MTTR 개선을 "팀이 준비됐다"는 증거로 착각하지 말고, 분기별로 실제 과거 장애(채널 연동 실패, 예약 동기화 지연 등)를 재현한 모의 훈련을 온콜 로테이션에 정기적으로 넣어야 한다.** 특히 신규 온콜 엔지니어일수록 "AI가 흔한 장애를 대신 처리해줘서 실전 경험을 쌓을 기회 자체가 적어진다"는 점을 온보딩 설계에 반영할 필요가 있다.

## 연관 자료
- [[2026-09-06-is-ai-ruining-my-brain-thoughtbot]] — 개인 개발자 차원에서 같은 구조(AI가 반복 작업을 흡수하면 숙련 기회도 사라짐)를 다룬 고백
- [[2026-06-01-ai-in-sre-google-reliable-operations]] — "운영자→설계자" 전환이라는 낙관적 프레임과의 대비
- [[2026-09-04-samsung-agentcore-aiops-02]] — 사람-에이전트 협업형 AIOps 도구, 이 글의 훈련 병행 원칙을 적용해볼 대상
- [[2026-09-04-sre-observer-alert-root-cause]] — 원인 자동 추적 SRE 도구, 같은 질문(도구가 훈련 기회를 대체하는가)이 적용됨

## 한 달 뒤 회고
*(2026-10-06 즈음 — Bainbridge 1983년 논문의 원문을 직접 확인했는지, 항공업계식 정기 장애 시뮬레이션 훈련을 CRS 온콜 로테이션에 실제로 설계해봤는지 점검.)*
