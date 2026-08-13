---
title: "Linux용 Codex 앱, 프리뷰 제공 시작 (OpenAI): ChatGPT 데스크톱 앱이 리눅스에 왔고 ChatGPT·Work·Codex를 하나의 네이티브 환경에서 쓴다. Ubuntu 24.04/26.04 LTS, Debian 13, Fedora 43/44에 x64·ARM64, .deb와 .rpm. 가벼운 릴리스 소식이지만 두 가지가 눈에 띈다: Windows 대비 기능 비교표가 없다는 것, 그리고 다운로드 페이지가 접속 중인 OS의 버튼만 노출해 VM에서 직접 받아야 한다는 것"
source_title: "Codex in ChatGPT desktop app for Linux is now in preview"
source_url: "https://community.openai.com/t/codex-in-chatgpt-desktop-app-for-linux-is-now-in-preview/1390027/6"
source_name: "OpenAI Community"
referrer_url: "https://news.hada.io/topic?id=32450"
published_at: "2026-08-13"
summarized_at: "2026-08-13"
category: "ai"
tags: ["codex", "openai", "linux", "developer-tools", "release", "resource"]
---

# Linux용 Codex 앱, 프리뷰 제공 시작 (OpenAI)

> 출처: [Codex in ChatGPT desktop app for Linux is now in preview](https://community.openai.com/t/codex-in-chatgpt-desktop-app-for-linux-is-now-in-preview/1390027/6) (OpenAI Community · GeekNews 경유, 제출자 xguru) · 정리일 2026-08-13
> **성격**: **가벼운 릴리스 소식**이다. 가든의 원칙대로 짧게 남긴다.
> **hada 댓글 0개.**
> **표기 안내**: em dash 를 쓰지 않는다(사용자 전역 규칙).

## 한 줄 요약

**Linux 용 ChatGPT 데스크톱 앱이 프리뷰로 공개됐다. 이제 리눅스에서도 **ChatGPT·Work·Codex 를 하나의 네이티브 데스크톱 환경**에서 쓸 수 있고, 프로젝트 관리·파일 작업·브라우저 워크플로와 **ChatGPT 옆에서 Codex 실행**이 가능한 워크스페이스로 설계됐다. 지원 배포판은 **Ubuntu 24.04·26.04 LTS, Debian 13, Fedora 43·44**, 아키텍처는 **x64 와 ARM64**, 패키지는 **.deb 와 .rpm**. 두 가지 단서가 붙는다 - **Windows 와 Linux 버전 간 공식 기능 비교표가 없고**, 다운로드 페이지가 **접속 중인 OS 의 버튼만 노출**해서 Windows 에서 Linux 버전을 받아 VM 으로 옮기지 못하고 **VM 안에서 직접 받아야 한다.**

## 핵심 포인트

- **무엇이 왔나**: Linux 용 **ChatGPT 데스크톱 앱 프리뷰**. **ChatGPT·Work·Codex 를 하나의 네이티브 환경**에 통합.
- **성격**: 단순 채팅 클라이언트가 아니라 **워크스페이스**로 설계됐다. 프로젝트 관리, 파일 작업, 브라우저 워크플로, **ChatGPT 옆에서 Codex 실행.**
- **지원 범위**: **Ubuntu 24.04·26.04 LTS, Debian 13, Fedora 43·44.** **x64 와 ARM64.** **.deb 와 .rpm** 패키지.
- **명시되지 않은 것**: **Windows 와 Linux 간 공식 기능 비교표가 없다.** 프리뷰에서 무엇이 빠졌는지 알 수 없다.
- **배포 방식의 제약**: 다운로드 페이지가 **접속 중인 OS 의 버튼만 노출**한다. **Windows 에서 Linux 패키지를 받아 VM 으로 옮길 수 없고 VM 안에서 직접 받아야 한다.**

## 인상 깊은 문장

> **Windows 와 Linux 버전 간 공식 기능 비교표는 없다**
> **프리뷰 릴리스에서 가장 알고 싶은 정보가 빠져 있다**(→ 아래 메모).

> 다운로드 페이지가 접속 중인 OS 의 버튼만 노출한다
> 사소하지만 **에어갭 환경이나 프로비저닝 자동화에는 실질적 마찰**.

## 댓글

**hada 댓글 0개.**

**읽을 때 감안**
- ①**커뮤니티 포럼 글**이고 공식 릴리스 노트가 아니다. 세부는 바뀔 수 있다.
- ②**기능 차이가 문서화되지 않았다.** 리눅스에서 쓸 수 있는 것과 없는 것을 **써봐야 알 수 있는 상태.**
- ③**프리뷰**라 안정성·업데이트 주기에 대한 약속이 없다.

## 내 생각 · 적용점

**가벼운 소식이라 길게 쓸 게 없다. 두 가지만 남긴다.**

### 1. 기능 비교표 부재가 프리뷰에서 가장 큰 마찰이다

**리눅스를 주력으로 쓰는 개발자가 이 발표에서 알고 싶은 건 하나다** - **Windows 에서 되던 게 여기서도 되는가.** 그게 없으면 도입 판단이 "일단 설치해서 확인"이 되고, **팀 단위로는 그 확인 비용이 몇 배가 된다.**

**이건 이번 시즌 반복 확인한 형태의 작은 판본이다.** 이틀 전 [[2026-08-11-meta-muse-glimmer-30b-local-agentic]]에서 **생태계 지원이 대부분 "예정"**이라는 걸 급소로 짚었고, 오늘 [[2026-08-13-qwen38-2-4t-a95b-open-weights]]에서는 **공개판이 서비스판과 다르다**는 축을 새로 세웠다. **공통점: 발표는 무엇이 되는지 말하고 무엇이 안 되는지는 말하지 않는다.**

### 2. 배포 경로의 마찰은 사소해 보이지만 자동화에 걸린다

**접속 OS 의 버튼만 노출하는 다운로드 페이지**는 브라우저로 받는 개인에게는 아무 문제가 아니다. 그런데 **VM 프로비저닝, 에어갭 환경, 사내 미러 구축, Ansible/Dockerfile 로 설치를 자동화하는 경우**에는 곧바로 막힌다.

**직접 링크나 apt/dnf 저장소를 제공하지 않는 배포는 팀 도입에 불리하다.** `.deb`/`.rpm` 을 만들어 놓고도 **저장소를 안 열면 절반만 온 셈**이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용이 거의 없다.** 온다에서 리눅스 개발 환경을 쓰는 사람이 있다면 선택지가 하나 늘었다는 정도다.

- **팀 도입을 검토한다면 기능 차이부터 확인.** 문서가 없으니 **한 사람이 먼저 써보고 차이를 목록으로 남기는 게 가장 싼 방법**이다.
- **사내 표준 개발 환경에 넣을 거라면 저장소 제공 여부를 확인.** 없으면 **버전 관리와 업데이트가 수동이 된다.**

## 연관 자료
- [[2026-08-11-meta-muse-glimmer-30b-local-agentic]]: *"생태계 지원이 대부분 예정"이라는 같은 형태의 공백*
- [[2026-08-13-qwen38-2-4t-a95b-open-weights]]: *공개판과 서비스판이 다르다는 축. 발표가 안 되는 것을 말하지 않는다는 점에서 같다*
- [[2026-08-13-zed-delta-multiplayer-agent-coding]]: *같은 주의 다른 개발 환경 릴리스*

## 한 달 뒤 회고
*(2026-09-13 즈음: ①Windows 와의 기능 비교표가 나왔는지 ②apt/dnf 저장소가 열렸는지 ③프리뷰가 정식으로 갔는지)*
