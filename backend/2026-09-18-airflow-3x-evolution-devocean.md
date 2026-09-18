---
title: "Apache Airflow 3.x, 무엇이 달라졌고 어디로 가고 있는가 (데보션) — ETL 배치 스케줄러에서 워크플로우 오케스트레이션 플랫폼으로: DB 직접 접근을 걷어내고 자산·이벤트 중심으로 확장한다"
source_title: "Apache Airflow 3.x, 무엇이 달라졌고 어디로 가고 있는가?"
source_url: "http://devocean.sk.com/blog/techBoardDetail.do?id=168499&boardType=techBlog&isShared=Y"
source_name: "데보션(DEVOCEAN) — SK 기술 블로그"
referrer_url: "http://devocean.sk.com/blog/techBoardDetail.do?id=168499&boardType=techBlog&isShared=Y"
published_at: "확인 불가"
summarized_at: "2026-09-18"
category: "backend"
tags: ["airflow", "workflow-orchestration", "data-pipeline", "event-driven", "task-execution-api", "asset-based-scheduling"]
---

# Apache Airflow 3.x, 무엇이 달라졌고 어디로 가고 있는가 (데보션)

> 출처: [Apache Airflow 3.x, 무엇이 달라졌고 어디로 가고 있는가?](http://devocean.sk.com/blog/techBoardDetail.do?id=168499&boardType=techBlog&isShared=Y) (데보션 · SK 기술 블로그) · Slack TechArticles 경유(GeekNews 아님) · 정리일 2026-09-18
>
> **출처 한계**: `devocean.sk.com`이 이 세션의 egress 정책으로 전면 차단되어 원문을 직접 읽지 못했다. Slack이 전달한 발췌 2단락(제목 밑 요약 + 스레드 추가 설명)을 뼈대로 삼고, Apache Airflow 공식 블로그·문서(`airflow.apache.org`)와 여러 3자 리뷰(DataCamp, Medium 등)를 WebSearch로 교차검증해 "아키텍처 / 개발자 경험(DX) / 워크플로우 모델" 세 축이 실제 Airflow 3.x 공식 변경사항과 부합하는지 확인했다. 다만 devocean 원문이 실제로 어떤 순서·사례·수치(SK 내부 도입 경험 포함 여부 등)로 이 내용을 풀어냈는지, 필자가 누구인지, 정확한 발행일은 확인하지 못했다 — 아래 핵심 포인트는 "Slack 발췌가 말하는 주장"과 "그 주장이 Airflow 공식 자료로 뒷받침되는지"를 구분해서 적는다.

## 한 줄 요약

**Airflow 3.x는 단순 기능 추가가 아니라, 태스크가 메타데이터 DB를 직접 건드리던 오래된 아키텍처를 걷어내고 전용 API 서버를 경유하게 만들어 실행과 오케스트레이션을 분리하는 동시에, 워크플로우 모델 자체를 시간 중심 배치 스케줄링에서 데이터 자산(Asset)·이벤트 중심으로 확장한 개편이라는 것이 이 글의 핵심 주장이며, 이는 Airflow 공식 발표(Task Execution API, Asset 개념, 이벤트 기반 스케줄링)와 실제로 일치한다.**

## 핵심 포인트

- **아키텍처 — 태스크의 DB 직접 접근 제거**: Slack 발췌가 짚은 "태스크 실행과 오케스트레이션 분리"는 실제로 Airflow 3.0의 핵심 변경인 ***Task Execution API***와 일치한다. 워커가 더 이상 메타데이터 DB나 Airflow 프로세스 트리에 직접 접근하지 않고, 상태 전이·하트비트·XCom·리소스 조회를 모두 전용 API 서버를 거쳐 처리한다 — DAG 작성자의 코드가 DB를 오염시키거나 스케줄러 내부를 침범할 수 없게 격리 수준을 끌어올린 구조다.
- **DAG 번들 버전 관리**: 공식 문서 기준, 기본 로컬 디스크 백엔드는 버전 관리가 안 되지만 Git 같은 ***버전 관리 DAG 번들 백엔드***를 쓰면 스케줄러가 태스크를 디스패치할 때 특정 번들 버전을 고정할 수 있다 — "스케줄러와 워커가 서로 다른 버전의 DAG를 보는" 배포 중 불일치 문제를 구조적으로 줄이는 장치.
- **개발자 경험 — 내부 구현 비의존 인터페이스**: Slack 발췌의 "내부 구현 의존성을 낮추고 표준화된 작성 인터페이스" 주장은 FastAPI 기반으로 재작성된 REST API·UI 내부 API(AIP-84)와 방향이 맞는다 — API 서버는 DAG 번들에 직접 접근하지 않고 메타데이터 DB에서 읽은 코드만 UI에 보여주며, DAG 작성자가 제출한 코드를 실행하지 않는다는 격리 설계도 같은 축이다.
- **워크플로우 모델 — 시간 중심에서 자산(Asset)·이벤트 중심으로**: Airflow 2.x의 "Dataset" 개념이 3.x에서 ***Asset***으로 승격되며 `@asset` 데코레이터와 전용 실행 경로가 생겼고, ***이벤트 기반 스케줄링***으로 Airflow 바깥 메시지 버스(초기 릴리스는 AWS SQS 지원)에서 발생한 이벤트로 DAG를 트리거할 수 있게 됐다 — "정해진 시각에 도는 배치"에서 "데이터가 준비됐을 때·이벤트가 발생했을 때 도는 워크플로우"로 스케줄링 패러다임 자체가 넓어졌다.
- **진행형 흐름**: Airflow 3.0은 2.0(2020년) 이후 오랜만의 메이저 개편이었고, 이후로도 3.x 라인 안에서 마이너 릴리스가 계속 누적돼 이 글이 "3.x가 어디로 가고 있는가"를 묻는 것 자체가 여전히 진행 중인 흐름이라는 것도 확인된다.
- **devocean 원문 고유의 사례·수치**는 이번 정리에서 확인하지 못했다 — 위 내용은 Slack 발췌의 주장이 Airflow 공식 자료와 부합하는지를 검증한 것이지, devocean 글이 실제로 어떤 예시(SK 내부 사례 포함 여부 등)를 들었는지는 별개다.

## 인상 깊은 문장

*(원문에 접근하지 못해 devocean 필자의 문장을 직접 인용하지 않는다. Slack 발췌 중 논지를 가장 압축한 문장만 옮긴다.)*

> "많은 이들이 Apache Airflow를 단순히 ETL을 위한 배치 스케줄러로 인식하지만, Airflow의 본질은 워크플로우를 프로그래밍 방식으로 작성, 스케줄링, 모니터링하는 플랫폼임."

## 댓글

이 글은 GeekNews 경유가 아니라 Slack `#개발-뉴스-dev-news` 채널에 TechArticles 봇이 devocean.sk.com 원문에 직접 링크한 것이라 **hada 댓글이 애초에 존재하지 않는다.** HN·Lobsters 큐레이션 여부도 WebSearch로 확인을 시도했으나 찾지 못했다 — 한국어 사내 기술 블로그 글이 영어권 커뮤니티에 큐레이션됐을 가능성은 낮다. 감안할 점: SK텔레콤 계열 기술 블로그 특성상 ***Airflow 도입·운영을 긍정적으로 그렸을 가능성***이 있고, 이 정리 자체도 devocean 원문이 아니라 "Airflow 3.x가 실제로 무엇을 바꿨는가"를 외부 공식 자료로 검증한 결과라는 점에서 devocean 필자 고유의 논조·강조점과는 다를 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 Airflow를 다루는 선행 노트 두 개가 이미 "원문 접근 실패"라는 같은 제약을 먼저 겪었다

[[2026-09-01-naver-python-multiprocessing-airflow-part1]]과 [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]은 같은 날짜대·같은 배치에서 이미 Airflow 관련 원문이 차단된 채로 정리됐다. 다만 이 글은 그 둘과 성격이 다르다 — 두 선행 노트는 "특정 회사의 특정 운영 경험"이라 원문 없이는 대체할 수단이 없었지만, 이 글은 "Airflow 3.x가 공식적으로 무엇을 바꿨는가"라는 일반 사실을 다루므로 Airflow 공식 문서로 상당 부분 교차검증할 수 있었다 — 같은 "원문 차단"이라는 출처 한계도, 글의 성격(사내 경험담 vs 플랫폼 변경사항 해설)에 따라 대체 가능한 정도가 다르다는 걸 이 세 노트를 겹쳐 보면 알 수 있다.

### 핵심 전이 2 — "레거시 오케스트레이터 교체"라는 실무 문제의 목적지가 바로 이 글의 주제다

[[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]이 Oozie/Sqoop에서 옮겨간 곳이 바로 이 글이 설명하는 Airflow의 최신 버전이다. 그 노트는 "새 도구가 더 낫다는 일반론이 아니라 실제 병목을 먼저 특정해야 한다"는 원칙만 남겼는데, 이 글이 정리한 Airflow 3.x의 변화(DB 직접 접근 제거, Asset·이벤트 중심 확장)는 그 병목 후보 목록에 "구버전 Airflow의 아키텍처 자체가 이미 병목이었을 수 있다"는 항목을 하나 추가한다.

## 호스피탈리티 / CRS 적용 포인트

온다 CRS가 예약·재고 동기화, 파트너사(OTA) 연동 배치, 정산 집계 같은 워크플로우를 Airflow 계열로 돌린다면 이 글이 정리한 두 축이 실무적으로 맞닿는다: **① Asset 기반 스케줄링** — "매일 새벽 3시에 무조건 돈다"는 시간 중심 배치 대신, "PMS에서 재고 동기화 파일이 갱신되면" 같은 데이터 자산 준비 상태를 트리거로 삼을 수 있다면, 파트너사 데이터 지연 시 불필요하게 빈 배치를 도는 낭비를 줄일 수 있다. **② 이벤트 기반 스케줄링(메시지 버스 트리거)** — 예약 확정·취소 이벤트가 큐(SQS 등)로 들어오는 순간 즉시 반응하는 워크플로우를 구성할 수 있어, 폴링 주기에 묶인 지연을 줄이는 방향으로 쓸 수 있다. 다만 devocean 원문의 구체 사례를 확인하지 못한 채로는 "온다에 그대로 적용 가능하다"고 단정하지 않는다 — 원칙 수준의 전이다.

## 연관 자료

- [[2026-09-01-naver-python-multiprocessing-airflow-part1]] — 같은 Airflow를 다루는 선행 노트, "원문 확인 실패"라는 같은 제약을 먼저 겪은 짝
- [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]] — 레거시 오케스트레이터에서 Airflow로 옮겨간 목적지가 바로 이 글의 버전(3.x)이라는 점에서 직접 연결

## 한 달 뒤 회고

*(2026-10-18 즈음 — devocean.sk.com 접근이 풀렸다면 원문을 직접 읽어 필자·발행일·구체 사례를 이 노트에 보강하고, "아키텍처 / DX / 워크플로우 모델" 세 축 설명이 실제 원문 논지 전개와 같은지 대조.)*
