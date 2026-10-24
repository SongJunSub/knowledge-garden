---
title: "LLM이 정형 검증의 규모를 바꾼다 (Anthropic/Theorem) — 퍼징 239개 진입점을 '통과했다'가 아니라 '64MB 미만에서는 절대 안 터진다'로 증명했다"
source_title: "Anthropic, Theorem use Claude to verify 123 OSS libraries"
source_url: "https://aiweekly.co/alerts/anthropic-theorem-use-claude-to-verify-123-oss-libraries"
source_name: "AI Weekly 등 복수 2차 매체, WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=35855"
published_at: "2026-10-22"
summarized_at: "2026-10-24"
category: "engineering"
tags: ["formal-verification", "fuzzing", "claude", "oss-fuzz", "rocq", "risc-v"]
---

# LLM이 정형 검증의 규모를 바꾼다 (Anthropic/Theorem) — 퍼징 239개 진입점을 '통과했다'가 아니라 '64MB 미만에서는 절대 안 터진다'로 증명했다

> 출처: [Anthropic, Theorem use Claude to verify 123 OSS libraries](https://aiweekly.co/alerts/anthropic-theorem-use-claude-to-verify-123-oss-libraries) (AI Weekly, 2026-10-22 보도) · GeekNews(id=35855) 경유 · 정리일 2026-10-24
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 WebFetch 실패. Anthropic/Theorem 원문 블로그(anthropic.com 추정)도 검색으로 URL을 특정하지 못해 직접 접근은 못 했다. 대신 WebSearch로 복수의 독립 2차 매체(aiweekly.co, cellcog.ai, mallory.ai, alphasignal.ai, ai-tldr.dev, 1023jack.com, explainx.ai, bestcadpapers.com) 요약이 수치(123개 라이브러리, 239개 진입점, 64MB, OSS-Fuzz, Rocq 증명 체커, RISC-V 컴파일 코드, CVE-2026-56132 재발견)에서 서로 일치하는 걸 확인해 교차확인됨으로 분류했다. 다만 모두 2차 요약이라 원문의 정확한 표현·전체 방법론은 미확인이다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**Anthropic과 스타트업 Theorem이 Claude를 써서 Google OSS-Fuzz의 오픈소스 라이브러리 123개, 퍼징 진입점 239개에 대해 "64MB 미만의 모든 입력에서 (명시된 실행 조건상) 충돌하지 않는다"는 기계 검증 증명을 만들었고, 그 과정에서 CVE 재발견을 포함한 수백 개의 버그를 찾아냈다.**

## 핵심 포인트

- **퍼징과의 결정적 차이 — "통과"가 아니라 "증명".** 무작위 입력을 대량 실행해 "이번엔 안 터졌다"를 쌓는 퍼징과 달리, ***64MB 미만의 모든 입력에서 크래시가 없음을 수학적으로 증명***한다. 증명 범위는 단일 스레드 RISC-V 바이너리 등 명시된 실행 조건에 한정된다 — "라이브러리 전체가 버그 없음"을 뜻하지는 않는다는 점을 2차 매체들도 공통으로 강조한다.
- **대상과 도구.** Google OSS-Fuzz 프로젝트의 라이브러리 123개, 퍼징 진입점 239개가 대상이고, 증명 체커는 Rocq, 증명 대상은 RISC-V로 컴파일된 코드다. 증명 코드량이 약 1억 8천만 줄, 진입점 하나당 평균 약 60만 줄이라는 수치도 나온다.
- **증명을 시도하다가 버그를 먼저 찾아낸다.** 큰 입력이나 드문 호출 순서가 필요해 퍼징이 놓치기 쉬운 메모리 오류(예: 64MB 입력이 있어야 드러나는 이미지 디코더의 범위 밖 읽기)뿐 아니라, ***크래시를 일으키지 않는 논리 오류***까지 찾아냈다.
- **CVE 재발견 — libexpat의 카운터 언더플로.** 압축 해제기 내부 카운터 언더플로가 범위 밖 쓰기로 이어지는 결함으로, 약 20MB 입력에서만 드러난다. 이는 CVE-2026-56132로 이미 알려진 결함과 같은 것으로 보인다는 보도가 있다 — 즉 이미 존재가 알려졌던 결함을 정형 검증 과정이 독립적으로 다시 찾아낸 사례다.
- **오래 잠복한 로직 버그도 패치.** 크래시로 드러나지 않아 발견이 어려웠던, 수년간 잠복한 로직 버그를 발견해 수정했다는 보도도 있다.
- **공개 여부.** 증명·시맨틱스·Claude 스킬을 재사용 가능하도록 공개했다는 보도가 있으나 이번 세션에서는 1차 자료로 직접 확인하지 못했다.

## 인상 깊은 문장

> "Claude produced machine-checked proofs for 239 fuzz-test entry points across 123 open-source libraries... these entry points don't crash on inputs under 64 MB" (WebSearch 2차 요약 인용, 원문 직접 인용은 egress 차단으로 못 함)

## 댓글

**hada 댓글 수 확인 불가.** HN/Lobsters 큐레이션 여부도 미확인. 정직하게 짚을 점: ①이 보도는 전부 Anthropic/Theorem 자신의 발표를 2차 매체가 받아 쓴 것이라 벤더의 성과 홍보라는 이해관계가 있다 — "증명했다"는 표현이 실제로 얼마나 광범위한 보장인지(단일 스레드·특정 실행 환경 한정)는 기사마다 강조 정도가 다르다. ②Theorem은 최근 $6M 투자를 받은 스타트업으로, 이 협업 결과 자체가 투자 유치·마케팅 자산일 가능성도 감안해야 한다. ③원문을 직접 못 봐서 "123개 라이브러리를 어떤 기준으로 골랐는지", "239개 진입점 중 몇 개가 완전히 증명됐고 몇 개가 실패했는지"는 확인하지 못했다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-08-10-sqlite-reliability-lessons-hipp]]에서 Hipp 본인이 인정한 한계("MCDC만으로는 퍼징도, 의미론적 오류도, AI가 생성한 병적인 입력도 다 못 잡는다")가 이 글에서 정확히 메워지는 다음 단계로 읽힌다.** SQLite는 100% MCDC + 의도적 오류 주입이라는, 인간이 짤 수 있는 가장 철저한 테스트 체계를 보여줬지만 그 자신도 "이것만으로는 안 된다"고 했다. Anthropic/Theorem의 작업은 그 틈 — 테스트가 아니라 수학적 증명으로 "이 조건에서는 절대 안 터진다"를 보장하는 — 을 LLM의 노동력으로 채우려는 시도다. 다만 증명 범위가 좁게 명시된다는 점에서, SQLite식 전체 커버리지 테스트와 정형 검증은 상호 대체재가 아니라 보완재로 봐야 한다.

**핵심 전이 2 — [[2026-09-10-coding-agents-test-verification-techniques]]가 짚은 "코딩 에이전트가 자기가 만든 테스트를 통과해도 실제 버그를 못 잡는다"는 문제와, 이 정형 검증 사례는 정반대의 보증 강도를 제공한다는 대조가 선명하다.** 그 노트의 핵심은 "테스트 통과"라는 신호 자체가 약하다는 것이었는데, 이 글의 "증명"은 애초에 통과/실패라는 확률적 신호가 아니라 ***명시된 조건 안에서의 수학적 보장***이다 — 같은 LLM(Claude)이 한쪽에서는 신뢰하기 어려운 테스트를 만들고 다른 쪽에서는 신뢰할 수 있는 증명을 만든다는 게, 결국 "에이전트에게 무엇을 시키느냐"의 설계 문제라는 걸 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — CRS 도메인에 정형 검증을 직접 쓸 일은 거의 없다.**

CRS/B2B 호스피탈리티 소프트웨어에서 Rocq 수준의 정형 검증을 도입할 상황은 당장 없다. 다만 전이 가능한 원칙은 남는다 — ***"테스트를 통과했다"와 "이 조건에서는 절대 틀리지 않는다"는 전혀 다른 수준의 보증이라는 구분을 결제·예약 같은 고위험 경로의 검증 기준에 적용할 수 있다.*** 예를 들어 예약 중복 방지, 재고 reservation 로직처럼 "절대 틀리면 안 되는" 코드 경로는, 전체를 정형 검증하지 않더라도 "이 조건에서는 이 상태가 불가능하다"는 명시적 불변조건을 코드에 assertion으로 박아두는 식으로 같은 사고방식을 빌려올 수 있다.

## 연관 자료

- [[2026-08-10-sqlite-reliability-lessons-hipp]] — Hipp 본인이 인정한 전통적 테스트(MCDC)의 한계, 이 글의 정형 검증이 메우려는 틈과 직접 연결.
- [[2026-09-10-coding-agents-test-verification-techniques]] — "테스트 통과가 실제 버그 없음을 뜻하지 않는다"는 반대 사례, 증명이 제공하는 더 강한 보증과 대조.
- [[2026-10-23-llm-confidence-score-unreliable]] — LLM의 자기 확신 점수는 믿을 수 없다는 노트와, 이 글의 "확신 대신 수학적 증명"이라는 접근이 같은 문제(LLM 출력을 어떻게 신뢰할 것인가)에 대한 다른 해법이라는 점에서 거울상.

## 한 달 뒤 회고

2026-11-24 즈음, Anthropic/Theorem 원문 블로그 URL을 특정해 직접 확인. ①123개 라이브러리 선정 기준 ②239개 진입점 중 완전 증명 성공률 ③증명·Claude 스킬 공개 여부와 재현 가능성을 점검.
