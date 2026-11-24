---
title: "스마일샤크, AWS Transform으로 SQL Server를 Aurora PostgreSQL로 현대화 (AWS, 고객사 사례 자체 미확인) — 자동 변환 2단 구조가 또 반복된다"
source_title: "스마일샤크, AWS Transform 으로 Microsoft SQL Server를 Amazon Aurora PostgreSQL로 현대화한 사례"
source_url: "https://aws.amazon.com/ko/blogs/tech/smileshark-aws-transform-sql-server-aurora-postgresql/"
source_name: "AWS 기술 블로그(한국)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (aws.amazon.com 세션 차단으로 미확인)"
summarized_at: "2026-11-24"
category: "backend"
tags: ["database-migration", "sql-server", "aurora-postgresql", "aws-transform", "legacy-modernization"]
---

# 스마일샤크, AWS Transform으로 SQL Server를 Aurora PostgreSQL로 현대화 (AWS)

> 출처: [스마일샤크, AWS Transform으로 Microsoft SQL Server를 Amazon Aurora PostgreSQL로 현대화한 사례](https://aws.amazon.com/ko/blogs/tech/smileshark-aws-transform-sql-server-aurora-postgresql/) (AWS 기술 블로그) · Slack `#개발-뉴스-dev-news` TechArticles 직공유(GeekNews 아님) · 정리일 2026-11-24

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단되어 원문을 열람하지 못했다. WebSearch로 "스마일샤크"라는 고객명 자체는 어떤 독립 매체에서도 확인되지 않았다 — 이 노트의 고객 사례 서사는 Slack 발췌(라이선스 비용 절감, 운영 유연성, 자동 변환 가속)에만 의존한다. 다만 AWS Transform for SQL Server의 일반 기능은 교차확인됐다: 2026-08-03 GA된 오프라인 변환 기능으로 SQL Server 2012~2022를 DDL 업로드만으로 평가·변환·검증·배포할 수 있고, AWS 자체 수치로 "최대 5배 가속"을 내세운다. 데이터 이관(실제 레코드 이동)은 별도 서비스(AWS DMS)가 맡는다.

## 한 줄 요약

**스마일샤크가 AWS Transform으로 SQL Server를 Aurora PostgreSQL로 전환해 라이선스 비용과 운영 유연성을 확보했다고 주장하는 AWS 자사 고객 사례 글이지만, "스마일샤크"라는 고객 자체는 독립 검증되지 않았고 AWS Transform의 일반 기능만 공식적으로 확인된다.**

## 핵심 포인트

- Slack 발췌에 따르면 스마일샤크는 ***라이선스 비용 절감과 운영 유연성 확보***를 목표로 SQL Server → Aurora PostgreSQL 전환 전략을 "성공적으로" 수행했다고 서술한다 — 성공 여부의 판단 기준은 원문 없이 알 수 없다.
- AWS Transform 도구가 ***스키마 변환 및 데이터 이관 과정을 가속***했다고 하며, 이는 AWS Transform이 DDL만으로 변환을 수행하는 공식 기능과 맥락이 같다.
- WebSearch로 교차확인된 일반 사실: AWS Transform for SQL Server는 2026-08-03 GA, SQL Server 2012~2022 지원, 평가→변환→검증→배포 단계를 AWS 자체 "최대 5배 가속" 수치로 홍보한다.
- 같은 레포에 이미 거의 동일한 전환 축(SQL Server → Aurora PostgreSQL)을 다룬 선행 사례가 있다 — [[2026-11-09-smilegate-sql-server-modernization-claude-code]](스마일게이트, AWS Transform + Claude Code 2단 구조).

## 인상 깊은 문장

> (원문 접속이 차단되어 1차 인용은 확보하지 못했다. "성공적으로 수행"이라는 표현만 Slack 발췌에 남아 있다.)

## 댓글

GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글·HN/Lobsters 큐레이션 대상이 아니다. AWS 자사 기술 블로그이므로 AWS Transform을 홍보하려는 이해관계가 있다. "스마일샤크"라는 회사명 자체가 WebSearch로 전혀 발견되지 않는다는 점은, 비교적 작은 고객사이거나 번역/표기 차이(원문 영문명 추정 불가)일 가능성을 열어둔다.

## 내 생각 · 적용점

### 핵심 전이 — 이름만 다른 같은 사례가 레포에 반복해서 쌓인다

[[2026-11-09-smilegate-sql-server-modernization-claude-code]]는 보름 전 "스마일게이트"의 STOVE 스토어를 같은 AWS Transform으로 SQL Server에서 Aurora PostgreSQL로 옮긴 사례였다 — 거기서는 "자동 변환 도구 + Claude Code"라는 2단 구조가 핵심이었다. 이 글은 Claude Code 언급 없이 AWS Transform 단독 적용만 내세운다는 점이 다르다. ***두 글을 나란히 놓으면, AWS Transform이 혼자서도 "성공"이라고 홍보되는 사례와 추가로 코딩 에이전트를 투입해야 끝나는 사례가 공존***한다는 뜻이고, 그 차이가 전환 복잡도(저장 프로시저 양, 커스텀 로직 비중)에서 오는지 아니면 단순히 마케팅 글의 강조점 차이인지는 원문 없이 구분할 수 없다.

### 적용점

고객 사례 글의 "성공적으로 수행"이라는 표현은 실패율·수작업 비중을 밝히지 않는 홍보 문구로 다뤄야 한다 — AWS Transform을 실제 도입 검토할 때는 이 글의 주장이 아니라 자체 파일럿 전환 비율로 판단해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 레거시 PMS/CRS가 SQL Server 기반인 경우가 드물지 않아, "DDL만 업로드해 오프라인으로 평가·변환"하는 AWS Transform의 접근은 실제 DB 연결 없이 사전 평가를 해볼 수 있다는 점에서 참고할 만하다. 다만 "스마일샤크" 고유 수치는 검증되지 않았으므로, 공식 AWS Transform 기능으로만 인용해야 한다.

## 연관 자료

- [[2026-11-09-smilegate-sql-server-modernization-claude-code]] — 같은 AWS Transform, 같은 SQL Server→Aurora PostgreSQL 전환축을 다룬 선행 사례(Claude Code 2단 구조 포함)
- [[2026-09-10-bedrock-gamma-oracle-to-postgresql-migration]] — 다른 소스 DB(Oracle)지만 같은 PostgreSQL 귀결, 같은 "자동 변환 + AI" 2단 구조

## 한 달 뒤 회고

2026-12-24 즈음 — `aws.amazon.com` 접속이 가능해지면 "스마일샤크"라는 고객명과 전환 규모를 원문으로 재확인.
