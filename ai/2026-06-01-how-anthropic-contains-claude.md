---
title: "Anthropic은 Claude를 어떻게 봉쇄하는가 — 환경 계층 격리 우선, 모델 계층은 그 다음 (Lasn 측 공급자 제품: padded rooms·보안 클러스터의 엔지니어링 답)"
source_title: "How we contain Claude"
source_url: "https://www.anthropic.com/engineering/how-we-contain-claude"
source_name: "anthropic.com · GeekNews 경유"
summarized_at: "2026-06-01"
category: "ai"
tags: ["containment", "sandbox", "ai-safety-engineering", "environment-layer", "approval-fatigue", "isolation", "supplier-product", "lasn-side"]
---

# Anthropic은 Claude를 어떻게 봉쇄하는가 — 환경 계층 격리 우선, 모델 계층은 그 다음 (Lasn 측 공급자 제품: padded rooms·보안 클러스터의 엔지니어링 답)

> 출처: [How we contain Claude](https://www.anthropic.com/engineering/how-we-contain-claude) (Anthropic Engineering, GeekNews 경유) · 정리일 2026-06-01

## 한 줄 요약
**Claude의 능력이 커질수록 잠재 피해 범위도 커진다 — 위험 = *실패 가능성 × 피해 규모*. *승인 피로(approval fatigue)의 한계를 인정*하고, 매번 권한을 묻는 대신 ***환경 계층의 "봉쇄(containment)"***에 중점을 둔다. 세 격리 패턴: ①*임시 컨테이너*(claude.ai, gVisor·세션별 휘발성 FS) ②*샌드박스*(Claude Code, OS 수준 격리 macOS Seatbelt·Linux bubblewrap → 권한 프롬프트 *84% 감소*) ③*로컬 VM*(Cowork, 전체 VM으로 비기술 사용자 보호). 핵심 원칙: ***"환경 계층에서 먼저 봉쇄를 설계하고, 모델 계층은 그 다음"***. 교훈: *직접 작성한 커스텀 구성요소가 가장 취약*하다.**

## 핵심 포인트

- **봉쇄 = padded rooms의 제품 엔지니어링** — *실수해도 격리되는 환경*. **[[2026-06-01-engineering-in-the-era-of-llms]] *"padded rooms"*가 *공급자 제품 기능으로 구현*** (gVisor·Seatbelt·bubblewrap·VM).
- **위험 = 실패 가능성 × 피해 규모** — *둘 다 줄여야*. **[[2026-06-01-ai-in-sre-google-reliable-operations]] *실시간 리스크 평가·점진 권한*과 같은 프레임** — 능력↑이면 봉쇄↑.
- **승인 피로 → 환경 봉쇄로 "주의력을 싸게"** — *매번 권한 묻기는 지속 불가(피로)* → *봉쇄로 권한 프롬프트 84% 감소*. **[[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *"주의력을 싸게 만드는 도구"* + [[2026-05-29-orchestration-tax]] *검토 부담 절감*의 직접 구현**.
- **"환경 계층 먼저, 모델 계층 다음"** — *모델 정렬에만 의존하지 말고 환경에서 막아라*. **[[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]]·[[2026-06-01-instagram-meta-ai-account-takeover]] 보안 클러스터의 엔지니어링 답** — 두 사고는 *환경 계층 봉쇄 부재*. ([[2026-05-29-andrew-kelley-zig-interview]] *입구 차단*과 보완: Zig=입구 정책 / 봉쇄=실행 환경 격리.)
- **커스텀이 가장 취약** — *직접 만든 구성요소가 약한 고리*. **[[2026-05-29-choose-boring-technology-2015]] *검증된 것 우선*의 보안판** — 보안은 boring하게(검증된 gVisor·Seatbelt).
- **회의도 정직히** — 댓글: *인프라 손상 위험을 사업 비용으로 정당화*·*IPO 앞둔 과장 동기*·*샌드박스 우회 사례*. → 봉쇄는 *완벽이 아니라 위험 감축*.

## 인상 깊은 문장

> *(요지)* 매번 승인을 묻는 것은 *승인 피로*로 지속 불가능하다 — 그래서 *환경 계층의 봉쇄*로 권한 프롬프트를 84% 줄였다.

> *(요지)* *환경 계층에서 먼저 봉쇄를 설계하고, 모델 계층은 그 다음*이다.

> *(요지)* 직접 작성한 *커스텀 구성요소가 가장 취약*했다.

## 내 생각 · 적용점

### 5번째 라인업 Lasn 측 *공급자 제품 차원* — 안전 봉쇄 엔지니어링

[[2026-05-29-claude-code-dynamic-workflows]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]](격리 수준 선택)에 이어, 이 글은 *그 격리의 엔지니어링 실체*(gVisor·Seatbelt·VM). **[[2026-06-01-harness-era-software-after-ai]] 하네스 *샌드박스·컴퓨팅(요소5)·관측성·거버넌스(요소6)*의 공급자 구현**. 균형 의례 부채 *0 → +1 친-AI 측 빚* (다음 axelk에서 자연 상환).

### *가든 안전 스레드의 수렴 — 환경 계층 봉쇄*

가든의 안전 논쟁이 *한 원칙으로 수렴*:
- *padded rooms*([[2026-06-01-engineering-in-the-era-of-llms]]) = 개념
- *자율성 레벨·점진 권한*([[2026-06-01-ai-in-sre-google-reliable-operations]]) = 운영 등급
- *환경 계층 봉쇄*(이 글) = 제품 엔지니어링
- *보안 사고*([[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]]·[[2026-06-01-instagram-meta-ai-account-takeover]]) = 봉쇄 부재의 대가
→ ***"모델을 믿지 말고 환경으로 가둬라"***가 가든 보안 라인의 한 줄.

### *"주의력을 싸게" = 봉쇄의 부수 효과*

*권한 프롬프트 84% 감소*는 [[2026-06-01-cathedral-bazaar-winchester-mystery-house]] *"주의력을 싸게 만드는 도구"*의 정확한 사례 — *봉쇄가 안전을 높이면서 동시에 검토 부담을 줄인다*. 안전과 생산성이 *같은 방향*(반대가 아님).

### 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [How we contain Claude](https://www.anthropic.com/engineering/how-we-contain-claude) (원문)
- [GeekNews — 30186](https://news.hada.io/topic?id=30186)
- [[2026-06-01-engineering-in-the-era-of-llms]] — padded rooms *(제품 구현)*
- [[2026-06-01-ai-in-sre-google-reliable-operations]] — 점진 권한·리스크 평가
- [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]]·[[2026-06-01-instagram-meta-ai-account-takeover]] — 보안 클러스터 *(봉쇄 부재의 대가)*
- [[2026-06-01-harness-era-software-after-ai]]·[[2026-06-01-harness-for-every-task-dynamic-workflows]] — 하네스 샌드박스·격리
- [[2026-06-01-cathedral-bazaar-winchester-mystery-house]]·[[2026-05-29-orchestration-tax]] — 주의력을 싸게·검토 부담
- [[2026-05-29-choose-boring-technology-2015]] — 커스텀이 취약 *(보안 boring)*

## 한 달 뒤 회고
*(2026-07-01 즈음 — CRS/사내 AI 도구에 환경 계층 봉쇄(샌드박스·VM·휘발성 FS)를 도입했는지, 승인 피로를 봉쇄로 줄였는지, 커스텀 대신 검증된 격리를 썼는지 기록.)*
