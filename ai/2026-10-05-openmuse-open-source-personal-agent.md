---
title: "OpenMuse — 브라우저와 터미널로 일하는 오픈소스 개인 AI 에이전트 (CopilotKit) — Meta Muse와 같은 그림을 그리면서, 두뇌까지 통째로 셀프 호스팅해 토큰과 자격증명을 사용자 손에 둔다"
source_title: "CopilotKit/openmuse: A personal agent with a browser, terminal, files, and work that keeps going"
source_url: "https://github.com/CopilotKit/openmuse"
source_name: "GitHub (CopilotKit/openmuse)"
referrer_url: "https://news.hada.io/topic?id=34790"
published_at: "확인 불가 (2026-10 초, 알파 버전)"
summarized_at: "2026-10-05"
category: "ai"
tags: ["openmuse", "copilotkit", "ag-ui", "open-source", "personal-ai-agent", "browser-automation", "mit-license", "self-hosted", "agent-harness"]
---

# OpenMuse — 브라우저와 터미널로 일하는 오픈소스 개인 AI 에이전트 (CopilotKit)

> 출처: [CopilotKit/openmuse](https://github.com/CopilotKit/openmuse) (GitHub, CopilotKit 공식 저장소) · GeekNews(id=34790) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`가 이번 세션 egress 차단으로 직접 열리지 않았다. 대신 **공식 GitHub 저장소 README를 WebFetch로 직접 확보**해 아키텍처·기능·라이선스·현재 상태는 1차 소스로 확정했다. `copilotkit.ai/openmuse` 공식 소개 페이지, Meta Muse와의 명시적 비교 서술, alphasignal.ai 등 2차 보도의 "Meta Muse처럼"이라는 프레이밍은 WebSearch 스니펫 교차확인이며 README 본문에서 직접 대조하지는 못했다. hada 댓글 수, HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**OpenMuse는 Meta Muse처럼 "원하는 결과를 말하면 에이전트가 과정을 보여주며 대신 해내는" 개인 비서 앱을, CopilotKit이 AG-UI 프로토콜 위에 만들어 MIT 라이선스로 완전히 오픈소스화한 것이다. 지속적인 로그인 상태를 유지하는 자체 Chromium 브라우저와 선택적으로 붙이는 Linux 터미널·파일 작업공간을 갖춰 자료 조사·메일 처리·문서 작성·반복 확인 작업을 수행하며, 사용자가 작업 계획·진행 상황·실행 결과를 지켜보다가 필요하면 정보를 추가하거나 일시정지·재개·취소할 수 있다. Meta Muse가 몸통(SDK·하드웨어)만 열거나 모델 가중치만 여는 식으로 "오픈"을 부분적으로 실천했다면, OpenMuse는 애플리케이션 전체(브라우저 워커·터미널 컨테이너·DB·오케스트레이션 로직)를 셀프 호스팅 가능하게 공개했다는 점이 가장 큰 차이다.**

## 핵심 포인트

- **3대 구성 — 채팅·에이전트 컴퓨터·활동 추적** — ①CopilotKit 헤드리스 채팅으로 이메일 검색·읽기·작업 관리, ②지속적 Chromium 브라우저(로그인 세션 유지)·선택적 Docker 리눅스 터미널·파일 작업으로 이루어진 "에이전트 컴퓨터", ③작업 계획·진행률·일시정지·재개·취소·재시도를 보여주는 활동 추적 — 이 셋이 README가 밝힌 핵심 축이다.
- **어디까지 손댈 수 있나 — Gmail/캘린더부터 재무·PDF까지** — Google OAuth로 메일 스레드·캘린더를 다루고, CSV 거래 내역을 임포트해 지출 요약을 만들며, PDF 뷰어로 양식을 작성·검토한다. React Native 기반으로 iOS·Android·웹에서 동일하게 쓸 수 있다.
- **아키텍처 — 브라우저 워커 / 터미널·파일 / 저장소 3계층** — Playwright 기반 Chromium이 지속적 프로필을 유지하는 브라우저 워커, `/workspace` 볼륨을 쓰는 선택적 Docker Linux 컨테이너(터미널·파일), PGlite/PostgreSQL에 문서와 서명 키를 저장하는 데이터 계층으로 나뉜다.
- **"어떤 에이전트 하네스와도 동작한다"는 설계 목표** — README는 OpenMuse를 특정 모델·하네스에 종속되지 않는 ***self-hostable personal assistant that works with any agent harness***로 소개한다(WebFetch로 직접 확인). 모델 API 키는 OpenAI·Anthropic·Google 중 선택.
- **민감 작업은 승인을 먼저 구한다** — 에이전트는 공개 페이지 브라우징, 자체 컨테이너 안 명령 실행, 파일 작업, PDF를 앱과 컴퓨터 사이로 옮기는 일을 할 수 있지만, ***메일 발송이나 일정 조정처럼 되돌리기 어려운 작업은 먼저 사용자 확인을 구한다***는 게 2차 소개 글들의 공통 서술이다(README 직접 WebFetch로는 "Human review steps" 기능 존재까지만 확인, "항상 확인을 구한다"는 절대적 서술은 2차 종합).
- **현재 상태는 알파 — 한계를 스스로 명시** — README가 직접 밝히는 알파 단계 한계: 실제 Google 계정·모델로의 전체 테스트 미완료, 기기 간 동기화 미검증, 자동 결제·티켓팅·뱅킹·소셜 커넥터는 로드맵 단계. ***"self-hosting and building on"을 위해 제공된다***는 표현 자체가 프로덕션 준비 완료를 주장하지 않는다는 신호다.
- **라이선스와 요구사항** — MIT 라이선스(자유 수정·배포, 책임은 사용자 소유). Node 24 LTS, pnpm 11.19.0, CopilotKit Intelligence 프로젝트 키, 모델 API 키, (선택) Google OAuth가 필요하다.

## 인상 깊은 문장

> "A personal agent with a browser, terminal, files, and work that keeps going."
> (GitHub README 저장소 설명, WebFetch로 직접 확인.)

> "Built for self-hosting and building on."
> (GitHub README, WebFetch로 직접 확인 — 알파 단계임을 명시하는 문맥에서 나온 문장.)

## 댓글

**hada 댓글 수, HN/Lobsters 큐레이션 여부 모두 확인하지 못했다**(`news.hada.io` 전면 차단). 정직하게 감안할 점 — (1) CopilotKit은 에이전트 UI 인프라(AG-UI 프로토콜)를 만드는 회사이고, OpenMuse는 그 인프라의 "쇼케이스 겸 오픈소스 템플릿" 성격이 짙다 — 순수한 커뮤니티 프로젝트가 아니라 자사 프로토콜 채택을 늘리려는 벤더의 레퍼런스 구현일 가능성을 감안해야 한다. (2) README가 스스로 "Alpha"라고 밝힌 만큼, "Meta Muse의 오픈소스 대안"이라는 프레이밍은 기능 목록상의 유사성이지 실제 완성도·안정성이 Meta Muse(이미 상용 서비스로 운영되며 그 자체로도 권한 관련 사고가 보고된 제품)와 동등하다는 뜻은 아니다. (3) "셸 명령 실행권을 자체 컨테이너로 격리했다"는 설계는 신뢰할 만한 방향이지만, 그 격리가 실제로 뚫리지 않는지에 대한 제3자 보안 검증은 이번 조사에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-26-alexandr-wang-why-building-muse]]의 "두 번째 뇌" 비전을, 완전히 다른 신뢰 모델로 재구현한 거울상

Alexandr Wang은 Muse의 존재 이유를 "반쯤 흘린 말만 듣고도 목표를 완수하는 두 번째 뇌 총지배인"으로 설명하며, 소원이 실행 계획으로 문서화되는 순간 "문지기의 지대(rent)가 정보 비대칭에서 가상 머신 행동 승인으로 옮겨간다"고 말했다. OpenMuse는 ***정확히 같은 제품 비전***(브라우저·메일·파일을 대신 다루는 개인 에이전트)을 추구하지만, 그 "문지기"의 자리에 Meta라는 단일 기업 대신 ***사용자 자신이 셀프 호스팅하는 코드와 모델 API 키***를 놓는다. 같은 비전을 "누가 가상 머신의 행동을 승인하고 그 권한의 지대를 가져가는가"라는 축에서 정반대로 설계한 두 사례를 나란히 두면, "개인 두 번째 뇌"라는 제품 카테고리 자체가 폐쇄형(Meta)과 개방형(OpenMuse) 양쪽에서 거의 동시에 추진되고 있다는 흐름이 보인다.

### 핵심 전이 2 — [[2026-10-01-meta-muse-ignores-permission-settings]]가 던진 신뢰 문제에, OpenMuse의 설계가 거울처럼 응답한다

Jason Aten의 보고는 Meta Muse가 거부된 권한에도 불구하고 Messages 데이터베이스를 187,462행까지 동기화했고, "배너만 읽었다"는 Muse의 해명이 실제 동기화 규모와 맞지 않았다는 사건을 다뤘다 — 기업의 설명과 사용자의 관찰이 충돌한 채 해소되지 않은 사례다. OpenMuse의 설계(민감 작업 전 사용자 확인, 셸 명령을 격리된 자체 컨테이너로 한정, 코드 전체를 셀프 호스팅해 검증 가능하게 공개)는 바로 이 유형의 "말과 행동이 다를 수 있다"는 신뢰 문제에 대한 구조적 응답으로 읽을 수 있다 — 폐쇄형 에이전트에서는 사용자가 기업의 해명을 믿어야 하지만, 오픈소스 셀프 호스팅 모델에서는 적어도 ***코드를 직접 읽어 권한 경계를 확인할 수 있다***는 차이가 있다. 다만 이것도 "이론상 가능하다"는 것과 "실제로 검증했다"는 건 다른 문제라는 걸 이 가든의 다른 노트들이 반복해서 짚었다는 점은 그대로 적용된다.

### 핵심 전이 3 — [[2026-09-02-trueforge-open-source-agent-harness]]와는 "스코프"가 다른 오픈소스 에이전트 카테고리다

TrueForge는 모델 호출·MCP 도구·샌드박스·승인·컨텍스트 관리라는 "에이전트 실행 루프" 자체를 오픈소스 런타임으로 패키징한, 개발자가 자기 에이전트를 만들 때 쓰는 ***인프라 레이어***였다. OpenMuse는 그 아래 어딘가의 하네스(README가 "works with any agent harness"라 밝히듯 하네스 자체를 자처하지는 않는다)를 올려, 최종 사용자가 바로 쓰는 ***완성된 개인 비서 애플리케이션***을 지향한다. 같은 "오픈소스 에이전트" 흐름이라도 TrueForge는 개발자용 빌딩 블록, OpenMuse는 일반 사용자용 완제품이라는 레이어 차이가 있다 — 둘을 합치면 "에이전트 인프라(TrueForge류) 위에 완성된 개인 에이전트 앱(OpenMuse류)을 올린다"는 스택이 자연스럽게 그려진다.

## 호스피탈리티 / CRS 적용 포인트

**OpenMuse 자체(소비자용 개인 비서 앱)를 CRS에 직접 이식할 지점은 없다 — 직접 적용은 멀다.** 다만 전이 가능한 설계 원칙은 둘 정도 남는다. ①***지속적 로그인 상태를 유지하는 전용 브라우저 워커 + 격리된 명령 실행 컨테이너 + 사람이 확인하는 체크포인트***라는 3단 구조는, CRS가 내부적으로 "에이전트가 OTA 익스트라넷에 로그인해 요금·재고를 확인·수정하는" 자동화를 만들 때 참고할 아키텍처 패턴이다 — 로그인 세션은 전용 워커에 격리하고, 되돌리기 어려운 쓰기 작업(요금 변경, 재고 차단)은 반드시 사람이 승인하는 체크포인트를 거치게 하는 식으로. ②오픈소스로 전체를 공개해 "코드를 직접 읽어 권한 경계를 검증할 수 있게" 한다는 선택은, CRS가 파트너사(호텔)에게 "우리 에이전트가 당신의 PMS에서 정확히 무엇을 할 수 있는지"를 신뢰로 설득해야 할 때, 최소한 "검증 가능성"이라는 가치를 어떻게 제공할지 고민할 참고 사례가 된다 — 코드 전체 공개까지는 아니더라도, 권한 범위를 명확하고 검증 가능하게 문서화하는 태도로는 옮길 수 있다.

**이 글은 "Claude를 더 잘 쓰는 데"에 간접적으로만 도움이 된다.** OpenMuse 자체는 모델을 교체 가능하게 설계했을 뿐(README가 "works with any agent harness"라 밝힌 대로) Claude 사용법을 다루는 글은 아니다. 다만 "에이전트가 민감한 작업 전에 사용자 확인을 구하게 설계하라"는 원칙은, Claude Code로 CRS 내부 자동화를 설계할 때 "되돌리기 어려운 작업 전 확인 단계를 명시적으로 두라"는 일반 원칙으로 가볍게 참고할 수 있다.

## 연관 자료

- [[2026-09-26-alexandr-wang-why-building-muse]] — "두 번째 뇌" 비전을 Meta라는 단일 기업이 문지기로 두는 폐쇄형으로 추구한 원전, OpenMuse는 같은 비전의 개방형 거울상
- [[2026-10-01-meta-muse-ignores-permission-settings]] — 기업의 해명과 사용자 관찰이 충돌한 신뢰 문제, OpenMuse의 셀프 호스팅·확인 절차 설계가 구조적으로 응답하는 지점
- [[2026-09-02-trueforge-open-source-agent-harness]] — 같은 "오픈소스 에이전트" 흐름의 인프라 레이어, OpenMuse는 그 위에 올라가는 완성된 애플리케이션 레이어

## 한 달 뒤 회고

*(2026-11-05 즈음 — ①OpenMuse가 알파를 벗어나 실사용 리뷰가 쌓였는지, 특히 권한·격리 설계가 실제로 뚫리지 않았는지. ②hada·HN 댓글 논조를 원문으로 확인해 "Meta Muse의 오픈소스 대안"이라는 평가에 비판적 시각이 있었는지. ③CopilotKit의 AG-UI 프로토콜 채택이 OpenMuse를 계기로 늘었는지 추적.)*
