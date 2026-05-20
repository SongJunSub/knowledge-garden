---
title: "무신사 query-engineer — 가든의 모든 라인이 한 글에 수렴하는 *하네스 엔지니어링*의 실무 완성 모델"
source_title: "AI 스페셜리스트와 자동사냥, 하네스로 제어하는 AI 파이프라인"
source_url: "https://techblog.musinsa.com/ai-%EC%8A%A4%ED%8E%98%EC%85%9C%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%99%80-%EC%9E%90%EB%8F%99%EC%82%AC%EB%83%A5-%ED%95%98%EB%84%A4%EC%8A%A4%EB%A1%9C-%EC%A0%9C%EC%96%B4%ED%95%98%EB%8A%94-ai-%ED%8C%8C%EC%9D%B4%ED%94%84%EB%9D%BC%EC%9D%B8-6c578f8bd1fb"
source_name: "무신사 기술 블로그 (이상호, 물류플랫폼팀 WMS)"
referrer_url: "https://techblog.musinsa.com/ai-%EC%8A%A4%ED%8E%98%EC%85%9C%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%99%80-%EC%9E%90%EB%8F%99%EC%82%AC%EB%83%A5-%ED%95%98%EB%84%A4%EC%8A%A4%EB%A1%9C-%EC%A0%9C%EC%96%B4%ED%95%98%EB%8A%94-ai-%ED%8C%8C%EC%9D%B4%ED%94%84%EB%9D%BC%EC%9D%B8-6c578f8bd1fb"
summarized_at: "2026-05-18"
category: "ai"
tags: ["harness", "ai-pipeline", "musinsa", "slow-query", "jpa", "claude-cli", "codex-cli", "subagent", "context-rot", "self-verification", "specialist", "korean-company"]
---

# 무신사 query-engineer — 가든의 모든 라인이 한 글에 수렴하는 *하네스 엔지니어링*의 실무 완성 모델

> 출처: [AI 스페셜리스트와 자동사냥, 하네스로 제어하는 AI 파이프라인 — 무신사 기술 블로그](https://techblog.musinsa.com/ai-스페셜리스트와-자동사냥-하네스로-제어하는-ai-파이프라인-6c578f8bd1fb) (이상호, 물류플랫폼팀 WMS) · 정리일 2026-05-18

## 한 줄 요약
무신사 WMS 팀이 *주기적으로 반복되는 슬로우 쿼리 분석·수정·PR 생성*을 자동화한 `query-engineer` 파이프라인 — *Agent = Model + Harness* 라는 LangChain의 한 줄 정의를 *7-stage 실무 모델*로 구체화하고, *쿼리 분석 스페셜리스트·코드 리뷰 스페셜리스트 (Claude 4관점 + Codex 4관점)·정합성 검증(EXPLAIN+실측)·리뷰 폐쇄 루프*로 *AI가 만든 코드를 AI가 검증*하는 폐쇄 루프를 박은 사례. **가든의 매뉴얼·비판·실증·전환·라이프스타일 라인이 *한 글에서 한꺼번에 수렴*하는 자리**.

## 핵심 포인트

- ***Agent = Model + Harness***. LangChain 인용으로 박힌 한 줄. [Anthropic 공식 매뉴얼](2026-05-16-claude-code-large-codebases.md)에서 본 *하네스*라는 *명사*가 *공식 정의*로 굳음. **모델은 표준화 자원, 하네스가 차별점**이라는 가든의 가설이 *공식 등식*으로 확정. *말에게 마구를 씌우듯 AI에게 하네스를 씌운다*는 비유가 글 전체의 톤을 결정.
- **Context Rot — *컨텍스트가 채워질수록 추론 능력이 저하***. LangChain의 공식 용어. *"이 슬로우 쿼리 10개를 한꺼번에 분석해줘"* 처럼 던지면 앞 3~4개는 잘 하다가 뒤로 갈수록 *분석 품질이 떨어지는* 현상. [Hashimoto의 *이해 불가능한 복잡도*](2026-05-16-hashimoto-ai-mass-psychosis.md)의 *모델 측 메커니즘*. **서브에이전트로 컨텍스트를 격리**하는 게 처방 — *4개의 정찰조*가 *각자의 노이즈를 흡수*하고 상위에 *정제된 결과만 전달*.
- **Specialist 하네스 3축 — 시스템 프롬프트(고삐) + 출력 형식 강제(unified diff) + 서브에이전트 격리**. *"10년 경력 JPA 전문가"* 한 줄로 *행동 공간*을 좁히고, *"파일 직접 수정 금지·diff만 생성"* 으로 *출력 형식*을 강제하며, *코드 구조/DB 메타/설정/트레이드오프* 를 *4개 정찰조*에 *분리 위임*. **[Anthropic Why 정렬](2026-05-14-teaching-claude-why-alignment-training.md) + [얇은 CLAUDE.md](2026-05-16-claude-code-large-codebases.md) + [Code w/ Claude의 Subagents](2026-05-14-code-with-claude-recap-19-sessions.md) 세 가지가 *한 시스템 안에서 동시에* 구현된 첫 가든 자산**.
- **두 공급자 교차 검증 (Claude + Codex) — 4관점 × 2공급자 = 최대 8개 리뷰**. **[Reddit Claude → Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md) 글의 *모델 비교* 논쟁에 대한 종합 답** — *하나만 고르는 게 아니라 *둘 다* 같이 쓰는 *교차 검증***. 공급자별로 서로 놓치는 부분을 보완. *동일 결함 중복 보고*는 *파일+카테고리+라인 윈도우*로 자동 병합하고 *심각도는 높은 쪽 채택*. **모델 차원 Goodhart에 대한 실무 처방**.
- **정합성 검증 — *"이론적으로 그럴듯한가"가 아니라 *실제로 더 빠른가*"***. Stage 4.1이 *AI가 만든 패치가 EXPLAIN과 실측에서 정말 빨라지는지*를 자동 검증. 정적 검증(구문·결과 집합 호환) + 동적 검증(EXPLAIN + LIMIT 래핑 + READ ONLY 트랜잭션). 4가지 verdict로 귀결 (PASS/WARN/MISMATCH/FAIL). **[Hashimoto 완료 환각](2026-05-16-hashimoto-ai-mass-psychosis.md)·[Reddit 40% 완료 보고](2026-05-17-claude-to-codex-migration-reddit.md)에 대한 *기술적 게이트***. 기본값은 *MISMATCH도 PR 생성 + 경고만* — *자동화가 사람의 판단을 대체하지 않고 정보를 모아준다*는 철학.
- **실패가 PASS로 오역되지 않게**. *SkillFileLoadError*가 발생하면 *조용히 *리뷰 0건 = PASS*로 처리되지 않도록* 분리 rethrow. *영구 오류와 일시적 실패의 구분*. 폴러가 *무한 재시도로 GitHub API를 두드리는 사고*에서 배운 처리. [Hashimoto의 *대화 차단 메커니즘*](2026-05-16-hashimoto-ai-mass-psychosis.md)의 *기술적 방어 코드*.
- **타이트한 / 느슨한 / 적응형 하네스 3분류.** *스페셜리스트(통제·정확도) / 제너럴리스트(범용·탐색) / 오케스트레이터(조합·자가 개선)*. **반복되고 패턴화 가능한 태스크 = 타이트 / 정답이 맥락에 따라 다른 태스크 = 느슨 / 여러 스페셜리스트 조합 = 적응형**. query-engineer는 *개별 에이전트는 스페셜리스트, 전체 시스템은 오케스트레이터*. 가든의 새 분류 체계.
- ***Bash 스크립트 → 웹앱 → CLI*** 진화. *PipelineCallbacks*라는 콜백 인터페이스로 *파이프라인 엔진*과 *프론트엔드*를 *분리*. 웹은 SSE 스트리밍, CLI는 컬러 출력, 향후 슬랙봇은 콜백 구현체 하나 추가만으로. **하네스를 *재사용 가능한 라이브러리*로 만드는 방법** — [Anthropic 매뉴얼의 *얇음*](2026-05-16-claude-code-large-codebases.md)이 *아키텍처 차원*으로 확장.
- **스킬 시스템 — *프롬프트를 코드에서 분리*.** `skills/*.md` 마크다운 파일 + `{{queryNumber}}` 같은 템플릿 변수 + `{{>code-review-common}}` partial include. *체크리스트 한 줄을 바꾸면 두 공급자에 동시 반영*. 신규 스킬은 *화이트리스트(ALLOWED_SKILLS)*에 등록해야만 로드, *include 깊이 2 제한*과 *순환 참조 탐지*. **하네스의 *와이어를 교체 가능하게* 만들되 *아무 와이어나 끼울 수는 없게***.
- ***왜 API가 아니라 CLI인가***. CLI는 Read/Grep/Glob을 내장 — *AI가 스스로 프로젝트를 탐색*. *어떤 파일을 읽어야 할지 사람이 정해줄 필요가 없음*. 이 결정이 *두 번째 공급자(Codex CLI) 확장에도 그대로 통함* — *공급자 어댑터만 추가하고 나머지는 공통 헬퍼 재사용*. **CLI를 택한 것 자체가 *공급자 확장의 길*을 연 결정**.
- ***자동 머지를 의도적으로 배제*** — 기술적 한계가 아니라 *설계 철학*. 파이프라인 마지막은 항상 *개발자의 Approve 버튼*. 비즈니스 맥락을 이해하는 *사람만이 내릴 수 있는 판단* — *이 쿼리가 정말 수정되어야 하는가? 다른 기능에 영향은? 지금 시점에 맞는가?* [Eric Ries Incorruptible의 Director's Oath](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)가 *AI 시대 엔지니어 직무*로 구체화.
- ***이 프로젝트의 코드 99%는 Claude가 작성***. 글의 마지막 고백. [Ptacek 30분 1인 빌더](2026-05-14-emacsification-of-software-ptacek.md)·[Reddit Claude→Codex](2026-05-17-claude-to-codex-migration-reddit.md)·[Naur 이론 형성](../engineering/2026-05-14-naur-programming-as-theory-building.md) 세 글이 *한 사람의 실무 경험에서 정확히 합쳐진 자리* — *개발자가 한 일은 하네스 설계와 검수, AI가 한 일은 99%의 코드*.

## 인상 깊은 문장

> Agent = Model + Harness — 모델이 아닌 모든 것이 하네스입니다.

> 엄밀함의 위치가 이동했다. 코드 한 줄 한 줄을 정확하게 작성하던 엄밀함이, AI가 코드를 올바르게 작성할 수 있는 환경을 설계하는 엄밀함으로 바뀌었다.

> 실패가 곧 PASS가 되지 않도록 하네스의 경계를 단단히 잠가두는 것 — 이 규약이 자동화 시스템에서 *조용한 품질 저하*를 막는다.

> 이 프로젝트의 코드 99%는 Claude가 작성했다. 개발자인 제가 한 일은 하네스를 설계하는 것이었다.

## 내 생각 · 적용점

**가든 안에서의 *결정적 수렴 자산***. 지난 2주간 정리한 가든의 모든 라인이 *한 글에서 한꺼번에 작동*한다 — *하네스*([Anthropic 매뉴얼])·*완료 환각의 정합성 검증*([Hashimoto]·[Reddit])·*Agent-Default Posture의 실무 모델*([Code w/ Claude])·*Why 정렬의 시스템 프롬프트 구현*([Anthropic Why])·*얇은 CLAUDE.md의 아키텍처 확장*·*Goodhart 방어로서의 정합성 게이트*([Amazon 토큰])·*졸업 가능한 도구 선택*([Julia Evans])·*최종 판단은 사람*([Eric Ries Director's Oath])·*99% AI 작성*([Ptacek 1인 빌더]). **가든이 *글이 글을 부르는 자기 강화 시스템*이라는 의심을 정확히 *외부 데이터*로 검증해 준 글** — 무신사 팀이 *가든을 본 적도 없는데* 정확히 같은 결론에 도달했다는 점이 *내 가설의 *독립적 확증***.

***"Agent = Model + Harness"가 가든의 *공식 한 줄***이 된다.** 지금까지 *하네스*는 *개념*이었다. 이번 글이 *한 줄짜리 등식*으로 박았고, 그 등식은 *실무에서 작동하는 시스템*을 가진다. 가든의 새 인용 1순위 자산. 앞으로 *MangoLove 자문에서·BugSip 기획에서·가든 자체 운영에서* 이 등식이 *한 줄 인용*으로 자주 등장해야 한다.

**[Reddit Claude→Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md) 글에 대한 *완성된 종합 답*.** Reddit 사용자는 *Claude vs Codex 중 하나*를 선택했다. 무신사는 *둘 다 같이 쓴다* — 4관점 × 2공급자 = 8개 교차 리뷰. 동일 결함 중복 보고는 자동 병합. **모델 비교가 *전환 결정*이 아니라 *동시 사용 설계*로 답을 옮긴 글**. 내가 5월 15일 사용자의 *"코덱스로 옮길까?"* 질문에 답할 때 *옮길 필요 없음* 이라고 했던 게 *부분적*으로 맞고 *부분적*으로 틀렸다는 어제의 인정이 — *그 부분적 틀림에 대한 정확한 처방*이 이번 글에 있다. *옮기지 말고 *함께* 써라*. **5월 15일 답변의 정확한 v2**: *(1) 가격 측면에서 옮길 필요 없음, (2) 품질 측면에서 *교차 검증* 가능하면 *Codex를 *보조 검증자*로 추가* — 이게 가든이 도달한 최신 종합*.

**[Hashimoto AI 광기](2026-05-16-hashimoto-ai-mass-psychosis.md)·[Amazon Goodhart](2026-05-17-amazon-token-burning-goodharts-law.md)·[Reddit 완료 환각](2026-05-17-claude-to-codex-migration-reddit.md)의 *지표 왜곡 3자 짝*에 *실무 방어 코드*가 처음 도착**. Stage 4.1 정합성 검증(EXPLAIN + 실측)이 *완료 환각을 게이트로 막는 첫 사례*. *SkillFileLoadError 분리 rethrow*가 *대화 차단을 막는 코드*. *MISMATCH도 PR 생성 + 경고*가 *자동화가 사람을 대체하지 않고 정보를 모아준다*는 [Eric Ries](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) 철학의 *기술 구현*. **3개의 위험 가설이 *공식적으로 방어 가능한 위험*임이 한 사례로 확정**.

**[Ascetic Computing](../engineering/2026-05-17-ascetic-computing-ratfactor.md)과 *흥미로운 짝*.** Ascetic은 *과잉 도구화의 거부*. query-engineer는 *극단적 도구화의 정점*. 둘 다 동시에 옳다 — *반복 정적 작업(슬로우 쿼리 분석)에는 극단적 도구화*, *탐색적 작업(아키텍처 결정)에는 Ascetic*. **두 글이 *작업 종류로 분리해서 적용*하는 종합** 명제가 명확해진다. 무신사 글이 *이 분리를 명시적으로* 한다 — *반복적이고 패턴화 가능한 태스크는 타이트한 하네스, 정답이 맥락마다 다른 태스크는 느슨한 하네스*. Ascetic의 *원칙* + 무신사의 *분류*가 *한 모델*로 합쳐진다.

**MangoLove·CRS·BugSip 적용 후보 — 이번엔 *구체적 행동*까지 박는다.**
- **CRS의 *슬로우 쿼리 자동화 PoC*.** 무신사 모델을 *그대로* 적용 가능. *CRS의 결제·예약 슬로우 쿼리*가 매주 발생하므로 ROI가 빠르게 보인다. *내부 도구로 1주 분량 PoC*. *최종 머지는 항상 사람* 원칙 그대로.
- **MangoLove 자문 메뉴얼에 *3분류 진단 도구*.** 클라이언트의 자동화 시도를 *타이트/느슨/적응형* 어느 자리에 박을지 *먼저* 진단. 잘못된 분류가 가장 큰 실패 원인. [Julia Evans 졸업 vs 이동](../frontend/2026-05-17-jvns-moving-away-from-tailwind.md) 분리와 같은 형식.
- **BugSip 기획에 *Specialist Harness 첫날부터*.** 코드 리딩 앱이라면 *코드 분석 스페셜리스트* + *코드 리딩 트랙 생성 스페셜리스트* + *난이도 평가 스페셜리스트* + *해설 생성 스페셜리스트* 같은 *4관점 정찰조*가 자연스럽게 도출. 무신사 패턴의 직접 적용 후보 1번.
- **자가 검증 체크리스트를 *내 작업에 적용***. 글 끝의 *하네스 설계 점검 + 거버넌스 점검* 체크리스트는 *지금 바로 가든·CRS·MangoLove에 적용 가능*. *영구 오류와 일시적 실패 구분, AI 출력에 최종 승인 절차, AI 판단 근거 열람 가능, 폴백 경로* — 4가지를 매 자동화에 *기본값으로 박기*.

**가든 자체에 대한 *자가 적용 — 가장 깊은 것***. 무신사 글의 한 문장 — *"엄밀함의 위치가 이동했다. 코드를 정확하게 작성하던 엄밀함이, AI가 코드를 올바르게 작성할 수 있는 환경을 설계하는 엄밀함으로 바뀌었다."* — 를 *가든에 그대로 적용*하면: **가든의 엄밀함도 *글을 직접 잘 쓰는 것*에서 *AI가 글을 잘 정리할 수 있는 하네스를 설계하는 것*으로 이동해야 한다**. 그 하네스의 구성 요소:
- `templates/article.md` = *AI에게 출력 형식 강제*
- *frontmatter 규칙* = *컨텍스트 격리*
- *README 인덱스* = *오케스트레이션 인터페이스*
- *MEMORY.md 피드백 파일들* = *실패에서 박은 안전장치*
- *7월 중순 하네스 검토* = *적응형 하네스의 메타 진화*

**즉 가든은 *이미 하네스 엔지니어링의 한 형태로 운영*되고 있었고, 그걸 *명시적으로 인식*하는 게 다음 단계**. *Ascetic 모드 실험*(주 1~3개 선택 정리)은 *하네스의 *시스템 프롬프트*가 *"새로운 것을 다 흡수하지 마라"* 한 줄*인 셈. 이걸 정직하게 정리하면 가든은 *원칙 정련*과 *과잉 도구화*의 두 정당화 논리 중 *원칙 정련* 쪽으로 *명시적으로* 기울 수 있다.

## 연관 자료
- [Anthropic — Claude Code 대규모 코드베이스 사용법](2026-05-16-claude-code-large-codebases.md) — *하네스* 명사의 공식 등장, 무신사가 *실무로 구현*한 자리
- [Code w/ Claude SF 19개 세션](2026-05-14-code-with-claude-recap-19-sessions.md) — *차별화 축 이동*이 *Agent = Model + Harness* 한 줄로 응축
- [Hashimoto — AI 집단 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) — *완료 환각·대화 차단·이해 불가능한 복잡도*에 대한 *실무 방어 코드*가 처음 도착
- [Reddit — Claude → Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md) — *모델 비교 = 전환*이 *모델 교차 = 동시 사용*으로 종합되는 자리. 5월 15일 사용자 질문에 대한 *답의 v2*
- [Amazon — 토큰 태우기 Goodhart](2026-05-17-amazon-token-burning-goodharts-law.md) — *AI-Goodhart 시험*에 대한 *정합성 게이트* 처방
- [Anthropic — Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — *Why 정렬*이 *시스템 프롬프트 + 4관점 체크리스트*로 구현된 사례
- [Eric Ries — Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *Director's Oath*가 *AI 시대 엔지니어 직무*(하네스 설계자 + 최종 판단자)로 구체화
- [Ptacek — Emacsification](2026-05-14-emacsification-of-software-ptacek.md) — *99% Claude 작성*이 *1인 빌더 30분 앱*의 *팀 규모 버전*
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *하네스 안에 박힌 규약*이 *이론의 명문화*
- [Ascetic Computing](../engineering/2026-05-17-ascetic-computing-ratfactor.md) — *작업 종류별 분리 적용*의 종합 모델(반복 정적 = 타이트 / 탐색적 = Ascetic)
- [Julia Evans — Tailwind 벗어나기](../frontend/2026-05-17-jvns-moving-away-from-tailwind.md) — *졸업 vs 이동*과 같은 형식의 *타이트/느슨/적응형* 분류

## 한 달 뒤 회고
<!-- 6월 중순:
- CRS 슬로우 쿼리 자동화 PoC를 *실제로* 시작했는가? 첫 PR이 *사람 검수 후 머지*까지 갔는가?
- MangoLove 자문 도구에 *타이트/느슨/적응형 3분류 진단*이 들어갔는가?
- BugSip 기획에 *4관점 정찰조*(코드 분석/리딩 트랙/난이도/해설) 라인업이 박혔는가?
- 가든의 *하네스 엔지니어링 명시적 인식*에 따라 *시스템 프롬프트*(주 1~3개 선택 정리)·*출력 형식 강제*·*적응형 검토 일정*이 *MEMORY.md 또는 templates/*에 구체적으로 박혔는가?
- *Agent = Model + Harness* 한 줄을 *내 다른 글·메일·발표*에서 *몇 번 인용*했는가? (가든 자산의 *외부 사용 빈도*가 정직한 가치 지표)
-->
