---
title: "Pinterest 임베딩 검색 플랫폼의 진화 (Pinterest Engineering) — HNSW를 버리고 PQ 양자화를 얹은 SPANN으로, DiskANN보다 QPS 3배·지연 1/3을 얻었다"
source_title: "Evolving Pinterest's Embedding Retrieval Platform"
source_url: "https://medium.com/pinterest-engineering/evolving-pinterests-embedding-retrieval-platform-aede4e831e01"
source_name: "Pinterest Engineering Blog (Medium)"
referrer_url: "https://news.hada.io/topic?id=33719"
published_at: "2026-09 (Medium 게시월 확인, 정확한 일자 미상)"
summarized_at: "2026-09-15"
category: "backend"
tags: ["embedding-retrieval", "ann-search", "vector-quantization", "spann", "diskann", "pinterest", "cost-optimization", "colbert"]
---

# Pinterest 임베딩 검색 플랫폼의 진화 (Pinterest Engineering)

> 출처: [Evolving Pinterest's Embedding Retrieval Platform](https://medium.com/pinterest-engineering/evolving-pinterests-embedding-retrieval-platform-aede4e831e01) (Pinterest Engineering Blog, Medium) · GeekNews(id=33719) 경유 · 정리일 2026-09-15

> **출처 한계**: `medium.com`과 `news.hada.io` 모두 이 세션 egress 프록시에서 차단돼 WebFetch로 원문을 직접 열지 못했다. 대신 WebSearch로 원문 제목·URL을 확인했고("Pinterest Engineering Blog, Sep 2026"), 핵심 수치(양자화로 메모리 50%+·비용 20~30% 절감, SPANN+PQ가 DiskANN 대비 QPS 3배·지연 1/3, recall 5%p 하락, HNSW 대비 CPU 40%+ 절감)를 3회의 독립적 검색에서 반복 확인해 신뢰도는 높다고 판단했다. 다만 이 수치들이 정확히 어떤 인덱스 규모·어떤 쿼리 분포 조건에서 측정된 것인지 등 원문의 세부 실험 설계는 대조하지 못했다.

## 한 줄 요약
**Pinterest의 자체 임베딩 검색 플랫폼 Manas는 80개 이상 클러스터에서 수십억 개 임베딩을 서빙하며 Home Feed·검색·연관 핀·광고·알림 전체를 떠받치는데, 벡터 양자화(SQ/PQ)로 메모리와 서빙 비용을 크게 줄이고 RAM 상주 HNSW 대신 SSD 기반 SPANN(+PQ 변형)으로 옮겨 DiskANN보다 3배 높은 QPS와 1/3의 지연시간을 얻었다. 다음 단계로는 단일 벡터(two-tower) 패러다임을 넘어 ColBERT류 후기 상호작용(late-interaction) 멀티 임베딩 검색을 시범 운영 중이다.**

## 핵심 포인트
- **Manas의 규모** — ***80개 이상 클러스터***에서 수십억 개 임베딩을 서빙하며 Home Feed·Search·Related Pins·Ads·Notifications 등 Pinterest의 거의 모든 주요 제품 표면을 지탱한다. 여러 근사 최근접 이웃(ANN) 알고리즘, 토큰 검색과 임베딩 검색을 섞은 하이브리드 쿼리, 새 콘텐츠가 수 초 안에 검색 가능해지는 실시간 업데이트를 지원한다.
- **양자화로 메모리·비용 절감** — 스칼라 양자화(SQ)와 곱 양자화(PQ)를 적용해 ***인덱스 메모리를 50% 이상, 서빙 비용을 20~30%*** 줄였다.
- **RAM 상주 HNSW에서 SSD 기반 SPANN으로** — 1억 개 임베딩 코퍼스로 DiskANN과 SPANN을 벤치마크한 뒤, ***SPANN이 Manas 용례에 더 적합***하다고 판단했다. 원 SPANN 논문과 달리 ***디스크에 있는 임베딩 저장소에는 PQ 양자화를 적용하되 중심점(centroid)은 풀 정밀도로 유지***하는 변형(SPANN+PQ)을 적용, 순정 SPANN보다 4.5배 빠르고 DiskANN보다 ***QPS 3배 이상·지연시간 1/3***을 달성했다(recall은 약 5%p 하락하는 트레이드오프).
- **HNSW 대비 CPU 40% 이상 절감** — 50억 개 임베딩 규모 인덱스에서 기존 HNSW 대비 CPU 시간을 40% 이상 아꼈다고 보고된다.
- **다음 단계는 멀티 임베딩 검색** — 단일 벡터로 사용자·아이템을 표현하는 two-tower 패러다임을 넘어, ***ColBERT류 후기 상호작용(late-interaction) 멀티 임베딩 검색***을 시범 운영 중이며, 향후 SPFresh(실시간 인덱스 갱신), GPU 기반 검색 시스템(SilverTorch, TIGER), 멀티 임베딩 스코어링의 전면 확대를 계획하고 있다.

## 인상 깊은 문장
> "SPANN+PQ achieves over 3x the QPS of DiskANN with 1/3 the latency, with a slight 5% recall drop."
> (검색 스니펫에서 재구성한 인용 — 원문 문장 그대로인지 단어 단위까지는 대조하지 못했다.)

## 댓글
`news.hada.io`·`medium.com` 접속이 모두 차단돼 hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다. 다만 Pinterest Engineering Blog는 이 가든에서도 반복적으로 등장하는 검증된 1차 기술 출처이고([[2026-08-31-booking-com-weaviate-vector-db-migration]] 등 업계 다른 사례들과 수치 자릿수·트레이드오프 서술이 정합적이라 신뢰도는 준수하다고 판단한다. 다만 벤더 성격은 없어도 ***자사 성공 사례를 소개하는 글***이라는 점에서, 마이그레이션 과정의 실패한 시도나 recall 5%p 하락이 실제 제품 품질에 미친 영향(예: 검색 만족도 저하 여부)은 다뤄지지 않았을 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — Booking.com과 같은 결론("범용 엔진 대신 전용 벡터 인덱스"), 다른 축("RAM HNSW"가 아니라 "OpenSearch")에서 출발
[[2026-08-31-booking-com-weaviate-vector-db-migration]]은 OpenSearch 기반 벡터 검색이 규모가 커질수록 비용·지연이 나빠져 전용 벡터 DB(Weaviate)로 옮겨 40% 비용을 줄인 사례였다. Pinterest는 이미 자체 전용 플랫폼(Manas)을 갖고 있었지만, 그 안에서도 ***"RAM에 다 올려두는 HNSW"가 규모의 벽에 부딪히자 SSD 기반 SPANN으로 다시 한 번 옮겨간다*** — 두 사례를 겹치면 "벡터 검색 인프라는 한 번 전용화한다고 끝나는 게 아니라, 규모가 커질 때마다 다시 같은 질문(범용이냐 전용이냐, RAM이냐 디스크냐)을 반복해서 던지게 된다"는 더 큰 패턴이 보인다.
### 핵심 전이 2 — pgvector 노트가 경고한 "HNSW churn" 문제를, Pinterest는 아예 다른 인덱스로 갈아타서 피했다
[[2026-09-10-aurora-postgresql-pgvector-production]]는 HNSW 인덱스가 변경이 누적될수록 성능이 저하되는 "churn" 문제를 운영 관측 지표로 조기에 잡아야 한다고 조언했다. Pinterest의 이번 이동은 그 문제에 대한 다른 해법을 보여준다 — HNSW를 운영으로 버티는 대신, ***애초에 갱신·확장에 더 강한 인덱스 구조(SPANN)로 갈아탄다***는 선택지다. 두 노트를 같이 읽으면 "HNSW의 한계를 운영으로 관리할 것인가, 인덱스 자체를 바꿀 것인가"라는 실제 의사결정 갈림길이 뚜렷해진다.

## 호스피탈리티 / CRS 적용 포인트
온다 CRS 규모(수십억 임베딩, 80개 클러스터)에는 아직 멀지만, 원칙은 전이 가능하다. CRS에서 임베딩 기반 검색(예: 유사 숙소 추천, 자연어 검색)을 도입한다면 초기엔 pgvector·HNSW처럼 "이미 쓰는 DB에 얹는" 방식으로 충분하되, ***데이터·쿼리 규모가 커질 때 "범용 인덱스의 한계"가 어디서 나타나는지(메모리, 지연, 갱신 비용) 미리 관측 지표를 정해두는 것***이 이 두 사례(Pinterest, Booking.com) 모두가 공통으로 주는 교훈이다. Pinterest 규모의 최적화(PQ 양자화, SPANN 커스터마이징) 자체는 온다 규모에 과도한 엔지니어링이라 직접 적용은 이르다.

## 연관 자료
- [[2026-08-31-booking-com-weaviate-vector-db-migration]] — "범용 검색엔진 대신 전용 벡터 인프라"라는 같은 결론에 다른 경로(OpenSearch→Weaviate)로 도달한 사례
- [[2026-09-10-aurora-postgresql-pgvector-production]] — HNSW의 한계를 운영으로 관리(pgvector)할지 인덱스를 갈아탈지(Pinterest)의 대조점
- [[2026-09-01-musinsa-unified-embedding-push-ctr]] — 여러 제품 표면이 하나의 임베딩·검색 인프라를 공유한다는 점에서 Manas와 같은 구조

## 한 달 뒤 회고
*(2026-10-15 즈음 — `medium.com` 접근이 가능해졌다면 원문을 직접 읽어 SPANN+PQ의 recall 5%p 하락이 실제 검색 품질 지표에 어떤 영향을 줬는지, 멀티 임베딩(ColBERT류) 파일럿의 후속 결과가 공개됐는지 확인.)*
