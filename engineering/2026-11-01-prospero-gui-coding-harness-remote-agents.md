---
title: "Prospero, 경량 설계와 원격 실행을 지원하는 코딩 하네스(GeekNews) — 무한 대기를 막는 설계가 하네스의 핵심이다"
source_title: "Prospero - 경량 설계와 원격 실행을 지원하는 새로운 코딩 하네스"
source_url: "https://news.hada.io/topic?id=36346"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36346"
summarized_at: "2026-11-01"
category: "engineering"
tags: ["coding-harness", "ai-agent", "gui-automation", "remote-execution", "dear-imgui"]
---

# Prospero, 경량 설계와 원격 실행을 지원하는 코딩 하네스(GeekNews)

> 출처: [Prospero - 경량 설계와 원격 실행을 지원하는 새로운 코딩 하네스](https://news.hada.io/topic?id=36346) (GeekNews) · 정리일 2026-11-01

> **출처 한계**: news.hada.io는 egress 차단(getaddrinfo ENOTFOUND)으로 원문 열람 불가. WebSearch로 "Prospero coding harness GUI agent Dear ImGui" 등을 검색했지만, **이 이름(Prospero)으로 Dear ImGui 기반 코딩 하네스를 만든 프로젝트의 1차 출처(GitHub 저장소, 작성자, 라이선스)를 특정하지 못했다.** 검색에서 발견한 것은 성격이 다른 GUI 에이전트 도구들(imgui-mcp, Widgeteer 등)뿐이고, 동일 프로젝트인지 확인하지 못했다. Slack 발췌를 1차 자료로만 쓴다.

## 한 줄 요약

**Prospero는 C++·Dear ImGui로 만든 네이티브 GUI 코딩 하네스로, 에이전트가 화면을 보고 클릭·입력해 GUI 앱을 직접 테스트하게 하면서도 네트워크 요청·셸 명령·중단 시 모두에 시간제한과 프로세스 트리 정리를 걸어 "무한히 기다리는 에이전트"를 구조적으로 차단한다.**

## 핵심 포인트

- **C++ + Dear ImGui 네이티브 GUI**, Windows·macOS·Linux 지원. 로컬 모델이나 외부 모델 API를 자유롭게 연결.
- **서브에이전트 병렬 작업 + 원격 실행 지원** — 비전 기능이 있는 모델은 ***화면을 보고 직접 클릭·입력해 GUI 앱을 테스트·디버깅***할 수 있다.
- **무한 대기를 막는 설계** — 네트워크 요청과 권한 응답에 시간제한을 걸고, 오래 걸리는 셸 명령은 백그라운드 작업으로 돌려 에이전트가 주기적으로 상태만 확인한다.
- **명령 중단 시 ***전체 프로세스 트리를 함께 종료***** — 부분적으로 죽어서 좀비 프로세스나 리소스 점유가 남는 상황을 설계로 차단하려는 의도로 보인다(Slack 발췌가 여기서 끊겨 구체 구현은 확인 못함).

## 인상 깊은 문장

*(Slack 발췌가 "전체 프로세스 트리를 함께 종료" 이후 말줄임으로 끊겨, 직접 인용할 완결된 문장이 남아 있지 않다. 원문 접근이 가능해지면 보강한다.)*

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. **1차 출처(GitHub 저장소 등)를 특정하지 못한 채 Slack 발췌에만 의존한 낮은 확인 수준**임을 밝힌다.

## 내 생각 · 적용점

**핵심 전이 1 — "기다림 자체를 버그로 본다."** 네트워크 요청, 권한 응답, 셸 명령, 명령 중단까지 전부 시간제한·백그라운드화·프로세스 트리 정리를 깔아둔 건, 에이전트 하네스에서 가장 흔한 실패 모드가 "멈춰서 안 끝나는 상태"라는 걸 설계 단계에서부터 전제한 것이다. [[2026-10-31-herdr-terminal-coding-agent-manager]]가 "창을 닫아도 세션이 유지된다"며 실행과 UI를 분리한 것과 반대 방향의 같은 문제의식 — ***장시간 실행되는 에이전트 작업은 "끝났는지 모름" 상태를 만들지 않는 설계가 핵심이다.***

**핵심 전이 2 — 비전 모델이 GUI를 직접 보고 테스트하는 패턴이 QA 영역까지 확장되고 있다.** [[2026-07-14-antigravity-ai-qa-agent-review]]에서 다룬 "AI가 콘솔·네트워크 로그를 보고 왜 안 되는지 분석한다"는 것과 Prospero의 "비전 모델이 화면을 보고 클릭·입력해 테스트한다"는 같은 축이다 — 다만 Antigravity는 브라우저, Prospero는 네이티브 GUI 앱이라는 차이가 있다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성이 있다, 다만 확정은 멀다.** 온다의 CRS 어드민 화면도 결국 GUI이므로, 비전 모델이 화면을 보고 클릭·입력해 회귀 테스트를 수행하는 패턴은 수동 QA 비용을 줄이는 방향으로 참고할 만하다. 다만 Prospero는 네이티브 데스크톱 GUI(Dear ImGui) 전용으로 보이고 온다의 CRS는 웹 기반이라, **도구 자체를 그대로 쓸 수는 없고 "비전 모델 + 시간제한 + 프로세스 정리"라는 설계 원칙만 전이 가능하다.**

## 연관 자료

- [[2026-10-31-herdr-terminal-coding-agent-manager]] — 코딩 에이전트를 관리하는 네이티브 앱이라는 같은 도구 계열, 실행-UI 분리라는 반대 방향 설계
- [[2026-07-14-antigravity-ai-qa-agent-review]] — 비전 모델이 화면을 보고 직접 테스트한다는 같은 패턴(네이티브 GUI vs 브라우저)

## 한 달 뒤 회고

*(2026-12-01 즈음 — Prospero의 GitHub 저장소·작성자를 특정했는지, "전체 프로세스 트리 종료"의 구체 구현을 확인했는지 WebSearch로 재확인.)*
