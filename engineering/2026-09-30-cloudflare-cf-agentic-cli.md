---
title: "cf - Cloudflare 전체 API를 다루는 에이전트용 CLI (Cloudflare) — Wrangler 명령의 절반이 이미 사람이 아니라 에이전트가 친 것이었다"
source_title: "Introducing cf: the agentic CLI for the entire Cloudflare API"
source_url: "https://blog.cloudflare.com/cloudflare-cf-cli-launch/"
source_name: "Cloudflare Blog"
referrer_url: "https://news.hada.io/topic?id=34473"
published_at: "2026-09-28 (WebSearch 교차확인)"
summarized_at: "2026-09-30"
category: "engineering"
tags: ["cloudflare", "cli", "agentic-tooling", "developer-experience", "wrangler", "vite"]
---

# cf - Cloudflare 전체 API를 다루는 에이전트용 CLI (Cloudflare)

> 출처: [Introducing cf: the agentic CLI for the entire Cloudflare API](https://blog.cloudflare.com/cloudflare-cf-cli-launch/) (Cloudflare Blog) · GeekNews(id=34473) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `news.hada.io`·`blog.cloudflare.com` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. Slack GN⁺ 발췌 4개 불릿(마지막이 Vite 통합에서 절단)과, WebSearch로 확보한 daily.dev·bokvi.com·vibehacker.com 등 제3자 요약 스니펫(모두 같은 Cloudflare 공식 발표를 인용·재서술)을 교차해 재구성했다. 수치(3,000개 이상 작업, 48% 등)는 복수의 제3자 스니펫에서 일관되게 반복돼 신뢰도가 있는 편이지만, Cloudflare 공식 원문 전체 문맥은 대조하지 못했다.

## 한 줄 요약

**Cloudflare가 Wrangler의 약 280개 명령을 넘어 3,000개 이상의 전체 Cloudflare API 작업을 하나의 CLI로 다루는 `cf`를 공개 베타로 내놨다 — 근거는 추상적 "에이전트 친화성"이 아니라, 이미 Wrangler 명령의 절반 가까이가 사람이 아니라 AI 코딩 에이전트가 친 것이었다는 자체 사용량 데이터다.**

## 핵심 포인트

- **왜 지금 만들었나 — 이미 에이전트가 절반을 치고 있었다** — Cloudflare가 밝힌 근거는 ***"Wrangler 명령의 거의 절반이 이제 AI 코딩 에이전트에 의해 실행된다"***는 자체 사용 데이터다. 2026년 3월 25%였던 이 비율이 최근 몇 주 사이 48%까지 올랐고, ***에이전트는 사람보다 2배 많은 종류의 명령을 실행하며, 한 세션에서 6개 이상의 명령을 연쇄 실행할 확률이 4배 높다***는 수치까지 공개했다. "에이전트도 잘 쓸 수 있게"가 아니라 "이미 에이전트가 주 사용자다"라는 관찰에서 설계가 출발했다는 뜻이다.
- **Wrangler 280개 → cf 3,000개 이상** — Wrangler가 지원하던 약 280개 작업을 넘어, Cloudflare API 표면 전체(***3,000개 이상 작업***)를 하나의 CLI에서 다룰 수 있게 했다.
- **기본 JSON 출력 + 자연어 명령 검색** — 기본 출력 형식을 ***JSON***으로 바꿔 에이전트가 파싱하기 쉽게 했고, `cf cli search` 같은 ***자연어 검색으로 필요한 명령을 찾을 수 있게*** 해 에이전트가 매번 전체 명령 목록을 컨텍스트에 욱여넣지 않아도 되도록(시간·토큰 절약) 설계했다.
- **`cloudflare.config.ts` — 설정을 TypeScript 코드로** — 기존 Wrangler의 TOML/JSONC 설정 대신 ***TypeScript 기반 `cloudflare.config.ts`***를 도입해 타입 검사·자동완성을 활용할 수 있게 하고, 공통 설정에서 개발·운영 환경별 구성을 생성할 수 있게 했다.
- **Vite 기본 채택 + 마이그레이션 도구** — 기존 esbuild 대신 ***Vite를 기본 빌드 도구로 채택***해 Cloudflare Vite Plugin과 통합했고, 기존 Wrangler 프로젝트를 변환하는 `cf migrate` 명령을 제공한다. Wrangler는 베타 종료 후에도 ***18개월간 계속 지원***되며, 그 뒤 마지막 메이저 버전에서 사용자를 `cf`로 안내하는 방식으로 전환을 마무리할 계획이다.

## 인상 깊은 문장

> "Nearly half of all Wrangler commands are now issued by AI coding agents — that number was 25% in March 2026 and climbed to 48% in recent weeks. Agents run twice as many distinct commands as humans and are four times more likely to chain six or more commands in a single session."
> (WebSearch로 확보한 제3자 요약 스니펫 재인용, Cloudflare 공식 원문 직접 대조는 못 함)

## 댓글

**hada 댓글 수·HN 큐레이션 여부 확인 불가**(원문 차단). 다만 이 발표는 daily.dev·bokvi.com·vibehacker.com·noise.getoto.net 등 복수의 제3자 개발자 매체가 거의 동시에 다뤘고, 핵심 수치(280→3,000+, 25%→48%)가 여러 스니펫에서 서로 일치해 **사실관계 자체의 신뢰도는 높은 편**이다. 다만 이 수치들은 전부 ***Cloudflare 자사가 공개한 사용량 통계***이고, "에이전트가 명령을 많이 친다"는 것이 "에이전트가 Wrangler를 잘 쓰고 있었다/못 쓰고 있었다" 중 어느 쪽 해석을 뒷받침하는지는 자사 발표만으로는 판단할 수 없다는 점을 감안해야 한다. 실제 개발자 커뮤니티의 반응(호불호, 마이그레이션 저항 등)은 이번 세션에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-09-eight-line-context-file]]의 "탐색 가능 vs 탐색 불가능" 구분이 CLI 설계 층위로 내려온 사례

8줄 컨텍스트 파일 노트의 핵심은 ***"에이전트가 스스로 탐색해 알아낼 수 있는 정보는 적지 말고, 알면서도 안 하는 행동만 명시하라"***는 밀도 원칙이었다. `cf`의 `cf cli search`(자연어로 필요한 명령을 그때그때 찾기)는 정확히 같은 원칙을 **CLI 자체의 설계**로 구현한다 — 3,000개 명령 전체를 에이전트 컨텍스트에 미리 다 넣어두는 대신(밀도를 낮추는 선택), 필요할 때 검색해서 찾게 만들어(탐색 가능한 것은 미리 채우지 않는다) 토큰·시간을 아낀다. 컨텍스트 파일 작성 원칙과 CLI 도구 설계 원칙이 같은 답에 수렴한 사례로 볼 수 있다.

### 핵심 전이 2 — [[2026-09-21-worktrunk-git-worktree-cli]]와 나란히 놓으면 "에이전트 전용 CLI"가 두 가지 다른 계층에서 동시에 나타나고 있다

Worktrunk는 "여러 코딩 에이전트가 서로의 git 작업 공간을 밟지 않게" 격리하는 **오케스트레이션 계층**의 CLI였다. `cf`는 그보다 아래, ***"에이전트가 특정 벤더(Cloudflare) API를 얼마나 효율적으로 호출할 수 있는가"***라는 **개별 서비스 API 계층**의 CLI다. 두 사례를 겹치면, "AI 에이전트를 위한 CLI 재설계"라는 흐름이 오케스트레이션 도구뿐 아니라 각 클라우드/SaaS 벤더의 기존 CLI(Wrangler 같은)에도 번지고 있다는 더 큰 패턴이 보인다 — Cloudflare가 먼저 한 걸음을 뗐고, AWS CLI·gcloud 같은 경쟁 CLI들도 비슷한 재설계 압력을 받을 가능성이 있다(이는 이 노트의 추정이며 검증되지 않았다).

## 호스피탈리티 / CRS 적용 포인트

온다가 Cloudflare를 CDN·Workers 용도로 쓰고 있고 CRS 개발팀이 Claude Code 같은 에이전트로 인프라 작업을 자동화하는 흐름이라면, ① `cf`의 JSON 기본 출력·자연어 명령 검색은 에이전트가 Cloudflare 리소스(도메인·DNS·Workers 설정 등)를 다루는 스크립트를 훨씬 안정적으로 짜게 해줄 수 있고, ② `cloudflare.config.ts`처럼 인프라 설정을 타입 검사 가능한 코드로 옮기는 방향은 CRS 자체의 설정 파일(파트너별 채널 설정, 요금 정책 설정 등)을 "사람도 에이전트도 실수 없이 다룰 수 있게" 만드는 데 참고할 만한 설계 패턴이다. 다만 이는 Cloudflare를 실제로 깊게 쓰고 있을 때의 이야기이고, 이 노트만으로 도입을 권할 근거는 아니다 — Cloudflare 사용 범위가 넓어질 때 재검토할 후보로 남겨둔다.

## 연관 자료

- [[2026-08-09-eight-line-context-file]] — "탐색 가능한 것은 적지 않는다"는 밀도 원칙이 `cf cli search`로 CLI 설계에 구현된 사례
- [[2026-09-21-worktrunk-git-worktree-cli]] — 같은 "에이전트 전용 CLI" 흐름, 다만 오케스트레이션 계층(git 작업 공간)이라는 다른 층위

## 한 달 뒤 회고

*(2026-10-30 즈음 — blog.cloudflare.com 접근이 가능해지면 공식 발표 전문과 실제 개발자 커뮤니티 반응을 확인하고, 온다가 Cloudflare 리소스를 에이전트로 다루는 스크립트에 `cf`를 실제로 검토했는지 점검.)*
