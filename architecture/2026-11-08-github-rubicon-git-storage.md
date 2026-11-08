---
title: "GitHub의 새 Git 스토리지 아키텍처 Rubicon — 에이전트 5,000개가 저장소 하나에 초당 7,200회 푸시(GitHub Engineering)"
source_title: "Inside GitHub's new Git storage architecture"
source_url: "https://github.blog/"
source_name: "GitHub Engineering 블로그, Karthik Raman (noise.getoto.net 미러로 교차확인, 원문 github.blog 직접 확인은 실패)"
referrer_url: "https://news.hada.io/topic?id=36751"
published_at: "2026-11-05"
summarized_at: "2026-11-08"
category: "architecture"
tags: ["github", "git", "storage-architecture", "ref-cas", "azure-blob-storage", "agentic-development", "benchmark"]
---

# GitHub의 새 Git 스토리지 아키텍처 - 저장소 하나에서 초당 7,200회 푸시를 처리

> 출처: [Inside GitHub's new Git storage architecture](https://github.blog/) (GitHub Engineering, Karthik Raman) · 정리일 2026-11-08

> **출처 한계.** github.blog 원본과 news.hada.io 모두 이 세션에서 egress 차단되어, **제3자 미러(noise.getoto.net)에 대한 WebSearch 스니펫**으로만 내용을 재구성했다. "7,200회 푸시/초" 수치는 **GitHub가 자체 내부 테스트로 발표한 단일 소스 주장**이며, 하드웨어 사양·테스트 방법론·비교 기준선은 공개되지 않았다. 발표 시점은 2026년 11월 초 GitHub Universe로 추정된다.

## 한 줄 요약

**GitHub는 Git 객체(팩)는 Azure Blob Storage에, 참조·팩 매니페스트는 별도의 복제 로그 서비스 "Ref-CAS"에 분리 저장하는 새 저장소 아키텍처 "Rubicon"을 공개했다 — 내부 테스트에서 에이전트 5,000개가 저장소 하나에 초당 7,200회 푸시하는 동안에도 읽기는 낮은 지연을 유지했다고 밝혔다.**

## 핵심 포인트

- **분리 저장 구조**: Git 팩과 읽기 가속용 보조 데이터는 **Azure Blob Storage**에, 참조(ref)와 "이 저장소를 구성하는 팩 목록(팩 매니페스트)"은 **Ref-CAS**(별도의 복제 로그 서비스)에 둔다.
- **쓰기 경로**: 레플리카가 새 팩을 Blob Storage에 올린 뒤, **Ref-CAS에 단일 트랜잭션**으로 매니페스트 갱신과 참조 업데이트를 동시에 반영한다. 즉 **동기화가 필요한 범위를 참조 갱신 하나로 좁힌 것**이 핵심 설계.
- **읽기 경로**: 레플리카는 자신의 참조 버전을 Ref-CAS와 대조하고, 필요한 팩을 받아와 캐시에서 서빙한다.
- **압축(compaction)**: 백그라운드 노드가 Blob Storage·Ref-CAS에 직접 접근해 팩을 병합하고 도달 불가능한 객체를 제거한다 — 서빙 경로와 분리되어 있어 **스토리지·서빙·유지보수가 독립적으로 확장**된다.
- **벤치마크(단일 소스 주장)**: 내부 테스트에서 저장소 하나에 **에이전트 5,000개가 동시 작업**하며 **초당 7,200회 푸시**를 보내는 동안 읽기 트래픽은 지속적으로 낮은 지연을 유지했다고 밝혔다. 이름 "Rubicon"은 **"에이전트 기반 개발로 업계가 넘은 돌아올 수 없는 지점"**을 뜻한다고 저자가 직접 밝혔다.
- 2026년 5월, Azure로의 초기 마이그레이션 직후부터 이 설계 작업을 시작했다고 밝혀, **약 6개월의 내부 개발 끝에 공개**된 것으로 보인다. GA(정식 출시) 일정은 공개되지 않았다.

## 인상 깊은 문장

> "Through internal testing, we've demonstrated the ability to support 5,000 concurrent agents working on a repository, sending 7,200 pushes per second to a repo, all while serving read traffic with consistently low latency." — GitHub Engineering 블로그 (제3자 미러 경유)

## 댓글

GN⁺·HN 댓글 모두 이 세션에서 직접 확인하지 못했다(news.hada.io 차단, github.blog 원문도 차단). **7,200회/초라는 숫자는 GitHub 혼자 측정하고 발표한 것**이라는 점, 그리고 같은 날 GitHub가 "월간 커밋 74억 건, CPU 코어 400만 개 추가 계획"도 함께 발표했다는 정황(다른 검색 결과에서 확인)은 **이 발표가 단일 기능 공지가 아니라 "에이전트가 1차 사용자가 된 시대에 맞춘 인프라 전면 재설계" 캠페인의 일부**임을 시사한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-08-ersc-what-comes-after-git]], [[2026-11-08-gitlab-agent-source-control]]과의 계열 — "참조만 강하게 동기화, 객체는 느슨하게"라는 공통 설계

Ref-CAS의 핵심은 **"대용량 불변 객체(팩)는 어디에 두든 상관없지만, 참조(ref)가 가리키는 지점만큼은 반드시 하나의 진실로 동기화해야 한다"**는 분리다. 이는 ERSC·GitLab이 택한 방향과 동일한 통찰이며, 세 회사가 독립적으로 같은 해법에 도달했다는 것이 이 배치 전체의 핵심 메시지다.

### 핵심 전이 2 — [[2026-11-04-openai-pando-git-backend-monorepo-scaling]]과의 비교 — "분산 로그로 참조를 관리"하는 패턴의 반복 등장

OpenAI Pando가 모노레포 스케일링을 위해 비슷한 분리 설계를 택했다면, GitHub Rubicon은 **멀티테넌트 SaaS(GitHub.com) 규모에서 같은 패턴을 적용**한 사례다. "단일 조직 내부용"과 "전 세계 고객을 위한 공개 플랫폼용"이라는 다른 제약 조건에서도 같은 아키텍처 원형이 재등장하는 건 이 패턴의 일반성을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀지만, "참조만 강하게 동기화하고 나머지는 느슨하게 둔다"는 원칙은 재사용 가치가 있다.** 예를 들어 CRS의 재고(인벤토리) 시스템에서 **"남은 객실 수"처럼 반드시 단일 진실이어야 하는 작은 데이터**와 **"예약 상세 로그"처럼 대용량이지만 즉시 일관성이 필요 없는 데이터**를 분리 저장·분리 확장하는 설계는 이 노트의 패턴과 정확히 같은 발상이다.

## 연관 자료
- [[2026-11-08-ersc-what-comes-after-git]] — 스타트업 관점의 같은 문제 해법
- [[2026-11-08-gitlab-agent-source-control]] — GitLab의 같은 문제 해법과 구체적 벤치마크
- [[2026-11-04-openai-pando-git-backend-monorepo-scaling]] — 모노레포 스케일링이라는 인접 사례
- [[2026-10-14-anthropic-scion-source-control]] — Anthropic의 선행 사례

## 한 달 뒤 회고

*(2026-12-08 즈음 — Rubicon이 GitHub.com 전체에 롤아웃됐는지, 7,200 push/s 수치에 대한 독립 벤치마크나 장애 사례가 나왔는지 확인.)*
