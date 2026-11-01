---
title: "Zero Breach Toolkit, PC와 스마트폰의 스파이웨어 흔적을 오프라인으로 검사하는 도구(GeekNews) — 깨끗한 결과는 안전의 증명이 아니라 못 찾았다는 뜻이다"
source_title: "Zero Breach Toolkit"
source_url: "https://github.com/interplains/Zero-Breach-Toolkit"
source_name: "GitHub (interplains/Zero-Breach-Toolkit)"
referrer_url: "https://news.hada.io/topic?id=36362"
summarized_at: "2026-11-01"
category: "engineering"
tags: ["spyware-detection", "digital-forensics", "open-source-security", "privacy-tooling", "mercenary-spyware"]
---

# Zero Breach Toolkit, PC와 스마트폰의 스파이웨어 흔적을 오프라인으로 검사하는 도구(GeekNews)

> 출처: [Zero Breach Toolkit](https://github.com/interplains/Zero-Breach-Toolkit) (GitHub, interplains) · 정리일 2026-11-01

> **출처 한계**: news.hada.io는 이번에도 네트워크 차단(getaddrinfo ENOTFOUND)으로 원문 열람 불가. WebSearch로 GitHub 저장소(`interplains/Zero-Breach-Toolkit`, 구 저장소명 `zero-breach`)를 특정해 README를 WebFetch로 직접 확인했다 — 이번 배치에서는 확인 수준이 비교적 높은 편이다. 다만 README 자체가 "익명으로 운영되는 프로젝트"(제작자: archivegenocide)라고 밝혀, 제3자 보안 검증·리뷰는 확인하지 못했다.

## 한 줄 요약

**상용 스파이웨어(Pegasus, Predator, Graphite, Candiru 등) 12,400여 개 공개 침해 지표와 PC·Android·iPhone의 로컬 증거를 오프라인으로 대조하는 무료 오픈소스 도구로, 원본 증거를 바꾸지 않는 읽기 전용 검사이며 "깨끗함"은 안전의 증명이 아니라 "이 지표로는 못 찾았다"는 뜻이라고 스스로 못 박는다.**

## 핵심 포인트

- **Amnesty International Security Lab, MVT 프로젝트, Citizen Lab, Echap(stalkerware 연구) 등 29개 출처에서 모은 약 12,400개 공개 침해 지표**를 기준으로 대조한다. 자체 탐지 룰이 아니라 이미 공개된 지표의 큐레이션·대조 엔진이다.
- **플랫폼별 증거 확보 방식이 다르다** — PC(Windows/macOS/Linux)는 브라우저 기록·쿠키·다운로드·확장 프로그램 저장소와 Windows의 Prefetch·Amcache 등을 직접 검사하고, ***Android는 폰에 직접 접속하지 않고 AndroidQF로 만든 수집본만 분석하며, iPhone/iPad는 OS가 앱 간 데이터 접근을 막기 때문에 컴퓨터에 만든 로컬 백업을 검사하는 방식으로 우회한다.***
- **"오프라인"이라는 주장에 스스로 각주를 단다** — 일반 검사는 스파이웨어 주소를 조회하지 않고 업로드 기능도 없다고 명시하지만, ***"Python 수준의 네트워크 호출 차단"이며 OS 수준의 네트워크 샌드박스는 아니라고 README가 직접 밝힌다.*** `--update`(지표 갱신), `--collect-android`(AndroidQF 다운로드), 광고 차단 테스트(기본 브라우저로 테스트 페이지 오픈)는 예외적으로 온라인 동작이다.
- **원본 증거·시스템 설정을 바꾸지 않는 읽기 전용 검사**이며, 악성코드를 자동 제거·격리하지 않는다. 결과는 "발견 사항", "증거의 강도", "확인하지 못한 부분"을 함께 표시한다.
- **한계를 README가 먼저 자백한다** — 공개된 지표만 찾으므로 신규·비공개 스파이웨어는 못 잡고, 흔적은 몇 주 안에 사라질 수 있으며, Android/iPhone 검사는 수집본·백업에 포함된 범위로 제한된 "전체 포렌식이 아닌" 검사다. ***"Something matched"는 감염 확정이 아니라 "더 자세히 살펴봐야 함"을 뜻하고, 우려가 있으면 Access Now나 Amnesty Security Lab 같은 전문가에게 먼저 연락하라고 권고한다.***
- 라이선스는 코드가 Apache 2.0, `iocs/` 큐레이션 지표·`dist/` 내보내기는 CC0 1.0(퍼블릭 도메인)으로 분리돼 있다.

## 인상 깊은 문장

> "Clean doesn't mean safe. No match ≠ no spyware." (README 요약, 직접 인용은 아니고 WebFetch 결과를 바탕으로 한 의역 — 원문 그대로의 문장은 확인하지 못함)

## 댓글

GeekNews 댓글 수는 news.hada.io 차단으로 확인하지 못했다. HN/Lobsters 등 타 커뮤니티 큐레이션 여부도 확인하지 못했다. 이 노트는 **GitHub README(1차 출처)를 직접 확인했지만, 제작자가 익명이고 제3자 보안 리뷰가 확인되지 않은 상태**임을 밝힌다.

## 내 생각 · 적용점

**핵심 전이 1 — "오프라인"이라는 주장도 기술적으로는 한 겹 더 들어가 봐야 한다.** README가 스스로 "Python 레벨 차단일 뿐 OS 샌드박스가 아니다"라고 각주를 단 것은, [[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]]에서 와이어 수준 캡처로 "opt-out을 꺼도 전송이 멈추지 않았다"를 실증한 것과 같은 축이다 — ***도구가 스스로 선언한 동작 범위(오프라인, opt-out)와 실제 기술적 보장 수준 사이에는 항상 간극이 있을 수 있고, 그 간극을 직접 확인하기 전까지는 선언을 곧이곧대로 믿지 않는 게 안전하다.***

**핵심 전이 2 — "탐지되지 않음"을 "안전함"으로 치환하는 추론 오류를 도구가 먼저 경고한다.** 이건 보안 도구를 넘어 일반적인 모니터링·장애 진단 도구에도 적용되는 원칙이다 — 알람이 안 울렸다는 것은 "문제가 없다"가 아니라 "이 알람 규칙으로는 못 찾았다"는 뜻일 뿐이다. 운영 대시보드·헬스체크를 설계할 때 "녹색 = 안전"이라는 암묵적 등식을 경계해야 한다는 교훈으로 일반화할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** 상용 스파이웨어 포렌식은 온다의 B2B 호스피탈리티/CRS 도메인과 거리가 있다. 다만 두 가지 설계 원칙은 전이 가능하다 — (1) ***읽기 전용(read-only)으로 원본 증거·운영 데이터를 건드리지 않는 조사 도구를 만든다는 원칙***은 CRS 장애 진단 스크립트가 운영 DB를 쓰기 접근 없이 조회만 하도록 강제하는 설계와 같은 방향이다. [[2026-10-31-cleanyourtv-android-tv-apple-tv-style-home]]에서 다룬 "지우지 않고 꺼서 되돌릴 수 있게"라는 비파괴적 설계와도 같은 축이다. (2) "검사 결과가 깨끗함 = 문제 없음"이 아니라는 경고는 CRS 모니터링·QA 체크리스트가 "통과"를 "완전히 안전"으로 과잉 해석하지 않도록 만드는 문구 설계에 참고할 수 있다.

## 연관 자료

- [[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]] — "선언된 동작 범위(opt-out, 오프라인)와 실제 기술적 보장 사이의 간극을 직접 검증해야 한다"는 같은 축
- [[2026-10-31-cleanyourtv-android-tv-apple-tv-style-home]] — 원본을 지우지 않고 되돌릴 수 있게 만드는 비파괴적·읽기 전용 설계라는 같은 철학

## 한 달 뒤 회고

*(2026-12-01 즈음 — 이 프로젝트에 제3자 보안 리뷰나 독립 검증 보도가 나왔는지, 그리고 익명 운영자가 공개됐는지 WebSearch로 재확인한다.)*
