---
title: "ChatGPT for Google Sheets 프롬프트 인젝션 데이터 유출 — 단일 인젝션으로 12개 워크북 (axelk 측 보안·신뢰 차원 후보)"
source_title: "GPT for Google Sheets data exfiltration"
source_url: "https://www.promptarmor.com/resources/gpt-for-google-sheets-data-exfiltration"
source_name: "promptarmor.com · GeekNews 경유"
summarized_at: "2026-06-01"
category: "ai"
tags: ["prompt-injection", "ai-security", "data-exfiltration", "agent-trust", "indirect-injection", "axelk-side", "security-dimension"]
---

# ChatGPT for Google Sheets 프롬프트 인젝션 데이터 유출 — 단일 인젝션으로 12개 워크북 (axelk 측 보안·신뢰 차원 후보)

> 출처: [GPT for Google Sheets data exfiltration](https://www.promptarmor.com/resources/gpt-for-google-sheets-data-exfiltration) (PromptArmor, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**PromptArmor가 *단 하나의 간접 프롬프트 인젝션*으로 사용자 계정 전체 워크북이 유출될 수 있음을 입증 — *신뢰 불가 데이터 소스(외부 시트·ChatGPT 커넥터)에 숨겨진 흰색 텍스트 프롬프트*가 ChatGPT를 조종해 *공격자 제어 외부 스크립트를 사용자 권한으로 실행*. 재무 모델 시트 유출 후 *스크립트가 다른 워크북 링크를 자동 탐지해 12개까지 유출* + 피싱 오버레이로 자격증명 탈취. OpenAI는 "공개 파이프라인의 틈"을 인정하고 *Apps Script 코드 생성 기능을 즉시 제거*. (5/8 보고 → 자동응답만 → 5/27 공개 → 5/31 대응.)**

## 핵심 포인트

- **간접 프롬프트 인젝션 = 데이터 경계 붕괴** — *콘텐츠가 명령으로 해석*되는 LLM 근본 취약점. *흰색 텍스트로 숨긴 프롬프트*가 에이전트를 탈취.
- **권한 위임의 위험** — 스크립트가 *사용자가 확장에 부여한 권한*으로 작동 → *자동 워크북 탐지·연쇄 유출*. **[[2026-06-01-harness-era-software-after-ai]] 하네스 *관측성·거버넌스(요소 6)*의 실패 사례** — 권한·샌드박스가 없으면 에이전트는 무기.
- **"에이전트 신뢰 거부"** — 댓글: *정중히 요청한 데이터 유출을 실제 수행하면 안전하지 않은 도구*. **[[2026-05-20-refusing-ai-is-a-human-choice]]·[[2026-05-29-andrew-kelley-zig-interview]] *AI 거부*의 보안 근거**.
- **6년 된 미해결 난제** — *프롬프트 인젝션이 6년째 미해결*. "새로운 OS 수준 설계 필요"(댓글). **[[2026-06-01-engineering-in-the-era-of-llms]] *padded rooms*가 부분 해법** — 격리된 영역에서만 에이전트 자유.
- **공개 제보 처리 문제** — *자동응답만 받고 19일 후 공개*. 책임 있는 공개(responsible disclosure)의 운영 미비.

## 인상 깊은 문장

> *(요지)* 단 하나의 간접 프롬프트 인젝션이 *사용자 계정의 모든 워크북*을 유출할 수 있다.

> *(댓글)* 정중히 요청했을 때 데이터 유출을 실제로 수행하는 도구라면, 그것은 *안전하지 않은 도구*다.

## 내 생각 · 적용점

### 5번째 라인업 axelk 측 *보안·신뢰 차원 후보* — #30094와 보안 클러스터

이 글 + [[2026-06-01-instagram-meta-ai-account-takeover]](Meta AI 계정 탈취)가 **AI 보안 실패 쌍**. weekly W21에서 *GitHub 침해 = 보안 차원 후보*라 짚은 것의 *2건 도착*. **axelk 측 보안·신뢰 차원 후보** — 명시 라벨링은 보류(오버 메타화 자제), *클러스터로 기록*. 균형 의례 부채 *0 → -1* (axelk).

### *하네스 거버넌스의 반례*

[[2026-06-01-harness-era-software-after-ai]]가 *하네스 7요소(⑥관측성·거버넌스)*를 경쟁 우위로 봤다면, 이 사건은 *그 요소가 비면 곧 보안 사고*임을 보여줌 — **하네스는 선택이 아니라 안전 필수**. 도메인 크리티컬(결제·재무)일수록.

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [GPT for Google Sheets data exfiltration](https://www.promptarmor.com/resources/gpt-for-google-sheets-data-exfiltration) (원문)
- [GeekNews — 30084](https://news.hada.io/topic?id=30084)
- [[2026-06-01-instagram-meta-ai-account-takeover]] — AI 보안 실패 쌍
- [[2026-06-01-harness-era-software-after-ai]] — 하네스 거버넌스 *(반례)*
- [[2026-06-01-engineering-in-the-era-of-llms]] — padded rooms *(격리 해법)*
- [[2026-05-20-refusing-ai-is-a-human-choice]]·[[2026-05-29-andrew-kelley-zig-interview]] — AI 거부 *(보안 근거)*

## 한 달 뒤 회고
*(2026-07-01 즈음 — 프롬프트 인젝션 방어가 프롬프트 갱신 수준인지 실제 격리인지 밝혀졌는지, CRS/사내 AI 도구에 권한·샌드박스 점검을 했는지 기록.)*
