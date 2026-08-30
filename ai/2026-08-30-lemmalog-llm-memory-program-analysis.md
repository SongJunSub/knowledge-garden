---
title: "우연히 프로그램 분석 엔진이 된 LLM 메모리 — Datalog 상태 관리 엔진 Lemmalog, '검색'이 아니라 '지금 무엇이 참인가'를 추론한다"
source_title: "I accidentally turned LLM memory into program analysis"
source_url: "https://pwning.systems/posts/llm-memory-program-analysis/"
source_name: "pwning.systems (Jordy Zomer)"
referrer_url: "https://news.hada.io/topic?id=33015"
published_at: "미확인 (원문 접근 불가로 확인 못함)"
summarized_at: "2026-08-30"
category: "ai"
tags: ["llm-memory", "datalog", "agent-state", "program-analysis", "provenance", "incremental-computation", "mcp"]
---

# 우연히 프로그램 분석 엔진이 된 LLM 메모리

> 출처: [I accidentally turned LLM memory into program analysis](https://pwning.systems/posts/llm-memory-program-analysis/) (Jordy Zomer, pwning.systems · Google 보안 엔지니어, 퍼징/정적분석 배경) · 정리일 2026-08-30

## 한 줄 요약

**LLM 에이전트의 장기 메모리를 "과거 대화를 잘 검색하는 문제"가 아니라 "지금 무엇이 참인지를 사실(fact)과 규칙(rule)으로 관리하고, 전제가 바뀌면 거기서 파생된 결론을 자동으로 무효화하는 문제"로 재정의하면, 결국 정적 분석 엔진(Datalog)을 재발명하게 된다는 이야기.** 저자는 정적 분석·퍼징이 본업인 보안 연구자로, 에이전트 메모리를 설계하다가 "이거 내가 하던 프로그램 분석이랑 똑같잖아"라는 자각에 이르러 Lemmalog라는 Datalog 엔진을 만들었다.

## 핵심 포인트

- **문제의 재정의**: 기존 RAG식 메모리는 "관련 있어 보이는 과거 청크를 검색해서 LLM에게 던지고, 어떤 결론이 아직 유효한지는 LLM이 알아서 판단하길" 바란다. 저자의 표현으로 ***"지금 우리는 이런 메모리 일부를 검색해서, LLM이 어떤 결론이 아직 유효한지 알아서 잘 골라내기를 바라고 있을 뿐이다"*** — 이 구조 자체가 매 턴 재추론·재검증 비용과 오류 가능성을 낳는다.
- **Datalog 계층화 규칙(stratified rules)**: 사실을 삼중항(`S --rel[conf]--> O`)으로 저장하고, 규칙으로 새 사실을 도출한다. 음의 부재성(negation-as-absence)과 순환 참조 거부로 안전성을 보장 — 일반 정적 분석 엔진(Doop, Souffle류)과 동일한 계보의 설계.
- **출처 추적(provenance) + 철회(retraction)**: 모든 파생 사실은 원본 근거까지 거슬러 올라가는 증명 체인을 갖는다. `why()`로 증명 트리를 조회할 수 있고, 근거가 되는 사실 하나가 취소되면 ***그 사실에 의존한 결론들만 영향 범위를 좁혀 재계산***한다(supersession) — 매번 전체를 다시 계산하지 않는다.
- **증분 도출(incremental derivation)**: Seminaive 고정점 알고리즘으로 이전 턴 이후의 변화분(delta)만 처리. 시간(`valid_from`/`valid_to`, `now()`)과 신뢰도(곱셈 t-노름 전파)까지 주석으로 관리한다.
- **토큰 경제**: 질문당 비용이 대화 이력 길이와 무관하게 거의 상수(~2,300~2,500토큰)로 유지된다. 저자 주장으로 500턴 시점에는 전체 맥락 대비 누적 비율이 400배 차이, LongMemEval에서는 전체 맥락(104,000토큰) 대비 질문당 약 45배 절감.
- **벤치마크 성적은 1등이 아니라 "설계가 보상받는 영역에서 강함"**: LongMemEval(15명 규모, 30문항)에서 전체 F1 0.48·EM 11/30이며, 지식 업데이트(F1 0.80)·단일 세션(F1 ~1.00)에서 강하고 시간 추론(F1 0.57)에서 약하다. LoCoMo(10개 대화, 1,986문항) 표준 벤치마크에서는 F1 0.533으로 10개 시스템 중 3위(1위 PropMem 0.605, 7위 SimpleMem 0.358) — ***적대적 질문(0.707, 전체 맥락 0.509를 오히려 상회)과 시간 추론(0.454, 개선 전 0.257)에서 두각***을 보이지만 순수 사실 회상(0.399)에서는 상대적으로 약하다.
- **MCP 서버로 실전 통합**: Claude Code·Kimi CLI용 MCP 서버로 `lemmalog_observe`/`query`/`why`/`what_if`/`canonicalize` 등 12개 도구를 제공. 호스트 LLM이 자연어를 구조화된 사실로 변환하면 Lemmalog가 폐포·시간 뷰·정규화를 결정론적으로 계산 — "LLM은 추출만, 추론은 엔진이" 구조.

## 인상 깊은 문장

> "Now we retrieve some subset of these memories and hope that the LLM correctly figures out which conclusions are still valid."

> "At some point it became fairly obvious that I had approached the problem like a static analysis engine without intentionally meaning to."

## 댓글

**출처 한계를 먼저 밝힌다.** `news.hada.io`와 `pwning.systems` 모두 이 세션 네트워크 egress 정책에 막혀 있어 hada 토픽 페이지와 원문 블로그 포스트를 단 한 줄도 직접 열지 못했다. 따라서 **hada 댓글 수·HN/Lobsters 큐레이션 여부는 이 노트에서 확인 불가**다. 대신 GitHub 저장소([JordyZomer/lemmalog](https://github.com/JordyZomer/lemmalog)) README는 정상 접근되어 아키텍처·MCP 도구·벤치마크 수치는 1차 소스(저장소 README)로 확보했고, 블로그 인용문 2개와 저자 신원(Jordy Zomer, Google 보안 엔지니어, pwning.systems 운영자)은 WebSearch 스니펫 교차검증으로 재구성했다. 발행일도 확인하지 못해 `published_at`은 비워둔다. 벤치마크 수치는 **저자 본인이 공개한 저장소 README의 자체 보고 수치**라는 점 — 즉 n=1 프로젝트의 자체 평가이며 제3자 재현·검증은 확인되지 않았다는 한계를 명시해둔다. LoCoMo 순위(3/10)도 상위 벤치마크 목록의 다른 9개 시스템 구성이 무엇인지, 공정한 비교 조건인지는 원문 미확인 상태다.

## 내 생각 · 적용점

**핵심 전이 1 — "세션 기록 검색"에 대한 정반대 처방이 사실은 같은 진단에서 나온다.** [[2026-07-03-session-transcripts-not-useful-for-agents]]는 "과거 세션 기록을 검색하게 하면 이미 아는 정보를 반복 처리하며 토큰만 낭비하고 의도 편차(intent drift)가 쌓인다"고 비판했다. Lemmalog는 정확히 같은 문제 — "검색된 과거가 지금도 유효한지 LLM이 매번 재판단해야 하는 구조" — 를 진단하지만 처방이 다르다: 세션 기록 자체를 버리는 대신, 대화에서 **사실만 추출해 구조화하고 무효화 규칙을 엔진에 위임**한다. 두 글을 나란히 보면 "원시 로그를 쌓아 검색"과 "사실을 증류해 추론"이라는 메모리 설계의 두 축이 뚜렷해진다.

**핵심 전이 2 — SSOT 갱신 구조의 거울상.** [[2026-08-28-line-llm-wiki-code-driven-ssot]]는 `raw`(원본 맥락)와 `knowledge`(LLM이 정리한 지식)를 분리하고 코드가 바뀌면 PR로 knowledge를 갱신해 "문서 부패"를 리뷰 루프 안으로 끌어들이는 설계였다. Lemmalog의 사실/파생결론 분리 + provenance 기반 자동 철회는 **같은 문제(원본이 바뀌면 파생물이 낡는다)를 사람 리뷰 없이 완전 자동으로 해결**하려는 시도라는 점에서 대조적이다 — 코드베이스 지식은 PR 게이트가 있어 인간 검토가 자연스럽지만, 대화형 에이전트 메모리는 매 턴 자동화가 필수이므로 이 차이가 설계를 가른다.

**핵심 전이 3 — Brain/Hands/Session 분리에서 "Brain"의 구체적 구현체 후보.** [[2026-05-04-long-running-agents]]가 제시한 Brain(지속 상태)/Hands(실행)/Session(단기 컨텍스트) 3분리에서 Brain 계층이 실제로 무엇으로 구현되어야 하는지는 추상적으로 남아 있었다. Lemmalog는 그 자리에 "검증 가능한 추론 데이터베이스"라는 구체적 답을 제시한다 — Checkpoint-and-Resume이 상태의 스냅샷이라면, Lemmalog는 상태의 정합성(무엇이 왜 참인지)까지 관리하는 한 단계 더 나아간 형태다.

## 호스피탈리티 / CRS 적용 포인트

온다(B2B 호스피탈리티/CRS) 맥락에서 이 아이디어가 가장 직접적으로 맞아떨어지는 지점은 **대화형 예약/응대 에이전트의 상태 관리**다. 예: "고객이 8/30에 트윈룸을 원했다가 8/31 상담에서 킹룸으로 바꿨다"는 대화 흐름에서, 벡터 검색 기반 메모리는 두 발화 모두를 "관련 있음"으로 끌어올 수 있어 에이전트가 낡은 선호를 참조할 위험이 있다. Lemmalog식 사실/철회 모델이라면 "룸타입=트윈"이라는 사실이 새 관찰로 명시적으로 override·retract되고, 그 사실에 의존한 하위 결론(예: 침대 배치 안내, 인원수 매칭)까지 자동으로 재계산된다 — 이는 CRS의 **예약 변경 이력·최신 확정본 구분** 문제와 구조적으로 동일하다.

다만 **정직하게 밝히면, 여기서 더 나아가 CRS 인벤토리·요금 로직 자체에 Datalog 엔진을 도입하자는 결론은 억지다.** 온다의 CRS는 이미 관계형 DB + 명시적 트랜잭션으로 "지금 무엇이 참인가"(가용 재고, 확정 요금)를 강하게 관리하고 있어 별도 추론 엔진이 필요 없다. 전이 가능한 것은 엔진 자체가 아니라 **원칙** — "대화형 인터페이스가 참조하는 상태는 최신 사실만 남기고 과거 발화를 원시 그대로 재검색하게 두지 말라"는 설계 지침 정도이며, 이는 향후 온다가 자연어 기반 CRS 어시스턴트를 만들 때 참고할 체크리스트 수준이다.

## 연관 자료

- [[2026-07-03-session-transcripts-not-useful-for-agents]] — "세션 기록 검색은 토큰 낭비"라는 동일 진단, 반대 처방(사실 증류 vs 로그 폐기)의 짝
- [[2026-08-28-line-llm-wiki-code-driven-ssot]] — 원본이 바뀌면 파생 지식이 낡는 문제를 다루는 SSOT 설계의 거울상(사람 리뷰 게이트 vs 완전 자동 철회)
- [[2026-05-04-long-running-agents]] — Brain/Hands/Session 3분리에서 "Brain"이 실제로 무엇이어야 하는지에 대한 구체적 구현 후보

## 한 달 뒤 회고

2026-09-30 즈음, (1) `news.hada.io`·`pwning.systems` egress 차단이 풀렸다면 원문을 직접 읽고 이 노트의 인용·수치를 1차 소스로 재검증할 것. (2) Lemmalog 저장소에 제3자 벤치마크 재현이나 이슈/PR을 통한 외부 검증이 쌓였는지 확인. (3) 온다 내부에서 대화형 CRS 어시스턴트 관련 논의가 진행됐다면, "사실 vs 원시 로그" 구분 원칙이 실제로 참고됐는지 점검.
