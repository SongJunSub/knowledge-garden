---
title: "ESP32-S31 (Espressif) — MMU를 갖춘 마이크로컨트롤러가 진짜 Linux 커널을 실행하며 라즈베리파이 영역을 잠식한다"
source_title: "The newest ESP32 can actually run Linux, and it's getting uncomfortably close to a Raspberry Pi"
source_url: "https://www.xda-developers.com/newest-esp32-run-linux-close-to-raspberry-pi/"
source_name: "XDA Developers, CNX Software·Hackaday·Espressif 공식 발표 WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=34234"
published_at: "2026-09-23(추정, XDA 기사·HN 스레드 게재 시점 기준)"
summarized_at: "2026-09-25"
category: "engineering"
tags: ["esp32", "embedded", "linux", "risc-v", "mmu", "microcontroller", "espressif", "hardware"]
---

# ESP32-S31 (Espressif) — MMU를 갖춘 마이크로컨트롤러가 진짜 Linux를 실행한다

> 출처: [The newest ESP32 can actually run Linux, and it's getting uncomfortably close to a Raspberry Pi](https://www.xda-developers.com/newest-esp32-run-linux-close-to-raspberry-pi/) (XDA Developers) · GeekNews(id=34234) 경유 · 정리일 2026-09-25

## 한 줄 요약

**Espressif의 신형 ESP32-S31은 320MHz 듀얼코어 RISC-V에 Sv32 페이징을 지원하는 진짜 MMU를 얹어, 기존 ESP32류가 외부 메모리를 붙여 베어메탈 수준으로 흉내내던 것과 달리 가상 메모리·프로세스 격리를 갖춘 정식 Linux 커널을 슈퍼바이저 모드에서 실행한다. 기가비트 이더넷, USB 2.0 호스트, SD카드 2슬롯, 카메라·디스플레이 인터페이스까지 갖춰 화면·키보드·유선 네트워크를 연결한 소형 리눅스 컴퓨터로 쓸 수 있는 범위에 들어왔다.**

## 핵심 포인트

- **MMU가 핵심 차별점** — Sv32 페이징과 Machine/Supervisor/User 3단계 권한 모드를 지원해, 기존 ESP32류가 "베어메탈 해킹"으로 흉내내던 것과 달리 ***진짜 가상 메모리와 프로세스 격리를 갖춘 표준 리눅스 커널을 슈퍼바이저 모드에서 그대로 실행***할 수 있다.
- **주변장치 스펙이 소형 PC급** — 기가비트 이더넷 MAC, USB 2.0 High-Speed 호스트(풀사이즈 Type-A, OTG 모드 500mA 공급), SD카드 2슬롯, 8~16비트 DVP 카메라 인터페이스, 최대 24비트 RGB 병렬 LCD 컨트롤러를 갖췄다. USB HID·evdev를 지원해 키보드·마우스가 리눅스의 `/dev/input` 아래 그대로 인식된다.
- **Espressif가 공식 Linux BSP를 공개** — Buildroot·U-Boot 기반 Linux BSP 개발자 프리뷰를 공개(2026-08-22, CNX Software로 확인)했고, 커뮤니티 포팅에서는 이미 Linux 6.18·7.1 커널이 드라이버·디스플레이 출력·콘솔 접근까지 정상 동작하는 것으로 확인된다.
- **연산·메모리 스펙** — 듀얼 32비트 RISC-V @ 320MHz(코어당 부동소수점 유닛, 한쪽엔 128비트 SIMD), 6.86 CoreMark/MHz, GPIO 60개. SRAM 512KB, 250MHz 8비트 DDR PSRAM 최대 64MB, 플래시 최대 256MB.
- **프리뷰를 넘어 실구매 가능 단계** — 개발자 프리뷰 발표에 이어 저가 개발보드가 이미 판매되기 시작한 것으로 WebSearch 확인된다(XDA Developers 별도 기사) — 실험 단계를 넘어 실제로 구매해 시도해볼 수 있는 단계다.

## 인상 깊은 문장

> "enabling actual Linux kernels to run in supervisor mode rather than bare-metal hacks."
> (WebSearch 발췌, Hackaday·CNX Software 계열 설명)

> "getting uncomfortably close to a Raspberry Pi."
> (XDA Developers 기사 제목)

## 댓글

**확인 불가.** `news.hada.io`가 이 세션에서 egress 차단돼 hada 댓글 수를 직접 확인하지 못했다. Hackaday·CNX Software·XDA Developers·Espressif 공식 페이지·Adafruit 블로그 등 다수 매체를 WebSearch로 교차확인해 핵심 포인트를 재구성했다. Hacker News에도 같은 제목("The newest ESP32 can run Linux and it's getting close to a Raspberry Pi")의 별도 스레드가 있는 것으로 확인되지만, `news.ycombinator.com`도 이 세션에서 접근이 차단돼 점수·댓글 수·구체 반응은 확인하지 못했다. **기업 공식 발표(Espressif)와 커뮤니티 포팅 성과가 섞여 있다는 점도 감안해야 한다** — "Linux 6.18/7.1이 동작한다"는 것이 모든 주변장치를 포함한 안정적 지원을 뜻하는지, 아니면 부분 동작 수준인지는 커뮤니티 포팅 저장소를 직접 확인하기 전까지는 초기 개발자 프리뷰로 보수적으로 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-14-jetkvm-mini]]가 실물로 보여준 패턴의 다음 단계

그 노트에서 JetKVM Mini는 ***"Linux SoC를 걷어내고 ESP32-P4X 하나로 영상 캡처·USB 제어·펌웨어를 전부 처리"***해 $69짜리 오픈소스 IP-KVM을 $39로 줄였다. 그 설계는 "별도 Linux SoC를 없애고 마이크로컨트롤러로 대체"하는 방향이었다. ESP32-S31은 그 반대 방향으로 한 걸음 더 나아간다 — ***마이크로컨트롤러 자체가 Linux SoC가 되는*** 단계다. 별도 애플리케이션 프로세서 없이 이 칩 하나로 "화면·네트워크·USB를 갖춘 임베디드 리눅스 제품"을 설계할 수 있는 범위가 넓어진다는 뜻이고, JetKVM Mini류 제품이 다음 세대에는 굳이 두 칩을 나누지 않아도 될 수 있다는 시사점을 준다.

### 핵심 전이 2 — [[2026-06-28-linux-older-hardware-revival]]과는 반대 방향에서 만나는 "Linux 하드웨어 하한선 확장"

그 글은 이미 존재하는 구형 PC에 경량 배포판을 얹어 수명을 늘리는, ***"위에서 아래로"*** 내려오는 접근이었다. ESP32-S31은 반대로 애초에 몇 달러짜리 마이크로컨트롤러에 표준 Linux를 새로 얹을 수 있게 된, ***"아래에서 위로"*** 올라가는 확장이다. 두 글을 나란히 놓으면 "Linux가 실행되는 하드웨어의 하한선" 자체가 양방향에서 동시에 넓어지고 있다는 그림이 된다 — 한쪽은 버려질 뻔한 하드웨어를 살리고, 다른 한쪽은 원래 리눅스를 상상하지 않던 영역까지 리눅스를 끌고 들어간다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다는 하드웨어 제품을 만들지 않는다. 다만 파트너 호텔의 객실 IoT(스마트 도어락, 온습도 센서, 미니 키오스크, 객실 컨트롤 패널) 연동을 고려할 때, 이런 저가·고성능 MMU 탑재 마이크로컨트롤러가 표준 Linux 네트워킹 스택·SSH·표준 드라이버를 그대로 쓸 수 있게 되면 그 기기와의 연동 난이도 자체가 낮아질 여지가 있다는 정도의 방향성만 참고로 남긴다. 실제 도입 판단을 위해서는 Espressif의 Linux BSP가 개발자 프리뷰 단계를 벗어나 안정화됐는지, 파트너사가 실제로 이 칩 기반 기기를 채택할지 별도 확인이 필요하다.

## 연관 자료

- [[2026-09-14-jetkvm-mini]] — ESP32-P4X가 이미 Linux SoC 역할을 대체한 제품화 선례, ESP32-S31은 그 다음 단계
- [[2026-06-28-linux-older-hardware-revival]] — Linux가 실행되는 하드웨어 하한선을 반대 방향(구형 PC 되살리기)에서 넓히는 사례

## 한 달 뒤 회고

*(2026-10-25 즈음 — Espressif Linux BSP가 프리뷰를 벗어나 정식 지원됐는지, 실제 구매 가능한 개발보드로 커뮤니티 리뷰가 쌓였는지, 파트너 호텔 IoT 연동에 이런 칩을 검토할 실제 필요가 생겼는지 점검.)*
