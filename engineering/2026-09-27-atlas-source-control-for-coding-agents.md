---
title: "Atlas — 코딩 에이전트를 위한 소스 관리 도구, 커밋에 '왜'를 영구히 붙인다"
source_title: "Atlas — Source Control for Coding Agents"
source_url: "https://www.tryatlas.cc/"
source_name: "tryatlas.cc"
referrer_url: "https://news.hada.io/topic?id=34344"
summarized_at: "2026-09-27"
category: "engineering"
tags: ["multi-agent-orchestration", "git", "coding-agents", "session-context", "checkpoint", "claude-code"]
---

# Atlas — 코딩 에이전트를 위한 소스 관리 도구, 커밋에 "왜"를 영구히 붙인다

> 출처: [Atlas — Source Control for Coding Agents](https://www.tryatlas.cc/) (tryatlas.cc) · GeekNews(id=34344) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `news.hada.io`와 원문 사이트 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. GitHub README 미러(포크본, pacifio·ik0zy 등 개인 계정)와 CoddyKit 블로그, WebSearch 스니펫으로 교차확인했다. 진짜 소유 GitHub 조직 계정은 특정하지 못했고 — 같은 이름의 `github.com/AtlasDevHQ/atlas`는 완전히 다른 제품(회사 팩트 데이터베이스)이니 혼동 주의. 라이선스도 소스별로 Apache 2.0과 MIT로 엇갈려 보고돼 확정하지 못했다. HN Show HN 스레드도 "Atlas"라는 이름이 여러 무관한 프로젝트와 겹쳐 정확히 특정하지 못했다.

## 한 줄 요약

**코드 변경뿐 아니라 에이전트가 받은 요청·도구 사용·작업 맥락까지 Git 커밋에 영구히 연결해 기록하는 데스크톱 개발 도구다 — Claude Code·Codex·자체 에이전트를 한 화면에서 병렬 실행하고 서로 맥락을 공유하며, "체크포인트"에 직접 채팅으로 질의해 그때 무슨 일이 있었는지 되짚을 수 있다.**

## 핵심 포인트

- **체크포인트 — 커밋이 말해주지 않는 것을 담는다** — 커밋을 만든 세션(프롬프트, 도구 호출, 시도했다 버린 접근까지)을 커밋에 링크한다. 리베이스·amend에도 링크가 유지되며, `.gitignore`된 `.atlas/`에 SQLite로 저장된다.
- **멀티 에이전트 병렬 실행** — Claude Code·Codex는 ACP(Agent Client Protocol) 위에서 외부 서브프로세스로, Atlas 자체 에이전트(Codex 엔진 하드포크 기반)는 인프로세스로, Cursor·OpenCode 등 ACP 레지스트리의 다른 에이전트도 스폰 가능하다 — 전부 같은 창, 같은 코드베이스에서 나란히.
- **에이전트 간 공유 메모리** — Claude Code가 내린 결정이 Codex의 다음 프롬프트에 그대로 반영돼, 에이전트를 바꿔도 처음부터 재설명할 필요를 줄인다.
- **체크포인트에 직접 채팅으로 질의** — 원문 스크롤백을 뒤지는 대신 체크포인트를 선택해 "그때 실제로 무슨 일이 있었는지"를 세션 기록 기반으로 답한다.
- **로컬 우선 + 시크릿 스크러빙, 개방형 파일 포맷** — 모든 세션 기록은 로컬 `.atlas/sessions.db`에 저장하되 디스크에 쓰기 전 시크릿을 제거한다. 노트는 마크다운, 세션은 JSONL 등 파일 기반 개방형 포맷이라 Atlas를 꺼도 이어서 작업 가능하다는 벤더 락인 최소화 철학이다.

## 인상 깊은 문장

> "Agents now write a large share of the code and keep none of the reasoning behind it. The prompt that produced a change, the tool calls it made, the approach it tried first and abandoned — all of it lives in a scrollback buffer until the buffer scrolls."

## 댓글

**정확한 수치 미확정.** GeekNews hada 댓글 수는 원천 차단으로 확인 못 했다(자동수집 미러 기준으로는 "댓글 없음"으로 표시되나 실제와 다를 수 있다). HN Show HN 스레드가 존재하는지 자체가 불확실하다 — "Atlas"라는 이름이 물 과학 아틀라스, 로봇 Atlas 등 여러 무관한 프로젝트와 겹쳐 정확한 스레드를 찾지 못했다. GitHub 스타 수도 출처마다 "3,000+", "7.8k", "하루 888 스타" 등 제각각이라 정확한 스냅샷 시점을 특정하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — 멀티 에이전트 오케스트레이터 니치의 다섯 번째 도구, 그러나 축이 다르다

이 저장소는 이미 같은 니치를 다루는 4개 노트를 추적해왔다 — [[2026-08-08-orca-parallel-coding-agents-ade]](병렬 worktree·비교병합), [[2026-08-08-paseo-coding-agent-orchestrator]](크로스플랫폼·프라이버시), [[2026-09-10-proliferate-parallel-coding-agents-ide]](YC 벤처자금·실제 CLI 스폰), [[2026-09-26-ordewell-multi-agent-orchestrator]](의존성그래프 계획·마커 검증). 앞의 넷이 전부 "병렬 실행/오케스트레이션 자체"에 초점을 맞춘 반면, Atlas는 ***"Git 커밋을 1급 시민으로 삼는 소스 관리 각도"***에서 접근한다 — 병렬 실행은 부수 기능이고 핵심은 커밋과 그 커밋을 만든 세션(프롬프트·도구호출·근거)을 영구히 연결해 나중에 질의 가능하게 만드는 것이다. 앞선 4개 중 어느 것도 이 "커밋-세션 체크포인트" 개념을 1급 기능으로 내세우지 않았다는 점에서, 다섯 번째 도구지만 축이 다르다(오케스트레이션 vs 소스관리·감사가능성).

## 호스피탈리티 / CRS 적용 포인트

온다 개발팀이 이미 Claude Code를 실무에 쓰고 있다는 전제에서, Atlas의 "커밋-세션 링크" 아이디어는 실제로 겪을 법한 문제와 직결된다. **PR 리뷰어를 위한 맥락 복원** — 지금은 Claude Code 세션 로그가 터미널 스크롤백이나 세션 파일에만 남아, 다른 팀원이 PR을 리뷰할 때 "왜 이렇게 짰는지" 재구성이 어렵다. 커밋 메시지 본문에 핵심 설계 결정을 한 줄 남기는 관행만으로도 Atlas 없이 상당 부분 이득을 흉내낼 수 있다. **에이전트 교대 작업** — 온다에서 한 기능을 Claude Code로 시작했다가 다른 세션·다른 사람이 이어받을 때, 이전 세션에서 뭘 시도했다가 버렸는지 모르는 문제가 실제로 발생할 수 있다 — Atlas의 공유 메모리 개념은 이 손실을 줄이는 방향이다. 다만 라이선스가 불명확하고 실사용 검증(HN/GeekNews 댓글)도 확보하지 못한 지금 시점에는, 도구 자체 도입보다 "커밋에 에이전트 작업 맥락을 남기는 습관을 팀 차원에서 먼저 시도"하는 게 더 안전한 저비용 실험이다.

## 연관 자료

- [[2026-08-08-orca-parallel-coding-agents-ade]] — 병렬 worktree·비교병합 중심 오케스트레이터
- [[2026-08-08-paseo-coding-agent-orchestrator]] — 크로스플랫폼·프라이버시 중심
- [[2026-09-10-proliferate-parallel-coding-agents-ide]] — YC 벤처자금, 실제 CLI 바이너리 spawn
- [[2026-09-26-ordewell-multi-agent-orchestrator]] — 의존성그래프 계획·마커 검증, 같은 니치 최신작
- [[2026-09-27-plan-mode-is-dead]] — 계획 문서 대신 반복 루프가 낫다는 같은 배치의 논지, Atlas의 체크포인트 질의 방식과 대비

## 한 달 뒤 회고

*(2026-10-27 즈음 — 라이선스가 Apache 2.0/MIT 중 무엇으로 확정됐는지, 실사용 후기·HN 논의가 쌓였는지, 온다에서 "커밋에 설계 결정 한 줄 남기기" 습관을 실제로 시도해봤는지 점검.)*
