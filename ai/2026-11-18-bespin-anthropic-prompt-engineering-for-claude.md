---
title: "Anthropic Prompt Engineering을 Claude 업무 활용 기준으로 정리 (베스핀글로벌) — XML 태그로 입력과 지시를 분리하고, 성공 기준을 먼저 정의하라"
source_title: "Anthropic Prompt Engineering을 Claude 업무 활용 기준으로 정리"
source_url: "https://blog.bespinglobal.com/post/anthropic-prompt-engineering-for-claude-work-guidelines/"
source_name: "베스핀글로벌 기술 블로그 (Bespin Global)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "ai"
tags: ["prompt-engineering", "claude", "xml-tags", "evaluation", "anthropic"]
---

# Anthropic Prompt Engineering을 Claude 업무 활용 기준으로 정리 (베스핀글로벌)

> 출처: [Anthropic Prompt Engineering을 Claude 업무 활용 기준으로 정리](https://blog.bespinglobal.com/post/anthropic-prompt-engineering-for-claude-work-guidelines/) (베스핀글로벌) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇) · 정리일 2026-11-18
>
> **출처 한계**: `blog.bespinglobal.com` 접속 차단(ENOTFOUND) 확인, 재시도하지 않았다. Slack 발췌 3줄(끊김)만 근거. 베스핀글로벌의 거의 매일 자사 블로그 RSS 대량 공유 패턴을 감안해 읽을 것.

## 한 줄 요약

**Claude를 업무에 쓸 때 (1) XML 태그로 "입력 데이터"와 "지시사항"의 경계를 명확히 긋고 (2) 프롬프트를 바꾸기 전에 성공 기준과 평가 체계를 먼저 정의하라는, Anthropic 공식 프롬프트 엔지니어링 가이드를 업무 활용 기준으로 재정리한 글.**

## 핵심 포인트

- Claude 활용도를 높이기 위한 ***맥락 중심 프롬프트 엔지니어링과 지시 구조*** 정리.
- 긴 문서 처리 시 ***XML 태그로 입력값과 지시사항을 명확히 구분***하는 기법 — 예: `<document>`에 원문, `<instructions>`에 할 일을 나눠 모델이 "이건 데이터다"와 "이건 지시다"를 혼동하지 않게 한다.
- ***성공 기준과 평가 체계를 사전에 수립***해 AI 업무 품질을 체계적으로 개선 — 일회성 프롬프트 튜닝이 아니라 평가 루프로 접근.
- Slack 발췌가 끊겨 구체적인 평가 지표·사례(어떤 업무에 적용했는지)는 확인 불가.

## 인상 깊은 문장

> (Slack 발췌가 기법 요약 위주로 끊겨 직접 인용 문장을 확보하지 못했다 — 원문 미열람으로 인용 생략.)

## 댓글

베스핀글로벌 자체 블로그, GeekNews/HN/Lobsters 큐레이션 대상 아님. 댓글 수 확인 불가.

## 내 생각 · 적용점

이 글은 **사용자 본인이 Claude Code를 쓸 때 바로 적용 가능한 팁**이라, 적용점을 구체적으로 남긴다.

### 핵심 전이 1 — "줄이기"와 "경계 긋기"는 충돌하지 않는다

[[2026-07-25-context-engineering-rules-claude-5]]는 "시스템 프롬프트를 80% 줄여도 성능 저하가 없었다"며 규칙을 쌓기보다 점진적 공개를 권했다. 이 글의 "XML 태그로 명확히 구분"은 분량을 줄이라는 말이 아니라 **있는 내용의 경계를 명확히 하라**는 것이라 서로 충돌하지 않는다 — 오히려 "짧고 경계가 명확한 지시"라는 공통분모로 수렴한다. **구체적 적용**: 긴 코드/문서를 Claude Code에 붙여넣을 때 `<file>...</file>`와 `<task>...</task>`로 나눠주면 "본문을 지시로 오인"하는 혼동을 줄일 수 있다.

### 핵심 전이 2 — 평가 기준 없는 프롬프트 수정은 "가짜 개선"이다

[[2026-09-21-prompts-dont-exist]]의 경고 — "문구를 다듬는 것만으로는 신뢰성을 유지할 수 없다, 반복 테스트로 실패를 잡아야 한다" — 는 이 글의 "성공 기준·평가 체계를 사전에 수립"이 바로 그 반복 테스트의 전제조건임을 보여준다. 평가 기준 없이 프롬프트만 바꾸면 체감 개선이 실제 개선인지 알 수 없다.

### 핵심 전이 3 — 결정적 검증 원칙과의 결합

[[2026-06-08-anthropic-skills-building-guide]]의 "검증은 결정적 코드로" 원칙과 이 글의 "평가 체계 사전 수립"은 같은 축이다. 프롬프트·Skill이 잘 작동하는지는 사람의 감이 아니라 미리 정한 기준으로 판정해야 한다. **구체적 적용**: 이 knowledge-garden digest 같은 반복 작업은 CLAUDE.md가 이미 "성공 기준" 역할을 하고 있으니, 그 기준에 대조해 결과를 주기적으로 재평가하는 루틴(예: 월간 회고)을 명시적으로 두는 것이 이 글의 권고와 일치한다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** 상담 에이전트 프롬프트에서 "약관 원문은 `<policy>` 태그, 사용자 질문은 `<query>` 태그"로 분리하면 에이전트가 약관 문구 자체를 지시로 오인해 따르는 사고(prompt injection 유사 혼동)를 줄일 수 있다. "성공 기준 사전 수립"은 [[2026-11-17-bespin-ai-ready-data-search-quality-eval]]의 골든셋 구축과 바로 연결된다 — 상담 에이전트 응대 품질도 골든셋 대조 없이는 "개선됐다"고 말할 수 없다.

## 연관 자료

- [[2026-07-25-context-engineering-rules-claude-5]] — "줄이기"와 "경계 긋기"가 충돌하지 않는 같은 축
- [[2026-09-21-prompts-dont-exist]] — 평가 없는 프롬프트 수정의 위험
- [[2026-06-08-anthropic-skills-building-guide]] — "검증은 결정적 코드로" 원칙
- [[2026-11-17-bespin-ai-ready-data-search-quality-eval]] — 골든셋 기반 평가 체계의 구체 사례

## 한 달 뒤 회고

*(2026-12-18 즈음 — Claude Code 작업 지시에 XML 태그 분리를 실제로 적용했는지, 반복 업무의 성공 기준을 문서화하고 대조했는지 기록.)*
