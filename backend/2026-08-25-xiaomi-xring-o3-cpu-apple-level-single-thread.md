---
title: "샤오미 Xring O3, 단일 스레드는 Apple급·멀티스레드는 압도 (Daniel Lemire X 스레드 추정) — 클럭 경쟁이 아니라 '실행 포트 21개·캐시 44MB'로 폭을 넓히는 것 자체가 이번 세대 CPU 설계의 트렌드"
source_title: "Xiaomi is the Chinese tech giant... Their new CPU roughly matches Apple cores on single threaded tasks, and is much faster in multithreaded execution"
source_url: "https://x.com/lemire/status/2091894299289874926"
source_name: "Daniel Lemire, X(Twitter) 스레드 (추정 — 아래 '댓글' 절 참조)"
referrer_url: "https://news.hada.io/topic?id=32851"
published_at: "2026-08-24"
summarized_at: "2026-08-25"
category: "backend"
tags: ["xiaomi", "xring-o3", "cpu-microarchitecture", "arm-sve2", "sme2", "single-thread-performance", "mobile-soc", "cache-hierarchy"]
---

# 샤오미 Xring O3, 단일 스레드는 Apple급·멀티스레드는 압도

> 출처: [Xiaomi is the Chinese tech giant... Their new CPU roughly matches Apple cores on single threaded tasks, and is much faster in multithreaded execution](https://x.com/lemire/status/2091894299289874926) (Daniel Lemire, X 스레드 추정 · GeekNews 경유) · 정리일 2026-08-25
> **출처 한계**: 아래 "댓글" 절에 상세. GeekNews·원문(x.com) 모두 이번 세션에서 직접 접근하지 못했다.

## 한 줄 요약

**샤오미의 2세대 자체 설계 플래그십 SoC Xring O3는 단일 스레드 성능에서 Apple 코어와 "대체로 비슷한" 수준까지 따라붙었고, 멀티스레드에서는 그보다 훨씬 앞선다고 주장한다.** 다만 이 결과를 만든 방식이 흥미롭다 — 클럭이나 IPC의 단일한 도약이 아니라, **총 44MB 캐시(대다수 노트북 CPU보다 큼)와 21개 실행 포트(그중 6개가 128비트 SIMD)** 처럼 "칩을 물리적으로 넓히는" 방향으로 트랜지스터를 쏟아부었다. 최상위 코어 C1-Ultra는 행렬·AI 가속용 **SME2**와 데이터 병렬 처리용 **SVE2**까지 지원한다. Geekbench 6.5 기준 싱글코어 3,945·멀티코어 15,221로, Apple A19 Pro가 싱글코어에서는 근소하게 앞서지만 멀티코어에서는 격차가 크게 벌어진다는 게 교차검증된 벤치마크 수치다. TSMC 3nm(N3P) 공정에 240억 트랜지스터, 10코어 전부 빅코어(효율 코어 없음) 구성이라는 것도 같은 "폭을 넓히는" 설계 철학의 연장이다.

## 핵심 포인트

Slack 발췌 불릿(마지막 항목은 문장이 잘려 불완전)과, 이번 정리에서 WebSearch로 별도 교차검증한 정보를 구분해 정리한다.

- **[Slack 발췌]** 단일 스레드는 Apple 코어와 대체로 비슷하고, 멀티스레드에서는 훨씬 빠르다는 게 샤오미 측 주장.
- **[Slack 발췌]** **총 44MB 캐시** — 대다수 노트북 CPU보다 크며, 많은 Intel 노트북 프로세서도 이보다 적은 캐시를 갖춤.
- **[Slack 발췌]** 최상위 **C1-Ultra** 코어는 행렬·AI 가속용 **SME2(Scalable Matrix Extension 2)**와 데이터 병렬 처리용 **SVE2**를 지원.
- **[Slack 발췌]** 실행 포트 **21개 중 6개가 128비트 SIMD**를 지원해 Intel·AMD보다 포트 수는 많지만, AMD Zen 5의 512비트 연산과는 폭에서 차이가 있음.
- **[Slack 발췌, 문장 잘림]** "다수의 실행 유닛과 대용량 캐시에 트랜지스터를 집중하는 대규모 병렬화 추…" — 이 뒤로 이어졌을 트렌드 논평(아마 "코어가 점점 넓어지고 있다"는 결론)은 이번 정리에서 확인하지 못했다.
- **[교차검증·WebSearch]** CPU 구성은 **10코어 전부 빅코어**(효율 코어 없음) — C1-Ultra ×2(최대 4.35GHz) + C1-Premium ×4(최대 3.68GHz) + C1-Pro ×4(최대 3.15GHz), 전부 Armv9.3 세대. 샤오미 자체 발표로는 C1-Ultra가 Cortex-X925 대비 싱글스레드 **25% 우위**, C1-Pro가 Cortex-A725 대비 동클럭 **16% 우위·최대 12% 저전력**.
- **[교차검증·WebSearch]** TSMC N3P(3nm) 공정, **240억 트랜지스터**, 133mm² 다이. **LPDDR6를 지원하는 최초의 모바일 SoC**로 대역폭 +48%. 다이 분석 결과 기능 블록 간 라우팅을 좁히고 TSMC 표준 셀 라이브러리 밖에서 2,400개 이상의 커스텀 셀을 설계했다는 주장도 나온다.
- **[교차검증·WebSearch]** 벤치마크는 **Geekbench 6.5 싱글코어 3,945 / 멀티코어 15,221**, AnTuTu 520만 이상 주장. Apple A19 Pro가 싱글코어에서는 여전히 근소 우위이나 멀티코어에서는 Xring O3에 크게 못 미친다는 게 여러 매체(HotHardware, Notebookcheck, WCCFTech 등)에서 반복 확인된 수치. **전부 샤오미 자체 발표·초기 벤치마크이며 독립 제3자 리뷰 수치는 아직 없다.**
- **[교차검증·WebSearch]** 2026년 9월 출시 예정 **Xiaomi 18 Fold**에 탑재.

## 인상 깊은 문장

이번 정리는 원문(x.com) 자체를 직접 열람하지 못해, 검증 가능한 것은 WebSearch 결과에 그대로 노출된 스니펫 텍스트뿐이다.

> "Xiaomi is the Chinese tech giant. Their phones compete with iPhones. Their new CPU roughly matches Apple cores on single threaded tasks, and is much faster in multithreaded execution."
> Daniel Lemire의 X 스레드로 추정되는 글의 도입부 — WebSearch 결과 제목에 그대로 노출된 문구를 옮겼다. 직접 페이지를 열어 전체 스레드를 대조하지는 못했다.

그 외 스펙 수치(10코어 구성, Cortex 대비 %, Geekbench 점수 등)는 여러 하드웨어 매체를 교차 검색한 재구성이지, 원문에서 그대로 옮긴 인용문이 아니다.

## 댓글

**정직하게 밝힌다 — 이번 정리도 [[2026-08-22-linux-7-2-kernel-release]], [[2026-08-22-ssl-everything-you-learned-is-deprecated]]와 같은 이유로 출처 접근이 제한적이었다.**

- ①**GeekNews 원문(news.hada.io/topic?id=32851) 자체가 이번 세션의 네트워크 egress 정책으로 차단**돼, hada 댓글 수와 GeekNews가 실제로 링크한 원문 URL을 확인하지 못했다. Slack에 남은 요약 불릿(마지막 항목이 잘린 상태)만 확보했다.
- ②**GeekNews 제목("샤오미 새 CPU, 단일 스레드는 Apple급·멀티스레드는 더 빠르다고 주장")과 문구가 거의 그대로 겹치는 X 스레드**로 Daniel Lemire의 게시물(x.com/lemire/status/2091894299289874926)을 특정했다. "44MB 캐시가 대다수 노트북 CPU보다 크다", "Intel 노트북 CPU도 이보다 캐시가 적을 것" 같은 표현이 Slack 발췌와 검색 스니펫에서 거의 일치해 근거로 삼았다. 다만 **x.com 자체는 egress 차단으로 직접 열람·대조하지 못했고**, 미러(xcancel.com)·HN(news.ycombinator.com)·hn.algolia.com API까지 전부 차단돼 **어느 경로로도 원문 전체를 직접 확인하지 못했다** — `source_url`을 "추정"으로 표기한 이유다.
- ③**HN 스레드가 존재한다는 것은 확인했다**(`item?id=49420873`, 제목 "Xiaomi: New CPU matches Apple cores single threaded, much faster multithreaded" — GeekNews 제목과 사실상 대응). 그러나 **직접 접근이 차단**돼 정확한 포인트·댓글 수는 확인하지 못했다. WebSearch 스니펫에서 "smells somewhat legitimate and somewhat BS"라는 회의적 댓글, MediaTek·Qualcomm에 위협이 될 거라는 댓글, Apple A20 출시 이후 격차가 다시 벌어질 거라는 반응 등이 노출됐지만 **댓글 원문 전체·정확한 개수는 재구성이 아니라 확인 불가로 남겨둔다.**
- ④**이해관계**: 스펙(Cortex 대비 %, AnTuTu·Geekbench 점수)이 전부 **샤오미 자체 발표**이거나 그걸 그대로 받아쓴 벤치마크 유출 기사다. 독립 리뷰어의 실측치는 아직 없고, Xiaomi 18 Fold 정식 출시(2026년 9월) 이후에야 제3자 검증이 가능해진다.

## 내 생각 · 적용점

### 핵심 전이 1 — "코어 수·공유 캐시가 커질수록 캐시 지역성 관리가 중요해진다"는 커널 쪽 문제의식과 정확히 만난다

[[2026-08-22-linux-7-2-kernel-release]]에서 다룬 **캐시 인지(cache-aware) 스케줄링**은 "서로 자원을 공유하는 태스크를 같은 LLC(Last Level Cache) 도메인의 코어에 묶어 불필요한 캐시 마이그레이션을 줄인다"는 기능이다. Xring O3처럼 **10코어 전부 빅코어 + 44MB 공유 캐시**인 칩이 늘어날수록, 이런 스케줄러 기능의 가치는 더 커진다 — 코어가 많고 캐시가 클수록 "어떤 태스크를 어느 코어에 둘 것인가"가 성능에 미치는 영향이 커지기 때문이다. 같은 릴리스 노트가 언급한 **"AArch64 2025 dpISA hwcaps"** 항목도, SME2·SVE2 같은 신형 ARM ISA 확장을 커널이 인식·활용하는 작업과 맞닿아 있다. **하드웨어가 넓어지면(폭이 커지면) 그걸 실제로 활용하는 OS 레이어의 일도 함께 커진다**는 게 이번에 확인된 연결이다.

### 핵심 전이 2 — "하나의 큰 도약"이 아니라 "폭을 넓히는 것" 자체가 이번 시즌 하드웨어/표준 설계에서 반복되는 패턴

[[2026-08-24-wifi-8-ultra-high-reliability]]에서 확인한 원칙 — *"신뢰성은 특정 기능 하나가 아니라 작은 메커니즘 여러 개를 겹쳐 쌓는 조합"* — 이 Xring O3에서는 성능 축으로 반복된다. Xring O3가 Apple급 싱글스레드를 잡은 방식은 IPC나 클럭의 단일한 돌파구가 아니라, **실행 포트를 21개까지 늘리고 캐시를 44MB까지 키우는 "폭 넓히기"**다. 무선 표준이든 CPU 마이크로아키텍처든, **"하나의 결정적 개선"보다 "작은 유닛·메커니즘의 개수를 늘리는 것"이 최근 하드웨어 설계의 공통 축**으로 보인다는 게, 이번 정리에서 얻은 (약하지만 진짜) 두 번째 연결이다.

## 호스피탈리티 / CRS 적용 포인트

**정직하게 밝힌다 — 이 글은 모바일 SoC 마이크로아키텍처 뉴스라, 온다(B2B 호스피탈리티/CRS) 관점의 직접 적용은 거의 없다.** 굳이 찾자면, 프런트데스크·셀프체크인 키오스크에 쓰이는 안드로이드 태블릿·단말기의 세대 교체 시 Xring O3급 칩이 탑재된 기기가 늘어나면 로컬 처리(문서 스캔·얼굴 인식·오프라인 캐시) 응답성이 좋아질 수 있다는 정도지만, 이건 온다가 직접 통제할 수 있는 영역이 아니라 하드웨어 벤더·PMS 단말기 공급사가 대신 흡수하는 변화다. 이번 노트에서는 억지로 CRS 접점을 만들지 않는다.

## 연관 자료
- [[2026-08-22-linux-7-2-kernel-release]] — 캐시 인지 스케줄링·AArch64 hwcaps 지원이 대용량 캐시·다코어 ARM 칩이 늘어날수록 더 중요해지는 지점
- [[2026-08-24-wifi-8-ultra-high-reliability]] — "하나의 큰 기능"이 아니라 "작은 유닛·메커니즘을 늘리는 것"으로 목표를 달성하는 같은 설계 철학이 CPU 마이크로아키텍처에서도 반복
- [[2026-08-22-ssl-everything-you-learned-is-deprecated]] — 같은 세션의 egress 차단으로 원문 직접 접근이 막힌, 같은 정직성 처리 방식을 취한 노트

## 한 달 뒤 회고
*(2026-09-25 즈음: ①이번에 접근 차단됐던 x.com·xcancel·HN·hn.algolia.com을 다시 열람해 Daniel Lemire 게시물 원문과 HN 댓글을 사후 대조할 수 있는지 ②Xiaomi 18 Fold 정식 출시(2026년 9월 예정) 이후 독립 리뷰어의 제3자 벤치마크가 샤오미 자체 발표 수치(Cortex 대비 %, Geekbench 점수)와 얼마나 일치하는지 ③Apple 차세대 칩 발표 이후 "싱글스레드 Apple급" 주장이 그대로 유지되는지 점검.)*
