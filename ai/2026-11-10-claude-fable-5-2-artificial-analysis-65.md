---
title: "Claude Fable 5.2, Artificial Analysis 지능 지수 역대 최고 65점 (GeekNews, 원문 미확인) — 점수는 올랐는데 작업 시간도 3.4배 늘었다"
source_title: "Claude Fable 5.2, Artificial Analysis 지능 지수에서 역대 최고인 65점 기록"
source_url: "https://news.hada.io/topic?id=36910"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36910"
published_at: "확인 불가"
summarized_at: "2026-11-10"
category: "ai"
tags: ["claude-fable", "artificial-analysis", "benchmark", "intelligence-index", "cost-performance", "source-limitation"]
---

# Claude Fable 5.2, Artificial Analysis 지능 지수 역대 최고 65점 (GeekNews)

> 출처: [Claude Fable 5.2, Artificial Analysis 지능 지수에서 역대 최고인 65점 기록](https://news.hada.io/topic?id=36910) (GeekNews) · 정리일 2026-11-10

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 차단되어 원문을 열람하지 못했다. WebSearch로도 "Claude Fable 5.2"·"65점" 조합의 1차 소스는 찾지 못했다(Artificial Analysis 벤치마크 자체는 [[2026-10-29-artificial-analysis-aaii-v5]]에서 이미 "v5=60점대" 계열로 확인된 적이 있어 65점이라는 숫자 자체는 그 계열의 연장선으로는 그럴듯하지만, 이 글 고유의 수치·방법론은 미확인). Slack 발췌는 제목·본문이 일관되게 "지능 점수 대비 처리 시간·비용"을 다루고 있어 교차오염 의심은 낮다.

## 한 줄 요약

**Claude Fable 5.2가 Artificial Analysis Intelligence Index에서 역대 최고 65점을 받았지만, 그 점수를 내는 데 걸리는 시간(44.1분)과 비용(작업당 26.54달러)도 비교 모델 중앙값의 3배를 넘어, "똑똑함"과 "실용성"이 같은 방향으로 가지 않는다는 걸 숫자로 보여준다.**

## 핵심 포인트

- **지능 점수**: Claude Fable 5.2(Max, Default Fallback)가 Artificial Analysis Intelligence Index에서 ***65점***을 기록, 비슷한 가격대 모델 중앙값(40점)을 크게 웃돎.
- **그 대가**: 작업당 처리 시간이 ***44.1분***으로 비교 모델 중앙값(12.9분)의 약 3.4배. Artificial Analysis는 출력 토큰 수와 생성 속도로 이 시간을 역산한다.
- **비용**: Anthropic API 기준 100만 토큰당 입력 8달러·출력 40달러, Intelligence Index 평가의 작업당 평균 비용은 ***26.54달러***. Slack 발췌는 "출력 토큰 2억…"에서 절단돼 총 토큰 소비량 맥락은 확인 못 함.
- **해석의 갈림길**: 이 숫자만으로는 "더 어려운 문제를 더 깊이 생각해서 느려졌다"와 "추론 연쇄가 비효율적으로 길어졌다"를 구분할 수 없다 — [[2026-11-08-maxxbench-deepswe-benchmark-gaming]]이 짚었듯 벤치마크 1등 점수는 그 점수를 만드는 과정의 질을 보증하지 않는다.

## 인상 깊은 문장

> "높은 지능 점수와 달리 작업당 처리 시간은 44.1분으로, 비교 모델 중앙값 12.9분의 약 3.4배였음." (Slack 발췌)

## 댓글

GeekNews(hada.io) 경유 글이나, 이 세션에서 news.hada.io가 차단돼 hada 댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. Artificial Analysis는 자체 평가 지표를 운영하는 업체라 "자사 지표에서 자사 모델이 1위"라는 구조적 이해관계가 있을 수 있고, Anthropic이 직접 발표한 수치가 아니라 3자 벤치마크라는 점은 신뢰도를 높이지만, 지표 설계(가중치·태스크 구성)가 공개돼 있는지는 이 글만으로 알 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "지능 점수 상승 = 비용·시간 상승"이 이번에도 반복된다

[[2026-10-29-artificial-analysis-aaii-v5]]는 AAII v5에서 비공개 모델과 오픈웨이트 격차가 v4.3의 3점에서 12점으로 벌어졌다고 기록했다. 이 글은 그 "격차"의 다른 얼굴이다 — ***점수가 오를수록 그 점수를 받는 데 드는 시간·비용도 같이 오른다.*** 두 노트를 합치면, Intelligence Index 1위를 노리는 모델은 점수와 함께 "느리고 비싸다"는 트레이드오프도 같이 가져간다는 패턴이 두 번째로 확인된다.

### 핵심 전이 2 — 벤치마크 1위도 "뭘로 만든 1위인지"를 의심해야 한다

[[2026-11-08-maxxbench-deepswe-benchmark-gaming]]은 요구사항이 조금만 바뀌어도(참조 패치 3.5%) 벤치마크 격차가 20.9%p→48.3%p로 벌어진 사례를 보여줬다. 이 글의 "65점"도 같은 의심을 받아야 한다 — 44.1분·26.54달러라는 비용 구조를 모르고 "65점짜리 모델"이라고만 쓰면, 실제 업무에 투입했을 때 그 비용·시간을 감당할 수 있는지는 전혀 알 수 없다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능.** CRS에 LLM을 투입할 때 "지능 지수가 높은 모델을 쓴다"가 아니라 "이 작업에 필요한 지능 수준 대비 시간·비용이 맞는 모델을 쓴다"는 기준으로 모델을 골라야 한다는 원칙만 전이 가능하다. 예약 변경 같은 단순 작업에 44.1분·26.54달러짜리 모델을 쓰는 건 과잉이고, 복잡한 분쟁 조정 요약처럼 깊은 추론이 필요한 작업에만 고비용 모델을 쓰는 라우팅 전략이 참고할 만하다.

## 연관 자료

- [[2026-10-29-artificial-analysis-aaii-v5]] — 같은 Artificial Analysis 지표 계열의 직전 버전, 비공개 모델 선두 격차 확대 기록
- [[2026-11-08-maxxbench-deepswe-benchmark-gaming]] — 벤치마크 1위 점수가 조건이 바뀌면 흔들린다는 반증 사례, 이 글의 "65점"도 같은 잣대로 봐야 함
- [[2026-11-10-claude-fable-5-2-mythos-5-2-release]] — 같은 날 발표된 Fable 5.2 공식 출시 글(속도·가격 변화 상세)

## 한 달 뒤 회고

- 2026-12-10 즈음 점검: news.hada.io 접속이 풀리면 원문에서 Artificial Analysis 평가 태스크 구성과 65점의 세부 산출 방식을 확인하고, 실제 Claude Code 사용 체감(응답 속도)과 이 44.1분 수치가 어느 상황을 가리키는지 대조한다.
