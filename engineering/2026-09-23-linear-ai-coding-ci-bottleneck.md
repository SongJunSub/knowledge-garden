---
title: "AI 코딩으로 병목이 된 CI, Linear는 어떻게 개선했나 — 검증이 새로운 병목이다"
source_title: "AI coding has made CI a bottleneck, so we reworked ours to keep up"
source_url: "https://linear.app/blog/ai-coding-has-made-ci-a-bottleneck"
source_name: "Linear 공식 블로그, GeekNews(id=34105) 경유"
referrer_url: "https://news.hada.io/topic?id=34105"
published_at: "2026-09-21"
summarized_at: "2026-09-23"
category: "engineering"
tags: ["linear", "ci-cd", "ai-coding", "test-infrastructure", "tsgo"]
---

# AI 코딩으로 병목이 된 CI, Linear는 어떻게 개선했나

> 출처: [AI 코딩으로 병목이 된 CI, Linear는 어떻게 개선했나](https://news.hada.io/topic?id=34105) (Linear 공식 블로그, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`linear.app` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장 잘림)와 WebSearch(daily.dev, DEV Community, runtimewire) 교차확인으로 재구성했다.

## 한 줄 요약

**Linear는 AI 코딩 에이전트 도입 이후 테스트 스위트가 연초 대비 거의 4배로 늘면서 CI가 새로운 병목이 되자, GitHub Actions를 벗어나 더 빠른 실행 환경과 네이티브 TypeScript 컴파일러 tsgo로 전환하고 불필요한 타입 분석·중복 설정 준비를 제거해 PR CI 대기 시간을 6분대에서 5분 이내로, 테스트당 러너 사용 시간을 절반으로 줄였다.**

## 핵심 포인트

- **테스트가 4배로 늘었는데 대기 시간은 줄임** — 연초 이후 테스트가 ***거의 4배로 늘었는데도***, PR의 CI 대기 시간을 6분 초과에서 5분 남짓으로 줄이고 테스트당 러너 사용 시간을 ***약 절반으로 낮췄다***.
- **더 빠른 실행 환경 + 네이티브 TypeScript 컴파일러 tsgo로 전환** — GitHub Actions에서 더 빠른 서드파티 러너로 옮기고, ***네이티브 TypeScript 컴파일러 `tsgo`***로 전환해 린트에서 불필요한 타입 분석을 제거해 개별 검사 시간을 단축했다 — WebSearch 확인으로는 tsgo 전환만으로 주간 중앙값 타입체크 시간이 73% 줄었다.
- **모든 테스트가 기다리는 선행 작업에서는 필요한 코드와 이력만 가져오고** — ***필요한 코드와 이력만 가져오고***, 테스트 통과 후의 캐시 기록은 병합을 막지 않도록 분리했다.
- **공통 의존성을 미리 설치하고 짧은 검사들을 묶어 반복되는 환경 준비를 줄임…** [GeekNews 발췌 문장 잘림]. WebSearch 확인으로는 Vitest 샤딩을 4개에서 8개로 늘리고, 대상이 되는 파일은 테스트 격리(isolate)를 꺼서(`isolate: false`) 월간 약 17%의 시간을 추가로 절감했다.

## 인상 깊은 문장

> "연초 이후 테스트가 거의 4배로 늘었는데도, PR의 CI 대기 시간을 6분 초과에서 5분 남짓으로 줄이고 테스트당 러너 사용 시간을 약 절반으로 낮췄다."
> (GeekNews 발췌 원문)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). Linear 자사 엔지니어링 블로그 글이므로 수치(4배, 절반, 73%)는 자사가 선택한 지표이며, 다른 팀·다른 코드베이스에 그대로 일반화되기는 어렵다 — 특히 TypeScript/Vitest 스택 특화 최적화(tsgo, isolate:false)라는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 — "AI가 코드 생성 속도를 올리면 검증이 새 병목이 된다"는 가든의 반복 테마의 CI 버전

가든에는 [[2026-08-20-linear-ai-usage-patterns]](같은 회사, AI 사용 패턴), [[2026-08-23-no-reason-for-slow-software-dan-luu]], [[2026-09-15-miridih-ci-16min-to-3min-vitest-profiling]](같은 주제, CI 속도 개선 사례)가 있다. 이 글이 더하는 것은 ***"AI 코딩 에이전트가 만든 코드량 증가가 CI 인프라 자체의 병목을 만든다"***는 구체적 인과관계다 — 가든이 반복해서 다뤄온 "AI가 생산 속도를 올리면 병목이 리뷰·검증으로 이동한다"는 명제(예: [[2026-05-07-bottleneck-was-never-the-code]])의 CI 인프라 버전이라 할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS 개발팀이 AI 코딩 도구 사용을 늘리는 중이라면, 코드 생성 속도가 아니라 ***CI 파이프라인의 처리 용량***이 다음 병목이 될 가능성을 미리 점검할 가치가 있다. 특히 Linear가 취한 접근(더 빠른 러너, 네이티브 컴파일러 전환, 공통 의존성 사전 설치, 테스트 샤딩 확대)은 특정 스택에 종속되지 않는 일반 원칙이므로, CRS CI 파이프라인의 현재 병목 구간(타입체크·린트·테스트 실행 중 어디가 가장 느린지)을 먼저 프로파일링해보는 것을 다음 액션으로 제안한다.

## 연관 자료

- [[2026-08-20-linear-ai-usage-patterns]] — 같은 회사(Linear)의 AI 사용 패턴 분석
- [[2026-09-15-miridih-ci-16min-to-3min-vitest-profiling]] — 같은 주제(CI 속도), 국내 사례
- [[2026-05-07-bottleneck-was-never-the-code]] — "병목은 코드가 아니다" 계열, AI 시대 병목 이동 테마

## 한 달 뒤 회고

*(2026-10-23 즈음 — CRS CI 파이프라인의 실제 병목 구간을 프로파일링해봤는지, tsgo·Vitest 샤딩 같은 구체적 최적화가 우리 스택에도 적용 가능한지 확인.)*
