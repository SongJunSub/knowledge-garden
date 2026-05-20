---
title: "Claude Code 대규모 코드베이스 사용법 — *하네스*가 모델 성능을 결정하는 새 운영 단위"
source_title: "How Claude Code Works in Large Codebases: Best Practices and Where to Start"
source_url: "https://claude.com/blog/how-claude-code-works-in-large-codebases-best-practices-and-where-to-start"
source_name: "Anthropic 공식 블로그"
referrer_url: "https://news.hada.io/topic?id=29556"
published_at: "2026-05-15"
summarized_at: "2026-05-16"
category: "ai"
tags: ["claude-code", "anthropic", "harness", "claude-md", "lsp", "mcp", "agent-manager", "large-codebase", "official-doc"]
---

# Claude Code 대규모 코드베이스 사용법 — *하네스*가 모델 성능을 결정하는 새 운영 단위

> 출처: [How Claude Code Works in Large Codebases — Anthropic](https://claude.com/blog/how-claude-code-works-in-large-codebases-best-practices-and-where-to-start) · GeekNews 경유 [news.hada.io/topic?id=29556](https://news.hada.io/topic?id=29556) · 정리일 2026-05-16

## 한 줄 요약
Anthropic 공식 매뉴얼 — Claude Code는 *색인 없이 라이브 코드*를 grep/참조 추적으로 탐색하므로, 모델 성능은 *어떤 모델인가*보다 *CLAUDE.md·hooks·skills·plugins·MCP로 구성된 *하네스*를 어떤 순서로 깔았는가*에 결정적으로 좌우된다. 운영 단위가 *프롬프트 → 대화 → 세션 → **하네스***로 한 단계 더 위로 이동했다는 공식 진술. 댓글의 *"지시 불이행 90%"* 비판은 *현실과 매뉴얼의 비대칭*을 보여준다.

## 핵심 포인트

- **색인 없는 *라이브 탐색* — RAG 임베딩과의 본질적 차이.** Claude Code는 *코드베이스를 미리 인덱싱하지 않고* grep과 참조 추적으로 *지금 이 순간의 파일 시스템*을 읽는다. 임베딩 기반 도구는 *마지막 인덱싱 시점의 코드*를 보는 반면, Claude Code는 *살아 있는 코드*를 본다. 이게 *코드가 매일 바뀌는 환경*에서 명백한 우위.
- ***하네스* 라는 새 운영 개념.** Anthropic이 공식 용어로 박는 *하네스(harness)* = *CLAUDE.md(컨텍스트) + hooks(트리거) + skills(절차) + plugins(도구셋) + MCP(외부 자원)* 의 *통합 구성*. *모델*은 표준화 자원이고, *하네스 품질*이 *조직별 차별점*이 된다는 메시지. ([Code w/ Claude SF](2026-05-14-code-with-claude-recap-19-sessions.md)에서 본 "차별화 축 이동"이 *하네스*라는 한 단어로 응축됨.)
- ***얇고 계층적* CLAUDE.md — 루트는 큰 그림, 하위 디렉터리는 로컬 규칙.** 한 줄짜리 처방인데 *Naur 이론*의 *조직 차원 명문화*. *루트 = 시스템의 *왜**, *하위 = *어떻게**. *얇음*이 핵심 — *과적합 문서*는 *세션마다 컨텍스트 토큰을 낭비*하고 *모델의 자율 판단 공간*을 좁힌다.
- **LSP 통합 = *심볼 기준 탐색*으로의 이동.** 문자열 검색만으로는 *이름이 같은 다른 심볼*을 구분 못 한다. LSP를 하네스에 넣으면 *진짜 정의/참조*로 점프 가능. 댓글의 *"실무 엔지니어는 기억된 심볼을 찾지 무차별 탐색을 안 한다"* 비판에 대한 *Anthropic 측 답*이 이미 글 안에 박혀 있다.
- ***에이전트 매니저* 역할의 공식화.** 새 직무 라인의 등장: *하네스를 운영하는 사람*. plugin 권한 관리, 설정 검토, MCP 자원 점검. *3~6개월마다 의도적 검토 권장*. 이는 [Eric Ries Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)의 *Director's Oath*와 같은 *주기적 미션 점검*의 도구 버전.
- **댓글의 *현실 비대칭* 비판 4가지.**
 - 실무 엔지니어는 *기억된 심볼*을 찾지 *무차별 탐색*을 하지 않음
 - skills/hooks가 *작동하지 않는* 경우 많음
 - 지시 불이행이 *약 90%*로 여전한 문제
 - 구체적 *CLAUDE.md 작성법*이 부재해서 실전 적용 어려움

## 인상 깊은 문장

> Claude Code는 *색인 없이* 개발자 머신에서 *직접 파일 시스템을 탐색*하고 grep, 참조 추적으로 라이브 코드를 읽는다.

> 모델 성능은 *하네스의 구축 순서*에 크게 의존한다.

## 내 생각 · 적용점

***하네스* 라는 단어가 가든 안에서 정확히 들어맞는 첫 공식 용어.** 지금까지 가든은 [Code w/ Claude SF](2026-05-14-code-with-claude-recap-19-sessions.md)에서 *"차별화 축이 모델 호출 방식 → 도구·데이터·권한·문맥으로 이동"* 이라는 *문장*만 잡고 있었다. 이번 글이 그 *문장*에 *하네스*라는 *명사*를 박았다. 이 단어를 *조직 자산의 단위*로 인식해야 한다 — 하네스는 *코드보다 위*이지만 *프로세스보다 아래*에 있는 새 자산층. *모델*이 LLM 회사의 자산이라면 *하네스*는 *우리 조직 고유 자산*. 가든 자체가 *내 개인 하네스*의 일부.

**[Hashimoto AI 광기](2026-05-16-hashimoto-ai-mass-psychosis.md)에 *공식 매뉴얼*이 동시에 등장한 시점의 의미.** 같은 날 가든에 들어온 두 글. 공식 매뉴얼이 *"제대로 쓰는 법"* 을 제시하고, Hashimoto는 *"실제로 그렇게 쓰지 않는다"* 고 한다. **두 글의 *시간적 동시성*이 핵심** — Anthropic이 *공식 베스트 프랙티스*를 내놓아도 *조직 거버넌스가 따라가지 못하면* Hashimoto의 진단이 그대로 작동한다. 매뉴얼은 *광기 방지의 필요 조건*이지만 *충분 조건은 아니다*. **댓글의 *지시 불이행 90%*가 정확히 Hashimoto의 *현장 보고*** — Anthropic은 *모델/도구*를 책임지지만 *조직의 사용 자세*는 책임지지 않는다는 경계가 *댓글 vs 매뉴얼*에서 가시화.

**[Naur 이론 형성](../engineering/2026-05-14-naur-programming-as-theory-building.md)이 *얇은 CLAUDE.md* 처방의 *왜*에 그대로 들어맞는다.** Naur는 *문서가 이론을 대체할 수 없다*고 했다. Anthropic은 *얇은 CLAUDE.md*를 권한다 — *두꺼운 문서는 이론을 대체하려는 헛된 시도*이고, *얇은 CLAUDE.md*는 *이론 보유자가 옆에 있을 때 그의 설명 비용을 줄이는 보조*. 두 글이 *처방의 형식 자체*에서 일치한다. 그러므로 *우리 조직의 CLAUDE.md 작성 가이드*를 만들 때, *얇음의 정도*는 *Naur의 이론*과 *Anthropic의 권장*이 *같은 답을 가리킨다는* 점을 인식하고 박을 것.

**[Anthropic Why 정렬](2026-05-14-teaching-claude-why-alignment-training.md)이 *조직 차원으로 외부화*된 형태가 CLAUDE.md.** Anthropic은 *모델에 *왜*를 가르치면 28배 일반화한다*고 했다. CLAUDE.md는 *우리 조직의 왜를 모델에 가르치는* 도구 — 즉 *Why 정렬의 사용자 측 진입로*. 두 글이 같은 메커니즘을 *모델 제공자 측*과 *사용자 측*에서 본 것. **이걸 인식하면 CLAUDE.md 작성의 *목적이 명확*해진다** — *코드 스타일 규칙 모음*이 아니라 *우리가 왜 이렇게 만드는가의 이론*. *얇아야 하는 이유*도 자명 — 두꺼운 *어떻게*는 *왜* 를 가린다.

**[matklad 소프트웨어 아키텍처](../engineering/2026-05-13-learning-software-architecture.md) + Conway's Law의 *3자 동형*.** Conway's Law는 *조직 구조 = 소프트웨어 구조*. 이제 *조직 구조 = 소프트웨어 구조 = 하네스 구조* 의 *3자 동형*으로 확장된다. **우리 조직의 하네스(CLAUDE.md 트리·MCP 자원 분리·skills 권한 구조)가 *우리 조직의 의사결정 구조*와 동형이 아니면 *하네스가 작동하지 않는다***. 댓글이 보고한 *"하네스가 작동 안 한다"*의 진짜 이유 후보 — *조직 구조와 하네스 구조의 미스매치*. 가든에서 새로 박을 가설.

**MangoLove·CRS·BugSip 적용 후보.**
- **CRS의 *하네스 인벤토리 작성*.** *지금 우리가 깔아 둔* CLAUDE.md·hooks·skills·plugins·MCP를 *한 곳에 인벤토리화*. 안 깔린 것보다 *깔려 있지만 작동 안 하는 것*이 더 위험 — Hashimoto의 *지표 왜곡*과 같은 메커니즘.
- **CLAUDE.md *얇음의 정도*를 KPI로.** *루트 CLAUDE.md가 한 화면을 초과하면 정리* 같은 *상한선 규칙*. *과적합 컨텍스트*가 *모델 자율 판단 공간*을 좁히는 비용을 *명시적*으로 인식.
- **MangoLove의 *에이전트 매니저* 직무 정의.** *3~6개월 의도적 검토*를 자문 클라이언트에게도 권장. *하네스 자산의 *시간 부식* 방지는 분기 회의 한 칸*. [Ries Incorruptible Director's Oath](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md)의 *도구 버전*.
- **BugSip 자체에 *얇은 CLAUDE.md*를 첫날부터.** 기획 단계에서 *왜 만드는가*만 한 페이지로 박고 *어떻게*는 *코드와 PR이 자체적으로 표현*하도록. *Naur*·*Anthropic*·*Ries*가 같은 처방으로 모이는 자리.

**가든 자체에 대한 적용.** 가든 운영의 *하네스*는 무엇인가? `templates/article.md`·README 인덱스·이 글들의 frontmatter 규칙·`MEMORY.md`의 피드백 시스템 — 이 모든 게 *하네스*다. 그러면 *3~6개월 의도적 검토*는 가든 자체에도 적용된다. *7월 중순쯤 가든 하네스 인벤토리*를 한 번 점검할 일정으로 박을 가치가 있다. 매일 글 추가에 매몰되어 *하네스 자체가 부식*하지 않는지가 [Hashimoto의 광기 자가 진단](2026-05-16-hashimoto-ai-mass-psychosis.md)의 *구체적 점검 방법*.

## 연관 자료
- [Code w/ Claude SF — 19개 세션](2026-05-14-code-with-claude-recap-19-sessions.md) — *차별화 축 이동*에 *하네스*라는 명사가 박힌 자리
- [Hashimoto — AI 집단 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) — *공식 매뉴얼 vs 현실 사용 자세*의 비대칭, 같은 날 짝 자산
- [Anthropic — Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — CLAUDE.md = *Why 정렬의 사용자 측 진입로*
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *얇은 CLAUDE.md*의 처방 근거
- [matklad — Learning Software Architecture](../engineering/2026-05-13-learning-software-architecture.md) — *Conway's Law*의 *조직-소프트웨어-하네스 3자 동형* 확장
- [Eric Ries — Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *Director's Oath*의 *하네스 분기 검토* 변형
- [Ptacek — Emacsification](2026-05-14-emacsification-of-software-ptacek.md) — *1인 빌더*의 하네스 = *개인 CLAUDE.md*; 가든 운영자 본인의 적용 단위

## 한 달 뒤 회고
<!-- 6월 중순: CRS 하네스 인벤토리를 작성했는가? 루트 CLAUDE.md가 *한 화면 룰*을 지키고 있는가? 가든 자체 하네스 검토 일정(7월 중순)을 박았는가? MangoLove 자문 메뉴얼에 *에이전트 매니저 직무 정의*가 들어갔는가? BugSip 기획 단계 CLAUDE.md *한 페이지 룰*을 첫날부터 적용했는가? -->
