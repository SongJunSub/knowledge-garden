---
title: "zg(zvec-grep) — 키워드를 넘어서는 로컬 검색 인프라, 도구 호출과 입력 토큰을 절반 가까이 줄이다"
source_title: "From rg to zg: Local Search Beyond Keywords"
source_url: "https://zvec.org/en/blog/2026-08-28-zvec-grep-open-source/"
source_name: "zvec.org / github.com/zvec-ai/zvec-grep"
referrer_url: "https://news.hada.io/topic?id=33183"
published_at: "2026-08-28"
summarized_at: "2026-09-03"
category: "ai"
tags: ["search-infra", "ripgrep", "bm25", "vector-search", "agent-tooling", "local-first"]
---

# zg(zvec-grep) — 키워드를 넘어서는 로컬 검색 인프라, 도구 호출과 입력 토큰을 절반 가까이 줄이다

> 출처: [From rg to zg: Local Search Beyond Keywords](https://zvec.org/en/blog/2026-08-28-zvec-grep-open-source/) (Zvec/Qwen 팀) · GeekNews(id=33183) 경유 · 정리일 2026-09-03

## 한 줄 요약

**Qwen(Alibaba) 팀이 사람과 에이전트를 위한 로컬 우선 검색 도구 zg(zvec-grep)를 오픈소스로 공개했다. ripgrep의 정확한 텍스트 검색에 벡터/BM25/하이브리드 검색을 결합해, "의미 검색 → 관련도 기반 축소 → 정확한 검증"을 하나의 검색 인터페이스로 지원하며, SWE-QA-Bench에서 도구 호출과 입력 토큰을 각각 절반 가까이 줄이면서 Judge 점수를 1.50점 끌어올렸다.**

## 핵심 포인트

- **하이브리드 검색 통합** — ripgrep(정확한 텍스트 검색)에 벡터 검색·BM25·하이브리드 검색을 결합해 하나의 로컬 검색 인터페이스로 제공. 함수명·오류 문자열을 모를 때도 의미로 탐색해 정확한 위치까지 좁힐 수 있다.
- **완전 로컬 실행** — 파일·인덱스·로컬 모델이 전부 사용자 머신에 남는다. 벡터·BM25 인덱스를 임베디드 라이브러리로 온디바이스 저장해 별도 DB 서비스가 필요 없다. 11개 온디바이스 모델(코드·문서·다국어·긴 입력·경량 실행용) 중 기본값은 파라미터 1,600만 개, 로컬 캐시 약 32MiB, GPU 불필요.
- **벤치마크 개선** — SWE-QA-Bench에서 zg를 추가하자 도구 호출·입력 토큰이 각각 절반 가까이 감소했고 Judge 점수는 1.50점 상승. BrowseComp-Plus에서는 정확도 98.67%→99.00%, 입력 토큰 37.56%·도구 호출 43.52%·에이전트 실행시간 38.58% 감소.
- **설치·사용** — `npm install -g @zvec/zvec-grep`, Node.js 22+, Apache 2.0 라이선스로 상업적 이용 가능. CLI와 MCP가 같은 로컬 인덱스를 공유해 인간과 에이전트가 같은 검색 결과를 얻는다.

## 인상 깊은 문장

> "zg extends local retrieval from keyword matching to intent discovery, relevance-ranked results, and precise verification." (Zvec 공식 블로그)

## 댓글

**출처 한계 부분적.** GitHub 저장소(README)는 WebFetch로 직접 확보해 아키텍처·벤치마크·사용법을 확인했으나, zvec.org 블로그 원문과 news.hada.io는 이번 세션에서 직접 열람하지 못했고 WebSearch 스니펫으로 교차검증했다. MarkTechPost·X(Qwen Developers 공식 계정) 등 2차 출처 다수가 같은 수치를 인용하고 있어 신뢰도는 높은 편이다. GeekNews 댓글 수·HN/Lobsters 큐레이션 여부는 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "검색 인터페이스를 하나로 통합"은 RAG 논쟁의 실용적 종합

[[2026-08-27-rag-is-simpler-than-you-think]]가 "대부분의 검색 문제는 임베딩·벡터DB 없이 BM25만으로 풀린다"고 주장했는데, zg는 그 반대 극단이 아니라 **"필요할 때만 의미 검색으로 좁히고 정확한 검증은 rg로 한다"는 절충 구조**다 — 둘 다 옳을 수 있다는 걸 실증하는 사례: 벡터 검색은 탐색 단계의 재현율을 높이는 용도로만 쓰고, 최종 정확성은 여전히 전통적 텍스트 매칭이 담당한다.

### 핵심 전이 2 — 로컬 우선·재생성 가능한 인덱스라는 설계는 메모리 논의와 같은 원칙

[[2026-09-02-memoryfields-agent-memory-file-format]]이 "벡터 색인은 시스템이 아니라 삭제 가능한 캐시로만 둔다"고 했는데, zg의 아키텍처도 정확히 같은 원칙이다 — 벡터/BM25 인덱스는 로컬에 저장되지만 언제든 재생성 가능한 파생물이고, 원본(코드·문서)이 진실의 원천이다.

### 핵심 전이 3 — Booking.com의 벤터DB 선택과 대조되는 "경량 우선" 접근

[[2026-08-31-booking-com-weaviate-vector-db-migration]]이 1억 임베딩 규모에서 전용 벡터DB로 40% 비용 절감을 달성한 사례라면, zg는 정반대 규모(로컬 개발자 워크스테이션)에서 "GPU 없이 32MiB 캐시"로 문제를 푼다 — **규모가 다르면 정답도 다르다**는 걸 같은 배치에서 확인한 두 사례.

## 호스피탈리티 / CRS 적용 포인트

**Claude Code 등 에이전트 하네스에 zg를 MCP 도구로 연결하면, 온다 CRS 코드베이스 탐색 시 도구 호출·토큰 소비를 실측 기준 30~50% 절감할 잠재력이 있다** — 특히 함수명이나 정확한 식별자를 모르는 상태에서 "이 로직이 어디 있는지" 찾는 아키텍처 질문에 유용할 것으로 보인다. 다만 이 노트의 벤치마크는 zvec 자체 공개 수치이므로, 도입 전 온다 코드베이스에서 직접 재현 검증이 필요하다.

## 연관 자료
- [[2026-08-27-rag-is-simpler-than-you-think]] — *검색 복잡도는 필요성 입증 후에만이라는 반대 극단의 원칙, zg는 둘의 절충*
- [[2026-09-02-memoryfields-agent-memory-file-format]] — *"색인은 삭제 가능한 캐시"라는 같은 아키텍처 원칙*
- [[2026-08-31-booking-com-weaviate-vector-db-migration]] — *정반대 규모에서의 벡터 검색 인프라 선택*

## 한 달 뒤 회고
*(2026-10-03 즈음 — zg를 온다 CRS 코드베이스에 실제로 설치해 도구 호출·토큰 절감을 재현 검증했는지 기록.)*
