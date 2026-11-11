---
title: "[AWS] AWS를 활용한 CMMC Level 2 인증 준비: 국내 방산 기업을 위한 안내 (원문 미확인, 부분 확인) — 클라우드는 인증을 대신 받아주지 않는다, 책임 경계를 긋는 일만 대신한다"
source_title: "AWS를 활용한 CMMC Level 2 인증 준비: 국내 방산 기업을 위한 안내"
source_url: "https://aws.amazon.com/ko/blogs/tech/cmmc-level-2-on-aws/"
source_name: "AWS Korea Tech Blog"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (aws.amazon.com 차단으로 미확인)"
summarized_at: "2026-11-11"
category: "architecture"
tags: ["cmmc", "compliance", "defense-contractor", "aws", "security", "nist-800-171", "source-limitation"]
---

# [AWS] AWS를 활용한 CMMC Level 2 인증 준비: 국내 방산 기업을 위한 안내

> 출처: [AWS를 활용한 CMMC Level 2 인증 준비](https://aws.amazon.com/ko/blogs/tech/cmmc-level-2-on-aws/) (AWS Korea Tech Blog) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇) · 정리일 2026-11-11
>
> **출처 한계와 이해관계 고지**: `aws.amazon.com`이 이 세션에서 egress 차단돼 한국어 원문, 국내 방산 기업 특화 내용은 한 줄도 확인 못했다. 대신 AWS의 영문 공식 CMMC Level 2 가이드로 일반 사실만 교차확인했다. CUI(통제 비분류 정보)를 다루는 국방부 계약업체는 NIST SP 800-171 Rev.2의 110개 통제 항목을 충족해야 Level 2를 받을 수 있고, 자가평가 또는 C3PAO 제3자 평가 중 선택 가능하다. AWS는 자사 환경에 대해 Level 2 인증을 받았다고 발표했지만, 고객의 CMMC 준수를 대신해주는 게 아니라 통제 항목별 책임 경계(shared responsibility)를 명확히 긋는 역할만 한다는 점이 여러 AWS 자료에서 강조된다. 이 글의 발행 주체가 AWS라는 점도 감안해야 한다. "AWS로 준비하라"는 내용은 자사 클라우드 채택을 유도하는 서사와 정렬돼 있다.

## 한 줄 요약

**미국 국방부 공급망에 참여하려는 국내 방산 기업을 위해, AWS의 보안 통제와 관리형 서비스로 CMMC Level 2(CUI 보호) 요건을 충족하는 단계별 준비 전략을 제시한 글이다. 다만 AWS를 쓰면 쉬워진다는 결론 자체가 AWS의 사업 이익과 정렬돼 있다는 점을 감안해야 한다.**

## 핵심 포인트

- **CMMC Level 2의 핵심 요건(일반 자료로 확인)**: NIST SP 800-171 Rev.2의 110개 통제 항목 충족, CUI를 다루는 계약이라면 필수. 자가평가 또는 C3PAO 제3자 평가 중 선택.
- **AWS의 역할은 대행이 아니라 경계 설정**: AWS 서비스를 쓴다고 인증이 자동으로 따라오지 않는다. 통제 항목을 누가 책임지는지(control ownership)를 조직이 명확히 정하는 게 관건이라는 점이 강조된다.
- **평가 범위 산정부터 데이터 보호, 로깅까지**: Slack 발췌는 평가 범위 산정부터 데이터 보호 및 로깅 구성까지 단계별 대응 전략을 다룬다고 설명하는데, 국내 방산 기업 특화 사례(실제 적용 기업, 소요 기간, 비용)는 egress 차단으로 확인 불가.

## 인상 깊은 문장

> "평가 범위 산정부터 데이터 보호 및 로깅 구성까지 국내 방산 기업을 위한 단계별 대응 전략" (Slack 발췌)

## 댓글

GeekNews를 거치지 않은 TechArticles 직접 공유라 hada 댓글, HN/Lobsters 큐레이션 대상이 아니다. **읽을 때 감안**: AWS 공식 블로그이고 CMMC 준비를 AWS 서비스로 해결하라는 결론이 자사 클라우드 매출과 정렬돼 있다. 경쟁 클라우드와의 비교나 AWS 접근의 단점은 당연히 다루지 않을 글이다.

## 내 생각 · 적용점

### 핵심 전이 1 — "도구가 아니라 가드레일 설계가 인증을 통과시킨다"는 같은 교훈이 다른 인증 체계에서도 반복

[[2026-08-14-tiro-kiro-iso27001-security-infrastructure]]는 AWS 코딩 에이전트 Kiro로 ISO 27001을 18주에 통과한 사례였는데, 핵심 전이는 Kiro가 아니라 가드레일(읽기전용 우선, 스펙주도, 승인게이트, 증거보존)이 실제로 재사용 가능한 설계라는 것이었다. 이 CMMC 글도 같은 구조다. AWS 서비스가 인증을 대신 받아주는 게 아니라, 통제 항목별 책임 경계를 명확히 긋는 설계가 핵심이다. 인증 체계는 다르지만 클라우드 벤더가 파는 건 도구이고, 통과시키는 건 통제 설계라는 교훈은 동일하다.

### 핵심 전이 2 — 네트워크 격리 원칙과도 같은 결

[[2026-09-08-nds-trusted-research-environment-no-igw]]의 "경로 자체를 없앤다"는 원칙은 CUI 보호가 요구하는 격리 수준과 같은 방향이다. CMMC가 요구하는 통제된 작업 환경도 결국 접근 경로를 최소화하는 설계로 수렴한다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다는 국방부 공급망이나 CUI를 다루지 않는다. 다만 전이 가능한 원칙은 있다. 파트너사(호텔 체인, OTA) 보안 실사를 통과하는 속도가 곧 계약 리드타임이라는 점에서는 [[2026-08-14-tiro-kiro-iso27001-security-infrastructure]]와 같은 구조다. 클라우드 벤더의 인증을 우리도 자동으로 인증받았다로 착각하지 않고, 책임 경계가 어디서 끝나고 우리 쪽 통제가 어디서 시작하는지를 분명히 하는 문서화가 실사 대응 시간을 줄인다.

## 연관 자료

- [[2026-08-14-tiro-kiro-iso27001-security-infrastructure]] — 다른 인증 체계(ISO 27001)이지만 도구가 아니라 가드레일 설계가 통과시킨다는 같은 교훈
- [[2026-09-08-nds-trusted-research-environment-no-igw]] — 경로 자체를 없앤다는 같은 방향의 격리 원칙

## 한 달 뒤 회고

*(2026-12-11 즈음 — aws.amazon.com egress가 풀리면 국내 방산 기업 특화 사례를 보강하고, CMMC 2단계 의무화 재개 여부를 확인한다.)*
