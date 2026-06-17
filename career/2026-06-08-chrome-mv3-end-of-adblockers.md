---
title: "Chrome의 다음 업데이트, 인기 광고 차단기의 종말 — '광고 회사가 만든 브라우저'의 통제권 역설 (디지털 권리·통제권 라인)"
source_title: "Google Chrome's next update will spell the end of popular ad blockers"
source_url: "https://9to5google.com/"
source_name: "9to5Google · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30554"
published_at: "2026-06-14"
summarized_at: "2026-06-08"
category: "career"
tags: ["chrome", "manifest-v3", "adblock", "digital-rights", "control", "platform-power", "control-line"]
---

# Chrome의 다음 업데이트, 인기 광고 차단기의 종말 — '광고 회사가 만든 브라우저'의 통제권 역설 (디지털 권리·통제권 라인)

> 출처: 9to5Google (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**Google Chrome이 *Manifest V3(MV3) 전환을 완료*하면서 *Manifest V2(MV2) 기반 광고 차단기(uBlock Origin 등)가 더 이상 작동하지 않게* 된다. *Chrome 150(2026-06)·151(2026-07)에서 MV2 우회 플래그가 완전히 제거*돼 ***"마지막 기술적 우회 경로"가 닫힌다***. 단 *다른 Chromium 기반 브라우저(Brave·Edge)는 자체 판단으로 MV2를 계속 지원 가능*하고, *PoPETS '26 논문에 따르면 MV3 광고 차단기의 성능이 MV2보다 "통계적으로 유의미하게 낮지 않다."* 핵심은 기술 세부가 아니라 ***"세계 최대 광고 회사가 만든 브라우저에 광고 차단을 의존하는" 통제권의 역설***이다.**

## 핵심 포인트

- **MV3 전환 = 우회 경로 종료** — *uBlock Origin류의 마지막 기술적 우회가 닫힘*(Chrome 150·151).
- **통제권 역설** — 댓글: ***"광고 회사가 광고 차단기를 없애다니 — 누가 상상이나"***·*"세계 최대 광고 회사가 만든 브라우저를 고르면서 광고 차단이 영원할 거라 믿다니"*. **[[2026-06-01-my-software-north-star]] *벤더 러그풀*·[[2026-06-08-open-source-ai-must-win]] *플랫폼 종속*의 브라우저 버전** — *플랫폼 소유자의 이해(광고)와 사용자 이익(차단)의 충돌*.
- **효과 논쟁 — MV3도 충분?** — *PoPETS '26: MV3 차단 성능이 MV2보다 유의미하게 낮지 않음, uBO Lite는 충분*. 단 *특정 사이트 JS 선택 차단 불가·목록 업데이트 덜 잦음*.
- **대안 = 통제권 회수** — *Brave 같은 프로젝트가 늘 것*, *Firefox는 MV3 따라잡나*. **사용자가 통제권을 자기 쪽으로 회수**.

## 인상 깊은 문장

> "Who could have imagined an ad company would kill ad blockers?"
> (광고 회사가 광고 차단기를 없앨 거라고 누가 상상이나 했겠나?)

## Lobste.rs 토론 (댓글 전수 확인)

> GN⁺가 Lobste.rs를 큐레이션. **확인:**
- ***"광고 회사가 광고 차단기를 없앤다 — 누가 상상이나"*** (역설), *"광고 회사 브라우저를 고르면서 차단이 영원하리라 믿다니"*.
- *Chrome은 회사에서만 쓰고 uBO Lite 설치, YouTube·Twitch에 주로 영향*. 답글: ***"PoPETS '26: MV3 차단이 MV2보다 효과 유의미하게 낮지 않음, uBO Lite 충분(단 JS 선택 차단 불가)"***·*"MV3 차단기가 탐색 기록을 안 새게 하면서 잘 작동"*.
- ***"결국 Brave 같은 프로젝트가 더 늘어날 것"***·*"Firefox는 MV3 개인정보 이점을 따라잡을 계획이 있나"*.

→ **토론 무게중심**: *(1) **"광고 회사 브라우저에 차단을 의존한" 통제권 역설**이 핵심 정서. (2) **기술적으론 MV3 차단(uBO Lite)도 충분**(PoPETS). (3) **대응은 Brave·Firefox로의 이탈**(통제권 회수).*

## 내 생각 · 적용점

### 5번째 라인업 *디지털 권리·통제권 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *플랫폼 권력과 사용자 통제권*. 라인 자산(카운팅 무관). 부채 *0 유지* (50:39 ≈ 1.28:1).

### 핵심 전이 1 — "플랫폼 소유자의 이해 ≠ 사용자 이익"

가장 전이력 높은 교훈: ***플랫폼 소유자의 사업 모델(광고)이 사용자 도구(차단)와 충돌할 때, 결국 소유자가 이긴다***. 이는 [[2026-06-01-my-software-north-star]] *벤더 러그풀*·[[2026-06-08-fable-guardrails-cybersecurity-backlash]] *벤더가 능력을 조용히 회수*·[[2026-06-08-open-source-ai-must-win]] *"인지의 구독 경제"*의 같은 줄기 — **중요한 능력을 "이해가 충돌하는 플랫폼"에 의존하면 언젠가 회수된다**. [[2026-06-01-age-verification-end-of-free-internet]]·[[2026-06-01-korea-mandatory-ai-image-censorship]] *디지털 권리 축소*와 정합.

### 핵심 전이 2 — 통제권 회수 = 오픈/대안으로의 이탈

대응이 *Brave·Firefox로의 이탈*인 것은 [[2026-06-08-open-source-ai-must-win]] *통제권 회수*·[[2026-06-08-social-media-ceased-to-be-social]] *플랫폼 이탈*과 동형 — **"이해가 충돌하지 않는 대안"을 두는 것이 디지털 권리의 방어**. AI 도구에도 적용: *벤더 이해와 충돌하는 핵심 기능(검열 회피·데이터 주권)은 오픈/로컬 대안*([[2026-06-08-running-local-models-got-good]]).

### 핵심 전이 3 — "기술적으론 충분, 정서적으론 통제권 상실"

*MV3 차단도 PoPETS상 충분*한데도 반발이 큰 건 **"성능 손실"보다 "통제권 상실"이 핵심**임을 보여줌. [[2026-06-08-fable-guardrails-cybersecurity-backlash]] *"사과 후에도 남는 불신"*과 같은 구조 — *기능이 유지돼도, "플랫폼이 내 도구를 좌우한다"는 사실 자체가 신뢰를 깸*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *디지털 권리·통제권 라인* 사례 추가. 부채 *0 유지* (50:39).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- 9to5Google (원문) · [GeekNews — 30554](https://news.hada.io/topic?id=30554)
- [[2026-06-01-my-software-north-star]]·[[2026-06-08-open-source-ai-must-win]] — *벤더 러그풀·플랫폼 종속(통제권)*
- [[2026-06-08-fable-guardrails-cybersecurity-backlash]] — *벤더가 능력을 회수·"통제권 상실"이 신뢰를 깸*
- [[2026-06-01-age-verification-end-of-free-internet]]·[[2026-06-01-korea-mandatory-ai-image-censorship]] — *디지털 권리 축소*
- [[2026-06-08-social-media-ceased-to-be-social]]·[[2026-06-08-running-local-models-got-good]] — *플랫폼 이탈·오픈/로컬 대안(통제권 회수)*

## 한 달 뒤 회고
*(2026-07-14 즈음 — MV2 제거(Chrome 150·151) 후 Brave·Firefox 이탈이 실제로 늘었는지, "기술적 충분 vs 통제권 상실"의 정서가 어떻게 정리됐는지, AI 도구 선택에 "벤더 이해 충돌" 경계를 적용했는지 기록.)*
