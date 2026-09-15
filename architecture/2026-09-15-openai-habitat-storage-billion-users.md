---
title: "OpenAI Habitat, 주간 10억 사용자를 떠받치는 온라인 스토리지 확장기 (OpenAI Engineering) — 제한된 NoSQL API로 비용을 예측 가능하게 묶어두고, 엔지니어 2명이 Codex·GPT-5.5로 그 위에서 통째로 Rust 재작성까지 해냈다"
source_title: "Rapidly scaling online storage to serve over 1 billion ChatGPT users"
source_url: "https://openai.com/index/scaling-storage-one-billion-users-part-one/"
source_name: "OpenAI (공식 엔지니어링 블로그)"
referrer_url: "https://news.hada.io/topic?id=33674"
published_at: "2026-09-11"
summarized_at: "2026-09-15"
category: "architecture"
tags: ["storage-architecture", "distributed-systems", "nosql", "python-to-rust", "ai-assisted-rewrite", "scaling", "openai"]
---

# OpenAI Habitat, 주간 10억 사용자를 떠받치는 온라인 스토리지 확장기 (OpenAI Engineering)

> 출처: [Rapidly scaling online storage to serve over 1 billion ChatGPT users](https://openai.com/index/scaling-storage-one-billion-users-part-one/) (OpenAI 공식 엔지니어링 블로그, "Part One") · GeekNews(id=33674) 경유 · 정리일 2026-09-15

## 한 줄 요약
**Habitat은 ChatGPT부터 Codex까지 떠받치는 OpenAI의 온라인 스토리지 플랫폼으로, 초당 7천만 건 이상의 요청을 약 40개 리전에서 처리하며 주간 10억 명 이상에게 서비스한다.** 이 규모를 지탱한 두 가지 결정이 흥미롭다 — ***기능을 일부러 제한한 NoSQL API로 요청 비용을 예측 가능하게 묶어두고, 복잡한 분석·검색은 별도 Rockset 인스턴스로 떼어내 스토리지 본체를 보호***했다는 설계 판단, 그리고 2026년 2분기에 ***단 2명의 엔지니어가 Codex와 GPT-5.5를 이용해 이 서비스 전체를 Python에서 Rust로 재작성***해 CPU 효율 6배·메모리 효율 15배를 달성하고 프로덕션 트래픽의 95%를 이미 이 Rust 서비스로 옮겼다는 것이다.

## 핵심 포인트
- **규모** — Habitat은 초당 **7천만 건 이상**의 요청을 처리하며, 거의 **40개 지역**에 걸쳐 주간 **10억 명 이상**이 쓰는 제품(ChatGPT, Codex 등)에 데이터를 공급한다. 전년 대비 **10배 이상** 성장했다(OpenAI Devs 공식 X 계정 발표 기준).
- **왜 독립 서비스로 뺐나** — 여러 서비스에 흩어져 배포되던 클라이언트 라이브러리들을 하나의 독립 서비스로 통합해, 배포·관측성(observability)·접근 제어를 중앙에서 관리하고 조율되지 않은 업데이트로 인한 장애를 줄이는 것이 목표였다.
- **제한된 NoSQL API가 곧 비용 설계** — 기능을 풍부하게 열어두는 대신 ***일부러 제한한 NoSQL API***로 요청 비용을 예측 가능한 범위에 묶어뒀다. 복잡한 분석·검색 질의는 스토리지 플랫폼 본체를 지키기 위해 별도의 **Rockset 인스턴스**로 분리했다.
- **재작성 전에 먼저 버틴 구간** — 처음부터 Rust로 간 게 아니라, asyncio 스케줄링 지연·커넥션 풀의 부하 불균형·서브시스템의 커넥션 폭주 같은 문제를 Python 상태에서 튜닝해 처리량·안정성을 유지하며 시간을 벌었다. Rust 재작성 전 Python 서비스는 이미 피크 시 **초당 2천만 건 이상**을 처리하고 있었다.
- **2명, 한 분기, Codex·GPT-5.5로 전체 재작성** — 2026년 2분기에 엔지니어 **2명**이 Codex와 GPT-5.5를 이용해 서비스 전체를 Rust로 재작성했다. 결과: 기존 Python 대비 ***CPU 효율 6배, 메모리 효율 15배***, 평균·꼬리 지연시간(latency) 모두 유의미하게 개선. 이 Rust 서비스가 이미 **프로덕션 요청의 95%**를 처리 중이며, 조만간 Python은 완전히 폐기 예정.

## 인상 깊은 문장
> "Habitat is OpenAI's online storage platform that powers everything from ChatGPT to Codex. It has grown over 10x year over year. Before the Rust rewrite, its Python service handled more than 20 million requests per second at peak." (OpenAI Devs 공식 X 계정, WebSearch로 확인)

원문 본문의 문장은 직접 대조하지 못해, 위 인용은 OpenAI가 같은 내용을 홍보한 공식 X 게시글에서 그대로 가져온 것이다.

## 댓글
**정직하게 밝힌다 — 이번 정리는 이례적으로 광범위하게 접근이 막혔다.** GeekNews(id=33674)와 OpenAI 공식 블로그(openai.com) 원문 모두 이 세션의 egress 정책으로 WebFetch 차단됐다. Tom's Hardware급 1차 보도도, 재게시 사이트(dotnetramblings.com, braindetox.kr)도 전부 차단돼 hada 댓글 수·HN 큐레이션 여부를 직접 확인하지 못했다. 대신 WebSearch로 daily.dev·aiposthub.com·cyn.co.th 등 복수의 독립 재게시/요약 사이트와 OpenAI 공식 X 계정 게시글을 교차확인했고, 핵심 수치(초당 7천만 건, 10억 명, 40개 리전, 재작성 전 2천만 건, 6배/15배 효율, 엔지니어 2명, Codex·GPT-5.5, 2026 Q2)가 모든 소스에서 일치했다 — 다만 이 소스들 상당수가 서로를 인용하는 재게시 체인일 가능성이 있어, 완전히 독립적인 검증이라 보기는 어렵다. **아젠다 명시**: 이 글은 OpenAI가 자사 코딩 도구(Codex·GPT-5.5)로 자사 프로덕션 시스템을 재작성했다는 사례를 자기 블로그에 발표한 것 — 자사 제품의 실력을 보여주는 홍보 성격이 뚜렷하다. 재작성 소요 기간이 "한 분기"라고만 나올 뿐 정확한 일수·투입 시간, 코드 규모(줄 수), 컴파일 에러 수 등 검증 가능한 세부 지표는 확인하지 못했다(이 점에서 아래 핵심 전이 1의 Bun 사례보다 투명성이 낮다). 부제가 "Part One"인 것으로 보아 후속 글이 예정된 듯하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "정답지가 있는 작업"이라는 조건이 이번에도 성립하는가, 그런데 검증 가능한 숫자가 없다
[[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]가 정리한 원칙 — ***AI의 배율은 작업의 난이도가 아니라 검증의 자동화 가능성에 비례한다*** — 이 이 사례에도 그대로 적용될 법하다. 기존 Python 서비스의 동작 자체가 이미 "정답지"이므로 이식(port) 성격의 재작성은 원래 배율이 잘 나오는 영역이다. 하지만 Bun 사례가 535,496줄·1,448개 파일·6,500 커밋·16,000개 컴파일 에러·$165,000 같은 검증 가능한 숫자를 공개한 것과 달리, 이 글은 "2명·한 분기·6배/15배"라는 결과 지표만 있고 **과정 지표(코드 규모, 소요 일수, 테스트 스위트 구성)가 전혀 공개되지 않았다.** 같은 "AI로 시스템 재작성" 사례라도 투명성 수준이 이렇게 다르다는 것 자체가, 이런 벤더 발표 글을 읽을 때 "결과만 있고 과정이 없으면 재현 불가능한 성공담"으로 받아들여야 한다는 걸 다시 보여준다.

### 핵심 전이 2 — 제한된 API 설계는 [[2026-05-30-shopify-scaling-inventory-reservations]]의 "의도적으로 좁힌 인터페이스" 원칙과 같은 축
Shopify가 재고 예약을 MySQL로 옮기면서도 스케일한 비결이 "단위당 한 행 + SKIP LOCKED + 상한 풀"이라는 **의도적으로 좁힌 쓰기 패턴**이었다면, Habitat은 "기능을 제한한 NoSQL API"로 같은 원칙을 읽기·쓰기 계약 차원에서 반복한다. 두 사례 모두 확장성의 비결이 "더 유연한 API"가 아니라 **"할 수 있는 것을 줄여서 비용과 동작을 예측 가능하게 만드는 것"**이라는 공통 결론에 도달한다.

### 핵심 전이 3 — 솔로 4개월 vs 2인 1분기, AI 재작성의 "팀 크기" 스펙트럼
[[2026-05-05-redis-array-antirez-4-months-with-ai]]가 개인(antirez) 혼자 4개월에 걸쳐 AI와 협업한 사례라면, 이 글은 프로덕션 서비스를 **2명이 한 분기**만에 재작성한 사례다. 둘 다 "AI가 있으면 소수의 사람이 예전 같으면 훨씬 큰 팀이 필요했을 일을 해낸다"는 같은 흐름 위에 있지만, 이 글은 검증 가능한 세부가 없어 Redis Array 사례보다 신뢰도를 더 낮게 잡고 조심스럽게 판단해야 한다.

## 호스피탈리티 / CRS 적용 포인트
CRS 접점은 두 갈래로 온다에 실제로 적용해볼 만하다. **(1) 제한된 API 설계** — 예약·재고·요금 조회 API를 설계할 때 "무엇이든 조회 가능한 유연한 쿼리"보다 ***"자주 쓰는 패턴만 빠르게, 나머지는 별도 분석 계층(BigQuery·Rockset류)으로 분리"*** 하는 게 비용을 예측 가능하게 만든다는 걸 재확인시킨다 — 특히 성수기 트래픽이 몰릴 때 분석성 쿼리가 예약 확정 경로를 잠식하지 않도록 분리하는 아키텍처는 그대로 참고할 만하다. **(2) 대규모 재작성 판단 기준** — "엔지니어 2명·한 분기"라는 숫자에 혹하기 전에, [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]가 제시한 재현 조건(코드베이스를 깊이 아는 주도자, 동작 동등성을 판정할 테스트 스위트, 실패를 감수할 토큰 예산)으로 먼저 채점해야 한다는 원칙은 여기도 그대로 적용된다 — 이 글 자체는 그 세 조건을 검증할 근거를 주지 않는다는 게 한계다.

## 연관 자료
- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — 같은 "AI 대규모 재작성" 패턴이지만 과정 지표를 투명하게 공개한 대조 사례
- [[2026-05-30-shopify-scaling-inventory-reservations]] — "의도적으로 좁힌 인터페이스로 확장한다"는 같은 아키텍처 원칙
- [[2026-05-05-redis-array-antirez-4-months-with-ai]] — AI와 협업한 시스템 개발이라는 같은 계열의 솔로 버전

## 한 달 뒤 회고
*(2026-10-15 즈음 — "Part One"의 후속 글(Part Two)이 나왔는지, 나왔다면 재작성 과정의 검증 가능한 세부(코드 규모, 테스트 스위트, 소요 일수)가 공개됐는지 확인. openai.com·news.hada.io 접근이 가능해지면 원문 인용을 직접 대조로 교체.)*
