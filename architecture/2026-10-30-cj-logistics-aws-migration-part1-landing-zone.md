---
title: "CJ대한통운 해외 IDC의 AWS 전환기 1편: 의존성 분석과 랜딩존 설계 (AWS 기술 블로그) — 외부 수행사 없이 내부 팀이 8주 스프린트로 기술을 내재화했다"
source_title: "CJ대한통운 해외 IDC의 AWS 전환기 1편: 의존성 분석과 랜딩존 설계"
source_url: "https://aws.amazon.com/ko/blogs/tech/cj-logistics-aws-migration-dependency-landing-zone/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-30"
category: "architecture"
tags: ["aws", "cj-logistics", "migration", "landing-zone", "eba-program", "application-migration-service"]
---

# CJ대한통운 해외 IDC의 AWS 전환기 1편: 의존성 분석과 랜딩존 설계 (AWS 기술 블로그)

> 출처: [AWS 한국 기술 블로그](https://aws.amazon.com/ko/blogs/tech/cj-logistics-aws-migration-dependency-landing-zone/) (AWS 한국 기술 블로그) · Slack `#개발-뉴스-dev-news`(TechArticles 봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `aws.amazon.com`이 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 원글 불릿 4개 + 스레드 상세 답변 1개(끊김 있는 문단, "…인프라 현대화의 기틀을 마련했습니다…"에서 끊김)를 1차 자료로 썼다. hada 댓글·HN 반응은 확인 불가(AWS 자체 발표 자료). 벤더(AWS) 자신이 쓴 고객 사례 글이므로 성공 사례 중심의 긍정적 프레이밍일 가능성을 감안해야 한다.

## 한 줄 요약

**CJ대한통운 TES 물류기술연구소가 글로벌 물류 서비스의 민첩성과 확장성을 확보하기 위해 해외 거점 IDC를 AWS로 전환했다 — 외부 수행사 없이 내부 인력만으로 'AWS EBA(Experience-Based Acceleration)' 프로그램을 통해 8주간 마이그레이션 스프린트를 진행하며 워크로드 분석·보안 아키텍처 설계·표준 운영 체계 수립까지 실행 역량을 내재화했다.**

## 핵심 포인트

- **단순 이전이 아니라 표준 아키텍처 구축** — 이번 프로젝트는 ***단순한 서버 이전을 넘어***, 향후 Cloud Native·AI Native 환경으로 나아가기 위한 표준 아키텍처와 운영 거버넌스를 구축하는 데 중점을 두었다.
- **외부 수행사 없이 내부 인력만으로** — 외부 수행사 없이 프로젝트를 완수하기 위해 ***'AWS EBA(Experience-Based Acceleration)' 프로그램***을 도입했다. 이를 통해 ***8주간 마이그레이션 스프린트***를 진행하며 워크로드 분석, 보안 아키텍처 설계, 표준 운영 체계 수립 등 실행 역량을 직접 내재화했다.
- **사전 검증을 통한 리스크 관리** — ***AWS Application Migration Service(AWS Transform MGN)***를 활용해 실제 워크로드를 분석하고 마이그레이션 전략·보안 정책을 사전에 검증했다.

## 인상 깊은 문장

> "이번 프로젝트는 단순한 서버 이전을 넘어, 향후 Cloud Native 및 AI Native 환경으로 나아가기 위한 표준 아키텍처와 운영 거버넌스를 구축하는 데 중점을 두었습니다." (Slack TechArticles 스레드 답변 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단, AWS 블로그는 애초에 그런 댓글 시스템이 없음). AWS 자체 고객 사례 글이므로 벤더 편향을 감안해야 한다 — "외부 수행사 없이 내재화했다"는 성과가 실제로 얼마나 재현 가능한지는 CJ대한통운의 기존 내부 역량 수준에 크게 의존할 것이다.

## 내 생각 · 적용점

**핵심 전이 — "외부 수행사 의존 대신 내부 역량 내재화"라는 선택은, 어제 정리한 [[2026-10-29-aws-lambda-web-functions-guide-part1]]이 다룬 "과금 모델 재설계"와는 다른 축에서 같은 벤더(AWS)의 또 다른 "구조적 전환" 사례다.** 8주라는 짧은 스프린트 기간에 아키텍처 설계부터 운영까지 내재화했다는 주장은, 외부 의존을 줄이는 쪽이 장기적으로 더 지속 가능하다는 판단을 전제한다 — 단기 비용(내부 인력의 학습 곡선)과 장기 이득(외부 수행사 재계약 없이 자체 운영 가능)을 교환한 것으로 읽힌다. 2편(컷오버·안정화)에서 이 내재화된 역량이 실제 전환 과정에서 어떻게 쓰였는지 이어서 확인할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성 있다. CRS/PMS가 해외 리전의 온프레미스 인프라를 클라우드로 전환할 계획이 있다면, "외부 수행사 없이 내부 팀이 단기 집중 스프린트로 아키텍처를 설계한다"는 이 접근은 참고할 만하다 — 다만 이는 내부 팀이 처음부터 일정 수준의 클라우드 역량을 갖추고 있었다는 전제가 깔려 있을 가능성이 높고, AWS 자체 발표 자료라 실제 난이도·소요 시간은 더 보수적으로 추정해야 한다.

## 연관 자료

- [[2026-10-30-cj-logistics-aws-migration-part2-cutover]] — 같은 시리즈 2부. 1부가 다룬 의존성 분석·랜딩존 설계를 바탕으로 실제 서버 이전과 안정화 단계로 이어진다.
- [[2026-10-29-aws-lambda-web-functions-guide-part1]] — 같은 AWS 생태계의 또 다른 "구조적 전환" 사례, 과금 모델 재설계라는 다른 축.

## 한 달 뒤 회고

*(2026-11-30 즈음, `aws.amazon.com` 접근이 풀렸다면 'AWS EBA' 프로그램의 실제 적용 범위와 CJ대한통운이 밝힌 8주 스프린트의 구체적 결과물(아키텍처 문서, 운영 체계)을 원문으로 확인한다.)*
