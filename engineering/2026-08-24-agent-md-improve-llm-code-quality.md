---
title: "agent.md로 LLM 생성 코드의 품질 높이기 (Fabien Sanglard) — 반복해서 달던 코드리뷰 코멘트를 파일 하나에 모으자, 검토의 초점이 스타일에서 아키텍처로 이동했다"
source_title: "My agent.md to improve LLM-assisted code quality"
source_url: "https://fabiensanglard.net/agent.md/index.html"
source_name: "fabiensanglard.net (Fabien Sanglard)"
referrer_url: "https://news.hada.io/topic?id=32833"
published_at: "2026-08-21"
summarized_at: "2026-08-24"
category: "engineering"
tags: ["agent-md", "agents-md", "claude-md", "context-engineering", "code-review", "llm-coding", "coding-style", "context-dilution", "geeknews"]
---

# agent.md로 LLM 생성 코드의 품질 높이기 (Fabien Sanglard)

> 출처: [My agent.md to improve LLM-assisted code quality](https://fabiensanglard.net/agent.md/index.html) (fabiensanglard.net · Fabien Sanglard) · 정리일 2026-08-24
> **출처 한계**: `fabiensanglard.net`이 이번 세션 네트워크 egress 정책상 접근 불가해 원문을 직접 열지 못했다. GeekNews 원문 페이지(`news.hada.io`)도 동일하게 차단이다. 아래 내용은 **WebSearch로 재구성한 것**이며, 규칙 목록 일부는 검색 스니펫이 인용부호 없이 반환한 문구라 **완전한 원문 그대로인지 대조 검증은 못했다.** Slack 발췌 마지막 불릿("버그 수정은 실패…")이 가리키는 구체 사례는 **끝내 원문을 찾지 못해 확인 불가로 남긴다.**

## 한 줄 요약

**2025년 중반엔 컴파일도 안 되던 LLM 생성 코드가, 2026년 초엔 복잡한 자료구조 구현과 까다로운 버그 분석까지 해내게 됐다. 그런데 그 코드는 여전히 스파게티였다 — 주석도 구조도 없이, 정리하는 데 드는 시간이 속도 이득을 상쇄할 정도로. Sanglard는 세션마다 반복해서 달던 리뷰 코멘트("매직 넘버 쓰지 마라", "여기 짧은 주석 하나만")를 `agent.md` 파일 하나로 모아 매 세션 프롬프트에 자동 주입시켰고, 그 결과 생성 코드가 직접 짠 것에 가까워졌을 뿐 아니라 리뷰할 때 자신이 보는 지점 자체가 스타일에서 아키텍처·설계로 옮겨갔다고 보고한다.**

## 핵심 포인트

- **타임라인** — 2025년 중반(`libadbmdns`, Rust mDNS 구현): LLM 생성 코드가 컴파일조차 안 됨. 2026년 1월: 복잡한 인덱스 이진 힙 클래스를 작성하고 `polling` 크레이트의 Windows IOCP 관련 난해한 버그까지 짚어냄 — 그러나 코드는 여전히 주석·구조가 없는 스파게티. 2026년 3월: Antigravity, VS Code의 Claude Code 플러그인 같은 에이전틱 IDE로 옮겨가며 `agent.md` 접근을 시작.
- **작동 방식** — 코딩 하네스가 세션 시작 시 `agent.md`를 읽어 프롬프트에 자동 주입한다. 같은 리뷰 코멘트를 반복하게 되면 그걸 즉시 `agent.md`에 추가하는 식으로, **관찰된 실패 패턴에서만 규칙이 자란다**(사전 설계가 아니라 사후 누적).
- **구체 규칙 예시**(검색으로 재구성, 문구는 원문에 가까울 것으로 보이나 대조 검증은 못함):
  - *"Avoid magic numbers and strings by extracting recurring or meaningful values into descriptive constants (const) or enums. Keep self-explanatory, one-off values inline to avoid clutter. If a value comes from a spec (e.g. HTTP 200 OK), use a constant regardless."*
  - *"Reduce code indentation. Avoid Arrow Anti-Pattern. Leverage early return and continue."*
  - *"Use enums instead of booleans for function parameters."*
  - 관련 없는 코드 블록에 손대지 않기(기능 구현 범위 밖 변경 금지).
  - 멤버 가시성 변경을 "설계상 파괴적 변경"으로 취급 — 외부에서 꼭 필요하지 않으면 필드·함수는 기본 private, `private → internal/public` 전환은 반드시 사용자 승인 요청.
  - 추상화 수준을 지켜 프로그래밍하기 — 저수준 메커니즘은 전용 드라이버/추상화 계층에 캡슐화하고, 나머지 애플리케이션에는 깔끔한 고수준 API만 노출.
- **컨텍스트 희석(context dilution) 문제** — 컨텍스트가 길어질수록 모델이 중간에 있는 지시를 덜 챙기고 앞·뒤에 더 주의를 기울이는 현상을 스스로 인지. 대응은 **기능 단위로 세션을 새로 시작**하고, 품질이 떨어지는 게 보이면 명시적으로 `agent.md`를 다시 로드해달라고 요청하는 것.
- **효과에 대한 자기 평가** — LLM이 여전히 계속 환각을 일으키고 신뢰할 수 없다는 전제는 그대로 두되, `agent.md` 도입 후로는 **리뷰에서 스타일 지적을 거의 안 하게 됐고, 시간을 아키텍처·설계 판단에 쓰게 됐다**고 보고.

## 인상 깊은 문장

> "Avoid magic numbers and strings by extracting recurring or meaningful values into descriptive constants (const) or enums. Keep self-explanatory, one-off values inline to avoid clutter. If a value comes from a spec (e.g. HTTP 200 OK), use a constant regardless."

> "Reduce code indentation. Avoid Arrow Anti-Pattern. Leverage early return and continue."

> "Use enums instead of booleans for function parameters."
> **세 문장 모두 규칙 목록에서 재구성한 것 — 원문 페이지를 직접 열지 못해 대조 검증은 못했지만, 문체·형식이 실제 `agent.md` 항목처럼 보인다.**

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 **댓글 수·논조 확인 불가.**
- **Hacker News**: "My agent.md to improve LLM-assisted code quality" 항목이 존재하고, 검색 결과 종합으로는 **약 110포인트·283개 댓글**로 추정된다. 다만 `news.ycombinator.com` 자체도 이번 세션에서 egress 차단이라 **원문 페이지로 직접 대조하지 못했고, 상위 댓글 논조도 확인 불가** — 수치의 정확도를 보장할 수 없다.
- **Lobsters**: 검색으로 이 글의 개별 제출을 찾지 못했다. 유사 주제("AGENTS.md as a dark signal")는 있었지만 이 글과 별개다. **큐레이션 여부 확인 불가.**
- **읽을 때 감안**: ①저자 개인의 프로젝트(`libadbmdns` 등) 경험담이라 **n=1**이고, 다른 언어·다른 규모 코드베이스에 그대로 일반화되는지는 검증되지 않았다. ②"버그 수정은 실패했다"는 취지로 보이는 Slack 발췌의 마지막 불릿이 정확히 어떤 사례를 가리키는지 원문을 못 구해 **끝내 확인하지 못했다** — 규칙이 스타일 문제엔 잘 듣지만 버그 수정 같은 판단이 필요한 작업엔 한계가 있다는 뉘앙스로 짐작되나, 짐작 이상은 아니다.

## 내 생각 · 적용점

### 핵심 전이 1: [[2026-08-09-eight-line-context-file]]과 정반대 형태인데, 밀도 원칙 자체는 깨지지 않았다

[[2026-08-09-eight-line-context-file]]의 핵심은 *"에이전트가 스스로 탐색 가능한 정보(구조·패키지·스타일)는 적지 말고, 스스로 알아서는 안 하는 행동 규범만 남겨라"*였다. 그런데 Sanglard의 `agent.md`는 정확히 그 배제 대상이었던 **코드 스타일**(매직 넘버, early return, enum 파라미터)로 채워져 있다. 형태만 보면 모순이다.

하지만 자세히 보면 밀도 원칙은 다른 축에서 지켜지고 있다. 8줄 노트가 "파일 길이"로 밀도를 관리했다면, Sanglard는 **"세션 길이"**로 밀도를 관리한다 — 컨텍스트 희석을 인지하고 기능 단위로 세션을 새로 시작하며, 필요할 때만 재로드를 요청한다. 그리고 규칙 자체도 사전 설계가 아니라 **"실제로 반복해서 지적한 것만 사후에 추가"**하는 방식이라, 8줄 노트의 *"실패 로그를 관찰하며 갱신하는 운영 자산"* 원칙과 생성 메커니즘이 같다. 다른 건 "무엇을 적을지"의 판단 기준(탐색 가능 여부 vs 반복 관찰 여부)이지, 밀도를 지키려는 태도 자체가 아니다.

### 핵심 전이 2: [[2026-07-12-write-code-like-a-human-will-maintain-it]]의 "LLM은 스펀지" 비유가 이 글에서 반대 방향으로 쓰인다

그 노트의 경고는 이랬다. *"LLM은 기존 코드베이스에서 패턴을 학습해 새 코드에서 반복한다."* 즉 저장소에 병합된 나쁜 패턴이 다음 세대 코드로 전염된다는 것 — **암묵적 오염 경로**였다.

Sanglard의 실천은 같은 스펀지 성질을 **명시적으로 역이용**한다. 코드베이스에 나쁜 패턴이 스며들도록 방치하는 대신, 좋은 패턴을 별도 파일에 박아 매 세션 프롬프트에 직접 주입한다. 두 글을 붙이면 "LLM은 스펀지"라는 명제가 좋은 뉴스도 나쁜 뉴스도 될 수 있다는 걸 보여준다 — **오염 벡터를 통제할 수 있는 채널(agent.md)로 옮기면, 스펀지 성질이 자산이 된다.**

### 핵심 전이 3: [[2026-08-20-code-outruns-review]]의 "생성 중" 개입이자, "읽기 재분배"의 실증 사례다

그 노트가 세운 5단계 프레임에서 `agent.md`는 **"생성 중" 단계 — 반복 가능한 검증의 자동화**에 정확히 해당한다. 그리고 그 노트가 말한 *"읽기는 무결성을 증명하는 행위가 아니라 이해 가능성을 확인하는 행위"*라는 재정의의 실증이기도 하다 — Sanglard 본인이 보고하는 효과가 정확히 그것이다. **기계적으로 확인 가능한 스타일 문제가 사라지고 나니, 남은 리뷰 시간이 판단이 필요한 아키텍처·설계로 재분배됐다.**

다만 차이가 하나 있다. `code-outruns-review`의 5단계는 **조직 차원의 프로세스 재설계**(누가 언제 무엇을 본다)였고, `agent.md`는 **개인 한 명이 도구 설정 파일 하나로 같은 효과를 흉내 낸 것**이다. n=1인 이유가 여기 있다 — 팀 단위로 이 규칙들을 합의하고 유지보수하는 비용은 이 글에 없다.

### 핵심 전이 4: [[2026-07-25-context-engineering-rules-claude-5]]와 정반대 방향 조언인데, 대상이 다르다는 게 내 잠정 결론이다

그 노트의 핵심 주장은 *"규칙을 쌓지 말고 인터페이스를 설계하라"*였다 — Claude 5세대에서 시스템 프롬프트를 80% 이상 줄여도 성능이 떨어지지 않았다는 관찰이 근거였다. `agent.md`는 정확히 반대 방향, **규칙을 계속 쌓는** 접근이다. 둘 다 2026년 최신 모델을 대상으로 하는데 결론이 갈린다.

내 잠정 해석은 대상 범주가 다르다는 것이다. 그 노트가 줄이자고 한 건 **시스템 프롬프트**(항상 로드되는, 종종 방어적이고 태스크와 무관한 일반 규칙 다수)였고, Sanglard가 늘리는 건 **프로젝트별 관찰 기반 타깃 규칙**(실제로 반복 관찰된 실패 패턴만, 사전 설계가 아니라 사후 추가)이다. "일반 규칙의 비계 vs 관찰에서 나온 표적 규칙"이라는 구분일 수 있는데 — 근거는 약하다. 두 글 다 벤치마크가 아니라 개인 관찰담이라, 이 구분 자체를 검증할 방법이 지금은 없다는 걸 인정해야 한다.

## 호스피탈리티 / CRS 적용 포인트

- **이 레포 자체가 `CLAUDE.md`를 쓰고 있으니, 가장 직접적인 적용점이다.** CRS 관련 레포의 `CLAUDE.md`·`AGENTS.md`에 "세션마다 반복해서 지적한 리뷰 코멘트"를 사후적으로 규칙화하는 습관을 붙일 수 있다 — 사전에 완벽한 규칙 목록을 설계하려 하지 말고, 실제로 두 번 이상 반복한 지적만 추가.
- **여섯 개 구체 규칙(매직 넘버 금지·early return·enum 파라미터·접근 제한 유지·계층 경계 준수·관련 없는 변경 최소화)은 도메인 무관 일반 원칙**이라 온다 백엔드 코드베이스에도 그대로 옮길 수 있다. 특히 **"관련 없는 변경 최소화"**는 [[2026-08-20-code-outruns-review]]가 CRS 적용점에서 짚은 "정산·요금 계산 diff에서 테스트 변경부터 본다"와 짝을 이룬다 — 리뷰에서 diff 범위 이탈 자체를 먼저 걸러내면 그 뒤 판단이 쉬워진다.
- **컨텍스트 희석 경고는 실무 습관으로 옮길 만하다.** 긴 세션에서 코드 품질이 눈에 띄게 떨어지면 새 세션을 시작하거나 컨텍스트 파일 재로드를 명시적으로 요청하는 걸 팀 관행으로 둘 수 있다.
- **다만 "버그 수정 실패" 부분은 원문을 못 구해 CRS에 어떤 시사점이 있는지 판단을 유보한다.** 정산·예약 상태 전이처럼 실패 비용이 큰 버그 수정에 스타일 규칙 이상의 무언가가 필요하다는 뉘앙스로 짐작되지만, 억지로 결론 내리지 않는다.

## 연관 자료
- [[2026-08-09-eight-line-context-file]] — 밀도 원칙의 대조군: 파일 길이로 밀도를 관리 vs 세션 길이로 밀도를 관리
- [[2026-07-12-write-code-like-a-human-will-maintain-it]] — "LLM은 스펀지" 비유의 반대 방향 활용 — 오염 경로를 통제 채널로 되돌리기
- [[2026-08-20-code-outruns-review]] — 5단계 분산 프레임에서 "생성 중" 자동화 단계에 해당, 읽기 재분배 명제의 실증
- [[2026-07-25-context-engineering-rules-claude-5]] — "규칙을 쌓지 말라"는 정반대 조언과의 긴장 — 대상 범주가 다를 뿐이라는 잠정 해석
- [[2026-04-29-mattpocock-skills-vs-mangolove]] — CONTEXT.md를 "공유 언어 자산"으로 쓰는 인접 사례

## 한 달 뒤 회고
*(2026-09-24 즈음: ①원문 접근이 풀리면 `agent.md` 전문과 "버그 수정 실패" 대목을 실제로 대조 확인했는지 ②이 레포·CRS 레포의 `CLAUDE.md`에 "반복 지적 → 규칙화" 습관을 실제로 붙였는지 ③전이 4의 "일반 규칙 vs 관찰 기반 타깃 규칙" 구분이 다른 사례로 더 검증됐는지 기록.)*
