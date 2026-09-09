---
title: "2026년, 비밀번호 관리자 전환하기 (Ricky Mondello) — Credential Exchange Format 덕에 이제 앱만 고르면 비밀번호·패스키·인증코드까지 통째로 옮겨간다"
source_title: "Switching Password Managers in 2026"
source_url: "https://rmondello.com/2026/09/07/switching-password-managers-2026/"
source_name: "Ricky Mondello 개인 블로그 (rmondello.com)"
referrer_url: "https://news.hada.io/topic?id=33381"
published_at: "2026-09-07"
summarized_at: "2026-09-09"
category: "engineering"
tags: ["password-manager", "credential-exchange-format", "passkeys", "apple-passwords", "interoperability", "vendor-lock-in"]
---

# 2026년, 비밀번호 관리자 전환하기 (Ricky Mondello)

> 출처: [Switching Password Managers in 2026](https://rmondello.com/2026/09/07/switching-password-managers-2026/) (Ricky Mondello) · GeekNews(id=33381) 경유 · 정리일 2026-09-09

> **출처 한계**: `rmondello.com`·`news.hada.io`·`lobste.rs` 모두 이 세션 egress 정책으로 직접 열람하지 못했다. Slack 발췌 3줄과 WebSearch 스니펫(원문 취지·구체 예시가 여러 매체에 걸쳐 일관되게 인용돼 신뢰도는 비교적 높다고 판단)으로 재구성했다. 저자가 애플 인증 관련 팀이나 패스키 커뮤니티와 어떤 공식 관계인지는 확인하지 못했다 — WebSearch 결과는 "패스키 커뮤니티와 가까운 인물"이라는 정황만 시사한다.

## 한 줄 요약

**iPhone·iPad의 지원 앱끼리는 Credential Exchange Format(CXF)과 OS의 보안 전송 기능을 결합해, 암호화되지 않은 중간 파일 없이 비밀번호·패스키·인증 코드·메모를 한 번에 옮길 수 있게 됐다.** 저자는 1Password에서 Apple Passwords로 100개 항목을 실제로 이전한 과정을 시연하며 "이제 아무도 자신의 비밀번호 관리자에 갇혀 있다고 느낄 필요가 없다"고 말하지만, macOS에서는 일부 앱이 아직 CXF를 구현하지 않아 앱 조합에 따라 모바일 기기가 오히려 더 나은 이전 창구가 될 수 있다.

## 핵심 포인트

- **CXF + OS 보안 전송** — 사용자가 고른 두 앱 사이에서 암호화된 채널로 자격 증명을 직접 전달한다. CSV 등 ***암호화되지 않은 중간 파일을 아예 만들지 않는다***는 게 설계의 핵심 — 기존 "내보내기 → 평문 파일 → 가져오기" 방식의 유출 위험을 구조적으로 없앤다.
- **실제 이전 시연** — 1Password iOS 앱의 Items › Settings › Advanced › Start Export 경로로 100개 항목을 내보내 Apple Passwords로 옮기는 과정을 직접 보여준다.
- **지원 앱 목록** — Apple Passwords, 1Password, Bitwarden(CXF를 처음 지원한 서드파티 관리자), Dashlane, DuckDuckGo, Devolutions 등이 지원.
- **플랫폼 비대칭** — iOS·iPad에서는 상호운용성이 더 낫고 안전하며 포괄적인 반면, ***macOS에서는 일부 앱이 아직 CXF를 도입하지 않아*** 같은 앱 조합이라도 모바일 기기 쪽이 더 나은 이전 수단이 될 수 있다.
- **락인의 남은 자리 — Lobsters 지적** — WebSearch로 확인된 Lobsters 댓글 하나는, Apple Passwords가 보관한 패스키에 접근 가능한 웹 브라우저가 ***Apple이 허용한 브라우저로 제한된다***는 한계를 지적한다. 자격 증명 이전은 쉬워졌어도, 그걸 실제로 "쓸 수 있는" 범위는 여전히 플랫폼이 쥐고 있다는 반론이다.

## 인상 깊은 문장

원문 직접 인용은 하지 못했다(egress 차단). WebSearch로 확인된 취지: "이제 아무도 자신의 비밀번호 관리자에 갇혀 있다고 느낄 필요가 없다." — 상호운용성이 곧 신뢰의 조건이라는 저자의 태도를 압축한다.

## 댓글

hada 댓글 수는 이 세션에서 확인하지 못했다(차단). Lobsters(`lobste.rs`)에 별도 스레드가 존재함은 확인했으나 이 도메인도 이번 세션에서 접근이 차단돼 전체 댓글 목록은 못 봤고, WebSearch로 확인된 댓글 하나만 인용했다 — Apple Passwords 패스키에 접근 가능한 브라우저가 Apple이 허용한 것으로 제한된다는 지적. 저자의 낙관적 톤("어디에도 갇히지 않는다")에 대한 유효한 견제로 보이지만, 이 한 댓글만으로 커뮤니티 전체 논조를 대표한다고 보긴 어렵다.

## 내 생각 · 적용점

1. [[2026-07-23-passkeys-consumer-psychology]]에서 Nikita Bier가 지적한 패스키의 근본 문제는 ***"이 열쇠가 물리적으로 어디 있는지 모르겠다"는 정신 모델 붕괴***와 ***"복구 경로가 불명확하다"***는 것이었다. CXF는 정확히 후자(이동·복구 축)의 문제를 기술적으로 풀려는 시도로 읽힌다 — 다만 이동은 쉬워져도, "지금 내 열쇠가 어디 있나"라는 Bier의 전자 문제에는 CXF도 답을 주지 못한다. 두 글을 겹치면 패스키 UX 문제가 "이동성"과 "정신 모델" 두 축으로 따로 풀려야 한다는 게 드러난다.
2. Lobsters의 브라우저 제한 지적은, 상호운용성 개선이 "개방 표준의 승리"처럼 보여도 실제로는 각 플랫폼 벤더가 접근 허용 범위를 여전히 통제한다는 걸 보여준다 — 진짜 락인은 ***데이터를 못 옮기게 막는 것***이 아니라 ***옮긴 데이터를 누가 어디서 쓸 수 있게 허용하느냐***에 있다는 원칙으로 일반화할 만하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이다 — CRS/PMS는 최종 소비자용 비밀번호 관리자가 아니다. 다만 전이 가능한 원칙 두 가지는 남는다. ① **벤더 종속 우려를 줄이는 실질적 방법은 "데이터를 내보낼 수 있다"가 아니라 "검증된 스키마로 안전하게 이전할 수 있다"는 것** — CRS 고객사가 다른 PMS·채널 매니저로 갈아탈 때 단순 CSV export만 제공하는 것과, CXF처럼 스키마·전송 보안까지 표준화된 이전 경로를 제공하는 것은 신뢰 수준이 다르다. ② **Lobsters 댓글이 보여준 함정을 스스로 점검해야 한다** — 온다가 표준 연동 API를 제공한다 해도, 실제 접근 가능 범위(권한·화이트리스트)를 온다가 계속 쥐고 있다면 "상호운용성"의 약속은 반쪽짜리라는 걸 인지하고 설계해야 한다.

## 연관 자료

- [[2026-07-23-passkeys-consumer-psychology]] — 패스키의 근본 UX 문제(정신 모델·복구)를 지적한 글, 이 글의 CXF는 그중 이동성 문제에 대한 기술적 답에 가깝다
- [[2026-08-26-key-amnesia-agent-secrets]] — "자격 증명을 안 보여주고 쓰게 한다"는 위협 모델 이동을 다룬 글과, "자격 증명을 안전하게 보여주며 앱 간에 옮긴다"는 이 글의 이동 축이 대비된다

## 한 달 뒤 회고

*(2026-10-09 즈음 — CXF를 지원하는 macOS 앱 목록이 늘었는지, Lobsters가 지적한 브라우저 제한 이슈에 진전이 있었는지 원문 접근이 풀리면 확인.)*
