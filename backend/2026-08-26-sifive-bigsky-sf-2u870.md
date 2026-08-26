---
title: "SiFive의 첫 서버 플랫폼 BigSky SF-2U870 — 코어·대역폭보다 RVA23 호환이 진짜 뉴스"
source_title: "SiFive's First Server Platform"
source_url: "https://chipsandcheese.com/p/sifives-first-server-platform"
source_name: "Chips and Cheese (George Cozma)"
referrer_url: "https://news.hada.io/topic?id=32898"
published_at: "2026-08-24"
summarized_at: "2026-08-26"
category: "backend"
tags: ["risc-v", "server-hardware", "cpu-architecture", "sifive"]
---

# SiFive의 첫 서버 플랫폼 BigSky SF-2U870

> 출처: [SiFive's First Server Platform](https://chipsandcheese.com/p/sifives-first-server-platform) (Chips and Cheese, George Cozma · Hot Chips 2026 계기 발표) · 정리일 2026-08-26
> **출처 한계**: `chipsandcheese.com`·`news.hada.io`·HPCwire·The Register·Semiwiki 등 원문 후보 전부 이 세션에서 차단되어 WebFetch 불가. WebSearch로 여러 매체(HPCwire, The Register, Electronics Weekly, Chips and Cheese 검색 스니펫)를 교차검증했고, Slack 발췌와 겹치는 수치(32코어·2.2GHz 근사·RVA23·PCIe 5.0)는 일치를 확인했다. 단 정확한 클럭(2.0GHz vs 2.2GHz)은 매체마다 표기가 갈려 Slack 발췌값을 우선 채택했고, hada 댓글 원문은 직접 확인하지 못했다.

## 한 줄 요약
**BigSky SF-2U870은 성능 그 자체가 아니라 "RVA23 표준을 지키는 상용 RISC-V 서버가 마침내 나왔다"는 사실이 요점이다** — Ubuntu 26.04·RHEL 10을 별도 포팅 없이 그대로 올릴 수 있다는 것.

## 핵심 포인트
- 2U 랙형 새시에 SiFive 자체 설계 P870-D 코어 32개(약 2.0~2.2GHz), DDR5 메모리, PCIe 5.0 x16 레인 다수, U.2 NVMe, 10/25Gbps OCP 3.0 네트워킹을 담은 개발자용 서버.
- 목표는 코어 수·대역폭 극대화가 아니라 ***"별도의 시스템 조정 없이 소프트웨어 개발과 CI를 수행하는 것"*** — 즉 RISC-V 진영이 오랫동안 가지지 못했던 "그냥 돌아가는 지루한 플랫폼".
- RVA23 프로파일 완전 준수가 핵심 전환점: 그동안 RISC-V 서버는 벡터 확장(RVV) 지원이 파편화돼 있어 배포판마다 커스텀 빌드가 필요했는데, BigSky는 ***Ubuntu 26.04·RHEL 10을 별도 호환 작업 없이*** 바로 얹을 수 있다.
- Intel Xeon 6532P-B(같은 32코어·비슷한 클럭)와 비교하면 BigSky는 ***PCIe 레인 수에서 앞서지만***, Xeon은 SMT2·3.9GHz 부스트 클럭·더 넓은 코어 폭에서 우위 — 즉 처리량이 아니라 IPC·싱글스레드에서는 여전히 밀린다.
- Ampere Altra Q32-17과 비교하면 BigSky가 ***클럭·코어 폭·PCIe 세대에서 유리*** 하지만, Altra는 더 많은 PCIe 레인 수·메모리 대역폭·낮은 TDP를 제공 — 두 비교 모두 "이긴다"가 아니라 "트레이드오프가 다르다"는 그림.
- 포지셔닝 자체가 프로덕션 서버가 아니라 ***개발/이식/검증용 플랫폼*** — 하이퍼스케일러·칩 벤더·소프트웨어 벤더가 RISC-V 이식과 커스텀 실리콘 사전 검증에 쓰라는 것. NVIDIA가 이 플랫폼에 CUDA를 포팅 중이라는 보도도 있다(2차 출처, 원문 미확인).

## 인상 깊은 문장
> "코어 수나 대역폭보다 중요한 변화는 RVA23 지원으로, RISC-V 벡터 확장 RVV와 Ubuntu 26.04를 별도 호환 작업 없이 사용할 수 있음" (Slack 발췌 요약)

## 댓글
- Hacker News에 별도 스레드가 존재(검색으로 확인)하지만, 이 세션에서 원문·댓글 내용을 직접 열람하지 못해 논지를 구체적으로 옮기지 못한다.
- GeekNews(hada) 토픽 페이지 자체가 이 세션에서 차단돼 hada 댓글 수·논지를 확인할 수 없었다 — **정직하게 미확인으로 남긴다.**
- 출처가 되는 Chips and Cheese는 하드웨어 전문 블로그로 벤더 자금 지원 여부 등 이해관계는 확인하지 못했다.

## 내 생각 · 적용점
RISC-V 서버 이야기에서 항상 반복되는 패턴은 "코어 수·클럭으로는 이미 경쟁력 있다"는 벤치마크성 주장과 "그런데 소프트웨어 생태계가 안 따라온다"는 반론의 반복이었다. BigSky의 진짜 뉴스는 하드웨어 스펙표가 아니라 RVA23이라는 **표준화 지점**이 생겼다는 것 — [[2026-06-08-job-interviews-taught-me-kubernetes]]에서 확인했던 "표준화는 채택을 낳지만 그 자체로 복잡성을 없애지는 않는다"는 원칙과 같은 축에 놓인다. Kubernetes가 12개 회사 모두에서 "표준으로 수렴"했던 이유가 기술 우위가 아니라 조직적 이점이었듯, RISC-V 서버도 이제 "성능이 x86급이냐"가 아니라 "배포판이 별도 포팅 없이 그냥 올라가느냐"가 채택의 실질 관문이라는 걸 이 글이 보여준다. 다만 이번 배치에서 함께 정리한 [[2026-08-26-apple-m6-m5-ultra]]·[[2026-08-26-apple-mac-studio-m5-max-ultra]]와는 완전히 다른 층위의 하드웨어 뉴스라, 그쪽으로 억지 연결은 하지 않는다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다. 온다의 CRS/PMS 백엔드가 RISC-V 서버로 이전할 유인은 현재로선 없다 — 이 플랫폼 자체가 "프로덕션 배포"가 아니라 "개발·이식·검증"을 표방하는 개발자용 장비이기 때문이다. 전이 가능한 원칙만 남기면: 새 아키텍처를 평가할 때 벤치마크 수치보다 "표준 배포판이 별도 작업 없이 올라가는가"를 1차 관문으로 삼는 습관 정도.

## 연관 자료
- [[2026-08-26-apple-m6-m5-ultra]] — 같은 시기(2026-08 하순) 공개된 하드웨어 뉴스지만 소비자용 SoC·다른 아키텍처 축이라 직접 비교는 억지, "같은 배치에서 함께 정리한 하드웨어 뉴스" 정도로만 병기.
- [[2026-06-08-job-interviews-taught-me-kubernetes]] — "표준화가 채택을 견인한다"는 원칙이 RVA23 사례에도 반복.

## 한 달 뒤 회고 (2026-09-26 즈음)
- BigSky의 hada·HN 댓글 논지를 다시 확인할 수 있는 시점이면 이 노트의 "댓글" 섹션을 보강할 것.
- NVIDIA CUDA 포팅 보도가 공식 확인됐는지, RISC-V 서버 시장에 후속 벤더(예: Ampere류)가 RVA23 대응 제품을 내는지 추적.
