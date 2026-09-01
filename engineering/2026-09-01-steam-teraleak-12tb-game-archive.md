---
title: "Steam의 12TB 게임 자료 유출, 사라진 베타와 프로토타입이 공개되다 — '유출'이 아니라 10년 넘게 열려 있던 공개 엔드포인트였다"
source_title: "A 12TB Steam 'Teraleak' Spills More Than a Decade of Lost PC Gaming History"
source_url: "https://www.tomshardware.com/video-games/pc-gaming/massive-12tb-steam-leak-reveals-decades-of-unreleased-games-archived-files-include-unseen-half-life-2-episode-3-builds-and-assets"
source_name: "Tom's Hardware (교차 확인: TheGamer, GodIsAGeek, HardwareBusters)"
referrer_url: "https://news.hada.io/topic?id=33077"
published_at: "2026-08-29~30 (주말 사이 확산 — 정확한 최초 게시 시각은 확인 불가)"
summarized_at: "2026-09-01"
category: "engineering"
tags: ["data-leak", "game-archive", "digital-preservation", "public-endpoint", "steam", "valve", "security-hygiene"]
---

# Steam의 12TB 게임 자료 유출, 사라진 베타와 프로토타입이 공개되다

> 출처: [A 12TB Steam "Teraleak" Spills More Than a Decade of Lost PC Gaming History](https://www.tomshardware.com/video-games/pc-gaming/massive-12tb-steam-leak-reveals-decades-of-unreleased-games-archived-files-include-unseen-half-life-2-episode-3-builds-and-assets) (Tom's Hardware 등) · 정리일 2026-09-01
> **출처 한계**: `news.hada.io`·`tomshardware.com`이 이 세션 내내 egress 차단되어 원문을 직접 읽지 못했다. Slack 발췌와 WebSearch로 확보한 복수 매체(Tom's Hardware, TheGamer, GodIsAGeek, GamesRadar, HardwareBusters)의 2차 요약을 교차 대조했다. 가벼운 리소스성 기사로 판단해 억지로 깊은 전이를 만들지 않는다.

## 한 줄 요약

**"Steam 테라리크(Teraleak)"라 불리는 12~13TB 규모의 자료가 BitTorrent로 공개돼, 2003~2013년 옛 Steam2 인프라를 거쳐간 정식판·미공개 베타·프로토타입·플레이테스트 빌드가 대거 드러났다.** 그런데 이 사건의 진짜 요점은 유출 규모가 아니라 **경위**다 — 해커의 침입이 아니라, **10년 넘게 아무 인증 없이 그대로 열려 있던 공개 엔드포인트**를 누군가 우연히 발견해 통째로 긁어간 것이다.

## 핵심 포인트

- **규모와 시대 범위** — 12~13TB, **2003~2013년** Steam2 인프라에 올라온 콘텐츠의 근-완전한 스냅샷. 2013년 SteamPipe 전환 이후 Valve가 더 이상 배포하지 않던 옛 버전들이 대거 포함됨.
- **경위 = 해킹이 아니라 방치된 공개 접근** — Valve 데이터마이너 Gabe Follower가 출처를 검증한 결과, **덤프 전체가 인증 없이 도달 가능한 공개 엔드포인트**를 통해 나왔다고 확인. ***"패스워드도, 익스플로잇도 없다. 그냥 응답하는 주소를 찾았고, 계속 응답했다."***
- **공개된 콘텐츠** — Portal 2의 삭제된 GLaDOS 대사·Cave Johnson 장면, **더 인간에 가까운 초기 GLaDOS 모델**과 다른 목소리·애니메이션, 원형 포탈·끈적한 젤·시간 감속 무기 같은 초기 아이디어. Left 4 Dead 2, 초기 CS:GO 빌드, 취소된 카메라 퍼즐 게임 F-Stop, Half-Life 2: Episode 3 관련 파일 흔적까지 확인됨.
- **Valve 외 게임도 포함** — Spore, Dragon Age: Origins 등 Steam2를 거친 서드파티 타이틀의 옛 빌드도 함께 노출.
- **보존 가치 vs 저작권 이슈** — 라이브 서비스 게임의 옛 버전은 원래 희귀해서 게임 역사 보존 측면의 가치가 크다는 평가가 있는 동시에, Valve·서드파티 퍼블리셔의 저작권 자산이 무단 유통된다는 문제도 함께 있음(원문에서 Valve의 공식 대응은 이번 정리 시점에 확인되지 않음).

## 인상 깊은 문장

> "The Steam Teraleak was obtained from a site that was 100% accessible to the public. It was there for everyone to download. No passwords. Nothing. Hidden in plain sight, but with no protection whatsoever."
> (2차 매체가 인용한 검증자(Gabe Follower)의 코멘트로 확인 — 원문 1차 인터뷰 대조는 못 함)

## 댓글

**Hacker News 스레드 존재 확인**(item id=49506182) — 이 세션에서 원문 댓글은 열람하지 못했다. WebSearch로 파악된 논조 하나 — **"라이브 서비스 게임의 옛 버전은 원래 희귀해서, 이 유출이 보존 관점에서 의미가 크다"**는 코멘트가 눈에 띄었다는 정도이며, 반대·비판 의견의 비중은 확인하지 못했다. **hada 자체 댓글 수·GN⁺ 큐레이션 여부는 확인 불가**(news.hada.io 차단).

## 내 생각 · 적용점

이 글은 가벼운 리소스성 뉴스로 다루는 게 맞다고 판단해, 억지로 깊은 전이를 만들지 않는다. 다만 한 가지는 짚을 만하다 — **"유출(leak)"이라는 단어가 주는 인상(누군가 뚫었다)과 실제 경위(누구도 잠그지 않았다)의 간극**이다. 이건 이번 시즌 반복해서 봐 온 보안 사고들의 흔한 패턴과 결이 같다 — 화려한 침투가 아니라 **오래 방치된 기본 설정**이 원인인 경우가 훨씬 흔하다는 것. 다만 이 글 자체에서 그 이상의 구체적 기술 교훈(어떤 프로토콜이었는지, 왜 10년간 아무도 못 찾았는지)은 확인하지 못했으므로, 이번 정리에서는 여기까지만 남긴다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 게임 배포 인프라의 레거시 아카이브 이야기이고, CRS의 예약·재고 데이터와는 도메인이 다르다. 굳이 전이 가능한 원칙 하나만 남기면: **"10년 넘게 아무도 들여다보지 않은 레거시 엔드포인트가 여전히 열려 있을 수 있다"**는 사실 자체는 어떤 시스템에도 적용되는 위생 점검 항목이다 — CRS에도 과거 마이그레이션 이전의 옛 API·스토리지 경로가 인증 없이 살아있는지 주기적으로 확인할 가치가 있다는 정도로만 남긴다.

## 연관 자료

이번 사건과 진짜로 연결되는 기존 노트를 가든에서 찾지 못했다 — 억지로 연결하지 않는다.

## 한 달 뒤 회고

*(2026-10-01 즈음 — ①Valve의 공식 입장이나 대응이 나왔는지, ②egress 차단이 풀려 HN 스레드의 실제 논조를 확인했는지, ③저작권 문제로 토렌트·미러가 내려갔는지 기록.)*
