---
title: "TypeScript 7.0 발표 (Microsoft) — 'Go 네이티브 이식으로 대형 프로젝트 빌드 8~12배 속도 향상', VSCode 125.7초→10.6초"
source_title: "Announcing TypeScript 7.0"
source_url: "https://devblogs.microsoft.com/typescript/announcing-typescript-7-0/"
source_name: "Microsoft DevBlogs"
referrer_url: "https://news.hada.io/topic?id=31249"
summarized_at: "2026-07-09"
category: "frontend"
tags: ["typescript", "microsoft", "compiler-performance", "go-native", "build-speed", "strict-mode", "language-server", "migration"]
---

# TypeScript 7.0 발표 (Microsoft) — 'Go 네이티브 이식으로 대형 프로젝트 빌드 8~12배 속도 향상', VSCode 125.7초→10.6초

> 출처: [Announcing TypeScript 7.0](https://devblogs.microsoft.com/typescript/announcing-typescript-7-0/) (Microsoft DevBlogs) · 정리일 2026-07-09

## 한 줄 요약

**TypeScript 7.0은 도구체인을 Go 기반 네이티브 코드로 이식해 대형 프로젝트 전체 빌드에서 8~12배 속도 향상을 달성했다. VSCode 코드베이스는 125.7초→10.6초(11.9배), Sentry는 8.9배 개선됐다. 편집기 오류 표시 시간도 17.5초에서 1.3초 미만으로 단축됐다. `strict` 기본값이 `true`로 바뀌는 등 근본적 변경도 포함됐지만, 안정적 프로그래밍 API는 아직 없어 6.0과 병행이 필요하다.**

## 핵심 포인트

- **핵심 성과** — 도구체인을 Go 기반 네이티브 코드로 이식. **대형 프로젝트 전체 빌드에서 보통 8~12배 속도 향상.**
- **성능 개선 사례**:
  | 코드베이스 | TS 6 | TS 7 | 향상도 |
  |---------|------|------|-------|
  | vscode | 125.7초 | 10.6초 | **11.9배** |
  | sentry | 139.8초 | 15.7초 | **8.9배** |
  - 메모리 사용량도 감소(vscode -18%, bluesky -26%)
- **개발 피드백 루프** — 편집기 오류 표시 시간이 약 17.5초에서 **1.3초 미만**으로 단축.
- **설치·호환성** — npm을 통한 기존 방식 설치 가능. 편집기 지원은 LSP 기반 언어 서버로 제공. **아직 안정적인 프로그래밍 API가 없어 TypeScript 6.0과 병행 필요.**
- **주요 변경사항** — `strict` 기본값을 `true`로 변경 / `rootDir` 기본값을 `./`로 설정 / ES5 타겟 미지원 / 여러 deprecated 옵션 제거.
- **새로운 기능** — `--watch` 모드 개선(Parcel의 파일 감시 기술 도입) / 병렬화 제어(`--checkers`, `--builders`, `--singleThreaded` 옵션) / Unicode 처리 개선(템플릿 리터럴에서 이모지 등 자연스럽게 처리).
- **제약사항** — Vue·MDX·Astro·Svelte 등 템플릿 기반 워크플로는 아직 TS 6.0 의존 필요. TypeScript 7.1에서 새 API 제공 예정.

## 인상 깊은 문장

> "대형 프로젝트의 전체 빌드에서 보통 8~12배 속도 향상."

## 댓글 — HN + Lobste.rs 전수 확인 (GN⁺ 큐레이션)

- **HN**: 성능 향상 수치 표 정리와 함께 **"책임 있게 마이그레이션하면서 이 정도 성과를 낸 팀이 대단하다"**는 긍정 평가. 답글: esbuild·tsdown 호환성, Bun 마이그레이션 방식, 타입 시스템 역사, JSDoc 문법 등 다양한 기술 주제.
- **Lobste.rs**: 자체 호스팅 컴파일러에서 Go 기반으로 변경한 결정, VSCode에 미치는 영향, TypeScript 언어 확장 논의.

## 내 생각 · 적용점

### 핵심 전이 1 — CRS·PickMe TypeScript 프로젝트의 빌드 시간이 병목이라면 직접 검토 대상

사용자 CLAUDE.md의 TypeScript 컨벤션(Google TypeScript Style Guide)을 따르는 프로젝트에서, **빌드 시간이 개발 생산성의 병목이라면 TS 7.0 마이그레이션이 즉각적인 ROI를 준다.** 특히 편집기 오류 표시가 17.5초→1.3초로 줄어드는 것은 [[2026-07-06-if-youre-a-button-one-job]]의 "반복 작업 대기 시간" 논점과 정확히 같은 구조 — 하루 수십 번 겪는 지연이 누적되면 상당한 생산성 손실이다.

### 핵심 전이 2 — "strict 기본값 true"가 [[2026-07-06-better-models-worse-tools]]의 교훈과 직결

TS 7.0이 `strict`를 기본값으로 바꾼 것은, 지난주 정리한 "AI 도구가 관대한 스키마에서 나쁜 습관을 학습한다"는 문제의식과 같은 방향이다. **엄격한 타입 검사가 기본이 되면, AI가 생성하는 TypeScript 코드의 타입 오류를 컴파일 시점에 더 확실히 잡아낼 수 있다.** CRS 프론트엔드에 AI 코딩 도구를 쓸 때 strict 모드가 사실상 필수적인 안전장치가 된다.

### 핵심 전이 3 — 안정적 API 부재 상태에서의 마이그레이션 판단 기준

TS 6.0과 병행이 필요하다는 제약은, [[2026-06-30-yagni-hidden-costs]]의 "선택권 비용" 관점에서 판단할 문제다. **CRS가 지금 당장 전면 마이그레이션할지, 아니면 TS 7.1의 안정적 API를 기다릴지는 "빌드 시간 병목이 얼마나 심각한가"와 "템플릿 기반 도구(Vue 등) 의존도"를 기준으로 결정하면 된다.**

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-06-if-youre-a-button-one-job]] — *반복적으로 겪는 대기 시간의 누적 비용과 같은 구조*
- [[2026-07-06-better-models-worse-tools]] — *strict 모드가 AI 생성 코드의 안전장치가 되는 원리*
- [[2026-06-30-yagni-hidden-costs]] — *안정적 API 부재 시점의 마이그레이션 타이밍 판단*

## 한 달 뒤 회고
*(2026-08-09 즈음 — CRS·PickMe TypeScript 프로젝트에서 TS 7.0 마이그레이션을 검토했는지, 빌드 시간 병목이 실제 생산성에 영향을 줬는지 기록.)*
