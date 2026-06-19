---
title: "Git 파일 무시는 .gitignore만이 아니다 — '팀 / 저장소별 개인 / 머신 전역' 3계층 (도구 실무 라인)"
source_title: "Gitignore Isn't the Only Way to Ignore Files in Git"
source_url: "https://nelson.cloud/.gitignore-isnt-the-only-way-to-ignore-files-in-git/"
source_name: "nelson.cloud · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30627"
published_at: "2026-06-14"
summarized_at: "2026-06-08"
category: "engineering"
tags: ["git", "gitignore", "tooling", "separation-of-concerns", "developer-experience", "tooling-line"]
---

# Git 파일 무시는 .gitignore만이 아니다 — '팀 / 저장소별 개인 / 머신 전역' 3계층 (도구 실무 라인)

> 출처: nelson.cloud (GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약

**Git의 파일 무시는 *공유 범위에 따라 3가지 계층*이 있다: ① ***`.gitignore`*** (팀이 공유하는 공개 규칙, 저장소와 함께 커밋), ② ***`.git/info/exclude`*** (저장소별 개인 규칙, 커밋 안 됨), ③ ***`~/.config/git/ignore`*** (머신 전역, 모든 저장소 적용). *`.DS_Store` 같은 OS별 파일은 전역에, 개인 작업 노트는 저장소별 exclude에, 프로젝트 모두가 필요한 규칙만 `.gitignore`에*. 디버깅은 *`git check-ignore -v <파일명>`*으로 어떤 규칙이 적용됐는지 추적.**

## 핵심 포인트

- **3계층 = 관심사·범위 분리** — *팀 공유(.gitignore) / 저장소별 개인(.git/info/exclude) / 머신 전역(~/.config/git/ignore)*. **"무엇을 누구와 공유할지"를 범위로 분리** — [[2026-06-08-homelab-ai-dev-platform]] *"무엇을 시스템에 둘지 통제"*와 같은 발상.
- **실무 매칭** — *OS 파일(.DS_Store)=전역, 개인 메모=저장소별 exclude, 프로젝트 공통=.gitignore*.
- **디버깅** — *`git check-ignore -v`로 적용 규칙 추적*.

## 인상 깊은 문장

> "Match the ignore rule to its scope: team, repo-local, or machine-global."
> (무시 규칙을 그 범위에 맞춰라: 팀, 저장소별, 머신 전역.)

## 댓글 (전수 확인)

> GeekNews 직댓글 + HN 큐레이션. **확인:**
- ***sudoeng: "작업 Spec이나 plan.md 같은 걸 `.git/info/exclude`에 넣어도 유용하겠다"*** (AI 시대 워크플로 — 개인 계획 파일을 커밋 없이 보관).
- *yangeok: "루트에 설정하는 게 있었군요"*.
- **HN**: *`.gitattributes`로 diff 무시(package-lock.json)* vs *반박("중요 정보 포함")*·*전역/사용자 제외의 중요성*·*"20년 경력도 처음 앎"*·*`git update-index --assume-unchanged` / `--skip-worktree`*.

→ **무게중심**: *(1) **범위별 무시 분리는 의외로 잘 안 알려진 기능**("20년 경력도 처음"). (2) **AI 시대엔 plan.md·spec 같은 개인 작업 파일을 `.git/info/exclude`로 보관**(sudoeng). (3) `.gitattributes`·`--skip-worktree` 등 인접 기법도.*

## 내 생각 · 적용점

### 5번째 라인업 *도구 실무 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *실용 git 팁*. 가벼운 라인 자산(카운팅 무관). 부채 *−1 유지* (52:41 ≈ 1.27:1).

### 핵심 전이 1 — "무시 규칙도 범위로 분리" = 관심사 분리

전이 가능한 원칙: ***무엇을(팀/개인/머신) 누구와 공유할지를 범위로 명확히 분리***. *팀 공통 규칙만 `.gitignore`에 넣고, 개인 취향·OS 파일은 개인 계층으로* — 저장소를 깔끔하게 유지하는 관심사 분리. 사용자의 개인 프로젝트·CRS 협업에 직접 적용.

### 핵심 전이 2 — "AI 계획 파일을 `.git/info/exclude`로" (AI 시대 워크플로)

sudoeng 댓글의 실용 통찰: ***AI 작업 시 만드는 `plan.md`·`spec`·세션 노트를 `.git/info/exclude`에 넣어 커밋 없이 개인 보관***. 이는 [[2026-06-08-dont-trust-large-context-windows]] *"명세가 진짜 memory"*·[[2026-06-08-ai-demands-more-engineering-discipline]] *"세션·계획을 1급 산출물로"*의 실천 도구 — **AI 계획·맥락을 "내 작업 공간"에 두되 "팀 저장소"는 오염시키지 않기**. 가든·CRS 작업에서 *AI 계획 파일을 개인 계층으로 분리*.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *도구 실무 라인* 가벼운 팁. 부채 *−1 유지* (52:41).

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- nelson.cloud (원문) · [GeekNews — 30627](https://news.hada.io/topic?id=30627)
- [[2026-06-08-homelab-ai-dev-platform]]·[[2026-06-08-software-made-between-commits-deltadb]] — *git·"무엇을 시스템에 둘지 통제"*
- [[2026-06-08-dont-trust-large-context-windows]]·[[2026-06-08-ai-demands-more-engineering-discipline]] — *"AI 계획·세션을 개인 계층에 보관(명세=memory)"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — "무시 규칙 범위 분리"·"AI plan.md를 .git/info/exclude로"를 개인 프로젝트·CRS에 적용했는지 기록.)*
