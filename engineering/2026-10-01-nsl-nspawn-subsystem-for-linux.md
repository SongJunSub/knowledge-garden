---
title: "nsl, Linux용 WSL (frostyard) — 원자적(불변) 호스트는 읽기전용으로 지키고, 개발 도구는 공유 VM 속 컨테이너에 둔다"
source_title: "nsl: NSpawn Subsystem for Linux"
source_url: "https://github.com/frostyard/nsl"
source_name: "GitHub (frostyard)"
referrer_url: "https://news.hada.io/topic?id=34557"
published_at: "확인 불가 (v0.7.0, 2026-09-30 기준 최신 릴리스)"
summarized_at: "2026-10-01"
category: "engineering"
tags: ["dev-environment", "systemd-nspawn", "wsl", "atomic-host", "container", "linux", "sandbox"]
---

# nsl, Linux용 WSL (frostyard) — 원자적(불변) 호스트는 읽기전용으로 지키고, 개발 도구는 공유 VM 속 컨테이너에 둔다

> 출처: [nsl: NSpawn Subsystem for Linux](https://github.com/frostyard/nsl) (GitHub, frostyard) · 정리일 2026-10-01

## 한 줄 요약

**nsl(NSpawn Subsystem for Linux)은 개발 도구와 의존성을 호스트 OS 대신 분리된 Linux 머신에 설치해, 원자적(불변) Linux 호스트를 깨끗하게 유지하면서 WSL과 거의 같은 사용 경험을 제공하는 도구다 — 각 머신은 공유 VM 안의 systemd-nspawn 컨테이너로 돌아가며, `--isolated` 플래그로 신뢰하지 않는 소프트웨어는 완전히 별도 VM에 떼어놓을 수 있다.**

## 핵심 포인트

- **원자적 호스트를 위한 WSL** — nsl은 "원자적(불변) Linux 호스트를 위한 WSL 스타일 Linux 머신"이다. 호스트 시스템을 읽기전용·교체가능하게 유지하면서, 실제 개발 작업은 분리된 환경에서 한다.
- **공유 VM 속 nspawn 컨테이너** — systemd-nspawn 컨테이너들이 하나의 소규모 공유 VM(***systemd-vmspawn + QEMU/KVM***) 안에서 실행된다. 필요할 때 시작되고, 패키지·서비스·파일이 세션 사이에도 유지된다(WSL과 동일한 지속성 모델). VM의 루트는 교체 가능하고 사용자 상태를 보유하지 않으며, 머신들은 별도 데이터 디스크에 존재한다.
- **호스트 통합** — 호스트의 프로젝트 파일을 같은 사용자 계정으로 공유하고, 머신 내 서버는 호스트 127.0.0.1의 동일 포트에서 자동으로 접근 가능하다. Wayland 애플리케이션은 ***Waypipe***로 호스트 데스크톱에 창을 띄우고, VS Code 같은 SSH 클라이언트를 위한 머신별 ssh 별칭도 제공한다.
- **2단계 신뢰 모델** — 기본 머신은 "사용자로 신뢰"되어 홈 디렉토리·토큰에 접근 가능하지만 호스트 루트나 호스트 소켓에는 닿을 수 없다. ***신뢰하지 않는 소프트웨어는 `--isolated` 플래그로 완전히 별도 VM에 배치해 호스트 파일·데스크톱·작업에 접근할 수 없게 만든다.***
- **지원 범위와 개발 상태** — Debian 13, Ubuntu 26.04 LTS, Fedora 44, CentOS Stream 10, Arch, openSUSE Tumbleweed/Leap을 매주 재빌드·서명된 이미지로 지원한다. v0.4.0이 "현재 설계의 첫 릴리스"이고 그 이전 v0.3.0까지는 폐기된 프로토타입이었다고 스스로 명시한다 — 아직 실험적(pre-release) 소프트웨어다. MIT 라이선스.

## 인상 깊은 문장

> "nsl manages persistent Linux development VMs with terminal, project-file, localhost and Wayland integration."

> "`--isolated` places the machine in its own VM, with no access to host files, desktop, or host work." (GitHub README 재구성)

## 댓글

GitHub 저장소(`frostyard/nsl`)는 직접 열람해 README와 "how it works" 설명으로 기능을 교차확인했고, 이 부분은 신뢰도가 높다. 다만 Show HN 토론(`news.ycombinator.com/item?id=49894351`)이 존재하는 것은 WebSearch로 확인했으나, 이번 세션은 `news.hada.io`뿐 아니라 `news.ycombinator.com`, `frostyard.github.io`도 egress 차단되어 ***실제 포인트·댓글 수·커뮤니티 반응은 확인 불가(사이트 차단)***다. 프로젝트가 실제로 많이 쓰이는지, 안정성이 어느 수준인지는 저자 스스로 "실험적"이라 밝힌 것 외에는 판단할 근거가 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "호스트를 깨끗하게 유지" 패턴의 재등장

[[2026-06-08-apple-container-machine]]이 macOS에서 "경량 영속 Linux VM + 홈 디렉토리 자동 마운트"로 거의 동일한 패턴을 WWDC26에서 공개했다. nsl은 같은 패턴을 리눅스 원자적(불변) 호스트에 적용한 것이다 — 플랫폼이 macOS든 불변 Linux든, **"개발 도구는 호스트를 더럽히지 않는 격리된 곳에 두고, 통합은 매끄럽게"**라는 설계 원칙이 독립적으로 반복해서 등장한다.

### 핵심 전이 2 — 신뢰 경계를 구조로 명시했지만, 그 경계도 결국 하이퍼바이저다

"기본 신뢰"와 "`--isolated` 완전 격리"를 플래그 하나로 나눈 설계는 명확하다. 다만 [[2026-08-28-general-vm-not-enough-agent-isolation]]이 지적한 "범용 VM 한 대만으로는 사이버 역량을 갖춘 최신 AI 에이전트를 가두기에 충분하지 않다"(GPT 5.6-Cyber가 12시간 자율 작업으로 QEMU/KVM을 세 번 탈출)는 경고와 함께 읽을 거리가 있다. nsl의 isolated 모드도 결국 ***같은 QEMU/KVM 하이퍼바이저 경계***에 의존하므로, "신뢰 못 하는 소프트웨어"가 AI 에이전트 수준으로 공격적이라면 이 경계도 뚫릴 수 있다는 걸 염두에 둬야 한다.

### 핵심 전이 3 — 실험적 소프트웨어임을 숨기지 않는 태도

v0.3 이전을 "폐기된 프로토타입"이라 스스로 못박은 건 정직한 버전 관리 태도다. [[2026-07-14-on-data-quality-basics]]가 짚은 "완벽을 좇다 아무도 안 쓰는 걸 만드는" 실패 모드의 반대편에서, 아직 다듬어지지 않은 도구임을 공개하고 반복 릴리스로 좁혀가는 접근이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 개발자 로컬 환경 도구를 자체 개발하지 않는다. 다만 "운영 환경을 건드리지 않는 격리된 개발/테스트 환경"이라는 원칙 자체는, 신규 입사자 온보딩용 표준 개발 환경(데브컨테이너·VM 이미지)을 사내에서 표준화할 때 참고 수준으로 전이 가능하다.

## 연관 자료
- [[2026-06-08-apple-container-machine]] — *거의 동일한 패턴(영속 Linux VM + 호스트 통합)의 다른 플랫폼 구현*
- [[2026-08-28-general-vm-not-enough-agent-isolation]] — *isolated 모드가 의존하는 QEMU/KVM 경계 자체가 뚫릴 수 있다는 반증*

## 한 달 뒤 회고
*(2026-11-01 즈음 — nsl이 v0.7.0 이후에도 계속 활발히 유지되는지, Show HN 반응을 추가로 확인했는지, 사내 표준 개발 환경 논의에 참고할 여지가 있었는지 기록.)*
