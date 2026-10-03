---
title: "SvelteKit 3 출시 (Svelte 팀) — 완성도를 올리기 위해 치른 수십 개의 호환성 파괴, sv migrate가 못 하는 부분은 TODO로 남긴다"
source_title: "SvelteKit 3 is here"
source_url: "https://svelte.dev/blog/sveltekit-3-is-here"
source_name: "svelte.dev (Svelte 팀 공식 블로그) / GitHub CHANGELOG (sveltejs/kit)"
referrer_url: "https://news.hada.io/topic?id=34650"
published_at: "확인 불가 (GitHub CHANGELOG 기준 3.0.0 정식 릴리스, 블로그 정확한 발행일 미확인)"
summarized_at: "2026-10-03"
category: "frontend"
tags: ["sveltekit", "svelte", "vite", "breaking-changes", "migration", "frontend-framework", "typescript"]
---

# SvelteKit 3 출시 (Svelte 팀)

> 출처: [SvelteKit 3 is here](https://svelte.dev/blog/sveltekit-3-is-here) (svelte.dev) · GeekNews(id=34650) 경유 · 정리일 2026-10-03

> **출처 한계**: `news.hada.io`와 `svelte.dev` 모두 이 세션에서 egress 차단으로 직접 열지 못했다. InfoQ·dev.to·daily.dev·byteiota.com 같은 2차 소개 매체도 전부 같은 정책으로 막혔다. 대신 **`github.com/sveltejs/kit`의 공식 `CHANGELOG.md`를 `raw.githubusercontent.com`으로 직접 확보**했다 — breaking change 목록 자체는 Svelte 팀이 각 PR에 직접 남긴 1차 소스라 신뢰도가 높지만, 블로그 포스트가 그 변경들을 어떤 논조·비유로 설명했는지, 왜 지금 이 묶음으로 메이저를 올렸는지에 대한 팀의 서술은 확인하지 못했다. hada 댓글 수·HN/Lobsters 반응도 확인 불가.

## 한 줄 요약

**SvelteKit 3.0이 정식 출시됐다. 라우팅·로드 함수 같은 핵심 구조는 그대로 두고, 완성도와 타입 안전성을 높이기 위해 설정 파일 위치(`vite.config.ts`로 통합)·`$lib` 별칭(`#lib`로 교체)·환경 변수·서비스워커 등 수십 개의 호환성 파괴 변경을 한 번에 몰아서 치렀다. `sv migrate`가 자동화 가능한 부분은 변환하고, 나머지는 TODO 목록으로 남겨 수동 검토를 요구한다.**

## 핵심 포인트

- **설정이 `vite.config.ts`로 완전히 이전** — `svelte.config.js`는 SvelteKit 3에서 ***더 이상 지원되지 않고***, 모든 설정이 Vite 플러그인 옵션 안으로 들어간다. Vite 플러그인이 설정값을 비동기 resolve 단계를 기다리지 않고 동기적으로 읽을 수 있게 하려는 구조적 선택이다.
- **`$lib` → `#lib`, 별도 별칭 대신 표준을 쓴다** — ***`$lib` 별칭을 Node/TypeScript 표준 서브패스 임포트(subpath imports)인 `#lib`로 교체하고 `files.lib` 설정 자체를 제거했다.*** 다만 서브패스 임포트는 Node·TS 요구사항상 모호성을 허용하지 않아, `#lib/foo` 대신 `#lib/foo.ts`나 `#lib/foo/index.ts`처럼 확장자·경로를 명시해야 한다 — 프레임워크 자체 기능 대신 플랫폼 표준에 맞추면서 일부 편의성을 희생한 선택.
- **환경 변수 — "스캔하고 바라기"에서 "선언하고 검증하기"로** — 실험 플래그 뒤에 있던 명시적 환경 변수 기능이 정식으로 승격됐다. `src/env.ts`에 앱이 실제로 의존하는 환경 변수를 선언해두고 빌드 시점에 검증하는 방식으로 바뀐다.
- **서비스워커 보일러플레이트 제거** — 기존 `$service-worker` 모듈을 완전히 삭제하고, `$app/env`·`$app/paths`·새로 생긴 `$app/manifest`에서 다른 코드와 동일한 방식으로 import하게 바뀌었다. `$app/service-worker`에서 `self`를 가져와 fetch 이벤트 타입까지 정확하게 잡을 수 있다.
- **최소 버전이 한꺼번에 크게 올라간다** — Node 22 이상, TypeScript 6 이상, Svelte 5.56.4 이상, Vite 8 이상, `@sveltejs/vite-plugin-svelte` v7을 요구한다. 패키지 하나만 올리는 게 아니라 ***툴체인 전체를 동시에 끌어올려야*** 마이그레이션이 끝난다.
- **`sv migrate`가 자동화 못 하는 부분은 TODO로 남는다** — `npx sv migrate sveltekit-3 --tasks all --confirm`로 변환 가능한 작업은 자동 처리하지만, 공식 CHANGELOG에 쌓인 breaking change는 40건을 넘는다(remote function 타입을 `$app/server`로 이동, `cookie` v2 전환으로 쿠키 이름이 ASCII만 허용, `goto`가 앱 내 경로로 리졸브되지 않으면 리젝트, 모든 에러가 `handleError` 훅을 통과하도록 변경 등). 자동화 밖의 변경은 마이그레이션 도구가 TODO 목록으로 만들어 수동 검토를 요구하는 구조다.

## 인상 깊은 문장

> "breaking: replace the `$lib` alias with `#lib` and remove `files.lib` config."
> (`sveltejs/kit` 공식 CHANGELOG, PR #16360 — 원문 그대로)

> "breaking: delete `$service-worker` module."
> (`sveltejs/kit` 공식 CHANGELOG, PR #16450 — 원문 그대로)

## 댓글

**hada 댓글 수는 egress 차단으로 확인하지 못했다.** HN·Lobsters 큐레이션 여부도 확인 불가. **정직하게 감안할 점**: (1) 이 노트의 "핵심 포인트"는 공식 CHANGELOG(1차 소스)와 WebSearch로 교차확인한 2차 소개 기사(dev.to, InfoQ)의 조합인데, CHANGELOG는 변경 목록이지 "왜 이렇게 설계했는가"에 대한 서술이 없어 그 맥락은 2차 소스 의존도가 높다. (2) breaking change가 40건 넘게 쌓여 한 번에 출시된 메이저 버전이라, 실제 마이그레이션 체감 난이도(특히 `sv migrate`가 커버하지 못하는 비율)는 이 노트에서 확정할 수 없다 — 커뮤니티의 실제 불만·칭찬 비율도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "흉터 조직"을 꿰매는 보기 드문 사례

[[2026-07-20-what-happened-to-the-frontend]]는 프론트엔드 20년사를 "진짜 문제 위에 해결책이 쌓이고, 그 해결책이 다음 문제를 만드는 흉터 조직(scar tissue)"의 8단계 적층으로 그렸다. SvelteKit 3의 변경들(설정 파일 위치 통일, 표준 서브패스 임포트로 교체, 서비스워커 모듈 삭제)은 그 흉터 조직을 새로 덧붙이는 게 아니라 ***기존에 쌓인 프레임워크 자체 관례를 걷어내고 플랫폼 표준에 다시 맞추는*** 방향이다 — 복잡성이 쌓이는 쪽이 아니라 정리되는 쪽에서 보는 드문 사례로 나란히 읽을 수 있다.

### 핵심 전이 2 — 프레임워크 채택 기준이 "에이전트 친화도"로 옮겨간다면, 이런 대규모 breaking change는 비용이 더 커진다

[[2026-09-05-ai-asteroid-hitting-frontend]]는 Cursor·Viget이 기술적 우수성과 무관하게 "에이전트가 더 잘 다룬다"는 이유만으로 Solid·Lit에서 React로 회귀한 사례를 짚었다. 이 관찰이 맞다면, Svelte 생태계처럼 학습 데이터가 React보다 적은 프레임워크가 40건 넘는 breaking change를 한 번에 치르는 것은 에이전트 코딩 도구 입장에서 ***옛 API와 새 API가 뒤섞인 학습 데이터 노이즈***를 늘리는 비용으로 작용할 수 있다 — 사람 개발자에게는 합리적인 정리가, 에이전트 보조 코딩 환경에서는 오히려 채택 장벽이 될 수 있다는 긴장 관계.

### 핵심 전이 3 — 다른 영역에서 동시에 벌어지는 "최소 버전 요구치 급상승"

[[2026-07-09-typescript-7-0-announcement]]는 TypeScript 7.0이 Go 네이티브 이식으로 빌드 속도를 8~12배 끌어올리면서도 "안정적 프로그래밍 API가 아직 없어 6.0과 병행이 필요하다"는 과도기를 만들었다. SvelteKit 3도 TypeScript 6 이상·Vite 8 이상을 한꺼번에 요구하며 비슷한 과도기 비용을 생태계에 떠넘긴다 — 프론트엔드 툴체인 전반이 "점진적 호환"보다 "한 번에 올리고 치운다"는 메이저 버전 전략으로 수렴하는 흐름처럼 보인다.

## 호스피탈리티 / CRS 적용 포인트

**온다의 프론트엔드가 Svelte/SvelteKit 기반이 아니라면 이 릴리스 자체를 직접 적용할 지점은 없다** — 직접 적용은 멀다. 다만 전이 가능한 패턴 하나는 남는다 — ***"자동화 가능한 마이그레이션은 도구로 처리하고, 자동화 밖의 변경은 명시적 TODO 체크리스트로 남긴다"*** 는 `sv migrate`의 설계는, 온다가 내부 라이브러리·프레임워크를 메이저 버전으로 올릴 때 참고할 만한 운영 패턴이다. 특히 CRS처럼 여러 고객사·여러 배포 환경을 동시에 지원해야 하는 B2B 소프트웨어에서는, 메이저 업그레이드 시 "자동 변환 스크립트 + 수동 검토 체크리스트"라는 이분법적 마이그레이션 전략이 호환성 파괴를 다루는 합리적 기본값이 될 수 있다.

## 연관 자료

- [[2026-07-20-what-happened-to-the-frontend]] — 프론트엔드 복잡성이 쌓여온 "흉터 조직" 서사, SvelteKit 3는 그 흉터를 걷어내는 드문 반대 방향 사례
- [[2026-09-05-ai-asteroid-hitting-frontend]] — 프레임워크 채택이 "에이전트 친화도"로 옮겨간다는 관찰, 이 글의 대규모 breaking change는 그 기준에서 비용이 커질 수 있다는 긴장 관계
- [[2026-07-09-typescript-7-0-announcement]] — 같은 시기 프론트엔드 툴체인 전반에서 벌어지는 "최소 버전 요구치 급상승"의 자매 사례

## 한 달 뒤 회고

*(2026-11-03 즈음 — (1) `svelte.dev`·`news.hada.io` 접근이 풀리면 공식 블로그 포스트의 서술(왜 이 묶음으로 메이저를 올렸는지)과 hada 댓글 반응을 직접 확인. (2) `sv migrate`가 실제로 몇 퍼센트의 변경을 자동 처리했는지, TODO로 남긴 항목이 실무에서 얼마나 부담이었는지 커뮤니티 후기 확인. (3) 에이전트 코딩 도구(Claude Code 등)가 SvelteKit 3 문법을 얼마나 빨리 따라잡는지 — [[2026-09-05-ai-asteroid-hitting-frontend]]가 짚은 "에이전트 친화도" 긴장이 실제로 드러나는지 — 점검.)*
