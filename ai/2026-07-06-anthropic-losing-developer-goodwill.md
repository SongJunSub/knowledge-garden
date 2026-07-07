---
title: "Anthropic이 개발자 호감을 잃는 몇 가지 방법 (Raheel Junaid) — '추가 사용량은 정말 추가가 아니다', 파일명 감지로 타사 도구 사용을 청구하는 이중 가격 구조 논란"
source_title: "Anthropic's Method to Losing Goodwill in a Few Easy Steps"
source_url: "https://raheeljunaid.com/blog/anthropics-method-to-losing-goodwill-in-a-few-easy-steps/"
source_name: "raheeljunaid.com"
referrer_url: "https://news.hada.io/topic?id=31201"
summarized_at: "2026-07-06"
category: "ai"
tags: ["anthropic", "claude-code", "vendor-lock-in", "pricing", "developer-trust", "api-stability", "open-source-models", "customer-goodwill", "closed-ecosystem"]
---

# Anthropic이 개발자 호감을 잃는 몇 가지 방법 (Raheel Junaid) — '추가 사용량은 정말 추가가 아니다', 파일명 감지로 타사 도구 사용을 청구하는 이중 가격 구조 논란

> 출처: [Anthropic's Method to Losing Goodwill in a Few Easy Steps](https://raheeljunaid.com/blog/anthropics-method-to-losing-goodwill-in-a-few-easy-steps/) (Raheel Junaid) · 정리일 2026-07-06

## 한 줄 요약

**개발자 Raheel Junaid가 Anthropic의 최근 정책들을 강하게 비판했다. Claude 구독은 Anthropic 자체 도구에만 적용되고, 타사 에이전트 사용 시 추가 크레딧이 청구된다. Claude Code는 GitHub에 9,100개 이상 미해결 이슈(6개월 이상 정지 버그 포함)를 안고 있으면서도 타사 도구를 제한한다. 2026년 6월 15일 도입된 "에이전트 SDK 크레딧" 이중 청구는 명시적 공지 없이 시행됐다가 소비자 반발로 롤백됐지만, 신뢰 손상은 남았다.**

## 핵심 포인트

- **API 안정성 문제** — Claude API가 "악명 높게 불안정" — 2026년 5월 상태 페이지에 빈번한 장애 기록. 구독 사용자는 Anthropic 서버에만 의존, Vertex AI·AWS Bedrock·Azure 같은 대체 제공자는 더 비싼 API 크레딧만 제공.
- **Claude Code 품질 문제** — GitHub **9,100개 이상 미해결 이슈**. "6개월 이상 완전 정지 버그", "1년 이상 지속된 화면 깜빡임" 등 심각한 미해결 문제.
- **이중 가격 구조 (2026-06-15 도입)** — 청구를 두 풀로 분리: ①공식 도구(Claude Code CLI 등) ②제3자 도구 사용 시 "에이전트 SDK 크레딧" 별도 청구. Zed 블로그 인용: "Claude 구독이 이전엔 API 가격 대비 약 15~30배 보조했으나, 새 크레딧은 전체 API 요금으로 청구." Pro $20, Max $100~200 크레딧 추가.
- **`claude -p` 문제** — Anthropic의 공식 도구이지만 자동화에서 호출하면 추가 요금 부과. 사용자들이 명시적 공지 없이 청구 페이지에서 비용 증가를 발견.
- **파일명 감지 메커니즘 논란** — 특정 파일명의 존재로 제3자 도구 사용을 감지해 자동으로 "추가 사용량"으로 청구 — **사용자 명시적 동의 없이 이뤄짐.**
- **저자의 5가지 핵심 비판**:
  1. 최대 시장 점유를 위한 고객 폐쇄 시스템 강제
  2. 경쟁자 비하
  3. 자사 소프트웨어 품질이 낮으면서 "품질 향상" 주장
  4. 공포 마케팅을 위한 인위적 제한
  5. 구매 후 고객 통지 없이 약관 변경
- **"진동형 코딩"에 대한 자기반성** — 저자 자신도 "토큰 최대화" 시대를 시도했으나, Claude 장애 시 업무 마비를 겪고 "에이전트 주도 개발"에서 "에이전트 보조 개발"로 복귀.
- **오픈소스 대안** — Qwen·GLM·Deepseek가 Sonnet과 경쟁 가능한 수준에 도달. OpenRouter 같은 AI Gateway로 모델 간 자유 전환·비용 최적화·데이터 보존 정책 조정.
- **후속 편집** — 소비자 반발로 정책이 롤백됐음을 저자가 나중에 명시했으나, 신뢰 손상은 지속된다는 입장 유지.

## 인상 깊은 문장

> "추가 사용량은 정말 '추가'가 아니다."

> "자사 소프트웨어 품질이 낮으면서 품질 향상을 주장한다."

## 댓글 — HN 논점 전수 확인 (GN⁺ 큐레이션)

- Claude 구독·도구 제한에 대한 비판
- Claude Code 품질 문제 재확인
- Qwen·GLM·Deepseek 등 대안 모델 활용 사례 공유
- Anthropic의 폐쇄적 생태계 관행 비판
- **OpenCode·Pi 등 대안 도구 추천**

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 주 반복된 "Anthropic 신뢰 위기" 시리즈의 완결편

[[2026-07-03-alibaba-bans-claude-code-backdoor-risk]](스테가노그래피 마킹 발견) → [[2026-07-06-better-models-worse-tools]](Claude Code 하네스 과적합) → 이 글(이중 가격 구조·파일명 감지)로 이어지는 흐름이 한 주 안에 완결됐다. **세 사건 모두 "사용자 모르게 이뤄진 판단·조치가 발견되어 신뢰가 훼손되는" 동일한 패턴**을 반복한다. [[2026-06-30-claude-code-steganographic-marking]]에서 정리했던 "숨겨진 조치는 언젠가 발견되며, 발견 시 대응이 신뢰를 좌우한다"는 원칙이 이번엔 파일명 감지·이중 청구라는 형태로 재확인됐다.

### 핵심 전이 2 — [[2026-06-29-tokenmaxxing-agentic-loops]]에서 예측했던 "오픈 모델로의 이동"이 실제로 가속화

댓글의 "Qwen·GLM·Deepseek로 전환" 사례들은 지난주 정리한 Tokenmaxxing 글의 예측("규제 역설이 오픈 모델 채택을 가속")이 벤더 신뢰 위기라는 또 다른 경로로도 재현되고 있음을 보여준다. **CRS·PickMe에서 특정 벤더에 강하게 의존하는 AI 워크플로우가 있다면, 이런 정책 변화 리스크를 감안한 폴백 계획(OpenRouter 같은 게이트웨이 활용)을 갖추는 것이 실무적 대비책이다.**

### 핵심 전이 3 — "에이전트 주도 개발→에이전트 보조 개발" 복귀가 [[2026-07-03-short-leash-ai-coding-method]]의 실증

저자 자신이 "토큰 최대화" 시도 후 실제 장애를 겪고 더 통제된 방식으로 복귀했다는 고백은, 지난주 정리한 "짧은 목줄" 방법론이 이론이 아니라 실전에서 검증된 필요성임을 보여준다. **CRS에서도 AI 도구에 대한 과도한 의존(자동화 파이프라인 전체를 단일 벤더에 위탁)이 그 벤더의 장애·정책 변화 시 업무 마비로 직결될 수 있음을 이 사례가 경고한다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-06-30-claude-code-steganographic-marking]] — *"숨겨진 조치는 언젠가 발견된다" 원칙의 3번째 반복 사례*
- [[2026-07-03-alibaba-bans-claude-code-backdoor-risk]] — *이번 주 Anthropic 신뢰 위기 시리즈의 앞선 사건*
- [[2026-07-06-better-models-worse-tools]] — *같은 시리즈 — Claude Code 하네스 문제의 다른 측면*
- [[2026-06-29-tokenmaxxing-agentic-loops]] — *"오픈 모델로의 이동" 예측이 벤더 신뢰 위기 경로로도 실현*
- [[2026-07-03-short-leash-ai-coding-method]] — *"에이전트 보조 개발" 복귀가 이 방법론의 실전 필요성을 증명*

## 한 달 뒤 회고
*(2026-08-06 즈음 — Anthropic의 가격 정책·투명성이 실제로 개선됐는지, CRS AI 워크플로우에 벤더 락인 폴백 계획을 마련했는지 기록.)*
