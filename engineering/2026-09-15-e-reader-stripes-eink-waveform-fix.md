---
title: "내 전자책 리더의 줄무늬를 없앤 과정 (Bryan O'Sullivan) — 문제는 소프트웨어 버그가 아니라 화면 자체를 움직이는 전압 파형이었다"
source_title: "How my e-reader lost its stripes"
source_url: "https://www.serpentine.com/posts/2026/x3-stripes/"
source_name: "teideal glic deisbhéalach (serpentine.com)"
referrer_url: "https://news.hada.io/topic?id=33717"
published_at: "2026-09 (추정)"
summarized_at: "2026-09-15"
category: "engineering"
tags: ["e-ink", "waveform", "hardware-debugging", "xteink", "ai-assisted-debugging", "image-processing", "firmware"]
---

# 내 전자책 리더의 줄무늬를 없앤 과정 (Bryan O'Sullivan)

> 출처: [How my e-reader lost its stripes](https://www.serpentine.com/posts/2026/x3-stripes/) (Bryan O'Sullivan · teideal glic deisbhéalach, serpentine.com) · GeekNews(id=33717) 경유 · 정리일 2026-09-15

> **출처 한계**: `serpentine.com`·`news.hada.io`·`news.ycombinator.com` 모두 이 세션 egress 프록시에서 차단돼 원문·HN 토론을 직접 열람하지 못했다. WebSearch로 원문 URL·저자(Bryan O'Sullivan, Haskell 커뮤니티에 잘 알려진 개발자이자 『Real World Haskell』 공저자)를 확인했고, 핵심 기술 내용(줄무늬 원인, XTH4 파형 전환, 밝기 편차 수치)은 2회 이상의 독립적 검색에서 일관되게 확인했다. 다만 원문 전체 문장·정확한 인용 문맥, HN·Lobsters 댓글 수와 논조는 대조하지 못했다.

## 한 줄 요약
**저자는 자신의 Xteink X3 전자책 리더 그레이스케일 이미지에서 미세한 세로 줄무늬를 발견하고, 화면을 촬영해 AI 코딩 도구(GPT-6 Astra Codex)와 함께 분석한 끝에 원인이 소프트웨어 렌더링 버그가 아니라 ***e-ink 화면을 움직이는 전압 파형(waveform) 자체***에 있음을 밝혀냈다. 제조사가 드라이버에 이미 넣어뒀지만 쓰지 않던 4단계 그레이스케일 파형(XTH4)으로 바꾸자 줄무늬 원인이던 밝기 편차가 4%에서 1%로 줄고 줄무늬가 사라졌다 — 대신 페이지 전환마다 파형 지속시간이 늘어 반응이 느려지는 트레이드오프를 얻었다.**

## 핵심 포인트
- **증상** — 그레이스케일 이미지에서 특정 밝기의 회색 픽셀이 다른 밝기의 이웃 픽셀과 맞닿을 때 ***8픽셀 주기의 미세한 세로 줄무늬***가 배경에 나타났다.
- **1차 용의선상은 소프트웨어였다** — 이미지 뷰어의 그레이스케일 처리 로직을 먼저 의심해 점검했고, 그 과정에서 진한 회색이 검정으로 잘못 렌더링되는 별개의 버그 하나를 실제로 찾아 고쳤다 — 그러나 줄무늬 자체의 원인은 아니었다.
- **AI를 분석 파트너로 썼다** — X3 화면을 폰으로 촬영해 GPT-6 Astra Codex 세션에 이미지를 넣어 분석을 맡겼고, ***AI 코딩 도구가 코드 분석과 실험 구현을 담당하는 동안 사람은 측정 대상과 실험 방향을 교정***하는 역할 분담으로 작업했다.
- **근본 원인은 e-ink의 구동 파형** — e-ink 화면은 전압 펄스로 안료 입자를 움직이는데, CrossPoint(팬 제작 오픈소스 펌웨어)의 그레이스케일 파형("nudge")이 특정 픽셀을 흰색 쪽으로 부분 이동시켜 밝기 단계를 만든다 — 이 파형 설계 자체가 이웃 픽셀 조합에 따라 미세한 밝기 편차를 만들어냈다.
- **해법은 제조사가 이미 넣어둔 다른 파형으로 전환** — 드라이버에 이미 있었지만 쓰이지 않던 제조사의 4단계 그레이스케일 모드 ***XTH4***로 바꾸자, 열(column) 밝기 편차가 흑백 밝기 범위의 ***약 4%에서 약 1%***로 줄었고 패턴 테스트·실사진 분석에서 8픽셀 주기의 밝기 피크가 사라졌다.
- **트레이드오프는 속도** — XTH4는 펄스 시퀀스가 훨씬 길어 새로고침에 ***약 1초***가 걸린다 — 사진이나 절전화면에는 괜찮지만, 모든 페이지 전환에 쓰면 매번 거슬리는 지연이 생긴다는 것이 저자의 판단이다.

## 인상 깊은 문장
> "e-ink screens use voltage pulses to move pigment particles... CrossPoint displays greyscale by running a voltage-pulse waveform called a 'nudge' to move selected pixels partway towards white for different amounts of time to produce dark and light shades of grey."
> (WebSearch 스니펫 재구성 — 원문 문장 그대로인지 단어 단위까지는 대조하지 못했다.)

## 댓글
`serpentine.com`·`news.hada.io`·HN(`news.ycombinator.com`, item id=49699489) 접속이 모두 차단돼 hada 댓글 수, HN 포인트·댓글 논조를 직접 확인하지 못했다. 다만 WebSearch로 이 글이 ***Hacker News와 Lobsters 양쪽에 모두 등록***돼 있음은 확인했다 — 하드웨어 애호가 커뮤니티에서 관심을 끈 글이라는 정황 증거는 있지만, 정확한 포인트·댓글 수는 미확인이다. 저자 개인의 취미 기기 하나(n=1)에 국한된 디버깅 기록이라 다른 e-ink 기기·다른 파형에 일반화될지는 알 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 기기([[2026-09-08-xteink-x3-e-ink-phone-case-reader]])를 완전히 다른 각도에서 다시 만난다
그 노트는 Xteink X3를 "화면이 작고 기능이 적을수록 오히려 몰입이 깊어진다"는 제품 철학으로 가볍게 정리하며 CRS 적용점은 없다고 밝혔었다. 이 글은 같은 기기를 소비자 리뷰가 아니라 ***그 기기의 결함을 직접 고치는 사용자-개발자***의 시점에서 다시 보여준다 — 저가·저사양 기기라도 오픈소스 펌웨어(CrossPoint) 생태계가 있으면 제조사가 방치한 결함을 사용자가 직접 추적해 고칠 수 있다는 것을, 앞선 노트가 언급만 하고 지나간 "Crosspoint 오픈소스 펌웨어"의 구체적 실례로 보여준다.

### 핵심 전이 2 — "AI를 리버스 엔지니어링 파트너로 쓴다"는 같은 작업 방식, 다른 대상
[[2026-08-25-reverse-engineering-my-peripherals-ownership]]는 Claude Opus 5를 파트너 삼아 주변기기 펌웨어를 역공학해 벤더가 숨긴 동작(활동 LED 끄기, 서명 검증 우회 등)을 밝혀냈다. 이 글도 구조가 같다 — ***사람이 문제(줄무늬)와 실험 방향을 정하고, AI가 이미지·코드 분석의 반복 작업을 떠맡는다.*** 다만 목적은 다르다 — 저쪽은 "벤더가 숨긴 통제권을 되찾는" 보안·소유권 문제였고, 이 글은 "제조사가 이미 제공했지만 안 쓰던 옵션을 찾아 켜는" 튜닝 문제에 가깝다. 같은 방법론(AI 보조 하드웨어 디버깅)이 서로 다른 무게의 문제에 똑같이 쓰이고 있다는 점이 이 시기 반복되는 패턴으로 보인다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다 — e-ink 파형 튜닝은 CRS 도메인과 접점이 없는 소비자 하드웨어 디버깅이다. 다만 전이 가능한 원칙 하나는 남는다: ***"버그처럼 보이는 증상의 원인이 반드시 우리가 짠 코드 층에 있는 건 아니다"*** — 이 글에서 저자는 이미지 렌더링 코드를 먼저 의심했지만 실제 원인은 훨씬 아래 층(하드웨어 구동 파형)에 있었다. CRS에서도 UI·API 로직을 먼저 의심하기 쉬운 이상 현상(예: 특정 채널·특정 통화에서만 나타나는 요금 반올림 오차)이 실제로는 더 아래 층(외부 연동 프로토콜, 캐시 계층, DB 정밀도 설정)에서 비롯될 수 있다는 점을 상기시키는 정도의 원칙이다.

## 연관 자료
- [[2026-09-08-xteink-x3-e-ink-phone-case-reader]] — 같은 기기(Xteink X3)를 소비자 리뷰 관점에서 먼저 다룬 노트
- [[2026-08-25-reverse-engineering-my-peripherals-ownership]] — AI를 하드웨어 분석 파트너로 쓰는 같은 작업 방식, 다른 목적(소유권 회복 vs 튜닝)

## 한 달 뒤 회고
*(2026-10-15 즈음 — `serpentine.com` 접근이 가능해졌다면 원문을 직접 읽어 HN·Lobsters 댓글에서 다른 e-ink 기기 사용자들이 유사한 줄무늬 현상을 보고했는지, XTH4 파형 채택이 CrossPoint 펌웨어에 정식 반영됐는지 확인.)*
