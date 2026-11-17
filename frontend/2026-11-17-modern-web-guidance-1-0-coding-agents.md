---
title: "Modern Web Guidance 1.0 (Chrome/Google) — 코딩 에이전트에 웹 플랫폼 전문지식·권장사항·브라우저 호환성 데이터를 스킬로 주입하고, 어떤 가이드를 적용했는지 투명하게 밝힌다"
source_title: "Modern Web Guidance 1.0: The web platform expertise your coding agent is missing"
source_url: "https://developer.chrome.com/blog/modern-web-guidance-v1"
source_name: "Chrome Developers Blog"
referrer_url: "https://news.hada.io/topic?id=37324"
published_at: "2026-11-10"
summarized_at: "2026-11-17"
category: "frontend"
tags: ["coding-agents", "agent-skill", "web-platform", "chrome", "browser-compatibility", "modernization"]
---
# Modern Web Guidance 1.0 (Chrome/Google) — 코딩 에이전트에 웹 플랫폼 전문지식·권장사항·브라우저 호환성 데이터를 스킬로 주입하고, 어떤 가이드를 적용했는지 투명하게 밝힌다

> 출처: [Modern Web Guidance 1.0: The web platform expertise your coding agent is missing](https://developer.chrome.com/blog/modern-web-guidance-v1) (Chrome Developers Blog · 공식 발표 2026-11-10, 직접 열람은 차단되어 WebSearch 스니펫으로 재구성) · 정리일 2026-11-17

## 한 줄 요약

**Chrome 팀이 발표한 Modern Web Guidance 1.0은 코딩 에이전트가 `modern-web-guidance` CLI를 호출해 웹 플랫폼 전문지식·권장사항·브라우저 호환성 데이터를 찾아 쓰도록 하는 에이전트 스킬이다. 1.0에서는 기존 HTML/CSS/JS/`package.json`을 스캔해 안전한 업그레이드 경로를 찾는 현대화 워크플로와, 가이드 미적용 에이전트와 비교하는 공개 평가 대시보드가 추가됐고 Firefox·Edge도 동참했다.**

## 핵심 포인트

- **무엇인가** — 웹 플랫폼 전문지식·권장사항·브라우저 호환성 데이터를 코딩 에이전트에 심어주는 스킬 모음으로, 내부적으로는 에이전트가 `modern-web-guidance` CLI를 호출해 상황에 맞는 최적의 가이드를 찾아오도록 지시하는 구조다. 100개 이상의 웹 개발 use case를 다룬다.
- **크로스 브라우저** — Chrome 주도 프로젝트지만 Firefox와 Edge가 함께 참여를 발표했다.
- **1.0의 신규 기능** — ① 기존 HTML, CSS, JavaScript, `package.json`을 정적 분석해 **안전한 업그레이드 경로**를 찾는 현대화 워크플로, ② 가이드를 적용한 에이전트와 적용 안 한 에이전트를 비교하는 **공개 평가(eval) 대시보드**.
- **투명성 장치** — 에이전트가 응답 끝에 어떤 가이드 ID를 적용했는지, 어떤 주제를 확인했는지 밝히도록 해 "에이전트가 새 기능을 몰래 쓰는" 것을 막는다.
- **설치·연계** — `npx modern-web-guidance@latest install` 또는 Claude Code 플러그인(`claude plugin install modern-web-guidance@claude-plugins-official`)으로 설치하며, Chrome DevTools for agents와 함께 쓰도록 권장한다(가이드로 "쓰는" 것과 DevTools로 "실행·확인하는" 것을 분리).

## 인상 깊은 문장

> (WebSearch 재구성) "it's an agent skill that instructs your coding agent how to call the modern-web-guidance CLI to find and retrieve the best guidance for your use case."

## 댓글

**댓글 수 확인 불가.** news.hada.io·developer.chrome.com 모두 이 세션에서 직접 WebFetch가 막혀(ENOTFOUND) 원문 전체·hada 댓글은 보지 못했다. 다만 WebSearch로 Chrome 공식 블로그 발표(2026-11-10)와 공식 문서(`developer.chrome.com/docs/modern-web-guidance`), 3rd-party 요약(mer.vin)을 교차확인해 핵심 사실의 신뢰도는 비교적 높다. 다만 "비판/논쟁 지점이 있다"는 3rd-party 요약의 언급은 구체 내용까지는 확인하지 못했다 — 정확히 무엇이 비판받는지는 출처 한계로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — "검증 가능한 다이어그램 스킬"과 같은 설계 철학: 결과물 전에 정합성을 확인한다

[[2026-09-25-archify-agent-skill-system-diagrams]]가 다이어그램을 내기 전 스키마·레이아웃·정합성을 전부 검증하듯, Modern Web Guidance도 "에이전트가 적용한 가이드 ID를 공개"하고 "가이드 적용 여부를 eval 대시보드로 비교"한다 — ***에이전트 스킬이 신뢰받으려면 결과물 자체보다 "무엇을 근거로 그렇게 했는지"를 검증 가능하게 노출해야 한다***는 같은 설계 철학이 반복된다.

### 핵심 전이 2 — "반복 실패 패턴을 스킬로 추출"하는 흐름의 또 다른 사례

[[2026-11-14-glue-work-rebuttal-oxide-flake-review]]가 반복되는 연동 실패 패턴을 에이전트 스킬로 추출하자고 제안했다면, Modern Web Guidance는 "에이전트가 반복적으로 구식 웹 패턴을 생성하는 실패"를 브라우저 벤더가 공식 스킬로 선제 해결한 사례다 — ***도구 제작자(브라우저 벤더)가 자기 플랫폼 지식의 최신성을 에이전트 스킬 형태로 직접 배포***하는 흐름은, [[2026-11-10-naver-ai-skill-figma-to-code]]의 "디자인 검수까지 AI가 맡는다"는 흐름과 함께 "도메인 전문지식의 스킬화"라는 더 큰 패턴을 이룬다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다 CRS는 Chrome/웹 플랫폼 벤더가 아니라 이 스킬의 **사용자**일 수 있는 입장이다. 전이 가능한 원칙은: ***CRS 어드민·고객용 웹 UI를 Claude Code 등 코딩 에이전트로 개발할 때, 이런 "최신 웹 표준 가이드" 스킬을 설치해 에이전트가 레거시 패턴(구식 폴리필, 불필요한 라이브러리)을 기본값으로 재생산하지 않도록 하는 것*** — 신규 프로젝트 셋업 체크리스트에 "coding-agent용 웹 표준 가이드 스킬 설치"를 항목으로 추가할 만하다.

## 연관 자료
- [[2026-09-25-archify-agent-skill-system-diagrams]] — *결과물 전 정합성 검증이라는 같은 설계 철학*
- [[2026-11-10-naver-ai-skill-figma-to-code]] — *도메인 전문지식을 AI 스킬로 패키징하는 같은 흐름*
- [[2026-11-14-glue-work-rebuttal-oxide-flake-review]] — *반복 실패 패턴을 에이전트 스킬로 추출한다는 같은 발상*

## 한 달 뒤 회고
*(2026-12-17 즈음 — 온다 프론트엔드 작업에서 코딩 에이전트에 웹 표준 가이드 스킬을 실제로 설치해봤는지, "비판/논쟁 지점"이 구체적으로 무엇이었는지 확인했는지 기록.)*
