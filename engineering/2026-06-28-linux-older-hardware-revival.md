---
title: "구형 하드웨어에서 Linux로 PC 되살리기 (fosslinux.com) — 'Windows 11 강제 업그레이드 대신 오픈소스로 전자폐기물 줄이기', SSD 교체가 가장 큰 체감 향상"
source_title: "Linux on Older Hardware: 2026 Revival Guide"
source_url: "https://www.fosslinux.com/158206/linux-on-older-hardware-revival-guide.htm"
source_name: "fosslinux.com"
referrer_url: "https://news.hada.io/topic?id=30895"
summarized_at: "2026-06-28"
category: "engineering"
tags: ["linux", "open-source", "hardware", "sustainability", "e-waste", "performance", "zram", "ssd", "ownership"]
---

# 구형 하드웨어에서 Linux로 PC 되살리기 (fosslinux.com) — 'Windows 11 강제 업그레이드 대신 오픈소스로 전자폐기물 줄이기', SSD 교체가 가장 큰 체감 향상

> 출처: [Linux on Older Hardware: 2026 Revival Guide](https://www.fosslinux.com/158206/linux-on-older-hardware-revival-guide.htm) (fosslinux.com) · 정리일 2026-06-28

## 한 줄 요약

**Windows 11이 2014~2019년 PC를 지원 종료 대상으로 만들었지만, 경량 Linux 배포판으로 일상용 머신이 될 수 있다. 배포판 선택보다 SSD 교체(부팅 45→12초)와 zram 설정이 체감 성능을 더 크게 바꾼다. 오픈소스가 하드웨어 소유권과 전자폐기물 감소를 동시에 지킨다.**

## 핵심 포인트

- **왜 중요한가** — Windows 11 TPM 2.0·보안 부팅 요구사항이 2014~2019년 PC를 강제 폐기 대상으로 만든다. 전자폐기물 관점에서 오픈소스 대안이 중요하다.
- **RAM별 배포판 선택** — 2GB 미만: antiX·Puppy Linux / 2~4GB: Lubuntu 26.04 LTS / 4GB+: Xubuntu·Linux Mint Xfce.
- **SSD 교체가 게임 체인저** — HDD 45~60초 부팅 → SSD 12~18초. 배포판 선택보다 체감 차이가 크다.
- **zram 설정** — 압축된 메모리 swap으로 디스크 I/O 절감. HDD 시스템에서 특히 효과적.
- **swappiness 조정** — HDD: 10~20, SSD: 60 권장.
- **Firefox 최적화** — uBlock Origin으로 광고 차단 시 메모리 30~50% 절감.
- **포기 기준** — 32비트 CPU+1GB 미만 RAM, SMART 오류, 90°C 이상 발열은 재활용이 현실적.

## 인상 깊은 문장

> "체감 성능은 배포판만으로 결정되지 않는다 — SSD 교체 한 번이 배포판 선택보다 체감 차이가 크다."

> "오픈소스는 하드웨어 소유권과 전자폐기물 감소를 동시에 지킨다."

## 댓글 전수 확인

**댓글 0개** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — 강제 업그레이드 압박에 대한 오픈소스 대안의 의미

Windows 11의 하드웨어 요구사항은 기술적 필요보다 비즈니스 모델에 가깝다. 오픈소스 Linux가 "하드웨어를 내 뜻대로 사용할 권리"를 지킨다. **[[2026-06-28-physical-media-ownership]]의 "소유는 통제권에서 온다"와 같은 맥락** — 소프트웨어도, 하드웨어도, 통제권이 핵심이다.

### 핵심 전이 2 — "배포판보다 SSD" = 도구보다 인프라

아무리 좋은 배포판을 골라도 HDD가 병목이면 느리다. **개발 환경에서도 같다: IDE·언어·프레임워크를 최적화하기 전에, M1/M2 Mac이나 SSD·RAM 같은 하드웨어 인프라가 더 큰 차이를 만든다.** 도구 선택에 에너지를 쓰기 전에 병목이 어디인지 먼저 파악하는 것.

### 핵심 전이 3 — "포기 기준"을 명확히 갖는 것의 가치

SMART 오류·90°C 발열 같은 명확한 포기 기준이 있으면, 살릴 수 있는 것과 없는 것을 구분하는 데 에너지를 낭비하지 않는다. **레거시 코드 리팩터링에서도 같다: "이건 리팩터링할 수 있다 vs 이건 다시 짜야 한다"의 기준을 팀이 공유하면 토론 비용이 줄어든다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-28-physical-media-ownership]] — *"통제권이 소유권의 본질" — 하드웨어·소프트웨어 모두 같은 원칙*
- [[2026-05-29-choose-boring-technology-2015]] — *"검증된 기술, 팀이 아는 기술" — Linux도 수십 년 검증된 선택*

## 한 달 뒤 회고
*(2026-07-28 즈음 — 개인 장비 중 업그레이드 또는 Linux 전환이 가능한 구형 하드웨어가 있는지 확인했는지 기록.)*
