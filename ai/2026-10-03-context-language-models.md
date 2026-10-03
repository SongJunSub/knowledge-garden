---
title: "Context Language Models - 자신의 컨텍스트를 직접 편집하는 AI (Rulin Shao 등, UW·Meta Superintelligence Labs·MIT) — 요약은 손실이 구조적이고, 편집은 모델이 스스로 결정한다"
source_title: "Context Language Models"
source_url: "https://arxiv.org/abs/2609.37725"
source_name: "arXiv (Rulin Shao et al., University of Washington / Meta Superintelligence Labs / MIT / Trillium Labs)"
referrer_url: "https://news.hada.io/topic?id=34653"
published_at: "2026-09-29"
summarized_at: "2026-10-03"
category: "ai"
tags: ["context-engineering", "agent-memory", "clm", "browsecomp-plus", "reinforcement-learning", "context-management", "long-horizon-agents"]
---

# Context Language Models - 자신의 컨텍스트를 직접 편집하는 AI

> 출처: [Context Language Models](https://arxiv.org/abs/2609.37725) (Rulin Shao, Shannon Zejiang Shen, Junjie Oscar Yin 등, UW·Meta Superintelligence Labs·MIT·Trillium Labs) · GeekNews(id=34653) 경유 · 정리일 2026-10-03

> **출처 한계**: `news.hada.io`와 `arxiv.org`는 이 세션에서 egress 차단으로 직접 열지 못했다. 대신 **논문 공식 구현 저장소(`github.com/facebookresearch/context-language-models`)의 README를 `raw.githubusercontent.com`을 통해 전문 확보**했다 — 저자 전원·소속·핵심 수치·bibtex까지 담긴 저자 자신의 1차 소스라 신뢰도가 높다. 다만 논문 본문의 실험 설계·ICL skill-optimization loop의 구체 메커니즘·한계(Limitations) 절은 README에 없어 확인하지 못했고, hada 댓글 수·HN/Lobsters 큐레이션 여부도 WebSearch로 별도 Show HN/Discussion 스레드를 찾지 못해 확인 불가하다.

## 한 줄 요약

**Context Language Model(CLM)은 에이전트의 컨텍스트를 "주기적으로 통째로 요약해야 하는 append-only 기록"이 아니라 "모델이 직접 자유롭게 편집할 수 있는 파일"로 다루자는 제안이다. 추가 학습 없이 기존 모델에 이 방식만 적용해도(zero-shot) 심층 조사 벤치마크 BrowseComp-Plus에서 기존 요약 기반 최선의 전략보다 정확도 11.4%p 높고 연산량(FLOPs) 21.5% 적었고, 자연어 지시 진화와 강화학습을 더하면 격차가 더 커진다.**

## 핵심 포인트

- **문제의식 — 압축의 결정권이 모델이 아니라 하네스에 있었다** — 기존 에이전트 하네스는 대화 기록·도구 실행 결과를 계속 이어붙이다가 정해진 시점(컨텍스트 윈도 한계 등)에 전체를 한 번에 요약한다. 이 요약은 손실이 구조적이고, 무엇을 남길지 판단하는 주체가 모델 자신이 아니라 외부 로직이다.
- **CLM의 메커니즘 — 컨텍스트 = 파일, 모델이 직접 edit** — "**컨텍스트를 파일로 취급하고, 모델이 그 파일에 제약 없는 업데이트를 하도록 허용**"하는 것이 핵심이다. 모델은 토큰을 이어붙이는 것 외에도 셸 명령 등으로 컨텍스트 파일을 자유롭게 고칠 수 있고, 수정 내용은 다음 턴의 live 컨텍스트에 바로 반영된다. 중요한 건 남기고, 불필요한 건 지우거나 압축하며, 작업 상태를 부분적으로만 갱신할 수 있다 — "요약"이 아니라 "편집"이라는 단어 선택이 핵심.
- **Zero-shot 결과 — 추가 학습 없이 바로 이긴다** — 기존 모델에 CLM 방식만 적용했을 때, SOTA 컨텍스트 관리 전략 대비 ***BrowseComp-Plus에서 정확도 11.4%p 높고 FLOPs 21.5% 적었다.*** 12시간짜리 EdgeBench에서는 정확도 5%p 높고 FLOPs 59% 적었으며, 24시간짜리 멀티 리포지토리 에이전트 스웜 과제(Software World)에서는 같은 연산량으로 65% 더 큰 개선을 보였다.
- **자연어 지시로 "학습"시킨다 (In-context learning)** — 스킬 최적화 루프(skill-optimization loop)로 진화시킨 자연어 지시로 CLM의 컨텍스트 관리 방식을 조종할 수 있음을 보였다 — held-out 컨텍스트 관리 과제에서 ***정확도를 최대 35.9점 개선하면서 연산량은 오히려 줄였다.***
- **강화학습 — Qwen3.5-9B에 온라인 RL 적용** — CLM을 위한 온라인 강화학습 기법을 새로 제시했고, Qwen3.5-9B의 BrowseComp-Plus 성능을 ***47.6% 개선하면서 FLOPs는 12% 줄였다.***
- **멀티 에이전트로 자연 확장** — 여러 에이전트의 컨텍스트가 각자 "파일"로 공존할 수 있으므로, 단일 에이전트의 컨텍스트 관리뿐 아니라 멀티 에이전트 조율로도 자연스럽게 확장되는 설계라고 밝힌다.
- **Day-1 하네스 지원 — 연구가 바로 실전 도구에 꽂힌다** — `pi install npm:@lolipopshock/pi-clm` 한 줄로 [[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]]에서 다룬 Pi 코딩 에이전트 하네스에 CLM을 바로 설치할 수 있다. 논문 공개와 거의 동시에 프로덕션 하네스용 패키지가 나온, 연구-실전 피드백 루프가 매우 빠른 사례.

## 인상 깊은 문장

> "We introduce Context Language Models (CLMs), language models that natively manage their own context. We implement this by treating the context as a file and allowing the model to make unrestricted updates to this file."
> (공식 저장소 README, 원문 그대로)

> "Zero-shot. Building CLMs zero-shot with existing models outperforms SOTA context-management strategies across a variety of tasks: 11.4% higher accuracy with 21.5% fewer FLOPs on BrowseComp-Plus..."
> (공식 저장소 README, 원문 그대로)

## 댓글

**hada 댓글 수는 egress 차단으로 확인하지 못했다.** HN이나 Lobsters에 이 논문을 다룬 별도 Show HN/Discussion 스레드가 있는지 WebSearch로 찾아봤지만 특정하지 못했다 — 아직 커뮤니티 논의가 많이 쌓이지 않았거나, 이 세션에서 검색에 걸리지 않은 것으로 보인다. **정직하게 감안할 점**: (1) 저자 소속에 Meta Superintelligence Labs가 포함돼 있어, "요약 대신 편집"이라는 결론이 Meta가 밀고 있는 특정 에이전트 아키텍처 방향과 맞물려 있을 가능성이 있다. (2) 벤치마크(BrowseComp-Plus, EdgeBench, Software World) 전부 저자들이 직접 선택하거나 관여한 평가 환경이라, 제3자 재현 결과는 아직 없다. (3) README의 수치는 논문 저자 자신이 공개한 것이라 신뢰도는 높지만, "통제군(기존 요약 전략)을 얼마나 공정하게 튜닝했는지"는 논문 본문을 직접 읽지 못해 판단할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — Memoryfield와 같은 철학, 다른 시간축

[[2026-09-02-memoryfields-agent-memory-file-format]]은 "에이전트의 장기 메모리를 파이프라인이 아니라 사람이 읽을 수 있는 파일 포맷으로 다루자"는 제안이었다. CLM은 거의 같은 문장으로 요약되는 설계("컨텍스트를 파일로 취급")를 쓰지만, 겨냥하는 대상이 다르다 — Memoryfield는 **세션을 넘나드는 영구 메모리**(아카이브)를, CLM은 **단일 작업 안에서 매 턴 바뀌는 활성 작업 컨텍스트** 자체를 파일로 다룬다. 두 노트를 나란히 보면 "에이전트의 상태 전체를 파일시스템으로 환원하자"는 더 큰 흐름의 두 국면(영구 vs 작업중)이 보인다.

### 핵심 전이 2 — "규칙을 비워라"의 다음 단계는 "비우는 행위 자체를 모델에게 맡겨라"

[[2026-07-25-context-engineering-rules-claude-5]]는 시스템 프롬프트를 80% 줄여도 성능이 유지됐다는 관찰에서, 하네스 설계자가 규칙을 최소화하고 모델의 판단에 맡기라고 했다. 이건 여전히 **외부(하네스 설계자)가 무엇을 줄지 미리 결정**하는 구조다. CLM은 그 판단·편집 행위 자체를 실행 시점에 모델에게 완전히 넘긴다 — "무엇을 프롬프트에 넣을지 줄여라"에서 "컨텍스트를 누가 능동적으로 관리하는가"로 한 단계 더 나간 것으로 읽을 수 있다.

### 핵심 전이 3 — Context와 Memory의 경계가 생각보다 흐리다는 반증

[[2026-09-30-naver-d2-agent-concepts-workflow-harness-context-memory-mcp-a2a]]는 Context(즉시 작업 정보)와 Memory(세션을 넘나드는 축적 지식)를 개념적으로 구분하려 했지만 원문 확보 실패로 구체화하지 못했다. CLM은 "Context" 쪽을 다루는 논문이면서도, 모델이 컨텍스트 파일을 압축·보존하는 순간 그 파일이 사실상 작업 범위를 넘어서는 Memory 역할도 겸하게 된다 — 두 개념이 메커니즘 수준에서는 "파일 하나, 편집 권한 하나"로 수렴할 수 있다는 걸 보여주는 사례다.

## 호스피탈리티 / CRS 적용 포인트

**CLM 자체(bash로 컨텍스트 파일을 직접 편집하게 하는 하네스 구조)를 지금 당장 CRS 운영 에이전트에 넣을 상황은 아니다** — 아직 연구 단계고, 하네스 구조 자체를 바꿔야 적용 가능해 "직접 적용은 멀다"고 밝힌다. 다만 전이 가능한 원칙은 남는다 — 온다의 예약 변경·멀티채널 동기화처럼 **여러 단계를 거치는 장시간 실행 에이전트**를 설계할 때, "일정 턴마다 전체를 요약"하는 방식이 구조적으로 정보를 잃는다는 이 논문의 전제는 참고할 만하다. 압축의 결정권을 가능한 한 모델(또는 적어도 작업의 맥락을 가장 잘 아는 주체)에게 가깝게 두는 설계 방향이, 향후 CRS가 장기 실행 에이전트의 컨텍스트 관리 전략을 고를 때 검토 기준이 될 수 있다.

## 연관 자료

- [[2026-09-02-memoryfields-agent-memory-file-format]] — 같은 "파일로 다루기" 철학을 영구 메모리(Memoryfield)와 활성 작업 컨텍스트(CLM)라는 다른 시간축에 적용한 사례
- [[2026-07-25-context-engineering-rules-claude-5]] — 하네스가 규칙을 비워 모델 판단에 맡기는 1단계 규율, CLM은 그 판단(편집) 행위 자체를 모델에 넘기는 다음 단계
- [[2026-09-30-naver-d2-agent-concepts-workflow-harness-context-memory-mcp-a2a]] — Context/Memory를 개념적으로 나누려던 선행 시도, CLM은 그 경계가 메커니즘 수준에서 흐려질 수 있음을 보여주는 사례
- [[2026-10-02-pi-1-0-release-minimal-terminal-coding-agent]] — CLM의 day-1 지원 대상인 Pi 하네스, 바로 전날 이 가든이 정리한 노트

## 한 달 뒤 회고

*(2026-11-03 즈음 — (1) `arxiv.org`·`news.hada.io` 접근이 풀리면 논문 본문(특히 ICL skill-optimization loop 메커니즘, RL 설계, Limitations 절)을 직접 대조할 것. (2) Pi용 `pi-clm` 패키지가 실제로 쓰인 사례나 사용자 피드백이 나왔는지 확인. (3) CRS 쪽 장기 실행 에이전트 설계 논의에 "압축 결정권을 어디에 둘 것인가"라는 이 논문의 질문을 실제로 꺼내봤는지 점검.)*
