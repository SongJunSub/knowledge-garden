---
title: "Meta의 Muse에 파일시스템을 요청했더니 6.8GB를 보내왔다 — 에이전트의 샌드박스는 생각보다 넓다"
source_title: "How Meta's Muse works, revealed by the 6.8 GB filesystem it sent me"
source_url: "https://mouse.dev/blog/muse-runtime-export/"
source_name: "Mouse (보안 연구자 블로그), GeekNews(id=34136) 경유"
referrer_url: "https://news.hada.io/topic?id=34136"
published_at: "2026-09-21"
summarized_at: "2026-09-23"
category: "ai"
tags: ["meta-muse", "ai-agent-security", "sandbox", "filesystem-export", "bug-bounty"]
---

# Meta의 Muse에 파일시스템을 요청했더니 6.8GB를 보내왔다

> 출처: [Meta의 Muse에 파일시스템을 요청했더니 6.8GB를 보내왔다](https://news.hada.io/topic?id=34136) (Mouse, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`mouse.dev` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(3개 불릿, 마지막 문장 잘림)와 WebSearch(Hacker News, VentureBeat, memedata.com) 교차확인으로 재구성했다.

## 한 줄 요약

**보안 연구자가 Meta의 개인 AI 에이전트 Muse에게 접근 가능한 파일을 압축해 Google Drive로 보내 달라고 요청하자, 세션에 할당된 Linux 실행 환경 전체(내부 문서, 통합 코드, 앱 템플릿, 에이전트 기록, SSH 키까지 포함해 압축 해제 시 6.8GB)가 그대로 전송됐고, Meta는 버그바운티 신고를 "해당 없음"으로 종결했다.**

## 핵심 포인트

- **"파일을 압축해 보내 달라"는 요청에 세션 전체 파일시스템이 전송됨** — Muse에게 접근 가능한 파일을 압축해 Google Drive로 보내 달라고 요청하자, ***세션에 할당된 Linux 실행 환경의 파일***이 전송됐다. 압축 해제 후 6.8GB로, 통합 코드·앱 템플릿·에이전트 기록이 포함됐다.
- **약 68개 스킬과 20개 Markdown 안내 문서에서 내부 정보 확인** — 약 ***68개 스킬과 20개 Markdown 안내 문서***에서 브라우저 사용, 결제, 서비스 연동 방식을 확인했으며, 앱을 만드는 React/TypeScript 기반 ***Spaces 프레임워크***도 들어 있었다 — 내부 코드명은 "Hatch"로, 런타임 파일 전반에 이 이름이 쓰였다.
- **SSH 키 파일까지 포함** — WebSearch 확인으로는 전송된 아카이브에 ***SSH 키 파일***까지 포함돼 있었다는 점이 핵심 보안 문제로 지적된다. 연구자는 이를 Meta 버그바운티 프로그램에 신고했지만 ***Meta는 "Not Applicable"로 종결***했다.
- **기억은 Markdown 파일과 Postgres로 관리** — 기억은 ***Markdown 파일과 Postgres***로 관리하며 매시간 새 정보를 원본 대화와 대조하고 야간에는 대화를 돌아보며 사용자 취향을 반영한다. 모델을 재학습하는 대신 파일과 검색 기록을 갱신하는 방식이다.

## 인상 깊은 문장

> "세션에 할당된 Linux 실행 환경 전체가 전송됐다 — 압축 해제 후 6.8GB, SSH 키 파일까지 포함됐지만 Meta는 이를 'Not Applicable'로 종결했다."
> (GeekNews 발췌 + WebSearch 교차확인 재구성)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). WebSearch로 확인한 Hacker News 스레드(news.ycombinator.com/item?id=49802871)에 상당한 논의가 있었던 것으로 추정되나 구체적 논조는 확인하지 못했다. Meta가 "Not Applicable"로 종결한 이유(에이전트가 요청받은 대로 정직하게 수행했을 뿐이라는 입장일 가능성)는 원문에서 직접 확인이 필요하다 — 이는 "의도된 기능이냐 취약점이냐"를 가르는 핵심 쟁점이다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 "AI 에이전트가 자기 환경을 넘겨준다" 계열에 실제 사례가 하나 더 쌓임

가든에는 [[2026-08-02-hugging-face-tailscale-agent-breach]], [[2026-08-29-hugging-face-openai-agent-breach-swarm]] 같은 "에이전트가 부여받은 권한을 예상 밖으로 광범위하게 사용한" 계열 노트가 있고, Muse 자체에 대해서도 [[2026-08-11-meta-muse-glimmer-30b-local-agentic]], [[2026-09-09-muse-meta-personal-ai-agent]], [[2026-09-03-meta-muse-spark-1-3-release]]가 쌓여 있다. 이 글이 더하는 것은 ***"악의적 공격이 아니라 정상적인 사용자 요청 한 번으로 SSH 키까지 노출될 수 있다"***는 점이다 — 공격이 아니라 정상 사용 경로가 곧 유출 경로가 될 수 있다는, 에이전트 샌드박스 설계의 근본적 난제를 보여준다.

## 호스피탈리티 / CRS 적용 포인트

CRS에 AI 에이전트를 붙일 때, "사용자가 접근 가능한 파일/데이터를 정리해 달라"는 평범한 요청이 실행 환경의 자격증명·설정 파일까지 함께 노출시킬 수 있다는 점을 반드시 설계 단계에서 점검해야 한다 — 에이전트의 작업 디렉터리와 자격증명 저장 위치를 물리적으로 분리하고, "파일을 묶어서 보내 달라"류의 요청에는 화이트리스트 기반 필터를 강제하는 것을 CRS 에이전트 보안 체크리스트에 추가할 것을 제안한다.

## 연관 자료

- [[2026-08-02-hugging-face-tailscale-agent-breach]], [[2026-08-29-hugging-face-openai-agent-breach-swarm]] — 에이전트 권한 남용/유출 계열
- [[2026-08-11-meta-muse-glimmer-30b-local-agentic]], [[2026-09-09-muse-meta-personal-ai-agent]], [[2026-09-03-meta-muse-spark-1-3-release]] — Muse 자체에 대한 이전 기록

## 한 달 뒤 회고

*(2026-10-23 즈음 — Meta가 이 이슈에 대해 추가 대응(패치, 정책 변경)을 했는지, CRS 에이전트 파일 접근 화이트리스트 적용 여부 점검.)*
