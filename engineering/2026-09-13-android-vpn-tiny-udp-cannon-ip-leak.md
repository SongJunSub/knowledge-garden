---
title: "Android, VPN 차단 설정을 켜도 실제 IP가 노출되는 문제 발견 (Tiny UDP Cannon) — 뚫린 건 VPN 앱이 아니라 '연결 유지 신호'를 대신 쏘는 네트워크 하드웨어다"
source_title: "Another way to leak traffic on Android has been discovered"
source_url: "https://mullvad.net/en/blog/2026/9/10/another-way-to-leak-traffic-on-android-has-been-discovered"
source_name: "Mullvad VPN Blog"
referrer_url: "https://news.hada.io/topic?id=33591"
published_at: "2026-09-10"
summarized_at: "2026-09-13"
category: "engineering"
tags: ["android", "vpn", "network-security", "ip-leak", "privacy", "vulnerability-disclosure"]
---

# Android, VPN 차단 설정을 켜도 실제 IP가 노출되는 문제 발견 (Tiny UDP Cannon)

> 출처: [Another way to leak traffic on Android has been discovered](https://mullvad.net/en/blog/2026/9/10/another-way-to-leak-traffic-on-android-has-been-discovered) (Mullvad VPN Blog) · 정리일 2026-09-13
> **출처 한계**: `news.hada.io`(hada 전면 차단)뿐 아니라 이번 세션에서는 1차 출처인 `mullvad.net`, 취약점을 처음 명명·분석한 연구자 블로그 `lowlevel.fun`, 후속 보도 `cyberinsider.com`까지 전부 egress 차단으로 직접 열람하지 못했다. 아래 내용은 WebSearch가 반환한 다수 매체(CyberInsider, TechRadar, Android Authority, cybersecuritynews.com 등)의 스니펫을 교차 대조해 재구성한 것이며, **문장 단위 직접 인용은 없다** — 전부 매체를 통한 재인용임을 명시한다. 또한 Google과 GrapheneOS의 정확한 대응 타임라인은 매체마다 서술이 조금씩 달라(하나는 "GrapheneOS가 대응 작업 중", 다른 하나는 "GrapheneOS가 이미 패치 완료") 1차 소스 대조 없이는 어느 쪽이 최신 상태인지 확정할 수 없다.

## 한 줄 요약

**Android에서 "VPN 없는 연결 차단(Block connections without VPN)"과 "상시 VPN(Always-on VPN)"을 동시에 켜도, 특별한 권한이 필요 없는 일반 앱이 기기의 실제 IP 주소를 외부로 새어나가게 할 수 있다.** 원인은 NAT 통과(NAT-T)용 연결 유지(keep-alive) UDP 패킷을 Wi-Fi·셀룰러 네트워크 하드웨어 칩에 위임(오프로드)하는 Android의 기능이다 — 이 위임된 패킷은 커널의 일반 소켓 경로를 거치지 않고 하드웨어가 직접 내보내기 때문에, VPN 라우팅 규칙이 적용되는 검사 지점을 그냥 건너뛴다. 연구자가 이를 "Tiny UDP Cannon"이라 명명했고, Android 보안팀에 신고했으나 "Won't Fix"로 분류됐다.

## 핵심 포인트

- **우회 메커니즘** — 앱이 NAT 통과용 연결 유지 UDP 연결을 등록해두면, 이 연결의 실제 패킷 전송은 ***Wi-Fi·셀룰러 네트워크 하드웨어가 직접 수행***한다. 앱의 일반 소켓 통신에는 VPN 검사가 적용되지만, 하드웨어가 대신 쏘는 이 패킷은 그 검사 경로 바깥에 있다.
- **대상 포트** — IPsec NAT-T 표준 포트인 ***UDP 4500번***으로 임의의 외부 서버에 패킷을 보낼 수 있다.
- **필요 권한 없음** — 루팅·특수 권한 불필요. 거의 모든 앱이 기본으로 갖는 인터넷 액세스 권한만 있으면 된다 — 사용자가 "이 앱이 뭘 할 수 있는지" 검토할 여지 자체가 없다는 뜻이다.
- **두 개의 방어선을 동시에 우회** — "Always-on VPN"과 "Block connections without VPN"을 함께 켠, Android에서 VPN 강제 적용의 가장 강한 조합에서도 뚫린다.
- **실제 유출 확인 환경은 Wi-Fi** — 연구에서 패킷 유출을 실측 확인한 것은 Wi-Fi 연결 기준이며, 셀룰러에서도 구조적으로 가능하다는 서술은 있으나 동일한 수준의 실측 확인 여부는 이번 조사로 확정하지 못했다.
- **유출 범위는 제한적이지만 치명적** — 앱의 통신 내용 전체(본문·페이로드)를 빼내는 공격이 아니다. ***새어나가는 건 기기의 실제 IP 주소뿐***이다. 하지만 VPN을 쓰는 이유가 바로 그 IP를 숨기는 것이므로, 노출된 IP와 반복 전송되는 타이밍 정보가 결합되면 위치 추적·신원 추론의 단서로 쓰일 수 있다.
- **Google 대응** — 연구자가 Android 취약점 신고(VRP)로 제출했으나 ***"Won't Fix(Infeasible)"로 분류***돼 별도 보안 공지 없이 종료된 것으로 보도됨(1차 소스 미대조).
- **GrapheneOS 대응** — 매체마다 "대응 작업 중"과 "이미 기능 비활성화로 패치 완료"라는 서로 다른 시점의 서술이 혼재한다. 방향성(문제가 되는 하드웨어 오프로드 기능 자체를 끈다) 자체는 일치하지만 정확한 완료 시점은 이번 조사로 확정 못함.
- **근본 해결에는 Android 시스템 차원 수정 필요** — VPN 앱이나 개별 앱 쪽에서 막을 수 있는 문제가 아니다. `ConnectivityManager`/네트워크 스택이 하드웨어 오프로드 경로에도 활성 VPN 정책을 검사하도록 바꿔야 한다 — 즉 해결 권한이 Google에게만 있는데, 그 Google이 "고칠 필요 없다"고 판단했다는 게 이 사건의 핵심 갈등이다.
- **처음이 아니다** — 2026년 5월에도 구조가 다르지만 같은 계열인 VPN 우회(시스템 프로세스 `system_server`가 앱을 대신해 권한 있는 경로로 패킷을 전송하는 방식, `registerQuicConnectionClosePayload` 관련)가 보고됐고 그것도 Google이 Won't Fix로 처리했다. Android의 "일반 앱 소켓과 시스템/하드웨어가 직접 처리하는 경로는 별도"라는 아키텍처 자체가 반복적으로 VPN 우회 통로를 만들어내는 패턴으로 읽힌다.

## 인상 깊은 문장

> (WebSearch로 교차 확인된 매체 재구성, 원문 직접 대조 아님) "Since these keep-alive UDP packets are sent directly from the network hardware, they bypass the check that all traffic must go through the VPN connection when 'Block all connections without VPN' is enabled, thus exposing the device's real IP address."
> (연결 유지 UDP 패킷이 네트워크 하드웨어에서 직접 전송되기 때문에, VPN 검사 지점 자체를 물리적으로 거치지 않는다는 게 이 취약점의 본질을 정확히 짚는다.)

## 댓글

**hada(id=33591) 댓글 수 확인 불가**(전면 차단). 이번 9월 발견(Tiny UDP Cannon)을 다룬 전용 HN 스레드는 이번 조사에서 특정하지 못했다 — 대신 Privacy Guides 디스코스, Lemmy 커뮤니티(communick.news, lemmy.world 등) 쪽에서 논의가 확인된다. 다만 2026년 5월의 유사·별개 취약점(`registerQuicConnectionClosePayload` 관련)에는 HN 스레드가 따로 있었다(`item?id=47973882`, `item?id=48075144`) — 이번 건과 혼동하지 않도록 구분해둔다. **이해관계 고지**: 1차 소스인 Mullvad는 VPN 벤더이므로 "Android 기본 VPN 강제 기능이 뚫린다"는 발견을 알리는 게 자사 제품(전용 VPN 클라이언트) 우수성 서사에 유리할 수 있다. 다만 GrapheneOS·여러 독립 보안 매체가 같은 결함을 별도로 확인·보도했다는 점에서, 벤더 이해관계만으로 결함 자체의 실재를 의심할 근거는 약하다. "Google이 Won't Fix로 처리했다"는 서술도 Google 자신의 공식 성명이 아니라 연구자·Mullvad 쪽 주장을 매체가 재인용한 것임을 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 "데이터 평면이 제어 평면을 건너뛴다" 패턴이 가든에 거울상으로 이미 있다

[[2026-08-27-tailcat-tailscale-without-account]]에서 정리한 Tailcat은 Tailscale의 데이터 평면(WireGuard 암호화·NAT 통과)만 떼어내 제어 평면(계정·정책) 없이 동작하도록 **의도적으로 설계**한 도구였다. 이번 Android 취약점은 정반대 방향에서 똑같은 구조를 보여준다 — VPN이라는 "정책(제어) 계층"이 있는데, 네트워크 하드웨어가 처리하는 연결 유지 패킷이라는 "데이터 평면"이 그 정책 검사를 그냥 건너뛴다. 하나는 통제 가능성을 스스로 포기한 도구(Tailcat, 단기 접근용으로 정직하게 포지셔닝)이고 다른 하나는 통제가 있어야 한다고 사용자가 믿고 있는데 실제로는 없는 결함(Android VPN)이다. **"데이터 평면과 제어 평면이 분리된 아키텍처는 편의를 낳지만, 그 분리 지점이 곧 검사가 새는 지점이 된다"**는 원칙이 두 사례에서 반대 방향으로 확인된다.

### 핵심 전이 2 — IP는 "신원"이 아니라 "신호"라는 원칙이, 이번엔 반대 방향에서 다시 확인된다

[[2026-09-05-strike3-meta-ip-identification-reliability]]에서는 "IP 주소는 사람이 아니라 회선을 가리키는 확률적 추정치"라는 걸 소송 사례로 확인했다. 이번 사건은 그 원칙의 거울상이다 — 거기서는 *공개된 IP*가 얼마나 약한 신원 증거인지가 논점이었지만, 여기서는 애초에 *숨겨야 할 IP가 새어나가는 경로*가 문제다. 두 노트를 겹치면 "IP는 약한 신호지만, 그 신호조차 감추려는 사람에게는 노출 자체가 위험이다"라는 게 더 분명해진다 — 신원 확정에는 약한 증거일지언정, 위치·행동 패턴 추적에는 충분한 신호이기 때문이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 VPN 벤더도 모바일 OS 개발사도 아니고, 이 결함은 Android 플랫폼 자체의 문제라 CRS 쪽에서 고칠 수 있는 계층이 아니다. 다만 전이 가능한 원칙 하나는 남긴다: **"보안 정책이 특정 계층(앱 소켓)에만 적용되고, 그 아래·옆의 다른 경로(하드웨어 오프로드, 시스템 프로세스)는 검사 대상에서 빠져 있는 구조"는 VPN에만 있는 문제가 아니다.** CRS/PMS의 사내망 접근 통제·방화벽 규칙을 설계할 때도 "이 규칙이 애플리케이션 레벨 트래픽만 커버하는가, 아니면 정말 모든 물리적 출구 경로를 커버하는가"를 별도로 점검할 필요가 있다 — 이번 사건처럼 "규칙은 켜져 있지만 특정 경로만 빠져나간다"는 것이 실무에서 가장 발견하기 어려운 종류의 결함이기 때문이다.

## 연관 자료

- [[2026-08-27-tailcat-tailscale-without-account]] — "데이터 평면이 제어 평면의 정책 검사를 건너뛴다"는 같은 구조를, 한쪽은 의도된 설계(Tailcat)로 다른 한쪽은 결함(이 글)으로 보여주는 거울상
- [[2026-09-05-strike3-meta-ip-identification-reliability]] — "IP는 신원이 아니라 신호"라는 원칙을 공개된 IP의 약한 증거력 쪽에서 다룬 노트, 이 글은 그 신호가 새어나가는 경로 쪽을 다룸

## 한 달 뒤 회고

*(2026-10-13 즈음 — ①Google이 이 결함을 결국 보안 패치로 반영했는지, 아니면 Won't Fix가 유지됐는지. ②GrapheneOS의 실제 대응 시점·버전이 무엇이었는지 1차 소스로 재확인. ③이번 발견이 뒤늦게 HN·Lobsters에 별도 스레드로 올라와 논의가 이어졌는지. ④CRS 사내망 방화벽 규칙에 "물리적 출구 경로까지 커버하는가" 점검 항목을 실제로 넣었는지.)*
