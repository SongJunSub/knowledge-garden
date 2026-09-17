---
title: "Octane (Dominic Gannaway) — React API는 그대로 두고 컴파일러가 의존성 배열과 Virtual DOM을 통째로 들어낸다"
source_title: "Octane — React's programming model, compiled"
source_url: "https://github.com/octanejs/octane"
source_name: "GitHub (octanejs/octane)"
referrer_url: "https://news.hada.io/topic?id=33814"
summarized_at: "2026-09-17"
category: "frontend"
tags: ["react", "octane", "no-virtual-dom", "compiler", "inferno", "hooks", "framework-performance"]
---

# Octane (Dominic Gannaway)

> 출처: [Octane — React's programming model, compiled](https://github.com/octanejs/octane) (Dominic Gannaway · GitHub) · 정리일 2026-09-17

## 한 줄 요약

**Octane은 React의 Hooks·Suspense·Actions API는 그대로 두고, 컴파일러가 이를 ahead-of-time으로 직접 DOM 코드로 변환해 Virtual DOM과 useEffect/useMemo 의존성 배열, Rules of Hooks를 통째로 없애버린 Inferno의 후속 프레임워크다.**

## 핵심 포인트

- **API는 그대로, 실행 모델만 컴파일로 대체** — useState, useEffect, memo, context, portals, Suspense, transitions까지 React와 같은 API·멘탈모델을 유지하면서, 컴파일러가 이를 direct DOM 업데이트 코드로 변환한다. Virtual DOM 자체가 없다.
- ***"Write the closure, not its dependency list"*** — useEffect/useMemo의 의존성 배열을 손으로 관리할 필요가 없다. 컴파일러가 클로저가 무엇을 캡처하는지 분석해 반응성 코드를 자동 생성한다.
- **Hook을 호출 순서가 아니라 호출 위치로 추적** — 그 결과 ***if문 내부나 early return 뒤에서도 Hook을 쓸 수 있다***. React의 오랜 제약인 Rules of Hooks가 구조적으로 사라진다.
- **"The platform, not a reimplementation of it"** — 실제 위임된(delegated) DOM 이벤트, 네이티브 폼 컴포넌트(React의 value/checked 시맨틱은 유지하되 onInput/onChange를 네이티브 이벤트로 처리)를 쓰고 합성 이벤트 시스템을 재구현하지 않는다.
- **React와의 제한적 상호운용** — ReactCompat/OctaneCompat으로 React 19.2+ 트리 안에 Octane 컴포넌트를 섞어 쓸 수 있지만, 클래스 컴포넌트·React Server Components·synthetic event 시스템은 Octane 자체 런타임에 없다.
- **검증·생태계 규모** — 3,900개 이상의 행동 테스트로 React와의 동작 일치를 케이스별로 검증했고, LIS(최장 증가 부분열) 기반 keyed reconciler, 53개의 1st-party 생태계 바인딩(TanStack, React Three Fiber, Lynx, StyleX 등), 빌드 도구 통합, CLI, AI 에이전트용 MCP 서버까지 모노레포로 함께 배포한다.
- **표준 JSX 외에 .tsrx 확장 문법** — @if, @for, @switch 같은 템플릿 지시어를 선택적으로 쓸 수 있다. 아직 알파 단계 프로젝트다.

## 인상 깊은 문장

> "Write the closure, not its dependency list."

> "The platform, not a reimplementation of it."

## 댓글

**출처 한계가 크다.** news.hada.io(원문 페이지·포르투갈어 미러 모두), 공식 사이트 octanejs.dev, Hacker News(news.ycombinator.com), daily.dev까지 이 세션에서 전부 egress 차단되어 직접 열람하지 못했다. WebSearch로 교차 검증한 결과 HN에 최소 두 개의 제출 스레드가 등록돼 있음을 확인했다(id=49071306 "Octane, the successor to Inferno", id=49152640 "Octane – React's programming model, compiled" — 이쪽이 GeekNews 제목과 정확히 일치). 다만 HN 자체를 열지 못해 포인트·댓글 수는 확인 불가. WebSearch 요약 스니펫 중 하나에 "일부 댓글이 프로젝트 카피에서 Claude의 흔적(fingerprint)을 지적했다"는 언급이 있었는데, 마케팅 문구가 AI로 작성된 것 같다는 회의적 반응이 있었던 정황으로 보이나 원문을 직접 못 읽어 정확한 맥락은 미확인으로 남긴다. Lobsters 언급은 검색 결과에서 발견하지 못했다. hada 댓글 수도 확인 불가. 만든 사람이 직접 공개한 알파 단계 프로젝트(n=1 자기 발표, 실사용 프로덕션 사례 미확인)라는 점도 감안해서 읽어야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-05-26-does-anyone-actually-like-react]]가 정리한 React 비판을 정확히 겨냥해서 나온 대안.** 그 노트에서 정리한 핵심 비판 중 하나가 "useEffect/useMemo API 복잡·의존성 배열 논쟁 지속"이었고, 댓글에서도 "Vue·Svelte는 자동 최적화, React는 수동 판단"이 지적됐다. Octane은 React API 자체는 버리지 않은 채 그 결함만 컴파일러로 도려내는 접근이다 — "React를 떠나라"가 아니라 "React의 프로그래밍 모델은 맞고 실행 방식이 틀렸다"는 다른 진단. 4개월 전 정리했던 비판이 실제 대안 프로젝트로 응답된 사례로 볼 만하다.

**핵심 전이 2 — [[2026-09-04-browser-main-thread-is-expensive]]의 예산론과는 다른 축의 해법.** 그 노트의 원칙은 "메인 스레드 프레임 예산(실측 10ms 안팎) 안에서 분할·배치·우선순위화·지연으로 최적화하라"였다. Virtual DOM diffing 자체가 매 렌더마다 메인 스레드에서 도는 추가 작업인데, Octane은 그 작업을 런타임이 아니라 컴파일 타임에 없애버린다 — "예산 안에서 아껴 쓰기"가 아니라 "작업 자체를 제거하기"라는, 같은 문제에 대한 또 다른 해법 축이다.

## 호스피탈리티 / CRS 적용 포인트

알파 단계 프레임워크를 지금 CRS Admin·PickMe 같은 상용 프론트엔드에 도입하는 건 시기상조다 — 이 점은 정직하게 밝힌다. 다만 원칙은 참고할 만하다. CRS Admin의 예약 캘린더·요금 그리드처럼 대량 리렌더가 잦은 화면에서 실제로 발생하는 성능 버그 상당수가 useEffect 의존성 배열을 잘못 적어 불필요한 리렌더를 유발하거나(과다 실행) 반대로 배열을 빠뜨려 stale closure 버그를 만드는 경우다. Octane의 "클로저를 그대로 쓰고 의존성 배열은 컴파일러가 추론"하는 모델은 이런 버그 클래스를 원천적으로 차단하는 방향을 보여준다. 지금은 "패턴으로만 참고"하고, 1.0 안정화와 실사용 프로덕션 사례가 쌓이면 CRS 프런트엔드 성능 튜닝 후보로 재평가할 만하다.

## 연관 자료

- [[2026-05-26-does-anyone-actually-like-react]] — React 비판이 정확히 겨냥한 결함(의존성 배열 수동 관리, Vue/Svelte식 자동 최적화 요구)을 컴파일러로 해소하려는 시도
- [[2026-09-04-browser-main-thread-is-expensive]] — 메인 스레드 예산 절약을 "런타임에서 아끼기"가 아니라 "컴파일 타임에 제거하기"로 접근하는 대비축

## 한 달 뒤 회고

*(2026-10-17 즈음 — Octane이 알파 단계를 벗어났는지, GitHub 스타 수·실사용 프로덕션 도입 사례가 등장했는지, news.hada.io·HN 접근이 복구되어 hada 댓글 수와 HN 포인트/논쟁을 보완했는지, "Claude 흔적" 지적의 실제 맥락을 확인했는지 기록.)*
