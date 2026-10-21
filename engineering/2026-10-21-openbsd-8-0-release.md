---
title: "OpenBSD 8.0 출시 — VMM 가상화가 64 vCPU를 지원하는 동시에, 커널 주소공간을 128배 늘려야 그래픽카드 하나를 제대로 쓸 수 있게 됐다"
source_title: "OpenBSD 8.0"
source_url: "https://www.openbsd.org/80.html"
source_name: "OpenBSD Project (WebSearch 교차확인: Phoronix, Linuxiac, BigGo Finance)"
referrer_url: "https://news.hada.io/topic?id=35692"
published_at: "2026-10-20"
summarized_at: "2026-10-21"
category: "engineering"
tags: ["openbsd", "os-release", "virtualization", "vmm", "openssh", "libressl", "post-quantum"]
---

# OpenBSD 8.0 출시

> 출처: [OpenBSD 8.0](https://www.openbsd.org/80.html) (OpenBSD Project) · GeekNews(id=35692) 경유 · 정리일 2026-10-21

> **출처 한계**: `news.hada.io`, `www.openbsd.org`, `cdn.openbsd.org`, `undeadly.org`, `www.phoronix.com`, `linuxiac.com` 모두 이 세션에서 egress 차단(`ENOTFOUND`)으로 직접 열람하지 못했다. 아래 내용은 WebSearch가 반환한 Phoronix·Linuxiac·BigGo Finance·Slashdot·LWN 기사 제목·요약을 교차확인한 것이다. **릴리스 자체(2026-10-20, 61번째 릴리스, 7.9로부터 6개월 뒤)는 복수 독립 매체가 일치해 신뢰도가 높다.** 다만 Slack 발췌의 "OpenSSH 10.6 복합 양자내성 서명 실험 지원"은 WebSearch로 교차확인하지 못했고, 대신 LibreSSL 4.4.0이 ***하이브리드 양자내성 키 교환(X25519MLKEM768)을 libtls의 선호 TLS 1.3 그룹으로 삼는다***는 사실만 확인했다 — "서명"과 "키 교환"은 양자내성 암호학에서 서로 다른 메커니즘이라, Slack 발췌의 "서명" 표현이 정확한지 원문 ANNOUNCEMENT를 직접 대조하지 못한 채로 남긴다. arm64 최대 절전 모드·Snapdragon 노트북 절전 개선, OpenSSH 10.6의 정확한 변경 내역도 WebSearch로는 독립 확인하지 못했다.

## 한 줄 요약

**OpenBSD 8.0은 VMM/VMD 가상화의 게스트 vCPU 상한을 64개로 올리는 동시에, amd64 커널의 가상 주소공간을 4GB에서 512GB로 128배 늘려 Intel Arc A-Series 같은 대용량 VRAM 그래픽카드를 처음으로 지원한다 — "더 많은 가상 CPU를 돌리는 능력"과 "그래픽카드 하나를 제대로 매핑하는 능력"이 같은 릴리스에서 동시에 해결된, 서로 무관해 보이지만 실은 둘 다 "주소 공간이 부족했다"는 같은 제약에서 나온 개선이다.**

## 핵심 포인트

- **VMM/VMD 64 vCPU** — 내장 가상화 시스템의 게스트당 vCPU 상한이 올라갔다. Slack 발췌는 "다중 프로세서 기능 추가"라고 표현하는데, 이는 게스트 OS가 여러 코어를 동시에 쓸 수 있게 하는 vCPU 스케줄링 지원을 뜻하는 것으로 보인다.
- **amd64 커널 가상 주소공간 4GB → 512GB** — ***이 확장이 있어야 4GB를 초과하는 VRAM을 가진 그래픽카드를 커널 주소공간에 매핑할 수 있다***는 것이 Slack 발췌와 WebSearch(BigGo Finance)가 공통으로 짚는 인과관계다. Intel Arc A-Series(Alchemist/DG2) 지원이 바로 이 확장 덕분에 가능해졌다.
- **inteldrm/radeondrm/amdgpu를 Linux 6.18 기준으로 포팅** — OpenBSD의 DRM 그래픽 드라이버 레이어가 Linux 커널 6.18 시점의 코드로 갱신됐다. 서로 다른 커널(BSD·Linux) 사이에서 드라이버 코드를 지속적으로 포팅해야 유지되는 구조라는 걸 보여준다.
- **LibreSSL 4.4.0 — 하이브리드 양자내성 키 교환이 기본값으로** — libtls가 TLS 1.3에서 X25519MLKEM768(고전 X25519 + 양자내성 ML-KEM768의 하이브리드)을 선호 그룹으로 삼는다. "양자내성 전환"이 이미 라이브러리 기본값 레벨에서 조용히 진행되고 있다는 사례다.
- **OpenSSH 10.6 — 보안 경화 위주** — WebSearch로 확인한 것은 ssh(1)의 LZ77 사전 압축기를 잠재적 사이드채널 유출 가능성 때문에 비활성화했다는 내용이다. Slack 발췌의 "복합 양자내성 서명 실험 지원"은 이번 세션에서 독립 확인하지 못했다.

## 인상 깊은 문장

> "OpenBSD 8.0 brings support for 64-vCPU virtual machines, Intel Arc graphics, ARM64 hibernation, and updated DRM drivers." (Linuxiac 보도, WebSearch 경유 재구성 — 원문 토씨 대조는 못함)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 유무를 이번 세션에서 확인하지 못했다. 다만 Phoronix·Linuxiac·Slashdot·BigGo Finance 등 복수의 독립 기술 매체가 같은 날(2026-10-20) 동시에 다뤘다는 것 자체가, OS 릴리스 뉴스로서는 평범한 수준의 관심을 받았다는 간접 신호다. **정직하게 짚을 점**: 이 노트의 가장 취약한 부분은 Slack 발췌의 "OpenSSH 10.6 복합 양자내성 서명"이라는 구체적 서술 하나를 1차 자료로 확인하지 못했다는 것이다 — LibreSSL 쪽 하이브리드 키 교환은 확인됐지만, "서명"이라는 별개 메커니즘까지 10.6에 들어갔는지는 미확인으로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-10-20-linux-7-3-release-scheduling-file-isolation]]과 정확히 반대의 확인 상태에 있다

Linux 7.3 노트는 "정식 출시 자체를 이번 세션에서 확인하지 못했다"는 게 가장 큰 한계였다 — 출시 목표일(10월 18일)은 지났지만 독립 1차 자료(LWN 통계 기사)가 아직 안 나와 "출시됐을 가능성이 높다"는 추정으로만 남았다. 이 노트는 정반대다 — ***릴리스 자체는 복수 독립 매체(Phoronix·Linuxiac·Slashdot·BigGo)가 같은 날짜로 일치해 신뢰도가 높고***, 대신 세부 기능 하나(OpenSSH 10.6의 "복합 양자내성 서명")가 미확인으로 남았다. 두 노트를 겹치면 "커널/OS 릴리스 뉴스를 정리할 때 확인해야 할 두 층위"가 보인다 — ①출시 여부 자체, ②출시됐다는 전제 위에서의 세부 기능 정확성. 이번 두 글이 각각 다른 층위에서 구멍이 났다는 게 흥미로운 대조다.

### 핵심 전이 2 — "구조적으로 막는다"는 fchroot/failfs의 철학이 VMM의 vCPU 격리와도 통한다

같은 Linux 7.3 노트가 짚은 ***"허용 범위 밖은 전부 실패시킨다"는 default-deny 샌드박스 철학(fchroot+failfs)***은, OpenBSD VMM이 게스트 vCPU·메모리를 호스트로부터 엄격히 격리하는 가상화 설계와 같은 축에 있다. 둘 다 "신뢰 경계를 세밀하게 허용하는" 대신 "경계 밖은 구조적으로 차단한다"는 원칙을 서로 다른 레이어(파일시스템 vs 가상화)에서 구현한 사례로 묶을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 온다가 OpenBSD를 CRS 프로덕션 OS로 쓰고 있지는 않다.** 다만 전이 가능한 원칙 둘은 남긴다. ① ***"하이브리드 양자내성 암호가 이미 TLS 라이브러리 기본값으로 조용히 들어오고 있다"***는 사실은, CRS가 쓰는 TLS 스택(nginx·클라우드 로드밸런서 등)이 언제 비슷한 기본값 전환을 할지 미리 점검해둘 근거가 된다 — 양자내성 전환이 "먼 미래의 일"이 아니라 이미 OS 레벨 기본값으로 시작됐다는 신호다. ② ***"주소공간 제약이 하드웨어 지원의 숨은 병목이었다"***는 사례는, CRS 인프라에서도 겉보기엔 무관해 보이는 설정값(메모리 매핑 한도, 커넥션 풀 크기 등)이 실은 특정 기능의 숨은 전제조건일 수 있다는 걸 되새기게 한다.

## 연관 자료

- [[2026-10-20-linux-7-3-release-scheduling-file-isolation]] — 같은 날 정리한 커널/OS 릴리스 노트, 이 글과 정확히 반대의 확인 상태(출시 자체 미확인 vs 세부 기능 미확인)
- [[2026-08-22-linux-7-2-kernel-release]] — 더 이전 커널 릴리스 노트, 같은 "역대 최다 기여자" 서사 계열

## 한 달 뒤 회고

*(2026-11-21 즈음 — OpenSSH 10.6의 "복합 양자내성 서명" 실제 변경 내역을 1차 자료(OpenSSH 릴리스 노트)로 확인했는지, arm64 최대 절전 모드·Snapdragon 노트북 개선 세부 내용을 undeadly.org 기사로 보강할 수 있는지 점검.)*
