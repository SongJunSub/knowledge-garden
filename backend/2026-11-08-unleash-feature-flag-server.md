---
title: "Unleash - 재배포 없이 기능을 켜고 끄는 오픈소스 기능 플래그 서버, v8부터 서버는 AGPLv3로 전환(Unleash)"
source_title: "Unleash v8 release notes / gradual rollout guide"
source_url: "https://docs.getunleash.io/release-notes/2026/6/9"
source_name: "Unleash 공식 문서(docs.getunleash.io)"
referrer_url: "https://news.hada.io/topic?id=36756"
published_at: "2026-06-09"
summarized_at: "2026-11-08"
category: "backend"
tags: ["unleash", "feature-flag", "open-source", "a-b-testing", "agplv3", "mcp", "self-hosted"]
---

# Unleash - 재배포 없이 새 기능을 켜고 끄는 오픈소스 기능 플래그 서버

> 출처: [Unleash 공식 릴리스 노트/문서](https://docs.getunleash.io/release-notes/2026/6/9) · 정리일 2026-11-08

> **출처 한계.** news.hada.io는 차단되어 GN⁺ 원문·댓글은 확인하지 못했다. Unleash 공식 문서(docs.getunleash.io)는 WebSearch 스니펫으로 교차확인했고, Slack 발췌의 **"공개 후 10%, 50%처럼 대상 확대", "사용자 ID 기준 일관된 경험", "A/B 테스트에서 버전별 트래픽 비율 설정"** 서술은 모두 Unleash의 실제 Gradual Rollout·Variants 기능 문서와 일치했다. 다만 Slack 발췌에만 있고 이번에 직접 확인하지 못한 세부(여러 앱·환경에 걸친 공유 등)는 Unleash의 일반적인 멀티 환경 지원 구조로만 추정했다.

## 한 줄 요약

**Unleash는 코드 재배포 없이 기능을 특정 비율·대상에게만 점진적으로 노출하거나 즉시 끌 수 있는 오픈소스 기능 플래그 서버다 — 2026년 v8부터 서버 소스코드와 npm 패키지의 라이선스가 Apache 2.0에서 AGPLv3로 바뀌었다는 점이 이번 소개에서 가장 실무적으로 중요한 변화다.**

## 핵심 포인트

- **점진적 롤아웃(Gradual Rollout)**: 0~100% 사이의 롤아웃 비율을 활성화 전략으로 설정한다. 같은 `userId`·같은 비율이면 **일관된(sticky) 결과**를 보장하도록 설계되어 있지만, **익명 사용자에 대한 고정성(stickiness)은 보장하지 않는다**는 제약이 있다.
- **그룹 ID(groupId)**: 기본값은 플래그 이름이지만, 여러 플래그의 롤아웃 버킷팅을 **같은 그룹으로 상관시키도록 재정의**할 수 있다.
- **변형(Variants)**: 플래그에 가중치가 다른 변형들을 추가해, 비율을 조정하며 **A/B 테스트에 가까운 트래픽 분배**를 구현할 수 있다. 다만 전환율 분석·통계적 방법론 자체는 Unleash가 아니라 외부 분석 도구의 역할이다.
- **2026년 주요 변화**: (1) **릴리스 관리 자동화**(릴리스 템플릿, 영향 지표, 안전장치, 마일스톤 진행)가 정식 출시됐고, (2) **원격 Unleash MCP 서버**가 2026-03 베타 → 2026-05-26 정식 출시됐다 — AI 에이전트가 기능 플래그를 조회·제어하는 용도로 보인다. (3) Unleash Edge가 폴링 대신 **실시간 스트리밍**으로 플래그를 받을 수 있게 됐다.
- **라이선스 전환(실무적으로 가장 중요)**: v8부터 **GitHub 저장소의 소스코드와 `unleash-server` npm 패키지가 Apache 2.0 → AGPLv3**로 바뀐다. 공식 오픈소스 Docker 이미지는 **Apache 2.0을 유지**하며, 소스를 수정하지 않고 사전 빌드된 컨테이너를 그대로 쓰는 경우는 영향이 없다. SDK들의 라이선스는 그대로다.

## 인상 깊은 문장

> "Starting with Unleash v8, the source code in the primary Unleash GitHub repository and the unleash-server npm package move from the Apache 2.0 license to the GNU Affero General Public License v3 (AGPLv3)." — Unleash 공식 릴리스 노트, 2026-06-09

## 댓글

GN⁺ 댓글 수는 확인 불가. 이 노트에서 직접 짚을 만한 "댓글" 대신 **라이선스 변경 자체가 실무적 논쟁거리**라는 점을 남긴다 — AGPLv3는 "서버를 수정해서 네트워크로 서비스하면 소스 공개 의무가 생기는" 라이선스라, Unleash를 포크해 상용 SaaS로 재판매하려던 경쟁사·호스팅 업체에는 실질적 장벽이다. 반면 "그냥 Docker 이미지를 그대로 돌려 쓰는" 대다수 자체 호스팅 사용자에게는 영향이 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-06-flex-feature-flag-config-to-openfeature]]와의 비교 — "직접 서버를 운영"과 "표준 인터페이스로 추상화"는 다른 레이어의 선택

Flex의 OpenFeature 전환 사례는 **"어떤 기능 플래그 서버를 쓰든 애플리케이션 코드는 OpenFeature라는 표준 인터페이스만 보게 한다"**는 추상화 레이어의 문제였다. Unleash는 그 뒤에 들어갈 수 있는 **구체적인 서버 구현체 중 하나**다. 두 노트를 함께 보면 "표준 인터페이스를 Unleash 같은 특정 서버에 맞춰 둘지, 교체 가능하게 열어둘지"가 실제 설계 선택지로 이어진다.

### 핵심 전이 2 — AI 에이전트용 MCP 서버가 기능 플래그 도구에까지 번지고 있다

Unleash의 Remote MCP 서버 정식 출시는, 오늘 다이제스트의 다른 글들(GitLab Governance for Agents, GitHub Rubicon)과 같은 흐름 — **"AI 에이전트가 운영 도구를 직접 조작하는 인터페이스"**가 각 분야 도구에 표준처럼 추가되고 있다는 신호다. 기능 플래그는 특히 **"에이전트가 실수해도 플래그 하나로 즉시 되돌릴 수 있다"**는 점에서 에이전트 운영의 안전장치로 잘 맞는다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성이 높다 — 오늘 다이제스트 4건 중 CRS와 가장 직접 연결된다.** CRS/B2B SaaS 환경에서 다음과 같은 용도로 바로 그려볼 수 있다:
- 새 요금 엔진·채널 매핑 로직을 **특정 호텔(파트너) %만** 먼저 켜서 점진 롤아웃.
- 신규 OTA 연동이 불안정할 때 **플래그 하나로 즉시 킬스위치**.
- 가격 노출 방식 A/B를 **변형(Variants) 가중치**로 트래픽 분배하며 전환율 비교(분석은 외부 도구 연계 필요).
- AGPLv3 라이선스 전환은 "자체 호스팅해서 그대로 쓰는" 경우라면 무관하지만, **Unleash를 포크해 내부 플랫폼화하려 한다면 법무 검토가 필요**하다는 점은 실무적으로 기록해둘 가치가 있다.

## 연관 자료
- [[2026-10-06-flex-feature-flag-config-to-openfeature]] — 같은 기능 플래그 영역의 표준 인터페이스 추상화 사례
- [[2026-11-08-gitlab-agent-source-control]] — 같은 날 다이제스트의 "AI 에이전트용 운영 도구" 흐름
- [[2026-11-08-github-rubicon-git-storage]] — 같은 날 다이제스트의 에이전트 규모 인프라 재설계 흐름

## 한 달 뒤 회고

*(2026-12-08 즈음 — AGPLv3 전환에 대한 커뮤니티/경쟁 호스팅 업체의 반응이 더 나왔는지, Remote MCP 서버를 실제로 써본 사례가 있는지 확인.)*
