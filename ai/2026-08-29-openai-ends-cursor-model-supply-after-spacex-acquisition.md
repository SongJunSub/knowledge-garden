---
title: "OpenAI, SpaceX의 Cursor 인수 이후 모델 공급 중단 결정 (OpenAI) — 계약상 최대 통지 기간은 주되, Musk 계열사의 과거 위반 이력 때문에 신뢰는 접었다"
source_title: "Our decision on Cursor following its acquisition by SpaceX"
source_url: "https://openai.com/index/our-decision-on-cursor-following-its-acquisition-by-spacex/"
source_name: "OpenAI (공식 블로그)"
referrer_url: "https://news.hada.io/topic?id=33003"
published_at: "2026-08-29"
summarized_at: "2026-08-29"
category: "ai"
tags: ["openai", "cursor", "spacex", "elon-musk", "vendor-lockin", "contract-termination", "model-supply-chain", "astra"]
---

# OpenAI, SpaceX의 Cursor 인수 이후 모델 공급 중단 결정 (OpenAI)

> 출처: [Our decision on Cursor following its acquisition by SpaceX](https://openai.com/index/our-decision-on-cursor-following-its-acquisition-by-spacex/) (OpenAI 공식 블로그) · 정리일 2026-08-29
> **출처 한계**: `openai.com`이 이 세션에서 egress 차단돼 원문을 직접 읽지 못했다. 아래 내용은 freepressjournal·aninews·business-standard·officechai·explainx.ai 등 다수 매체가 원문을 인용·재구성한 WebSearch 스니펫과 Slack 발췌를 교차한 것이다. 이 매체들 자체도 이 세션에서 개별 WebFetch가 전부 막혀 직접 대조는 못했지만, 핵심 사실(11월 12일 차단·Musk 계열사 위반 이력·Astra 격리)이 검색 결과 다섯 곳 이상에서 일관되게 확인돼 사실관계 신뢰도는 높다고 판단한다. news.hada.io도 차단이라 hada 댓글은 확인 불가.

## 한 줄 요약

**SpaceX가 Cursor 개발사 Anysphere를 600억 달러 전액 주식 거래로 인수하자, OpenAI는 Cursor에 대한 자사 모델 직접 공급 계약을 종료하기로 했다 — 차단 예정일은 2026년 11월 12일이며, ***"개발자가 Cursor를 통해 우리 모델에 접근할 수 있는 시간을 최대화하기 위해 계약상 허용되는 최대 통지 기간을 준다"***고 밝혔다. 이유는 단순하다 — Musk가 인수한 Twitter(현 SpaceX 계열)가 과거 OpenAI 이용약관을 위반한 전례가 있고, xAI 역시 이용약관을 위반했다고 Musk 본인이 선서 증언에서 인정한 바 있어, ***SpaceX가 OpenAI 기술을 약관에 맞게 쓸 것이라 확신할 수 없다***는 것. 게다가 차기 모델 Astra는 중요 인프라를 겨냥한 익스플로잇을 식별·개발할 수 있는 잠재력이 있다고 판단돼 격리된 테스트 환경에 묶여 있으며, OpenAI는 Astra를 Cursor의 공식 경로로는 절대 제공하지 않겠다고 명시했다.**

## 핵심 포인트

- **타임라인** — SpaceX가 6월 Anysphere(Cursor) 인수를 발표, 8월 초 인수 완료. OpenAI는 인수 직후가 아니라 완료 이후 이 결정을 발표했다.
- **차단일과 근거** — ***차단 예정일 2026년 11월 12일***. 근거는 "지배권 변경(change of control) 후 제한된 기간에만 계약을 취소할 수 있다"는 맞춤 계약 조항 — 즉 지금이 OpenAI가 계약을 끊을 수 있는 마지막 창구였다는 뜻이다.
- **신뢰 붕괴의 구체적 전례** — Musk가 Twitter를 인수한 뒤 OpenAI 약관을 위반했고, xAI도 약관을 위반했다고 ***Musk 본인이 선서 증언에서 인정***했다는 게 근거로 인용됐다. "이번엔 안 그럴 거라 믿을 근거가 없다"는 논지.
- **Astra의 격리** — 차기 모델 Astra는 ***"중요 인프라를 겨냥한 익스플로잇을 식별·개발할 잠재력"***이 있다고 플래그돼 격리 테스트 환경에 묶여 있고, OpenAI는 이 모델이 공식 경로로 Cursor에 제공되는 일은 없을 것이라고 못박았다.
- **개발자에게 남는 길** — Cursor를 통한 직접 API 접근은 끊기지만, 개발자는 ***자기 OpenAI API 키***와 ***OpenAI의 Cursor 호환 IDE 확장***을 통해 여전히 OpenAI 모델에 접근할 수 있다.
- **더 큰 맥락** — 이 사건은 Musk-Altman 갈등을 한 단계 더 격화시키는 사건으로 보도되고 있다(다수 매체가 "escalating Musk-Altman clash"로 표제).

## 인상 깊은 문장

> "To maximize the time that developers can retain access to our models through Cursor, we are giving the maximum notice provided by our contract."
> (WebSearch로 재구성 — OpenAI 발표문의 원 문구로 다수 매체가 동일하게 인용하고 있어 신뢰도가 높다.)

## 댓글

- **hada 댓글 수·논지는 이 세션에서 확인 불가**(news.hada.io 차단). GeekNews 토픽 ID가 이번 배치의 다른 두 건(32989, 32999)보다 뒤(33003)라는 점, 그리고 이 사건 자체가 2026-08-29 당일 보도된 매우 신선한 뉴스라는 점(다수 매체 보도일이 08-29)에서, hada 댓글이 아직 많이 쌓이지 않았을 가능성이 있다 — 다만 이는 추정이다.
- HN/Lobsters 큐레이션 여부도 이 세션에서 확인하지 못했다.
- **읽을 때 감안**: OpenAI 자사 공식 발표문이 유일한 1차 소스이므로, "SpaceX가 약관을 어길 것"이라는 판단은 전적으로 OpenAI 쪽 서사다 — SpaceX/Cursor 측의 반박이나 별도 입장은 이 세션에서 찾지 못했다.

## 내 생각 · 적용점

이 사건은 이 가든이 최근 정리해온 두 축을 실제 프로덕션 사례로 확정해준다. 먼저 [[2026-07-14-migrating-production-agent-provider-assumptions]]가 "모델 교체는 한 줄 변경이 아니다"라고 정리했던 그 이행 비용을, Cursor는 11월 12일까지 강제로 떠안게 됐다 — 캐시 키·도구 스키마·평가 하네스 전부를 새 모델 프로바이더에 맞춰 다시 검증해야 하는 상황이 이론이 아니라 실제로 벌어진다. 그리고 [[2026-08-02-session-portability-inference-api-lockin]]이 경고했던 "계정을 닫아도 세션을 다른 모델에 넘길 수 있어야 한다"는 원칙이, 이번엔 계정이 아니라 ***계약 자체가 벤더 쪽에서 일방적으로 끊기는*** 더 근본적인 형태로 나타났다. 흥미로운 건 Cursor(Anysphere)가 최근 [[2026-08-19-cursor-origin-code-hosting]]·[[2026-08-27-cursor-continuity-git-at-scale]]에서 정리했듯 코드 호스팅·Git 저장 계층은 자체 인프라로 옮겨왔다는 점이다. 그런데 정작 에이전트의 두뇌인 모델 자체는 여전히 외부 벤더(OpenAI)에게 있었고, 그 벤더가 계약을 끊자 그 공들여 만든 표면은 무력화될 위기에 놓였다 — **인프라 종속을 끊어도 모델 종속이 남아 있으면 종속은 종속이다.**

## 호스피탈리티 / CRS 적용 포인트

온다가 이 사건의 직접 당사자는 아니라 적용은 일반론 수준이다. 다만 사내에서 특정 AI 코딩 도구(Cursor 등)나 특정 모델 벤더 API에 팀 전체 워크플로가 깊게 결합돼 있다면, 이번 사례는 "벤더 대 벤더 계약이 조직 개편(인수합병) 한 번으로 갑자기 끊길 수 있다"는 리스크를 구체적으로 보여준다 — [[2026-07-14-migrating-production-agent-provider-assumptions]]가 정리한 "숨은 가정 색출" 규율을 평소에 해둬야, 이런 강제 이전이 닥쳤을 때 이행 비용을 가늠할 수 있다. 특정 벤더 하나에만 하드코딩된 프롬프트·도구 스키마·캐시 전략이 있다면 그 결합도를 낮추는 것이 실무적으로 남는 교훈이다.

## 연관 자료
- [[2026-07-14-migrating-production-agent-provider-assumptions]] — "모델 교체는 한 줄 변경이 아니다"라는 논지가 이번엔 강제 이행 사례로 실현됨
- [[2026-08-02-session-portability-inference-api-lockin]] — 세션·모델 이식성 원칙이 계약 종료라는 더 근본적 형태로 나타난 사례
- [[2026-08-19-cursor-origin-code-hosting]] — Cursor가 코드 호스팅을 자체 인프라로 가져온 이유("에이전트가 붙을 표면이 필요해서")와 대비되는, 여전히 남아 있는 모델 종속
- [[2026-08-27-cursor-continuity-git-at-scale]] — 같은 Cursor 자체 인프라 시리즈, 저장 계층은 독립했지만 모델은 독립하지 못한 비대칭

## 한 달 뒤 회고 (2026-09-29 즈음)
- 11월 12일 차단 전까지 Cursor가 실제로 어떤 모델(자체 모델·Claude·Gemini·GLM 등)로 대체 이행을 완료하는지, 그 이행 과정에서 [[2026-07-14-migrating-production-agent-provider-assumptions]]가 예견한 "숨은 가정" 문제가 재현되는지 확인.
- SpaceX/Cursor 측의 공식 반박이나 소송 여부가 나왔는지, Musk-Altman 갈등이 이 사건 이후 어떻게 전개됐는지 추적.
- `openai.com` 원문 접근이 풀리면 발표문 전체를 대조해 이 노트의 인용문·날짜를 확정 사실로 교체.
