---
title: "Databasus — '덤프가 끝났다'가 아니라 '실제로 복원되고 행 수까지 맞다'를 매번 증명하는 셀프 호스팅 백업 도구"
source_title: "Databasus — PostgreSQL backup tool with Point-In-Time-Recovery and restore verification"
source_url: "https://github.com/databasus/databasus"
source_name: "GitHub (databasus/databasus) · databasus.com"
referrer_url: "https://news.hada.io/topic?id=33305"
published_at: "2026 (지속 개발 중)"
summarized_at: "2026-09-07"
category: "backend"
tags: ["database-backup", "postgresql", "point-in-time-recovery", "restore-verification", "self-hosted", "disaster-recovery"]
---

# Databasus — "복원까지 검증된 백업"만 백업이라 부른다

> 출처: [Databasus](https://github.com/databasus/databasus) (GitHub · databasus.com) · GeekNews(id=33305) 경유 · 정리일 2026-09-07

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 직접 열람하지 못했다. GitHub README, databasus.com 공식 페이지, Medium·dev.to 리뷰 글을 WebSearch 스니펫으로 교차 확인했다. Apache 2.0 라이선스·약 7,000 GitHub 스타·60만+ Docker pull이라는 수치는 검색 시점의 스니펫 기준이라 현재와 다를 수 있다.

## 한 줄 요약

**PostgreSQL·MySQL·MariaDB·MongoDB를 대상으로 하는 오픈소스 셀프 호스팅 백업 도구로, 가장 차별화된 기능은 "복원 검증(restore verification)" — 백업이 끝났다는 상태가 아니라 그 백업을 실제로 별도 컨테이너에 복원해서 원본과 대조한 테이블별 행 수까지 매번 자동 보고한다.**

## 핵심 포인트

- **"백업 성공"의 정의를 바꾼다** — 기존 백업 도구 대부분은 "덤프 프로세스가 에러 없이 끝났다"를 성공으로 본다. Databasus는 여기서 한 걸음 더 나아가, ***최신 백업을 일회용(throwaway) 데이터베이스 컨테이너에 실제로 복원하고, 원본과 대조해 테이블별 행 수를 매 실행마다 보고***한다. "덤프가 끝났다"와 "복원해도 데이터가 맞다"는 서로 다른 명제라는 점을 도구 설계로 강제한 셈이다.
- **검증 에이전트는 별도 경량 Go 바이너리** — 복원 검증은 별도의 "검증 에이전트(verification agent)"라는 단일 경량 Go 바이너리가 수행한다. Databasus UI에서 먼저 등록한 뒤, 사용자가 직접 통제하는 호스트에 이 바이너리를 실행하는 구조 — 즉 검증 인프라 자체를 사용자가 소유·통제한다(셀프 호스팅 철학의 연장).
- **PostgreSQL은 PITR까지 지원** — PostgreSQL 대상으로는 전체/증분 물리 백업과 WAL 스트리밍 기반의 특정 시점 복구(Point-In-Time-Recovery)를 지원해, 마지막 백업 이후의 변경사항까지 원하는 시점으로 복구할 수 있다.
- **다중 저장소·알림 통합** — S3·Google Drive·FTP 등 다양한 저장소로 백업하고, Slack·Discord·Telegram 등으로 진행 상황을 알릴 수 있다. 백업 파일과 민감 데이터는 AES-256-GCM으로 암호화하며, 기본적으로 읽기 전용(read-only) DB 연결을 사용한다.
- **오픈소스·활발한 채택** — Apache 2.0 라이선스, 다수의 기여자, PostgreSQL 공식 생태계 목록에도 등재됐다는 정황(dev.to 리뷰)이 확인된다 — "표준 선택지"로 자리잡아가는 신호로 보인다.

## 인상 깊은 문장

> "Restore verification changes what a backup status means. Instead of 'the dump finished', you get 'the backup restored into a real database, and here are the row counts'." (Databasus 공식 문서, WebSearch 스니펫)

## 댓글

이 세션에서는 hada 댓글·본문에 직접 접근하지 못했다. HN·Lobsters 별도 큐레이션 여부도 확인하지 못했다. **출처 한계**: 실제 대규모 프로덕션 환경에서의 복원 검증 소요 시간·리소스 비용(매번 별도 컨테이너를 띄워 복원하는 구조이므로 그 자체가 인프라 비용)은 공식 자료만으로는 가늠하기 어렵다.

## 내 생각 · 적용점

### 핵심 전이 1 — "검증되지 않은 백업은 백업이 아니다"라는 원칙이 도구 설계로 강제된 사례

이전에 정리한 재해복구·인프라 신뢰성 계열 노트들이 공통으로 강조한 원칙 — "복구 절차를 실제로 테스트해보지 않은 백업은 신뢰할 수 없다" — 을 Databasus는 아예 ***도구의 기본 동작(매 실행마다 자동 복원 검증)***으로 만들어버렸다. 이는 "사람이 분기별로 DR 훈련을 해야 한다"는 프로세스적 해법 대신, ***검증을 자동화 파이프라인 안에 구조적으로 내장***하는 접근이다 — 사람의 규율에 의존하지 않는다는 점에서 더 견고하다.

### 핵심 전이 2 — 같은 날 정리한 NAS/백업 파일시스템 논의와 계층이 다른 문제

같은 배치에서 함께 정리한 [[2026-09-07-nas-backup-filesystem-choice]]가 "어떤 파일시스템으로 백업 무결성을 보장할까"(스토리지 계층)를 다뤘다면, Databasus는 "백업된 데이터가 애플리케이션 레벨에서 실제로 복원 가능한가"(데이터베이스 논리 계층)를 다룬다. 둘은 서로 다른 계층의 문제이며, 견고한 백업 전략은 두 계층 모두를 커버해야 한다는 점이 두 글을 나란히 놓고 보면 더 분명해진다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 높다.** CRS/PMS는 예약·결제·재고(객실 가용성) 데이터의 정합성이 서비스 신뢰도와 직결되는 도메인이다. ***"백업이 성공했다"는 로그만 보고 안심하지 말고, 정기적으로(예: 주 1회) 실제 복원 테스트를 자동화해 테이블별 행 수·핵심 무결성 제약을 자동 검증하는 파이프라인을 두는 것***은 이 글의 핵심 원칙을 그대로 가져올 수 있는 지점이다. 특히 예약 테이블처럼 "행 수가 조금만 달라도 이중예약·유실예약으로 이어지는" 테이블에서는 이런 자동 검증의 가치가 크다.

## 연관 자료

- [[2026-09-07-nas-backup-filesystem-choice]] — 같은 날 정리한 백업 주제, 스토리지 계층 vs 데이터베이스 논리 계층으로 서로 보완

## 한 달 뒤 회고

*(2026-10-07 즈음 — CRS 팀 백업 파이프라인에 복원 검증 단계가 실제로 있는지 점검, 없다면 Databasus 같은 도구 도입 검토.)*
