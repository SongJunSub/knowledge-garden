---
title: "Postman, 동의 없이 Codex·Claude Code 플러그인을 자동 설치함(GeekNews) — 벤더가 심은 훅이 개발자 모르게 실행된다"
source_title: "A developer opened Postman. Then two AI coding agents changed without their permission."
source_url: "https://thenewstack.io/postman-plugin-coding-agents/"
source_name: "The New Stack (dev.ua, daily.dev 교차확인)"
referrer_url: "https://news.hada.io/topic?id=36538"
summarized_at: "2026-11-04"
category: "engineering"
tags: ["supply-chain", "developer-tools", "consent", "coding-agent", "mcp", "trust-boundary"]
---

# Postman, 동의 없이 Codex·Claude Code 플러그인을 자동 설치함(GeekNews)

> 출처: [A developer opened Postman. Then two AI coding agents changed without their permission.](https://thenewstack.io/postman-plugin-coding-agents/) (The New Stack) · GeekNews(id=36538) 경유 · 정리일 2026-11-04
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 열람하지 못했고, Slack 발췌 본문 자체도 "Po…"에서 끊겨 있었다. The New Stack·dev.ua·daily.dev 세 매체로 교차확인해 본문을 보강했지만, 이 사건은 **신고자 1인의 보고(GitHub issue #14370)에 근거**하며 독립적인 기술 포스트모템이나 2차 재현 사례는 찾지 못했다.

## 한 줄 요약

**macOS에서 Postman 데스크톱 앱(12.33.4)을 실행하자, 사용자 동의 없이 Codex와 Claude Code의 설정이 자동으로 변경되어 Postman 플러그인이 설치됐다 — Codex에는 신뢰된 session-start 훅까지 등록됐고, 이 훅의 신뢰 해시조차 설치 프로그램이 스스로 승인한 것으로 드러났다.**

## 핵심 포인트

- **Postman 실행만으로 두 에이전트가 바뀐다** — Postman 자체 로그에 ***'auto-existing-upgrade' 이벤트***가 기록되어 있었고, 이 이벤트가 Codex와 Claude Code 양쪽에 Postman 플러그인을 설치했다.
- **Codex엔 신뢰된 훅까지 자가 승인** — Codex 설정에는 Postman 플러그인이 활성화된 것은 물론, ***새 플러그인 마켓플레이스와 "신뢰된" session-start 훅***이 추가돼 있었다. 이 훅은 비trivial한 API 작업 전에 'postman:api-engineer' 스킬을 먼저 불러오도록 지시하는데, ***훅의 신뢰 해시(trust hash) 승인 자체를 설치 프로그램이 스스로 수행***했다.
- **원격 MCP 설정은 인증에서 실패** — 자동 추가된 MCP 설정이 Codex를 Postman의 원격 서버로 연결하려 했으나 ***인증 오류로 실패***했다 — 즉 이번 사례에서 실제 데이터 유출이 확인된 것은 아니다.
- **Postman "opt-in을 명확히 하겠다"로 대응** — Postman 제품총괄(Sarabmeet Kallar)은 ***AI 코딩 에이전트 플러그인의 opt-in을 더 명확히 하겠다***고 밝혔고, 특히 기존 사용자 대상으로 그렇게 하겠다며 훅 승인·session-start 동작을 재검토 중이라고 했다.
- **신고자는 "명시적 동의 없는 설치 중단"을 요구** — 신고자는 훅 자체의 승인 제거와 완전한 제거 절차를 요구했다.

## 인상 깊은 문장

> "Postman's own log shows an 'auto-existing-upgrade' event installing both agent plugins." — The New Stack 보도 재구성
>
> "the plugin's installer approves the hook's trust hash itself." — The New Stack 보도 재구성

## 댓글

GeekNews hada 댓글 수는 확인하지 못했다. HN/Lobsters 큐레이션 여부도 미확인. **이해관계·한계**: 이 사건은 신고자 1인의 보고(GitHub issue)에 근거하며, Postman 측의 상세 기술 설명(왜 이런 자동화가 설계됐는지, 다른 사용자에게도 재현되는지)은 아직 공개되지 않았다. "데이터 유출이 확인된 사례는 아니다"라는 점도 분명히 해 둘 필요가 있다 — 인증 실패로 막혔을 뿐, 설계 의도 자체에 문제가 있었다는 것이 핵심이다.

## 내 생각 · 적용점

**핵심 전이 — "동의 없이 설치된 훅이 개발자 모르게 실행된다"는 구조는 같지만, 의도는 정반대다.** [[2026-07-24-fake-interview-git-hook-malware]]에서는 가짜 면접 과제 ZIP에 `.git/hooks/pre-commit`이 심겨 git 명령만 실행해도 악성 페이로드가 내려받아지는, **의도적 악성 캠페인**이었다. 이번 Postman 사례는 벤더가 **편의 기능으로 설계**한 자동화가 사용자 동의 절차를 건너뛴 것이라 의도는 악의적이지 않다. 하지만 "개발자가 모르는 사이에 신뢰된 훅이 심기고 실행된다"는 메커니즘 자체는 두 사례가 동일하다 — 이는 신뢰 경계를 어디에 둘지가 의도보다 메커니즘의 문제라는 것을 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음.** CRS 개발팀이 쓰는 서드파티 벤더 도구(API 테스트, 모니터링, CI 플러그인 등)가 자동 업데이트 과정에서 개발자 머신의 AI 코딩 에이전트(Claude Code, Codex 등) 설정까지 건드릴 수 있다는 걸 이번 사례가 보여준다. 벤더 도구 도입/업데이트 정책에 "이 도구가 내가 쓰는 에이전트의 훅·플러그인·MCP 설정을 변경할 권한이 있는가"를 점검 항목으로 넣을 가치가 있다.

## 연관 자료

- [[2026-07-24-fake-interview-git-hook-malware]] — 동의 없는 훅이 개발자 모르게 실행된다는 같은 메커니즘(의도는 악성 vs 벤더 자동화로 다름)

## 한 달 뒤 회고

*(2026-12-04 즈음 — Postman이 실제로 opt-in 방식을 바꿨는지, GitHub issue #14370 후속 대응이 있었는지 확인.)*
