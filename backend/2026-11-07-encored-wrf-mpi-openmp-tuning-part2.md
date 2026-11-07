---
title: "인코어드의 AWS HPC 환경에서 WRF 실행하기 2부 (AWS) — MPI 랭크를 잘게 쪼개는 게 능사가 아니라 통신 효율과 도메인 분해가 성능을 가른다"
source_title: "인코어드의 AWS HPC 환경에서 WRF 실행하기 [2부: MPI/OpenMP 하이브리드 병렬화 튜닝 심층 분석]"
source_url: "https://aws.amazon.com/ko/blogs/tech/encored-wrf-2/"
source_name: "AWS 한국 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (원문 접근 불가)"
summarized_at: "2026-11-07"
category: "backend"
tags: ["aws", "hpc", "wrf", "mpi", "openmp", "hybrid-parallelization", "performance-tuning", "numerical-weather-prediction", "efa", "series", "source-limitation"]
---

# 인코어드의 AWS HPC 환경에서 WRF 실행하기 2부 (AWS)

> 출처: [인코어드의 AWS HPC 환경에서 WRF 실행하기 [2부: MPI/OpenMP 하이브리드 병렬화 튜닝 심층 분석]](https://aws.amazon.com/ko/blogs/tech/encored-wrf-2/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, GeekNews 아님) · 정리일 2026-11-07
>
> **출처 한계를 먼저 밝힌다.** `aws.amazon.com`이 이 세션 egress 차단(`getaddrinfo ENOTFOUND`)으로 막혀 원문을 읽지 못했다. [[2026-10-16-encored-wrf-hpc-instance-selection]](1부)와 마찬가지로 WebSearch로 AWS의 영문 Encored Technologies 공식 사례 연구를 다시 확인했으나, 이번 2부가 언급하는 "최대 22% 성능 차"·"EFA 패킷 분석" 같은 구체 수치는 인코어드 고유의 것으로 교차확인하지 못했다. 대신 Arm 커뮤니티 블로그의 일반 WRF/Graviton2 벤치마크(CONUS 12km에서 8 MPI×8 OpenMP, CONUS 2.5km에서 32 MPI×2 OpenMP가 최적)로 "MPI:OpenMP 비율이 격자 해상도·컴파일러에 따라 달라진다"는 배경 지식만 보강했다.

## 한 줄 요약

**같은 컴퓨팅 자원 안에서 MPI 프로세스와 OpenMP 스레드의 비율을 어떻게 나누느냐에 따라 WRF 기상 시뮬레이션 실행 시간이 최대 22%까지 차이 났고, 그 차이는 CPU 사용률이 아니라 EFA를 통한 노드 간 통신 효율과 도메인 분해 방식이 만들어낸다는 것을 인코어드가 실측으로 보여준 2부 심층 분석.**

## 핵심 포인트

- **1부(인스턴스 선택)의 다음 단계** — [[2026-10-16-encored-wrf-hpc-instance-selection]]이 "어떤 인스턴스를 쓸 것인가"를 다뤘다면, 이 2부는 ***같은 인스턴스 안에서 MPI 프로세스와 OpenMP 스레드 비중을 어떻게 조정하느냐***로 한 단계 더 들어감.
- **MPI 랭크를 잘게 나누는 게 능사가 아님** — Slack 발췌: "MPI 랭크를 무조건 잘게 나누는 것이 능사가 아니었으며, 구성에 따라 실행 시간이 최대 22%까지 차이 났습니다."
- **CPU 사용률 ≠ 실제 효율** — ***단순히 CPU 사용률이 높다고 효율적인 것이 아니라***, 인접 영역과 데이터를 교환하는 "긴밀 결합(tightly-coupled)" 워크로드 특성상 EFA를 통한 통신 효율과 도메인 분해 방식이 성능을 결정지음.
- **일반화 가능성** — 이 분석은 WRF뿐 아니라 CFD, 분자 동역학 등 ***유사한 병렬 구조를 가진 모든 HPC 워크로드***에 적용 가능한 실무 지표라고 스스로 주장함(원문 미확인, Slack 요약 기준).

## 인상 깊은 문장

> "MPI 랭크를 무조건 잘게 나누는 것이 능사가 아니었으며, 구성에 따라 실행 시간이 최대 22%까지 차이 났습니다." (Slack 발췌, thread reply)

> "단순히 CPU 사용률이 높다고 효율적인 것이 아니라, 인접 영역과 데이터를 교환하는 '긴밀 결합(tightly-coupled)' 워크로드 특성상 EFA를 통한 통신 효율과 도메인 분해 방식이 성능을 결정짓기 때문입니다." (Slack 발췌, thread reply)

## 댓글

GeekNews 경유가 아니라 Slack TechArticles 봇이 AWS 블로그를 직접 공유한 글이라 hada 댓글·큐레이션은 해당 사항 없다. "최대 22%"라는 수치는 Slack 발췌에만 의존하며, 어떤 구성(몇 MPI × 몇 OpenMP, 어떤 인스턴스 타입) 간의 비교인지 구체 조건이 빠져 있어 [[2026-10-16-encored-wrf-hpc-instance-selection]]이 이미 적용한 "비교 기준 없는 숫자는 재현 전까지 마케팅"([[2026-09-14-celltrion-pharm-ai-dlc-kiro-oms]] 원칙) 경계를 그대로 유지한다. WebSearch로 찾은 Arm 블로그의 Graviton2/WRF 벤치마크는 실제로 격자 해상도에 따라 최적 MPI:OpenMP 비율이 크게 달라짐(8×8 vs 32×2)을 보여줘, 이 글의 "비율 조정이 성능을 좌우한다"는 주장 자체의 방향성은 신뢰할 만하지만 "22%"라는 숫자의 재현 가능성은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 시리즈 안에서 "선택"과 "튜닝"은 별개의 최적화 축

[[2026-10-16-encored-wrf-hpc-instance-selection]](1부)가 짚은 "시간당 단가가 아니라 목표 시간 달성 총비용으로 인스턴스를 고른다"는 **인스턴스 선택 단계**의 원칙이고, 이 2부가 짚은 "MPI:OpenMP 비율·통신 효율"은 **같은 인스턴스를 고른 뒤의 튜닝 단계** 원칙이다. 두 글을 나란히 보면 HPC 비용 최적화가 "무엇을 쓸까"와 "어떻게 쓸까"라는 두 개의 독립적인 레버로 나뉜다는 게 분명해진다 — 하나만 최적화해서는 총비용의 절반만 건드리는 셈이다.

### 핵심 전이 2 — "자원 비율 재배분만으로 최대 22% 차이"는 범용 교훈

새 하드웨어나 아키텍처 변경 없이, 같은 자원 안에서 **프로세스/스레드 비율을 재배분하는 것만으로 두 자릿수 퍼센트의 성능 차이**가 난다는 사실은 WRF에 국한되지 않는다. 다만 이 가든에 DB 커넥션풀·스레드풀 튜닝을 다룬 선행 노트가 없어, 억지로 연결하지 않고 "같은 자원, 다른 배분 비율 = 다른 성능"이라는 원칙만 남겨둔다.

## 호스피탈리티 / CRS 적용 포인트

**적용 멀다.** 온다의 CRS 워크로드는 WRF 같은 긴밀 결합(tightly-coupled) HPC 배치 작업이 아니라 상시 트랜잭션 처리에 가까워, MPI/OpenMP 하이브리드 병렬화 자체는 직접 관련이 없다. 다만 전이 가능한 원칙 하나는 있다: ***"같은 자원 안에서 프로세스/스레드 비율을 재배분하는 것만으로 성능이 크게 갈릴 수 있다"***는 사고방식은, CRS의 배치 작업(야간 요금 재계산, 대량 채널 동기화)에서 워커 프로세스 수 대 스레드 수 비율을 재점검해볼 계기 정도로만 참고할 만하다.

## 연관 자료

- [[2026-10-16-encored-wrf-hpc-instance-selection]] — 같은 인코어드 WRF 시리즈 1부(HPC 인스턴스 선택과 비용 최적화), 이 글의 직접 선행편
- [[2026-09-14-celltrion-pharm-ai-dlc-kiro-oms]] — "비교 기준 없는 숫자는 재현 전까지 마케팅"이라는 검증 원칙, 이 글의 "22%" 수치에도 동일 적용

## 한 달 뒤 회고

- 2026-12-07 즈음 점검: 3부가 나왔는지, `aws.amazon.com` 접근이 풀려 1부·2부의 실제 MPI:OpenMP 비율과 인스턴스 타입을 직접 확인할 수 있는지 점검.
