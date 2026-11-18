---
title: "Claude Code Skills, MCP, Hooks를 팀 표준으로 묶어보기 — Skills·CLAUDE.md 분리와 설정 공유 편 (베스핀글로벌)"
source_title: "Claude Code Skills, MCP, Hooks를 팀 표준으로 묶어보기"
source_url: "https://blog.bespinglobal.com/post/bundling-claude-code-skills-mcp-hooks-into-team-standards/"
source_name: "베스핀글로벌 기술 블로그 (Bespin Global)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-18"
category: "engineering"
tags: ["claude-code", "skills", "claude-md", "team-standard", "context-management"]
---

# Claude Code Skills, MCP, Hooks를 팀 표준으로 묶어보기 — Skills·CLAUDE.md 분리와 설정 공유 편 (베스핀글로벌)

> 출처: [Claude Code Skills, MCP, Hooks를 팀 표준으로 묶어보기](https://blog.bespinglobal.com/post/bundling-claude-code-skills-mcp-hooks-into-team-standards/) (베스핀글로벌) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, 16:10:24 KST) · 정리일 2026-11-18
>
> **출처 한계**: `blog.bespinglobal.com` 접속 차단(ENOTFOUND). 제목이 완전히 동일한 짝글 [[2026-11-18-bespin-claude-code-standardizing-team-workflows]](URL slug: `standardizing-team-workflows-with-claude-code-skills-mcp-and-hooks`, 1초 뒤 게시)가 있다. 두 글 모두 원문 접속이 막혀 실제로 동일 글인지 서로 다른 글인지 확정할 수 없다 — Slack 발췌 강조점 차이(이 글: Skills·CLAUDE.md 분리+설정공유 / 짝글: Hooks·MCP 검증표준화)에 근거해 **별개 두 편으로 판단**했으나 이는 추정이다.

## 한 줄 요약

**반복 업무는 Skills로 문서화하고 상시 규칙은 CLAUDE.md로 분리해 컨텍스트 관리를 효율화하며, 프로젝트별 설정을 공유해 팀원 간 작업 방식의 일관성을 유지하자는 글.**

## 핵심 포인트

- Claude Code의 Skills, MCP, Hooks를 활용한 ***팀 단위 AI 코딩 표준 워크플로우***.
- ***반복 업무는 Skills로, 상시 규칙은 CLAUDE.md로 분리***하여 컨텍스트 관리 효율화 — 이 글의 핵심 강조점.
- 프로젝트별 설정 공유를 통해 팀원 간 ***작업 방식의 일관성***을 유지하는 표준화 전략.
- Slack 발췌가 끊겨 "설정 공유"의 구체적 수단(레포 커밋? 템플릿 배포?)은 확인 불가.

## 인상 깊은 문장

> (Slack 발췌만으로는 직접 인용할 문장을 확보하지 못했다 — 원문 미열람으로 인용 생략.)

## 댓글

베스핀글로벌 자체 블로그, GeekNews/HN/Lobsters 대상 아님. 댓글 수 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 레포가 정확히 이 분리를 실천하고 있다

이 글의 "반복 업무는 Skills, 상시 규칙은 CLAUDE.md"는 바로 이 knowledge-garden 레포의 구조다. 매일 반복하는 Slack 다이제스트 파이프라인이 Skill에 해당하고, "AI 저작 표기 금지"·"커밋 1개=요약 1개" 같은 상시 규칙이 CLAUDE.md에 있다. 이 글은 이미 쓰고 있는 구조를 외부 사례로 재확인시켜준다.

### 핵심 전이 2 — "컨텍스트 관리 효율화"는 [[2026-07-25-context-engineering-rules-claude-5]]의 다음 단계

그 글이 "시스템 프롬프트를 80% 줄여도 성능 저하 없다"며 규칙을 압축하는 법을 다뤘다면, 이 글은 압축한 규칙을 ***어디에 보관할지(Skills vs CLAUDE.md)*** 역할을 분리하는 다음 단계 질문이다. 압축만으론 부족하고, 압축된 것의 보관 위치 자체가 컨텍스트 효율에 영향을 준다.

### 핵심 전이 3 — "설정 공유"는 검증 없이는 위험하다

[[2026-09-21-prompts-dont-exist]]의 경고 — 프롬프트/설정이 잘 작동하던 맥락이 바뀌면 효과가 달라진다 — 는 "프로젝트별 설정을 공유"할 때도 그대로 적용된다. 공유된 설정이 모든 프로젝트에서 똑같이 잘 작동하리라는 가정 자체를 검증해야 한다.

## 호스피탈리티 / CRS 적용 포인트

**원칙만 참고.** 팀 표준화 자체는 CRS 도메인 특이적이지 않다. 다만 "반복 업무 vs 상시 규칙 분리"는 CRS 운영 매뉴얼에도 적용 가능한 일반 원칙 — 체크인/체크아웃 같은 반복 절차(Skill 격)와 환불/오버부킹 정책 같은 상시 규칙(CLAUDE.md 격)을 분리해 문서화하면 신규 인력 온보딩에 참고할 만하다.

## 연관 자료

- [[2026-11-18-bespin-claude-code-standardizing-team-workflows]] — 제목 동일 근접 게시물, Hooks/MCP 검증 쪽에 초점
- [[2026-07-25-context-engineering-rules-claude-5]] — 규칙 압축이라는 선행 단계
- [[2026-09-21-prompts-dont-exist]] — 공유 설정의 검증 필요성

## 한 달 뒤 회고

*(2026-12-18 즈음 — 두 글이 실제로 별개였는지 확인 기회가 있었는지, 이 레포의 Skill/CLAUDE.md 역할 분리를 이 글 기준으로 재점검했는지 기록.)*
