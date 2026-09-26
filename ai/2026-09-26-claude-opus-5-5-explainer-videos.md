---
title: "Opus 5.5는 영상을 만들지 않는다, 영상을 만드는 프로그램을 짠다 — ShipVideo/LaunchVideo (Deedy Das / diggerhq)"
source_title: "shipvideo — Paste a URL or a prompt, get a launch video"
source_url: "https://github.com/diggerhq/shipvideo"
source_name: "GitHub (diggerhq/shipvideo)"
referrer_url: "https://news.hada.io/topic?id=34253"
published_at: "2026-09-24"
summarized_at: "2026-09-26"
category: "ai"
tags: ["claude-opus-5-5", "video-generation", "html-rendering", "opencomputer", "launchvideo", "coding-agent", "deterministic-output"]
---

# Opus 5.5는 영상을 만들지 않는다, 영상을 만드는 프로그램을 짠다

> 출처: [shipvideo (LaunchVideo)](https://github.com/diggerhq/shipvideo) (diggerhq, GitHub · Deedy Das의 X 게시물에서 출발) · GeekNews(id=34253) 경유 · 정리일 2026-09-26
>
> **출처 한계**: `news.hada.io`, `es.news.hada.io`(스페인어 미러), GitHub 저장소 원문 모두 이번 세션 egress 차단이다. HN 스레드("Opus 5.5 is good at explainer videos", item 49836374, 약 177~400점대·100여 댓글로 추정)도 직접 열람하지 못했다. WebSearch로 GitHub 저장소 설명, launchvideo.io 소개, Deedy Das의 원 게시물, 2차 보도(ai-tldr.dev 등)를 교차확인해 재구성했다. 정확한 HN 점수·댓글 수는 출처마다 수치가 달라(177점 vs 약 400점) 확정하지 못한다.

## 한 줄 요약

**LaunchVideo(ShipVideo)는 URL이나 한 줄 프롬프트를 넣으면 20~40초짜리 제품 런칭 영상을 만들어주는데, 핵심은 Claude Opus 5.5가 영상 자체를 생성하는 게 아니라 "영상을 렌더링하는 단일 HTML 필름"을 코드로 작성하고, 그걸 헤드리스 브라우저+ffmpeg가 결정적으로(deterministic) 렌더링한다는 데 있다.**

## 핵심 포인트

- **영상 생성 모델이 아니라 코드 생성** — Opus 5.5가 하는 일은 "HTML을 쓰는 것"이다. 별도의 텍스트-투-비디오 모델 없이, 웹 렌더링 스택(Chromium 헤드리스+ffmpeg)이 그 HTML을 프레임 단위로 캡처해 MP4로 인코딩한다.
- **재현 가능성이 핵심 설계 목표** — ***난수 생성을 금지***해 같은 입력이면 항상 같은 출력이 나오게 만들었다 — 생성형 비디오 모델의 고질적 문제(같은 프롬프트도 매번 다른 결과)를 코드 기반 접근으로 우회한다.
- **자동 분석 파이프라인** — 입력 URL을 웹페이지 자동 분석(제목·설명·색상·폰트 추출)으로 스크래핑하고, 렌더링 검증(JS 에러 확인)까지 거친다.
- **속도와 비용** — 30초 영상이 실제로 30~40초 만에 만들어지는 "거의 실시간" 속도, 필름 하나당 대략 10만 토큰·수 달러 수준으로 알려져 있다(Deedy Das는 "1분에 약 2달러"로 소개).
- **오픈소스 + 원클릭 배포** — opencomputer 템플릿으로 배포 가능(`npx opencomputer template deploy`), Next.js 프론트엔드(web/)와 렌더링 에이전트(opencomputer/)로 구성.
- **HN 반응이 커진 이유** — "예전엔 몇 주~몇 달, 에이전시 조율까지 필요했던 런칭 영상이 1분·몇 달러로 대체됐다"는 비용 절감 폭이 화제의 중심이었던 것으로 보인다(2차 보도 기준, 직접 댓글 확인은 못 함).

## 인상 깊은 문장

> "Opus 5.5 writes HTML, an OpenComputer serverless agent renders it." (GitHub 저장소 설명)

## 댓글

**hada 댓글 수 확인 불가**(원문 차단). **HN 큐레이션 있음** — "Opus 5.5 is good at explainer videos" 스레드가 존재하나(item id=49836374), 점수가 출처마다 177점과 약 400점으로 엇갈려 정확한 수치는 확정 못 했고, 댓글 본문도 스니펫 몇 건("영상은 아웃라인 일부씩 나눠 다루는 게 낫다" 류)만 확인했다. 원 아이디어를 낸 Deedy Das와 실제 구현체(diggerhq/shipvideo)가 다른 주체라, "누가 무엇을 먼저 했는지"는 이 노트 수준에서 완전히 정리되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — "모델이 결과물을 만들지 않고 결과물을 만드는 프로그램을 만든다"는 패턴이 반복되고 있다

[[2026-08-28-antigravity-interactive-ui-artifacts]]에서 본 Interactive Generative UI Artifacts도 정확히 같은 구조다 — 에이전트가 차트나 3D 시뮬레이션을 직접 픽셀로 그리는 게 아니라 HTML/CSS/JS 컴포넌트를 작성하고, 브라우저가 그걸 렌더링한다. shipvideo는 이 패턴을 "정적 화면"에서 "시간축이 있는 영상"으로 한 단계 더 확장한 사례다. **코드 생성 능력이 좋은 모델에게는, 미디어를 직접 생성하는 것보다 "미디어를 만드는 결정적 프로그램"을 생성하게 하는 쪽이 더 안정적인 결과를 낸다**는 게 두 사례가 공통으로 말하는 것 — 재현성·편집 가능성·디버그 가능성이 전부 코드 쪽에 있다.

### 핵심 전이 2 — 같은 모델(Opus 5.5)의 "실사용 사례"가 릴리즈 노트보다 더 많은 것을 말해준다

[[2026-09-23-claude-opus-5-5-release]]에서 정리한 Anthropic 자사 발표는 "비용 40% 절감·속도 30% 향상·장황함 감소"였는데, 이 글은 그 숫자가 실제로 뭘 가능하게 하는지의 구체적 예시다. 코딩·컴퓨터 사용 능력이 좋아졌다는 벤치마크 수치보다, "코드로 영상을 만들 만큼 복잡한 다단계 작업을 안정적으로 완수한다"는 실증 사례 하나가 체감상 더 설득력이 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 낮진 않다.** 온다처럼 B2B SaaS를 파는 조직은 늘 "우리 제품이 뭘 하는지"를 짧은 영상으로 설명해야 하는데, 이 접근(URL/프롬프트 → 코드 생성 → 결정적 렌더링)은 파트너사(호텔) 온보딩 설명 영상이나 신규 기능 소개 영상을 저비용·반복가능하게 자동 생성하는 데 원칙적으로 적용 가능하다. 단, 이 글 자체가 자사/개인 홍보 성격의 데모이므로 실제 프로덕션 품질(브랜드 가이드라인 준수, 다국어 대응)까지 검증된 사례인지는 별도 확인이 필요하다.

## 연관 자료

- [[2026-09-23-claude-opus-5-5-release]] — 같은 모델의 공식 출시 노트, 이 글은 그 모델의 실사용 사례
- [[2026-08-28-antigravity-interactive-ui-artifacts]] — "모델이 코드를 작성하고 렌더러가 실행한다"는 같은 생성 패턴의 정적 버전

## 한 달 뒤 회고

*(2026-10-26 즈음 — HN 스레드 실제 점수·주요 비판(품질 한계, 특정 스타일에만 최적화됐는지)을 확인하고, 온다 내부 데모 영상 제작에 이 패턴을 실제로 시험해봤는지 점검.)*
