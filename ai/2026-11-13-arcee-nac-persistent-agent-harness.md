---
title: "nac (Arcee AI) — 긴 작업에서 원래 목표를 잊지 않게 하는 오픈소스 에이전트 하네스, 일꾼의 맥락은 버리고 '이어갈 상태'만 영속화한다"
source_title: "Introducing NAC, an Open-Source Harness for Long-Running Agent Work"
source_url: "https://arcee.ai/blog/nac"
source_name: "Arcee AI 공식 블로그 (GitHub arcee-ai/nac, Apache-2.0)"
referrer_url: "https://news.hada.io/topic?id=37085"
published_at: "확인 불가"
summarized_at: "2026-11-13"
category: "ai"
tags: ["agent-harness", "nac", "arcee-ai", "long-running-agent", "orchestrator", "thread", "episode", "open-source"]
---

# nac (Arcee AI) — 긴 작업에서 원래 목표를 잊지 않게 하는 오픈소스 에이전트 하네스

> 출처: [Introducing NAC, an Open-Source Harness for Long-Running Agent Work](https://arcee.ai/blog/nac) (Arcee AI 블로그) · GeekNews(id=37085) 경유 · 정리일 2026-11-13

## 한 줄 요약

**nac은 실험·모델 학습·인프라 구축처럼 수십 분~수일 걸리는 작업을 "중앙 오케스트레이터가 계획하고 개별 Thread가 실행"하는 구조로 쪼개, 일꾼(Thread)의 일시적 맥락은 버리더라도 작업을 이어가는 데 필요한 핵심 상태(Episode)만 영속화하는 Apache-2.0 오픈소스 하네스다.**

## 핵심 포인트

- **중앙 오케스트레이터 + Thread** — 오케스트레이터가 전체 작업을 계획하고, 명령 실행·파일 수정 같은 실제 작업은 개별 Thread에 위임. 같은 작업을 이어갈 때는 이전 이력을 가진 Thread를 재사용한다.
- **Episode로 압축** — Thread가 한 단계를 마칠 때마다 핵심 결과만 Episode로 남기고, 오케스트레이터는 이 Episode를 보고 다음 단계를 정하거나 다른 Thread에 맥락으로 넘긴다. ***"일꾼의 짧은 작업 맥락과, 작업을 계속하는 데 필요한 영속 상태를 분리한다"***는 설계가 공식 블로그에 명시돼 있다.
- **병렬 워커 조율** — 복수의 워커를 동시에 조율하면서도 상태는 작업 단위로 지속되도록 설계.
- **샌드박싱** — 2차 자료(중국어 해설글)에 따르면 Podman을 통한 샌드박스 격리를 지원한다고 하나, Arcee 공식 블로그에서 직접 대조하지 못했다.
- **출처 한계**: Slack 요약이 언급한 "프로젝트의 `AGENTS.md`와 에이전트가 목표 이탈을 방지하는 구체 메커니즘"은 WebSearch로 찾은 1차 자료(arcee.ai 블로그)에서 이름 그대로 확인되지 않았다 — 공식 GitHub README의 세부 문서까지는 대조하지 못해 "부분 확인"으로 둔다. news.hada.io는 세션 내 DNS 차단, 댓글 수 확인 못함.

## 인상 깊은 문장

> (원문 요약 기반 패러프레이즈, 직접 인용 대조 불가) "워커의 짧은 실행 맥락은 끝나면 버려도 되지만, 작업을 이어가기 위해 필요한 지속 상태는 별도로 보존해야 한다."

## 댓글

원문 미열람으로 hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 못함.

## 내 생각 · 적용점

### 핵심 전이 1 — "맥락은 버려도 되지만 상태는 영속화한다"는 Pi Durable과 같은 문제의식, 다른 해법

[[2026-10-02-pi-durable-resumable-agent-harness]]는 모든 도구 호출을 `replay: "safe"`로 명시해야만 재실행하게 만들어 "중단 후 재개"의 안전성을 보장했다. nac은 같은 "중단해도 작업을 이어가야 한다"는 문제를 Thread/Episode라는 **조직 구조(오케스트레이터-일꾼 분리)**로 풀었다 — 하나는 재실행의 안전성(언제 다시 실행해도 되는가), 다른 하나는 상태 압축(무엇을 남기고 무엇을 버리는가)에 초점을 맞춘다는 점에서 상호 보완적이다.

### 핵심 전이 2 — "오래 걸리는 작업에서 목표를 잊지 않기"는 [[2026-09-02-trueforge-open-source-agent-harness]]류 오픈소스 하네스의 반복 테마

TrueForge가 모델호출·도구·샌드박스·세션까지 실행 루프 전체를 카탈로그로 묶었다면, nac은 그중 "장시간 작업의 연속성" 한 조각에 집중한 특화형이다. 이 가든에 쌓인 오픈소스 하네스 글들을 보면 다들 "실행(execution)"과 "지속성(persistence)"을 분리하려 한다는 공통 설계 원리가 반복 확인된다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS 운영에서 "장시간 걸리는 배치 작업"(야간 요금 재계산, 대량 재고 동기화, 채널 매니저 재연동 등)을 오케스트레이터-워커 구조로 쪼개고, 각 단계 결과를 Episode처럼 압축 기록해두면 중단 지점부터 재개하기 쉬워진다. 특히 "일꾼의 임시 맥락은 버려도 되지만 작업 재개에 필요한 핵심 상태만 남긴다"는 원칙은 멱등하지 않은 예약·결제 배치 작업의 재시도 설계에 바로 참고할 수 있다.

## 연관 자료

- [[2026-10-02-pi-durable-resumable-agent-harness]] — "중단 후 재개"를 재실행 안전성 선언으로 푼 보완적 해법
- [[2026-09-02-trueforge-open-source-agent-harness]] — 실행 루프 전체를 카탈로그로 묶은 더 넓은 범위의 오픈소스 하네스

## 한 달 뒤 회고

*(2026-12-13 즈음 — nac GitHub(arcee-ai/nac) README에서 AGENTS.md·목표 이탈 방지 메커니즘의 실제 구현을 확인했는지, CRS 야간 배치 작업에 오케스트레이터-워커 구조를 검토했는지 기록.)*
