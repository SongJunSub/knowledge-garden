---
title: "Vomit — Claude의 장황한 출력을 로컬 LLM으로 짧게 정리해주는 도구 (Zach Ahn) — '완전 로컬·무의존성'이라는 신뢰 조건과 '가끔 환각한다·느리다·Mac에서만 테스트함'이라는 저자의 정직한 disclaimer가 같은 README에 나란히 있다. HN 프론트페이지까지 간 반응은 도구 자체보다 '출력이 피곤하다'는 공감대가 더 크다는 신호다"
source_title: "Vomit — Clean up Claude 5's token vomit with a separate LLM"
source_url: "https://github.com/zachahn/vomit"
source_name: "GitHub (zachahn)"
referrer_url: "https://news.hada.io/topic?id=32764"
summarized_at: "2026-08-23"
category: "ai"
tags: ["claude-code", "local-llm", "developer-tools", "output-verbosity", "open-source", "hooks", "token-cost"]
---

# Vomit — Claude의 장황한 출력을 로컬 LLM으로 짧게 정리해주는 도구 (Zach Ahn)

> 출처: [Vomit](https://github.com/zachahn/vomit) (GitHub · Zach Ahn) · 정리일 2026-08-23

## 한 줄 요약

**Claude(특히 Claude 5류 모델)의 장황하고 전문용어 밀도 높은 출력을 별도의 로컬 LLM(Llama.app/Ollama/OpenAI 호환 API)에 다시 통과시켜 간결한 영어로 정리해주는 Go로 만든 CLI 도구다. Hook으로 Claude Code 원출력 자체를 대체하는 침습 모드와, 원출력은 그대로 두고 옆에서 번역본만 보여주는 비침습 모드(`vomit tail`)를 모두 지원한다. "완전 로컬, 텔레메트리 없음"을 내세우면서도 저자가 스스로 "가끔 환각한다·느리다·Mac에서만 테스트했다·완전히 vibe-coded"라고 밝히는 정직한 README가 특징이다.**

## 핵심 포인트

- **핵심 동작** — ***"Vomit converts Claude's token vomit into English by piping it through a local LLM. It's fully local (no telemetry) and has no external dependencies."*** Llama.app·Ollama·OpenAI 호환 API를 백엔드로 지원, 로컬 LLM이 없으면 Llama.app + GPT-OSS 20B 조합을 권장.
- **설치·설정** — `go install github.com/zachahn/vomit@latest` → `vomit init`(LLM 연결 설정) → `vomit scrub -claude`(Hook으로 Claude Code 출력 자체를 대체).
- **비침습 모드** — Hook으로 출력을 아예 갈아치우는 대신, 원본은 그대로 두고 `vomit list`(세션 ID 목록)·`vomit tail [세션ID]`(특정 세션 번역, 인자 없으면 최신 세션 추적)로 옆에서 정리본만 보는 모드.
- **저자가 스스로 밝힌 한계 (README 원문)** — ***"The local LLM can only see what Claude tries to communicate (no access to any actions or files), so it hallucinates a bit"***, ***"It's pretty slow"***, ***"This is totally vibe-coded, only tested on Mac"***, ***"There is a possibility you'll completely miss Claude's message... Vomit does not touch anything during runtime (except technically it writes files to your TMPDIR)"***.
- **HN 프론트페이지 진입** — 2026년 8월, HN에 235포인트로 프론트페이지에 오름(`item?id=49375996`, 정확한 수치는 검색 스니펫 기준). GitHub 신뢰도 지표는 star 150·fork 4·commit 약 30개·open issues 0개로, 5일 만에 빠르게 만들어진 초기 단계 개인 프로젝트다.
- **문제의식** — Claude Code(특히 Opus 5류) 출력이 지나치게 장황하고 전문용어가 밀도 높은("Claudish"라 불리는) 문체라는 불만이 커뮤니티에서 누적돼 있었다는 정황(explainx.ai 등 간접 인용, 원문 미확인)이 이 도구가 나온 배경으로 언급된다.

## 인상 깊은 문장

```
# Vomit
Vomit converts Claude's token vomit into English by piping it through a local LLM. It's fully local (no telemetry) and has no external dependencies.
```

```sh
go install github.com/zachahn/vomit@latest
vomit init
vomit scrub -claude
```

> "There is a possibility you'll completely miss Claude's message. You can use something like [AgentsView] to get the original messages, as Vomit does not touch anything during runtime (except technically it writes files to your TMPDIR)"
> (Claude의 메시지를 완전히 놓칠 가능성이 있다. AgentsView 같은 걸로 원본 메시지를 확인할 수 있다 — Vomit은 실행 중 아무것도 건드리지 않기 때문이다. 단, 기술적으로 TMPDIR에 파일을 쓰긴 한다.)

## 댓글

**GeekNews 원문 페이지는 이번 세션의 네트워크 egress 정책상 접근 불가**(`news.hada.io` 차단) — hada 댓글 수·논조는 확인하지 못했다(사용자가 제공한 "face_vomiting 리액션 1개"는 이 조사가 독립적으로 검증한 정보가 아니라 원 지시문에 있던 정보임을 밝힌다). **HN 큐레이션은 확인됨** — "Vomit: Clean up Claude 5's token output with a separate LLM"(`item?id=49375996`)이 2026년 8월 프론트페이지에 올랐다. 다만 HN 도메인 자체도 접근 차단이라 **정확한 댓글 수·논조는 확인하지 못했다** — "장황한 출력이 피곤하다"는 공감대가 형성됐다는 정도의 맥락만 검색 스니펫으로 확인. 저자 블로그 원문(zachahn.com)도 접근 차단으로 "왜 만들었는지"에 대한 저자 육성은 README의 짧은 disclaimer 수준으로만 확보했다.

## 내 생각 · 적용점

### 핵심 전이 — 장황한 출력은 취향 문제가 아니라 이미 계량된 비용 문제다

[[2026-08-16-maximizing-claude-code-sessions]]가 Anthropic 공식 발표에서 뽑아낸 수치를 그대로 대입하면, **출력 토큰은 입력 토큰의 약 5배 비용**이다. 즉 Vomit이 겨냥하는 "장황함"은 단순히 읽기 피곤하다는 UX 불만이 아니라, **세션마다 실제로 청구되는 비용의 큰 몫**이라는 뜻이다. 다만 Vomit의 접근은 문제를 근본에서 줄이는 게 아니라 **이미 비싸게 생성된 출력을 다시 한번 로컬 LLM에 태워 요약하는** 방식이라, [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]가 강조한 ***"벤더 숫자 말고 내 경계에서 직접 계측하라"***는 원칙에 비춰보면 **원인(장황한 생성)이 아니라 증상(읽기 피곤함)만 해결하는 2차 필터**에 가깝다 — 출력 토큰 비용 자체는 그대로 청구된 뒤에 로컬 LLM 처리 비용이 얹히는 구조이기 때문이다. 그럼에도 이 도구가 HN 프론트페이지까지 간 건, **비용보다 "가독성 피로"가 더 즉각적으로 체감되는 불만**이라는 걸 보여준다 — 사람은 계산기보다 눈이 먼저 지친다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다 개발팀이 Claude Code를 쓰더라도, 저자 스스로 "vibe-coded, Mac에서만 테스트, 가끔 환각"이라 밝힌 초기 단계 개인 도구를 업무 파이프라인에 끼워 넣을 이유는 없다. 다만 원칙은 남는다 — **에이전트 출력이 장황해서 검토 피로가 쌓인다면, "출력을 다시 요약하는 도구"보다 먼저 [[2026-08-16-maximizing-claude-code-sessions]]가 짚은 캐시·모델·effort 설정을 점검해 애초에 덜 장황하게 생성하도록 프롬프트·설정 단에서 손보는 게 더 근본적인 해법**이다. 2차 필터는 증상 완화일 뿐, 원인 처방이 아니다.

## 연관 자료

- [[2026-08-16-maximizing-claude-code-sessions]] — "출력은 입력의 5배 비용"이라는 수치, Vomit이 해결하려는 문제의 실제 비용 근거
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — "벤더 숫자 말고 내 경계에서 직접 계측하라"는 원칙, Vomit이 증상 대응이지 근본 처방이 아니라는 대조점

## 한 달 뒤 회고
*(2026-09-23 즈음 — ①Vomit이 star·활성도 면에서 지속됐는지, 저자가 "totally vibe-coded" 단계를 넘어 안정화했는지 ②이번엔 확인 못한 hada·HN 반응을 나중에라도 확인할 수 있었는지 기록.)*
