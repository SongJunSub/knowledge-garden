---
title: "PhotoCraft - Rust로 Photoshop을 재구현한 오픈소스 이미지 편집기 (storytold/ArtCraft Team) — 500개 명령을 UI·CLI·MCP가 똑같이 공유해, 사람이 클릭하는 모든 걸 에이전트도 호출할 수 있다"
source_title: "PhotoCraft"
source_url: "https://github.com/storytold/photocraft"
source_name: "GitHub (storytold/photocraft, ArtCraft Team)"
referrer_url: "https://news.hada.io/topic?id=34995"
published_at: "2026-09-30"
summarized_at: "2026-10-09"
category: "engineering"
tags: ["rust", "egui", "photoshop-clone", "image-editing", "mcp", "open-source", "clean-room-reimplementation", "wgpu"]
---

# PhotoCraft - Rust로 Photoshop을 재구현한 오픈소스 이미지 편집기

> 출처: [PhotoCraft](https://github.com/storytold/photocraft) (storytold, GitHub) · GeekNews(id=34995) 경유 · 정리일 2026-10-09

> **출처 한계**: `news.hada.io`가 egress 차단으로 토픽 페이지·hada 댓글은 확인하지 못했다. 다만 **GitHub 저장소 README는 WebFetch로 직접 열람해 1차 자료로 확보**했고, WebSearch로 교차확인한 aiweekly.co·zeli.app·selfhostedworld.com 등 보도도 README 내용과 대체로 일치한다. 다만 스타 수는 출처마다 크게 다르다 — WebFetch 시점 GitHub 페이지 기준 약 31.1k 스타·4.4k 포크였지만, 10월 7일자 기사는 6,691개, 다른 디렉터리는 6.0k, 더 이전 스냅샷은 891개를 보도했다. 프로젝트가 9월 30일 생성된 뒤 짧은 기간에 입소문을 타며 스타 수가 급격히 늘고 있는 것으로 보이지만, 정확한 성장 곡선은 확인하지 못했다.

## 한 줄 요약

**PhotoCraft는 Adobe Photoshop을 참조하지 않고 새로 짠 클린룸 방식의 Rust 이미지 편집기로, 레이어·마스크·텍스트·벡터·브러시와 PSD/PSB 편집을 지원하고 Electron이나 웹뷰 없이 네이티브로 실행된다 — 핵심 설계는 500개 이상의 편집 명령을 UI·CLI·JSON 제어 채널·MCP 서버가 동일하게 공유하는 명령 레지스트리로, 사람이 클릭하는 모든 작업을 스크립트나 AI 에이전트가 그대로 호출할 수 있게 만든 것이다.**

## 핵심 포인트

- **클린룸 재구현 + 네이티브 실행** — Photoshop 코드를 참조하지 않고 새로 설계한 "clean-room reimplementation"이며, Rust 엔진에 ***egui를 얇게 올린 UI***(README 표현: "thin egui UI on top")로 Electron·웹뷰 없이 실행된다. wgpu 기반 GPU 합성으로 Metal·Vulkan·DX12·WebGPU를 타겟하고, macOS·Windows·Linux·FreeBSD에 더해 WebAssembly 빌드까지 지원한다.
- **비파괴 편집의 전형적 구성** — 16종 조정 레이어, 레이어 스타일, 벡터 셰이프, 스마트 오브젝트/스마트 필터로 원본을 유지한 채 수정하는 구조다. ICC 색상 관리, 8/16/32비트·CMYK/Lab 문서를 지원해 전문 인쇄·사진 워크플로를 겨냥한다.
- **핵심 차별점 — 500개 이상 명령을 UI·CLI·JSON·MCP가 공유** — 모든 기능이 "명령(command)"으로 노출돼, ***사람이 UI에서 클릭하는 작업과 똑같은 명령을 CLI·JSON 제어 채널·MCP 서버에서 그대로 실행***할 수 있다. 이는 "사람용 인터페이스"와 "에이전트용 API"를 별도로 만드는 대신, 하나의 명령 레지스트리를 양쪽에 그대로 노출하는 설계다.
- **아직 얼리 알파 — 정직하게 명시된 한계** — README는 ***일상적인 전문 Photoshop 작업을 대체할 수준이 아니라고 스스로 밝힌다.*** AI/생성형 기능 없음, 약 20개 도구 누락, 타이포그래피·전문 워크플로 깊이 부족, 플러그인 호환성 없음, Wayland 드래그앤드롭 미동작(winit 한계), Affinity 문서는 읽기만 가능, PSD 재저장 시 바이트 단위 완전 일치는 보장 못함(렌더 결과는 대부분 일치)이 명시된 공백이다.
- **듀얼 라이선스** — MIT 또는 Apache-2.0 중 선택 가능한 구조로, 상업적 포크나 재배포에도 열려 있다.

## 인상 깊은 문장

> "a thin egui UI on top" — README가 자신의 UI 레이어를 describing하는 표현. 엔진이 핵심이고 UI는 그 위에 얇게 얹힌 것일 뿐이라는 설계 철학이 이 한 구절에 압축돼 있다.

## 댓글

**hada 댓글 수는 확인 불가**(원문 전면 차단). 근거의 1차소스 근접도는 비교적 높다 — README는 직접 열람했지만, "early alpha"라는 자기 평가 외에 실제 사용자가 PSD 복잡한 문서를 열었을 때 얼마나 깨지는지, 전문가 커뮤니티의 반응이 어떤지는 이 세션에서 확인하지 못했다. 스타 수 불일치(891 → 6.7k → 31.1k)는 보도 시점 차이로 보이지만, 정확한 타임라인은 공백으로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — "사람이 쓰는 도구 = 에이전트가 호출하는 도구"라는 설계가 Codemode 계열과 정확히 같은 결론에 도달한다

[[2026-10-01-pi-mcp-codemode]]와 [[2026-10-08-codemode-explainer]]는 AI 에이전트가 도구를 하나씩 호출하는 대신 코드로 묶어 실행하도록 만드는 패턴을 다뤘다. PhotoCraft의 "500개 명령을 UI·CLI·JSON·MCP가 공유"하는 구조는 그 패턴이 창작 도구 쪽에서 구현된 사례다 — 사람이 메뉴에서 클릭하는 "Layer > Add Adjustment Layer" 같은 동작이 곧 에이전트가 MCP로 호출하는 명령이다. Codemode가 "AI 전용 API를 새로 설계"하는 대신 "기존 명령 체계를 그대로 노출"하는 더 저비용 경로를 보여준다.

### 핵심 전이 2 — 오디오 편집기 Audionaut과 거의 동일한 설계 패턴이 창작 도구 전반에 반복된다

[[2026-10-03-audionaut-mcp-audio-editor]]는 오픈소스 오디오 편집기가 MCP로 에이전트에게 편집을 맡기면서, 에이전트의 모든 변경을 "하나의 undo 단계"로 묶어 사람이 통제 가능한 단위로 쪼갰다. PhotoCraft는 명령 레지스트리 공유라는 더 근본적인 층위에서 같은 문제(사람과 에이전트가 같은 도구를 어떻게 안전하게 나눠 쓰는가)를 풀고 있다 — 다만 PhotoCraft README에는 Audionaut의 "undo 단위" 같은 안전장치 언급이 없어, 에이전트가 레이어를 망가뜨렸을 때 사람이 어떻게 되돌리는지는 확인하지 못한 공백이다. 두 프로젝트를 나란히 보면, "창작 도구 + MCP + 사람이 되돌릴 수 있는 단위"가 이 시기 오픈소스 창작 도구의 공통 설계 축으로 떠오르고 있다는 게 드러난다.

### 핵심 전이 3 — LibreOffice의 "선택적 AI" 원칙과 대비되는, PhotoCraft의 "기본값이 에이전트 친화적"인 설계

[[2026-09-30-libreoffice-no-ai-is-a-feature]]는 사용자 통제권을 지키기 위해 AI 기능을 기본 설치에서 빼고 선택적으로만 넣겠다고 선언했다. PhotoCraft는 반대 방향이다 — MCP 서버가 핵심 기능으로 이미 내장돼 있고, "AI가 접근할 수 없게 만드는" 옵션에 대한 언급이 README에 없다. 오픈소스 창작 도구 생태계 안에서도 "AI 접근을 기본값으로 열어둘지" 여부를 둘러싼 철학이 프로젝트마다 다르게 수렴하고 있다는 대조가 드러난다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS는 이미지 편집 도구가 아니다. 다만 전이 가능한 설계 원칙은 분명하다: ***"사람이 콘솔에서 클릭하는 작업과 에이전트가 API로 호출하는 작업을 같은 명령 레지스트리로 통일"***하는 패턴은 CRS 운영 콘솔에도 그대로 적용 가능하다. 예를 들어 "예약 상태 변경", "재고 블록", "요율 수정" 같은 운영자 클릭 동작을 내부적으로 명령 객체로 추상화해두면, 나중에 Claude 같은 에이전트가 같은 명령을 호출해 "지난주 노쇼 건을 일괄 처리해줘" 같은 작업을 수행하는 경로를 별도 API 설계 없이 열 수 있다.

## 연관 자료

- [[2026-10-01-pi-mcp-codemode]] — "도구 호출을 코드로 묶는다"는 Codemode의 1차 사건 기록, PhotoCraft의 명령 공유 구조가 실제로 구현한 패턴
- [[2026-10-08-codemode-explainer]] — Codemode 개념 설명판, PhotoCraft 사례가 "창작 도구"라는 새 영역에서 같은 패턴을 보여줌
- [[2026-10-03-audionaut-mcp-audio-editor]] — 같은 시기 오픈소스 오디오 편집기가 MCP로 에이전트에게 편집을 맡기면서 "undo 단위"로 안전장치를 둔 유사 사례
- [[2026-09-30-libreoffice-no-ai-is-a-feature]] — AI 접근을 기본값에서 빼고 선택적으로만 열겠다는 반대 방향 철학, PhotoCraft의 기본값 개방과 대비

## 한 달 뒤 회고

*(2026-11-09 즈음 — 스타 수 성장 곡선과 실제 PSD 호환성 평가가 더 쌓였는지, 그리고 MCP 명령으로 레이어를 조작했을 때 사람이 되돌리는 안전장치가 실제로 있는지 확인.)*
