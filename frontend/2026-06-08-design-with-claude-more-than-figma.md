---
title: "이제 Figma보다 Claude로 더 많이 디자인한다 — 동작하는 프로토타입 vs '왜?'의 상실 (경계 자산)"
source_title: "I design with Claude Code more than Figma now"
source_url: "https://blog.janestreet.com/i-design-with-claude-code-more-than-figma-now-index/"
source_name: "Jane Street 블로그 · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30285"
summarized_at: "2026-06-08"
category: "frontend"
tags: ["design-workflow", "claude-code", "prototyping", "figma", "vibe-coding", "judgment", "conflict-of-interest", "boundary-asset"]
---

# 이제 Figma보다 Claude로 더 많이 디자인한다 — 동작하는 프로토타입 vs '왜?'의 상실 (경계 자산)

> 출처: [I design with Claude Code more than Figma now](https://blog.janestreet.com/i-design-with-claude-code-more-than-figma-now-index/) (Jane Street, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Jane Street 디자이너가 *사양 문서·Figma 목업* 대신 *Claude로 직접 동작하는 프로토타입*을 만드는 워크플로로 전환했다 — *LLM 회의론에서 Claude 도입으로*, *무제한 반복 수정(50번 변경도 용이)*, *실제 코드베이스 내 프로토타입이 목업·문서보다 효과적*, *디자이너가 엔지니어처럼 "동작하는 개념 증명"을 직접 제작*. 프로토타입은 *"살아있는 제안 문서"*가 된다. 그러나 우려도 명시: *Claude 의존이 창의적 사고를 제한*하고, *비즈니스팀이 미완성 결과물의 배포를 압박*할 수 있다. 댓글의 핵심 비판: ***"이미 완성된 해결책을 받으면 리뷰어가 '왜 이게 필요한가'를 질문하지 못한다"***, *바이브 코딩의 경계 사례·설계 미검토 위험*, ***"올바른 것이 만들어지는가가 더 중요"***, 그리고 *Jane Street가 Anthropic 투자자라는 이해관계*.**

## 핵심 포인트

- **동작하는 프로토타입 > 목업·문서** — *실제 코드베이스 내 PoC*가 *살아있는 제안 문서*. **[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *코드 가격 붕괴*(50번 반복) + [[2026-06-01-harness-for-every-task-dynamic-workflows]] *Claude Code 도구화*의 디자인판** — *디자이너도 빌더가 된다*([[2026-06-08-artisans-and-builders]] 빌더+장인의 경계 흐림).
- **"완성된 해결책 → '왜?'의 상실" (핵심 비판)** — *결과가 이미 그럴듯하면 리뷰어가 전제를 못 묻는다*. **[[2026-06-01-ask-hn-why-anti-ai]] *contributor poker(가치는 반복·질문 과정에)* + [[2026-06-01-ask-hn-genai-oh-shit-moments]] *"무엇을 해야 하는지 아는 능력이 나빠졌다"*의 디자인판** — *형식(완성된 목업)이 의도(왜)를 가린다*([[2026-05-29-you-can-just-say-it-human-value]]).
- **"올바른 것이 만들어지는가 > 빨리 만들어지는가"** — 댓글의 정곡. **[[2026-06-08-taste-is-the-new-10x]] *taste·"잘못된 것을 아름답게 만드는 위험"* + [[2026-06-01-my-software-north-star]] *효용이 목적*의 디자인판** — *빠른 프로토타입은 수단, 올바름(판단)이 목적*.
- **바이브 코딩 위험 + 배포 압박** — *경계 사례·설계 미검토·데이터 손실·보안*, *미완성을 "되니까" 배포*. **[[2026-06-08-users-dont-care-but-you-should]] *안 보이는 품질이 결과를 만든다*·[[2026-06-08-llms-eroding-my-career]] *코드 품질 하한선 하락*의 경고**.
- **이해관계 정직성 — Anthropic 투자자** — *Jane Street가 Anthropic 투자자*. **[[2026-06-01-recursive-self-improvement-anthropic]](IPO 과장 동기)와 같은 *공급자 인접 글의 객관성 점검*** — 도입 성공담은 *이해관계와 함께* 읽는다.

## 인상 깊은 문장

> *(요지)* Claude로는 *무제한으로 반복*할 수 있어, 50번을 바꿔도 세부까지 개선된다 — 동작하는 프로토타입이 *살아있는 제안 문서*가 된다.

> *(댓글)* *이미 완성된 해결책*을 받으면, 리뷰어는 *"왜 이게 필요한가"*를 더 이상 질문하지 못한다.

> *(댓글)* 더 중요한 질문은 "빨리 만들어지는가"가 아니라 ***"올바른 것이 만들어지는가"***이다.

## 내 생각 · 적용점

### *경계 자산* — 디자인 워크플로에 도착한 "빠름 vs 올바름" 긴장

낙관(Jane Street: 동작 프로토타입·50 반복)과 비판(창의성 제한·바이브 코딩·'왜?'의 상실·이해관계)이 한 글에서 충돌하는 **경계 자산**. 선례([[2026-06-01-recursive-self-improvement-anthropic]]·[[2026-06-01-ask-hn-why-anti-ai]])대로 *친·반 균형 카운팅 보류*, 부채 *0 유지*. [[2026-06-01-what-matters-when-anyone-can-build]](Figma 자신의 "누구나 만든다")의 *바로 다음 장* — 누구나 동작하는 걸 만들면, 차별점은 *"무엇을·왜"의 판단*.

### *형식이 의도를 가리는 위험 = contributor poker의 디자인 버전*

핵심 통찰: **동작하는 완성품은 *그럴듯함*으로 *전제 질문을 봉쇄*한다.** [[2026-06-01-ask-hn-why-anti-ai]]의 *contributor poker*(가치는 첫 산출이 아니라 반복·질문 과정에)가 디자인에도 — *50번 반복은 강력하지만, "이걸 왜 만드는가"의 인간 판단([[2026-06-08-taste-is-the-new-10x]] taste·[[2026-06-01-get-to-the-heart-of-the-matter]] 프레이밍)을 건너뛰면, 빠르게 잘못된 것에 도달한다*. 처방: *Claude로 탐색하되, "무엇을·왜"는 의식적으로 인간이 결정*하고, *프로토타입을 "답"이 아니라 "질문을 여는 제안"으로* 다룬다.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [I design with Claude Code more than Figma now](https://blog.janestreet.com/i-design-with-claude-code-more-than-figma-now-index/) (원문)
- [GeekNews — 30285](https://news.hada.io/topic?id=30285)
- [[2026-06-01-what-matters-when-anyone-can-build]] — Figma "누구나 만든다" *(바로 다음 장)*
- [[2026-06-08-taste-is-the-new-10x]]·[[2026-06-01-my-software-north-star]]·[[2026-06-01-get-to-the-heart-of-the-matter]] — 올바름·효용·왜 *(판단)*
- [[2026-06-01-ask-hn-why-anti-ai]]·[[2026-06-01-ask-hn-genai-oh-shit-moments]] — '왜?'의 상실·판단 침식
- [[2026-06-08-artisans-and-builders]]·[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] — 빌더 경계·코드 가격 붕괴
- [[2026-06-08-users-dont-care-but-you-should]]·[[2026-06-08-llms-eroding-my-career]] — 품질·바이브 코딩 위험
- [[2026-06-01-recursive-self-improvement-anthropic]]·[[2026-05-29-you-can-just-say-it-human-value]] — 이해관계 점검·형식 vs 의도

## 한 달 뒤 회고
*(2026-07-08 즈음 — Claude 프로토타입을 "답"이 아니라 "질문을 여는 제안"으로 다뤘는지, "무엇을·왜"의 판단을 인간이 지켰는지, 동작하는 프로토타입의 그럴듯함이 전제 질문을 봉쇄하지 않았는지 기록.)*
