---
title: "Linux 7.2 정식 출시 (Linus Torvalds / 커널 릴리스) — 캐시 인지 스케줄링·Btrfs large-folio 기본화, 그리고 AI/LLM발 패치·리포트 폭증이 만든 역대 두 번째로 바쁜 사이클"
source_title: "Linux 7.2 Released With Faster I/O, New AMD & Intel Driver Improvements"
source_url: "https://www.phoronix.com/news/Linux-7.2-Released"
source_name: "Phoronix (Michael Larabel) 등 커널 릴리스 보도 다수"
referrer_url: "https://news.hada.io/topic?id=32734"
published_at: "2026-08-16"
summarized_at: "2026-08-22"
category: "backend"
tags: ["linux-kernel", "os-internals", "scheduler", "performance", "btrfs", "swap", "release-notes"]
---

# Linux 7.2 정식 출시 — 캐시 인지 스케줄링과 AI/LLM발 패치 폭증이 만든 역대 두 번째로 바쁜 사이클

> 출처: [Linux 7.2 Released With Faster I/O, New AMD & Intel Driver Improvements](https://www.phoronix.com/news/Linux-7.2-Released) (Phoronix 등 다수 매체 교차확인) · 정리일 2026-08-22

## 한 줄 요약

**Linus Torvalds가 2026-08-16, RC7까지 약 2개월 개발 끝에 Linux 7.2를 정시 출시했다. 1년 넘게 준비된 ***"캐시 인지(cache-aware) CPU 스케줄링"***이 드디어 실전 반영됐고, swap 서브시스템 통합이 계속 진행됐으며, Btrfs가 large-folio를 기본 활성화하면서 direct I/O 쓰기 처리량이 크게 개선됐다. 배경 서사로는 ***AI/LLM 사용 증가로 패치·버그 리포트 처리량(churn)이 늘어 6.7 이후 역대 두 번째로 바쁜 개발 사이클***이었다는 점이 여러 매체에서 공통으로 언급됐다.**

## 핵심 포인트

- **일정** — 2026-08-16 릴리스, RC7까지, 개발 기간 약 2개월. kernel.org 최신 mainline.
- **캐시 인지 스케줄링(Cache-Aware Load Balancing)** — 1년 이상 개발된 기능으로, 서로 자원을 공유하는 태스크를 가능한 한 같은 LLC(Last Level Cache) 도메인의 코어에 묶어 불필요한 캐시 마이그레이션을 줄인다.
- **swap 서브시스템 재작업 지속** — 익명(anonymous)·공유메모리 folio 처리를 계속 통합하면서 정적 메타데이터 오버헤드를 거의 0에 근접시킴.
- **Btrfs large folios 기본 활성화** — 6.17부터 실험적이던 기능이 기본값이 됨. direct I/O 직렬화 제거로 ***쓰기 처리량 +59%***, writeback 요청 크기 캡으로 순차 쓰기 +15% 개선.
- **BPF 개선** — 해시맵 크기 조정(resizable) 지원, 함수 인자 5개 제한을 스택 경유로 우회 허용, 동일 BPF 프로그램을 여러 트레이스포인트에 효율적으로 부착 가능.
- **그 외 하이라이트** — AMDGPU HDMI 2.1 FRL 초기 지원, Apple M3 초기 지원, S/390(IBM 메인프레임) Rust 지원, AArch64 2025 dpISA hwcaps, "Fair(er)" GPU 스케줄러, Intel Xe 드라이버 CRI 초기 지원.
- **사이클 배경 서사** — AI/LLM 활용 증가로 패치·리포팅 처리량이 늘면서 매우 빡빡한 최종 테스트 주간을 거쳤음에도 예정대로 출시됐고, 규모 면에서 6.7 다음으로 큰 개발 사이클이었다는 평이 여러 매체에서 공통적으로 나왔다.

## 인상 깊은 문장

> "cache-aware load balancing... after more than a year of work" / "second-largest development cycle in history after 6.7"
> (여러 매체의 보도를 종합한 표현 — 특정 매체의 단일 원문을 직접 확인하지 못해 그대로의 인용이 아니라 반복적으로 등장한 핵심 문구를 재구성한 것임을 밝힌다)

## 댓글

**출처 한계(중요)** — 이번 정리에서 GeekNews 원문 페이지(`news.hada.io/topic?id=32734`) 자체가 네트워크 egress 프록시에 의해 차단되어 **hada 댓글 수·GeekNews 요약 불릿·GeekNews가 실제로 링크한 원문 URL을 직접 확인하지 못했다.** WebSearch로 확인한 바 Hacker News에도 "Linux 7.2" 스레드(`news.ycombinator.com/item?id=49376265`)가 존재하지만, 이 역시 접근이 차단되어 포인트·댓글 수는 확인 불가하다. 대신 Phoronix·LWN·9to5Linux·OSNews·Linuxiac·GamingOnLinux·Neowin·Linux Journal·vmlinuz.pl 등 10여 개 매체가 같은 사실(릴리스 날짜, 캐시 인지 스케줄링, Btrfs 개선 수치 등)을 보도해 **내용 교차검증은 됐지만, GeekNews/hada 커뮤니티의 실제 반응은 이 노트에 반영되지 못했다.** 커널 마이너 릴리스 뉴스 특성상 원래도 댓글이 적거나 기술 스펙 확인용 스레드일 가능성이 높다는 점을 감안해서 읽을 것.

## 내 생각 · 적용점

리소스성 릴리스 노트라 핵심 전이는 가볍게 1개만.

- **AI가 커널 개발 사이클 자체의 속도·부담을 바꾸고 있다** — "AI/LLM발 패치·리포트 폭증으로 역대 두 번째로 바쁜 사이클"이라는 배경 서사는, [[2026-07-17-linus-torvalds-llm-in-kernel-development]]에서 Linus가 "AI는 하나의 도구, 결정은 기술적 이점 기준"이라고 선언했던 것의 실제 현장 증거에 가깝다. 정책 논쟁(써도 되냐)과 별개로, LLM이 이미 커널처럼 가장 보수적인 프로젝트의 유지보수 부하를 실측 가능한 수준으로 늘리고 있다는 신호.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다는 관리형 클라우드/컨테이너(K8s 노드 이미지, 매니지드 DB) 위에서 동작하므로 커널 마이너 버전을 직접 선택·튜닝할 일이 거의 없다. 다만 Btrfs large-folio·swap 서브시스템 개선처럼 스토리지·메모리 I/O 처리량이 오르는 변화는, 몇 개월~1년 뒤 클라우드 벤더의 노드 OS 업데이트를 통해 조용히 반영되어 DB·캐시 워크로드 성능에 간접적으로 영향을 줄 수 있다는 정도로만 기억해두면 된다.

## 연관 자료

- [[2026-07-17-linus-torvalds-llm-in-kernel-development]] — 같은 리눅스 커널 생태계. 이번 릴리스의 "AI발 패치 폭증" 배경 서사가 Linus의 AI 도구 옹호 발언과 실제로 맞물리는 후속 사례.
- [[2026-06-28-linux-older-hardware-revival]] — 같은 커널이지만 반대 극단의 관심사(신기능 최전선 vs 구형 하드웨어 생존). 커널이 계속 무거워질수록 구형 하드웨어와의 격차도 함께 벌어진다.

## 한 달 뒤 회고

2026-09-22 즈음 확인할 것:
- 캐시 인지 스케줄링이 실사용 벤치마크(Phoronix OpenBenchmarking 등)에서 실제 개선/회귀로 이어졌는지.
- Ubuntu·Fedora 등 주요 배포판의 7.2 채택 시점과, Btrfs large-folio 기본화 이후 실사용 버그 리포트가 늘었는지.
- GeekNews 접근이 이후에도 계속 막히는지 — 반복되면 정리 파이프라인에서 GeekNews 원문 확보 방식 자체를 재검토해야 함.
