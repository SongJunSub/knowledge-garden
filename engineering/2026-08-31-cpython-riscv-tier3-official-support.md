---
title: "CPython, RISC-V를 Tier 3 공식 지원 플랫폼으로 추가 (Python Software Foundation) — 병합 후 발견에서 병합 전 발견으로 가는 다음 단계는 실물 러너 연결"
source_title: "RISC-V is now officially supported by CPython!"
source_url: "https://blog.python.org/2026/08/riscv-now-officially-supported/"
source_name: "blog.python.org (Python Insider)"
referrer_url: "https://news.hada.io/topic?id=33049"
published_at: "2026-08-22 (Python Steering Council 승인 2026-08-20, PEP 11 목록 반영일 기준 최선 추정)"
summarized_at: "2026-08-31"
category: "engineering"
tags: ["cpython", "risc-v", "pep-11", "platform-support", "ci-cd", "buildbot"]
---

# CPython, RISC-V를 Tier 3 공식 지원 플랫폼으로 추가

> 출처: [RISC-V is now officially supported by CPython!](https://blog.python.org/2026/08/riscv-now-officially-supported/) (Python Insider, Python Software Foundation) · 정리일 2026-08-31
> **출처 한계 먼저 밝힌다**: 이 세션에서 `blog.python.org`·`peps.python.org`·`news.hada.io`·`news.ycombinator.com`이 전부 차단돼 원문·PEP 11 문서·hada·HN 댓글을 직접 열람하지 못했다. 아래 내용은 WebSearch로 얻은 검색 스니펫(Python Insider 블로그 요약, numpy-discussion 메일링 리스트, RISE Project 공지 등)을 교차검증해 재구성했으며, 인용 표시 부분도 원문 그대로가 아니라 재구성된 취지임을 밝힌다.

## 한 줄 요약

**CPython이 64비트 RISC-V Linux(`riscv64-unknown-linux-gnu`)를 PEP 11의 Tier 3 공식 지원 플랫폼으로 승격시켰다(Python 조정위원회 2026-08-20 승인). Tier 3는 신뢰할 수 있는 빌드봇과 담당 코어 개발자를 요구하지만 장애 대응 시간은 보장하지 않고 빌드 실패가 릴리스를 막지도 않는 "최선 노력" 등급이다 — 그럼에도 ***CPython 변경이 RISC-V를 조용히 깨뜨릴 가능성이 줄었다는 실질적 의미***가 있다. 현재 빌드봇은 코드 병합 "이후"에야 실행되는 구조라, RISE Project의 실물 RISC-V CI 러너를 CPython CI에 직접 연결해 병합 "전"에 문제를 잡는 게 다음 목표다.**

## 핵심 포인트

- **승격 절차와 시점**: `riscv64-unknown-linux-gnu` Tier 3 지원이 Python 조정위원회(Steering Council)의 2026-08-20 승인을 거쳐, PEP 11 플랫폼 목록에 08-22 공식 반영됐다.
- **Tier 3의 정확한 의미**: 신뢰할 수 있는 빌드봇 + 담당 코어 개발자 연락처가 필요하지만, ***장애 대응 시간은 보장하지 않으며 빌드 실패가 Python 릴리스를 막지도 않는다*** — Tier 1(테스트 게이팅)·Tier 2(릴리스 전 확인)보다 낮은 "최선 노력(best-effort)" 등급.
- **실질적 이득**: 공식 지원 목록에 오르기 전에는 RISC-V가 CPython 코어 개발자들에게 "남의 문제"였다면, 이제는 ***유지되는 호환 타깃***이 됐다 — CPython 변경사항이 RISC-V를 조용히 깨뜨릴 가능성이 이전보다 줄어든다는 뜻. 다만 아직 python.org 공식 설치파일은 없고, 네이티브 확장 모듈의 바이너리 wheel parity도 없다.
- **커뮤니티가 만든 결과**: 실제 RISC-V 하드웨어에서 테스트하며 아키텍처별 버그·빌드 오류를 고쳐온 커뮤니티 기여의 축적이 승격의 실질적 근거였다. RISE Project(RISC-V Software Ecosystem)가 지속적인 테스트용 실물 머신을 buildbot용으로 제공한 것이 핵심 인프라였다.
- **현재 한계 — 병합 후 발견 구조**: 현재 RISC-V 빌드봇 대다수는 ***코드가 병합된 뒤***에야 실행돼, 문제가 이미 main 브랜치에 들어간 다음에야 드러난다.
- **다음 단계 — 병합 전 발견으로**: RISE가 2026년 초 발표한 "RISE RISC-V Runners"(GitHub Actions용 무료 실물 RISC-V 하드웨어 CI 러너 서비스, GitHub App 설치+워크플로 한 줄 변경으로 사용 가능)를 CPython CI에 직접 연결하는 게 목표다. QEMU 같은 에뮬레이터로는 성능 회귀·아키텍처별 컴파일러 버그·커널 특이사항 같은 실물 하드웨어에서만 드러나는 문제를 못 잡는다는 문제의식에서 나온 서비스로, 이게 CPython에 연결되면 빌드봇보다 빠른 피드백을 얻고 장기적으로는 ***Tier 2 승격***을 목표로 한다.

## 인상 깊은 문장

> (WebSearch로 재구성) "Tier 3 지원은 실패가 릴리스를 막지 않는다는 뜻이지만, 그렇다고 조용히 무시된다는 뜻도 아니다 — 이 포트는 이제 유지되는 호환 타깃이어서, CPython의 변경이 RISC-V를 조용히 깨뜨릴 가능성이 줄어든다." — Tier 등급이 "보장 없음"과 "방치"를 구분한다는 취지가 이 대목에 정확히 담겨 있다.

## 댓글

hada 원문은 이 세션에서 열람하지 못해 ***댓글 수·논지는 확인하지 못했다***. Hacker News에 "RISC-V is now officially supported by CPython"(news.ycombinator.com/item?id=49425252)라는 스레드가 존재하는 건 확인했고, WebSearch 종합으로는 53포인트·291댓글이라는 수치가 나왔다. ***다만 포인트 대비 댓글 수 비율이 이례적으로 높아 이 수치 자체의 신뢰도를 낮게 잡는다*** — 이 세션에서 직접 열람해 검증하지 못했으므로 참고치 이상으로는 취급하지 않는다. 논지 구체 내용도 이번 세션에서는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — SiFive BigSky와 같은 결의 "표준화가 채택을 이끈다" 원칙, 이번엔 CI 계층에서

[[2026-08-26-sifive-bigsky-sf-2u870]]에서 "RVA23 표준 준수로 Ubuntu·RHEL이 별도 포팅 없이 올라간다"가 RISC-V 서버 채택의 진짜 관문이었듯, 이번 CPython 사례는 같은 원칙이 언어 런타임 계층에서도 반복됨을 보여준다. 다만 이번 관문은 하드웨어 표준(RVA23)이 아니라 "신뢰할 수 있는 빌드봇 + 담당 코어 개발자"라는 프로젝트 거버넌스 요건이라는 차이가 있다 — 표준화는 한 번이 아니라 스택의 각 층마다 그 층의 언어로 다시 일어난다.

### 핵심 전이 2 — Tier 시스템은 vphone-cli의 침습성 단계와 같은 "필요한 만큼만 보장하는" 설계

[[2026-08-30-vphone-cli-virtual-iphone-boot]]의 5단계 패치 변형(least→exp)처럼, PEP 11의 Tier 1~3 체계도 "얼마나 보장할지"를 명시적으로 단계화한 설계다. Tier 3은 "장애 대응 시간 보장 없음, 릴리스 안 막음"이라고 미리 선을 그어, 기여자와 사용자 모두 기대치를 정확히 알 수 있게 한다 — 침습성이든 지원 보장 수준이든, 이런 명시적 단계화가 신뢰를 만드는 패턴이 반복된다.

### 핵심 전이 3 — 병합 후 발견에서 병합 전 발견으로: 하드웨어 CI는 shift-left 철학의 물리적 확장

현재 RISC-V 빌드봇이 "병합 후"에 실행되는 구조의 한계는, 일반적인 CI 성숙도 문제(사후 발견 vs 사전 차단)의 아키텍처판이다. RISE의 무료 실물 러너 서비스가 이걸 해결하려는 시도라는 점에서, "에뮬레이터로는 못 잡는 문제를 실물 하드웨어로 병합 전에 잡는다"는 목표는 소프트웨어 테스트에서 흔한 shift-left 철학을 하드웨어 아키텍처 검증까지 끌고 온 사례로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

***직접 적용은 멀다*** — 온다의 CRS/PMS 백엔드가 RISC-V로 이전할 유인은 현재 없다. 다만 전이 가능한 원칙만 남기면: **새 지원 대상의 보장 수준을 Tier처럼 명시적으로 단계화해 공개**하는 방식은, 파트너 연동 API의 SLA 문서화(어떤 엔드포인트가 장애 대응 보장을 받고 어떤 게 최선 노력인지)에 참고할 만하다.

## 연관 자료

- [[2026-08-26-sifive-bigsky-sf-2u870]] — RISC-V 생태계 성숙의 다른 층위(하드웨어 표준 RVA23 vs 언어 런타임 Tier 등급), "표준화가 채택을 이끈다" 원칙이 스택의 다른 층에서 반복.
- [[2026-08-30-vphone-cli-virtual-iphone-boot]] — 지원·침습 수준을 명시적으로 단계화하는 설계 원칙의 반복(Tier 1~3 vs least~exp 패치 변형).
- [[2026-06-08-job-interviews-taught-me-kubernetes]] — "채택은 기술 우위가 아니라 조직적·거버넌스적 이점에서 온다"는 원칙의 최초 출처 노트, 이번 Tier 3 승격에도 같은 축이 반복.

## 한 달 뒤 회고

*(2026-09-30 즈음 — RISE RISC-V Runners가 실제로 CPython CI에 연결됐는지, Tier 2 승격 논의가 진전됐는지 확인.)*
