---
title: "AI-Infra-Guard (Tencent Zhuque Lab) — AI 인프라와 에이전트를 점검하는 오픈소스 레드팀 플랫폼: 서버 취약점부터 MCP 서버·Agent Skill의 도구 오염·권한 상승까지 한 도구로 스캔한다"
source_title: "AI-Infra-Guard: A full-stack AI Red Teaming platform"
source_url: "https://github.com/Tencent/AI-Infra-Guard"
source_name: "GitHub (Tencent/AI-Infra-Guard, Zhuque Lab)"
referrer_url: "https://news.hada.io/topic?id=34645"
published_at: "확인 불가 (GitHub 저장소 최신 버전 v4.6.2는 2026-09-17 공개, 이 글 자체의 작성/게시일은 특정 못함)"
summarized_at: "2026-10-02"
category: "ai"
tags: ["ai-red-teaming", "vulnerability-scanning", "mcp-security", "agent-security", "tencent", "open-source", "cve", "jailbreak-evaluation"]
---

# AI-Infra-Guard (Tencent Zhuque Lab) — AI 인프라와 에이전트를 점검하는 오픈소스 레드팀 플랫폼

> 출처: [AI-Infra-Guard: A full-stack AI Red Teaming platform](https://github.com/Tencent/AI-Infra-Guard) (Tencent, GitHub) · GeekNews(id=34645) 경유 · 정리일 2026-10-02

> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단돼 직접 열람하지 못했다. 대신 **GitHub 저장소 README는 WebFetch로 전문을 직접 확보**했다 — 이번 배치에서 원문을 가장 온전히 얻은 사례 중 하나다. 다만 hada 댓글 수·HN/Lobsters 큐레이션 유무, 그리고 SkillTrustBench라는 벤치마크를 설계·채점한 주체가 저장소 저자 자신(Tencent)인지 제3자인지는 확인하지 못했다. F1 0.98대 수치는 **저자 측이 자체 공개한 벤치마크 결과**로 읽어야 한다.

## 한 줄 요약

**Tencent Zhuque Lab이 만든 AI-Infra-Guard는 AI 생태계 전체를 공격자 시점에서 점검하는 올인원 오픈소스 레드팀 플랫폼이다 — 실행 중인 Ollama·ComfyUI·vLLM·n8n 같은 서비스의 주소만 입력하면 구성요소와 버전을 식별해 알려진 CVE를 찾아내고(v4.6.2 기준 146개 AI 구성요소, 2,000개 이상의 CVE 규칙), 동시에 MCP 서버나 Agent Skill의 GitHub URL·소스 코드를 분석해 도구 오염·자격 증명 유출·명령어 주입·권한 상승 같은 "에이전트 생태계 특유의" 위험까지 한 도구로 스캔한다.**

## 핵심 포인트

- **세 겹의 스캔 대상 — 인프라·에이전트·탈옥** — ①**AI Infra Scan**: 실행 중인 AI 프레임워크 서비스(Ollama, ComfyUI, vLLM, n8n, LangFlow, MLflow, llama-cpp 등)의 주소를 넣으면 구성요소·버전을 식별하고 알려진 취약점을 매칭한다. ②**MCP/Skills Scan**: MCP Server나 Agent Skill의 GitHub URL 또는 업로드한 소스 코드를 분석해 ***도구 오염(tool poisoning)·자격 증명 유출·명령어 주입·악성 코드·권한 상승*** 등 14개 주요 카테고리의 보안 위험을 탐지한다. ③**Jailbreak 평가**: 프롬프트 자체의 탈옥 위험을 평가한다.
- **규모 — 146개 AI 구성요소, 2,000개 이상 CVE 규칙, 계속 확대 중** — v4.6.0 기준 수치이며, 최신 v4.6.2(2026-09-17)에서만 155개의 신규 CVE 규칙이 추가됐다. 즉 ***고정된 스냅샷이 아니라 계속 갱신되는 규칙 데이터베이스***라는 점이 핵심이다.
- **SkillTrustBench — 자체 벤치마크로 탐지 정확도를 공개** — MCP/Skill 스캔이 9가지 보안 위험 카테고리(T01~T09)를 얼마나 잘 잡는지 자체 벤치마크로 측정해, Claude Opus F1 0.9848, GLM 5.1 F1 0.9836, Gemini 3.5 Flash F1 0.9792라는 수치를 공개했다 — ***탐지 모델로 여러 LLM을 교체 적용할 수 있고, 어떤 LLM을 백엔드로 쓰느냐에 따라 성능이 갈린다***는 뜻이다.
- **Agent Scan — 다중 에이전트 자동화 스캔 프레임워크** — 단일 모델이 아니라 ***여러 에이전트를 조합한 자동화된 공격 시나리오***로 점검하는 별도 모듈(Agent-Scan v5.0.0에서 "뮤테이션 엔진"이 추가됐다는 점이 최신 버전 변경로그에 있다).
- **배포 장벽이 낮다** — Docker 20.10+, 4GB+ RAM, 10GB+ 디스크면 돌릴 수 있는 수준으로, 개인·소규모 팀도 자체 AI 인프라에 바로 스캔을 돌릴 수 있게 설계됐다.

## 인상 깊은 문장

> "A full-stack AI Red Teaming platform securing AI ecosystems via Agent Scan, Skills Scan, MCP scan, AI Infra scan and LLM jailbreak evaluation." (GitHub README, WebFetch로 직접 확보)

## 댓글

**hada 댓글 수는 확인하지 못했다**(원문 차단). HN/Lobsters 큐레이션 유무도 확인되지 않는다. **정직하게 감안할 점**: (1) SkillTrustBench의 F1 수치는 Tencent 자신이 설계·채점한 벤치마크로, 독립 제3자 재현 검증이 있었는지는 확인하지 못했다. (2) 이 도구 자체가 "AI 인프라를 스캔하는 도구"이기 때문에, 도구가 찾아내는 CVE·취약점 규칙의 품질이 곧 이 프로젝트의 신뢰도와 직결되는데, 그 규칙셋의 오탐률·누락률은 README 수준에서는 확인할 수 없다. (3) 중국 기업(Tencent)의 보안 레드팀 도구라는 점에서, 조직에 따라 자체 AI 인프라 정보(구성요소·버전)를 외부 스캐너에 노출하는 것에 대한 신뢰 판단이 추가로 필요할 수 있다 — 이 노트는 그 판단을 대신하지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — Nvidia가 "실행 환경을 감옥으로 만드는" 쪽을 택했다면, 이 도구는 "뚫릴 지점을 먼저 찾아내는" 쪽이다

[[2026-09-30-nvidia-open-agent-safety-platform]]은 에이전트를 안전하게 "학습"시키는 대신 커널 수준 샌드박스(OpenShell)와 네트워크 칩 감시(Sentry)로 실행 환경 자체를 제한하는 방어였다 — 사후 침투를 막는 "성벽"이다. AI-Infra-Guard는 반대 축이다. 성벽을 쌓기 전에 ***"이 성벽에 이미 알려진 틈이 몇 개나 있는가"***를 CVE 매칭과 MCP/Skill 코드 분석으로 먼저 드러낸다. 하나는 실행 시점의 강제(enforcement), 다른 하나는 배포 전·운영 중의 발견(discovery)이라는 점에서, 두 도구는 경쟁하지 않고 같은 방어 스택의 다른 층을 채운다 — 성벽을 쌓는 것과 성벽에 틈이 있는지 주기적으로 점검하는 것은 둘 다 필요하다.

### 핵심 전이 2 — PolicyGuard의 "프롬프트 가로채기"와는 완전히 다른 층위를 본다

[[2026-08-24-policyguard-semantic-dlp-coding-assistant]]는 코딩 어시스턴트에 입력되는 ***프롬프트 콘텐츠***(자격증명·PII가 섞여 들어가는지)를 모델에 닿기 전에 걸러내는 pre-model 레이어였다. AI-Infra-Guard는 프롬프트가 아니라 ***인프라 구성요소의 버전·MCP 서버/Skill의 소스 코드 자체***를 스캔 대상으로 삼는다 — "무엇을 말하는가"가 아니라 "무엇을 실행하고 있는가, 그 실행 코드에 알려진 결함이 있는가"를 본다. 에이전트 하나를 안전하게 운영하려면 이 세 층(실행 환경 제한, 프롬프트 콘텐츠 검사, 인프라/도구 코드 취약점 스캔)이 전부 따로 필요하다는 게 세 노트를 겹쳐 읽을 때 드러나는 그림이다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 Ollama·vLLM 같은 자체 호스팅 LLM 인프라나 내부 MCP 서버(PMS 연동, 채널매니저 API 등)를 운영한다면 직접 적용 가능성이 있다. ①**정기 스캔 루틴** — 내부 AI 인프라 구성요소의 버전을 주기적으로 스캔해 알려진 CVE가 쌓이지 않도록 하는 것은 일반적인 보안 위생(패치 관리)의 AI 특화판이다. ②**외주·오픈소스 MCP 서버 도입 전 점검** — 파트너사나 오픈소스에서 가져온 MCP 서버·Agent Skill을 내부 에이전트에 연결하기 전, 도구 오염·자격 증명 유출 패턴이 있는지 코드 스캔을 거치는 습관은 [[2026-08-24-policyguard-semantic-dlp-coding-assistant]]가 짚은 "통제된 경로가 아니면 우회가 생긴다"는 원칙과 맞물려, 신규 MCP 서버 도입을 "검증 없이 바로 연결"하는 관행을 막는 게이트로 쓸 수 있다. 다만 중국 기업의 오픈소스 보안 도구를 내부 인프라 정보 스캔에 직접 쓸지는 조직의 데이터 거버넌스 정책에 따라 별도로 검토해야 한다 — 이 노트가 그 판단까지 내리지는 않는다.

## 연관 자료

- [[2026-09-30-nvidia-open-agent-safety-platform]] — 실행 환경 자체를 제한하는 "강제" 축의 방어, AI-Infra-Guard의 "발견" 축과 상호보완
- [[2026-08-24-policyguard-semantic-dlp-coding-assistant]] — 프롬프트 콘텐츠를 가로채는 다른 층위의 방어, AI-Infra-Guard는 인프라/도구 코드 자체를 스캔한다는 점에서 구분됨

## 한 달 뒤 회고

*(2026-11-02 즈음 — SkillTrustBench의 F1 수치에 대한 독립 재현 검증이 나왔는지, CVE 규칙 수·지원 AI 구성요소 수가 얼마나 더 늘었는지, hada 댓글이나 HN 반응을 나중에라도 확인할 수 있는지, CRS 내부에서 MCP 서버·Skill 도입 전 코드 스캔 게이트를 실제로 검토했는지 기록.)*
