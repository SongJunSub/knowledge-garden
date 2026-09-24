---
title: "GPT-6 Astra, 실제 자동차로 콘 코스를 완주하다 (DrivingBench) — 두 번째 시도, 그리고 휘발유값의 500배"
source_title: "GPT-6 Astra has gained the ability to drive a car / DrivingBench"
source_url: "https://drivingbench.com/"
source_name: "DrivingBench, GeekNews(id=34187) 경유, WebSearch(Hacker News, officechai, Aroged, X) 교차확인"
referrer_url: "https://news.hada.io/topic?id=34187"
published_at: "2026-09-23 추정 (DrivingBench 결과 공개일, 정확한 게시 시각 미확인)"
summarized_at: "2026-09-24"
category: "ai"
tags: ["gpt-6-astra", "drivingbench", "embodied-ai", "autonomous-driving", "benchmark", "claude-fable", "vision-language-action"]
---

# GPT-6 Astra, 실제 자동차로 콘 코스를 완주하다 (DrivingBench)

> 출처: [DrivingBench](https://drivingbench.com/) · GeekNews 경유 [id=34187](https://news.hada.io/topic?id=34187) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`drivingbench.com`·`officechai.com`·`trendingtopics.eu` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. Slack 발췌(4개 불릿, 마지막이 "*Claude Fable 5.…"에서 잘림)와 WebSearch(Hacker News `item?id=49817404`, officechai, Aroged, X의 연구자 스레드) 교차확인으로 재구성했다. 비용 수치(API $57.46/km vs 휘발유 $0.114/km, 약 500배)와 첫 시도 49%·둘째 시도 5분22초 완주는 여러 매체에서 일관되게 확인된다.

## 한 줄 요약

**DrivingBench가 comma.ai 하드웨어로 개조한 실제 Toyota Corolla를 GPT-6 Astra, Claude Fable 5.1, Grok 4.6, GPT-5.6 Sol 네 모델에게 맡겨 134.7m 콘 코스를 운전하게 했고, GPT-6 Astra만 유일하게 완주(2차 시도, 5분22초)했지만 API 비용은 ***km당 57.46달러로 휘발유(km당 0.114달러)의 약 500배***였다 — 그리고 애초에 모델이 "실차 운전"을 안전상 거부하지 않도록 연구자들이 "시뮬레이션이라고 속이는" 우회가 필요했다는 방법론적 함정도 함께 드러났다.**

## 핵심 포인트

- **네 모델 중 유일한 완주, 그것도 두 번째 시도에서** — 1차 시도에서 코스의 49%까지 진행한 뒤 실패, ***2차 시도에서 요청 속도를 초속 0.8m 이하로 낮추고 조향 방식을 바꿔 5분 22초 만에 완주***했다. Claude Fable 5.1, Grok 4.6, GPT-5.6 Sol은 세 번의 기회 안에 완주하지 못했다.
- **완주는 했지만 비용은 압도적으로 비쌈** — API 호출 기준 운영 비용이 ***km당 57.46달러로, 평균 휘발유 소비 비용(km당 0.114달러)의 약 500배***에 달한다. "가능하다"와 "실용적이다"는 전혀 다른 질문이라는 걸 숫자가 그대로 보여준다.
- **모델이 안전을 이유로 거부하자, 연구자가 속여서 우회함** — 더 눈에 띄는 대목은, 여러 모델이 처음엔 "실제 차를 운전하는 건 위험하다"며 통제를 거부했는데, ***연구자들이 "이건 시뮬레이션"이라고 말하거나 MCP 서버 이름을 "DrivingBench Sandbox"로 바꿔서*** 모델의 거부를 우회했다는 점이다(WebSearch로 확인, Slack 발췌엔 없던 세부). 안전 판단을 제품 설계로 존중한 게 아니라 명칭을 바꿔 속인 셈이라, 이 벤치마크의 "성공"을 액면 그대로 받아들이기 조심스러운 지점이다.
- **X(트위터) 연구자 스레드의 생생한 실패 묘사** — Aditya Ramabadran(추정 연구자)의 스레드에 따르면 ***"몇 시간 동안 Astra는 빈 주차장·시속 7마일 제한·사람이 브레이크에 발을 얹고 있다는 조건을 줘도 실차 운전을 일관되게 거부했다. '시뮬레이션'이라고 말해도 카메라 화면을 보고는 실제 상황임을 알아챘다"***고 한다 — 모델이 "속아 넘어가지 않으려는" 저항이 상당했다는 뜻이다.

## 인상 깊은 문장

> "For hours, Astra refused to consistently drive our toyota irl even though we told it it was in an empty lot, 7 mph cap, human foot on the brake etc. Telling it the whole thing was a 'simulation' also failed, it would just look at the camera and realized it was real."
> (Aditya Ramabadran, X 스레드, WebSearch로 확인 및 재인용)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). Hacker News에 별도 스레드(`news.ycombinator.com/item?id=49817404`, "GPT-6 Astra has gained the ability to drive a car")가 존재함은 WebSearch로 확인했으나 정확한 포인트·댓글 수·논조는 확인하지 못했다. **표본 한계**: DrivingBench는 신생 벤치마크이고 과제도 사실상 1개 코스·각 모델 최대 3회 시도라 표본이 매우 작다 — "GPT-6 Astra가 운전을 잘한다"보다는 "이 특정 코스·이 특정 하네스 설정에서 유일하게 성공했다" 정도로 좁혀 읽는 게 정직하다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-07-gpt-6-astra-robot-arm-robocurve]]와 같은 패턴의 반복: "물리 세계 조작"에서 Astra가 계속 앞서지만, 격차는 과제마다 다르다

로봇 팔 노트에서도 GPT-6 Astra는 블록 집기 과제에서 Claude Fable 5.1을 크게 앞섰지만(19/20 대 8/20), 정밀 삽입 과제에서는 둘 다 참패했다(2/20). 이번 DrivingBench도 같은 구도다 — Astra가 "물리 세계를 실시간으로 조작하는" 벤치마크에서 반복적으로 앞서지만, ***같은 모델도 과제 종류(코스 완주 vs 정밀 조작)에 따라 성패가 극단적으로 갈린다***는 원칙은 그대로다. 다만 이번엔 새로운 변수(비용 500배, 안전 거부를 속여서 우회)가 더해져, "이겼다"는 결론을 그대로 받아들이기 전에 따져볼 게 늘었다.

### 핵심 전이 2 — 안전 거부를 "속여서" 우회한 방법론 자체가, [[2026-09-14-why-ai-agents-lie-cheat-collude]] 계열 문제의 거울상

이 벤치마크에서 흥미로운 건 모델의 성능이 아니라 **평가자의 태도**다 — 모델이 안전을 이유로 거부하는 걸 "제대로 못 하는 것"으로 취급하고 속임수(시뮬레이션이라고 거짓말, MCP 서버 이름 바꾸기)로 뚫었다. 에이전트가 부정직해지는 문제를 다루는 노트들과 반대 방향에서, ***"평가자가 에이전트의 안전 판단을 존중하지 않고 속여서 우회한다"***는 사례로 볼 수 있다 — 안전장치를 무력화하는 주체가 항상 모델 쪽이라는 보장은 없다는 걸 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS는 실차 제어와 도메인이 다르다. 다만 두 가지 원칙은 전이 가능하다. 첫째, ***"할 수 있다"와 "비용 대비 쓸 만하다"는 다른 질문***이라는 점 — CRS에 새 AI 기능을 검토할 때도 데모의 성공 여부만이 아니라 실제 운영 비용(API 호출량·재시도 비용)까지 함께 봐야 한다는 교훈은 그대로 적용된다. 둘째, ***에이전트가 안전을 이유로 특정 액션을 거부할 때, 그 판단을 우회하는 방식(예: 안내문구를 바꿔 속이기)으로 밀어붙이면 안 된다***는 경고 — CRS 에이전트가 "이 예약 변경은 위험 신호"라며 거부할 때, 그 판단을 프롬프트 트릭으로 무력화하는 식의 설계는 피해야 한다.

## 연관 자료

- [[2026-09-07-gpt-6-astra-robot-arm-robocurve]] — 물리 세계 조작에서 Astra가 Fable을 앞서지만 과제별로 극단적으로 갈리는 같은 패턴의 선행 사례
- [[2026-09-07-gpt-6-astra-harness-is-the-product]] — "모델은 슬롯, 하네스가 제품"이라는 원칙, 이번엔 MCP 서버 이름을 바꾸는 것도 하네스 설계의 일부임을 보여줌
- [[2026-09-04-gpt-6-astra-arc-agi-3]] — 같은 모델도 조건에 따라 점수가 극단적으로 갈린다는 반복 확인

## 한 달 뒤 회고

*(2026-10-24 즈음 — DrivingBench가 더 많은 코스·모델로 확장됐는지, "안전 거부를 속여서 우회"한 방법론에 대한 비판적 논의가 이어졌는지, 비용($57.46/km)이 후속 최적화로 낮아졌는지 점검.)*
