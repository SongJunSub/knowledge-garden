---
title: "Ruby2Shell, 대소문자 변환 한 줄에서 터지는 힙 오버플로 (CVE-2026-132825) — 독일어 ß 21개로 버퍼가 넘친다"
source_title: "Ruby2Shell: Pre-auth heap overflow in Ruby 3.3, 3.4, and 4.0"
source_url: "https://equixly.com/blog/2026/11/19/ruby2shell-pre-auth-heap-overflow-in-ruby/"
source_name: "Equixly (1차 발견: Veria Labs)"
referrer_url: "https://news.hada.io/topic?id=37458"
published_at: "2026-11-19"
summarized_at: "2026-11-20"
category: "backend"
tags: ["ruby", "cve-2026-132825", "heap-overflow", "rails", "rce"]
---

# Ruby2Shell, 대소문자 변환 한 줄에서 터지는 힙 오버플로 (CVE-2026-132825)

> 출처: [Ruby2Shell: Pre-auth heap overflow in Ruby 3.3, 3.4, and 4.0](https://equixly.com/blog/2026/11/19/ruby2shell-pre-auth-heap-overflow-in-ruby/) (Equixly, 1차 발견은 Veria Labs) · [GeekNews](https://news.hada.io/topic?id=37458) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 egress 차단 재확인. 다만 Equixly·CovertSwarm·Miggo·Astra·Veria Labs 등 8개 독립 매체가 CVE 번호와 메커니즘을 일치시켜 신뢰도가 높다. RCE 실증 여부만 매체 간 의견이 나뉜다.

## 한 줄 요약

**Ruby의 `upcase`·`swapcase` 등 대소문자 변환 메서드가 ISO-8859-1 같은 1바이트 레거시 인코딩에서 독일어 'ß'를 2문자로 확장할 때 1바이트 여유만 확인하는 off-by-one 결함(CVE-2026-132825)이 있고, Rails 기본 설정에서 인증 없이 네트워크로 도달 가능하다.**

## 핵심 포인트

- **CVE-2026-132825(GHSA-34m4-m9fh-gqp5)**: ISO-8859-1·Windows-1252 같은 레거시 1바이트 인코딩에서 독일어 `ß`를 대문자화하면 1바이트 입력이 "SS" 2문자로 늘어나는데, 루프가 ***1바이트 여유만 확인***해 off-by-one(CWE-193)이 발생한다. Ruby 2.4.0부터 존재했다.
- 영향 메서드는 `upcase`, `swapcase`, `downcase(:fold)`, `casecmp?`. UTF-8 문자열은 다른 코드패스라 영향이 없다.
- Rails/Sinatra 기본 설정에서 ***인증 없이 네트워크로 도달 가능*** — Rack의 `MethodOverride` 미들웨어가 폼의 `_method` 값에 `upcase`를 호출하는 경로가 Rails 기본값으로 활성화돼 있다.
- **RCE 여부는 매체 간 논쟁 중**이다. Veria Labs는 RCE를 주장하고, Equixly는 "Ruby 팀이 RCE PoC의 존재를 알고 있다"고 언급하지만 힙 그루밍 기반 주장이라 검증 난이도가 높아 다른 매체는 "RCE 시연 안 됨"으로 보도했다.
- 실제로는 ***7건의 메모리 손상 결함***이 정규식 엔진과 문자열 대소문자 변환에서 한 번에 패치됐다(2026-11-18). 패치 버전은 4.0.10 / 3.4.13 / 3.3.14이며 ***Ruby 3.2 이하는 패치가 없다***.

## 인상 깊은 문장

> "21 ß's, 1 byte: Ruby's upcase overflows its own buffer" (DEV Community, Frank Chu)

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: RCE 실증 여부는 매체 간 의견이 갈려 "가능성 있음" 수준으로만 기록한다. Ruby 3.2 이하는 패치가 없어 그대로 노출된 상태임을 강조해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — "CVE 검증"의 좋은 대조군이자 같은 주의 또 다른 "~2shell" 명명

[[2026-11-19-nginx-http2-rce-cve-unconfirmed]]는 CVE 번호가 끝내 확인되지 않아 "가짜 가능성 높음"으로 썼는데(이후 리서치로 실재가 확인돼 정정 노트 [[2026-11-20-nginx2root-rce-cve-confirmed-correction]]를 썼다), 이번 Ruby2Shell은 8개 매체가 CVE 번호를 정확히 일치시켜 **반대로 신뢰도 높은 사례**다 — 같은 "원문 미접속" 상황에서도 교차검증 매체 수에 따라 신뢰도 판단이 달라진다는 걸 보여준다. [[2026-11-18-java4shell-openjdk-base64-decoder-cve]]와 같은 "~2shell/~4shell" 네이밍 계열이기도 하다.

### 적용점

레거시 인코딩(ISO-8859-1, Windows-1252)을 쓰는 레거시 연동 구간에서 사용자 입력을 대소문자 변환한다면 Ruby 버전과 패치 여부를 바로 점검해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** Ruby/Rails 기반 레거시 연동이 있고, 레거시 인코딩 지역(독일어권 등)의 사용자 입력을 처리한다면 패치 버전(4.0.10/3.4.13/3.3.14) 적용 여부를 점검 대상에 올려야 한다. 그 외에는 일반적인 "패치 버전 확인" 체크리스트 수준이다.

## 연관 자료

- [[2026-11-20-nginx2root-rce-cve-confirmed-correction]] — 같은 배치, 대조적으로 CVE 검증 난이도를 보여주는 사례
- [[2026-11-18-java4shell-openjdk-base64-decoder-cve]] — 같은 "~2shell" 네이밍 계열
- [[2026-10-22-php-critical-rce-security-release]] — 같은 시기 언어 런타임 RCE 패치 계열

## 한 달 뒤 회고

2026-12-20 즈음 — RCE PoC가 실제로 공개됐는지, Ruby 3.2 이하 사용처가 있다면 대응했는지 점검.
