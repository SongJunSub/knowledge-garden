---
title: "chrome-capture — Chrome 탭을 4K 120fps로 녹화하는 도구, Playwright 테스트 리포트에 바로 꽂힌다"
source_title: "chrome-capture - Chrome 탭의 화면과 소리를 최대 4K 120fps로 녹화하는 도구"
source_url: "https://news.hada.io/topic?id=37379"
source_name: "GeekNews (news.hada.io)"
referrer_url: "https://news.hada.io/topic?id=37379"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "engineering"
tags: ["playwright", "test-automation", "chrome", "recording", "devtools"]
---

# chrome-capture — Chrome 탭을 4K 120fps로 녹화하는 도구

> 출처: [chrome-capture - Chrome 탭의 화면과 소리를 최대 4K 120fps로 녹화하는 도구](https://news.hada.io/topic?id=37379) (GeekNews · hada 차단으로 Slack 발췌 경유) · 정리일 2026-11-18
>
> **출처 한계**: hada 원문 차단(getaddrinfo ENOTFOUND)으로 댓글·구체 벤치마크(M4 Max 관련 문장은 중간에 끊김)를 확인하지 못했다.

## 한 줄 요약

**URL과 녹화 구간만 지정하면 Chrome 153의 내장 녹화 API로 탭 화면·소리를 FFmpeg 없이 AV1 MP4로 뽑아내고, Playwright/Puppeteer/CDP로 녹화 시작·종료를 제어해 테스트 리포트에 바로 첨부할 수 있다.**

## 핵심 포인트

- **브라우저 내장 인코딩** — ***Chrome 153의 내장 녹화 API***를 사용해 브라우저가 녹화 중 바로 인코딩하므로, FFmpeg 설치나 별도 변환 파이프라인이 필요 없다. 기본값은 720p 60fps, 최대 4K 120fps, 탭 오디오 동시 녹음.
- **테스트 프레임워크 삼종 지원** — Playwright, Puppeteer, CDP에서 녹화 시작·종료를 제어할 수 있어, ***로그인·페이지 로딩처럼 불필요한 구간은 빼고 필요한 구간만 녹화***할 수 있다.
- **테스트 리포트 자동 첨부** — Playwright 테스트의 녹화 영상을 ***테스트 리포트에 자동 첨부***할 수 있고, 마우스 커서·클릭 위치도 표시 가능해 실패 재현 디버깅에 바로 쓸 수 있다.
- **성능 수치는 미확인** — "M4 Max로…" 뒤 문장이 끊겨, 실제 녹화 중 오버헤드·CPU 점유율 같은 구체 수치는 Slack 발췌만으로는 확인할 수 없다.

## 인상 깊은 문장

> "M4 Max로…" (Slack 발췌, 문장이 끊김 — 원문 미확인으로 전체 인용 불가)

## 댓글

hada 원문 차단으로 댓글 수·논조 확인 불가. HN·Lobsters 큐레이션 여부도 확인 못함. **"PASS" 아님을 명시**: 이 도구의 실제 성능(녹화가 테스트 실행 속도에 주는 영향 등)은 전혀 검증하지 못했고, Slack 발췌만으로 재구성했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "녹화 트레이스 vs 일반 실행"은 비용·시그널의 트레이드오프다

Playwright 테스트를 매번 트레이스·녹화까지 켜고 돌리면 CPU 비용이 크게 늘어난다는 건 이 분야에서 반복되는 운영 지혜다. 이 글의 "필요한 구간만 녹화" 설계는 그 비용을 줄이는 구체적 구현이다. [[2026-10-16-line-ai-e2e-test-automation]]이 다룬 LINE의 AI E2E 테스트 자동화도 같은 긴장(테스트 범위 확대와 실행 비용 사이)을 다뤘다.

### 핵심 전이 2 — 실패 재현의 핵심은 "본 것을 그대로 남기는 것"

[[2026-10-20-musinsa-why-fast-devices-must-wait-test-automation]]이 "빠른 기기가 테스트 자동화에서는 오히려 느린 기기를 기다려야 한다"는 반직관을 다뤘듯, 테스트 자동화의 현실적 문제는 속도가 아니라 "무엇이 실패했는지 사람이 바로 알 수 있게 만드는 증거"다. 녹화 영상 자동 첨부는 그 증거의 품질을 올리는 가장 직접적인 방법이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 예약 플로우 E2E 테스트가 간헐적으로 실패할 때, 로그만으로는 재현이 안 되는 타이밍 버그(요금 갱신 중 클릭, 캐시 경쟁 등)가 많다. Playwright 테스트에 이런 녹화 자동 첨부를 넣으면 "어느 화면에서, 어떤 클릭 순서로 깨졌는지"를 바로 확인할 수 있어, 버그 재현 왕복 시간을 줄이는 데 실질적으로 쓸 수 있다.

## 연관 자료

- [[2026-10-16-line-ai-e2e-test-automation]] — 같은 테스트 자동화 축, AI 기반 E2E 커버리지 확대.
- [[2026-10-20-musinsa-why-fast-devices-must-wait-test-automation]] — 테스트 자동화 운영의 또 다른 현실적 제약.

## 한 달 뒤 회고

*(2026-12-18 즈음 — 녹화 오버헤드가 실제 테스트 실행 시간에 얼마나 영향을 주는지, 이 도구를 CRS E2E 테스트 리포트에 실제로 붙여봤는지 점검.)*
