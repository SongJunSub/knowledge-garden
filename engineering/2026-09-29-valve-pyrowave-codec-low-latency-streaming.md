---
title: "Valve, 저지연 스트리밍용 Pyrowave 비디오 코덱 베타 도입 (Hans-Kristian Arntzen)"
source_title: "Valve Introduces Pyrowave Video Codec In Beta For Low Latency Streaming"
source_url: "https://www.phoronix.com/news/Valve-Steam-Beta-Pyrowave"
source_name: "Phoronix"
referrer_url: "https://news.hada.io/topic?id=34428"
published_at: "2026-09-22"
summarized_at: "2026-09-29"
category: "engineering"
tags: ["video-codec", "game-streaming", "steam-remote-play", "gpu", "latency-bandwidth-tradeoff"]
---

# Valve, 저지연 스트리밍용 Pyrowave 비디오 코덱 베타 도입

> 출처: [Valve Introduces Pyrowave Video Codec In Beta For Low Latency Streaming](https://www.phoronix.com/news/Valve-Steam-Beta-Pyrowave) (Phoronix) · GeekNews(id=34428) 경유 · 정리일 2026-09-29
>
> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. Slack 발췌 4개 불릿을 Phoronix·Tom's Hardware·GamingOnLinux·VideoCardz 등 복수 매체의 WebSearch 스니펫으로 교차확인했다. 코덱 개발자 Hans-Kristian Arntzen(GitHub 계정 Themaister, VKD3D-Proton 개발자로 잘 알려짐) 본인의 기술 블로그 원문은 열람하지 못해, 구체적 설계 결정의 이유(왜 DCT 대신 DWT를 택했는지 등)는 2차 보도 수준에서만 확인했다.

## 한 줄 요약

**Steam Remote Play에 영상 압축·복원 시간 자체를 줄이는 Pyrowave 코덱을 추가해, 다른 기기에서 게임을 스트리밍할 때 생기는 지연을 낮추려는 시도 — 대역폭을 기존 코덱의 5~10배 쓰는 대신 GPU에서 각 프레임을 독립적으로 처리해 지연을 밀리초 단위로 낮추고 손실 전파를 억제하는, "대역폭을 지연과 맞바꾸는" 설계다.**

## 핵심 포인트

- **문제의식 — Remote Play의 체감 지연** — Steam Remote Play로 다른 기기에서 게임을 할 때 화면이 늦게 전달되는 문제를 줄이기 위해, 영상 압축·복원(인코딩·디코딩) 자체에 걸리는 시간을 줄이는 Pyrowave 코덱을 베타로 도입했다.
- **대역폭을 지연과 맞바꾸는 설계 철학** — 전송량을 줄이는 데 최적화된 기존 코덱(H.26x 계열)과 반대로, Pyrowave는 ***전송량을 아끼는 대신 처리 속도를 최우선***으로 설계됐다. 기존 코덱보다 대역폭을 5~10배 더 쓰며, Steam이 권장하는 최소 대역폭은 100Mbps, 최대 500Mbps에 달해 ***기가비트 유선 연결***을 권장한다. 로컬 네트워크(같은 공유기 아래) 게임 스트리밍을 겨냥한 설계다.
- **GPU 독립 프레임 처리와 지연 수치** — Discrete Cosine Transform과 프레임 간(inter-frame) 인코딩을 쓰는 기존 방식과 달리, Pyrowave는 Motion JPEG2000에 가까운 ***Discrete Wavelet Transform(CDF 9/7 필터) 기반의 프레임 내(intra-frame) 인코딩***을 GPU(Vulkan 컴퓨트 셰이더)로 수행한다. 각 프레임을 독립적으로 압축·복원하므로 ***패킷 손실이 이후 프레임까지 전파되는 문제***가 줄어든다. 로컬 네트워크 1080p60 스트리밍 기준 약 10ms의 종단 지연, 인코딩·디코딩 각각 1080p에서 0.1ms 미만, 4K에서 0.2ms 미만이라는 수치가 여러 매체에서 확인됐다.
- **색상·HDR 지원** — HDR과 YUV 4:4:4 크로마 서브샘플링을 지원한다. 호스트·클라이언트가 모두 지원하면 HDR은 자동 선택되며, 색 정보를 세밀하게 보존하는 4:4:4 옵션은 데스크톱 화면 공유처럼 텍스트 선명도가 중요한 용도에 특히 유리하다(Slack 발췌 이 지점에서 절단).
- **개발자와 배포 범위** — 코덱을 만든 Hans-Kristian Arntzen은 Direct3D 12를 Vulkan으로 옮기는 VKD3D-Proton의 개발자로, Linux에서의 Windows 게임 구동(Proton)을 지탱하는 핵심 인물 중 하나다. Pyrowave는 MIT 라이선스로 소스가 공개돼 있고, 현재 Windows·macOS의 Steam 베타 클라이언트를 통해 사용할 수 있다.

## 인상 깊은 문장

> "Pyrowave uses around 5 to 10 times more bandwidth than other streaming codecs."
> (Tom's Hardware 기사 제목·본문에서 반복 확인)

## 댓글

**hada 댓글 수 확인 불가**(원문 차단). 이 소식은 Phoronix·Tom's Hardware·GamingOnLinux·VideoCardz·Ars Technica류 게이밍/하드웨어 전문 매체 다수가 동시에 다뤘을 만큼 확산됐으나, 이번 검색으로는 이 주제를 전용으로 다루는 별도 HN 스레드를 특정하지 못했다 — HN 큐레이션 여부가 불투명하다. 매체 간 세부 수치(지연 밀리초, 최대 대역폭 500Mbps 등)는 대체로 일치했지만, 이는 대부분 Valve/Arntzen 측 발표를 그대로 인용한 것으로 보이며, 제3자의 독립적인 벤치마크 검증은 확인하지 못했다.

## 내 생각 · 적용점

이 글은 게이밍/영상 코덱이라는, 온다의 업무 도메인과 직접 맞닿지 않는 기술 호기심성 소재다. 억지로 CRS에 끼워 맞추기보다, 엔지니어링 판단의 원형으로서 가볍게 짚는다.

### 핵심 전이 1 — "한 자원을 더 써서 다른 자원(지연)을 산다"는 트레이드오프의 명료한 사례

Pyrowave의 설계는 "대역폭을 아끼는 최적화"라는 코덱 업계의 오랜 기본값을 뒤집고, ***지연이라는 다른 축을 우선순위로 삼아 자원 배분 자체를 재설계***한 사례다. 이건 [[2026-06-08-static-types-and-the-shovel]]류의 "도구 선택은 트레이드오프 축을 무엇으로 잡느냐의 문제"라는 이 가든의 반복 관찰과 같은 결의 사례로 놓을 수 있다 — 다만 이 연결도 원리 수준의 느슨한 유비이지, 두 글이 실질적으로 같은 주제를 다루는 건 아니다.

### 핵심 전이 2 — "손실 전파를 막는다"는 설계 목표는 분산 시스템의 장애 격리와 형태가 같다

프레임 간 인코딩을 버리고 프레임마다 독립적으로 처리해 패킷 손실이 다음 프레임까지 전파되지 않게 한다는 설계는, 분산 시스템에서 한 컴포넌트의 장애가 전체로 전파되지 않도록 격리하는 원칙(circuit breaker, bulkhead)과 구조적으로 동일하다. 도메인은 완전히 다르지만("영상 프레임" vs "서비스 요청") 격리 설계의 사고방식 자체는 재사용 가능한 패턴이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다의 CRS는 실시간 영상 스트리밍을 다루지 않으므로 이 코덱 자체를 가져다 쓸 자리는 없다. 다만 설계 철학 한 조각은 원칙으로만 남길 만하다 — 실시간 요금·재고 조회처럼 응답 지연이 파트너 경험에 직결되는 영역에서, "약간의 비용(연산량·인프라 비용)을 더 쓰더라도 응답 지연을 줄이는 쪽"을 의식적으로 선택할 수 있다는 것. 예를 들어 다수 채널 동시 조회 시 캐시를 더 적극적으로 쓰거나 병렬 조회로 인프라 비용을 늘리는 대신 체감 응답 속도를 낮추는 결정은, 이 코덱이 "대역폭을 더 써서 지연을 줄인다"고 한 것과 같은 종류의 트레이드오프 판단이다. 다만 이건 원칙적 유비이지 구체적 기술 적용은 아니다.

## 연관 자료

- [[2026-06-08-static-types-and-the-shovel]] — "도구 선택은 트레이드오프 축을 무엇으로 잡느냐"는 같은 원리의 다른 사례
- [[2026-09-01-steam-teraleak-12tb-game-archive]] — 같은 Steam/게이밍 인프라 계열의 다른 소식

## 한 달 뒤 회고

*(2026-10-29 즈음 — Pyrowave가 베타를 벗어나 정식 기능이 됐는지, 독립적인 제3자 벤치마크가 나와 Valve 발표 수치를 검증했는지 확인.)*
