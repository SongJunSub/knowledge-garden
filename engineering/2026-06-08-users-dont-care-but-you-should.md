---
title: "사용자는 신경 쓰지 않는다, 하지만 당신은 신경 써야 한다 — 안 보이는 코드 품질이 결과를 만든다 (판단·craft·품질 라인)"
source_title: "Users don't care — but you should"
source_url: "https://lewiscampbell.tech/blog/260607.html"
source_name: "lewiscampbell.tech · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30277"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["code-quality", "maintainability", "user-value", "engineering-philosophy", "incentives", "judgment-line"]
---

# 사용자는 신경 쓰지 않는다, 하지만 당신은 신경 써야 한다 — 안 보이는 코드 품질이 결과를 만든다 (판단·craft·품질 라인)

> 출처: [Users don't care — but you should](https://lewiscampbell.tech/blog/260607.html) (Lewis Campbell, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**"고객은 테스트·기술 스택을 신경 쓰지 않고 *제품이 작동하는지만* 신경 쓴다"는 통념은 표면적으로 맞지만 위험하다 — *코드 품질은 사용자가 직접 보지 않아도 성능·버그 수정 시간·기능 추가 시간*에 실질적으로 영향을 준다. *다리 검사·조종사 상태·건물 기초*처럼 *안 보이는 요소도 최종 결과를 만든다*. 이 통념의 인기는 종종 *자기 약점을 정당화하는 자아 방어 기제*에서 온다. 진지한 소프트웨어는 *서로 다른 관심사·관점의 혼합물*이고, *코드 품질을 포함한 모든 요소가 성공에 기여*한다. 댓글: *"고객은 동작을 신경 쓴다"가 "쓰레기를 출시하라"로 오용*, *유지보수 비용을 출시일로만 재는 실수*("일주일도 안 걸린다"가 이후 2~4주 유지보수 무시), *Boeing/Airbus처럼 최적점이 존재*.**

## 핵심 포인트

- **안 보이는 품질이 *결과*를 만든다** — *사용자는 코드 품질을 안 보지만, 그 결과(성능·버그·기능 속도)는 본다*. **[[2026-06-01-my-software-north-star]] *"정확성·유지보수는 버릴 수 없는 수단"*의 정면 전개** — 사용자 효용이 목적이라도 *품질은 그 효용의 *간접 원인*.
- **"사용자는 작동만 신경"의 정직한 반박** — 이번 흐름의 반복 통념([[2026-06-01-ask-hn-why-anti-ai]] OP·[[2026-06-08-taste-is-the-new-10x]] *잘못된 것을 아름답게*)에 대한 *docmars 측 논증의 명시판*. *"작동한다"의 시간 지평*(오늘 데모 vs 6개월 유지)을 분리.
- **유지보수 비용을 출시일로만 재지 말라** — *"일주일도 안 걸린다"가 이후 2~4주를 무시*. **[[2026-06-01-code-is-cheaper]] *이해 비용↑*·[[2026-06-08-artisans-and-builders]] *프로토타입 ≠ 견고 시스템*의 비용 회계판** — *총소유비용(TCO)으로 재라*.
- **자아 방어 기제 경계** — *통념의 인기 = 자기 약점 정당화*. **[[2026-06-01-ask-hn-why-anti-ai]] *개인 동기 vs 객관 분석 구분*과 같은 자기 점검** — *"쓰레기 출시"를 합리화하는 서사*를 의심.
- **최적점이 존재한다 (Boeing/Airbus)** — *과품질도 저품질도 아닌 적정점*. **[[2026-05-29-choose-boring-technology-2015]] *혁신 토큰 배분*·[[2026-06-08-taste-is-the-new-10x]] *판단(taste)*으로 그 지점을 찾기** — 품질은 *이분법이 아니라 판단*.

## 인상 깊은 문장

> *(요지)* 사용자는 코드 품질을 직접 신경 쓰지 않는다 — 하지만 그것은 *성능·버그 수정 시간·기능 추가 시간*을 통해 사용자가 보는 결과를 만든다.

> *(요지)* "사용자는 작동만 신경 쓴다"는 통념은 종종 *자기 약점을 정당화하는 자아 방어*일 뿐이다.

> *(댓글)* 유지보수 비용을 *출시일로만 재는 것*은 흔한 실수다 — "일주일도 안 걸린다"가 이후 *2~4주*를 무시한다.

## 내 생각 · 적용점

가든의 *판단·craft·품질 라인*([[2026-06-01-my-software-north-star]] 효용=목적·[[2026-06-01-code-is-cheaper]] 이해 비용·[[2026-06-08-taste-is-the-new-10x]] taste·[[2026-06-08-artisans-and-builders]] 장인)의 **품질 회계 차원**. 이번 세션이 반복한 *"사용자는 작동만 신경"* 통념([[2026-06-01-ask-hn-why-anti-ai]] OP)에 대한 *가장 명시적이고 정직한 반박* — **사용자가 안 봐도 *당신*은 신경 써야 한다, 왜냐면 품질이 *결과의 간접 원인*이고 *유지보수 비용은 출시 후에 청구*되기 때문**. **친·반 AI 균형 카운팅 무관한 판단·craft·품질 라인** (부채 0 유지). 실무: *유지보수 비용을 TCO로 회계*, *"쓰레기 출시"의 자아 방어를 자기 점검*, *Boeing/Airbus식 최적점을 taste로 판단*.

## 연관 자료
- [Users don't care — but you should](https://lewiscampbell.tech/blog/260607.html) (원문)
- [GeekNews — 30277](https://news.hada.io/topic?id=30277)
- [[2026-06-01-my-software-north-star]] — 정확성·유지보수=버릴 수 없는 수단 *(정면 전개)*
- [[2026-06-01-ask-hn-why-anti-ai]] — OP "작동만 신경" *(docmars 반박의 명시판)*
- [[2026-06-01-code-is-cheaper]]·[[2026-06-08-artisans-and-builders]] — 유지보수 비용·견고 시스템
- [[2026-06-08-taste-is-the-new-10x]]·[[2026-05-29-choose-boring-technology-2015]] — 최적점 판단·혁신 토큰
- [[2026-05-26-bottleneck-is-organization]]·[[2026-06-01-domain-expertise-is-the-real-moat]] — 속도≠가치·검증

## 한 달 뒤 회고
*(2026-07-08 즈음 — 유지보수 비용을 출시일이 아니라 TCO로 쟀는지, "쓰레기 출시"의 자아 방어를 자기 점검했는지, 품질의 최적점을 이분법이 아니라 판단으로 찾았는지 기록.)*
