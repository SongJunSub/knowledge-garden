---
title: "[네이버] Hive는 잊으려 했지만 Spark는 기억하고 있었다 (Naver D2) — 메타스토어가 던져버린 낡은 Thrift RPC를 클라이언트는 여전히 부르고 있었다"
source_title: "Hive는 잊으려 했지만 Spark는 기억하고 있었다: 사라진 get_table RPC 복원기"
source_url: "https://d2.naver.com/helloworld/7314597"
source_name: "Naver D2 (helloworld.naver.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (원문 접근 차단으로 미확인)"
summarized_at: "2026-09-29"
category: "backend"
tags: ["hive", "spark", "hive-metastore", "thrift-rpc", "data-platform", "compatibility", "naver", "backward-compatibility"]
---

# [네이버] Hive는 잊으려 했지만 Spark는 기억하고 있었다 (Naver D2)

> 출처: [Hive는 잊으려 했지만 Spark는 기억하고 있었다: 사라진 get_table RPC 복원기](https://d2.naver.com/helloworld/7314597) (Naver D2) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-09-29

> **출처 한계(큼)**: `d2.naver.com`이 이번 세션에서 "Claude Code is unable to fetch from d2.naver.com"로 전면 차단됐다. `news.hada.io`도 이 세션 egress 정책상 시도하지 않았다(레포 규칙에 따라 스킵). WebSearch로 "get_table RPC 네이버 d2", "사라진 get_table RPC" 등 여러 조합을 검색했지만 **원문도 2차 인용도 찾지 못했다** — 발행 당일 글로 아직 색인되지 않은 것으로 보인다. 이 노트가 근거로 삼을 수 있는 것은 ① Slack TechArticles 봇의 발췌 2줄(끝이 잘림) ② **Hive Metastore Thrift API의 `get_table` RPC 자체에 대한 독립적으로 잘 문서화된 일반 지식**(Medium, Cloudera Community, Spark 공식 문서 등 여러 소스가 일관되게 확인) 뿐이다. **아래 "메커니즘" 설명은 이 배경지식으로 재구성한 것이지, 네이버가 실제로 겪은 정확한 증상·환경·해결 코드를 확인한 것이 아니다.** 저자·발행일·구체적 조치 내용은 전부 미확인이며 추측으로 채우지 않는다.

## 한 줄 요약

**제목과 Slack 발췌, 그리고 Hive Metastore Thrift RPC의 일반적으로 알려진 호환성 문제를 겹쳐 보면, 이 글은 Hive Metastore가 낡은 `get_table` Thrift 메서드를 걷어내는 방향으로 진화하는 동안(신형 클라이언트는 `get_table_req`라는 구조화된 요청 객체를 쓴다), 특정 버전의 Spark(오래된 Hive 클라이언트 라이브러리를 번들링한)는 여전히 옛 메서드 이름을 호출하다가 "Invalid method name: 'get_table'" 류의 RPC 오류로 데이터 플랫폼이 멈춘 사건을, 네이버 데이터 플랫폼 팀이 원인 규명부터 복원까지 추적한 경험담으로 추정된다.**

## 핵심 포인트

**(Slack 발췌 확정 — 이 글 고유 정보, 마지막 문장 절단)**
- 데이터 플랫폼 환경에서 **사라진 `get_table` RPC 호출** 문제를 해결한 경험을 공유.
- **Spark와 Hive 간 호환성 이슈**를 분석하고 시스템 안정성을 복원하는 과정을 다룸.

**(일반 배경지식 — 이 글이 실제로 이 경로를 밟았는지는 미확인, 다만 제목과 정확히 들어맞는다)**
- Hive Metastore는 Thrift IDL로 정의된 RPC 서비스다. 오래된 버전에서는 클라이언트가 `get_table(dbName, tableName)`처럼 **단순 문자열 인자**로 테이블 메타데이터를 요청했다.
- Hive 3.x 이후 계열에서는 이 방식이 ***`get_table_req(GetTableRequest)`*** 같은 **구조화된 요청 객체 기반 RPC**로 대체되는 방향의 변화가 여러 독립 소스(Medium, Cloudera Community)에서 보고된다. 즉 메타스토어 서버 입장에서는 "옛 이름의 메서드는 잊어도 되는" 정리 대상이다.
- 문제는 **Spark가 자체적으로 특정 버전의 Hive 클라이언트 라이브러리를 번들링**해서 메타스토어와 통신한다는 점이다. 이 번들 버전이 최신 Hive Metastore 서버보다 낡았다면, Spark는 ***여전히 옛 `get_table`을 부른다*** — 메타스토어는 그 이름을 잊었는데 클라이언트는 기억하고 있는 셈이다. 결과는 `"Invalid method name: 'get_table'"` Thrift 예외.
- 제목의 " Hive는 잊으려 했지만 Spark는 기억하고 있었다"는 이 비대칭을 정확히 요약하는 문장으로 읽힌다. **다만 네이버가 실제로 어떤 조합(어떤 Spark 버전, 어떤 Hive Metastore 버전, 온프레미스인지 관리형인지)에서 이 문제를 만났는지, 어떻게 "복원"했는지(메타스토어에 호환 shim을 추가했는지, 클라이언트 라이브러리를 교체했는지, 프록시를 앞에 뒀는지)는 원문 없이는 알 수 없다.**

## 인상 깊은 문장

> "Hive는 잊으려 했지만 Spark는 기억하고 있었다"
> **원문 대조 불가(제목 자체를 인용).** 다만 이 문장 하나가 배경지식으로 재구성한 메커니즘(메타스토어의 RPC 정리 vs 클라이언트의 낡은 라이브러리)과 지나치게 정확히 맞아떨어져서, 이 노트가 세운 추정 경로에 그 자체로 신뢰를 싣는다.

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가.** `news.hada.io`는 이 세션에서 전면 차단이라 시도조차 하지 않았고(레포 규칙), Naver D2 자체 페이지의 댓글 시스템도 WebFetch 차단으로 확인 못했다. **읽을 때 감안**: ①이 노트의 "메커니즘" 절은 **이 특정 사건이 아니라 Hive/Spark Thrift RPC 진화에 대한 일반 지식**이다. 네이버의 실제 원인이 다른 형태(예: 메타스토어 앞단 프록시 버그, 특정 커넥터의 버전 고정 실수 등)였을 가능성을 배제할 수 없다. ②Naver D2는 자사 기술 블로그라 hada 댓글류의 외부 반응 자체가 존재하지 않을 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — "서버는 계약을 정리했는데 클라이언트는 옛 계약을 기억한다"는 버전 드리프트의 전형

이 사건이 실제로 이 경로였다면, 본질은 **분산 시스템에서 흔한 버전 드리프트 문제**다. 메타스토어(서버)는 스스로의 판단으로 낡은 RPC를 정리했지만, 그 결정이 **모든 클라이언트에 동시에 전파되지 않는다.** Spark처럼 자체 릴리스 주기로 Hive 클라이언트 라이브러리를 번들링하는 소비자는, 서버가 무엇을 "잊었는지" 알 방법이 없다가 실제 호출이 실패하는 순간에야 드러난다.

**[[2026-09-15-flex-transactional-event-listener-silent-ignore]]와 정확히 거울상 관계다.** flex 사례는 ***"활성 트랜잭션이 없으면 리스너가 예외도 로그도 없이 조용히 무시"***되는, **조용한 실패**였다. 이 Hive/Spark 사례는(적어도 배경지식으로 재구성한 경로로는) `Invalid method name` 예외가 **명시적으로 터지는 시끄러운 실패**다. 둘 다 "이름이나 인터페이스가 암묵적으로 전제하는 계약이 버전 드리프트로 깨진다"는 같은 뿌리인데, **실패의 소리 크기가 정반대**다. 시끄러운 실패는 고통스럽지만 최소한 복구 경로를 알려준다 — 조용한 실패가 훨씬 위험하다는 걸 이 대비가 재확인시켜 준다.

### 핵심 전이 2 — 같은 D2, 같은 "원문 접근 불가 + 일반 배경지식 재구성" 방법론

**[[2026-09-01-naver-python-multiprocessing-airflow-part1]]**도 같은 Naver D2 `helloworld` 시리즈이고, 같은 세션에서 같은 이유(`d2.naver.com` 전면 차단)로 원문을 확보하지 못했다. 두 노트 모두 **"제목과 짧은 발췌만으로 얼마나 정직하게, 그러나 유용하게 재구성할 수 있는가"**라는 같은 방법론적 제약을 공유한다. 네이버 D2가 이 가든에서 가장 접근이 어려운 소스 중 하나로 굳어지고 있다.

**[[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]**과도 연결된다 — 이쪽은 SK플래닛의 Hadoop 생태계(Oozie/Sqoop→Airflow/Spark) 마이그레이션기로, 이 글과 마찬가지로 **국내 빅테크/게임사의 레거시 Hadoop·Hive·Spark 스택**을 다루면서 원문 차단으로 제목 이상의 확인이 어려웠던 사례다. 국내 데이터 플랫폼 기술 블로그가 이 가든이 접근하기 유독 어려운 계열이라는 패턴이 세 번째로 반복된다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다.** 온다는 Hadoop/Hive/Spark 기반 빅데이터 플랫폼을 CRS 코어에 두고 있지 않을 가능성이 높다(적어도 이 노트 작성 시점 확인 범위 밖).
- 다만 **원칙은 그대로 전이된다**: **파트너 OTA/PMS API의 버전 드리프트**가 정확히 같은 구조다. 파트너가 "이 엔드포인트/필드는 곧 없앨 예정"이라고 공지하고 실제로 없애면, 우리 연동 클라이언트가 그 공지를 반영하지 않은 채 낡은 필드·엔드포인트를 계속 호출하다가 어느 날 갑자기 4xx/5xx로 터진다 — 이 Hive/Spark 사례와 증상의 형태가 동일하다.
- **실무 규칙 후보**: 파트너 API의 deprecation 공지를 수동으로 추적하는 대신, **계약 테스트(consumer-driven contract test)**로 "우리가 실제로 호출하는 필드·엔드포인트 집합"을 코드로 못박고, 파트너 쪽 스펙 변경 시 CI에서 즉시 깨지게 만드는 편이 "장애로 알게 되는 것"보다 훨씬 싸다.

## 연관 자료
- [[2026-09-15-flex-transactional-event-listener-silent-ignore]]: *같은 뿌리(버전/전제 드리프트로 계약 파괴)의 거울상 — 조용한 실패 vs 시끄러운 실패*
- [[2026-09-01-naver-python-multiprocessing-airflow-part1]]: *같은 Naver D2 시리즈, 같은 "원문 차단 + 재구성" 방법론*
- [[2026-09-17-skplanet-oozie-sqoop-airflow-spark-migration]]: *국내 Hadoop/Hive/Spark 생태계 블로그 계열, 같은 접근 차단 패턴*

## 한 달 뒤 회고
*(2026-10-29 즈음: ①`d2.naver.com`이 이 세션 이후 접근 가능해져 원문을 직접 확인할 수 있는지 ②실제 원인이 이 노트가 추정한 `get_table`/`get_table_req` 경로와 일치하는지, 아니면 전혀 다른 형태(프록시·커넥터 버전 고정 실수 등)였는지 ③네이버가 택한 실제 복원 방식(호환 shim/클라이언트 교체/프록시)이 이 노트가 제안한 계약 테스트 원칙과 어떻게 다른지)*
