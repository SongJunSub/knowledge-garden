---
title: "오프라인 LG TV를 연결했을 때 Windows의 제조사 앱 설치를 막는 방법 (S-Config) — EDID는 TV가 아니라 항상 인터넷에 연결된 PC를 통해 소프트웨어를 끌어온다"
source_title: "Stopping the smart TV from being used against you."
source_url: "https://www.s-config.com/stopping-a-smart-tv-from-being-used-against-you/"
source_name: "s-config.com"
referrer_url: "https://news.hada.io/topic?id=33042"
published_at: "2026-08-28"
summarized_at: "2026-08-31"
category: "engineering"
tags: ["windows", "edid", "privacy", "bloatware", "windows-update", "hdmi", "smart-tv", "device-metadata"]
---

# 오프라인 LG TV를 연결했을 때 Windows의 제조사 앱 설치를 막는 방법 (S-Config)

> 출처: [Stopping the smart TV from being used against you.](https://www.s-config.com/stopping-a-smart-tv-from-being-used-against-you/) (S-Config) · 정리일 2026-08-31
>
> **출처 한계**: `s-config.com`·`news.hada.io`·`lobste.rs`·`news.ycombinator.com` 전부 이번 세션 egress 차단으로 직접 fetch가 막혀 원문을 한 글자도 읽지 못했다. 아래 내용은 WebSearch 스니펫을 여러 차례 교차 조회해 재구성한 것이다. 인용부호로 옮긴 문장도 검색 스니펫 표현을 그대로 옮긴 것이나 **전체 맥락 대조 검증은 못했다.** 저자는 필명 "S"(S-Config)로만 활동하며 실명은 검색으로 확인되지 않는다.

## 한 줄 요약

**완전히 오프라인인 LG TV를 HDMI로 Windows PC에 연결하기만 해도, 디스플레이가 보내는 EDID(제조사·모델·해상도 등 식별 정보)가 Windows의 장치 메타데이터 파이프라인을 건드려 LG 동반 앱과 McAfee 같은 추가 소프트웨어 설치 유도가 시작된다. 소프트웨어는 TV가 아니라 이미 인터넷에 연결된 PC 쪽에서 Windows Update를 통해 받아오므로, TV의 Wi-Fi를 끄거나 네트워크에서 차단해도 이 설치 경로 자체는 그대로 남는다. 저자는 Windows 내장 설정·그룹 정책·하드웨어 EDID 블로커까지 여러 층위의 차단법을 검토하되, 정작 가장 신뢰하는 처방은 "애초에 스마트 기기에 인터넷을 주지 않는 것"이라는 회의적인 결론을 내린다.**

## 핵심 포인트

- **EDID의 원래 역할** — 디스플레이가 소스 기기에 보내는 표준 식별 정보(제조사, 모델, 지원 해상도 등)일 뿐이다. 그런데 Windows는 이 정보를 장치 메타데이터와 대조해 해당 제조사용 드라이버·동반 앱을 자동으로 내려받는 ***트리거***로 쓴다.
- **TV가 오프라인이어도 무관** — HDMI로 연결하는 순간 이 절차가 시작된다. TV의 Wi-Fi가 꺼져 있든, 네트워크에서 완전히 차단돼 있든 상관없다. ***소프트웨어는 TV가 아니라 항상 인터넷에 연결된 PC 쪽에서 Windows Update를 통해 받아오기*** 때문에, TV 쪽 네트워크 차단은 이 설치 경로를 막지 못한다.
- **실제 사례와의 연결** — 2026년 7월 LG 모니터가 같은 파이프라인으로 McAfee 체험판 팝업(재부팅 32회 중 31회 노출된 사례까지 보도됨)을 설치시켜 논란이 된 바로 그 메커니즘이 TV에도 그대로 적용된다는 것이 이 글의 핵심 지적.
- **소프트웨어 차원 차단법** — Windows 설정 > 시스템 > 정보 > 고급 시스템 설정 > 하드웨어 탭 > "장치 설치 설정"에서 "제조사 앱·사용자 지정 아이콘 자동 다운로드"를 끄는 것이 가장 접근성 좋은 방법. Pro 이상 에디션은 그룹 정책(`gpedit.msc` → 컴퓨터 구성 > 관리 템플릿 > 시스템 > 장치 설치 > "장치 메타데이터와 연결된 애플리케이션의 자동 다운로드 방지")으로, Home 에디션은 레지스트리(`HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions`)로 강제할 수 있다.
- **하드웨어 차원 차단법** — HDMI/DisplayPort 사이에 EDID 블로커·에뮬레이터를 끼워 TV의 실제 EDID를 감추고 표준 EDID로 대체하는 방법. 다만 저자는 저가형 제품 다수를 ***"전선 몇 가닥 억지로 이어붙여 블로커인 척하는 것"***이라 혹평하며, 정품 DisplayPort EDID 에뮬레이터는 $50~150로 비싸다고 솔직하게 밝힌다.
- **저자의 최종 태도는 회의적** — 개별 설정보다 원천 차단을 더 신뢰하는 뉘앙스로 "어떤 스마트 기기에도 인터넷을 주지 말고, Microsoft가 손대지 않은 방화벽을 쓰라"는 근본적 처방까지 제시한다.

## 인상 깊은 문장

> "Never give ANY smart device internet. Have a good firewall that Microsoft never touched." (검색 스니펫에서 확인된 표현, 전후 맥락 대조는 못함)

> 저가 EDID 블로커에 대해 "just a bunch of wires, shit-soldered together... to pass it off as an actual blocker" (검색 스니펫에서 확인된 표현, 전후 맥락 대조는 못함)

> "This happens even when the TV itself is offline — it's the act of connecting the display that triggers the identification and subsequent software installation." (WebSearch 결과 재구성 문장, 저자 원문 그대로일 가능성 높으나 검증은 못함)

## 댓글

**Lobsters에 게시(https://lobste.rs/s/nfvukc/) — 태그 hardware/networking/security, 2026-08-28 제출, 댓글 12개** 확인. 제출자는 FedericoSchonborn으로 검색 확인됨. **Hacker News에도 별도 게시됨(item id=49483816)** — 검색 시점(2026-08-31 근처) 기준 "1일 전" 상태로 확인되나, **정확한 포인트·댓글 수는 이번 세션에서 끝내 확인하지 못했다.** GeekNews 자체 댓글 수·자체 큐레이션 방식은 hada.io 접근 차단으로 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "소유했지만 통제하지 못한다"는 정확히 같은 구조

[[2026-08-25-reverse-engineering-my-peripherals-ownership]]가 "값을 치렀다고 그 기기의 동작을 실제로 통제하는 건 아니다"라고 했던 것과 이 글은 사실상 같은 사건을 다른 침입 경로로 보여준다. 그 글은 기기 자체의 펌웨어(마이크·웹캠·모니터)를 문제 삼았고, 이 글은 기기를 "연결"만 해도 PC 쪽에서 자동으로 열리는 OS 파이프라인을 문제 삼는다. 소유권 침식이 기기 안에서만 일어나는 게 아니라, 기기를 물리적으로 연결하는 행위 자체가 트리거가 될 수 있다는 걸 이 글이 확인해준다.

### 핵심 전이 2 — "기본값이 사용자를 어떻게 대하는지 드러낸다"의 가장 노골적인 사례

[[2026-07-12-month-with-windows-11-defaults-as-philosophy]]가 다룬 강제 온라인 계정·동의 없는 텔레메트리 같은 사용자 자율 침식과 정확히 같은 축이다. 그 글이 "기본값 자체가 제품 철학"이라 결론 내렸는데, 이 글은 그 철학이 "TV를 연결하기만 해도 OEM에게 소프트웨어 설치 권한을 자동으로 내주는" 수준까지 간다는 걸 구체적 사례로 확인해준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 온다는 호텔 객실 TV의 OEM 앱이 프런트 PC에 뭘 설치하는지 관리하지 않으며, EDID·Windows 장치 메타데이터 파이프라인은 CRS 업무와 접점이 없다. 다만 이 글이 보여주는 패턴 자체 — ***"정상적으로 보이는 동작(장치 연결)이 이용자 동의 없이 제3자 소프트웨어 설치로 이어진다"*** — 는 온다가 파트너 호텔에 제공하는 연동(PMS 연동, OTA 채널 연동 등)에서 "연결만 했을 뿐인데 예상 못한 부수 효과가 발생하는" 지점이 없는지 점검할 근거로는 쓸 수 있다. 억지로 직접 사례를 만들기보다, 경계해야 할 패턴의 유비로만 남긴다.

## 연관 자료

- [[2026-08-25-reverse-engineering-my-peripherals-ownership]] — "소유는 통제가 남아있을 때만 성립한다"는 같은 결론을 다른 침입 경로(펌웨어 vs 연결 트리거)로 확인
- [[2026-07-12-month-with-windows-11-defaults-as-philosophy]] — Windows 기본값이 사용자 자율을 침식하는 동일 계열의 사례

## 한 달 뒤 회고

*(2026-09-30 즈음 — 이 글에서 소개된 Windows "장치 설치 설정" 끄기를 실제로 사내/개인 PC에 적용해봤는지, 온다가 제공하는 연동 중 "연결만으로 예상 못한 부수 효과"가 발생하는 지점이 있는지 한 번이라도 점검해봤는지 기록.)*
