---
title: "Claude Code Skill을 활용한 레거시 백오피스 툴 개선기 (게임빌컴투스플랫폼) — 엑셀 한 행 붙여넣기로 16개 언어 완성, 다만 AI가 줄인 건 반복 구현이고 UX·도메인 검증은 그대로 사람 몫이다"
source_title: "[게임빌컴투스플랫폼] Claude Code Skill을 활용한 레거시 백오피스 툴 개선기: 엑셀 한 행 붙여넣기로 16개 언어 완성"
source_url: "https://on.com2us.com/tech/claude-code-skill-backoffice-tool/"
source_name: "게임빌컴투스플랫폼 Hive 애널리틱스 (Com2uS ON Tech)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-06"
category: "engineering"
tags: ["claude-code", "skill", "superpowers", "legacy-modernization", "localization", "backoffice", "ai-coding", "com2us", "source-limitation"]
---

# Claude Code Skill을 활용한 레거시 백오피스 툴 개선기 (게임빌컴투스플랫폼)

> 출처: [Claude Code Skill을 활용한 레거시 백오피스 툴 개선기: 엑셀 한 행 붙여넣기로 16개 언어 완성](https://on.com2us.com/tech/claude-code-skill-backoffice-tool/) (게임빌컴투스플랫폼, Com2uS ON Tech) · Slack `#개발-뉴스-dev-news` 직공유(TechArticles 봇, GeekNews 아님) · 정리일 2026-11-06

## 한 줄 요약

**기존 CKEditor 기반 레거시 백오피스 편집기는 16개 언어 필드를 일일이 수정해야 해 번거롭고 마크업 오류 위험이 컸는데, Claude Code의 Skill과 `frontend-design`·`superpowers` 플러그인을 도입해 엑셀 데이터를 한 번 붙여넣으면 16개 언어를 자동 완성하는 `LangRowEditor`를 하루 만에 구축했다 — 단, AI가 줄인 건 반복 구현 작업이고, 실제 화면에서 발생하는 UX 문제나 도메인 지식이 필요한 비즈니스 로직 판단은 여전히 사람의 세밀한 검증이 필수였다.**

## 핵심 포인트

- **문제**: 기존 CKEditor 기반 편집 방식은 16개 언어를 일일이 수정해야 하는 번거로움과 마크업 오류 위험을 수반.
- **해법**: Claude Code의 'Skill' 기능을 활용해 레거시 백오피스 툴의 편집 방식을 효율적으로 개선.
- **구축 속도**: Claude Code와 `frontend-design`, ***`superpowers`*** 플러그인을 도입해 엑셀 데이터를 한 번에 붙여넣어 16개 언어를 자동 완성하는 `LangRowEditor`를 **하루 만에** 구축.
- **워크플로우**: 특히 `superpowers` 플러그인을 통해 기획부터 PR 생성까지 ***체계적인 워크플로를 유지***하며 레거시 코드를 안전하게 개선할 수 있었음.
- **한계(원문 발췌 기준)**: AI가 코드 구조와 로직을 빠르게 구현함에도 불구하고, 실제 화면에서 발생하는 UX 문제나 특정 도메인 지식이 필요한 비즈니스 로직은 여전히 사람의 세밀한 검증과 판단이 필수적이었음. 결과적으로 AI는 반복적인 구현 업무를 획기적으로 줄여주었으나, 사람은 시스템의 맥락을 정의하고 최종 품질을 관리하는 역할에 집중함으로써 개발 효율을 극대화할 수 있었음.

## 인상 깊은 문장

> "AI가 코드 구조와 로직을 빠르게 구현함에도 불구하고, 실제 화면에서 발생하는 UX 문제나 특정 도메인 지식이 필요한 비즈니스 로직은 여전히 사람의 세밀한 검증과 판단이 필수적이었습니다." (Slack 발췌, thread reply)

> "결과적으로 AI는 반복적인 구현 업무를 획기적으로 줄여주었으며, 사람은 시스템의 맥락을 정의하고 최종 품질을 관리하는 역할에 집중함으로써 개발 효율을 극대화할 수 있었습니다." (Slack 발췌, thread reply)

## 댓글

TechArticles 봇이 Com2uS ON Tech 블로그 글을 Slack에 직접 공유한 글로, GeekNews(hada.io) 댓글이나 HN·Lobsters 큐레이션 대상이 아니다. 원문은 **WebFetch로 접근 시도했으나 `on.com2us.com`이 이 세션의 네트워크 정책상 egress 차단(getaddrinfo ENOTFOUND)**되어 직접 열람하지 못했고, WebSearch로도 "LangRowEditor"·"컴투스플랫폼 Claude Code Skill" 관련 1차 소스를 찾지 못했다(일반적인 Claude Code Skill 소개 자료만 확인됨). 이 노트는 **Slack 발췌(본문 + thread reply)만을 근거**로 작성했으며, `LangRowEditor`의 구체적 구현 방식이나 Skill 정의 파일 내용은 확인 불가로 남긴다. "하루 만에 구축"은 저자 측 주장으로, 독립적으로 재현·검증된 수치는 아니다(n=1 사례).

## 내 생각 · 적용점

### 핵심 전이 1 — "AI는 구현을, 사람은 맥락 정의와 품질 관리를" — 이 가든이 반복적으로 확인하는 분업선

이 글이 스스로 요약한 결론은 이미 이 가든에 여러 번 등장한 패턴과 정확히 일치한다. [[2026-11-04-critical-thinking-when-agents-do-work]]의 "결과를 설명 못하면 이미 주도권을 넘긴 것"이나 [[2026-11-05-how-i-use-ai-october-2026]]의 "AI가 쓴 4천 줄을 사람이 수백 줄로 되돌렸다"와 같은 축이다 — **AI 도입으로 줄어드는 것은 반복 타이핑이고, 줄어들지 않는(오히려 역할이 선명해지는) 것은 도메인 판단과 검증 책임**이다. 다만 이 글은 그 긴장을 숨기지 않고 정직하게 서술한 드문 "성공담 + 한계 인정" 사례다.

### 핵심 전이 2 — `superpowers` 플러그인: "기획→PR까지 체계적 워크플로"가 반복해서 거론되는 이유

이 가든에는 `superpowers` 플러그인을 다룬 [[2026-10-20-superlite-claude-code-plugin-faster-than-superpowers]]가 이미 있는데, 그 글은 superpowers보다 더 가벼운 대안(superlite)을 제안하는 내용이었다. 이번 Com2uS 사례는 반대로 **superpowers를 실제 現업 백오피스 개선에 적용해 효과를 본 1차 사례**라, "가볍고 빠른 대안이 필요하다"는 비판과 "체계적 워크플로가 실제로 레거시 개선에 도움이 됐다"는 긍정 사례가 동시에 존재하는 셈이다 — 두 글을 같이 보면 superpowers류 플러그인의 트레이드오프(속도 vs 구조)가 더 선명해진다.

### 핵심 전이 3 — 레거시 다국어 편집이라는 "지루하지만 리스크 있는" 작업이 AI 도입의 좋은 첫 타깃

16개 언어 필드를 사람이 일일이 고치는 작업은 지루하면서도 마크업 오류라는 실질적 리스크가 있는, AI 코딩 에이전트 도입의 교과서적인 좋은 첫 타깃이다. 같은 Com2uS 조직의 [[2026-10-12-com2us-designer-ai-workflow]](디자이너의 AI 실무 활용법)와 묶어 보면, 이 회사는 **개발·디자인 양쪽에서 "완성작을 통째로 AI에 맡기기"보다 "반복·검증 가능한 특정 작업 단위에 AI를 끼워 넣는"** 보수적이고 실용적인 도입 패턴을 일관되게 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음.** CRS/PMS의 어드민·백오피스 화면도 다국어(객실명, 요금 플랜명, 정책 문구 등)를 다수 언어로 동시 관리해야 하는 경우가 흔하고, 레거시 CKEditor류 편집기에 갇혀 있는 경우도 많다. **엑셀/시트 데이터를 붙여넣으면 N개 언어 필드를 한 번에 채우는 Skill 기반 보조 편집기**는 온다의 내부 운영툴 개선에 그대로 적용 가능한 아이디어다. 다만 이 글이 명시한 한계 그대로, 숙박업 특유의 도메인 지식(지역별 요금 표기 규칙, 통화 표기, 법적 고지 문구 등)은 AI가 자동 완성한 결과를 사람이 반드시 재검증해야 하는 영역으로 남을 것이다.

## 연관 자료

- [[2026-10-20-superlite-claude-code-plugin-faster-than-superpowers]] — *같은 superpowers 플러그인을 다루는 반대 관점(가벼운 대안 제안) vs 이 글의 실전 적용 성공담*
- [[2026-11-04-critical-thinking-when-agents-do-work]] — *"AI 결과를 설명 못하면 이미 주도권을 넘긴 것" — 같은 분업선*
- [[2026-11-05-how-i-use-ai-october-2026]] — *AI가 늘린 코드를 사람이 되돌리는 같은 검증 병목 패턴*
- [[2026-10-12-com2us-designer-ai-workflow]] — *같은 Com2uS 조직의 AI 도입 시리즈, 디자이너 쪽 실무 활용 사례*

## 한 달 뒤 회고

*(2026-12-06 즈음 — Com2uS가 Claude Code Skill 적용 사례를 더 공개했는지, 온다 CRS 백오피스 다국어 편집 개선에 이 아이디어를 실제로 검토했는지 점검.)*
