---
title: "Pine - 파일과 메시지, 기기 변화에 반응해 작업하는 AI 에이전트 하네스 (GeekNews, 동명 프로젝트 특정 실패) — 개인 개발자의 에이전트 하네스 경쟁에 또 하나"
source_title: "Pine - 파일과 메시지, 기기 변화에 반응해 작업하는 AI 에이전트 하네스"
source_url: "https://news.hada.io/topic?id=37742"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37742"
published_at: "확인 불가"
summarized_at: "2026-11-24"
category: "ai"
tags: ["agent-harness", "event-driven-agent", "automation", "unverified"]
---

# Pine - 파일과 메시지, 기기 변화에 반응해 작업하는 AI 에이전트 하네스 (GeekNews)

> 출처: [Pine - 파일과 메시지, 기기 변화에 반응해 작업하는 AI 에이전트 하네스](https://news.hada.io/topic?id=37742) (GeekNews) · 정리일 2026-11-24

> **출처 한계 — 동명 프로젝트 특정 실패**: `news.hada.io`가 세션 차단으로 원문을 못 열었고, WebSearch로 이 글이 묘사하는 기능(스캔 폴더/메일/Slack/Telegram/웹훅/RSS/MQTT 연동, 담당 에이전트+도구+스킬+반복일정 구성)을 종합하는 단일 "Pine" 공식 소스를 찾지 못했다. 가장 근접한 결과는 pmndrs 조직의 오픈소스 "pine"(이벤트 소스 구독형 리액티브 하네스, npm 배포, `pine start` 데몬 모드, git 변경·파일·도구출력을 보여주는 코드 패널)이지만 메일·Slack·Telegram·MQTT 연동이나 멀티에이전트 구성은 확인하지 못했다. 별도로 발견한 `@piagent/platform` 체인지로그는 "저장소 변경사항을 대화별로 리뷰"하는 다른 프로젝트로 보여 동일 제품 여부가 불확실하다. Slack 발췌의 구체 기능은 전부 미교차확인 상태로 남는다.

## 한 줄 요약

**새 파일·메일·메시지 같은 이벤트가 발생하면 AI 에이전트가 자동으로 작업을 시작하는 실행 환경 Pine을 소개하는 글이지만, WebSearch로는 이 기능 전체를 아우르는 단일 "Pine" 공식 소스를 찾지 못해 동명의 다른 프로젝트와 혼동할 위험이 있다.**

## 핵심 포인트

- ***새 파일, 메일, 메시지 같은 이벤트가 발생하면 에이전트가 작업을 시작***하는 실행 환경 — "스캔 폴더에 문서가 들어오면 요약하고 납부 금액과 기한을 정리해 줘"처럼 감시할 대상과 할 일을 말로 지정한다는 서술.
- 메일, Slack, Telegram, 웹훅, 웹페이지, RSS와 연결하고, MQTT나 기기 프로토콜로 ***센서와 가전의 변화에도 대응***할 수 있다는 서술 — 가장 근접한 WebSearch 결과(pmndrs의 pine)에서는 확인되지 않는 기능.
- 메인 에이전트에게 요청해 ***담당 에이전트와 도구, 스킬, 반복 일정까지 구성***하며, 사용자가 설정 파일을 직접 편집하는 부담을 줄인다는 서술.
- 여러 에이전트가 역할을 나눠 병렬 작업하고, "공유…"로 발췌가 끊겨 나머지 기능은 확인 불가.

## 인상 깊은 문장

> (원문 접속이 차단되어 1차 인용은 확보하지 못했다.)

## 댓글

hada 댓글 수 확인 불가. **"PASS" 아님을 명시**: "Pine"이라는 제품의 정체 자체가 WebSearch로 확정되지 않는다는 점을 기록한다.

## 내 생각 · 적용점

### 핵심 전이 — 개인/소규모 개발자의 에이전트 하네스 경쟁이 계속 반복된다

[[2026-11-22-dreamcoder-mastering-emacs-ide]], [[2026-10-02-pi-durable-resumable-agent-harness]], [[2026-09-02-trueforge-open-source-agent-harness]], [[2026-11-13-arcee-nac-persistent-agent-harness]] 모두 ***거대 조직이나 벤처가 아닌 개인·소규모 팀이 자체 에이전트 하네스를 만들어 공개***하는 같은 흐름을 보여준다. 이 글의 Pine이 그 경쟁에 또 하나를 더한다 — 다만 이번엔 "이벤트 트리거(메일·웹훅·기기 변화)로 에이전트를 깨운다"는 지점이 다른 하네스들의 "지속적 컨텍스트 유지"([[2026-11-13-arcee-nac-persistent-agent-harness]])나 "재개 가능한 실행"([[2026-10-02-pi-durable-resumable-agent-harness]])과는 다른 차별점으로 보인다.

### 적용점

제품의 정체가 불확실한 상태에서도, "이벤트(메일·웹훅) 트리거형 에이전트"라는 설계 패턴 자체는 PMS 알림을 받아 자동으로 1차 처리하는 에이전트 설계에 참고할 만한 원칙으로 남겨둔다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음(제한적).** 예약 알림, 클레임 메일, 채널 메시지 같은 이벤트가 들어오면 에이전트가 자동으로 1차 요약·분류 작업을 시작하는 구조는 온다의 운영 자동화에 참고할 만하다. 다만 Pine이라는 제품 자체가 미확정이므로 원칙 수준으로만 참고한다.

## 연관 자료

- [[2026-11-22-dreamcoder-mastering-emacs-ide]] — 같은 개인 개발자 에이전트 하네스 경쟁
- [[2026-10-02-pi-durable-resumable-agent-harness]] — 재개 가능한 실행이라는 다른 축의 같은 경쟁
- [[2026-09-02-trueforge-open-source-agent-harness]] — 같은 경쟁 구도
- [[2026-11-13-arcee-nac-persistent-agent-harness]] — 지속적 컨텍스트 유지라는 다른 축의 같은 경쟁

## 한 달 뒤 회고

2026-12-24 즈음 — "Pine"의 정확한 제작자·저장소를 WebSearch로 재확인.
