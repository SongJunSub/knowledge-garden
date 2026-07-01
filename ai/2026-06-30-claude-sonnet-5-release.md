---
title: "Claude Sonnet 5 공개 (anthropic.com) — 'Opus급 에이전트 능력을 Sonnet 가격에', Effort 조절로 비용-성능 균형을 세밀하게 선택"
source_title: "Claude Sonnet 5"
source_url: "https://www.anthropic.com/news/claude-sonnet-5"
source_name: "Anthropic"
referrer_url: "https://news.hada.io/topic?id=30992"
summarized_at: "2026-06-30"
category: "ai"
tags: ["claude", "anthropic", "sonnet-5", "agentic-ai", "model-release", "pricing", "effort-control", "safety", "coding-agent", "tool-use"]
---

# Claude Sonnet 5 공개 (anthropic.com) — 'Opus급 에이전트 능력을 Sonnet 가격에', Effort 조절로 비용-성능 균형을 세밀하게 선택

> 출처: [Claude Sonnet 5](https://www.anthropic.com/news/claude-sonnet-5) (Anthropic) · 정리일 2026-06-30

## 한 줄 요약

**Anthropic이 2026-06-30 Claude Sonnet 5를 출시했다. 핵심은 이전 Opus급 모델에 가까운 에이전트 실행 능력(계획 수립·도구 사용·자율 실행)을 Sonnet급의 낮은 가격으로 제공하는 것이다. Effort 수준 조절로 사용자가 비용-성능 트레이드오프를 세밀하게 선택할 수 있다.**

## 핵심 포인트

- **출시 핵심** — Sonnet 4.6 대비 추론·도구 사용·코딩·지식 작업 개선. BrowseComp(에이전트 검색)·OSWorld-Verified(컴퓨터 사용) 평가에서 우수. **"Opus 4.8과의 격차를 좁히며 더 낮은 가격대에서 유사한 성능."**
- **Effort 수준 조절** — 중간 effort: 비용 효율 대폭 향상 / 높은 effort: 일부 작업에서 Opus 4.8과 동등한 성능. 사용자가 작업별로 비용-성능 균형을 직접 조절.
- **에이전트 능력 확장** — 계획 수립·브라우저/터미널 도구 사용·자율 실행을 Sonnet급에서 처리. 초기 사용 사례: 다단계 SW 엔지니어링 자동 완료, Salesforce 계정 업데이트 같은 비코딩 작업, PR 자동 테스트·검증, 버그 재현→수정 일괄 처리.
- **안전성** — Sonnet 4.6보다 전반적 개선(환각·아첨·악성 요청 거부·프롬프트 인젝션 저항성). 단, Opus 4.8·Claude Mythos Preview 대비 일부 부정렬 행동 비율은 더 높음.
- **사이버 보안 제약** — 의도적으로 사이버 보안 작업에 학습되지 않음. 기본 활성화된 보호 장치로 위험한 사용 실시간 감지·차단(Fable 5보다는 덜 엄격).
- **가격** — 출시 프로모션(~2026-08-31): 입력 $2/1M, 출력 $10/1M. 이후: 입력 $3, 출력 $15. 새 토크나이저로 콘텐츠 유형에 따라 토큰 매핑이 1.0~1.35배 달라짐.
- **제공 범위** — Free/Pro 기본 모델, Max/Team/Enterprise 이용 가능. Claude Code·Claude Platform. API 모델명 `claude-sonnet-5`.

## 인상 깊은 문장

> "이전의 비싼 Opus급 모델에 가까운 에이전트 실행 능력을 Sonnet급의 저렴한 가격으로 제공한다."

> "계획 수립, 브라우저와 터미널 같은 도구 사용, 자율 실행을 Sonnet급에서 처리할 수 있다."

## 댓글 전수 확인 (2개 + HN 인용)

- **seoseonyu**: "빨리 Fable 줘... 😢😢" — 다음 모델(Fable) 기대.
- **GN⁺(@neo)의 HN 요약**:
  - 높은 effort 수준에서는 Opus 대비 비용 효율이 오히려 떨어진다는 지적
  - "모델·effort 수준별 성능에 대한 머릿속 모델을 잃어버렸다"는 사용자 혼란 — 선택지가 늘면서 판단 복잡도 증가
  - 실사용에서는 Claude Code 기본값으로 충분하다는 의견 다수
  - Kimi K2.7·GLM-5.2 등으로 전환하는 사례도 존재 — 벤치마크와 실제 사용 경험의 괴리에 대한 회의론

## 내 생각 · 적용점

### 핵심 전이 1 — "Effort 조절"이 바로 이번 주 정리한 "누적 정확성"의 실물 구현

[[2026-06-29-tokenmaxxing-agentic-loops]]에서 다룬 "더 많은 토큰 = 더 나은 결과" 논리가 Sonnet 5의 Effort 파라미터로 제품화됐다. **비용 통제가 필요한 작업(코드 리뷰 1차, 문서 정리)은 중간 effort, 중요한 아키텍처 결정이나 복잡한 디버깅은 높은 effort로 전환하는 판단이 앞으로 일상적 작업 습관이 될 것.** CRS 개발 시 "이 작업이 얼마나 중요한가"에 따라 effort를 명시적으로 조절하는 습관이 비용 효율의 핵심이 된다.

### 핵심 전이 2 — "모델 선택 혼란"은 GTM AI 글의 "컨텍스트 부재"와 같은 문제

HN 댓글의 "머릿속 모델을 잃어버렸다"는 지적은 [[2026-06-29-gtm-ai-context-layer]]의 논점과 정확히 연결된다. **선택지(모델·effort 수준)가 늘어날수록, "언제 무엇을 쓸지"에 대한 내부 의사결정 로직이 없으면 오히려 비효율이 커진다.** 팀 차원에서 "어떤 작업에 어떤 effort를 쓸지"에 대한 가이드라인을 만드는 것이 GTM Context Layer의 원칙과 같다.

### 핵심 전이 3 — 사이버 보안 의도적 미학습이 시사하는 것

Sonnet 5가 "의도적으로 사이버 보안 작업에 학습되지 않았다"는 점은 모델 능력이 만능이 아니라 **의도적으로 설계된 경계**임을 보여준다. [[2026-06-29-decisions-and-dollars-ai-proof]]의 "쓰기 방어"와 유사한 원리 — 특정 위험 영역은 능력을 아예 제한하는 것이 안전 전략의 일부. CRS에서도 AI 에이전트에게 어떤 작업 범위(읽기 vs 쓰기, 저위험 vs 고위험)를 허용할지 명시적으로 설계해야 한다는 [[2026-06-29-revised-rules-engineering-leadership]]의 3번 규칙과 직결.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-29-tokenmaxxing-agentic-loops]] — *"누적 정확성"이 Effort 파라미터로 제품화된 실물 사례*
- [[2026-06-29-gtm-ai-context-layer]] — *모델 선택 혼란=컨텍스트·의사결정 로직 부재와 같은 문제*
- [[2026-06-29-revised-rules-engineering-leadership]] — *"기본 케이스 자동화+고위험 인간 검토" 구분이 사이버보안 미학습 설계에 반영*
- [[2026-06-29-decisions-and-dollars-ai-proof]] — *"쓰기 방어" — 의도적 능력 제한이 안전 전략*

## 한 달 뒤 회고
*(2026-07-30 즈음 — CRS·PickMe·BugSip 개발에서 Effort 수준을 작업 중요도에 따라 실제로 구분해서 썼는지, 팀 내 "어떤 작업에 어떤 effort" 가이드라인이 생겼는지 기록.)*
