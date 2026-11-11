---
title: "Vercel agent-desktop(Vercel Labs, 부분 확인) — 스크린샷 대신 OS 접근성 API로 AI 에이전트가 네이티브 앱을 조작하는 Rust CLI"
source_title: "Vercel agent-desktop - AI 에이전트가 데스크톱 앱을 조작하는 CLI"
source_url: "https://news.hada.io/topic?id=36967"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36967"
published_at: "2026-10-28"
summarized_at: "2026-11-11"
category: "ai"
tags: ["vercel", "agent-desktop", "computer-use", "accessibility-api", "desktop-automation", "rust", "cli", "open-source"]
---

# Vercel agent-desktop (Vercel Labs)

> 출처: [Vercel agent-desktop - AI 에이전트가 데스크톱 앱을 조작하는 CLI](https://news.hada.io/topic?id=36967) (GeekNews) · 정리일 2026-11-11
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 열지 못했다. 다만 WebSearch로 복수의 독립 출처가 Rust CLI, Apache-2.0 라이선스, 플랫폼별 접근성 API(macOS AX, Windows UI Automation, Linux AT-SPI), 버전 이력(2026년 10월 28일~11월 3일)을 서로 일관되게 전해, 이번 건은 부분 확인 수준으로 다룬다. 동명의 다른 프로젝트가 존재해 혼동 가능성이 있다는 점도 주의가 필요하다.

## 한 줄 요약

**Vercel Labs의 agent-desktop은 AI 에이전트가 화면 좌표나 스크린샷이 아니라 운영체제의 접근성 API를 통해 버튼, 메뉴, 입력란을 JSON으로 읽고 ID로 직접 조작하게 해주는 Rust CLI로, API가 없는 네이티브 데스크톱 앱 자동화를 목표로 한다.**

## 핵심 포인트

- **스크린샷 대신 접근성 트리**: 운영체제의 접근성 API로 버튼, 메뉴, 입력란을 JSON으로 가져와, 화면 좌표 대신 각 요소의 ID로 클릭하거나 텍스트를 입력한다.
- **부작용 최소화 설계**: 요소 ID로 조작할 때는 기본적으로 마우스 포인터를 움직이거나 앱 포커스를 가져오지 않는다. 필요하면 스크린샷을 찍거나 키보드, 마우스로 직접 입력하는 폴백도 지원한다. 보이지 않는 조작이 기본, 보이는 조작은 옵션이다.
- **연결 방식**: CLI, MCP 서버, C 라이브러리로 연결할 수 있다. LLM을 내장하지 않고 GUI도 없는 순수 조작 계층이다.

## 인상 깊은 문장

> "운영체제의 접근성 API로 버튼, 메뉴, 입력란을 JSON으로 가져와, 화면 좌표 대신 각 요소의 ID로 클릭하거나 텍스트를 입력할 수 있음" (Slack 발췌)

## 댓글

GeekNews 댓글 수는 확인 불가. 동명의 다른 프로젝트가 별도로 존재해 혼동 여지가 있다는 점도 확인됐다.

## 내 생각 · 적용점

### 핵심 전이 1 — "행동, 방법, 입출력" 분리 원칙이 벤더 바깥에서도 재현됐다

[[2026-08-22-computer-use-skills-files-api-ga]]는 Anthropic의 Computer Use, Skills, Files API를 행동, 방법, 입출력 세 축으로 정리했다. agent-desktop은 Anthropic 밖에서 Vercel이 행동 축만 떼어내 독립 오픈소스 CLI로 만든 사례다. 좌표 기반 Computer Use 대신 접근성 트리 기반 조작이라는 점에서, Claude의 Browser Use가 택한 구조 참조와 같은 방향의 설계 철학을 데스크톱 영역에서 재현한 것으로 읽힌다.

### 핵심 전이 2 — "비전 없는" 컴퓨터 사용

[[2026-11-05-tencent-hy4-official-release-visual-computer-use]], [[2026-10-27-gpt-6-1-terra-visual-reasoning-computer-use]]와 같은 최근 컴퓨터 사용 사례들은 시각 모델이 화면을 보고 조작하는 방식이었다. agent-desktop은 정반대로 시각을 쓰지 않고 접근성 API만으로 조작한다. API가 있으면 API를, 없으면 접근성 트리를, 그래도 안 되면 비전을 쓰는 계층적 전략으로 수렴하고 있다는 그림이 보인다.

### Claude 사용자 관점의 적용점

이 도구가 MCP 서버로 연결된다는 점은, Claude Code나 Claude Desktop에 이 MCP를 붙이면 로컬 데스크톱 앱을 Claude가 직접 조작하게 만들 수 있다는 뜻이다. 다만 스크린샷을 안 찍는다는 건 역으로 내가 Claude가 뭘 하고 있는지 시각적으로 확인하기 더 어려워진다는 트레이드오프이기도 하다. 신뢰 가능한 로깅(JSON 응답)을 반드시 남기고 확인하는 습관이 필요하다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음, 장기 참고.** 많은 레거시 PMS/CRS는 API가 아예 없거나 제한적인 경우가 많다. agent-desktop류 도구는 API 없는 레거시 윈도우 프로그램을 AI 에이전트로 조작하는 현실적인 경로를 보여준다. 다만 프로덕션 PMS에 에이전트가 직접 화면을 조작하게 하는 것은 상당한 리스크 검토가 필요하다. 사내 도구, 테스트 자동화 영역에서 먼저 검증하는 게 현실적이다.

## 연관 자료

- [[2026-08-22-computer-use-skills-files-api-ga]] — 행동, 방법, 입출력 세 축 분리 원칙을 세운 선행 노트
- [[2026-11-05-tencent-hy4-official-release-visual-computer-use]] — 시각 기반 컴퓨터 사용 사례, agent-desktop의 비전 없는 접근과 대비
- [[2026-10-27-gpt-6-1-terra-visual-reasoning-computer-use]] — 또 다른 시각 기반 컴퓨터 사용 모델, 같은 대비 축

## 한 달 뒤 회고

*(2026-12-11 즈음 — agent-desktop의 실제 사용 사례, 특히 엔터프라이즈 레거시 앱 자동화가 늘었는지, MCP 서버 연동이 Claude 생태계에서 얼마나 쓰이는지 확인한다.)*
