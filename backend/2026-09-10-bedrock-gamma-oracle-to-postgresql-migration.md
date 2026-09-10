---
title: "Amazon Bedrock 기반 멀티 에이전트 GAMMA로 Oracle-to-PostgreSQL 마이그레이션 가속화하기 (AWS) — 수동 작업 51% 감소, 정확도 72%라는 숫자 뒤에 남는 28%가 관건"
source_title: "Accelerate Oracle-to-PostgreSQL migration with GAMMA on Amazon Bedrock"
source_url: "https://aws.amazon.com/ko/blogs/tech/accelerate-oracle-to-postgresql-migration-with-gamma-on-amazon-bedrock/"
source_name: "AWS 기술 블로그(추정, 이번 세션 접근 전면 차단), Slack TechArticles 경유"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/accelerate-oracle-to-postgresql-migration-with-gamma-on-amazon-bedrock/"
published_at: "확인 불가 (aws.amazon.com 차단으로 미확인, 2026년 게시로 추정)"
summarized_at: "2026-09-10"
category: "backend"
tags: ["database-migration", "oracle", "postgresql", "amazon-bedrock", "multi-agent", "legacy-modernization", "code-conversion"]
---

# Amazon Bedrock 기반 멀티 에이전트 GAMMA로 Oracle-to-PostgreSQL 마이그레이션 가속화하기 (AWS)

> 출처: [Accelerate Oracle-to-PostgreSQL migration with GAMMA on Amazon Bedrock](https://aws.amazon.com/ko/blogs/tech/accelerate-oracle-to-postgresql-migration-with-gamma-on-amazon-bedrock/) (AWS 기술 블로그) · Slack TechArticles 경유 · 정리일 2026-09-10

> **출처 한계**: `aws.amazon.com`이 이번 세션에서 전면 차단돼 원문을 단 한 줄도 직접 확인하지 못했다. 이 노트는 사실상 Slack `#개발-뉴스-dev-news`에 TechArticles 봇이 올린 발췌 세 줄만이 유일한 1차 정보원이다. WebSearch로 "GAMMA"라는 이름 자체와 "수동 작업량 51% 감소", "코드 변환 정확도 72%"라는 두 수치를 여러 조합으로 교차 검색했지만 어디에서도 독립적으로 확인하지 못했다. 대신 같은 문제 공간(AWS Bedrock + Oracle→PostgreSQL 자동 변환)을 다루는 인접 자료 두 개를 찾았다 — AWS Database Blog의 "Automate Oracle PL/SQL to PostgreSQL migration with Amazon Bedrock and Strands Agents"(Inventory Agent·Compilation Agent·Lint & Semantic Analysis Agent로 역할을 나눈 멀티 에이전트 구조를 설명)와, `aws-samples/sample-oracle-modernization-accelerator`라는 별도의 AWS 공식 GitHub 오픈소스 도구(OMA, DDL 95% 자동 변환 + AI 에이전트로 나머지 처리, 688개 테이블·1,500만+ 행 실제 검증 사례 명시). 이 둘은 GAMMA와 이름·수치가 다른 별개 프로젝트로 보이며, GAMMA를 대신 검증하는 자료로 쓸 수 없다 — 다만 AWS가 이 영역(Oracle→PostgreSQL 에이전트 기반 변환)에 동시에 여러 프로젝트를 진행 중이라는 정황은 뒷받침한다. 저자·발행일·"72%"가 무엇을 분모로 한 수치인지(라인 수? 오브젝트 수? 컴파일 성공 기준?)는 전혀 확인하지 못했다.

## 한 줄 요약

**GAMMA는 Amazon Bedrock 위에서 동작하는 멀티 에이전트 프레임워크로, Oracle→PostgreSQL 마이그레이션에서 기존 자동 변환 도구(AWS SCT 등 규칙 기반 도구로 추정)가 못 푸는 복잡한 비즈니스 로직과 의존성을 "지능형 코드 변환"으로 자동화한다고 주장한다.** Slack 발췌에 따르면 엔터프라이즈 규모 마이그레이션에서 수동 작업량을 51% 줄이고, 코드 변환 정확도 72%를 달성했다고 한다. 다만 이 수치의 산출 기준·검증 방법·독립 재현 여부는 원문 자체를 확인하지 못해 이 노트만으로는 판단할 수 없고, 72%라는 숫자는 뒤집으면 나머지 28%가 여전히 사람이 검토해야 할 몫이라는 뜻이라는 점이 이 노트가 가장 강조하고 싶은 지점이다.

## 핵심 포인트

- **GAMMA의 정체** — Amazon Bedrock 기반 멀티 에이전트 프레임워크. 단일 LLM 호출이 아니라 여러 에이전트가 역할을 나눠 Oracle→PostgreSQL 변환 파이프라인을 수행하는 구조로 추정된다(정확한 에이전트 구성은 원문 미확인).
- **기존 도구와의 차별점으로 내세우는 지점** — ***"기존 도구로 해결하기 어려운 비즈니스 로직과 복잡한 의존성"***을 다룬다고 주장한다. Oracle의 PL/SQL 저장 프로시저·트리거·패키지처럼 규칙 기반 변환기(AWS SCT류)가 기계적으로 못 옮기는 영역을 겨냥한 것으로 보인다.
- **핵심 수치 ①** — 엔터프라이즈 규모 마이그레이션에서 수동 작업량 51% 감소. 무엇을 "수동 작업"으로 정의했는지(엔지니어 시간? 검토 대상 오브젝트 수?)는 불명확하다.
- **핵심 수치 ②** — 코드 변환 정확도 72% 달성. 이 노트에서 가장 중요하게 다루는 숫자이지만, 분모·측정 방법·"정확도"의 정의(컴파일 성공률인지, 동작 동등성인지)가 원문 미확인으로 불명확하다.
- **인접 사례로 유추 가능한 아키텍처 패턴** — 같은 AWS Bedrock + Oracle→PostgreSQL 영역의 다른 블로그("Automate Oracle PL/SQL to PostgreSQL migration with Amazon Bedrock and Strands Agents")는 Inventory Agent(의존성 맵)·Compilation Agent(생성 순서·의존성 검증)·Lint & Semantic Analysis Agent(정적 분석)로 역할을 나눈 멀티 에이전트 구조를 취한다 — GAMMA와 동일하다는 보장은 없지만, 이 문제를 여러 AWS 팀이 "역할별 에이전트 분해"라는 같은 패턴으로 접근하고 있다는 정황은 된다.
- **AWS 자체가 이 영역에 복수 프로젝트를 운영 중** — GAMMA 외에도 `aws-samples/sample-oracle-modernization-accelerator`(OMA)라는 별도 오픈소스 도구가 존재하며, DDL의 95%를 DMS로 자동 처리하고 나머지 5%를 AI 에이전트로 보완한다고 GitHub README에 명시돼 있다(688개 테이블·1,500만+ 행 실증). 두 프로젝트가 서로 다른 수치·다른 이름을 쓴다는 것은, 이 영역의 "정확도" 숫자가 아직 벤더 내부에서도 표준화되지 않았다는 신호로 읽을 수 있다.
- **벤더 자체 발표라는 이해관계** — AWS가 자사 서비스(Bedrock)를 홍보하는 기술 블로그 글이라는 점을 감안해야 한다. 51%·72%가 어떤 고객사/POC 기준인지, 몇 개 사례의 평균인지(n=1 가능성) 원문 없이는 판단 불가.

## 인상 깊은 문장

> "GAMMA는 Amazon Bedrock 기반의 멀티 에이전트 프레임워크로 복잡한 Oracle-to-PostgreSQL 변환을 자동화함" (Slack 요약 발췌)

> "기존 도구로 해결하기 어려운 비즈니스 로직과 복잡한 의존성을 지능형 코드 변환을 통해 효율적으로 처리함" (Slack 요약 발췌)

> "엔터프라이즈 규모의 마이그레이션에서 수동 작업량을 51% 줄이고 코드 변환 정확도를 72%까지 달성함" (Slack 요약 발췌)

## 댓글

이 글은 GeekNews가 아니라 Slack TechArticles 봇이 aws.amazon.com 링크를 직접 게시한 경로라 hada 댓글이라는 개념 자체가 없다. HN·Lobsters 등 외부 큐레이션 여부도 `aws.amazon.com` 전면 차단으로 확인하지 못했다. 감안할 점: ①AWS의 자체 서비스(Bedrock) 홍보 성격이 강한 벤더 발표문이라 성공 수치가 유리하게 선별됐을 가능성을 배제할 수 없다. ②51%·72%가 몇 건의 사례를 근거로 한 수치인지(n=?) 전혀 알 수 없다 — "엔터프라이즈 규모"라는 표현만으로는 1개 고객사 POC인지 여러 사례의 평균인지 판단이 안 된다. ③WebSearch로 "GAMMA"라는 이름 자체를 독립적으로 확인하지 못했다는 것 자체가 이 노트의 가장 큰 정직성 문제다 — 이름·수치 모두 Slack 발췌 세 줄에 전적으로 의존한다.

## 내 생각 · 적용점

### 핵심 전이 1 — "정답지가 있는가"라는 잣대로 보면 72%는 낮은 게 아니라 오히려 정직한 숫자일 수 있다

[[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]가 정리한 원칙은 "AI의 배율은 작업의 난이도가 아니라 검증의 자동화 가능성에 비례한다"는 것이었다. Bun의 Zig→Rust 이식이 높은 배율을 낸 건 "Node.js 호환성"이라는 외부 정답지(테스트 스위트)가 이미 존재했기 때문이다. Oracle→PostgreSQL 마이그레이션은 이 기준에서 훨씬 불리한 위치에 있다 — 두 DB가 SQL 방언·NULL 처리·시퀀스·날짜 연산·트랜잭션 격리 수준까지 다르게 설계된 서로 다른 시스템이라, "정답"이 원본 코드 안에 있지 않고 "원본이 실제로 어떤 비즈니스 의도로 동작했는가"를 재해석해야 하는 경우가 많다. 이런 조건에서 72%라는 숫자는 Bun의 근사 100%(테스트 통과 기준)와 비교하면 낮아 보이지만, 애초에 정답지가 약한 도메인이라는 걸 감안하면 오히려 정직하게 보고된 숫자일 가능성이 있다 — 물론 이 판단도 원문에서 "72%가 무엇을 기준으로 한 숫자인지"를 확인해야 최종 검증된다.

### 핵심 전이 2 — "컴파일되지만 결과가 다른 코드"가 Oracle→PostgreSQL에도 똑같이 숨어 있고, 28%는 아마 대부분 거기에 몰려 있다

[[2026-08-26-eve-online-python3-migration]]가 Python 2→3 전환에서 가장 위험한 부분으로 짚은 건 "구문 오류(3,300줄)"가 아니라 "컴파일은 되지만 결과가 조용히 달라지는 코드(2만 줄)"였다 — 정수 나눗셈이 대표 사례였고, 그 숫자가 데미지·ISK·좌표일 수 있다고 경고했다. Oracle→PostgreSQL에는 이 유형의 함정이 훨씬 더 많다 — `ROWNUM`과 `LIMIT`의 페이지네이션 의미 차이, Oracle 시퀀스 vs PostgreSQL `SERIAL`/`IDENTITY`의 갭 처리 차이, 빈 문자열과 `NULL`을 같게 보는 Oracle vs 다르게 보는 PostgreSQL, 대소문자 구분 규칙, 날짜/타임존 연산, PL/SQL 예외 처리와 PostgreSQL `PL/pgSQL`의 트랜잭션 롤백 범위 차이 등. 이런 코드는 대부분 "변환은 되고 컴파일도 통과"하기 때문에, GAMMA의 72%라는 "정확도" 측정 방식이 컴파일/구문 성공률 기준이라면 실제 의미 오류 비율은 그보다 훨씬 낮게(또는 28% 안에 위험이 집중된 형태로) 잡힐 수 있다. 이건 원문을 못 봤기 때문에 확정할 수 없는 추정이지만, EVE 사례가 보여준 패턴은 이 종류의 마이그레이션 전반에 적용될 개연성이 높다.

### 핵심 전이 3 — 멀티 에이전트로 마이그레이션을 나누는 발상 자체는 이번 시즌 반복되는 패턴이다

[[2026-09-10-proliferate-parallel-coding-agents-ide]]가 다룬 건 "서로 다른 코딩 에이전트를 격리된 워크스페이스에서 병렬 실행"하는 범용 오케스트레이션 도구였다. GAMMA는 그 발상을 DB 마이그레이션이라는 특정 도메인에 특화된 역할 분해(추정: 스키마 분석·변환·검증·의존성 정리 등을 각각 다른 에이전트가 담당)로 좁혀 적용한 사례로 읽힌다. 범용 병렬 오케스트레이션 도구와, 도메인 특화 멀티 에이전트 파이프라인이 같은 시기에 나란히 나오는 건 우연이 아니라 — "에이전트 하나가 처음부터 끝까지"에서 "역할별로 쪼갠 에이전트 파이프라인"으로 업계 전체가 수렴하고 있다는 신호로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

온다가 실제로 레거시 Oracle 기반 시스템(자사 CRS/PMS 또는 인수한 시스템)을 보유하고 있는지는 이 노트만으로 알 수 없다 — 아래는 그런 상황이 실제로 발생했을 때를 가정한 원칙 차원의 적용점이다.

- "72% 정확도"를 그대로 믿고 도입 규모를 정하면 안 된다. [[2026-08-26-eve-online-python3-migration]]의 교훈대로, CRS의 요금 계산·재고 차감·정산 로직에서 위험한 건 변환이 실패하는 20~30%가 아니라 "변환됐고 컴파일도 되지만 조용히 다른 금액·다른 재고 수량을 내는 코드"다. Oracle 시퀀스의 갭 처리, `ROWNUM` 기반 페이지네이션, 빈 문자열/NULL 처리 차이는 예약 건수·통화 환산·객실 재고처럼 숫자가 직접 돈과 연결되는 CRS 도메인에서 특히 치명적이다.
- 실무에 옮긴다면 GAMMA 같은 도구를 "변환기"가 아니라 "1차 초안 생성기"로만 쓰고, 검증은 별도 계층에 둬야 한다. [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]]가 보여준 건 "생성보다 검증이 더 오래 걸린다"는 것이었다 — Oracle→PostgreSQL도 다르지 않을 것이다. 요금·정산 모듈이라면 원본(Oracle)과 변환본(PostgreSQL)을 같은 입력으로 이중 실행해 결과를 diff하는 EVE식 안전망이, "72% 정확하다"는 벤더 주장보다 신뢰할 수 있는 검증 방법이다.
- 직접 적용은 아직 멀다는 점을 분명히 밝힌다. 이 노트 자체가 원문을 확인하지 못한 채 Slack 발췌 세 줄에 의존하고 있어, GAMMA라는 구체적 도구를 CRS 마이그레이션에 도입하자고 제안할 근거는 부족하다. 남는 건 "에이전트 기반 DB 마이그레이션 도구를 평가할 때는 정확도 숫자의 분모부터 캐물어야 한다"는 원칙 수준의 교훈이다.

## 연관 자료

- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] — "정답지가 있는 작업일수록 AI 배율이 커진다"는 원칙으로 72%라는 숫자의 맥락을 해석하는 잣대
- [[2026-08-26-eve-online-python3-migration]] — "컴파일되지만 결과가 다른 코드"가 진짜 위험이라는, Oracle→PostgreSQL 의미론적 차이에 그대로 적용되는 선행 사례
- [[2026-09-10-proliferate-parallel-coding-agents-ide]] — 범용 병렬 에이전트 오케스트레이션과 GAMMA의 도메인 특화 멀티 에이전트가 같은 흐름의 다른 지점

## 한 달 뒤 회고

*(2026-10-10 즈음 — ①`aws.amazon.com` 접근이 가능해지면 GAMMA 원문을 직접 확인해 저자·발행일·72%/51%의 정확한 산출 기준(분모, 측정 방법)으로 이 노트를 교체. ②GAMMA와 `sample-oracle-modernization-accelerator`(OMA)가 실제로 같은 프로젝트의 다른 이름인지, 완전히 별개 프로젝트인지 확인. ③온다 내부에 실제로 Oracle 기반 레거시 시스템이 있는지 파악해 CRS 적용 포인트를 추정이 아닌 구체적 시나리오로 재작성.)*
