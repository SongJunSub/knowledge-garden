---
title: "우리가 알던 기능 발견 방식의 종말 (GeekNews, Lenny's Newsletter 추정) — AI는 기능을 더 잘 찾게 돕는 게 아니라 찾을 필요 자체를 없앤다"
source_title: "The end of feature discovery as we know it"
source_url: "https://news.hada.io/topic?id=37870"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37870"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "ai"
tags: ["feature-discovery", "agentic-ux", "product-led-growth", "mcp", "api"]
---

# 우리가 알던 기능 발견 방식의 종말 (GeekNews, Lenny's Newsletter 추정)

> 출처: [The end of feature discovery as we know it](https://news.hada.io/topic?id=37870) · 정리일 2026-11-26

> **출처 한계**: 원문(news.hada.io)이 egress 차단으로 막혔으나, WebSearch로 ***Lenny's Newsletter의 동일 제목 글을 찾아 핵심 논지는 확인***됐다. 다만 전체 본문을 읽지는 못해 결론부·반론에 대한 저자의 최종 입장은 발췌 수준으로만 확인했다. "제품이 사용자를 넓히려면 단순해져야 하는데 기능을 늘리면 복잡해진다"는 모순에 대한 저자의 구체적 해법은 원문 확인이 더 필요하다.

## 한 줄 요약

**AI는 사용자가 새 기능을 더 잘 찾도록 돕는 게 아니라, 사용자가 기능을 직접 찾을 필요 자체를 줄인다 — 에이전트가 API와 MCP로 다른 제품의 기능을 호출하면 사용자는 그 앱을 열지 않아도 되기 때문에, 전통적인 "기능 발견(feature discovery)" UX 설계의 전제 자체가 무너진다는 주장이다.**

## 핵심 포인트

- **AI는 발견을 돕는 게 아니라 발견 자체를 없앤다 (WebSearch 확인)** — 원문의 핵심 주장은 "AI could make feature discovery largely unnecessary rather than just improving it"이다 — AI가 사용자 대신 필요한 기능을 바로 실행하기 때문에, 애초에 "사용자에게 기능을 가르칠" 필요가 줄어든다는 것.
- **버튼을 프롬프트 창으로 바꾸는 게 핵심이 아니다** — 변화의 핵심은 UI 요소를 프롬프트로 바꾸는 게 아니라, ***소프트웨어를 조작하는 주체가 사람에서 AI로 옮겨간다***는 데 있다는 서술. 에이전트가 API·MCP로 다른 제품의 기능을 호출하면 사용자는 해당 앱을 열지 않아도 된다.
- **기존 제품의 모순** — 기존 제품은 가치를 늘리려면 기능을 추가해야 하지만, 사용자를 넓히려면 더 단순해져야 하는 모순을 안고 있었다는 진단.
- **반론도 존재(WebSearch 확인)** — Jeff Gothelf는 반대로 "AI가 발견을 덜 필요하게 만드는 게 아니라 오히려 더 필수적으로 만든다"고 주장한다 — AI 도구로 더 많은 아이디어를 더 빠르게 테스트할 수 있기 때문이라는 논리. 두 주장이 정면으로 충돌하므로 이 레포는 어느 한쪽을 "정답"으로 단정하지 않는다.
- **조직 거버넌스 공백** — 제품 정보를 AI가 평가할 수 있도록 구조화하는 책임을 누가 지는지, 대부분 조직이 아직 결정권을 배정하지 않았다는 관찰도 함께 확인됨.

## 인상 깊은 문장

> "AI can just invoke that functionality at the moment it's relevant, which makes teaching humans to find features less worthwhile." (Lenny's Newsletter, WebSearch 확인 발췌)

## 댓글

GeekNews 댓글 수 미확인(원문 차단). Lenny's Newsletter는 제품 관리 업계에서 영향력 있는 1차 소스로, 반론(Jeff Gothelf 등)도 활발히 나오는 논쟁적 주제로 보인다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 배치의 삼성 TV 팜 글과 정면으로 연결

[[2026-11-26-samsung-tv-farm-ai-agent-interface-principles]]가 "사람용 API를 에이전트에 그대로 열면 안 된다"는 원칙을 다뤘다면, 이 글은 그 전제가 되는 더 큰 그림이다 — ***에이전트가 기능을 직접 호출하는 세상에서는, 애초에 "기능 발견 UX"를 사람에게 설계하는 일 자체의 중요도가 낮아진다.*** [[2026-11-25-llm-agents-serve-vendor-not-user]]의 "에이전트가 API로 기능을 대신 실행한다"는 관찰과도 같은 축이다.

### 적용점

제품 설계 조직이 "신규 기능을 사용자에게 어떻게 알릴까"에 쓰던 투자를, "에이전트가 이 기능을 언제·어떻게 호출해야 하는지"를 설명하는 메타데이터·스키마 설계로 옮겨야 할 수 있다는 시사점.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS가 B2B 에이전트(호텔 측 AI 어시스턴트, 외부 OTA 에이전트)에 기능을 노출한다면, "사람 담당자가 메뉴를 탐색해 기능을 찾는" UX보다 "에이전트가 바로 호출할 수 있는 잘 정의된 도구·API"를 우선 설계해야 한다는 원칙이 직접 적용된다. [[2026-11-26-samsung-tv-farm-ai-agent-interface-principles]]와 결합하면 "에이전트 우선 인터페이스 설계"라는 완결된 원칙이 된다.

## 연관 자료

- [[2026-11-26-samsung-tv-farm-ai-agent-interface-principles]] — 같은 배치, 에이전트용 인터페이스 설계 원칙
- [[2026-11-25-llm-agents-serve-vendor-not-user]] — 에이전트가 API로 기능을 대신 실행한다는 선행 관찰

## 한 달 뒤 회고

2026-12-26 즈음 — Jeff Gothelf의 반론과 원 저자의 논쟁이 더 진전됐는지, 조직 거버넌스(누가 AI용 제품 메타데이터를 설계하는가) 문제에 대한 실제 해법이 나왔는지 확인.
