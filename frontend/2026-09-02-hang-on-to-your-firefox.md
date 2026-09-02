---
title: "Firefox를 놓지 마라 (Mark Rogers, Newsonaut) — X 계정이라는 사소한 불만에 화내다 엔진 다양성이라는 더 큰 가치를 버리는 오류"
source_title: "Hang on to your Firefox!"
source_url: "https://www.newsonaut.com/articles/hang-on-to-your-firefox"
source_name: "Newsonaut (Mark Rogers) · HN 교차 확인"
referrer_url: "https://news.hada.io/topic?id=33139"
published_at: "확인 불가"
summarized_at: "2026-09-02"
category: "frontend"
tags: ["firefox", "browser-engine", "chromium", "vivaldi", "platform-power", "web-platform", "digital-rights"]
---

# Firefox를 놓지 마라 (Mark Rogers, Newsonaut)

> 출처: [Hang on to your Firefox!](https://www.newsonaut.com/articles/hang-on-to-your-firefox) (Mark Rogers · Newsonaut, HN 경유 확산) · 정리일 2026-09-02
> **출처 한계**: `news.hada.io`·`www.newsonaut.com`·`news.ycombinator.com` 모두 이 세션 내내 egress 차단되어 원문·GeekNews 페이지·HN 스레드를 직접 열지 못했다. 아래 내용은 Slack 발췌 4줄 + WebSearch로 확보한 2차 인용·요약을 교차 대조해 재구성한 것이다. HN 스레드 존재는 확인했지만(`item?id=49527748`) 포인트·댓글 수("390점·739댓글")는 검색엔진이 합성해 제시한 값이라 신뢰도를 낮게 잡아야 한다.

## 한 줄 요약

**Firefox가 X(트위터)에 공식 계정을 운영한다는 이유로 브라우저 자체를 버리는 건, 작은 불만을 피하려다 "독립 브라우저 엔진의 존속과 시장 경쟁"이라는 훨씬 큰 가치를 잃는 선택이라는 게 저자의 요지다.** 대안으로 자주 거론되는 Vivaldi 역시 X뿐 아니라 Threads·Facebook·Instagram·YouTube에서 활발히 계정을 운영하고, **엔진 자체도 Google이 주도하는 Chromium 기반**이다. Firefox(Gecko)가 시장에서 완전히 밀려나면 주류 브라우저는 사실상 Chrome과 그 파생 Chromium 기반 브라우저들로 수렴하고, **다른 독립 엔진은 Apple Safari(WebKit)만 남는다.**

## 핵심 포인트

- **문제 제기의 구조**: 어떤 유명 블로거가 "Firefox가 X에 계정을 운영한다"는 이유로 Vivaldi로 갈아탔다는 사례를 저자가 반박의 출발점으로 삼는다.
- **대안의 모순**: Vivaldi도 X·Threads·Facebook·Instagram·YouTube에 계정을 두고 있다.
- **엔진 층위의 모순이 더 크다**: Vivaldi는 UI·기능은 독자적이지만 **렌더링 엔진은 Google이 관리하는 Chromium**이다.
- **엔진 다양성의 위기**: Firefox(Gecko)가 사라지면 남는 독립 크로스플랫폼 엔진은 **Apple Safari(WebKit)**뿐이다.
- **점유율 추세**: Firefox의 전 세계 점유율은 이미 낮고 계속 하락 중.
- **저자의 결론(추정)**: 사소한 불만과 구조적 가치를 저울질할 때, 후자를 위해 전자는 참을 만하다.

## 인상 깊은 문장

> Slack 발췌: **"작은 불만을 피하려다 독립 브라우저 엔진과 시장 경쟁이라는 더 큰 가치를 잃게 됨"**

> WebSearch로 확보한 2차 인용: **"Firefox is our last best hope for browser engine diversity and competition. Without it we would be stuck with Google Chrome and its spinoffs everywhere (including Vivaldi)."**

## 댓글

**hada 댓글 수 확인 불가.** GeekNews 페이지 자체를 egress 차단으로 열지 못했다.

**HN 큐레이션(간접 확인)**: HN에 해당 글 스레드가 존재하는 것은 확인했다(item?id=49527748). 검색엔진이 합성해 제시한 수치로는 점수 390·댓글 739로 나오지만, 원문 스레드를 직접 열어 확인한 값이 아니므로 근거로 삼기엔 약하다.

**읽을 때 감안**: ①원문·HN·hada 페이지 모두 이 세션에서 직접 열람 불가. ②저자가 비판하는 "블로거" 특정 실패. ③HN 참여 수치는 검증 신뢰도가 낮다.

## 내 생각 · 적용점

### 핵심 전이 1: 이번 시즌 세 번째로 만나는 "Chromium 집중" 축이다

- [[2026-09-01-chrome-web-store-removes-mv2-extensions]]: Google이 Chrome 웹 스토어에서 MV2 확장 전체를 삭제 — 검색·재설치 경로 자체를 없앤 것.
- [[2026-06-08-chrome-mv3-end-of-adblockers]]: Chrome의 MV3 강제 전환으로 MV2 기반 광고 차단기가 작동을 멈춤 — "광고 회사가 만든 브라우저에 광고 차단을 의존하는" 통제권 역설.

앞의 둘은 Chromium 생태계 안에서 Google이 무엇을 할 수 있는지를 보여줬다. 이 글은 그 앞 단계 질문을 던진다 — 애초에 Chromium 바깥의 대안이 얼마나 남아 있는가. **Chromium 집중이 심해질수록 "다른 엔진으로 가면 된다"는 선택지 자체가 좁아진다는 구조**가 보인다. 이 글의 경고는 그 좁아짐의 마지막 밸브가 사용자들의 사소한 불만에 의한 이탈로 스스로 닫힐 수 있다는 것.

### 핵심 전이 2: [[2026-08-27-firefox-jpeg-xl-default-support]]가 이 글의 전제 하나를 보강한다

Firefox는 여전히 Gecko 엔진에 실제 엔지니어링 투자를 계속하고 있다(Rust로 새 디코더 `jxl-rs`를 새로 짜서 Safari를 따라잡는 수준). 점유율 감소와 엔진의 실질적 죽음은 다른 이야기라는 반증 사례다.

## 호스피탈리티 / CRS 적용 포인트

브라우저 엔진 선택 자체는 온다 업무와 직접 접점이 없다. **직접 적용은 멀다는 걸 먼저 밝힌다.** 전이 가능한 것은 판단 프레임 하나뿐이다 — **"당장의 사소한 불만"과 "그 불만 때문에 포기했을 때 잃는 구조적 가치"를 구분하는 습관.** CRS가 특정 채널사·PMS 파트너·클라우드 벤더에 사소한 불만이 쌓였을 때, 그 불만을 이유로 유일하게 남은 대안 자체를 걷어차면 결과적으로 남는 선택지가 단일 벤더로 좁혀질 수 있다.

## 연관 자료
- [[2026-09-01-chrome-web-store-removes-mv2-extensions]] — Chromium 생태계 안에서 Google의 결정권이 얼마나 큰지 보여주는 바로 다음 단계 사례
- [[2026-06-08-chrome-mv3-end-of-adblockers]] — 같은 "광고 회사가 만든 브라우저" 통제권 역설의 앞선 사례
- [[2026-08-27-firefox-jpeg-xl-default-support]] — Firefox가 점유율 감소 속에서도 엔진에 실질 투자를 계속한다는 반증

## 한 달 뒤 회고
*(2026-10-02 즈음: ①원문·HN 스레드를 직접 열어 수치와 실제 댓글 논조를 확인했는지 ②저자가 언급한 "Vivaldi로 갈아탄 블로거"가 누구인지 특정됐는지 ③이후 Firefox 점유율이 실제로 더 떨어졌는지 ④이 계열 노트가 네 번째 사례로 더 이어지는지)*
