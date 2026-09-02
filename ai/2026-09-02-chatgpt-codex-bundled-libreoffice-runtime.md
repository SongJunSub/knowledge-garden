---
title: "ChatGPT/Codex 앱, macOS 캐시에 1.7GB 런타임을 몰래 심어둔다 (Simon Willison 발견) — Python·Node.js 전체설치·git에 430MB 헤드리스 LibreOffice까지, 문서 작업을 한 번도 안 해도 로그인 직후 생긴다"
source_title: "Codex bundles LibreOffice"
source_url: "https://simonwillison.net/2026/Sep/1/codex-libreoffice/"
source_name: "simonwillison.net (직접 접근 불가 — GitHub 이슈 원문 + WebSearch 교차검증으로 재구성)"
referrer_url: "https://news.hada.io/topic?id=33137"
published_at: "2026-09-01 (추정, 검색 스니펫 기준)"
summarized_at: "2026-09-02"
category: "ai"
tags: ["codex", "chatgpt", "openai", "desktop-app", "hidden-dependencies", "supply-chain-transparency", "libreoffice", "disk-footprint", "documents-plugin"]
---

# ChatGPT/Codex 앱, macOS 캐시에 1.7GB 런타임을 몰래 심어둔다

> 출처: [Codex bundles LibreOffice](https://simonwillison.net/2026/Sep/1/codex-libreoffice/) (Simon Willison 추정 · 도메인명 기준, 원문 직접 접근 불가) · 정리일 2026-09-02
> **출처 한계**: `simonwillison.net`, `news.hada.io`, `news.ycombinator.com` 전부 이번 세션 egress 차단으로 원문·hada 댓글·HN 스레드를 직접 읽지 못했다. 대신 **GitHub 이슈 3건(openai/codex #26816, #27797, #24210)은 직접 접근해 원문을 확인**했고, 이 이슈들이 서로 다른 독립 경로에서 일치해 핵심 사실관계는 신뢰할 만하다. HN 포인트·댓글 수(314점/146개)는 aggregator(hckrnews) 스냅샷 기준 근사치다.

## 한 줄 요약

**ChatGPT로 이름이 바뀐 OpenAI Codex 데스크톱 앱은 `~/.cache/codex-runtimes/codex-primary-runtime`에 ***1.7GB짜리 로컬 런타임을 사용자 모르게 설치***한다 — Python과 Node.js 전체 설치본, Poppler, git, 그리고 ***약 430MB짜리 헤드리스 LibreOffice(LibreOfficeDev)***까지 포함되며, 문서 작업을 한 번도 요청하지 않은 신규 macOS 설치에서도 앱을 처음 실행하고 로그인하는 순간 똑같이 생성된다. 정작 macOS에서는 번들된 LibreOfficeDev가 존재하지 않는 Homebrew dylib 경로를 참조해 크래시가 나고, Windows에서도 별도의 LibreOffice 실행 버그가 보고돼 있다.**

## 핵심 포인트

- **규모와 위치** — `~/.cache/codex-runtimes/codex-primary-runtime` 아래 **1.7GB**. Python 전체 설치, Node.js 전체 설치, Poppler, git, 그리고 **헤드리스 LibreOffice(LibreOfficeDev.app) 약 429.7MB**가 포함된다.
- **왜 필요한가** — Documents 플러그인의 스킬이 Codex에게 이 바이너리들의 정확한 경로를 알려주고, PDF·오피스 문서 처리에 쓰도록 지시한다.
- **동의 없는 조기 설치** — 신규 macOS 설치에서도 **문서 작업을 한 번도 요청하기 전, 앱을 처음 실행하고 로그인만 해도** 같은 LibreOffice 런타임이 이미 생성되는 것이 확인됐다.
- **macOS에서 실제로 깨진다** — GitHub 이슈 [#26816](https://github.com/openai/codex/issues/26816)에 따르면 번들된 LibreOfficeDev가 `/opt/homebrew/opt/little-cms2/lib/liblcms2.2.dylib` 등 **존재하지 않는 Homebrew 경로에 절대경로로 링크**돼 있어 `dyld: Library not loaded` 에러로 크래시한다.
- **사용자 지정 경로가 없다** — 이슈 [#27797](https://github.com/openai/codex/issues/27797)은 사용자가 이미 안정적인 시스템 LibreOffice를 갖고 있어도 Documents 플러그인이 **불안정한 알파 버전의 번들 LibreOfficeDev를 강제로 우선 사용**하는 문제를 제기한다.
- **Windows도 예외 아님** — 이슈 [#24210](https://github.com/openai/codex/issues/24210)은 Windows에서 Documents 플러그인의 `render_docx.py`가 LibreOffice를 임시 `UserInstallation` 프로필로 실행할 때 실패하는 별도 버그를 보고한다.

## 인상 깊은 문장

> "dyld: Library not loaded: /opt/homebrew/opt/little-cms2/lib/liblcms2.2.dylib" (GitHub Issue #26816에서 직접 확인한 실제 크래시 로그)

> "Allow Documents plugin to use system LibreOffice instead of bundled LibreOfficeDev" (Issue #27797 제목)

## 댓글

**hada 댓글 수 확인 불가** — `news.hada.io` 세션 내 차단으로 원문·댓글 모두 못 읽었다. 이 이슈는 HN에도 "The ChatGPT/Codex app bundles a full copy of LibreOffice"라는 제목으로 올라와 aggregator 스냅샷 기준 **약 314점·146개 댓글**로 상당한 반향을 얻은 것이 WebSearch로 교차확인됐다(실시간 수치는 아니고 근사치). Lobsters 큐레이션 여부는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "발표가 안 되는 것은 말하지 않는다"는 패턴이 이번엔 발표조차 없이 발견된 사례

[[2026-08-13-codex-linux-desktop-preview]]에서 짚었던 패턴의 더 극단적 버전이다. 이번엔 아예 공지 자체가 없는 상태에서 사용자가 디스크를 뒤져서 발견했다.

### 핵심 전이 2 — 로컬에서 실제로 뭐가 도는지 사용자가 확인하기 어렵다는 불투명성 계열

[[2026-07-15-codex-encrypting-subagent-prompts-audit-gap]]은 통신 내용을 검사할 수 없다는 문제를 다뤘다. 이번 사례는 **로컬 디스크에 뭐가 깔리는지조차 사용자 눈에 잘 안 띈다**는 다른 층위다.

### 핵심 전이 3 — Work Local의 "로컬 폴더 접근"이 바로 이 하부 구조일 가능성

[[2026-09-01-chatgpt-work-cloud-local-explained]]의 Work Local이 이번에 드러난 Documents 플러그인의 로컬 런타임과 같은 기반일 가능성이 높다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이다. 다만 전이 가능한 원칙: **에이전트 데스크톱 앱을 사내 표준 도구로 도입하기 전, 로컬 디스크·의존성 바이너리 풋프린트를 IT 보안 감사 체크리스트에 명시적으로 넣는다.** 번들된 서드파티 바이너리의 버전·라이선스 추적 책임이 벤더에게 위임된다는 점도 인지해야 한다.

## 연관 자료

- [[2026-08-13-codex-linux-desktop-preview]] — "발표가 안 되는 것은 말하지 않는다"는 같은 패턴의 더 극단적 형태.
- [[2026-07-15-codex-encrypting-subagent-prompts-audit-gap]] — 로컬 머신에서 Codex가 실제로 뭘 하는지 사용자가 확인하기 어렵다는 불투명성의 다른 층위.
- [[2026-09-01-chatgpt-work-cloud-local-explained]] — Work Local의 "로컬 폴더 접근" 기능이 이번에 드러난 런타임과 같은 하부 구조일 가능성.

## 한 달 뒤 회고

*(2026-10-02 즈음 — ①OpenAI가 사용자 지정 LibreOffice 경로 옵션(#27797)을 실제로 추가했는지, ②macOS dylib 크래시(#26816)가 수정됐는지, ③원문 직접 접근이 가능해지면 필자의 실제 논조를 재확인.)*
