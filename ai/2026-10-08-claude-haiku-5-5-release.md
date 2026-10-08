---
title: "Claude Haiku 5.5 출시 (Anthropic) — 토큰 단가는 90% 내렸는데 평균 실행비용은 75%만 줄었다, 그 차이를 새 토크나이저가 먹었다"
source_title: "Claude Haiku 5.5 arrives with massive price cuts"
source_url: "https://the-decoder.com/claude-haiku-5-5-arrives-with-massive-price-cuts-proving-the-ai-pricing-arms-race-is-far-from-over/"
source_name: "the-decoder.com 외 5곳+ 매체 교차확인(Anthropic 공식 발표 페이지 직접 접근 불가)"
referrer_url: "https://news.hada.io/topic?id=34958"
published_at: "2026-10-07"
summarized_at: "2026-10-08"
category: "ai"
tags: ["claude-haiku-5-5", "anthropic", "model-release", "pricing", "osworld", "terminal-bench", "reasoning-effort"]
---

# Claude Haiku 5.5 출시 (Anthropic)

> 출처: [Claude Haiku 5.5 arrives with massive price cuts](https://the-decoder.com/claude-haiku-5-5-arrives-with-massive-price-cuts-proving-the-ai-pricing-arms-race-is-far-from-over/) (the-decoder.com) · GeekNews(id=34958) 경유 · 정리일 2026-10-08

> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 열지 못했다. Anthropic 공식 발표 페이지(`anthropic.com`)도 추정 URL로 시도했으나 404를 받아 직접 열지 못했고, `site:anthropic.com` WebSearch도 이 세션에서 색인된 결과를 돌려주지 못했다. 대신 **the-decoder, Decrypt, MarkTechPost, Yahoo Finance, Technology.org, TheTechPortal 등 6곳 이상의 독립 매체가 가격·벤치마크 수치에서 일치**해, 2차 소스지만 교차확인 신뢰도는 높다고 판단했다. 다만 Slack 발췌에 있던 "Max·Team 플랜에 API 크레딧 제공" 부분은 WebSearch로 별도 검증하지 못했다 — Fable 5 출시 때 있었던 비슷한 플랜 혜택과 혼동됐을 가능성도 있어, 이 항목은 미확정으로 남긴다. hada 댓글 수도 확인 불가.

## 한 줄 요약

**Claude Haiku 5.5는 100만 토큰당 입력 $0.10·출력 $0.50(프롬프트 10만 토큰 이하)로 Haiku 4.5 대비 토큰 단가를 90% 내렸지만, Sonnet 5.5·Opus 5.5와 공유하는 새 토크나이저가 같은 작업에 더 많은 토큰을 쓰게 만들어 실제 평균 실행비용 절감은 75%에 그쳤다 — 그 대신 OSWorld 2.1 72.4%·Terminal-Bench 4.0 39.2%로 Haiku 4.5(15.7%·0%)를 큰 격차로 앞서고, Haiku 계열 최초로 추론 노력(effort)을 조절할 수 있게 됐다.**

## 핵심 포인트

- **가격 — 90% 인하, 그런데 "평균" 절감은 75%** — 10만 토큰 이하 프롬프트에서 ***입력 $0.10·출력 $0.50***(Haiku 4.5는 $1·$5), 10만 토큰 초과 시 $0.50·$2.50. 캐시 읽기는 $0.01~$0.05, 배치 처리는 추가 50% 할인. 토큰당 단가는 90% 내렸지만, Sonnet 5.5·Opus 5.5와 공유하는 ***새 토크나이저가 같은 작업에 더 많은 토큰을 쓰게 만들어*** 토큰 사용량 변화까지 반영한 평균 실행 비용 절감은 ***약 75%***로 보도됐다.
- **벤치마크 — Haiku 4.5를 큰 격차로 앞서지만 Sonnet·Opus와는 여전히 거리가 있다** — 컴퓨터 사용 OSWorld 2.1에서 ***Haiku 5.5 72.4% vs Haiku 4.5 15.7% vs GPT-6 Luna 48.9% vs Sonnet 5.5 83.9%***. 에이전트 코딩 Terminal-Bench 4.0에서 ***Haiku 5.5 39.2% vs Haiku 4.5 0% vs GPT-6 Luna 16.4% vs Sonnet 5.5 70.6%***. 소형 모델치고는 큰 도약이지만, Anthropic 스스로도 복잡한 에이전틱 코딩엔 Sonnet 5.5·Opus 5.5를 권한다.
- **1M 컨텍스트 + 추론 노력 조절 — Haiku 계열 최초** — 1백만 토큰 컨텍스트 윈도우와 최대 128K 출력 토큰을 지원하며, ***Haiku 계열 최초로 추론 노력(effort) 수준을 조절***할 수 있어 작업별로 비용과 지능을 맞바꿀 수 있다.
- **(미확정) Max·Team 플랜 API 크레딧** — Slack 발췌는 "Max·Team에 API 크레딧 제공"을 언급했지만, 이 세션의 WebSearch로는 독립적으로 확인하지 못했다. 과거 Claude Fable 5 출시 때 Team Standard/Pro 사용자에게 1회성 $100 크레딧을 준 사례가 있어 비슷한 패턴일 가능성은 있으나, Haiku 5.5에 그대로 적용됐는지는 확정하지 못한다.
- **출시일** — 2026-10-07.

## 인상 깊은 문장

> "평균적으로 Haiku 5.5를 실행하는 비용은 Haiku 4.5보다 약 75% 낮다." (복수 매체가 일관되게 보도한 Anthropic 측 설명 재인용, 원문 직접 대조는 못함)

## 댓글

GeekNews(hada) 댓글 수는 egress 차단으로 확인 불가. 반응 "amaze" 1개만 Slack 발췌로 확인됐다. HN·Lobsters 큐레이션 유무도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 5.5 세대, 토큰 절감으로 체감 비용을 낮추는 같은 전략

[[2026-09-29-claude-sonnet-5-5-release]]는 가격은 그대로 두고 "같은 작업에 필요한 토큰 자체를 줄여 작업당 비용을 최대 30% 낮췄다"고 했다. Haiku 5.5는 반대 방향에서 같은 긴장을 보여준다 — ***토큰 단가를 90% 낮췄지만, 같은 세대가 공유하는 새 토크나이저가 토큰 수를 늘려 실제 절감폭(75%)을 갉아먹었다.*** 단가 발표만 보고 비용을 계산하면 안 된다는 교훈이 두 노트에 걸쳐 반복된다.

### 핵심 전이 2 — effort가 1차 변수가 되는 흐름이 Haiku까지 내려왔다

[[2026-10-04-getting-most-out-of-opus-5-5-in-claude-code]]는 Opus 5.5에서 "effort가 지능·지연·비용을 조절하는 1차 변수"가 됐다고 정리했다. Haiku 5.5가 ***Haiku 계열 최초로 이 조절 기능을 갖췄다는 것***은, Anthropic이 effort 조절을 5.5 세대 전체의 표준 인터페이스로 밀어붙이고 있다는 신호로 읽힌다. 다만 effort 이름(low/medium/high)이 모델마다 같은 사고량을 의미하지 않는다는 그 노트의 경고는 Haiku 5.5에도 그대로 적용될 가능성이 높다 — 값을 그대로 옮기지 말고 재측정해야 한다.

### 핵심 전이 3 — 이 가든의 일일 루틴 자체에 거는 실질적 의미

이 지식가든은 매일 Claude Code로 GeekNews·Slack 링크를 요약하는 반복 작업을 돈다. Haiku 5.5가 노린 용도 — "요약, 문맥 압축, 데이터베이스 질의, 분류, 코딩 보조 에이전트처럼 대량으로 반복하는 작업" — 는 이 루틴의 상당 부분(원문 WebFetch 요약, 카테고리 분류, README 한 줄 작성, 위키링크 후보 찾기)과 정확히 겹친다. Sonnet/Opus급 모델이 필요한 "핵심 전이 찾기·톤 잡기"는 그대로 두더라도, 분류·발췌·링크 실재 확인 같은 하위 작업을 Haiku 5.5로 내리면 세션 전체 비용과 지연을 줄일 수 있는 구체적 지점이다 — 다만 1M 토큰 컨텍스트·128K 출력이라는 스펙은 이런 소규모 반복 작업엔 과분하므로, 실제 절감은 effort를 낮게 잡을 때만 체감될 것이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성이 비교적 높은 축이다. CRS 운영에서 반복되는 저부담 작업 — 예약 문의 1차 분류, 리뷰 감정 분류, 로그·티켓 요약, 간단한 DB 질의 응답 — 은 Haiku 5.5가 겨냥한 용도와 거의 그대로 겹친다. 고가의 Sonnet/Opus 호출을 복잡한 판단에만 남겨두고, 대량·반복 구간을 Haiku 5.5로 내려 토큰 단가 90% 인하를 실제 비용 절감으로 전환하는 라우팅 전략을 검토할 만하다. 단, 실제 절감폭이 단가 인하만큼(90%)이 아니라 토크나이저 변화를 반영한 평균치(75%)에 가깝다는 점은 예산 추정 시 과대평가하지 않도록 주의가 필요하다.

## 연관 자료

- [[2026-09-29-claude-sonnet-5-5-release]] — 같은 5.5 세대의 토큰 절감 전략, 가격표만으로 비용을 판단할 수 없다는 같은 교훈.
- [[2026-10-04-getting-most-out-of-opus-5-5-in-claude-code]] — effort가 지능·비용·지연을 조절하는 1차 변수가 되는 흐름의 선행 사례.
- [[2026-09-23-gpt-6-sol-luna-release]] — OpenAI 쪽에서 같은 시기 벌어진 소형·경량 모델 가격 인하 경쟁의 대조 사례(GPT-6 Luna가 이번 벤치마크의 비교 대상으로도 등장).

## 한 달 뒤 회고

*(2026-11-08 즈음) Anthropic 공식 페이지에 직접 접근해 가격·벤치마크 수치를 1차 소스로 재확인하고, Max·Team API 크레딧 제공 여부를 확정한다. 이 가든의 요약 파이프라인에 실제로 Haiku 5.5를 일부 단계에 적용해봤는지, 적용했다면 체감 비용·속도 변화도 점검한다.*
