---
title: "Reddit 안티스팸 내부를 엿보다 (lyra.horse) — '2021년 버그로 내부 탐지 로직 노출', Python 2.7부터 Lua 규칙까지 다세대 시스템과 Perspective API 의존성"
source_title: "Peeking Inside Reddit's Anti-Spam System"
source_url: "https://lyra.horse/blog/2026/06/reddit-spam-internals/"
source_name: "lyra.horse"
referrer_url: "https://news.hada.io/topic?id=30899"
summarized_at: "2026-06-28"
category: "backend"
tags: ["anti-spam", "reddit", "system-design", "legacy-systems", "perspective-api", "third-party-dependency", "security-disclosure", "multi-generational-architecture"]
---

# Reddit 안티스팸 내부를 엿보다 (lyra.horse) — '2021년 버그로 내부 탐지 로직 노출', Python 2.7부터 Lua 규칙까지 다세대 시스템과 Perspective API 의존성

> 출처: [Peeking Inside Reddit's Anti-Spam System](https://lyra.horse/blog/2026/06/reddit-spam-internals/) (lyra.horse) · 정리일 2026-06-28

## 한 줄 요약

**2021년 Reddit의 일시적 버그로 내부 스팸 탐지 사유와 spamurai 시스템의 상세 신호(계정 나이·karma·ISP·TLS 지문·Perspective API 점수)가 노출됐다. Python 2.7 기반 검사부터 Lua 규칙까지 다세대 시스템 구성이 드러났고, Google Perspective API 의존성도 확인됐다. 5년 후 공개한 이유: API 종료 예정과 LLM 스팸의 등장으로 위험이 낮아졌기 때문이다.**

## 핵심 포인트

- **노출 경위** — 2021년 일시적 오류로 Relay for Reddit 앱이 내부 스팸 제거 사유를 1시간 노출. 제거 범주: `domain`, `spamurai`, `banned user`, `shadowban`, `spamurai`.
- **spamurai 신호들** — 계정 나이, karma, 신고 수, ISP, 이메일 도메인, User-Agent, TLS 지문, Perspective API 점수.
- **Perspective API 의존성** — Reddit 스팸 점수와 Google Perspective API SPAM 점수가 거의 일치. 단 한 글자만 바꿔도 점수가 크게 변하는 취약점도 발견.
- **다세대 시스템 구성** — Python 2.7 기반 검사 + Lua 규칙(REV1/REV2) + Snooron 엔진 + OCR·이미지 분류. 오래된 코드와 새 코드가 공존.
- **5년 후 공개 결정** — Perspective API 2026년 종료 예정 + LLM 기반 스팸으로 기존 방어 우회가 이미 진행 중 → 공개 위험이 낮아짐.

## 인상 깊은 문장

> "Python 2.7 기반 검사가 아직 프로덕션에서 돌아가고 있다."

> "한 글자만 바꿔도 Perspective API 점수가 크게 변한다 — 탐지는 취약하다."

> "5년 기다린 이유: API가 종료되고 LLM이 이미 이 방어를 무의미하게 만들었기 때문이다."

## 댓글 전수 확인

**댓글 0개** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — 제3자 API 의존성은 언제나 리스크다

Reddit이 Google Perspective API에 스팸 탐지를 의존한 것이 2026년 API 종료로 문제가 됐다. **CRS에서 Opera PMS API·OTA API·토스 결제 API 의존성도 같은 리스크를 갖는다 — API 버전 종료·정책 변경·서비스 종료 시 우리 서비스가 즉시 영향을 받는다.** 의존성마다 "이게 종료되면 어떻게 되는가"의 컨틴전시 플랜이 있어야 한다.

### 핵심 전이 2 — 다세대 시스템은 실제로 오래 살아남는다

Python 2.7이 Reddit 프로덕션에서 돌아가고 있다는 사실은 충격적이지만, 실제 대형 시스템에서는 흔한 일이다. **레거시 코드를 "언젠가 교체"할 것으로만 생각하면 리스크를 과소평가한다 — 지금 당장 교체 불가하다면 "이 코드가 다음 5년을 살아남아야 한다"는 관점으로 관리해야 한다.** [[2026-06-08-java-to-kotlin-woowahan]]의 "점진 교체" 전략이 현실적 대안.

### 핵심 전이 3 — 보안 공개 타이밍: "위험이 낮아지는 때"

5년 기다린 후 공개한 결정이 인상적이다. 보안 정보 공개는 ①취약점이 이미 패치됐거나 ②공개해도 실질적 위협이 없을 때 하는 것이 윤리적이다. **LLM 스팸의 등장으로 기존 규칙 기반 탐지가 무의미해지는 패러다임 전환이 "공개 타이밍"을 만들었다는 점이 중요하다 — 기술 변화가 보안 공개의 위험 계산을 바꾼다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-28-fintech-engineering-handbook]] — *외부 API raw payload 저장 원칙 — 의존성이 종료될 때 재처리 가능성 확보*
- [[2026-06-08-java-to-kotlin-woowahan]] — *"점진 전환"이 다세대 시스템의 현실적 관리 방법*
- [[2026-06-26-hacker-news-18-year-tech-trends]] — *기술 세대교체 패턴 — 외부 API 의존 기술도 교체 곡선에 올라 있다*

## 한 달 뒤 회고
*(2026-07-28 즈음 — CRS·PickMe에서 제3자 API 의존성 목록을 작성하고 각각의 컨틴전시 플랜을 검토했는지, 다세대 코드 중 리스크가 큰 부분을 파악했는지 기록.)*
