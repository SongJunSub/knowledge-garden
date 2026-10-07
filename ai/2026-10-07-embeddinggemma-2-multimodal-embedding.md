---
title: "EmbeddingGemma 2 (Google) - 텍스트 전용이면 2억 7천만 파라미터만 쓰는 모듈식 멀티모달 임베딩"
source_title: "Bring multimodal semantic search to the edge with EmbeddingGemma 2"
source_url: "https://developers.googleblog.com/google-ai-edge-with-embeddinggemma-2/ (egress 차단, WebSearch로 교차확인한 재구성)"
source_name: "Google Developers Blog, 2차: SiliconANGLE, Investing.com, datastudios.org, Digg 등"
referrer_url: "https://news.hada.io/topic?id=34907"
published_at: "2026-10-06"
summarized_at: "2026-10-07"
category: "ai"
tags: ["embeddinggemma", "gemma", "multimodal-embedding", "on-device", "apache-2.0", "mteb", "semantic-search"]
---

# EmbeddingGemma 2 (Google)

> 출처: [Bring multimodal semantic search to the edge with EmbeddingGemma 2](https://developers.googleblog.com/google-ai-edge-with-embeddinggemma-2/) (Google Developers Blog 추정 · GeekNews 경유) · 정리일 2026-10-07

> **출처 한계**: news.hada.io와 developers.googleblog.com 원문 모두 이번 세션에서 egress 차단으로 직접 열지 못했다. SiliconANGLE, Investing.com, Seeking Alpha, datastudios.org, Digg 등 5곳 이상의 2차 매체가 파라미터 수(7억 4,000만)·구조(모듈식)·라이선스(Apache-2.0)·발표일(2026-10-06)을 일치해서 보도해 교차확인된 사실로 다뤘지만, 원문 문장 단위 대조는 못 했다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**Google이 텍스트·코드·이미지·오디오·비디오를 하나의 벡터 공간에 넣는 EmbeddingGemma 2를 내놓으면서, "멀티모달"이라는 이름값과 달리 텍스트만 쓸 땐 모델의 3분의 1(2억 7,000만 파라미터)만 돌아가게 설계해 온디바이스 비용과 범위를 분리했다.**

## 핵심 포인트

- Gemma 4 기반, 총 7억 4,000만 파라미터의 모듈식 구조. 텍스트 인코더(2억 7,000만)가 기본이고, 비전 인코더(1억 7,000만)와 오디오 인코더(3억)는 ***필요할 때만 얹는 선택 모듈***이다.
- Apache-2.0 라이선스로 공개했고, 기존 EmbeddingGemma의 다국어 텍스트 성능은 유지하면서 ***MTEB Code 점수를 68.76 → 78.68로 끌어올렸다*** - Slack 발췌와 2차 보도가 일치하는 핵심 수치.
- 컨텍스트 윈도우가 기존 모델의 4배인 8,000토큰으로 늘어, 오디오 최대 5.5분·이미지 29장·비디오 58프레임까지 로컬에서 한 번에 처리할 수 있다고 보도됐다.
- 온디바이스 메모리 사용량이 텍스트 전용이면 약 191MB, 풀 멀티모달(양자화 포함)이면 약 567MB(Pixel 11 Pro 기준)로, ***10억 파라미터 미만 멀티모달 임베딩 모델 중 코드·오디오 벤치마크에서 선도적***이라는 주장이다.
- Matryoshka Representation Learning으로 출력 차원을 조정할 수 있는 등 전작 EmbeddingGemma의 설계 철학(가볍고 빠른 온디바이스 검색)을 멀티모달로 확장한 후속작의 성격이 강하다.

## 인상 깊은 문장

> "텍스트, 코드, 이미지, 영상, 오디오를 하나의 통합된 임베딩 공간에 매핑한다" (Google DeepMind 공식 X 계정 발표문 요약, 2차 소스 재인용. 원문 전체 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수와 반응은 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 - "임베딩을 하나로 통일"하는 패턴이 이번엔 모달리티 축으로 확장

[[2026-09-01-musinsa-unified-embedding-push-ctr]]은 모델마다 따로 학습하던 유저 이해를 "하나의 공유 임베딩"으로 통합해 CTR을 21.3% 올린 사례였다. EmbeddingGemma 2는 같은 통합 원리를 ***모달리티(텍스트·이미지·오디오)*** 축으로 밀어붙인 셈이다. 다만 무신사 사례는 하나의 서비스 내 데이터 통합이고, 이번 건 범용 공개 모델이라 적용 맥락은 다르다.

### 핵심 전이 2 - 벡터 DB 선택과 "임베딩 모델 교체 비용"의 연쇄

[[2026-10-02-turbopuffer-vector-database-farewell]]은 "벡터 유사도는 여러 질의 방식 중 하나일 뿐"이라며 벡터DB를 전용 제품에서 범용 질의 엔진으로 되돌리자는 주장이었다. 이렇게 임베딩 모델(EmbeddingGemma 2)의 모달리티·차원이 자주 바뀌는 흐름이라면, 벡터 저장 계층을 특정 임베딩 모델에 강하게 결합시키지 않는 게 더 중요해진다는 논지와 맞물린다.

### 핵심 전이 3 - 대규모 임베딩 검색 플랫폼의 운영 경험

[[2026-09-15-pinterest-embedding-retrieval-platform-evolution]]는 임베딩 검색을 HNSW에서 PQ 양자화 기반 SPANN으로 바꿔 QPS 3배를 얻은 사례다. EmbeddingGemma 2처럼 더 가벼운 임베딩 모델이 늘어날수록, 저장·검색 인프라 쪽의 양자화·근사 검색 전략이 비용을 결정하는 비중이 커진다는 점에서 연결된다.

## 호스피탈리티 / CRS 적용 포인트

멀티모달 임베딩은 B2B 호스피탈리티 CRS에 비교적 실질적인 접점이 있다. 숙소 사진, 평면도, 텍스트 리뷰, 다국어 상품 설명을 같은 벡터 공간에 넣으면 "이 사진과 비슷한 객실" 또는 "이 리뷰와 비슷한 느낌의 숙소"를 텍스트-이미지 교차 검색으로 찾을 수 있다. 단, 온다 환경에 바로 적용하려면 데이터 파이프라인·라벨 품질이 선행돼야 하므로 지금은 가능성만 메모해 둔다.

## 연관 자료

- [[2026-09-01-musinsa-unified-embedding-push-ctr]] - 서비스 내부 임베딩 통합으로 성과를 낸 선행 사례, 통합 축이 모델이 아니라 모달리티라는 차이.
- [[2026-10-02-turbopuffer-vector-database-farewell]] - 벡터DB를 특정 임베딩 모델에 결합시키지 말아야 한다는 반증적 주장과 연결.
- [[2026-09-15-pinterest-embedding-retrieval-platform-evolution]] - 임베딩이 가벼워질수록 검색 인프라 쪽 양자화 전략이 비용을 좌우한다는 연쇄.

## 한 달 뒤 회고

*(2026-11-07 즈음) MTEB 벤치마크 전체 순위표에서 EmbeddingGemma 2가 실제로 10억 파라미터 미만 구간 1위를 유지하는지, 그리고 온다 내부에 적용 가능한 멀티모달 검색 시나리오가 구체화됐는지 점검한다.*
