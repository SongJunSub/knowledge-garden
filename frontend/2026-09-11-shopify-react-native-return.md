---
title: "Shopify, React Native에서 네이티브로 복귀 (Shopify Engineering) — 코드를 공유해야 싸다는 전제가 아니라, 코딩 에이전트가 '두 번 만드는' 비용을 낮췄다는 전제로 바뀌었다"
source_title: "Native is now the future of mobile at Shopify"
source_url: "https://shopify.engineering/back-to-native"
source_name: "Shopify Engineering 공식 블로그, GeekNews(id=33485) 경유"
referrer_url: "https://news.hada.io/topic?id=33485"
published_at: "2026-09-10"
summarized_at: "2026-09-11"
category: "frontend"
tags: ["shopify", "react-native", "native-development", "coding-agents", "mobile", "swift", "kotlin"]
---

# Shopify, React Native에서 네이티브로 복귀

> 출처: [Native is now the future of mobile at Shopify](https://shopify.engineering/back-to-native) (Shopify Engineering 공식 블로그) · GeekNews(id=33485) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`(id=33485)와 `shopify.engineering` 모두 이번 세션 egress 정책으로 직접 열람이 차단됐다. Slack TechArticles 봇이 스크랩한 발췌(끝부분 절단)와 WebSearch로 확보한 Simon Willison 블로그 소개, byteiota·DEV Community·AIPostHub 등 2차 보도, 그리고 Hacker News 스레드(news.ycombinator.com/item?id=49643982, 751포인트·507댓글로 WebSearch 확인)를 교차 확인해 재구성했다. 원문의 정확한 기술적 세부(어떤 코딩 에이전트를 썼는지, 검증 방식)는 2차 소스 수준까지만 확인했다.

## 한 줄 요약

**Shopify가 2026-09-10 모든 모바일 앱을 React Native에서 Swift·Kotlin 네이티브로 되돌리겠다고 발표했다.** 이유로 내세운 건 React Native의 성능 문제가 아니라 전제 자체의 변화다 — "코드를 한 번만 짜서 공유해야 개발 비용을 아낄 수 있다"는 2020년의 계산이, 코딩 에이전트가 같은 기능을 iOS·Android 두 플랫폼에 각각 구현하는 비용을 크게 낮추면서 더 이상 유효하지 않다는 것.

## 핵심 포인트

- **발표**: 2026-09-10 Shopify Engineering 공식 블로그를 통해 ***"네이티브가 이제 Shopify 모바일의 미래"***라고 선언, 모든 모바일 앱을 Swift·Kotlin으로 전환하기로 결정.
- **전제의 변화, 성능 문제가 아님**: React Native가 느려서가 아니라, ***"에이전트가 이제 구현·번역·테스트·리뷰 작업의 상당 부분을 처리할 수 있어 2020년만큼 결정적 요인이 아니게 됐다"***는 게 핵심 논거. 플랫폼 고유 기능·공식 도구에 직접 접근할 수 있는 네이티브의 이점을 이제는 "공유 비용" 없이 가져갈 수 있다는 논리.
- **Shop 앱 사례**: 개념 증명부터 완전한 네이티브 앱 스토어 출시까지 **12주**, 엔지니어 6명이 투입됐다고 알려짐(WebSearch로 확인, 원문 직접 인용은 미확보).
- **확장 계획**: 300개 이상 화면을 가진 본체 Shopify 앱(홈·잠금화면 위젯, Apple Watch 앱, Siri 단축어 포함)도 전환 작업이 진행 중이며 2026년 안에 출시 예정.
- **부수 효과 — 오픈소스 정리**: Shopify가 유지해온 React Native 라이브러리(react-native-skia, flash-list, restyle) 중 일부는 새 관리처를 찾고, restyle은 2026년 말 아카이브 처리된다고 알려짐.
- **반응 갈림 (HN)**: Hacker News 스레드가 751포인트·507댓글로 상당한 화제를 모았다는 것은 WebSearch로 확인했으나, 논조는 "React Native가 잘 작동하고 있다면 이 발표가 이주해야 할 이유가 되지는 않는다"는 절제된 시각이 우세했다는 요약만 확보했고 실제 댓글 원문·비율은 확인하지 못했다.

## 인상 깊은 문장

> "Agents can now do enough of the implementation, translation, testing, and review work that it's no longer the deciding factor it was in 2020." (에이전트가 이제 구현·번역·테스트·리뷰 작업의 상당 부분을 처리할 수 있어, 2020년만큼 결정적 요인이 아니게 됐다) — Shopify Engineering, WebSearch로 확인된 2차 인용(원문 직접 대조는 못 함)

## 댓글

hada(id=33485) 댓글 수는 이번 세션 접근 차단으로 확인 불가. Hacker News에는 news.ycombinator.com/item?id=49643982 스레드가 있고 751포인트·507댓글로 이 시기 상당히 화제가 된 주제임을 WebSearch로 확인했지만, 실제 댓글 원문이나 찬반 비율은 열람하지 못했다. 이해관계 고지: 1차 발표문은 Shopify 자신의 공식 엔지니어링 블로그이므로 "12주 만에 출시", "AI가 비용을 낮췄다"는 서사 자체가 당사자 발화다 — 실패한 시도나 숨겨진 비용(예: 두 플랫폼 QA 인력 증가 여부)은 이 발표문에 담기지 않았을 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 회사, 이틀 연속 정반대로 보이는 베팅이 실은 하나의 방향

[[2026-09-10-tailwind-labs-joins-shopify]]에서 정리한 사건(2026-09-09)과 겹쳐 보면 흥미로운 그림이 나온다. 하루 전 Shopify는 AI에 사업이 잠식당한 Tailwind Labs를 사내로 편입시켰고(외부 CSS 추상화 계층의 "제작사"를 통째로 흡수), 하루 뒤에는 자신이 오랫동안 써온 크로스플랫폼 추상화 계층(React Native)을 버리고 네이티브로 직행하겠다고 선언했다. 표면적으로는 "인수"와 "포기"로 정반대처럼 보이지만, 공통점이 있다 — 둘 다 **외부 추상화 계층에 대한 의존을 줄이고 직접 통제권을 늘리는 방향**이다. Tailwind는 통제권 안으로 사들였고, React Native는 통제권 밖에 있던 추상화 자체를 걷어냈다. 그리고 두 결정 모두 AI가 만든 비대칭이 원인이다 — AI는 Tailwind의 매출 기반(문서 방문)을 무너뜨려 Shopify 품으로 들어오게 만드는 동시에, Shopify 내부에서는 같은 기능을 두 번 짜는 비용을 낮춰 크로스플랫폼 추상화의 존재 이유를 없앴다. AI가 하나의 생태계 안에서 공급자에게는 파괴자로, 수요자에게는 조력자로 동시에 작동한 이틀이었던 셈이다.

### 핵심 전이 2 — "배율이 풀리는 조건"이 이번에도 성립하는지는 확인되지 않는다

[[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]에서 정리한 핵심 원칙은 ***"이식(port)에는 정답지가 있어야 배율이 풀린다"*** — Bun의 Zig→Rust 재작성이 AI로 극적으로 빨라질 수 있었던 건, 기존 코드가 곧 스펙이고 테스트 스위트가 자동으로 결과를 대조해줬기 때문이다. Shopify의 이번 사례는 겉으로는 비슷해 보이지만 성격이 다르다 — RN 코드를 Swift/Kotlin으로 1:1 "포트"하는 게 아니라, 같은 기능 명세를 두 플랫폼에 **각각 새로 구현**하는 것에 가깝다. 이 경우 "정답지"에 해당하는 자동 검증 체계(두 네이티브 구현이 정말 동일하게 동작하는지 확인하는 장치)가 있는지는 이번 발표문에서 확인되지 않는다. Bun 사례가 검증 자동화라는 조건을 명시했던 것과 달리, Shopify의 "12주 만에 출시"라는 수치는 자사 발표일 뿐 그 배율을 가능케 한 검증 메커니즘은 공개되지 않았다 — 두 사례를 겹쳐보면 "AI가 비용을 낮췄다"는 주장을 볼 때마다 검증 방식을 먼저 물어야 한다는 원칙이 다시 확인된다.

## 호스피탈리티 / CRS 적용 포인트

온다가 iOS/Android 네이티브 앱과 크로스플랫폼(React Native 등) 중 무엇을 쓰는지는 이번 조사로 확인되지 않았다. 그 전제로 전이 가능한 원칙만 남긴다.

- CRS나 파트너 대상 모바일 앱이 크로스플랫폼 프레임워크를 쓰고 있다면, "코드 공유 비용 절감"이라는 원래의 채택 근거가 코딩 에이전트 도입 이후에도 여전히 유효한지 재검토할 시점이 될 수 있다. 다만 이건 Shopify 규모(엔지니어 다수, 300개 이상 화면)의 계산이라 온다 규모에 그대로 적용되는지는 별개 문제다.
- 더 중요한 원칙은 전이 2다 — "AI가 두 번 만드는 비용을 낮췄다"는 주장을 받아들이기 전에, 그 배율을 검증하는 자동화 장치(테스트, 플랫폼 간 동등성 검사)가 실제로 존재하는지 먼저 확인하는 습관을 CRS 개발 의사결정에도 적용할 만하다.
- 억지로 늘리지 않는다. 온다는 모바일 프론트엔드 기술 스택을 직접 공개한 바 없어, 이 사건을 구체적인 기술 전환 권고로 연결하는 건 이 노트 선에서는 근거가 부족하다.

## 연관 자료

- [[2026-09-10-tailwind-labs-joins-shopify]] — 같은 회사의 이틀 연속 행보: 외부 추상화 계층을 인수(Tailwind)한 다음날 내부 추상화 계층을 포기(React Native), AI가 공급자와 수요자 양쪽에 동시에 작용한 사례
- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — "이식에는 정답지가 있어야 배율이 풀린다"는 원칙, Shopify의 "12주" 주장에는 이 검증 장치가 공개되지 않았다는 대조

## 한 달 뒤 회고

*(2026-10-11 즈음: ①본체 Shopify 앱(300개+ 화면)의 네이티브 전환이 실제로 2026년 안에 출시됐는지, ②restyle 아카이브·flash-list 새 관리처 이관이 React Native 생태계에 실제로 어떤 영향을 줬는지, ③HN 507댓글의 실제 논조를 확인할 기회가 있었는지, ④온다 모바일 스택이 이 사건과 관련이 있는지 확인)*
