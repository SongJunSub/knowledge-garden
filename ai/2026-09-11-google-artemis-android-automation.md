---
title: "ARTEMIS - 자연어로 Android 앱을 조작·테스트하는 Google 오픈소스 자동화 도구 — 좌표·XPath 대신 접근성 트리를 우선하고, 막히면 그때만 시각 모델로 넘어간다"
source_title: "google/artemis: The open-source AI IDE for Android automation and testing"
source_url: "https://github.com/google/artemis"
source_name: "GitHub (google/artemis, Pixel-Test-Engineering Fusion team)"
referrer_url: "https://news.hada.io/topic?id=33506"
summarized_at: "2026-09-11"
category: "ai"
tags: ["android", "mobile-testing", "computer-use", "mcp", "accessibility-tree", "test-automation", "open-source"]
---

# ARTEMIS - 자연어로 Android 앱을 조작·테스트하는 Google 오픈소스 자동화 도구

> 출처: [google/artemis](https://github.com/google/artemis) (Google, Pixel-Test-Engineering Fusion team) · GeekNews(id=33506) 경유 · 정리일 2026-09-11

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 원문을 열람하지 못했다. GitHub 저장소(`github.com/google/artemis`)는 WebFetch로 직접 열람해 README·MCP 연동 방법·사용 예시를 확인했으므로 이 부분은 1차 소스 기준이다. 다만 AndroidWorld 벤치마크 "99%+" 수치, 라이선스(Apache 2.0), 지원 모델 백엔드(Gemini·Claude·GPT-4o·Qwen-VL) 등은 AlphaSignal 등 2차 매체의 WebSearch 스니펫으로 보강했다. hada 댓글 수·HN 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**Google Pixel-Test-Engineering 팀이 오픈소스로 공개한 ARTEMIS는 "로그인한 뒤 팝업이 뜨는지 확인해줘" 같은 자연어 지시를 실제 Android 기기·에뮬레이터 조작으로 변환하는 자동화 프레임워크다 — 화면의 텍스트·접근성 정보를 우선 활용하고, 이것으로 대상을 찾기 어려운 화면에서만 시각 모델로 넘어가는 방식이라 고정 좌표·XPath 의존을 줄였고, AndroidWorld 벤치마크에서 99%+ 성공률을 주장하며 MCP로 Claude Code 등 코딩 어시스턴트와 직접 연동된다.**

## 핵심 포인트

- **자연어 → 실기기 조작** — CLI(`uv run artemis run "설정 열기, 배터리 확인 후 현재 레벨 알려주기"`)나 Python SDK로 자연어 작업을 주면 실제 Android 기기·에뮬레이터를 조작해 수행한다. 단일 앱 테스트뿐 아니라 여러 앱을 오가는 작업(예: 지도 앱에서 경로 찾기, 음악 앱 재생)도 같은 방식으로 처리한다고 보도된다.
- **다중 타겟팅, 접근성 우선** — README에 명시된 우선순위는 ***"UI 요소 인덱스(접근성 정보) → 좌표 → 시각적 위치 판별"*** 순이다. 접근성 트리로 대상을 찾기 어려운 화면에서만 시각 모델로 넘어가는 폴백 구조라, 전통적인 XPath·고정 좌표 기반 자동화가 겪는 "UI가 조금만 바뀌어도 스크립트가 깨진다"는 취약점을 줄이는 설계다.
- **속도와 두 가지 실행 프로필** — 일반적으로 ***단계당 3~5초*** 소요(2차 소스: 낙관적 비동기 파이프라인 + 스냅샷 롤백). ***Flash***(빠른 반응형 루프, 일상적 UI 작업용)와 ***Pro***(계획+검증, 100단계 이상 장기 작업용) 두 프로필을 제공한다.
- **MCP로 코딩 어시스턴트와 직결** — `uv run artemis mcp --install antigravity`(또는 `--install all`)로 Antigravity·Codex·Claude Code·Windsurf·Cursor에 MCP 서버를 설치할 수 있다. `mcp_server/rules.md`를 IDE 규칙에 마운트하면 어시스턴트가 "시니어 모바일 테스트 엔지니어처럼" 행동하도록 유도한다고 명시돼 있다 — 코딩 어시스턴트가 기기에서 버그를 재현하고 스크린샷·Logcat 로그를 직접 확보하는 워크플로를 겨냥한다.
- **성능 주장 — 검증 주체 불명확** — AndroidWorld 벤치마크에서 99%+ 성공률을 달성했다고 저장소 설명·2차 매체가 일치해 보도하지만, 이 벤치마크가 Google 내부 평가인지 AndroidWorld 공식 리더보드에 독립 등재된 수치인지는 이번 세션에서 확인하지 못했다 — 자사(팀) 발표 성능 지표라는 점을 감안해야 한다.
- **라이선스·모델 백엔드** — Apache 2.0(2차 소스 기준, 저장소 파일로 직접 재확인은 못 함)로 Proliferate·Paseo류의 AGPL 계열과 달리 상업적 이용 제약이 상대적으로 낮다. Gemini·Claude·GPT-4o·Qwen-VL 등 복수 벤더 모델을 백엔드로 지원한다고 보도된다 — 특정 모델에 종속되지 않는 구조다.

## 인상 깊은 문장

> "ARTEMIS turns natural-language instructions into reliable Android automation." (GitHub 저장소 소개문, WebFetch로 직접 확인)

> "시니어 모바일 테스트 엔지니어 같이 행동" — `mcp_server/rules.md`의 테스트 철학을 IDE 규칙에 마운트했을 때의 동작 방식 (GitHub 저장소 문서, WebFetch로 직접 확인)

## 댓글

hada(GeekNews) 댓글 수·논조는 news.hada.io 접근 차단으로 확인하지 못했다. Hacker News에 별도 Show HN 제출이 있었는지 검색했으나 확정된 스레드를 찾지 못했다(검색 잡음이 많아 특정하지 못함) — 큐레이션 여부는 미확인으로 남긴다. **이해관계**: Google Pixel 팀 자체 도구이며, 자사 벤치마크 수치(99%+)의 독립 검증 여부는 확인되지 않는다. 다만 저장소 자체(코드·README·MCP 연동 스펙)는 WebFetch로 직접 열람했으므로, "무엇을 하는 도구인가"에 대한 기능 설명 자체는 이 노트에서 비교적 신뢰도가 높은 1차 소스에 근거한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-14-antigravity-ai-qa-agent-review]]가 실무에서 확인한 원칙이 이 도구에도 그대로 적용된다

Antigravity를 실무에 붙여본 후기 노트는 "AI QA 에이전트의 가치는 결함을 탐지하는 게 아니라 왜 안 되는지 분석하는 데서 나온다"와 "완전 자동화보다 막혔을 때의 협업 복원력(Human-in-the-Loop)이 실무 도입의 관건"이라는 두 원칙을 남겼다. ARTEMIS의 설계도 정확히 같은 구조를 보인다 — 접근성 트리를 우선 시도하고 이것으로 안 되는 화면에서만 시각 모델로 폴백하는 방식은, "1차 수단이 막혔을 때 대안으로 유연하게 넘어가는" 것을 아키텍처 차원에서 구현한 것이다. 다만 ARTEMIS는 폴백 대상이 "사람"이 아니라 "시각 모델"이라는 점에서, 이전 노트가 강조한 "최종 판단은 사람이 해야 한다"는 단서가 이 도구에는 아직 명시적으로 드러나지 않는다 — MCP로 Claude Code 등에 연결해 코딩 어시스턴트가 결과를 재검증하는 구조라면 그 역할을 코딩 어시스턴트(및 그걸 지켜보는 사람)가 대신 맡는 셈인데, 이 노트가 확인한 범위에서는 그 검증 단계가 얼마나 강제되는지까지는 알 수 없다.

### 핵심 전이 2 — MCP 연동이 코딩 에이전트의 활동 범위를 "코드"에서 "실기기"로 확장하는 사례

[[2026-09-10-proliferate-parallel-coding-agents-ide]]에서 다룬 "서브에이전트 위임이 벤더 내부 기능에서 벤더 횡단 계층으로 옮겨간다"는 관찰과 이어지는 지점이 있다 — Proliferate가 여러 코딩 에이전트(CLI)를 워크트리 단위로 오케스트레이션하는 상위 계층이었다면, ARTEMIS는 코딩 에이전트가 "코드 저장소 안"에 머물지 않고 "실제 기기 화면"까지 조작 범위를 넓히는 MCP 확장이다. 두 도구 모두 벤더 개별 코딩 에이전트(Claude Code, Codex 등)를 재구현하지 않고 MCP라는 공통 인터페이스로 그 위에 새 능력을 얹는다는 점에서, MCP가 "코딩 에이전트 생태계의 공통 확장 슬롯"으로 자리잡는 흐름을 보여주는 또 하나의 사례로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

이 도구는 온다 QA/모바일 앱 테스트 자동화 관점에서 진지하게 검토할 만하다 — 온다가 파트너 호텔·채널사향 모바일 앱(또는 PMS 연동 앱)을 운영한다면, "예약 생성 후 확인 알림이 뜨는지", "채널 연동 화면에서 특정 상태 전환이 올바른지" 같은 회귀 테스트를 자연어로 기술하고 MCP를 통해 Claude Code 세션에서 직접 트리거하는 워크플로가 구체적으로 그려진다. 다만 두 가지는 검증 없이 도입해서는 안 된다. 첫째, [[2026-07-14-antigravity-ai-qa-agent-review]]가 강조한 "최종 판단은 사람이 한다"는 원칙 — ARTEMIS가 99%+를 주장하는 벤치마크는 Google 자체 환경(AndroidWorld)에서 나온 수치이므로, 온다의 실제 앱·UI 구조에서 같은 성공률이 재현되는지는 반드시 자체 파일럿으로 확인해야 한다. 둘째, Apache 2.0이 사실이라면(2차 소스 기준, 직접 재확인 필요) [[2026-09-10-proliferate-parallel-coding-agents-ide]]에서 AGPL 라이선스 도구에 요구했던 것과 달리 법무 리스크가 상대적으로 낮다는 점은 도입 장벽을 낮추는 요인이지만, 라이선스 조항 자체는 실제 저장소 파일(LICENSE)로 재확인 후 결정해야 한다.

## 연관 자료

- [[2026-07-14-antigravity-ai-qa-agent-review]] — "탐지가 아니라 분석", "완전 자동화보다 협업 복원력"이라는 AI QA 에이전트 실무 원칙의 선행 사례, ARTEMIS의 폴백 설계와 직접 연결
- [[2026-09-10-proliferate-parallel-coding-agents-ide]] — MCP를 통한 벤더 횡단 오케스트레이션 계층이라는 같은 흐름의 다른 사례(코드 vs 실기기)

## 한 달 뒤 회고

*(2026-10-11 즈음 — AndroidWorld 99%+ 수치가 독립 리더보드에 등재됐는지, 라이선스(Apache 2.0 여부)를 저장소 LICENSE 파일로 직접 재확인했는지, 온다 QA 파일럿을 실제로 시도했다면 접근성 트리 우선 방식이 온다 앱 UI에서도 유효했는지 점검.)*
