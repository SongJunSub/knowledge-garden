---
title: "ClickHouse가 Observability 전쟁에서 앞서가는 이유 (matduggan.com) — '10~14배 압축률로 Datadog 대비 1/30 비용', 규모가 커질수록 구조 차이가 벌어진다"
source_title: "ClickHouse is Winning the Observability Wars"
source_url: "https://matduggan.com/clickhouse-is-winning-the-observability-wars/"
source_name: "matduggan.com"
referrer_url: "https://news.hada.io/topic?id=31101"
summarized_at: "2026-07-03"
category: "backend"
tags: ["clickhouse", "observability", "logging", "database", "cost-optimization", "elasticsearch", "datadog", "columnar-storage", "infrastructure-scaling"]
---

# ClickHouse가 Observability 전쟁에서 앞서가는 이유 (matduggan.com) — '10~14배 압축률로 Datadog 대비 1/30 비용', 규모가 커질수록 구조 차이가 벌어진다

> 출처: [ClickHouse is Winning the Observability Wars](https://matduggan.com/clickhouse-is-winning-the-observability-wars/) (matduggan.com) · 정리일 2026-07-03

## 한 줄 요약

**규모가 커질수록 로그는 Observability에서 가장 다루기 어려운 데이터가 된다. 원래 클릭스트림 분석용이던 ClickHouse가 컬럼 지향 저장·뛰어난 압축률(10~14배, Elasticsearch는 2~3배)·SQL 기반이라는 특성으로 로그 관리에 자연스럽게 맞아떨어진다. 10TB/일 규모에서 ClickHouse는 월 $18~28K인 반면 Datadog은 월 $1M 이상 가능하다.**

## 핵심 포인트

- **문제** — 작은 시스템에서 `grep`으로 충분하던 경험과 달리, 대량·비정형·예측 불가 쿼리가 겹치면서 로그 관리가 급격히 어려워짐.
- **ClickHouse의 강점** — 컬럼 지향 저장(필요한 컬럼만 읽어 효율적) / **압축률 10~14x** (Elasticsearch 2~3x 대비 압도적) / SQL 기반(새 쿼리 언어 학습 불필요).
- **규모별 비용 비교**:
  | 규모 | ClickHouse | Datadog |
  |------|-----------|---------|
  | 1TB/일 | 월 $1.5~2.5K | 월 $45~75K |
  | 5TB/일 | 월 $7~11K | 월 $180~350K |
  | 10TB/일 | 월 $18~28K | 월 $1M 이상 가능 |
- **구조적 차이** — 5TB/일부터 구조 차이 발생: ClickHouse는 "샤드 추가"로 확장, 타 솔루션은 복잡도 급증. 10TB/일부터 운영 모델 갈라짐: ClickHouse는 기본 구조 유지, 타 솔루션은 전문가 팀 필요.
- **선택 기준** — "2년 뒤 데이터가 5배, 팀이 2배가 되고 초기 설계자가 떠난 뒤에도 같은 형태를 유지"할지 고려. ClickHouse는 초기 스키마 설계 비용이 있지만 장기 운영 모델이 안정적.

## 인상 깊은 문장

> "실제 Observability 데이터에서 10–14x 압축률을 보여 Elasticsearch의 2–3x와 대비된다."

> "2년 뒤 데이터가 5배, 팀이 2배가 되고 초기 설계자가 떠난 뒤에도 같은 형태를 유지할지 고려해야 한다."

## 댓글 — Lobste.rs 5개 스레드 전수 확인 (GN⁺ 큐레이션)

- **실전 경험**: "2019년 스타트업에서 ClickHouse를 봤는데 강한 인상을 받음" — SQL 채택의 장점 강조.
- **확장성 찬양**: "코어만 더 넣으면 되는 방식" — 단, 시각화 개선 필요성 지적.
- **"저노력 LLM 문체" 비판**: 원문 작성 방식이 기계적이고 엄밀함이 부족하다는 지적 — 흥미롭게도 이번 주 반복되는 "AI 생성 텍스트 의심" 패턴.
- **Honeycomb과 비교 질문**: ClickHouse와의 개념적 겹침에 대한 궁금증.
- **단어 사용 비판**: "찾아 바꾸기로 글이 훨씬 좋아짐" — 문체에 대한 세부 지적.

## 내 생각 · 적용점

### 핵심 전이 1 — CRS 로그·모니터링 인프라 선택에 직접 적용 가능한 비용 벤치마크

CRS가 성장하며 로그량이 늘어날 때, 이 글의 비용 비교표는 구체적 의사결결 기준이 된다. **"우리 로그량이 1TB/일을 넘는가"를 기준으로 ClickHouse 도입을 검토할 시점을 판단할 수 있다.** [[2026-06-30-postgresql-19-beta-deep-dive]]에서 다룬 컬럼 지향 스토리지 논의와 연결 — 시계열·로그성 데이터는 컬럼 지향이 구조적으로 유리하다는 패턴이 반복 확인된다.

### 핵심 전이 2 — "2년 뒤를 고려하라"는 기준이 [[2026-06-30-yagni-hidden-costs]]와 대조적으로 흥미롭다

YAGNI는 "지금 필요 없는 것을 미리 만들지 말라"고 하지만, 이 글은 "인프라 선택은 2년 뒘 규모를 고려해야 한다"고 말한다. **모순이 아니라 층위가 다르다 — 기능(비즈니스 로직)은 YAGNI로 최소화하되, 인프라(DB·로그 시스템) 선택은 장기 확장성을 미리 고려해야 한다.** CRS 인프라 결정에서 이 두 원칙을 구분해서 적용하는 것이 핵심.

### 핵심 전이 3 — "초기 설계자가 떠난 뒤에도 유지되는가"가 실무적 인프라 선택 기준

이 기준은 [[2026-06-29-revised-rules-engineering-leadership]]의 "지속 팀의 도메인 컨텍스트"와 정확히 반대 상황을 대비한 것이다. **인프라 자체가 특정 개인의 지식에 의존하지 않고 구조적으로 유지 가능해야 한다는 것 — CRS 인프라 결정 시 "이 사람이 퇴사해도 이 시스템이 돌아가는가"를 명시적으로 물어야 한다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-30-postgresql-19-beta-deep-dive]] — *컬럼 지향 스토리지가 시계열·로그 데이터에 구조적으로 유리한 패턴 반복*
- [[2026-06-30-yagni-hidden-costs]] — *기능은 YAGNI로 최소화, 인프라는 장기 확장성 고려 — 다른 층위의 원칙*
- [[2026-06-29-revised-rules-engineering-leadership]] — *"개인 의존 없이 유지되는 시스템"이라는 대조적 기준*

## 한 달 뒤 회고
*(2026-08-03 즈음 — CRS 로그량이 어느 수준인지 확인했는지, ClickHouse 도입을 실제로 검토했는지 기록.)*
