---
title: "Docker Agent (Docker) - YAML로 AI 에이전트 팀을 정의하고 OCI 레지스트리로 배포하는 공식 CLI 플러그인"
source_title: "Docker Agent: a multi-agent runtime you build, run, and share with a YAML config"
source_url: "https://docs.docker.com/ai/docker-agent/getting-started/introduction/"
source_name: "Docker 공식 문서(docs.docker.com), 2차: WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=34968"
published_at: "확인 불가"
summarized_at: "2026-10-08"
category: "ai"
tags: ["docker", "multi-agent", "yaml", "mcp", "rag", "oci-registry", "agent-orchestration"]
---

# Docker Agent (Docker)

> 출처: [Docker Agent 공식 문서](https://docs.docker.com/ai/docker-agent/getting-started/introduction/) (Docker · GeekNews 경유) · 정리일 2026-10-08

> **출처 한계**: `news.hada.io`와 `docs.docker.com` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. 아래 내용은 Slack GN⁺ 발췌(다섯 문단 중 마지막이 "에이전트 설정을 버전 관리하고 OCI 레지스트리..."에서 끊김)와 WebSearch로 확보한 Docker 공식 문서 스니펫·서드파티 소개 글을 교차확인해 재구성했다. hada 댓글 수·HN/Lobsters 큐레이션 여부는 확인 불가. "Docker Desktop 4.63 이상에 포함"이라는 설치 경로나 정확한 최신 버전 번호는 WebSearch 스니펫 간 시점이 엇갈려 확정하지 못했다.

## 한 줄 요약

**Docker Agent는 YAML(또는 HCL) 파일에 모델·지침·도구를 정의해 AI 에이전트를 만들고 실행하는 Docker 공식 CLI 플러그인으로, 별도 프로그램 작성 없이 여러 전문 에이전트를 계층적 팀으로 묶어 작업을 위임하고, 완성된 팀 설정을 OCI 레지스트리에 올려 그대로 공유할 수 있게 한다.**

## 핵심 포인트

- **YAML/HCL 설정만으로 에이전트 정의** - 모델·지침(instructions)·도구를 코드 작성 없이 선언형 설정 파일에 담아 업무별 에이전트를 구성한다. Docker 공식 문서는 "glue code 없이"라는 표현으로 이를 강조한다(WebSearch 교차확인).
- **계층적 멀티 에이전트 오케스트레이션** - 루트 에이전트가 하위 에이전트에게 작업을 위임하고, 하위 에이전트가 각자 자기 모델·지침·도구를 가질 수 있는 구조다. 여러 전문 에이전트를 팀으로 묶어 작업을 자동으로 위임하는 방식을 지원한다는 Slack 발췌와 일치한다.
- **내장 도구 + MCP 연동** - 생각 정리·할 일·메모리 관리용 내장 도구와, 로컬·원격·Docker 기반 MCP 서버(Docker의 MCP 카탈로그 포함)를 연결해 기능을 확장한다. OpenAI·Anthropic·Google Gemini·AWS Bedrock 등 여러 클라우드 모델 제공업체와 로컬 모델(Docker Model Runner)을 지원한다(WebSearch 교차확인).
- **BM25·임베딩·하이브리드 검색 기반 RAG** - Slack 발췌에 따르면 BM25·임베딩·하이브리드 검색·재순위화(re-ranking) 기반 RAG를 제공해, 에이전트가 문서·지식 베이스를 검색하며 작업하게 한다.
- **여러 인터페이스 + OCI 레지스트리 배포** - TUI(터미널 UI)·헤드리스 CLI·HTTP API·MCP 서버·A2A(Agent-to-Agent) 프로토콜까지 다양한 방식으로 에이전트와 상호작용할 수 있고, 에이전트 설정을 버전 관리해 OCI 레지스트리에 푸시하면 다른 환경에서 그대로 pull해 쓸 수 있다. 이 마지막 부분은 Slack 발췌가 끊긴 지점이라 세부(버전 관리 방식, 레지스트리 태깅 규칙)는 WebSearch로 보강했다.
- Docker 자체의 어시스턴트인 Gordon과는 별개로, Docker 작업에 한정되지 않는 ***범용 멀티 에이전트 런타임***으로 포지셔닝된다(Docker 공식 개요 문서, WebSearch 교차확인).

## 인상 깊은 문장

> "Docker Agent is a multi-agent runtime that lets you build, run, and share AI agents with a YAML or HCL config." (Docker 공식 문서, WebSearch로 확인된 문장. 원문 전체 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 큐레이션 유무도 확인하지 못했다. Docker라는 벤더가 자사 공식 문서로 발표한 제품이라, "glue code 없이"·"원활한 오케스트레이션" 같은 표현이 실제 복잡한 멀티 에이전트 디버깅 상황에서 얼마나 매끄러운지는 제3자 사용 후기로 검증되지 않았다는 점을 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 1 - "멀티 코딩 에이전트 오케스트레이터" 니치에 Docker라는 플랫폼 벤더가 직접 뛰어든 사례

가든은 이미 [[2026-10-01-traycer-multi-agent-orchestration]](Traycer, MIT), [[2026-10-06-openrig-multi-agent-orchestrator]](OpenRig, Seat·Pod·starter/workshop/factory 조직 모델)까지 개인·소규모 팀이 만든 오케스트레이터를 추적해왔다. Docker Agent는 같은 "여러 에이전트를 팀으로 묶는다"는 문제의식을 공유하지만, ***Docker라는 인프라 플랫폼 회사가 자사 생태계(OCI 레지스트리, Docker Desktop, MCP 카탈로그)에 올라탄 공식 제품***이라는 점이 다르다. OpenRig의 "팀 조직 모델"이 소규모 오픈소스 프로젝트의 설계 철학이었다면, Docker Agent는 ***컨테이너 배포 인프라를 에이전트 설정 배포에도 그대로 재사용***한다는 점에서 완전히 다른 층위의 해자(moat)를 갖는다.

### 핵심 전이 2 - [[2026-09-22-mcp-was-always-a-bad-idea]]의 논쟁과 정면으로 마주하는 설계 선택

그 노트는 "최신 모델은 API를 직접 호출·탐색할 수 있어 MCP가 불필요한 중간 계층이 되어가지만, 접근 통제가 필요한 상황에서는 MCP가 여전히 유효하다"는 절충안을 다뤘다. Docker Agent는 MCP를 핵심 연동 수단으로 채택했는데, 이는 Docker라는 회사의 포지셔닝(기업 인프라, 컨테이너 격리, 접근 통제)과 맞아떨어진다 - Docker Agent가 겨냥하는 사용자는 "신뢰할 수 있는 자율 에이전트"보다 "통제·감사가 필요한 엔터프라이즈 에이전트" 쪽에 가깝다고 추정할 수 있다. 다만 이건 Docker의 포지셔닝에 대한 추론이고, 원문에서 직접 확인한 주장은 아니다.

### 핵심 전이 3 - RAG 구성요소(BM25·임베딩·하이브리드·재순위화)를 내장한 것은 [[2026-08-27-rag-is-simpler-than-you-think]]의 교훈과 대조할 지점

그 노트가 "RAG는 생각보다 단순하다"는 취지였다면, Docker Agent가 BM25·임베딩·하이브리드·재순위화까지 한 번에 내장했다는 것은 반대로 "에이전트 플랫폼이 되려면 결국 검색 스택 전체를 패키징해야 한다"는 걸 보여주는 사례로 읽을 수 있다. 플랫폼 벤더 입장에서는 단순함보다 완결성이 채택 장벽을 낮추는 전략일 수 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성이 있는 드문 사례다. 온다가 이미 Docker 기반 인프라를 쓰고 있다면, CRS 내부 자동화(요금 동기화 알림 에이전트, CS 응대 보조 에이전트 등)를 YAML 설정만으로 구성하고 **OCI 레지스트리로 버전 관리·배포**하는 방식은 기존 컨테이너 배포 파이프라인에 그대로 얹을 수 있어 도입 장벽이 낮다. 다만 ①MCP 연동 방식이 실제로 접근 범위를 얼마나 세밀하게 제한하는지, ②멀티 에이전트 간 통신 로그가 감사 가능한지([[2026-08-02-session-portability-inference-api-lockin]]이 요구하는 수준)는 파일럿 전에 직접 검증해야 한다.

## 연관 자료

- [[2026-10-01-traycer-multi-agent-orchestration]] - 같은 "멀티 코딩 에이전트 오케스트레이터" 니치의 선행 사례, Docker Agent는 플랫폼 벤더가 뛰어든 버전
- [[2026-10-06-openrig-multi-agent-orchestrator]] - 조직 모델(Seat·Pod)로 차별화한 또 다른 선행 사례, OCI 레지스트리 배포라는 Docker만의 강점과 대조
- [[2026-09-22-mcp-was-always-a-bad-idea]] - MCP의 존재 이유를 "통제가 필요한 엔터프라이즈 상황"으로 좁힌 논쟁, Docker Agent의 MCP 채택과 맞닿음
- [[2026-08-27-rag-is-simpler-than-you-think]] - "RAG는 단순하다"는 주장과, Docker Agent가 RAG 스택을 통째로 내장한 선택의 대조

## 한 달 뒤 회고

*(2026-11-08 즈음) Docker Agent의 실사용 후기(특히 MCP 연동의 접근 통제 세밀도, 멀티 에이전트 디버깅 경험)가 나왔는지, hada·HN 댓글이 egress 해제 후 확인되면 원문과 대조한다.*
