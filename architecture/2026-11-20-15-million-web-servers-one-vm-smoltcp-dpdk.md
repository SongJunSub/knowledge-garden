---
title: "VM 한 대에서 웹 서버 1,600만 개 실행하기: smoltcp, DPDK, AF_XDP (GeekNews) — 커널 네트워크 스택은 250만 개에서 메모리가 터진다"
source_title: "15 million web servers on one VM - smoltcp, DPDK, AF_XDP"
source_url: "https://kapteko.com/15-million-webservers/"
source_name: "kapteko.com (GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=37470"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "architecture"
tags: ["smoltcp", "dpdk", "af_xdp", "userspace-networking", "ebpf"]
---

# VM 한 대에서 웹 서버 1,600만 개 실행하기: smoltcp, DPDK, AF_XDP (GeekNews)

> 출처: [15 million web servers on one VM - smoltcp, DPDK, AF_XDP](https://kapteko.com/15-million-webservers/) (kapteko.com) · [GeekNews](https://news.hada.io/topic?id=37470) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`와 `kapteko.com` 모두 이 세션에서 egress 차단됐다. Hacker News·Lobsters 등 다수 다이제스트에 광범위 인용돼 핵심 수치는 2차 소스로 교차확인했다. 제목의 "1,500만"은 목표치이고, 실제 달성치는 ***1,600만***이다 — Slack 발췌 제목과 다른 부분이라 명시한다.

## 한 줄 요약

**RAM 10GB·CPU 1코어 VM에서 요청마다 `OK`를 반환하는 웹 서버를 1,500만 개 목표로 시도해 실제로는 1,600만 개까지 달성했는데, 커널 네트워크 스택은 약 250만 개에서 메모리를 소진해 smoltcp 기반 유저스페이스 스택과 DPDK/AF_XDP 패킷 I/O로 전환해야 했다.**

## 핵심 포인트

- 목표는 RAM 10GB·CPU 1코어 VM에서 요청마다 `OK`를 반환하는 웹 서버 1,500만 개 실행. ***실제 도달치는 1,600만 개***로 목표를 초과했다.
- 1차 장벽은 포트 부족(28,232개뿐)이었고, ***AnyIP***로 서브넷 전체를 수신 대상으로 삼아 주소 부족을 해결했다(Slack 발췌와 일치).
- 커널 네트워크 스택 경로는 ***약 250만 서버에서 메모리를 소진***하고 이후 RPS가 급락했다 — Linux 소켓이 활동 여부와 무관하게 약 3,300바이트를 할당하기 때문이다.
- **smoltcp**(베어메탈/실시간용 무힙 TCP/IP 스택)로 전환해 유저스페이스에서 직접 처리, 유휴 서버당 약 620바이트, 활성 서버당 약 1KB까지 메모리 사용량을 압축했다.
- 패킷 I/O 비교에서 ***DPDK가 가장 빠르고 AF_XDP가 근소하게 뒤따랐다*** — eBPF/XDP 훅에서 패킷별로 유저스페이스 메모리로 바로 리다이렉트할지를 결정하는 구조다.

## 인상 깊은 문장

> "the kernel network stack uses up all the RAM at around 2.5M web servers."

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: 원문을 직접 읽지 못해 수치는 전부 2차 소스 교차검증이고, 제목의 "1,500만"이 목표치일 뿐 실제로는 1,600만이라는 점이 Slack 발췌와 다르다.

## 내 생각 · 적용점

### 핵심 전이 — "무거운 공용 자원을 가벼운 전용 경로로 우회"하는 레포의 반복 원칙

[[2026-08-26-cilium-ebpf-under-the-hood]]가 다룬 eBPF/XDP의 커널 네트워크 스택 우회 원리가 이 글에서 극단적인 멀티테넌시 실험으로 재등장한다 — 둘 다 "커널 범용 경로는 특정 규모에서 병목이 되고, 전용 유저스페이스 경로로 우회하면 그 병목을 없앨 수 있다"는 같은 원칙이다.

### 적용점

소켓당 고정 메모리 오버헤드가 "활동 여부와 무관하게" 할당된다는 지적은, 대량의 유휴 연결(keep-alive, 웹소켓 등)을 유지하는 어떤 시스템에도 적용 가능한 용량 계획 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**멀다.** 극단적 멀티테넌시 실험이라 CRS 업무에 직접 연결하기엔 억지스럽다. "무거운 공용 자원(커널 소켓)을 가벼운 전용 경로(유저스페이스)로 우회한다"는 원칙 수준만 참고할 수 있다.

## 연관 자료

- [[2026-08-26-cilium-ebpf-under-the-hood]] — 같은 eBPF/커널 네트워크 스택 우회 계열
- [[2026-10-24-docker-is-weird-container-runtime-internals]] — 약한 연결, 런타임 내부 구조 관심

## 한 달 뒤 회고

2026-12-20 즈음 — kapteko.com 접속이 가능해져 원문 전체(코드·벤치마크 상세)를 확인했는지 점검.
