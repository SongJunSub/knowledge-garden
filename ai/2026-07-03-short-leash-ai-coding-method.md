---
title: "Fable을 이기는 '짧은 목줄' AI 코딩 방법 (blog.okturtles.org) — '개발자가 자율 실행을 제한하고 지속적으로 통제한다', diff 검토와 하위 작업별 커밋으로 탈선을 막는다"
source_title: "The 'Short Leash' Method for Beating Fable at AI Coding"
source_url: "https://blog.okturtles.org"
source_name: "blog.okturtles.org"
referrer_url: "https://news.hada.io/topic?id=31113"
summarized_at: "2026-07-03"
category: "ai"
tags: ["ai-coding", "code-review", "human-oversight", "security-critical-software", "commit-strategy", "ai-disclosure", "vibe-coding-criticism", "mental-model"]
---

# Fable을 이기는 '짧은 목줄' AI 코딩 방법 (blog.okturtles.org) — '개발자가 자율 실행을 제한하고 지속적으로 통제한다', diff 검토와 하위 작업별 커밋으로 탈선을 막는다

> 출처: [The 'Short Leash' Method](https://blog.okturtles.org) (blog.okturtles.org) · 정리일 2026-07-03

## 한 줄 요약

**보안이 중요한 소프트웨어 개발에서 AI 코딩 에이전트를 효과적으로 활용하는 방법: "Short Leash" 방식. 여러 에이전트가 병렬로 작동하는 "vibe" 방식은 코드베이스 이해도를 저하시키고 탈선 발견을 지연시킨다. 개발자가 계획→diff 검토→빈번한 개입→하위 작업별 커밋→최종 리뷰의 절차로 AI의 자율 실행을 지속적으로 통제해야 한다.**

## 핵심 포인트

- **문제 진단** — 여러 에이전트 병렬 "vibe" 방식의 3가지 위험: 코드베이스에 대한 개발자 이해도 저하 / AI가 예상치 못한 방향으로 탈선할 가능성 / 문제 발견 시점 지연.
- **Short Leash 절차**:
  1. 계획 수립 및 단계 분해
  2. **권한 프롬프트에서 diff 검토** — 개발자가 변경사항 분석
  3. 빈번한 거부와 개입
  4. 하위 작업별 커밋 (이전 작업 망가짐 방지)
  5. 최종 리뷰
- **AI-인간 협력 모델** — AI는 린터처럼 기능하며 흔한 오류를 빠르게 포착. 인간은 고차원적 문제와 방향성 판단 담당. **함께 리뷰하면 단독 리뷰보다 실수 감소.**
- **AI Disclosure 원칙** — PR에 AI를 사용했다면 정확한 모델명 공개 필수 + PR 작성자가 라인별로 직접 검토 — 신뢰성 확보의 필수 조건.

## 인상 깊은 문장

> "AI는 린터처럼 기능하며 흔한 오류를 빠르게 포착하고, 인간은 고차원적 문제와 방향성 판단을 담당한다."

## 댓글 — HN 찬반 논쟁 (GN⁺ 큐레이션)

- **비판(마이크로매니징)**: "목발처럼 보이고 시간 낭비" — 계획 단계에 투자하면 구현 단계 감독이 덜 필요할 수 있다는 반박. AI를 마이크로매니징하는 것이 에이전트의 창의성을 제한한다는 지적.
- **AI를 "주니어 엔지니어"처럼 대하는 것의 한계**에 대한 토론.
- **YOLO 모드(권한 건너뛰기)에서도 충분히 효과적**이라는 반박, 모델 성능 향상으로 과도한 감독이 불필요하다는 주장.
- **찬성(긍정 사례)**: 실제로 이 방식을 사용 중인 개발자들이 "코드베이스 정신 모델 유지에 도움"이 된다고 공유. 중요 시스템에선 이 방식이 현실적.
- **메타적 비판**: 상황(보안 중요도)에 따라 접근 방식이 달라야 한다는 지적.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-06-30-artificial-adventures-ai-tools-reality]]의 실패가 정확히 이 방법으로 예방 가능했다

지난번 정리한 보드게임 웹앱 실패 사례("완료했다"→"아니다"→"진짜 완료"→"코드만 섞었다")는, Short Leash의 "하위 작업별 커밋+빈번한 개입"이 있었다면 훨씬 일찍 발견됐을 것이다. **CRS에서 복잡한 비즈니스 로직(요금 규칙, 취소 정책)을 AI에게 맡길 때는 이 절차를 표준으로 삼아야 한다** — 특히 [[2026-06-30-artificial-adventures-ai-tools-reality]]에서 지적한 "검증 비용이 높은 작업"에서.

### 핵심 전이 2 — "보안 중요도에 따라 접근 방식이 달라야 한다"는 메타 비판이 실무적으로 가장 중요

HN 댓글의 이 지적이 핵심이다. **결제·인증·예약 확정 같은 CRS의 고위험 영역엔 Short Leash를, 프로토타입·UI 조정 같은 저위험 영역엔 더 자율적인 방식을 쓰는 이원화 전략이 필요하다.** [[2026-07-03-agent-autonomy-levels]]에서 다룬 "6단계 자율성 분류"와 정확히 같은 결론 — 위험도에 맞춰 자율성 수준을 캘리브레이션해야 한다.

### 핵심 전이 3 — "AI Disclosure 원칙"을 CRS 팀 PR 정책에 도입 검토

PR에 사용된 AI 모델명을 명시하고 작성자가 라인별로 직접 검토했음을 확인하는 절차는, [[2026-06-30-code-review-purpose-maintainability]]의 "이해 가능한 코드" 기준과 결합하면 강력한 품질 게이트가 된다. **CRS PR 템플릿에 "AI 사용 여부·모델명·직접 검토 확인" 체크박스를 추가하는 것이 즉시 적용 가능한 실천.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-30-artificial-adventures-ai-tools-reality]] — *이 방법으로 예방 가능했던 실패 사례*
- [[2026-07-03-agent-autonomy-levels]] — *"위험도별 자율성 캘리브레이션"의 구체적 실천 방법론*
- [[2026-06-30-code-review-purpose-maintainability]] — *"AI Disclosure 원칙"과 결합한 품질 게이트*

## 한 달 뒤 회고
*(2026-08-03 즈음 — CRS 고위험 영역(결제·예약 확정)에 Short Leash 방식을 실제로 적용했는지, PR 템플릿에 AI Disclosure 체크박스를 도입했는지 기록.)*
