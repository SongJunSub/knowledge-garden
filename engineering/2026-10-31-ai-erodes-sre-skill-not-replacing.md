---
title: "AI는 SRE를 대체하는 게 아니라 숙련도를 떨어뜨리고 있다(SigNoz) — 흔한 장애가 사라지면, 그 흔한 장애로 쌓던 직관도 함께 사라진다"
source_title: "AI Isn't Replacing SREs. It's Deskilling Them."
source_url: "https://signoz.io/blog/ai-isnt-replacing-sres-its-deskilling-them"
source_name: "SigNoz"
referrer_url: "https://news.hada.io/topic?id=36299"
published_at: "2026-10"
summarized_at: "2026-10-31"
category: "engineering"
tags: ["sre", "ai-sre", "deskilling", "incident-response", "automation-irony"]
---

# AI는 SRE를 대체하는 게 아니라 숙련도를 떨어뜨리고 있다(SigNoz)

> 출처: [AI Isn't Replacing SREs. It's Deskilling Them.](https://signoz.io/blog/ai-isnt-replacing-sres-its-deskilling-them) (SigNoz) · [GeekNews](https://news.hada.io/topic?id=36299) 경유 · 정리일 2026-10-31

> **출처 한계**: news.hada.io는 egress 차단으로 원문 열람 불가. WebSearch로 SigNoz 블로그를 원 출처로 특정했고, 같은 주제를 다룬 DZone·byteiota·zeli.app·devops.com 등 복수 매체의 스니펫을 교차 확인했다. SigNoz는 옵저버빌리티 플랫폼을 파는 회사라, AI 자동화 범위를 신중히 다뤄야 한다는 주장에 자사 제품(사람이 직접 들여다보는 도구)을 더 쓰라는 이해관계가 섞여 있을 수 있다.

## 한 줄 요약

**AI가 흔한 장애의 95%를 처리할수록, 엔지니어가 그 흔한 장애를 통해 길러오던 시스템 직관과 디버깅 반사가 약해져, 정작 AI가 못 푸는 나머지 5%의 큰 장애 앞에서 더 무력해진다는 "탈숙련화(deskilling)" 주장. 신입 엔지니어는 그 반사를 아예 배울 기회조차 갖지 못하는 "never-skilling" 위험까지 추가로 안고 있다.**

## 핵심 포인트

- **대체가 아니라 탈숙련화라는 프레이밍** — "AI가 SRE를 대체하는가"라는 질문 자체가 틀렸다는 주장. ***AI가 95%의 장애를 처리하게 되면, 정작 중요한 5%에 대응하는 능력이 떨어지지는 않는가***가 진짜 질문이다.
- **자동화 대시보드가 멘탈 모델을 대신하기 시작한다** — 엔지니어가 시스템이 어떻게 동작하고 실패하는지 스스로 쌓아온 멘탈 모델 대신 자동화된 대시보드에 기대는 순환이 생기고, 그 결과 디버깅 근육이 서서히 위축된다.
- **신입에게는 "탈숙련화"가 아니라 "최초학습 불능(never-skilling)"이다** — 첫 출근일부터 AI가 온콜 장애를 처리해주면, 신입 엔지니어는 기초 진단 역량을 **잃는 게 아니라 처음부터 얻지 못한다.** 한 매체는 Anthropic이 수행했다는 실험(AI 도움을 받은 신입이 이해도 시험에서 더 낮은 점수를 받았다는)을 인용했지만, 이 실험은 WebSearch로 원문을 재확인하지 못해 미확인으로 남긴다.
- **반론도 있다** — 좋은 AI 코파일럿을 쓰는 신입이 과거 수년의 시스템 경험이 필요했던 수준으로 수행할 수 있다는 낙관적 시각, 그리고 기업이 신입에게 장애를 처음부터 끝까지 직접 조사해볼 별도 기회를 의도적으로 만들어야 한다는 중간 입장도 함께 보도됐다.
- **드문 장애에 대응하는 직관은 흔한 장애를 반복하며 쌓인다** — 이 인과관계가 끊기면, 평균 복구 시간(MTTR) 같은 표면 지표는 좋아 보여도 그 아래에서 실제 대응 역량은 조용히 침식된다.

## 인상 깊은 문장

> "When AI handles 95% of your incident response, do you get worse at handling the 5% that actually matters?" — [SigNoz](https://signoz.io/blog/ai-isnt-replacing-sres-its-deskilling-them)

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. 이 주제는 영어권 개발자 매체(DZone, devops.com, byteiota) 여러 곳에서 독립적으로 다뤄져 논의 자체는 폭넓게 확인됐지만, **핵심 증거로 인용되는 "Anthropic 신입 실험"은 WebSearch로도 원문을 찾지 못해 미확인 상태**임을 정직하게 밝힌다. 탈숙련화 주장 전반이 "증거보다 논증(anecdotal and argumentative)"에 가깝다는 평가도 함께 나왔다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-09-06-ai-sre-skill-atrophy]]와 같은 주제의 두 번째 글, 이번엔 "신입"이라는 새 축이 추가됐다.** 9월에 정리한 Sylvain Kalache 글이 "흔한 장애를 AI가 처리하면 기존 엔지니어의 숙련도가 침식된다"는 탈숙련화(skill atrophy)를 다뤘다면, 이 글은 거기서 한 걸음 더 나가 **신입은 침식될 숙련도 자체가 아예 형성되지 않는다("never-skilling")**는 더 심각한 버전을 제기한다. 두 글을 겹치면 "경력 엔지니어는 기존 감각이 녹슬고, 신입은 그 감각을 처음부터 배우지 못한다"는 조직 전체의 이중 리스크가 드러난다.

**핵심 전이 2 — [[2026-06-01-ai-in-sre-google-reliable-operations]]의 "운영자→설계자" 전환론에 대한 반론이 다시 한 번 쌓인다.** 9월 노트에서 이미 이 긴장을 다뤘지만, 이번 글의 "never-skilling" 개념은 그 반론을 더 날카롭게 만든다 — 설계자로 전환하려면 먼저 운영자로서의 실전 경험이 있어야 하는데, AI가 그 경험 자체를 빼앗으면 설계자 단계로 올라갈 기반이 없어진다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음, [[2026-09-06-ai-sre-skill-atrophy]]에서 세운 원칙을 신입 온보딩 쪾으로 구체화.** 온다의 CRS 온콜에 AI 기반 장애 대응을 도입할 때, **신입 온콜 엔지니어에게는 AI가 먼저 처리하기 전에 일정 비율의 흔한 장애(채널 연동 실패, 예약 동기화 지연 등)를 직접 진단해보게 하는 "의도적 실전 기간"을 온보딩 설계에 명시적으로 넣어야 한다.** AI 보조 없이 로그를 읽고 가설을 세우는 경험을 최소 한 번씩은 거치게 하는 것이, 나중에 AI가 못 푸는 복잡한 장애 앞에 설 때의 보험이 된다.

## 연관 자료

- [[2026-09-06-ai-sre-skill-atrophy]] — 같은 주제의 선행 노트, "기존 엔지니어의 숙련도 침식"을 다룸(이 글의 "신입은 처음부터 못 배운다"와 짝을 이룸)
- [[2026-06-01-ai-in-sre-google-reliable-operations]] — "운영자→설계자" 전환이라는 낙관적 프레임과의 반복되는 대비

## 한 달 뒤 회고

*(2026-11-30 즈음 — 인용된 Anthropic 신입 실험의 원문을 찾았는지, 온다 CRS 온콜 신입 온보딩에 "AI 없이 먼저 해보기" 기간을 실제로 넣었는지 점검.)*
