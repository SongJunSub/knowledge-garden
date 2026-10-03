---
title: "DeepSeek Harness, 맥·윈도우용 데스크톱 앱 공개 — 터미널 없이 돌리는 Cordis 플러그인 하네스"
source_title: "DeepSeek Harness Desktop"
source_url: "https://github.com/deepseek-ai/deepseek-harness"
source_name: "GitHub (deepseek-ai/deepseek-harness)"
referrer_url: "https://news.hada.io/topic?id=34656"
published_at: "2026-10-01"
summarized_at: "2026-10-03"
category: "ai"
tags: ["deepseek", "agent-harness", "cordis", "desktop-app", "open-source", "plugin-architecture", "electron", "coding-agent"]
---

# DeepSeek Harness, 맥·윈도우용 데스크톱 앱 공개

> 출처: [deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) (GitHub, MIT 라이선스) · GeekNews(id=34656) 경유 · 정리일 2026-10-03

> **출처 한계**: `news.hada.io`가 이 세션 내내 egress 정책으로 차단됐다. GitHub 저장소 메인 페이지와 릴리스 페이지는 WebFetch로 직접 확인했지만, README 자체에는 Cordis 구조·Creator mode·예약 작업 등 세부 기능 설명이 없었다(저장소가 코드와 최소 설명만 두고 플러그인 문서를 별도 사이트로 분리해둔 구조). 아래 **Cordis 플러그인 구조·Creator mode·줄 단위 diff 리뷰·예약 작업** 세부는 WebSearch가 반환한 datacamp.com·developersdigest.tech·uwarp.design·qcode.cc 등 3차 해설 기사 스니펫을 교차 확인해 재구성한 것이다 — 공식 문서 원문 대조는 하지 못했다. 데스크톱 앱 자체의 공식 README(`agent-earth/deepseek-harness-desktop`)는 "데스크톱 래퍼가 설정·모델·세션·플러그인·에이전트 경험을 그대로 보존한다"는 점만 확인했다.

## 한 줄 요약

**DeepSeek의 오픈소스 에이전트 실행 하네스 DeepSeek Harness(dsh)가 macOS·Windows용 데스크톱 앱(Electron 기반)으로 나왔다 — 터미널을 열지 않고도 Node.js·pnpm·Python 런타임이 통째로 묶인 앱을 설치해 쓰는 형태다. 핵심은 모델·도구·스킬·화면까지 전부 "플러그인"으로 다루는 Cordis 아키텍처이고, 코딩·문서 작성·데이터 분석·조사를 한 데스크톱 앱 안에서 처리하는 것을 지향한다.**

## 핵심 포인트

- **Cordis = "everything is a plugin"** — 모델 호출, 도구, 스킬, 세션, 샌드박스, 저장소, 루프, 스케줄링, UI까지 에이전트의 모든 기능이 Cordis 플러그인 커널 위의 플러그인으로 구현된다. 논문 *"A Programming Paradigm for Spatiotemporal Composability"*가 설계 개념의 근거로 제시된다.
- **데스크톱 앱의 역할은 "래퍼"** — 로컬 서비스가 준비되면 공식 Harness 웹 UI를 그대로 열어주는 Electron 셸이다. 설정 → 플러그인 마켓, 시스템 트레이에서 상주 실행, 자동 업데이트, 로컬 루프백 포트만 사용 등 "데스크톱 앱다운" 편의를 더했을 뿐, 핵심 로직은 기존 오픈소스 dsh 그대로다.
- **Creator mode** — 기존 Cordis의 동적 정의·실행 도구 대신 Plugin Manager로 영속적인 플러그인을 설치하게 하는 모드로, Standard 모드 기능에 더해 런타임 점검·인메모리 Cordis 플러그인 실험·플러그인을 새 모드로 조합하는 가이드를 제공한다고 소개된다 — Slack 발췌의 "대화로 필요한 플러그인을 만든다"는 설명과 결이 맞는다.
- **줄 단위 diff 리뷰** — `dsh-plugin-diff-review`가 Codex 스타일의 플로팅 diff 패널(라운드별 변경사항 + git 워크스페이스 뷰: stage·revert·commit·push·히스토리 타임라인)과, 사이드바 카드에서 줄 단위·사이드바이사이드 diff·하이라이트·동기 스크롤·호버 미리보기를 제공한다.
- **예약 작업** — `dsh-plugin-scheduled-tasks`가 프로젝트별 프롬프트를 일회성·간격·cron 일정으로 헤드리스 에이전트 세션에서 실행하고, 실행 기록을 영속적으로 남긴다.
- **최신 릴리스(v0.2.1-alpha.1, 2026-10-03 확인)** — Claude Code Mods 호환 레이어(실험적), "Let Agent create a plugin"(에이전트가 직접 플러그인을 만드는 메뉴), Markdown 미리보기에서 YAML 프론트매터를 읽기 쉬운 필드 목록으로 표시, 역방향 프록시용 `--public-url` 지원 등이 포함됐다. GitHub 스타는 약 24.26만 개로 집계됐다(수치가 매우 크고 1회 조회 기준이라 과장·캐시 영향 가능성을 감안해 읽는다).

## 인상 깊은 문장

> "preserves the complete settings, models, sessions, plugins, and agent experience"
> (`agent-earth/deepseek-harness-desktop` README에서 직접 확인한 설명 — 데스크톱 래퍼가 기존 dsh 경험을 그대로 옮긴다는 점을 공식적으로 명시한 부분.)

## 댓글

**hada 댓글 수·논조는 확인 불가**(`news.hada.io` 차단). HN·Lobsters의 별도 스레드 존재 여부도 이 세션에서는 확인하지 못했다. **읽을 때 감안**: ①GitHub 스타 수(약 24만)는 이 세션이 1회 조회한 수치라 정확성을 보증할 수 없고, 저장소명(`deepseek-ai/deepseek-harness`)이 공식 리포임을 전제로 삼았으나 WebSearch 스니펫 일부가 `dsh`라는 축약 표기와 혼용하고 있어 완전히 동일한 프로젝트인지 교차 대조는 1차 자료(README)로만 했다. ②Cordis 플러그인 구조·Creator mode·diff 리뷰·예약 작업 세부는 전부 3차 해설 기사 재구성이라, 실제 UI·동작과 다를 가능성을 배제하지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-04-28-agent-harness-engineering]]의 "하네스 6개 영역" 이론이 이번에는 "플러그인 커널"로 극단화된 구현이다

Addy Osmani의 하네스 이론은 프롬프팅·도구 계층·실행 환경·오케스트레이션·실행 제어·관측성을 **구분된 영역**으로 그렸다. Cordis는 그 구분을 없애고 ***여섯 영역 전부를 플러그인이라는 하나의 단위로 통일***한다 — [[2026-09-02-trueforge-open-source-agent-harness]](TrueForge)가 "모델/MCP서버/SKILL.md/샌드박스를 카탈로그에 등록"하는 정도였다면, DeepSeek Harness는 **UI 자체까지도 플러그인**으로 다룬다는 점에서 한 단계 더 나간 설계다.

### 핵심 전이 2 — 같은 날 정리한 [[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]]·[[2026-10-02-pi-durable-resumable-agent-harness]]와 정확히 반대 방향의 하네스 철학

Pi 1.0은 ***미니멀 터미널 하네스***를 표방하며 가상 모델 조합(계획·구현·전환판단을 서로 다른 모델에 분담)으로 복잡성을 숨겼고, Pi Durable은 체크포인트·`replay: "safe"` 선언으로 재실행 안전성을 하네스 차원에서 보장했다 — 둘 다 "터미널 안에서, 작게" 가는 길이다. DeepSeek Harness Desktop은 정반대로 ***"데스크톱 앱 안에, 크게"*** 간다 — Electron 윈도우, 플러그인 마켓, diff 리뷰 패널, 예약 작업 관리 화면까지 하나의 GUI 애플리케이션으로 통합한다. 같은 "에이전트 실행 루프를 감싼다"는 문제에 터미널 미니멀리즘과 데스크톱 올인원이라는 두 극단이 동시에 나온 것이 흥미롭다 — 어느 쪽이 "이긴다"기보다, 사용자가 **터미널에 익숙한 개발자**인지 **문서·스프레드시트까지 다루는 비개발 업무 사용자**인지에 따라 수요가 갈릴 가능성이 높다.

### 핵심 전이 3 — DeepSeek의 모델 경쟁력과 하네스 경쟁력은 분리해서 평가해야 한다

[[2026-10-01-ai-race-got-awkward-deepseek-kv-cache]]에서 다룬 DeepSeek의 모델 레벨 경쟁(KV 캐시 효율)과, 이번 하네스/데스크톱 앱은 ***다른 층위의 제품***이다. 하네스가 잘 만들어졌다고 모델 성능이 좋아지는 건 아니고, 반대로 모델이 강해도 하네스가 허술하면 실사용 경험은 나쁠 수 있다 — [[2026-04-28-agent-harness-engineering]]의 "Skill Issue, Not Model Issue" 관찰이 DeepSeek 생태계 안에서도 그대로 적용된다.

## 호스피탈리티 / CRS 적용 포인트

- **"everything is a plugin" 설계는 CRS/PMS 연동 확장 방식에 참고할 만한 원칙이다.** 파트너사별 커스텀 규칙·채널 연동·리포트 포맷이 계속 늘어나는 구조라면, 각각을 임시 분기(if-else)로 쌓기보다 **등록-발견-실행이 일관된 플러그인 단위**로 다루는 설계가 유지보수 비용을 줄인다는 방향성은 유효하다. 다만 Cordis라는 특정 기술 채택이 아니라 설계 원칙 수준의 참고다.
- **줄 단위 diff 리뷰 + git 워크스페이스 뷰는 "AI가 생성한 변경을 승인 전에 검토한다"는 패턴의 구체적 구현 예시다.** CRS에서 AI가 초안을 만드는 요금 규칙·재고 설정 변경에도, 적용 전 "무엇이 바뀌는지"를 diff 형태로 보여주는 승인 UI를 두는 게 같은 방향이다.
- **데스크톱 올인원 방향 자체의 직접 도입은 이르다.** 이 세션에서 실사용 반응(hada·HN 댓글)을 확인하지 못했고, 스타 수 등 인기 지표도 1회 조회에 그쳐 검증되지 않았다.

## 연관 자료

- [[2026-04-28-agent-harness-engineering]] — "하네스 6개 영역" 이론이 Cordis의 "모든 것이 플러그인"으로 극단화된 구현
- [[2026-09-02-trueforge-open-source-agent-harness]] — 카탈로그형 하네스의 선행 사례, Cordis는 UI까지 플러그인화한다는 점에서 한 단계 더 나간 설계
- [[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]] · [[2026-10-02-pi-durable-resumable-agent-harness]] — 같은 날 정리된 정반대 방향의 하네스 철학(터미널 미니멀리즘 vs 데스크톱 올인원)
- [[2026-10-01-ai-race-got-awkward-deepseek-kv-cache]] — DeepSeek의 모델 레벨 경쟁, 하네스 경쟁력과는 분리해서 평가해야 하는 다른 층위

## 한 달 뒤 회고

*(2026-11-03 즈음 — ①`news.hada.io` 접근이 가능해지면 hada·HN 댓글 논조를 1차로 확인했는지, ②Cordis 플러그인 구조·Creator mode의 실제 동작을 공식 문서로 재대조했는지, ③GitHub 스타 24만 개 수치가 재조회로도 유지되는지(혹은 1회성 오류였는지), ④데스크톱 앱 실사용 후기나 비교 리뷰(Pi, Codex Desktop 등과의 비교)가 나왔는지 점검.)*
