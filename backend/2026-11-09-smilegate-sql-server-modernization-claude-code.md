---
title: "스마일게이트의 MS SQL 데이터베이스 현대화 (AWS) — 자동 변환 도구가 끝내지 못한 마지막 구간을 Claude Code가 메운다"
source_title: "스마일게이트의 MS SQL 데이터베이스 현대화 – AWS Transform for SQL Server와 Claude Code의 하이브리드 전략"
source_url: "https://aws.amazon.com/ko/blogs/tech/smilegate-sql-server-modernization-aws-transform/"
source_name: "AWS 기술 블로그(한국)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (aws.amazon.com 차단으로 미확인)"
summarized_at: "2026-11-09"
category: "backend"
tags: ["database-migration", "sql-server", "aurora-postgresql", "aws-transform", "claude-code", "legacy-modernization", "hybrid-strategy"]
---

# 스마일게이트의 MS SQL 데이터베이스 현대화 (AWS)

> 출처: [스마일게이트의 MS SQL 데이터베이스 현대화 – AWS Transform for SQL Server와 Claude Code의 하이브리드 전략](https://aws.amazon.com/ko/blogs/tech/smilegate-sql-server-modernization-aws-transform/) (AWS 기술 블로그) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, GeekNews 아님) · 정리일 2026-11-09

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(`getaddrinfo ENOTFOUND`)되어 원문을 한 줄도 열람하지 못했다. WebSearch로 "AWS Transform for SQL Server" 자체는 교차확인했다 — AWS 공식 문서 기준으로 SQL Server 2017/2019/2022를 Aurora PostgreSQL(15+)로 옮기며 스키마·저장 프로시저·함수·트리거를 변환하고, Entity Framework·ADO.NET·연결 문자열 같은 .NET 애플리케이션 코드까지 리팩터링하는 서비스이며, 2026-08에 라이브 DB 연결 없이 DDL 파일만으로 변환하는 오프라인 소스 기능이 GA됐고 AWS Transform MCP 서버로 IDE에서도 작업할 수 있다는 점까지는 확인됐다. 다만 **스마일게이트·STOVE라는 실제 도입 사례, 전환 규모(DB 개수·데이터량), Claude Code를 구체적으로 어느 단계에 어떻게 투입했는지는 WebSearch로도 찾지 못했다** — 이 노트의 "핵심 포인트"는 Slack 발췌(절단됨)와 AWS Transform 일반 기능 설명을 합친 수준이며, 스마일게이트 고유의 서사는 원문 복구 전까지 확인 불가로 남긴다.

## 한 줄 요약

**스마일게이트가 MS SQL Server 기반 게임 스토어 STOVE를 Aurora PostgreSQL로 옮기면서, AWS Transform이라는 규칙 기반 자동 변환 도구로 스키마·저장 프로시저 변환의 대부분을 처리하고, 그 도구가 끝내지 못한 나머지 복잡한 구간을 Claude Code를 도입해 마무리했다고 주장하는 하이브리드 마이그레이션 사례다.**

## 핵심 포인트

- **전환 대상**: MS SQL Server 기반 STOVE 스토어를 ***Aurora PostgreSQL***로 전환. AWS Transform은 공식적으로 SQL Server 2017/2019/2022 → Aurora PostgreSQL 15+ 전환을 지원한다(WebSearch 교차확인).
- **1단계 — 자동 변환 도구가 처리하는 영역**: Slack 발췌에 따르면 ***데이터베이스 엔진 변경에 따른 저장 프로시저 및 애플리케이션 데이터 접근 계층의 복잡한 변환***을 AWS Transform이 자동화했다고 함. AWS 공식 문서가 설명하는 기능(스키마·SP·함수·트리거 변환 + Entity Framework/ADO.NET/연결 문자열 리팩터링)과 결이 같다.
- **2단계 — Claude Code가 메우는 구간**: Slack 발췌는 "AWS Transform으로 자동화된 변환 후 ***남은 세부 작업을 Claude Code를 도입해 효율적으로 마무리***함"이라고 절단되어 끝난다. 구체적으로 어떤 종류의 변환 실패·엣지 케이스를 Claude Code가 처리했는지는 원문 없이 알 수 없다.
- **업계 맥락(WebSearch로만 확인, 이 글 고유 사실 아님)**: AWS Transform이 2026-08부터 라이브 DB 연결 없이 DDL만으로 변환 가능한 오프라인 기능을 내놓았고, 웹 콘솔 외에 MCP 서버로 IDE와 연동할 수 있다고 안내한다 — ***AWS 자체가 "자동 변환 도구 + AI 코딩 에이전트"를 한 워크플로우에 엮는 방향으로 제품을 설계하고 있다는 정황***은 뒷받침되지만, 스마일게이트가 정확히 이 경로를 썼는지는 확인 못함.

## 인상 깊은 문장

> "AWS Transform으로 자동화된 변환 후 남은 세부 작업을 Claude Code를 도입해 효율적으로 마무리함…" (Slack 발췌, 문장 절단)

## 댓글

GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글·HN/Lobsters 큐레이션 대상이 아니다. AWS 자사 기술 블로그이므로 AWS Transform·Claude Code(Anthropic과의 파트너십) 양쪽 다 홍보하려는 이해관계가 있을 수 있다. "하이브리드 전략"이라는 제목 자체가 "자동화 도구 혼자서는 100% 못 끝낸다"는 걸 전제하는데, 그 실패율·수작업 비중이 구체적으로 얼마인지는 밝히지 않은(또는 Slack 발췌에서 끊긴) 것으로 보인다.

## 내 생각 · 적용점

### 핵심 전이 1 — "자동 변환 도구 + AI 코딩 에이전트" 2단 구조가 레거시 DB 마이그레이션의 반복 패턴으로 굳어지고 있다

[[2026-09-10-bedrock-gamma-oracle-to-postgresql-migration]]은 Oracle→PostgreSQL 전환에서 GAMMA라는 멀티 에이전트가 "기존 규칙 기반 도구(SCT류)가 못 푸는 복잡한 비즈니스 로직"을 맡는다고 주장했다. 이 스마일게이트 글은 같은 구조를 SQL Server→Aurora PostgreSQL 축에서 반복한다 — ***1단계는 항상 규칙 기반 자동 변환, 2단계는 AI(에이전트든 코딩 어시스턴트든)가 나머지를 메운다.*** 다른 점은 2단계 도구의 정체다. GAMMA 글은 "AWS 자체 멀티 에이전트"를, 이 글은 "범용 코딩 에이전트(Claude Code)"를 쓴다 — AWS가 DB 마이그레이션의 "마지막 구간"을 자사 전용 에이전트로 채울지, 범용 코딩 에이전트에 맡길지 아직 하나로 정해지지 않았다는 신호로 읽을 수 있다.

### 핵심 전이 2 — "원문 없이 짐작과 확인된 사실을 섞지 않는다"는 같은 교훈의 반복

[[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]도 원문이 전면 차단된 레거시 마이그레이션 사례였고, 거기서 세운 원칙 — ***"제목·발췌로 짐작한 내용"과 "실제 확인된 사실"을 분리해 적는다*** — 을 이 노트도 그대로 따랐다. AWS Transform의 일반 기능은 공식 문서로 확인됐지만, 스마일게이트 고유의 수치·과정은 확인 못 했다는 걸 명시적으로 나눴다.

### 핵심 전이 3 — Claude Code가 "마무리 단계"에 들어가는 또 다른 실사례

[[2026-11-06-com2us-claude-code-skill-backoffice-tool]]은 Claude Code(superpowers 플러그인)로 백오피스 툴을 하루 만에 구축한 사례였다. 이 글은 반대 방향이다 — ***도구를 처음부터 Claude Code로 짓는 게 아니라, 다른 자동화 도구(AWS Transform)가 먼저 대부분을 처리한 뒤 Claude Code가 꼬리 구간만 맡는다.*** 같은 도구가 "주연"과 "마무리 투수" 양쪽 역할 모두에 쓰이고 있다는 사례 축적.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성 있음.** 온다 CRS가 레거시 DB(오래된 온프레미스 SQL Server 등)를 클라우드 네이티브 DB로 옮겨야 하는 상황이 생긴다면, 이 글이 보여주는 "자동 변환 도구가 80~90%를 처리하고 AI 코딩 에이전트가 나머지 예외 케이스(복잡한 저장 프로시저, 도메인 특화 쿼리)를 처리한다"는 2단 구조는 그대로 참고할 만하다. 단, 이 글 자체가 "몇 %가 자동으로 끝났고 몇 %가 Claude Code 몫이었는지" 수치를 밝히지 않아, 실제 투입 전에는 반드시 자체 파일럿으로 그 비율을 먼저 재보아야 한다 — [[2026-09-10-bedrock-gamma-oracle-to-postgresql-migration]] 노트가 짚었듯 "72%" 같은 숫자도 분모를 모르면 판단 근거가 되지 못한다.

## 연관 자료

- [[2026-09-10-bedrock-gamma-oracle-to-postgresql-migration]] — 같은 "자동 변환 + AI 에이전트 2단 구조"를 Oracle→PostgreSQL 축에서 먼저 보여준 선행 사례
- [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]] — 원문 차단 속에서 "짐작과 확인된 사실을 분리한다"는 같은 태도를 먼저 세운 레거시 마이그레이션 노트
- [[2026-11-06-com2us-claude-code-skill-backoffice-tool]] — Claude Code가 이번엔 "마무리 투수"가 아니라 "주연"으로 쓰인 대조 사례

## 한 달 뒤 회고

- 2026-12-09 즈음 점검: `aws.amazon.com` egress가 풀리면 원문을 재확인해 스마일게이트의 실제 마이그레이션 규모·Claude Code가 처리한 구체적 작업 유형·수작업 대비 절감 비율을 이 노트에 보강한다.
