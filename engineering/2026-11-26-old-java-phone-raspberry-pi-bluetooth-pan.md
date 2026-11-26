---
title: "오래된 Java 휴대폰을 다시 인터넷에 연결하기 (GeekNews) — Bluetooth 테더링을 거꾸로 써서 2G 셧다운을 돌아간다"
source_title: "Reconnecting an old Java phone to the internet (추정)"
source_url: "https://news.hada.io/topic?id=37861"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37861"
published_at: "확인 불가"
summarized_at: "2026-11-26"
category: "engineering"
tags: ["retro-computing", "feature-phone", "bluetooth-pan", "raspberry-pi", "2g-shutdown"]
---

# 오래된 Java 휴대폰을 다시 인터넷에 연결하기 (GeekNews)

> 출처: [Reconnecting an old Java phone to the internet (추정)](https://news.hada.io/topic?id=37861) · 정리일 2026-11-26

> **출처 한계**: 원문(news.hada.io)이 egress 차단으로 막혔다. WebSearch로 Sony Ericsson S500i나 이 구체 프로젝트를 직접 확인하지 못했다. 다만 Bluetooth PAN(BlueZ+NetworkManager 또는 구버전 `pand`)으로 휴대폰에 인터넷을 공유하는 기법 자체는 2008년 전후의 여러 Linux 가이드(K800i·K660i 등 다른 Sony Ericsson 모델 대상)로 ***일반 원리는 확인***된다 — 다만 그 가이드들은 모두 오래된(Debian Etch, pre-2008 BlueZ) 것들이라 Raspberry Pi 5의 최신 BlueZ+NetworkManager 조합과는 세부가 다를 수 있다.

## 한 줄 요약

**2G 서비스 종료로 모바일 인터넷을 쓸 수 없게 된 Sony Ericsson S500i를, "휴대폰의 인터넷을 PC에 공유하던" Bluetooth 테더링을 거꾸로 활용해 Raspberry Pi 5의 인터넷 연결을 휴대폰이 Bluetooth로 빌려 쓰게 만든 레트로 하드웨어 프로젝트다.**

## 핵심 포인트

- **테더링 방향을 거꾸로 쓴다** — 원래는 휴대폰의 모바일 인터넷을 PC가 Bluetooth로 공유받는 구조(테더링)였는데, 이 프로젝트는 ***그 방향을 반대로*** 돌려 PC(Raspberry Pi)가 접속점 역할을 하고 휴대폰이 Bluetooth로 웹을 이용한다.
- **휴대폰이 Bluetooth PAN의 클라이언트 기능(PANU)을 지원해야 함** — 이 기법이 통하려면 휴대폰이 ***Bluetooth PAN의 클라이언트 기능(PANU)***을 지원해야 한다는 전제 조건이 명시됨. WebSearch로 확인한 일반 Linux PAN 가이드도 표준 접근은 BlueZ 기반 `pand`를 NAP(네트워크 액세스 포인트) 역할로 서버에 띄우고 `bnep0` 인터페이스를 올리는 구조라는 걸 보여줘, 원리상 일치한다.
- **Raspberry Pi 5 + Arch Linux에서 BlueZ·NetworkManager로 구성** — Raspberry Pi 5에서 BlueZ와 NetworkManager로 인터넷 공유를 구성했고, Arch Linux 노트북에서도 동작을 확인했다는 서술. 별도의 Windows 연결 방법도 공개돼 있다고 언급됨.
- **2G 셧다운이라는 배경** — 2G 서비스 종료로 모바일 인터넷을 쓸 수 없게 된 피처폰을 다시 온라인에 연결한다는 배경 자체가, 전 세계적으로 진행 중인 2G/3G 통신망 폐지라는 더 큰 흐름의 부수 효과를 보여준다.

## 인상 깊은 문장

> (원문 미확정으로 1차 인용 확보 못함.)

## 댓글

GeekNews 댓글 수 미확인(원문 차단). 레트로 피처폰 해킹은 이 커뮤니티에서 꾸준히 사랑받는 토픽으로 보인다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 배치의 Rockbox 글과 "레거시 하드웨어를 살리는" 같은 축

같은 배치의 [[2026-11-26-rockbox-aliexpress-yp3-llm-port]]가 "문서 없는 저가 하드웨어에 새 펌웨어를 포팅"하는 쪽이라면, 이 글은 "플랫폼(통신사)이 서비스를 끊어버린 하드웨어를 다른 경로로 되살리는" 쪽이다 — 둘 다 ***공식 지원이 끊긴 하드웨어를 창의적 경로로 되살린다***는 레트로 컴퓨팅/하드웨어 해킹의 공통 정신을 보여준다.

### 적용점

"원래 용도의 반대 방향으로 기존 프로토콜을 쓴다"는 아이디어(테더링을 거꾸로)는, 플랫폼이 공식 지원을 끊어도 그 플랫폼이 쓰던 표준 프로토콜(Bluetooth PAN)이 살아있다면 다른 용도로 재활용할 수 있다는 일반 원칙으로 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 레트로 피처폰 연결 복구는 CRS 도메인과 접점이 없다. "공식 지원이 끊겨도 기반 프로토콜은 재활용 가능하다"는 발상만, 레거시 PMS의 통신 프로토콜이 단종돼도 표준 레이어(HTTP, Bluetooth 등)는 계속 쓸 수 있다는 느슨한 유비로만 남긴다.

## 연관 자료

- [[2026-11-26-rockbox-aliexpress-yp3-llm-port]] — 같은 배치, 레거시/저가 하드웨어를 되살리는 같은 정신의 프로젝트

## 한 달 뒤 회고

2026-12-26 즈음 — 원문이 열리면 S500i 모델과 Windows 연결 방법의 구체 내용을 보강한다.
