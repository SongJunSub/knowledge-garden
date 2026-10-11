---
title: "MXC(Microsoft eXecution Container) — 신뢰할 수 없는 코드 실행을 OS 프로세스 샌드박스부터 VM까지 하나의 JSON API로"
source_title: "microsoft/mxc"
source_url: "https://github.com/microsoft/mxc"
source_name: "GitHub (microsoft/mxc)"
referrer_url: "https://news.hada.io/topic?id=35092"
published_at: "확인 불가"
summarized_at: "2026-10-11"
category: "backend"
tags: ["sandbox", "code-execution", "isolation", "microsoft", "cross-platform", "agent-security", "oss-sdk"]
---

# MXC(Microsoft eXecution Container) — 신뢰할 수 없는 코드 실행을 OS 프로세스 샌드박스부터 VM까지 하나의 JSON API로

> 출처: [microsoft/mxc](https://github.com/microsoft/mxc) (GitHub, MIT 라이선스) · GeekNews(id=35092) 경유 · 정리일 2026-10-11
>
> **출처 한계**: `news.hada.io`는 이번 세션 내내 `getaddrinfo ENOTFOUND`로 전혀 열리지 않아 hada 원문 요약·댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. 반면 **GitHub 저장소(`github.com/microsoft/mxc`)는 이번 세션에서 WebFetch로 직접 열람**했으므로, 아래 기술적 사실(플랫폼·SDK·백엔드·API 구조·라이선스)은 1차 소스 기반이다. 다만 "Build 2026에서 공개됐다", "GitHub Copilot CLI의 로컬 샌드박싱 엔진이다", "아직 강력한 보안 경계가 아니다"라는 세 가지 서술은 저장소 페이지 자체에는 없고 WebSearch로 교차 확인한 2차 매체(dsebastien.net, thestack.technology 등)에서만 나왔다 — 이 노트에서는 1차 확인 사실과 2차 재구성 사실을 분리해서 표시한다.

## 한 줄 요약

**Microsoft가 공개한 MXC는 AI 모델 출력·플러그인·도구처럼 ***신뢰할 수 없는 코드***를 Windows·Linux·macOS에서 격리 실행하기 위한 샌드박스 SDK다 — Rust·.NET·Node SDK를 내장하고, OS 네이티브 프로세스 샌드박스부터 전체 VM까지 플랫폼별로 여러 실행 백엔드를 두되, 버전이 있는 JSON 요청 하나로 파일시스템·네트워크·UI 정책을 공통 API로 제어한다. MIT 라이선스로 공개돼 있으며, "격리의 강도"를 고르는 걸 애플리케이션이 직접 백엔드별 API를 따로 배우는 문제가 아니라 ***정책 선택의 문제***로 바꾸는 게 핵심 설계다.**

## 핵심 포인트

- **목적과 대상** — README는 자신을 "sandboxed code execution system"으로 정의하고, 모델 출력·플러그인·도구처럼 ***신뢰할 수 없는 코드***를 실행하기 위한 앱 내장형 SDK라고 밝힌다. AI 에이전트가 생성한 코드를 그대로 실행해야 하는 하네스 설계자를 명확한 타깃으로 삼는다.
- **플랫폼별 기본 백엔드** — Windows 11 x64/ARM64는 `processcontainer`, Linux x64/ARM64는 `bubblewrap`, macOS ARM64/x64는 `seatbelt`가 기본값이다. 셋 다 ***이미 OS가 제공하는 네이티브 격리 메커니즘***을 1차 방어선으로 쓴다는 공통점이 있다.
- **격리 강도를 고를 수 있는 백엔드 스펙트럼** — Windows는 ProcessContainer·Windows Sandbox·WSLC·MicroVM·Hyperlight·IsolationSession, Linux는 Bubblewrap·LXC·MicroVM·Hyperlight, macOS는 Seatbelt까지 지원한다(일부는 experimental). ***가벼운 프로세스 샌드박스 하나로 시작해, 필요하면 VM·MicroVM급 격리로 교체***할 수 있다는 게 이 스펙트럼의 핵심 가치다.
- **공통 정책 API** — 버전 있는 JSON `ContainerRequest`로 파일시스템 정책(읽기전용/읽기쓰기/거부 경로), 네트워크 정책(프록시·아웃바운드 제어), UI 정책(클립보드·디스플레이·GUI)을 지정하고, provision→start→execute→stop→deprovision의 수명주기를 거친다. ***백엔드가 바뀌어도 애플리케이션이 쓰는 API 모양은 같다***는 것이 설계의 핵심 약속이다.
- **SDK 3종 + 독립 실행기** — Rust(`mxc-sdk`), .NET(`Microsoft.Mxc.Sdk`), Node(`@microsoft/mxc-sdk`) 패키지를 설치만으로 쓸 수 있고, 패키지가 없는 환경을 위한 `wxc-exec.exe` 같은 독립 실행기 바이너리도 같은 JSON 요청을 받는다.
- **진단 모드의 함정 — `--audit`은 보안을 끈다** — README는 `--audit` 모드가 분석 대상 워크로드의 샌드박스 보안을 ***전부*** 끄므로 신뢰할 수 없는 코드 실행에 쓰면 안 된다고 명시한다. 디버깅 도구와 보안 경계가 같은 바이너리 안에 공존할 때 흔히 생기는 "운영자가 실수로 방어선을 끄는" 위험을 README가 먼저 경고해둔 셈이다.
- **2차 소스로만 확인된 것 — 아직 완전한 보안 경계는 아니라는 평가** — 저장소 페이지 자체에는 없지만, WebSearch로 교차 확인한 복수 매체는 "SDK가 생성하는 정책이 아직 지나치게 허용적(overly permissive)"이며 "결연한 공격자를 막는 경계가 아니라, 사고를 막는 가드레일로 다루라"는 평가를 전한다. 라이선스는 1차 확인(MIT, `LICENSE.md`)했고, Build 2026 공개설·GitHub Copilot CLI 연계설은 2차 소스 재구성이라 확정하지 않는다.

## 인상 깊은 문장

> "--audit disables all sandboxing security for the analyzed workload. Do not use with untrusted code."
> (저장소 README, WebFetch로 직접 확보)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 전부 확인 불가** — `news.hada.io`가 이번 세션 내내 DNS 레벨로 전혀 열리지 않았고, WebSearch로도 해당 GeekNews 토픽을 찾지 못했다. **정직하게 밝힐 한계**: "아직 강력한 보안 경계가 아니다"라는 평가가 2차 매체에서만 나왔다는 점, 그리고 Microsoft 자신의 저장소에는 이 한계가 명시적으로 적혀 있지 않다는 점은 이 도구를 실제로 도입하려는 사람이 가장 먼저 확인해야 할 간극이다 — README가 보여주는 풍부한 정책 표면(파일시스템·네트워크·UI)이 "안전하다"는 느낌을 주지만, 2차 소스가 전하는 평가는 그 느낌과 거리가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-28-general-vm-not-enough-agent-isolation]]이 경고한 바로 그 문제의 Microsoft판 해법(이자 같은 함정)

Trail of Bits의 실험은 "범용 VM 한 대만으로는 사이버 역량을 갖춘 에이전트를 가두기 충분하지 않다"는 걸 QEMU/KVM 세 번 탈출로 보여줬고, 공격 표면을 줄인 Firecracker조차 완전한 답은 아니었다(커널 레벨 공유 표면이 남는다). MXC는 정확히 이 문제의 반대쪽에서 접근한다 — "VM이냐 프로세스 샌드박스냐"를 애플리케이션이 고정하지 않고, ***같은 API로 격리 강도를 상황에 맞게 바꿀 수 있게*** 만든 것. 하지만 2차 소스가 전하는 "아직 지나치게 허용적인 정책"이라는 평가는, 이 선택지의 폭이 넓어졌다고 해서 격리 강도 자체가 저절로 높아지는 건 아니라는 그 글의 교훈을 그대로 재확인시킨다 — ***옵션이 다양해진 것과 기본값이 안전한 것은 다른 문제***다.

### 핵심 전이 2 — [[2026-06-08-apple-container-machine]]과 "에이전트 샌드박스"라는 같은 수요, 플랫폼 지원 범위는 다른 해법

Apple Container Machine은 macOS 전용으로 "경량 Linux VM"이라는 한 가지 격리 수준만 제공하는 데 비해, MXC는 Windows·Linux·macOS 세 플랫폼에 걸쳐 프로세스 샌드박스부터 VM까지 ***여러 격리 수준을 하나의 정책 API로 노출***한다. 두 도구를 나란히 보면 "AI 에이전트 코드 실행 샌드박스"라는 수요가 특정 벤더·플랫폼에 국한되지 않고 거의 모든 주요 플랫폼에서 동시에 해법을 요구받고 있다는 것이 드러난다 — 이는 에이전트 하네스를 만드는 모든 조직이 결국 마주칠 공통 인프라 과제라는 뜻이다.

## 호스피탈리티 / CRS 적용 포인트

CRS 개발팀이 내부적으로 AI 코딩 에이전트에게 코드 실행 권한을 주는 경우(예: 자동화 테스트 생성·검증, 데이터 변환 스크립트 실행)를 점차 늘려간다면, MXC 같은 도구가 참고할 만한 설계 원칙을 준다 — ***①*** 격리 수준을 하드코딩하지 않고 정책으로 추상화해두면, 나중에 더 강한 격리(VM급)로 교체할 때 애플리케이션 코드를 다시 쓰지 않아도 된다. ***②*** 진단·감사 모드가 보안 경계를 끈다는 사실을 운영 매뉴얼에 명시해두는 것은(README의 `--audit` 경고처럼) 사소해 보이지만 실수로 방어선을 끈 채 신뢰할 수 없는 입력을 처리하는 사고를 막는 데 직접적이다. 다만 **직접 도입은 아직 멀다** — 온다는 자율 에이전트에게 실행 권한을 넘긴 사례가 없고, MXC 자체도 "아직 강력한 보안 경계는 아니다"는 평가가 있는 이른 단계의 도구이므로, 지금은 설계 원칙만 참고하고 실제 도입 결정은 이 생태계가 더 성숙한 뒤로 미루는 게 맞다.

## 연관 자료

- [[2026-08-28-general-vm-not-enough-agent-isolation]] — "VM 하나만으로는 에이전트를 가두기 충분하지 않다"는 경고, MXC의 여러 격리 백엔드가 풀어야 할 바로 그 문제
- [[2026-06-08-apple-container-machine]] — macOS 전용 경량 VM 샌드박스, 같은 "AI 에이전트 코드 실행 격리" 수요의 다른 플랫폼 해법

## 한 달 뒤 회고

*(2026-11-11 즈음 — `news.hada.io` 접근이 가능해지면 hada 댓글 논조를 확인했는지, MXC의 보안 경계 성숙도에 대한 독립적 평가(펜테스트·CVE)가 나왔는지, GitHub Copilot CLI와의 연계설이 공식적으로 확인됐는지 점검.)*
