---
title: "Vercel의 AI 보안 스캐너 DeepSec 깊이 살펴보기 — 패턴 검색이 아니라 코딩 에이전트가 데이터 흐름을 추적해 판단한다"
source_title: "Introducing deepsec: The security harness for finding vulnerabilities in your codebase"
source_url: "https://vercel.com/blog/introducing-deepsec-find-and-fix-vulnerabilities-in-your-code-base"
source_name: "Vercel 공식 블로그 / GitHub(vercel-labs/deepsec), WebSearch 교차확인, GeekNews(id=34093) 경유"
referrer_url: "https://news.hada.io/topic?id=34093"
published_at: "2026-05-04(WebSearch 확인)"
summarized_at: "2026-09-22"
category: "engineering"
tags: ["security-scanner", "ai-agent", "vercel", "vulnerability-detection", "open-source", "false-positive"]
---

# Vercel의 AI 보안 스캐너 DeepSec 깊이 살펴보기

> 출처: [Vercel 공식 블로그](https://vercel.com/blog/introducing-deepsec-find-and-fix-vulnerabilities-in-your-code-base) · [GitHub(vercel-labs/deepsec)](https://github.com/vercel-labs/deepsec) · GeekNews(id=34093) 경유 · 정리일 2026-09-22
>
> **출처 한계**: `news.hada.io`와 `vercel.com` egress 차단으로 원문 직접 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "실제 사이트의 729개 파일을 검사해 잠재적 문…"에서 잘림) + WebSearch(DevOps.com, MindFort, X 공식 계정, GitHub 설명)로 재구성했다. 2026년 5월 4일 오픈소스로 공개된 것으로 WebSearch에서 확인했으나 GeekNews 토픽이 어떤 시점의 어떤 후속 글을 다루는지는 특정하지 못했다.

## 한 줄 요약

**DeepSec은 빠른 패턴 검색으로 의심스러운 코드를 1차 선별한 뒤, Claude나 Codex 같은 코딩 에이전트가 파일 사이의 실제 데이터 흐름과 방어 장치를 추적해 진짜 취약점인지 조사하는 5단계(스캔·조사·재검증·보강·출력) 오픈소스 보안 하네스로, 새 PR뿐 아니라 오랫동안 손대지 않은 기존 코드까지 검사 범위에 포함한다.**

## 핵심 포인트

- **패턴 검색은 1차 필터, 판단은 코딩 에이전트가** — 빠른 패턴 검색으로 의심스러운 코드를 찾고, ***Codex나 Claude가 파일 사이의 데이터 흐름과 방어 장치를 추적해 실제 보안 문제인지 조사***하는 구조다.
- **PR 신규 코드뿐 아니라 방치된 기존 코드까지 검사** — PR의 새 코드뿐 아니라 ***오랫동안 수정하지 않은 기존 코드까지 검사 대상***에 포함하며, 분석 이력을 저장해 중단한 작업을 재개하고 이후엔 변경분만 처리한다.
- **외부 입력 지점 커버리지를 명시적으로 확인** — HTTP 라우트와 웹훅 등 ***외부 입력이 들어오는 지점이 검사 대상에 포함됐는지 확인***하고, 프로젝트의 인증 방식·업무 맥락을 제공해 에이전트의 판단을 돕도록 구성한다.
- **재검증 단계로 오탐률을 관리(WebSearch 보강)** — scan → investigate → revalidate → enrich → export 5단계 중 ***재검증(revalidate) 단계가 에이전트 스스로 발견 사항을 다시 확인***하게 해 오탐률을 대략 10~20% 수준으로 관리한다.
- **기존 구독으로 실행, 제3자 SaaS에 소스 노출 없음(WebSearch 보강)** — 자체 인프라에서 실행되며 Claude·Codex의 ***기존 구독을 그대로 사용***할 수 있고, 원격 병렬 실행이 필요하면 Vercel Sandboxes로 선택적으로 분산 처리(fanout)할 수 있다.

## 인상 깊은 문장

> "실제 사이트의 729개 파일을 검사해 잠재적 문…"
> (Slack GN⁺ 발췌 원문, 문장 중간에서 끊김)

## 댓글

**확인 불가.** hada 댓글 수를 대조하지 못했다. Vercel 자사 발표 도구라 자체 벤치마크(오탐률 10~20%)의 독립적 제3자 검증은 확인하지 못했다는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 "AI 에이전트 기반 보안 도구" 계열에 "재검증 단계로 오탐 관리"라는 구체적 설계 패턴을 더함

가든에는 [[2026-08-18-ly-sage-security-ai-agent-platform]], [[2026-08-28-aws-frontier-agents-security-pentest]], [[2026-08-14-tiro-kiro-iso27001-security-infrastructure]] 등 AI 에이전트를 보안 점검에 쓰는 사례가 이미 여러 개 쌓여 있다. DeepSec이 더하는 것은 ***"스캔 → 조사 → 재검증"이라는 명시적 파이프라인 구조***다 — 에이전트가 찾은 결과를 그대로 신뢰하지 않고 별도 재검증 단계를 강제해 오탐을 줄인다는 설계는, [[2026-08-24-policyguard-semantic-dlp-coding-assistant]]가 다룬 "AI 판단을 어떻게 검증할 것인가" 문제의 실무적 해법 사례로 볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS·PMS처럼 오랫동안 누적된 레거시 코드가 많은 시스템에서 "새 PR만 검사"하는 기존 SAST 도구의 사각지대(방치된 기존 코드)를 메우는 데 참고할 만하다. 특히 예약·결제 API처럼 외부 입력(웹훅, 파트너 연동 엔드포인트)이 많은 도메인에서는 "외부 입력 지점이 검사 대상에 포함됐는지"를 명시적으로 확인하는 설계 원칙을 자체 보안 점검 체크리스트에 반영할 만하다. 다만 오탐률 10~20%는 결코 낮지 않으므로, 재검증 결과를 다시 사람이 최종 확인하는 절차는 유지해야 한다.

## 연관 자료

- [[2026-08-18-ly-sage-security-ai-agent-platform]] — AI 에이전트 기반 보안 플랫폼의 다른 사례
- [[2026-08-28-aws-frontier-agents-security-pentest]] — 에이전트 기반 침투 테스트 자동화
- [[2026-08-24-policyguard-semantic-dlp-coding-assistant]] — 코딩 어시스턴트의 AI 판단 검증 문제

## 한 달 뒤 회고

*(2026-10-22 즈음 — DeepSec의 오탐률에 대한 제3자 검증 사례가 나왔는지, GeekNews 원문이 다룬 "729개 파일 검사" 사례가 어느 실제 사이트였는지 확인.)*
