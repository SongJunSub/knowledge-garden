---
title: "계획 모드는 죽었다 (Ayman Nadeem) — 계획은 행위이고 계획서는 산출물이다, 행위는 필수지만 산출물은 점점 그렇지 않다"
source_title: "Plan mode is dead"
source_url: "https://www.aymannadeem.com/artificial/intelligence,/developer/tools/2026/09/24/plan-mode-is-dead.html"
source_name: "Ayman Nadeem 개인 블로그"
referrer_url: "https://news.hada.io/topic?id=34304"
published_at: "2026-09-24"
summarized_at: "2026-09-27"
category: "engineering"
tags: ["plan-mode", "agentic-coding", "spec-driven-development", "claude-code", "product-postmortem"]
---

# 계획 모드는 죽었다 (Ayman Nadeem) — 계획은 행위이고 계획서는 산출물이다, 행위는 필수지만 산출물은 점점 그렇지 않다

> 출처: [Plan mode is dead](https://www.aymannadeem.com/artificial/intelligence,/developer/tools/2026/09/24/plan-mode-is-dead.html) (Ayman Nadeem) · GeekNews(id=34304) 경유 · 정리일 2026-09-27
>
> **출처 한계**: 원문 도메인과 `news.ycombinator.com`, `news.hada.io` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. Hacker News 요약, ai-tldr.dev, byteiota 등 복수 2차 소스가 인용한 원문 발췌를 종합 재구성했으며, 핵심 인용문 2개는 여러 소스에서 일관되게 재현돼 신뢰도가 높다고 판단했으나 원문 전체를 직접 읽지는 못했다.

## 한 줄 요약

**모델이 저장소를 탐색하고 합리적인 가정을 세우는 능력이 좋아지면서, 구현 전에 사람이 상세히 지시하는 "계획 모드"의 필요성이 줄고 있다 — 저자 본인이 계획 문서 중심 도구(Nuanced)를 만들어 실패한 경험에서, "계획은 행위이지 문서라는 산출물이 아니다"라는 결론에 이른다.**

## 핵심 포인트

- **저자와 Nuanced의 전제** — Nadeem은 GitHub에서 7년간 정적 분석 엔지니어로 일한 뒤, "계획이 AI로 소프트웨어를 만드는 데 가장 중요한 부분이 될 것"이라 믿고 데스크톱 코딩 앱 Nuanced를 계획 중심으로 설계했다. 목표·제약·불변식·범위 경계를 담는 "living spec"(지속 편집되는 명세)이 핵심 기능이었다.
- **왜 실패했나** — 생성된 스펙은 조밀하지만 읽기 어려웠고, 스펙을 둘러보게 해주는 "Spec Tour" 기능은 복잡성만 더했다. 결정적으로 ***사용자들은 스펙을 산출물로 보존하는 데 관심이 없었다*** — 검토·승인 후에는 버려지는 중간 단계로 취급했다.
- **계획 모드의 두 목적 중 하나만 남는다** — 계획 모드는 원래 (1) 에이전트에게 충분히 정밀한 지시를 주는 것, (2) 사람이 무엇을 만드는지 이해하게 돕는 것, 두 목적을 가졌다. 모델이 좋아지며 (1)은 빠르게 무의미해지고 있다 — "무엇을 의도했는가"와 "무엇을 적었는가" 사이 간극이 붕괴됐기 때문. (2)는 여전히 중요하지만 계획 모드(=문서)는 그 목적에 맞는 도구가 아니다.
- **"계획 문서 ≠ 이해의 증거"** — ***"Planning is the activity; a plan is the artifact. The activity is essential. The artifact increasingly isn't."*** 진짜 사고는 채팅 → 스펙 → 리뷰 → 승인 → 구현이라는 선형 절차를 따르지 않으며, 이해는 각 단계가 새 질문을 드러내며 반복적으로 나타난다.
- **대안 루프** — 실무에서 작동하는 방식은 ***understand → act → inspect → clarify → adjust → act again***의 반복이다. 계획은 이 루프의 매 단계 안에 내재될 뿐, 별도 문서가 아니다. 병렬로 여러 에이전트를 돌리는 시대일수록 선형 계획-승인 절차는 더 안 맞는다.

## 인상 깊은 문장

> "Planning is the activity; a plan is the artifact. The activity is essential. The artifact increasingly isn't."

> "understand → act → inspect → clarify → adjust → act again"

## 댓글

**대형 화제작이나 원문 접근은 제한적.** Hacker News에서 약 483점·432댓글(하루 만에 도달)로 상당한 반향을 얻었다는 것을 WebSearch로 확인했으나, 도메인 차단으로 개별 댓글 내용까지는 확인하지 못했다. Instil 블로그가 "Spec-driven development is dead. Long live plan mode"라는 반박성 글을 낸 것도 확인되어, 스펙 주도 개발 옹호 진영과의 논쟁이 진영화되어 있다. hada 댓글 수는 원천 차단으로 확인 못 했다. 이 글은 한 스타트업(Nuanced)의 실패 회고이자 저자 개인의 도구 설계 경험담이다 — "계획 모드는 죽었다"는 강한 제목과 달리 실제로는 "계획 문서라는 특정 UI 패턴"에 대한 비판이지 계획 자체의 무용론은 아니라는 점에 유의해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — OpenSpec과의 정면 반증 관계

[[2026-09-18-openspec-spec-driven-development-for-agents]]가 다룬 OpenSpec은 "사람이 코드 대신 계획을 검토하게" 만드는 propose·apply·archive 3단계 스펙 관리 도구다. Nuanced의 living spec과 철학이 거의 동일한데, 이 글은 "계획 문서 승인 절차가 작동한다"는 그 전제 자체를 실패 경험으로 반박한다 — 같은 접근을 만든 두 팀이 정반대 결론에 도달한 셈이라, 나란히 읽으면 스펙 주도 개발 논쟁의 양쪽을 다 볼 수 있다.

### 핵심 전이 2 — "선형 계획보다 반복 루프가 이긴다"는 이 가든의 반복 관찰

[[2026-06-08-the-coming-loop]](Armin Ronacher)의 "하네스 레벨 루프가 새로운 패턴"이라는 주장과 [[2026-06-29-tokenmaxxing-agentic-loops]]의 "누적 오류에서 누적 정확성으로 에이전트 루프가 경제성을 역전시킨다"는 논지 모두, 이 글의 understand→act→inspect 반복 루프와 같은 방향을 가리킨다 — 문서화된 계획보다 루프 자체가 패턴이 된다는 큰 그림이 세 글에서 독립적으로 반복된다.

### 핵심 전이 3 — "아무도 안 읽는 설계 문서"라는 오래된 문제의 재등장

[[2026-09-15-effective-software-design-document]](Michael Lynch)가 지적한 "설계 문서의 진짜 어려운 문제는 아무도 안 읽는다는 것"은, "계획 문서를 남겨도 이해가 안 남는다"는 Nadeem의 논지와 같은 문제의식을 사람이 쓰는 설계 문서 맥락에서 이미 짚었던 것이다. AI 시대 이전부터 있던 문제가 에이전트 계획 문서에서 그대로 재현되고 있다.

## 호스피탈리티 / CRS 적용 포인트

온다는 Claude Code를 실제 개발 워크플로우에 쓰고 있으므로 이 글은 추상적 원칙이 아니라 작업 방식 자체에 대한 제안으로 읽을 수 있다. CRS 개발에서 "구현 전에 방대한 계획 문서를 작성 → 리뷰 → 승인" 절차를 고수하고 있다면, 그 절차가 실제로 이해를 높이는지(2번 목적) 아니면 그저 절차적 안전장치(1번 목적, 이미 약화 중)로만 기능하는지 구분해볼 가치가 있다. 후자라면 승인 게이트를 가볍게 하고 실행 후 점검으로 무게중심을 옮길 수 있다. Claude Code의 Plan mode를 CRS 기능 개발에 쓸 때도, 계획 문서 자체를 산출물로 축적하기보다 이해→실행→점검→조정→재실행의 반복 루프로 운용하는 편이 이 글의 결론과 일치한다 — 특히 여러 에이전트를 병렬로 돌리는 경우 선형 계획-승인 절차는 스케일이 안 맞는다는 저자 주장이 그대로 적용된다. 다만 신입 온보딩용 설계 문서나 이해관계자 승인이 규제·계약상 필수인 경우(외부 파트너 대상 스펙 공유 등)에는 이 글의 결론이 그대로 적용되지 않는다는 것, Nadeem 본인도 "이해를 돕는 목적"은 여전히 유효하다고 인정한다는 것을 함께 밝혀둔다.

## 연관 자료

- [[2026-09-18-openspec-spec-driven-development-for-agents]] — 계획 문서 승인 절차가 작동한다는 전제 위의 정반대 접근, 정면 반증 관계
- [[2026-06-08-the-coming-loop]] — 하네스 레벨 반복 루프가 새로운 패턴이라는 같은 방향의 관찰
- [[2026-06-29-tokenmaxxing-agentic-loops]] — 선형 계획보다 반복 루프의 경제성이 앞선다는 같은 큰 그림
- [[2026-09-15-effective-software-design-document]] — "아무도 안 읽는 설계 문서"라는 선행 문제의식

## 한 달 뒤 회고

*(2026-10-27 즈음 — Instil의 반박("Spec-driven development is dead. Long live plan mode")과의 논쟁이 어떻게 정리됐는지, CRS 개발에서 계획 문서 승인 게이트를 실제로 가볍게 해봤는지, "Atlas" 같은 커밋-세션 연결 도구가 이 논쟁에 새 답을 주는지 점검.)*
