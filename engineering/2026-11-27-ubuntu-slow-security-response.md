---
title: "Ubuntu의 느린 보안 대응 (GeekNews) — 커널 취약점 공개 후 수 주가 지나도록 패치가 안정 버전에 닿지 않는, 캐노니컬답지 않은 지연"
source_title: "Ubuntu's slow security response"
source_url: "https://www.omgubuntu.co.uk/2026/11/ubuntu-fix-tcp-bug-criticism"
source_name: "OMG! Ubuntu (추정)"
referrer_url: "https://news.hada.io/topic?id=37876&utm_source=slack&utm_medium=bot&utm_campaign=T02M82VMZ"
published_at: "2026-11"
summarized_at: "2026-11-27"
category: "engineering"
tags: ["ubuntu", "canonical", "linux-kernel", "security-patch", "cve", "vulnerability-management"]
---

# Ubuntu의 느린 보안 대응 (GeekNews)

> 출처: [Ubuntu의 느린 보안 대응](https://news.hada.io/topic?id=37876) (GeekNews, 원문은 OMG! Ubuntu로 추정) · 정리일 2026-11-27

> **출처 한계**: `news.hada.io`가 egress 차단되어 원문·hada 댓글을 직접 열람하지 못했다. WebSearch 교차검증으로 `omgubuntu.co.uk`의 2026년 11월 보도("Ubuntu fix tcp bug criticism")를 찾아 Slack 발췌와 상당히 일치하는 것을 확인했으나, 이 글이 그 기사와 정확히 같은 글인지는 확정하지 못했다.

## 한 줄 요약

**캐노니컬이 "빠른 보안 대응"을 세일즈 포인트로 삼아온 회사인데도, 이번엔 심각한 Linux 커널 취약점의 패치가 공개 후 몇 주가 지나도록 Ubuntu 안정 버전에 닿지 못해 캐노니컬답지 않은 지연이라는 비판을 받고 있다.**

## 핵심 포인트

- **NoisyTCP 취약점** — TCP 스택의 원격 메모리 손상 취약점인 ***NoisyTCP***는 세부 내용 공개 후 9일이 지나도록 수정본이 제공되지 않았다는 서술.
- **AMD 가상화 관련 KVM 취약점도 지연** — 또 다른 취약점은 공개 후 일주일이 지나도록 수정본이 제공되지 않았다.
- **CVE-2026-98432는 수 주째 지연** — WebSearch로 확인된 바로는, 이 CVE는 11월 3일 기준 Ubuntu 22.04·24.04·26.04 LTS에서 테스트 단계에 머물러 있었고 안정 업데이트 저장소(stable updates pocket)에는 아직 도달하지 못한 상태였다. Debian 등 다른 배포판은 이미 패치를 배포한 뒤였다는 비교가 비판의 핵심.
- **실제 악용 시사 사례도 존재** — 이 커널 원격 메모리 손상 취약점이 실제 공격에 악용됐을 가능성을 시사하는 소식도 있다는 서술 — 지연의 실질적 위험성을 높이는 요인.
- **아이러니한 원인**: WebSearch에 따르면 캐노니컬은 2026년 9월 "LLM·AI 에이전트가 취약점 발견을 가속화한다"는 이유로 커널 SRU(보안 업데이트) 주기를 2주로 단축했는데, 역설적으로 이 새 주기의 고정된 테스트 기간 자체가 지금의 지연 원인일 수 있다는 분석이 나온다.

## 인상 깊은 문장

> "zero explanation for why ubuntu has been asleep at the wheel for weeks" — OMG! Ubuntu 기사에 인용된 커뮤니티 반응 (WebSearch로 확인, 원문 2차 인용).

## 댓글

GeekNews 댓글 반응(2개)이 있었다는 것만 Slack에서 확인(Reactions 없음, 본문 댓글 수는 미기재). hada 댓글 내용 자체는 egress 차단으로 확인 불가. 캐노니컬 입장에서는 보안 업데이트 판매가 사업 모델의 핵심이라, 이 비판은 신뢰도에 직접 영향을 주는 민감한 이슈로 읽힌다.

## 내 생각 · 적용점

### 핵심 전이 — "트리아지 병목"이라는 반복되는 주제

[[2026-11-24-security-hell-next-stage]](보안 지옥의 다음 단계, Glasswing 1,061건 중 14건만 실제 악용)와 짝을 이룬다. 두 글 모두 "보고되는 취약점 수는 늘어나는데(AI 보조 발견 등으로), 실제로 중요한 것을 걸러내고 패치를 내보내는 처리 속도가 그 증가를 못 따라간다"는 같은 구조의 문제를 다른 층위(보안 연구 커뮤니티 vs 배포판 유지관리)에서 보여준다. [[2026-11-20-nginx2root-rce-cve-confirmed-correction]]도 CVE 공개와 실제 위험도 판단 사이의 간극을 다룬 사례다.

### 적용점

"보안 업데이트 주기를 단축했는데 그 자체가 새로운 지연 원인이 됐다"는 역설은, 프로세스 개선이 의도한 효과를 내는지 별도로 측정해야 한다는 일반 원칙을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** CRS/PMS가 의존하는 OS·커널 패치 주기를 벤더(여기서는 Ubuntu/Canonical)에만 맡기지 않고, 공개된 CVE의 심각도·악용 시사 여부를 직접 모니터링해 패치 지연 시 자체 완화책(워크어라운드)을 적용하는 체계가 필요하다는 참고 사례다.

## 연관 자료

- [[2026-11-24-security-hell-next-stage]] — 보고량 대비 실제 악용 비율 1%, 트리아지 병목의 다른 사례
- [[2026-11-20-nginx2root-rce-cve-confirmed-correction]] — CVE 공개와 실제 위험 판단 간극의 다른 사례

## 한 달 뒤 회고

2026-12-27 즈음 — CVE-2026-98432 패치가 stable에 도달한 시점, 캐노니컬의 공식 해명 여부를 확인한다.
