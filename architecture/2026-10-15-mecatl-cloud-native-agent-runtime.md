---
title: "Mecatl (Stacklok) — 자체 인프라에서 AI 에이전트를 실행하는 클라우드 네이티브 런타임, 에이전트 루프와 모델·저장소·UI를 명시적 인터페이스로 분리한다"
source_title: "mecatl"
source_url: "https://pkg.go.dev/github.com/stacklok/mecatl"
source_name: "pkg.go.dev (GitHub stacklok/mecatl README 미러, 1차에 가까움) · 교차확인: cncf.io 블로그·latent.space·ecosistemastartup.com(2차, 직접 열람은 실패)"
referrer_url: "https://news.hada.io/topic?id=35378"
summarized_at: "2026-10-15"
category: "architecture"
tags: ["agent-runtime", "cloud-native", "kubernetes", "stacklok", "self-hosted", "durable-sessions", "grpc"]
---

# Mecatl — 자체 인프라에서 AI 에이전트를 실행하는 클라우드 네이티브 런타임

> 출처: [stacklok/mecatl](https://pkg.go.dev/github.com/stacklok/mecatl) (pkg.go.dev, GitHub README 미러) · GeekNews(id=35378) 경유 · 정리일 2026-10-15

> **출처 한계**: `news.hada.io`·`cncf.io`·`latent.space`가 이 세션에서 전부 `ENOTFOUND`로 차단됐다. 다만 `pkg.go.dev/github.com/stacklok/mecatl`는 WebFetch로 직접 확보했고, 이 페이지는 GitHub README를 그대로 반영하는 패키지 문서 페이지라 **1차 소스에 가깝다**. WebSearch로 교차확인한 CNCF 블로그("the case for a cloud native agent harness", 2026-09-28)와 스페인어 매체 ecosistemastartup.com의 "Stacklok lanza Mecatl" 보도는 같은 사실(Stacklok이 만든 오픈소스 클라우드 네이티브 에이전트 하네스, 창업자가 Kubernetes 공동창시자 Craig McLuckie·Joe Beda)을 교차확인해줬지만, 본문 직접 대조는 못했다. 실제 도입 사례·사용자 수·GA 여부는 확인하지 못했다.

## 한 줄 요약

**Mecatl은 AI 에이전트를 로컬·원격 서버·Kubernetes에서 같은 실행 구조로 운영하려는 오픈소스 클라우드 네이티브 에이전트 하네스다 — 에이전트 실행 루프를 모델 제공자·세션 저장소·파일시스템·클라이언트(UI)에서 명시적 인터페이스로 분리해 각 구성요소를 독립적으로 교체할 수 있게 했고, 세션과 이벤트 이력을 외부 저장소(Kubernetes 런타임에서는 Redis+Lease)에 보관해 프로세스가 교체돼도 작업을 복구할 수 있게 했다. Kubernetes 공동창시자인 Craig McLuckie·Joe Beda가 세운 Stacklok의 프로젝트다.**

## 핵심 포인트

- **관심사 분리 — 루프는 독립, 나머지는 교체 가능** — 에이전트 실행 루프는 클라이언트·실행 환경과 독립적으로 설계됐고, ***모델 제공자·상태 저장소·파일시스템·UI는 명시적 인터페이스로 연결***돼 하나를 바꿔도 루프 자체를 손댈 필요가 없다. 같은 런타임이 로컬에서 시작해, 외부 상태를 가진 원격 서버로, Kubernetes 레플리카로까지 확장될 수 있다는 게 핵심 설계 목표다.
- **스트리밍 루프 + 도구·권한·훅·서브에이전트** — 에이전트 루프 자체가 ***스트리밍 방식***이며, 도구 디스패치·권한 승인 흐름·컨텍스트 압축(compaction)·훅·서브에이전트·팀 기능을 포함한다. 도구 호출에는 감사 기록과 행위 주체 추적(attribution)이 함께 따라붙는다.
- **외부 저장소로 내구성 확보 — 프로세스가 죽어도 작업은 산다** — 플러거블 저장소를 통해 ***내구성 있는 세션과 추가 전용(append-only) 이벤트 로그***를 유지해, 프로세스가 재시작되거나 교체돼도 저장된 작업을 복구할 수 있다.
- **Kubernetes 런타임(mecak8s) — Redis + Lease로 동시쓰기 조정** — Kubernetes용 참조 런타임은 세션 상태·이벤트 로그에 ***Redis***를 쓰고, Kubernetes ***Lease***로 세션당 쓰기 주체를 하나로 제한해 여러 레플리카가 같은 세션을 동시에 쓰는 충돌을 막는다. 파드 교체 시에는 드레인(drain) 경로를 거친다.
- **클라이언트 — gRPC·HTTP/SSE·터미널 UI** — ***gRPC와 HTTP/SSE*** 양쪽을 지원하고, TypeScript SDK 가이드가 제공되며, ***mecatui***라는 터미널 클라이언트가 로컬 서버를 직접 호스팅하거나 원격 서버에 연결할 수 있다.
- **정직하게 밝힌 한계(1차 소스 자체가 명시)** — 기본 데몬(`mecated`)은 ***인증이 없는 루프백 전용 설계***이고, 루프백 밖에 바인딩하려면 별도로 인증·전송 보호를 설정해야 한다. 호출자 신원·감사 기록도 아직 ***완전한 테넌트 격리 경계가 아니며***, 프로세스 간 암호학적 증명·권한 축소는 설계가 진행 중이라고 1차 문서가 스스로 인정한다.

## 인상 깊은 문장

> "Mecatl is an open source, cloud-native agent harness." (pkg.go.dev, WebFetch로 직접 확보)

> "mecated has no authentication by default and is designed for single-user use on loopback." (pkg.go.dev, WebFetch로 직접 확보 — 벤더 스스로 밝힌 보안 한계)

## 댓글

**확인 불가.** `news.hada.io` 접근 차단으로 hada 댓글 수·HN/Lobsters 큐레이션 여부를 확인하지 못했다. 다만 창업자가 Kubernetes 공동창시자(Craig McLuckie·Joe Beda)라는 배경은 WebSearch로 교차확인했다 — 이미 Kubernetes를 만든 사람들이 "에이전트 실행을 위한 Kubernetes" 격의 문제를 다시 풀고 있다는 포지셔닝인데, 이 자체도 2차 매체의 소개 틀이라는 점은 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-14-alien-remote-managed-selfhosting-platform]]과 "자체 인프라 실행"이라는 동기는 같지만, 분리하는 층이 다르다

Alien은 "데이터는 고객 경계 안에, 운영은 벤더가 원격으로"라는 축으로 ***배포 위상***을 뒤집었다. Mecatl은 다른 층을 분리한다 — 에이전트가 ***어디서 도는지(로컬/원격/K8s)***와 ***무엇으로 구성되는지(모델/저장소/파일시스템/UI)***를 각각 독립적으로 교체 가능하게 만든다. 두 프로젝트를 나란히 보면 "자체 인프라에서 돌린다"는 같은 목표 아래, 하나는 "누가 운영 부담을 지는가"(Alien)를, 다른 하나는 "무엇을 교체 가능하게 만드는가"(Mecatl)를 각각 다른 축으로 풀고 있다는 게 드러난다.

### 핵심 전이 2 — [[2026-10-11-vercel-eve-agent-framework]]와 정반대 지점에서 "에이전트 프레임워크"를 정의한다

eve는 "파일시스템이 곧 작성 인터페이스"라며 ***개발자 경험(로컬 디렉터리 하나가 에이전트)***에 집중하고, 배포는 Vercel 플랫폼에 느슨하게 묶는 구조였다. Mecatl은 반대 축에 있다 — 개발자 경험보다 ***프로덕션 운영(세션 내구성, 동시쓰기 조정, 테넌트 격리 설계)***에 무게를 둔다. "에이전트 프레임워크"라는 같은 범주 안에, eve류의 "작성이 쉬운 프레임워크"와 Mecatl류의 "운영이 견고한 런타임"이라는 서로 다른 니즈가 공존한다는 걸 보여준다 — 둘은 경쟁 관계가 아니라 레이어가 다른 보완재일 가능성이 높다.

### 핵심 전이 3 — 1차 문서가 스스로 밝힌 "테넌트 격리 미완성"은 이 가든이 반복 강조하는 "PASS만 보고하지 말 것"의 벤더판 모범 사례다

Mecatl의 README는 보안 한계(인증 없는 기본 데몬, 미완성 테넌트 격리)를 숨기지 않고 명시한다. [[2026-10-12-uber-mcp-gateway-platform-design]]이 다룬 Uber의 MCP Gateway가 "신규 도구는 승인 전 비활성"이라는 거버넌스를 깔아둔 것과 비교하면, Mecatl은 아직 그 단계 이전(격리 경계 자체가 설계 중)이라는 솔직한 자기 위치를 보여준다 — 오픈소스 인프라를 평가할 때 "뭘 할 수 있다"보다 "뭘 아직 못 한다고 스스로 인정하는가"가 더 신뢰할 만한 신호라는 걸 이 레포에서도 재확인할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS 내부에서 예약 변경 1차 분류, PMS 연동 장애 진단 같은 ***내부 에이전트를 로컬 개발 이후 실제 운영 환경(온다 자체 서버·Kubernetes)에 올려야 하는 단계***가 온다면, Mecatl의 설계 원칙 두 가지는 바로 참고할 만하다 — ***①*** 에이전트 루프를 모델·저장소·UI에서 분리해두면, 나중에 모델을 교체하거나 저장소를 바꿀 때 루프 코드를 다시 쓰지 않아도 된다는 점은 CRS 내부 에이전트 설계에도 그대로 적용 가능한 원칙이다. ***②*** 세션·이벤트 이력을 외부 저장소에 보관해 "프로세스가 죽어도 작업이 복구된다"는 요구는, 예약 변경처럼 중간에 끊기면 안 되는 CRS 워크플로우와 정확히 같은 요구사항이다. 다만 ***인증 없는 기본 데몬·미완성 테넌트 격리***는 멀티테넌트 B2B 환경(여러 호텔 파트너의 데이터가 섞이면 안 되는 CRS)에 그대로 들여오기엔 치명적인 결함이다 — 지금 단계에서 Mecatl을 CRS 프로덕션에 바로 쓰는 건 이르고, 설계 아이디어만 참고하고 보안 경계가 성숙할 때까지 기다리는 게 맞다.

## 연관 자료

- [[2026-09-14-alien-remote-managed-selfhosting-platform]] — "자체 인프라에서 실행"이라는 같은 동기, 배포 위상을 뒤집는 쪽(Alien) vs 구성요소를 분리하는 쪽(Mecatl)의 대비
- [[2026-10-11-vercel-eve-agent-framework]] — 같은 "에이전트 프레임워크" 범주의 반대 극단(개발자 경험 중심 vs 프로덕션 운영 중심), 경쟁이 아니라 레이어가 다른 보완재일 가능성
- [[2026-10-12-uber-mcp-gateway-platform-design]] — "신규 도구는 승인 전 비활성"이라는 더 성숙한 거버넌스 단계, Mecatl이 아직 못 미친 지점을 비교할 기준점

## 한 달 뒤 회고

*(2026-11-15 즈음 — `news.hada.io`·CNCF 블로그 접근이 가능해지면 실제 도입 사례·GA 로드맵을 확인하고, 테넌트 격리·프로세스 간 암호학적 증명 설계가 진전됐는지, 온다 내부에서 이런 류의 에이전트 런타임을 실제로 검토해봤는지 점검.)*
