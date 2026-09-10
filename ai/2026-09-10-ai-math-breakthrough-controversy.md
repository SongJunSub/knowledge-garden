---
title: "AI의 수학적 돌파구는 어떻게 논란을 촉발했나 (Science/AAAS) — 트위터발 소문 하나가 1만 에이전트 88시간 총력전으로 번진 경위"
source_title: "How an AI math breakthrough ignited a controversy"
source_url: "https://www.science.org/content/article/how-ai-math-breakthrough-ignited-controversy"
source_name: "Science(AAAS) (Celina Zhao·Adrian Cho 추정), GeekNews(id=33440) 경유"
referrer_url: "https://news.hada.io/topic?id=33440"
published_at: "2026-09-08"
summarized_at: "2026-09-10"
category: "ai"
tags: ["openai", "navier-stokes", "research-ethics", "ai-for-math", "millennium-prize", "media-synthesis", "terence-tao"]
---

# AI의 수학적 돌파구는 어떻게 논란을 촉발했나

> 출처: [How an AI math breakthrough ignited a controversy](https://www.science.org/content/article/how-ai-math-breakthrough-ignited-controversy) (Science/AAAS) · GeekNews(id=33440) 경유 · 정리일 2026-09-10

> **출처 한계**: `science.org`는 이번 세션 egress 차단으로 WebFetch가 거부됐다(EGRESS_BLOCKED). 저자명(Celina Zhao·Adrian Cho)과 아래 인용문들은 WebSearch가 반환한 기사 스니펫·합성 요약으로만 확인했다 — 원문 전체 문맥은 보지 못했으므로 저자 표기는 "추정"으로 남긴다. GeekNews id=33440의 스페인어 미러(`es.news.hada.io/topic?id=33440`) 제목이 이 기사와 정확히 일치해 매칭 자체는 확실하다. hada 원문·댓글 수·HN 논조는 확인 불가(관련 HN 스레드 id로 추정되는 항목도 재조회 시 "찾을 수 없음"으로 나와 확정하지 못했다).

> **중요 — 같은 사건의 재정리 아님, 종합/후속 기사**: 이 가든에는 바로 어제(2026-09-09) 같은 나비에-스토크스 사건을 다룬 노트가 이미 3개 있다 — [[2026-09-09-openai-navier-stokes-proof]](발표 본편), [[2026-09-09-navier-stokes-proof-controversy]](Buckmaster 성명), [[2026-09-09-tao-ai-mining-unsolved-math-problems]](Tao의 구조적 비판). 이 기사는 같은 사건을 다루지만, "논란이 어떻게 촉발됐는가"라는 서사 축으로 세 노트를 하나로 엮으면서 아래 세 가지를 새로 보탠다: ① OpenAI가 착수한 구체적 계기(트위터 루머), ② 정량화된 비용(회사 공식 발언 + 외부 추산), ③ 앞선 세 노트에 없던 제3의 목소리(컬럼비아대 수학자 Michael Harris의 비판). 겹치는 배경 설명은 위 세 노트로 갈음하고, 이 노트는 새로 확인된 내용 위주로 짧게 정리한다.

## 한 줄 요약

**이 기사는 OpenAI의 나비에-스토크스 발표(9/8)를 다시 요약하기보다, "왜 하필 이 시점에 1만 에이전트·88시간·수백만 달러가 투입됐는가"라는 촉발 경위에 초점을 맞춘 종합기사다. 트위터에 돈 "Anthropic이 밀레니엄 문제 2개를 풀었다"는 확인 안 된 소문이 OpenAI를 자극한 직접 계기였고, OpenAI 최고연구책임자 Mark Chen은 비용이 "명백히 수백만 달러대"이며 이전 수학 성과 대비 약 1,000배라고 공식 확인했다. 여기에 컬럼비아대 수학자 Michael Harris가 "이런 홍보가 의사결정권자에게 인간 수학자는 필요 없다고, 젊은이에게 수학에 미래가 없다고 설득한다"며 비판을 더한다.**

## 핵심 포인트

- **촉발 계기(신규 확인)** — OpenAI의 착수 시점(9월 1일)은 트위터에 떠돈, Anthropic 모델이 밀레니엄 상금 문제 "2개"를 풀었다는 확인되지 않은 소문이 계기였다고 이 기사는 전한다. OpenAI 측은 "우리 것도 할 수 있는지 궁금했다(We were curious if ours could do it too)"는 취지로 반응한 것으로 인용된다.
- **비용 공식 확인(신규)** — OpenAI 최고연구책임자(Chief Research Officer) Mark Chen이 이번 나비에-스토크스 시도의 컴퓨팅 비용을 ***"명백히 수백만 달러대(emphatically in the millions of dollars)"***라고 밝혔고, Sébastien Bubeck은 이것이 OpenAI의 이전 수학 성과 대비 약 1,000배 규모라고 덧붙인 것으로 보도된다.
- **외부 검증 추산(신규)** — 미시간대 Karthik Duraisamy는 OpenAI 도구를 소매가로 계산하면 약 600만 달러, OpenAI가 이미 보유한 모델·인프라 기준 내부 추론 비용으로는 약 100만 달러 규모로 추산했다고 인용된다 — 회사 자체 발언과 외부 추산이 자릿수는 대체로 맞아떨어진다.
- **"AI 슬롭" 번역 과정(신규 세부)** — Buckmaster·Alpöge 쪽 결과에 대해, AI가 만든 원 증명 초안은 ***"AI 슬롭(AI slop)"*** 수준이었고 이를 다른 수학자들이 읽고 판단할 수 있는 형태로 사람이 직접 번역·정리하는 과정이 필요했다는 세부가 이 기사에서 확인된다 — 어제 노트들에는 없던 디테일이다.
- **Tao의 "봉인된 블랙박스" 프레이밍(재확인+심화)** — [[2026-09-09-tao-ai-mining-unsolved-math-problems]]에서 다룬 "비재생적 채굴" 경고와 같은 맥락에서, Tao는 해법이 봉인된 블랙박스로 도착하고 그 경로가 AI 기업 내부에 숨겨진 채로 남으면, 그 "풀림" 자체가 향후 진전의 원천으로서 문제 자체를 오염시킬 수 있다는 취지로 다시 인용된다.
- **새 비판 목소리 — Michael Harris(컬럼비아대, 신규)** — 앞선 세 노트에 등장하지 않았던 인물로, Harris는 이메일 인터뷰에서 ***"이런 홍보는 의사결정권자들에게 인간 수학자가 필요 없다고 설득하고, 젊은이들에게 수학에 대한 열정에 미래가 없다고 설득한다"***, ***"업계가 수백만 달러를 계속 수학 문제 푸는 데 쓸 것이라고는 기대하지 않는다, 거기엔 이윤이 없으니까"***라고 비판한 것으로 인용된다 — 상업적 지속가능성에 대한 냉소가 핵심이다.
- **검증 상태는 그대로** — Clay수학연구소가 이 문제를 여전히 미해결로 분류하고 있다는 사실(=[[2026-09-09-openai-navier-stokes-proof]]에서 이미 다룬 내용)은 이 기사에서도 재확인되며, "아직 아무도 완결된 증명 전체를 독립적으로 검토하지 못했다"는 취지의 언급도 함께 확인된다.

## 인상 깊은 문장

> "We were curious if ours could do it too." (OpenAI 측 반응, WebSearch로 확인된 매체 재인용 — 원문 전체 맥락은 미확인)

> "[This kind of promotion] convinces decision makers that human mathematicians are obsolete, and it convinces young people that their passion for mathematics has no future." — Michael Harris (컬럼비아대), Science에 보낸 이메일 인용 (WebSearch로 확인된 재인용)

> "I certainly don't expect the industry to continue to spend millions of dollars to solve problems in mathematics, because there is no profit in it." — Michael Harris (WebSearch로 확인된 재인용)

## 댓글

hada(GeekNews) 댓글 수·논조는 이번 세션 접근 차단으로 확인 불가하다. HN에도 같은 제목의 별도 스레드가 있는 것으로 검색됐으나 재조회 시 해당 id가 "찾을 수 없음"으로 나와 포인트·댓글 규모를 확정하지 못했다. 정직하게 밝히면: 이 정리의 절반은 어제 이미 이 가든에 세 편으로 정리된 사건의 재탕이다. 다만 위 "촉발 계기·비용·Harris 비판" 세 가지는 새로 확인된 내용이라 별도 노트로 남길 값어치가 있다고 판단했다 — 억지로 새 글처럼 부풀리지 않고, 겹치는 부분은 기존 세 노트로 링크만 걸었다.

## 내 생각 · 적용점

### 핵심 전이 1 — "소문만으로 수백만 달러가 투입됐다"는 사실이 Tao의 경고를 그대로 실증한다

[[2026-09-09-tao-ai-mining-unsolved-math-problems]]에서 정리한 "다른 그룹이 작업 중이라는 소문만으로 거대한 AI 연산이 투입될 수 있다"는 우려가, 이 기사에서는 추상적 경고가 아니라 "트위터 루머 → 9월 1일 착수 → 88시간·1만 에이전트·수백만 달러"라는 구체적 타임라인으로 확인된다. 확인되지 않은 소문 하나가 실제로 자릿수가 큰 자원 투입의 방아쇠가 됐다는 사실은, 정보의 진위보다 "누가 먼저 움직였다는 인상"이 자원 배분을 좌우할 수 있다는 걸 보여준다.

### 핵심 전이 2 — 회사 발언과 외부 추산이 맞아떨어질 때, 오히려 "발표 프레이밍" 자체를 더 의심해야 한다

Mark Chen의 "수백만 달러대"라는 공식 발언과 Karthik Duraisamy의 외부 추산(약 100만~600만 달러)이 자릿수로는 일치한다 — 즉 비용 수치 자체는 신빙성이 있어 보인다. 그런데 [[2026-09-09-openai-navier-stokes-proof]]에서 이미 짚었듯 문제는 숫자의 진위가 아니라 "막대한 자원을 썼다는 사실"과 "그래서 문제가 풀렸다고 인정할지"가 별개 질문이라는 점이다 — 비용이 검증됐다고 성과까지 자동으로 검증되는 건 아니다.

### 핵심 전이 3 — Michael Harris의 비판은 "채굴" 논쟁에 상업적 지속가능성이라는 새 축을 더한다

Tao의 "비재생 자원 채굴" 프레임이 학술 생태계 관점의 비판이라면, Harris의 "이윤 없으면 계속 안 할 것"이라는 냉소는 상업적 유인이 사라지면 이런 종류의 대규모 투입 자체가 지속되지 않을 거라는 다른 각도의 회의론이다. 두 비판은 서로 다른 이유로 같은 결론("이 열풍이 오래가지 않을 수 있다")에 도달한다는 점에서 나란히 읽을 가치가 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS 팀이 편미분방정식 증명이나 학계 우선권 분쟁을 다룰 일은 없다. 다만 어제 노트에서 이미 짚은 원칙을 이 기사가 다시 확인해줄 뿐이다: 자체 발표 지표(비용·에이전트 수·소요 시간)와 제3자가 인정하는 완료 기준(Clay연구소의 "미해결" 유지)을 분리해서 보는 습관 — 사내에서 "자동화 비용 얼마를 썼다"는 지표를 볼 때도, 그 비용이 실제로 검증된 성과와 등치되는지는 별도로 확인해야 한다는 정도로 짧게 남긴다.

## 연관 자료

- [[2026-09-09-openai-navier-stokes-proof]] — 이 기사가 다시 서술하는 발표 본편, Clay연구소 미해결 판정의 원출처
- [[2026-09-09-navier-stokes-proof-controversy]] — Buckmaster 성명 원편, 이 기사의 "AI 슬롭" 번역 세부가 보충하는 배경
- [[2026-09-09-tao-ai-mining-unsolved-math-problems]] — 이 기사의 "소문발 자원 투입" 타임라인이 실증하는 "비재생적 채굴" 경고 원편

## 한 달 뒤 회고

*(2026-10-10 즈음 — Clay연구소의 정식 판정이 나왔는지, Michael Harris류의 상업적 지속가능성 비판이 실제로 업계 투자 축소로 이어졌는지, science.org 접근이 가능해져 저자명·인용 전체 맥락을 원문으로 재확인할 수 있는지 점검.)*
