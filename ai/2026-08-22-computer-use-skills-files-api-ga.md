---
title: "Computer Use·Browser Use·Skills API·Files API 프로덕션 GA (Anthropic) — 에이전트가 '보고 조작하고'(Computer/Browser Use) '방법을 알고'(Skills) '파일을 주고받는'(Files) 세 축이 독립 API로 굳어졌다"
source_title: "Build production agents with computer use, the Skills API, and the Files API"
source_url: "https://claude.com/blog/computer-use-skills-api-files-api"
source_name: "Claude by Anthropic (claude.com/blog)"
referrer_url: "https://news.hada.io/topic?id=32754"
published_at: "2026-08-20"
summarized_at: "2026-08-22"
category: "ai"
tags: ["computer-use", "browser-use", "skills-api", "files-api", "claude-platform", "agent-tooling", "general-availability"]
---

# Computer Use·Browser Use·Skills API·Files API 프로덕션 GA (Anthropic)

> 출처: [Build production agents with computer use, the Skills API, and the Files API](https://claude.com/blog/computer-use-skills-api-files-api) (Anthropic · claude.com/blog) · 정리일 2026-08-22

## 한 줄 요약

**2026-08-20, Anthropic이 Computer Use(신규 Browser Use 툴 포함)·Skills API·Files API를 Claude Platform에서 정식 GA로 전환했다. 셋의 역할 분담이 명확하다 — ***"Computer Use/Browser Use가 행동한다(perform actions), Skills API가 일하는 방식을 정의한다(define how the work should be done), Files API가 재사용 가능한 입력을 공급하고 산출물을 실어 나른다(supplies reusable inputs and carries the output)."*** 즉 에이전트를 "화면을 보고 조작하는 손"(Computer/Browser Use) + "일하는 법을 아는 머리"(Skills) + "문서를 주고받는 손"(Files)로 나눠 각각 독립 API로 단단하게 만든 것 — 세 개의 개별 기능 발표가 아니라 "프로덕션 에이전트 스택 하나"라는 프레이밍이 핵심.**

## 핵심 포인트

- **Computer Use 업그레이드** — 화면을 스크린샷으로 보고 사람처럼 클릭·타이핑·스크롤해 *자동화용으로 설계되지 않은 앱까지* 조작. 업데이트된 툴은 ***"모델 호출 1회당 액션 1개가 아니라, 한 턴에 여러 액션을 수행"*** — 같은 작업을 더 적은 호출·더 짧은 시간에 끝냄. 추가로 **HIPAA 규제 워크로드(BAA 하)에도 이제 사용 가능**.
- **Browser Use(신규 툴)** — 스크린샷에 더해 **페이지 구조(접근성 트리)를 읽어(`read_page`) 특정 필드·버튼에 참조(`ref_3` 등)로 직접 액션**. 좌표 기반(computer use, 화면 전체를 픽셀로만 이해)보다 **레이아웃이 바뀌어도 안 흔들리는 타겟팅**이 장점. 단 **한계도 명시적**: 탭이 새 페이지로 이동하거나 페이지가 충분히 바뀌면 이전에 잡아둔 참조가 무효화될 수 있는데, **API가 이를 자동으로 잡아내지 않는다** — 실행기(executor)가 참조 불일치를 감지해 액션을 거부하고 Claude가 페이지를 다시 읽게 해야 함(The New Stack 분석 인용).
- **Skills API** — *"작업이 필요로 할 때만 Claude가 불러오는, 지시·스크립트·템플릿을 담은 폴더"*. **자체 Skill 업로드·버전관리를 단순화**했고, ***`skills-2025-10-02` 베타 헤더가 더 이상 필요 없다*** — Messages API에서 `container` 파라미터로 Skill을 불러오는 경우도 포함. 즉 **베타 딱지를 뗀 정식 기능**으로 전환.
- **Files API** — GA와 함께 **자동 만료(expiration) 추가, 조직 저장용량 1TB로 확대, 레이트 리밋 5배 상향**. 업로드나 코드 실행 툴을 통한 스토리지 접근이 초기 플랫폼 한계에 쉽게 부딪히지 않도록 설계.
- **역할 분담이 발표의 핵심 메시지** — 넷을 따로 홍보한 게 아니라 ***"Compute Use/Browser Use = 행동, Skills = 방법, Files = 입출력"*** 이라는 **하나의 프로덕션 스택**으로 묶어 제시. 모델이 목표를 해석하고, 다음 스텝을 고르고, 결과를 조립하는 구조.

## 인상 깊은 문장

> "Computer use lets you build agents that operate software they can see. Given a screenshot, the agent clicks, types, and scrolls the way someone at the keyboard would."
> (Computer Use는 눈으로 보고 소프트웨어를 조작하는 에이전트를 만들게 해준다 — 스크린샷을 받아 사람이 키보드 앞에서 하듯 클릭·타이핑·스크롤한다.)

> "A skill is a folder of instructions, scripts, and templates that Claude loads only when a task calls for it."
> (Skill은 작업이 필요로 할 때만 Claude가 불러오는, 지시·스크립트·템플릿을 담은 폴더다.)

> "Computer Use and Browser Use perform actions. Skills API defines how the work should be done. Files API supplies reusable inputs and carries the output."
> (Computer Use·Browser Use는 행동을 수행한다. Skills API는 일을 어떻게 해야 하는지 정의한다. Files API는 재사용 가능한 입력을 공급하고 산출물을 실어 나른다.)

## 댓글

**GeekNews(news.hada.io) 원문 페이지와 원문 블로그(claude.com) 모두 이 세션의 네트워크 egress 정책상 직접 접근이 차단됐다** — `news.hada.io`·`claude.com`·`www.anthropic.com`·`apito.ai`·`channelinsider.com` 등 다수 도메인에서 프록시가 `403`(정책 차단)을 반환했고, 이는 봇 차단이 아니라 이 실행 환경 자체의 아웃바운드 정책이다. 그 결과:
- **hada 댓글 수를 확인하지 못했다.** 페이지를 열 수 없어 댓글 개수·내용을 전혀 알 수 없다.
- **HN/Lobsters 큐레이션 여부도 검색으로만 간접 확인** — `site:news.ycombinator.com`으로 이 발표(claude.com/blog/computer-use-skills-api-files-api)를 직접 다룬 스레드를 찾지 못했다. 컴퓨터유즈·에이전트 API를 다루는 다른 HN 글들(Coasty, Skrun 등)은 있었지만 **이 특정 발표에 대한 HN/Lobsters 논의는 확인되지 않는다.**
- 본문 내용은 **WebSearch가 반환한 검색엔진 자체 요약·발췌**(claude.com 원문에서 크롤링된 스니펫)와 **The New Stack의 Browser Use 분석 기사**를 조합해 재구성했다 — 원문 전체를 1차로 정독한 것이 아니라 **간접 경유 출처**라는 한계를 명시한다. Anthropic 공식 발표라 논조 자체의 편향(자사 GA 기능 홍보)도 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — Skill 개념의 "베타 딱지 제거"는 이미 정리해둔 원칙이 실제로 굳어지는 과정이다

[[2026-06-08-anthropic-skills-building-guide]]에서 정리한 Skill의 핵심 설계(***점진적 공개·조합성·이식성***, ***"MCP=무엇을 할 수 있나, Skill=어떻게 해야 하나"***)는 그때는 33페이지짜리 가이드 문서 수준이었다. 이번 GA에서 `skills-2025-10-02` **베타 헤더가 사라지고** Messages API `container` 파라미터로 정식 로드되는 걸 보면, **그 가이드가 서술한 설계 철학이 실제 프로덕션 API 표면으로 그대로 굳어졌다**는 걸 확인할 수 있다. [[2026-05-29-mcp-is-dead-cli-skills]]가 제안한 "기본값을 CLI/Skills로, MCP는 특수 상황으로"라는 우선순위 재조정도 이번 GA로 한 단계 더 힘을 받는다 — Anthropic이 Skills를 1급 시민 API로 밀어준다는 신호이기 때문이다.

### 핵심 전이 2 — Browser Use의 "구조 참조 vs 좌표" 선택은 production-agent 신뢰성 설계의 전형적인 트레이드오프다

좌표 기반 Computer Use는 화면이 조금만 바뀌어도 깨지기 쉬운 반면, Browser Use의 `ref_3` 참조는 레이아웃 변화에 강하지만 **"참조가 무효화됐는지는 API가 알려주지 않고 실행기가 직접 감지해야 한다"**는 새로운 책임을 개발자에게 떠넘긴다. 이건 [[2026-08-10-doordash-ai-agent-gateway]]가 지적한 **"MCP는 도구 호출 방식만 표준화했을 뿐 인증·권한·감사는 해결하지 않는다"**는 구도와 같은 결이다 — **행동 능력(할 수 있음)이 넓어질수록, 그 행동이 유효한지·안전한지 검증하는 책임은 플랫폼이 아니라 여전히 그 위에 시스템을 쌓는 쪽 몫으로 남는다.** Computer/Browser Use가 에이전트의 손을 넓혀줬다면, DoorDash 글은 그 손이 무엇을 만졌는지 감사·회수하는 층이 따로 필요하다고 말한다 — 이번 GA 발표엔 그 감사 계층 얘기가 전혀 없다는 게 오히려 눈에 띈다.

### 핵심 전이 3 — 세 API를 "행동·방법·입출력"으로 역할 분리한 프레이밍 자체가 에이전트 설계 원칙의 재확인이다

이 발표가 새로 발명한 개념은 없다. Computer/Browser Use(행동)·Skills(방법)·Files(입출력)로 쪼갠 구조는, **에이전트를 하나의 거대한 프롬프트가 아니라 역할이 분리된 계층으로 설계하라**는 이미 익숙한 원칙([[2026-06-08-anthropic-skills-building-guide]]의 점진적 공개, [[2026-05-29-mcp-is-dead-cli-skills]]의 "연결과 지식을 분리")을 **API 레벨의 제품 구조로 그대로 반영**한 것에 가깝다. 새로운 통찰이라기보단, **"베타 단계 개별 기능 → GA 단계 통합 스택"으로 가는 전형적인 성숙 곡선**을 보여주는 사례로 읽는 게 더 정확하다.

## 호스피탈리티 / CRS 적용 포인트

- **가능성은 있지만 직접 적용 사례는 없다 — 정직하게 밝힌다.** 온다가 연동하는 파트너 호텔의 PMS·채널매니저 중 일부는 API가 없거나 레거시 웹 관리자 화면만 제공한다. 이런 시스템에 대해 **Browser Use 툴로 요금·재고 업데이트를 웹 UI 자동화하는 실험**은 원칙적으로 가능해 보이지만, 이 노트 시점에서 실제로 검토·프로토타입한 사례는 없다 — 단순 가능성 언급 이상으로 과장하지 않는다.
- **더 확실한 전이는 오히려 "적용하지 말라"는 쪽에 가깝다.** [[2026-08-10-doordash-ai-agent-gateway]]에서 이미 정리했듯, CRS AI 에이전트가 외부 도구·화면에 접근하는 범위를 넓히기 전에 **자격증명 중앙 관리·감사 로그·권한 회수** 같은 게이트웨이 설계가 먼저 갖춰져야 한다는 원칙은, Computer/Browser Use처럼 "화면을 직접 조작하는" 능력이 생길수록 오히려 더 무겁게 적용돼야 한다.

## 연관 자료

- [[2026-06-08-anthropic-skills-building-guide]] — Skill의 설계 철학(점진적 공개·조합성·이식성)이 이번 GA로 베타 딱지를 떼고 정식 API 표면이 된 원류
- [[2026-05-29-mcp-is-dead-cli-skills]] — "MCP=연결, Skills=지식" 구도의 재확인, Skills를 1급 API로 미는 방향성과 일치
- [[2026-08-10-doordash-ai-agent-gateway]] — Computer/Browser Use가 넓히는 "행동 능력"과 정확히 대칭되는 "행동 감사·통제" 문제 제기
- [[2026-07-09-mengto-skills-agent-workflow-library]] — Anthropic 자체 Skills API(벤더 종속)와 대조되는, 벤더 비종속 Skill 라이브러리 접근

## 한 달 뒤 회고
*(2026-09-22 즈음 — ①Browser Use의 "참조 무효화 감지" 책임을 실제로 구현한 서드파티 실행기 사례가 나왔는지, ②Skills API GA 이후 커뮤니티에서 실제 프로덕션 Skill 배포 사례가 늘었는지, ③CRS 쪽에서 API 없는 파트너 시스템에 Browser Use 실험을 실제로 검토했는지, ④이번엔 확보 못한 hada 댓글·HN 반응을 나중에라도 확인할 수 있었는지 기록.)*
