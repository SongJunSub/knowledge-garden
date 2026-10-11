---
title: "REA — Reverse Engineer Anything (morluto) — 코딩 에이전트가 MCP로 디컴파일러를 직접 쥐고, 네이티브 바이너리부터 Electron 앱까지 자연어로 '이게 뭘 하는 코드인가'를 되묻게 만드는 도구"
source_title: "REA: Reverse Engineer Anything"
source_url: "https://github.com/morluto/rea"
source_name: "GitHub (morluto/rea)"
referrer_url: "https://news.hada.io/topic?id=35105"
published_at: "2026-10-08"
summarized_at: "2026-10-11"
category: "engineering"
tags: ["reverse-engineering", "mcp", "coding-agent", "binary-analysis", "decompilation", "github-trending"]
---

# REA — Reverse Engineer Anything (morluto)

> 출처: [REA (GitHub)](https://github.com/morluto/rea) (morluto) · GeekNews(id=35105) 경유 · 정리일 2026-10-11

> **출처 한계**: `news.hada.io`는 이번 세션에서 egress 차단으로 직접 열람하지 못해 hada 요약·댓글 수·댓글 논조를 확인할 수 없었다. REA를 소개한 매체 기사(runtimewire.com)도 같은 이유로 차단돼 직접 읽지 못했다. 대신 GitHub 저장소 README는 WebFetch로 직접 확보해 1차 소스로 확인했다. **스타 수가 출처 간 크게 어긋난다** — 이번 세션 GitHub 직접 조회로는 약 85.6k(README 자체도 "8만 스타 감사" 문구를 포함), 반면 WebSearch로 교차확인한 skills.sh 미러는 약 14.9k를 보고한다. 어느 쪽이 정확한 현재 수치인지 확정하지 못했다. 또한 과제 설명에 언급된 "크롬 공룡 게임, Windows Calculator 사례"는 README의 실제 쇼케이스 3건(DX-Ball, Notion, 동인 슈팅게임 TH04)과 일치하지 않는다 — README에 그 두 사례는 등장하지 않으므로, 이 노트는 내가 직접 확인한 쇼케이스만 싣고 그 두 예시는 교차확인 실패로 남긴다. HN/Lobsters 등 외부 큐레이션 유무도 확인하지 못했다.

## 한 줄 요약

**REA는 코딩 에이전트가 MCP를 통해 Hopper/Ghidra/IDA 같은 디컴파일러를 직접 호출해, 네이티브 바이너리부터 JavaScript/Electron 앱까지 로컬에서 역공학하게 해주는 오픈소스 도구다 — 사람이 어셈블리를 읽는 대신, 에이전트가 "이 함수는 뭘 하는가"를 자연어로 묻고 의사코드·호출 관계·근거(evidence)를 되돌려받아 기능을 설명하거나 재구현·테스트까지 이어간다.**

## 핵심 포인트

- **MCP 서버 + CLI 이중 인터페이스** — `npx rea-agents setup`으로 에이전트(Claude Code, Cursor, Codex 등)에 등록하고 워크플로 지침을 설치하거나, `npm install --global rea-agents` 후 `rea` 명령을 전역으로 설치해 쓸 수 있다. ***분석은 전부 로컬에서 실행***되며, README는 모든 결과에 "근거(evidence)와 한계"가 함께 돌아온다고 명시한다.
- **네이티브 바이너리 — 디컴파일에 의사코드·어셈블리·호출관계까지** — 스트립된 바이너리에서도 ***의사코드, 어셈블리, 문자열, 심볼, 호출·참조 관계***를 반환한다. 이 기능은 REA 자체 구현이 아니라 Hopper·Ghidra·IDA 중 하나를 백엔드로 요구한다 — REA는 이 디컴파일러들과 에이전트 사이의 ***대화형 레이어***다.
- **JavaScript/Electron 전용 분석** — `npx -y rea-agents@latest analyze-javascript-application <경로> --json`로 추출된 JS/Electron 앱의 모듈·import·라우트·IPC 관계를 분석한다. README는 패키지 앱·웹사이트·API·펌웨어·버전 diff까지 확장 로드맵을 밝힌다.
- **쇼케이스 3건(1차 확인)** — ① **DX-Ball**: 사운드 팬(pan) 계산 로직을 역추적해 재구성. ② **Notion**: Electron 클립보드 브리지 동작을 추적. ③ **TH04**(동인 슈팅게임): 탄막 각도 계산 복원. 세 사례 모두 "소스 없이 동작만 보고 재현 가능한 수준까지 설명을 끌어낸다"는 공통점이 있다.
- **스스로 선을 긋는 한계** — README는 ***"원본 소스 코드를 복원한다거나 앱을 자동으로 완전히 클론한다고 주장하지 않는다"***고 명시한다. 출력은 의사코드와 근거이지, 충실한 소스 트리 재현이 아니다. MIT 라이선스.

## 인상 깊은 문장

> "REA does not claim to recover original source code or automatically clone an application." (README, 스스로 밝힌 한계)

## 댓글

**hada 댓글 수는 확인하지 못했다**(`news.hada.io` 이번 세션 egress 차단). HN·Lobsters 등 외부 커뮤니티 큐레이션 여부도 WebSearch로 찾지 못했다 — GitHub 트렌딩에 오른 시점(2026-10-08~09 추정, 복수 매체 보도)과 스타 수 급증(85.6k 또는 14.9k, 출처 불일치) 자체는 화제성의 간접 증거이지만, 사람들이 실제로 어떤 지점에서 비판·칭찬했는지는 이번 세션에서 확인할 방법이 없었다. 리버스 엔지니어링 도구 특성상 "저작권·라이선스 위반에 악용될 수 있다"는 류의 우려가 따라올 법한 주제인데, 그런 논쟁이 실제로 있었는지도 미확인이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 리버스 엔지니어링의 두 축에 "대화형 디컴파일"이라는 세 번째 축이 더해진다

[[2026-09-05-imhex-file-format-reverse-engineering]]과 [[2026-09-09-fnprint-binary-function-identification]]을 나란히 읽으면 리버스 엔지니어링의 두 접근이 보인다 — 대상이 뭘 하는지 모를 때는 그걸 만든 코드를 찾아 읽고(ImHex류, "무엇을 하는가"), 이름만 모를 때는 동작을 이미 아는 것과 대조한다(fnprint류, "무엇과 같은가"). REA는 이 둘과 다른 세 번째 축을 만든다 — ***사람이 코드를 읽거나 바이트를 대조하는 게 아니라, 에이전트가 디컴파일러를 도구로 쥐고 자연어 질문-답변 루프로 "이게 뭘 하는가"를 반복해서 좁혀간다.*** fnprint가 "동작 기반 지문 대조"라는 자동화된 유사도 계산이라면, REA는 그 반대 극단 — 자동 매칭이 아니라 에이전트의 탐색적 대화 자체가 분석 과정이다. 세 도구를 겹치면 "정적 대조(fnprint) → 대화형 탐색(REA) → 사람의 코드 읽기(ImHex)"라는 자동화 정도의 스펙트럼이 그려진다.

### 핵심 전이 2 — 디컴파일러+AI 조합이 "역공학 도구"에서 "운영 복구 도구"로 이미 넘어간 사례와 만난다

[[2026-09-30-oliveyoung-decompiler-ai-config-drift]]는 운영 서버에 배포된 Java 클래스 파일과 형상관리 소스가 어긋난 상태를, 디컴파일러와 AI로 클래스 파일을 소스로 복원해 검증한 실무 사례였다 — 그 노트는 원문 접근이 막혀 구체 도구명조차 확인 못했지만, "디컴파일러 + AI"라는 조합 자체는 REA가 하는 일과 정확히 같은 성격이다. 다른 점은 ***목적***이다. 올리브영 사례는 "내가 이미 아는 내 코드가 실제로 뭘로 바뀌었는지"를 복구하는 ***수세적*** 용도였고, REA는 "내가 전혀 모르는 남의 바이너리가 뭘 하는지"를 탐색하는 ***공세적*** 용도다. 같은 기술 조합(디컴파일러+LLM)이 "내 코드의 드리프트를 되돌리는 도구"와 "남의 코드를 처음부터 이해하는 도구" 양쪽에서 동시에 자라나고 있다는 건, 이 조합이 특정 용도의 반짝 유행이 아니라 범용 1차 도구로 자리잡고 있다는 신호로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS/PMS는 서드파티 네이티브 바이너리나 Electron 앱을 역공학할 일이 거의 없고, Hopper/Ghidra/IDA 같은 전문 디컴파일러 의존성도 실무 적용 장벽을 높인다. 다만 억지로 전이하지 않을 범위에서 참고할 원칙 하나는 있다 — [[2026-09-30-oliveyoung-decompiler-ai-config-drift]]의 CRS 적용점과 같은 결이다. 벤더가 배포하는 바이너리 SDK·연동 모듈을 블랙박스로만 받아들이는 대신, "이번 버전 업데이트로 실제 동작이 어디가 바뀌었는가"를 설명 가능한 형태로 되짚어볼 필요가 생겼을 때(예: 채널매니저 SDK가 예고 없이 동작을 바꿔 장애가 났을 때) REA류의 "에이전트가 디컴파일러를 쥐고 질문-답변으로 좁혀가는" 접근이 수동 리버싱보다 진입장벽이 낮은 선택지가 될 수 있다는 정도다. 지금 당장 도입할 근거는 없다.

## 연관 자료

- [[2026-09-09-fnprint-binary-function-identification]] — 동작 기반 자동 대조라는 다른 극단의 리버스 엔지니어링 접근, REA의 "대화형 탐색"과 자동화 정도의 스펙트럼을 이룬다.
- [[2026-09-05-imhex-file-format-reverse-engineering]] — "코드를 먼저 읽어라"는 세 번째 접근, 두 전이에서 함께 다룬 축.
- [[2026-09-30-oliveyoung-decompiler-ai-config-drift]] — 같은 기술 조합(디컴파일러+AI)이 반대 목적(내 코드 드리프트 복구)으로 쓰인 실무 사례.

## 한 달 뒤 회고

*(2026-11-11 즈음 — 스타 수 불일치(85.6k vs 14.9k)가 어느 쪽으로 정리됐는지, hada·HN 등에서 실제 논쟁(저작권·악용 우려 포함)이 있었는지, 과제 설명이 언급한 크롬 공룡 게임·Windows Calculator 사례가 이후 README나 블로그 포스트에 실제로 추가됐는지 확인.)*
