---
title: "Build vs Buy, 건축 비용이 저렴해진 시대 (Kevin Goldsmith) — AI가 초기 개발비는 없앴지만, 3~5년 뒤 유지보수·보안·장애 책임까지 없애주지는 않는다"
source_title: "Build vs Buy When Building Just Got Cheap"
source_url: "https://kevingoldsmith.substack.com/p/build-vs-buy-when-building-just-got"
source_name: "Kevin Goldsmith's Substack"
referrer_url: "https://news.hada.io/topic?id=33346"
published_at: "2026-09 (정확한 게시일 미확인 — Slack 게시 시각으로 대체)"
summarized_at: "2026-09-08"
category: "engineering"
tags: ["build-vs-buy", "tco", "maintenance", "auth", "mcp", "engineering-management"]
---

# Build vs Buy, 건축 비용이 저렴해진 시대 (Kevin Goldsmith)

> 출처: [Build vs Buy When Building Just Got Cheap](https://kevingoldsmith.substack.com/p/build-vs-buy-when-building-just-got) (Kevin Goldsmith) · GeekNews(id=33346) 경유 · 정리일 2026-09-08
> **출처 한계(큼)**: `kevingoldsmith.substack.com`과 `news.hada.io` 모두 이번 세션 egress 정책으로 접근이 차단돼 원문·GeekNews 토픽 페이지를 직접 열람하지 못했다. 이 노트는 Slack 발췌 4줄과 WebSearch로 확보한 2차 인용(검색 스니펫, 저자 본인 예시가 상당히 구체적으로 인용되어 있어 신뢰도는 비교적 높다고 판단)을 종합해 재구성했다.

## 한 줄 요약
**AI는 소프트웨어를 처음 만드는 비용을 크게 낮췄지만, 그 뒤로 수년간 이어지는 유지보수·보안·안정성·컴플라이언스·지원 비용까지 없애주지는 못한다.** 저자는 "만들지 말지"를 가격이 아니라 ① 실패·유출 시 피해 범위(blast radius), ② 새벽 2시에 그 문제에 답할 담당자를 이름으로 지목할 수 있는가(오너십), ③ 사업 차별화에 실제로 기여하는가, ④ 나중에 더 나은 제3자 옵션이 나오면 고통 없이 갈아탈 수 있는가(교체 경로)라는 네 가지 기준으로 판단하라고 제안한다.

## 핵심 포인트
- **핵심 논지** — ***"만드는 비용이 싸졌다고 해서 만든 게 저렴했다는 뜻은 아니다"*** — 유지보수, 보안, 안정성, 컴플라이언스, 지원, 신뢰, 기회비용이 실제 비용의 승패를 가른다.
- **판단 기준 1: 피해 범위(blast radius)** — 무언가 고장 나거나 침해되거나 방치되면 무엇이 멈추는가. 사내 대시보드가 죽는 건 불편함이지만, ***인증(auth)이 죽거나 뚫리면 회사가 끝날 수 있다.***
- **판단 기준 2: 오너십 비용** — 앞으로 몇 년간 누가 그것을 모니터링하고 패치하고 지키고 새벽 2시에 답할지 ***팀이 아니라 사람 이름으로 지목***할 수 있어야 한다.
- **판단 기준 3: 차별화** — 이걸 직접 만드는 게 사업에 중요한 영향을 주는가, 아니면 단지 내 취향에 더 잘 맞을 뿐인가. "잘 맞음"도 지금은 유효한 논거지만, 그 이득이 유의미할 때만이다.
- **판단 기준 4: 교체 경로** — 1년 뒤 더 나은 제3자 옵션이 나오면 고통 없이 버릴 수 있는가. "다리로서 일단 만든다"는 전략은 그 자체로 정당하다.
- **실제 사례 대비** — 오픈소스 위에 자체 구축한 인증(auth)은 라이선스 절감액이 이후 몇 년간 라이브러리 취약점 대응, 고객사별 요구사항 개별 구현(벤더였다면 기본 제공), 엔터프라이즈 구매 담당자에게 "자체 개발 인증이 안전하다"고 설득하는 데 드는 시간으로 고스란히 되돌아왔다. 반면 자체 구축한 내부 MCP 서버는 당시 대체재가 없어 만든 것이었고, 공식 제품이 나오자 곧바로 교체해 필요한 기간만 운영하고 끝냈다 — ***같은 회사의 두 "자체 구축" 결정 중 하나만 정당했다.***
- 비용은 초기 개발비가 아니라 ***3~5년 총소유비용(TCO)***으로 비교해야 한다는 게 결론.

## 인상 깊은 문장
원문 열람 불가로 직접 인용 대신 WebSearch로 확인된 재구성 인용을 남긴다: "Blast radius — if it fails, gets compromised, or quietly goes unmaintained, what stops working? / Ownership cost — who monitors it, patches it, secures it, and answers for it at two in the morning for the next several years? Name the person, not the team."

## 댓글
`news.hada.io` 접근이 막혀 hada 댓글 수·논조·HN/Lobsters 큐레이션 여부를 확인하지 못했다. Substack 자체 댓글 수도 확인하지 못했다.

## 내 생각 · 적용점
1. [[2026-09-04-own-your-intelligence-sovereign-ai-guide]]와 정확히 같은 질문을 다른 계층에서 던진다 — 그 글이 "모든 워크로드를 소유할 필요는 없고, 비용·속도·독점 데이터·통제권 때문에 외부 모델이 제약받는 영역부터 소유와 임대를 구분하라"고 한 것을, 이 글은 "블라스트 레이디어스·오너십·차별화·교체 경로"라는 더 구체적인 4축 체크리스트로 세분화했다. 두 글을 나란히 두면 "AI 시대 build vs buy"는 인프라(지능 계층)든 애플리케이션(auth·내부 도구)이든 같은 질문 구조를 공유한다는 게 드러난다.
2. [[2026-09-02-trueforge-open-source-agent-harness]]가 소개한 "카탈로그에 한 번 등록해 여러 에이전트가 재사용" 같은 벤더 주장(자체 구축 대비 30~75% 비용 절감)도, 이 글의 기준으로 다시 보면 "초기 비용"만 비교한 숫자일 가능성이 크다 — TrueForge 노트에서 이미 "제3자 검증 미확인"이라 지적했는데, 이 글은 그 의심에 "오너십 비용을 빼고 비교하면 항상 build가 불리해 보이거나 buy가 유리해 보인다"는 구조적 이유를 얹어준다.
3. 저자가 든 "자체 구축한 내부 MCP 서버를 공식 제품이 나오자 교체"한 사례는, 최근 가든에 쌓인 여러 자체 개발 에이전트 하네스/MCP 서버 글([[2026-09-02-trueforge-open-source-agent-harness]] 등)이 몇 년 안에 같은 운명(공식 벤더 제품 등장 → 교체)을 맞을 수 있다는 시사점을 준다 — "다리로서 일단 만든다"는 전략이 정당화되려면 처음부터 교체 경로를 설계에 넣어둬야 한다는 뜻이다.

## 호스피탈리티 / CRS 적용 포인트
이 글의 네 가지 기준은 CRS/PMS 개발 의사결정에 거의 그대로 옮겨 쓸 수 있다. ① **피해 범위** — 채널 연동·요금 동기화처럼 실패 시 예약 데이터 정합성이 깨지는 영역은 자체 구축이든 벤더든 blast radius가 크므로 더 보수적으로 판단해야 한다. ② **오너십** — CRS 내부 인증·결제 연동을 자체 구축했다면 "누가 이 코드를 2년 뒤에도 유지보수하는가"를 사람 이름으로 답할 수 있어야 한다는 원칙은 실제로 온다 내부 시스템 설계 리뷰에 바로 쓸 수 있는 질문이다. ③ **차별화** — 채널 연동·요금 엔진처럼 온다의 실제 경쟁력에 닿는 부분은 자체 구축을 정당화할 여지가 크지만, 범용 인증·알림 같은 커머디티 영역은 벤더를 쓰는 게 이 글의 결론과 일치한다.

## 연관 자료
- [[2026-09-04-own-your-intelligence-sovereign-ai-guide]] — "모든 걸 소유할 필요는 없다"는 같은 결론을 지능 계층(모델) 관점에서 먼저 다룬 글, 이 글은 그 판단 기준을 애플리케이션 계층에서 구체화
- [[2026-09-02-trueforge-open-source-agent-harness]] — 벤더의 "자체 구축보다 저렴하다"는 비용 절감 주장을, 이 글의 TCO 프레임으로 다시 검증해볼 만한 사례

## 한 달 뒤 회고
*(2026-10-08 즈음 — `kevingoldsmith.substack.com` 접근이 풀렸다면 원문을 직접 읽어 인용문·auth/MCP 서버 사례의 구체적 수치를 1차 소스로 재검증. 온다 내부에 있는 자체 구축 시스템 중 이 4축 체크리스트로 다시 평가해볼 후보가 있는지 점검.)*
