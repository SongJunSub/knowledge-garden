---
title: "Redis와 야망의 대가"
source_title: "Redis and the cost of ambition"
source_url: "https://charlesleifer.com/blog/redis-and-the-cost-of-ambition/"
source_name: "Charles Leifer"
referrer_url: "https://news.hada.io/topic?id=29451"
published_at: "2026-05-12"
summarized_at: "2026-05-13"
category: "engineering"
tags: ["Redis", "Valkey", "기능팽창", "단순성", "라이선스변경", "오픈소스", "antirez짝"]
---

# Redis와 야망의 대가

> 출처: [Charles Leifer — Redis and the cost of ambition](https://charlesleifer.com/blog/redis-and-the-cost-of-ambition/) · 레퍼러: [GeekNews 29451](https://news.hada.io/topic?id=29451) · 정리일 2026-05-13

## 한 줄 요약
Redis가 *단순한 인메모리 딕셔너리 서버*에서 *모든 것을 위한 도구*가 되려다 **원래의 강점(단순성·일관성)을 잃었다**는 비판. **antirez Redis Array 글의 정확한 반론**.

## 핵심 주장

### Redis의 기능 팽창 역사
2011년경 *우아한 advanced key-value store* → 이후 *MongoDB·Elasticsearch·Kafka 모방* 시작:

| 추가 기능 | 비판 |
|---|---|
| JSON 문서 저장소 | MongoDB 흉내 |
| Streams (이벤트) | Kafka 흉내 |
| Search (전문 검색) | Elasticsearch 흉내 |
| TimeSeries | InfluxDB 흉내 |
| Graph Database | *결국 중단됨* |

### 원래의 우아함
> "Redis was simple, the commands were orthogonal and tightly scoped, the protocol was clean, and it was conceptually coherent."

→ *직교성 + 깔끔한 프로토콜 + 개념 일관성*이 *기능 추가로 사라짐*.

### "반쯤 익은" 기능의 함정
> "anyone serious about full-text search / event streams... is going to want the real thing, not some half-baked Redis module."

- *진심으로 그 기능이 필요한 사용자*는 *전용 도구*를 쓴다
- *Redis 안의 어중간한 버전*은 *어느 쪽도 만족 못 시킨다*

### 라이선스 변경 — 신뢰의 대가
- 2024년 BSD → **AGPLv3** 전환
- 저자 표현: *"scorched-earth campaign against its users"*

### Disque 교훈
> "Projects developed in astronaut mode... without a solid use-case... will the maintainer retain interest?"

- *추상적·우주비행사 모드*에서 만든 기능은 *유지 의지*가 없어진다
- Disque (Redis의 메시지 큐 시도)가 *유지 중단* 사례

### 시장의 평결 — Valkey
- Valkey = *2011년 Redis 기능*에 집중
- 멀티스레드 성능·메모리 효율·클러스터 안정 *개선만*
- *야망 없이 안정성*에 집중하는 게 *시장의 답*

## 내 생각 · 적용점

### [antirez Redis Array 글](2026-05-05-redis-array-antirez-4-months-with-ai.md)의 정확한 반론
어제 정리한 [Tim Davis 글](2026-05-10-probabilistic-engineering-and-24-7-employee.md)이 [확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md)의 *원전 보강*이었다면, 이번 글은 **antirez의 정확한 반대편**:

| 측면 | antirez 글 (5/5) | 이 글 (5/13) |
|---|---|---|
| **사건** | 4개월 AI 협업으로 Redis Array 추가 | Redis가 기능 추가하다 단순성 잃음 |
| **AI 평가** | "Because I had AI, I took no compromises" | *그 무타협이 *Redis의 죽음*인가?* |
| **시각** | 시니어 개발자의 *능력 증폭* | 사용자의 *제품 가치 감소* |

→ **가든 그래프에 *논쟁 짝* 추가**. 같은 사건을 *반대 각도*에서 본 두 글이 가든에 공존. 어느 한 쪽 옹호하지 않고 *긴장 유지*가 좋음.

### *antirez 4단계 협업*의 *맹점* 드러내기
[antirez 글](2026-05-05-redis-array-antirez-4-months-with-ai.md)이 *"AI 덕에 안 해봤을 도전 가능"* 으로 *Redis Array 추가*를 정당화했는데, 이 글은 그 정신의 *집단적 부작용*을 진단:
- 개별 결정: *합리적* (이걸 만들 수 있고, 만들면 좋다)
- 누적 결과: ***Redis가 무엇인지 모르겠다***
- → *antirez의 4단계 협업*이 *제품 정체성 보호*를 *별개로* 다뤄야 함을 시사

### 가든 *왜 만드는가* 결과의 직접 결합
- [Lord 3 제약](2026-04-28-three-constraints-before-i-build-anything.md): *defining constraint* 유지 X = 정체성 손실
- [Lynagh 성공 기준 내면화](2026-04-27-overthinking-scope-creep-structural-diffs.md): *"가끔은 그냥 선반이 필요할 뿐"*
- [Nonograph 무료로](../career/2026-05-08-write-software-give-it-away-for-free.md): *수익화 가정*이 정체성 변경
- [Ding 코드 줄 수 = 비용](../ai/2026-05-07-claude-code-not-making-your-product-better.md): 제거가 추가보다 비싸진다
- 이 글: ***기능 야망의 누적*이 정체성을 망가뜨린 *구체 사례***

→ 가든의 *왜 만드는가·덜 만드는가* 결의 **현실 케이스 스터디**가 추가됨.

### *Jevons 역설*의 오픈소스 버전
- [.txt 병목](2026-05-07-bottleneck-was-never-the-code.md), [Tim Davis](2026-05-10-probabilistic-engineering-and-24-7-employee.md): *코드 작성이 싸지면 *더 많이 만든다**
- 이 글: *공헌자가 풍부한 오픈소스*에서도 같은 패턴 — *기능 추가 비용이 낮으니 계속 추가*
- → **오픈소스 거버넌스에도 *defining constraint 유지 책임*이 필요**

### 호스피탈리티 IT 적용 — *CRS·Connectivity의 기능 야망 점검*
- CRS는 *호텔 운영의 모든 기능*을 담는 경향
- 사용자가 진짜 필요한 영역은 *5-7개 핵심*
- 나머지는 *반쯤 익은 어중간한 기능*일 가능성
- → **분기마다 *기능 사용률 자가 진단*** 후보: *3개월 이상 사용 안 된 기능* 식별 + 제거 검토

### *라이선스 변경*의 호스피탈리티 시사
- 우리가 의존하는 오픈소스의 *AGPLv3 전환 위험*
- *공급망 라이선스 리스크* 점검이 [백엔드 위생 시리즈](../backend/2026-05-09-ai-breaking-vulnerability-cultures.md)에 추가될 영역

### MangoLove 적용 — *야망 점검 게이트*
[Lord 3 제약](2026-04-28-three-constraints-before-i-build-anything.md)에 *4번째 제약* 후보:
> *"이 변경이 *제품 정체성*을 더 또렷하게 하는가, 흐리게 하는가?"*

- 정체성 흐리는 변경 = *Redis화 위험* 신호
- PR 헤더 스키마 *축약 통합*([어제 메모](2026-05-10-probabilistic-engineering-and-24-7-employee.md))에 들어갈 후보 1개 추가.

### *Valkey가 시장의 답*은 [확률적 창업자 글](../career/2026-05-05-rise-of-the-probabilistic-founder.md)의 정신과 결합
- 확률적 창업자: *Memory가 해자, 정체성이 핵심*
- 이 글: *야망보다 안정성·일관성*이 살아남는 길
- → AI 시대의 *제품 차별화*는 *기능 추가가 아니라 *정체성 유지***

### 반론·균형점
- *기능 추가 = 죽음*은 *극단적 단순화* — Redis 사용자 다수는 *Streams·Search* 활용 중
- *Valkey가 더 낫다*는 *시장 검증 진행 중* — 미완 평결
- 핵심: ***모든 기능 추가가 야망이 아님***. *야망 vs 진짜 사용자 요구* 구분이 어렵다는 게 진짜 문제

### 가든 그래프 — *제품 진화 패턴* 영역 형성
| 글 | 영역 |
|---|---|
| [antirez 4단계](2026-05-05-redis-array-antirez-4-months-with-ai.md) | 개인 개발자의 가능성 |
| **이 글** | **제품 야망의 부작용** |
| [Lord 3 제약](2026-04-28-three-constraints-before-i-build-anything.md) | 정체성 가드 |
| [Lynagh 성공 기준](2026-04-27-overthinking-scope-creep-structural-diffs.md) | 시작점 명확화 |
| [Nonograph](../career/2026-05-08-write-software-give-it-away-for-free.md) | 수익화 가정 거부 |

5개 글이 *제품·정체성·야망 관리*라는 *느슨한 클러스터* 형성. 가든의 5번째 결로 분류 가능.

## 즉시 시도할 액션 3가지
1. **MangoLove `/strict`에 *정체성 점검 자문* 추가** — *"이 변경이 제품 정체성을 또렷하게 하는가, 흐리게 하는가?"*
2. **CRS·Connectivity *기능 사용률 자가 진단* 분기 후보** — 3개월 미사용 기능 식별
3. **오픈소스 의존성 *라이선스 리스크* 점검** — AGPLv3 전환 가능성 + 대체 후보 매핑

## 연관 자료
- [`engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md`](2026-05-05-redis-array-antirez-4-months-with-ai.md) — **이 글의 정확한 반론 짝**
- [`engineering/2026-04-28-three-constraints-before-i-build-anything.md`](2026-04-28-three-constraints-before-i-build-anything.md) — defining constraint 유지 X = 정체성 손실
- [`engineering/2026-04-27-overthinking-scope-creep-structural-diffs.md`](2026-04-27-overthinking-scope-creep-structural-diffs.md) — 성공 기준 내면화
- [`career/2026-05-08-write-software-give-it-away-for-free.md`](../career/2026-05-08-write-software-give-it-away-for-free.md) — 수익화 가정의 정체성 변경
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](../ai/2026-05-07-claude-code-not-making-your-product-better.md) — 코드 줄 수 = 비용
- [`engineering/2026-05-07-bottleneck-was-never-the-code.md`](2026-05-07-bottleneck-was-never-the-code.md) — Jevons 역설의 오픈소스 버전
- [`engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md`](2026-05-10-probabilistic-engineering-and-24-7-employee.md) — Tim Davis 같은 위험 패턴
- 비교: Valkey (https://valkey.io)

## 한 달 뒤 회고
- [ ] MangoLove `/strict`에 *정체성 점검 자문*이 추가됐는가
- [ ] CRS·Connectivity 기능 사용률 자가 진단을 시도했는가
- [ ] 오픈소스 의존성 *AGPLv3 위험* 점검 메모를 작성했는가
- [ ] *야망 vs 진짜 사용자 요구* 구분이 한 번이라도 의사결정에 영향을 줬는가
