---
title: "Apache Maka (Incubating) — 컨텍스트를 압축해도 원본 실행 기록은 절대 지우지 않는 로컬 우선 에이전트 워크스페이스"
source_title: "Apache Maka (Incubating)"
source_url: "https://github.com/apache/maka"
source_name: "GitHub apache/maka (Apache Incubator) 저장소 · GeekNews(id=33336) 경유"
referrer_url: "https://news.hada.io/topic?id=33336"
published_at: "2026-09 (정확한 게시일 미확인 — Apache Incubator 프로젝트로 진행 중, GeekNews 게시 시점 기준)"
summarized_at: "2026-09-08"
category: "ai"
tags: ["ai-agent", "local-first", "apache-incubator", "agent-runtime", "observability", "session-recovery"]
---

# Apache Maka (Incubating)

> 출처: [Apache Maka (Incubating)](https://github.com/apache/maka) (GitHub, Apache Incubator 프로젝트) · GeekNews(id=33336) 경유 · 정리일 2026-09-08

> **출처 한계**: hada.io 토픽 페이지는 이번 세션 egress 차단으로 열람하지 못했다(hada 댓글 수·논조 미확인). 다만 원문에 해당하는 GitHub 저장소(`apache/maka`)의 README와 ARCHITECTURE.md는 직접 열람했다 — 이번 배치 4건 중 가장 1차 소스에 가깝게 확인한 항목이다. 다만 아직 인큐베이팅 단계 프로젝트라 문서 자체가 "데이터 형식·CLI 명령·실험적 기능이 계속 바뀔 수 있다"고 명시하고 있어, 이 노트의 세부 사항도 향후 변경될 수 있다.

## 한 줄 요약

**Apache Maka는 원하는 AI 모델(클라우드 API·로컬 모델·호환 게이트웨이)을 연결해 데스크톱·터미널에서 에이전트에게 작업을 맡기는 로컬 우선 워크스페이스로, 모델 메시지·도구 호출·권한 결정·종료 사실 전부를 append-only "Runtime Event Log"에 기록해두고, 다음 요청을 위해 컨텍스트를 압축·정리(pruning)하더라도 이 원본 기록 자체는 절대 지우지 않는다는 원칙("Context pruning and compaction change provider input projections, not history")을 핵심으로 삼는다.**

## 핵심 포인트

- **단일 Runtime Host가 모든 진입점을 통제** — Desktop(Electron+React), TUI, CLI, 평가 프레임워크가 모두 독립적인 런타임을 갖지 않고, 하나의 Runtime Host → SessionManager → AgentRun 계층에 요청을 위임한다. 화면·다음 프롬프트 구성은 이 로그의 "투영(projection)"일 뿐, 로그 자체가 유일한 근거(canonical source)다.
- **모델 메시지·도구 호출·권한 승인·종료를 전부 순서대로 기록** — 대화뿐 아니라 도구 호출과 결과, 권한 승인 여부, 종료 상태까지 append-only RuntimeEvent로 남기며, 이 기록을 화면 표시·다음 요청 구성·비정상 종료 후 복구에 활용한다고 밝힌다(ARCHITECTURE.md).
- **"컨텍스트를 줄여도 이력은 지우지 않는다"는 원칙** — 모델에 보내는 컨텍스트를 pruning/compaction으로 줄이는 것은 ***프로바이더에게 보내는 입력의 투영만 바꿀 뿐, 원본 실행 이력(history)에는 영향을 주지 않는다***. 오래된 도구 출력을 다음 요청에서 빼더라도 실행 이력에서는 삭제하지 않는다는 Slack 발췌 내용과 정확히 일치한다.
- **측정 기반 운영과 투명한 벤치마크 공개** — 동일한 모델과 공식 검증자로 벤치마킹하고 작업별 결과를 함께 공개하는 것을 프로젝트 목표로 명시한다 — "완전한 작업 기록 유지"가 단순 로깅이 아니라 성능 측정·검증의 기반으로 설계된 것으로 읽힌다.
- **로컬 우선 저장과 Apache 라이선스** — 세션·설정·실행 기록은 Electron userData 하위(`<userData>/workspaces/default/`)에 로컬 저장되며, API 키 같은 민감 정보는 OS 계정만 읽을 수 있는 로컬 평문 파일로 보관된다. Apache License 2.0이며 아직 Apache Incubator PMC 후원 하의 인큐베이팅 단계(ASF 완전 승인 전)다.

## 인상 깊은 문장

> "Context pruning and compaction change provider input projections, not history." (`apache/maka` ARCHITECTURE.md, 직접 열람)

> "Runtime Event Log is the canonical source for model messages, tool calls, tool results, and termination facts." (동일 문서, 직접 열람)

## 댓글

hada 댓글 수·논조는 이번 세션에서 확인하지 못했다(hada.io 접근 차단). 다만 별도로 `Maka-Agent/maka-agent`라는 GitHub 조직 저장소도 존재하는 것으로 검색됐다 — Apache Incubator 편입 이전/이후의 저장소 이원화로 추정되며, 이번 노트는 공식 인큐베이터 저장소(`apache/maka`)를 기준으로 작성했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "압축해도 원본은 지우지 않는다"는 원칙이 Memoryfield와 동일한 축에서 만난다

[[2026-09-02-memoryfields-agent-memory-file-format]]은 에이전트 장기 메모리의 ***검색용 색인은 캐시로 취급해 언제든 지우고 다시 만들 수 있게 하되, 본문(Markdown 문서)은 보존***하자는 제안이었다. Apache Maka의 "컨텍스트 pruning/compaction은 프로바이더 입력의 투영만 바꾸고 history는 안 바꾼다"는 원칙은 ***정확히 같은 아키텍처 패턴을 다른 층위에 적용한 것***이다 — Memoryfield가 "장기 메모리 파일 vs 재생성 가능한 검색 색인"을 분리했다면, Maka는 "실행 이력 로그 vs 매 요청마다 재구성되는 컨텍스트 투영"을 분리한다. 두 사례를 겹쳐보면, ***"원본은 append-only로 불변 보존하고, 소비 시점에 필요한 형태로만 파생 뷰를 재구성한다"***는 것이 에이전트 시스템 설계에서 반복적으로 재발견되는 원칙임을 알 수 있다.

### 핵심 전이 2 — 실행 루프를 통째로 대신 돌려주는 TrueForge와는 "관측 vs 실행"으로 역할이 나뉜다

[[2026-09-02-trueforge-open-source-agent-harness]]는 모델 호출·MCP 도구·샌드박스·승인·컨텍스트 관리까지 ***에이전트 실행 루프 자체***를 대신 돌려주는 런타임이었다. Apache Maka는 그 실행 루프를 자체 구현하기보다는, 원하는 모델을 "가져와 붙이고"(bring-your-own-model) 그 실행 과정을 ***기록·재생·감사하는 관측 계층***에 무게를 둔다는 점에서 초점이 다르다. 두 프로젝트를 나란히 보면 에이전트 인프라 생태계가 "실행을 대신 해주는 하네스"와 "실행을 기록·검증하는 워크스페이스"로 역할이 분화되는 흐름을 짐작해볼 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**원칙 차원에서 직접 적용 가치가 있다.** CRS/PMS에 AI 에이전트(예약 처리, 요금 조정, 채널 연동 트러블슈팅 자동화)를 도입한다면, Maka의 두 원칙이 그대로 요구사항이 된다 — ① ***에이전트가 어떤 도구를 호출했고 어떤 권한을 승인받았는지 append-only로 감사 가능하게 남길 것*** (CRS는 규제·감사 요구가 강한 도메인이라 이게 오히려 필수 조건에 가깝다), ② ***모델에 보내는 컨텍스트를 요약·축소하더라도, "무엇을 근거로 그 결정을 내렸는지"의 원본은 별도로 보존해 사후 검증 가능하게 할 것*** — 가격 결정이나 재고 배분처럼 되돌리기 어려운 액션을 에이전트가 수행했다면, 압축된 요약만으로는 "왜 그렇게 판단했는지"를 재구성하지 못해 감사·이의제기 대응이 막힐 수 있다.

## 연관 자료

- [[2026-09-02-memoryfields-agent-memory-file-format]] — "원본 보존 vs 재생성 가능한 파생 뷰(검색 색인/컨텍스트 투영)" 분리 원칙을 다른 층위에서 공유하는 같은 계열
- [[2026-09-02-trueforge-open-source-agent-harness]] — 같은 "에이전트 인프라" 카테고리이되 "실행 대행" vs "실행 기록·관측"으로 역할이 나뉘는 대비 사례

## 한 달 뒤 회고

*(2026-10-08 즈음 — Apache Incubator 승인 진행 상황, Linux 빌드 지원 여부, 실제 사용 후기·hada 댓글 반응이 나왔는지 점검. 이 세션에서 egress 차단으로 hada.io를 못 본 점도 재확인.)*
