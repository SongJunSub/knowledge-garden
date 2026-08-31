---
title: "NOOA — NVIDIA Object-Oriented Agents (NVIDIA) — 클래스가 곧 에이전트, `...`로 비워둔 메서드가 곧 LLM 호출이 되는 파이썬 하네스"
source_title: "NVIDIA-NeMo/labs-OO-Agents: NVIDIA Object Oriented Agents — the Pythonic way to build AI Agents"
source_url: "https://github.com/NVIDIA-NeMo/labs-OO-Agents"
source_name: "GitHub (NVIDIA-NeMo)"
referrer_url: "https://news.hada.io/topic?id=33059"
published_at: "2026-07-30 (pip 패키지 nooa v0.0.8 릴리스 기준 추정 — WebSearch 스니펫 재구성, 원문 릴리스 노트 직접 확인은 못함)"
summarized_at: "2026-08-31"
category: "ai"
tags: ["ai-agent", "agent-framework", "python", "nvidia", "open-source", "code-as-action", "rlm", "swe-bench"]
---

# NOOA — NVIDIA Object-Oriented Agents

> 출처: [NVIDIA-NeMo/labs-OO-Agents](https://github.com/NVIDIA-NeMo/labs-OO-Agents) (NVIDIA, Apache 2.0) · 정리일 2026-08-31

## 한 줄 요약
**NOOA(NVIDIA-labs Object Oriented Agents)는 에이전트의 상태·기능·프롬프트·입출력 계약을 파이썬 클래스 하나에 통합하는 모델 독립적 프레임워크다.** 필드는 상태, 메서드는 기능, 독스트링은 프롬프트, 타입 어노테이션은 런타임이 검증하는 계약 역할을 하고, 본문을 `...`(Ellipsis)로 비워둔 메서드는 실행 시 LLM이 채워 넣는 "생성 메서드"가 된다. 도구 호출 스키마를 따로 선언하는 대신 모델이 Jupyter 스타일 REPL에서 self의 메서드·객체·임포트한 모듈을 직접 호출하는 파이썬 코드를 작성해 행동하며, 253줄짜리 범용 에이전트로 SWE-bench Verified 82.2%·CyberGym L1 86.8%를 기록했다고 주장한다.

## 핵심 포인트
- **클래스=에이전트, 4대 대응** — 필드=상태, 메서드=기능, 독스트링=프롬프트, 타입 어노테이션=런타임이 검증하는 입출력 계약. 공식 슬로건은 ***"Agents are Python objects"***.
- **생성 메서드(Generation methods)** — 메서드 본문이 `...` 하나뿐이면 메서드 이름·파라미터·독스트링이 그대로 프롬프트가 되어 LLM이 런타임에 완성한다. 반대로 일반 코드가 들어간 메서드는 그대로 결정적으로 실행돼, ***"결정적 로직"과 "생성적 판단"이 한 클래스 경계 안에서 공존***한다.
- **Code as action — Jupyter 스타일 REPL 실행** — 모델은 도구 호출 스키마를 선언받는 대신, 지속되는 REPL 세션 안에서 self의 메서드·속성·임포트한 모듈·헬퍼 함수를 그대로 호출하는 파이썬 코드를 작성해 실행한다. 도구 스키마를 별도로 정의할 필요성을 줄이는 설계다.
- **벤치마크 성능(2차 소스 종합, 출처 한계 참조)** — SWE-bench Verified에서 GPT-5.5 조합으로 **82.2%**(29회 LLM 호출, 태스크당 약 1.1M 토큰, 벤치마크 특화 프롬프트 없는 253줄 범용 에이전트로 발표 시점 리더보드 SOTA 79.2%를 상회했다는 주장), Opus 4.6 조합으로 79.8%. CyberGym L1에서는 **86.8%**(네트워크 접근 차단 + 규칙 기반 "cheat check"를 통과한 상태로 측정), 오픈소스 하네스 중 최고 수준이라 주장하며 비교 하네스 대비 절반 수준의 토큰을 쓴다고 홍보한다.
- **모델 독립적·오픈소스** — 특정 벤더 모델에 종속되지 않는 설계, Apache 2.0 라이선스, "알파 연구 프리뷰" 단계로 pip 설치 가능(Python 3.12~3.13).

## 인상 깊은 문장
> "Agents are Python objects."
> (프레임워크가 스스로 내세우는 한 문장 슬로건 — 상태·기능·프롬프트·계약을 클래스 하나로 압축하겠다는 설계 철학 전체를 담고 있다.)

> "A method whose body is the ellipsis literal (...) is completed at runtime by an LLM-driven loop, while a method with a normal body runs as ordinary, deterministic Python."
> (생성 메서드와 결정적 메서드의 경계를 정확히 규정하는 문장 — 코드와 프롬프트가 섞이는 게 아니라 "타입"으로 나뉜다는 뜻.)

## 댓글
**news.hada.io 접근이 이번 세션에서 전면 차단돼 hada 댓글 수·논조는 확인하지 못했다.** WebSearch로 이 프로젝트 자체를 겨냥한 별도 Hacker News/Show HN 스레드를 찾으려 했으나 발견하지 못했고(엔비디아 관련 다른 스레드들만 검색됨), 대신 MarkTechPost·Medium·Enterprise DNA·newtechie.com 등 여러 AI 뉴스 매체가 발표 직후 개별 기사로 다뤘다는 정황만 확인했다 — HN/Lobsters 큐레이션 여부는 **확인 불가**로 남긴다. 벤치마크 수치(82.2%·86.8%)는 GitHub 저장소 직접 확인 대신 WebSearch가 반환한 검색 스니펫(마크텍포스트 등 2차 소스 요약)으로 재구성한 것이라, 원문 벤치마크 방법론 각주까지 대조 검증하지는 못했다는 점도 밝힌다.

## 내 생각 · 적용점

### 핵심 전이 1 — "코드가 곧 행동"이라는 하네스 설계가 세 번째로 독립 등장했다
NOOA의 Jupyter REPL 실행 방식은 [[2026-08-25-prime-agent-self-improving-rlm-coding-agent]](Prime Agent, Python RLM — 컨텍스트를 변수로, 서브에이전트를 함수 호출로), [[2026-08-27-headlong-persistent-agent-microharness]](Headlong, Bash 기반 shellm)와 정확히 같은 계열이다. 세 프로젝트 모두 "도구 스키마를 선언하지 않고 모델이 직접 실행 가능한 코드를 써서 행동하게 한다"는 같은 결론에 서로 다른 언어(Python 클래스, Python RLM, Bash)로 도달했다 — 한 회사의 유행이 아니라 하네스 설계공간에서 수렴하는 패턴으로 읽는 게 더 정확하다.

### 핵심 전이 2 — 상태·판단·실행을 한 경계에 압축한다는 점에서 Brain/Hands/Session과 반대 방향
[[2026-05-04-long-running-agents]]가 정리한 "수렴된 아키텍처"는 모델(Brain)·샌드박스(Hands)·이벤트 로그(Session)를 명시적으로 분리하는 쪽이었다. NOOA는 반대로 상태(필드)·판단(생성 메서드)·실행(일반 메서드)을 한 클래스 안에 의도적으로 압축한다. 어느 쪽이 옳다기보다, "장시간·다중 에이전트 시스템"엔 분리가 필요하고 "단일 에이전트·짧은 태스크"엔 압축이 유리할 수 있다는, 스케일에 따라 갈리는 트레이드오프로 보인다.

### 핵심 전이 3 — 벤치마크 주장은 이번 시즌 반복된 "재현 전까지는 마케팅" 원칙 그대로 적용해야 한다
82.2%·86.8%라는 수치는 NVIDIA 자체 발표(2차 소스 경유)이고, 발표 시점 SOTA 대비 우위를 강조하는 전형적인 벤더 벤치마크 서사를 따른다. GitHub 저장소가 직접 공개돼 있어 원리적으로는 제3자 재현이 가능하다는 점은 다른 폐쇄형 벤더 주장보다 낫지만, 이 정리 시점에는 독립 재현을 확인하지 못했다.

## 호스피탈리티 / CRS 적용 포인트
직접 적용은 멀다. 온다의 CRS/B2B 에이전트 개발에 파이썬 클래스 기반 프레임워크를 그대로 들여올 이유는 크지 않지만, "결정적 코드와 생성적 판단의 경계를 타입/구문 수준에서 명시적으로 나눈다"는 설계 원칙 자체는 참고할 만하다 — 요금 계산·예약 상태 전이처럼 정답이 분명한 로직은 일반 메서드로 못박고, 자연어 해석·이상 탐지처럼 판단이 필요한 부분만 생성 메서드로 좁히는 식의 경계 설계는 우리 에이전트 하네스에도 옮겨볼 수 있는 아이디어다.

## 연관 자료
- [[2026-08-25-prime-agent-self-improving-rlm-coding-agent]] — 같은 "코드가 곧 행동" REPL 패러다임의 Python RLM 버전, NOOA와 나란히 놓고 비교할 가장 가까운 사례.
- [[2026-08-27-headlong-persistent-agent-microharness]] — 같은 패러다임의 Bash 버전, 언어만 다를 뿐 "도구 스키마 대신 코드 실행" 설계가 동일.
- [[2026-05-04-long-running-agents]] — Brain/Hands/Session 분리 아키텍처와 대비되는 반대 방향 설계 선택지.

## 한 달 뒤 회고
*(2026-09-30 즈음 — NOOA GitHub 저장소의 스타·이슈·PR 활동으로 실제 커뮤니티 채택이 있었는지, 그리고 SWE-bench/CyberGym 수치에 대한 제3자 재현이나 반박이 나왔는지 확인.)*
