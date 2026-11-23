---
title: "ClawDOS - DOS용 AI 코딩 에이전트 (GeekNews, 원문 특정 실패) — 176KB 하네스가 컴파일 전엔 메모리에서 스스로 빠져나간다"
source_title: "ClawDOS - DOS용 AI 코딩 에이전트"
source_url: "https://news.hada.io/topic?id=37604"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37604"
published_at: "확인 불가"
summarized_at: "2026-11-23"
category: "ai"
tags: ["retro-computing", "ai-coding-agent", "dos", "constrained-environment"]
---

# ClawDOS - DOS용 AI 코딩 에이전트 (GeekNews)

> 출처: [ClawDOS](https://news.hada.io/topic?id=37604) (GeekNews) · 정리일 2026-11-23

> **출처 한계**: `news.hada.io` 접근 차단으로 원문 미확인. **"ClawDOS"라는 정확한 이름의 프로젝트를 찾지 못했다**(검색된 "ClawdOS"는 Next.js 기반 웹 대시보드로 전혀 다른 프로젝트). 가장 근접한 동류 프로젝트는 `os8088`(Hackaday, Claude Code/Codex로 작성된 8088 어셈블리 OS), `claude-DOS`(Ferine), `cody`(DOS용 LLM 클라이언트), `relic`(felixrieseberg) 등이지만 "4.77MHz 8088, Turbo C 450KB 확보, 176KB DOS 하네스"라는 구체 수치와 1:1로 일치하는 원문은 찾지 못했다. 다만 레트로 하드웨어+AI 에이전트 계열이 2026년 8~11월 반복 등장하는 실제 트렌드라는 점은 확인했다.

## 한 줄 요약

**ClawDOS는 4.77MHz 8088, RAM 640KB, CGA를 갖춘 IBM PC XT에서 실행되는 AI 코딩 에이전트로, Claude와 대화하며 파일 편집부터 프로그램 작성, 컴파일, 실행까지 수행한다 — 제한된 메모리에서 상태를 저장하고 빠져나와 컴파일러에 공간을 내준 뒤 복귀하는 설계가 핵심이다.**

## 핵심 포인트

- 4.77MHz 8088, RAM 640KB, CGA를 갖춘 IBM PC XT에서 실행되는 AI 코딩 에이전트로, Claude와 대화하며 파일 편집부터 프로그램 작성, 컴파일, 실행까지 수행한다.
- ***176KB DOS 하네스***가 API 요청 생성, 스트리밍 응답 파싱, 도구 실행과 대화 저장을 직접 처리하며, 별도 PC는 TLS 연결을 중계한다.
- 컴파일할 때는 ***하네스가 상태를 저장하고 메모리에서 빠져나와*** Turbo C에 약 450KB를 확보해 주며, 작업 후 같은 대화로 복귀해 실행 결과를 전달한다.
- 화면 캡처와 지속 메모리를 지원해 실행 중인 프로그램의 CGA 화면 상태를 이어서 참조할 수 있다.

## 인상 깊은 문장

> (원문 특정 실패로 1차 인용은 확보하지 못했다. Slack 발췌를 넘어서는 인용은 지어내지 않는다.)

## 댓글

hada 댓글 확인 불가. 1차 원문 미특정으로 HN 논쟁 여부도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "유명 니치 환경에 AI 코딩 에이전트를 이식"하는 계열의 반복

[[2026-11-22-dreamcoder-mastering-emacs-ide]](Mastering Emacs 저자가 만든 AI 코딩 IDE)와 이 글은 둘 다 "거대 조직이 아니라 특정 환경에 깊이 빠진 개인·커뮤니티가 그 환경에 AI 에이전트를 이식한다"는 같은 패턴을 보여준다. ClawDOS가 보여주는 "제한된 메모리에서 상태를 저장하고 빠져나와 외부 툴에 공간을 내준 뒤 복귀한다"는 설계는 극단적 제약 환경에서의 자원 관리 기법으로, 현대 시스템에서는 당연하게 여기는 "메모리 여유"가 없을 때 에이전트 하네스가 어떻게 재설계되는지를 보여주는 좋은 예시다.

### 적용점

"176KB 하네스가 모든 걸 직접 처리한다"는 극단적 경량화는, 리소스가 제한된 엣지 환경에서 에이전트 하네스를 설계할 때 "무엇을 하네스에 남기고 무엇을 외부로 뺄지"를 판단하는 참고가 된다.

## 호스피탈리티 / CRS 적용 포인트

멀다. 레트로 하드웨어 제약 공학 데모로 직접 적용점은 없다. 다만 "제한된 메모리에서 상태를 저장하고 외부 툴에 공간을 내준 뒤 복귀한다"는 패턴은, 레거시 온프레미스 PMS 연동처럼 리소스가 극히 제한된 환경에서 에이전트를 동작시켜야 할 때의 비유로만 참고 가능하다.

## 연관 자료

- [[2026-11-22-dreamcoder-mastering-emacs-ide]] — "유명 니치 환경에 AI 코딩 에이전트를 이식"하는 같은 계열

## 한 달 뒤 회고

2026-12-23 즈음 — news.hada.io 차단이 풀려 ClawDOS의 정확한 정체와 수치를 확인했는지 점검.
