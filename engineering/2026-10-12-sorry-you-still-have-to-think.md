---
title: "미안하지만, 여전히 직접 생각해야 합니다 (Piotr Sarnacki) — DHH의 Campfire Once AI 재작성 벤치마크는 언어 성능 비교가 아니라 '프롬프트가 암묵적으로 내린 설계 결정'의 비교였다"
source_title: "I'm sorry, but you still have to think"
source_url: "https://itsallaboutthebit.com/i-am-sorry-but-you-still-have-to-think/"
source_name: "itsallaboutthebit.com (Piotr Sarnacki)"
referrer_url: "https://news.hada.io/topic?id=35189"
published_at: "2026-10-11"
summarized_at: "2026-10-12"
category: "engineering"
tags: ["ai-coding", "coding-agents", "benchmark-skepticism", "campfire", "rust", "elixir", "system-design", "load-testing"]
---

# 미안하지만, 여전히 직접 생각해야 합니다 (Piotr Sarnacki)

> 출처: [I'm sorry, but you still have to think](https://itsallaboutthebit.com/i-am-sorry-but-you-still-have-to-think/) (Piotr Sarnacki) · GeekNews(id=35189) 경유 · 정리일 2026-10-12
> **출처 한계**: news.hada.io와 itsallaboutthebit.com 모두 이 세션에서 WebFetch가 egress 차단(ENOTFOUND)됐다. WebSearch로 원문 저자(Piotr Sarnacki)·발행일(2026-10-11)·daily.dev 미러·Hacker News 반응(271포인트)을 교차확인했고, DHH의 원 트윗("I've had agents implement and optimize the Campfire web app in Elixir, Go, and Rust...")과 Elixir 포트 GitHub 저장소(basecamp/once-campfire-elixir)의 PR 기록으로 배경 사실을 보강했다. 다만 **본문 전체(14%→90% 전달률 개선의 정확한 수치 추이, 저자의 세부 논증 순서)는 WebSearch 스니펫 기반 재구성**이라 원문 1차 텍스트와 완전히 일치하지 않을 수 있다.

## 한 줄 요약

**DHH가 "에이전트에게 Campfire(37signals의 채팅 앱)를 Rust·Elixir·Go로 재작성시켰고 Rust가 가장 빨랐다"고 벤치마크를 공개하자, Piotr Sarnacki는 그 결과가 언어 성능 차이가 아니라 "프롬프트가 구체적이지 않을 때 에이전트가 암묵적으로 내린 설계 결정"의 차이라고 반박한다. 호환성·지연·처리량·메모리 한도 같은 판단은 AI에게 맡겨도 사라지지 않으며, 누군가(사람 또는 모델이 임의로)는 반드시 그 선택을 한다. Elixir 포트는 Redis/Resque를 유지하고 단일 GenServer로 DB 쿼리를 직렬화했지만 Rust 포트는 그걸 전부 걷어내고 인프로세스 큐로 바꿨다 — 이건 언어의 한계가 아니라 구현 범위의 차이다.**

## 핵심 포인트

- ***AI 에이전트에 코드 재작성을 맡겨도 설계 판단은 사라지지 않는다*** — 호환성, 지연 시간, 처리량, 메모리 한도 같은 결정은 누군가 반드시 내려야 하고, 프롬프트가 구체적이지 않으면 ***모델이 암묵적으로 결정***한다. DHH 자신도 X에서 "더 이상 코드를 안 읽는다면"이라는 조건을 달았는데, 이는 그 암묵적 결정들을 검증하지 않았다는 뜻이기도 하다.
- ***Campfire 재작성의 호환성 비대칭*** — Elixir 포트는 Rails와의 데이터 호환을 지키려고 Redis·Resque(잡 큐)를 그대로 유지하고 DB 쿼리를 단일 GenServer로 직렬화했다. Rust 포트는 Redis·Resque·Thruster를 전부 걷어내고 단일 바이너리 + 인프로세스 큐로 교체했다. **애초에 서로 다른 제약 조건 아래 만들어진 구현을 "언어 성능"으로 환원해 비교한 것**이 문제의 핵심.
- ***처리량 숫자 하나로는 품질을 판단할 수 없다*** — "room page" 벤치마크에서 Rust는 초당 36,260 요청, Elixir는 722 요청을 기록했다는 DHH의 발표가 있었지만, 부하 생성 방식·HTTP 오류율·전달 지연·재접속 동작을 함께 봐야 진짜 그림이 나온다.
- ***커밋 수의 비대칭도 숨어 있다*** — 비판자들은 Rust 포트가 398개 커밋을 받은 반면 Elixir·Go 포트는 각 3개 커밋에 그쳤다고 지적한다 — 벤치마크 표가 "언어"가 아니라 "에이전트에게 투입한 반복 횟수"를 측정했을 수 있다는 것.
- ***전달률이 측정 방식에 따라 완전히 달라짐*** — 일정 도착률(constant-arrival-rate) 테스트에서는 Rust가 이벤트의 14%만 전달하고 Elixir는 60%를 전달했다는 역전된 결과도 보고됐다(같은 코드베이스를 다른 부하 패턴으로 테스트). 이벤트 버퍼 크기를 조정하자 Rust의 전달률이 약 14%에서 약 90%로 뛰었다는 Slack 발췌의 수치도 바로 이 지점과 맞물린다 — ***"버퍼 크기 하나가 벤치마크 승패를 뒤집을 수 있다"***는 것이 저자의 핵심 논증.

## 인상 깊은 문장

> (재구성, 원문 1차 인용 미확보) — DHH의 원 트윗 취지: "I've had agents implement and optimize the Campfire web app in Elixir, Go, and Rust. Yes, Ruby is the slowest. I didn't care about that when the pay-off was huge in terms of productivity and developer joy. But if you're no longer reading the code?" (X, @dhh)
> 이 질문표("But if you're no longer reading the code?")가 사실상 Sarnacki 글의 출발점이다 — 코드를 읽지 않으면 그 안의 설계 결정도 검증하지 않게 된다는 경고.

## 댓글

GeekNews(id=35189) 페이지를 직접 열지 못해 **hada 댓글 수는 확인하지 못했다.** 다만 이 글은 Hacker News에서 **약 271포인트**를 받은 것으로 확인돼(daily.dev 메타데이터 경유, HN 원 스레드 직접 대조는 못함) 상당한 큐레이션 반응을 받은 글이다. The Register도 별도로 이 벤치마크를 "에이전트가 코딩한 대결이 흥미로운 결과를 냈다"는 제목으로 다루며 "DHH의 벤치마크를 믿지 말라"는 회의적 반응이 많았다고 보도했다 — 즉 이 논쟁은 Sarnacki 혼자만의 의견이 아니라 **여러 독립 관찰자가 같은 방향(비교 조건의 비대칭)으로 수렴**한 사례다. 다만 "커밋 수 비대칭"이나 "버퍼 크기로 전달률 14%→90%" 같은 세부 수치는 2차 보도 경유라 정확한 수치는 재검증이 필요하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "검증이 자동화될 때만 배율이 풀린다"는 선행 결론과의 정합

[[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]는 Bun의 Zig→Rust 재작성(AI 11일, $165,000)이 성공한 이유를 "이식(port)에는 정답지가 있기 때문 — 기존 Zig 테스트 스위트가 그대로 검증 오라클 역할을 했다"고 분석했다. Campfire 재작성은 **정답지가 불완전했던 사례**로 읽힌다 — Rails와의 "완전한" 동작 동등성이 애초에 모호했고(Elixir는 Redis를 유지해 부분 호환, Rust는 전면 교체), 그래서 "무엇이 맞는 재작성인가"에 대한 합의 없이 각 에이전트가 암묵적으로 다른 기준을 세웠다. **같은 "AI 재작성" 장르에서 검증 오라클의 유무가 결과 신뢰도를 가른다**는 게 두 사례를 나란히 놓고 보면 더 또렷해진다.

### 핵심 전이 2 — "에이전트는 뇌는 좋아졌는데 몸이 안 좋아졌다"는 진단과 연결

[[2026-10-11-why-coding-agents-are-so-dumb]]는 코딩 에이전트의 문제를 "위임·병렬화를 흉내만 내고 '만지지 말라'는 프롬프트로 보안을 때운다"고 짚었다. Sarnacki의 논증도 비슷하다 — **에이전트는 "지시받은 것"은 잘 하지만 "지시받지 않은 설계 판단"은 임의로 채운다.** 프롬프트가 구체적이지 않으면 호환성 범위, 메모리 한도, 재접속 정책 같은 것들이 동전 던지기가 된다는 Sarnacki의 지적은, 결국 "에이전트에게 맡길 수 있는 범위"와 "사람이 반드시 명시해야 하는 설계 결정" 사이의 경계가 아직 사람의 머릿속에만 있다는 뜻이다.

### 핵심 전이 3 — 벤치마크 숫자 하나로 품질을 판단하는 게 위험하다는 계열 논의

[[2026-09-12-measuring-code-sloppiness]]는 "조잡함은 국소 속성이 아니라 전체 구조 속성이라 10점 만점 채점 같은 손쉬운 지표는 사실상 난수 생성기"라고 지적했다. Campfire 벤치마크의 "처리량 숫자 하나"도 같은 함정이다 — ***부하 패턴을 바꾸면 순위가 뒤집히는 벤치마크***는 그 자체로 "단일 숫자 요약의 위험"을 보여주는 실증 사례다. [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] 같은 AI 코딩 측정 방법론 비판 계열과도 바로 이어진다.

### 핵심 전이 4 — "코딩은 해결된 문제가 아니다"의 구체적 증거

[[2026-09-29-coding-is-not-a-solved-problem]]의 "생성은 싸졌어도 검증과 소유권은 그대로다"라는 명제가 이 사례에서 정확히 재현된다. DHH는 재작성을 자동화했지만(생성 비용 ↓), 그 결과가 실제로 맞는지 검증하는 작업(여러 부하 패턴·오류율·재접속까지 보는 것)은 여전히 사람이 해야 했다 — Sarnacki의 글 자체가 바로 그 "검증 작업"의 결과물이다.

## 호스피탈리티 / CRS 적용 포인트

CRS/PMS에도 그대로 적용된다 — 예약 처리 로직을 AI 에이전트에게 재작성시킨다면, "동시성 모델", "재고 잠금 방식", "장애 시 재시도 정책" 같은 설계 결정은 프롬프트에 명시하지 않으면 모델이 암묵적으로 정한다. 특히 CRS는 "처리량(초당 예약 처리 건수)"만으로 성공을 판단하기 쉬운 영역인데, 이 글의 교훈은 **"처리량이 높아졌다"는 보고를 받으면 반드시 "어떤 부하 패턴으로, 오류율과 재고 정합성까지 같이 측정했는가"를 되물어야 한다**는 것. 재작성 전후 비교 시 "Rails 기준 완전 호환"처럼 모호한 기준이 아니라 구체적인 호환 범위를 문서화해 프롬프트에 명시하는 습관이 직접 적용 가능한 원칙이다.

## 연관 자료

- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — 검증 오라클이 명확했던 AI 재작성 성공 사례(대조군)
- [[2026-10-11-why-coding-agents-are-so-dumb]] — "지시받지 않은 설계 판단은 임의로 채운다"는 같은 진단
- [[2026-09-12-measuring-code-sloppiness]] — 단일 지표로 품질을 판단하는 위험성, 같은 계열
- [[2026-09-29-coding-is-not-a-solved-problem]] — "생성은 싸졌어도 검증은 그대로"라는 상위 명제

## 한 달 뒤 회고

*(2026-11-12 즈음 — 원문을 직접 읽을 기회가 생기면 "14%→90%" 수치의 정확한 조건(어떤 부하 패턴, 어떤 버퍼 크기 변경)을 재대조할 것. CRS 재작성/마이그레이션 논의가 생기면 "호환 범위를 프롬프트에 명시했는가"를 체크리스트에 넣었는지 확인.)*
