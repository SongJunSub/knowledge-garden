---
title: "고전 PC 데모씬 작품을 브라우저에서 실행하기 (treylorswift, demoscene-recomp) — 녹화 영상이 아니라, x86 실행을 통째로 녹음해 C로 1:1 변환하고 WebAssembly로 컴파일한 원본 코드"
source_title: "demoscene-recomp: Classic PC demoscene productions running natively in the browser"
source_url: "https://github.com/treylorswift/demoscene-recomp"
source_name: "GitHub (treylorswift/demoscene-recomp)"
referrer_url: "https://news.hada.io/topic?id=35019"
published_at: "2026-09-30"
summarized_at: "2026-10-09"
category: "engineering"
tags: ["demoscene", "webassembly", "static-recompilation", "emulation", "retro-computing", "x86", "dos"]
---

# 고전 PC 데모씬 작품을 브라우저에서 실행하기

> 출처: [demoscene-recomp](https://github.com/treylorswift/demoscene-recomp) (treylorswift, GitHub) · GeekNews(id=35019) 경유 · 정리일 2026-10-09

> **출처 한계**: `news.hada.io`·`treylorswift.github.io`·`news.ycombinator.com` 모두 이 세션에서 egress 차단돼 원문 페이지와 HN 토론(id=50002426)을 직접 열람하지 못했다. 대신 **GitHub 공개 저장소(`treylorswift/demoscene-recomp`)를 직접 클론해 README 전문을 1차 소스로 확보**했다 — 구현 방식·대상 데모 4편·크레딧은 이 README에서 직접 확인한 것이다. 저장소는 2026-09-30 생성, 2026-10-08 최신 커밋, 스타 19개·포크 2개(조회 시점 기준)로, 공개 직후라 아직 널리 알려진 프로젝트는 아니다. hada·HN 댓글 수는 확인 불가.

## 한 줄 요약

**Future Crew의 Unreal(1992)·Second Reality(1993), Triton의 Crystal Dream 2(1993), NoooN의 Stars(1995) 네 편의 고전 PC 데모씬 작품이, 원본 DOS 실행 파일을 다시 쓰지 않고 브라우저에서 그대로 재생된다 — x86 에뮬레이터로 실행을 통째로 녹음해 명령어 하나하나를 사이클 타이밍까지 보존한 C 코드로 바꾸고, 타이머·VGA·Sound Blaster 소프트웨어 모델과 함께 WebAssembly로 컴파일한 뒤, 결과를 에뮬레이터와 인터럽트·포트 접근·프레임 단위로 대조 검증했다.**

## 핵심 포인트

- **4단계 파이프라인: 에뮬레이터 녹음 → C 변환 → WASM 컴파일 → 이벤트 단위 검증** — README가 명시한 절차는 ① x86 에뮬레이터로 데모 전체 구간에서 ***CPU가 실제로 실행하는 모든 코드 블록을 녹음***, ② 그 녹음을 ***원본 명령어 1:1, 에뮬레이션된 머신의 정확한 사이클 타이밍까지 보존한 C로 번역***, ③ 타이머·VGA·Sound Blaster의 소프트웨어 모델과 함께 ***WebAssembly로 컴파일***, ④ 결과를 에뮬레이터와 ***인터럽트·포트 접근·프레임을 동일 시점마다 대조*** 검증하는 순서다.
- **영상 녹화가 아니라 원본 코드가 그대로 동작한다** — 데모 각각의 ***자체 로더·음악 플레이어·효과가 1992~1995년 그대로*** 실행되며, 바뀐 건 그 코드가 말을 거는 하드웨어뿐이다. 데모들은 원래 VGA 70Hz에서 돌았기 때문에, 70Hz 이상 디스플레이에서 가장 매끄럽게 보인다.
- **Second Reality에는 오리지널에 없던 "Smooth City" 옵션이 추가됐다** — 도시 플라이스루 구간을 70fps로 보간하고 서브픽셀 폴리곤 엣지를 적용하는 ***개선 옵션***이되, 기본값은 꺼짐이며 꺼진 상태가 오리지널이다. Crystal Dream 2의 엔딩 메뉴는 방향키·엔터로 조작 가능한 인터랙티브 요소로 남아 있다.
- **원작자 크레딧을 전면에 명시** — Unreal·Second Reality는 Future Crew, Crystal Dream 2는 Triton, Stars는 NoooN 작품이며 모두 데모씬에 무료로 공개된 것이라고 README가 밝힌다. 원본 릴리스 파일은 데모가 실행 시점에 읽는 그대로 수정 없이 제공된다.

## 인상 깊은 문장

> "Each demo's original DOS code, recompiled instruction for instruction, runs in your browser... only the hardware is modelled."
> (README 원문 그대로)

## 댓글

hada·HN(id=50002426) 댓글 수는 모두 확인 불가(두 사이트 모두 egress 차단). 다만 이 노트의 핵심 기술 설명은 hada 댓글이 아니라 **프로젝트 자신의 GitHub README를 직접 읽은 1차 소스**에 기반하므로, 2차 해설에 의존한 다른 노트들보다 근거가 단단하다. 다만 "AI가 이 포팅을 어느 정도 도왔는가", "순수 에뮬레이션보다 이 방식이 실질적으로 더 나은 점이 뭔가" 같은 질문은 README가 답하지 않는 영역이라 열어둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "재작성 없이 원본을 그대로 돌리는 호환 런타임" 계열에 1990년대 데모씬 버전이 더해짐

[[2026-09-23-foxpro-foxdev-studio-revival]]는 Microsoft가 포기한 Visual FoxPro 업무 애플리케이션을, 재작성 대신 Electron·WASM 기반의 새 호환 런타임으로 그대로 실행하는 FoxDev Studio를 다뤘다 — 그 노트가 뽑은 핵심은 "마이그레이션이 아니라 원본을 그대로 실행하는 런타임을 만든다"는 제3의 선택지였다. 오늘 글은 같은 원칙을 업무 소프트웨어가 아니라 데모씬 예술 작품에 적용한 사례다. 대상은 전혀 다르지만("30년 묵은 회계 프로그램"과 "30년 묵은 그래픽 데모"), "포팅 대신 호환 실행 환경"이라는 해법의 형태는 똑같이 반복된다.

### 핵심 전이 2 — "원본과 비트/이벤트 단위로 일치하는가"가 재현 품질의 공통 검증 기준이 됨

[[2026-10-07-opentpu-ai-designed-fpga-accelerator]]는 AI가 설계한 오픈소스 AI 가속기의 실물 FPGA 출력이 시뮬레이터와 토큰 단위로 비트 일치하는지를 검증 기준으로 삼았다. 오늘 글의 "에뮬레이터와 인터럽트·포트 접근·프레임을 동일 시점마다 대조"도 완전히 같은 검증 철학이다 — 둘 다 "그럭저럭 비슷하게 동작한다"가 아니라 "원본이 만들어내는 모든 이벤트를 정확히 같은 순서·같은 시점에 재현하는가"를 기준으로 삼는다. 서로 무관한 두 도메인(AI 칩 설계, 레트로 데모 포팅)에서 같은 수준의 재현 충실도 기준이 독립적으로 등장한 셈이다.

### 핵심 전이 3 — 명령어 수준 바이너리 번역이라는 접근법 자체의 계열

[[2026-09-14-cuda-on-amd-gpu-windows-zluda]]는 ZLUDA로 CUDA 전용 Windows 프로그램을 수정 없이 AMD GPU에서 실행하는 사례를 다뤘다. API 호출을 가로채 번역한다는 점에서 이번 글의 "명령어를 하나하나 C로 번역"하는 방식과는 번역 레벨이 다르지만(API 레벨 대 명령어 레벨), "원본 바이너리를 고치지 않고 다른 실행 환경으로 이식한다"는 목표는 같다. 두 글을 겹쳐 보면 "에뮬레이션(느리지만 정확)"과 "재컴파일/번역(빠르지만 검증이 필요)" 사이에서 각 프로젝트가 어느 지점을 택했는지가 드러난다 — demoscene-recomp는 재컴파일을 택하고 그 대가로 이벤트 단위 대조 검증을 들였다.

## 호스피탈리티 / CRS 적용 포인트

CRS 도메인에 이 정도의 명령어 수준 재컴파일이 필요한 상황은 상상하기 어렵다. 다만 전이 가능한 원칙은 있다 — 오래된 PMS·채널매니저 연동 코드 중 "원작자도 없고 재작성 비용은 과도한" 레거시가 있다면, [[2026-09-23-foxpro-foxdev-studio-revival]]에서 이미 짚었듯 전면 재작성보다 "원본을 그대로 돌리는 격리된 호환 레이어"를 먼저 검토하는 편이 현실적일 수 있다. 이번 글이 더하는 것은 그런 호환 레이어의 품질을 "원본과 이벤트 단위로 일치하는가"로 검증하라는 구체적 기준이다.

## 연관 자료

- [[2026-09-23-foxpro-foxdev-studio-revival]] — "재작성 없이 원본을 그대로 실행하는 호환 런타임"이라는 같은 해법의 업무 소프트웨어 버전
- [[2026-10-07-opentpu-ai-designed-fpga-accelerator]] — "원본과 비트/이벤트 단위로 일치하는가"라는 같은 검증 철학의 AI 칩 설계 버전
- [[2026-09-14-cuda-on-amd-gpu-windows-zluda]] — API 레벨 바이너리 번역이라는 인접 접근법, 에뮬레이션 대 재컴파일의 스펙트럼에서 비교할 지점

## 한 달 뒤 회고

*(2026-11-09 즈음 — HN 토론 접근이 가능해지면 "AI 보조 포팅 여부"와 "순수 에뮬레이션 대비 실질적 이점"에 대한 댓글 논쟁을 확인, 스타 수 변화로 프로젝트 확산 여부 점검.)*
