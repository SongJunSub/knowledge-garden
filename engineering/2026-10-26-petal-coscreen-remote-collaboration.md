---
title: "Petal, 동료가 공유한 창을 내 데스크톱 창처럼 쓰는 원격 협업 앱 (CoScreen 팀) — Datadog이 CoScreen 서비스를 끝낸 날, 그 팀 4명이 오픈소스로 같은 것을 다시 만들었다"
source_title: "Show HN: Petal, open-source CoScreen/ScreenHero finally free"
source_url: "https://github.com/kiruna-labs/petal"
source_name: "GitHub (kiruna-labs/petal, CoScreen 공동창업자 Jason Thomas 등 전 CoScreen 팀)"
referrer_url: "https://news.hada.io/topic?id=36003"
published_at: "2026-10 (Datadog의 CoScreen 서비스 종료일 2026-07-31 이후, HN Show HN id=50092470 게시 시점 추정)"
summarized_at: "2026-10-26"
category: "engineering"
tags: ["remote-collaboration", "pair-programming", "screen-sharing", "coscreen", "h264", "developer-tools", "open-source", "livekit"]
---

# Petal, 동료가 공유한 창을 내 데스크톱 창처럼 쓰는 원격 협업 앱 (CoScreen 팀)

> 출처: [GitHub - kiruna-labs/petal](https://github.com/kiruna-labs/petal) (CoScreen 공동창업자 Jason Thomas 등 전 CoScreen 팀) · GeekNews(id=36003) 경유 · 정리일 2026-10-26
>
> **출처 한계**: `news.hada.io`는 이 세션에서 접근 차단됐다. 대신 `github.com` 저장소 README는 직접 열람해 기능·라이선스·스타 수(437개, 포크 19개)를 확보했다. WebSearch로 Hacker News Show HN 게시글(제목 "Show HN: Petal, open-source CoScreen/ScreenHero finally free", item id=50092470, CoScreen 공동창업자 Jason Thomas가 직접 게시)의 존재와 "Datadog이 7월 31일 CoScreen 서비스를 종료한 뒤 전 CoScreen 팀 4명이 만들었다"는 배경은 교차확인했지만, **HN 포인트·댓글 수는 검색으로 특정하지 못했다.** CoScreen과 Petal이 "같은 팀"이라는 연결은 Petal 공식 사이트(petal.live)의 "from the makers of CoScreen" 문구와 창업자 본인의 HN 게시글이 근거라, 제3자 독립 검증은 아니라는 점도 밝혀둔다.

## 한 줄 요약

**CoScreen을 만들었던 팀이, Datadog의 인수 후 CoScreen 서비스가 2026-07-31에 종료되자 같은 개념을 오픈소스(Apache-2.0)로 다시 만든 것이 Petal이다. 공유받은 동료의 창(코드 에디터·브라우저 등)이 회의 그리드의 타일이 아니라 내 데스크톱의 독립된 네이티브 창으로 떠서, 자유롭게 옮기고 크기를 바꿔 내 작업 창 옆에 둘 수 있다. 창마다 하드웨어 H.264 인코딩을 적용해 지연을 낮추고, 참여자 커서를 공유 창 위에 표시하거나 그림을 그려 특정 부분을 짚을 수 있으며, 동료에게 공유 창의 마우스·키보드 조작을 넘길 수도 있다.**

## 핵심 포인트

- **CoScreen에서 Petal로 — 서비스 종료가 오픈소스화의 직접 계기** — CoScreen은 2021년 440만 달러 투자를 받고 출범한 원격 페어프로그래밍 스타트업으로, 이후 Datadog에 인수됐다. Datadog이 CoScreen 서비스를 2026-07-31에 종료하자, 전 CoScreen 팀원 4명이 같은 제품 개념을 오픈소스로 재구현해 공개한 것이 Petal이다.
- **창 단위 공유 — 회의 타일이 아니라 네이티브 창** — 공유된 각 창이 참가자 데스크톱에서 독립된 네이티브 창으로 나타나, 화상회의 그리드에 갇히지 않고 자유롭게 옮기고 크기를 바꿔 자기 에디터·브라우저 옆에 배치할 수 있다. 여러 사람이 여러 창을 동시에 공유할 수 있다.
- **텔레포인터와 그리기** — 참여자별 커서가 공유 창 위에 실시간으로 표시되고, 창 위에 직접 스케치해 코드나 화면의 특정 부분을 가리키며 논의할 수 있다. 그린 선은 10초 뒤 자동으로 사라진다.
- **창마다 독립된 하드웨어 H.264 인코딩** — 지연을 줄이기 위해 각 공유 창을 하드웨어 인코딩된 H.264 스트림으로 개별 전송한다. macOS는 VideoToolbox, Windows는 D3D11 기반 컴포지터를 쓴다.
- **원격 제어** — 공유 창의 제어권(마우스·키보드)을 동료에게 넘길 수 있다. 상대의 입력은 공유자의 포커스를 빼앗지 않고 주입되는 방식이며, macOS의 손쉬운 사용(Accessibility) 권한이 필요하고 기본값은 요청마다 동의 창을 띄우는 것이다.
- **배포 형태와 성숙도** — 오디오·비디오 인프라는 LiveKit 기반이라 Petal Cloud(제로 설정)로 쓰거나 자체 LiveKit 서버로 셀프호스팅할 수 있다. 다만 프로젝트는 아직 1.0 이전 단계이고 macOS 클라이언트가 Windows보다 더 성숙하며, 팀 스스로 "CoScreen만큼 지연 튜닝이 되어 있지는 않다"고 밝히고 있다.

## 인상 깊은 문장

> "Free and open source, from the makers of CoScreen."
> (Petal 공식 사이트 petal.live의 소개 문구로 WebSearch 스니펫에서 반복 확인됨. 상업 서비스가 접혀도 같은 팀이 같은 문제를 오픈소스로 계속 풀어간다는 선언이다.)

## 댓글

GeekNews(id=36003) 댓글 수는 원문 차단으로 확인하지 못했다. Hacker News Show HN(item id=50092470)이 CoScreen 공동창업자 Jason Thomas 본인 명의로 게시된 것은 확인했으나, **정확한 포인트·댓글 수는 이번 WebSearch로 특정하지 못했다** — "PASS"로 넘기지 않고 미확인으로 남긴다. GitHub 저장소 자체는 이 세션 확인 시점 기준 스타 437개·포크 19개·워처 4명으로, Show HN 직후 초기 반응으로는 작지 않은 규모다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-08-13-zed-delta-multiplayer-agent-coding]]과 "무엇을 실시간으로 복제하는가"에서 정확히 반대쪽 층위에 선다.** Zed의 Delta는 DeltaDB로 **대화와 워크트리(구조화된 텍스트·코드·댓글)** 자체를 모든 참여자에게 실시간 복제해, 코드가 바뀐 뒤에도 댓글이 그 자리에 남아 의도와 결정 맥락이 보존된다. Petal은 그 반대편 극단이다 — 복제하는 건 **창의 픽셀(H.264로 인코딩된 화면 스트림)**이고, 세션이 끝나면 커서 흔적도 그림도 10초 안에 사라지며 "왜 그 창을 공유했는지"는 어디에도 기록되지 않는다. 두 도구를 겹쳐 보면 원격 협업 도구의 설계 공간이 또렷해진다 — **구조화된 상태를 복제하면 맥락이 남지만 공유 대상이 그 도구의 데이터 모델 안에 있어야 하고(Delta는 git 저장소·에이전트 세션), 화면을 복제하면 어떤 앱이든 공유할 수 있지만 그 순간이 지나면 아무것도 남지 않는다(Petal은 브라우저든 터미널이든 상관없이 창이기만 하면 된다).** 범용성과 맥락 보존은 이 설계 공간에서 트레이드오프 관계에 있다.

**핵심 전이 2 — [[2026-09-29-valve-pyrowave-codec-low-latency-streaming]]과 같은 문제(화면을 지연 없이 전송하기)를 정반대 방향으로 푼다.** Pyrowave는 로컬 네트워크 게임 스트리밍을 위해 **대역폭을 기존 코덱의 5~10배 더 쓰는 대신** 프레임 간 압축을 버리고 프레임마다 독립적으로 GPU에서 처리(Discrete Wavelet Transform 기반 intra-frame 인코딩)해 약 10ms의 종단 지연을 달성했다. Petal은 반대로 **하드웨어 H.264**(표준적인 inter-frame 압축, 대역폭 효율적)를 그대로 쓴다 — 창마다 별도 스트림으로 쪼개는 것으로 지연을 관리하지, 코덱 자체를 새로 설계하지는 않는다. 두 선택 모두 "지연을 낮춘다"는 같은 목표를 향하지만, Pyrowave는 LAN이라는 제한된 환경에서 대역폭을 희생해 극한의 지연을 얻고, Petal은 WAN을 포함한 범용 원격 협업 환경에서 대역폭 효율과 범용성(기존 하드웨어 인코더 활용)을 지연보다 우선한다 — **문제가 같아도 배포 환경의 제약이 다르면 코덱 전략이 정반대로 갈린다**는 걸 두 노트가 함께 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**간접 적용 — 내부 개발팀의 원격 페어프로그래밍·장애 대응 협업 도구로는 적합하지만, CRS 제품 자체와는 거리가 멀다.** 온다의 개발팀이 분산 근무 환경에서 코드 리뷰나 장애 대응 중 화면을 공유하며 함께 디버깅할 때, Petal의 "창 단위 공유 + 원격 제어 + 그림으로 가리키기" 조합은 화상회의의 화면 공유(단일 풀스크린 타일)보다 실질적으로 더 나은 선택지가 될 수 있다. 다만 셀프호스팅이 아직 손이 많이 가고 1.0 이전 단계라는 점은 도입 전 검증이 필요하다. CRS 제품(B2B 호스피탈리티 SaaS) 자체에 적용할 접점은 거의 없다 — 이 글에서 가져올 건 도구 선택의 교훈 정도다.

## 연관 자료

- [[2026-08-13-zed-delta-multiplayer-agent-coding]] — 구조화된 상태(대화·워크트리)를 실시간 복제해 맥락을 보존하는 반대쪽 설계. Petal의 화면 복제와 "무엇을 복제하는가"에서 대칭
- [[2026-09-29-valve-pyrowave-codec-low-latency-streaming]] — 같은 "화면을 지연 없이 전송하기" 문제를 LAN 전용으로 대역폭을 희생해 푸는 반대 전략. Petal의 하드웨어 H.264 선택과 코덱 전략이 대조됨

## 한 달 뒤 회고

2026-11-26 즈음, ①Petal의 HN Show HN 반응(포인트·댓글 수·CoScreen 대비 지연 체감 평가)을 확인할 수 있는지 ②GitHub 스타 수가 어느 정도로 늘었는지(초기 Show HN 반응의 지속성 판단) ③Linux 지원이 실제로 추가됐는지 확인한다.
