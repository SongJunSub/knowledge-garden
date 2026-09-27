---
title: "이제 OS란 대체 무엇인가? (Thomas Ptacek) — AI가 허무는 건 앱 사이의 경계가 아니라 프로그래머와 사용자 사이의 경계다"
source_title: "What Even Is An OS Now?"
source_url: "https://sockpuppet.org/blog/2026/09/25/what-even-is-an-os-now/"
source_name: "A Final Ward (Thomas Ptacek, Erin Ptacek)"
referrer_url: "https://news.hada.io/topic?id=34309"
published_at: "2026-09-25"
summarized_at: "2026-09-27"
category: "engineering"
tags: ["os-design", "app-isolation", "ai-programming", "personal-software", "vibe-coding"]
---

# 이제 OS란 대체 무엇인가? (Thomas Ptacek) — AI가 허무는 건 앱 사이의 경계가 아니라 프로그래머와 사용자 사이의 경계다

> 출처: [What Even Is An OS Now?](https://sockpuppet.org/blog/2026/09/25/what-even-is-an-os-now/) (Thomas Ptacek, Erin Ptacek · A Final Ward) · GeekNews(id=34309) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `sockpuppet.org`, `news.hada.io`, `news.ycombinator.com` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. WebSearch가 반환한 구글 인덱스 스니펫들을 교차확인해 재구성했으며, 여러 검색 결과가 동일 인용문을 일관되게 재현하고 있어 핵심 사실관계 신뢰도는 높다고 판단하나 문단 전체 흐름·논증 순서까지는 검증하지 못했다. 필자 Ptacek은 최근 Fly.io를 퇴사하고 "AI 앱 전용 폰"을 만들겠다고 발표한 인물로, 이 글의 AI-낙관 논조를 읽을 때 감안할 이해관계다.

## 한 줄 요약

**현대 OS의 존재 이유는 "낯선 제작자가 만든 소프트웨어"를 격리하는 것이었는데, AI가 무너뜨리는 건 그 앱 사이의 경계가 아니라 프로그래머와 사용자 사이의 경계다 — 사용자가 자연어로 자신만의 프로그램을 직접 만드는 시대에는, 1~2명짜리 사용자 앱이 흔해지고 고정된 앱 격리 모델 자체가 의미를 잃는다.**

## 핵심 포인트

- **현대 OS의 존재 이유** — ***"The core purpose of a modern operating system is to partition different applications off from each other, and carefully control how they can communicate."*** 이건 소프트웨어가 "전문가 타인"에게서 왔다는 전제 위에 서 있다.
- **AI가 무너뜨리는 진짜 경계** — 프로그램-사용자 경계다. Ptacek 자신의 Mac 메뉴바·태스크 전환기가 ***"영어를 프로그래밍 언어 삼아 스스로 소환한 프로그램들"***로 채워져 있다는 자기 사례를 든다.
- **1~2명짜리 사용자 앱의 증가** — "시카고 어느 동네만을 위한 날씨 예보", "개인 맞춤 통근 경로"처럼, 애초에 시장이 존재하지 않아 전문가가 만들 이유가 없던 소프트웨어가 흔해진다.
- **소프트웨어 공급이 "완성 앱" → "구성요소" 중심으로 이동** — 브라우저·워드프로세서 같은 메가프로젝트는 남지만, 워드프로세서 기능의 일부만 가져다 쓰는 개인 앱이 훨씬 많아진다.
- **앱 격리 모델이 의미를 잃는 이유** — ***"It makes less sense in the world we're heading to, where most of the software we're carving up fiefdoms for has the same provenance. And it makes almost no sense in a world where every application is malleable, subject to growing new limbs at any moment on the whims of its creator."*** 같은 사람(제작자=사용자)이 만든 소프트웨어를 굳이 서로 격리할 이유가 없다는 것.

## 인상 깊은 문장

> "The core purpose of a modern operating system is to partition different applications off from each other, and carefully control how they can communicate."

> "AI is knocking down a much more important boundary: the one between programmers and users. My Mac menu bar and task switcher are cluttered with icons for programs I conjured for myself, with English as my programming language."

## 댓글

**논의 존재 확인, 상세 미확인.** Hacker News에 "What Even Is an OS Now?"(item id=49850305)로 등재되어 논의 중인 것은 확인했으나(검색 스니펫상 "2일 전 게시"), 정확한 포인트 수·댓글 수·상위 댓글 논조는 도메인 차단으로 확인하지 못했다. GeekNews hada 댓글 수도 미확인이다. 필자의 이해관계(최근 퇴사 후 AI 앱 전용 폰 창업 발표)를 감안하면 AI-낙관 논조에 일정한 편향이 있을 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 개인화 자동화의 매력과 복잡성 병목의 긴장

[[2026-07-20-what-happened-to-the-frontend]]가 짚은 "AI가 코드를 써도 8개 레이어(빌드·하이드레이션 등)를 암묵적으로 가정하므로 이해가 병목"이라는 관찰은, Ptacek의 "프로그래머-사용자 경계 붕괴" 낙관론이 실전에서 부딪힐 복잡성 쪽 반증/보완축이 된다.

### 핵심 전이 2 — "책임·평판 없는 시스템 의존"이라는 반대편 우려

[[2026-05-07-vibe-coding-agentic-engineering-converging]](Simon Willison)의 "책임·평판 없는 시스템에 의존이 깊어짐" 축은, Ptacek의 "누구나 자기 앱을 만든다"는 낙관론에 대해 "그 앱이 뭘 하는지 아무도 검토하지 않는다"는 반대편 우려로 짝짓기 좋다. [[2026-09-17-ps5-linux-theflow-quits-llm-vibe-coding]](신뢰 없는 LLM 모더 사례)는 앱 격리가 느슨해진 개인 소프트웨어 생태계에서 신뢰·책임 소재 문제가 실제로 터진 선례다.

### 핵심 전이 3 — "완성물이 전제를 가린다"는 반복되는 함정

[[2026-06-08-design-with-claude-more-than-figma]]의 "완성된 프로토타입이 나오면 '왜?'를 못 묻는다"는 비판과 [[2026-09-14-why-vibe-coded-dashboards-look-bad]](Adam Kucharski)의 "AI는 만들어주지만 무엇을 봐야 할지는 안 정리해준다"는 관찰은, 1~2인 앱 시대에도 같은 함정(완성물이 판단을 대신하지 않는다)이 적용된다는 걸 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 거리가 있다 — Ptacek의 논지는 OS 커널 수준의 앱 격리 재설계라는 소비자 컴퓨팅 인프라 얘기라, 온다가 당장 바꿀 레이어가 아니다. 다만 전이 가능한 원칙 하나는 살아있다: "호텔마다 다른 요구사항"은 정확히 이 글이 말하는 "시장이 존재하지 않을 만큼 좁은 사용자층(1~2명급 니즈)"과 같은 모양이다. 호텔 A만의 특이 요금 규칙, 호텔 B만의 특수 채널 매핑처럼 지금까지는 전문 개발자가 커스텀 개발 티켓으로 대응하던 영역을, 프런트·운영 담당자가 자연어로 미니 자동화(특정 리포트 필터, 특정 알림 규칙 등)를 스스로 조립하는 방향으로 옮길 여지는 있다. 다만 Ptacek 논지의 반쪽(격리 모델 붕괴)은 CRS에는 그대로 적용하면 위험하다 — 결제·인벤토리·권한이 걸린 시스템에서는 "제작자=사용자니까 격리 불필요"라는 전제가 성립하지 않는다([[2026-05-07-vibe-coding-agentic-engineering-converging]]의 "경계 조건·보안엔 강제 라인 리뷰" 원칙과 정면 충돌). 개인화 자동화의 매력과 B2B 미션크리티컬 시스템의 격리 필요성 사이의 이 긴장을 정직하게 병기해둔다.

## 연관 자료

- [[2026-07-20-what-happened-to-the-frontend]] — 복잡성이 이해를 병목시킨다는 반증/보완축
- [[2026-05-07-vibe-coding-agentic-engineering-converging]] — 책임·평판 없는 시스템 의존이라는 반대편 우려
- [[2026-09-17-ps5-linux-theflow-quits-llm-vibe-coding]] — 신뢰·책임 소재 문제가 터진 실제 선례
- [[2026-06-08-design-with-claude-more-than-figma]] — 완성물이 "왜?"를 가린다는 같은 함정
- [[2026-09-14-why-vibe-coded-dashboards-look-bad]] — 판단은 AI가 대신해주지 않는다는 실증 사례

## 한 달 뒤 회고

*(2026-10-27 즈음 — Ptacek의 "AI 앱 전용 폰" 프로젝트 진척 상황, 이 글에 대한 OS 설계자들의 구체적 반론이 나왔는지 확인.)*
