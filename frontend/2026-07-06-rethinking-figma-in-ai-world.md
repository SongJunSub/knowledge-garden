---
title: "AI 시대, Figma를 다시 생각하다 (UX Design) — '좌석 모델이 약화되고 진실의 원천이 코드로 이동한다', 독점 도구는 시장이 이식성을 요구하기 전까지만 강력하다"
source_title: "Rethinking Figma in an AI World"
source_url: "https://uxdesign.cc/rethinking-figma-in-an-ai-world-0facba587ba5"
source_name: "UX Design"
referrer_url: "https://news.hada.io/topic?id=31169"
summarized_at: "2026-07-06"
category: "frontend"
tags: ["figma", "design-tools", "source-of-truth", "vendor-lock-in", "design-code-gap", "seat-model", "portability", "config-2026", "operating-layer"]
---

# AI 시대, Figma를 다시 생각하다 (UX Design) — '좌석 모델이 약화되고 진실의 원천이 코드로 이동한다', 독점 도구는 시장이 이식성을 요구하기 전까지만 강력하다

> 출처: [Rethinking Figma in an AI World](https://uxdesign.cc/rethinking-figma-in-an-ai-world-0facba587ba5) (UX Design) · 정리일 2026-07-06

## 한 줄 요약

**Config 2026에서 드러난 Figma의 근본적 위기: AI가 "의도를 코드 실행으로 직접 연결"하면서 정적 목업 단계가 생략되고, 진실의 원천(source of truth)이 설계 파일에서 구현 코드로 이동하고 있다. Figma는 Code layers·Figma Motion 같은 기능으로 대응했지만, 저자는 이것만으로 부족하며 "캔버스를 오퍼레이팅 레이어로 전환"해야 한다고 지적한다. Photoshop→Sketch→Figma의 역사가 보여주듯, 독점 도구는 시장이 이식성을 요구하기 전까지만 강력하다.**

## 핵심 포인트

- **Figma의 위기 요인 3가지**:
  1. **좌석(Seat) 모델의 약화** — 기존엔 디자이너→PM→엔지니어→마케터가 순차적으로 Figma에 접근하며 사용자 기반 확대. AI 환경에선 엔지니어가 코딩 환경에서 직접 UI를 생성·검수 가능해져 "수동적 좌석" 필요성 감소.
  2. **Claude Code·Claude Design의 위협** — "의도(intent)를 코드 실행으로 직접 연결"하는 워크플로로 정적 목업 단계 생략. 디자인 파일이 아닌 실제 구동 소프트웨어로 직접 이동하는 생산성 모델 확산.
  3. **협업 테이블의 이동** — 진실의 원천이 설계 파일에서 구현 코드로 이동. 팀 협업 공간이 코드 네이티브 환경으로 전환.
- **Figma의 대응(Config 2026 발표)** — Code layers(코드를 캔버스에 통합)·Figma Motion(애니메이션·타이밍 내재화)·셰이더 도구·에이전트 워크플로.
- **저자의 평가** — 이것만으로 부족, **"캔버스를 더 나은 캔버스로 만드는 것이 아니라 오퍼레이팅 레이어(operating layer)로의 전환"**이 필요.
- **독점 도구의 몰락 패턴** — Photoshop→Sketch→Figma의 연속적 전환 역사. "독점 도구는 시장이 이식성을 요구하기 전까지만 강력하다." 미래의 승자는 **"재사용 가능한 토큰, 가독 가능한 구조, 도구 비종속 메타데이터"** 중심 시스템.
- **궁극의 시험대** — "진짜 시험은 캔버스를 더 예쁘게 만드는 것이 아니라 캔버스가 중심에서 물러난 뒤에도 디자인이 살아남게 하는 것." Figma는 다른 디자인 도구가 아니라 **"전혀 다른 제품 구축 방식"** 자체와 경쟁 중.

## 인상 깊은 문장

> "독점 도구는 시장이 이식성을 요구하기 전까지만 강력하다."

> "진짜 시험은 캔버스를 더 예쁘게 만드는 것이 아니라 캔버스가 중심에서 물러난 뒤에도 디자인이 살아남게 하는 것이다."

## 댓글 전수 확인

**댓글 없음** (확인 완료).

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-07-06-what-will-figma-do-next]]와 같은 위기를 다른 각도에서 조명

같은 날 정리한 다른 Figma 글이 "방어/전환/피벗" 세 경로를 제시했다면, 이 글은 구체적 원인(좌석 모델 약화·Claude Code 위협·진실의 원천 이동)과 **역사적 패턴(독점 도구 몰락 사이클)**을 더해준다. **"재사용 가능한 토큰, 가독 가능한 구조, 도구 비종속 메타데이터"가 승자의 조건이라는 예측은, [[2026-06-30-towards-understandable-software]]의 "이해 가능하고 이식 가능한 표현"이라는 원칙과 정확히 일치한다.**

### 핵심 전이 2 — "진실의 원천 이동"이 CRS 데이터 아키텍처에도 같은 질문을 던진다

설계 파일에서 코드로 진실의 원천이 이동하는 패턴은, CRS에서도 "요금 규칙의 진실이 어디에 있는가"(엑셀 문서? DB? 코드에 하드코딩?) 질문과 같은 구조다. **[[2026-07-05-pxpipe-fable-cost-reduction-image-ocr]]에서 다룬 "정확한 식별자" 문제처럼, 진실의 원천이 명확하지 않으면 여러 표현(캔버스/코드, 문서/DB) 간 불일치가 누적된다.**

### 핵심 전이 3 — "이식성이 시장의 요구가 되는 시점"을 CRS 기술 선택에도 적용

Photoshop→Sketch→Figma 전환 패턴은, 특정 시점에 이식성 부족이 임계점을 넘으면 독점 도구가 급격히 대체된다는 것을 보여준다. **CRS가 특정 벤더(Opera PMS, 특정 클라우드)에 강하게 락인되어 있다면, "이식성이 시장의 요구가 되는 순간"을 미리 대비하는 것이 [[2026-06-28-physical-media-ownership]]에서 다룬 통제권 논의의 실무적 확장이다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-06-what-will-figma-do-next]] — *같은 날 정리한 Figma 위기의 다른 각도 — 세 경로 프레임워크와 상호 보완*
- [[2026-06-30-towards-understandable-software]] — *"이해 가능하고 이식 가능한 표현"이 미래 승자의 조건과 일치*
- [[2026-06-28-physical-media-ownership]] — *벤더 락인·통제권 논의의 디자인 도구 버전*
- [[2026-07-05-pxpipe-fable-cost-reduction-image-ocr]] — *"진실의 원천" 불명확성이 만드는 정확성 문제*

## 한 달 뒤 회고
*(2026-08-06 즈음 — Figma의 실제 대응(Config 2026 이후 방향)을 팔로업했는지, CRS 기술 스택에서 벤더 락인 리스크를 재평가했는지 기록.)*
