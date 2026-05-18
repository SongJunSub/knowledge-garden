---
title: "Eugene Yan: AI와 *복리로* 성장하는 5가지 원칙 — *개인 차원 하네스 엔지니어링*의 종합"
source_title: "Compounding with AI: How I work with AI to grow over time"
source_url: "https://eugeneyan.com/writing/compounding-with-ai/"
source_name: "Eugene Yan (eugeneyan.com)"
referrer_url: "https://news.hada.io/topic?id=29606"
published_at: "2026-05-17"
summarized_at: "2026-05-18"
category: "ai"
tags: ["eugene-yan", "ai-collaboration", "claude-code", "harness", "individual-developer", "mcp", "compounding", "lazy-loading", "context-engineering"]
---

# Eugene Yan: AI와 *복리로* 성장하는 5가지 원칙 — *개인 차원 하네스 엔지니어링*의 종합

> 출처: [Compounding with AI — Eugene Yan](https://eugeneyan.com/writing/compounding-with-ai/) · GeekNews 경유 [news.hada.io/topic?id=29606](https://news.hada.io/topic?id=29606) · 정리일 2026-05-18

## 🔖 한 줄 요약
Eugene Yan(전 Amazon Applied Scientist, ML 분야 유명 블로거)이 정리한 *개인 차원에서 AI와 복리로 성장하는 5가지 원칙* — 컨텍스트 인프라·취향 설정화·검증 자동화·위임 확대·피드백 루프. **[무신사 query-engineer](2026-05-18-musinsa-query-engineer-harness.md)의 *팀 차원 하네스*와 정확히 짝을 이루는 *1인 차원 하네스 종합***. 5가지 원칙이 가든 메타프레임에 원칙별로 직접 매핑되며 *복리(compounding)*라는 새 시간 키워드를 박는다.

## 🧩 핵심 포인트

- ***복리*라는 시간 키워드.** 제목의 *compounding* 한 단어가 글 전체의 톤. **하네스 자산은 *한번 잘 만들면 매번 작업에서 가치를 만든다*** — 시간 축에서 *복리*. [Anthropic 매뉴얼 *3~6개월 의도적 검토*](2026-05-16-claude-code-large-codebases.md)·[무신사 *실패에서 하네스 업데이트*](2026-05-18-musinsa-query-engineer-harness.md)의 정확한 *경제학적 단어* — 하네스 ROI는 *선형 누적*이 아니라 *복리*.

- ***5가지 원칙*** —

  ### 1. 컨텍스트 인프라 (Context Infrastructure)
  - 코드와 지식 작업을 *구조화*
  - **MCP(Model Context Protocol)로 조직 정보를 모델에 연결**
  - **프로젝트별 `CLAUDE.md`를 *온보딩 문서처럼* 작성**

  [Anthropic 얇은 CLAUDE.md](2026-05-16-claude-code-large-codebases.md) + [무신사 스킬 시스템](2026-05-18-musinsa-query-engineer-harness.md)의 *처방 일치*. "온보딩 문서처럼" 이라는 비유가 결정적 — *새 합류자 = 새 Claude 세션*. *Naur의 이론 보유자*가 *모델*에게도 그대로 적용.

  ### 2. 취향 설정화 (Tastes as Configuration)
  - `~/.claude` 디렉터리에서 *행동 규칙과 워크플로* 관리
  - *반복 작업은 스킬로 자동화*
  - **불필요한 로딩을 피하기 위해 *지연 로딩(lazy loading)*** 구현

  새 키워드 ***지연 로딩***. *얇은 CLAUDE.md*의 *기술적 구현 패턴* — *컨텍스트는 필요할 때만 로드*. **가든의 *frontmatter 카탈로그*가 정확히 지연 로딩 구조** — 전체 글을 다 로드하지 않고 *frontmatter만 보고 연관된 글만 *필요할 때* 로드*.

  ### 3. 검증 자동화 (Automated Verification)
  - *린팅·테스트·eval*을 단계별로 구성
  - **모델이 *스스로 검증*하도록**
  - **긴 세션에서 *드리프트* 방지를 위해 *페어 프로그래밍 구조* 도입**

  [무신사 Stage 4.1 정합성 검증](2026-05-18-musinsa-query-engineer-harness.md)·[Hashimoto 완료 환각](2026-05-16-hashimoto-ai-mass-psychosis.md) 처방의 *개인 차원*. *드리프트(drift)*가 LangChain의 *Context Rot*과 같은 현상의 다른 이름. *페어 프로그래밍 구조*가 처방 — *모델이 인간에게 *확인 체크포인트*를 의도적으로 요구*.

  ### 4. 위임 확대 (Expanding Delegation)
  - *점진적으로 더 큰 작업 단위*를 위임
  - **병렬 세션 3~6개 동시 운영**
  - *원격 제어로 AFK 중에도 체크인*

  [Code w/ Claude Managed Agents](2026-05-14-code-with-claude-recap-19-sessions.md)의 *기업 차원 멀티 에이전트*가 *개인 차원에서 3~6개 병렬 세션*. [무신사 *4정찰조 병렬*](2026-05-18-musinsa-query-engineer-harness.md)이 *팀 단위에서 자동화된 것*을 *개인 단위에서 *수동 운영*. 새 행동 패턴 — *AFK 중에도 모바일로 승인/체크인*은 [GN#358 Codex 모바일 통합 #29514](../weekly/2026-W20-geeknews-358.md)의 사용자 측 자가 적용.

  ### 5. 피드백 루프 (Feedback Loop)
  - *공개적 작업*으로 팀 컨텍스트 유지
  - **과거 *트랜스크립트 마이닝*으로 설정 개선**
  - *주기적 리팩터링*으로 규칙 충돌 방지

  *과거 트랜스크립트 마이닝*이 가장 새로운 처방 — *내 과거 대화를 *내 하네스 개선의 데이터*로 쓴다*. 이게 *적응형 하네스*([무신사 분류 체계 중 3번째](2026-05-18-musinsa-query-engineer-harness.md))의 *개인 차원 구체화*. 가든의 *한 달 뒤 회고* + *7월 중순 하네스 검토*가 정확히 이 처방의 실행 단위.

- ***인간 팀 협업에도 동일하게 적용 가능한 범용 프레임워크***. 글 마지막 한 줄. **5가지 원칙이 *AI 협업뿐 아니라 인간 팀 협업에도 그대로 작동***. 이건 *Conway's Law*의 다음 단계 진술 — *팀 구조 = 하네스 구조 = 모델 협업 구조* 의 3자 동형이 [matklad](../engineering/2026-05-13-learning-software-architecture.md)에서 본 *조직-소프트웨어-하네스 3자 동형*에 *팀 협업*까지 4자로 확장.

## 📜 인상 깊은 문장

> AI와의 협업으로 *복리처럼* 성장한다.

> CLAUDE.md를 *온보딩 문서처럼* 작성하라.

> 불필요한 로딩을 피하기 위해 *지연 로딩*을 구현하라.

> 모델이 *스스로 검증*하도록.

> 긴 세션의 *드리프트* 방지를 위해 *페어 프로그래밍 구조*를 도입하라.

> 과거 *트랜스크립트 마이닝*으로 설정 개선.

## 💭 내 생각 · 적용점

**가든 안에서의 *팀 vs 개인 짝 자산 완성***.
지난 1주간 정리한 가든의 *하네스 라인*이 *4개의 차원으로 정렬*된다:

| 차원 | 자산 | 정리본 |
|---|---|---|
| **모델 차원** | LLM 회사의 *Why 정렬* | [Anthropic Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) |
| **개인 차원** | 1인 개발자의 *5원칙 복리* | **이 글 (Eugene Yan)** |
| **팀 차원** | 4정찰조 + 8 교차 검증 | [무신사 query-engineer](2026-05-18-musinsa-query-engineer-harness.md) |
| **조직 차원** | 5대 기둥 + 운영 절반 | [Luca Valli 플랫폼 엔지니어링](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md) |
| **시장 차원** | System of Intelligence | [a16z SoR→SoI](../career/2026-05-18-system-of-record-to-system-of-intelligence-a16z.md) |

**5층의 *각 층에 같은 5가지 원칙*이 다른 모양으로 작동**한다는 게 가든의 새 메타 가설. 컨텍스트 인프라·취향 설정화·검증 자동화·위임 확대·피드백 루프 — 이 5가지가 *모든 층에서 같은 처방*. **5 원칙 × 5 층 = 25칸 체크리스트**가 가든의 새 진단 도구.

***지연 로딩*이 *가든 frontmatter 설계 결정의 사후적 정당화***.
가든이 *왜 frontmatter 카탈로그를 *각 글 위에* 두는가*에 대해 지금까지 명확한 *이론적 근거*가 없었다. Eugene Yan의 *지연 로딩*이 그 답 — **frontmatter = 카탈로그 = 지연 로딩의 메타데이터**. 전체 글을 다 로드하지 않고 *frontmatter만 보고 연관된 글만 필요할 때 로드*. **이건 *내가 의식적으로 설계한 게 아니라 *우연히 잘 박은 패턴**이 *Eugene Yan의 5원칙에 정확히 매핑*된다는 *사후적 외부 검증***. 가든 운영의 정직한 다음 단계는 *이 패턴을 *명시적*으로 인식하고 *frontmatter 설계를 더 *지연 로딩 친화적*으로 강화*하는 것.

**[Hashimoto AI 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) 처방의 *개인 차원 매뉴얼***.
Hashimoto는 *조직 차원의 광기*를 진단했다. Eugene Yan은 *개인 차원에서 광기에 빠지지 않는 5가지 의례*를 처방. 특히 **3번 *검증 자동화* + *드리프트 방지 페어 프로그래밍 구조*** 가 가장 정밀한 자기 방어. *드리프트*가 [LangChain Context Rot](2026-05-18-musinsa-query-engineer-harness.md)과 같은 현상의 다른 이름 — *컨텍스트가 채워질수록 추론 능력이 저하*. *페어 프로그래밍 = 사람이 *체크포인트 역할*을 명시적으로 박는 것*. 가든의 *한 달 뒤 회고*가 *세션 차원의 페어 프로그래밍*과 같은 형식 — *과거의 내가 *현재의 나에게 *체크포인트를 요구**한다.

**[Reddit Claude→Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md)의 *완료 환각*에 대한 *개인 차원 처방***.
Reddit 사용자는 *완료 환각으로 인한 좌절*을 보고했다. Eugene Yan의 *모델이 스스로 검증하도록* + *린팅·테스트·eval 단계별 구성* + *페어 프로그래밍 체크포인트*가 *그 좌절을 막는 3중 방어*. 가든이 정리한 *지표 왜곡 4자 짝*([Hashimoto 조직 차원]·[Amazon 조직 인센티브]·[Reddit 모델 차원]·[무신사 실무 방어 코드])에 *개인 차원 5원칙*이 추가되어 **5자 짝으로 완성**.

**[Ascetic Computing](../engineering/2026-05-17-ascetic-computing-ratfactor.md)과의 *상호 보완***.
Ascetic은 *최소 도구로 깊이를 만든다*. Eugene Yan은 *5가지 인프라로 복리를 만든다*. **두 글이 *서로의 빈자리를 채운다*** — Ascetic은 *도구를 줄이는* 측면, Eugene Yan은 *남은 도구를 *깊이 박는* 측면. *둘 다 동시에 옳다* — *큐레이션된 단순함*([Ascetic]) + *그 단순함을 *복리 자산으로 깊이 박기*([Eugene Yan]). 가든의 *Ascetic 모드 실험*(주 1~3개 선택 정리)이 *Ascetic의 큐레이션*이라면, *그 1~3개를 *복리 자산*으로 만드는 5원칙 적용*이 *Eugene Yan의 보강*.

**MangoLove·CRS·BugSip 적용 후보 — *5원칙별 실행 체크리스트***.
- **MangoLove 자문 도구에 *5원칙 자가 진단 체크리스트***. 클라이언트의 *AI 협업 인프라*를 5원칙별로 1~5점 진단. [Luca Valli 5대 기둥](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md)·[무신사 3분류](2026-05-18-musinsa-query-engineer-harness.md)와 *3중 진단 도구*가 완성됨.
- **CRS에 *프로젝트별 CLAUDE.md를 *온보딩 문서처럼****. CRS 신규 합류자 *온보딩 문서*를 *CLAUDE.md*와 *물리적으로 같은 파일*로 만들기. *사람과 모델에게 *같은 진입로*가 의도적 설계 결정.
- **BugSip 처음부터 *5원칙 인프라***. 컨텍스트 인프라(코드 메타데이터·MCP) + 취향 설정화(`~/.bugsip`) + 검증 자동화(코드 리딩 결과 검증) + 위임 확대(병렬 학습 세션) + 피드백 루프(과거 학습 트랜스크립트 마이닝). **첫날부터 5원칙으로 설계**된 *코드 리딩 앱*은 *Eugene Yan 명제의 가장 직접적 구현*.
- **가든의 *지연 로딩 강화*** — frontmatter 설계를 *더 일관되게* (모든 글에 *연관 자료 + 다음 정리 후보 + 한 달 뒤 회고*가 *같은 슬롯*에 있도록). 7월 중순 하네스 검토에서 *frontmatter 일관성*을 *체크리스트*로 점검.

**가든 자체에 대한 자가 적용 — *6번째 자가 진단***.
지난 자가 진단 5개:
1. [Hashimoto] "정리 건수 ≠ 이해 깊이"
2. [Amazon Goodhart] "한 달 뒤 회고가 실제로 작동하는가"
3. [Reddit Claude→Codex] "비판적 글에 대한 편향"
4. [Ascetic] "원칙 정련 vs 과잉 도구화"
5. [Luca Valli 플랫폼 엔지니어링] "5대 기둥 중 가장 약한 영역 = 기초로 운영"

**6번째 자가 진단 = Eugene Yan 5원칙 *복리* 시험**:
> *내 가든 자산이 *복리로* 누적되고 있는가, 매주 0에서 다시 시작하는가?*

*복리*의 증거: *한 글이 다른 글에 인용*되고, *과거 글의 가설이 새 글에서 *확장됨*. 이 점에서 가든은 *복리로 누적*되는 시스템 — [Naur]에서 [Anthropic 매뉴얼]로, [무신사]로, [Luca Valli]로, [a16z]로 *가설이 시간 축으로 *복리* 자라남*. **단, *Ascetic 모드 실험*이 *복리를 끊을 위험*에 있는가?** 답: *복리는 *글의 수*가 아니라 *글이 다른 글에 어떻게 작용하는가*에 달려 있다*. 그러므로 *주 1~3개 선택*이 *복리를 끊지 않는다* — 오히려 *더 깊은 연결을 만들 수 있는 시간을 확보*. **Ascetic 모드 실험이 *복리 친화적임*이 확정된다**.

## 🔗 연관 자료
- [Anthropic — Claude Code 대규모 코드베이스 사용법](2026-05-16-claude-code-large-codebases.md) — *얇은 CLAUDE.md + 하네스* 라는 *개인 차원의 출발 자리*
- [무신사 query-engineer](2026-05-18-musinsa-query-engineer-harness.md) — *팀 차원 하네스*의 *완성 짝*
- [Luca Valli — 플랫폼 엔지니어링](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md) — *조직 차원 하네스*의 *상위 짝*
- [Hashimoto — AI 집단 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) — *조직 차원 광기 진단*의 *개인 차원 매뉴얼* 짝
- [Reddit — Claude → Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md) — *완료 환각*에 대한 *5원칙 3중 방어*
- [Ascetic Computing](../engineering/2026-05-17-ascetic-computing-ratfactor.md) — *큐레이션된 단순함* + Eugene Yan *복리 자산화* 의 상호 보완
- [Code w/ Claude SF Managed Agents](2026-05-14-code-with-claude-recap-19-sessions.md) — *기업 차원 멀티 에이전트* ↔ *개인 3~6개 병렬 세션*
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *CLAUDE.md를 온보딩 문서처럼*의 처방 근거 (이론 형성 = 온보딩)
- [matklad — Conway's Law](../engineering/2026-05-13-learning-software-architecture.md) — *3자 동형*이 *팀 협업 4자 동형*으로 확장 (Eugene Yan 마지막 한 줄)

## 📝 한 달 뒤 회고
<!-- 6월 중순:
- 5원칙 × 5층 = **25칸 체크리스트**를 *실제로* 만들었는가?
- CRS의 *프로젝트별 CLAUDE.md를 *온보딩 문서로*가 *명시적*으로 박혔는가? 새 합류자와 새 Claude 세션에 *동일한 진입로*가 제공되는가?
- 가든의 *frontmatter 일관성*을 *지연 로딩 친화적* 관점에서 *7월 중순 하네스 검토*에 점검 항목으로 박았는가?
- BugSip 기획에 *5원칙 첫날부터 인프라* 설계가 들어갔는가?
- **6번째 자가 진단 — *복리 시험*: 가든 자산이 *복리로* 누적되는가?**의 한 달 결과는?
- *과거 트랜스크립트 마이닝* — 내 *Claude 대화 history*를 *내 하네스 개선의 데이터*로 *한 번이라도* 활용했는가?
-->
