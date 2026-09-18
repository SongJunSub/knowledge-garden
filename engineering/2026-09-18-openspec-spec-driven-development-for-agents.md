---
title: "OpenSpec — 코딩 에이전트와 구현 전에 명세를 맞추는 개발 도구 (Fission-AI) — 대화 기록에만 남던 요구사항을 propose·apply·archive 세 폴더로 못박아, 사람이 코드 대신 계획을 검토하게 만든다"
source_title: "OpenSpec: Spec-driven development (SDD) for AI coding assistants"
source_url: "https://github.com/Fission-AI/OpenSpec"
source_name: "GitHub (Fission-AI/OpenSpec)"
referrer_url: "https://news.hada.io/topic?id=33841"
published_at: "확인 불가 (지속 업데이트되는 오픈소스 프로젝트, GeekNews 게시 시점 기준 스냅샷)"
summarized_at: "2026-09-18"
category: "engineering"
tags: ["spec-driven-development", "coding-agents", "claude-code", "requirements-management", "context-engineering", "open-source", "developer-tools"]
---

# OpenSpec — 코딩 에이전트와 구현 전에 명세를 맞추는 개발 도구

> 출처: [OpenSpec: Spec-driven development (SDD) for AI coding assistants](https://github.com/Fission-AI/OpenSpec) (GitHub, Fission-AI · MIT) · GeekNews 경유 [id=33841](https://news.hada.io/topic?id=33841) · 정리일 2026-09-18
>
> **출처 한계**: `news.hada.io`는 이번 세션 내내 egress 차단으로 직접 열람하지 못해 hada 댓글 수·GN⁺ 큐레이션 여부는 확인 불가다. 반면 **GitHub 저장소(`github.com/Fission-AI/OpenSpec`)와 README 원문(`raw.githubusercontent.com`)은 이번 세션에서 예외적으로 직접 WebFetch에 성공**해, 아래 핵심 포인트·인용문은 대부분 원문 1차 확인을 거쳤다. Y Combinator 런치 페이지·Thoughtworks Technology Radar 등재 사실은 WebSearch로 교차 확인했으나 직접 열람은 못했다.

## 한 줄 요약

**OpenSpec은 AI 코딩 어시스턴트와 함께 일할 때 대화 기록에만 흩어져 있던 요구사항을 `openspec/` 디렉터리 안의 **명세(specs)**와 **변경 제안(changes)**으로 못박는 오픈소스 SDD(Spec-Driven Development) 프레임워크다. ***"코드 작성 전 계획 수립"*** 원칙 아래, 변경 하나마다 제안서·요구사항 시나리오·기술 설계·작업 목록을 별도 폴더에 모으고, propose(제안) → apply(구현) → archive(보관) 세 단계로 진행하되 ***"waterfall이 아니라 iterative"***라는 원칙대로 진행 중에도 명세와 계획을 수정할 수 있다. Claude Code·Cursor·Codex·GitHub Copilot 등 30개 이상의 AI 도구에서 슬래시 명령으로 붙는다.**

## 핵심 포인트

- **핵심 문제의식** — README 원문: ***"AI coding assistants are powerful but unpredictable when requirements live only in chat history. OpenSpec adds a lightweight spec layer so you agree on what to build before any code is written."*** 즉 요구사항이 채팅 로그에만 남아 다음 세션·다음 사람이 그 맥락을 잃어버리는 문제를 겨냥한다.
- **3단계 워크플로** — `/opsx:propose "add-dark-mode"`로 `openspec/changes/add-dark-mode/`에 제안서(왜, 무엇이 바뀌는지)·명세·설계 문서·작업 체크리스트를 자동 생성 → `/opsx:apply`로 AI가 작업 항목을 순차 구현 → `/opsx:archive`로 완료된 변경을 `archive/` 폴더로 옮기고 현재 명세(`specs/`)를 갱신. `specs/`는 "현재 상태(source of truth)", `changes/`는 "진행 중 제안"으로 명확히 분리된다.
- **핵심 철학 (README 원문 그대로)** — ***"fluid not rigid · iterative not waterfall · easy not complex · built for brownfield not just greenfield · scalable from personal projects to enterprises."*** 정해진 단계를 일방향으로 따를 필요 없이, 진행 중에도 명세·계획을 고칠 수 있다는 설계 의도가 이 다섯 문장에 압축돼 있다.
- **명세는 순수 Markdown** — 특별한 문법 없이 "WHEN-THEN" 형식의 시나리오를 일반 텍스트로 작성한다. 별도 DSL·전용 에디터가 필요 없어 어떤 코딩 도구에서도 바로 읽고 쓸 수 있다는 게 핵심 설계 결정이다.
- **30개 이상 도구 지원** — Claude Code·Cursor·Windsurf·GitHub Copilot·Amazon Q 등에 슬래시 명령과 파일시스템 규약으로 붙는다(벤더 전용 API가 아니라 명령어·파일 컨벤션 기반이라 도구 종속이 없음). 설치는 `npm install -g @fission-ai/openspec@latest` → `openspec init`.
- **규모 지표** — GitHub 기준 약 69.1k 스타, 4.7k 포크, MIT 라이선스, 882 커밋(WebFetch 확인 시점 스냅샷). Thoughtworks Technology Radar에 등재됐고 Y Combinator 런치 페이지도 존재해, 개인 실험 프로젝트를 넘어 업계에서 어느 정도 주목받는 도구로 보인다.
- **경쟁 구도** — GitHub Spec Kit·BMAD-METHOD·Kiro·Cursor 등 여러 SDD 도구 중 하나이며, "BMAD 같은 무거운 강제 워크플로"나 "Kiro 같은 벤더 종속 IDE 통합" 대신 가볍고 도구 비종속적인 포지션을 취한다는 게 비교 분석 글들의 공통된 평가다.

## 인상 깊은 문장

> "AI coding assistants are powerful but unpredictable when requirements live only in chat history. OpenSpec adds a lightweight spec layer so you agree on what to build before any code is written."

> "fluid not rigid — iterative not waterfall — easy not complex — built for brownfield not just greenfield — scalable from personal projects to enterprises."

*(둘 다 `raw.githubusercontent.com/Fission-AI/OpenSpec/main/README.md`에서 직접 WebFetch로 확인한 원문 그대로다.)*

## 댓글

**hada 댓글 수·GN⁺ 큐레이션 여부는 확인 불가.** `news.hada.io`가 이번 세션에서 전면 차단됐다. GitHub `daily-hackernews` 미러 아카이브에서 "OpenSpec – A lightweight and configurable AI spec framework"라는 유사 제목의 HN 항목을 100포인트·40댓글로 확인했으나, ***이 GeekNews 토픽이 정확히 같은 HN 스레드를 가리키는지는 검증하지 못했다*** — OpenSpec은 이미 69k 스타를 가진 기존 프로젝트라 여러 시점에 여러 번 HN에 올라왔을 가능성이 있다.

**읽을 때 감안**
- ① **자사 도구 홍보성 README라는 점** — 철학 선언("fluid not rigid" 등)은 마케팅 카피의 성격이 강하다. 실제 대규모 프로젝트에서 명세-구현 드리프트(명세는 갱신 안 되고 코드만 변경)가 얼마나 자주 발생하는지에 대한 정량 데이터는 README에 없다.
- ② **"AI가 명세를 검토하는 것"과 "사람이 명세를 검토하는 것"의 경계가 흐릿하다** — propose 단계에서 AI가 명세 초안을 작성하면, 결국 사람이 그 초안을 얼마나 꼼꼼히 검토하느냐에 도구의 실효성이 좌우된다. 이 부분은 도구가 강제할 수 없는 사람의 습관 문제로 남는다.

## 내 생각 · 적용점

### 핵심 전이 1 — "관찰된 실패에서만 규칙이 자란다"는 `agent.md`와 정반대의 시간축

[[2026-08-24-agent-md-improve-llm-code-quality]]의 `agent.md`는 ***사후적***이다 — 코드가 나온 뒤 반복되는 리뷰 코멘트를 모아 다음 세션에 주입한다. OpenSpec은 반대로 ***사전적***이다 — 코드가 나오기 전에 "무엇을 왜 바꾸는지"를 명세로 못박는다. 두 접근은 배타적이지 않고 시점이 다른 같은 문제(AI 생성 코드의 방향성 통제)에 대한 답이다 — 실무에서는 OpenSpec으로 "무엇을 만들지" 합의하고, `agent.md`류 파일로 "어떻게 짤지"의 스타일·아키텍처 규칙을 누적하는 조합이 자연스러워 보인다.

### 핵심 전이 2 — 밀도 원칙([[2026-08-09-eight-line-context-file]])과의 긴장

[[2026-08-09-eight-line-context-file]]은 ***"300줄 안에 핵심지시 3줄이 섞이면, 그 3줄은 나머지 297줄에 묻힌다"***며 컨텍스트는 짧을수록 좋다고 주장한다. OpenSpec은 변경마다 제안서·명세·설계·작업목록 네 개 문서를 만드는 구조라 언뜻 정반대로 보이지만, 실제로는 **"매 세션에 다시 주입되는 상시 컨텍스트(agent.md류)"와 "한 변경 건에 한정된 일회성 명세(OpenSpec changes/)"를 구분**하면 둘 다 옳다 — 전자는 밀도가 생명이고, 후자는 오히려 상세할수록 좋다. 이 구분이 가든에 아직 명시적으로 정리된 적이 없어, 이번 노트로 한 축을 추가해두는 의미가 있다.

### 핵심 전이 3 (Claude Code 사용 각도) — 내 실제 워크플로에 바로 시험해볼 만한 도구

과제가 명시했듯 이 글은 코딩 에이전트/하네스 주제라 Claude Code 사용에 직접 참고할 가치가 크다. `/opsx:propose`, `/opsx:apply`, `/opsx:archive` 슬래시 명령이 Claude Code에서 바로 동작한다는 게 확인됐으므로, 이 가든 저장소처럼 "요약 노트 작성"이라는 반복 워크플로가 아니라 **여러 파일에 걸친 구조적 변경**(예: 카테고리 재편, 템플릿 변경, README 인덱스 형식 개편)을 할 때는 지금처럼 CLAUDE.md 지시만으로 진행하는 대신 OpenSpec으로 변경 제안서를 먼저 만들어 검토받는 방식을 시험해볼 가치가 있다 — 특히 "무엇을 왜 바꾸는지"가 커밋 메시지보다 오래 남는 문서로 축적된다는 점이 매력적이다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용 가능성이 상대적으로 높은 편** — 온다의 CRS/PMS 연동 작업은 전형적으로 "이 요금 규칙을 이 순서로 이렇게 바꾼다"는 요구사항이 Slack·회의록에만 흩어지기 쉬운 도메인이다. OpenSpec의 `changes/` 폴더 개념(제안 → 시나리오 → 설계 → 작업목록을 한 곳에)은 파트너사와의 연동 변경 건마다 "무엇을 왜 바꾸는지"를 코드베이스에 남기는 관행으로 그대로 옮겨볼 수 있다.
- 다만 이 도구가 강제하는 건 어디까지나 파일 구조와 워크플로 관행이지, 사람이 실제로 명세를 검토하느냐는 별개 문제라는 점은 위 "읽을 때 감안"과 동일하게 적용된다 — 도구 도입만으로 품질이 보장되지는 않는다.

## 연관 자료

- [[2026-08-24-agent-md-improve-llm-code-quality]] — 사후적으로 리뷰 코멘트를 누적하는 `agent.md`와, 사전에 명세를 합의하는 OpenSpec은 같은 문제(AI 코드의 방향성 통제)에 대한 시점이 다른 답.
- [[2026-08-09-eight-line-context-file]] — "짧을수록 좋다"는 밀도 원칙과 OpenSpec의 "상세한 명세" 지향이 서로 다른 층위(상시 컨텍스트 vs 건별 명세)에 있다는 대비.

## 한 달 뒤 회고

*(2026-10-18 즈음 — ① 이 가든 저장소에 실제로 OpenSpec을 한 번 시험 적용해봤는지 — 예를 들어 README 인덱스 형식을 바꾸는 변경 건에 `/opsx:propose`를 써봤는지 점검. ② `news.hada.io` 접근이 풀렸다면 hada 댓글·GN⁺ 큐레이션 여부를 직접 확인해 이 노트의 "확인 불가" 항목을 메울 것.)*
