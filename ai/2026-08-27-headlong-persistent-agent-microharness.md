---
title: "Headlong — 스스로 계속 생각하는 지속형 에이전트를 위한 마이크로 하네스, 1만 줄 미만 Bash로 '내면의 독백'을 흉내내다"
source_title: "laude-institute/headlong: An open source agent microharness featuring persistent agency and recursive LLMs"
source_url: "https://github.com/laude-institute/headlong"
source_name: "GitHub (Laude Institute)"
referrer_url: "https://news.hada.io/topic?id=32906"
published_at: "2026-08"
summarized_at: "2026-08-27"
category: "ai"
tags: ["ai-agent", "agent-harness", "persistent-agency", "bash", "open-source", "long-running-agents"]
---

# Headlong — 스스로 계속 생각하는 지속형 에이전트를 위한 마이크로 하네스

> 출처: [laude-institute/headlong](https://github.com/laude-institute/headlong) (GitHub, Laude Institute, Apache 2.0) · 정리일 2026-08-27
> **출처 한계**: `news.hada.io`와 Laude Institute 공식 발표 페이지(`www.laude.org/updates/headlong-a-microharness-for-persistent-agents`)가 이 세션에서 egress 차단이라 **직접 열어 확인한 건 GitHub 저장소 README뿐**이다. Hacker News 스레드(id=49428882)가 존재한다는 것과 "53포인트·120댓글" 추정치를 WebSearch로 확인했지만, `news.ycombinator.com` 자체가 차단이라 **원문 대조는 못했고 이 수치의 정확도는 보장 못한다.** 정확한 공개일도 확인하지 못해 `published_at`을 "2026-08"로만 표기한다.

## 한 줄 요약

**Headlong은 사용자의 요청이 없어도 스스로 계속 생각하고 행동하는 "지속형 에이전시(persistent agency)"를 실험하는 오픈소스 에이전트 하네스다.** 일반 에이전트가 요청을 처리하고 멈추는 것과 달리, Headlong의 에이전트는 ***"사람의 내면의 독백(inner monologue)에서 영감을 받은 자기주도 루프"*** 안에서 절대 잠들지 않고 계속 생각을 이어간다 — 관심사·우선순위·프로젝트를 스스로 정하고, 필요하면 Slack·Telegram 등을 통해 먼저 사람에게 연락한다. 핵심 구조는 ***1만 줄 미만의 순수 Bash*** — `shellm`이라는 Bash 기반 RLM(재귀적 언어모델) 구현이 심장부에 있고, 모델은 셸 명령을 쓰고 실행하고 결과를 읽는 방식으로 사고한다. Ken Thompson의 "작은 도구 하나하나가 한 가지 일을 잘한다"는 철학을 그대로 표방하며, 특히 **에이전트 자신이 하네스 코드를 포크·수정·테스트해 메인에 병합하는 것**까지 가능하다 — Laude 측 에이전트가 실제로 이미 50개 이상의 커밋을 메인에 병합했다고 저장소가 밝힌다.

## 핵심 포인트

- **지속형 에이전시** — 외부 입력이 없어도 자기주도 루프에서 계속 사고를 생성한다. "체크리스트가 없다"는 게 아니라 **에이전트가 만들지 않으면 체크리스트 자체가 없다** — 사람이 짜준 작업 큐를 소비하는 게 아니라 스스로 무엇을 생각할지 정한다는 구조.
- **shellm(Bash RLM)** — 재귀적 언어모델을 Bash로 구현. 도구·메모리·스킬·자기 코드까지 전부 셸 명령을 통해 직접 다룬다는 게 핵심이며, 별도 도구 추상화 계층 없이 "Bash 자체가 제어 흐름"이라는 설계.
- **규모와 철학** — 핵심 로직이 **1만 줄 미만의 순수 Bash**. Ken Thompson의 "작은 도구, 각각 한 가지를 잘함" 원칙을 명시적으로 표방.
- **메모리·스킬 도구** — `mem`(경험을 체계화·압축), `SKILL.md` 기반 절차 재사용 시스템. Slack 발췌가 언급한 "최근 기억은 그대로, 오래된 기억은 압축"하는 장기 실행용 메모리 관리 전략과 부합.
- **자기수정(self-editing harness)** — 에이전트가 저장소를 포크해 변경하고 테스트한 뒤 성공하면 메인에 병합할 수 있다. 저장소 설명에 따르면 Laude의 에이전트가 이미 **50개 이상의 커밋**을 메인에 병합했다.
- **다중 사용자·다중 채널** — Slack, Telegram, 채팅앱을 통해 여러 사용자와 상호작용 가능.
- **요구사항** — bash 3.2+, git, curl, jq, LLM API 키(Anthropic/OpenAI/Gemini/OpenRouter). 대시보드는 uv·bun 또는 node 필요.
- **저장소 규모(2026-08-27 기준 직접 확인)** — 스타 887개, 커밋 577개, Apache 2.0 라이선스. 8월 26일 GeekNews 게시 시점 기준으로는 비교적 초기 단계의 프로젝트.
- **소속** — Laude Institute는 Terminal-Bench(터미널에서 AI 에이전트를 테스트하는 벤치마크)로 알려진 조직으로 검색됐다 — Headlong도 그 연장선의 "에이전트 자율성 실험" 프로젝트로 보인다(직접 확인은 못함).

## 인상 깊은 문장

> "Of bash, by bash, for bash; it's shells all the way down."
> (GitHub 저장소 설명 그대로 — 링컨의 게티즈버그 연설을 패러디한 태그라인이면서, 이 프로젝트가 얼마나 철저하게 "셸이 전부"라는 설계를 밀어붙이는지 정확히 보여준다.)

## 댓글

- **hada 댓글 수·논지 확인 불가**(news.hada.io 차단).
- Hacker News에 "Headlong: A Microharness for Persistent Agents" 스레드가 존재하는 것으로 검색되며, 집계 사이트(hckrnews.com) 기준 **약 53포인트·120댓글**로 추정된다 — 다만 `news.ycombinator.com` 자체를 열지 못해 **이 수치와 상위 댓글 논조를 원문으로 대조하지 못했다.** 정확도를 보장할 수 없는 2차 추정치로만 참고할 것.
- **읽을 때 감안**: "에이전트가 하네스 자체를 수정해 메인에 병합한다"는 주장은 저장소 스스로 밝힌 것이라 검증 주체가 사실상 프로젝트 자신이다. 병합된 커밋 중 실제로 사람 리뷰 없이 들어간 비율이 얼마인지, 실패한 자기수정 시도가 얼마나 되는지는 이 노트에서 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — RLM(재귀적 언어모델) 하네스의 두 번째 구현체다. Python vs Bash, 같은 추상화의 다른 언어 선택

바로 어제 정리한 [[2026-08-25-prime-agent-self-improving-rlm-coding-agent]]의 Prime Agent가 **"컨텍스트를 변수로, 서브에이전트를 함수로"** 다루는 RLM을 지속형 IPython(Python) 커널 위에 구현했다면, Headlong의 `shellm`은 **정확히 같은 추상화를 Bash 위에서** 구현한다. 두 프로젝트가 거의 같은 시기(8월)에 독립적으로 "RLM = 지속형 REPL + 도구를 함수/명령으로" 라는 같은 결론에 도달했다는 것은, 이게 특정 팀의 취향이 아니라 **"컨텍스트를 프롬프트가 아니라 실행 가능한 상태로 다룬다"는 원칙이 여러 팀에서 수렴 중인 패턴**이라는 신호로 읽을 수 있다. 다만 Prime Agent가 상태를 "살아있는 프로세스 변수"에 두는 것과 대비해, Headlong의 Bash 기반 shellm이 재시작·재연결 시 상태를 어떻게 복구하는지는 이 노트에서 확인하지 못했다 — 같은 질문이 두 프로젝트 모두에 남아 있다.

### 핵심 전이 2 — "핵심을 최소화하고 나머지는 확장으로"라는 하네스 설계 원칙이 이번에도 반복된다

[[2026-08-06-pi-minimalism-coding-harness]]가 보여준 Pi의 설계(기본 도구 4개, 시스템 프롬프트 1,000토큰 미만, 나머지는 확장)와 Headlong의 설계(핵심 1만 줄 미만 Bash, 나머지는 스킬·mem 확장)는 **같은 원칙을 다른 축에서 반복**한다 — Pi는 "복잡성은 필요성이 확인될 때만 추가"를 토큰 예산 축에서, Headlong은 코드 줄 수 축에서 실천한다. 이 원칙이 이제 여러 독립적 하네스 프로젝트에서 반복 관찰되는 걸 보면, "모델이 강해질수록 하네스는 얇아진다"는 명제가 특정 프로젝트의 우연이 아니라 **업계 전반의 수렴 방향**일 가능성이 커 보인다.

## 호스피탈리티 / CRS 적용 포인트

- **"자기주도 루프로 계속 관심사를 스스로 정하는" 지속형 에이전시 개념은, CRS 운영 모니터링에 원칙적으로 흥미롭다.** 예를 들어 예약 패턴 이상·객실 재고 불일치를 사람이 확인하러 오기 전에 에이전트가 스스로 감지해 먼저 담당자에게 연락하는 형태는 이 프로젝트가 보여주는 "필요하면 먼저 사람에게 연락한다"는 아이디어와 방향이 같다.
- **다만 "에이전트가 하네스 자체를 스스로 수정해 메인에 병합한다"는 부분은 CRS 프로덕션에는 아직 이르다고 정직하게 밝혀야 한다.** 정산·예약처럼 실패 비용이 큰 도메인에서 에이전트의 자기수정 권한은 [[2026-08-25-prime-agent-self-improving-rlm-coding-agent]] 노트에서도 짚었듯 반드시 사람 승인 게이트가 루프 밖에 있어야 하고, Headlong 저장소 설명만으로는 그 게이트가 어떤 형태인지 확인되지 않는다.
- 프로젝트 규모(스타 887개, 초기 단계)를 감안하면 지금 시점에 옮길 것은 **제품 자체가 아니라 "지속형 에이전시" 설계 원칙**뿐이다.

## 연관 자료
- [[2026-08-25-prime-agent-self-improving-rlm-coding-agent]] — 같은 RLM 추상화의 다른 구현체(Python/지속형 IPython vs Bash/shellm), 자기개선 루프의 승인 게이트 문제도 동일하게 남아 있음
- [[2026-08-06-pi-minimalism-coding-harness]] — "핵심 최소화 + 필요시 확장"이라는 같은 하네스 설계 원칙의 다른 축(토큰 예산 vs 코드 줄 수)
- [[2026-05-04-long-running-agents]] — 장기 실행 에이전트의 상태 관리 아키텍처(Brain/Hands/Session, 외부 파일에 상태) — Headlong의 `mem` 도구가 이 원칙과 얼마나 겹치는지는 원문 미확인
- [[2026-05-09-agents-need-control-flow]] — "프롬프트가 아니라 런타임으로"라는 원칙이 Headlong에서는 "Bash 자체가 제어 흐름"이라는 형태로 가장 직설적으로 실현됨

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①GitHub 스타·이슈 트래커에서 프로덕션 사용 사례나 실패 보고가 나왔는지, ②"에이전트가 하네스를 스스로 수정해 병합"하는 사례 중 사람 리뷰 없이 들어간 비율이 공개됐는지, ③Laude Institute 공식 발표 페이지·HN 스레드 접근이 가능해지면 이 노트의 추정 수치(HN 53포인트·120댓글)를 원문으로 대조.)*
