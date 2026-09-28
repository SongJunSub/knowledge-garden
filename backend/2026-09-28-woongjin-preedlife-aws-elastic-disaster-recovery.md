---
title: "웅진프리드라이프의 AWS Elastic Disaster Recovery 기반 클라우드 DR 환경 구축 (AWS) — Drill로 리허설하고 평상시엔 인스턴스를 꺼둔 채 비용을 아낀다"
source_title: "웅진프리드라이프의 AWS Elastic Disaster Recovery 기반 클라우드 DR 환경 구축"
source_url: "https://aws.amazon.com/ko/blogs/tech/woongjin-preedlife-aws-drs/"
source_name: "AWS 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/woongjin-preedlife-aws-drs/"
published_at: "확인 불가"
summarized_at: "2026-09-28"
category: "backend"
tags: ["disaster-recovery", "aws-drs", "cloud-migration", "drill", "cost-optimization", "woongjin-preedlife"]
---

# 웅진프리드라이프의 AWS Elastic Disaster Recovery 기반 클라우드 DR 환경 구축 (AWS)

> 출처: [웅진프리드라이프의 AWS Elastic Disaster Recovery 기반 클라우드 DR 환경 구축](https://aws.amazon.com/ko/blogs/tech/woongjin-preedlife-aws-drs/) (AWS 기술 블로그) · Slack #개발-뉴스-dev-news(TechArticles 봇) 경유 · 정리일 2026-09-28
>
> **출처 한계**: `aws.amazon.com` 전체가 이번 세션 egress 정책으로 차단되어 원문을 열람하지 못했다. WebSearch로도 웅진프리드라이프 관련 케이스 스터디 원문을 특정하지 못했다. AWS DRS의 일반 서비스 동작(에이전트 기반 블록 레벨 지속 복제, 평상시엔 저비용 스테이징 리소스만 유지하다 복구 시에만 전체 사양 인스턴스를 기동하는 과금 구조, Drill = 실제 페일오버 없이 격리 네트워크에서 복구를 테스트하는 비파괴적 리허설 기능)은 AWS 공식 서비스 설명 수준에서만 일반론으로 확인했고, 이 사례 고유의 서버 수·RTO/RPO·비용 절감 수치는 검증하지 못했다.

## 한 줄 요약

**상조업체 웅진프리드라이프가 온프레미스 서버를 AWS Elastic Disaster Recovery(DRS)로 클라우드에 지속 복제해두고, 평상시엔 저비용 스테이징 리소스만 유지하다 장애 시에만 전체 사양 인스턴스를 띄우는 구조로 DR 체계를 구축했다 — Drill 기능으로 사전 리허설까지 갖췄다.**

## 핵심 포인트

- **에이전트 기반 지속 복제** — AWS DRS는 일반적으로 온프레미스(또는 타 클라우드) 서버에 에이전트를 설치해 블록 레벨로 데이터를 지속 복제하고, 평상시엔 스토리지·최소 컴퓨팅만 유지하는 저비용 스테이징 영역을 AWS 쪽에 둔다. 실제 복구 인스턴스는 페일오버가 선언될 때만 기동된다.
- **서버별 복구 조건·이슈를 Drill로 사전 검증** — Slack 요약의 핵심은 ***복구 조건과 이슈를 Drill 기능으로 검증하여 마이그레이션 사전 리허설 효과***를 얻었다는 것. Drill은 실제 DNS 전환·트래픽 이전 없이 격리된 네트워크에서 복구 인스턴스를 띄워 정상 기동 여부를 검증하는 비파괴적 테스트 기능 — 이게 부수적으로 "클라우드 이전 시뮬레이션" 역할을 한다는 관찰이다.
- **평상시 인스턴스 미기동으로 비용 절감** — 복구 대상 인스턴스를 상시 띄워두지 않고 저비용 스테이징 리소스만 유지하다 필요할 때만 전체 사양으로 기동하는 게 DRS의 기본 과금 구조이고, 이 사례에서도 ***초기 인프라 투자 비용과 운영 부담을 효과적으로 절감***했다고 소개한다.

## 인상 깊은 문장

> "Drill 기능으로 검증하여 마이그레이션 사전 리허설 효과를 달성했다." (Slack 발췌 요지)

## 댓글

AWS 공식 기술 블로그의 고객 사례 소개 글. hada 댓글 확인 불가(Slack TechArticles 봇 경유). AWS 자사 서비스(DRS) 도입 사례이므로 긍정적 결과 위주로 소개됐을 프레이밍을 감안해야 한다 — 실제 장애 시 RTO/RPO 수치, Drill에서 실제로 어떤 이슈들이 발견됐는지 등 구체적 실패·한계 사례는 원문 미확인이라 알 수 없다 — "PASS"만 보고하는 자사 사례 소개의 전형적 한계다.

## 내 생각 · 적용점

### 핵심 전이 1 — "복원해봐야 안다"는 원칙이 DR에도 그대로 적용된다

이 가든은 백업 맥락에서 이미 같은 원칙을 여러 번 확인했다 — [[2026-08-10-planetscale-parallel-backups]]는 "매 백업 주기마다 실제로 복원·재생해봄으로써 복구 가능성이 저절로 검증된다"고 했고, [[2026-09-07-databasus-backup-restore-verification]]는 "덤프가 끝났다"와 "복원해도 데이터가 맞다"는 다른 명제라고 못박았다. 웅진프리드라이프의 Drill 활용은 같은 원칙의 DR 버전이다 — ***백업이 있다는 것과 실제로 복구되는지 검증했다는 것은 다르다.*** 다만 PlanetScale·Databasus는 "매 주기 자동 검증"을 파이프라인에 내장한 반면 Drill은 수동으로 돌리는 리허설 기능이라는 차이가 있다 — 검증이 상시 자동인지 필요시 수동인지는 신뢰도에서 꽤 큰 차이를 만든다.

### 핵심 전이 2 — 리허설 도구가 마이그레이션 도구로 전용되는 패턴

"DR 복구 테스트가 곧 클라우드 이전 리허설이 된다"는 관찰이 흥미롭다. 원래 목적(장애 대비)과 다른 목적(마이그레이션 사전 검증)에 같은 기능이 재사용된 사례다. [[2026-09-18-backups-are-not-simple]]가 짚은 "백업 정책은 단순한 복사가 아니라 여러 요구를 동시에 만족시켜야 하는 설계 문제"라는 논지와 통한다 — 같은 인프라 투자가 여러 용도로 값어치를 낼 수 있다는 건 이런 도구 선택에서 부가 가치를 따질 때 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

온다처럼 예약·정산 데이터를 다루는 B2B SaaS에 직접 적용 가능한 원칙이다. ① **DR 계획이 있다는 것과 실제로 복구된다는 것은 다르다** — [[2026-09-07-databasus-backup-restore-verification]]·[[2026-08-10-planetscale-parallel-backups]]와 함께, 정기적인 복구 리허설(가능하면 자동화된)을 DR 체계의 필수 구성 요소로 둬야 한다. ② **평상시 상시 대기 인스턴스를 안 띄우는 비용 구조**는 온다 규모의 조직에서 DR 인프라 투자 대비 효과를 설계할 때 참고할 만한 패턴 — 상시 이중화 대신 "저비용 대기 + 복구 시 기동"으로 비용을 낮추는 선택지를 검토할 수 있다.

## 연관 자료

- [[2026-08-10-planetscale-parallel-backups]] — "실제로 복원해봐야 검증된다"는 원칙의 백업 버전, Drill과 같은 발상
- [[2026-09-07-databasus-backup-restore-verification]] — "덤프 성공"과 "복원 가능"은 다른 명제라는 원칙, 같은 계열
- [[2026-09-18-backups-are-not-simple]] — 백업/DR 정책이 단순한 복사가 아니라는 일반론

## 한 달 뒤 회고

*(2026-10-28 즈음 — egress 차단이 풀려 실제 RTO/RPO 수치와 Drill에서 발견된 이슈 구체 사례를 확인할 수 있는지, 자사 사례 소개의 낙관 편향을 걷어낸 실제 운영 부담이 어느 정도였는지 확인.)*
