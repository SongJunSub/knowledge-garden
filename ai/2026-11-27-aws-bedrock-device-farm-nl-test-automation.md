---
title: "Amazon Bedrock과 AWS Device Farm을 활용한 자연어 테스트케이스 자동 실행 시스템 구축 과정 (AWS) — 자연어로 쓴 테스트 시나리오를 MCP 도구 계층이 실기기 세션으로 바꿔 실행하고, 결과를 다시 RAG로 학습시켜 유지보수 부담을 줄인다"
source_title: "Amazon Bedrock과 AWS Device Farm을 활용한 자연어 테스트케이스 자동 실행 시스템 구축 과정"
source_url: "https://aws.amazon.com/ko/blogs/tech/automating-natural-language-test-cases-amazon-bedrock-aws-device-farm/"
source_name: "AWS 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "ai"
tags: ["amazon-bedrock", "aws-device-farm", "mcp", "test-automation", "mobile-testing"]
---

# Amazon Bedrock과 AWS Device Farm을 활용한 자연어 테스트케이스 자동 실행 시스템 구축 과정 (AWS)

> 출처: [Amazon Bedrock과 AWS Device Farm을 활용한 자연어 테스트케이스 자동 실행 시스템 구축 과정](https://aws.amazon.com/ko/blogs/tech/automating-natural-language-test-cases-amazon-bedrock-aws-device-farm/) (AWS 기술 블로그) · 정리일 2026-11-27

> **출처 한계**: `aws.amazon.com`이 egress 차단되어 원문을 직접 열람하지 못했다. WebSearch로 Device Farm MCP 서버(2025년 11월 Managed Appium Endpoint 기반)의 존재와 "테스트 실행 시간 98%, 비용 91% 감소"라는 성과 수치를 2차 출처(besthub.dev)로 교차확인했으나, ***이 AWS 한국 블로그 글이 그 성과 수치와 직접 연결되는지는 확인하지 못했다.*** Bedrock을 "에이전트 두뇌"로 쓰는 구성은 WebSearch로도 별도 확인되지 않았다.

## 한 줄 요약

**Amazon Bedrock과 AWS Device Farm을 결합해, 사람이 자연어로 쓴 테스트 시나리오를 MCP 도구 계층과 워커 큐가 실기기·웹 환경의 실행으로 변환하고, 실행 결과를 다시 RAG로 학습시켜 유지보수 부담을 줄이는 시스템을 만들었다.**

## 핵심 포인트

- **자연어 → 실기기 테스트 변환** — Amazon Bedrock과 AWS Device Farm을 결합해 ***자연어 테스트케이스를 실기기 및 웹 환경에서 자동 실행***하는 시스템을 구축했다는 서술.
- **MCP 도구 계층 + 워커 큐로 분산** — MCP 도구 계층과 워커 큐를 활용해 테스트 실행을 분산하고, 실행 결과를 RAG로 학습시켜 유지보수 효율을 극대화했다는 설명 — WebSearch로 확인된 "Device Farm MCP 서버가 기기 자동 선택·세션 관리·오류 처리를 지원한다"는 구조와 방향이 일치한다.
- **UI 변경에 대한 내구성** — 자연어 기반 테스트 자동화로 UI 변경에 따른 스크립트 수정 부담을 줄이고 실기기 테스트의 진입 장벽을 낮췄다는 서술 — 기존 좌표·셀렉터 기반 테스트 스크립트가 UI 변경마다 깨지는 문제를 자연어 의도 기반으로 우회했다는 의미로 읽힌다.
- **참고 수치(WebSearch, 이 글과의 연결은 미확인)**: 유사한 Device Farm MCP 조합 사례에서 테스트 실행 시간 98%, 비용 91% 감소가 보고된 바 있다 — 이 글이 같은 수치를 주장하는지는 원문 미열람으로 확인 불가.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함. Slack 발췌: "MCP 도구 계층과 워커 큐를 활용해 테스트 실행을 분산하고, 실행 결과를 RAG로 학습시켜 유지보수 효율을 극대화했습니다")

## 댓글

AWS 기술 블로그 사례 공유 글이라 hada 댓글 생태계 밖. 벤더(AWS) 자체 솔루션 조합의 성공 사례로 서술됐을 가능성에 유의 — 실패 사례나 한계는 보통 벤더 블로그에 포함되지 않는다.

## 내 생각 · 적용점

### 핵심 전이 — "AI 생성/실행 결과의 검증"이라는 반복 주제의 변주

이 글은 테스트 자동화 자체에 AI를 쓰는 사례지만, 핵심은 "실행 결과를 RAG로 학습시켜 유지보수 효율을 높인다"는 축적 구조다. [[2026-11-24-evals-underrated-ai-engineering-skill]](평가는 과소평가된 역량, 골든셋도 운영 실패를 계속 먹여야 썩지 않는다)과 같은 원리 — 테스트 결과라는 운영 데이터를 다시 시스템에 먹여 개선한다는 점에서 일치한다. [[2026-11-25-naver-ai-output-trust-mutation-testing]](AI 생성 테스트의 가짜 통과를 돌연변이 테스팅으로 잡는다)과 비교하면 방향이 반대다 — 그 글은 "AI가 만든 테스트를 검증"하는 것이고, 이 글은 "AI가 테스트를 자연어로 실행"하는 것이다. 둘을 합치면 "AI가 테스트를 작성/실행하는 범위"와 "그 결과를 다시 검증하는 범위"를 함께 설계해야 완결된다는 그림이 나온다.

### 적용점

UI 변경이 빈번한 서비스에서 셀렉터 기반 E2E 테스트가 자주 깨지는 문제를 겪고 있다면, 자연어 의도 기반 테스트로 전환하는 것을 검토할 가치가 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS/PMS의 예약·체크인 플로우 UI가 자주 바뀌는 환경에서, 좌표·셀렉터 기반 E2E 테스트 대신 자연어 시나리오("고객이 객실을 선택하고 결제를 완료한다") 기반 테스트로 전환하면 UI 변경에 따른 테스트 유지보수 부담을 줄일 수 있다. 다만 결과 검증(가짜 통과 여부)은 별도 체계가 필요하다.

## 연관 자료

- [[2026-11-24-evals-underrated-ai-engineering-skill]] — 운영 데이터를 지속적으로 먹여야 평가 체계가 썩지 않는다는 원칙
- [[2026-11-25-naver-ai-output-trust-mutation-testing]] — AI 생성 테스트 자체를 검증하는 반대 방향의 사례

## 한 달 뒤 회고

2026-12-27 즈음 — 원문이 열리면 실제 성과 수치(테스트 실행시간·비용 절감률)와 MCP 도구 계층의 구체 구성을 확인한다.
